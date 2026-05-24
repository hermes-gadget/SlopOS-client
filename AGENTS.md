# SlopOS Client — Agent Onboarding

**You are an AI agent working on the SlopOS Client Flutter app.** This file is your instruction manual. Read it before modifying code.

**Do not modify this file in any PR.** It is AI agent context. Only the repo owner changes it. Any PR that touches `AGENTS.md` will be rejected without review.

---

## Reference Documents

| File | When to read it | Purpose |
|------|----------------|---------|
| **`AGENTS.md`** ← you are here | Every session | Agent instructions, review checklist, rejection triggers |
| **`CLAUDE.md`** | First time or when you need deep protocol/architecture context | Full codebase reference — BLE protocol, screens, transports, state management |
| **`CONTRIBUTING.md`** | Before ANY PR | Contribution workflow, issue-first requirement |
| **`README.md`** | First time in the repo | Project overview, build commands, license |

---

## What Is This

Flutter mobile app (Android/iOS/Linux/Web) that connects to MeshCore-compatible radios over **BLE, TCP, or USB serial**. Provides direct/channel chat, contact and channel management, on-map node tracking, repeater administration, and on-device message translation.

Three repos form the SlopOS ecosystem:

| Repo | What | Stack |
|------|------|-------|
| `hermes-gadget/SlopOS` | MeshCore fork (core library) | C++/PlatformIO, ESP32 |
| `hermes-gadget/SlopOS-tdeck` | T-Deck LVGL firmware | C++/PlatformIO, LVGL v9 |
| **`hermes-gadget/SlopOS-client`** ← **you are here** | Flutter mobile app | Dart/Flutter, BLE/USB/TCP |

---

## Quick Start

```bash
cd ~/SlopOS-client

# Install dependencies
~/flutter/bin/flutter pub get

# Run static analysis
~/flutter/bin/flutter analyze

# Run tests
~/flutter/bin/flutter test

# Build APK
~/flutter/bin/flutter build apk
```

---

## AI Agent Workflow

When working on this codebase, follow this sequence:

1. **Open an issue first** — check if an open issue on `hermes-gadget/SlopOS-client` covers your plan. No issue = no PR accepted.
2. **Read `CONTRIBUTING.md`** — follow every step.
3. **Load context** — read `AGENTS.md` (this file), `CLAUDE.md`, `KNOWN_ISSUES.md` (if it exists), and relevant source files.
4. **Check the branch** — work is always on `dev`. PRs target `dev`, not `main`.
5. **Run `flutter analyze` and `flutter test`** before any changes to confirm baseline.
6. **Make changes** — keep commits atomic and descriptive.
7. **Run `flutter analyze` and `flutter test` again** — both must pass.
8. **Build the APK** — `flutter build apk` must succeed.
9. **Commit and push** — conventional commit messages (`feat:`, `fix:`, `docs:`, etc.).

### PR & Review Workflow

**For reviewers (maintainer only beyond step 5):**
1. List PRs: `gh pr list --repo hermes-gadget/SlopOS-client --state open`
2. Check diff: `gh pr diff N`
3. Analyze: `~/flutter/bin/flutter analyze` (zero warnings)
4. Test: `~/flutter/bin/flutter test` (all pass)
5. Run the [Code Audit Checklist](#code-audit-checklist) — check every applicable item
6. Merge: `gh pr merge N --squash --delete-branch --repo hermes-gadget/SlopOS-client`
7. If merge fails (conflicts): cherry-pick new commits only, or squash-merge locally
8. If PR branch has stale commits: cherry-pick new commits onto dev, close PR

---

## Code Audit Checklist

Before submitting a PR (or before merging someone else's), use this checklist to catch common failure modes in Flutter/Dart code. If you are an AI agent contributing code, run through this before pushing.

#### State Management & Provider
- [ ] Providers are wired in `main.dart` `MultiProvider` — not created ad-hoc in widgets
- [ ] `Consumer<T>` or `context.watch<T>()` used for reactive UI — not manual `addListener`
- [ ] No `BuildContext` captured across async gaps — use `context.mounted` guard
- [ ] `ChangeNotifier` dispose logic handles all subscriptions

#### BLE / Transport Protocol
- [ ] Frame size respected — `maxFrameSize = 172` bytes from `meshcore_protocol.dart`
- [ ] Byte 0 is the command/response/push code — correct code mapping used
- [ ] Disconnection handled gracefully — auto-navigate back to scanner
- [ ] Connection state transitions are valid (disconnected → scanning → connecting → connected)
- [ ] No memory leak in frame streams — subscriptions disposed properly

#### UI / Widgets
- [ ] `const` constructors used where possible (performance)
- [ ] Material 3 widgets only — no Cupertino or custom widget frameworks
- [ ] No hardcoded strings that should be in `l10n/` ARB files
- [ ] `centerTitle: true` on AppBars
- [ ] Handles disconnection without crash (auto-navigate to scanner)
- [ ] `StatelessWidget + Consumer` pattern preferred over `StatefulWidget`

#### Storage & Persistence
- [ ] Keys scoped by device public key prefix (10 hex chars) where per-radio data
- [ ] `SharedPreferences` writes debounced for high-frequency operations (unread counts)
- [ ] No blocking I/O on the UI thread

#### Testing
- [ ] Tests added or updated for every change
- [ ] `flutter analyze` passes with zero warnings
- [ ] `flutter test` passes (all tests)
- [ ] New screens have basic widget tests

#### Known Issue Detection
- [ ] Does the diff reference any unfixed issue in `KNOWN_ISSUES.md`?
- [ ] Did testing reveal new edge cases worth documenting?

---

## Rejection Triggers

- `flutter analyze` produces any warnings or errors
- `flutter test` has any failures
- Premature abstractions (helpers created for single use)
- Hardcoded strings that belong in ARB localization files
- Missing `const` on widgets that don't change
- `StatefulWidget` where `Consumer<T>` would work
- `BuildContext` used across async gaps without `mounted` check
- Frame protocol violations (wrong byte 0, exceeding 172 bytes)
- Feature flags or backward-compatibility shims for old protocol versions
- Commented-out code, dead code paths, or `// TODO:` without issue reference
- Broad changes touching 100+ files without clear scope

---

## Gotchas & Pitfalls

| Gotcha | Details |
|--------|---------|
| Frame size | `maxFrameSize = 172` bytes — byte 0 is the command code, so 171 bytes max payload |
| Device key scoping | Storage keys use first 10 hex chars of device pubkey — missing prefix = cross-device data leak |
| BLE on web | Unsupported in non-Chrome browsers — use `ChromeRequiredScreen` |
| USB on macOS | Device name resolution via `ioreg` in `macos_usb_device_names.dart` |
| Reboot command | UI sends `sendCliCommand('reboot')` — the `cmdReboot` code exists but no frame builder is wired |
| Companion radio format | `cmdSendTxtMsg` expects `[cmd][txt_type][attempt][timestamp x4][pub_key_prefix x6][text...]` — wrong format breaks compat |
| Group text packets | Payload is `[channel_hash (1)][MAC (2)][encrypted data...]` — sender not in payload; derive from path bytes |
| Identity hash | `PATH_HASH_SIZE` is 1 byte (pubkey prefix) — flooded packets append this as they traverse hops |
| Foreground service | `flutter_foreground_task` keeps BLE alive in background — android manifest must match |
| `intl` import | Required by `flutter_localizations` — don't remove from pubspec even if not directly imported |

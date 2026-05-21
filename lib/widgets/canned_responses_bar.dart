import 'package:flutter/material.dart';
import '../l10n/l10n.dart';

const _kDefaultPresets = [
  'OK',
  'Need location',
  'ETA?',
  'Returning to base',
  'Relay if heard',
  'Acknowledged',
];

class CannedResponsesBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final List<String> presets;

  const CannedResponsesBar({
    super.key,
    required this.controller,
    this.focusNode,
    this.presets = _kDefaultPresets,
  });

  void _onPresetTap(String text) {
    controller.text = text;
    controller.selection = TextSelection.collapsed(offset: text.length);
    focusNode?.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.4),
          ),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Text(
              context.l10n.chat_quickResponses,
              style: TextStyle(
                fontSize: 10,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: presets.map((text) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: _QuickChip(
                      label: text,
                      onTap: () => _onPresetTap(text),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _QuickChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

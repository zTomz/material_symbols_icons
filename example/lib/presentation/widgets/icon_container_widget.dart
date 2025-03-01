import 'package:example_using_material_symbols_icons/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IconContainer extends StatelessWidget {
  final String iconName;
  final Icon icon;

  const IconContainer({
    super.key,
    required this.iconName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Clipboard.setData(
            ClipboardData(text: "Symbols.$iconName"),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Copied "Symbols.$iconName" to the clipboard.',
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        hoverColor: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer.withOpacity(
              0.45,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Expanded(
                child: icon,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  iconName,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}

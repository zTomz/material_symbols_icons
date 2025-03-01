import 'dart:math';

import 'package:example_using_material_symbols_icons/extensions/theme_extension.dart';
import 'package:example_using_material_symbols_icons/models/font_list_type_model.dart';
import 'package:example_using_material_symbols_icons/presentation/widgets/style_choice_widget.dart';
import 'package:example_using_material_symbols_icons/provider/icon_provider.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class OptionMenu extends StatelessWidget {
  final bool isToggled;

  const OptionMenu({
    super.key,
    required this.isToggled,
  });

  @override
  Widget build(BuildContext context) {
    final iconProvider = context.watch<IconProvider>();

    return AnimatedContainer(
      width: isToggled
          ? max(
              MediaQuery.of(context).size.width * 0.25,
              225,
            )
          : 0,
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.all(isToggled ? 16 : 0),
      padding: EdgeInsets.all(isToggled ? 16 : 0),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: isToggled
          ? Column(
              children: [
                Column(
                  children: [
                    Text(
                      "Style:",
                      style: context.textTheme.titleMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyleChoiceWidget(
                              title: "Outlined",
                              color: Colors.red,
                              value: FontListType.outlined,
                              groupValue: iconProvider.fontListType,
                              onChanged: iconProvider.changeFontListType,
                            ),
                            StyleChoiceWidget(
                              title: "Rounded",
                              color: Colors.blue,
                              value: FontListType.rounded,
                              groupValue: iconProvider.fontListType,
                              onChanged: iconProvider.changeFontListType,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyleChoiceWidget(
                              title: "Sharp",
                              color: Colors.teal,
                              value: FontListType.sharp,
                              groupValue: iconProvider.fontListType,
                              onChanged: iconProvider.changeFontListType,
                            ),
                            StyleChoiceWidget(
                              title: "All",
                              color: context.colorScheme.onBackground,
                              value: FontListType.universal,
                              groupValue: iconProvider.fontListType,
                              onChanged: iconProvider.changeFontListType,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Customize Variation Settings:",
                            style: context.textTheme.titleMedium,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            iconProvider.resetVariationSettings();
                          },
                          tooltip: "Set default",
                          icon: const Icon(Symbols.restart_alt),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await launchUrl(
                              Uri.parse(
                                "https://m3.material.io/styles/icons/applying-icons#ebb3ae7d-d274-4a25-9356-436e82084f1f",
                              ),
                            );
                          },
                          icon: const Icon(Symbols.info_rounded),
                        ),
                        const SizedBox(width: 10),
                        Text("Fill: ${iconProvider.fillVariation}"),
                      ],
                    ),
                    Slider(
                      min: 0.0,
                      max: 1.0,
                      divisions: 10,
                      value: iconProvider.fillVariation,
                      onChanged: iconProvider.changeFillVariation,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await launchUrl(
                              Uri.parse(
                                "https://m3.material.io/styles/icons/applying-icons#3ad55207-1cb0-43af-8092-fad2762f69f7",
                              ),
                            );
                          },
                          icon: const Icon(Symbols.info_rounded),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Grade: ${iconProvider.gradeVariation}",
                        ),
                      ],
                    ),
                    Slider(
                      min: 0.0,
                      max: 2.0,
                      divisions: 2,
                      value: iconProvider.gradeSliderPos,
                      onChanged: iconProvider.changeGradeVariation,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await launchUrl(
                              Uri.parse(
                                "https://m3.material.io/styles/icons/applying-icons#d7f45762-67ac-473d-95b0-9214c791e242",
                              ),
                            );
                          },
                          icon: const Icon(Symbols.info_rounded),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Weight: ${iconProvider.weightVariation}",
                        ),
                      ],
                    ),
                    Slider(
                      min: 100.0,
                      max: 700.0,
                      divisions: 6,
                      value: iconProvider.weightVariation,
                      onChanged: iconProvider.changeWeightVariation,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await launchUrl(
                              Uri.parse(
                                "https://m3.material.io/styles/icons/applying-icons#b41cbc01-9b49-4a44-a525-d153d1ea1425",
                              ),
                            );
                          },
                          icon: const Icon(Symbols.info_rounded),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Optical Size: ${iconProvider.opticalSizeVariation}px",
                        ),
                      ],
                    ),
                    Slider(
                      min: 0.0,
                      max: 3.0,
                      divisions: 3,
                      value: iconProvider.opticalSliderPos.toDouble(),
                      onChanged: iconProvider.changeOpticalSizeVariation,
                    ),
                  ],
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}

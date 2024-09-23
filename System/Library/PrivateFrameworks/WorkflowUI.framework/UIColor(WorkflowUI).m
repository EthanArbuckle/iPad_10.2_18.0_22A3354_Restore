@implementation UIColor(WorkflowUI)

+ (uint64_t)wf_actionDescriptionColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.400000006, 0.41568628, 0.43921569, 1.0);
}

+ (uint64_t)wf_settingsBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
}

+ (uint64_t)settingsCellDetailTextColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.517647088, 0.53725493, 0.564705908, 1.0);
}

+ (uint64_t)wf_settingsHeaderFooterColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.356862754, 0.423529416, 0.509803951, 1.0);
}

+ (uint64_t)wf_wizardBackgroundColor
{
  return objc_msgSend(a1, "colorWithDynamicProvider:", &__block_literal_global_449);
}

+ (uint64_t)wf_workflowWizardRecordButtonColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.78039217, 0.78039217, 0.800000012, 1.0);
}

+ (uint64_t)wf_gallerySearchCollectionColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemGroupedBackgroundColor");
}

+ (uint64_t)wf_gallerySearchCollectionHighlightedColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemGroupedBackgroundColor");
}

+ (uint64_t)wf_gallerySearchSectionHeaderColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

+ (uint64_t)wf_gallerySearchSectionHeaderButtonColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
}

+ (uint64_t)wf_homeTintColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
}

+ (uint64_t)wf_tableCellDefaultSelectionTintColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellDefaultSelectionTintColor");
}

+ (uint64_t)wf_libraryCellSelectionColor
{
  return objc_msgSend(a1, "colorWithDynamicProvider:", &__block_literal_global_6);
}

+ (id)wf_usableColorWithPaletteColor:()WorkflowUI
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BEC1398], "colorWithPaletteColor:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paletteGradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__UIColor_WorkflowUI__wf_usableColorWithPaletteColor___block_invoke;
  v7[3] = &unk_24E603238;
  v8 = v3;
  v4 = v3;
  objc_msgSend(a1, "colorWithDynamicProvider:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

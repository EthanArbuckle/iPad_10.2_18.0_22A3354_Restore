@implementation UIButtonConfiguration

uint64_t __124__UIButtonConfiguration_SBUISystemApertureStyling__sbui_systemApertureTextButtonConfigurationCompatibleWithTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "colorWithAlphaComponent:", 0.25);
}

uint64_t __96__UIButtonConfiguration_SBUISystemApertureStyling__sbui_systemApertureSymbolButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "colorWithAlphaComponent:", 0.25);
}

id __101__UIButtonConfiguration_SBUISystemApertureStyling___sbui_titleTextAttributesTransformerForTitleFont___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CEA098]);
  return v3;
}

@end

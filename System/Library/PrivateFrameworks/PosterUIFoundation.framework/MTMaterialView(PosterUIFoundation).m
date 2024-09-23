@implementation MTMaterialView(PosterUIFoundation)

+ (id)pui_homeScreenLegibilityMaterialView
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BE64060];
  PUIHomeScreenLegibilityMaterialRecipeBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("homeScreenLegibility"), v1, 0, PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment, 0.9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting());
  objc_msgSend(v2, "setWeighting:", 1.0);
  return v2;
}

@end

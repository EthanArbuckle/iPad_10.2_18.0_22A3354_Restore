@implementation UINavigationItem(PKUIUtilities)

- (void)pkui_setupScrollEdgeChromelessAppearance
{
  void *v2;
  id v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v4, "configureWithDefaultBackground");
  objc_msgSend(MEMORY[0x1E0DC3658], "_barHairlineShadowColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowColor:", v2);

  objc_msgSend(a1, "setStandardAppearance:", v4);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v3, "configureWithTransparentBackground");
  objc_msgSend(a1, "setScrollEdgeAppearance:", v3);

}

- (uint64_t)pkui_enableManualScrollEdgeAppearanceWithInitialProgress:()PKUIUtilities
{
  objc_msgSend(a1, "_setManualScrollEdgeAppearanceProgress:");
  return objc_msgSend(a1, "_setManualScrollEdgeAppearanceEnabled:", 1);
}

@end

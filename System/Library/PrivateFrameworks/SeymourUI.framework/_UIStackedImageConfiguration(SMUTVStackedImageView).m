@implementation _UIStackedImageConfiguration(SMUTVStackedImageView)

+ (id)smu_newImageConfiguration
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEBDD38], "newStandardConfiguration");
  objc_msgSend(v0, "setMaximumParallaxImages:", 6);
  objc_msgSend(v0, "setRadiosityStrength:", 0.0);
  return v0;
}

- (void)resetShadowSettings
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "smu_newImageConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultFocusedShadowOpacity");
  objc_msgSend(a1, "setDefaultFocusedShadowOpacity:");
  objc_msgSend(v2, "defaultHighlightedShadowOpacity");
  objc_msgSend(a1, "setDefaultHighlightedShadowOpacity:");
  objc_msgSend(v2, "defaultUnfocusedShadowOpacity");
  objc_msgSend(a1, "setDefaultUnfocusedShadowOpacity:");
  objc_msgSend(v2, "defaultFocusedShadowRadius");
  objc_msgSend(a1, "setDefaultFocusedShadowRadius:");
  objc_msgSend(v2, "defaultHighlightedShadowRadius");
  objc_msgSend(a1, "setDefaultHighlightedShadowRadius:");
  objc_msgSend(v2, "defaultUnfocusedShadowRadius");
  objc_msgSend(a1, "setDefaultUnfocusedShadowRadius:");
  objc_msgSend(v2, "defaultFocusedShadowVerticalOffset");
  objc_msgSend(a1, "setDefaultFocusedShadowVerticalOffset:");
  objc_msgSend(v2, "defaultHighlightedShadowVerticalOffset");
  objc_msgSend(a1, "setDefaultHighlightedShadowVerticalOffset:");
  objc_msgSend(v2, "defaultUnfocusedShadowVerticalOffset");
  objc_msgSend(a1, "setDefaultUnfocusedShadowVerticalOffset:");

}

@end

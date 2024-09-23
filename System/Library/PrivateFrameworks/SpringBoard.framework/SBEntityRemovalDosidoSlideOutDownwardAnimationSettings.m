@implementation SBEntityRemovalDosidoSlideOutDownwardAnimationSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBEntityRemovalDosidoSlideOutDownwardAnimationSettings;
  -[SBEntityRemovalDosidoSlideOutAnimationSettings setDefaultValues](&v5, sel_setDefaultValues);
  -[SBEntityRemovalDosidoSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToViewScaleAndAlphaResetAnimationDelay:", 0.0700000003);

  -[SBEntityRemovalDosidoSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToViewDimmingViewFadeOutDelay:", 0.109999999);

  -[SBEntityRemovalDosidoSlideOutAnimationSettings setFromViewSlideOutAnimationDelay:](self, "setFromViewSlideOutAnimationDelay:", 0.0299999993);
}

@end

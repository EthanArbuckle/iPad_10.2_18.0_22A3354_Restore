@implementation SBEntityRemovalFloatingDefaultAnimationSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalFloatingDefaultAnimationSettings;
  -[SBEntityRemovalMedusaDefaultAnimationSettings setDefaultValues](&v7, sel_setDefaultValues);
  SBEntityRemovalDefaultFluidAnimationSettings();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBEntityRemovalMedusaDefaultAnimationSettings setToBeRemovedScaleAnimationSettings:](self, "setToBeRemovedScaleAnimationSettings:", v3);

  -[SBEntityRemovalMedusaDefaultAnimationSettings toBeRemovedScaleAnimationSettings](self, "toBeRemovedScaleAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponse:", 0.550000012);

  -[SBEntityRemovalMedusaDefaultAnimationSettings toBeRemovedAlphaAnimationSettings](self, "toBeRemovedAlphaAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponse:", 0.550000012);

  SBEntityRemovalDefaultFluidAnimationSettings();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBEntityRemovalMedusaDefaultAnimationSettings setToBeRemovedAlphaAnimationSettings:](self, "setToBeRemovedAlphaAnimationSettings:", v6);

  -[SBEntityRemovalMedusaDefaultAnimationSettings setToBeRemovedFinalScale:](self, "setToBeRemovedFinalScale:", 1.08000004);
}

@end

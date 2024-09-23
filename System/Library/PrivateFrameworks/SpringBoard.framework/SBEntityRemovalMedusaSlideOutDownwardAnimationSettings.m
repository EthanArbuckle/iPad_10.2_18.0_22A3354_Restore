@implementation SBEntityRemovalMedusaSlideOutDownwardAnimationSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBEntityRemovalMedusaSlideOutDownwardAnimationSettings;
  -[SBEntityRemovalMedusaSlideOutAnimationSettings setDefaultValues](&v5, sel_setDefaultValues);
  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToBeMadeFullscreenFrameAnimationDelay:", 0.25);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings toBeRemovedSlideOutAnimationSettings](self, "toBeRemovedSlideOutAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponse:", 0.699999988);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings setToBeRemovedSlideOutAnimationDelay:](self, "setToBeRemovedSlideOutAnimationDelay:", 0.0);
}

@end

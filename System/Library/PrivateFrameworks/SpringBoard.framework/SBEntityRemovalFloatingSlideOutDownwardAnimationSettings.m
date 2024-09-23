@implementation SBEntityRemovalFloatingSlideOutDownwardAnimationSettings

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBEntityRemovalFloatingSlideOutDownwardAnimationSettings;
  -[SBEntityRemovalFloatingSlideOutAnimationSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[SBEntityRemovalMedusaSlideOutAnimationSettings toBeRemovedSlideOutAnimationSettings](self, "toBeRemovedSlideOutAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResponse:", 0.579999983);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings setToBeRemovedSlideOutAnimationDelay:](self, "setToBeRemovedSlideOutAnimationDelay:", 0.0);
}

@end

@implementation SBEntityRemovalFloatingSlideOutAnimationSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBEntityRemovalFloatingSlideOutAnimationSettings;
  -[SBEntityRemovalMedusaSlideOutAnimationSettings setDefaultValues](&v15, sel_setDefaultValues);
  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toBeRemovedScaleAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDampingRatio:", 1.0);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toBeRemovedScaleAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponse:", 0.800000012);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toBeRemovedScaleAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTrackingDampingRatio:", 0.860000014);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toBeRemovedScaleAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTrackingResponse:", 0.150000006);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToBeRemovedFinalScale:", 1.0);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setToBeRemovedFinalAlpha:", 1.0);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings defaultAnimationSettings](self, "defaultAnimationSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setToBeRemovedFinalBlurRadius:", 0.0);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings toBeRemovedSlideOutAnimationSettings](self, "toBeRemovedSlideOutAnimationSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setResponse:", 0.61500001);

  -[SBEntityRemovalMedusaSlideOutAnimationSettings setToBeRemovedSlideOutAnimationDelay:](self, "setToBeRemovedSlideOutAnimationDelay:", 0.270000011);
}

@end

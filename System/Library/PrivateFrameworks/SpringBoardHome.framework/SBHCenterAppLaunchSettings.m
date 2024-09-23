@implementation SBHCenterAppLaunchSettings

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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBHCenterAppLaunchSettings;
  -[SBHCenterAppZoomSettings setDefaultValues](&v22, sel_setDefaultValues);
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMass:", 2.1);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStiffness:", 1100.0);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDamping:", 500.0);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurve:", 393216);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controlPoint1Settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPointValue:", 0.3825, 0.091);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "controlPoint2Settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPointValue:", 0.98, 0.785);

  -[SBHCenterZoomSettings setDockMass:](self, "setDockMass:", 1.0);
  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAnimationType:", 1);

  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMass:", 2.5);

  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStiffness:", 1100.0);

  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDamping:", 500.0);

  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCurve:", 393216);

  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "controlPoint1Settings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPointValue:", 0.3825, 0.091);

  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "controlPoint2Settings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPointValue:", 0.98, 0.785);

  -[SBHCenterAppZoomSettings setAppHeadStart:](self, "setAppHeadStart:", -0.1);
  -[SBHCenterAppZoomSettings appFadeSettings](self, "appFadeSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDuration:", 0.3);

  -[SBHCenterAppZoomSettings appFadeSettings](self, "appFadeSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCurve:", 0x10000);

}

@end

@implementation SBHCenterAppSuspendSettings

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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBHCenterAppSuspendSettings;
  -[SBHCenterAppZoomSettings setDefaultValues](&v14, sel_setDefaultValues);
  -[SBHCenterZoomSettings setCenterRowCoordinate:](self, "setCenterRowCoordinate:", 2.5);
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMass:", 2.0);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStiffness:", 600.0);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDamping:", 700.0);

  -[SBHCenterZoomSettings setDistanceEffect:](self, "setDistanceEffect:", 1);
  -[SBHCenterZoomSettings setFirstHopIncrement:](self, "setFirstHopIncrement:", 2.0);
  -[SBHCenterZoomSettings setHopIncrementAcceleration:](self, "setHopIncrementAcceleration:", -1.0);
  -[SBHCenterZoomSettings setDockMass:](self, "setDockMass:", 5.0);
  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnimationType:", 1);

  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMass:", 20.0);

  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStiffness:", 1000.0);

  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDamping:", 200.0);

  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCurve:", 0x10000);

  -[SBHCenterAppZoomSettings appZoomSettings](self, "appZoomSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEpsilon:", 0.04);

  -[SBHCenterAppZoomSettings setAppHeadStart:](self, "setAppHeadStart:", 0.15);
  -[SBHCenterAppZoomSettings appFadeSettings](self, "appFadeSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDuration:", 0.45);

  -[SBHCenterAppZoomSettings appFadeSettings](self, "appFadeSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCurve:", 0x10000);

}

@end

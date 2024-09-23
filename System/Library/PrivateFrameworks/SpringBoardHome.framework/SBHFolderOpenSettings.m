@implementation SBHFolderOpenSettings

- (void)setDefaultValues
{
  SBHCrossfadeAppLaunchSettings *v3;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBHFolderOpenSettings;
  -[SBHFolderZoomSettings setDefaultValues](&v17, sel_setDefaultValues);
  v3 = -[PTSettings initWithDefaultValues]([SBHCrossfadeAppLaunchSettings alloc], "initWithDefaultValues");
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconAnimationSettings centralAnimationSettings](v3, "centralAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applySettings:", v5);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMass:", 1.0);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStiffness:", 341.51);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDamping:", 36.96);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurve:", 196608);

  -[SBHIconZoomSettings setLabelAlphaWithZoom:](self, "setLabelAlphaWithZoom:", -[SBHIconZoomSettings labelAlphaWithZoom](v3, "labelAlphaWithZoom"));
  -[SBHScaleZoomSettings setCrossfadeWithZoom:](self, "setCrossfadeWithZoom:", 0);
  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHScaleZoomSettings crossfadeSettings](v3, "crossfadeSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applySettings:", v11);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDuration:", 0.4);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCurve:", 0x10000);

  -[SBHFolderZoomSettings innerFolderFadeSettings](self, "innerFolderFadeSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDuration:", 0.3);

  -[SBHFolderZoomSettings innerFolderFadeSettings](self, "innerFolderFadeSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelay:", 0.1);

  -[SBHFolderZoomSettings innerFolderFadeSettings](self, "innerFolderFadeSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCurve:", 0x10000);

}

@end

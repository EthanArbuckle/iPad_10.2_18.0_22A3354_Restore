@implementation SBHCrossfadeAcceleratedAppSuspendSettings

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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SBHCrossfadeAcceleratedAppSuspendSettings;
  -[SBHCrossfadeAppSuspendSettings setDefaultValues](&v27, sel_setDefaultValues);
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimationType:", 1);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMass:", 2.5);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStiffness:", 2000.0);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDamping:", 500.0);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurve:", 393216);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controlPoint1Settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPointValue:", 0.55, 0.091);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "controlPoint2Settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPointValue:", 0.98, 0.785);

  -[SBHScaleZoomSettings setCrossfadeWithZoom:](self, "setCrossfadeWithZoom:", 0);
  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelay:", 0.15);

  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAnimationType:", 1);

  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMass:", 2.5);

  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStiffness:", 3410.237);

  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDamping:", 184.668);

  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCurve:", 196608);

  -[SBHCrossfadeAppTransitionSettings appSnapshotCornerRadiusSettings](self, "appSnapshotCornerRadiusSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySettings:", v19);

  -[SBHCrossfadeZoomSettings setMorphWithZoom:](self, "setMorphWithZoom:", 1);
  -[SBHCrossfadeZoomSettings morphSettings](self, "morphSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "applySettings:", v21);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDuration:", 0.3);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDelay:", 0.1);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCurve:", 0x10000);

  -[SBHScaleZoomSettings iconGridFadeSettings](self, "iconGridFadeSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "applySettings:", v26);

  -[SBHIconZoomSettings setLabelAlphaWithZoom:](self, "setLabelAlphaWithZoom:", 0);
}

@end

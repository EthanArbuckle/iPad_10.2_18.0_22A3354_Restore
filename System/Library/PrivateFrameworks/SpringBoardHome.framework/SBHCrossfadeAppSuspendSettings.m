@implementation SBHCrossfadeAppSuspendSettings

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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)SBHCrossfadeAppSuspendSettings;
  -[SBHCrossfadeAppTransitionSettings setDefaultValues](&v38, sel_setDefaultValues);
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
  objc_msgSend(v9, "setPointValue:", 0.3825, 0.091);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "controlPoint2Settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPointValue:", 0.98, 0.785);

  -[SBHScaleZoomSettings setCrossfadeWithZoom:](self, "setCrossfadeWithZoom:", 0);
  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAnimationType:", 1);

  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMass:", 2.5);

  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStiffness:", 2000.0);

  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDamping:", 500.0);

  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCurve:", 393216);

  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "controlPoint1Settings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPointValue:", 0.3825, 0.091);

  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "controlPoint2Settings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPointValue:", 0.98, 0.785);

  -[SBHCrossfadeAppTransitionSettings appSnapshotCornerRadiusSettings](self, "appSnapshotCornerRadiusSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAnimationType:", 0);

  -[SBHCrossfadeAppTransitionSettings appSnapshotCornerRadiusSettings](self, "appSnapshotCornerRadiusSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDuration:", 0.25);

  -[SBHCrossfadeAppTransitionSettings appSnapshotCornerRadiusSettings](self, "appSnapshotCornerRadiusSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCurve:", 196608);

  -[SBHCrossfadeZoomSettings setMorphWithZoom:](self, "setMorphWithZoom:", 0);
  -[SBHCrossfadeZoomSettings morphSettings](self, "morphSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAnimationType:", 1);

  -[SBHCrossfadeZoomSettings morphSettings](self, "morphSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setMass:", 2.5);

  -[SBHCrossfadeZoomSettings morphSettings](self, "morphSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setStiffness:", 1500.0);

  -[SBHCrossfadeZoomSettings morphSettings](self, "morphSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDamping:", 500.0);

  -[SBHCrossfadeZoomSettings morphSettings](self, "morphSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCurve:", 393216);

  -[SBHCrossfadeZoomSettings morphSettings](self, "morphSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "controlPoint1Settings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPointValue:", 0.3825, 0.091);

  -[SBHCrossfadeZoomSettings morphSettings](self, "morphSettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "controlPoint2Settings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPointValue:", 0.98, 0.785);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDuration:", 0.3);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setDelay:", 0.1);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setCurve:", 0x10000);

  -[SBHScaleZoomSettings iconGridFadeSettings](self, "iconGridFadeSettings");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySettings:", v37);

  -[SBHIconZoomSettings setLabelAlphaWithZoom:](self, "setLabelAlphaWithZoom:", 0);
}

@end

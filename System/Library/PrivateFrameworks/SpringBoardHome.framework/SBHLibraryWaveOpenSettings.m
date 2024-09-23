@implementation SBHLibraryWaveOpenSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBHLibraryWaveOpenSettings;
  -[SBHLibraryWaveZoomSettings setDefaultValues](&v19, sel_setDefaultValues);
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMass:", 1.0);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStiffness:", 323.401);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDamping:", 28.78);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInitialVelocity:", 10.0);

  -[SBHLibraryWaveZoomSettings setUpperPodRelativeCrossfadeDuration:](self, "setUpperPodRelativeCrossfadeDuration:", 0.1);
  -[SBHLibraryWaveZoomSettings setUpperPodRelativeStackAlphaDuration:](self, "setUpperPodRelativeStackAlphaDuration:", 0.2);
  -[SBHLibraryWaveZoomSettings setRelativeBackgroundDuration:](self, "setRelativeBackgroundDuration:", 0.475);
  -[SBHLibraryWaveZoomSettings relativeBackgroundDuration](self, "relativeBackgroundDuration");
  -[SBHLibraryWaveZoomSettings setRelativeSearchDuration:](self, "setRelativeSearchDuration:");
  -[SBHLibraryWaveZoomSettings setPodRelativeFadeDelay:](self, "setPodRelativeFadeDelay:", 0.0);
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "initialVelocity");
  v9 = v8;
  -[SBHLibraryWaveZoomSettings podFadeSettings](self, "podFadeSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInitialVelocity:", v9);

  -[SBHLibraryWaveZoomSettings zEffectControlPoint1Settings](self, "zEffectControlPoint1Settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPointValue:", 0.304, 0.523);

  -[SBHLibraryWaveZoomSettings zEffectControlPoint2Settings](self, "zEffectControlPoint2Settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPointValue:", 0.742, 0.73);

  -[SBHLibraryWaveZoomSettings retargetedMassSettings](self, "retargetedMassSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLowerBoundFactor:", 1.25);

  -[SBHLibraryWaveZoomSettings retargetedMassSettings](self, "retargetedMassSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUpperBoundFactor:", 1.0);

  -[SBHLibraryWaveZoomSettings retargetedStiffnessSettings](self, "retargetedStiffnessSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLowerBoundFactor:", 0.5);

  -[SBHLibraryWaveZoomSettings retargetedStiffnessSettings](self, "retargetedStiffnessSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUpperBoundFactor:", 1.0);

  -[SBHLibraryWaveZoomSettings retargetedInitialVelocitySettings](self, "retargetedInitialVelocitySettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLowerBoundFactor:", 0.25);

  -[SBHLibraryWaveZoomSettings retargetedInitialVelocitySettings](self, "retargetedInitialVelocitySettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUpperBoundFactor:", 1.0);

}

@end

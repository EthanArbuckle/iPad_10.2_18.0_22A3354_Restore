@implementation SBHLibraryWaveCloseSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBHLibraryWaveCloseSettings;
  -[SBHLibraryWaveZoomSettings setDefaultValues](&v20, sel_setDefaultValues);
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMass:", 1.0);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStiffness:", 298.54219);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDamping:", 29.7188);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInitialVelocity:", 8.0);

  -[SBHLibraryWaveZoomSettings setUpperPodRelativeCrossfadeDuration:](self, "setUpperPodRelativeCrossfadeDuration:", 0.9);
  -[SBHLibraryWaveZoomSettings setUpperPodRelativeStackAlphaDuration:](self, "setUpperPodRelativeStackAlphaDuration:", 0.49);
  -[SBHLibraryWaveZoomSettings setRelativeBackgroundDuration:](self, "setRelativeBackgroundDuration:", 0.655);
  -[SBHLibraryWaveZoomSettings relativeBackgroundDuration](self, "relativeBackgroundDuration");
  -[SBHLibraryWaveZoomSettings setRelativeSearchDuration:](self, "setRelativeSearchDuration:", v7 * 0.5);
  -[SBHLibraryWaveZoomSettings setPodRelativeFadeDelay:](self, "setPodRelativeFadeDelay:", 0.1);
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "initialVelocity");
  v10 = v9;
  -[SBHLibraryWaveZoomSettings podFadeSettings](self, "podFadeSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInitialVelocity:", v10);

  -[SBHLibraryWaveZoomSettings zEffectControlPoint1Settings](self, "zEffectControlPoint1Settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPointValue:", 0.42, 0.352);

  -[SBHLibraryWaveZoomSettings zEffectControlPoint2Settings](self, "zEffectControlPoint2Settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPointValue:", 0.76, 0.542);

  -[SBHLibraryWaveZoomSettings retargetedMassSettings](self, "retargetedMassSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLowerBoundFactor:", 0.925);

  -[SBHLibraryWaveZoomSettings retargetedMassSettings](self, "retargetedMassSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUpperBoundFactor:", 0.25);

  -[SBHLibraryWaveZoomSettings retargetedStiffnessSettings](self, "retargetedStiffnessSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLowerBoundFactor:", 0.75);

  -[SBHLibraryWaveZoomSettings retargetedStiffnessSettings](self, "retargetedStiffnessSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUpperBoundFactor:", 2.5);

  -[SBHLibraryWaveZoomSettings retargetedInitialVelocitySettings](self, "retargetedInitialVelocitySettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLowerBoundFactor:", 0.25);

  -[SBHLibraryWaveZoomSettings retargetedInitialVelocitySettings](self, "retargetedInitialVelocitySettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUpperBoundFactor:", 1.0);

}

@end

@implementation SBDynamicFlashlightSettings

- (void)setDefaultValues
{
  SBFFluidBehaviorSettings *springAnimationSettings;
  objc_super v4;
  CAFrameRateRange v5;

  v4.receiver = self;
  v4.super_class = (Class)SBDynamicFlashlightSettings;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[SBDynamicFlashlightSettings setMinimumIntensity:](self, "setMinimumIntensity:", 0.02);
  -[SBDynamicFlashlightSettings setMinimumHWIntensity:](self, "setMinimumHWIntensity:", 0.02);
  -[SBDynamicFlashlightSettings setGestureXScaling:](self, "setGestureXScaling:", 200.0);
  -[SBDynamicFlashlightSettings setGestureYScaling:](self, "setGestureYScaling:", 400.0);
  -[SBDynamicFlashlightSettings setGestureClampFactor:](self, "setGestureClampFactor:", 0.05);
  -[SBDynamicFlashlightSettings setTapMoveThreshold:](self, "setTapMoveThreshold:", 10.0);
  -[SBDynamicFlashlightSettings setTapTimeThreshold:](self, "setTapTimeThreshold:", 0.1);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_springAnimationSettings, "setDefaultValues");
  springAnimationSettings = self->_springAnimationSettings;
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](springAnimationSettings, "setFrameRateRange:highFrameRateReason:", 1114150, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_springAnimationSettings, "setDampingRatio:", 0.983);
  -[SBFFluidBehaviorSettings setResponse:](self->_springAnimationSettings, "setResponse:", 0.643);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_springAnimationSettings, "setRetargetImpulse:", 0.029);
  -[SBFFluidBehaviorSettings setTrackingDampingRatio:](self->_springAnimationSettings, "setTrackingDampingRatio:", 0.739);
  -[SBFFluidBehaviorSettings setTrackingResponse:](self->_springAnimationSettings, "setTrackingResponse:", 0.377);
  -[SBFFluidBehaviorSettings setTrackingRetargetImpulse:](self->_springAnimationSettings, "setTrackingRetargetImpulse:", 0.029);
  -[SBFFluidBehaviorSettings setInertialProjectionDeceleration:](self->_springAnimationSettings, "setInertialProjectionDeceleration:", 0.998);
  -[SBDynamicFlashlightSettings setInertiaFactor:](self, "setInertiaFactor:", 0.12);
  -[SBDynamicFlashlightSettings setOvershootClampFactor:](self, "setOvershootClampFactor:", 0.035);
  -[SBDynamicFlashlightSettings setHeightStretchFactor:](self, "setHeightStretchFactor:", 0.6);
  -[SBDynamicFlashlightSettings setWidthStretchFactor:](self, "setWidthStretchFactor:", 0.5);
  -[SBDynamicFlashlightSettings setPersistenceDelay:](self, "setPersistenceDelay:", 0.75);
  -[SBDynamicFlashlightSettings setAutoDismissalDelay:](self, "setAutoDismissalDelay:", 2.0);
}

- (CGPoint)gestureScaling
{
  double gestureXScaling;
  double gestureYScaling;
  CGPoint result;

  gestureXScaling = self->_gestureXScaling;
  gestureYScaling = self->_gestureYScaling;
  result.y = gestureYScaling;
  result.x = gestureXScaling;
  return result;
}

- (void)setGestureScaling:(CGPoint)a3
{
  *(CGPoint *)&self->_gestureXScaling = a3;
}

+ (id)settingsControllerModule
{
  void *v2;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[7];
  void *v54;
  _QWORD v55[5];
  _QWORD v56[2];
  _QWORD v57[3];
  void *v58;
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Min Intensity"), CFSTR("minimumIntensity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 0.25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v4;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Min HW Intensity"), CFSTR("minimumHWIntensity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 0.25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v7, CFSTR("Intensity Response"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("Animations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submoduleWithModule:childSettingsKeyPath:", v9, CFSTR("springAnimationSettings"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Inertia Factor"), CFSTR("inertiaFactor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "between:and:", 0.0, 0.25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v13, CFSTR("More Animations"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Overshoot Clamp %"), CFSTR("overshootClampFactor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "between:and:", 0.0, 0.1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v16;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Width Stretch"), CFSTR("widthStretchFactor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "between:and:", 0.0, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v18;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Height Stretch"), CFSTR("heightStretchFactor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "between:and:", 0.0, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:title:", v21, CFSTR("Jindo Dynamics"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Persistence Delay"), CFSTR("persistenceDelay"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "between:and:", 0.0, 3.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v24;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Auto-Dismissal Delay"), CFSTR("autoDismissalDelay"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "between:and:", 0.0, 4.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionWithRows:title:", v27, CFSTR("Timing"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Gesture X Scaling"), CFSTR("gestureXScaling"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "minValue:maxValue:", 100.0, 500.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v46;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Gesture Y Scaling"), CFSTR("gestureYScaling"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "minValue:maxValue:", 100.0, 500.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v30;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Clamp %"), CFSTR("gestureClampFactor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "minValue:maxValue:", 0.0, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v32;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Tap Time Limit"), CFSTR("tapTimeThreshold"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "between:and:", 0.001, 0.25);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v34;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Tap Move Limit"), CFSTR("tapMoveThreshold"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "between:and:", 0.0, 40.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sectionWithRows:title:", v37, CFSTR("Gestures"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83008], "restoreDefaultSettingsButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x1E0D83070];
  v54 = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sectionWithRows:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v53[0] = v52;
  v53[1] = v51;
  v53[2] = v50;
  v53[3] = v49;
  v53[4] = v45;
  v53[5] = v48;
  v53[6] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 7);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83070], "moduleWithTitle:contents:", CFSTR("Dynamic Flashlight"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (double)minimumIntensity
{
  return self->_minimumIntensity;
}

- (void)setMinimumIntensity:(double)a3
{
  self->_minimumIntensity = a3;
}

- (double)minimumHWIntensity
{
  return self->_minimumHWIntensity;
}

- (void)setMinimumHWIntensity:(double)a3
{
  self->_minimumHWIntensity = a3;
}

- (double)gestureXScaling
{
  return self->_gestureXScaling;
}

- (void)setGestureXScaling:(double)a3
{
  self->_gestureXScaling = a3;
}

- (double)gestureYScaling
{
  return self->_gestureYScaling;
}

- (void)setGestureYScaling:(double)a3
{
  self->_gestureYScaling = a3;
}

- (double)gestureClampFactor
{
  return self->_gestureClampFactor;
}

- (void)setGestureClampFactor:(double)a3
{
  self->_gestureClampFactor = a3;
}

- (double)tapMoveThreshold
{
  return self->_tapMoveThreshold;
}

- (void)setTapMoveThreshold:(double)a3
{
  self->_tapMoveThreshold = a3;
}

- (double)tapTimeThreshold
{
  return self->_tapTimeThreshold;
}

- (void)setTapTimeThreshold:(double)a3
{
  self->_tapTimeThreshold = a3;
}

- (SBFFluidBehaviorSettings)springAnimationSettings
{
  return self->_springAnimationSettings;
}

- (void)setSpringAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_springAnimationSettings, a3);
}

- (double)inertiaFactor
{
  return self->_inertiaFactor;
}

- (void)setInertiaFactor:(double)a3
{
  self->_inertiaFactor = a3;
}

- (double)overshootClampFactor
{
  return self->_overshootClampFactor;
}

- (void)setOvershootClampFactor:(double)a3
{
  self->_overshootClampFactor = a3;
}

- (double)heightStretchFactor
{
  return self->_heightStretchFactor;
}

- (void)setHeightStretchFactor:(double)a3
{
  self->_heightStretchFactor = a3;
}

- (double)widthStretchFactor
{
  return self->_widthStretchFactor;
}

- (void)setWidthStretchFactor:(double)a3
{
  self->_widthStretchFactor = a3;
}

- (double)persistenceDelay
{
  return self->_persistenceDelay;
}

- (void)setPersistenceDelay:(double)a3
{
  self->_persistenceDelay = a3;
}

- (double)autoDismissalDelay
{
  return self->_autoDismissalDelay;
}

- (void)setAutoDismissalDelay:(double)a3
{
  self->_autoDismissalDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springAnimationSettings, 0);
}

@end

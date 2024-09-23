@implementation SBFTodayGestureSettings

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
  CAFrameRateRange v15;

  v14.receiver = self;
  v14.super_class = (Class)SBFTodayGestureSettings;
  -[PTSettings setDefaultValues](&v14, sel_setDefaultValues);
  -[SBFTodayGestureSettings setSideSpringTension:](self, "setSideSpringTension:", 195.0);
  -[SBFTodayGestureSettings setSideSpringFriction:](self, "setSideSpringFriction:", 24.0);
  -[SBFTodayGestureSettings setInteractiveSideSpringTension:](self, "setInteractiveSideSpringTension:", 1754.6);
  -[SBFTodayGestureSettings setInteractiveSideSpringFriction:](self, "setInteractiveSideSpringFriction:", 72.0);
  -[SBFTodayGestureSettings overlayPositionSettings](self, "overlayPositionSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

  -[SBFTodayGestureSettings overlayPositionSettings](self, "overlayPositionSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDampingRatio:", 1.0);

  -[SBFTodayGestureSettings overlayPositionSettings](self, "overlayPositionSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponse:", 0.3);

  -[SBFTodayGestureSettings overlayPositionSettings](self, "overlayPositionSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRetargetImpulse:", 0.018);

  -[SBFTodayGestureSettings overlayPositionSettings](self, "overlayPositionSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTrackingDampingRatio:", 1.0);

  -[SBFTodayGestureSettings overlayPositionSettings](self, "overlayPositionSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTrackingResponse:", 0.0);

  -[SBFTodayGestureSettings overlayPositionSettings](self, "overlayPositionSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114122, *(double *)&v15.minimum, *(double *)&v15.maximum, *(double *)&v15.preferred);

  -[SBFTodayGestureSettings overlayBackdropSettings](self, "overlayBackdropSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultValues");

  -[SBFTodayGestureSettings overlayBackdropSettings](self, "overlayBackdropSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDampingRatio:", 1.0);

  -[SBFTodayGestureSettings overlayBackdropSettings](self, "overlayBackdropSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setResponse:", 0.3);

  -[SBFTodayGestureSettings overlayBackdropSettings](self, "overlayBackdropSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRetargetImpulse:", 0.018);

  -[SBFTodayGestureSettings setScaleAnimationSettingsWithGestureVelocity:](self, "setScaleAnimationSettingsWithGestureVelocity:", 1);
  -[SBFTodayGestureSettings setMinimumVelocity:](self, "setMinimumVelocity:", 1000.0);
  -[SBFTodayGestureSettings setMaximumVelocity:](self, "setMaximumVelocity:", 5000.0);
  -[SBFTodayGestureSettings setDampingRatioAtMinimumVelocity:](self, "setDampingRatioAtMinimumVelocity:", 1.0);
  -[SBFTodayGestureSettings setDampingRatioAtMaximumVelocity:](self, "setDampingRatioAtMaximumVelocity:", 0.9);
  -[SBFTodayGestureSettings setResponseAtMinimumVelocity:](self, "setResponseAtMinimumVelocity:", 0.3);
  -[SBFTodayGestureSettings setResponseAtMaximumVelocity:](self, "setResponseAtMaximumVelocity:", 0.42);
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
  _QWORD v44[3];
  void *v45;
  _QWORD v46[9];
  _QWORD v47[6];

  v47[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Tension"), CFSTR("sideSpringTension"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Friction"), CFSTR("sideSpringFriction"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Interactive Tension"), CFSTR("interactiveSideSpringTension"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Interactive Friction"), CFSTR("interactiveSideSpringFriction"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83070];
  v47[0] = v40;
  v47[1] = v39;
  v47[2] = v38;
  v47[3] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v3, CFSTR("Sidebar"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Position Settings"), CFSTR("overlayPositionSettings"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Backdrop Settings"), CFSTR("overlayBackdropSettings"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Scale Animation Settings with Gesture Velocity"), CFSTR("scaleAnimationSettingsWithGestureVelocity"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES"), CFSTR("scaleAnimationSettingsWithGestureVelocity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("minimumVelocity"), CFSTR("minimumVelocity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 50000.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "condition:", v4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("maximumVelocity"), CFSTR("maximumVelocity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", 0.0, 50000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "condition:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("dampingRatioAtMinimumVelocity"), CFSTR("dampingRatioAtMinimumVelocity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 50000.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "condition:", v4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("dampingRatioAtMaximumVelocity"), CFSTR("dampingRatioAtMaximumVelocity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "between:and:", 0.0, 50000.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "condition:", v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("responseAtMinimumVelocity"), CFSTR("responseAtMinimumVelocity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "between:and:", 0.0, 50000.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "condition:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("responseAtMaximumVelocity"), CFSTR("responseAtMaximumVelocity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "between:and:", 0.0, 50000.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "condition:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83070];
  v46[0] = v43;
  v46[1] = v42;
  v46[2] = v35;
  v46[3] = v41;
  v46[4] = v34;
  v46[5] = v33;
  v46[6] = v32;
  v46[7] = v31;
  v46[8] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionWithRows:title:", v19, CFSTR("Overlay"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D83070];
  v22 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "action");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:action:", CFSTR("Restore Defaults"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sectionWithRows:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0D83070];
  v44[0] = v26;
  v44[1] = v36;
  v44[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "moduleWithTitle:contents:", CFSTR("Home Scroll"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (double)sideSpringTension
{
  return self->_sideSpringTension;
}

- (void)setSideSpringTension:(double)a3
{
  self->_sideSpringTension = a3;
}

- (double)sideSpringFriction
{
  return self->_sideSpringFriction;
}

- (void)setSideSpringFriction:(double)a3
{
  self->_sideSpringFriction = a3;
}

- (double)interactiveSideSpringTension
{
  return self->_interactiveSideSpringTension;
}

- (void)setInteractiveSideSpringTension:(double)a3
{
  self->_interactiveSideSpringTension = a3;
}

- (double)interactiveSideSpringFriction
{
  return self->_interactiveSideSpringFriction;
}

- (void)setInteractiveSideSpringFriction:(double)a3
{
  self->_interactiveSideSpringFriction = a3;
}

- (SBFFluidBehaviorSettings)overlayPositionSettings
{
  return self->_overlayPositionSettings;
}

- (void)setOverlayPositionSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (SBFFluidBehaviorSettings)overlayBackdropSettings
{
  return self->_overlayBackdropSettings;
}

- (void)setOverlayBackdropSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)scaleAnimationSettingsWithGestureVelocity
{
  return self->_scaleAnimationSettingsWithGestureVelocity;
}

- (void)setScaleAnimationSettingsWithGestureVelocity:(BOOL)a3
{
  self->_scaleAnimationSettingsWithGestureVelocity = a3;
}

- (double)minimumVelocity
{
  return self->_minimumVelocity;
}

- (void)setMinimumVelocity:(double)a3
{
  self->_minimumVelocity = a3;
}

- (double)maximumVelocity
{
  return self->_maximumVelocity;
}

- (void)setMaximumVelocity:(double)a3
{
  self->_maximumVelocity = a3;
}

- (double)dampingRatioAtMinimumVelocity
{
  return self->_dampingRatioAtMinimumVelocity;
}

- (void)setDampingRatioAtMinimumVelocity:(double)a3
{
  self->_dampingRatioAtMinimumVelocity = a3;
}

- (double)dampingRatioAtMaximumVelocity
{
  return self->_dampingRatioAtMaximumVelocity;
}

- (void)setDampingRatioAtMaximumVelocity:(double)a3
{
  self->_dampingRatioAtMaximumVelocity = a3;
}

- (double)responseAtMinimumVelocity
{
  return self->_responseAtMinimumVelocity;
}

- (void)setResponseAtMinimumVelocity:(double)a3
{
  self->_responseAtMinimumVelocity = a3;
}

- (double)responseAtMaximumVelocity
{
  return self->_responseAtMaximumVelocity;
}

- (void)setResponseAtMaximumVelocity:(double)a3
{
  self->_responseAtMaximumVelocity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayBackdropSettings, 0);
  objc_storeStrong((id *)&self->_overlayPositionSettings, 0);
}

@end

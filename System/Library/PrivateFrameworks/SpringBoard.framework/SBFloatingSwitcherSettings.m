@implementation SBFloatingSwitcherSettings

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
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  CAFrameRateRange v29;
  CAFrameRateRange v30;
  CAFrameRateRange v31;
  CAFrameRateRange v32;

  -[SBFloatingSwitcherSettings setShowFloats:](self, "setShowFloats:", 1);
  -[SBFloatingSwitcherSettings setSwitcherCardScale:](self, "setSwitcherCardScale:", 0.82);
  -[SBFloatingSwitcherSettings setCardSpacing:](self, "setCardSpacing:", -24.0);
  -[SBFloatingSwitcherSettings setDimmingAlpha:](self, "setDimmingAlpha:", 0.15);
  -[SBFloatingSwitcherSettings setLeadingEdgeRubberbandingRange:](self, "setLeadingEdgeRubberbandingRange:", 100.0);
  -[SBFloatingSwitcherSettings setPerCardAdditionalScaleCoefficient:](self, "setPerCardAdditionalScaleCoefficient:", 0.0625);
  -[SBFloatingSwitcherSettings setScaleCurveExponent:](self, "setScaleCurveExponent:", 1.4);
  -[SBFloatingSwitcherSettings setOpacityMinimumDistanceThreshold:](self, "setOpacityMinimumDistanceThreshold:", 10.0);
  -[SBFloatingSwitcherSettings setOpacityFadeDistance:](self, "setOpacityFadeDistance:", 10.0);
  -[SBFloatingSwitcherSettings setDarkeningMinimumDistanceThreshold:](self, "setDarkeningMinimumDistanceThreshold:", 0.0);
  -[SBFloatingSwitcherSettings setDarkeningFadeDistance:](self, "setDarkeningFadeDistance:", 150.0);
  -[SBFloatingSwitcherSettings setMaximumDarkening:](self, "setMaximumDarkening:", 0.15);
  -[SBFloatingSwitcherSettings setTitleAndIconOpacityMinimumDistanceThreshold:](self, "setTitleAndIconOpacityMinimumDistanceThreshold:", 40.0);
  -[SBFloatingSwitcherSettings setTitleAndIconOpacityFadeDistance:](self, "setTitleAndIconOpacityFadeDistance:", 40.0);
  -[SBFloatingSwitcherSettings setTitleOpacityMinimumDistanceThreshold:](self, "setTitleOpacityMinimumDistanceThreshold:", 80.0);
  -[SBFloatingSwitcherSettings setTitleOpacityFadeDistance:](self, "setTitleOpacityFadeDistance:", 80.0);
  -[SBFloatingSwitcherSettings setOvershootPullbackDelayOffscreen:](self, "setOvershootPullbackDelayOffscreen:", 0.17);
  -[SBFloatingSwitcherSettings setOvershootPullbackDelayOnscreen:](self, "setOvershootPullbackDelayOnscreen:", 0.12);
  -[SBFloatingSwitcherSettings setRightEdgePeekDelay:](self, "setRightEdgePeekDelay:", 0.3);
  -[SBFloatingSwitcherSettings setRightEdgePeekTimeout:](self, "setRightEdgePeekTimeout:", 1.7);
  -[SBFloatingSwitcherSettings tongueContainerPositionAnimationSettings](self, "tongueContainerPositionAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultCriticallyDampedValues");

  -[SBFloatingSwitcherSettings tongueContainerPositionAnimationSettings](self, "tongueContainerPositionAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponse:", 0.25);

  -[SBFloatingSwitcherSettings tongueContainerPositionAnimationSettings](self, "tongueContainerPositionAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v5, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v29.minimum, *(double *)&v29.maximum, *(double *)&v29.preferred);

  -[SBFloatingSwitcherSettings tongueContainerTransformAnimationSettings](self, "tongueContainerTransformAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultValues");

  -[SBFloatingSwitcherSettings tongueContainerTransformAnimationSettings](self, "tongueContainerTransformAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDampingRatio:", 0.7);

  -[SBFloatingSwitcherSettings tongueContainerTransformAnimationSettings](self, "tongueContainerTransformAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResponse:", 0.725);

  -[SBFloatingSwitcherSettings tongueContainerTransformAnimationSettings](self, "tongueContainerTransformAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v30.minimum, *(double *)&v30.maximum, *(double *)&v30.preferred);

  -[SBFloatingSwitcherSettings tongueCollapsedToExpandedAnimationSettings](self, "tongueCollapsedToExpandedAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultValues");

  -[SBFloatingSwitcherSettings tongueCollapsedToExpandedAnimationSettings](self, "tongueCollapsedToExpandedAnimationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDampingRatio:", 0.7);

  -[SBFloatingSwitcherSettings tongueCollapsedToExpandedAnimationSettings](self, "tongueCollapsedToExpandedAnimationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setResponse:", 0.725);

  -[SBFloatingSwitcherSettings tongueCollapsedToExpandedAnimationSettings](self, "tongueCollapsedToExpandedAnimationSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v13, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v31.minimum, *(double *)&v31.maximum, *(double *)&v31.preferred);

  -[SBFloatingSwitcherSettings tongueExpandedToCollapsedAnimationSettings](self, "tongueExpandedToCollapsedAnimationSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDefaultValues");

  -[SBFloatingSwitcherSettings tongueExpandedToCollapsedAnimationSettings](self, "tongueExpandedToCollapsedAnimationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDampingRatio:", 0.88);

  -[SBFloatingSwitcherSettings tongueExpandedToCollapsedAnimationSettings](self, "tongueExpandedToCollapsedAnimationSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setResponse:", 0.45);

  -[SBFloatingSwitcherSettings tongueExpandedToCollapsedAnimationSettings](self, "tongueExpandedToCollapsedAnimationSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v17, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v32.minimum, *(double *)&v32.maximum, *(double *)&v32.preferred);

  -[SBFloatingSwitcherSettings homeAffordanceSettings](self, "homeAffordanceSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDefaultValues");

  SBLayoutDefaultSideLayoutElementWidth();
  v20 = v19;
  SBLayoutDefaultSideLayoutElementWidth();
  v22 = v21;
  -[SBFloatingSwitcherSettings homeAffordanceSettings](self, "homeAffordanceSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setMinWidth:", round(v20 * 0.3574));

  -[SBFloatingSwitcherSettings homeAffordanceSettings](self, "homeAffordanceSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setMaxWidth:", round(v22 * 0.3574));

  -[SBFloatingSwitcherSettings homeAffordanceSettings](self, "homeAffordanceSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHeight:", 4.5);

  -[SBFloatingSwitcherSettings homeAffordanceSettings](self, "homeAffordanceSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEdgeSpacing:", 7.0);

  -[SBFloatingSwitcherSettings homeAffordanceSettings](self, "homeAffordanceSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCornerRadius:", 3.0);

  -[SBFloatingSwitcherSettings homeAffordanceSettings](self, "homeAffordanceSettings");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCornerMask:", 1);

}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, double, double);
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
  id v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[3];
  void *v34;
  _QWORD v35[6];

  v35[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Sliders/Floats"), CFSTR("showFloats"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("showFloats == YES"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("showFloats == NO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __54__SBFloatingSwitcherSettings_settingsControllerModule__block_invoke;
  v29[3] = &unk_1E8EA32D0;
  v30 = v2;
  v31 = v3;
  v32 = v4;
  v5 = v4;
  v27 = v3;
  v26 = v2;
  v6 = (void (**)(_QWORD, _QWORD, double, double))MEMORY[0x1D17E5550](v29);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("switcherCardScale"), 0.1, 1.2);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("cardSpacing"), -200.0, 200.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("dimmingAlpha"), 0.0, 1.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("leadingEdgeRubberbandingRange"), -1000.0, 1000.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("perCardAdditionalScaleCoefficient"), 0.0, 1.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("scaleCurveExponent"), 0.1, 10.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("opacityMinimumDistanceThreshold"), -1000.0, 1000.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("opacityFadeDistance"), -1000.0, 1000.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("darkeningMinimumDistanceThreshold"), -1000.0, 1000.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("darkeningFadeDistance"), -1000.0, 1000.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("maximumDarkening"), 0.0, 1.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("titleAndIconOpacityMinimumDistanceThreshold"), -1000.0, 1000.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("titleAndIconOpacityFadeDistance"), -1000.0, 1000.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("titleOpacityMinimumDistanceThreshold"), -1000.0, 1000.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("titleOpacityFadeDistance"), -1000.0, 1000.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("overshootPullbackDelayOffscreen"), 0.0, 1.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("overshootPullbackDelayOnscreen"), 0.0, 1.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("rightEdgePeekDelay"), 0.0, 8.0);
  ((void (**)(_QWORD, const __CFString *, double, double))v6)[2](v6, CFSTR("rightEdgePeekTimeout"), 0.0, 8.0);
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Home Affordance"), CFSTR("homeAffordanceSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v5, CFSTR("Settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Tongue Container Left/Right Position Animation Settings"), CFSTR("tongueContainerPositionAnimationSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v10;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Tongue Container Left/Right Transform Animation Settings"), CFSTR("tongueContainerTransformAnimationSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v11;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Tongue Collapsed → Expanded Animation Settings"), CFSTR("tongueCollapsedToExpandedAnimationSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v12;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Tongue Expanded → Collapsed Animation Settings"), CFSTR("tongueExpandedToCollapsedAnimationSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v14, CFSTR("Tongue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:action:", CFSTR("Restore Defaults"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D83070];
  v34 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionWithRows:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83070];
  v33[0] = v8;
  v33[1] = v15;
  v33[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "moduleWithTitle:contents:", CFSTR("Floating Switcher"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

void __54__SBFloatingSwitcherSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a2;
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("([a-z])([A-Z])"), CFSTR("$1 $2"), 1024, 0, objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "capitalizedString");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", v15, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "condition:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", v15, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "minValue:maxValue:", a3, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "condition:", *(_QWORD *)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);

}

- (id)archiveValueForKey:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("showFloats")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFloatingSwitcherSettings;
    -[PTSettings archiveValueForKey:](&v7, sel_archiveValueForKey_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (double)switcherCardScale
{
  return self->_switcherCardScale;
}

- (void)setSwitcherCardScale:(double)a3
{
  self->_switcherCardScale = a3;
}

- (double)cardSpacing
{
  return self->_cardSpacing;
}

- (void)setCardSpacing:(double)a3
{
  self->_cardSpacing = a3;
}

- (double)dimmingAlpha
{
  return self->_dimmingAlpha;
}

- (void)setDimmingAlpha:(double)a3
{
  self->_dimmingAlpha = a3;
}

- (double)leadingEdgeRubberbandingRange
{
  return self->_leadingEdgeRubberbandingRange;
}

- (void)setLeadingEdgeRubberbandingRange:(double)a3
{
  self->_leadingEdgeRubberbandingRange = a3;
}

- (double)perCardAdditionalScaleCoefficient
{
  return self->_perCardAdditionalScaleCoefficient;
}

- (void)setPerCardAdditionalScaleCoefficient:(double)a3
{
  self->_perCardAdditionalScaleCoefficient = a3;
}

- (double)scaleCurveExponent
{
  return self->_scaleCurveExponent;
}

- (void)setScaleCurveExponent:(double)a3
{
  self->_scaleCurveExponent = a3;
}

- (double)opacityMinimumDistanceThreshold
{
  return self->_opacityMinimumDistanceThreshold;
}

- (void)setOpacityMinimumDistanceThreshold:(double)a3
{
  self->_opacityMinimumDistanceThreshold = a3;
}

- (double)opacityFadeDistance
{
  return self->_opacityFadeDistance;
}

- (void)setOpacityFadeDistance:(double)a3
{
  self->_opacityFadeDistance = a3;
}

- (double)darkeningMinimumDistanceThreshold
{
  return self->_darkeningMinimumDistanceThreshold;
}

- (void)setDarkeningMinimumDistanceThreshold:(double)a3
{
  self->_darkeningMinimumDistanceThreshold = a3;
}

- (double)darkeningFadeDistance
{
  return self->_darkeningFadeDistance;
}

- (void)setDarkeningFadeDistance:(double)a3
{
  self->_darkeningFadeDistance = a3;
}

- (double)maximumDarkening
{
  return self->_maximumDarkening;
}

- (void)setMaximumDarkening:(double)a3
{
  self->_maximumDarkening = a3;
}

- (double)titleAndIconOpacityMinimumDistanceThreshold
{
  return self->_titleAndIconOpacityMinimumDistanceThreshold;
}

- (void)setTitleAndIconOpacityMinimumDistanceThreshold:(double)a3
{
  self->_titleAndIconOpacityMinimumDistanceThreshold = a3;
}

- (double)titleAndIconOpacityFadeDistance
{
  return self->_titleAndIconOpacityFadeDistance;
}

- (void)setTitleAndIconOpacityFadeDistance:(double)a3
{
  self->_titleAndIconOpacityFadeDistance = a3;
}

- (double)titleOpacityMinimumDistanceThreshold
{
  return self->_titleOpacityMinimumDistanceThreshold;
}

- (void)setTitleOpacityMinimumDistanceThreshold:(double)a3
{
  self->_titleOpacityMinimumDistanceThreshold = a3;
}

- (double)titleOpacityFadeDistance
{
  return self->_titleOpacityFadeDistance;
}

- (void)setTitleOpacityFadeDistance:(double)a3
{
  self->_titleOpacityFadeDistance = a3;
}

- (double)overshootPullbackDelayOffscreen
{
  return self->_overshootPullbackDelayOffscreen;
}

- (void)setOvershootPullbackDelayOffscreen:(double)a3
{
  self->_overshootPullbackDelayOffscreen = a3;
}

- (double)overshootPullbackDelayOnscreen
{
  return self->_overshootPullbackDelayOnscreen;
}

- (void)setOvershootPullbackDelayOnscreen:(double)a3
{
  self->_overshootPullbackDelayOnscreen = a3;
}

- (double)rightEdgePeekDelay
{
  return self->_rightEdgePeekDelay;
}

- (void)setRightEdgePeekDelay:(double)a3
{
  self->_rightEdgePeekDelay = a3;
}

- (double)rightEdgePeekTimeout
{
  return self->_rightEdgePeekTimeout;
}

- (void)setRightEdgePeekTimeout:(double)a3
{
  self->_rightEdgePeekTimeout = a3;
}

- (SBFFluidBehaviorSettings)tongueContainerPositionAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 208, 1);
}

- (void)setTongueContainerPositionAnimationSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (SBFFluidBehaviorSettings)tongueContainerTransformAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 216, 1);
}

- (void)setTongueContainerTransformAnimationSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (SBFFluidBehaviorSettings)tongueCollapsedToExpandedAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 224, 1);
}

- (void)setTongueCollapsedToExpandedAnimationSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (SBFFluidBehaviorSettings)tongueExpandedToCollapsedAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 232, 1);
}

- (void)setTongueExpandedToCollapsedAnimationSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (MTLumaDodgePillSettings)homeAffordanceSettings
{
  return (MTLumaDodgePillSettings *)objc_getProperty(self, a2, 240, 1);
}

- (void)setHomeAffordanceSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (BOOL)showFloats
{
  return self->_showFloats;
}

- (void)setShowFloats:(BOOL)a3
{
  self->_showFloats = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceSettings, 0);
  objc_storeStrong((id *)&self->_tongueExpandedToCollapsedAnimationSettings, 0);
  objc_storeStrong((id *)&self->_tongueCollapsedToExpandedAnimationSettings, 0);
  objc_storeStrong((id *)&self->_tongueContainerTransformAnimationSettings, 0);
  objc_storeStrong((id *)&self->_tongueContainerPositionAnimationSettings, 0);
}

@end

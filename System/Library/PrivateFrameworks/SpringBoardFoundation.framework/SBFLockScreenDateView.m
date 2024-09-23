@implementation SBFLockScreenDateView

- (void)setDate:(id)a3
{
  -[SBFLockScreenDateView _setDate:inTimeZone:](self, "_setDate:inTimeZone:", a3, 0);
}

- (void)_updateLabels
{
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0D01738];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatterForDateAsTimeNoAMPMWithLocale:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTimeZone:", self->_timeZone);
  objc_msgSend(v7, "stringFromDate:", self->_date);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (self->_date)
    v6 = v5;
  else
    v6 = &stru_1E2010FC0;
  -[SBUILegibilityLabel setString:](self->_timeLabel, "setString:", v6);
  -[SBFLockScreenDateView _updateUsesCompactDateFormat](self, "_updateUsesCompactDateFormat");
  -[SBFLockScreenDateSubtitleDateView _setDate:inTimeZone:](self->_dateSubtitleView, "_setDate:inTimeZone:", self->_date, self->_timeZone);
  -[SBUILegibilityLabel sizeToFit](self->_timeLabel, "sizeToFit");
  -[SBFLockScreenDateSubtitleDateView sizeToFit](self->_dateSubtitleView, "sizeToFit");
  -[CSProminentDisplayViewController setDisplayDate:](self->_prominentDisplayViewController, "setDisplayDate:", self->_date);
  -[SBFLockScreenDateView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateUsesCompactDateFormat
{
  -[SBFLockScreenDateSubtitleDateView setUseCompactDateFormat:](self->_dateSubtitleView, "setUseCompactDateFormat:", self->_useCompactDateFormat);
}

- (void)_setDate:(id)a3 inTimeZone:(id)a4
{
  NSDate *v6;
  id v7;
  NSDate *date;

  v6 = (NSDate *)a3;
  objc_storeStrong((id *)&self->_timeZone, a4);
  v7 = a4;
  date = self->_date;
  self->_date = v6;

  -[SBFLockScreenDateView _updateLabels](self, "_updateLabels");
}

- (id)_timeLabel
{
  return self->_timeLabel;
}

+ (double)defaultHeight
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  double v6;
  int v7;
  char v8;
  double v9;

  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (v4)
  {
    if (SBFEffectiveDeviceClass() != 2)
      return 115.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    {
      v6 = 115.0;
LABEL_12:

      return v6;
    }
  }
  v7 = __sb__runningInSpringBoard();
  v8 = v7;
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v6 = dbl_18AC159A0[v9 >= *(double *)(MEMORY[0x1E0DAB260] + 264)];
  if ((v8 & 1) == 0)

  if ((v5 & 1) == 0)
    goto LABEL_12;
  return v6;
}

- (SBFLockScreenDateView)initWithFrame:(CGRect)a3
{
  SBFLockScreenDateView *v3;
  SBFLockScreenDateView *v4;
  uint64_t v5;
  _UILegibilitySettings *legibilitySettings;
  NSTimeZone *timeZone;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  objc_class *v15;
  id v16;
  uint64_t v17;
  SBUILegibilityLabel *timeLabel;
  SBUILegibilityLabel *v19;
  void *v20;
  SBFLockScreenDateSubtitleDateView *v21;
  SBFLockScreenDateSubtitleDateView *dateSubtitleView;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v27.receiver = self;
  v27.super_class = (Class)SBFLockScreenDateView;
  v3 = -[SBFLockScreenDateView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_timeAlpha = 1.0;
    v3->_subtitleAlpha = 1.0;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEADE8]), "initWithStyle:", 1);
    legibilitySettings = v4->_legibilitySettings;
    v4->_legibilitySettings = (_UILegibilitySettings *)v5;

    v4->_alignmentPercent = 0.0;
    v4->_maximumSubtitleWidth = INFINITY;
    timeZone = v4->_timeZone;
    v4->_timeZone = 0;

    objc_msgSend((id)objc_opt_class(), "timeFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFLockScreenDateView setCustomTimeFont:](v4, "setCustomTimeFont:", v8);

    objc_initWeak(&location, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CEAFD0];
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __39__SBFLockScreenDateView_initWithFrame___block_invoke;
    v24[3] = &unk_1E200E570;
    objc_copyWeak(&v25, &location);
    v13 = (id)objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v11, 0, v10, v24);

    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v14 = (void *)getSBUILegibilityLabelClass_softClass;
    v32 = getSBUILegibilityLabelClass_softClass;
    if (!getSBUILegibilityLabelClass_softClass)
    {
      v28[0] = v12;
      v28[1] = 3221225472;
      v28[2] = __getSBUILegibilityLabelClass_block_invoke;
      v28[3] = &unk_1E200E038;
      v28[4] = &v29;
      __getSBUILegibilityLabelClass_block_invoke((uint64_t)v28);
      v14 = (void *)v30[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v29, 8);
    v16 = [v15 alloc];
    v17 = objc_msgSend(v16, "initWithSettings:strength:string:font:", v4->_legibilitySettings, &stru_1E2010FC0, v4->_customTimeFont, *MEMORY[0x1E0CEC0C8]);
    timeLabel = v4->_timeLabel;
    v4->_timeLabel = (SBUILegibilityLabel *)v17;

    v19 = v4->_timeLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUILegibilityLabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

    v21 = -[SBFLockScreenDateSubtitleDateView initWithDate:]([SBFLockScreenDateSubtitleDateView alloc], "initWithDate:", 0);
    dateSubtitleView = v4->_dateSubtitleView;
    v4->_dateSubtitleView = v21;

    -[SBFLockScreenDateView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("lockscreen-date-view"));
    objc_storeStrong((id *)&v4->_activeSubtitleView, v4->_dateSubtitleView);
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      -[SBFLockScreenDateView addSubview:](v4, "addSubview:", v4->_timeLabel);
      -[SBFLockScreenDateView addSubview:](v4, "addSubview:", v4->_dateSubtitleView);
    }
    -[SBFLockScreenDateView updateFormat](v4, "updateFormat");
    objc_destroyWeak(&v25);

    objc_destroyWeak(&location);
  }
  return v4;
}

void __39__SBFLockScreenDateView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cacheCustomTimeMetrics");

}

- (BOOL)isSubtitleHidden
{
  double v2;

  -[SBFLockScreenDateSubtitleDateView alpha](self->_dateSubtitleView, "alpha");
  return fabs(v2) < 2.22044605e-16;
}

- (void)setSubtitleHidden:(BOOL)a3
{
  double v3;

  v3 = 1.0;
  if (a3)
    v3 = 0.0;
  -[SBFLockScreenDateView _setSubtitleAlpha:](self, "_setSubtitleAlpha:", v3);
}

- (void)setUseLandscapeTimeFontSize:(BOOL)a3
{
  if (self->_useLandscapeTimeFontSize != a3)
  {
    self->_useLandscapeTimeFontSize = a3;
    -[CSProminentDisplayViewController setUsesLandscapeTimeFontVariant:](self->_prominentDisplayViewController, "setUsesLandscapeTimeFontVariant:");
  }
}

- (void)setUseCompactDateFormat:(BOOL)a3
{
  if (self->_useCompactDateFormat != a3)
  {
    self->_useCompactDateFormat = a3;
    -[SBFLockScreenDateView _updateUsesCompactDateFormat](self, "_updateUsesCompactDateFormat");
    -[SBFLockScreenDateSubtitleDateView sizeToFit](self->_dateSubtitleView, "sizeToFit");
    -[SBFLockScreenDateView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTextColor:(id)a3
{
  UIColor *v5;
  UIColor **p_overrideTextColor;
  UIColor *v7;

  v5 = (UIColor *)a3;
  p_overrideTextColor = &self->_overrideTextColor;
  if (self->_overrideTextColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_overrideTextColor, a3);
    -[SBUILegibilityLabel setTextColor:](self->_timeLabel, "setTextColor:", *p_overrideTextColor);
    -[CSProminentDisplayViewController setTextColor:](self->_prominentDisplayViewController, "setTextColor:", *p_overrideTextColor);
    -[SBFLockScreenDateView _updateLabelAlpha](self, "_updateLabelAlpha");
    v5 = v7;
  }

}

- (void)setContentStyle:(id)a3
{
  -[CSProminentDisplayViewController setTitleContentStyle:](self->_prominentDisplayViewController, "setTitleContentStyle:", a3);
}

- (void)setRestrictsVibrancy:(BOOL)a3
{
  uint64_t v4;

  if (self->_restrictsVibrancy != a3)
  {
    self->_restrictsVibrancy = a3;
    if (a3)
      v4 = 1;
    else
      v4 = -[BSUIVibrancyConfiguration effectType](self->_vibrancyConfiguration, "effectType");
    -[CSProminentDisplayViewController setEffectType:](self->_prominentDisplayViewController, "setEffectType:", v4);
  }
}

- (void)setVibrancyConfiguration:(id)a3
{
  BSUIVibrancyConfiguration *v5;
  UIColor *v6;
  UIColor *overrideTextColor;
  CSProminentDisplayViewController *prominentDisplayViewController;
  uint64_t v9;
  CSProminentDisplayViewController *v10;
  void *v11;
  void *v12;
  CSProminentDisplayViewController *v13;
  void *v14;
  void *v15;
  BSUIVibrancyConfiguration *v16;

  v5 = (BSUIVibrancyConfiguration *)a3;
  if (self->_vibrancyConfiguration != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
    -[BSUIVibrancyConfiguration color](v16, "color");
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    overrideTextColor = self->_overrideTextColor;
    self->_overrideTextColor = v6;

    -[SBUILegibilityLabel setTextColor:](self->_timeLabel, "setTextColor:", self->_overrideTextColor);
    -[CSProminentDisplayViewController setTextColor:](self->_prominentDisplayViewController, "setTextColor:", self->_overrideTextColor);
    prominentDisplayViewController = self->_prominentDisplayViewController;
    if (self->_restrictsVibrancy)
      v9 = 1;
    else
      v9 = -[BSUIVibrancyConfiguration effectType](v16, "effectType");
    -[CSProminentDisplayViewController setEffectType:](prominentDisplayViewController, "setEffectType:", v9);
    -[CSProminentDisplayViewController setBackgroundType:](self->_prominentDisplayViewController, "setBackgroundType:", -[BSUIVibrancyConfiguration backgroundType](v16, "backgroundType"));
    v10 = self->_prominentDisplayViewController;
    -[BSUIVibrancyConfiguration groupName](v16, "groupName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentDisplayViewController setGroupName:](v10, "setGroupName:", v11);

    -[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](v16, "alternativeVibrancyEffectLUT");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_prominentDisplayViewController;
    objc_msgSend(v12, "lutIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentDisplayViewController setAlternativeVibrancyEffectLUTIdentifier:alternativeVibrancyEffectLUTBundleURL:](v13, "setAlternativeVibrancyEffectLUTIdentifier:alternativeVibrancyEffectLUTBundleURL:", v14, v15);

    -[SBFLockScreenDateView _updateLabelAlpha](self, "_updateLabelAlpha");
    v5 = v16;
  }

}

- (void)setTimeLegibilityStrength:(double)a3
{
  if (self->_timeLegibilityStrength != a3)
  {
    self->_timeLegibilityStrength = a3;
    -[SBUILegibilityLabel setStrength:](self->_timeLabel, "setStrength:");
  }
}

- (void)setSubtitleLegibilityStrength:(double)a3
{
  if (self->_subtitleLegibilityStrength != a3)
  {
    self->_subtitleLegibilityStrength = a3;
    -[SBFLockScreenDateSubtitleDateView setStrength:](self->_dateSubtitleView, "setStrength:");
    -[SBFLockScreenDateSubtitleView setStrength:](self->_customSubtitleView, "setStrength:", self->_subtitleLegibilityStrength);
  }
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings **p_legibilitySettings;
  CSProminentDisplayViewController *prominentDisplayViewController;
  void *v7;
  id v8;

  p_legibilitySettings = &self->_legibilitySettings;
  v8 = a3;
  if (!-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](*p_legibilitySettings, "sb_isEqualToLegibilitySettings:"))
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBUILegibilityLabel setLegibilitySettings:](self->_timeLabel, "setLegibilitySettings:", *p_legibilitySettings);
    -[SBFLockScreenDateSubtitleDateView setLegibilitySettings:](self->_dateSubtitleView, "setLegibilitySettings:", *p_legibilitySettings);
    -[SBFLockScreenDateSubtitleView setLegibilitySettings:](self->_customSubtitleView, "setLegibilitySettings:", *p_legibilitySettings);
    prominentDisplayViewController = self->_prominentDisplayViewController;
    -[SBFLockScreenDateView _effectiveTextColor](self, "_effectiveTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentDisplayViewController setTextColor:](prominentDisplayViewController, "setTextColor:", v7);

    -[SBFLockScreenDateView _updateLabels](self, "_updateLabels");
  }

}

- (void)setAlignmentPercent:(double)a3
{
  if (self->_alignmentPercent != a3)
  {
    self->_alignmentPercent = a3;
    -[SBFLockScreenDateView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDateToTimeStretch:(double)a3
{
  if (self->_dateToTimeStretch != a3)
  {
    self->_dateToTimeStretch = a3;
    -[SBFLockScreenDateView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaximumSubtitleWidth:(double)a3
{
  CGFloat Width;
  CGRect v6;

  if (self->_maximumSubtitleWidth != a3)
  {
    -[SBFLockScreenDateView bounds](self, "bounds");
    Width = CGRectGetWidth(v6);
    if (Width >= a3)
      Width = a3;
    self->_maximumSubtitleWidth = Width;
    -[SBFLockScreenDateView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateFormat
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D01738], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetFormattersIfNecessary");

}

- (double)timeAlpha
{
  return self->_timeAlpha;
}

- (double)subtitleAlpha
{
  return self->_subtitleAlpha;
}

- (void)setTimeAlpha:(double)a3 subtitleAlpha:(double)a4
{
  double *p_subtitleAlpha;

  if (!BSFloatEqualToFloat())
  {
    self->_timeAlpha = a3;
    p_subtitleAlpha = &self->_subtitleAlpha;
    if ((BSFloatEqualToFloat() & 1) != 0)
    {
LABEL_6:
      -[SBFLockScreenDateView _updateLabelAlpha](self, "_updateLabelAlpha");
      return;
    }
LABEL_5:
    *p_subtitleAlpha = a4;
    goto LABEL_6;
  }
  p_subtitleAlpha = &self->_subtitleAlpha;
  if ((BSFloatEqualToFloat() & 1) == 0)
    goto LABEL_5;
}

- (void)setInlineComplicationView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_inlineComplicationView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_inlineComplicationView, a3);
    -[SBFLockScreenDateView _updateActiveSubtitleView](self, "_updateActiveSubtitleView");
    v5 = v6;
  }

}

- (void)setCustomSubtitleView:(id)a3
{
  SBFLockScreenDateSubtitleView *v5;
  char v6;
  SBFLockScreenDateSubtitleView *v7;

  v5 = (SBFLockScreenDateSubtitleView *)a3;
  if (self->_customSubtitleView != v5)
  {
    v7 = v5;
    v6 = _os_feature_enabled_impl();
    v5 = v7;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_customSubtitleView, a3);
      -[SBFLockScreenDateSubtitleView setLegibilitySettings:](v7, "setLegibilitySettings:", self->_legibilitySettings);
      -[SBFLockScreenDateSubtitleView setStrength:](v7, "setStrength:", self->_subtitleLegibilityStrength);
      -[SBFLockScreenDateView _updateActiveSubtitleView](self, "_updateActiveSubtitleView");
      v5 = v7;
    }
  }

}

- (void)_updateActiveSubtitleView
{
  UIView **p_activeSubtitleView;
  SBFLockScreenDateSubtitleDateView *v4;
  SBFLockScreenDateSubtitleDateView *customSubtitleView;
  SBFLockScreenDateSubtitleDateView *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  SBFLockScreenDateSubtitleDateView *v15;
  SBFLockScreenDateView *v16;
  SBFLockScreenDateSubtitleDateView *v17;
  double v18;
  _QWORD v19[4];
  SBFLockScreenDateSubtitleDateView *v20;

  p_activeSubtitleView = &self->_activeSubtitleView;
  v4 = self->_activeSubtitleView;
  customSubtitleView = (SBFLockScreenDateSubtitleDateView *)self->_customSubtitleView;
  if (!customSubtitleView)
  {
    customSubtitleView = (SBFLockScreenDateSubtitleDateView *)self->_inlineComplicationView;
    if (!customSubtitleView)
      customSubtitleView = self->_dateSubtitleView;
  }
  v6 = customSubtitleView;
  objc_storeStrong((id *)p_activeSubtitleView, v6);
  -[SBFLockScreenDateSubtitleDateView sizeToFit](v6, "sizeToFit");
  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock"))
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
    v8 = v7;
    v9 = (void *)MEMORY[0x1E0D01908];
    v10 = (void *)MEMORY[0x1E0D016B0];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "settingsWithDuration:timingFunction:", v11, v8 * 0.5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __50__SBFLockScreenDateView__updateActiveSubtitleView__block_invoke;
    v19[3] = &unk_1E200E188;
    v20 = v4;
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __50__SBFLockScreenDateView__updateActiveSubtitleView__block_invoke_2;
    v14[3] = &unk_1E200E5B8;
    v15 = v6;
    v16 = self;
    v17 = v20;
    v18 = v8;
    objc_msgSend(v9, "animateWithSettings:actions:completion:", v12, v19, v14);

  }
  else
  {
    if (v4 != self->_dateSubtitleView)
      -[SBFLockScreenDateSubtitleDateView removeFromSuperview](v4, "removeFromSuperview");
    -[SBFLockScreenDateView addSubview:](self, "addSubview:", v6);
    -[SBFLockScreenDateView _updateLabelAlpha](self, "_updateLabelAlpha");
    -[SBFLockScreenDateView setNeedsLayout](self, "setNeedsLayout");
  }

}

uint64_t __50__SBFLockScreenDateView__updateActiveSubtitleView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __50__SBFLockScreenDateView__updateActiveSubtitleView__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 48) != v2[55])
  {
    objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
    v2 = *(_QWORD **)(a1 + 40);
  }
  objc_msgSend(v2, "setNeedsLayout");
  v3 = (void *)MEMORY[0x1E0D01908];
  v4 = (void *)MEMORY[0x1E0D016B0];
  v5 = *(double *)(a1 + 56) * 0.5;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingsWithDuration:timingFunction:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SBFLockScreenDateView__updateActiveSubtitleView__block_invoke_3;
  v8[3] = &unk_1E200E188;
  v8[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "animateWithSettings:actions:completion:", v7, v8, &__block_literal_global_8);

}

uint64_t __50__SBFLockScreenDateView__updateActiveSubtitleView__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLabelAlpha");
}

- (CGRect)presentationExtentForAlignmentPercent:(double)a3
{
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  void *v13;
  double subtitleAlpha;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;
  CGRect v33;
  CGRect v34;

  -[SBFLockScreenDateView _timeLabelFrameForAlignmentPercent:](self, "_timeLabelFrameForAlignmentPercent:");
  x = v5;
  y = v7;
  width = v9;
  height = v11;
  -[SBFLockScreenDateSubtitleView superview](self->_customSubtitleView, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    subtitleAlpha = self->_subtitleAlpha;

    if (subtitleAlpha > 0.0)
    {
      -[SBFLockScreenDateView _subtitleViewFrameForView:alignmentPercent:](self, "_subtitleViewFrameForView:alignmentPercent:", self->_customSubtitleView, a3);
      v33.origin.x = v15;
      v33.origin.y = v16;
      v33.size.width = v17;
      v33.size.height = v18;
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      v30 = CGRectUnion(v29, v33);
      x = v30.origin.x;
      y = v30.origin.y;
      width = v30.size.width;
      height = v30.size.height;
    }
  }
  -[SBFLockScreenDateSubtitleDateView superview](self->_dateSubtitleView, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = self->_subtitleAlpha;

    if (v20 > 0.0)
    {
      -[SBFLockScreenDateView _subtitleViewFrameForView:alignmentPercent:](self, "_subtitleViewFrameForView:alignmentPercent:", self->_dateSubtitleView, a3);
      v34.origin.x = v21;
      v34.origin.y = v22;
      v34.size.width = v23;
      v34.size.height = v24;
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      CGRectUnion(v31, v34);
    }
  }
  SBFMainScreenScale();
  BSRectRoundForScale();
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)setCustomTimeFont:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = v4;
  if (!v4)
  {
    +[SBFLockScreenDateView timeFont](SBFLockScreenDateView, "timeFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_customTimeFont, v5);
  if (!v4)

  -[SBFLockScreenDateView _cacheCustomTimeMetrics](self, "_cacheCustomTimeMetrics");
  -[SBFLockScreenDateView _updateForNewFont](self, "_updateForNewFont");
}

- (void)setSubtitleOnTop:(BOOL)a3
{
  if (self->_subtitleOnTop != a3)
  {
    self->_subtitleOnTop = a3;
    -[SBFLockScreenDateView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCustomTimeNumberingSystem:(id)a3
{
  NSString *v4;
  NSString *customTimeNumberingSystem;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  customTimeNumberingSystem = self->_customTimeNumberingSystem;
  self->_customTimeNumberingSystem = v4;

  -[CSProminentDisplayViewController setNumberingSystem:](self->_prominentDisplayViewController, "setNumberingSystem:", self->_customTimeNumberingSystem);
}

- (void)_cacheCustomTimeMetrics
{
  int v3;
  $02AE6EFEC5E111C05524896B48D66394 *p_customTimeMetrics;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v3 = _os_feature_enabled_impl();
  p_customTimeMetrics = &self->_customTimeMetrics;
  v5 = (void *)objc_opt_class();
  v6 = v5;
  if (v3)
  {
    +[SBFLockScreenDateView timeFont](SBFLockScreenDateView, "timeFont");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metricsForFont:", v15);
    p_customTimeMetrics->ascender = v7;
    self->_customTimeMetrics.descender = v8;
    self->_customTimeMetrics.bodyLeading = v9;
    self->_customTimeMetrics.capHeight = v10;

  }
  else
  {
    objc_msgSend(v5, "metricsForFont:", self->_customTimeFont);
    p_customTimeMetrics->ascender = v11;
    self->_customTimeMetrics.descender = v12;
    self->_customTimeMetrics.bodyLeading = v13;
    self->_customTimeMetrics.capHeight = v14;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double MinX;
  double v21;
  double MaxX;
  double v23;
  double v24;
  double v25;
  CGFloat rect;
  double rect_8;
  CGFloat rect_16;
  CGSize result;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  -[SBFLockScreenDateView _timeLabelFrameForAlignmentPercent:](self, "_timeLabelFrameForAlignmentPercent:", self->_alignmentPercent, a3.height);
  v5 = v4;
  rect = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBFLockScreenDateView _subtitleViewFrameForView:alignmentPercent:](self, "_subtitleViewFrameForView:alignmentPercent:", self->_dateSubtitleView, self->_alignmentPercent);
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  if (self->_subtitleOnTop)
  {
    v13 = v7;
    v12 = v5;
    v14 = v9;
    v15 = v11;
  }
  rect_16 = CGRectGetMaxY(*(CGRect *)&v12);
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  MinX = CGRectGetMinX(v30);
  v31.origin.x = v16;
  v31.origin.y = v17;
  v31.size.width = v18;
  v31.size.height = v19;
  v21 = CGRectGetMinX(v31);
  if (MinX < v21)
    v21 = MinX;
  rect_8 = v21;
  v32.origin.x = rect;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  MaxX = CGRectGetMaxX(v32);
  v33.origin.x = v16;
  v33.origin.y = v17;
  v33.size.width = v18;
  v33.size.height = v19;
  v23 = CGRectGetMaxX(v33);
  if (MaxX >= v23)
    v23 = MaxX;
  v24 = v23 - rect_8;
  if (v24 < 0.0)
    v24 = -v24;
  v25 = rect_16;
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGRect)chargingVisualInformationTimeFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[SBFLockScreenDateView _timeLabelFrameForAlignmentPercent:](self, "_timeLabelFrameForAlignmentPercent:", 0.0);
  v6 = self->_restingFrame.origin.x + v5;
  v8 = v7 + self->_restingFrame.origin.y;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (CGRect)chargingVisualInformationTimeSubtitleFrame
{
  SBFLockScreenDateSubtitleDateView *customSubtitleView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  customSubtitleView = (SBFLockScreenDateSubtitleDateView *)self->_customSubtitleView;
  if (!customSubtitleView)
    customSubtitleView = self->_dateSubtitleView;
  -[SBFLockScreenDateView _subtitleViewFrameForView:alignmentPercent:](self, "_subtitleViewFrameForView:alignmentPercent:", customSubtitleView, 0.0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[SBFLockScreenDateView chargingVisualInformationTimeFrame](self, "chargingVisualInformationTimeFrame");
  v11 = v10;
  v12 = v5 + self->_restingFrame.origin.x;
  +[SBFDashBoardViewMetrics timeLabelToSubtitleLabelDifferenceY](SBFDashBoardViewMetrics, "timeLabelToSubtitleLabelDifferenceY");
  v14 = v11 + v13;
  v15 = v12;
  v16 = v7;
  v17 = v9;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (void)_setSubtitleAlpha:(double)a3
{
  if (self->_subtitleAlpha != a3)
  {
    self->_subtitleAlpha = a3;
    -[SBFLockScreenDateView _updateLabelAlpha](self, "_updateLabelAlpha");
  }
}

- (void)_updateLabelAlpha
{
  SBFLockScreenDateSubtitleDateView *dateSubtitleView;
  double subtitleAlpha;

  -[SBUILegibilityLabel setAlpha:](self->_timeLabel, "setAlpha:", self->_timeAlpha);
  -[SBFLockScreenDateSubtitleView setAlpha:](self->_customSubtitleView, "setAlpha:", self->_subtitleAlpha);
  -[UIView setAlpha:](self->_inlineComplicationView, "setAlpha:", self->_subtitleAlpha);
  -[CSProminentDisplayViewController setContentAlpha:forElements:](self->_prominentDisplayViewController, "setContentAlpha:forElements:", 1, self->_timeAlpha);
  -[CSProminentDisplayViewController setContentAlpha:forElements:](self->_prominentDisplayViewController, "setContentAlpha:forElements:", 14, self->_subtitleAlpha);
  if (self->_customSubtitleView || self->_inlineComplicationView)
  {
    dateSubtitleView = self->_dateSubtitleView;
    subtitleAlpha = 0.0;
  }
  else
  {
    dateSubtitleView = self->_dateSubtitleView;
    subtitleAlpha = self->_subtitleAlpha;
  }
  -[SBFLockScreenDateSubtitleDateView setAlpha:](dateSubtitleView, "setAlpha:", subtitleAlpha);
}

- (id)_effectiveTextColor
{
  UIColor *overrideTextColor;

  overrideTextColor = self->_overrideTextColor;
  if (overrideTextColor)
    return overrideTextColor;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  SBUILegibilityLabel *timeLabel;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBFLockScreenDateView;
  -[SBFLockScreenDateView layoutSubviews](&v13, sel_layoutSubviews);
  -[SBFLockScreenDateView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CSProminentDisplayViewController view](self->_prominentDisplayViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  timeLabel = self->_timeLabel;
  -[SBFLockScreenDateView _timeLabelFrameForAlignmentPercent:](self, "_timeLabelFrameForAlignmentPercent:", self->_alignmentPercent);
  -[SBUILegibilityLabel setFrame:](timeLabel, "setFrame:");
  -[SBFLockScreenDateView _layoutSubtitle](self, "_layoutSubtitle");
}

- (void)_layoutSubtitle
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self->_dateSubtitleView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_customSubtitleView)
    objc_msgSend(v3, "addObject:");
  if (self->_inlineComplicationView)
    objc_msgSend(v4, "addObject:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[SBFLockScreenDateView _subtitleViewFrameForView:alignmentPercent:](self, "_subtitleViewFrameForView:alignmentPercent:", v10, self->_alignmentPercent, (_QWORD)v11);
        objc_msgSend(v10, "setFrame:");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "setAlignmentPercent:", self->_alignmentPercent);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (CGRect)_timeLabelFrameForAlignmentPercent:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect result;

  -[SBUILegibilityLabel frame](self->_timeLabel, "frame");
  v6 = v5;
  v8 = v7;
  -[SBUILegibilityLabel string](self->_timeLabel, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFLockScreenDateView _timeLabelInsetsForTimeString:](self, "_timeLabelInsetsForTimeString:", v9);
  v11 = v10;
  v13 = v12;

  -[SBFLockScreenDateView bounds](self, "bounds");
  v15 = (a3 + 1.0) * (v14 - v11 - v13 - v6) * 0.5;
  if (self->_subtitleOnTop)
  {
    -[SBFLockScreenDateView bounds](self, "bounds");
    v16 = CGRectGetHeight(v26) - (self->_customTimeMetrics.capHeight - self->_customTimeMetrics.descender);
  }
  else
  {
    v16 = 0.0;
  }
  v17 = v11 + v15;
  if (_SBFLockScreenDateViewShouldRoundFramesForAlignmentPercent())
  {
    SBFMainScreenScale();
    BSRectRoundForScale();
    v17 = v18;
    v16 = v19;
    v6 = v20;
    v8 = v21;
  }
  v22 = v17;
  v23 = v16;
  v24 = v6;
  v25 = v8;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (UIEdgeInsets)_timeLabelInsetsForTimeString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "substringWithRange:", 0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringWithRange:", objc_msgSend(v4, "length") - 1, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFLockScreenDateView _cachedGlyphInsetsTimeFontForString:](self, "_cachedGlyphInsetsTimeFontForString:", v5);
    v8 = v7;
    -[SBFLockScreenDateView _cachedGlyphInsetsTimeFontForString:](self, "_cachedGlyphInsetsTimeFontForString:", v6);
    v10 = v9;
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("1")))
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      UIRoundToScreenScale();
      v10 = v12;

    }
    v13 = -v8;
    v14 = -v10;

    v15 = 0.0;
    v16 = 0.0;
  }
  else
  {
    v15 = *MEMORY[0x1E0CEB4B0];
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v16 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v14 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }

  v17 = v15;
  v18 = v13;
  v19 = v16;
  v20 = v14;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (UIEdgeInsets)_cachedGlyphInsetsTimeFontForString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  UIFont *customTimeFont;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  float v24;
  float v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  _QWORD v32[2];
  UIEdgeInsets result;

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_cachedGlyphInsetsTimeFontForString__onceToken[0] != -1)
    dispatch_once(_cachedGlyphInsetsTimeFontForString__onceToken, &__block_literal_global_29);
  objc_msgSend((id)_cachedGlyphInsetsTimeFontForString__leadingInsetForNumber, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_cachedGlyphInsetsTimeFontForString__trailingInsetForNumber, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    customTimeFont = self->_customTimeFont;
    v31 = *MEMORY[0x1E0CEA098];
    v32[0] = customTimeFont;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C9D820];
    v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 8, v10, 0, *MEMORY[0x1E0C9D820], v12);
    UIRectIntegralWithScale();
    v14 = v13;
    v16 = v15;
    objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 0, v10, 0, v11, v12);
    UIRectIntegralWithScale();
    v18 = v17;
    v20 = v14 - v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 - v19);
    v21 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18 - v16 - v20);
    v22 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)_cachedGlyphInsetsTimeFontForString__leadingInsetForNumber, "setObject:forKeyedSubscript:", v21, v4);
    objc_msgSend((id)_cachedGlyphInsetsTimeFontForString__trailingInsetForNumber, "setObject:forKeyedSubscript:", v22, v4);

    v7 = (void *)v22;
    v5 = (void *)v21;
  }
  objc_msgSend(v5, "floatValue");
  v24 = v23;
  objc_msgSend(v7, "floatValue");
  v26 = v25;

  v27 = v24;
  v28 = v26;
  v29 = 0.0;
  v30 = 0.0;
  result.right = v28;
  result.bottom = v30;
  result.left = v27;
  result.top = v29;
  return result;
}

void __61__SBFLockScreenDateView__cachedGlyphInsetsTimeFontForString___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_cachedGlyphInsetsTimeFontForString__leadingInsetForNumber;
  _cachedGlyphInsetsTimeFontForString__leadingInsetForNumber = v0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_cachedGlyphInsetsTimeFontForString__trailingInsetForNumber;
  _cachedGlyphInsetsTimeFontForString__trailingInsetForNumber = v2;

}

- (CGRect)_subtitleViewFrameForView:(id)a3 alignmentPercent:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double dateToTimeStretch;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  objc_msgSend(a3, "frame");
  v7 = v6;
  v9 = v8;
  -[SBFLockScreenDateView maximumSubtitleWidth](self, "maximumSubtitleWidth");
  if (v7 >= v10)
    v7 = v10;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1
    || (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    -[SBFLockScreenDateView bounds](self, "bounds");
    v14 = (v15 - v7) * 0.5 + a4 * ((v15 - v7) * 0.5);
  }
  else
  {
    -[SBFLockScreenDateView bounds](self, "bounds");
    v14 = (a4 + 1.0) * (v13 - v7) * 0.5;
  }
  +[SBFDashBoardViewMetrics timeToSubtitleLabelBaselineDifferenceY](SBFDashBoardViewMetrics, "timeToSubtitleLabelBaselineDifferenceY");
  dateToTimeStretch = self->_dateToTimeStretch;
  if (dateToTimeStretch < 0.0)
    dateToTimeStretch = 0.0;
  v18 = v16 + dateToTimeStretch;
  if (self->_subtitleOnTop)
  {
    +[SBFLockScreenDateSubtitleView labelFontMetrics](SBFLockScreenDateSubtitleView, "labelFontMetrics");
    v20 = v19;
    v22 = v21;
    -[SBUILegibilityLabel origin](self->_timeLabel, "origin");
    v24 = v23 + self->_customTimeMetrics.ascender - self->_customTimeMetrics.capHeight - v18 - (v20 - v22);
  }
  else
  {
    -[SBUILegibilityLabel origin](self->_timeLabel, "origin");
    v26 = v18 + v25 + self->_customTimeMetrics.ascender;
    +[SBFLockScreenDateSubtitleView labelFontMetrics](SBFLockScreenDateSubtitleView, "labelFontMetrics");
    v24 = v26 - v27;
  }
  if (_SBFLockScreenDateViewShouldRoundFramesForAlignmentPercent())
  {
    SBFMainScreenScale();
    BSRectRoundForScale();
    v14 = v28;
    v24 = v29;
    v7 = v30;
    v9 = v31;
  }
  v32 = v14;
  v33 = v24;
  v34 = v7;
  v35 = v9;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

+ (id)timeFont
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  double v24;
  int v25;
  double v26;
  double v27;
  double v29;
  double v30;
  void *v31;
  id v32;
  CGFloat v33;
  CTFontRef v34;
  void *v35;
  double v37;
  int v38;
  double v39;
  int v40;
  double v41;
  double v42;
  int v43;
  double v44;
  double v45;
  double v46;
  int v47;
  int v48;
  double v49;
  double v50;
  int v51;
  int v52;
  int v53;
  int v54;
  double v55;
  int v56;
  double v57;
  double v58;
  int v59;
  double v60;
  double v61;
  double v62;
  int v63;
  double v64;
  double v65;
  int v66;
  double v67;
  uint64_t v68;
  double v69;
  double v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  _QWORD v133[4];
  uint64_t v134;
  int v135;
  uint64_t v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  _QWORD v148[5];
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;

  if (timeFont_onceToken[0] != -1)
    dispatch_once(timeFont_onceToken, &__block_literal_global_34);
  v3 = (void *)timeFont_timeFont;
  if (!timeFont_timeFont)
  {
    v4 = __sb__runningInSpringBoard();
    if (v4)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v5 = 0;
        v6 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v119, "userInterfaceIdiom") != 1)
      {
        v5 = 0;
        v6 = 1;
        goto LABEL_13;
      }
    }
    v6 = v4 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v7 = __sb__runningInSpringBoard();
      if ((_DWORD)v7)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "_referenceBounds");
      }
      v5 = v7 ^ 1;
      BSSizeRoundForScale();
      if (v27 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v26 == *(double *)(MEMORY[0x1E0DAB260] + 280))
      {
        v146 = v7 ^ 1;
        v147 = v6;
        memset(v133, 0, sizeof(v133));
        v143 = 0;
        v134 = 0;
        v132 = 0;
        v130 = 0;
        v135 = 0;
        v131 = 0;
        v136 = 0;
        v128 = 0;
        v129 = 0;
        v137 = 0;
        v127 = 0;
        v126 = 0;
        v138 = 0;
        v139 = 0;
        v125 = 0;
        v124 = 0;
        v140 = 0;
        v144 = 0;
        v123 = 0;
        v145 = 0;
        v122 = 0;
        v141 = 0;
        v121 = 0;
        v19 = 0;
        v20 = 0;
        v142 = 0;
        v21 = 0;
        v22 = 0;
        v23 = 0;
        goto LABEL_70;
      }
    }
    else
    {
      v5 = 0;
    }
LABEL_13:
    v8 = __sb__runningInSpringBoard();
    v146 = v5;
    v147 = v6;
    if (v8)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v9 = 0;
        v10 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v118, "userInterfaceIdiom") != 1)
      {
        v9 = 0;
        v10 = 1;
        goto LABEL_22;
      }
    }
    v10 = v8 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v7 = __sb__runningInSpringBoard();
      if ((_DWORD)v7)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "_referenceBounds");
      }
      v9 = v7 ^ 1;
      BSSizeRoundForScale();
      if (v29 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
      {
        v141 = v7 ^ 1;
        v142 = v10;
        memset(v133, 0, sizeof(v133));
        v143 = 0;
        v134 = 0;
        v132 = 0;
        v130 = 0;
        v135 = 0;
        v131 = 0;
        v136 = 0;
        v128 = 0;
        v129 = 0;
        v137 = 0;
        v127 = 0;
        v126 = 0;
        v138 = 0;
        v139 = 0;
        v125 = 0;
        v124 = 0;
        v140 = 0;
        v144 = 0;
        v123 = 0;
        v145 = 0;
        v122 = 0;
        v121 = 0;
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v23 = 0;
        goto LABEL_70;
      }
    }
    else
    {
      v9 = 0;
    }
LABEL_22:
    v11 = __sb__runningInSpringBoard();
    v141 = v9;
    v142 = v10;
    if (v11)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v12 = 0;
        v13 = 0;
        goto LABEL_31;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v117, "userInterfaceIdiom") != 1)
      {
        v12 = 0;
        v13 = 1;
        goto LABEL_31;
      }
    }
    v13 = v11 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v7 = __sb__runningInSpringBoard();
      if ((_DWORD)v7)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "_referenceBounds");
      }
      v12 = v7 ^ 1;
      BSSizeRoundForScale();
      if (v30 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
      {
        v144 = v7 ^ 1;
        v145 = v13;
        memset(v133, 0, sizeof(v133));
        v143 = 0;
        v134 = 0;
        v132 = 0;
        v130 = 0;
        v135 = 0;
        v131 = 0;
        v136 = 0;
        v128 = 0;
        v129 = 0;
        v137 = 0;
        v127 = 0;
        v126 = 0;
        v138 = 0;
        v139 = 0;
        v125 = 0;
        v124 = 0;
        v140 = 0;
        v122 = 0;
        v123 = 0;
        v121 = 0;
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v23 = 0;
        goto LABEL_70;
      }
    }
    else
    {
      v12 = 0;
    }
LABEL_31:
    v14 = __sb__runningInSpringBoard();
    v144 = v12;
    v145 = v13;
    if (v14)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v15 = 0;
        v2 = 0;
        goto LABEL_40;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v116, "userInterfaceIdiom") != 1)
      {
        v15 = 0;
        v2 = 1;
        goto LABEL_40;
      }
    }
    v2 = v14 ^ 1u;
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "_referenceBounds");
    }
    v15 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v16 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
    {
      v139 = v7 ^ 1;
      v140 = v2;
      memset(v133, 0, sizeof(v133));
      v143 = 0;
      v134 = 0;
      v132 = 0;
      v130 = 0;
      v135 = 0;
      v131 = 0;
      v136 = 0;
      v128 = 0;
      v129 = 0;
      v137 = 0;
      v127 = 0;
      v126 = 0;
      v138 = 0;
      v124 = 0;
      v125 = 0;
      v122 = 0;
      v123 = 0;
      v121 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      goto LABEL_70;
    }
LABEL_40:
    v17 = __sb__runningInSpringBoard();
    v139 = v15;
    v140 = v2;
    if (v17)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v137 = 0;
        v18 = 0;
        goto LABEL_50;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v115, "userInterfaceIdiom") != 1)
      {
        v137 = 0;
        v18 = 1;
        goto LABEL_50;
      }
    }
    v18 = v17 ^ 1;
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "_referenceBounds");
    }
    v137 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v24 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
    {
      v138 = v18;
      memset(v133, 0, sizeof(v133));
      v143 = 0;
      v134 = 0;
      v132 = 0;
      v130 = 0;
      v135 = 0;
      v131 = 0;
      v136 = 0;
      v128 = 0;
      v129 = 0;
      v126 = 0;
      v127 = 0;
      v124 = 0;
      v125 = 0;
      v122 = 0;
      v123 = 0;
      v121 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      goto LABEL_70;
    }
LABEL_50:
    v25 = __sb__runningInSpringBoard();
    v138 = v18;
    if (v25)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v136 = 0;
        goto LABEL_182;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v114, "userInterfaceIdiom") != 1)
      {
        v136 = 0x100000000;
        goto LABEL_182;
      }
    }
    HIDWORD(v136) = v25 ^ 1;
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "_referenceBounds");
    }
    LODWORD(v136) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v37 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
    {
      memset(v133, 0, sizeof(v133));
      v143 = 0;
      v134 = 0;
      v132 = 0;
      v130 = 0;
      v135 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v124 = 0;
      v122 = 0;
      v121 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      goto LABEL_70;
    }
LABEL_182:
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_184;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v112, "userInterfaceIdiom") != 1)
      {
LABEL_184:
        v135 = v7 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_188:
          v134 = 0;
          goto LABEL_198;
        }
        v38 = __sb__runningInSpringBoard();
        if (v38)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_188;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v106, "userInterfaceIdiom"))
          {
            v134 = 0x100000000;
            goto LABEL_198;
          }
        }
        HIDWORD(v134) = v38 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "_referenceBounds");
          }
          LODWORD(v134) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v41 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
          {
            memset(v133, 0, sizeof(v133));
            v143 = 0;
            v131 = 0;
            v132 = 0;
            v129 = 0;
            v130 = 0;
            v127 = 0;
            v128 = 0;
            v125 = 0;
            v126 = 0;
            v123 = 0;
            v124 = 0;
            v122 = 0;
            v121 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          LODWORD(v134) = 0;
        }
LABEL_198:
        v7 = __sb__runningInSpringBoard();
        if ((_DWORD)v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v143 = 0;
            HIDWORD(v133[3]) = 0;
            goto LABEL_208;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v107, "userInterfaceIdiom"))
          {
            v143 = 0;
            HIDWORD(v133[3]) = 1;
            goto LABEL_208;
          }
        }
        HIDWORD(v133[3]) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "_referenceBounds");
          }
          v143 = v7 ^ 1;
          BSSizeRoundForScale();
          if (v39 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
            goto LABEL_212;
        }
        else
        {
          v143 = 0;
        }
LABEL_208:
        if ((_SBF_Private_IsD94Like() & 1) != 0)
        {
          memset(v133, 0, 28);
          v131 = 0;
          v132 = 0;
          v129 = 0;
          v130 = 0;
          v127 = 0;
          v128 = 0;
          v125 = 0;
          v126 = 0;
          v123 = 0;
          v124 = 0;
          v122 = 0;
          v121 = 0;
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = 0;
          goto LABEL_70;
        }
LABEL_212:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_216:
          *(_QWORD *)((char *)&v133[2] + 4) = 0;
          goto LABEL_226;
        }
        v40 = __sb__runningInSpringBoard();
        if (v40)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_216;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v103, "userInterfaceIdiom"))
          {
            HIDWORD(v133[2]) = 0;
            LODWORD(v133[3]) = 1;
            goto LABEL_226;
          }
        }
        LODWORD(v133[3]) = v40 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "_referenceBounds");
          }
          HIDWORD(v133[2]) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v45 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
          {
            memset(v133, 0, 20);
            v131 = 0;
            v132 = 0;
            v129 = 0;
            v130 = 0;
            v127 = 0;
            v128 = 0;
            v125 = 0;
            v126 = 0;
            v123 = 0;
            v124 = 0;
            v122 = 0;
            v121 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          HIDWORD(v133[2]) = 0;
        }
LABEL_226:
        v7 = __sb__runningInSpringBoard();
        if ((_DWORD)v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_QWORD *)((char *)&v133[1] + 4) = 0;
            goto LABEL_236;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v105, "userInterfaceIdiom"))
          {
            HIDWORD(v133[1]) = 0;
            LODWORD(v133[2]) = 1;
            goto LABEL_236;
          }
        }
        LODWORD(v133[2]) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "_referenceBounds");
          }
          HIDWORD(v133[1]) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v42 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
            goto LABEL_240;
        }
        else
        {
          HIDWORD(v133[1]) = 0;
        }
LABEL_236:
        if ((_SBF_Private_IsD64Like() & 1) != 0)
        {
          *(_QWORD *)((char *)v133 + 4) = 0;
          LODWORD(v133[0]) = 0;
          v131 = 0;
          v132 = 0;
          v129 = 0;
          v130 = 0;
          v127 = 0;
          v128 = 0;
          v125 = 0;
          v126 = 0;
          v123 = 0;
          v124 = 0;
          v122 = 0;
          v121 = 0;
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = 0;
          goto LABEL_70;
        }
LABEL_240:
        v43 = __sb__runningInSpringBoard();
        if (v43)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_QWORD *)((char *)v133 + 4) = 0;
            goto LABEL_250;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v104, "userInterfaceIdiom"))
          {
            HIDWORD(v133[0]) = 0;
            LODWORD(v133[1]) = 1;
            goto LABEL_250;
          }
        }
        LODWORD(v133[1]) = v43 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "_referenceBounds");
          }
          HIDWORD(v133[0]) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v44 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
          {
            LODWORD(v133[0]) = 0;
            v131 = 0;
            v132 = 0;
            v129 = 0;
            v130 = 0;
            v127 = 0;
            v128 = 0;
            v125 = 0;
            v126 = 0;
            v123 = 0;
            v124 = 0;
            v122 = 0;
            v121 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          HIDWORD(v133[0]) = 0;
        }
LABEL_250:
        v7 = __sb__runningInSpringBoard();
        if ((_DWORD)v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v133[0]) = 0;
            HIDWORD(v132) = 0;
            goto LABEL_260;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v101, "userInterfaceIdiom"))
          {
            HIDWORD(v132) = 0;
            LODWORD(v133[0]) = 1;
            goto LABEL_260;
          }
        }
        LODWORD(v133[0]) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "_referenceBounds");
          }
          HIDWORD(v132) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v46 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
            goto LABEL_270;
        }
        else
        {
          HIDWORD(v132) = 0;
        }
LABEL_260:
        if ((_SBF_Private_IsD54() & 1) != 0)
        {
          LODWORD(v132) = 0;
          v129 = 0;
          v130 = 0;
          v131 = 0;
          v127 = 0;
          v128 = 0;
          v125 = 0;
          v126 = 0;
          v123 = 0;
          v124 = 0;
          v122 = 0;
          v121 = 0;
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = 0;
          goto LABEL_70;
        }
LABEL_270:
        v47 = __sb__runningInSpringBoard();
        if (v47)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v132) = 0;
            LODWORD(v130) = 0;
            goto LABEL_280;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v100, "userInterfaceIdiom"))
          {
            LODWORD(v130) = 0;
            LODWORD(v132) = 1;
            goto LABEL_280;
          }
        }
        LODWORD(v132) = v47 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v48 = __sb__runningInSpringBoard();
          if (v48)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "_referenceBounds");
          }
          v7 = v48 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v130) = v7;
          if (v49 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            v128 = 0;
            v129 = 0;
            v131 = 0;
            HIDWORD(v130) = 0;
            v126 = 0;
            v127 = 0;
            v124 = 0;
            v125 = 0;
            v122 = 0;
            v123 = 0;
            v121 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          LODWORD(v130) = 0;
        }
LABEL_280:
        v7 = __sb__runningInSpringBoard();
        if ((_DWORD)v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v129) = 0;
            HIDWORD(v131) = 0;
            goto LABEL_290;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v97, "userInterfaceIdiom"))
          {
            HIDWORD(v131) = 0;
            HIDWORD(v129) = 1;
            goto LABEL_290;
          }
        }
        HIDWORD(v129) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "_referenceBounds");
          }
          HIDWORD(v131) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v50 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
            goto LABEL_299;
        }
        else
        {
          HIDWORD(v131) = 0;
        }
LABEL_290:
        if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
        {
          LODWORD(v131) = 0;
          HIDWORD(v130) = 0;
          v127 = 0;
          v128 = 0;
          LODWORD(v129) = 0;
          v125 = 0;
          v126 = 0;
          v123 = 0;
          v124 = 0;
          v122 = 0;
          v121 = 0;
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = 0;
          goto LABEL_70;
        }
LABEL_299:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_303:
          LODWORD(v131) = 0;
          HIDWORD(v130) = 0;
          goto LABEL_310;
        }
        v51 = __sb__runningInSpringBoard();
        if (v51)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_303;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v92, "userInterfaceIdiom"))
          {
            HIDWORD(v130) = 0;
            LODWORD(v131) = 1;
            goto LABEL_310;
          }
        }
        LODWORD(v131) = v51 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v52 = __sb__runningInSpringBoard();
          if (v52)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "_referenceBounds");
          }
          v7 = v52 ^ 1u;
          BSSizeRoundForScale();
          HIDWORD(v130) = v7;
          if (v57 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
          {
            v127 = 0;
            v128 = 0;
            LODWORD(v129) = 0;
            v125 = 0;
            v126 = 0;
            v123 = 0;
            v124 = 0;
            v122 = 0;
            v121 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          HIDWORD(v130) = 0;
        }
LABEL_310:
        v53 = __sb__runningInSpringBoard();
        if (v53)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v128) = 0;
            v7 = 0;
            goto LABEL_320;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v96, "userInterfaceIdiom"))
          {
            v7 = 0;
            LODWORD(v128) = 1;
            goto LABEL_320;
          }
        }
        LODWORD(v128) = v53 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v54 = __sb__runningInSpringBoard();
          if (v54)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "_referenceBounds");
          }
          v7 = v54 ^ 1u;
          BSSizeRoundForScale();
          if (v55 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
            goto LABEL_324;
        }
        else
        {
          v7 = 0;
        }
LABEL_320:
        if ((_SBF_Private_IsD93Like() & 1) != 0)
        {
          LODWORD(v129) = v7;
          v126 = 0;
          v127 = 0;
          v124 = 0;
          v125 = 0;
          HIDWORD(v128) = 0;
          v122 = 0;
          v123 = 0;
          v121 = 0;
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = 0;
          goto LABEL_70;
        }
LABEL_324:
        LODWORD(v129) = v7;
        if (!_SBF_Private_IsD63Like())
        {
LABEL_328:
          v127 = 0;
          goto LABEL_338;
        }
        v56 = __sb__runningInSpringBoard();
        if (v56)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_328;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v87, "userInterfaceIdiom"))
          {
            v127 = 0x100000000;
            goto LABEL_338;
          }
        }
        HIDWORD(v127) = v56 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "_referenceBounds");
          }
          LODWORD(v127) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v61 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
            v125 = 0;
            v126 = 0;
            v123 = 0;
            v124 = 0;
            HIDWORD(v128) = 0;
            v122 = 0;
            v121 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          LODWORD(v127) = 0;
        }
LABEL_338:
        v7 = __sb__runningInSpringBoard();
        if ((_DWORD)v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v126 = 0;
            goto LABEL_348;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v91, "userInterfaceIdiom"))
          {
            v126 = 0x100000000;
            goto LABEL_348;
          }
        }
        HIDWORD(v126) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "_referenceBounds");
          }
          LODWORD(v126) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v58 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
            goto LABEL_352;
        }
        else
        {
          LODWORD(v126) = 0;
        }
LABEL_348:
        if ((_SBF_Private_IsD63Like() & 1) != 0)
        {
          v124 = 0;
          v125 = 0;
          HIDWORD(v128) = 0;
          v122 = 0;
          v123 = 0;
          v121 = 0;
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = 0;
          goto LABEL_70;
        }
LABEL_352:
        v59 = __sb__runningInSpringBoard();
        if (v59)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v125 = 0;
            goto LABEL_362;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v88, "userInterfaceIdiom"))
          {
            v125 = 0x100000000;
            goto LABEL_362;
          }
        }
        HIDWORD(v125) = v59 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "_referenceBounds");
          }
          LODWORD(v125) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v60 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
          {
            v123 = 0;
            v124 = 0;
            HIDWORD(v128) = 0;
            v122 = 0;
            v121 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          LODWORD(v125) = 0;
        }
LABEL_362:
        v7 = __sb__runningInSpringBoard();
        if ((_DWORD)v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v124 = 0;
            goto LABEL_372;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v85, "userInterfaceIdiom"))
          {
            v124 = 0x100000000;
            goto LABEL_372;
          }
        }
        HIDWORD(v124) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "_referenceBounds");
          }
          LODWORD(v124) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v62 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
            goto LABEL_382;
        }
        else
        {
          LODWORD(v124) = 0;
        }
LABEL_372:
        if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
        {
          HIDWORD(v128) = 0;
          v122 = 0;
          v123 = 0;
          v121 = 0;
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = 0;
          goto LABEL_70;
        }
LABEL_382:
        v63 = __sb__runningInSpringBoard();
        if (v63)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v128) = 0;
            HIDWORD(v123) = 0;
            goto LABEL_392;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v84, "userInterfaceIdiom"))
          {
            HIDWORD(v123) = 0;
            HIDWORD(v128) = 1;
            goto LABEL_392;
          }
        }
        HIDWORD(v128) = v63 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "_referenceBounds");
          }
          HIDWORD(v123) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v64 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
            LODWORD(v123) = 0;
            v122 = 0;
            v121 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          HIDWORD(v123) = 0;
        }
LABEL_392:
        v7 = __sb__runningInSpringBoard();
        if ((_DWORD)v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v123) = 0;
            HIDWORD(v122) = 0;
            goto LABEL_402;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v81, "userInterfaceIdiom"))
          {
            HIDWORD(v122) = 0;
            LODWORD(v123) = 1;
            goto LABEL_402;
          }
        }
        LODWORD(v123) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v7 = __sb__runningInSpringBoard();
          if ((_DWORD)v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "_referenceBounds");
          }
          HIDWORD(v122) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v65 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
            goto LABEL_409;
        }
        else
        {
          HIDWORD(v122) = 0;
        }
LABEL_402:
        if ((_SBF_Private_IsD53() & 1) != 0)
        {
LABEL_415:
          LODWORD(v122) = 0;
          v121 = 0;
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = 0;
          goto LABEL_70;
        }
LABEL_409:
        if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
          || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0
          || (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
          || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
        {
          goto LABEL_415;
        }
        v7 = __sb__runningInSpringBoard();
        if ((_DWORD)v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v122) = 0;
            v121 = 0;
            goto LABEL_426;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v75, "userInterfaceIdiom"))
          {
            v121 = 0;
            LODWORD(v122) = 1;
            goto LABEL_426;
          }
        }
        LODWORD(v122) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v5 = __sb__runningInSpringBoard();
          if ((_DWORD)v5)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "_referenceBounds");
          }
          v121 = v5 ^ 1;
          BSSizeRoundForScale();
          if (v69 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
          {
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          v121 = 0;
        }
LABEL_426:
        v66 = __sb__runningInSpringBoard();
        if (v66)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v19 = 0;
            v20 = 0;
            goto LABEL_436;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v74, "userInterfaceIdiom"))
          {
            v20 = 0;
            v19 = 1;
            goto LABEL_436;
          }
        }
        v19 = v66 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v5 = __sb__runningInSpringBoard();
          if ((_DWORD)v5)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "_referenceBounds");
          }
          v20 = v5 ^ 1;
          BSSizeRoundForScale();
          if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
          {
            v21 = 0;
            v22 = 0;
            v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          v20 = 0;
        }
LABEL_436:
        v5 = __sb__runningInSpringBoard();
        if ((_DWORD)v5)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v21 = 0;
            v22 = 0;
LABEL_446:
            v68 = __sb__runningInSpringBoard();
            if ((_DWORD)v68)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
LABEL_449:
                v23 = 0;
                goto LABEL_70;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v5 = objc_claimAutoreleasedReturnValue();
              if (objc_msgSend((id)v5, "userInterfaceIdiom"))
              {
                v23 = 1;
                goto LABEL_70;
              }
            }
            v23 = v68 ^ 1;
            v71 = __sb__runningInSpringBoard();
            if (v71)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
              v68 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v68, "_referenceBounds");
            }
            BSSizeRoundForScale();
            if (v71 != 1)

LABEL_70:
            if (v23)

            if (v22)
            if (v21)

            if (v20)
            if (v19)

            if (v121)
            if ((_DWORD)v122)

            if (HIDWORD(v122))
            if ((_DWORD)v123)

            if (HIDWORD(v123))
            if (HIDWORD(v128))

            if ((_DWORD)v124)
            if (HIDWORD(v124))

            if ((_DWORD)v125)
            if (HIDWORD(v125))

            if ((_DWORD)v126)
            if (HIDWORD(v126))

            if ((_DWORD)v127)
            if (HIDWORD(v127))

            if ((_DWORD)v129)
            if ((_DWORD)v128)

            if (HIDWORD(v130))
            if ((_DWORD)v131)

            if (HIDWORD(v131))
            if (HIDWORD(v129))

            if ((_DWORD)v130)
            if ((_DWORD)v132)

            if (HIDWORD(v132))
            if (LODWORD(v133[0]))

            if (HIDWORD(v133[0]))
            if (LODWORD(v133[1]))

            if (HIDWORD(v133[1]))
            if (LODWORD(v133[2]))

            if (HIDWORD(v133[2]))
            if (LODWORD(v133[3]))

            if (v143)
            if (HIDWORD(v133[3]))

            if ((_DWORD)v134)
            if (HIDWORD(v134))

            if (v135)
            if ((_DWORD)v136)

            if (HIDWORD(v136))
            if (v137)
            {

              if (!v138)
                goto LABEL_156;
            }
            else if (!v138)
            {
LABEL_156:
              if (v139)
                goto LABEL_157;
              goto LABEL_167;
            }

            if (v139)
            {
LABEL_157:

              if (!v140)
                goto LABEL_158;
              goto LABEL_168;
            }
LABEL_167:
            if (!v140)
            {
LABEL_158:
              if (v144)
                goto LABEL_159;
              goto LABEL_169;
            }
LABEL_168:

            if (v144)
            {
LABEL_159:

              if (!v145)
                goto LABEL_160;
              goto LABEL_170;
            }
LABEL_169:
            if (!v145)
            {
LABEL_160:
              if (v141)
                goto LABEL_161;
              goto LABEL_171;
            }
LABEL_170:

            if (v141)
            {
LABEL_161:

              if (!v142)
                goto LABEL_162;
              goto LABEL_172;
            }
LABEL_171:
            if (!v142)
            {
LABEL_162:
              if (v146)
                goto LABEL_163;
              goto LABEL_173;
            }
LABEL_172:

            if (v146)
            {
LABEL_163:

              if (!v147)
                goto LABEL_175;
              goto LABEL_174;
            }
LABEL_173:
            if (!v147)
            {
LABEL_175:
              v149 = 0;
              v150 = &v149;
              v151 = 0x2050000000;
              v31 = (void *)getCSProminentLayoutControllerClass_softClass;
              v152 = getCSProminentLayoutControllerClass_softClass;
              if (!getCSProminentLayoutControllerClass_softClass)
              {
                v148[0] = MEMORY[0x1E0C809B0];
                v148[1] = 3221225472;
                v148[2] = __getCSProminentLayoutControllerClass_block_invoke;
                v148[3] = &unk_1E200E038;
                v148[4] = &v149;
                __getCSProminentLayoutControllerClass_block_invoke((uint64_t)v148);
                v31 = (void *)v150[3];
              }
              v32 = objc_retainAutorelease(v31);
              _Block_object_dispose(&v149, 8);
              objc_msgSend(v32, "fontSizeForElementType:isLandscapeVariant:", 1, (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") - 3) < 2);
              v34 = CTFontCreateWithNameAndOptions(CFSTR(".SFSoftTime-Semibold"), v33, 0, 0x20000uLL);
              v35 = (void *)timeFont_timeFont;
              timeFont_timeFont = (uint64_t)v34;

              v3 = (void *)timeFont_timeFont;
              return v3;
            }
LABEL_174:

            goto LABEL_175;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v7 = objc_claimAutoreleasedReturnValue();
          if (objc_msgSend((id)v7, "userInterfaceIdiom"))
          {
            v22 = 0;
            v21 = 1;
            goto LABEL_446;
          }
        }
        v21 = v5 ^ 1;
        v5 = __sb__runningInSpringBoard();
        if ((_DWORD)v5)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v2 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v2, "_referenceBounds");
        }
        v22 = v5 ^ 1;
        BSSizeRoundForScale();
        if (v67 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
          goto LABEL_449;
        goto LABEL_446;
      }
    }
    memset(v133, 0, sizeof(v133));
    v143 = 0;
    v134 = 0;
    v132 = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v124 = 0;
    v122 = 0;
    v121 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v135 = v7 ^ 1;
    goto LABEL_70;
  }
  return v3;
}

void __33__SBFLockScreenDateView_timeFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEAFD0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_35);

}

void __33__SBFLockScreenDateView_timeFont__block_invoke_2()
{
  void *v0;

  v0 = (void *)timeFont_timeFont;
  timeFont_timeFont = 0;

}

+ ($01BB1521EC52D44A8E7628F5261DCEC8)timeFontMetrics
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  if (timeFontMetrics_onceToken != -1)
    dispatch_once(&timeFontMetrics_onceToken, &__block_literal_global_38);
  v3 = *(double *)&timeFontMetrics_timeFontMetrics;
  v4 = *(double *)&qword_1ECEEFBF0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)timeFontMetrics_timeFontMetrics, (float64x2_t)SBFFontMetricsZero), (int32x4_t)vceqq_f64(*(float64x2_t *)&qword_1ECEEFBF0, unk_18AC17988))), 0xFuLL))) & 1) != 0)
  {
    objc_msgSend(a1, "timeFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "metricsForFont:", v7);
    *(_QWORD *)&timeFontMetrics_timeFontMetrics = v8;
    *((_QWORD *)&timeFontMetrics_timeFontMetrics + 1) = v9;
    qword_1ECEEFBF0 = v10;
    dbl_1ECEEFBF8 = v11;

    v5 = *((double *)&timeFontMetrics_timeFontMetrics + 1);
    v3 = *(double *)&timeFontMetrics_timeFontMetrics;
    v4 = *(double *)&qword_1ECEEFBF0;
  }
  else
  {
    v5 = *((double *)&timeFontMetrics_timeFontMetrics + 1);
  }
  v6 = dbl_1ECEEFBF8;
  result.var3 = v6;
  result.var2 = v4;
  result.var1 = v5;
  result.var0 = v3;
  return result;
}

void __40__SBFLockScreenDateView_timeFontMetrics__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  timeFontMetrics_timeFontMetrics = SBFFontMetricsZero;
  *(_OWORD *)&qword_1ECEEFBF0 = unk_18AC17988;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEAFD0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_39);

}

double __40__SBFLockScreenDateView_timeFontMetrics__block_invoke_2()
{
  double result;

  result = *(double *)&SBFFontMetricsZero;
  timeFontMetrics_timeFontMetrics = SBFFontMetricsZero;
  *(_OWORD *)&qword_1ECEEFBF0 = unk_18AC17988;
  return result;
}

+ ($01BB1521EC52D44A8E7628F5261DCEC8)metricsForFont:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v3 = a3;
  objc_msgSend(v3, "ascender");
  v5 = v4;
  objc_msgSend(v3, "descender");
  v7 = v6;
  objc_msgSend(v3, "_bodyLeading");
  v9 = v8;
  objc_msgSend(v3, "capHeight");
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.var3 = v15;
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (double)timeBaselineOffsetFromOrigin
{
  double MaxY;
  double v4;
  CGRect v6;

  -[SBUILegibilityLabel frame](self->_timeLabel, "frame");
  MaxY = CGRectGetMaxY(v6);
  -[SBUILegibilityLabel firstBaselineOffsetFromBottom](self->_timeLabel, "firstBaselineOffsetFromBottom");
  return MaxY - v4;
}

- (double)subtitleBaselineOffsetFromOrigin
{
  SBFLockScreenDateSubtitleDateView *customSubtitleView;
  double result;

  if (self->_customSubtitleView)
    customSubtitleView = (SBFLockScreenDateSubtitleDateView *)self->_customSubtitleView;
  else
    customSubtitleView = self->_dateSubtitleView;
  -[SBFLockScreenDateSubtitleView baselineOffsetFromOrigin](customSubtitleView, "baselineOffsetFromOrigin");
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  _QWORD block[5];
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBFLockScreenDateView;
  -[SBFLockScreenDateView traitCollectionDidChange:](&v15, sel_traitCollectionDidChange_, v4);
  -[SBFLockScreenDateView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0)
    {
      v9 = objc_msgSend(v6, "legibilityWeight");
      v10 = objc_msgSend(v4, "legibilityWeight");

      if (v9 == v10)
        goto LABEL_7;
    }
    else
    {

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__SBFLockScreenDateView_traitCollectionDidChange___block_invoke;
    block[3] = &unk_1E200E188;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
LABEL_7:
  v11 = objc_msgSend(v4, "_backlightLuminance") != 1;
  -[SBFLockScreenDateView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_backlightLuminance");

  if (((v11 ^ (v13 == 1)) & 1) == 0)
    -[CSProminentDisplayViewController setUsesLightTimeFontVariant:](self->_prominentDisplayViewController, "setUsesLightTimeFontVariant:", v13 == 1);

}

uint64_t __50__SBFLockScreenDateView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForNewFont");
}

- (void)_updateForNewFont
{
  if (!_os_feature_enabled_impl())
    -[SBUILegibilityLabel setFont:](self->_timeLabel, "setFont:", self->_customTimeFont);
  -[CSProminentDisplayViewController setBaseFont:](self->_prominentDisplayViewController, "setBaseFont:", self->_customTimeFont);
  -[SBFLockScreenDateView _updateLabels](self, "_updateLabels");
}

- (NSDate)date
{
  return self->_date;
}

- (UIColor)textColor
{
  return self->_overrideTextColor;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)alignmentPercent
{
  return self->_alignmentPercent;
}

- (double)dateToTimeStretch
{
  return self->_dateToTimeStretch;
}

- (BOOL)useLandscapeTimeFontSize
{
  return self->_useLandscapeTimeFontSize;
}

- (BOOL)useCompactDateFormat
{
  return self->_useCompactDateFormat;
}

- (PRPosterContentStyle)contentStyle
{
  return self->_contentStyle;
}

- (double)timeLegibilityStrength
{
  return self->_timeLegibilityStrength;
}

- (double)subtitleLegibilityStrength
{
  return self->_subtitleLegibilityStrength;
}

- (double)maximumSubtitleWidth
{
  return self->_maximumSubtitleWidth;
}

- (UIFont)customTimeFont
{
  return self->_customTimeFont;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)customTimeMetrics
{
  double ascender;
  double descender;
  double bodyLeading;
  double capHeight;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  ascender = self->_customTimeMetrics.ascender;
  descender = self->_customTimeMetrics.descender;
  bodyLeading = self->_customTimeMetrics.bodyLeading;
  capHeight = self->_customTimeMetrics.capHeight;
  result.var3 = capHeight;
  result.var2 = bodyLeading;
  result.var1 = descender;
  result.var0 = ascender;
  return result;
}

- (BOOL)subtitleOnTop
{
  return self->_subtitleOnTop;
}

- (NSString)customTimeNumberingSystem
{
  return self->_customTimeNumberingSystem;
}

- (CGRect)restingFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_restingFrame.origin.x;
  y = self->_restingFrame.origin.y;
  width = self->_restingFrame.size.width;
  height = self->_restingFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRestingFrame:(CGRect)a3
{
  self->_restingFrame = a3;
}

- (SBFLockScreenDateSubtitleView)customSubtitleView
{
  return self->_customSubtitleView;
}

- (UIView)inlineComplicationView
{
  return self->_inlineComplicationView;
}

- (CSProminentDisplayViewController)prominentDisplayViewController
{
  return self->_prominentDisplayViewController;
}

- (void)setProminentDisplayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_prominentDisplayViewController, a3);
}

- (BOOL)restrictsVibrancy
{
  return self->_restrictsVibrancy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prominentDisplayViewController, 0);
  objc_storeStrong((id *)&self->_inlineComplicationView, 0);
  objc_storeStrong((id *)&self->_customTimeNumberingSystem, 0);
  objc_storeStrong((id *)&self->_customTimeFont, 0);
  objc_storeStrong((id *)&self->_contentStyle, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideTextColor, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_activeSubtitleView, 0);
  objc_storeStrong((id *)&self->_customSubtitleView, 0);
  objc_storeStrong((id *)&self->_dateSubtitleView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end

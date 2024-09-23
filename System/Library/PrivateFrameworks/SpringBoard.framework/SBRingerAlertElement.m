@implementation SBRingerAlertElement

- (SBRingerAlertElement)initWithSource:(unint64_t)a3 ringerSilent:(BOOL)a4 forPreviewing:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SBRingerAlertElement *v25;
  SBRingerAlertElement *v26;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  CGAffineTransform v33;

  v5 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0DAC6A8]);
  v9 = (SBUIHasHIDRingerButton() & 1) != 0 || _os_feature_enabled_impl();
  v10 = v9;
  -[SBRingerAlertElement _ringerPackageNameForVisualStyle:minimal:](self, "_ringerPackageNameForVisualStyle:minimal:");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0DAC6A0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v11;
  v14 = (void *)objc_msgSend(v12, "initWithPackageName:inBundle:", v11, v13);

  v15 = objc_alloc(MEMORY[0x1E0DAC6E8]);
  -[SBRingerAlertElement _textForRingerSilent:](self, "_textForRingerSilent:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithText:style:", v16, 4);

  -[SBRingerAlertElement _colorForRingerSilent:](self, "_colorForRingerSilent:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentColor:", v18);

  -[SBRingerAlertElement _leadingContentViewProviderForVolume](self, "_leadingContentViewProviderForVolume");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRingerAlertElement _containedVolumeSliderViewWithSize:layoutAxis:](self, "_containedVolumeSliderViewWithSize:layoutAxis:", 0, 82.0, 5.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "subviews");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bs_firstObjectOfClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_sliderView, v21);
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    CGAffineTransformMakeScale(&v33, -1.0, 1.0);
    objc_msgSend(v21, "setTransform:", &v33);
  }
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6B0]), "initWithView:", v19);
  v22 = v14;
  v23 = v17;
  if (a3)
  {
    if (a3 != 1)
      goto LABEL_11;
    v23 = v30;
    v22 = v31;
  }
  objc_msgSend(v8, "setLeadingContentViewProvider:", v22);
  objc_msgSend(v8, "setTrailingContentViewProvider:", v23);
LABEL_11:
  -[SBRingerAlertElement _minimalContentForSource:visualStyle:ringerSilent:](self, "_minimalContentForSource:visualStyle:ringerSilent:", a3, v10, v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimalContentViewProvider:", v24);
  v32.receiver = self;
  v32.super_class = (Class)SBRingerAlertElement;
  v25 = -[SBSystemApertureProvidedContentElement initWithIdentifier:contentProvider:](&v32, sel_initWithIdentifier_contentProvider_, self, v8);
  v26 = v25;
  if (v25)
  {
    v25->_source = a3;
    v25->_visualStyle = v10;
    objc_storeStrong((id *)&v25->_contentProvider, v8);
    v26->_activatedForPreviewing = a5;
    objc_storeStrong((id *)&v26->_leadingRingerContentViewProvider, v14);
    objc_storeStrong((id *)&v26->_minimalContentViewProvider, v24);
    objc_storeStrong((id *)&v26->_trailingTextContentViewProvider, v17);
    -[SBSystemApertureProvidedContentElement setMinimumSupportedLayoutMode:](v26, "setMinimumSupportedLayoutMode:", -1);
    -[SBSystemApertureProvidedContentElement setMaximumSupportedLayoutMode:](v26, "setMaximumSupportedLayoutMode:", 2);
    -[SBSystemApertureProvidedContentElement setPreferredLayoutMode:](v26, "setPreferredLayoutMode:", 2);
    -[SBRingerAlertElement _setRingerSilent:skipUpdate:](v26, "_setRingerSilent:skipUpdate:", v5, 1);
    -[SBRingerAlertElement _updateStateWithTransitionType:](v26, "_updateStateWithTransitionType:", v5 ^ 1);
  }

  return v26;
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  BOOL v11;

  v5 = a3;
  -[SBRingerAlertElement leadingRingerContentViewProvider](self, "leadingRingerContentViewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providedView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBRingerAlertElement minimalRingerContentViewProvider](self, "minimalRingerContentViewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "providedView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v11 = v7 == v5 || v9 == v5;
  return v11;
}

- (UIColor)keyColor
{
  _BOOL4 v3;
  _BOOL8 v4;

  v3 = -[SBRingerAlertElement isRingerSilent](self, "isRingerSilent");
  if (-[SBRingerAlertElement source](self, "source"))
    v4 = 0;
  else
    v4 = v3;
  return (UIColor *)-[SBRingerAlertElement _colorForRingerSilent:](self, "_colorForRingerSilent:", v4);
}

- (BOOL)overridesConcentricPaddingForView:(id)a3 inLayoutMode:(int64_t)a4
{
  id v6;
  unint64_t v7;
  BOOL v8;

  v6 = a3;
  v7 = -[SBRingerAlertElement visualStyle](self, "visualStyle");
  v8 = -[SBRingerAlertElement isProvidedViewConcentric:inLayoutMode:](self, "isProvidedViewConcentric:inLayoutMode:", v6, a4);

  return v7 == 1 && v8;
}

- (double)concentricPaddingOverrideForView:(id)a3 inLayoutMode:(int64_t)a4
{
  return 0.0;
}

- (void)setRingerSilent:(BOOL)a3
{
  -[SBRingerAlertElement _setRingerSilent:skipUpdate:](self, "_setRingerSilent:skipUpdate:", a3, 0);
}

- (void)_setRingerSilent:(BOOL)a3 skipUpdate:(BOOL)a4
{
  _BOOL4 ringerSilent;
  _BOOL4 v6;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  SBRingerAlertElement *v13;
  uint8_t buf[4];
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  ringerSilent = self->_ringerSilent;
  if (ringerSilent != a3)
  {
    v6 = a3;
    self->_ringerSilent = a3;
    SBLogRingerHUD();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v15 = v6;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SBRingerAlertElement setRingerSilent: %{BOOL}d", buf, 8u);
    }

    self->_lastEventIsAVolumeChange = 0;
    if (!a4)
    {
      if (ringerSilent)
        v9 = 3;
      else
        v9 = 2;
      -[SBRingerAlertElement _updateStateWithTransitionType:](self, "_updateStateWithTransitionType:", v9);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("SBSystemApertureNotificationUserInfoElementKey");
    v13 = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("SBSystemApertureElementKeyColorDidInvalidateNotification"), 0, v11);

  }
}

- (void)setVolume:(float)a3
{
  -[SBRingerAlertElement setVolume:animated:forKeyPress:](self, "setVolume:animated:forKeyPress:", 1, 0);
}

- (void)setVolume:(float)a3 animated:(BOOL)a4 forKeyPress:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  NSObject *v9;
  void *v10;
  int v11;
  double v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v5 = a5;
  v6 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  SBLogRingerHUD();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218496;
    v12 = a3;
    v13 = 1024;
    v14 = v6;
    v15 = 1024;
    v16 = v5;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "SBRingerAlertElement setVolume:%.2f animated:%{BOOL}d forKeyPress:%{BOOL}d", (uint8_t *)&v11, 0x18u);
  }

  -[SBRingerAlertElement delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ringerAlertElementWantsToResetAutomaticInvalidationTimer:", self);
  if (v5)
    self->_lastEventIsAVolumeChange = 1;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_volume = a3;
    -[SBRingerAlertElement _updateVolumeSliderAnimated:](self, "_updateVolumeSliderAnimated:", v6);
  }

}

- (BOOL)isPresented
{
  return -[SBSystemApertureProvidedContentElement layoutMode](self, "layoutMode") > 0;
}

- (void)presentForMuteChange:(BOOL)a3
{
  id v4;

  -[SBRingerAlertElement _updateVolumeSliderAnimated:](self, "_updateVolumeSliderAnimated:", 0);
  -[SBRingerAlertElement delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ringerAlertElementWantsToBePresented:", self);
  objc_msgSend(v4, "ringerAlertElementWantsToResetAutomaticInvalidationTimer:", self);

}

- (void)nudgeUp:(BOOL)a3
{
  double v4;

  if (a3)
  {
    if ((BSFloatIsOne() & 1) == 0)
      return;
    v4 = 0.0625;
  }
  else
  {
    if (!BSFloatLessThanOrEqualToFloat())
      return;
    v4 = -0.0625;
  }
  self->_overshoot = self->_overshoot + v4;
  -[SBRingerAlertElement _updateVolumeSliderAnimated:](self, "_updateVolumeSliderAnimated:", 1);
}

- (void)buttonReleased
{
  self->_overshoot = 0.0;
  -[SBRingerAlertElement _updateVolumeSliderAnimated:](self, "_updateVolumeSliderAnimated:", 1);
}

- (void)_updateVolumeSliderAnimated:(BOOL)a3
{
  _BOOL8 v3;
  float v5;
  double v6;

  v3 = a3;
  v5 = self->_overshoot + self->_volume;
  v6 = v5;
  -[SBRingerVolumeSliderView setValue:animated:](self->_sliderView, "setValue:animated:", v5);
  -[SBRingerVolumeSliderView setValue:animated:](self->_minimalSliderView, "setValue:animated:", v3, v6);
}

- (void)_updateStateWithTransitionType:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  _BOOL8 v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  id v15;
  id v16;
  uint64_t v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD block[5];
  void (**v25)(_QWORD, _QWORD, _QWORD);
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  unint64_t v32;
  BOOL v33;

  v5 = -[SBRingerAlertElement source](self, "source");
  if (v5 == 1)
  {
    -[SBRingerAlertElement _leadingContentViewProviderForVolume](self, "_leadingContentViewProviderForVolume");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[SBRingerAlertElement contentProvider](self, "contentProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLeadingContentViewProvider:", v23);

  }
  else if (!v5)
  {
    -[SBSystemApertureProvidedContentElement layoutHost](self, "layoutHost");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBRingerAlertElement isRingerSilent](self, "isRingerSilent");
    v8 = -[SBRingerAlertElement visualStyle](self, "visualStyle");
    -[SBRingerAlertElement leadingRingerContentViewProvider](self, "leadingRingerContentViewProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRingerAlertElement minimalRingerContentViewProvider](self, "minimalRingerContentViewProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __55__SBRingerAlertElement__updateStateWithTransitionType___block_invoke;
    v29[3] = &unk_1E8EA0CC0;
    v29[4] = self;
    v32 = v8;
    v33 = v7;
    v12 = v9;
    v30 = v12;
    v13 = v10;
    v31 = v13;
    v14 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v29);
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __55__SBRingerAlertElement__updateStateWithTransitionType___block_invoke_2;
    v26[3] = &unk_1E8EBDCC0;
    v15 = v12;
    v27 = v15;
    v16 = v13;
    v28 = v16;
    v17 = MEMORY[0x1D17E5550](v26);
    v18 = (void (**)(_QWORD, _QWORD, _QWORD))v17;
    switch(a3)
    {
      case 0uLL:
        (*(void (**)(uint64_t, const __CFString *, _QWORD))(v17 + 16))(v17, CFSTR("silent"), 0);
        v14[2](v14);
        goto LABEL_12;
      case 1uLL:
        (*(void (**)(uint64_t, const __CFString *, _QWORD))(v17 + 16))(v17, CFSTR("ringer"), 0);
        v14[2](v14);
        if (!-[SBRingerAlertElement isActivatedForPreviewing](self, "isActivatedForPreviewing"))
        {
          block[0] = v11;
          block[1] = 3221225472;
          block[2] = __55__SBRingerAlertElement__updateStateWithTransitionType___block_invoke_3;
          block[3] = &unk_1E8EA02D8;
          block[4] = self;
          v25 = v18;
          dispatch_async(MEMORY[0x1E0C80D38], block);

        }
        goto LABEL_12;
      case 2uLL:
        (*(void (**)(uint64_t, const __CFString *, _QWORD))(v17 + 16))(v17, CFSTR("ringer"), 0);
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v14, 0.18);
        ((void (**)(_QWORD, const __CFString *, uint64_t))v18)[2](v18, CFSTR("silent"), 1);
        goto LABEL_11;
      case 3uLL:
        (*(void (**)(uint64_t, const __CFString *, uint64_t))(v17 + 16))(v17, CFSTR("ringer"), 1);
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v14, 0.18);
        objc_msgSend(v6, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);
        -[SBRingerAlertElement _shakeRingerBell](self, "_shakeRingerBell");
        goto LABEL_11;
      default:
        if (a3 >= 2)
        {
LABEL_11:
          -[SBRingerAlertElement _textForRingerSilent:](self, "_textForRingerSilent:", v7);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBRingerAlertElement _colorForRingerSilent:](self, "_colorForRingerSilent:", v7);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBRingerAlertElement trailingTextContentViewProvider](self, "trailingTextContentViewProvider");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "swapInText:textColor:", v20, v21);

        }
LABEL_12:

        break;
    }
  }
}

uint64_t __55__SBRingerAlertElement__updateStateWithTransitionType___block_invoke(uint64_t a1)
{
  double v3;
  double v4;
  double v5;
  double v6;

  v5 = 0.0;
  v6 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_getRingerPackageSizesForVisualStyle:ringerSilent:leadingSize:minimalSize:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), &v5, &v3);
  objc_msgSend(*(id *)(a1 + 40), "setIntrinsicPackageSize:", v5, v6);
  return objc_msgSend(*(id *)(a1 + 48), "setIntrinsicPackageSize:", v3, v4);
}

void __55__SBRingerAlertElement__updateStateWithTransitionType___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "setState:animated:", v6, a3);
  objc_msgSend(*(id *)(a1 + 40), "setState:animated:", v6, a3);

}

uint64_t __55__SBRingerAlertElement__updateStateWithTransitionType___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_shakeRingerBell");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_textForRingerSilent:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("RINGER_COMPACT_OFF");
  else
    v6 = CFSTR("RINGER_COMPACT_ON");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_colorForRingerSilent:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.996078431, 0.266666667, 0.160784314, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_shakeRingerBell
{
  void *v3;
  int v4;
  id v5;

  if (-[SBSystemApertureProvidedContentElement layoutMode](self, "layoutMode") != 1)
  {
    +[SBSystemApertureDomain rootSettings](SBSystemApertureDomain, "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shakeRingerBell");

    if (v4)
    {
      -[SBSystemApertureProvidedContentElement elementHost](self, "elementHost");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "elementRequestsNegativeResponse:", self);

    }
  }
}

- (id)_leadingContentViewProviderForVolume
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[SBRingerAlertElement _bellImageForRingerSilent:](self, "_bellImageForRingerSilent:", -[SBRingerAlertElement isRingerSilent](self, "isRingerSilent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6B8]), "initWithImage:", v2);
  v4 = objc_alloc(MEMORY[0x1E0DAC6E8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RINGER_VOLUME"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithText:style:", v6, 4);

  objc_msgSend(v7, "contentColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentColor:", v8);

  v9 = objc_alloc(MEMORY[0x1E0DAC6E0]);
  v13[0] = v3;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithContentViewProviders:", v10);

  objc_msgSend(v11, "setContentDistribution:", 0);
  objc_msgSend(v11, "setContentSpacing:", 8.0);

  return v11;
}

- (id)_minimalContentForSource:(unint64_t)a3 visualStyle:(unint64_t)a4 ringerSilent:(BOOL)a5
{
  void *v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SBRingerVolumeSliderView *v14;
  SBRingerVolumeSliderView *minimalSliderView;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[11];

  v52[9] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    -[SBRingerAlertElement _bellImageForRingerSilent:](self, "_bellImageForRingerSilent:", a5, a4);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v51);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v11);

    -[SBRingerAlertElement _containedVolumeSliderViewWithSize:layoutAxis:](self, "_containedVolumeSliderViewWithSize:layoutAxis:", 1, 6.0, 42.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "subviews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bs_firstObjectOfClass:", objc_opt_class());
    v14 = (SBRingerVolumeSliderView *)objc_claimAutoreleasedReturnValue();
    minimalSliderView = self->_minimalSliderView;
    self->_minimalSliderView = v14;

    v16 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v17 = (void *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "addSubview:", v12);
    objc_msgSend(v17, "addSubview:", v10);
    objc_msgSend(v12, "bounds");
    v19 = v18;
    v21 = v20;
    v40 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v12, "widthAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToConstant:", v19);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v49;
    objc_msgSend(v12, "heightAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToConstant:", v21);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v47;
    objc_msgSend(v12, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v44;
    objc_msgSend(v12, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v41;
    objc_msgSend(v10, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 3.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v52[4] = v36;
    objc_msgSend(v10, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v52[5] = v33;
    objc_msgSend(v10, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v52[6] = v22;
    objc_msgSend(v17, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v10;
    objc_msgSend(v10, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v52[7] = v25;
    objc_msgSend(v17, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v52[8] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v29);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6B0]), "initWithView:", v17);
  }
  else if (!a3)
  {
    -[SBRingerAlertElement _ringerPackageNameForVisualStyle:minimal:](self, "_ringerPackageNameForVisualStyle:minimal:", a4, 1, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0DAC6A0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v8, "initWithPackageName:inBundle:", v7, v9);

    objc_storeStrong((id *)&self->_minimalRingerContentViewProvider, v5);
  }
  return v5;
}

- (id)_containedVolumeSliderViewWithSize:(CGSize)a3 layoutAxis:(int64_t)a4
{
  SBRingerVolumeSliderView *v5;
  SBRingerVolumeSliderView *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v5 = [SBRingerVolumeSliderView alloc];
  BSRectWithSize();
  v6 = -[SBRingerVolumeSliderView initWithFrame:](v5, "initWithFrame:");
  -[SBRingerVolumeSliderView setStyle:](v6, "setStyle:", 1);
  -[SBRingerVolumeSliderView setLayoutAxis:](v6, "setLayoutAxis:", a4);
  -[SBRingerVolumeSliderView setRoundedStyle:](v6, "setRoundedStyle:", 1);
  v7 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v7, "addSubview:", v6);
  -[SBRingerVolumeSliderView bounds](v6, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v7, "center");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", v12, v9, v11);
  v14 = v13;
  v16 = v15;

  -[SBRingerVolumeSliderView setCenter:](v6, "setCenter:", v14, v16);
  return v7;
}

- (id)_bellImageForRingerSilent:(BOOL)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = CFSTR("bell.fill");
  if (a3)
    v3 = CFSTR("bell.slash.fill");
  v4 = (void *)MEMORY[0x1E0CEA650];
  v5 = (void *)MEMORY[0x1E0CEA5E8];
  v6 = v3;
  objc_msgSend(v5, "sbui_systemAperturePreferredFontForTextStyle:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithFont:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_ringerPackageNameForVisualStyle:(unint64_t)a3 minimal:(BOOL)a4
{
  __CFString *v4;

  if (a3 == 1)
    return CFSTR("Ringer-Leading-D83");
  if (a3)
    return 0;
  v4 = CFSTR("Ringer-Leading-D73");
  if (a4)
    v4 = CFSTR("Ringer-Minimal-D73");
  return v4;
}

- (void)_getRingerPackageSizesForVisualStyle:(unint64_t)a3 ringerSilent:(BOOL)a4 leadingSize:(CGSize *)a5 minimalSize:(CGSize *)a6
{
  double v6;
  CGFloat v7;
  CGFloat v8;
  double v9;

  if (a3 == 1)
  {
    v6 = 36.6666667;
    v7 = 36.6666667;
    v8 = 36.6666667;
    v9 = 36.6666667;
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    if (!a3)
    {
      if (a4)
        v9 = 52.42;
      else
        v9 = 21.58;
      v8 = 37.0;
      v7 = 25.2;
      v6 = 49.32;
      if (!a4)
        v6 = 25.2;
    }
  }
  a5->width = v9;
  a5->height = v8;
  a6->width = v7;
  a6->height = v6;
}

- (id)elementIdentifier
{
  return CFSTR("Ringer Alert");
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  NSDirectionalEdgeInsets result;

  v11.receiver = self;
  v11.super_class = (Class)SBRingerAlertElement;
  -[SBSystemApertureProvidedContentElement preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:](&v11, sel_preferredEdgeOutsetsForLayoutMode_suggestedOutsets_maximumOutsets_, a4.top, a4.leading, a4.bottom, a4.trailing, a5.top, a5.leading, a5.bottom, a5.trailing);
  if (v7 <= v9)
    v10 = v7;
  else
    v10 = v9;
  if (a3 == 2)
  {
    v9 = v10;
    v7 = v10;
  }
  result.trailing = v9;
  result.bottom = v8;
  result.leading = v7;
  result.top = v6;
  return result;
}

- (id)alertHost
{
  return objc_loadWeakRetained((id *)&self->_alertHost);
}

- (void)setAlertHost:(id)a3
{
  objc_storeWeak((id *)&self->_alertHost, a3);
}

- (BOOL)isRingerSilent
{
  return self->_ringerSilent;
}

- (BOOL)isActivatedForPreviewing
{
  return self->_activatedForPreviewing;
}

- (void)setActivatedForPreviewing:(BOOL)a3
{
  self->_activatedForPreviewing = a3;
}

- (float)volume
{
  return self->_volume;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (SBRingerAlertElementDelegate)delegate
{
  return (SBRingerAlertElementDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SAInvalidatable)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (unint64_t)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(unint64_t)a3
{
  self->_visualStyle = a3;
}

- (SBUISystemApertureContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void)setContentProvider:(id)a3
{
  objc_storeStrong((id *)&self->_contentProvider, a3);
}

- (SBUISystemApertureCAPackageContentProvider)leadingRingerContentViewProvider
{
  return self->_leadingRingerContentViewProvider;
}

- (void)setLeadingRingerContentViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_leadingRingerContentViewProvider, a3);
}

- (SBUISystemApertureCAPackageContentProvider)minimalRingerContentViewProvider
{
  return self->_minimalRingerContentViewProvider;
}

- (void)setMinimalRingerContentViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_minimalRingerContentViewProvider, a3);
}

- (SBUISystemApertureContentViewProviding)minimalContentViewProvider
{
  return self->_minimalContentViewProvider;
}

- (void)setMinimalContentViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_minimalContentViewProvider, a3);
}

- (SBUISystemApertureTextContentProvider)trailingTextContentViewProvider
{
  return self->_trailingTextContentViewProvider;
}

- (void)setTrailingTextContentViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTextContentViewProvider, a3);
}

- (SBRingerVolumeSliderView)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
  objc_storeStrong((id *)&self->_sliderView, a3);
}

- (SBRingerVolumeSliderView)minimalSliderView
{
  return self->_minimalSliderView;
}

- (void)setMinimalSliderView:(id)a3
{
  objc_storeStrong((id *)&self->_minimalSliderView, a3);
}

- (BOOL)lastEventIsAVolumeChange
{
  return self->_lastEventIsAVolumeChange;
}

- (void)setLastEventIsAVolumeChange:(BOOL)a3
{
  self->_lastEventIsAVolumeChange = a3;
}

- (double)overshoot
{
  return self->_overshoot;
}

- (void)setOvershoot:(double)a3
{
  self->_overshoot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimalSliderView, 0);
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_trailingTextContentViewProvider, 0);
  objc_storeStrong((id *)&self->_minimalContentViewProvider, 0);
  objc_storeStrong((id *)&self->_minimalRingerContentViewProvider, 0);
  objc_storeStrong((id *)&self->_leadingRingerContentViewProvider, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_alertHost);
}

@end

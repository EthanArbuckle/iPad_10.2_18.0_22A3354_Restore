@implementation SBLockScreenTemperatureWarningView

- (SBLockScreenTemperatureWarningView)initWithFrame:(CGRect)a3
{
  SBLockScreenTemperatureWarningView *v3;
  SBLockScreenTemperatureWarningView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIImageView *warningIconView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBLockScreenTemperatureWarningView;
  v3 = -[SBUILockOverlayView initWithFrame:style:](&v11, sel_initWithFrame_style_, 3, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBUILockOverlayView titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenTemperatureWarningView addSubview:](v4, "addSubview:", v5);

    -[SBUILockOverlayView subtitleLabel](v4, "subtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenTemperatureWarningView addSubview:](v4, "addSubview:", v6);

    +[SBDashBoardThermalStatusProvider thermometerGlyphForThermalStatus:](SBDashBoardThermalStatusProvider, "thermometerGlyphForThermalStatus:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v7);
    warningIconView = v4->_warningIconView;
    v4->_warningIconView = (UIImageView *)v8;

    -[SBLockScreenTemperatureWarningView addSubview:](v4, "addSubview:", v4->_warningIconView);
  }
  return v4;
}

- (id)_titleFont
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  _BOOL4 v6;
  double v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CEA5E8];
  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (v4)
  {
    v6 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "userInterfaceIdiom") == 1;
  }
  v7 = 36.0;
  if (v6)
    v7 = 48.0;
  objc_msgSend(v3, "_thinSystemFontOfSize:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 1) == 0)

  return v8;
}

- (id)_subtitleFont
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 != 1)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 24.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (SBFEffectiveDeviceClass() == 2)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  return v2;
}

- (double)_titleBaseline
{
  double result;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      return 114.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != 1)
      return 114.0;
  }
  v6 = -[SBLockScreenTemperatureWarningView _statusBarOrientationIsPortrait](self, "_statusBarOrientationIsPortrait");
  result = 241.0;
  if (v6)
    return 256.0;
  return result;
}

- (double)_subtitleBaseline
{
  double result;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      return 320.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != 1)
      return 320.0;
  }
  v6 = -[SBLockScreenTemperatureWarningView _statusBarOrientationIsPortrait](self, "_statusBarOrientationIsPortrait");
  result = 446.0;
  if (v6)
    return 560.0;
  return result;
}

- (double)_iconYPosition
{
  double result;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      return 220.5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != 1)
      return 220.5;
  }
  v6 = -[SBLockScreenTemperatureWarningView _statusBarOrientationIsPortrait](self, "_statusBarOrientationIsPortrait");
  result = 296.0;
  if (v6)
    return 410.0;
  return result;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
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
  float v34;
  double v35;
  double v36;
  id v37;

  -[SBLockScreenTemperatureWarningView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBUILockOverlayView titleLabel](self, "titleLabel");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenTemperatureWarningView _titleFont](self, "_titleFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sizeToFit");
  objc_msgSend(v37, "frame");
  UIRectCenteredXInRectScale();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[SBLockScreenTemperatureWarningView _titleBaseline](self, "_titleBaseline", 0);
  objc_msgSend(v37, "sb_yPositionForLabelWithContainerBounds:baselineOffset:font:", v11, v4, v6, v8, v10, v18);
  objc_msgSend(v37, "setFrame:", v13, v19, v15, v17);
  -[SBUILockOverlayView subtitleLabel](self, "subtitleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenTemperatureWarningView _subtitleFont](self, "_subtitleFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeToFit");
  objc_msgSend(v20, "frame");
  UIRectCenteredXInRectScale();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[SBLockScreenTemperatureWarningView _subtitleBaseline](self, "_subtitleBaseline", 0);
  objc_msgSend(v20, "sb_yPositionForLabelWithContainerBounds:baselineOffset:font:", v21, v4, v6, v8, v10, v28);
  objc_msgSend(v20, "setFrame:", v23, v29, v25, v27);
  -[UIImageView frame](self->_warningIconView, "frame");
  v31 = v30;
  v33 = v32;
  v34 = (v8 - v30) * 0.5;
  v35 = floorf(v34);
  -[SBLockScreenTemperatureWarningView _iconYPosition](self, "_iconYPosition");
  -[UIImageView setFrame:](self->_warningIconView, "setFrame:", v35, v36, v31, v33);

}

- (BOOL)_statusBarOrientationIsPortrait
{
  void *v2;
  void *v3;

  -[UIView _sbWindowScene](self, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = (unint64_t)(objc_msgSend(v3, "statusBarOrientation") - 1) < 2;
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningIconView, 0);
}

@end

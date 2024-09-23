@implementation SBPIPStashView

- (SBPIPStashView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  NSObject *v12;
  SBPIPStashView *v13;
  SBPIPStashView *v14;
  SBPIPBackdropView *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SBPIPBackdropView *v20;
  void *v21;
  void *v22;
  SBPIPBackdropView *backdropView;
  UIView *v24;
  UIView *darkTintView;
  UIView *v26;
  UIView *lightTintView;
  UIView *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIImageView *v33;
  UIImageView *leftChevron;
  UIImageView *v35;
  void *v36;
  void *v37;
  UIImageView *v38;
  UIImageView *rightChevron;
  UIView *v41;
  SBPIPBackdropView *v42;
  id v43;
  objc_super v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  SBLogPIP();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SBPIPStashView initWithFrame:settings:].cold.1((uint64_t)self, (uint64_t)a2, v12);

  v44.receiver = self;
  v44.super_class = (Class)SBPIPStashView;
  v13 = -[SBPIPStashView initWithFrame:](&v44, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_chevronsHidden = 1;
    objc_storeStrong((id *)&v13->_settings, a4);
    -[PTSettings addKeyObserver:](v14->_settings, "addKeyObserver:", v14);
    -[SBPIPStashView setAccessibilityIdentifier:](v14, "setAccessibilityIdentifier:", CFSTR("PG-StashedView"));
    -[UIView SBPIP_recursivelyDisallowGroupBlending](v14, "SBPIP_recursivelyDisallowGroupBlending");
    -[UIView SBPIP_setAllowsEdgeAntialiasing:](v14, "SBPIP_setAllowsEdgeAntialiasing:", 1);
    -[UIView SBPIP_setAllowsGroupBlending:](v14, "SBPIP_setAllowsGroupBlending:", 0);
    v15 = [SBPIPBackdropView alloc];
    v16 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v20 = -[SBPIPBackdropView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], v17, v18, v19);
    -[UIView SBPIP_setAllowsEdgeAntialiasing:](v20, "SBPIP_setAllowsEdgeAntialiasing:", 1);
    -[SBPIPBackdropView setGaussianBlurRadius:](v20, "setGaussianBlurRadius:", 0.0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPBackdropView setGroupName:](v20, "setGroupName:", v22);

    -[SBPIPStashView addSubview:](v14, "addSubview:", v20);
    v43 = v11;
    backdropView = v14->_backdropView;
    v14->_backdropView = v20;
    v42 = v20;

    v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    -[UIView SBPIP_setAllowsEdgeAntialiasing:](v24, "SBPIP_setAllowsEdgeAntialiasing:", 1);
    -[UIView setAlpha:](v24, "setAlpha:", 0.0);
    -[SBPIPStashView addSubview:](v14, "addSubview:", v24);
    darkTintView = v14->_darkTintView;
    v14->_darkTintView = v24;
    v41 = v24;

    v26 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    -[UIView SBPIP_setAllowsEdgeAntialiasing:](v26, "SBPIP_setAllowsEdgeAntialiasing:", 1);
    -[UIView setAlpha:](v26, "setAlpha:", 0.0);
    -[SBPIPStashView addSubview:](v14, "addSubview:", v26);
    lightTintView = v14->_lightTintView;
    v14->_lightTintView = v26;
    v28 = v26;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 30.0, *MEMORY[0x1E0CEB5F8]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("chevron.compact.left"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "imageWithRenderingMode:", 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v32);
    -[UIImageView setAlpha:](v33, "setAlpha:", 0.0);
    -[SBPIPStashView addSubview:](v14, "addSubview:", v33);
    leftChevron = v14->_leftChevron;
    v14->_leftChevron = v33;
    v35 = v33;

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("chevron.compact.right"), v30);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "imageWithRenderingMode:", 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v37);
    -[UIImageView setAlpha:](v38, "setAlpha:", 0.0);
    -[SBPIPStashView addSubview:](v14, "addSubview:", v38);
    rightChevron = v14->_rightChevron;
    v14->_rightChevron = v38;
    v11 = v43;

    -[SBPIPStashView _updateSettingsDerivedValues](v14, "_updateSettingsDerivedValues");
  }

  return v14;
}

- (SBPIPStashView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  SBPIPStashView *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stashVisualSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBPIPStashView initWithFrame:settings:](self, "initWithFrame:settings:", v9, x, y, width, height);

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PTSettings removeKeyObserver:](self->_settings, "removeKeyObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBPIPStashView;
  -[SBPIPStashView dealloc](&v3, sel_dealloc);
}

- (void)_updateSettingsDerivedValues
{
  double v3;
  double v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  UIView *darkTintView;
  void *v9;
  UIView *lightTintView;
  void *v11;
  UIImageView *leftChevron;
  void *v13;
  UIImageView *rightChevron;
  void *v15;
  void *v16;
  id v17;

  -[SBPIPStashVisualSettings startBlurTransition](self->_settings, "startBlurTransition");
  self->_startBlurThreshold = v3;
  -[SBPIPStashVisualSettings completeBlurTransition](self->_settings, "completeBlurTransition");
  self->_completeBlurThreshold = v4;
  v5 = -[SBPIPStashVisualSettings userInterfaceStyle](self->_settings, "userInterfaceStyle");
  if (v5)
    -[SBPIPStashView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v5);
  -[SBPIPStashView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  -[SBPIPStashVisualSettings materialSettingsForUserInterfaceStyle:](self->_settings, "materialSettingsForUserInterfaceStyle:", v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  darkTintView = self->_darkTintView;
  objc_msgSend(v17, "darkTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](darkTintView, "setBackgroundColor:", v9);

  lightTintView = self->_lightTintView;
  objc_msgSend(v17, "lightTintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](lightTintView, "setBackgroundColor:", v11);

  leftChevron = self->_leftChevron;
  objc_msgSend(v17, "chevronTintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](leftChevron, "setTintColor:", v13);

  rightChevron = self->_rightChevron;
  objc_msgSend(v17, "chevronTintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](rightChevron, "setTintColor:", v15);

  objc_msgSend(v17, "chevronCompositingFilter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView SBPIP_updateVibrancyEffectForTintColorWithFilter:](self->_leftChevron, "SBPIP_updateVibrancyEffectForTintColorWithFilter:", v16);
  -[UIImageView SBPIP_updateVibrancyEffectForTintColorWithFilter:](self->_rightChevron, "SBPIP_updateVibrancyEffectForTintColorWithFilter:", v16);

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
  SBPIPBackdropView *backdropView;
  double MidX;
  UIView *lightTintView;
  UIView *darkTintView;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v15.receiver = self;
  v15.super_class = (Class)SBPIPStashView;
  -[SBPIPStashView layoutSubviews](&v15, sel_layoutSubviews);
  -[SBPIPStashView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBPIPBackdropView setBounds:](self->_backdropView, "setBounds:");
  -[UIView setBounds:](self->_lightTintView, "setBounds:", v4, v6, v8, v10);
  -[UIView setBounds:](self->_darkTintView, "setBounds:", v4, v6, v8, v10);
  backdropView = self->_backdropView;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  -[SBPIPBackdropView setCenter:](backdropView, "setCenter:", MidX, CGRectGetMidY(v17));
  lightTintView = self->_lightTintView;
  -[SBPIPBackdropView center](self->_backdropView, "center");
  -[UIView setCenter:](lightTintView, "setCenter:");
  darkTintView = self->_darkTintView;
  -[SBPIPBackdropView center](self->_backdropView, "center");
  -[UIView setCenter:](darkTintView, "setCenter:");
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  -[UIImageView setCenter:](self->_leftChevron, "setCenter:", 18.0, CGRectGetMidY(v18));
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  -[UIImageView setCenter:](self->_rightChevron, "setCenter:", v8 + -18.0, CGRectGetMidY(v19));
}

- (void)layoutStashChevrons
{
  UIImageView *leftChevron;
  UIImageView *rightChevron;
  SBPIPBackdropView *backdropView;
  CGAffineTransform *v6;
  UIImageView *v7;
  __int128 v8;
  CGAffineTransform *v9;
  __int128 v10;
  SBPIPBackdropView *v11;
  double stashedTabWidth;
  __int128 v13;
  UIView *lightTintView;
  SBPIPBackdropView *v15;
  UIView *darkTintView;
  SBPIPBackdropView *v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[3];
  _OWORD v24[3];
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;

  if (self->_chevronsHidden)
  {
    leftChevron = self->_leftChevron;
    v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v28.a = *MEMORY[0x1E0C9BAA8];
    v21 = *(_OWORD *)&v28.a;
    *(_OWORD *)&v28.c = v22;
    *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v20 = *(_OWORD *)&v28.tx;
    -[UIImageView setTransform:](leftChevron, "setTransform:", &v28);
    rightChevron = self->_rightChevron;
    *(_OWORD *)&v28.a = v21;
    *(_OWORD *)&v28.c = v22;
    *(_OWORD *)&v28.tx = v20;
    -[UIImageView setTransform:](rightChevron, "setTransform:", &v28);
    backdropView = self->_backdropView;
    *(_OWORD *)&v28.a = v21;
    *(_OWORD *)&v28.c = v22;
    *(_OWORD *)&v28.tx = v20;
    v6 = &v28;
  }
  else
  {
    if (self->_isChevronShownLeft)
    {
      v7 = self->_leftChevron;
      v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v28.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v28.c = v8;
      *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      CGAffineTransformTranslate(&v27, &v28, -30.0, 0.0);
      v9 = &v27;
    }
    else
    {
      v7 = self->_rightChevron;
      v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v28.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v28.c = v10;
      *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      CGAffineTransformTranslate(&v26, &v28, 30.0, 0.0);
      v9 = &v26;
    }
    -[UIImageView setTransform:](v7, "setTransform:", v9);
    v11 = self->_backdropView;
    stashedTabWidth = self->_stashedTabWidth;
    if (self->_isChevronShownLeft)
      stashedTabWidth = -stashedTabWidth;
    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v28.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v28.c = v13;
    *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformTranslate(&v25, &v28, stashedTabWidth, 0.0);
    v6 = &v25;
    backdropView = v11;
  }
  -[SBPIPBackdropView setTransform:](backdropView, "setTransform:", v6);
  lightTintView = self->_lightTintView;
  v15 = self->_backdropView;
  if (v15)
    -[SBPIPBackdropView transform](v15, "transform");
  else
    memset(v24, 0, sizeof(v24));
  -[UIView setTransform:](lightTintView, "setTransform:", v24);
  darkTintView = self->_darkTintView;
  v17 = self->_backdropView;
  if (v17)
    -[SBPIPBackdropView transform](v17, "transform");
  else
    memset(v23, 0, sizeof(v23));
  -[UIView setTransform:](darkTintView, "setTransform:", v23);
  v18 = 0.0;
  v19 = 0.0;
  if (!self->_chevronsHidden)
  {
    v19 = 1.0;
    if (!self->_isChevronShownLeft)
      v19 = 0.0;
  }
  -[UIImageView setAlpha:](self->_leftChevron, "setAlpha:", v19);
  if (!self->_chevronsHidden)
  {
    if (self->_isChevronShownLeft)
      v18 = 0.0;
    else
      v18 = 1.0;
  }
  -[UIImageView setAlpha:](self->_rightChevron, "setAlpha:", v18);
  -[SBPIPBackdropView layoutIfNeeded](self->_backdropView, "layoutIfNeeded");
  -[UIView layoutIfNeeded](self->_lightTintView, "layoutIfNeeded");
  -[UIImageView layoutIfNeeded](self->_leftChevron, "layoutIfNeeded");
  -[UIImageView layoutIfNeeded](self->_rightChevron, "layoutIfNeeded");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPIPStashView;
  -[SBPIPStashView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[SBPIPBackdropView _setContinuousCornerRadius:](self->_backdropView, "_setContinuousCornerRadius:", a3);
  -[UIView _setContinuousCornerRadius:](self->_lightTintView, "_setContinuousCornerRadius:", a3);
  -[UIView _setContinuousCornerRadius:](self->_darkTintView, "_setContinuousCornerRadius:", a3);
}

- (void)setBlurProgress:(double)a3
{
  double v4;
  double v5;
  NSObject *v6;
  double blurProgress;
  int v8;
  double v9;
  __int16 v10;
  double v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_blurProgress != a3)
  {
    self->_blurProgress = a3;
    v4 = fmin(fmax((a3 - self->_startBlurThreshold) / (self->_completeBlurThreshold - self->_startBlurThreshold) + 0.0, 0.0), 1.0);
    v5 = fmin(fmax(v4 * -0.75 + 1.0, 0.25), 1.0);
    -[SBPIPBackdropView setGaussianBlurRadius:](self->_backdropView, "setGaussianBlurRadius:", fmin(fmax(v4 * 15.0 + 0.0, 0.0), 15.0));
    -[SBPIPBackdropView setBackdropScale:](self->_backdropView, "setBackdropScale:", v5);
    if (UIAccessibilityIsReduceTransparencyEnabled())
      -[SBPIPBackdropView setAlpha:](self->_backdropView, "setAlpha:", v4);
    -[UIView setAlpha:](self->_lightTintView, "setAlpha:", v4);
    -[UIView setAlpha:](self->_darkTintView, "setAlpha:", v4);
    SBLogPIP();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      blurProgress = self->_blurProgress;
      v8 = 134218496;
      v9 = blurProgress;
      v10 = 2048;
      v11 = v4;
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[Layout] progress{%.2f} thresholdedProgress{%.2f} backdropScale{%.2f}", (uint8_t *)&v8, 0x20u);
    }

  }
}

- (void)setChevronHidden:(BOOL)a3 left:(BOOL)a4
{
  if (self->_chevronsHidden != a3 || self->_isChevronShownLeft != a4)
  {
    self->_chevronsHidden = a3;
    self->_isChevronShownLeft = a4 & ~a3;
    -[SBPIPStashView layoutStashChevrons](self, "layoutStashChevrons");
  }
}

- (void)resetChevronState
{
  -[SBPIPStashView setChevronHidden:left:](self, "setChevronHidden:left:", 1, 0);
}

- (double)blurProgress
{
  return self->_blurProgress;
}

- (double)stashedTabWidth
{
  return self->_stashedTabWidth;
}

- (void)setStashedTabWidth:(double)a3
{
  self->_stashedTabWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightChevron, 0);
  objc_storeStrong((id *)&self->_leftChevron, 0);
  objc_storeStrong((id *)&self->_darkTintView, 0);
  objc_storeStrong((id *)&self->_lightTintView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)initWithFrame:(NSObject *)a3 settings:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v5, 0xCu);

}

@end

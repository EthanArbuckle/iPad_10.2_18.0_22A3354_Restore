@implementation PGStashView

- (PGStashView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v9;
  PGStashView *v10;
  PGStashView *v11;
  PGBackdropView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  PGBackdropView *v17;
  void *v18;
  void *v19;
  PGBackdropView *backdropView;
  UIView *v21;
  void *v22;
  UIView *darkTintView;
  UIView *v24;
  void *v25;
  UIView *lightTintView;
  void *v27;
  void *v28;
  void *v29;
  UIImageView *v30;
  void *v31;
  UIImageView *leftChevron;
  UIImageView *v33;
  void *v34;
  void *v35;
  UIImageView *v36;
  void *v37;
  UIImageView *rightChevron;
  UIImageView *v39;
  UIView *v41;
  void *v42;
  UIView *v43;
  PGBackdropView *v44;
  objc_super v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  PGLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PGStashView initWithFrame:].cold.1(self, (uint64_t)a2, v9);

  v45.receiver = self;
  v45.super_class = (Class)PGStashView;
  v10 = -[PGStashView initWithFrame:](&v45, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_chevronsHidden = 1;
    -[PGStashView setOverrideUserInterfaceStyle:](v10, "setOverrideUserInterfaceStyle:", 2);
    -[PGStashView setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", CFSTR("PG-StashedView"));
    -[UIView PG_recursivelyDisallowGroupBlending](v11, "PG_recursivelyDisallowGroupBlending");
    -[UIView PG_setAllowsEdgeAntialiasing:](v11, "PG_setAllowsEdgeAntialiasing:", 1);
    -[UIView PG_setAllowsGroupBlending:](v11, "PG_setAllowsGroupBlending:", 0);
    v12 = [PGBackdropView alloc];
    v13 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v17 = -[PGBackdropView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], v14, v15, v16);
    -[UIView PG_setAllowsEdgeAntialiasing:](v17, "PG_setAllowsEdgeAntialiasing:", 1);
    -[PGBackdropView setGaussianBlurRadius:](v17, "setGaussianBlurRadius:", 0.0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGBackdropView setGroupName:](v17, "setGroupName:", v19);

    -[PGStashView addSubview:](v11, "addSubview:", v17);
    backdropView = v11->_backdropView;
    v11->_backdropView = v17;
    v44 = v17;

    v21 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v13, v14, v15, v16);
    -[UIView PG_setAllowsEdgeAntialiasing:](v21, "PG_setAllowsEdgeAntialiasing:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.55);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[UIView setAlpha:](v21, "setAlpha:", 0.0);
    -[PGStashView addSubview:](v11, "addSubview:", v21);
    darkTintView = v11->_darkTintView;
    v11->_darkTintView = v21;
    v43 = v21;

    v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v13, v14, v15, v16);
    -[UIView PG_setAllowsEdgeAntialiasing:](v24, "PG_setAllowsEdgeAntialiasing:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v24, "setBackgroundColor:", v25);

    -[UIView setAlpha:](v24, "setAlpha:", 0.0);
    -[PGStashView addSubview:](v11, "addSubview:", v24);
    lightTintView = v11->_lightTintView;
    v11->_lightTintView = v24;
    v41 = v24;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 30.0, *MEMORY[0x1E0CEB5F8]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v42);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("chevron.compact.left"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "imageWithRenderingMode:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v29);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v30, "setTintColor:", v31);

    -[UIImageView setAlpha:](v30, "setAlpha:", 0.0);
    -[PGStashView addSubview:](v11, "addSubview:", v30);
    leftChevron = v11->_leftChevron;
    v11->_leftChevron = v30;
    v33 = v30;

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("chevron.compact.right"), v27);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "imageWithRenderingMode:", 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v35);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v36, "setTintColor:", v37);

    -[UIImageView setAlpha:](v36, "setAlpha:", 0.0);
    -[PGStashView addSubview:](v11, "addSubview:", v36);
    rightChevron = v11->_rightChevron;
    v11->_rightChevron = v36;
    v39 = v36;

    -[UIImageView PG_updateVibrancyEffectForTintColor](v11->_leftChevron, "PG_updateVibrancyEffectForTintColor");
    -[UIImageView PG_updateVibrancyEffectForTintColor](v11->_rightChevron, "PG_updateVibrancyEffectForTintColor");

  }
  return v11;
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
  PGBackdropView *backdropView;
  double MidX;
  UIView *lightTintView;
  UIView *darkTintView;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v15.receiver = self;
  v15.super_class = (Class)PGStashView;
  -[PGStashView layoutSubviews](&v15, sel_layoutSubviews);
  -[PGStashView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PGBackdropView setBounds:](self->_backdropView, "setBounds:");
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
  -[PGBackdropView setCenter:](backdropView, "setCenter:", MidX, CGRectGetMidY(v17));
  lightTintView = self->_lightTintView;
  -[PGBackdropView center](self->_backdropView, "center");
  -[UIView setCenter:](lightTintView, "setCenter:");
  darkTintView = self->_darkTintView;
  -[PGBackdropView center](self->_backdropView, "center");
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
  PGBackdropView *backdropView;
  CGAffineTransform *v6;
  UIImageView *v7;
  __int128 v8;
  CGAffineTransform *v9;
  __int128 v10;
  PGBackdropView *v11;
  double stashedTabWidth;
  __int128 v13;
  UIView *lightTintView;
  PGBackdropView *v15;
  UIView *darkTintView;
  PGBackdropView *v17;
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
  -[PGBackdropView setTransform:](backdropView, "setTransform:", v6);
  lightTintView = self->_lightTintView;
  v15 = self->_backdropView;
  if (v15)
    -[PGBackdropView transform](v15, "transform");
  else
    memset(v24, 0, sizeof(v24));
  -[UIView setTransform:](lightTintView, "setTransform:", v24);
  darkTintView = self->_darkTintView;
  v17 = self->_backdropView;
  if (v17)
    -[PGBackdropView transform](v17, "transform");
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
  -[PGBackdropView layoutIfNeeded](self->_backdropView, "layoutIfNeeded");
  -[UIView layoutIfNeeded](self->_lightTintView, "layoutIfNeeded");
  -[UIImageView layoutIfNeeded](self->_leftChevron, "layoutIfNeeded");
  -[UIImageView layoutIfNeeded](self->_rightChevron, "layoutIfNeeded");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGStashView;
  -[PGStashView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[PGBackdropView _setContinuousCornerRadius:](self->_backdropView, "_setContinuousCornerRadius:", a3);
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
    v4 = fmin(fmax((a3 + -0.2) / 0.3 + 0.0, 0.0), 1.0);
    v5 = fmin(fmax(v4 * -0.75 + 1.0, 0.25), 1.0);
    -[PGBackdropView setGaussianBlurRadius:](self->_backdropView, "setGaussianBlurRadius:", fmin(fmax(v4 * 15.0 + 0.0, 0.0), 15.0));
    -[PGBackdropView setBackdropScale:](self->_backdropView, "setBackdropScale:", v5);
    if (UIAccessibilityIsReduceTransparencyEnabled())
      -[PGBackdropView setAlpha:](self->_backdropView, "setAlpha:", v4);
    -[UIView setAlpha:](self->_lightTintView, "setAlpha:", v4);
    -[UIView setAlpha:](self->_darkTintView, "setAlpha:", v4);
    PGLogCommon();
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
      _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "[Layout] progress{%.2f} thresholdedProgress{%.2f} backdropScale{%.2f}", (uint8_t *)&v8, 0x20u);
    }

  }
}

- (void)setChevronHidden:(BOOL)a3 left:(BOOL)a4
{
  if (self->_chevronsHidden != a3 || self->_isChevronShownLeft != a4)
  {
    self->_chevronsHidden = a3;
    self->_isChevronShownLeft = a4 & ~a3;
    -[PGStashView layoutStashChevrons](self, "layoutStashChevrons");
  }
}

- (void)resetChevronState
{
  -[PGStashView setChevronHidden:left:](self, "setChevronHidden:left:", 1, 0);
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
}

- (void)initWithFrame:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _PGLogMethodProem(a1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1B0CD6000, a3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v5, 0xCu);

}

@end

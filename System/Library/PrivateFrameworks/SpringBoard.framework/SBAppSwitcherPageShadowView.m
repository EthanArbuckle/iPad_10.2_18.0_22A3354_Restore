@implementation SBAppSwitcherPageShadowView

- (void)setSwitcherCardScale:(double)a3
{
  if (self->_switcherCardScale != a3)
  {
    self->_switcherCardScale = a3;
    -[SBAppSwitcherPageShadowView _applyPrototypeSettingsToConstants](self, "_applyPrototypeSettingsToConstants");
    -[SBAppSwitcherPageShadowView _updateShadowParameters](self, "_updateShadowParameters");
  }
}

- (void)setStyle:(int64_t)a3
{
  void *v6;
  objc_class *v7;
  void *v8;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppSwitcherPageShadowView.m"), 93, CFSTR("%@ shouldn't be created for SBAppSwitcherPageShadowStyleNone"), v8);

  }
  if (self->_style != a3)
  {
    self->_style = a3;
    -[SBAppSwitcherPageShadowView _updateShadowViews](self, "_updateShadowViews");
    -[SBAppSwitcherPageShadowView _applyPrototypeSettingsToConstants](self, "_applyPrototypeSettingsToConstants");
    -[SBAppSwitcherPageShadowView _updateShadowParameters](self, "_updateShadowParameters");
  }
}

- (void)setShadowPath:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shadowPath, a3);
    -[SBAppSwitcherPageShadowView _updateShadowViews](self, "_updateShadowViews");
  }

}

- (void)setShadowOffset:(double)a3
{
  if (self->_shadowOffset != a3)
  {
    self->_shadowOffset = a3;
    -[SBAppSwitcherPageShadowView _updateShadowParameters](self, "_updateShadowParameters");
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAppSwitcherPageShadowView;
  -[SBAppSwitcherPageShadowView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[SBFView _setContinuousCornerRadius:](self->_diffuseShadowView, "_setContinuousCornerRadius:", a3);
  -[SBFView _setContinuousCornerRadius:](self->_rimShadowView, "_setContinuousCornerRadius:", a3);
}

- (SBAppSwitcherPageShadowView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  SBAppSwitcherPageShadowView *v5;
  SBAppSwitcherPageShadowView *v6;
  uint64_t v7;
  SBAppSwitcherSettings *switcherSettings;
  uint64_t v9;
  SBMedusaSettings *medusaSettings;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBAppSwitcherPageShadowView;
  v5 = -[SBAppSwitcherPageShadowView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v5->_switcherCardScale = 1.0;
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    switcherSettings = v6->_switcherSettings;
    v6->_switcherSettings = (SBAppSwitcherSettings *)v7;

    -[PTSettings addKeyObserver:](v6->_switcherSettings, "addKeyObserver:", v6);
    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v9 = objc_claimAutoreleasedReturnValue();
    medusaSettings = v6->_medusaSettings;
    v6->_medusaSettings = (SBMedusaSettings *)v9;

    -[PTSettings addKeyObserver:](v6->_medusaSettings, "addKeyObserver:", v6);
    -[SBFView setAnimatedLayerProperties:](v6, "setAnimatedLayerProperties:", &unk_1E91CDFC0);
    -[SBAppSwitcherPageShadowView layer](v6, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowPathIsBounds:", 1);

    -[SBAppSwitcherPageShadowView _updateShadowViews](v6, "_updateShadowViews");
    -[SBAppSwitcherPageShadowView _applyPrototypeSettingsToConstants](v6, "_applyPrototypeSettingsToConstants");
    -[SBAppSwitcherPageShadowView _updateShadowParameters](v6, "_updateShadowParameters");
  }
  return v6;
}

- (void)setHighlightType:(unint64_t)a3
{
  if (self->_highlightType != a3)
  {
    self->_highlightType = a3;
    -[SBAppSwitcherPageShadowView _updateShadowParameters](self, "_updateShadowParameters");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(a3, "userInterfaceStyle");
  -[SBAppSwitcherPageShadowView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (v4 != v6)
  {
    -[SBAppSwitcherPageShadowView _applyPrototypeSettingsToConstants](self, "_applyPrototypeSettingsToConstants");
    -[SBAppSwitcherPageShadowView _updateShadowParameters](self, "_updateShadowParameters");
  }
}

- (UIView)_diffuseShadowView
{
  return (UIView *)self->_diffuseShadowView;
}

- (UIView)_rimShadowView
{
  return (UIView *)self->_rimShadowView;
}

- (void)_updateShadowViews
{
  double v3;
  double v4;
  SBFView *rimShadowView;
  id v6;
  SBFView *v7;
  SBFView *v8;
  SBFView *v9;
  id v10;
  SBFView *v11;
  SBFView *diffuseShadowView;
  SBFView *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[SBAppSwitcherPageShadowView _continuousCornerRadius](self, "_continuousCornerRadius");
  v4 = v3;
  rimShadowView = self->_rimShadowView;
  if (self->_style == 2)
  {
    if (!rimShadowView)
    {
      v6 = objc_alloc(MEMORY[0x1E0DA9F58]);
      -[SBAppSwitcherPageShadowView bounds](self, "bounds");
      v7 = (SBFView *)objc_msgSend(v6, "initWithFrame:");
      v8 = self->_rimShadowView;
      self->_rimShadowView = v7;

      -[SBFView setAutoresizingMask:](self->_rimShadowView, "setAutoresizingMask:", 18);
      -[SBFView setAnimatedLayerProperties:](self->_rimShadowView, "setAnimatedLayerProperties:", &unk_1E91CDFD8);
      -[SBFView _setContinuousCornerRadius:](self->_rimShadowView, "_setContinuousCornerRadius:", v4);
      -[SBAppSwitcherPageShadowView addSubview:](self, "addSubview:", self->_rimShadowView);
    }
  }
  else if (rimShadowView)
  {
    -[SBFView removeFromSuperview](rimShadowView, "removeFromSuperview");
    v9 = self->_rimShadowView;
    self->_rimShadowView = 0;

  }
  if (!self->_diffuseShadowView)
  {
    v10 = objc_alloc(MEMORY[0x1E0DA9F58]);
    -[SBAppSwitcherPageShadowView bounds](self, "bounds");
    v11 = (SBFView *)objc_msgSend(v10, "initWithFrame:");
    diffuseShadowView = self->_diffuseShadowView;
    self->_diffuseShadowView = v11;

    -[SBFView setAutoresizingMask:](self->_diffuseShadowView, "setAutoresizingMask:", 18);
    -[SBFView setAnimatedLayerProperties:](self->_diffuseShadowView, "setAnimatedLayerProperties:", &unk_1E91CDFF0);
    -[SBFView _setContinuousCornerRadius:](self->_diffuseShadowView, "_setContinuousCornerRadius:", v4);
    -[SBAppSwitcherPageShadowView addSubview:](self, "addSubview:", self->_diffuseShadowView);
  }
  v13 = self->_rimShadowView;
  if (v13)
  {
    -[SBFView layer](v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowPathIsBounds:", self->_shadowPath == 0);

    if (self->_shadowPath)
    {
      -[SBFView layer](self->_rimShadowView, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setShadowPath:", -[UIBezierPath CGPath](self->_shadowPath, "CGPath"));

    }
  }
  -[SBFView layer](self->_diffuseShadowView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShadowPathIsBounds:", self->_shadowPath == 0);

  if (self->_shadowPath)
  {
    -[SBFView layer](self->_diffuseShadowView, "layer");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShadowPath:", -[UIBezierPath CGPath](self->_shadowPath, "CGPath"));

  }
}

- (void)_applyPrototypeSettingsToConstants
{
  void *v3;
  uint64_t v4;
  double v5;
  SBMedusaSettings *medusaSettings;
  double v7;
  double v8;
  SBMedusaSettings *v9;
  double v10;
  double v11;
  CGSize *p_diffuseShadowOffset;
  CGFloat v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  SBMedusaSettings *v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;

  -[SBAppSwitcherPageShadowView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[SBMedusaSettings rimShadowRadius](self->_medusaSettings, "rimShadowRadius");
  self->_rimShadowRadius = v5;
  medusaSettings = self->_medusaSettings;
  if (v4 == 2)
    -[SBMedusaSettings coronaRimShadowOpacity](medusaSettings, "coronaRimShadowOpacity");
  else
    -[SBMedusaSettings rimShadowOpacity](medusaSettings, "rimShadowOpacity");
  self->_rimShadowOpacity = v7;
  switch(self->_style)
  {
    case 2:
      -[SBMedusaSettings diffuseShadowRadius](self->_medusaSettings, "diffuseShadowRadius");
      self->_diffuseShadowRadius = v8;
      v9 = self->_medusaSettings;
      if (v4 == 2)
        -[SBMedusaSettings coronaDiffuseShadowOpacity](v9, "coronaDiffuseShadowOpacity");
      else
        -[SBMedusaSettings diffuseShadowOpacity](v9, "diffuseShadowOpacity");
      self->_diffuseShadowOpacity = v10;
      -[SBMedusaSettings diffuseShadowOffsetHorizontal](self->_medusaSettings, "diffuseShadowOffsetHorizontal");
      v39 = v38;
      -[SBMedusaSettings diffuseShadowOffsetVertical](self->_medusaSettings, "diffuseShadowOffsetVertical");
      self->_diffuseShadowOffset.width = v39;
      self->_diffuseShadowOffset.height = v40;
      -[SBMedusaSettings diffuseShadowRadiusWhileTouched](self->_medusaSettings, "diffuseShadowRadiusWhileTouched");
      self->_diffuseShadowRadiusWhileTouched = v41;
      v42 = self->_medusaSettings;
      if (v4 == 2)
        -[SBMedusaSettings coronaDiffuseShadowOpacityWhileTouched](v42, "coronaDiffuseShadowOpacityWhileTouched");
      else
        -[SBMedusaSettings diffuseShadowOpacityWhileTouched](v42, "diffuseShadowOpacityWhileTouched");
      self->_diffuseShadowOpacityWhileTouched = v43;
      -[SBMedusaSettings diffuseShadowOffsetHorizontalWhileTouched](self->_medusaSettings, "diffuseShadowOffsetHorizontalWhileTouched");
      v45 = v44;
      -[SBMedusaSettings diffuseShadowOffsetVerticalWhileTouched](self->_medusaSettings, "diffuseShadowOffsetVerticalWhileTouched");
      self->_diffuseShadowOffsetWhileTouched.width = v45;
      self->_diffuseShadowOffsetWhileTouched.height = v46;
      break;
    case 3:
      -[SBMedusaSettings switcherShelfCardShadowRadius](self->_medusaSettings, "switcherShelfCardShadowRadius");
      v33 = v32;
      -[SBMedusaSettings switcherShelfCardScale](self->_medusaSettings, "switcherShelfCardScale");
      self->_diffuseShadowRadius = v33 / v34;
      p_diffuseShadowOffset = &self->_diffuseShadowOffset;
      -[SBMedusaSettings switcherShelfCardShadowOffsetY](self->_medusaSettings, "switcherShelfCardShadowOffsetY");
      v36 = v35;
      -[SBMedusaSettings switcherShelfCardScale](self->_medusaSettings, "switcherShelfCardScale");
      self->_diffuseShadowOffset.width = 0.0;
      self->_diffuseShadowOffset.height = v36 / v37;
      -[SBMedusaSettings switcherShelfCardShadowOpacity](self->_medusaSettings, "switcherShelfCardShadowOpacity");
      goto LABEL_11;
    case 4:
      -[SBMedusaSettings switcherPeekingWindowShadowRadius](self->_medusaSettings, "switcherPeekingWindowShadowRadius");
      self->_diffuseShadowRadius = v11;
      p_diffuseShadowOffset = &self->_diffuseShadowOffset;
      -[SBMedusaSettings switcherPeekingWindowShadowOffsetY](self->_medusaSettings, "switcherPeekingWindowShadowOffsetY");
      self->_diffuseShadowOffset.width = 0.0;
      self->_diffuseShadowOffset.height = v13;
      -[SBMedusaSettings switcherPeekingWindowShadowOpacity](self->_medusaSettings, "switcherPeekingWindowShadowOpacity");
LABEL_11:
      self->_diffuseShadowOpacity = v14;
      self->_diffuseShadowRadiusWhileTouched = self->_diffuseShadowRadius;
      self->_diffuseShadowOffsetWhileTouched = *p_diffuseShadowOffset;
      self->_diffuseShadowOpacityWhileTouched = self->_diffuseShadowOpacity;
      break;
    case 5:
      -[SBAppSwitcherSettings chamoisSettings](self->_switcherSettings, "chamoisSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rimShadowOpacity");
      self->_rimShadowOpacity = v16;
      objc_msgSend(v15, "rimShadowRadius");
      self->_rimShadowRadius = v17;
      objc_msgSend(v15, "diffuseShadowOpacity");
      self->_diffuseShadowOpacity = v18;
      objc_msgSend(v15, "diffuseShadowRadius");
      self->_diffuseShadowRadius = v19;
      objc_msgSend(v15, "diffuseShadowOffset");
      self->_diffuseShadowOffset.width = v20;
      self->_diffuseShadowOffset.height = v21;
      self->_diffuseShadowRadiusWhileTouched = self->_diffuseShadowRadius;
      self->_diffuseShadowOffsetWhileTouched = self->_diffuseShadowOffset;
      self->_diffuseShadowOpacityWhileTouched = self->_diffuseShadowOpacity;

      break;
    default:
      -[SBAppSwitcherSettings switcherCardShadowRadius](self->_switcherSettings, "switcherCardShadowRadius");
      self->_diffuseShadowRadius = v22;
      -[SBAppSwitcherSettings switcherCardShadowOpacity](self->_switcherSettings, "switcherCardShadowOpacity");
      self->_diffuseShadowOpacity = v23;
      -[SBAppSwitcherSettings switcherCardShadowOffsetHorizontal](self->_switcherSettings, "switcherCardShadowOffsetHorizontal");
      v25 = v24;
      -[SBAppSwitcherSettings switcherCardShadowOffsetVertical](self->_switcherSettings, "switcherCardShadowOffsetVertical");
      self->_diffuseShadowOffset.width = v25;
      self->_diffuseShadowOffset.height = v26;
      -[SBAppSwitcherSettings switcherCardShadowRadiusWhileTouched](self->_switcherSettings, "switcherCardShadowRadiusWhileTouched");
      self->_diffuseShadowRadiusWhileTouched = v27;
      -[SBAppSwitcherSettings switcherCardShadowOpacityWhileTouched](self->_switcherSettings, "switcherCardShadowOpacityWhileTouched");
      self->_diffuseShadowOpacityWhileTouched = v28;
      -[SBAppSwitcherSettings switcherCardShadowOffsetHorizontalWhileTouched](self->_switcherSettings, "switcherCardShadowOffsetHorizontalWhileTouched");
      v30 = v29;
      -[SBAppSwitcherSettings switcherCardShadowOffsetVerticalWhileTouched](self->_switcherSettings, "switcherCardShadowOffsetVerticalWhileTouched");
      self->_diffuseShadowOffsetWhileTouched.width = v30;
      self->_diffuseShadowOffsetWhileTouched.height = v31;
      break;
  }
  -[SBAppSwitcherSettings cursorHoverShadowRadiusInterpolationAmount](self->_switcherSettings, "cursorHoverShadowRadiusInterpolationAmount");
  self->_diffuseShadowRadiusWhileCursorHovered = v47 * self->_diffuseShadowRadiusWhileTouched
                                               + (1.0 - v47) * self->_diffuseShadowRadius;
  -[SBAppSwitcherSettings cursorHoverShadowOpacityInterpolationAmount](self->_switcherSettings, "cursorHoverShadowOpacityInterpolationAmount");
  self->_diffuseShadowOpacityWhileCursorHovered = v48 * self->_diffuseShadowOpacityWhileTouched
                                                + (1.0 - v48) * self->_diffuseShadowOpacity;
  -[SBAppSwitcherSettings cursorHoverShadowOffsetInterpolationAmount](self->_switcherSettings, "cursorHoverShadowOffsetInterpolationAmount");
  self->_diffuseShadowOffsetWhileCursorHovered = (CGSize)vmlaq_n_f64(vmulq_n_f64((float64x2_t)self->_diffuseShadowOffsetWhileTouched, v49), (float64x2_t)self->_diffuseShadowOffset, 1.0 - v49);
}

- (void)_updateShadowParameters
{
  void *v3;
  void *v4;
  unint64_t highlightType;
  double *v6;
  double diffuseShadowRadiusWhileTouched;
  double diffuseShadowOpacityWhileTouched;
  uint64_t v9;
  double *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  double shadowOffset;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double rimShadowOpacity;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  SBMedusaSettings *medusaSettings;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _OWORD v36[5];
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  -[SBAppSwitcherPageShadowView _diffuseShadowView](self, "_diffuseShadowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherPageShadowView _rimShadowView](self, "_rimShadowView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  highlightType = self->_highlightType;
  v6 = (double *)MEMORY[0x1E0C9D820];
  switch(highlightType)
  {
    case 2uLL:
      diffuseShadowRadiusWhileTouched = self->_diffuseShadowRadiusWhileTouched;
      diffuseShadowOpacityWhileTouched = self->_diffuseShadowOpacityWhileTouched;
      v9 = 544;
      goto LABEL_7;
    case 1uLL:
      diffuseShadowRadiusWhileTouched = self->_diffuseShadowRadiusWhileCursorHovered;
      diffuseShadowOpacityWhileTouched = self->_diffuseShadowOpacityWhileCursorHovered;
      v9 = 576;
      goto LABEL_7;
    case 0uLL:
      diffuseShadowRadiusWhileTouched = self->_diffuseShadowRadius;
      diffuseShadowOpacityWhileTouched = self->_diffuseShadowOpacity;
      v9 = 512;
LABEL_7:
      v10 = (double *)((char *)self + v9);
      goto LABEL_9;
  }
  diffuseShadowOpacityWhileTouched = 0.0;
  v10 = (double *)MEMORY[0x1E0C9D820];
  diffuseShadowRadiusWhileTouched = 0.0;
LABEL_9:
  v12 = *v10;
  v11 = v10[1];
  objc_msgSend(v3, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShadowRadius:", diffuseShadowRadiusWhileTouched);

  objc_msgSend(v3, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = diffuseShadowOpacityWhileTouched;
  objc_msgSend(v14, "setShadowOpacity:", v15);

  v16 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  shadowOffset = self->_shadowOffset;
  if (v16 == 1)
    shadowOffset = -shadowOffset;
  v18 = v12 * shadowOffset;
  objc_msgSend(v3, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShadowOffset:", v18, v11);

  objc_msgSend(v4, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShadowRadius:", self->_rimShadowRadius);

  objc_msgSend(v4, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  rimShadowOpacity = self->_rimShadowOpacity;
  *(float *)&rimShadowOpacity = rimShadowOpacity;
  objc_msgSend(v21, "setShadowOpacity:", rimShadowOpacity);

  objc_msgSend(v4, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setShadowOffset:", *v6, v6[1]);

  if (self->_style == 2
    && (-[SBAppSwitcherPageShadowView traitCollection](self, "traitCollection"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v24, "userInterfaceStyle"),
        v24,
        v25 == 2))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB3B18];
    medusaSettings = self->_medusaSettings;
    if (medusaSettings)
      -[SBMedusaSettings coronaVibrantColorMatrixInput](medusaSettings, "coronaVibrantColorMatrixInput");
    else
      memset(v36, 0, sizeof(v36));
    objc_msgSend(v27, "valueWithCAColorMatrix:", v36);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setValue:forKey:", v31, CFSTR("inputColorMatrix"));

    objc_msgSend(v3, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFilters:", v33);

    objc_msgSend(v4, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFilters:", v35);

  }
  else
  {
    objc_msgSend(v3, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFilters:", 0);

    objc_msgSend(v4, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFilters:", 0);

  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_switcherSettings == a3 || self->_medusaSettings == a3)
  {
    -[SBAppSwitcherPageShadowView _applyPrototypeSettingsToConstants](self, "_applyPrototypeSettingsToConstants");
    -[SBAppSwitcherPageShadowView _updateShadowParameters](self, "_updateShadowParameters");
  }
}

- (double)switcherCardScale
{
  return self->_switcherCardScale;
}

- (int64_t)style
{
  return self->_style;
}

- (unint64_t)highlightType
{
  return self->_highlightType;
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (double)shadowOffset
{
  return self->_shadowOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowPath, 0);
  objc_storeStrong((id *)&self->_rimShadowView, 0);
  objc_storeStrong((id *)&self->_diffuseShadowView, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
}

@end

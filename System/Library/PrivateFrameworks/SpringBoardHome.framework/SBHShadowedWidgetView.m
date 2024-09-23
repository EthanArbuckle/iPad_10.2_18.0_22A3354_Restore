@implementation SBHShadowedWidgetView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SBHShadowedWidgetView)initWithContentView:(id)a3 shadowView:(id)a4 perspectiveEnabled:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  SBHShadowedWidgetView *v10;
  SBHShadowedWidgetView *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SBHShadowedWidgetView;
  v10 = -[SBHShadowedWidgetView init](&v30, sel_init);
  v11 = v10;
  if (v10)
  {
    -[SBHShadowedWidgetView layer](v10, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v24 = v13;
    v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v14 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v21 = *MEMORY[0x1E0CD2610];
    v22 = v15;
    v26 = v14;
    v27 = 0xBF60624DD2F1A9FCLL;
    v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v29 = v16;
    objc_msgSend(v12, "setTransform:", &v21);

    -[SBHShadowedWidgetView setContentView:](v11, "setContentView:", v8);
    -[SBHShadowedWidgetView setShadowView:](v11, "setShadowView:", v9);
    v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v21 = *MEMORY[0x1E0C9BAA8];
    v19 = v21;
    v22 = v20;
    v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v18 = v23;
    -[SBHShadowedWidgetView setContentTransform:](v11, "setContentTransform:", &v21);
    v21 = v19;
    v22 = v20;
    v23 = v18;
    -[SBHShadowedWidgetView setShadowSupplementalTransform:](v11, "setShadowSupplementalTransform:", &v21);
    -[SBHShadowedWidgetView setPerspectiveEnabled:](v11, "setPerspectiveEnabled:", v5);
  }

  return v11;
}

- (void)layoutSubviews
{
  UIView *contentView;
  __int128 v4;
  _OWORD v5[3];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHShadowedWidgetView;
  -[SBHShadowedWidgetView layoutSubviews](&v6, sel_layoutSubviews);
  -[SBHShadowedWidgetView bounds](self, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](self->_contentView, "setCenter:");
  contentView = self->_contentView;
  v4 = *(_OWORD *)&self->_contentTransform.c;
  v5[0] = *(_OWORD *)&self->_contentTransform.a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&self->_contentTransform.tx;
  -[UIView setTransform:](contentView, "setTransform:", v5);
  -[SBHShadowedWidgetView _updateShadowView](self, "_updateShadowView");
  -[SBHShadowedWidgetView _layoutShadowView](self, "_layoutShadowView");
  -[SBHShadowedWidgetView bringSubviewToFront:](self, "bringSubviewToFront:", self->_contentView);
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_contentTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  p_contentTransform = &self->_contentTransform;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->_contentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_contentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_contentTransform->tx = v9;
    *(_OWORD *)&p_contentTransform->a = v8;
    -[SBHShadowedWidgetView setNeedsLayout](self, "setNeedsLayout");
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"))
      -[SBHShadowedWidgetView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setShadowSupplementalTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_shadowSupplementalTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  p_shadowSupplementalTransform = &self->_shadowSupplementalTransform;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_shadowSupplementalTransform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->_shadowSupplementalTransform.a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->_shadowSupplementalTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_shadowSupplementalTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_shadowSupplementalTransform->tx = v9;
    *(_OWORD *)&p_shadowSupplementalTransform->a = v8;
    -[SBHShadowedWidgetView setNeedsLayout](self, "setNeedsLayout");
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"))
      -[SBHShadowedWidgetView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  UIView *v7;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[SBHShadowedWidgetView addSubview:](self, "addSubview:", self->_contentView);
    -[SBHShadowedWidgetView _updateZPositions](self, "_updateZPositions");
    v5 = v7;
  }

}

- (void)setShadowView:(id)a3
{
  UIView *v5;
  UIView **p_shadowView;
  UIView *shadowView;
  UIView *v8;
  __int128 v9;
  _OWORD v10[3];

  v5 = (UIView *)a3;
  p_shadowView = &self->_shadowView;
  shadowView = self->_shadowView;
  if (shadowView != v5)
  {
    -[UIView removeFromSuperview](shadowView, "removeFromSuperview");
    v8 = *p_shadowView;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v10[0] = *MEMORY[0x1E0C9BAA8];
    v10[1] = v9;
    v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIView setTransform:](v8, "setTransform:", v10);
    self->_supportsShadowViewFrameProviding = objc_opt_respondsToSelector() & 1;
    objc_storeStrong((id *)&self->_shadowView, a3);
    -[SBHShadowedWidgetView addSubview:](self, "addSubview:", *p_shadowView);
    -[SBHShadowedWidgetView _updateShadowView](self, "_updateShadowView");
    -[SBHShadowedWidgetView _updateZPositions](self, "_updateZPositions");
  }

}

- (void)setPerspectiveEnabled:(BOOL)a3
{
  if (self->_perspectiveEnabled != a3)
  {
    self->_perspectiveEnabled = a3;
    -[SBHShadowedWidgetView _updateZPositions](self, "_updateZPositions");
  }
  -[SBHShadowedWidgetView _updateShadowView](self, "_updateShadowView");
}

- (void)setCornerRadius:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerRadius = a3;
    -[SBHShadowedWidgetView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", a3);
    -[UIView _setContinuousCornerRadius:](self->_shadowView, "_setContinuousCornerRadius:", a3);
  }
}

- (void)_updateShadowView
{
  unsigned int v3;
  uint64_t v4;

  if (self->_supportsShadowViewFrameProviding)
  {
    v3 = objc_msgSend((id)objc_opt_class(), "supportsMaterialsBasedShadow");
    if (self->_perspectiveEnabled)
      v4 = 0;
    else
      v4 = v3;
    if (-[UIView useMaterialBasedShadow](self->_shadowView, "useMaterialBasedShadow") != (_DWORD)v4)
    {
      -[UIView setUseMaterialBasedShadow:](self->_shadowView, "setUseMaterialBasedShadow:", v4);
      -[SBHShadowedWidgetView setNeedsLayout](self, "setNeedsLayout");
      if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"))
        -[SBHShadowedWidgetView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (void)_layoutShadowView
{
  double v3;
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
  UIView *shadowView;
  int v16;
  UIView *v17;
  UIView *v18;
  __int128 v19;
  __int128 v20;
  UIView *v21;
  CGAffineTransform v22;
  CGAffineTransform t1;
  CGAffineTransform v24;

  -[SBHShadowedWidgetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  UIRectGetCenter();
  v12 = v11;
  v14 = v13;
  shadowView = self->_shadowView;
  if (self->_supportsShadowViewFrameProviding)
  {
    v16 = -[UIView useMaterialBasedShadow](shadowView, "useMaterialBasedShadow");
    v17 = self->_shadowView;
    if (v16)
    {
      -[UIView frame](self->_contentView, "frame");
      -[UIView frameWithContentWithFrame:](v17, "frameWithContentWithFrame:");
      -[UIView setBounds:](self->_shadowView, "setBounds:", 0.0, 0.0);
      v18 = self->_shadowView;
      UIRectGetCenter();
      -[UIView setCenter:](v18, "setCenter:");
      -[UIView setNeedsLayout](self->_shadowView, "setNeedsLayout");
      goto LABEL_6;
    }
    shadowView = self->_shadowView;
  }
  -[UIView setBounds:](shadowView, "setBounds:", v4, v6, v8, v10);
  -[UIView setCenter:](self->_shadowView, "setCenter:", v12, v14);
LABEL_6:
  v19 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&t1.c = v19;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_contentTransform.tx;
  memset(&v24, 0, sizeof(v24));
  v20 = *(_OWORD *)&self->_shadowSupplementalTransform.c;
  *(_OWORD *)&v22.a = *(_OWORD *)&self->_shadowSupplementalTransform.a;
  *(_OWORD *)&v22.c = v20;
  *(_OWORD *)&v22.tx = *(_OWORD *)&self->_shadowSupplementalTransform.tx;
  CGAffineTransformConcat(&v24, &t1, &v22);
  if (self->_perspectiveEnabled)
  {
    v22 = v24;
    CGAffineTransformScale(&t1, &v22, 1.2, 1.2);
    v24 = t1;
  }
  v21 = self->_shadowView;
  t1 = v24;
  -[UIView setTransform:](v21, "setTransform:", &t1);
}

- (void)_updateZPositions
{
  _BOOL4 perspectiveEnabled;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  perspectiveEnabled = self->_perspectiveEnabled;
  -[UIView layer](self->_shadowView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (perspectiveEnabled)
  {
    objc_msgSend(v4, "setZPosition:", -80.0);

    -[UIView layer](self->_contentView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 20.0;
  }
  else
  {
    objc_msgSend(v4, "setZPosition:", 0.0);

    -[UIView layer](self->_contentView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0.0;
  }
  objc_msgSend(v6, "setZPosition:", v8);

  -[SBHShadowedWidgetView setNeedsLayout](self, "setNeedsLayout");
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isPerspectiveEnabled
{
  return self->_perspectiveEnabled;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGAffineTransform)contentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[9].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[9].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[10].a;
  return self;
}

- (CGAffineTransform)shadowSupplementalTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[10].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].a;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end

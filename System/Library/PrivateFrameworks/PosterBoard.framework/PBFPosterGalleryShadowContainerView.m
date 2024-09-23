@implementation PBFPosterGalleryShadowContainerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (PBFPosterGalleryShadowContainerView)initWithContentView:(id)a3 shadowView:(id)a4 perspectiveEnabled:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  PBFPosterGalleryShadowContainerView *v10;
  PBFPosterGalleryShadowContainerView *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PBFPosterGalleryShadowContainerView;
  v10 = -[PBFPosterGalleryShadowContainerView init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    -[PBFPosterGalleryShadowContainerView setContentView:](v10, "setContentView:", v8);
    -[PBFPosterGalleryShadowContainerView setShadowView:](v11, "setShadowView:", v9);
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v16 = *MEMORY[0x1E0C9BAA8];
    v14 = v16;
    v17 = v15;
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v13 = v18;
    -[PBFPosterGalleryShadowContainerView setContentTransform:](v11, "setContentTransform:", &v16);
    v16 = v14;
    v17 = v15;
    v18 = v13;
    -[PBFPosterGalleryShadowContainerView setShadowSupplementalTransform:](v11, "setShadowSupplementalTransform:", &v16);
    -[PBFPosterGalleryShadowContainerView setPerspectiveEnabled:](v11, "setPerspectiveEnabled:", v5);
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
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *contentView;
  __int128 v16;
  _OWORD v17[3];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PBFPosterGalleryShadowContainerView;
  -[PBFPosterGalleryShadowContainerView layoutSubviews](&v18, sel_layoutSubviews);
  -[PBFPosterGalleryShadowContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  UIRectGetCenter();
  v12 = v11;
  v14 = v13;
  -[UIView setBounds:](self->_contentView, "setBounds:", v4, v6, v8, v10);
  -[UIView setCenter:](self->_contentView, "setCenter:", v12, v14);
  contentView = self->_contentView;
  v16 = *(_OWORD *)&self->_contentTransform.c;
  v17[0] = *(_OWORD *)&self->_contentTransform.a;
  v17[1] = v16;
  v17[2] = *(_OWORD *)&self->_contentTransform.tx;
  -[UIView setTransform:](contentView, "setTransform:", v17);
  -[PBFPosterGalleryShadowContainerView _layoutShadowView](self, "_layoutShadowView");
  -[PBFPosterGalleryShadowContainerView bringSubviewToFront:](self, "bringSubviewToFront:", self->_contentView);
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
    -[PBFPosterGalleryShadowContainerView setNeedsLayout](self, "setNeedsLayout");
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
      -[PBFPosterGalleryShadowContainerView layoutIfNeeded](self, "layoutIfNeeded");
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
    -[PBFPosterGalleryShadowContainerView setNeedsLayout](self, "setNeedsLayout");
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
      -[PBFPosterGalleryShadowContainerView layoutIfNeeded](self, "layoutIfNeeded");
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
    -[PBFPosterGalleryShadowContainerView addSubview:](self, "addSubview:", self->_contentView);
    -[PBFPosterGalleryShadowContainerView _updateZPositions](self, "_updateZPositions");
    v5 = v7;
  }

}

- (void)setShadowView:(id)a3
{
  PBFShadowMetricsProviding *v5;
  PBFShadowMetricsProviding **p_shadowView;
  PBFShadowMetricsProviding *shadowView;
  PBFShadowMetricsProviding *v8;
  __int128 v9;
  _OWORD v10[3];

  v5 = (PBFShadowMetricsProviding *)a3;
  p_shadowView = &self->_shadowView;
  shadowView = self->_shadowView;
  if (shadowView != v5)
  {
    -[PBFShadowMetricsProviding removeFromSuperview](shadowView, "removeFromSuperview");
    v8 = *p_shadowView;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v10[0] = *MEMORY[0x1E0C9BAA8];
    v10[1] = v9;
    v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[PBFShadowMetricsProviding setTransform:](v8, "setTransform:", v10);
    objc_storeStrong((id *)&self->_shadowView, a3);
    -[PBFPosterGalleryShadowContainerView addSubview:](self, "addSubview:", *p_shadowView);
    -[PBFPosterGalleryShadowContainerView _updateShadowView](self, "_updateShadowView");
    -[PBFPosterGalleryShadowContainerView _updateZPositions](self, "_updateZPositions");
  }

}

- (void)setPerspectiveEnabled:(BOOL)a3
{
  if (self->_perspectiveEnabled != a3)
  {
    self->_perspectiveEnabled = a3;
    -[PBFPosterGalleryShadowContainerView _updateZPositions](self, "_updateZPositions");
  }
  -[PBFPosterGalleryShadowContainerView _updateShadowView](self, "_updateShadowView");
}

- (void)_updateShadowView
{
  -[PBFPosterGalleryShadowContainerView setNeedsLayout](self, "setNeedsLayout");
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
    -[PBFPosterGalleryShadowContainerView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_layoutShadowView
{
  PBFShadowMetricsProviding *shadowView;
  PBFShadowMetricsProviding *v4;
  __int128 v5;
  __int128 v6;
  PBFShadowMetricsProviding *v7;
  CGAffineTransform v8;
  CGAffineTransform t1;
  CGAffineTransform v10;

  shadowView = self->_shadowView;
  -[UIView frame](self->_contentView, "frame");
  -[PBFShadowMetricsProviding frameWithContentWithFrame:](shadowView, "frameWithContentWithFrame:");
  -[PBFShadowMetricsProviding setBounds:](self->_shadowView, "setBounds:", 0.0, 0.0);
  v4 = self->_shadowView;
  UIRectGetCenter();
  -[PBFShadowMetricsProviding setCenter:](v4, "setCenter:");
  -[PBFShadowMetricsProviding setNeedsLayout](self->_shadowView, "setNeedsLayout");
  v5 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_contentTransform.tx;
  memset(&v10, 0, sizeof(v10));
  v6 = *(_OWORD *)&self->_shadowSupplementalTransform.c;
  *(_OWORD *)&v8.a = *(_OWORD *)&self->_shadowSupplementalTransform.a;
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = *(_OWORD *)&self->_shadowSupplementalTransform.tx;
  CGAffineTransformConcat(&v10, &t1, &v8);
  if (self->_perspectiveEnabled)
  {
    v8 = v10;
    CGAffineTransformScale(&t1, &v8, 1.2, 1.2);
    v10 = t1;
  }
  v7 = self->_shadowView;
  t1 = v10;
  -[PBFShadowMetricsProviding setTransform:](v7, "setTransform:", &t1);
}

- (void)_updateZPositions
{
  uint64_t v3;
  _BOOL4 perspectiveEnabled;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[5];
  uint64_t v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;

  v3 = MEMORY[0x1E0CD2610];
  perspectiveEnabled = self->_perspectiveEnabled;
  -[PBFShadowMetricsProviding layer](self->_shadowView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (perspectiveEnabled)
  {
    objc_msgSend(v5, "setZPosition:", -80.0);

    -[UIView layer](self->_contentView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setZPosition:", 20.0);
    v8 = 0xBF60624DD2F1A9FCLL;
  }
  else
  {
    v8 = *(_QWORD *)(v3 + 88);
    objc_msgSend(v5, "setZPosition:", 0.0);

    -[UIView layer](self->_contentView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setZPosition:", 0.0);
  }

  -[PBFPosterGalleryShadowContainerView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)(v3 + 48);
  v13[2] = *(_OWORD *)(v3 + 32);
  v13[3] = v10;
  v13[4] = *(_OWORD *)(v3 + 64);
  v14 = *(_QWORD *)(v3 + 80);
  v11 = *(_OWORD *)(v3 + 16);
  v13[0] = *(_OWORD *)v3;
  v13[1] = v11;
  v15 = v8;
  v12 = *(_OWORD *)(v3 + 112);
  v16 = *(_OWORD *)(v3 + 96);
  v17 = v12;
  objc_msgSend(v9, "setTransform:", v13);

  -[PBFPosterGalleryShadowContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (PBFShadowMetricsProviding)shadowView
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

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
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

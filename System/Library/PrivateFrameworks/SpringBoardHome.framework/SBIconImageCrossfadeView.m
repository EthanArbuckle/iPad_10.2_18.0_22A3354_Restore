@implementation SBIconImageCrossfadeView

- (void)setPerformsTrueCrossfade:(BOOL)a3
{
  self->_performsTrueCrossfade = a3;
}

- (void)setCrossfadeStyle:(unint64_t)a3
{
  if (self->_crossfadeStyle != a3)
  {
    self->_crossfadeStyle = a3;
    -[SBIconImageCrossfadeView setNeedsLayout](self, "setNeedsLayout");
    -[SBIconImageCrossfadeView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)_updateCornerMask
{
  -[SBIconImageCrossfadeView _setCornerRadiusEnabled:](self, "_setCornerRadiusEnabled:", self->_masksCorners);
  if (!self->_masksCorners)
    -[SBIconImageCrossfadeView _applyCornerRadius:](self, "_applyCornerRadius:", 0.0);
}

- (void)_setCornerRadiusEnabled:(BOOL)a3
{
  SBCrossfadingIconImageSource *iconImageSource;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  iconImageSource = self->_iconImageSource;
  if (a3)
  {
    -[SBCrossfadingIconImageSource setShowsSquareCorners:](iconImageSource, "setShowsSquareCorners:", 1);
    -[SBIconImageCrossfadeView containerView](self, "containerView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1;
  }
  else
  {
    -[SBCrossfadingIconImageSource setShowsSquareCorners:](iconImageSource, "setShowsSquareCorners:");
    -[SBIconImageCrossfadeView containerView](self, "containerView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
  }
  objc_msgSend(v5, "setMasksToBounds:", v7);

}

- (void)setStretchAnchorPoint:(CGPoint)a3
{
  CGPoint *p_stretchAnchorPoint;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  p_stretchAnchorPoint = &self->_stretchAnchorPoint;
  self->_stretchAnchorPoint = a3;
  -[SBIconImageCrossfadeView containerView](self, "containerView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v13, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAnchorPoint:", p_stretchAnchorPoint->x, p_stretchAnchorPoint->y);

  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)_applyCornerRadius:(double)a3
{
  id v4;

  -[SBIconImageCrossfadeView containerView](self, "containerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setContinuousCornerRadius:", a3);

}

- (UIView)containerView
{
  return self->_containerView;
}

- (SBIconImageCrossfadeView)initWithSource:(id)a3 crossfadeView:(id)a4
{
  id v7;
  id v8;
  SBIconImageCrossfadeView *v9;
  objc_class *v10;
  UIView *v11;
  UIView *containerView;
  uint64_t v13;
  UIView *iconImageView;
  uint64_t v15;
  UIView *backgroundView;
  id v17;
  uint64_t v18;
  UIView *crossfadeContainerView;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBIconImageCrossfadeView;
  v9 = -[SBIconImageCrossfadeView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v9)
  {
    v10 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_containerViewClass");
    v11 = (UIView *)objc_alloc_init(v10);
    containerView = v9->_containerView;
    v9->_containerView = v11;

    -[SBIconImageCrossfadeView addSubview:](v9, "addSubview:", v9->_containerView);
    objc_storeStrong((id *)&v9->_iconImageSource, a3);
    -[SBCrossfadingIconImageSource sourceView](v9->_iconImageSource, "sourceView");
    v13 = objc_claimAutoreleasedReturnValue();
    iconImageView = v9->_iconImageView;
    v9->_iconImageView = (UIView *)v13;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBCrossfadingIconImageSource sourceBackgroundView:](v9->_iconImageSource, "sourceBackgroundView:", v9->_iconImageView);
      v15 = objc_claimAutoreleasedReturnValue();
      backgroundView = v9->_backgroundView;
      v9->_backgroundView = (UIView *)v15;

      if (v9->_backgroundView)
        -[UIView addSubview:](v9->_containerView, "addSubview:");
    }
    -[UIView addSubview:](v9->_containerView, "addSubview:", v9->_iconImageView);
    v17 = [v10 alloc];
    objc_msgSend(v8, "bounds");
    v18 = objc_msgSend(v17, "initWithFrame:");
    crossfadeContainerView = v9->_crossfadeContainerView;
    v9->_crossfadeContainerView = (UIView *)v18;

    -[UIView addSubview:](v9->_containerView, "addSubview:", v9->_crossfadeContainerView);
    objc_storeStrong((id *)&v9->_crossfadeView, a4);
    -[UIView addSubview:](v9->_crossfadeContainerView, "addSubview:", v9->_crossfadeView);
  }

  return v9;
}

+ (Class)_containerViewClass
{
  return (Class)objc_opt_self();
}

- (void)setAppSnapshotCornerRadius:(double)a3
{
  if (-[SBIconImageCrossfadeView masksCorners](self, "masksCorners"))
    -[SBIconImageCrossfadeView _applyCornerRadius:](self, "_applyCornerRadius:", a3);
}

- (BOOL)masksCorners
{
  return self->_masksCorners;
}

- (void)setMorphFraction:(double)a3
{
  if (self->_morphFraction != a3)
  {
    self->_morphFraction = a3;
    -[SBIconImageCrossfadeView setNeedsLayout](self, "setNeedsLayout");
    -[SBIconImageCrossfadeView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setCrossfadeViewFadeFraction:(double)a3
{
  -[UIView setAlpha:](self->_crossfadeView, "setAlpha:", a3);
}

- (void)setCrossfadeFraction:(double)a3
{
  -[SBIconImageCrossfadeView setSourceFadeFraction:](self, "setSourceFadeFraction:");
  -[SBIconImageCrossfadeView setCrossfadeViewFadeFraction:](self, "setCrossfadeViewFadeFraction:", a3);
}

- (void)setSourceFadeFraction:(double)a3
{
  double v4;

  if (self->_performsTrueCrossfade)
  {
    v4 = 1.0 - a3;
    -[UIView setAlpha:](self->_iconImageView, "setAlpha:", 1.0 - a3);
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v4);
  }
}

- (void)cleanup
{
  UIView *crossfadeView;
  __int128 v4;
  _OWORD v5[3];

  -[UIView setAlpha:](self->_iconImageView, "setAlpha:", 1.0);
  -[SBCrossfadingIconImageSource setShowsSquareCorners:](self->_iconImageSource, "setShowsSquareCorners:", 0);
  -[UIView setAlpha:](self->_crossfadeView, "setAlpha:", 1.0);
  crossfadeView = self->_crossfadeView;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](crossfadeView, "setTransform:", v5);
}

- (void)setMasksCorners:(BOOL)a3
{
  int v4;

  if (self->_masksCorners != a3)
  {
    if (a3)
    {
      -[SBCrossfadingIconImageSource continuousCornerRadius](self->_iconImageSource, "continuousCornerRadius");
      v4 = BSFloatIsZero() ^ 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
    self->_masksCorners = v4;
    -[SBIconImageCrossfadeView _updateCornerMask](self, "_updateCornerMask");
  }
}

- (void)prepareGeometry
{
  UIView *backgroundView;
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

  backgroundView = self->_backgroundView;
  -[UIView bounds](self->_iconImageView, "bounds");
  -[UIView setFrame:](backgroundView, "setFrame:");
  -[SBCrossfadingIconImageSource visibleBounds](self->_iconImageSource, "visibleBounds");
  v5 = v4;
  v7 = v6;
  -[UIView bounds](self->_crossfadeView, "bounds");
  if (v8 == 0.0)
    v10 = 0.0;
  else
    v10 = v5 / v8;
  if (v9 == 0.0)
    v11 = 0.0;
  else
    v11 = v7 / v9;
  -[SBIconImageCrossfadeView _applyCrossfadeScaleX:scaleY:](self, "_applyCrossfadeScaleX:scaleY:", v10, v11);
  self->_containerScaleY = 1.0;
  self->_containerScaleX = 1.0;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    if (v10 >= v11)
    {
      v13 = v10 / v11;
      if (v11 == 0.0)
        v13 = 0.0;
      self->_containerScaleY = v13;
    }
    else
    {
      v12 = v11 / v10;
      if (v10 == 0.0)
        v12 = 0.0;
      self->_containerScaleX = v12;
    }
  }
}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double morphFraction;
  CGFloat v11;
  CGFloat v12;
  void *v13;
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
  UIView *backgroundView;
  double v26;
  double d;
  double b;
  double v29;
  UIView *iconImageView;
  void *v31;
  void *v32;
  double v33;
  double v34;
  unint64_t crossfadeStyle;
  double v36;
  double v37;
  UIView *v38;
  void *v39;
  void *v40;
  double v41;
  UIView *crossfadeContainerView;
  UIView *v43;
  UIView *crossfadeView;
  double v45;
  double v46;
  CGFloat v47;
  CGRect rect;
  __int128 v49;
  __int128 v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  objc_super v53;
  CGRect v54;

  v53.receiver = self;
  v53.super_class = (Class)SBIconImageCrossfadeView;
  -[SBIconImageCrossfadeView layoutSubviews](&v53, sel_layoutSubviews);
  -[SBIconImageCrossfadeView bounds](self, "bounds");
  rect.origin.y = v3;
  -[SBCrossfadingIconImageSource visibleBounds](self->_iconImageSource, "visibleBounds");
  v47 = v5;
  rect.origin.x = v4;
  v7 = v6;
  v9 = v8;
  morphFraction = self->_morphFraction;
  v11 = 1.0 - morphFraction * (1.0 - self->_containerScaleX);
  v12 = 1.0 - morphFraction * (1.0 - self->_containerScaleY);
  memset(&v52, 0, sizeof(v52));
  CGAffineTransformMakeScale(&v52, v11, v12);
  -[UIView layer](self->_containerView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "anchorPoint");
  v15 = v14;
  v17 = v16;

  UIRectGetCenter();
  v45 = 1.0 - v11;
  v46 = v11;
  v19 = v18 + (1.0 - v11) * (v15 + -0.5) * v7;
  v21 = v20 + (1.0 - v12) * (v17 + -0.5) * v9;
  v22 = v7 * v11;
  v23 = v12;
  v24 = v9 * v12;
  -[UIView setFrame:](self->_containerView, "setFrame:", v19 + v22 * -0.5, v21 + v9 * v12 * -0.5, v22, v9 * v12);
  backgroundView = self->_backgroundView;
  -[UIView bounds](self->_containerView, "bounds");
  -[UIView setFrame:](backgroundView, "setFrame:");
  v54.origin.x = rect.origin.x;
  v54.origin.y = v47;
  v54.size.width = v7;
  v54.size.height = v9;
  if (CGRectGetWidth(v54) <= 0.0)
    v26 = 1.0;
  else
    v26 = rect.origin.y / v7;
  CGAffineTransformMakeScale(&v51, v26, v26);
  d = v51.d;
  b = v51.b;
  v29 = v24 * v51.c + v51.a * v22;
  iconImageView = self->_iconImageView;
  -[UIView bounds](self->_containerView, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](iconImageView, "setCenter:");
  if (v29 > 0.0 && v24 * d + b * v22 > 0.0)
    -[UIView setBounds:](self->_iconImageView, "setBounds:", 0.0, 0.0, v29);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBCrossfadingIconImageSource alternateContentsLayer](self->_iconImageSource, "alternateContentsLayer");
  else
    -[UIView layer](self->_iconImageView, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scale");
  v34 = v33;

  objc_msgSend(v31, "setContentsScale:", v34);
  crossfadeStyle = self->_crossfadeStyle;
  if (crossfadeStyle == 1)
  {
    -[UIView setContentMode:](self->_iconImageView, "setContentMode:", 1);
    v38 = self->_iconImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v38, "setBackgroundColor:", v39);

  }
  else if (!crossfadeStyle)
  {
    v36 = v46;
    if (v46 <= v23)
    {
      v37 = 0.0;
      v36 = 1.0;
      if (v46 < v23)
      {
        v40 = v31;
        v41 = v23;
LABEL_18:
        objc_msgSend(v40, "setContentsRect:", v37, 0.0, v36, v41);
        goto LABEL_19;
      }
    }
    else
    {
      v37 = v45 * 0.5;
    }
    v41 = 1.0;
    v40 = v31;
    goto LABEL_18;
  }
LABEL_19:
  crossfadeContainerView = self->_crossfadeContainerView;
  -[UIView bounds](self->_containerView, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](crossfadeContainerView, "setCenter:");
  v43 = self->_crossfadeContainerView;
  rect.size = *(CGSize *)&v52.a;
  v49 = *(_OWORD *)&v52.c;
  v50 = *(_OWORD *)&v52.tx;
  -[UIView setTransform:](v43, "setTransform:", &rect.size);
  crossfadeView = self->_crossfadeView;
  -[UIView bounds](self->_crossfadeContainerView, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](crossfadeView, "setCenter:");

}

- (void)_applyCrossfadeScaleX:(double)a3 scaleY:(double)a4
{
  UIView *crossfadeView;
  CGAffineTransform v6;
  CGAffineTransform v7;

  memset(&v7, 0, sizeof(v7));
  CGAffineTransformMakeScale(&v7, a3, a4);
  crossfadeView = self->_crossfadeView;
  v6 = v7;
  -[UIView setTransform:](crossfadeView, "setTransform:", &v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_crossfadeView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_iconImageSource, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (BOOL)performsTrueCrossfade
{
  return self->_performsTrueCrossfade;
}

- (CGPoint)stretchAnchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_stretchAnchorPoint.x;
  y = self->_stretchAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (unint64_t)crossfadeStyle
{
  return self->_crossfadeStyle;
}

- (SBCrossfadingIconImageSource)iconImageSource
{
  return self->_iconImageSource;
}

- (UIView)iconImageView
{
  return self->_iconImageView;
}

- (UIView)crossfadeView
{
  return self->_crossfadeView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)crossfadeContainerView
{
  return self->_crossfadeContainerView;
}

- (double)morphFraction
{
  return self->_morphFraction;
}

@end

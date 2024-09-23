@implementation SBContinuousExposeStripTongueView

- (SBContinuousExposeStripTongueView)initWithFrame:(CGRect)a3
{
  SBContinuousExposeStripTongueView *v3;
  SBContinuousExposeStripTongueView *v4;
  unint64_t v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  uint64_t v9;
  UIView *tongueContainerView;
  void *v11;
  uint64_t v12;
  _UIBackdropView *backdropView;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIView *tongueMaskView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  UIImageView *chevronImageView;
  UIImageView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UITapGestureRecognizer *tapGestureRecognizer;
  _OWORD v34[5];
  objc_super v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)SBContinuousExposeStripTongueView;
  v3 = -[SBContinuousExposeStripTongueView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_attributes.state = SBSwitcherContinuousExposeStripTongueAttributesNone();
    v4->_attributes.direction = v5;
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("SlideOverTongueMask"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v4->_bitmapMaskSize.width = v7;
    v4->_bitmapMaskSize.height = v8;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, v4->_bitmapMaskSize.width, v4->_bitmapMaskSize.height);
    tongueContainerView = v4->_tongueContainerView;
    v4->_tongueContainerView = (UIView *)v9;

    -[UIView layer](v4->_tongueContainerView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAnchorPoint:", 1.0, 0.5);

    -[SBContinuousExposeStripTongueView addSubview:](v4, "addSubview:", v4->_tongueContainerView);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", -2);
    backdropView = v4->_backdropView;
    v4->_backdropView = (_UIBackdropView *)v12;

    -[_UIBackdropView inputSettings](v4->_backdropView, "inputSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBlurRadius:", 0.0);

    -[_UIBackdropView inputSettings](v4->_backdropView, "inputSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setScale:", 1.0);

    -[_UIBackdropView inputSettings](v4->_backdropView, "inputSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackdropVisible:", 1);

    -[_UIBackdropView setGroupName:](v4->_backdropView, "setGroupName:", CFSTR("SBContinuousExposeStripTongueBackdropName"));
    -[UIView addSubview:](v4->_tongueContainerView, "addSubview:", v4->_backdropView);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v6);
    tongueMaskView = v4->_tongueMaskView;
    v4->_tongueMaskView = (UIView *)v17;

    -[UIView setContentMode:](v4->_tongueMaskView, "setContentMode:", 0);
    -[UIView layer](v4->_tongueMaskView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);

    -[UIView addSubview:](v4->_tongueContainerView, "addSubview:", v4->_tongueMaskView);
    v20 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 44.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "systemImageNamed:withConfiguration:", CFSTR("chevron.compact.left"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v22);
    chevronImageView = v4->_chevronImageView;
    v4->_chevronImageView = (UIImageView *)v23;

    -[UIImageView setSemanticContentAttribute:](v4->_chevronImageView, "setSemanticContentAttribute:", 3);
    v25 = v4->_chevronImageView;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v25, "setTintColor:", v26);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = xmmword_1D0E8BEE0;
    v34[3] = unk_1D0E8BEF0;
    v34[4] = xmmword_1D0E8BF00;
    v34[0] = xmmword_1D0E8BEC0;
    v34[1] = unk_1D0E8BED0;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setValue:forKey:", v28, CFSTR("inputColorMatrix"));

    -[UIImageView layer](v4->_chevronImageView, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFilters:", v30);

    -[UIView addSubview:](v4->_tongueContainerView, "addSubview:", v4->_chevronImageView);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v4, sel__handleTap_);
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v31;

    -[UIView addGestureRecognizer:](v4->_tongueContainerView, "addGestureRecognizer:", v4->_tapGestureRecognizer);
    -[SBContinuousExposeStripTongueView setIsAccessibilityElement:](v4, "setIsAccessibilityElement:", 1);
    -[SBContinuousExposeStripTongueView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("continuous-expose-strip-tongue"));

  }
  return v4;
}

- (void)setAttributes:(SBSwitcherContinuousExposeStripTongueAttributes)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t state;
  SBSwitcherContinuousExposeStripTongueAttributes *p_attributes;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id location;

  v4 = a4;
  state = a3.state;
  p_attributes = &self->_attributes;
  v8 = self->_attributes.state;
  self->_attributes = a3;
  +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatingSwitcherSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != state)
  {
    if (v4)
    {
      if (p_attributes->state == 1)
        objc_msgSend(v10, "tongueExpandedToCollapsedAnimationSettings");
      else
        objc_msgSend(v10, "tongueCollapsedToExpandedAnimationSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 3;
    }
    else
    {
      v11 = 0;
      v12 = 2;
    }
    self->_animating = 1;
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E0CEABB0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__SBContinuousExposeStripTongueView_setAttributes_animated___block_invoke;
    v16[3] = &unk_1E8E9DED8;
    v16[4] = self;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__SBContinuousExposeStripTongueView_setAttributes_animated___block_invoke_2;
    v14[3] = &unk_1E8EC0958;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v13, "sb_animateWithSettings:mode:animations:completion:", v11, v12, v16, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

uint64_t __60__SBContinuousExposeStripTongueView_setAttributes_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateSubviewLayoutForCollapsedOrExpandedState");
  return objc_msgSend(*(id *)(a1 + 32), "_updateSubviewOpacityForCollapsedOrExpandedState");
}

void __60__SBContinuousExposeStripTongueView_setAttributes_animated___block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained;
  id v4;
  _QWORD *v5;

  if ((a3 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      *((_BYTE *)WeakRetained + 472) = 0;
      v5 = WeakRetained;
      v4 = objc_loadWeakRetained((id *)WeakRetained + 60);
      objc_msgSend(v4, "continuousExposeStripTongueView:didFinishAnimatingToState:", v5, v5[61]);

      WeakRetained = v5;
    }

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBContinuousExposeStripTongueView;
  -[SBContinuousExposeStripTongueView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBContinuousExposeStripTongueView _updateContainerPosition](self, "_updateContainerPosition");
  -[SBContinuousExposeStripTongueView _updateContainerTransform](self, "_updateContainerTransform");
  -[SBContinuousExposeStripTongueView _updateSubviewLayoutForCollapsedOrExpandedState](self, "_updateSubviewLayoutForCollapsedOrExpandedState");
}

- (void)_updateContainerPosition
{
  unint64_t direction;
  double v4;
  double v5;
  double v6;

  direction = self->_attributes.direction;
  -[SBContinuousExposeStripTongueView bounds](self, "bounds");
  v6 = 0.0;
  if (direction != 1)
    v6 = v4;
  -[UIView setCenter:](self->_tongueContainerView, "setCenter:", v6, v5 * 0.5);
}

- (void)_updateContainerTransform
{
  unint64_t direction;
  __int128 v4;
  UIView *tongueContainerView;
  CGAffineTransform v6;
  CGAffineTransform v7;

  direction = self->_attributes.direction;
  memset(&v7, 0, sizeof(v7));
  if (direction == 2)
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v7.c = v4;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v7, -1.0, 1.0);
  }
  tongueContainerView = self->_tongueContainerView;
  v6 = v7;
  -[UIView setTransform:](tongueContainerView, "setTransform:", &v6);
}

- (void)_updateSubviewLayoutForCollapsedOrExpandedState
{
  __int128 v3;
  _UIBackdropView *backdropView;
  UIView *tongueMaskView;
  UIImageView *chevronImageView;
  double width;
  double v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  memset(&v10, 0, sizeof(v10));
  if (self->_attributes.state == 1)
  {
    CGAffineTransformMakeScale(&v10, 0.0, 1.0);
  }
  else
  {
    v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v10.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v10.c = v3;
    *(_OWORD *)&v10.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  backdropView = self->_backdropView;
  v9 = v10;
  -[_UIBackdropView setTransform:](backdropView, "setTransform:", &v9);
  tongueMaskView = self->_tongueMaskView;
  v9 = v10;
  -[UIView setTransform:](tongueMaskView, "setTransform:", &v9);
  chevronImageView = self->_chevronImageView;
  v9 = v10;
  -[UIImageView setTransform:](chevronImageView, "setTransform:", &v9);
  if (self->_attributes.state == 1)
    width = self->_bitmapMaskSize.width;
  else
    width = self->_bitmapMaskSize.width * 0.5;
  v8 = floor(self->_bitmapMaskSize.height * 0.5);
  -[_UIBackdropView setCenter:](self->_backdropView, "setCenter:", width, v8);
  -[UIView setCenter:](self->_tongueMaskView, "setCenter:", width, v8);
  -[UIImageView setCenter:](self->_chevronImageView, "setCenter:", width, v8);
}

- (void)_updateSubviewOpacityForCollapsedOrExpandedState
{
  double v2;

  v2 = 0.0;
  if (self->_attributes.state == 2)
    v2 = 1.0;
  -[UIImageView setAlpha:](self->_chevronImageView, "setAlpha:", v2);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  SBContinuousExposeStripTongueView *v6;
  UIView *tongueContainerView;
  id v8;

  y = a3.y;
  x = a3.x;
  v6 = self;
  tongueContainerView = self->_tongueContainerView;
  v8 = a4;
  -[SBContinuousExposeStripTongueView convertPoint:toView:](v6, "convertPoint:toView:", tongueContainerView, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](tongueContainerView, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (void)_handleTap:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "continuousExposeStripTongueViewTapped:", self);

}

- (SBContinuousExposeStripTongueViewDelegate)delegate
{
  return (SBContinuousExposeStripTongueViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBSwitcherContinuousExposeStripTongueAttributes)attributes
{
  SBSwitcherContinuousExposeStripTongueAttributes *p_attributes;
  unint64_t state;
  unint64_t direction;
  SBSwitcherContinuousExposeStripTongueAttributes result;

  p_attributes = &self->_attributes;
  state = self->_attributes.state;
  direction = p_attributes->direction;
  result.direction = direction;
  result.state = state;
  return result;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_tongueMaskView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_tongueContainerView, 0);
}

@end

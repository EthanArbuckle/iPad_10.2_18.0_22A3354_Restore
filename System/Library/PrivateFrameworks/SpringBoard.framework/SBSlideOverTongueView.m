@implementation SBSlideOverTongueView

- (SBSlideOverTongueView)initWithFrame:(CGRect)a3
{
  SBSlideOverTongueView *v3;
  SBSlideOverTongueView *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  UIView *tongueContainerView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  MTMaterialView *materialView;
  uint64_t v16;
  UIView *tongueMaskView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIImageView *chevronImageView;
  UIImageView *v24;
  void *v25;
  uint64_t v26;
  UITapGestureRecognizer *tapGestureRecognizer;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SBSlideOverTongueView;
  v3 = -[SBSlideOverTongueView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_direction = 0;
    v3->_state = 0;
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("SlideOverTongueMask"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    v4->_bitmapMaskSize.width = v6;
    v4->_bitmapMaskSize.height = v7;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, v4->_bitmapMaskSize.width, v4->_bitmapMaskSize.height);
    tongueContainerView = v4->_tongueContainerView;
    v4->_tongueContainerView = (UIView *)v8;

    -[UIView layer](v4->_tongueContainerView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAnchorPoint:", 1.0, 0.5);

    -[SBSlideOverTongueView addSubview:](v4, "addSubview:", v4->_tongueContainerView);
    _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D47498];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", v11, v13, 0, 0, 1.0);
    v14 = objc_claimAutoreleasedReturnValue();
    materialView = v4->_materialView;
    v4->_materialView = (MTMaterialView *)v14;

    -[MTMaterialView setFrame:](v4->_materialView, "setFrame:", 0.0, 0.0, v4->_bitmapMaskSize.width, v4->_bitmapMaskSize.height);
    -[UIView addSubview:](v4->_tongueContainerView, "addSubview:", v4->_materialView);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v5);
    tongueMaskView = v4->_tongueMaskView;
    v4->_tongueMaskView = (UIView *)v16;

    -[UIView setContentMode:](v4->_tongueMaskView, "setContentMode:", 0);
    -[UIView layer](v4->_tongueMaskView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);

    -[UIView addSubview:](v4->_tongueContainerView, "addSubview:", v4->_tongueMaskView);
    v19 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 44.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "systemImageNamed:withConfiguration:", CFSTR("chevron.compact.left"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v21);
    chevronImageView = v4->_chevronImageView;
    v4->_chevronImageView = (UIImageView *)v22;

    -[UIImageView setSemanticContentAttribute:](v4->_chevronImageView, "setSemanticContentAttribute:", 3);
    v24 = v4->_chevronImageView;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v24, "setTintColor:", v25);

    -[UIView addSubview:](v4->_tongueContainerView, "addSubview:", v4->_chevronImageView);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v4, sel__handleTap_);
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v26;

    -[UIView addGestureRecognizer:](v4->_tongueContainerView, "addGestureRecognizer:", v4->_tapGestureRecognizer);
    -[SBSlideOverTongueView setIsAccessibilityElement:](v4, "setIsAccessibilityElement:", 1);
    -[SBSlideOverTongueView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("slide-over-tongue"));

  }
  return v4;
}

- (void)setDirection:(unint64_t)a3 state:(unint64_t)a4 animated:(BOOL)a5
{
  unint64_t direction;
  unint64_t state;
  _BOOL4 v8;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];

  direction = self->_direction;
  state = self->_state;
  if (direction != a3 || state != a4)
  {
    v8 = a5;
    self->_direction = a3;
    self->_state = a4;
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatingSwitcherSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (direction != a3)
    {
      v14 = (void *)MEMORY[0x1E0D01908];
      objc_msgSend(v13, "tongueContainerPositionAnimationSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "BSAnimationSettings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __53__SBSlideOverTongueView_setDirection_state_animated___block_invoke;
      v25[3] = &unk_1E8E9DED8;
      v25[4] = self;
      objc_msgSend(v14, "animateWithSettings:actions:", v16, v25);

      v17 = (void *)MEMORY[0x1E0D01908];
      objc_msgSend(v13, "tongueContainerTransformAnimationSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "BSAnimationSettings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __53__SBSlideOverTongueView_setDirection_state_animated___block_invoke_2;
      v24[3] = &unk_1E8E9DED8;
      v24[4] = self;
      objc_msgSend(v17, "animateWithSettings:actions:", v19, v24);

    }
    if (state != a4)
    {
      if (v8)
      {
        if (self->_state)
          objc_msgSend(v13, "tongueCollapsedToExpandedAnimationSettings");
        else
          objc_msgSend(v13, "tongueExpandedToCollapsedAnimationSettings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 3;
      }
      else
      {
        v20 = 0;
        v21 = 2;
      }
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __53__SBSlideOverTongueView_setDirection_state_animated___block_invoke_3;
      v23[3] = &unk_1E8E9DED8;
      v23[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", v20, v21, v23, 0);

    }
    -[SBSlideOverTongueView setAccessibilityValue:](self, "setAccessibilityValue:", 0);
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      if (a3 != 2)
      {
        if (a3 != 1)
          goto LABEL_24;
        goto LABEL_22;
      }
    }
    else
    {
      if (a3 == 2)
      {
LABEL_22:
        v22 = CFSTR("Right side view");
        goto LABEL_23;
      }
      if (a3 != 1)
      {
LABEL_24:

        return;
      }
    }
    v22 = CFSTR("Left side view");
LABEL_23:
    -[SBSlideOverTongueView setAccessibilityValue:](self, "setAccessibilityValue:", v22);
    goto LABEL_24;
  }
}

uint64_t __53__SBSlideOverTongueView_setDirection_state_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContainerPosition");
}

uint64_t __53__SBSlideOverTongueView_setDirection_state_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContainerTransform");
}

uint64_t __53__SBSlideOverTongueView_setDirection_state_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSubviewCollapsedExpandedState");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSlideOverTongueView;
  -[SBSlideOverTongueView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBSlideOverTongueView _updateContainerPosition](self, "_updateContainerPosition");
  -[SBSlideOverTongueView _updateContainerTransform](self, "_updateContainerTransform");
  -[SBSlideOverTongueView _updateSubviewCollapsedExpandedState](self, "_updateSubviewCollapsedExpandedState");
}

- (void)_updateContainerPosition
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v3 = self->_direction != 1;
  else
    v3 = self->_direction == 1;
  -[SBSlideOverTongueView bounds](self, "bounds");
  v6 = 0.0;
  if (!v3)
    v6 = v4;
  -[UIView setCenter:](self->_tongueContainerView, "setCenter:", v6, v5 * 0.5);
}

- (void)_updateContainerTransform
{
  uint64_t v3;
  unint64_t direction;
  __int128 v5;
  UIView *tongueContainerView;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v3 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  direction = self->_direction;
  memset(&v8, 0, sizeof(v8));
  if (v3 != 1)
  {
    if (direction == 1)
      goto LABEL_3;
LABEL_5:
    CGAffineTransformMakeScale(&v8, -1.0, 1.0);
    goto LABEL_6;
  }
  if (direction == 1)
    goto LABEL_5;
LABEL_3:
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v8.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v8.c = v5;
  *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
LABEL_6:
  tongueContainerView = self->_tongueContainerView;
  v7 = v8;
  -[UIView setTransform:](tongueContainerView, "setTransform:", &v7);
}

- (void)_updateSubviewCollapsedExpandedState
{
  __int128 v3;
  MTMaterialView *materialView;
  UIView *tongueMaskView;
  UIImageView *chevronImageView;
  double width;
  double v8;
  double v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  memset(&v11, 0, sizeof(v11));
  if (self->_state)
  {
    v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v11.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v11.c = v3;
    *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v11, 0.0, 1.0);
  }
  materialView = self->_materialView;
  v10 = v11;
  -[MTMaterialView setTransform:](materialView, "setTransform:", &v10);
  tongueMaskView = self->_tongueMaskView;
  v10 = v11;
  -[UIView setTransform:](tongueMaskView, "setTransform:", &v10);
  chevronImageView = self->_chevronImageView;
  v10 = v11;
  -[UIImageView setTransform:](chevronImageView, "setTransform:", &v10);
  if (self->_state)
    width = self->_bitmapMaskSize.width * 0.5;
  else
    width = self->_bitmapMaskSize.width;
  v8 = floor(self->_bitmapMaskSize.height * 0.5);
  -[MTMaterialView setCenter:](self->_materialView, "setCenter:", width, v8);
  -[UIView setCenter:](self->_tongueMaskView, "setCenter:", width, v8);
  -[UIImageView setCenter:](self->_chevronImageView, "setCenter:", width, v8);
  v9 = 0.0;
  if (self->_state == 1)
    v9 = 1.0;
  -[UIImageView setAlpha:](self->_chevronImageView, "setAlpha:", v9);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  UIView *tongueContainerView;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSlideOverTongueView;
  if (-[SBSlideOverTongueView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else
  {
    tongueContainerView = self->_tongueContainerView;
    -[SBSlideOverTongueView convertPoint:toView:](self, "convertPoint:toView:", tongueContainerView, x, y);
    v8 = -[UIView pointInside:withEvent:](tongueContainerView, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (void)_handleTap:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "slideOverTongueViewTapped:", self);

}

- (SBSlideOverTongueViewDelegate)delegate
{
  return (SBSlideOverTongueViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)direction
{
  return self->_direction;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_tongueMaskView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_tongueContainerView, 0);
}

@end

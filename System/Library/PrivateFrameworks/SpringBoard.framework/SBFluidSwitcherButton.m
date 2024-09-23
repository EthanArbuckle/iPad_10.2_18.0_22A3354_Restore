@implementation SBFluidSwitcherButton

- (SBFluidSwitcherButton)initWithFrame:(CGRect)a3
{
  SBFluidSwitcherButton *v3;
  id v4;
  uint64_t v5;
  UIImageView *glyphImageView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBFluidSwitcherButton;
  v3 = -[SBFluidSwitcherButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    glyphImageView = v3->_glyphImageView;
    v3->_glyphImageView = (UIImageView *)v5;

    -[UIImageView setContentMode:](v3->_glyphImageView, "setContentMode:", 4);
    -[SBFluidSwitcherButton addSubview:](v3, "addSubview:", v3->_glyphImageView);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v3);
    -[SBFluidSwitcherButton addInteraction:](v3, "addInteraction:", v7);

  }
  return v3;
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage **p_image;
  UIImage *v7;

  v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[UIImageView setImage:](self->_glyphImageView, "setImage:", *p_image);
    -[UIImageView sizeToFit](self->_glyphImageView, "sizeToFit");
    -[UIImageView setImage:](self->_xPlusDView, "setImage:", *p_image);
    -[SBFluidSwitcherButton setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setBackdropGroupName:(id)a3
{
  NSString **p_backdropGroupName;
  void *v6;
  id v7;

  p_backdropGroupName = &self->_backdropGroupName;
  v7 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backdropGroupName, a3);
    -[SBFluidSwitcherButton _backgroundMaterialView](self, "_backgroundMaterialView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGroupNameBase:", *p_backdropGroupName);

  }
}

- (void)setButtonStyle:(int64_t)a3
{
  void *v6;

  if ((unint64_t)a3 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherButton.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(buttonStyle == SBSwitcherPlusButtonStyleVibrant) || (buttonStyle == SBSwitcherPlusButtonStyleMuted)"));

  }
  if (self->_buttonStyle != a3)
  {
    self->_buttonStyle = a3;
    -[SBFluidSwitcherButton _invalidateBackgroundView](self, "_invalidateBackgroundView");
    -[SBFluidSwitcherButton _invalidateXPlusDView](self, "_invalidateXPlusDView");
    -[SBFluidSwitcherButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[SBFluidSwitcherButton bounds](self, "bounds", a4);
  top = self->_extendedEdgeInsets.top;
  left = self->_extendedEdgeInsets.left;
  v15.origin.x = v9 + left;
  v15.origin.y = v10 + top;
  v15.size.width = v11 - (left + self->_extendedEdgeInsets.right);
  v15.size.height = v12 - (top + self->_extendedEdgeInsets.bottom);
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
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
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBFluidSwitcherButton;
  -[SBFluidSwitcherButton layoutSubviews](&v19, sel_layoutSubviews);
  -[SBFluidSwitcherButton _configureGlyphImageViewIfNecessaryForStyle:](self, "_configureGlyphImageViewIfNecessaryForStyle:", self->_buttonStyle);
  -[SBFluidSwitcherButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView frame](self->_glyphImageView, "frame");
  UIRectCenteredIntegralRectScale();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIImageView setFrame:](self->_glyphImageView, "setFrame:", 0);
  -[SBFluidSwitcherButton _configureXPlusDViewIfNecessaryForStyle:](self, "_configureXPlusDViewIfNecessaryForStyle:", self->_buttonStyle);
  -[UIImageView setFrame:](self->_xPlusDView, "setFrame:", v12, v14, v16, v18);
  -[SBFluidSwitcherButton _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v10 * 0.5);
  -[SBFluidSwitcherButton _configureBackgroundViewIfNecessaryForStyle:](self, "_configureBackgroundViewIfNecessaryForStyle:", self->_buttonStyle);
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", v10 * 0.5);
  -[UIView setFrame:](self->_highlightView, "setFrame:", v4, v6, v8, v10);
  -[UIView _setContinuousCornerRadius:](self->_highlightView, "_setContinuousCornerRadius:", v10 * 0.5);
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  id v5;

  -[SBFluidSwitcherButton superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBFluidSwitcherButton _backgroundMaterialView](self, "_backgroundMaterialView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualStylingProviderForCategory:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "automaticallyUpdateView:withStyle:", self->_glyphImageView, 0);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v5 = -[SBFluidSwitcherButton isHighlighted](self, "isHighlighted");
  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherButton;
  -[SBFluidSwitcherButton setHighlighted:](&v7, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[SBFluidSwitcherButton _addHighlightViewIfNecessary](self, "_addHighlightViewIfNecessary");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__SBFluidSwitcherButton_setHighlighted___block_invoke;
    v6[3] = &unk_1E8E9DED8;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0x20000, v6, 0, 0.19, 0.0);
  }
}

uint64_t __40__SBFluidSwitcherButton_setHighlighted___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  int v3;
  double v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[61];
  v3 = objc_msgSend(v1, "isHighlighted");
  v4 = 0.466666667;
  if (!v3)
    v4 = 0.0;
  return objc_msgSend(v2, "setAlpha:", v4);
}

- (void)_addHighlightViewIfNecessary
{
  _QWORD v2[5];

  if (!self->_highlightView)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __53__SBFluidSwitcherButton__addHighlightViewIfNecessary__block_invoke;
    v2[3] = &unk_1E8E9DED8;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v2);
  }
}

uint64_t __53__SBFluidSwitcherButton__addHighlightViewIfNecessary__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 488);
  *(_QWORD *)(v3 + 488) = v2;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", *MEMORY[0x1E0CD2EC0]);

  objc_msgSend(*(id *)(a1 + 32), "insertSubview:aboveSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 488), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  SBFluidSwitcherButton *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (SBFluidSwitcherButton *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1)
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "numberOfTapsRequired");

  if (v6 != 1)
  {
LABEL_7:
    v7 = 1;
    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v6 = (void *)MEMORY[0x1E0CEA870];
  v7 = a5;
  -[SBFluidSwitcherButton bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc_init(MEMORY[0x1E0CEA8B8]);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:parameters:", self, v5);
  objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_backgroundMaterialView
{
  UIView *backgroundView;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    backgroundView = self->_backgroundView;
  else
    backgroundView = 0;
  return backgroundView;
}

- (void)_invalidateBackgroundView
{
  void *v3;
  void *v4;
  UIView *backgroundView;

  if (self->_backgroundView)
  {
    -[SBFluidSwitcherButton _backgroundMaterialView](self, "_backgroundMaterialView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "visualStylingProviderForCategory:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAutomaticallyUpdatingView:", self->_glyphImageView);

    -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;

  }
}

- (void)_configureBackgroundViewIfNecessaryForStyle:(int64_t)a3
{
  id *p_backgroundView;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  p_backgroundView = (id *)&self->_backgroundView;
  if (!self->_backgroundView)
  {
    if (a3 == 1)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
      v9 = *p_backgroundView;
      *p_backgroundView = v8;

      v10 = *p_backgroundView;
      objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v11);

      objc_msgSend(*p_backgroundView, "setUserInteractionEnabled:", 0);
    }
    else if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 52);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_backgroundView, v5);
      objc_msgSend(v5, "setGroupNameBase:", self->_backdropGroupName);
      -[SBFluidSwitcherButton superview](self, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v5, "visualStylingProviderForCategory:", 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "automaticallyUpdateView:withStyle:", self->_glyphImageView, 0);

      }
    }
    -[SBFluidSwitcherButton insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_backgroundView, 0);
  }
}

- (void)_invalidateXPlusDView
{
  UIImageView *xPlusDView;
  UIImageView *v4;

  xPlusDView = self->_xPlusDView;
  if (xPlusDView)
  {
    -[UIImageView removeFromSuperview](xPlusDView, "removeFromSuperview");
    v4 = self->_xPlusDView;
    self->_xPlusDView = 0;

  }
}

- (void)_configureXPlusDViewIfNecessaryForStyle:(int64_t)a3
{
  UIImageView *v4;
  UIImageView *xPlusDView;
  void *v6;
  void *v7;

  if (!a3 && !self->_xPlusDView)
  {
    v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", self->_image);
    xPlusDView = self->_xPlusDView;
    self->_xPlusDView = v4;

    -[UIImageView setContentMode:](self->_xPlusDView, "setContentMode:", 4);
    -[UIImageView layer](self->_xPlusDView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompositingFilter:", v7);

    -[UIImageView setAlpha:](self->_xPlusDView, "setAlpha:", 0.3);
    -[SBFluidSwitcherButton addSubview:](self, "addSubview:", self->_xPlusDView);
  }
}

- (void)_configureGlyphImageViewIfNecessaryForStyle:(int64_t)a3
{
  UIImageView *glyphImageView;
  void *v5;
  id v6;

  glyphImageView = self->_glyphImageView;
  if (a3 == 1)
  {
    -[UIImageView tintColor](glyphImageView, "tintColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((BSEqualObjects() & 1) == 0)
      -[UIImageView setTintColor:](self->_glyphImageView, "setTintColor:", v5);

  }
  else
  {
    -[UIImageView setTintColor:](glyphImageView, "setTintColor:", 0);
  }
}

- (UIImage)image
{
  return self->_image;
}

- (UIEdgeInsets)extendedEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_extendedEdgeInsets.top;
  left = self->_extendedEdgeInsets.left;
  bottom = self->_extendedEdgeInsets.bottom;
  right = self->_extendedEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setExtendedEdgeInsets:(UIEdgeInsets)a3
{
  self->_extendedEdgeInsets = a3;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_xPlusDView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end

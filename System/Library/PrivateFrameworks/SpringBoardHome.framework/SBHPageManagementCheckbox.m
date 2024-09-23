@implementation SBHPageManagementCheckbox

- (SBHPageManagementCheckbox)initWithFrame:(CGRect)a3 checkboxDiameter:(double)a4 backgroundView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  SBHPageManagementCheckbox *v13;
  SBHPageManagementCheckbox *v14;
  UIView *v15;
  UIView *highlightView;
  UIView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIImageView *customImageView;
  void *v26;
  objc_super v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)SBHPageManagementCheckbox;
  v13 = -[SBHPageManagementCheckbox initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_checkboxDiameter = a4;
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    highlightView = v14->_highlightView;
    v14->_highlightView = v15;

    v17 = v14->_highlightView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.431372549, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[UIView setAlpha:](v14->_highlightView, "setAlpha:", 0.0);
    -[UIView _setCornerRadius:](v14->_highlightView, "_setCornerRadius:", a4 * 0.5);
    -[UIView layer](v14->_highlightView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCompositingFilter:", *MEMORY[0x1E0CD2BD0]);

    -[UIView bs_setHitTestingDisabled:](v14->_highlightView, "bs_setHitTestingDisabled:", 1);
    -[SBHPageManagementCheckbox insertSubview:atIndex:](v14, "insertSubview:atIndex:", v14->_highlightView, 1);
    if (v12)
    {
      objc_storeStrong((id *)&v14->_backgroundView, a5);
      -[SBHPageManagementCheckbox insertSubview:atIndex:](v14, "insertSubview:atIndex:", v12, 0);
      objc_msgSend(v12, "_setCornerRadius:", a4 * 0.5);
    }
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageWithTintColor:renderingMode:", v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v23);
    customImageView = v14->_customImageView;
    v14->_customImageView = (UIImageView *)v24;

    -[UIImageView setAlpha:](v14->_customImageView, "setAlpha:", 0.0);
    -[SBHPageManagementCheckbox addSubview:](v14, "addSubview:", v14->_customImageView);
    -[SBHPageManagementCheckbox layer](v14, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAllowsGroupBlending:", 0);

    -[SBHPageManagementCheckbox setAccessibilityIdentifier:](v14, "setAccessibilityIdentifier:", CFSTR("toggle page hidden checkbox"));
  }

  return v14;
}

- (SBHPageManagementCheckbox)initWithFrame:(CGRect)a3
{
  return -[SBHPageManagementCheckbox initWithFrame:checkboxDiameter:backgroundView:](self, "initWithFrame:checkboxDiameter:backgroundView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 10.0);
}

- (void)layoutSubviews
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
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
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SBHPageManagementCheckbox;
  -[SBHPageManagementCheckbox layoutSubviews](&v29, sel_layoutSubviews);
  -[SBHPageManagementCheckbox sendSubviewToBack:](self, "sendSubviewToBack:", self->_highlightView);
  if (self->_backgroundView)
    -[SBHPageManagementCheckbox sendSubviewToBack:](self, "sendSubviewToBack:");
  v3 = -[SBHPageManagementCheckbox isEnabled](self, "isEnabled");
  -[SBHPageManagementCheckbox bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBHPageManagementCheckbox configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentInsets");
  v17 = SBHDirectionalEdgeInsetsInsetRect(-[SBHPageManagementCheckbox effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), v5, v7, v9, v11, v13, v14, v15, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[UIView setFrame:](self->_backgroundView, "setFrame:", v17, v19, v21, v23);
  -[UIView setFrame:](self->_highlightView, "setFrame:", v17, v19, v21, v23);
  -[SBHPageManagementCheckbox effectiveHighlightAlpha](self, "effectiveHighlightAlpha");
  -[UIView setAlpha:](self->_highlightView, "setAlpha:");
  -[SBHPageManagementCheckbox updateDeselectedMaskState](self, "updateDeselectedMaskState");
  -[SBHPageManagementCheckbox customImageView](self, "customImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHPageManagementCheckbox effectiveImageAlpha](self, "effectiveImageAlpha");
  v26 = v25;
  UIRectGetCenter();
  objc_msgSend(v24, "setCenter:");
  objc_msgSend(v24, "alpha");
  if (v26 != v27)
    objc_msgSend(v24, "setAlpha:", v26);
  v28 = 0.5;
  if (v3)
    v28 = 1.0;
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v28);

}

- (double)effectiveImageAlpha
{
  int v3;
  int v4;
  double result;

  v3 = -[SBHPageManagementCheckbox isEnabled](self, "isEnabled");
  v4 = -[SBHPageManagementCheckbox isSelected](self, "isSelected");
  result = 0.5;
  if (v3 | v4 ^ 1)
    result = 0.0;
  if ((v3 & v4) != 0)
    return 1.0;
  return result;
}

- (double)effectiveHighlightAlpha
{
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  int v7;
  double result;
  double v9;

  v3 = -[SBHPageManagementCheckbox isSelected](self, "isSelected");
  v4 = -[SBHPageManagementCheckbox isHighlighted](self, "isHighlighted");
  -[SBHPageManagementCheckbox traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (v6 == 2)
    v7 = v3;
  else
    v7 = 1;
  result = 0.85;
  if ((v4 & (v6 == 2)) == 0)
    result = 0.5;
  v9 = 0.35;
  if (v7)
    v9 = 0.0;
  if (!v4)
    return v9;
  return result;
}

- (CALayer)deselectedMask
{
  CALayer *deselectedMask;
  double v4;
  double v5;
  CGPath *Mutable;
  CALayer *v7;
  CALayer *v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  deselectedMask = self->_deselectedMask;
  if (!deselectedMask)
  {
    -[SBHPageManagementCheckbox checkboxDiameter](self, "checkboxDiameter");
    v5 = v4;
    Mutable = CGPathCreateMutable();
    v10.origin.x = 0.0;
    v10.origin.y = 0.0;
    v10.size.width = v5;
    v10.size.height = v5;
    CGPathAddEllipseInRect(Mutable, 0, v10);
    v11.origin.x = 0.0;
    v11.origin.y = 0.0;
    v11.size.width = v5;
    v11.size.height = v5;
    v12 = CGRectInset(v11, 3.0, 3.0);
    CGPathAddEllipseInRect(Mutable, 0, v12);
    v7 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    -[CALayer setBounds:](v7, "setBounds:", 0.0, 0.0, v5, v5);
    -[CALayer setPosition:](v7, "setPosition:", v5 * 0.5, v5 * 0.5);
    -[CALayer setPath:](v7, "setPath:", Mutable);
    -[CALayer setFillRule:](v7, "setFillRule:", *MEMORY[0x1E0CD2B70]);
    CGPathRelease(Mutable);
    v8 = self->_deselectedMask;
    self->_deselectedMask = v7;

    deselectedMask = self->_deselectedMask;
  }
  return deselectedMask;
}

- (void)updateDeselectedMaskState
{
  void *v3;
  id v4;

  if ((-[SBHPageManagementCheckbox isSelected](self, "isSelected") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[SBHPageManagementCheckbox deselectedMask](self, "deselectedMask");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[SBHPageManagementCheckbox layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMask:", v4);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBHPageManagementCheckbox;
  -[SBHPageManagementCheckbox setHighlighted:](&v6, sel_setHighlighted_);
  if (v3)
  {
    -[UIView setAlpha:](self->_highlightView, "setAlpha:", 0.5);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__SBHPageManagementCheckbox_setHighlighted___block_invoke;
    v5[3] = &unk_1E8D84C50;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v5, 0, 0.2, 0.0);
  }
}

uint64_t __44__SBHPageManagementCheckbox_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 776), "setAlpha:", 0.0);
}

- (void)setSelected:(BOOL)a3
{
  -[SBHPageManagementCheckbox setSelected:animated:](self, "setSelected:animated:", a3, 1);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  SBHPageManagementCheckbox *v17;
  double v18;
  double v19;
  objc_super v20;

  v4 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBHPageManagementCheckbox;
  -[SBHPageManagementCheckbox setSelected:](&v20, sel_setSelected_, a3);
  -[SBHPageManagementCheckbox customImageView](self, "customImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHPageManagementCheckbox effectiveImageAlpha](self, "effectiveImageAlpha");
  v8 = v7;
  -[SBHPageManagementCheckbox effectiveHighlightAlpha](self, "effectiveHighlightAlpha");
  v10 = v9;
  if (v4)
  {
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __50__SBHPageManagementCheckbox_setSelected_animated___block_invoke;
    v15 = &unk_1E8D86930;
    v16 = v6;
    v17 = self;
    v18 = v8;
    v19 = v10;
    objc_msgSend(v11, "animateWithDuration:delay:options:animations:completion:", 2, &v12, 0, 0.2, 0.0);
    -[SBHPageManagementCheckbox updateDeselectedMaskState](self, "updateDeselectedMaskState", v12, v13, v14, v15);

  }
  else
  {
    objc_msgSend(v6, "setAlpha:", v8);
    -[UIView setAlpha:](self->_highlightView, "setAlpha:", v10);
    -[SBHPageManagementCheckbox updateDeselectedMaskState](self, "updateDeselectedMaskState");
  }

}

uint64_t __50__SBHPageManagementCheckbox_setSelected_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 776), "setAlpha:", *(double *)(a1 + 56));
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SBHPageManagementCheckbox checkboxDiameter](self, "checkboxDiameter");
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHPageManagementCheckbox;
  -[SBHPageManagementCheckbox _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[SBHPageManagementCheckbox effectiveHighlightAlpha](self, "effectiveHighlightAlpha");
  -[UIView setAlpha:](self->_highlightView, "setAlpha:");
}

- (double)checkboxDiameter
{
  return self->_checkboxDiameter;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (UIImageView)customImageView
{
  return self->_customImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customImageView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_deselectedMask, 0);
}

@end

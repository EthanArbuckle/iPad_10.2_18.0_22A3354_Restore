@implementation UIKBFloatingKeyView

- (UIKBFloatingKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  UIKBFloatingKeyView *v5;
  _UIKBFloatingContentView *v6;
  uint64_t v7;
  _UIFloatingContentView *floatingContentView;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIKBFloatingKeyView;
  v5 = -[UIKBContainerKeyView initWithFrame:keyplane:key:](&v11, sel_initWithFrame_keyplane_key_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = [_UIKBFloatingContentView alloc];
    v7 = -[_UIFloatingContentView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    floatingContentView = v5->_floatingContentView;
    v5->_floatingContentView = (_UIFloatingContentView *)v7;

    -[_UIFloatingContentView setCornerRadius:](v5->_floatingContentView, "setCornerRadius:", 6.0);
    -[_UIFloatingContentView setAsymmetricFocusedSizeIncrease:](v5->_floatingContentView, "setAsymmetricFocusedSizeIncrease:", 10.0, 10.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:](v5->_floatingContentView, "setContentMotionRotation:translation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 6.0, 3.0);
    -[_UIFloatingContentView set_disableOutsetShadowPath:](v5->_floatingContentView, "set_disableOutsetShadowPath:", 1);
    -[_UIFloatingContentView setShadowRadius:](v5->_floatingContentView, "setShadowRadius:", 12.0);
    -[_UIFloatingContentView setShadowVerticalOffset:](v5->_floatingContentView, "setShadowVerticalOffset:", 25.0);
    -[_UIFloatingContentView setShadowOpacity:](v5->_floatingContentView, "setShadowOpacity:", 0.1);
    -[UIView insertSubview:atIndex:](v5, "insertSubview:atIndex:", v5->_floatingContentView, 0);
    -[UIKBContainerKeyView contentsKeyView](v5, "contentsKeyView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v5, "addSubview:", v9);

  }
  return v5;
}

- (UIKBFloatingKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 renderTraits:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  UIKBFloatingKeyView *v14;
  _UIKBFloatingContentView *v15;
  uint64_t v16;
  _UIFloatingContentView *floatingContentView;
  _UIFloatingContentView *v18;
  _UIFloatingContentView *v19;
  _UIFloatingContentView *v20;
  _UIFloatingContentView *v21;
  _UIFloatingContentView *v22;
  void *v23;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)UIKBFloatingKeyView;
  v14 = -[UIKBContainerKeyView initWithFrame:keyplane:key:](&v25, sel_initWithFrame_keyplane_key_, a4, a5, x, y, width, height);
  if (v14)
  {
    v15 = [_UIKBFloatingContentView alloc];
    v16 = -[_UIFloatingContentView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    floatingContentView = v14->_floatingContentView;
    v14->_floatingContentView = (_UIFloatingContentView *)v16;

    v18 = v14->_floatingContentView;
    objc_msgSend(v13, "floatingContentViewCornerRadius");
    -[_UIFloatingContentView setCornerRadius:](v18, "setCornerRadius:");
    -[_UIFloatingContentView setContinuousCornerEnabled:](v14->_floatingContentView, "setContinuousCornerEnabled:", 0);
    -[_UIFloatingContentView setShadowExpansion:](v14->_floatingContentView, "setShadowExpansion:", -4.0, -4.0);
    v19 = v14->_floatingContentView;
    objc_msgSend(v13, "floatingContentViewFocusedIncreaseSize");
    -[_UIFloatingContentView setAsymmetricFocusedSizeIncrease:](v19, "setAsymmetricFocusedSizeIncrease:");
    -[_UIFloatingContentView setContentMotionRotation:translation:](v14->_floatingContentView, "setContentMotionRotation:translation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 6.0, 3.0);
    -[_UIFloatingContentView set_disableOutsetShadowPath:](v14->_floatingContentView, "set_disableOutsetShadowPath:", 1);
    v20 = v14->_floatingContentView;
    objc_msgSend(v13, "floatingContentViewShadowRadius");
    -[_UIFloatingContentView setShadowRadius:](v20, "setShadowRadius:");
    v21 = v14->_floatingContentView;
    objc_msgSend(v13, "floatingContentViewShadowVerticalOffset");
    -[_UIFloatingContentView setShadowVerticalOffset:](v21, "setShadowVerticalOffset:");
    v22 = v14->_floatingContentView;
    objc_msgSend(v13, "floatingContentViewShadowOpacity");
    -[_UIFloatingContentView setShadowOpacity:](v22, "setShadowOpacity:");
    -[UIView insertSubview:atIndex:](v14, "insertSubview:atIndex:", v14->_floatingContentView, 0);
    -[UIKBContainerKeyView contentsKeyView](v14, "contentsKeyView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v14, "addSubview:", v23);

  }
  return v14;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKBFloatingKeyView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[_UIFloatingContentView setFrame:](self->_floatingContentView, "setFrame:");
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void)prepareForDisplay
{
  void *v3;
  BOOL v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKBFloatingKeyView;
  -[UIKBContainerKeyView prepareForDisplay](&v5, sel_prepareForDisplay);
  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "needsDisplay") & 1) != 0)
  {

  }
  else
  {
    v4 = -[UIKBContainerKeyView hasRendered](self, "hasRendered");

    if (v4)
      return;
  }
  -[UIView recursivelyForceDisplayIfNeeded](self, "recursivelyForceDisplayIfNeeded");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingContentView, 0);
}

@end

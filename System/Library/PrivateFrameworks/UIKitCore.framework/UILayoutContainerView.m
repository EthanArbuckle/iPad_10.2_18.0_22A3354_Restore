@implementation UILayoutContainerView

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)UILayoutContainerView;
  -[UIView setBounds:](&v10, sel_setBounds_);
  if (self->_usesRoundedCorners)
  {
    -[UIView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFrame:", x, y, width, height);

  }
}

- (void)addSubview:(id)a3
{
  UIView *shadowView;
  BOOL v4;
  objc_super v5;

  shadowView = self->_shadowView;
  if (shadowView)
    v4 = shadowView == a3;
  else
    v4 = 1;
  if (v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)UILayoutContainerView;
    -[UIView addSubview:](&v5, sel_addSubview_, a3);
  }
  else
  {
    -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", a3);
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[UILayoutContainerView _setFlagsFromDelegate:](self, "_setFlagsFromDelegate:", obj);
  }

}

- (void)_setFlagsFromDelegate:(id)a3
{
  id v4;
  char v5;
  char v6;
  char v7;
  char v8;

  v4 = a3;
  *(_BYTE *)&self->_layoutContainerViewFlags = *(_BYTE *)&self->_layoutContainerViewFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 2;
  else
    v5 = 0;
  *(_BYTE *)&self->_layoutContainerViewFlags = *(_BYTE *)&self->_layoutContainerViewFlags & 0xFD | v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 4;
  else
    v6 = 0;
  *(_BYTE *)&self->_layoutContainerViewFlags = *(_BYTE *)&self->_layoutContainerViewFlags & 0xFB | v6;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
    v8 = 8;
  else
    v8 = 0;
  *(_BYTE *)&self->_layoutContainerViewFlags = *(_BYTE *)&self->_layoutContainerViewFlags & 0xF7 | v8;
}

- (void)dealloc
{
  objc_super v3;

  -[UILayoutContainerView _tearDownShadowViews](self, "_tearDownShadowViews");
  v3.receiver = self;
  v3.super_class = (Class)UILayoutContainerView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)_tearDownShadowViews
{
  UIView *shadowView;

  -[UIView removeFromSuperview](self->_shadowView, "removeFromSuperview");
  shadowView = self->_shadowView;
  self->_shadowView = 0;

}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UILayoutContainerView;
  -[UIView setFrame:](&v14, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_usesRoundedCorners)
  {
    -[UIView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mask");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  }
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
  void *v11;
  void *v12;
  id WeakRetained;
  objc_super v14;

  if (self->_usesRoundedCorners)
  {
    -[UIView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mask");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  }
  if ((*(_BYTE *)&self->_layoutContainerViewFlags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "__viewWillLayoutSubviews");

  }
  v14.receiver = self;
  v14.super_class = (Class)UILayoutContainerView;
  -[UIView layoutSubviews](&v14, sel_layoutSubviews);
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UILayoutContainerView;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_, a3);
  if ((*(_BYTE *)&self->_layoutContainerViewFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "_layoutContainerViewSemanticContentAttributeChanged:", self);

  }
}

- (void)willMoveToWindow:(id)a3
{
  UILayoutContainerViewDelegate **p_delegate;
  id v4;
  id WeakRetained;

  if ((*(_BYTE *)&self->_layoutContainerViewFlags & 4) != 0)
  {
    p_delegate = &self->_delegate;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "_layoutContainerViewWillMoveToWindow:", v4);

  }
}

- (void)didMoveToWindow
{
  void *v3;
  id WeakRetained;

  if ((*(_BYTE *)&self->_layoutContainerViewFlags & 8) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[UIView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_layoutContainerViewDidMoveToWindow:", v3);

  }
}

- (UILayoutContainerViewDelegate)delegate
{
  return (UILayoutContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

- (void)_commonInit
{
  _UIAssertionController *v3;
  _UIAssertionController *assertionController;

  v3 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", self);
  assertionController = self->_assertionController;
  self->_assertionController = v3;

}

- (UILayoutContainerView)initWithFrame:(CGRect)a3
{
  UILayoutContainerView *v3;
  UILayoutContainerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UILayoutContainerView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UILayoutContainerView _commonInit](v3, "_commonInit");
  return v4;
}

- (UILayoutContainerView)initWithCoder:(id)a3
{
  id v4;
  UILayoutContainerView *v5;
  void *v6;
  char v7;
  uint64_t v8;
  UIColor *defaultBackgroundColor;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UILayoutContainerView;
  v5 = -[UIView initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_delegate, v6);
    -[UILayoutContainerView _setFlagsFromDelegate:](v5, "_setFlagsFromDelegate:", v6);
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("backgroundColorIsDefault")))
      v7 = 16;
    else
      v7 = 0;
    *(_BYTE *)&v5->_layoutContainerViewFlags = *(_BYTE *)&v5->_layoutContainerViewFlags & 0xEF | v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultBackgroundColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    defaultBackgroundColor = v5->_defaultBackgroundColor;
    v5->_defaultBackgroundColor = (UIColor *)v8;

    -[UILayoutContainerView _commonInit](v5, "_commonInit");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UIColor *defaultBackgroundColor;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UILayoutContainerView;
  -[UIView encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", (*(_BYTE *)&self->_layoutContainerViewFlags >> 4) & 1, CFSTR("backgroundColorIsDefault"));
  defaultBackgroundColor = self->_defaultBackgroundColor;
  if (defaultBackgroundColor)
    objc_msgSend(v4, "encodeObject:forKey:", defaultBackgroundColor, CFSTR("defaultBackgroundColor"));
  -[UILayoutContainerView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "encodeConditionalObject:forKey:", v6, CFSTR("UIDelegate"));

}

- (void)setBackgroundColor:(id)a3
{
  objc_super v3;

  *(_BYTE *)&self->_layoutContainerViewFlags &= ~0x10u;
  v3.receiver = self;
  v3.super_class = (Class)UILayoutContainerView;
  -[UIView setBackgroundColor:](&v3, sel_setBackgroundColor_, a3);
}

- (void)setDefaultBackgroundColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_defaultBackgroundColor, a3);
  v5 = a3;
  -[UILayoutContainerView setBackgroundColor:](self, "setBackgroundColor:", v5);

  *(_BYTE *)&self->_layoutContainerViewFlags |= 0x10u;
}

- (BOOL)backgroundColorIsDefault
{
  return (*(_BYTE *)&self->_layoutContainerViewFlags >> 4) & 1;
}

- (void)setUsesRoundedCorners:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_usesRoundedCorners != a3)
  {
    v3 = a3;
    self->_usesRoundedCorners = a3;
    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "setCornerRadius:", 5.0);

      -[UIView layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMasksToBounds:", 1);

      -[UIView setOpaque:](self, "setOpaque:", 0);
    }
    else
    {
      objc_msgSend(v5, "setCornerRadius:", 0.0);

      -[UIView layer](self, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMasksToBounds:", 0);

    }
    -[UILayoutContainerView _updateShadowViews](self, "_updateShadowViews");
  }
}

- (void)setUsesInnerShadow:(BOOL)a3
{
  if (self->_usesInnerShadow != a3)
  {
    self->_usesInnerShadow = a3;
    -[UILayoutContainerView _updateShadowViews](self, "_updateShadowViews");
  }
}

- (void)_updateShadowViews
{
  if (self->_usesRoundedCorners && self->_usesInnerShadow)
    -[UILayoutContainerView _installShadowViews](self, "_installShadowViews");
  else
    -[UILayoutContainerView _tearDownShadowViews](self, "_tearDownShadowViews");
}

- (void)_installShadowViews
{
  UIImageView *v3;
  UIView *v4;
  UIView *shadowView;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  if (!self->_shadowView)
  {
    v3 = [UIImageView alloc];
    -[UIView bounds](self, "bounds");
    v4 = -[UIImageView initWithFrame:](v3, "initWithFrame:");
    shadowView = self->_shadowView;
    self->_shadowView = v4;

    -[UIView setAutoresizingMask:](self->_shadowView, "setAutoresizingMask:", 18);
    -[UIView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    _UIImageWithName(CFSTR("UISheetViewButtonTableShadow.png"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    _shadowImageInRectForSlice(v16, 0x24u, 0.0, 0.0, 5.0, 6.0, 0.0, 0.0, 5.0, 6.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self->_shadowView, "addSubview:", v10);
    _shadowImageInRectForSlice(v16, 0x22u, 5.0, 0.0, v7 + -10.0, 4.0, 5.0, 0.0, 1.0, 4.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView addSubview:](self->_shadowView, "addSubview:", v11);
    _shadowImageInRectForSlice(v16, 0x21u, v7 + -5.0, 0.0, 5.0, 6.0, 6.0, 0.0, 5.0, 6.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView addSubview:](self->_shadowView, "addSubview:", v12);
    v13 = v9 + -8.0;
    _shadowImageInRectForSlice(v16, 0x14u, 0.0, 6.0, 2.0, v13, 0.0, 6.0, 2.0, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView addSubview:](self->_shadowView, "addSubview:", v14);
    _shadowImageInRectForSlice(v16, 0x11u, v7 + -2.0, 6.0, 2.0, v13, 9.0, 6.0, 2.0, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView addSubview:](self->_shadowView, "addSubview:", v15);
    -[UILayoutContainerView addSubview:](self, "addSubview:", self->_shadowView);

  }
}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  char v4;
  void *v5;
  objc_super v7;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusGroupContainmentBehavior");

  if (v4 < 0)
  {
    _UIFocusGroupIdentifierForInstance(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UILayoutContainerView;
    -[UIView _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_disableUserInteractionForReason:(id)a3
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:](self->_assertionController, "vendAssertionOfType:initialState:reason:", 0, 1, a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  objc_super v6;

  if ((*(_BYTE *)&self->_layoutContainerViewFlags & 0x20) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UILayoutContainerView;
    -[UIView hitTest:withEvent:](&v6, sel_hitTest_withEvent_, a4, a3.x, a3.y);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  void *v6;
  _BOOL4 v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UILayoutContainerView.m"), 364, CFSTR("Unknown _UIAssertionType %lu"), a3);

    LOBYTE(v7) = 0;
  }
  else
  {
    return (*(_BYTE *)&self->_layoutContainerViewFlags >> 5) & 1;
  }
  return v7;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  _BOOL4 v5;
  void *v8;
  char v9;
  id v10;

  v5 = a3;
  if (pthread_main_np() == 1)
  {
    if (a4)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UILayoutContainerView.m"), 379, CFSTR("Unknown _UIAssertionType %lu"), a4);

      return;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UILayoutContainerView.m"), 371, CFSTR("Call must be made on main thread"));

    if (a4)
      goto LABEL_3;
  }
  if (v5)
    v9 = 32;
  else
    v9 = 0;
  *(_BYTE *)&self->_layoutContainerViewFlags = *(_BYTE *)&self->_layoutContainerViewFlags & 0xDF | v9;
}

- (BOOL)usesInnerShadow
{
  return self->_usesInnerShadow;
}

- (BOOL)usesRoundedCorners
{
  return self->_usesRoundedCorners;
}

- (UIColor)defaultBackgroundColor
{
  return self->_defaultBackgroundColor;
}

@end

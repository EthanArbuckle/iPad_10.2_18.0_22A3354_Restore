@implementation UIKBViewBackedKeyView

- (UIKBViewBackedKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  UIKBViewBackedKeyView *v5;
  UIKBViewBackedKeyView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBViewBackedKeyView;
  v5 = -[UIKBKeyView initWithFrame:keyplane:key:](&v8, sel_initWithFrame_keyplane_key_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 1);
  return v6;
}

- (id)renderFlagsForTraits:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "geometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "detachedVariants");

  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIKBViewBackedKeyView;
    -[UIKBKeyView renderFlagsForTraits:](&v9, sel_renderFlagsForTraits_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &unk_1E1A950D8;
  }

  return v7;
}

- (void)setRenderConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  UIKBBackdropView *v13;
  UIKBBackdropView *v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[UIKBKeyView factory](self, "factory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView keyplane](self, "keyplane");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitsForKey:onKeyplane:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "blurBlending") & 1) != 0
    || (objc_msgSend(v8, "variantTraits"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "blurBlending"),
        v9,
        v10))
  {
    if (!self->_backdropView)
    {
      +[UIKBRenderConfig defaultConfig](UIKBRenderConfig, "defaultConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "keyBackdropStyle");

      v13 = [UIKBBackdropView alloc];
      -[UIView bounds](self, "bounds");
      v14 = -[UIKBBackdropView initWithFrame:style:](v13, "initWithFrame:style:", v12);
      -[UIKBViewBackedKeyView setBackdropView:](self, "setBackdropView:", v14);

      -[UIKBViewBackedKeyView backdropView](self, "backdropView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](self, "addSubview:", v15);

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __41__UIKBViewBackedKeyView_setRenderConfig___block_invoke;
    v19[3] = &unk_1E16B1B50;
    v19[4] = self;
    v16 = v4;
    v20 = v16;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v19);
    -[UIKBViewBackedKeyView backdropView](self, "backdropView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBKeyView configureBackdropView:forRenderConfig:](self, "configureBackdropView:forRenderConfig:", v17, v16);

  }
  -[UIKBKeyViewContentView updateRenderConfig:](self->_contentView, "updateRenderConfig:", v4);
  v18.receiver = self;
  v18.super_class = (Class)UIKBViewBackedKeyView;
  -[UIKBKeyView setRenderConfig:](&v18, sel_setRenderConfig_, v4);

}

void __41__UIKBViewBackedKeyView_setRenderConfig___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionToStyle:", objc_msgSend(*(id *)(a1 + 40), "keyBackdropStyle"));

}

- (void)setDrawFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKBViewBackedKeyView;
  -[UIKBKeyView setDrawFrame:](&v4, sel_setDrawFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContentView:(id)a3
{
  UIKBKeyViewContentView *v5;
  UIKBKeyViewContentView *contentView;
  UIKBKeyViewContentView *v7;

  v5 = (UIKBKeyViewContentView *)a3;
  contentView = self->_contentView;
  v7 = v5;
  if (contentView != v5)
  {
    -[UIKBKeyViewContentView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView addSubview:](self, "addSubview:", v7);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBViewBackedKeyView;
  v6 = a4;
  v7 = a3;
  -[UIKBKeyView updateForKeyplane:key:](&v8, sel_updateForKeyplane_key_, v7, v6);
  -[UIKBKeyViewContentView updateForKeyplane:key:](self->_contentView, "updateForKeyplane:key:", v7, v6, v8.receiver, v8.super_class);

}

- (BOOL)retestSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4 phase:(int64_t)a5
{
  double y;
  double x;
  UIKBKeyViewContentView *contentView;
  id v10;

  y = a4.y;
  x = a4.x;
  contentView = self->_contentView;
  v10 = a3;
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", contentView, x, y);
  LOBYTE(a5) = -[UIKBKeyViewContentView retestSelectedVariantIndexForKey:atPoint:phase:](self->_contentView, "retestSelectedVariantIndexForKey:atPoint:phase:", v10, a5);

  return a5;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIKBViewBackedKeyView touchForwardingView](self, "touchForwardingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    v9 = objc_msgSend(v8, "pointInside:withEvent:", v7);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKBViewBackedKeyView;
    v9 = -[UIView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y);
  }
  v10 = v9;

  return v10;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIKBViewBackedKeyView touchForwardingView](self, "touchForwardingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    objc_msgSend(v8, "hitTest:withEvent:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKBViewBackedKeyView;
    -[UIView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)UIKBViewBackedKeyView;
  -[UIView layoutSubviews](&v20, sel_layoutSubviews);
  -[UIKBKeyView factory](self, "factory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView keyplane](self, "keyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitsForKey:onKeyplane:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "variantTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "geometry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "symbolFrame");
    -[UIKBKeyViewContentView setFrame:](self->_contentView, "setFrame:");

  }
  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIKBViewBackedKeyView backdropView](self, "backdropView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  -[UIKBViewBackedKeyView backdropView](self, "backdropView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", v19);

}

- (UIKBKeyViewContentView)contentView
{
  return self->_contentView;
}

- (UIView)touchForwardingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_touchForwardingView);
}

- (void)setTouchForwardingView:(id)a3
{
  objc_storeWeak((id *)&self->_touchForwardingView, a3);
}

- (UIKBBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_destroyWeak((id *)&self->_touchForwardingView);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

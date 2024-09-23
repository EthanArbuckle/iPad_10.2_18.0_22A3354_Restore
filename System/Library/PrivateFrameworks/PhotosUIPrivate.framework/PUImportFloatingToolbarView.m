@implementation PUImportFloatingToolbarView

- (PUImportFloatingToolbarView)init
{
  PUImportFloatingToolbarView *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  UIVisualEffectView *visualEffectView;
  UIToolbar *v7;
  UIToolbar *toolbar;
  UIToolbar *v9;
  id v10;
  void *v11;
  UIView *v12;
  UIView *shadowView;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUImportFloatingToolbarView;
  v2 = -[PUImportFloatingToolbarView init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportFloatingToolbarView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[PUImportFloatingToolbarView setOpaque:](v2, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v4);
    visualEffectView = v2->_visualEffectView;
    v2->_visualEffectView = (UIVisualEffectView *)v5;

    -[PUImportFloatingToolbarView addSubview:](v2, "addSubview:", v2->_visualEffectView);
    -[PUImportFloatingToolbarView _updateBackground](v2, "_updateBackground");
    v7 = (UIToolbar *)objc_alloc_init(MEMORY[0x1E0DC3E68]);
    toolbar = v2->_toolbar;
    v2->_toolbar = v7;

    v9 = v2->_toolbar;
    v10 = objc_alloc_init(MEMORY[0x1E0DC3870]);
    -[UIToolbar setBackgroundImage:forToolbarPosition:barMetrics:](v9, "setBackgroundImage:forToolbarPosition:barMetrics:", v10, 0, 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIToolbar setBackgroundColor:](v2->_toolbar, "setBackgroundColor:", v11);

    -[UIToolbar setPreservesSuperviewLayoutMargins:](v2->_toolbar, "setPreservesSuperviewLayoutMargins:", 0);
    -[PUImportFloatingToolbarView addSubview:](v2, "addSubview:", v2->_toolbar);
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    shadowView = v2->_shadowView;
    v2->_shadowView = v12;

    -[UIView setOpaque:](v2->_shadowView, "setOpaque:", 1);
    -[UIView setUserInteractionEnabled:](v2->_shadowView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v2->_shadowView, "setBackgroundColor:", v14);

    -[PUImportFloatingToolbarView addSubview:](v2, "addSubview:", v2->_shadowView);
  }
  return v2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PUImportFloatingToolbarView toolbar](self, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)sizeToFit
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  -[PUImportFloatingToolbarView toolbar](self, "toolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[PUImportFloatingToolbarView toolbar](self, "toolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[PUImportFloatingToolbarView setBounds:](self, "setBounds:");

  -[PUImportFloatingToolbarView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PUImportFloatingToolbarView visualEffectView](self, "visualEffectView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PUImportFloatingToolbarView toolbar](self, "toolbar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
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
  void *v13;
  double v14;
  double v15;
  double MinX;
  double MaxY;
  double Width;
  void *v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v20.receiver = self;
  v20.super_class = (Class)PUImportFloatingToolbarView;
  -[PUImportFloatingToolbarView layoutSubviews](&v20, sel_layoutSubviews);
  -[PUImportFloatingToolbarView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUImportFloatingToolbarView toolbar](self, "toolbar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PUImportFloatingToolbarView visualEffectView](self, "visualEffectView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = 1.0 / v14;

  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  MinX = CGRectGetMinX(v21);
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  MaxY = CGRectGetMaxY(v22);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  Width = CGRectGetWidth(v23);
  -[PUImportFloatingToolbarView shadowView](self, "shadowView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", MinX, MaxY, Width, v15);

}

- (NSArray)items
{
  void *v2;
  void *v3;

  -[PUImportFloatingToolbarView toolbar](self, "toolbar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUImportFloatingToolbarView toolbar](self, "toolbar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v4);

}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PUImportFloatingToolbarView toolbar](self, "toolbar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:animated:", v6, v4);

}

- (void)setShouldBlurBackground:(BOOL)a3
{
  if (self->_shouldBlurBackground != a3)
  {
    self->_shouldBlurBackground = a3;
    -[PUImportFloatingToolbarView _updateBackground](self, "_updateBackground");
  }
}

- (void)setBackdropViewGroupName:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *backdropViewGroupName;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_backdropViewGroupName;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      backdropViewGroupName = self->_backdropViewGroupName;
      self->_backdropViewGroupName = v6;

      -[PUImportFloatingToolbarView _updateBackdropViewGroupName](self, "_updateBackdropViewGroupName");
    }
  }

}

- (void)_updateBackground
{
  _BOOL4 shouldBlurBackground;
  UIVisualEffectView *visualEffectView;
  PUImportFloatingToolbarView *v5;
  uint64_t v6;
  _QWORD v7[5];

  shouldBlurBackground = self->_shouldBlurBackground;
  visualEffectView = self->_visualEffectView;
  if (shouldBlurBackground)
  {
    -[UIVisualEffectView superview](visualEffectView, "superview");
    v5 = (PUImportFloatingToolbarView *)objc_claimAutoreleasedReturnValue();

    if (v5 != self)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __48__PUImportFloatingToolbarView__updateBackground__block_invoke;
      v7[3] = &unk_1E58ABD10;
      v7[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
    }
    visualEffectView = self->_visualEffectView;
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  -[UIVisualEffectView setHidden:](visualEffectView, "setHidden:", v6);
  -[PUImportFloatingToolbarView _updateBackdropViewGroupName](self, "_updateBackdropViewGroupName");
}

- (void)_updateBackdropViewGroupName
{
  uint64_t v3;
  id v4;

  if (self->_shouldBlurBackground)
  {
    -[PUImportFloatingToolbarView backdropViewGroupName](self, "backdropViewGroupName");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (id)v3;
      -[UIVisualEffectView _setGroupName:](self->_visualEffectView, "_setGroupName:", v3);

    }
  }
}

- (BOOL)shouldBlurBackground
{
  return self->_shouldBlurBackground;
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
}

uint64_t __48__PUImportFloatingToolbarView__updateBackground__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
  return objc_msgSend(*(id *)(a1 + 32), "sendSubviewToBack:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
}

@end

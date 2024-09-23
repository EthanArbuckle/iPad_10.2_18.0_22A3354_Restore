@implementation _UIFloatingTabBarPageButton

- (_UIFloatingTabBarPageButton)initWithDirection:(int64_t)a3
{
  _UIFloatingTabBarPageButton *v4;
  _UIFloatingTabBarPageButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFloatingTabBarPageButton;
  v4 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_direction = a3;
    -[_UIFloatingTabBarPageButton _configureButton](v4, "_configureButton");
  }
  return v5;
}

- (double)contentOpacity
{
  void *v2;
  double v3;
  double v4;

  -[_UIFloatingTabBarPageButton button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (void)setContentOpacity:(double)a3
{
  id v4;

  -[_UIFloatingTabBarPageButton button](self, "button");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (id)_imageNameForCurrentDirection
{
  if (-[_UIFloatingTabBarPageButton direction](self, "direction"))
    return CFSTR("chevron.right");
  else
    return CFSTR("chevron.left");
}

- (void)_configureButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarPageButton _imageNameForCurrentDirection](self, "_imageNameForCurrentDirection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v7);

  -[_UIFloatingTabBarPageButton _tintColorForButton](self, "_tintColorForButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBaseForegroundColor:", v8);

  objc_msgSend(v5, "setCornerStyle:", -1);
  v9 = *MEMORY[0x1E0CD2FE8];
  objc_msgSend(v5, "background");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", v9);

  objc_msgSend(v4, "symbolConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredSymbolConfigurationForImage:", v11);

  +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIHoverHighlightEffect effect](UIHoverHighlightEffect, "effect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIShape capsuleShape](UIShape, "capsuleShape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIHoverStyle styleWithEffect:shape:](UIHoverStyle, "styleWithEffect:shape:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHoverStyle:", v15);

  objc_msgSend(v12, "_setContinuousCornerRadius:", v9);
  objc_msgSend(v12, "setSpringLoaded:", 1);
  -[UIView addSubview:](self, "addSubview:", v12);
  objc_storeStrong((id *)&self->_button, v12);
  v21[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v12, "registerForTraitChanges:withAction:", v16, sel_setNeedsUpdateConfiguration);

  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v18, sel__updateButtonColor);

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
  -[_UIFloatingTabBarPageButton button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7 + -10.0;
  v11 = v9;
  result.height = v11;
  result.width = v10;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIFloatingTabBarPageButton;
  -[UIView layoutSubviews](&v12, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[_UIFloatingTabBarPageButton direction](self, "direction") == 1)
    v4 = v4 + -10.0;
  -[_UIFloatingTabBarPageButton button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8 + 10.0, v10);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[UIView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIFloatingTabBarPageButton;
    -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updateButtonColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UIFloatingTabBarPageButton button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIFloatingTabBarPageButton _tintColorForButton](self, "_tintColorForButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBaseForegroundColor:", v4);

  -[_UIFloatingTabBarPageButton button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v6);

}

- (id)_tintColorForButton
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentPaletteProvider");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, objc_msgSend(v6, "userInterfaceStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "inactiveColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4
{
  id v5;
  void *v6;
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
  CGRect result;

  v5 = a3;
  -[_UIFloatingTabBarPageButton button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[UIView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_sourceRectForPresentationInWindow:(id)a3
{
  void *v3;
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
  CGRect result;

  -[_UIFloatingTabBarPageButton button](self, "button", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIButton)button
{
  return self->_button;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end

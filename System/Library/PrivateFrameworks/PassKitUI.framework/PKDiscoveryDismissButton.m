@implementation PKDiscoveryDismissButton

+ (id)buttonWithStyle:(int64_t)a3 primaryAction:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0DC3520];
  v6 = a4;
  objc_msgSend(v5, "tintedButtonConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v8);

  objc_msgSend(v7, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 7, 2, 15.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredSymbolConfigurationForImage:", v9);

  +[PKDiscoveryDismissButton buttonWithConfiguration:primaryAction:](PKDiscoveryDismissButton, "buttonWithConfiguration:primaryAction:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "updateStyleWithStyle:animated:", a3, 0);
  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 28.0;
  v4 = 28.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)updateStyleWithStyle:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v4[6];

  if (self->_style != a3)
  {
    if (a4)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __58__PKDiscoveryDismissButton_updateStyleWithStyle_animated___block_invoke;
      v4[3] = &unk_1E3E62010;
      v4[4] = self;
      v4[5] = a3;
      objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 4, v4, 0);
    }
    else
    {
      -[PKDiscoveryDismissButton _updateStyleWithStyle:](self, "_updateStyleWithStyle:");
    }
  }
}

uint64_t __58__PKDiscoveryDismissButton_updateStyleWithStyle_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyleWithStyle:", *(_QWORD *)(a1 + 40));
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDiscoveryDismissButton;
  -[PKDiscoveryDismissButton _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKDiscoveryDismissButton _updateStyleWithStyle:](self, "_updateStyleWithStyle:", self->_style);
}

- (void)_updateStyleWithStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  self->_style = a3;
  -[PKDiscoveryDismissButton configuration](self, "configuration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryDismissButton _tintColor](self, "_tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseForegroundColor:", v4);

  objc_msgSend(v7, "background");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryDismissButton _backingEffect](self, "_backingEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisualEffect:", v6);

  -[PKDiscoveryDismissButton setConfiguration:](self, "setConfiguration:", v7);
  -[PKDiscoveryDismissButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");

}

- (id)_tintColor
{
  void *v2;
  int64_t style;
  void *v4;
  uint64_t v5;

  style = self->_style;
  switch(style)
  {
    case 2:
      v5 = 1;
LABEL_7:
      +[PKDiscoveryDismissButton _tintColorForUserInterfaceStyle:](PKDiscoveryDismissButton, "_tintColorForUserInterfaceStyle:", v5);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    case 1:
      v5 = 2;
      goto LABEL_7;
    case 0:
      -[PKDiscoveryDismissButton traitCollection](self, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKDiscoveryDismissButton _tintColorForUserInterfaceStyle:](PKDiscoveryDismissButton, "_tintColorForUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v2;
}

- (id)_backingEffect
{
  int64_t style;
  void *v3;
  int64_t v4;
  uint64_t v5;

  style = self->_style;
  if (style == 2)
  {
    v5 = 1;
LABEL_7:
    v4 = +[PKDiscoveryDismissButton _blurEffectStyleForUserInterfaceStyle:](PKDiscoveryDismissButton, "_blurEffectStyleForUserInterfaceStyle:", v5);
    return (id)objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v4);
  }
  if (style == 1)
  {
    v5 = 2;
    goto LABEL_7;
  }
  if (style)
  {
    v4 = 0;
  }
  else
  {
    -[PKDiscoveryDismissButton traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[PKDiscoveryDismissButton _blurEffectStyleForUserInterfaceStyle:](PKDiscoveryDismissButton, "_blurEffectStyleForUserInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));

  }
  return (id)objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v4);
}

+ (id)_tintColorForUserInterfaceStyle:(int64_t)a3
{
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
      a1 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (int64_t)_blurEffectStyleForUserInterfaceStyle:(int64_t)a3
{
  if (a3 == 2)
    return 13;
  else
    return 18;
}

- (int64_t)style
{
  return self->_style;
}

@end

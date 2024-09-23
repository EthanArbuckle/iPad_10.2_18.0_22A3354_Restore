@implementation TPButton

+ (id)defaultStandardFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 28.0);
}

+ (double)defaultHeight
{
  return 66.0;
}

+ (double)defaultHeightForColor:(int)a3
{
  return 66.0;
}

+ (double)defaultWidthForSideButton
{
  return 66.0;
}

+ (double)defaultWidthForCenterButton
{
  return 140.0;
}

+ (double)maxWidthForCenterButton
{
  return 176.0;
}

- (void)setHighlighted:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _UIBackdropView *backdropView;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPButton;
  -[TPButton setHighlighted:](&v9, sel_setHighlighted_, a3);
  if (-[TPButton isEnabled](self, "isEnabled"))
  {
    -[_UIBackdropView inputSettings](self->_backdropView, "inputSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHighlighted:", -[TPButton isHighlighted](self, "isHighlighted"));

    -[_UIBackdropView outputSettings](self->_backdropView, "outputSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView inputSettings](self->_backdropView, "inputSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "computeOutputSettingsUsingModel:", v6);

    backdropView = self->_backdropView;
    -[_UIBackdropView outputSettings](backdropView, "outputSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView applySettings:](backdropView, "applySettings:", v8);

  }
}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _UIBackdropView *backdropView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TPButton;
  -[TPButton setEnabled:](&v19, sel_setEnabled_, a3);
  -[_UIBackdropView inputSettings](self->_backdropView, "inputSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", -[TPButton isEnabled](self, "isEnabled"));

  -[_UIBackdropView inputSettings](self->_backdropView, "inputSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", 0);

  -[_UIBackdropView outputSettings](self->_backdropView, "outputSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView inputSettings](self->_backdropView, "inputSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "computeOutputSettingsUsingModel:", v7);

  backdropView = self->_backdropView;
  -[_UIBackdropView outputSettings](backdropView, "outputSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView applySettings:](backdropView, "applySettings:", v9);

  if (!self->_blursBackground)
    -[_UIBackdropView _setBlursBackground:](self->_backdropView, "_setBlursBackground:", 0);
  if (self->_usesOverlayBlendingForContents)
  {
    -[TPButton imageView](self, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 0.400000006);

    -[TPButton imageView](self, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CD2E98];
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCompositingFilter:", v14);

    -[TPButton titleLabel](self, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 0.400000006);

    -[TPButton titleLabel](self, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCompositingFilter:", v18);

  }
}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _UIBackdropView *backdropView;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPButton;
  -[TPButton setSelected:](&v9, sel_setSelected_, a3);
  -[_UIBackdropView inputSettings](self->_backdropView, "inputSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", -[TPButton isSelected](self, "isSelected"));

  -[_UIBackdropView outputSettings](self->_backdropView, "outputSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView inputSettings](self->_backdropView, "inputSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "computeOutputSettingsUsingModel:", v6);

  backdropView = self->_backdropView;
  -[_UIBackdropView outputSettings](backdropView, "outputSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView applySettings:](backdropView, "applySettings:", v8);

  if (!self->_blursBackground)
    -[_UIBackdropView _setBlursBackground:](self->_backdropView, "_setBlursBackground:", 0);
}

- (void)setButtonColor:(int)a3
{
  _UIBackdropView *backdropView;
  uint64_t v6;
  void *v7;
  _UIBackdropView *v8;
  _UIBackdropView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (self->_color != a3)
  {
    backdropView = self->_backdropView;
    if (backdropView)
      -[_UIBackdropView removeFromSuperview](backdropView, "removeFromSuperview");
    v6 = 10092;
    switch(a3)
    {
      case 0:
        v6 = 10091;
        goto LABEL_10;
      case 1:
      case 7:
        goto LABEL_10;
      case 3:
      case 5:
      case 8:
      case 11:
        v6 = 2030;
        goto LABEL_10;
      case 4:
        break;
      case 6:
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 10:
        v6 = 2020;
        goto LABEL_10;
      case 12:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 13:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 14:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 15:
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
        v10 = v7;
        objc_msgSend(v7, "tpImageFromColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v11, 0);

        break;
      default:
        v6 = 2010;
LABEL_10:
        v8 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", v6);
        v9 = self->_backdropView;
        self->_backdropView = v8;

        -[_UIBackdropView setAppliesOutputSettingsAnimationDuration:](self->_backdropView, "setAppliesOutputSettingsAnimationDuration:", 0.150000006);
        -[_UIBackdropView setConfiguration:](self->_backdropView, "setConfiguration:", 1);
        -[TPButton insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backdropView, 0);
        break;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPButton setTitleColor:forState:](self, "setTitleColor:forState:", v12, 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.300000012);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPButton setTitleColor:forState:](self, "setTitleColor:forState:", v13, 2);

  }
  self->_color = a3;
}

- (TPButton)initWithTitle:(id)a3 icon:(id)a4 color:(int)a5 frame:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  id v13;
  id v14;
  TPButton *v15;
  TPButton *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = *(_QWORD *)&a5;
  v13 = a3;
  v14 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TPButton;
  v15 = -[TPButton init](&v27, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_color = -1;
    v15->_usesOverlayBlendingForContents = 0;
    v15->_blursBackground = 1;
    -[TPButton setOpaque:](v15, "setOpaque:", 0);
    -[TPButton setFrame:](v16, "setFrame:", x, y, width, height);
    -[TPButton setTitle:forState:](v16, "setTitle:forState:", v13, 0);
    if (v14)
    {
      -[TPButton setImage:forState:](v16, "setImage:forState:", v14, 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_flatImageWithColor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[TPButton setImage:forState:](v16, "setImage:forState:", v18, 1);
      -[TPButton setImage:forState:](v16, "setImage:forState:", v18, 4);

    }
    -[TPButton titleLabel](v16, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 28.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v20);

    -[TPButton setTitleEdgeInsets:](v16, "setTitleEdgeInsets:", 0.0, 0.0, 1.0, 0.0);
    -[TPButton titleLabel](v16, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAdjustsFontSizeToFitWidth:", 1);

    -[TPButton titleLabel](v16, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMinimumScaleFactor:", 0.5);

    -[TPButton setButtonColor:](v16, "setButtonColor:", v10);
    -[TPButton layer](v16, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAllowsGroupOpacity:", 0);

    -[TPButton layer](v16, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAllowsGroupBlending:", 0);

    v16->_roundsCorners = 1;
    -[TPButton setClipsToBounds:](v16, "setClipsToBounds:", 1);
    -[TPButton layer](v16, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCornerRadius:", 5.0);

  }
  return v16;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  +[TPButton defaultHeight](TPButton, "defaultHeight");
  v3 = v2;
  v4 = 123.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (int)buttonColor
{
  return self->_color;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TPButton;
  -[TPButton layoutSubviews](&v12, sel_layoutSubviews);
  -[TPButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_backdropView);
  if (self->_usesOverlayBlendingForContents)
  {
    -[TPButton imageView](self, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.400000006);

    -[TPButton imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CD2E98];
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositingFilter:", v7);

    -[TPButton titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.400000006);

    -[TPButton titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompositingFilter:", v11);

  }
}

- (void)setBlursBackground:(BOOL)a3
{
  _UIBackdropView *backdropView;
  void *v6;
  void *v7;
  _UIBackdropView *v8;
  void *v9;

  if (self->_blursBackground != a3)
  {
    backdropView = self->_backdropView;
    if (a3)
    {
      -[_UIBackdropView outputSettings](backdropView, "outputSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView inputSettings](self->_backdropView, "inputSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "computeOutputSettingsUsingModel:", v7);

      v8 = self->_backdropView;
      -[_UIBackdropView outputSettings](v8, "outputSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView applySettings:](v8, "applySettings:", v9);

    }
    else
    {
      -[_UIBackdropView _setBlursBackground:](backdropView, "_setBlursBackground:", 0);
    }
    -[TPButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_backdropView);
  }
  self->_blursBackground = a3;
}

- (void)setRoundsCorners:(BOOL)a3
{
  _UIBackdropView *backdropView;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;

  if (self->_roundsCorners != a3)
  {
    backdropView = self->_backdropView;
    if (a3)
    {
      -[_UIBackdropView setClipsToBounds:](backdropView, "setClipsToBounds:", 1);
      -[_UIBackdropView layer](self->_backdropView, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCornerRadius:", 5.0);

      -[TPButton setClipsToBounds:](self, "setClipsToBounds:", 1);
      -[TPButton layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 5.0;
    }
    else
    {
      -[_UIBackdropView setClipsToBounds:](backdropView, "setClipsToBounds:", 0);
      -[_UIBackdropView layer](self->_backdropView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCornerRadius:", 0.0);

      -[TPButton setClipsToBounds:](self, "setClipsToBounds:", 0);
      -[TPButton layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0.0;
    }
    objc_msgSend(v7, "setCornerRadius:", v9);

    self->_roundsCorners = a3;
  }
}

- (void)setUsesOverlayBlendingForContents:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  if (self->_usesOverlayBlendingForContents != a3)
  {
    -[TPButton imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "setAlpha:", 0.400000006);

      -[TPButton imageView](self, "imageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0CD2E98];
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCompositingFilter:", v10);

      -[TPButton titleLabel](self, "titleLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = 0.400000006;
    }
    else
    {
      objc_msgSend(v5, "setAlpha:", 1.0);

      -[TPButton imageView](self, "imageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0CD2E70];
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E70]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCompositingFilter:", v16);

      -[TPButton titleLabel](self, "titleLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = 1.0;
    }
    objc_msgSend(v11, "setAlpha:", v13);

    -[TPButton titleLabel](self, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCompositingFilter:", v19);

  }
  self->_usesOverlayBlendingForContents = v3;
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPButton;
  -[TPButton setImage:forState:](&v5, sel_setImage_forState_, a3, a4);
  if (self->_backdropView)
    -[TPButton sendSubviewToBack:](self, "sendSubviewToBack:");
}

- (void)_animationWillBegin
{
  -[_UIBackdropView setComputesColorSettings:](self->_backdropView, "setComputesColorSettings:", 0);
  -[_UIBackdropView _setBlursBackground:](self->_backdropView, "_setBlursBackground:", 0);
}

- (void)_animationDidEnd
{
  -[_UIBackdropView setComputesColorSettings:](self->_backdropView, "setComputesColorSettings:", 1);
  -[_UIBackdropView _setBlursBackground:](self->_backdropView, "_setBlursBackground:", -[TPButton blursBackground](self, "blursBackground"));
}

- (BOOL)blursBackground
{
  return self->_blursBackground;
}

- (BOOL)roundsCorners
{
  return self->_roundsCorners;
}

- (BOOL)usesOverlayBlendingForContents
{
  return self->_usesOverlayBlendingForContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end

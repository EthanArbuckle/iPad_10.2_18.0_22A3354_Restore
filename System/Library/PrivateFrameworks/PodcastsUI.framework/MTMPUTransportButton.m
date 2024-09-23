@implementation MTMPUTransportButton

+ (id)defaultRegularColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (id)defaultDisabledColor
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultRegularColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultHighlightedColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
}

+ (id)defaultSelectedColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemPinkColor");
}

- (MTMPUTransportButton)initWithFrame:(CGRect)a3
{
  MTMPUTransportButton *v3;
  MTMPUTransportButtonEventHandler *v4;
  MTMPUTransportButtonEventHandler *transportButtonEventHandler;
  uint64_t v6;
  UIColor *highlightedColor;
  uint64_t v8;
  UIColor *disabledColor;
  uint64_t v10;
  UIColor *regularColor;
  uint64_t v12;
  UIColor *selectedColor;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTMPUTransportButton;
  v3 = -[MTMPUTransportButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MTMPUTransportButtonEventHandler);
    transportButtonEventHandler = v3->_transportButtonEventHandler;
    v3->_transportButtonEventHandler = v4;

    -[MTMPUTransportButtonEventHandler setButton:](v3->_transportButtonEventHandler, "setButton:", v3);
    objc_msgSend((id)objc_opt_class(), "defaultHighlightedColor");
    v6 = objc_claimAutoreleasedReturnValue();
    highlightedColor = v3->_highlightedColor;
    v3->_highlightedColor = (UIColor *)v6;

    objc_msgSend((id)objc_opt_class(), "defaultDisabledColor");
    v8 = objc_claimAutoreleasedReturnValue();
    disabledColor = v3->_disabledColor;
    v3->_disabledColor = (UIColor *)v8;

    objc_msgSend((id)objc_opt_class(), "defaultRegularColor");
    v10 = objc_claimAutoreleasedReturnValue();
    regularColor = v3->_regularColor;
    v3->_regularColor = (UIColor *)v10;

    objc_msgSend((id)objc_opt_class(), "defaultSelectedColor");
    v12 = objc_claimAutoreleasedReturnValue();
    selectedColor = v3->_selectedColor;
    v3->_selectedColor = (UIColor *)v12;

  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  MTMPUTransportButtonEventHandler *transportButtonEventHandler;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  MTMPUTransportButton *v14;
  CGFloat v15;
  CGFloat v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  transportButtonEventHandler = self->_transportButtonEventHandler;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__MTMPUTransportButton_hitTest_withEvent___block_invoke;
  v12[3] = &unk_1EA0C52F8;
  v15 = x;
  v16 = y;
  v13 = v7;
  v14 = self;
  v9 = v7;
  -[MTMPUTransportButtonEventHandler performHitTestingBlock:](transportButtonEventHandler, "performHitTestingBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __42__MTMPUTransportButton_hitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)MTMPUTransportButton;
  objc_msgSendSuper2(&v3, sel_hitTest_withEvent_, v1, *(double *)(a1 + 48), *(double *)(a1 + 56));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)MTMPUTransportButton;
  -[MTMPUTransportButton layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_selectionIndicatorLayer)
  {
    -[MTMPUTransportButton bounds](self, "bounds");
    -[MTMPUTransportButton imageRectForContentRect:](self, "imageRectForContentRect:");
    v5 = CGRectInset(v4, -4.0, -4.0);
    -[CALayer setFrame:](self->_selectionIndicatorLayer, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  }
}

- (BOOL)isEnabled
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTMPUTransportButton;
  return -[MTMPUTransportButton isEnabled](&v4, sel_isEnabled)
      || -[MTMPUTransportButtonEventHandler shouldFakeEnabled](self->_transportButtonEventHandler, "shouldFakeEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTMPUTransportButton;
  -[MTMPUTransportButton setEnabled:](&v6, sel_setEnabled_);
  if (-[MTMPUTransportButton isSelected](self, "isSelected")
    && -[MTMPUTransportButton shouldShowBackgroundForSelectedState](self, "shouldShowBackgroundForSelectedState"))
  {
    LODWORD(v5) = 1053609165;
    if (v3)
      *(float *)&v5 = 1.0;
    -[CALayer setOpacity:](self->_selectionIndicatorLayer, "setOpacity:", v5);
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  MTMPUTransportButton *v5;
  MTMPUTransportButtonEventHandler *transportButtonEventHandler;
  id v7;
  id v8;
  objc_super v10;

  v5 = self;
  transportButtonEventHandler = self->_transportButtonEventHandler;
  v7 = a4;
  v8 = a3;
  -[MTMPUTransportButtonEventHandler beginTrackingWithTouch:withEvent:](transportButtonEventHandler, "beginTrackingWithTouch:withEvent:", v8, v7);
  v10.receiver = v5;
  v10.super_class = (Class)MTMPUTransportButton;
  LOBYTE(v5) = -[MTMPUTransportButton beginTrackingWithTouch:withEvent:](&v10, sel_beginTrackingWithTouch_withEvent_, v8, v7);

  return (char)v5;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  MTMPUTransportButtonEventHandler *transportButtonEventHandler;
  id v5;
  objc_super v6;

  transportButtonEventHandler = self->_transportButtonEventHandler;
  v5 = a3;
  -[MTMPUTransportButtonEventHandler cancelTrackingWithEvent:](transportButtonEventHandler, "cancelTrackingWithEvent:", v5);
  v6.receiver = self;
  v6.super_class = (Class)MTMPUTransportButton;
  -[MTMPUTransportButton cancelTrackingWithEvent:](&v6, sel_cancelTrackingWithEvent_, v5);

}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  MTMPUTransportButtonEventHandler *transportButtonEventHandler;
  id v7;
  id v8;
  objc_super v9;

  transportButtonEventHandler = self->_transportButtonEventHandler;
  v7 = a4;
  v8 = a3;
  -[MTMPUTransportButtonEventHandler endTrackingWithTouch:withEvent:](transportButtonEventHandler, "endTrackingWithTouch:withEvent:", v8, v7);
  v9.receiver = self;
  v9.super_class = (Class)MTMPUTransportButton;
  -[MTMPUTransportButton endTrackingWithTouch:withEvent:](&v9, sel_endTrackingWithTouch_withEvent_, v8, v7);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  CALayer *selectionIndicatorLayer;
  CALayer *v7;
  CALayer *v8;
  id v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTMPUTransportButton;
  -[MTMPUTransportButton setSelected:](&v13, sel_setSelected_);
  if (-[MTMPUTransportButton shouldShowBackgroundForSelectedState](self, "shouldShowBackgroundForSelectedState"))
  {
    selectionIndicatorLayer = self->_selectionIndicatorLayer;
    if (v3)
    {
      if (!selectionIndicatorLayer)
      {
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v7 = (CALayer *)objc_claimAutoreleasedReturnValue();
        v8 = self->_selectionIndicatorLayer;
        self->_selectionIndicatorLayer = v7;

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.12);
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        -[CALayer setBackgroundColor:](self->_selectionIndicatorLayer, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

        -[CALayer setCornerRadius:](self->_selectionIndicatorLayer, "setCornerRadius:", 3.0);
        LODWORD(v10) = 0;
        -[CALayer setOpacity:](self->_selectionIndicatorLayer, "setOpacity:", v10);
        -[MTMPUTransportButton layer](self, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "insertSublayer:atIndex:", self->_selectionIndicatorLayer, 0);

      }
      -[MTMPUTransportButton setNeedsLayout](self, "setNeedsLayout");
      v12 = -[MTMPUTransportButton isEnabled](self, "isEnabled");
      selectionIndicatorLayer = self->_selectionIndicatorLayer;
      if (v12)
        LODWORD(v5) = 1.0;
      else
        LODWORD(v5) = 1053609165;
    }
    else
    {
      LODWORD(v5) = 0;
    }
    -[CALayer setOpacity:](selectionIndicatorLayer, "setOpacity:", v5);
  }
}

- (BOOL)shouldTrack
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTMPUTransportButton;
  return -[MTMPUTransportButton shouldTrack](&v4, sel_shouldTrack)
      || -[MTMPUTransportButtonEventHandler shouldForceTrackingEnabled](self->_transportButtonEventHandler, "shouldForceTrackingEnabled");
}

+ (id)transportButton
{
  return (id)objc_msgSend(a1, "buttonWithType:", 0);
}

- (MTMPUTransportButtonEventHandler)transportButtonEventHandler
{
  return self->_transportButtonEventHandler;
}

- (void)applyTransportButtonLayoutAttributes:(id *)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;

  x = a3->var1.origin.x;
  y = a3->var1.origin.y;
  width = a3->var1.size.width;
  height = a3->var1.size.height;
  -[MTMPUTransportButton setImageEdgeInsets:](self, "setImageEdgeInsets:", MTMPUEdgeInsetsRectInsets(x, y, width, height, a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height));
  -[MTMPUTransportButton setFrame:](self, "setFrame:", x, y, width, height);
}

- (void)prepareForReuse
{
  -[MTMPUTransportButton setTransportButtonImage:](self, "setTransportButtonImage:", 0);
}

- (BOOL)wantsCustomHighlightAppearance
{
  return 1;
}

- (int64_t)transportButtonImageViewContentMode
{
  void *v2;
  int64_t v3;

  -[MTMPUTransportButton imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentMode");

  return v3;
}

- (void)setTransportButtonImageViewContentMode:(int64_t)a3
{
  id v4;

  -[MTMPUTransportButton imageView](self, "imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", a3);

}

- (void)setDisabledColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_disabledColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_disabledColor, a3);
    v5 = v6;
    if (!self->_shouldInferColorsFromTintColor)
    {
      -[MTMPUTransportButton _updateDisabledTransportButtonImage](self, "_updateDisabledTransportButtonImage");
      v5 = v6;
    }
  }

}

- (void)setHighlightedColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_highlightedColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_highlightedColor, a3);
    v5 = v6;
    if (!self->_shouldInferColorsFromTintColor)
    {
      -[MTMPUTransportButton _updateHighlightedTransportButtonImage](self, "_updateHighlightedTransportButtonImage");
      v5 = v6;
    }
  }

}

- (void)setRegularColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_regularColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_regularColor, a3);
    v5 = v6;
    if (!self->_shouldInferColorsFromTintColor)
    {
      -[MTMPUTransportButton _updateRegularTransportButtonImage](self, "_updateRegularTransportButtonImage");
      v5 = v6;
    }
  }

}

- (void)setSelectedColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_selectedColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedColor, a3);
    v5 = v6;
    if (!self->_shouldInferColorsFromTintColor)
    {
      -[MTMPUTransportButton _updateSelectedTransportButtonImage](self, "_updateSelectedTransportButtonImage");
      v5 = v6;
    }
  }

}

- (void)setShouldInferColorsFromTintColor:(BOOL)a3
{
  id v4;

  if (self->_shouldInferColorsFromTintColor != a3)
  {
    self->_shouldInferColorsFromTintColor = a3;
    if (a3)
    {
      -[MTMPUTransportButton setImage:forState:](self, "setImage:forState:", 0, 1);
      -[MTMPUTransportButton setImage:forState:](self, "setImage:forState:", 0, 4);
      -[UIImage imageWithRenderingMode:](self->_transportButtonImage, "imageWithRenderingMode:", 2);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[MTMPUTransportButton setImage:forState:](self, "setImage:forState:", v4, 0);

    }
    else
    {
      -[MTMPUTransportButton _updateRegularTransportButtonImage](self, "_updateRegularTransportButtonImage");
      -[MTMPUTransportButton _updateDisabledTransportButtonImage](self, "_updateDisabledTransportButtonImage");
      -[MTMPUTransportButton _updateHighlightedTransportButtonImage](self, "_updateHighlightedTransportButtonImage");
      -[MTMPUTransportButton _updateSelectedTransportButtonImage](self, "_updateSelectedTransportButtonImage");
    }
  }
}

- (void)setTransportButtonImage:(id)a3
{
  UIImage *v5;
  UIImage *transportButtonImage;
  char v7;
  void *v8;
  UIImage *v9;

  v5 = (UIImage *)a3;
  transportButtonImage = self->_transportButtonImage;
  if (transportButtonImage != v5)
  {
    v9 = v5;
    v7 = -[UIImage isEqual:](transportButtonImage, "isEqual:", v5);
    v5 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_transportButtonImage, a3);
      if (self->_shouldInferColorsFromTintColor)
      {
        -[UIImage imageWithRenderingMode:](self->_transportButtonImage, "imageWithRenderingMode:", 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTMPUTransportButton setImage:forState:](self, "setImage:forState:", v8, 0);

      }
      else
      {
        -[MTMPUTransportButton _updateHighlightedTransportButtonImage](self, "_updateHighlightedTransportButtonImage");
        -[MTMPUTransportButton _updateRegularTransportButtonImage](self, "_updateRegularTransportButtonImage");
        -[MTMPUTransportButton _updateSelectedTransportButtonImage](self, "_updateSelectedTransportButtonImage");
        -[MTMPUTransportButton _updateDisabledTransportButtonImage](self, "_updateDisabledTransportButtonImage");
      }
      v5 = v9;
    }
  }

}

- (void)_updateDisabledTransportButtonImage
{
  id v3;

  -[UIImage _flatImageWithColor:](self->_transportButtonImage, "_flatImageWithColor:", self->_disabledColor);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MTMPUTransportButton setImage:forState:](self, "setImage:forState:", v3, 2);

}

- (void)_updateHighlightedTransportButtonImage
{
  id v3;

  -[UIImage _flatImageWithColor:](self->_transportButtonImage, "_flatImageWithColor:", self->_highlightedColor);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MTMPUTransportButton setImage:forState:](self, "setImage:forState:", v3, 1);

}

- (void)_updateRegularTransportButtonImage
{
  id v3;

  -[UIImage _flatImageWithColor:](self->_transportButtonImage, "_flatImageWithColor:", self->_regularColor);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MTMPUTransportButton setImage:forState:](self, "setImage:forState:", v3, 0);

}

- (void)_updateSelectedTransportButtonImage
{
  id v3;

  -[UIImage _flatImageWithColor:](self->_transportButtonImage, "_flatImageWithColor:", self->_selectedColor);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MTMPUTransportButton setImage:forState:](self, "setImage:forState:", v3, 4);

}

- (UIColor)regularColor
{
  return self->_regularColor;
}

- (UIColor)disabledColor
{
  return self->_disabledColor;
}

- (UIColor)highlightedColor
{
  return self->_highlightedColor;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (BOOL)shouldInferColorsFromTintColor
{
  return self->_shouldInferColorsFromTintColor;
}

- (BOOL)shouldShowBackgroundForSelectedState
{
  return self->_shouldShowBackgroundForSelectedState;
}

- (void)setShouldShowBackgroundForSelectedState:(BOOL)a3
{
  self->_shouldShowBackgroundForSelectedState = a3;
}

- (UIImage)transportButtonImage
{
  return self->_transportButtonImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportButtonImage, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_highlightedColor, 0);
  objc_storeStrong((id *)&self->_disabledColor, 0);
  objc_storeStrong((id *)&self->_regularColor, 0);
  objc_storeStrong((id *)&self->_selectionIndicatorLayer, 0);
  objc_storeStrong((id *)&self->_transportButtonEventHandler, 0);
}

+ (id)skipIntervalImageForInterval:(double)a3 baseImage:(id)a4 font:(id)a5 scale:(double)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[3];
  CGSize v29;

  v28[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v11, "size");
  UIGraphicsBeginImageContextWithOptions(v29, 0, a6);
  objc_msgSend(v11, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  objc_msgSend(a1, "_stringForDisplayedSkipInterval:", fabs(a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0DC1140];
  v27[0] = *MEMORY[0x1E0DC1138];
  v27[1] = v13;
  v28[0] = v10;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sizeWithAttributes:", v15);
  v17 = v16;
  v19 = v18;
  UIRectGetCenter();
  v21 = v20;
  v23 = MTMPUFloatRoundForScale(v22 - v17 * 0.5, a6);
  objc_msgSend(v12, "drawAtPoint:withAttributes:", v15, v23, MTMPUFloatRoundForScale(v21 - v19 * 0.5, a6));
  UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v24, "_imageThatSuppressesAccessibilityHairlineThickening");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)_stringForDisplayedSkipInterval:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), llround(a3));
}

@end

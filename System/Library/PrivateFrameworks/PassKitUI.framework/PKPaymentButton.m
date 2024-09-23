@implementation PKPaymentButton

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (PKPaymentButton)buttonWithType:(PKPaymentButtonType)buttonType style:(PKPaymentButtonStyle)buttonStyle
{
  return (PKPaymentButton *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPaymentButtonType:paymentButtonStyle:", buttonType, buttonStyle);
}

- (PKPaymentButton)initWithCoder:(id)a3
{
  id v4;
  PKPaymentButton *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentButton;
  v5 = -[PKPaymentButton initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PKPaymentButtonStyle"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PKPaymentButtonType"));
    -[PKPaymentButton applyAccessibilityValues](v5, "applyAccessibilityValues");
  }

  return v5;
}

- (PKPaymentButton)initWithFrame:(CGRect)a3
{
  return -[PKPaymentButton initWithPaymentButtonType:paymentButtonStyle:](self, "initWithPaymentButtonType:paymentButtonStyle:", 0, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKPaymentButton)initWithPaymentButtonType:(PKPaymentButtonType)type paymentButtonStyle:(PKPaymentButtonStyle)style
{
  double v6;
  double v7;
  PKPaymentButton *v8;
  PKPaymentButton *v9;
  objc_super v11;

  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentButton;
  v8 = -[PKPaymentButton initWithFrame:](&v11, sel_initWithFrame_, v6, v7, 140.0, 30.0);
  v9 = v8;
  if (v8)
  {
    v8->_style = style;
    v8->_type = type;
    v8->_cornerRadius = *(double *)MEMORY[0x1E0D699E8];
    -[PKPaymentButton applyAccessibilityValues](v8, "applyAccessibilityValues");
  }
  return v9;
}

- (BOOL)clipsToBounds
{
  return 1;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  if (self->_cornerRadius != cornerRadius)
  {
    self->_cornerRadius = cornerRadius;
    -[PKPaymentButton setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[PKPaymentButton setNeedsDisplay](self, "setNeedsDisplay");
    -[PKPaymentButton applyAccessibilityValues](self, "applyAccessibilityValues");
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[PKPaymentButton setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)applyAccessibilityValues
{
  void *v3;

  PKApplePayButtonAccessibilityTitleForType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentButton setAccessibilityLabel:](self, "setAccessibilityLabel:", v3);

  -[PKPaymentButton setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x1E0DC4660]);
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  void *v9;
  CGImage *v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");

  -[PKPaymentButton _effectiveButtonStyle](self, "_effectiveButtonStyle");
  v10 = (CGImage *)PKCreateApplePayButtonImageWithCornerRadius();
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGContextDrawImage(CurrentContext, v11, v10);
  CGImageRelease(v10);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentButton;
  -[PKPaymentButton layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPaymentButton setNeedsDisplay](self, "setNeedsDisplay");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 140.0;
  if (!self->_type)
    v2 = 100.0;
  v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentButton;
  v4 = a3;
  -[PKPaymentButton traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  -[PKPaymentButton traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[PKPaymentButton setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentButton;
  v4 = a3;
  -[PKPaymentButton encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, CFSTR("PKPaymentButtonStyle"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("PKPaymentButtonType"));

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("path")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPaymentButton;
    v5 = -[PKPaymentButton _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)_createHighlightFilterIfNecessary
{
  void *v3;
  id v4;
  CAFilter *v5;
  CAFilter *highlightFilter;
  CAFilter *v7;
  id v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!self->_highlightFilter)
  {
    -[PKPaymentButton layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0CD2780]);
    v5 = (CAFilter *)objc_msgSend(v4, "initWithType:", *MEMORY[0x1E0CD2E60]);
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v5;

    -[CAFilter setName:](self->_highlightFilter, "setName:", CFSTR("highlightFilter"));
    -[CAFilter setName:](self->_highlightFilter, "setName:", CFSTR("highlightFilter"));
    v7 = self->_highlightFilter;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAFilter setValue:forKey:](v7, "setValue:forKey:", objc_msgSend(v8, "CGColor"), CFSTR("inputColor"));

    v10[0] = self->_highlightFilter;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFilters:", v9);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentButton;
  -[PKPaymentButton setHighlighted:](&v16, sel_setHighlighted_);
  if (((!self->_highlighted ^ v3) & 1) == 0)
  {
    self->_highlighted = v3;
    -[PKPaymentButton _createHighlightFilterIfNecessary](self, "_createHighlightFilterIfNecessary");
    -[PKPaymentButton layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0.6;
    if (!v3)
      v6 = 1.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v5, "valueForKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorWithCGColor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v7);
    objc_msgSend(v5, "setValue:forKeyPath:", objc_msgSend(v11, "CGColor"), CFSTR("filters.highlightFilter.inputColor"));
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDuration:", 0.15);
    objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    v13 = objc_retainAutorelease(v10);
    objc_msgSend(v12, "setFromValue:", objc_msgSend(v13, "CGColor"));
    v14 = objc_retainAutorelease(v11);
    objc_msgSend(v12, "setToValue:", objc_msgSend(v14, "CGColor"));
    v15 = (id)objc_msgSend(v5, "pkui_addAdditiveAnimation:", v12);

  }
}

- (int64_t)_effectiveButtonStyle
{
  uint64_t style;
  void *v3;

  style = self->_style;
  if (style == 3)
  {
    -[PKPaymentButton traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") == 6)
      style = 2;
    else
      style = 2 * (objc_msgSend(v3, "userInterfaceStyle") == 1);

  }
  return style;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end

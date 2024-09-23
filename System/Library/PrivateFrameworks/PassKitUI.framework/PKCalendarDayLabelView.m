@implementation PKCalendarDayLabelView

- (PKCalendarDayLabelView)initWithDayString:(id)a3
{
  id v4;
  PKCalendarDayLabelView *v5;
  UIView *v6;
  UIView *highlightView;
  UILabel *v8;
  UILabel *dayLabel;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCalendarDayLabelView;
  v5 = -[PKCalendarDayLabelView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    highlightView = v5->_highlightView;
    v5->_highlightView = v6;

    -[PKCalendarDayLabelView addSubview:](v5, "addSubview:", v5->_highlightView);
    v5->_highlightPadding = 10.0;
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    dayLabel = v5->_dayLabel;
    v5->_dayLabel = v8;

    -[UILabel setTextAlignment:](v5->_dayLabel, "setTextAlignment:", 1);
    v10 = v5->_dayLabel;
    -[PKCalendarDayLabelView _dayLabelFont](v5, "_dayLabelFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    -[UILabel setText:](v5->_dayLabel, "setText:", v4);
    v12 = v5->_dayLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[PKCalendarDayLabelView addSubview:](v5, "addSubview:", v5->_dayLabel);
  }

  return v5;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[PKCalendarDayLabelView _updateTextColor](self, "_updateTextColor");
  }
}

- (void)_updateTextColor
{
  UIColor *highlightBackgroundColor;
  UIColor *v4;
  UIView *highlightView;
  void *v6;
  UIColor *highlightTextColor;
  UIColor *v8;
  UIColor *v9;
  UILabel *dayLabel;
  void *v11;
  UILabel *v12;
  void *v13;
  UIColor *v14;

  highlightBackgroundColor = self->_highlightBackgroundColor;
  if (highlightBackgroundColor)
  {
    v4 = highlightBackgroundColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  highlightView = self->_highlightView;
  v14 = v4;
  if (self->_selected)
  {
    -[UIView setBackgroundColor:](highlightView, "setBackgroundColor:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](highlightView, "setBackgroundColor:", v6);

  }
  highlightTextColor = self->_highlightTextColor;
  if (highlightTextColor)
  {
    v8 = highlightTextColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  dayLabel = self->_dayLabel;
  if (self->_selected)
  {
    -[UILabel setTextColor:](self->_dayLabel, "setTextColor:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](dayLabel, "setTextColor:", v11);

  }
  v12 = self->_dayLabel;
  -[PKCalendarDayLabelView _dayLabelFont](self, "_dayLabelFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v12, "setFont:", v13);

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKCalendarDayLabelView;
  -[PKCalendarDayLabelView setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_);
  -[UILabel setUserInteractionEnabled:](self->_dayLabel, "setUserInteractionEnabled:", v3);
  -[UIView setUserInteractionEnabled:](self->_highlightView, "setUserInteractionEnabled:", v3);
  if (self->_disabledTextColor)
  {
    if (v3)
      -[PKCalendarDayLabelView _updateTextColor](self, "_updateTextColor");
    else
      -[UILabel setTextColor:](self->_dayLabel, "setTextColor:");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCalendarDayLabelView;
  -[PKCalendarDayLabelView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKCalendarDayLabelView bounds](self, "bounds");
  -[PKCalendarDayLabelView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKCalendarDayLabelView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  _BOOL4 v4;
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
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double MaxY;
  double v22;
  CGSize result;
  CGRect v24;

  v4 = a4;
  -[PKCalendarDayLabelView labelFrameForBounds:](self, "labelFrameForBounds:");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  PKRectCenteredXInRect();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (!v4)
  {
    -[UILabel setFrame:](self->_dayLabel, "setFrame:", v7, v9, v11, v13);
    -[UIView setFrame:](self->_highlightView, "setFrame:", v15, 0.0, v17, v19);
    -[UIView layer](self->_highlightView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerRadius:", v17 * 0.5);

  }
  v24.origin.x = v15;
  v24.origin.y = 0.0;
  v24.size.width = v17;
  v24.size.height = v19;
  MaxY = CGRectGetMaxY(v24);
  v22 = v17;
  result.height = MaxY;
  result.width = v22;
  return result;
}

- (CGRect)labelFrameForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UILabel sizeThatFits:](self->_dayLabel, "sizeThatFits:", a3.size.width, 3.40282347e38);
  PKRectCenteredIntegralRect();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_dayLabelFont
{
  double *v2;
  void *v3;
  void *v4;

  if (self->_selected)
    v2 = (double *)MEMORY[0x1E0DC1420];
  else
    v2 = (double *)MEMORY[0x1E0DC1440];
  PKDefaultSystemFontOfSizeAndWeight(19.0, *v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_fixedWidthFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)totalSpacingBetweenTextAndLabel
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  const __CFAttributedString *v7;
  const __CTFramesetter *v8;
  double v9;
  const CGPath *v10;
  const __CTFrame *Frame;
  const __CFArray *Lines;
  const __CFArray *v13;
  CFIndex Count;
  const __CTLine *ValueAtIndex;
  CFRange v17;
  CGRect v18;
  CGRect ImageBounds;

  -[UILabel frame](self->_dayLabel, "frame");
  v4 = v3;
  v6 = v5;
  -[UILabel attributedText](self->_dayLabel, "attributedText");
  v7 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
  v8 = CTFramesetterCreateWithAttributedString(v7);
  v9 = 0.0;
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = v4;
  v18.size.height = v6;
  v10 = CGPathCreateWithRect(v18, 0);
  v17.length = -[__CFAttributedString length](v7, "length");
  v17.location = 0;
  Frame = CTFramesetterCreateFrame(v8, v17, v10, 0);
  Lines = CTFrameGetLines(Frame);
  if (Lines)
  {
    v13 = Lines;
    Count = CFArrayGetCount(Lines);
    if (Count >= 1)
    {
      ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(v13, Count - 1);
      ImageBounds = CTLineGetImageBounds(ValueAtIndex, 0);
      v9 = ImageBounds.origin.x + v4 - (ImageBounds.origin.x + ImageBounds.size.width);
    }
  }
  CFRelease(Frame);
  CFRelease(v10);
  CFRelease(v8);

  return v9;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (void)setHighlightBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightBackgroundColor, a3);
}

- (UIColor)highlightTextColor
{
  return self->_highlightTextColor;
}

- (void)setHighlightTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightTextColor, a3);
}

- (double)highlightPadding
{
  return self->_highlightPadding;
}

- (void)setHighlightPadding:(double)a3
{
  self->_highlightPadding = a3;
}

- (UIColor)disabledTextColor
{
  return self->_disabledTextColor;
}

- (void)setDisabledTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledTextColor, 0);
  objc_storeStrong((id *)&self->_highlightTextColor, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
}

@end

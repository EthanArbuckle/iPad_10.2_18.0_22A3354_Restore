@implementation SULinkControl

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SULinkControl;
  -[SULinkControl dealloc](&v3, sel_dealloc);
}

- (void)setShouldDrawUnderline:(BOOL)a3
{
  if (self->_shouldDrawUnderline != a3)
  {
    self->_shouldDrawUnderline = a3;
    -[SULinkControl setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[SULinkControl _updateLabel](self, "_updateLabel");
  }
}

- (void)setText:(id)a3
{
  objc_msgSend(-[SULinkControl _label](self, "_label"), "setText:", a3);
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  CGFloat x;
  CGFloat width;
  double MaxY;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  if (-[SULinkControl isHighlighted](self, "isHighlighted", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0980392157, 0.300000012), "set");
    v4 = (void *)MEMORY[0x24BDF6870];
    -[SULinkControl bounds](self, "bounds");
    objc_msgSend((id)objc_msgSend(v4, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", 255), "fill");
  }
  else if (self->_shouldDrawUnderline)
  {
    -[UILabel frame](self->_label, "frame");
    x = v8.origin.x;
    width = v8.size.width;
    MaxY = CGRectGetMaxY(v8);
    -[UIColor set](-[UILabel textColor](self->_label, "textColor"), "set");
    v9.size.height = 1.0;
    v9.origin.x = x;
    v9.origin.y = MaxY;
    v9.size.width = width;
    UIRectFill(v9);
    -[UIColor set](-[UILabel shadowColor](self->_label, "shadowColor"), "set");
    v10.origin.y = MaxY + 1.0;
    v10.size.height = 1.0;
    v10.origin.x = x;
    v10.size.width = width;
    UIRectFill(v10);
  }
}

- (void)layoutSubviews
{
  UILabel *label;
  CGRect v4;
  CGRect v5;

  -[SULinkControl bounds](self, "bounds");
  label = self->_label;
  v5 = CGRectInset(v4, 3.0, 3.0);
  -[UILabel setFrame:](label, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SULinkControl;
  -[SULinkControl setHighlighted:](&v6, sel_setHighlighted_);
  v5 = -[SULinkControl _label](self, "_label");
  objc_msgSend(v5, "setHighlighted:", v3);
  if (v3)
    objc_msgSend(v5, "setShadowColor:", 0);
  else
    -[SULinkControl _updateLabel](self, "_updateLabel");
  -[SULinkControl setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;

  -[SULinkControl frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v7 = -[SULinkControl _label](self, "_label");
  objc_msgSend(v7, "sizeToFit");
  objc_msgSend(v7, "frame");
  -[SULinkControl setFrame:](self, "setFrame:", v4, v6, v9 + 6.0, v8 + 6.0);
}

- (id)_label
{
  id result;
  UILabel *v4;

  result = self->_label;
  if (!result)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    self->_label = v4;
    -[UILabel setBackgroundColor:](v4, "setBackgroundColor:", 0);
    -[UILabel setOpaque:](self->_label, "setOpaque:", 0);
    -[SULinkControl _updateLabel](self, "_updateLabel");
    -[SULinkControl addSubview:](self, "addSubview:", self->_label);
    return self->_label;
  }
  return result;
}

- (void)_updateLabel
{
  int64_t style;
  UILabel *label;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  style = self->_style;
  if (style == 3)
  {
    -[UILabel setFont:](self->_label, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 13.0));
    -[UILabel setHighlightedTextColor:](self->_label, "setHighlightedTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
    -[UILabel setShadowColor:](self->_label, "setShadowColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
    -[UILabel setShadowOffset:](self->_label, "setShadowOffset:", 0.0, 1.0);
    label = self->_label;
    v9 = objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  }
  else
  {
    if (style == 2)
    {
      -[UILabel setFont:](self->_label, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 14.0));
      -[UILabel setHighlightedTextColor:](self->_label, "setHighlightedTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
      -[UILabel setShadowColor:](self->_label, "setShadowColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5));
      -[UILabel setShadowOffset:](self->_label, "setShadowOffset:", 0.0, 1.0);
      label = self->_label;
      v5 = (void *)MEMORY[0x24BDF6950];
      v6 = 0.145098039;
      v7 = 0.196078431;
      v8 = 0.262745098;
    }
    else if (style == 1)
    {
      -[UILabel setFont:](self->_label, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0));
      -[UILabel setHighlightedTextColor:](self->_label, "setHighlightedTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
      -[UILabel setShadowColor:](self->_label, "setShadowColor:", 0);
      label = self->_label;
      v5 = (void *)MEMORY[0x24BDF6950];
      v6 = 0.0470588235;
      v7 = 0.235294118;
      v8 = 0.964705882;
    }
    else
    {
      -[UILabel setFont:](self->_label, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 14.0));
      -[UILabel setHighlightedTextColor:](self->_label, "setHighlightedTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
      -[UILabel setShadowColor:](self->_label, "setShadowColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
      -[UILabel setShadowOffset:](self->_label, "setShadowOffset:", 0.0, 1.0);
      label = self->_label;
      v5 = (void *)MEMORY[0x24BDF6950];
      v6 = 0.141176471;
      v7 = 0.219607843;
      v8 = 0.321568627;
    }
    v9 = objc_msgSend(v5, "colorWithRed:green:blue:alpha:", v6, v7, v8, 1.0);
  }
  -[UILabel setTextColor:](label, "setTextColor:", v9);
}

- (BOOL)shouldDrawUnderline
{
  return self->_shouldDrawUnderline;
}

@end

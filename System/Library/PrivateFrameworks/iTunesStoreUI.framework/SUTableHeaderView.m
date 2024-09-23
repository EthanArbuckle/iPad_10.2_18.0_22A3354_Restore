@implementation SUTableHeaderView

- (SUTableHeaderView)initWithFrame:(CGRect)a3
{
  char *v3;
  SUTableHeaderView *v4;
  UILabel *v5;
  UILabel *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUTableHeaderView;
  v3 = -[SUTableHeaderView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (SUTableHeaderView *)v3;
  if (v3)
  {
    *(_OWORD *)(v3 + 424) = xmmword_21B558310;
    *(_OWORD *)(v3 + 440) = xmmword_21B558310;
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    v4->_subtitleLabel = v5;
    -[UILabel setBackgroundColor:](v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0));
    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setShadowColor:](v4->_subtitleLabel, "setShadowColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
    -[UILabel setShadowOffset:](v4->_subtitleLabel, "setShadowOffset:", 0.0, 1.0);
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.298039216, 0.337254902, 0.423529412, 1.0));
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    v4->_titleLabel = v6;
    -[UILabel setBackgroundColor:](v6, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    -[UILabel setFont:](v4->_titleLabel, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 18.0));
    -[UILabel setShadowColor:](v4->_titleLabel, "setShadowColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
    -[UILabel setShadowOffset:](v4->_titleLabel, "setShadowOffset:", 0.0, 1.0);
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.298039216, 0.337254902, 0.423529412, 1.0));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUTableHeaderView;
  -[SUTableHeaderView dealloc](&v3, sel_dealloc);
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  CGRect v8;

  if (self->_bottomBorderColor)
  {
    -[SUTableHeaderView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v5 = v4;
    v7 = v6;
    -[UIColor set](self->_bottomBorderColor, "set");
    v8.origin.y = v7 + -1.0;
    v8.origin.x = 0.0;
    v8.size.height = 1.0;
    v8.size.width = v5;
    UIRectFill(v8);
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  UIEdgeInsets *p_edgeInsets;
  double v14;
  double MaxX;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double right;
  double left;
  double v29;
  CGRect v30;
  CGRect v31;

  -[SUTableHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[UILabel frame](self->_titleLabel, "frame");
  v12 = v11;
  p_edgeInsets = &self->_edgeInsets;
  left = self->_edgeInsets.left;
  v29 = v14;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  MaxX = CGRectGetMaxX(v30);
  right = self->_edgeInsets.right;
  -[UILabel frame](self->_subtitleLabel, "frame");
  v17 = v16;
  v18 = self->_edgeInsets.left;
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  v19 = CGRectGetMaxX(v31) - self->_edgeInsets.right - v18;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v19, 1.79769313e308);
  v21 = v20;
  if (-[SUTableHeaderView title](self, "title") && -[SUTableHeaderView subtitle](self, "subtitle"))
  {
    v22 = 0;
    v12 = 4.0;
    v17 = v29 + 4.0 + -2.0;
  }
  else
  {
    if (-[SUTableHeaderView title](self, "title"))
    {
      v12 = 5.0;
    }
    else if (-[SUTableHeaderView subtitle](self, "subtitle"))
    {
      v17 = 1.0;
    }
    v22 = 1;
  }
  if (self->_style == 1)
  {
    v23 = v17 + 6.0;
    v24 = v12 + 6.0;
  }
  else
  {
    v23 = v17 + 10.0;
    v24 = v12 + 10.0;
    if (self->_index)
    {
      v24 = v12;
      v23 = v17;
    }
  }
  v25 = v23 + p_edgeInsets->top;
  v26 = v24 + p_edgeInsets->top;
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", v22);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v18, v25, v19, v21);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", left, v26, MaxX - right - left, v29);
}

- (void)sizeToFit
{
  double v3;
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

  -[SUTableHeaderView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[SUTableHeaderView layoutIfNeeded](self, "layoutIfNeeded");
  if (-[SUTableHeaderView title](self, "title") && -[SUTableHeaderView subtitle](self, "subtitle"))
  {
    -[UILabel frame](self->_titleLabel, "frame");
    v10 = v9 + 4.0 + -2.0;
    -[UILabel frame](self->_subtitleLabel, "frame");
    v12 = 3.0;
LABEL_8:
    v15 = v10 + v11 + v12;
    goto LABEL_9;
  }
  if (-[SUTableHeaderView title](self, "title"))
  {
    -[UILabel frame](self->_titleLabel, "frame");
    v10 = v13;
    v12 = 7.0;
    v11 = 5.0;
    goto LABEL_8;
  }
  if (-[SUTableHeaderView subtitle](self, "subtitle"))
  {
    -[UILabel frame](self->_subtitleLabel, "frame");
    v10 = v14;
    v12 = 5.0;
    v11 = 1.0;
    goto LABEL_8;
  }
  v15 = 0.0;
LABEL_9:
  if (self->_style == 1)
  {
    v15 = v15 + 10.0;
  }
  else if (!self->_index)
  {
    v15 = v15 + 10.0;
  }
  -[SUTableHeaderView setFrame:](self, "setFrame:", v4, v6, v8, v15 + self->_edgeInsets.top + self->_edgeInsets.bottom);
}

- (void)setBottomBorderColor:(id)a3
{
  UIColor *bottomBorderColor;

  bottomBorderColor = self->_bottomBorderColor;
  if (bottomBorderColor != a3)
  {

    self->_bottomBorderColor = (UIColor *)a3;
    -[SUTableHeaderView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    -[SUTableHeaderView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setIndex:(int64_t)a3
{
  if (self->_index != a3)
  {
    self->_index = a3;
    -[SUTableHeaderView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setShadowColor:(id)a3
{
  -[UILabel setShadowColor:](self->_subtitleLabel, "setShadowColor:");
  -[UILabel setShadowColor:](self->_titleLabel, "setShadowColor:", a3);
}

- (void)setSubtitle:(id)a3
{
  -[UILabel setText:](self->_subtitleLabel, "setText:");
  if (objc_msgSend(a3, "length"))
    -[SUTableHeaderView addSubview:](self, "addSubview:", self->_subtitleLabel);
  else
    -[UILabel removeFromSuperview](self->_subtitleLabel, "removeFromSuperview");
  -[SUTableHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubtitleFont:(id)a3
{
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", a3);
  -[SUTableHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:");
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", a3);
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:");
  if (objc_msgSend(a3, "length"))
    -[SUTableHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
  else
    -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
  -[SUTableHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitleFont:(id)a3
{
  -[UILabel setFont:](self->_titleLabel, "setFont:", a3);
  -[SUTableHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (UIColor)shadowColor
{
  return -[UILabel shadowColor](self->_titleLabel, "shadowColor");
}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (UIFont)subtitleFont
{
  return -[UILabel font](self->_subtitleLabel, "font");
}

- (UIColor)textColor
{
  return -[UILabel textColor](self->_titleLabel, "textColor");
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (UIFont)titleFont
{
  return -[UILabel font](self->_titleLabel, "font");
}

- (UIColor)bottomBorderColor
{
  return self->_bottomBorderColor;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)index
{
  return self->_index;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

@end

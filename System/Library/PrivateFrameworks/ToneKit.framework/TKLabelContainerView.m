@implementation TKLabelContainerView

- (TKLabelContainerView)initWithFrame:(CGRect)a3
{
  TKLabelContainerView *v3;
  void *v4;
  id v5;
  uint64_t v6;
  UILabel *label;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TKLabelContainerView;
  v3 = -[TKLabelContainerView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKLabelContainerView setBackgroundColor:](v3, "setBackgroundColor:", v4);
    v5 = objc_alloc(MEMORY[0x24BDF6B68]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v6;

    -[UILabel setBackgroundColor:](v3->_label, "setBackgroundColor:", v4);
    -[TKLabelContainerView addSubview:](v3, "addSubview:", v3->_label);

  }
  return v3;
}

- (NSString)labelText
{
  return -[UILabel text](self->_label, "text");
}

- (void)setLabelText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_label, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[UILabel setText:](self->_label, "setText:", v6);
    -[UILabel sizeToFit](self->_label, "sizeToFit");
    -[TKLabelContainerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (UIFont)labelFont
{
  return -[UILabel font](self->_label, "font");
}

- (void)setLabelFont:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UILabel font](self->_label, "font");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[UILabel setFont:](self->_label, "setFont:", v6);
    -[UILabel sizeToFit](self->_label, "sizeToFit");
    -[TKLabelContainerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (UIColor)labelTextColor
{
  return -[UILabel textColor](self->_label, "textColor");
}

- (void)setLabelTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_label, "setTextColor:", a3);
}

- (UIColor)labelShadowColor
{
  return -[UILabel shadowColor](self->_label, "shadowColor");
}

- (void)setLabelShadowColor:(id)a3
{
  -[UILabel setShadowColor:](self->_label, "setShadowColor:", a3);
}

- (UIOffset)labelShadowOffset
{
  double v2;
  double v3;
  UIOffset result;

  -[UILabel shadowOffset](self->_label, "shadowOffset");
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (void)setLabelShadowOffset:(UIOffset)a3
{
  -[UILabel setShadowOffset:](self->_label, "setShadowOffset:", a3.horizontal, a3.vertical);
}

- (void)setLabelPaddingInsets:(UIEdgeInsets)a3
{
  if (self->_labelPaddingInsets.left != a3.left
    || self->_labelPaddingInsets.top != a3.top
    || self->_labelPaddingInsets.right != a3.right
    || self->_labelPaddingInsets.bottom != a3.bottom)
  {
    self->_labelPaddingInsets = a3;
    -[TKLabelContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;
  CGRect v12;

  width = a3.width;
  -[TKLabelContainerView labelPaddingInsets](self, "labelPaddingInsets", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  -[UILabel frame](self->_label, "frame");
  v9 = v8 + v6 + CGRectGetHeight(v12);
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;

  v24.receiver = self;
  v24.super_class = (Class)TKLabelContainerView;
  -[TKLabelContainerView layoutSubviews](&v24, sel_layoutSubviews);
  -[TKLabelContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TKLabelContainerView safeAreaInsets](self, "safeAreaInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[TKLabelContainerView labelPaddingInsets](self, "labelPaddingInsets");
  v18 = v14 + v17;
  v20 = v12 + v19;
  v22 = v16 + v21;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v23 = fmax(CGRectGetWidth(v25) - v18 - v22, 0.0);
  -[UILabel frame](self->_label, "frame");
  -[UILabel setFrame:](self->_label, "setFrame:", v18, v20, v23);
}

- (UIEdgeInsets)labelPaddingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_labelPaddingInsets.top;
  left = self->_labelPaddingInsets.left;
  bottom = self->_labelPaddingInsets.bottom;
  right = self->_labelPaddingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end

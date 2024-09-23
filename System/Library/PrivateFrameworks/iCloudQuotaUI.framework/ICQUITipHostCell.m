@implementation ICQUITipHostCell

+ (int64_t)cellStyle
{
  return 0;
}

- (void)_setupContentViewToHostTip
{
  void *v3;
  id v4;

  -[PSTableCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_24E400750);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQUITipHostCell setBackgroundColor:](self, "setBackgroundColor:", v4);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  UIView *v5;
  UIView *tipView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQUITipHostCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v7, sel_refreshCellContentsWithSpecifier_, v4);
  -[ICQUITipHostCell _setupContentViewToHostTip](self, "_setupContentViewToHostTip", v7.receiver, v7.super_class);
  objc_msgSend(v4, "propertyForKey:", CFSTR("ICQUITipView"));
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();

  tipView = self->_tipView;
  self->_tipView = v5;

  -[ICQUITipHostCell setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIView sizeThatFits:](self->_tipView, "sizeThatFits:", a3.width, 1.79769313e308);
  v5 = v4 + 0.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICQUITipHostCell;
  -[PSTableCell layoutSubviews](&v8, sel_layoutSubviews);
  if (self->_tipView)
  {
    -[ICQUITipHostCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    -[ICQUITipHostCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    -[UIView setFrame:](self->_tipView, "setFrame:", 0.0, 0.0, v5);

    -[ICQUITipHostCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_tipView);

  }
}

- (UIView)tipView
{
  return self->_tipView;
}

- (void)setTipView:(id)a3
{
  objc_storeStrong((id *)&self->_tipView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipView, 0);
}

@end

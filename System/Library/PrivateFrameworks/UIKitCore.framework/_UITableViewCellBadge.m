@implementation _UITableViewCellBadge

- (_UITableViewCellBadge)initWithFrame:(CGRect)a3
{
  _UITableViewCellBadge *v3;
  UILabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITableViewCellBadge;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UILabel);
    -[UILabel setTextAlignment:](v4, "setTextAlignment:", 2);
    -[UIView addSubview:](v3, "addSubview:", v4);
    -[_UITableViewCellBadge setBadgeTextLabel:](v3, "setBadgeTextLabel:", v4);
    -[_UITableViewCellBadge setColor:](v3, "setColor:", 0);

  }
  return v3;
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
  -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)minHeight
{
  return 21.0;
}

- (void)_sizeToFit
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
  id v13;

  -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeToFit");
  -[UIView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v13, "frame");
  v8 = v7;
  v10 = v9;
  -[_UITableViewCellBadge minHeight](self, "minHeight");
  if (v11 >= v10)
    v12 = v11;
  else
    v12 = v10;
  -[UIView setFrame:](self, "setFrame:", v4, v6, v8, v12);
  -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UITableViewCellBadge;
  -[UIView layoutSubviews](&v11, sel_layoutSubviews);
  -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[UIView bounds](self, "bounds");
  v6 = v5 + v4 * 0.5;
  v9 = v8 + v7 * 0.5;
  -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCenter:", v6, v9);

}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v4);

    -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);

  }
}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!v4)
  {
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

}

- (UIColor)color
{
  void *v2;
  void *v3;

  -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[_UITableViewCellBadge _sizeToFit](self, "_sizeToFit");
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", v3);

}

- (BOOL)isHighlighted
{
  void *v2;
  char v3;

  -[_UITableViewCellBadge badgeTextLabel](self, "badgeTextLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighlighted");

  return v3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (UILabel)badgeTextLabel
{
  return self->_badgeTextLabel;
}

- (void)setBadgeTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_badgeTextLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeTextLabel, 0);
}

@end

@implementation MTBadgeView

- (MTBadgeView)init
{
  MTBadgeView *v2;
  MTBadgeView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTBadgeView;
  v2 = -[MTBadgeView init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MTBadgeView setDark:](v2, "setDark:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBadgeView badgeLabel](v3, "badgeLabel"));
    -[MTBadgeView addSubview:](v3, "addSubview:", v4);

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBadgeView badgeLabel](self, "badgeLabel"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7 + 6.0;
  if (v7 + 6.0 < v9)
    v10 = v9;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)MTBadgeView;
  -[MTBadgeView layoutSubviews](&v23, "layoutSubviews");
  -[MTBadgeView bounds](self, "bounds");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  v7 = CGRectGetWidth(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v8 = CGRectGetHeight(v25);
  if (v7 < v8)
    v8 = v7;
  v9 = v8 * 0.5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTBadgeView layer](self, "layer"));
  objc_msgSend(v10, "setCornerRadius:", v9);

  -[MTBadgeView bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTBadgeView badgeLabel](self, "badgeLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "text"));
  v21 = objc_msgSend(v20, "length");

  if (v21 == (id)1)
    v12 = v12 + 0.3;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTBadgeView badgeLabel](self, "badgeLabel"));
  objc_msgSend(v22, "setFrame:", v12, v14, v16, v18);

}

- (UILabel)badgeLabel
{
  UILabel *badgeLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;

  badgeLabel = self->_badgeLabel;
  if (!badgeLabel)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    v5 = self->_badgeLabel;
    self->_badgeLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 10.0));
    -[UILabel setFont:](self->_badgeLabel, "setFont:", v6);

    -[UILabel setNumberOfLines:](self->_badgeLabel, "setNumberOfLines:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_badgeLabel, "setTextColor:", v7);

    -[UILabel setTextAlignment:](self->_badgeLabel, "setTextAlignment:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_badgeLabel, "setBackgroundColor:", v8);

    badgeLabel = self->_badgeLabel;
  }
  return badgeLabel;
}

- (void)setBadgeValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBadgeView badgeLabel](self, "badgeLabel"));
  objc_msgSend(v5, "setText:", v4);

  -[MTBadgeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDark:(BOOL)a3
{
  if (self->_dark != a3)
    self->_dark = a3;
  -[MTBadgeView setBackgroundColor:](self, "setBackgroundColor:", 0);
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  if (self->_dark)
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor goneDarkColor](UIColor, "goneDarkColor", a3));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor", a3));
  v5 = (void *)v4;
  v6.receiver = self;
  v6.super_class = (Class)MTBadgeView;
  -[MTBadgeView setBackgroundColor:](&v6, "setBackgroundColor:", v4);

}

- (void)setBadgeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_badgeLabel, a3);
}

- (BOOL)isDark
{
  return self->_dark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeLabel, 0);
}

@end

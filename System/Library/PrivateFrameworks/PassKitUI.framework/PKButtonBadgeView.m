@implementation PKButtonBadgeView

- (PKButtonBadgeView)init
{

  return 0;
}

- (PKButtonBadgeView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKButtonBadgeView;
  -[PKButtonBadgeView layoutSubviews](&v12, sel_layoutSubviews);
  -[PKButtonBadgeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKButtonBadgeView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", fmin(v8, v10) * 0.5);

  -[UILabel setFrame:](self->_label, "setFrame:", v4 + 4.0, v6 + 4.0, v8 + -8.0, v10 + -8.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UILabel pkui_sizeThatFits:](self->_label, "pkui_sizeThatFits:", 1.79769313e308, 1.79769313e308);
  if (v3 < v4)
    v3 = v4;
  v5 = v3 + 4.0 + 4.0;
  v6 = v4 + 4.0 + 4.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

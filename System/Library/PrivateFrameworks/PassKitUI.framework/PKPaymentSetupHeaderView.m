@implementation PKPaymentSetupHeaderView

- (PKPaymentSetupHeaderView)initWithFrame:(CGRect)a3
{
  PKPaymentSetupHeaderView *v3;
  UILabel *v4;
  UILabel *label;
  UILabel *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupHeaderView;
  v3 = -[PKPaymentSetupHeaderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v4;

    v6 = v3->_label;
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 25.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    -[PKPaymentSetupHeaderView addSubview:](v3, "addSubview:", v3->_label);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKPaymentSetupHeaderView _leadingPadding](self, "_leadingPadding");
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width + v6 * -2.0, height);
  v8 = v7 + 10.0;
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupHeaderView;
  -[PKPaymentSetupHeaderView layoutSubviews](&v11, sel_layoutSubviews);
  -[PKPaymentSetupHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PKPaymentSetupHeaderView _leadingPadding](self, "_leadingPadding");
  v8 = v7;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v4 + v7 * -2.0, v6);
  -[UILabel setFrame:](self->_label, "setFrame:", v8, 5.0, v9, v10);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupHeaderView;
  -[PKPaymentSetupHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[UILabel setText:](self->_label, "setText:", 0);
}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[UILabel setText:](self->_label, "setText:", v5);

  -[PKPaymentSetupHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (double)_leadingPadding
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "directionalLayoutMargins");
  v4 = v3;

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

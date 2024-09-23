@implementation PXIndexView

- (PXIndexView)init
{
  PXIndexView *v2;
  UIView *v3;
  UIView *frameView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  UILabel *v12;
  UILabel *label;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXIndexView;
  v2 = -[PXIndexView init](&v16, sel_init);
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    frameView = v2->_frameView;
    v2->_frameView = v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v2->_frameView, "setBackgroundColor:", v6);

    -[UIView layer](v2->_frameView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 3.0);

    -[UIView layer](v2->_frameView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "CGColor");
    -[UIView layer](v2->_frameView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderColor:", v10);

    -[PXIndexView addSubview:](v2, "addSubview:", v2->_frameView);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v2->_label;
    v2->_label = v12;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v2->_label, "setTextColor:", v14);

    -[UILabel setTextAlignment:](v2->_label, "setTextAlignment:", 1);
    -[PXIndexView addSubview:](v2, "addSubview:", v2->_label);
  }
  return v2;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXIndexView;
  -[PXIndexView layoutSubviews](&v11, sel_layoutSubviews);
  -[PXIndexView bounds](self, "bounds");
  v4 = v3;
  v6 = v5 + -1.0;
  -[UILabel setFrame:](self->_label, "setFrame:", 0.0, 1.0);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 8.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v7);

  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[UILabel bounds](self->_label, "bounds");
  v9 = v8;
  v10 = v4 - (v8 + 8.0);
  -[UIView setFrame:](self->_frameView, "setFrame:", v10, 0.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v10 + 4.0, 1.0, v9, v6);
}

- (void)setIndex:(unint64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_label, "setText:", v4);

  -[PXIndexView setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_frameView, 0);
}

@end

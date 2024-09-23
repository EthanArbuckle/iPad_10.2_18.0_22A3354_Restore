@implementation PXScoreView

- (PXScoreView)init
{
  PXScoreView *v2;
  void *v3;
  void *v4;
  void *v5;
  UILabel *v6;
  UILabel *label;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXScoreView;
  v2 = -[PXScoreView init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorWithAlphaComponent:", 0.5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXScoreView setBackgroundColor:](v2, "setBackgroundColor:", v4);

    -[PXScoreView layer](v2, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 3.0);

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v2->_label;
    v2->_label = v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v2->_label, "setTextColor:", v8);

    -[UILabel setAdjustsFontSizeToFitWidth:](v2->_label, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTextAlignment:](v2->_label, "setTextAlignment:", 1);
    -[PXScoreView addSubview:](v2, "addSubview:", v2->_label);
  }
  return v2;
}

- (PXScoreView)initWithColorScale:(unint64_t)a3
{
  PXScoreView *result;

  result = -[PXScoreView init](self, "init");
  if (result)
    result->_colorScale = a3;
  return result;
}

- (void)layoutSubviews
{
  UILabel *label;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXScoreView;
  -[PXScoreView layoutSubviews](&v5, sel_layoutSubviews);
  label = self->_label;
  -[PXScoreView bounds](self, "bounds");
  -[UILabel setFrame:](label, "setFrame:");
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 8.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v4);

}

- (void)setScore:(double)a3
{
  UILabel **p_label;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  if (a3 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.2f"), *(_QWORD *)&a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_label = &self->_label;
    -[UILabel setText:](self->_label, "setText:", v6);

  }
  else
  {
    p_label = &self->_label;
    -[UILabel setText:](self->_label, "setText:", CFSTR("-"));
  }
  switch(self->_colorScale)
  {
    case 1uLL:
      v7 = (void *)MEMORY[0x1E0DC3658];
      if (a3 < 0.5)
        goto LABEL_8;
      v8 = 1.0 - a3;
      v9 = 0.75;
      v10 = a3;
      goto LABEL_16;
    case 2uLL:
      v7 = (void *)MEMORY[0x1E0DC3658];
      v8 = a3 * -2.0 + 1.5;
      v10 = a3 * 2.0 + -0.5;
      goto LABEL_15;
    case 3uLL:
      v7 = (void *)MEMORY[0x1E0DC3658];
      if (a3 < 0.0)
      {
LABEL_8:
        objc_msgSend(v7, "redColor");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "colorWithAlphaComponent:", 0.75);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXScoreView setBackgroundColor:](self, "setBackgroundColor:", v11);

        goto LABEL_17;
      }
      v14 = 1.5;
      v15 = -2.0;
      goto LABEL_14;
    case 4uLL:
      v7 = (void *)MEMORY[0x1E0DC3658];
      if (a3 >= 0.0)
      {
        v14 = 1.0;
        v15 = -0.5;
LABEL_14:
        v8 = v14 + a3 * v15;
        v10 = 1.0;
LABEL_15:
        v9 = 0.75;
LABEL_16:
        objc_msgSend(v7, "colorWithRed:green:blue:alpha:", v8, v10, 0.1, v9);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        -[PXScoreView setBackgroundColor:](self, "setBackgroundColor:", v16);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "colorWithAlphaComponent:", 0.75);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXScoreView setBackgroundColor:](self, "setBackgroundColor:", v13);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.0f"), *(_QWORD *)&a3);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](*p_label, "setText:", v16);
      }
LABEL_17:

      return;
    default:
      return;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end

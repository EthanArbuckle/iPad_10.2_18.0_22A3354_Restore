@implementation PKTransitPassProductHeaderView

- (PKTransitPassProductHeaderView)initWithReuseIdentifier:(id)a3
{
  PKTransitPassProductHeaderView *v3;
  id v4;
  uint64_t v5;
  UILabel *labelView;
  UILabel *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKTransitPassProductHeaderView;
  v3 = -[PKTransitPassProductHeaderView initWithReuseIdentifier:](&v11, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    labelView = v3->_labelView;
    v3->_labelView = (UILabel *)v5;

    v7 = v3->_labelView;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B58], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    -[PKTransitPassProductHeaderView contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_labelView);

  }
  return v3;
}

- (void)setHeaderLabelText:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_headerLabelText, a3);
  v5 = a3;
  -[UILabel setText:](self->_labelView, "setText:", v5);

}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *labelView;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKTransitPassProductHeaderView;
  -[PKTransitPassProductHeaderView layoutSubviews](&v14, sel_layoutSubviews);
  -[PKTransitPassProductHeaderView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldReverseLayoutDirection");
  v5 = *MEMORY[0x1E0DC49E8];
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  if (v4)
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24) + 6.0;
  else
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (v4)
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  else
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8) + 6.0;
  labelView = self->_labelView;
  objc_msgSend(v3, "bounds");
  -[UILabel setFrame:](labelView, "setFrame:", v8 + v10, v5 + v11, v12 - (v8 + v7), v13 - (v5 + v6));

}

- (NSString)headerLabelText
{
  return self->_headerLabelText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabelText, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end

@implementation PKRewardsEducationHeaderFooterView

- (PKRewardsEducationHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  PKRewardsEducationHeaderFooterView *v3;
  id v4;
  uint64_t v5;
  UILabel *labelView;
  UILabel *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKRewardsEducationHeaderFooterView;
  v3 = -[PKRewardsEducationHeaderFooterView initWithReuseIdentifier:](&v11, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    labelView = v3->_labelView;
    v3->_labelView = (UILabel *)v5;

    v7 = v3->_labelView;
    PKLocalizedFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v8);

    -[UILabel setTextAlignment:](v3->_labelView, "setTextAlignment:", 1);
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AE8], (void *)*MEMORY[0x1E0DC48C8], 0, 0, *MEMORY[0x1E0DC1420]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_labelView, "setFont:", v9);
    -[UILabel setNumberOfLines:](v3->_labelView, "setNumberOfLines:", 0);
    -[PKRewardsEducationHeaderFooterView addSubview:](v3, "addSubview:", v3->_labelView);

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKRewardsEducationHeaderFooterView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKRewardsEducationHeaderFooterView;
  -[PKRewardsEducationHeaderFooterView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKRewardsEducationHeaderFooterView bounds](self, "bounds");
  -[PKRewardsEducationHeaderFooterView _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = a3.size.width + -40.0;
  v8 = a3.size.height + -20.0;
  -[UILabel sizeThatFits:](self->_labelView, "sizeThatFits:", a3.size.width + -40.0, a3.size.height + -20.0);
  v10 = v9;
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_labelView, "setFrame:", x + 20.0, y + 0.0, v7, v8);
  v11 = v10 + 0.0 + 20.0;
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end

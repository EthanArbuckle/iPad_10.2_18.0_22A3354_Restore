@implementation PKOneTimeCodeDigitFieldView

- (PKOneTimeCodeDigitFieldView)initWithIndex:(int64_t)a3
{
  PKOneTimeCodeDigitFieldView *v4;
  PKOneTimeCodeDigitFieldView *v5;
  void *v6;
  double v7;
  UILabel *v8;
  UILabel *label;
  UILabel *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKOneTimeCodeDigitFieldView;
  v4 = -[PKOneTimeCodeDigitFieldView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[PKOneTimeCodeDigitFieldView setLayoutMargins:](v4, "setLayoutMargins:", 8.0, 8.0, 8.0, 8.0);
    -[PKOneTimeCodeDigitFieldView layer](v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 8.0);
    objc_msgSend(v6, "setMasksToBounds:", 0);
    objc_msgSend(v6, "setShadowOffset:", 0.0, 1.0);
    LODWORD(v7) = 1.0;
    objc_msgSend(v6, "setShadowOpacity:", v7);
    objc_msgSend(v6, "setBorderWidth:", PKUIScreenScale());
    -[PKOneTimeCodeDigitFieldView _updateLayer](v5, "_updateLayer");
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v5->_label;
    v5->_label = v8;

    v10 = v5->_label;
    objc_msgSend((id)objc_opt_class(), "codeEntryFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    -[UILabel setTextAlignment:](v5->_label, "setTextAlignment:", 1);
    -[UILabel setClipsToBounds:](v5->_label, "setClipsToBounds:", 0);
    -[PKOneTimeCodeDigitFieldView addSubview:](v5, "addSubview:", v5->_label);
    -[PKOneTimeCodeDigitFieldView setAccessibilityTraits:](v5, "setAccessibilityTraits:", *MEMORY[0x1E0DC4690]);
    -[PKOneTimeCodeDigitFieldView setIsAccessibilityElement:](v5, "setIsAccessibilityElement:", 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PKOneTimeCodeDigitFieldView.%ld"), a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKOneTimeCodeDigitFieldView setAccessibilityLabel:](v5, "setAccessibilityLabel:", v12);

  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKOneTimeCodeDigitFieldView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKOneTimeCodeDigitFieldView;
  -[PKOneTimeCodeDigitFieldView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKOneTimeCodeDigitFieldView bounds](self, "bounds");
  -[PKOneTimeCodeDigitFieldView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  -[UILabel frame](self->_label, "frame");
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width, height);
  PKRectCenteredIntegralRect();
  v9 = v8;
  v11 = v10;
  if (!a4)
    -[UILabel setFrame:](self->_label, "setFrame:");
  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setHighligtType:(unint64_t)a3
{
  _QWORD *v4;

  if (self->_highligtType != a3)
  {
    self->_highligtType = a3;
    v4 = (_QWORD *)MEMORY[0x1E0DC46B0];
    if (a3 != 1)
      v4 = (_QWORD *)MEMORY[0x1E0DC4690];
    -[PKOneTimeCodeDigitFieldView setAccessibilityTraits:](self, "setAccessibilityTraits:", *v4);
    -[PKOneTimeCodeDigitFieldView _updateLayer](self, "_updateLayer");
    -[PKOneTimeCodeDigitFieldView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setText:(id)a3
{
  id v5;
  NSString *text;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  text = self->_text;
  v9 = (NSString *)v5;
  v7 = text;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_text, a3);
    -[UILabel setText:](self->_label, "setText:", self->_text);
    -[PKOneTimeCodeDigitFieldView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKOneTimeCodeDigitFieldView;
  -[PKOneTimeCodeDigitFieldView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKOneTimeCodeDigitFieldView traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        -[PKOneTimeCodeDigitFieldView _updateLayer](self, "_updateLayer");
        -[PKOneTimeCodeDigitFieldView setNeedsLayout](self, "setNeedsLayout");
      }
    }
  }

}

- (void)_updateLayer
{
  void *v3;
  _QWORD v4[5];

  -[PKOneTimeCodeDigitFieldView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PKOneTimeCodeDigitFieldView__updateLayer__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

}

void __43__PKOneTimeCodeDigitFieldView__updateLayer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 440);
  switch(v3)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.781, 0.873, 0.985, 1.0);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v5 = (void *)v4;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v7 = (void *)v6;
      v2 = *(_QWORD *)(a1 + 32);
      goto LABEL_10;
  }
  v7 = 0;
  v5 = 0;
LABEL_10:
  if (*(_BYTE *)(v2 + 424))
    v8 = 6.0;
  else
    v8 = 0.0;
  v9 = objc_retainAutorelease(v5);
  objc_msgSend(v11, "setBorderColor:", objc_msgSend(v9, "CGColor"));
  v10 = objc_retainAutorelease(v7);
  objc_msgSend(v11, "setShadowColor:", objc_msgSend(v10, "CGColor"));
  objc_msgSend(v11, "setShadowRadius:", v8);

}

+ (id)codeEntryFont
{
  return PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48C8], 2, 32);
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (unint64_t)highligtType
{
  return self->_highligtType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

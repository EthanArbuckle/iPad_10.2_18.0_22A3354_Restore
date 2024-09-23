@implementation PKPeerPaymentNumberPadActionButton

+ (CGSize)referenceSizeForSizeCategory:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(a1, "adjustSize:forSizeCategory:", a3, 70.0);
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)fontSizeForSizeCategory:(unint64_t)a3
{
  double result;

  objc_msgSend(a1, "adjustSize:forSizeCategory:", a3, 36.0);
  return result;
}

+ (double)adjustSize:(double)a3 forSizeCategory:(unint64_t)a4
{
  double v6;

  if ((PKIsPad() & 1) != 0 || PKIsPhone())
  {
    if (a4 == 1)
    {
      v6 = 0.8;
      return a3 * v6;
    }
    if (!a4)
    {
      v6 = 0.7;
      return a3 * v6;
    }
  }
  return a3;
}

- (PKPeerPaymentNumberPadActionButton)initWithSizeCategory:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PKPeerPaymentNumberPadActionButton *v11;
  PKPeerPaymentNumberPadActionButton *v12;
  objc_super v14;

  objc_msgSend((id)objc_opt_class(), "referenceSizeForSizeCategory:", a3);
  v6 = v5;
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentNumberPadActionButton;
  v11 = -[PKPeerPaymentMessagesButton initWithFrame:](&v14, sel_initWithFrame_, v9, v10, v6, v8);
  v12 = v11;
  if (v11)
  {
    v11->_sizeCategory = a3;
    -[PKPeerPaymentNumberPadActionButton _updateForFontSize](v11, "_updateForFontSize");
    -[PKPeerPaymentMessagesButton setHighlighted:](v12, "setHighlighted:", 0);
  }
  return v12;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentNumberPadActionButton;
  -[PKPeerPaymentMessagesButton layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPeerPaymentNumberPadActionButton bounds](self, "bounds");
  CGRectGetWidth(v4);
  PKFloatRoundToPixel();
  -[PKPeerPaymentNumberPadActionButton _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
}

- (void)setSizeCategory:(unint64_t)a3
{
  if (self->_sizeCategory != a3)
  {
    self->_sizeCategory = a3;
    -[PKPeerPaymentNumberPadActionButton _updateForFontSize](self, "_updateForFontSize");
  }
}

- (void)setAction:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  self->_action = a3;
  if (a3 == 12)
  {
    objc_msgSend((id)objc_opt_class(), "adjustSize:forSizeCategory:", self->_sizeCategory, 30.0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("delete.backward"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentNumberPadActionButton setImage:forState:](self, "setImage:forState:", v6, 0);

    +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentNumberPadActionButton setTintColor:](self, "setTintColor:", v7);

    -[PKPeerPaymentNumberPadActionButton setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[PKPeerPaymentNumberPadActionButton _titleForAction:](self, "_titleForAction:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentNumberPadActionButton setTitle:forState:](self, "setTitle:forState:", v5, 0);
  }

  -[PKPeerPaymentNumberPadActionButton _axIDForAction:](self, "_axIDForAction:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentNumberPadActionButton setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v8);

}

- (id)_titleForAction:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (qword_1EE4F9188 != -1)
    dispatch_once(&qword_1EE4F9188, &__block_literal_global_281);
  switch(a3)
  {
    case 1uLL:
      v4 = (void *)qword_1EE4F9180;
      v5 = &unk_1E3FAD360;
      goto LABEL_16;
    case 2uLL:
      v4 = (void *)qword_1EE4F9180;
      v5 = &unk_1E3FAD378;
      goto LABEL_16;
    case 3uLL:
      v4 = (void *)qword_1EE4F9180;
      v5 = &unk_1E3FAD390;
      goto LABEL_16;
    case 4uLL:
      v4 = (void *)qword_1EE4F9180;
      v5 = &unk_1E3FAD3A8;
      goto LABEL_16;
    case 5uLL:
      v4 = (void *)qword_1EE4F9180;
      v5 = &unk_1E3FAD3C0;
      goto LABEL_16;
    case 6uLL:
      v4 = (void *)qword_1EE4F9180;
      v5 = &unk_1E3FAD3D8;
      goto LABEL_16;
    case 7uLL:
      v4 = (void *)qword_1EE4F9180;
      v5 = &unk_1E3FAD3F0;
      goto LABEL_16;
    case 8uLL:
      v4 = (void *)qword_1EE4F9180;
      v5 = &unk_1E3FAD408;
      goto LABEL_16;
    case 9uLL:
      v4 = (void *)qword_1EE4F9180;
      v5 = &unk_1E3FAD420;
      goto LABEL_16;
    case 0xAuLL:
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "decimalSeparator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    case 0xBuLL:
      v4 = (void *)qword_1EE4F9180;
      v5 = &unk_1E3FAD438;
LABEL_16:
      objc_msgSend(v4, "stringFromNumber:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

uint64_t __54__PKPeerPaymentNumberPadActionButton__titleForAction___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)qword_1EE4F9180;
  qword_1EE4F9180 = (uint64_t)v0;

  v2 = (void *)qword_1EE4F9180;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)qword_1EE4F9180, "setFormattingContext:", 2);
}

- (id)_axIDForAction:(unint64_t)a3
{
  id *v3;

  if (a3 == 12)
  {
    v3 = (id *)MEMORY[0x1E0D67AD8];
    return *v3;
  }
  if (a3 == 10)
  {
    v3 = (id *)MEMORY[0x1E0D67AC8];
    return *v3;
  }
  -[PKPeerPaymentNumberPadActionButton _titleForAction:](self, "_titleForAction:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateForFontSize
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v3 = 36.0;
  if (self->_action == 12)
    v3 = 30.0;
  +[PKPeerPaymentNumberPadActionButton adjustSize:forSizeCategory:](PKPeerPaymentNumberPadActionButton, "adjustSize:forSizeCategory:", self->_sizeCategory, v3);
  v5 = v4;
  -[PKPeerPaymentNumberPadActionButton titleLabel](self, "titleLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "pk_textCondensedSemiboldCashFontOfSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pk_fixedWidthFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

}

- (unint64_t)action
{
  return self->_action;
}

- (unint64_t)sizeCategory
{
  return self->_sizeCategory;
}

@end

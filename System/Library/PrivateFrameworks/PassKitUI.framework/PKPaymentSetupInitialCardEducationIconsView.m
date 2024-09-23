@implementation PKPaymentSetupInitialCardEducationIconsView

- (PKPaymentSetupInitialCardEducationIconsView)initWithFrame:(CGRect)a3
{
  PKPaymentSetupInitialCardEducationIconsView *v3;
  CGFloat *p_width;
  CGFloat *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIImageView *applePayIcon;
  UIImageView *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIImageView *contactlessIcon;
  UIImageView *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PKPaymentSetupInitialCardEducationIconsView;
  v3 = -[PKPaymentSetupInitialCardEducationIconsView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    p_width = &v3->_applePayIconSize.width;
    if ((unint64_t)PKUIGetMinScreenType() < 4)
    {
      *(_OWORD *)p_width = xmmword_19DF16410;
      v5 = &v3->_contactlessIconSize.width;
      v3->_contactlessIconSize.width = 62.0;
      v6 = 0x4042800000000000;
    }
    else
    {
      *(_OWORD *)p_width = xmmword_19DF16420;
      v5 = &v3->_contactlessIconSize.width;
      v3->_contactlessIconSize.width = 67.0;
      v6 = 0x4044000000000000;
    }
    *((_QWORD *)v5 + 1) = v6;
    PKPassKitUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = PKUIScreenScale();
    objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("ApplePayLogoBlackBorder"), CFSTR("pdf"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIImageFromPDF(v9, *p_width, v3->_applePayIconSize.height, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithRenderingMode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "initWithImage:", v12);
    applePayIcon = v3->_applePayIcon;
    v3->_applePayIcon = (UIImageView *)v13;

    -[UIImageView setContentMode:](v3->_applePayIcon, "setContentMode:", 1);
    v15 = v3->_applePayIcon;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v15, "setTintColor:", v16);

    -[PKPaymentSetupInitialCardEducationIconsView addSubview:](v3, "addSubview:", v3->_applePayIcon);
    objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("ContactlessSymbol"), CFSTR("pdf"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIImageFromPDF(v17, *v5, v5[1], v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageWithRenderingMode:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "initWithImage:", v20);
    contactlessIcon = v3->_contactlessIcon;
    v3->_contactlessIcon = (UIImageView *)v21;

    -[UIImageView setContentMode:](v3->_contactlessIcon, "setContentMode:", 1);
    v23 = v3->_contactlessIcon;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v23, "setTintColor:", v24);

    -[PKPaymentSetupInitialCardEducationIconsView addSubview:](v3, "addSubview:", v3->_contactlessIcon);
  }
  return v3;
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKPaymentSetupInitialCardEducationIconsView;
  -[PKPaymentSetupInitialCardEducationIconsView layoutSubviews](&v19, sel_layoutSubviews);
  -[PKPaymentSetupInitialCardEducationIconsView bounds](self, "bounds");
  -[PKPaymentSetupInitialCardEducationIconsView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  PKSizeAspectFit();
  PKSizeAspectFit();
  PKSizeAlignedInRect();
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIImageView setFrame:](self->_applePayIcon, "setFrame:", v4, v6, v8, v10);
  -[UIImageView setFrame:](self->_contactlessIcon, "setFrame:", v12, v14, v16, v18);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double height;
  double v4;

  height = self->_applePayIconSize.height;
  if (height <= self->_contactlessIconSize.height)
    height = self->_contactlessIconSize.height;
  v4 = height + 20.0;
  result.height = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactlessIcon, 0);
  objc_storeStrong((id *)&self->_applePayIcon, 0);
}

@end

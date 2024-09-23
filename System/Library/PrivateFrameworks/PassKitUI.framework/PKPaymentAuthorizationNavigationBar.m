@implementation PKPaymentAuthorizationNavigationBar

+ (id)_leftBarButtonItemWithImage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  CGRect v21;
  CGRect v22;

  v3 = (objc_class *)MEMORY[0x1E0DC3890];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImage:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v9, v11, v13);
  objc_msgSend(v15, "addSubview:", v5);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceLayoutDirection");

  if (v17 == 1)
    v18 = 4.0;
  else
    v18 = -4.0;
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  v22 = CGRectOffset(v21, v18, 1.0);
  objc_msgSend(v5, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v15);

  return v19;
}

+ (id)cardOnFileBarButtonItemForRequestor:(unint64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 > 5)
    v4 = 0;
  else
    v4 = off_1E3E78938[a3];
  PKUIImageNamed(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_leftBarButtonItemWithImage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)applePayBarButtonItem
{
  void *v3;
  void *v4;
  void *v5;

  PKUIImageNamed(CFSTR("Payment_Logo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_leftBarButtonItemWithImage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PKPaymentAuthorizationNavigationBar)initWithFrame:(CGRect)a3
{
  PKPaymentAuthorizationNavigationBar *v3;
  UILabel *v4;
  UILabel *environmentLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKPaymentAuthorizationNavigationBar;
  v3 = -[PKPaymentAuthorizationNavigationBar initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    environmentLabel = v3->_environmentLabel;
    v3->_environmentLabel = v4;

    v6 = v3->_environmentLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    v8 = v3->_environmentLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    v10 = v3->_environmentLabel;
    PKLocalizedEnvironmentHint();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10, "setText:", v11);

    -[UILabel sizeToFit](v3->_environmentLabel, "sizeToFit");
    -[PKPaymentAuthorizationNavigationBar addSubview:](v3, "addSubview:", v3->_environmentLabel);
    v12 = objc_alloc_init(MEMORY[0x1E0DC3870]);
    -[PKPaymentAuthorizationNavigationBar setBackgroundImage:forBarMetrics:](v3, "setBackgroundImage:forBarMetrics:", v12, 0);
    -[PKPaymentAuthorizationNavigationBar setTranslucent:](v3, "setTranslucent:", 1);
    -[PKPaymentAuthorizationNavigationBar didUpdateInterfaceStyle](v3, "didUpdateInterfaceStyle");

  }
  return v3;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationNavigationBar;
  -[PKPaymentAuthorizationNavigationBar _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKPaymentAuthorizationNavigationBar didUpdateInterfaceStyle](self, "didUpdateInterfaceStyle");
}

- (void)didUpdateInterfaceStyle
{
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__57;
  v9 = __Block_byref_object_dispose__57;
  v10 = 0;
  -[PKPaymentAuthorizationNavigationBar traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__PKPaymentAuthorizationNavigationBar_didUpdateInterfaceStyle__block_invoke;
  v4[3] = &unk_1E3E62060;
  v4[4] = &v5;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

  -[PKPaymentAuthorizationNavigationBar setShadowImage:](self, "setShadowImage:", v6[5]);
  _Block_object_dispose(&v5, 8);

}

void __62__PKPaymentAuthorizationNavigationBar_didUpdateInterfaceStyle__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0DC3870];
  PKAuthorizationSeparatorColor();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pkui_imageWithColor:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKPaymentAuthorizationNavigationBar;
  -[PKPaymentAuthorizationNavigationBar layoutSubviews](&v14, sel_layoutSubviews);
  -[PKPaymentAuthorizationNavigationBar backItem](self, "backItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0.0;
  if (!v3)
  {
    -[PKPaymentAuthorizationNavigationBar topItem](self, "topItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leftBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UILabel frame](self->_environmentLabel, "frame");
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

      objc_msgSend(v7, "frame");
      if (v9 == 1)
        CGRectGetMinX(*(CGRect *)&v10);
      else
        CGRectGetMaxX(*(CGRect *)&v10);
      -[PKPaymentAuthorizationNavigationBar frame](self, "frame");
      UIRectCenteredYInRect();
      -[UILabel setFrame:](self->_environmentLabel, "setFrame:");
      v4 = 1.0;
    }

  }
  -[UILabel setAlpha:](self->_environmentLabel, "setAlpha:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentLabel, 0);
}

@end

@implementation PKPaymentBarcodeViewController

- (PKPaymentBarcodeViewController)initWithPass:(id)a3
{
  id v5;
  PKPaymentBarcodeViewController *v6;
  PKPaymentBarcodeViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentBarcodeViewController;
  v6 = -[PKPaymentBarcodeViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pass, a3);

  return v7;
}

- (void)viewDidLoad
{
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  UIButton *closeButton;
  void *v13;
  UILabel *v14;
  UILabel *disclaimerText;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  id v22;
  void *v23;
  PKBarcodeStickerView *v24;
  void *v25;
  void *v26;
  void *v27;
  PKRightAngleRotatingView *v28;
  PKRightAngleRotatingView *barcodeView;
  void *v30;
  id v31;
  void *v32;
  UIImageView *v33;
  UIImageView *compactBankLogoView;
  _QWORD v35[4];
  id v36;
  id location[2];
  __int128 v38;
  double v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)PKPaymentBarcodeViewController;
  -[PKPaymentBarcodeViewController viewDidLoad](&v40, sel_viewDidLoad);
  -[PKPaymentBarcodeViewController _barcodePadding](self, "_barcodePadding");
  v3 = v38;
  *(_OWORD *)&self->_viewSizeInfo.barcodeTopPadding = *(_OWORD *)location;
  *(_OWORD *)&self->_viewSizeInfo.disclaimerSidePadding = v3;
  self->_viewSizeInfo.altTextInset = v39;
  -[PKPaymentBarcodeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3520];
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("xmark.circle.fill"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v6, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(location, self);
  v9 = (void *)MEMORY[0x1E0DC3428];
  v35[1] = 3221225472;
  v35[2] = __45__PKPaymentBarcodeViewController_viewDidLoad__block_invoke;
  v35[3] = &unk_1E3E62BD0;
  v35[0] = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v36, location);
  objc_msgSend(v9, "actionWithHandler:", v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v8, v10);
  v11 = (UIButton *)objc_claimAutoreleasedReturnValue();
  closeButton = self->_closeButton;
  self->_closeButton = v11;

  objc_msgSend(v4, "addSubview:", self->_closeButton);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v13);

  -[PKPaymentBarcodeViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 1);
  v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  disclaimerText = self->_disclaimerText;
  self->_disclaimerText = v14;

  v16 = self->_disclaimerText;
  PKLocalizedAquamanString(CFSTR("AQUAMAN_FRAUD_WARNING"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v16, "setText:", v17);

  objc_msgSend(v4, "addSubview:", self->_disclaimerText);
  -[UILabel setNumberOfLines:](self->_disclaimerText, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_disclaimerText, "setTextAlignment:", 1);
  v18 = self->_disclaimerText;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v18, "setFont:", v19);

  v20 = self->_disclaimerText;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v20, "setTextColor:", v21);

  v22 = objc_alloc_init(MEMORY[0x1E0D66BD0]);
  objc_msgSend(v22, "setFormat:", 4);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_barcodeData, 4);
  objc_msgSend(v22, "setAltText:", v23);

  objc_msgSend(v22, "setMessageData:", self->_barcodeData);
  objc_msgSend(v22, "setShouldRemoveQuietZone:", 1);
  v24 = -[PKBarcodeStickerView initWithBarcode:validityState:]([PKBarcodeStickerView alloc], "initWithBarcode:validityState:", v22, 0);
  -[PKBarcodeStickerView setAltTextInset:](v24, "setAltTextInset:", self->_viewSizeInfo.altTextInset);
  v25 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "pointSize");
  objc_msgSend(v25, "monospacedSystemFontOfSize:weight:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKBarcodeStickerView setAltTextFont:](v24, "setAltTextFont:", v27);
  -[PKBarcodeStickerView setAccessibilityElementsHidden:](v24, "setAccessibilityElementsHidden:", 1);
  -[PKBarcodeStickerView setShouldMatteCode:](v24, "setShouldMatteCode:", 0);
  -[PKPaymentBarcodeViewController _barcodeSize](self, "_barcodeSize");
  -[PKBarcodeStickerView setDesiredBarcodeSize:](v24, "setDesiredBarcodeSize:");
  v28 = -[PKRightAngleRotatingView initWithRotatedView:]([PKRightAngleRotatingView alloc], "initWithRotatedView:", v24);
  barcodeView = self->_barcodeView;
  self->_barcodeView = v28;

  -[PKRightAngleRotatingView setOrientation:](self->_barcodeView, "setOrientation:", 3);
  if ((PKShowBarcodeForScreenshotAndBroadcasting() & 1) == 0)
    -[UIView pkui_setExcludedFromScreenCapture:andBroadcasting:](self->_barcodeView, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
  -[PKPaymentPass compactBankLogoDarkImage](self->_pass, "compactBankLogoDarkImage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (UIImageView *)objc_msgSend(v31, "initWithImage:", v32);
  compactBankLogoView = self->_compactBankLogoView;
  self->_compactBankLogoView = v33;

  -[UIImageView setContentMode:](self->_compactBankLogoView, "setContentMode:", 1);
  objc_msgSend(v4, "addSubview:", self->_compactBankLogoView);
  objc_msgSend(v4, "addSubview:", self->_barcodeView);

  objc_destroyWeak(&v36);
  objc_destroyWeak(location);

}

void __45__PKPaymentBarcodeViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_closeButtonPressed:", v4);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
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
  UILabel *disclaimerText;
  double v15;
  CGFloat v16;
  CGFloat v17;
  UIButton *closeButton;
  double v19;
  UILabel *v20;
  PKRightAngleRotatingView *barcodeView;
  void *v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect slice;
  objc_super v27;
  CGRect v28;

  v27.receiver = self;
  v27.super_class = (Class)PKPaymentBarcodeViewController;
  -[PKPaymentBarcodeViewController viewWillLayoutSubviews](&v27, sel_viewWillLayoutSubviews);
  -[PKPaymentBarcodeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKPaymentBarcodeViewController _barcodeSize](self, "_barcodeSize");
  v13 = v12;
  memset(&slice, 0, sizeof(slice));
  v25.origin.x = v5;
  v25.origin.y = v7;
  disclaimerText = self->_disclaimerText;
  v25.size.width = v9;
  v25.size.height = v11;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](disclaimerText, "pkui_sizeThatFits:forceWordWrap:", 1, v9 + self->_viewSizeInfo.disclaimerSidePadding * -2.0, 1.79769313e308);
  v16 = v15;
  v17 = (v11
       - (v13
        + self->_viewSizeInfo.disclaimerToBarcodePadding
        + v15
        + self->_viewSizeInfo.bankToDisclaimerPadding
        + 24.0
        + self->_viewSizeInfo.barcodeTopPadding * 2.0))
      * 0.5
      + 8.0;
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  CGRectDivide(v28, &slice, &v25, v17, CGRectMinYEdge);
  closeButton = self->_closeButton;
  if (closeButton)
  {
    -[UIButton sizeToFit](closeButton, "sizeToFit");
    -[UIButton frame](self->_closeButton, "frame");
    -[UIButton setFrame:](self->_closeButton, "setFrame:", v5 + v9 - v19 + -12.0, v7 + 12.0);
  }
  if (self->_compactBankLogoView)
  {
    CGRectDivide(v25, &slice, &v25, 24.0, CGRectMinYEdge);
    -[UIImageView setFrame:](self->_compactBankLogoView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  CGRectDivide(v25, &slice, &v25, self->_viewSizeInfo.bankToDisclaimerPadding, CGRectMinYEdge);
  if (self->_disclaimerText)
  {
    CGRectDivide(v25, &slice, &v25, v16, CGRectMinYEdge);
    v20 = self->_disclaimerText;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](v20, "setFrame:");
  }
  CGRectDivide(v25, &slice, &v25, self->_viewSizeInfo.disclaimerToBarcodePadding + self->_viewSizeInfo.barcodeTopPadding, CGRectMinYEdge);
  barcodeView = self->_barcodeView;
  if (barcodeView)
  {
    -[PKRightAngleRotatingView rotatedView](barcodeView, "rotatedView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sizeThatFits:", v13, 1.79769313e308);
    v24 = v23;

    CGRectDivide(v25, &slice, &v25, v13, CGRectMinYEdge);
    -[PKRightAngleRotatingView setBounds:](self->_barcodeView, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v24, v13);
    -[PKRightAngleRotatingView setCenter:](self->_barcodeView, "setCenter:", v9 * 0.5, v13 * 0.5 + slice.origin.y);
  }
}

- (void)invalidate
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PKPaymentBarcodeViewController_invalidate__block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__PKPaymentBarcodeViewController_invalidate__block_invoke_2;
  v2[3] = &unk_1E3E62288;
  objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 4, v3, v2);
}

uint64_t __44__PKPaymentBarcodeViewController_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setAlpha:", 0.0);
}

void __44__PKPaymentBarcodeViewController_invalidate__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 968);
  *(_QWORD *)(v2 + 968) = 0;

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_closeButtonPressed:(id)a3
{
  id v3;

  -[PKPaymentBarcodeViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- ($3CC2805F0189FCCE51047C0D2B5A52A9)_barcodePadding
{
  $3CC2805F0189FCCE51047C0D2B5A52A9 *result;
  double v5;
  double v6;
  double v7;
  double v8;

  retstr->var4 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  result = ($3CC2805F0189FCCE51047C0D2B5A52A9 *)PKUIGetMinScreenWidthType();
  if ((unint64_t)result <= 0xC)
  {
    v5 = dbl_19DF17D40[(_QWORD)result];
    v6 = dbl_19DF17DA8[(_QWORD)result];
    v7 = dbl_19DF17E10[(_QWORD)result];
    v8 = dbl_19DF17E78[(_QWORD)result];
    *(_QWORD *)&retstr->var0 = qword_19DF17CD8[(_QWORD)result];
    retstr->var1 = v5;
    retstr->var2 = v6;
    retstr->var3 = v7;
    retstr->var4 = v8;
  }
  return result;
}

- (CGSize)_barcodeSize
{
  unint64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = PKUIGetMinScreenWidthType();
  if (v2 > 0xC)
  {
    v4 = *MEMORY[0x1E0C9D820];
    v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v3 = dbl_19DF17EE0[v2];
    v4 = dbl_19DF17F48[v2];
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (NSData)barcodeData
{
  return self->_barcodeData;
}

- (void)setBarcodeData:(id)a3
{
  objc_storeStrong((id *)&self->_barcodeData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodeData, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_compactBankLogoView, 0);
  objc_storeStrong((id *)&self->_barcodeGuide, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_disclaimerText, 0);
  objc_storeStrong((id *)&self->_barcodeView, 0);
}

@end

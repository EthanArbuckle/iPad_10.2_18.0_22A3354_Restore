@implementation PKPassPaymentCardFrontFaceView

- (void)layoutSubviews
{
  int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *balanceLabel;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGRectEdge v14;
  UILabel *v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  PKBackdropView *backdropView;
  double v22;
  void *v23;
  UIView *scrimView;
  double v25;
  void *v26;
  UIButton *fullScreenButton;
  double v28;
  UIImageView *compactBankLogoView;
  void *v30;
  double v31;
  double v32;
  PKBarcodeStickerView *topBarcodeView;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSMutableArray *oldTopBarcodeViews;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSMutableArray *oldBottomBarcodeViews;
  _QWORD v49[6];
  _QWORD v50[8];
  CGRect slice;
  CGRect remainder;
  objc_super v53;
  CGRect v54;

  v53.receiver = self;
  v53.super_class = (Class)PKPassPaymentCardFrontFaceView;
  -[PKPassFrontFaceView layoutSubviews](&v53, sel_layoutSubviews);
  v3 = -[PKPassPaymentCardFrontFaceView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKPassFaceView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  balanceLabel = self->_balanceLabel;
  if (balanceLabel)
  {
    v10 = v5;
    v11 = v6;
    v12 = v7;
    v13 = v8;
    if (v3)
      v14 = CGRectMinXEdge;
    else
      v14 = CGRectMaxXEdge;
    -[UILabel sizeToFit](balanceLabel, "sizeToFit");
    -[UILabel frame](self->_balanceLabel, "frame");
    remainder.origin.x = v10;
    remainder.origin.y = v11;
    remainder.size.width = v12;
    remainder.size.height = v13;
    memset(&slice, 0, sizeof(slice));
    v54.origin.x = v10;
    v54.origin.y = v11;
    v54.size.width = v12;
    v54.size.height = v13;
    CGRectDivide(v54, &slice, &remainder, 14.0, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 20.0, v14);
    v15 = self->_balanceLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](v15, "setFrame:");
  }
  v16 = -[PKPassFaceView viewExpanded](self, "viewExpanded");
  PKPassFrontFaceContentSize();
  v18 = v17;
  v20 = v19;
  -[PKPassPaymentCardFrontFaceView _barcodePadding](self, "_barcodePadding");
  backdropView = self->_backdropView;
  if (backdropView)
  {
    if (v16)
      v22 = v18;
    else
      v22 = v20;
    -[PKBackdropView setFrame:](backdropView, "setFrame:", 0.0, 0.0, v18, v22);
    -[PKBackdropView layer](self->_backdropView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentStyleApplyCorners();

  }
  scrimView = self->_scrimView;
  if (scrimView)
  {
    if (v16)
      v25 = v18;
    else
      v25 = v20;
    -[UIView setFrame:](scrimView, "setFrame:", 0.0, 0.0, v18, v25);
    -[UIView layer](self->_scrimView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentStyleApplyCorners();

  }
  fullScreenButton = self->_fullScreenButton;
  if (fullScreenButton)
  {
    -[UIButton sizeToFit](fullScreenButton, "sizeToFit");
    -[UIButton frame](self->_fullScreenButton, "frame");
    -[UIButton setCenter:](self->_fullScreenButton, "setCenter:", v18 - v28, v28 + 5.0);
  }
  compactBankLogoView = self->_compactBankLogoView;
  if (compactBankLogoView)
  {
    -[UIImageView image](compactBankLogoView, "image");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "size");

    PKSizeAspectFit();
    PKSizeRoundToPixel();
    -[UIImageView setFrame:](self->_compactBankLogoView, "setFrame:", 16.0, 16.0, v31, v32);
  }
  topBarcodeView = self->_topBarcodeView;
  v34 = MEMORY[0x1E0C809B0];
  if (topBarcodeView)
    goto LABEL_23;
  if (-[NSMutableArray count](self->_oldTopBarcodeViews, "count"))
  {
    topBarcodeView = self->_topBarcodeView;
LABEL_23:
    -[PKBarcodeStickerView frame](topBarcodeView, "frame");
    PKRectRoundToPixel();
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    -[PKBarcodeStickerView setFrame:](self->_topBarcodeView, "setFrame:");
    oldTopBarcodeViews = self->_oldTopBarcodeViews;
    v50[0] = v34;
    v50[1] = 3221225472;
    v50[2] = __48__PKPassPaymentCardFrontFaceView_layoutSubviews__block_invoke;
    v50[3] = &__block_descriptor_64_e37_v32__0__PKBarcodeStickerView_8Q16_B24l;
    v50[4] = v36;
    v50[5] = v38;
    v50[6] = v40;
    v50[7] = v42;
    -[NSMutableArray enumerateObjectsUsingBlock:](oldTopBarcodeViews, "enumerateObjectsUsingBlock:", v50);
  }
  if (self->_bottomBarcodeView || -[NSMutableArray count](self->_oldBottomBarcodeViews, "count"))
  {
    -[PKBarcodeStickerView frame](self->_bottomBarcodeView, "frame");
    PKPointRoundToPixel();
    v45 = v44;
    v47 = v46;
    -[PKBarcodeStickerView setCenter:](self->_bottomBarcodeView, "setCenter:");
    oldBottomBarcodeViews = self->_oldBottomBarcodeViews;
    v49[0] = v34;
    v49[1] = 3221225472;
    v49[2] = __48__PKPassPaymentCardFrontFaceView_layoutSubviews__block_invoke_2;
    v49[3] = &__block_descriptor_48_e37_v32__0__PKBarcodeStickerView_8Q16_B24l;
    v49[4] = v45;
    v49[5] = v47;
    -[NSMutableArray enumerateObjectsUsingBlock:](oldBottomBarcodeViews, "enumerateObjectsUsingBlock:", v49);
  }

}

- (double)_barcodePadding
{
  unint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 0.0;
  if (v2 <= 0xC)
    return dbl_19DF16108[v2];
  return result;
}

- (CGSize)contentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PKPassFaceView pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  PKPassFrontFaceContentSize();
  v5 = v4;
  v7 = v6;
  if (-[PKPassFaceView viewExpanded](self, "viewExpanded"))
    v7 = v5;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)createBodyContentViews
{
  void *v3;
  void *v4;
  PKBackdropView *backdropView;
  PKBackdropView *v6;
  PKBackdropView *v7;
  void *v8;
  void *v9;
  void *v10;
  UIView *scrimView;
  UIView *v12;
  UIView *v13;
  UIView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIButton *v23;
  UIButton *fullScreenButton;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  UIImageView *v29;
  UIImageView *compactBankLogoView;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  id location;
  objc_super v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)PKPassPaymentCardFrontFaceView;
  -[PKPassFrontFaceView createBodyContentViews](&v37, sel_createBodyContentViews);
  -[PKPassFaceView pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "supportsBarcodePayment"))
  {
    backdropView = self->_backdropView;
    if (!backdropView)
    {
      v6 = objc_alloc_init(PKBackdropView);
      v7 = self->_backdropView;
      self->_backdropView = v6;

      -[PKBackdropView setAlpha:](self->_backdropView, "setAlpha:", 0.0);
      -[PKBackdropView backdropLayer](self->_backdropView, "backdropLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (UIAccessibilityIsReduceTransparencyEnabled())
      {
        objc_msgSend(v8, "setFilters:", 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setName:", CFSTR("gaussianBlur"));
        objc_msgSend(v9, "setValue:forKey:", &unk_1E3FAD210, CFSTR("inputRadius"));
        objc_msgSend(v8, "setScale:", 0.1);
        v38[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setFilters:", v10);

      }
      backdropView = self->_backdropView;
    }
    -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", backdropView, 2);
    scrimView = self->_scrimView;
    if (!scrimView)
    {
      v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v13 = self->_scrimView;
      self->_scrimView = v12;

      -[UIView setClipsToBounds:](self->_scrimView, "setClipsToBounds:", 1);
      v14 = self->_scrimView;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

      -[UIView setAlpha:](self->_scrimView, "setAlpha:", 0.0);
      v16 = (void *)MEMORY[0x1E0DC3520];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.left.and.arrow.down.right"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, 2, 18.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v21 = (void *)MEMORY[0x1E0DC3428];
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __56__PKPassPaymentCardFrontFaceView_createBodyContentViews__block_invoke;
      v34 = &unk_1E3E62BD0;
      objc_copyWeak(&v35, &location);
      objc_msgSend(v21, "actionWithHandler:", &v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v20, v22, v31, v32, v33, v34);
      v23 = (UIButton *)objc_claimAutoreleasedReturnValue();
      fullScreenButton = self->_fullScreenButton;
      self->_fullScreenButton = v23;

      -[UIButton setConfigurationUpdateHandler:](self->_fullScreenButton, "setConfigurationUpdateHandler:", &__block_literal_global_88);
      -[UIButton setOverrideUserInterfaceStyle:](self->_fullScreenButton, "setOverrideUserInterfaceStyle:", 1);
      -[UIView addSubview:](self->_scrimView, "addSubview:", self->_fullScreenButton);
      -[PKPassFaceView pass](self, "pass");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "compactBankLogoDarkImage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_alloc(MEMORY[0x1E0DC3890]);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (UIImageView *)objc_msgSend(v27, "initWithImage:", v28);
      compactBankLogoView = self->_compactBankLogoView;
      self->_compactBankLogoView = v29;

      -[UIView addSubview:](self->_scrimView, "addSubview:", self->_compactBankLogoView);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);

      scrimView = self->_scrimView;
    }
    -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", scrimView, 2);
  }

}

- (void)setModallyPresented:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassPaymentCardFrontFaceView;
  -[PKPassFaceView setModallyPresented:](&v6, sel_setModallyPresented_, a3);
  -[PKPassFaceView pass](self, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "associatedAccountFeatureIdentifier") == 4)
    -[PKPassPaymentCardFrontFaceView _updateAccountBalanceVisibilityAnimated:](self, "_updateAccountBalanceVisibilityAnimated:", 1);

}

- (PKPassPaymentCardFrontFaceView)initWithStyle:(int64_t)a3
{
  PKPassPaymentCardFrontFaceView *v3;
  NSMutableArray *v4;
  NSMutableArray *oldTopBarcodeViews;
  NSMutableArray *v6;
  NSMutableArray *oldBottomBarcodeViews;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassPaymentCardFrontFaceView;
  v3 = -[PKPassFrontFaceView initWithStyle:](&v9, sel_initWithStyle_, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    oldTopBarcodeViews = v3->_oldTopBarcodeViews;
    v3->_oldTopBarcodeViews = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    oldBottomBarcodeViews = v3->_oldBottomBarcodeViews;
    v3->_oldBottomBarcodeViews = v6;

  }
  return v3;
}

- (void)createHeaderContentViews
{
  void *v3;
  void *v4;
  UILabel *balanceLabel;
  objc_super v6;

  -[PKPassFaceView pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "hasAssociatedPeerPaymentAccount") & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPassPaymentCardFrontFaceView;
    -[PKPassFrontFaceView createHeaderContentViews](&v6, sel_createHeaderContentViews);
  }
  balanceLabel = self->_balanceLabel;
  if (balanceLabel)
    -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", balanceLabel, 0);

}

- (void)setShowsLiveBalance:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  if (a3)
  {
    -[PKPassFaceView pass](self, "pass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "hasAssociatedPeerPaymentAccount"))
    {
      objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "account");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "associatedPassUniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (v10)
      {
        if (!self->_balanceLabel)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__handlePeerPaymentAccountChanged_, *MEMORY[0x1E0D6B288], v6);

        }
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPassPaymentCardFrontFaceView _initializeBalanceLabelWithTextColor:](self, "_initializeBalanceLabelWithTextColor:", v12);

        objc_msgSend(v7, "currentBalance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPassPaymentCardFrontFaceView _updateBalanceWithAmount:](self, "_updateBalanceWithAmount:", v13);

        -[UILabel setAlpha:](self->_balanceLabel, "setAlpha:", 1.0);
      }

    }
    else if (objc_msgSend(v5, "associatedAccountFeatureIdentifier") == 4)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __54__PKPassPaymentCardFrontFaceView_setShowsLiveBalance___block_invoke;
      v15[3] = &unk_1E3E67670;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v14, "defaultAccountForFeature:completion:", 4, v15);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }

  }
  else
  {
    -[UILabel setAlpha:](self->_balanceLabel, "setAlpha:", 0.0);
  }
}

- (id)templateForLayoutMode:(int64_t)a3
{
  PKPassFaceTemplate *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  int v26;
  BOOL v27;
  int v28;
  PKPassBucketTemplate *v29;
  double v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PKPassBucketTemplate *v44;
  double v45;
  double v46;
  void *v47;
  __CFString *v48;
  __CFString *v49;
  uint64_t v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  PKPassBucketTemplate *v60;
  double v61;
  void *v62;
  __CFString *v63;
  __CFString *v64;
  uint64_t v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v76;
  void *v77;
  uint64_t v78;

  v4 = objc_alloc_init(PKPassFaceTemplate);
  -[PKPassFaceTemplate setBarcodeMaxSize:](v4, "setBarcodeMaxSize:", 290.0, 165.0);
  -[PKPassFaceTemplate defaultFieldTemplate](v4, "defaultFieldTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", 0);

  -[PKPassFaceTemplate defaultFieldTemplate](v4, "defaultFieldTemplate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = *MEMORY[0x1E0DC4AA0];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 11.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLabelFont:", v9);
  PKPassFrontFaceContentSize();
  v11 = v10;
  v13 = v12;
  -[PKPassFaceView buckets](self, "buckets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndex:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectAtIndex:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectAtIndex:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassPaymentCardFrontFaceView _filterSecondaryField:](self, "_filterSecondaryField:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectAtIndex:", 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassPaymentCardFrontFaceView _filterAuxiliaryField:](self, "_filterAuxiliaryField:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v25 = v21 == 0;
  else
    v25 = 1;
  v26 = !v25;
  v77 = (void *)v16;
  if (v16)
    v27 = v24 == 0;
  else
    v27 = 1;
  v28 = !v27;
  v76 = v28;
  if (v18)
  {
    v29 = objc_alloc_init(PKPassBucketTemplate);
    -[PKPassBucketTemplate setBucketAlignment:](v29, "setBucketAlignment:", 3);
    if (v21)
      v30 = v11 * 0.5 + -34.0;
    else
      v30 = v11 + -34.0;
    -[PKPassBucketTemplate setBucketRect:](v29, "setBucketRect:", 17.0, v13 + -35.0 + -12.0, v30, 35.0);
    -[PKPassBucketTemplate setMaxFields:](v29, "setMaxFields:", 1);
    -[PKPassBucketTemplate defaultFieldTemplate](v29, "defaultFieldTemplate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "label");
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v34 = -[__CFString length](v32, "length");
      v35 = 0;
      if (v33 != CFSTR(" ") && v34)
        v35 = -[__CFString isEqualToString:](v33, "isEqualToString:", CFSTR(" ")) ^ 1;
    }
    else
    {
      v35 = 0;
    }

    PKPassPaymentFrontFaceValueFont(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setValueFont:", v36);

    -[PKPassBucketTemplate defaultFieldTemplate](v29, "defaultFieldTemplate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v78);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "fontDescriptorWithSymbolicTraits:", 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v39, 11.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "setLabelFont:", v40);
    -[PKPassBucketTemplate defaultFieldTemplate](v29, "defaultFieldTemplate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setVerticalPadding:", -3.0);

    -[PKPassBucketTemplate defaultFieldTemplate](v29, "defaultFieldTemplate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setSuppressesEmptyLabel:", 1);

    -[PKPassBucketTemplate defaultFieldTemplate](v29, "defaultFieldTemplate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setTextAlignment:", 0);

    -[PKPassFaceTemplate addBucketTemplate:](v4, "addBucketTemplate:", v29);
  }
  if (v21)
  {
    v44 = objc_alloc_init(PKPassBucketTemplate);
    -[PKPassBucketTemplate setBucketAlignment:](v44, "setBucketAlignment:", 3);
    v45 = 17.0;
    if (v26)
    {
      v45 = v11 * 0.5 + 17.0;
      v46 = v11 * 0.5 + -34.0;
    }
    else
    {
      v46 = v11 + -34.0;
    }
    -[PKPassBucketTemplate setBucketRect:](v44, "setBucketRect:", v45, v13 + -35.0 + -12.0, v46, 35.0);
    -[PKPassBucketTemplate setMaxFields:](v44, "setMaxFields:", 1);
    -[PKPassBucketTemplate defaultFieldTemplate](v44, "defaultFieldTemplate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "label");
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48)
    {
      v50 = -[__CFString length](v48, "length");
      v51 = 0;
      if (v49 != CFSTR(" ") && v50)
        v51 = -[__CFString isEqualToString:](v49, "isEqualToString:", CFSTR(" ")) ^ 1;
    }
    else
    {
      v51 = 0;
    }

    PKPassPaymentFrontFaceValueFont(v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setValueFont:", v52);

    -[PKPassBucketTemplate defaultFieldTemplate](v44, "defaultFieldTemplate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v78);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "fontDescriptorWithSymbolicTraits:", 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v55, 11.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "setLabelFont:", v56);
    -[PKPassBucketTemplate defaultFieldTemplate](v44, "defaultFieldTemplate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setVerticalPadding:", -3.0);

    -[PKPassBucketTemplate defaultFieldTemplate](v44, "defaultFieldTemplate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setSuppressesEmptyLabel:", 1);

    -[PKPassBucketTemplate defaultFieldTemplate](v44, "defaultFieldTemplate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setTextAlignment:", 2);

    -[PKPassFaceTemplate addBucketTemplate:](v4, "addBucketTemplate:", v44);
  }
  if (v24)
  {
    v60 = objc_alloc_init(PKPassBucketTemplate);
    -[PKPassBucketTemplate setBucketAlignment:](v60, "setBucketAlignment:", 3);
    if (v76)
      v61 = v11 * 0.5 + -34.0;
    else
      v61 = v11 + -34.0;
    -[PKPassBucketTemplate setBucketRect:](v60, "setBucketRect:", 17.0, 12.0, v61, 35.0);
    -[PKPassBucketTemplate setMaxFields:](v60, "setMaxFields:", 1);
    -[PKPassBucketTemplate defaultFieldTemplate](v60, "defaultFieldTemplate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "label");
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v63)
    {
      v65 = -[__CFString length](v63, "length");
      v66 = 0;
      if (v64 != CFSTR(" ") && v65)
        v66 = -[__CFString isEqualToString:](v64, "isEqualToString:", CFSTR(" ")) ^ 1;
    }
    else
    {
      v66 = 0;
    }

    PKPassPaymentFrontFaceValueFont(v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setValueFont:", v67);

    -[PKPassBucketTemplate defaultFieldTemplate](v60, "defaultFieldTemplate");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v78);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "fontDescriptorWithSymbolicTraits:", 2);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v70, 11.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "setLabelFont:", v71);
    -[PKPassBucketTemplate defaultFieldTemplate](v60, "defaultFieldTemplate");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setVerticalPadding:", -3.0);

    -[PKPassBucketTemplate defaultFieldTemplate](v60, "defaultFieldTemplate");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setSuppressesEmptyLabel:", 1);

    -[PKPassBucketTemplate defaultFieldTemplate](v60, "defaultFieldTemplate");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setTextAlignment:", 0);

    -[PKPassFaceTemplate addBucketTemplate:](v4, "addBucketTemplate:", v60);
  }

  return v4;
}

- (id)_filterSecondaryField:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D6A700];
    v7 = v5;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (!v7 || !v8)
      {

LABEL_10:
        v11 = v4;
        goto LABEL_11;
      }
      v10 = objc_msgSend(v7, "isEqualToString:", v8);

      if ((v10 & 1) == 0)
        goto LABEL_10;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)_filterAuxiliaryField:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D6A708];
    v7 = v5;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (v7 && v8)
      {
        v10 = objc_msgSend(v7, "isEqualToString:", v8);

        if ((v10 & 1) != 0)
          goto LABEL_16;
      }
      else
      {

      }
      v12 = (void *)*MEMORY[0x1E0D6A710];
      v13 = v7;
      v14 = v12;
      if (v13 == v14)
      {

      }
      else
      {
        v15 = v14;
        if (!v7 || !v14)
        {

LABEL_18:
          v11 = v4;
          goto LABEL_19;
        }
        v16 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v16 & 1) == 0)
          goto LABEL_18;
      }
    }
LABEL_16:
    v11 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v11 = 0;
LABEL_20:

  return v11;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D6B288];
  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)PKPassPaymentCardFrontFaceView;
  -[PKPassFaceView dealloc](&v6, sel_dealloc);
}

- (id)templateForHeaderBucket
{
  PKPassBucketTemplate *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = objc_alloc_init(PKPassBucketTemplate);
  -[PKPassBucketTemplate setBucketAlignment:](v3, "setBucketAlignment:", 3);
  PKPassFrontFaceContentSize();
  v5 = v4;
  -[PKPassFaceView buckets](self, "buckets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndex:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassPaymentCardFrontFaceView _filterAuxiliaryField:](self, "_filterAuxiliaryField:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassFaceView cobrandLogoSize](self, "cobrandLogoSize");
  if (v8 && v11)
  {
    v13 = v5 * 0.5 + 17.0;
    v14 = v5 * 0.5 + -34.0;
  }
  else
  {
    v15 = fmin(v12, v5 * 0.7 + -34.0);
    v13 = v15 + 17.0;
    v14 = v5 + -34.0 - v15;
  }
  -[PKPassBucketTemplate setBucketRect:](v3, "setBucketRect:", v13, 12.0, v14, 35.0);
  -[PKPassBucketTemplate setMaxFields:](v3, "setMaxFields:", 1);
  -[PKPassBucketTemplate defaultFieldTemplate](v3, "defaultFieldTemplate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fontDescriptorWithSymbolicTraits:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v18, 11.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setLabelFont:", v19);
  -[PKPassBucketTemplate defaultFieldTemplate](v3, "defaultFieldTemplate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "label");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = -[__CFString length](v21, "length");
    v24 = 0;
    if (v22 != CFSTR(" ") && v23)
      v24 = -[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR(" ")) ^ 1;
  }
  else
  {
    v24 = 0;
  }

  PKPassPaymentFrontFaceValueFont(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setValueFont:", v25);

  -[PKPassBucketTemplate defaultFieldTemplate](v3, "defaultFieldTemplate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setVerticalPadding:", -3.0);

  -[PKPassBucketTemplate defaultFieldTemplate](v3, "defaultFieldTemplate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSuppressesEmptyLabel:", 1);

  -[PKPassBucketTemplate defaultFieldTemplate](v3, "defaultFieldTemplate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTextAlignment:", 2);

  return v3;
}

- (BOOL)showsShare
{
  return 0;
}

void __56__PKPassPaymentCardFrontFaceView_createBodyContentViews__block_invoke(uint64_t a1, void *a2)
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

  objc_msgSend(WeakRetained, "_showFullScreenBarcodeForButton:", v4);
}

uint64_t __56__PKPassPaymentCardFrontFaceView_createBodyContentViews__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (void)_initializeBalanceLabelWithTextColor:(id)a3
{
  objc_class *v4;
  id v5;
  UILabel *v6;
  UILabel *balanceLabel;

  if (!self->_balanceLabel)
  {
    v4 = (objc_class *)MEMORY[0x1E0DC3990];
    v5 = a3;
    v6 = (UILabel *)objc_alloc_init(v4);
    balanceLabel = self->_balanceLabel;
    self->_balanceLabel = v6;

    -[UILabel setTextColor:](self->_balanceLabel, "setTextColor:", v5);
    -[PKPassPaymentCardFrontFaceView _updateBalanceLabelFontSize](self, "_updateBalanceLabelFontSize");
    -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", self->_balanceLabel, 0);
  }
}

void __54__PKPassPaymentCardFrontFaceView_setShowsLiveBalance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PKPassPaymentCardFrontFaceView_setShowsLiveBalance___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __54__PKPassPaymentCardFrontFaceView_setShowsLiveBalance___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (!WeakRetained[120])
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObserver:selector:name:object:", v5, sel__handleAccountChanged_, *MEMORY[0x1E0D68290], 0);

    }
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_initializeBalanceLabelWithTextColor:", v4);

    objc_msgSend(v5, "_updateStateForAccount:animated:", *(_QWORD *)(a1 + 32), 0);
    WeakRetained = v5;
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassPaymentCardFrontFaceView;
  -[PKPassPaymentCardFrontFaceView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[PKPassPaymentCardFrontFaceView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v4 && v5)
  {
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = UIContentSizeCategoryCompareToCategory(v7, v6);

    if (v8 == NSOrderedSame)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v5 && !v4)
LABEL_7:
    -[PKPassPaymentCardFrontFaceView _updateBalanceLabelFontSize](self, "_updateBalanceLabelFontSize");
LABEL_8:

}

- (void)_updateBalanceLabelFontSize
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  char v7;
  UILabel *balanceLabel;
  void *v9;
  NSString *lhs;

  if (self->_balanceLabel)
  {
    -[PKPassPaymentCardFrontFaceView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    lhs = (NSString *)objc_claimAutoreleasedReturnValue();

    if (UIContentSizeCategoryCompareToCategory(lhs, (UIContentSizeCategory)*MEMORY[0x1E0DC48F0]) == NSOrderedDescending)
      v4 = 28.0;
    else
      v4 = 24.0;
    -[PKPassFaceView pass](self, "pass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasAssociatedPeerPaymentAccount");

    balanceLabel = self->_balanceLabel;
    if ((v7 & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC1350], "pk_peerPaymentCashFontOfSize:", v4);
    else
      PKDefaultSystemFontOfSizeAndWeight(v4, *MEMORY[0x1E0DC1438]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](balanceLabel, "setFont:", v9);

    -[PKPassPaymentCardFrontFaceView setNeedsLayout](self, "setNeedsLayout");
  }
}

uint64_t __48__PKPassPaymentCardFrontFaceView_layoutSubviews__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __48__PKPassPaymentCardFrontFaceView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCenter:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)_showFullScreenBarcodeForButton:(id)a3
{
  id v4;

  -[PKPassFaceView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "passFaceViewExpandButtonTapped:", self);

}

- (void)_updateBalanceWithAmount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  UILabel *balanceLabel;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  -[PKPassFaceView pass](self, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devicePrimaryPaymentApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    balanceLabel = self->_balanceLabel;
LABEL_10:
    -[UILabel setText:](balanceLabel, "setText:", 0);
    goto LABEL_11;
  }
  balanceLabel = self->_balanceLabel;
  if (balanceLabel)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
    goto LABEL_10;
  objc_msgSend(v15, "minimalFormattedStringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassFaceView pass](self, "pass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "paymentPass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasAssociatedPeerPaymentAccount");

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
    objc_msgSend(v15, "minimalFormattedStringValueInLocale:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14;
  }
  -[UILabel setText:](self->_balanceLabel, "setText:", v9);

LABEL_11:
}

- (void)_handleAccountChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id location;

  v4 = a3;
  -[PKPassFaceView pass](self, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "associatedAccountFeatureIdentifier") == 4)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__PKPassPaymentCardFrontFaceView__handleAccountChanged___block_invoke;
    v8[3] = &unk_1E3E696E8;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    objc_msgSend(v7, "defaultAccountForFeature:completion:", 4, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __56__PKPassPaymentCardFrontFaceView__handleAccountChanged___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Failed to retrieve Apple Balance account with error %@", buf, 0xCu);
    }

  }
  else if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PKPassPaymentCardFrontFaceView__handleAccountChanged___block_invoke_59;
    block[3] = &unk_1E3E61EE8;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v13);
  }

}

void __56__PKPassPaymentCardFrontFaceView__handleAccountChanged___block_invoke_59(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateStateForAccount:animated:", *(_QWORD *)(a1 + 32), 1);
    objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
    WeakRetained = v3;
  }

}

- (void)_updateStateForAccount:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  self->_accountIsActive = objc_msgSend(v12, "state") == 1;
  if ((objc_msgSend(v12, "supportsTopUp") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v12, "supportsAMPTopUp");
  self->_accountSupportsTopUp = v6;
  if (self->_accountIsActive)
  {
    objc_msgSend(v12, "appleBalanceDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountSummary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentBalance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currencyCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassPaymentCardFrontFaceView _updateBalanceWithAmount:](self, "_updateBalanceWithAmount:", v11);

  }
  -[PKPassPaymentCardFrontFaceView _updateAccountBalanceVisibilityAnimated:](self, "_updateAccountBalanceVisibilityAnimated:", v4);

}

- (void)_updateAccountBalanceVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  double v6;
  _QWORD v7[6];

  v3 = a3;
  if (self->_accountIsActive)
  {
    v5 = -[PKPassFaceView modallyPresented](self, "modallyPresented");
    v6 = 1.0;
    if (v5)
    {
      v6 = 0.0;
      if (!self->_accountSupportsTopUp)
        v6 = 1.0;
    }
    if (v3)
      goto LABEL_6;
  }
  else
  {
    v6 = 0.0;
    if (a3)
    {
LABEL_6:
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __74__PKPassPaymentCardFrontFaceView__updateAccountBalanceVisibilityAnimated___block_invoke;
      v7[3] = &unk_1E3E62010;
      v7[4] = self;
      *(double *)&v7[5] = v6;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, 0.2);
      return;
    }
  }
  -[UILabel setAlpha:](self->_balanceLabel, "setAlpha:", v6);
}

uint64_t __74__PKPassPaymentCardFrontFaceView__updateAccountBalanceVisibilityAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 960), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_handlePeerPaymentAccountChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKPassPaymentCardFrontFaceView__handlePeerPaymentAccountChanged___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __67__PKPassPaymentCardFrontFaceView__handlePeerPaymentAccountChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v5, "currentBalance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateBalanceWithAmount:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)setViewExpanded:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  NSObject *v6;
  double v7;
  objc_super v8;
  uint8_t buf[4];
  _BOOL8 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = -[PKPassFaceView viewExpanded](self, "viewExpanded");
  v8.receiver = self;
  v8.super_class = (Class)PKPassPaymentCardFrontFaceView;
  -[PKPassFaceView setViewExpanded:](&v8, sel_setViewExpanded_, v3);
  if (v5 != v3)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v10 = v3;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPassPaymentCardFrontFaceView setting viewExpanded: %ld", buf, 0xCu);
    }

    if (v3)
      v7 = 1.0;
    else
      v7 = 0.0;
    -[PKBackdropView setAlpha:](self->_backdropView, "setAlpha:", v7);
    -[UIView setAlpha:](self->_scrimView, "setAlpha:", v7);
    -[PKPassPaymentCardFrontFaceView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDynamicBarcodeData:(id)a3
{
  id v4;
  void *v5;
  char v6;
  PKBarcodeStickerView *v7;
  PKBarcodeStickerView *topBarcodeView;
  uint64_t v9;
  void *v10;
  PKBarcodeStickerView *v11;
  PKBarcodeStickerView *bottomBarcodeView;
  void *v13;
  uint64_t v14;
  id v15;
  PKBarcodeStickerView *v16;
  PKBarcodeStickerView *v17;
  double v18;
  id v19;
  PKBarcodeStickerView *v20;
  PKBarcodeStickerView *v21;
  PKBarcodeStickerView *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  PKBarcodeStickerView *v25;
  id v26;
  _QWORD v27[4];
  PKBarcodeStickerView *v28;
  _QWORD v29[4];
  PKBarcodeStickerView *v30;
  id v31;
  _QWORD v32[4];
  PKBarcodeStickerView *v33;
  id location;
  objc_super v35;

  v4 = a3;
  -[PKPassFaceView dynamicBarcodeData](self, "dynamicBarcodeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKEqualObjects();

  v35.receiver = self;
  v35.super_class = (Class)PKPassPaymentCardFrontFaceView;
  -[PKPassFaceView setDynamicBarcodeData:](&v35, sel_setDynamicBarcodeData_, v4);
  if ((v6 & 1) == 0)
  {
    PKPassFrontFaceContentSize();
    v7 = self->_topBarcodeView;
    topBarcodeView = self->_topBarcodeView;
    self->_topBarcodeView = 0;

    v9 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      -[NSMutableArray addObject:](self->_oldTopBarcodeViews, "addObject:", v7);
      objc_initWeak(&location, self->_oldTopBarcodeViews);
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v32[0] = v9;
      v32[1] = 3221225472;
      v32[2] = __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke;
      v32[3] = &unk_1E3E612E8;
      v33 = v7;
      v29[0] = v9;
      v29[1] = 3221225472;
      v29[2] = __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_2;
      v29[3] = &unk_1E3E6B880;
      v30 = v33;
      objc_copyWeak(&v31, &location);
      objc_msgSend(v10, "pkui_animateUsingOptions:animations:completion:", 4, v32, v29);
      objc_destroyWeak(&v31);

      objc_destroyWeak(&location);
    }
    v11 = self->_bottomBarcodeView;
    bottomBarcodeView = self->_bottomBarcodeView;
    self->_bottomBarcodeView = 0;

    if (v11)
    {
      -[NSMutableArray addObject:](self->_oldBottomBarcodeViews, "addObject:", v11);
      objc_initWeak(&location, self->_oldBottomBarcodeViews);
      v13 = (void *)MEMORY[0x1E0DC3F10];
      v14 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_3;
      v27[3] = &unk_1E3E612E8;
      v28 = v11;
      v24[0] = v14;
      v24[1] = 3221225472;
      v24[2] = __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_4;
      v24[3] = &unk_1E3E6B880;
      v25 = v28;
      objc_copyWeak(&v26, &location);
      objc_msgSend(v13, "pkui_animateUsingOptions:animations:completion:", 4, v27, v24);
      objc_destroyWeak(&v26);

      objc_destroyWeak(&location);
    }
    if (v4)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0D66BD0]);
      objc_msgSend(v15, "setFormat:", 1);
      objc_msgSend(v15, "setMessageData:", v4);
      v16 = -[PKBarcodeStickerView initWithBarcode:validityState:]([PKBarcodeStickerView alloc], "initWithBarcode:validityState:", v15, 0);
      v17 = self->_bottomBarcodeView;
      self->_bottomBarcodeView = v16;

      if ((PKShowBarcodeForScreenshotAndBroadcasting() & 1) == 0)
        -[UIView pkui_setExcludedFromScreenCapture:andBroadcasting:](self->_bottomBarcodeView, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
      -[PKBarcodeStickerView setShouldMatteCode:](self->_bottomBarcodeView, "setShouldMatteCode:", 0);
      -[PKBarcodeStickerView setAccessibilityElementsHidden:](self->_bottomBarcodeView, "setAccessibilityElementsHidden:", 1);
      PKFloatRoundToPixel();
      -[PKBarcodeStickerView setDesiredBarcodeSize:](self->_bottomBarcodeView, "setDesiredBarcodeSize:", v18, v18);
      -[UIView addSubview:](self->_scrimView, "addSubview:", self->_bottomBarcodeView);
      -[PKBarcodeStickerView sizeToFit](self->_bottomBarcodeView, "sizeToFit");
      v19 = objc_alloc_init(MEMORY[0x1E0D66BD0]);
      objc_msgSend(v19, "setFormat:", 4);
      objc_msgSend(v19, "setMessageData:", v4);
      objc_msgSend(v19, "setShouldRemoveQuietZone:", 1);
      v20 = -[PKBarcodeStickerView initWithBarcode:validityState:]([PKBarcodeStickerView alloc], "initWithBarcode:validityState:", v19, 0);
      v21 = self->_topBarcodeView;
      self->_topBarcodeView = v20;

      if ((PKShowBarcodeForScreenshotAndBroadcasting() & 1) == 0)
        -[UIView pkui_setExcludedFromScreenCapture:andBroadcasting:](self->_topBarcodeView, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
      v22 = self->_topBarcodeView;
      -[PKPassPaymentCardFrontFaceView _barcodeSize](self, "_barcodeSize");
      -[PKBarcodeStickerView setDesiredBarcodeSize:](v22, "setDesiredBarcodeSize:");
      -[PKBarcodeStickerView setShouldMatteCode:](self->_topBarcodeView, "setShouldMatteCode:", 0);
      -[PKBarcodeStickerView setAccessibilityElementsHidden:](self->_topBarcodeView, "setAccessibilityElementsHidden:", 1);
      -[UIView addSubview:](self->_scrimView, "addSubview:", self->_topBarcodeView);
      -[PKBarcodeStickerView sizeToFit](self->_topBarcodeView, "sizeToFit");
      -[PKPassPaymentCardFrontFaceView setNeedsLayout](self, "setNeedsLayout");
      -[PKPassPaymentCardFrontFaceView layoutIfNeeded](self, "layoutIfNeeded");
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_5;
      v23[3] = &unk_1E3E612E8;
      v23[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 4, v23, 0);

    }
  }

}

uint64_t __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "removeObject:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_4(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "removeObject:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAlpha:", 1.0);
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
    v3 = dbl_19DF16170[v2];
    v4 = dbl_19DF161D8[v2];
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactBankLogoView, 0);
  objc_storeStrong((id *)&self->_fullScreenButton, 0);
  objc_storeStrong((id *)&self->_oldBottomBarcodeViews, 0);
  objc_storeStrong((id *)&self->_oldTopBarcodeViews, 0);
  objc_storeStrong((id *)&self->_bottomBarcodeView, 0);
  objc_storeStrong((id *)&self->_topBarcodeView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_scrimView, 0);
  objc_storeStrong((id *)&self->_balanceLabel, 0);
}

@end

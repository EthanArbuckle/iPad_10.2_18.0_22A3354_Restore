@implementation PKPassFrontFaceView

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  UIView *bottomRightItemView;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double MaxX;
  CGFloat v46;
  double MaxY;
  CGFloat rect;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v53.receiver = self;
  v53.super_class = (Class)PKPassFrontFaceView;
  -[PKPassFaceView layoutSubviews](&v53, sel_layoutSubviews);
  -[PKPassFaceView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v49 = v4;
  v50 = v5;
  v51 = v7;
  v52 = v6;
  -[PKPassFaceView style](self, "style");
  PKPassFaceLogoRect();
  if (self->_logoLabel)
  {
    v12 = v8;
    v13 = v9;
    v14 = v10;
    v15 = v11;
    if (!CGRectIsNull(*(CGRect *)&v8))
    {
      -[PKPassFaceView pass](self, "pass");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logoRect");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;

      v54.origin.x = v18;
      v54.origin.y = v20;
      v54.size.width = v22;
      rect = v24;
      v54.size.height = v24;
      v25 = v12;
      if (!CGRectIsNull(v54))
      {
        v55.origin.x = v18;
        v55.origin.y = v20;
        v55.size.width = v22;
        v55.size.height = rect;
        v25 = CGRectGetMaxX(v55) + 8.0;
      }
      -[UILabel sizeToFit](self->_logoLabel, "sizeToFit");
      -[UILabel frame](self->_logoLabel, "frame");
      UIRectCenteredYInRect();
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v56.origin.x = v12;
      v56.origin.y = v13;
      v56.size.width = v14;
      v56.size.height = v15;
      -[UILabel setFrame:](self->_logoLabel, "setFrame:", v27, v29, CGRectGetMaxX(v56) - v25, v31);
    }
  }
  if (self->_showsLinkedApp)
  {
    -[PKLinkedAppIconView intrinsicContentSize](self->_linkedApp, "intrinsicContentSize");
    v33 = v32;
    v35 = v34;
    v57.origin.x = v49;
    v57.origin.y = v52;
    v57.size.height = v50;
    v57.size.width = v51;
    -[PKLinkedAppIconView setFrame:](self->_linkedApp, "setFrame:", v49 + 7.0, CGRectGetMaxY(v57) - (v35 + 7.0), v33, v35);
  }
  bottomRightItemView = self->_bottomRightItemView;
  if (bottomRightItemView)
  {
    -[UIView frame](bottomRightItemView, "frame");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v58.origin.x = v49;
    v58.origin.y = v52;
    v58.size.width = v51;
    v58.size.height = v50;
    MaxX = CGRectGetMaxX(v58);
    v59.origin.x = v38;
    v59.origin.y = v40;
    v59.size.width = v42;
    v59.size.height = v44;
    v46 = MaxX - (CGRectGetWidth(v59) + 7.0);
    v60.origin.x = v49;
    v60.origin.y = v52;
    v60.size.width = v51;
    v60.size.height = v50;
    MaxY = CGRectGetMaxY(v60);
    v61.origin.x = v46;
    v61.origin.y = v40;
    v61.size.width = v42;
    v61.size.height = v44;
    -[UIView setFrame:](self->_bottomRightItemView, "setFrame:", v46, MaxY - (CGRectGetHeight(v61) + 7.0), v42, v44);
  }
  -[PKPassFrontFaceView _positionBarcodeView](self, "_positionBarcodeView");

}

- (void)_positionBarcodeView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  PKBarcodeStickerView *barcodeView;
  void *v13;
  void *v14;
  PKBarcodeStickerView *v15;
  CGRect v16;

  if (self->_barcodeView)
  {
    -[PKPassFaceView contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    barcodeView = self->_barcodeView;
    -[PKPassFrontFaceView passFaceTemplate](self, "passFaceTemplate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "barcodeMaxSize");
    -[PKBarcodeStickerView sizeThatFits:](barcodeView, "sizeThatFits:");

    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    CGRectGetMaxY(v16);
    -[PKPassFaceView faceTemplate](self, "faceTemplate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "barcodeBottomInset");

    v15 = self->_barcodeView;
    UIRectCenteredXInRect();
    -[PKBarcodeStickerView setFrame:](v15, "setFrame:");
  }
}

- (id)passFaceTemplate
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPassFaceView pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassFrontFaceView templateForLayoutMode:](self, "templateForLayoutMode:", objc_msgSend(v4, "layoutMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGSize)contentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PKPassFaceView pass](self, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  PKPassFrontFaceContentSize();
  v4 = v3;
  v6 = v5;
  if ((objc_msgSend(v2, "hasValidNFCPayload") & 1) != 0 || objc_msgSend(v2, "supportsIssuerBinding"))
  {
    if (PKValueAddedServicesEnabled())
    {
      if ((objc_msgSend(v2, "isValid") & 1) != 0
        || (objc_msgSend(v2, "barcode"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
      {
        PKPassHeightAdjustmentForStyle();
        v6 = v6 - v8;
      }
    }
  }

  v9 = v4;
  v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)insertContentView:(id)a3 ofType:(int64_t)a4
{
  PKLinkedAppIconView *v6;
  void *v7;
  objc_super v8;

  v6 = (PKLinkedAppIconView *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassFrontFaceView;
  -[PKPassFaceView insertContentView:ofType:](&v8, sel_insertContentView_ofType_, v6, a4);
  if (self->_linkedApp == v6 || (PKLinkedAppIconView *)self->_bottomRightItemView == v6)
  {
    -[PKLinkedAppIconView superview](v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bringSubviewToFront:", v6);

  }
}

- (void)createBodyContentViews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  _BOOL4 showsBarcodeView;
  PKBarcodeStickerView *barcodeView;
  PKBarcodeStickerView *v10;
  PKBarcodeStickerView *v11;
  void *v12;
  PKBarcodeStickerView *v13;
  void *v14;
  PKLinkedAppIconView *linkedApp;
  BOOL v16;
  PKLinkedApplication *v17;
  PKLinkedAppIconView *v18;
  PKLinkedAppIconView *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKPassFrontFaceView;
  -[PKPassFaceView createBodyContentViews](&v22, sel_createBodyContentViews);
  -[PKPassFaceView pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");
  objc_msgSend(v3, "barcode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || v4 == 7 || v4 == 6)
  {
    if (v4 == 6)
      goto LABEL_23;
  }
  else
  {
    -[PKPassFaceView faceTemplate](self, "faceTemplate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "barcodeBottomInset");
    if (v7 == 0.0 || v4 == 9)
    {

    }
    else
    {
      showsBarcodeView = self->_showsBarcodeView;

      if (showsBarcodeView)
      {
        barcodeView = self->_barcodeView;
        if (!barcodeView)
        {
          v10 = -[PKBarcodeStickerView initWithBarcode:validityState:passStyle:]([PKBarcodeStickerView alloc], "initWithBarcode:validityState:passStyle:", v5, +[PKBarcodeStickerView validityStateForPass:](PKBarcodeStickerView, "validityStateForPass:", v3), v4);
          v11 = self->_barcodeView;
          self->_barcodeView = v10;

          objc_msgSend(v3, "altImage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = self->_barcodeView;
            objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKBarcodeStickerView setAltImage:](v13, "setAltImage:", v14);

          }
          -[PKBarcodeStickerView sizeToFit](self->_barcodeView, "sizeToFit");
          -[PKBarcodeStickerView setAlpha:](self->_barcodeView, "setAlpha:", 1.0);
          -[PKBarcodeStickerView layoutIfNeeded](self->_barcodeView, "layoutIfNeeded");

          barcodeView = self->_barcodeView;
        }
        -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", barcodeView, 2);
      }
    }
  }
  if (self->_showsLinkedApp && objc_msgSend(v3, "linksToApp"))
  {
    linkedApp = self->_linkedApp;
    if (linkedApp)
      v16 = 1;
    else
      v16 = v4 == 9;
    if (!v16)
    {
      v17 = -[PKLinkedApplication initWithPass:]([PKLinkedApplication alloc], "initWithPass:", v3);
      -[PKLinkedApplication setUseSmallIcon:](v17, "setUseSmallIcon:", 1);
      v18 = -[PKLinkedAppIconView initWithLinkedApplication:]([PKLinkedAppIconView alloc], "initWithLinkedApplication:", v17);
      v19 = self->_linkedApp;
      self->_linkedApp = v18;

      -[PKLinkedAppIconView layer](self->_linkedApp, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scale");
      objc_msgSend(v20, "setRasterizationScale:");

      linkedApp = self->_linkedApp;
    }
    -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", linkedApp, 2);
  }
LABEL_23:

}

- (void)setShowsLinkedApp:(BOOL)a3
{
  if (((!self->_showsLinkedApp ^ a3) & 1) == 0)
  {
    self->_showsLinkedApp = a3;
    -[PKLinkedAppIconView setHidden:](self->_linkedApp, "setHidden:", !a3);
    if (self->_linkedApp)
    {
      if (self->_showsLinkedApp)
        -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:");
      else
        -[PKPassFaceView removeContentView:ofType:](self, "removeContentView:ofType:");
    }
  }
}

- (void)setShowsBarcodeView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  _QWORD v7[5];
  _QWORD v8[5];

  if (((!self->_showsBarcodeView ^ a3) & 1) == 0)
  {
    v4 = a4;
    self->_showsBarcodeView = a3;
    if (a3 && !self->_barcodeView)
      -[PKPassFrontFaceView createBodyContentViews](self, "createBodyContentViews");
    if (self->_barcodeView)
    {
      if (self->_showsBarcodeView)
        -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:");
      v6 = 0.2;
      if (!v4)
        v6 = 0.0;
      v7[4] = self;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __52__PKPassFrontFaceView_setShowsBarcodeView_animated___block_invoke;
      v8[3] = &unk_1E3E612E8;
      v8[4] = self;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __52__PKPassFrontFaceView_setShowsBarcodeView_animated___block_invoke_2;
      v7[3] = &unk_1E3E62288;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v8, v7, v6);
    }
  }
}

- (void)setShowsBarcodeView:(BOOL)a3
{
  -[PKPassFrontFaceView setShowsBarcodeView:animated:](self, "setShowsBarcodeView:animated:", a3, 0);
}

- (void)setBottomRightItem:(int64_t)bottomRightItem
{
  UIView *bottomRightItemView;
  UIView *v5;
  UIView *v6;
  UIView *v7;

  if (self->_bottomRightItem != bottomRightItem)
  {
    self->_bottomRightItem = bottomRightItem;
    if (self->_bottomRightItemView)
    {
      -[PKPassFaceView removeContentView:ofType:](self, "removeContentView:ofType:", self->_bottomRightItemView, 2);
      bottomRightItemView = self->_bottomRightItemView;
      self->_bottomRightItemView = 0;

      bottomRightItem = self->_bottomRightItem;
    }
    if (bottomRightItem == 2)
    {
      -[PKPassFrontFaceView createExpiredLabel](self, "createExpiredLabel");
      v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (bottomRightItem != 1)
        goto LABEL_9;
      -[PKPassFrontFaceView createContactlessLogoView](self, "createContactlessLogoView");
      v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    v6 = self->_bottomRightItemView;
    self->_bottomRightItemView = v5;

LABEL_9:
    v7 = self->_bottomRightItemView;
    if (v7)
    {
      -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", v7, 2);
      -[PKPassFrontFaceView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (PKPassFrontFaceView)initWithStyle:(int64_t)a3
{
  PKPassFrontFaceView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassFrontFaceView;
  result = -[PKPassFaceView initWithStyle:](&v4, sel_initWithStyle_, a3);
  if (result)
  {
    result->_bottomRightItem = 0;
    result->_showsLinkedApp = 1;
    result->_showsBarcodeView = 1;
  }
  return result;
}

- (void)createHeaderContentViews
{
  int64_t v3;
  void *v4;
  void *v5;
  UILabel *v6;
  UILabel *logoLabel;
  UILabel *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)PKPassFrontFaceView;
  -[PKPassFaceView createHeaderContentViews](&v18, sel_createHeaderContentViews);
  v3 = -[PKPassFaceView style](self, "style");
  -[PKPassFaceView pass](self, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logoText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PKPassFaceLogoRect();
    if (!CGRectIsEmpty(v19) && v3 != 9)
    {
      v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      logoLabel = self->_logoLabel;
      self->_logoLabel = v6;

      v8 = self->_logoLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[PKPassFaceView colorProfile](self, "colorProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isLight");
      v12 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 18.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v10, "foregroundAttributesForFont:", v13);
      else
        objc_msgSend(v10, "labelAttributesForFont:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryWithDictionary:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_alloc_init(MEMORY[0x1E0DC1288]);
      objc_msgSend(v16, "setLineBreakMode:", 4);
      objc_msgSend(v16, "setAlignment:", 0);
      objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x1E0DC1178]);
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v15);
      -[UILabel setAttributedText:](self->_logoLabel, "setAttributedText:", v17);
      -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", self->_logoLabel, 0);

    }
  }

}

- (id)templateForHeaderBucket
{
  double v2;
  double v3;
  PKPassBucketTemplate *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PKPassFaceView style](self, "style");
  PKPassFrontFaceContentSize();
  v3 = v2;
  v4 = objc_alloc_init(PKPassBucketTemplate);
  -[PKPassBucketTemplate setBucketAlignment:](v4, "setBucketAlignment:", 1);
  -[PKPassBucketTemplate setBucketRect:](v4, "setBucketRect:", v3 + -15.0 + -115.0, 10.0, 115.0, 40.0);
  -[PKPassBucketTemplate setMinFieldPadding:](v4, "setMinFieldPadding:", 16.0);
  -[PKPassBucketTemplate setMaxFields:](v4, "setMaxFields:", 3);
  -[PKPassBucketTemplate defaultFieldTemplate](v4, "defaultFieldTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 11.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabelFont:", v6);

  -[PKPassBucketTemplate defaultFieldTemplate](v4, "defaultFieldTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 21.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValueFont:", v8);

  -[PKPassBucketTemplate defaultFieldTemplate](v4, "defaultFieldTemplate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextAlignment:", 2);

  -[PKPassBucketTemplate defaultFieldTemplate](v4, "defaultFieldTemplate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVerticalPadding:", -3.0);

  return v4;
}

- (id)_relevantBuckets
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  -[PKPassFaceView pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frontFieldBuckets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassFaceView pass](self, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "style");

  if (v6 == 8 || v6 == 2)
  {
    -[PKPassFrontFaceView _rebucketAuxiliaryFields:](self, "_rebucketAuxiliaryFields:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

uint64_t __52__PKPassFrontFaceView_setShowsBarcodeView_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 1.0;
  if (!*(_BYTE *)(v1 + 937))
    v2 = 0.0;
  return objc_msgSend(*(id *)(v1 + 920), "setAlpha:", v2);
}

uint64_t __52__PKPassFrontFaceView_setShowsBarcodeView_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 937))
    return objc_msgSend((id)result, "removeContentView:ofType:", *(_QWORD *)(result + 920), 2);
  return result;
}

- (void)setRelevancyActive:(BOOL)a3
{
  if (self->_relevancyActive != a3)
    self->_relevancyActive = a3;
}

- (id)templateForLayoutMode:(int64_t)a3
{
  return 0;
}

- (id)createContactlessLogoView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[PKPassFaceView style](self, "style") == 9)
  {
    v3 = 0;
  }
  else
  {
    PKPassKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("ContactlessLogo"), CFSTR("pdf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = PKUIScreenScale();
    PKUIImageFromPDF(v5, 21.0, 24.0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithRenderingMode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
    objc_msgSend(v3, "setContentMode:", 1);
    objc_msgSend(v3, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 21.0, 24.0);
    -[PKPassFaceView colorProfile](self, "colorProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "foregroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTintColor:", v10);

    objc_msgSend(v3, "setAlpha:", 0.7);
  }
  return v3;
}

- (id)createExpiredLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[PKPassFaceView style](self, "style") == 9)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AA0], (NSString *)*MEMORY[0x1E0DC48C8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFont:", v4);

    PKLocalizedString(CFSTR("NFC_PASS_EXPIRED"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", v5);

    objc_msgSend(v3, "setTextAlignment:", 2);
    -[PKPassFaceView colorProfile](self, "colorProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "foregroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTextColor:", v7);

    objc_msgSend(v3, "sizeToFit");
  }
  return v3;
}

- (void)updateValidity
{
  void *v3;
  void *v4;

  -[PKPassFrontFaceView barcodeView](self, "barcodeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassFaceView pass](self, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValidity:", +[PKBarcodeStickerView validityStateForPass:](PKBarcodeStickerView, "validityStateForPass:", v4));

  -[PKPassFrontFaceView _positionBarcodeView](self, "_positionBarcodeView");
}

- (CGRect)barcodeFrame
{
  PKBarcodeStickerView *barcodeView;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  barcodeView = self->_barcodeView;
  if (barcodeView)
  {
    -[PKBarcodeStickerView frame](barcodeView, "frame");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (PKBarcodeStickerView)barcodeView
{
  return self->_barcodeView;
}

- (id)_rebucketAuxiliaryFields:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") > 3)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v13, "row") == 1)
            v14 = v7;
          else
            v14 = v6;
          objc_msgSend(v14, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }
    -[PKPassFaceView pass](self, "pass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frontFieldBuckets");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "removeLastObject");
    objc_msgSend(v17, "addObject:", v6);
    objc_msgSend(v17, "addObject:", v7);
    v5 = (void *)objc_msgSend(v17, "copy");

  }
  else
  {
    v5 = (void *)objc_msgSend(v4, "copy");
  }

  return v5;
}

- (BOOL)showsLinkedApp
{
  return self->_showsLinkedApp;
}

- (int64_t)bottomRightItem
{
  return self->_bottomRightItem;
}

- (BOOL)showsBarcodeView
{
  return self->_showsBarcodeView;
}

- (BOOL)showsLiveBalance
{
  return self->_showsLiveBalance;
}

- (PKLinkedAppIconView)linkedApp
{
  return self->_linkedApp;
}

- (BOOL)isRelevancyActive
{
  return self->_relevancyActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApp, 0);
  objc_storeStrong((id *)&self->_bottomRightItemView, 0);
  objc_storeStrong((id *)&self->_barcodeView, 0);
  objc_storeStrong((id *)&self->_logoLabel, 0);
}

@end

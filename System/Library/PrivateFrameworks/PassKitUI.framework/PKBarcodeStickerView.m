@implementation PKBarcodeStickerView

- (void)_generateMatteRect:(CGRect *)a3 barcodeRect:(CGRect *)a4 altContentRect:(CGRect *)a5 boundingSize:(CGSize)a6
{
  double height;
  double width;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;
  UIImageView *barcodeView;
  UIImageView *v20;
  void *v21;
  UIImageView *v22;
  UIImageView *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  BOOL v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  UIImageView *altImageView;
  double v46;
  double v47;
  double v48;
  UILabel *altTextLabel;
  double v50;
  double altContentInset;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  CGFloat MaxY;
  double v67;
  double v68;
  CGFloat v69;
  double v70;
  CGRect v71;

  height = a6.height;
  width = a6.width;
  -[PKBarcode sizeForPassStyle:](self->_barcode, "sizeForPassStyle:", self->_passStyle);
  v13 = v12;
  v15 = v14;
  if (*MEMORY[0x1E0C9D820] != self->_desiredBarcodeSize.width
    || *(double *)(MEMORY[0x1E0C9D820] + 8) != self->_desiredBarcodeSize.height)
  {
    PKSizeScaleAspectFit();
    v13 = v17;
    v15 = v18;
  }
  if (self->_drawBarcode)
  {
    if (self->_barcodeViewInvalidated)
    {
      barcodeView = self->_barcodeView;
      if (barcodeView)
      {
        -[UIImageView removeFromSuperview](barcodeView, "removeFromSuperview");
        v20 = self->_barcodeView;
        self->_barcodeView = 0;

      }
      self->_barcodeViewInvalidated = 0;
    }
    if (!self->_barcodeView)
    {
      -[PKBarcode imageWithSize:](self->_barcode, "imageWithSize:", v13, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v21);
      v23 = self->_barcodeView;
      self->_barcodeView = v22;

      -[UIImageView setUserInteractionEnabled:](self->_barcodeView, "setUserInteractionEnabled:", 1);
      -[UIImageView addSubview:](self->_matteView, "addSubview:", self->_barcodeView);

    }
    v24 = v15;
    -[PKBarcode variance](self->_barcode, "variance");
    v27 = v26;
    if (v25 <= 0.0
      || (v28 = v25,
          -[UIImageView image](self->_barcodeView, "image"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v29, "size"),
          v31 = vabdd_f64(v13, v30),
          v29,
          v31 >= v28))
    {
      if (v27 <= 0.0)
      {
        v15 = v24;
        goto LABEL_20;
      }
      -[UIImageView image](self->_barcodeView, "image");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "size");
      v34 = vabdd_f64(v24, v33);

      v35 = v34 < v27;
      v15 = v24;
      if (!v35)
        goto LABEL_20;
    }
    -[UIImageView frame](self->_barcodeView, "frame");
    v13 = v36;
    v15 = v37;
  }
LABEL_20:
  if (-[PKBarcode format](self->_barcode, "format") == 4 && v15 <= self->_desiredBarcodeSize.height)
    v15 = self->_desiredBarcodeSize.height;
  if (self->_shouldMatteCode)
  {
    +[PKBarcodeStickerView _quietZoneForBarcode:](PKBarcodeStickerView, "_quietZoneForBarcode:", self->_barcode);
    v40 = v39;
    v42 = v41;
    v44 = v43;
  }
  else
  {
    v40 = 0.0;
    v42 = 0.0;
    v44 = 0.0;
    v38 = 0.0;
  }
  altImageView = self->_altImageView;
  v70 = v38;
  if (altImageView)
  {
    -[UIImageView sizeThatFits:](altImageView, "sizeThatFits:", width, height);
    v48 = v47;
    v68 = 3.0;
  }
  else
  {
    altTextLabel = self->_altTextLabel;
    v68 = 0.0;
    if (altTextLabel)
    {
      -[UILabel sizeThatFits:](altTextLabel, "sizeThatFits:", width, height);
      v48 = v50;
    }
    else
    {
      v46 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v48 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
  }
  altContentInset = self->_altContentInset;
  if (v46 >= width + altContentInset * -2.0)
    v52 = width + altContentInset * -2.0;
  else
    v52 = v46;
  if (v52 + altContentInset * 2.0 <= v13 + v42 * 2.0)
    v53 = v13 + v42 * 2.0;
  else
    v53 = v52 + altContentInset * 2.0;
  v54 = v44 + v15 + v40;
  v55 = -0.0;
  if (v48 > 0.0)
    v55 = v48 + -2.0;
  v56 = v40;
  v57 = v15;
  v58 = v13;
  v59 = v54 + v55;
  -[UIImageView image](self->_matteView, "image");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "size");
  v62 = v61;

  if (v62 > v59)
    v59 = v62;
  v63 = 0.5;
  v64 = floor((v53 - v58) * 0.5);
  v69 = v56;
  if (self->_drawBarcode)
  {
    v71.origin.x = v64;
    v71.origin.y = v56;
    v65 = v58;
    v71.size.width = v58;
    v71.size.height = v57;
    MaxY = CGRectGetMaxY(v71);
    v63 = 0.5;
    v67 = v70 + v68 + MaxY + -2.0;
    if (!a3)
      goto LABEL_44;
    goto LABEL_43;
  }
  v65 = v58;
  v67 = floor((v59 - v48) * 0.5);
  if (a3)
  {
LABEL_43:
    a3->origin = (CGPoint)*MEMORY[0x1E0C9D538];
    a3->size.width = v53;
    a3->size.height = v59;
  }
LABEL_44:
  if (a4)
  {
    a4->origin.x = v64;
    a4->origin.y = v69;
    a4->size.width = v65;
    a4->size.height = v57;
  }
  if (a5)
  {
    a5->origin.x = floor((v53 - v52) * v63);
    a5->origin.y = v67;
    a5->size.width = v52;
    a5->size.height = v48;
  }
}

+ (PKBarcodeQuietZone)_quietZoneForBarcode:(id)a3
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  PKBarcodeQuietZone result;

  v3 = objc_msgSend(a3, "format");
  v4 = 5.0;
  v5 = 9.0;
  if (v3 == 2)
    v4 = 9.0;
  v6 = 6.0;
  if (v3 == 2)
    v6 = 9.0;
  v7 = 7.0;
  if (v3 == 2)
    v7 = 9.0;
  else
    v5 = 0.0;
  result.var3 = v5;
  result.var2 = v7;
  result.var1 = v6;
  result.var0 = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKBarcodeStickerView _updateDrawBarcode](self, "_updateDrawBarcode");
  v8 = 0u;
  v9 = 0u;
  -[PKBarcodeStickerView _generateMatteRect:barcodeRect:altContentRect:boundingSize:](self, "_generateMatteRect:barcodeRect:altContentRect:boundingSize:", &v8, 0, 0, width, height);
  v7 = *((double *)&v9 + 1);
  v6 = *(double *)&v9;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_updateDrawBarcode
{
  void *v3;

  if (-[PKBarcode format](self->_barcode, "format"))
  {
    -[PKBarcodeStickerView barcodeImage](self, "barcodeImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_drawBarcode = v3 != 0;

  }
  else
  {
    self->_drawBarcode = 0;
  }
}

- (id)barcodeImage
{
  UIImage *barcodeImage;
  UIImage *v4;
  UIImage *v5;

  barcodeImage = self->_barcodeImage;
  if (!barcodeImage)
  {
    -[PKBarcode image](self->_barcode, "image");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_barcodeImage;
    self->_barcodeImage = v4;

    barcodeImage = self->_barcodeImage;
  }
  return barcodeImage;
}

- (PKBarcodeStickerView)initWithBarcode:(id)a3 validityState:(int64_t)a4 passStyle:(int64_t)a5
{
  id v9;
  char *v10;
  PKBarcodeStickerView *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIImageView *matteView;
  void *v17;
  objc_super v19;

  v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKBarcodeStickerView;
  v10 = -[PKBarcodeStickerView initWithFrame:](&v19, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
  v11 = (PKBarcodeStickerView *)v10;
  if (v10)
  {
    *(_OWORD *)(v10 + 872) = *MEMORY[0x1E0C9D820];
    v10[849] = 1;
    objc_storeStrong((id *)v10 + 94, a3);
    v11->_passStyle = a5;
    v12 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIImageNamed(CFSTR("CardBarCodeSticker"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pkui_resizableImageByTilingCenterPixel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "initWithImage:", v14);
    matteView = v11->_matteView;
    v11->_matteView = (UIImageView *)v15;

    -[UIImageView setUserInteractionEnabled:](v11->_matteView, "setUserInteractionEnabled:", 1);
    -[PKBarcodeStickerView addSubview:](v11, "addSubview:", v11->_matteView);
    objc_msgSend(v9, "altText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[PKBarcodeStickerView _setupAltTextLabel](v11, "_setupAltTextLabel");
    -[PKBarcodeStickerView setValidity:](v11, "setValidity:", a4);
    -[PKBarcodeStickerView setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67938]);
  }

  return v11;
}

- (void)setValidity:(int64_t)a3
{
  self->_validity = a3;
  -[PKBarcodeStickerView _updateValidity](self, "_updateValidity");
  -[PKBarcodeStickerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  -[PKBarcodeStickerView _updateDrawBarcode](self, "_updateDrawBarcode");
  if (self->_drawBarcode
    && (-[PKBarcodeStickerView _updateMatteViewHiding](self, "_updateMatteViewHiding"), self->_drawBarcode))
  {
    -[PKBarcodeStickerView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
  }
  else
  {
    v4 = self->_altContentInset * 2.0 + 240.0;
    v6 = 100.0;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[PKBarcodeStickerView _generateMatteRect:barcodeRect:altContentRect:boundingSize:](self, "_generateMatteRect:barcodeRect:altContentRect:boundingSize:", &v12, &v10, &v8, v4, v6);
  -[UILabel setFrame:](self->_altTextLabel, "setFrame:", v8, v9);
  -[UIImageView setFrame:](self->_altImageView, "setFrame:", v8, v9);
  -[UIImageView setFrame:](self->_matteView, "setFrame:", v12, v13);
  -[PKBarcodeStickerView _updateMatteViewHiding](self, "_updateMatteViewHiding");
  -[UIImageView setFrame:](self->_barcodeView, "setFrame:", v10, v11);
  -[PKBarcodeStickerView _updateValidity](self, "_updateValidity");
  v7.receiver = self;
  v7.super_class = (Class)PKBarcodeStickerView;
  -[PKBarcodeStickerView layoutSubviews](&v7, sel_layoutSubviews);
}

- (void)_updateMatteViewHiding
{
  UIImageView *matteView;
  _BOOL8 v4;

  matteView = self->_matteView;
  v4 = !self->_shouldMatteCode && !self->_drawBarcode;
  -[UIImageView setHidden:](matteView, "setHidden:", v4);
}

- (void)_updateValidity
{
  UILabel *altTextLabel;
  void *v4;
  UILabel *v5;
  __CFString *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  id v11;

  if (self->_validity)
  {
    -[PKBarcodeStickerView _updateMatteViewHiding](self, "_updateMatteViewHiding");
    -[UIImageView setAlpha:](self->_barcodeView, "setAlpha:", 0.1);
    altTextLabel = self->_altTextLabel;
    if (self->_validity == 3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](altTextLabel, "setTextColor:", v4);

      v5 = self->_altTextLabel;
      v6 = CFSTR("PASS_REVOKED");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](altTextLabel, "setTextColor:", v10);

      v5 = self->_altTextLabel;
      v6 = CFSTR("PASS_EXPIRED");
    }
    PKLocalizedString(&v6->isa);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5, "setText:");
  }
  else
  {
    -[UIImageView setAlpha:](self->_barcodeView, "setAlpha:", 1.0);
    v7 = self->_altTextLabel;
    -[PKBarcode altText](self->_barcode, "altText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v8);

    -[PKBarcodeStickerView _updateMatteViewHiding](self, "_updateMatteViewHiding");
    v9 = self->_altTextLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:");
  }

}

+ (int64_t)validityStateForPass:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isRevoked") & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isVoided") & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    v4 = objc_msgSend(v3, "isExpired");
  }

  return v4;
}

- (void)_setupAltTextLabel
{
  UILabel *v3;
  UILabel *altTextLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;

  if (!self->_altTextLabel && !self->_altImage)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    altTextLabel = self->_altTextLabel;
    self->_altTextLabel = v3;

    v5 = self->_altTextLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5, "setFont:", v6);

    self->_altContentInset = 11.0;
    -[UILabel setTextAlignment:](self->_altTextLabel, "setTextAlignment:", 1);
    v7 = self->_altTextLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[UILabel sizeToFit](self->_altTextLabel, "sizeToFit");
    -[UILabel setUserInteractionEnabled:](self->_altTextLabel, "setUserInteractionEnabled:", 1);
    -[UILabel setAccessibilityIdentifier:](self->_altTextLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678A0]);
    -[UIImageView addSubview:](self->_matteView, "addSubview:", self->_altTextLabel);
  }
}

- (PKBarcodeStickerView)initWithBarcode:(id)a3 validityState:(int64_t)a4
{
  return -[PKBarcodeStickerView initWithBarcode:validityState:passStyle:](self, "initWithBarcode:validityState:passStyle:", a3, a4, 5);
}

- (void)setAltTextFont:(id)a3
{
  -[UILabel setFont:](self->_altTextLabel, "setFont:", a3);
  self->_barcodeViewInvalidated = 1;
  -[PKBarcodeStickerView setNeedsLayout](self, "setNeedsLayout");
}

- (UIFont)altTextFont
{
  return -[UILabel font](self->_altTextLabel, "font");
}

- (void)setAltTextInset:(double)a3
{
  self->_altContentInset = a3;
  self->_barcodeViewInvalidated = 1;
  -[PKBarcodeStickerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAltImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_altImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_altImage, a3);
    -[PKBarcodeStickerView _setupAltImageView](self, "_setupAltImageView");
    -[PKBarcodeStickerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)_setupAltImageView
{
  UIImage *altImage;
  UIImageView *altImageView;
  UIImageView *v5;
  UIImageView *v6;

  altImage = self->_altImage;
  altImageView = self->_altImageView;
  if (altImage)
  {
    if (!altImageView)
    {
      v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v6 = self->_altImageView;
      self->_altImageView = v5;

      -[UIImageView setContentMode:](self->_altImageView, "setContentMode:", 1);
      -[UIImageView setClipsToBounds:](self->_altImageView, "setClipsToBounds:", 1);
      -[UIImageView addSubview:](self->_matteView, "addSubview:", self->_altImageView);
    }
    self->_altContentInset = 11.0;
    -[UIImageView setImage:](self->_altImageView, "setImage:", self->_altImage);
    -[UILabel removeFromSuperview](self->_altTextLabel, "removeFromSuperview");
  }
  else
  {
    -[UIImageView removeFromSuperview](altImageView, "removeFromSuperview");
    -[PKBarcodeStickerView _setupAltTextLabel](self, "_setupAltTextLabel");
  }
  -[PKBarcodeStickerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDesiredBarcodeSize:(CGSize)a3
{
  self->_desiredBarcodeSize = a3;
  self->_barcodeViewInvalidated = 1;
  -[PKBarcodeStickerView setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)validity
{
  return self->_validity;
}

- (CGSize)desiredBarcodeSize
{
  double width;
  double height;
  CGSize result;

  width = self->_desiredBarcodeSize.width;
  height = self->_desiredBarcodeSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)shouldMatteCode
{
  return self->_shouldMatteCode;
}

- (void)setShouldMatteCode:(BOOL)a3
{
  self->_shouldMatteCode = a3;
}

- (double)altTextInset
{
  return self->_altTextInset;
}

- (UIImage)altImage
{
  return self->_altImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altImageView, 0);
  objc_storeStrong((id *)&self->_altImage, 0);
  objc_storeStrong((id *)&self->_altTextLabel, 0);
  objc_storeStrong((id *)&self->_matteConstraints, 0);
  objc_storeStrong((id *)&self->_stickerConstraints, 0);
  objc_storeStrong((id *)&self->_barcodeView, 0);
  objc_storeStrong((id *)&self->_matteView, 0);
  objc_storeStrong((id *)&self->_barcodeImage, 0);
  objc_storeStrong((id *)&self->_barcode, 0);
}

@end

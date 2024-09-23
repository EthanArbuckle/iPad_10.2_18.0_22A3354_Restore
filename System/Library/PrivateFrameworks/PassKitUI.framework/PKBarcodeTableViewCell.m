@implementation PKBarcodeTableViewCell

- (PKBarcodeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKBarcodeTableViewCell *v5;
  PKBarcodeTableViewCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKBarcodeTableViewCell;
  v5 = -[PKBarcodeTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v6 = v5;
  if (v5)
  {
    v5->_barcodeStyle = a3;
    -[PKBarcodeTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    -[PKBarcodeTableViewCell _computeMaxBarcodeSize](v6, "_computeMaxBarcodeSize");
  }
  return v6;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKBarcodeTableViewCell;
  -[PKBarcodeTableViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKBarcodeStickerView sizeThatFits:](self->_barcodeStickerView, "sizeThatFits:", 290.0, dbl_19DF169B0[-[PKPass style](self->_pass, "style") == 4]);
  -[PKBarcodeTableViewCell frame](self, "frame");
  UIRectCenteredXInRect();
  -[PKBarcodeStickerView setFrame:](self->_barcodeStickerView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[PKBarcodeStickerView sizeThatFits:](self->_barcodeStickerView, "sizeThatFits:", self->_maximumBarcodeSize.width, self->_maximumBarcodeSize.height);
  v5 = v4 + 8.0;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)setPass:(id)a3
{
  id v5;
  void *v6;
  PKBarcodeStickerView *v7;
  void *v8;
  PKBarcodeStickerView *v9;
  PKBarcodeStickerView *barcodeStickerView;
  id v11;

  v5 = a3;
  if (v5)
  {
    v11 = v5;
    objc_msgSend(v5, "barcode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v11;
    if (v6)
    {
      objc_storeStrong((id *)&self->_pass, a3);
      -[PKBarcodeStickerView removeFromSuperview](self->_barcodeStickerView, "removeFromSuperview");
      v7 = [PKBarcodeStickerView alloc];
      objc_msgSend(v11, "barcode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKBarcodeStickerView initWithBarcode:validityState:](v7, "initWithBarcode:validityState:", v8, +[PKBarcodeStickerView validityStateForPass:](PKBarcodeStickerView, "validityStateForPass:", v11));
      barcodeStickerView = self->_barcodeStickerView;
      self->_barcodeStickerView = v9;

      -[PKBarcodeStickerView sizeToFit](self->_barcodeStickerView, "sizeToFit");
      -[PKBarcodeStickerView layoutIfNeeded](self->_barcodeStickerView, "layoutIfNeeded");
      -[PKBarcodeTableViewCell addSubview:](self, "addSubview:", self->_barcodeStickerView);
      v5 = v11;
    }
  }

}

- (void)setBarcodeStyle:(int64_t)a3
{
  self->_barcodeStyle = a3;
  -[PKBarcodeTableViewCell _computeMaxBarcodeSize](self, "_computeMaxBarcodeSize");
  -[PKBarcodeTableViewCell sizeToFit](self, "sizeToFit");
  -[PKBarcodeTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_computeMaxBarcodeSize
{
  int64_t barcodeStyle;
  __int128 *v3;

  barcodeStyle = self->_barcodeStyle;
  if (barcodeStyle == 1)
  {
    v3 = &PKBoardingPassMaxBarcodeSize;
  }
  else
  {
    if (barcodeStyle)
      return;
    v3 = &PKMaxBarcodeSize;
  }
  self->_maximumBarcodeSize = (CGSize)*v3;
}

- (PKPass)pass
{
  return self->_pass;
}

- (int64_t)barcodeStyle
{
  return self->_barcodeStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_barcodeStickerView, 0);
}

@end

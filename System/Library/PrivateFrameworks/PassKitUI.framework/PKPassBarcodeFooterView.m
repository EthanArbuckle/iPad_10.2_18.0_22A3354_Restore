@implementation PKPassBarcodeFooterView

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassBarcodeFooterView;
  -[PKPassFooterContentView layoutSubviews](&v4, sel_layoutSubviews);
  if ((unint64_t)PKUIGetMinScreenType() <= 3)
  {
    -[PKPassFooterContentView bottomRule](self, "bottomRule");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    objc_msgSend(v3, "setFrame:");

  }
}

@end

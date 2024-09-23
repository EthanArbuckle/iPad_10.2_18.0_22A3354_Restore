@implementation PKPaymentSetupFieldBuiltInTotalAssetsPicker

- (PKPaymentSetupFieldBuiltInTotalAssetsPicker)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PKPaymentSetupFieldBuiltInTotalAssetsPicker *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupFieldBuiltInTotalAssetsPicker;
  v9 = -[PKPaymentSetupField initWithIdentifier:type:](&v12, sel_initWithIdentifier_type_, CFSTR("totalAssetsPicker"), a4);
  if (v9)
  {
    PKLocalizedFeatureString(CFSTR("TOTAL_ASSETS"), 2, 0, v4, v5, v6, v7, v8, (uint64_t)v12.receiver);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v9, "_setLocalizedDisplayName:", v10);

  }
  return v9;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end

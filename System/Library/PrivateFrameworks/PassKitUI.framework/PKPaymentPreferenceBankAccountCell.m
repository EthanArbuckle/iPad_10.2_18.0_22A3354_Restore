@implementation PKPaymentPreferenceBankAccountCell

- (PKPaymentPreferenceBankAccountCell)initWithReuseIdentifier:(id)a3
{
  PKPaymentPreferenceBankAccountCell *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  uint64_t v9;
  UIImage *bankIcon;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPreferenceBankAccountCell;
  v3 = -[PKPaymentPreferenceCardCell initWithReuseIdentifier:](&v12, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    PKPassKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("Bank"), CFSTR("pdf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PKPassFrontFaceContentSize();
    PKFloatRoundToPixel();
    v7 = v6;
    v8 = PKUIScreenScale();
    PKUIImageFromPDF(v5, 66.0, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    bankIcon = v3->_bankIcon;
    v3->_bankIcon = (UIImage *)v9;

  }
  return v3;
}

- (void)setBankAccount:(id)a3
{
  objc_storeStrong((id *)&self->_bankAccount, a3);
  -[PKPaymentPreferenceBankAccountCell _updateCellContent](self, "_updateCellContent");
}

- (void)_updateCellContent
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceBankAccountCell;
  -[PKPaymentPreferenceCardCell _updateCellContent](&v6, sel__updateCellContent);
  -[PKPaymentPreferenceCardCell displayLabel](self, "displayLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBankAccountInformation bankName](self->_bankAccount, "bankName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  -[PKPaymentPreferenceCardCell cardArtView](self, "cardArtView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", self->_bankIcon);

}

- (void)_updateSubtitleLabel
{
  void *v3;
  id v4;

  -[PKPaymentPreferenceCardCell subtitleLabel](self, "subtitleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKBankAccountInformation maskedAccountNumber](self->_bankAccount, "maskedAccountNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

- (PKBankAccountInformation)bankAccount
{
  return self->_bankAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankAccount, 0);
  objc_storeStrong((id *)&self->_bankIcon, 0);
}

@end

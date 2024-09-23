@implementation PKPaymentSetupFieldBuiltInYearlyIncomeLabel

- (PKPaymentSetupFieldBuiltInYearlyIncomeLabel)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PKPaymentSetupFieldBuiltInYearlyIncomeLabel *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)PKPaymentSetupFieldBuiltInYearlyIncomeLabel;
  v9 = -[PKPaymentSetupField initWithIdentifier:type:](&v36, sel_initWithIdentifier_type_, CFSTR("yearlyIncomeLabel"), a4);
  if (v9)
  {
    PKLocalizedFeatureString(CFSTR("INCOME_LABEL"), 2, 0, v4, v5, v6, v7, v8, (uint64_t)v36.receiver);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField setDefaultValue:](v9, "setDefaultValue:", v10);

    PKLocalizedFeatureString(CFSTR("INCOME_LABEL_BUTTON"), 2, 0, v11, v12, v13, v14, v15, (uint64_t)v36.receiver);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldLabel setButtonTitle:](v9, "setButtonTitle:", v16);

    PKLocalizedFeatureString(CFSTR("INCOME_DETAIL_TITLE"), 2, 0, v17, v18, v19, v20, v21, (uint64_t)v36.receiver);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldLabel setDetailTitle:](v9, "setDetailTitle:", v22);

    PKLocalizedFeatureString(CFSTR("INCOME_DETAIL_SUBTITLE"), 2, 0, v23, v24, v25, v26, v27, (uint64_t)v36.receiver);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldLabel setDetailSubtitle:](v9, "setDetailSubtitle:", v28);

    PKLocalizedFeatureString(CFSTR("INCOME_DETAIL_BODY"), 2, 0, v29, v30, v31, v32, v33, (uint64_t)v36.receiver);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldLabel setDetailBody:](v9, "setDetailBody:", v34);

    -[PKPaymentSetupField setRequiresSecureSubmission:](v9, "setRequiresSecureSubmission:", 0);
  }
  return v9;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end

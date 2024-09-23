@implementation PKPaymentSetupFieldBuiltInAboutCreditReporting

- (PKPaymentSetupFieldBuiltInAboutCreditReporting)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInAboutCreditReporting *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PKPaymentSetupFieldBuiltInAboutCreditReporting;
  v4 = -[PKPaymentSetupField initWithIdentifier:type:](&v30, sel_initWithIdentifier_type_, CFSTR("aboutCreditReporting"), a4);
  if (v4)
  {
    +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKPassKitBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyServicePreferredLanguageForFeatureIdentifier:mainLanguageBundle:", 2, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedApplyFeatureString(CFSTR("VERIFY_SSN_FOOTER"), 2, v8, 0, v9, v10, v11, v12, (uint64_t)v30.receiver);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField setDefaultValue:](v4, "setDefaultValue:", v13);

    PKLocalizedApplyFeatureString(CFSTR("VERIFY_SSN_LINK"), 2, v8, 0, v14, v15, v16, v17, (uint64_t)v30.receiver);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldLabel setButtonTitle:](v4, "setButtonTitle:", v18);

    PKLocalizedApplyFeatureString(CFSTR("VERIFY_SSN_MORE_INFO_TITLE"), 2, v8, 0, v19, v20, v21, v22, (uint64_t)v30.receiver);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldLabel setDetailTitle:](v4, "setDetailTitle:", v23);

    PKLocalizedApplyFeatureString(CFSTR("VERIFY_SSN_MORE_INFO_BODY"), 2, v8, 0, v24, v25, v26, v27, (uint64_t)v30.receiver);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldLabel setDetailBody:](v4, "setDetailBody:", v28);

    -[PKPaymentSetupField setRequiresSecureSubmission:](v4, "setRequiresSecureSubmission:", 0);
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end

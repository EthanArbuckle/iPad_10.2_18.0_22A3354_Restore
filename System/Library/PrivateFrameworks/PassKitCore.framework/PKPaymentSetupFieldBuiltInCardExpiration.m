@implementation PKPaymentSetupFieldBuiltInCardExpiration

- (PKPaymentSetupFieldBuiltInCardExpiration)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInCardExpiration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupFieldBuiltInCardExpiration;
  v4 = -[PKPaymentSetupFieldDate initWithIdentifier:type:](&v10, sel_initWithIdentifier_type_, CFSTR("cardExpiration"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("EXPIRATION_DATE"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    -[PKPaymentSetupField setSubmissionKey:](v4, "setSubmissionKey:", CFSTR("expiration"));
    -[PKPaymentSetupField setSubmissionDestination:](v4, "setSubmissionDestination:", CFSTR("eligibility"));
    -[PKPaymentSetupField setRequiresSecureSubmission:](v4, "setRequiresSecureSubmission:", 1);
    -[PKPaymentSetupFieldDate setShowsDay:](v4, "setShowsDay:", 0);
    -[PKPaymentSetupFieldDate setShowsMonth:](v4, "setShowsMonth:", 1);
    -[PKPaymentSetupFieldDate setShowsYear:](v4, "setShowsYear:", 1);
    -[PKPaymentSetupField setDisplayFormat:](v4, "setDisplayFormat:", CFSTR("MM/yy"));
    -[PKPaymentSetupFieldDate setSubmissionFormat:](v4, "setSubmissionFormat:", CFSTR("MM/yy"));
    -[PKPaymentSetupFieldText setSecureText:](v4, "setSecureText:", 1);
    -[PKPaymentSetupFieldText setSecureVisibleText:](v4, "setSecureVisibleText:", 1);
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldDate setCalendar:](v4, "setCalendar:", v6);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocaleWithOverriddenCalendar(v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldDate setLocale:](v4, "setLocale:", v8);

  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end

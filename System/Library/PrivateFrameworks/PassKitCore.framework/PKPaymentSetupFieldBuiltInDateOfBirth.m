@implementation PKPaymentSetupFieldBuiltInDateOfBirth

- (PKPaymentSetupFieldBuiltInDateOfBirth)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInDateOfBirth *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInDateOfBirth;
  v4 = -[PKPaymentSetupFieldDate initWithIdentifier:type:](&v7, sel_initWithIdentifier_type_, CFSTR("dateOfBirth"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("DATE_OF_BIRTH"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    -[PKPaymentSetupFieldDate setShowsDay:](v4, "setShowsDay:", 1);
    -[PKPaymentSetupFieldDate setShowsYear:](v4, "setShowsYear:", 1);
    -[PKPaymentSetupFieldDate setShowsMonth:](v4, "setShowsMonth:", 1);
    v4->_disallowCurrentYear = 1;
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

- (void)updateWithConfiguration:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupFieldBuiltInDateOfBirth;
  v4 = a3;
  -[PKPaymentSetupFieldDate updateWithConfiguration:](&v6, sel_updateWithConfiguration_, v4);
  v5 = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("minimumAge"), v6.receiver, v6.super_class);

  self->_minimumAge = v5;
}

- (BOOL)submissionStringMeetsAllRequirements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 disallowCurrentYear;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int64_t minimumAge;
  unsigned int v13;
  BOOL v15;
  BOOL v16;
  objc_super v18;

  -[PKPaymentSetupFieldDate currentValue](self, "currentValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldDate calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  disallowCurrentYear = self->_disallowCurrentYear;
  if (self->_disallowCurrentYear)
    v8 = 4;
  else
    v8 = 16;
  v9 = objc_msgSend(v5, "compareDate:toDate:toUnitGranularity:", v3, v4, v8);
  objc_msgSend(v6, "components:fromDate:toDate:options:", 4, v3, v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "year");
  minimumAge = self->_minimumAge;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentSetupFieldBuiltInDateOfBirth;
  v13 = -[PKPaymentSetupFieldDate submissionStringMeetsAllRequirements](&v18, sel_submissionStringMeetsAllRequirements);
  v15 = v9 != !disallowCurrentYear && v11 >= minimumAge;
  if (v13)
    v16 = v15;
  else
    v16 = 0;

  return v16;
}

- (int64_t)minimumAge
{
  return self->_minimumAge;
}

- (BOOL)disallowCurrentYear
{
  return self->_disallowCurrentYear;
}

- (void)setDisallowCurrentYear:(BOOL)a3
{
  self->_disallowCurrentYear = a3;
}

@end

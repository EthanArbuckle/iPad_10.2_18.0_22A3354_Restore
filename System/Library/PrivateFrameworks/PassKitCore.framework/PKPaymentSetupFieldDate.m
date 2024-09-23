@implementation PKPaymentSetupFieldDate

- (PKPaymentSetupFieldDate)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldDate *v4;
  PKPaymentSetupFieldDate *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupFieldDate;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v9, sel_initWithIdentifier_type_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_showsDay = 0;
    v4->_showsMonth = 1;
    v4->_showsYear = 1;
    -[PKPaymentSetupField setDisplayFormat:](v4, "setDisplayFormat:", CFSTR("MM/yy"));
    -[PKPaymentSetupFieldDate setSubmissionFormat:](v5, "setSubmissionFormat:", CFSTR("MM/yy"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldDate setLocale:](v5, "setLocale:", v6);

    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldDate setCalendar:](v5, "setCalendar:", v7);

  }
  return v5;
}

- (void)setCurrentValue:(id)a3
{
  NSObject *v4;
  NSObject *currentValue;
  void *v6;

  if (self->super.super._currentValue != a3)
  {
    v4 = objc_msgSend(a3, "copyWithZone:", 0);
    currentValue = self->super.super._currentValue;
    self->super.super._currentValue = v4;

    -[PKPaymentSetupField attribute](self, "attribute");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCurrentValue:", self->super.super._currentValue);

    -[PKPaymentSetupField noteCurrentValueChanged](self, "noteCurrentValueChanged");
  }
}

- (NSDate)currentValue
{
  return (NSDate *)self->super.super._currentValue;
}

- (id)displayString
{
  NSDateFormatter *displayDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  displayDateFormatter = self->_displayDateFormatter;
  if (!displayDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_displayDateFormatter;
    self->_displayDateFormatter = v4;

    displayDateFormatter = self->_displayDateFormatter;
  }
  -[PKPaymentSetupFieldDate locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setLocale:](displayDateFormatter, "setLocale:", v6);

  v7 = (void *)MEMORY[0x1E0CB3578];
  -[PKPaymentSetupField displayFormat](self, "displayFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter locale](self->_displayDateFormatter, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFormatFromTemplate:options:locale:", v8, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateFormatter setDateFormat:](self->_displayDateFormatter, "setDateFormat:", v10);
  -[PKPaymentSetupFieldDate currentValue](self, "currentValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[PKPaymentSetupFieldDate defaultDate](self, "defaultDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSDateFormatter stringFromDate:](self->_displayDateFormatter, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_submissionStringForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    if (qword_1EE1DB4A8 != -1)
      dispatch_once(&qword_1EE1DB4A8, &__block_literal_global_11);
    v5 = (void *)_MergedGlobals_12;
    -[PKPaymentSetupFieldDate submissionFormat](self, "submissionFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDateFormat:", v6);

    objc_msgSend((id)_MergedGlobals_12, "stringFromDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pk_zString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __53__PKPaymentSetupFieldDate__submissionStringForValue___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_12;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

- (id)_defaultValueAsDateForCurrentLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (qword_1EE1DB4B8 != -1)
    dispatch_once(&qword_1EE1DB4B8, &__block_literal_global_556);
  v3 = (void *)qword_1EE1DB4B0;
  -[PKPaymentSetupFieldDate submissionFormat](self, "submissionFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDateFormat:", v4);

  v5 = (void *)qword_1EE1DB4B0;
  -[PKPaymentSetupField defaultValue](self, "defaultValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __62__PKPaymentSetupFieldDate__defaultValueAsDateForCurrentLocale__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1EE1DB4B0;
  qword_1EE1DB4B0 = (uint64_t)v0;

  v2 = (void *)qword_1EE1DB4B0;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

- (BOOL)submissionStringMeetsAllRequirements
{
  void *v2;
  BOOL v3;

  -[PKPaymentSetupField submissionString](self, "submissionString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (NSDate)defaultDate
{
  NSDate *defaultDate;
  NSDate *v4;
  NSDate *v5;

  defaultDate = self->_defaultDate;
  if (!defaultDate)
  {
    -[PKPaymentSetupFieldDate _defaultValueAsDateForCurrentLocale](self, "_defaultValueAsDateForCurrentLocale");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultDate;
    self->_defaultDate = v4;

    defaultDate = self->_defaultDate;
  }
  return defaultDate;
}

- (void)updateWithAttribute:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldDate;
  -[PKPaymentSetupFieldText updateWithAttribute:](&v8, sel_updateWithAttribute_, v4);
  -[PKPaymentSetupFieldDate _commonUpdate](self, "_commonUpdate");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PKPaymentSetupFieldDate setShowsDay:](self, "setShowsDay:", objc_msgSend(v5, "requireDay"));
    -[PKPaymentSetupFieldDate setShowsMonth:](self, "setShowsMonth:", objc_msgSend(v5, "requireMonth"));
    -[PKPaymentSetupFieldDate setShowsYear:](self, "setShowsYear:", objc_msgSend(v5, "requireYear"));
    objc_msgSend(v5, "defaultValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_storeStrong((id *)&self->_defaultDate, v6);
    -[PKPaymentSetupFieldDate defaultDate](self, "defaultDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v5, "setCurrentValue:", v7);

  }
}

- (void)updateWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupFieldDate;
  -[PKPaymentSetupFieldText updateWithConfiguration:](&v12, sel_updateWithConfiguration_, v4);
  -[PKPaymentSetupFieldDate _commonUpdate](self, "_commonUpdate");
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("showsDay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    -[PKPaymentSetupFieldDate setShowsDay:](self, "setShowsDay:", objc_msgSend(v5, "BOOLValue"));
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("showsMonth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    -[PKPaymentSetupFieldDate setShowsMonth:](self, "setShowsMonth:", objc_msgSend(v7, "BOOLValue"));
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("showsYear"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    -[PKPaymentSetupFieldDate setShowsYear:](self, "setShowsYear:", objc_msgSend(v9, "BOOLValue"));
  objc_msgSend(v4, "PKStringForKey:", CFSTR("submissionFormat"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[PKPaymentSetupFieldDate setSubmissionFormat:](self, "setSubmissionFormat:", v11);

}

- (void)_commonUpdate
{
  -[PKPaymentSetupFieldText setMinLength:](self, "setMinLength:", 0);
  -[PKPaymentSetupFieldText setMaxLength:](self, "setMaxLength:", 0);
  -[PKPaymentSetupFieldText setSecureText:](self, "setSecureText:", 1);
  -[PKPaymentSetupFieldText setSecureVisibleText:](self, "setSecureVisibleText:", 1);
  -[PKPaymentSetupFieldText setNumeric:](self, "setNumeric:", 0);
  -[PKPaymentSetupFieldText setLuhnCheck:](self, "setLuhnCheck:", 0);
}

- (unint64_t)fieldType
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupFieldDate;
  v4 = -[PKPaymentSetupFieldText copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_BYTE *)v4 + 248) = self->_showsDay;
  *((_BYTE *)v4 + 249) = self->_showsMonth;
  *((_BYTE *)v4 + 250) = self->_showsYear;
  objc_storeStrong((id *)v4 + 32, self->_submissionFormat);
  objc_storeStrong((id *)v4 + 33, self->_defaultDate);
  objc_storeStrong((id *)v4 + 34, self->_calendar);
  objc_storeStrong((id *)v4 + 35, self->_locale);
  objc_storeStrong((id *)v4 + 30, self->_displayDateFormatter);
  return v4;
}

- (BOOL)showsDay
{
  return self->_showsDay;
}

- (void)setShowsDay:(BOOL)a3
{
  self->_showsDay = a3;
}

- (BOOL)showsMonth
{
  return self->_showsMonth;
}

- (void)setShowsMonth:(BOOL)a3
{
  self->_showsMonth = a3;
}

- (BOOL)showsYear
{
  return self->_showsYear;
}

- (void)setShowsYear:(BOOL)a3
{
  self->_showsYear = a3;
}

- (NSString)submissionFormat
{
  return self->_submissionFormat;
}

- (void)setSubmissionFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setDefaultDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_defaultDate, 0);
  objc_storeStrong((id *)&self->_submissionFormat, 0);
  objc_storeStrong((id *)&self->_displayDateFormatter, 0);
}

@end

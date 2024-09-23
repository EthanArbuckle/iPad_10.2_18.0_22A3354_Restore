@implementation PKPaymentCredentialMetadataDate

- (PKPaymentCredentialMetadataDate)initWithConfiguration:(id)a3
{
  id v4;
  PKPaymentCredentialMetadataDate *v5;
  uint64_t v6;
  NSString *displayFormat;
  NSObject *v8;
  uint8_t v10[16];
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentCredentialMetadataDate;
  v5 = -[PKPaymentCredentialMetadata initWithConfiguration:](&v11, sel_initWithConfiguration_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("displayFormat"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayFormat = v5->_displayFormat;
    v5->_displayFormat = (NSString *)v6;

    if (!v5->_displayFormat)
    {

      PKLogFacilityTypeGetObject(6uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "No Display format in configuration could not create metadata", v10, 2u);
      }

      v5 = 0;
    }
  }

  return v5;
}

- (id)displayString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (qword_1ECF225B8 != -1)
    dispatch_once(&qword_1ECF225B8, &__block_literal_global_114);
  v3 = (void *)MEMORY[0x1E0CB3578];
  -[PKPaymentCredentialMetadataDate displayFormat](self, "displayFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFormatFromTemplate:options:locale:", v4, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_MergedGlobals_235, "setDateFormat:", v6);
  -[PKPaymentCredentialMetadata value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_MergedGlobals_235, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __48__PKPaymentCredentialMetadataDate_displayString__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_235;
  _MergedGlobals_235 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_235;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

- (BOOL)isEqual:(id)a3
{
  PKPaymentCredentialMetadataDate *v4;
  BOOL v5;

  v4 = (PKPaymentCredentialMetadataDate *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKPaymentCredentialMetadataDate _isEqualToMetadata:](self, "_isEqualToMetadata:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToMetadata:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentCredentialMetadataDate;
  if (-[PKPaymentCredentialMetadata _isEqualToMetadata:](&v12, sel__isEqualToMetadata_, v4))
  {
    v5 = (void *)v4[3];
    v6 = self->_displayFormat;
    v7 = v5;
    v8 = v7;
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      if (v6)
        v9 = v7 == 0;
      else
        v9 = 1;
      if (v9)
        v10 = 0;
      else
        v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_displayFormat);
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentCredentialMetadataDate;
  v4 = -[PKPaymentCredentialMetadata hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (NSString)displayFormat
{
  return self->_displayFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayFormat, 0);
}

@end

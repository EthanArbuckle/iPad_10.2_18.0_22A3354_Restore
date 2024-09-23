@implementation PKSelectedItemActionItem

- (PKSelectedItemActionItem)init
{

  return 0;
}

- (PKSelectedItemActionItem)initWithDictionary:(id)a3
{
  id v4;
  PKSelectedItemActionItem *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *title;
  void *v12;
  uint64_t v13;
  NSDecimalNumber *amount;
  void *v15;
  uint64_t v16;
  NSString *currency;
  void *v18;
  uint64_t v19;
  NSDate *newExpirationDate;
  void *v21;
  uint64_t v22;
  NSDictionary *serviceProviderData;
  uint64_t v24;
  PKPassLibrary *sharedLibrary;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKSelectedItemActionItem;
  v5 = -[PKSelectedItemActionItem init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("amount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v13;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currency"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    currency = v5->_currency;
    v5->_currency = (NSString *)v16;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("newExpirationDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    newExpirationDate = v5->_newExpirationDate;
    v5->_newExpirationDate = (NSDate *)v19;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("serviceProviderData"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v22;

    v5->_serviceProviderDataRequiresLocalBalance = objc_msgSend(v4, "PKBoolForKey:", CFSTR("serviceProviderDataRequiresLocalBalance"));
    v5->_serviceProviderDataRequiresAppletData = objc_msgSend(v4, "PKBoolForKey:", CFSTR("serviceProviderDataRequiresAppletData"));
    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v24 = objc_claimAutoreleasedReturnValue();
    sharedLibrary = v5->_sharedLibrary;
    v5->_sharedLibrary = (PKPassLibrary *)v24;

  }
  return v5;
}

- (void)_processLocalizableStrings:(id)a3
{
  void (**v4)(void);
  NSString *v5;
  NSString *title;
  void (**v7)(void);

  v4 = (void (**)(void))a3;
  if (v4 && self->_title)
  {
    v7 = v4;
    v4[2]();
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = self->_title;
    self->_title = v5;

    v4 = v7;
  }

}

- (void)serviceProviderDataWithPass:(id)a3 currentLocalBalance:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PKPassLibrary *sharedLibrary;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)-[NSDictionary mutableCopy](self->_serviceProviderData, "mutableCopy");
  v12 = v11;
  if (v9 && self->_serviceProviderDataRequiresLocalBalance)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("localBalance"));
  if (self->_serviceProviderDataRequiresAppletData)
  {
    sharedLibrary = self->_sharedLibrary;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__PKSelectedItemActionItem_serviceProviderDataWithPass_currentLocalBalance_completion___block_invoke;
    v15[3] = &unk_1E2ABDA90;
    v16 = v12;
    v17 = v10;
    -[PKPassLibrary encryptedServiceProviderDataForSecureElementPass:completion:](sharedLibrary, "encryptedServiceProviderDataForSecureElementPass:completion:", v8, v15);

  }
  else
  {
    v14 = (void *)objc_msgSend(v12, "copy");
    (*((void (**)(id, void *))v10 + 2))(v10, v14);

  }
}

void __87__PKSelectedItemActionItem_serviceProviderDataWithPass_currentLocalBalance_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, CFSTR("appletData"));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSelectedItemActionItem)initWithCoder:(id)a3
{
  id v4;
  PKSelectedItemActionItem *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *title;
  void *v12;
  uint64_t v13;
  NSDecimalNumber *amount;
  void *v15;
  uint64_t v16;
  NSString *currency;
  uint64_t v18;
  NSDate *newExpirationDate;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSDictionary *serviceProviderData;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKSelectedItemActionItem;
  v5 = -[PKSelectedItemActionItem init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    currency = v5->_currency;
    v5->_currency = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("newExpirationDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    newExpirationDate = v5->_newExpirationDate;
    v5->_newExpirationDate = (NSDate *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("serviceProviderData"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v27;

    v5->_serviceProviderDataRequiresLocalBalance = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("serviceProviderDataRequiresLocalBalance"));
    v5->_serviceProviderDataRequiresAppletData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("serviceProviderDataRequiresAppletData"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_newExpirationDate, CFSTR("newExpirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceProviderData, CFSTR("serviceProviderData"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_serviceProviderDataRequiresLocalBalance, CFSTR("serviceProviderDataRequiresLocalBalance"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_serviceProviderDataRequiresAppletData, CFSTR("serviceProviderDataRequiresAppletData"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_amount, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_currency, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSDate copyWithZone:](self->_newExpirationDate, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[NSDictionary copyWithZone:](self->_serviceProviderData, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v16;

  *(_BYTE *)(v5 + 16) = self->_serviceProviderDataRequiresLocalBalance;
  *(_BYTE *)(v5 + 17) = self->_serviceProviderDataRequiresAppletData;
  return (id)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currency
{
  return self->_currency;
}

- (NSDate)newExpirationDate
{
  return self->_newExpirationDate;
}

- (NSDictionary)serviceProviderData
{
  return self->_serviceProviderData;
}

- (BOOL)serviceProviderDataRequiresLocalBalance
{
  return self->_serviceProviderDataRequiresLocalBalance;
}

- (BOOL)serviceProviderDataRequiresAppletData
{
  return self->_serviceProviderDataRequiresAppletData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_newExpirationDate, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sharedLibrary, 0);
}

@end

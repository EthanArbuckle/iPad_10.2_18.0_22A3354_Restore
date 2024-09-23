@implementation PKPurchaseNewActionItem

- (PKPurchaseNewActionItem)init
{

  return 0;
}

- (PKPurchaseNewActionItem)initWithDictionary:(id)a3
{
  id v4;
  PKPurchaseNewActionItem *v5;
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
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *serviceProviderData;
  uint64_t v26;
  PKPassLibrary *sharedLibrary;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPurchaseNewActionItem;
  v5 = -[PKPurchaseNewActionItem init](&v29, sel_init);
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
    v22 = (void *)objc_msgSend(v21, "copy");
    v23 = v22;
    if (v22)
      v24 = v22;
    else
      v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = v24;

    v5->_serviceProviderDataRequiresAppletData = objc_msgSend(v4, "PKBoolForKey:", CFSTR("serviceProviderDataRequiresAppletData"));
    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v26 = objc_claimAutoreleasedReturnValue();
    sharedLibrary = v5->_sharedLibrary;
    v5->_sharedLibrary = (PKPassLibrary *)v26;

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

- (void)serviceProviderDataWithItemForPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSString *identifier;
  NSDecimalNumber *amount;
  void *v12;
  void *v13;
  PKPassLibrary *sharedLibrary;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)-[NSMutableDictionary mutableCopy](self->_serviceProviderData, "mutableCopy");
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  identifier = self->_identifier;
  v19[0] = CFSTR("identifier");
  v19[1] = CFSTR("amount");
  amount = self->_amount;
  v20[0] = identifier;
  v20[1] = amount;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v12);
  v13 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("products"));

  if (self->_serviceProviderDataRequiresAppletData)
  {
    sharedLibrary = self->_sharedLibrary;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __73__PKPurchaseNewActionItem_serviceProviderDataWithItemForPass_completion___block_invoke;
    v16[3] = &unk_1E2ABDA90;
    v17 = v8;
    v18 = v7;
    -[PKPassLibrary encryptedServiceProviderDataForSecureElementPass:completion:](sharedLibrary, "encryptedServiceProviderDataForSecureElementPass:completion:", v6, v16);

    v15 = v17;
  }
  else
  {
    v15 = (void *)objc_msgSend(v8, "copy");
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }

}

void __73__PKPurchaseNewActionItem_serviceProviderDataWithItemForPass_completion___block_invoke(uint64_t a1, uint64_t a2)
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

- (PKPurchaseNewActionItem)initWithCoder:(id)a3
{
  id v4;
  PKPurchaseNewActionItem *v5;
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
  NSMutableDictionary *serviceProviderData;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKPurchaseNewActionItem;
  v5 = -[PKPurchaseNewActionItem init](&v30, sel_init);
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
    v5->_serviceProviderData = (NSMutableDictionary *)v27;

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
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_amount, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_currency, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSDate copyWithZone:](self->_newExpirationDate, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[NSMutableDictionary copyWithZone:](self->_serviceProviderData, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  *(_BYTE *)(v5 + 24) = self->_serviceProviderDataRequiresAppletData;
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

- (BOOL)serviceProviderDataRequiresAppletData
{
  return self->_serviceProviderDataRequiresAppletData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newExpirationDate, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_sharedLibrary, 0);
}

@end

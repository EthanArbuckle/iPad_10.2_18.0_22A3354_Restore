@implementation PKPayLaterAccountDetails

- (PKPayLaterAccountDetails)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  PKCurrencyAmount *currentBalance;
  uint64_t v12;
  PKCurrencyAmount *amountPaid;
  uint64_t v14;
  PKCurrencyAmount *totalFinanced;
  uint64_t v16;
  NSDate *nextDueDate;
  uint64_t v18;
  PKCurrencyAmount *nextDueAmount;
  uint64_t v20;
  NSString *countryCode;
  uint64_t v22;
  NSURL *associatedPassURL;
  uint64_t v24;
  NSString *associatedPassTypeIdentifier;
  uint64_t v26;
  NSString *associatedPassSerialNumber;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  PKPayLaterAccountProduct *v39;
  PKPayLaterAccountProduct *v40;
  uint64_t v41;
  NSSet *products;
  void *v43;
  PKPayLaterAccountTermsDetails *v44;
  PKPayLaterAccountTermsDetails *termsDetails;
  void *v46;
  PKPayLaterAccountUserInfo *v47;
  PKPayLaterAccountUserInfo *userInfo;
  uint64_t v49;
  NSArray *availableLanguages;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PKPayLaterAccountDetails;
  v5 = -[PKPayLaterAccountDetails init](&v56, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdatedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("createdDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("currentBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v10;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("amountPaid"));
    v12 = objc_claimAutoreleasedReturnValue();
    amountPaid = v5->_amountPaid;
    v5->_amountPaid = (PKCurrencyAmount *)v12;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalFinanced"));
    v14 = objc_claimAutoreleasedReturnValue();
    totalFinanced = v5->_totalFinanced;
    v5->_totalFinanced = (PKCurrencyAmount *)v14;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("nextDueDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    nextDueDate = v5->_nextDueDate;
    v5->_nextDueDate = (NSDate *)v16;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("nextDueAmount"));
    v18 = objc_claimAutoreleasedReturnValue();
    nextDueAmount = v5->_nextDueAmount;
    v5->_nextDueAmount = (PKCurrencyAmount *)v18;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("countryCode"));
    v20 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v20;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("associatedPassURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    associatedPassURL = v5->_associatedPassURL;
    v5->_associatedPassURL = (NSURL *)v22;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("associatedPassTypeIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v24;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("associatedPassSerialNumber"));
    v26 = objc_claimAutoreleasedReturnValue();
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v26;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("cardNetwork"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cardNetwork = PKPaymentCredentialTypeForPaymentNetworkName(v28);

    if (!v5->_cardNetwork)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("cardType"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        v5->_cardNetwork = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("cardType"));
    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("paymentType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_paymentType = PKPaymentMethodTypeForString(v30);

    v5->_financingPlanFetchLimit = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("financingPlanFetchLimit"));
    v5->_requiresGenericMessaging = objc_msgSend(v4, "PKBoolForKey:", CFSTR("requiresGenericMessaging"));
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("products"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "count"))
    {
      v32 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v33 = v31;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v53;
        do
        {
          v37 = 0;
          do
          {
            if (*(_QWORD *)v53 != v36)
              objc_enumerationMutation(v33);
            v38 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v37);
            v39 = [PKPayLaterAccountProduct alloc];
            v40 = -[PKPayLaterAccountProduct initWithDictionary:](v39, "initWithDictionary:", v38, (_QWORD)v52);
            objc_msgSend(v32, "addObject:", v40);

            ++v37;
          }
          while (v35 != v37);
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        }
        while (v35);
      }

      v41 = objc_msgSend(v32, "copy");
      products = v5->_products;
      v5->_products = (NSSet *)v41;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("termsDetails"), (_QWORD)v52);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "count"))
    {
      v44 = -[PKPayLaterAccountTermsDetails initWithDictionary:]([PKPayLaterAccountTermsDetails alloc], "initWithDictionary:", v43);
      termsDetails = v5->_termsDetails;
      v5->_termsDetails = v44;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("userInfo"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "count"))
    {
      v47 = -[PKPayLaterAccountUserInfo initWithDictionary:]([PKPayLaterAccountUserInfo alloc], "initWithDictionary:", v46);
      userInfo = v5->_userInfo;
      v5->_userInfo = v47;

    }
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("availableLanguages"));
    v49 = objc_claimAutoreleasedReturnValue();
    availableLanguages = v5->_availableLanguages;
    v5->_availableLanguages = (NSArray *)v49;

  }
  return v5;
}

- (id)perferredLanguageWithMainBundle:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  __CFString *v19;
  uint64_t v21;
  PKPayLaterAccountDetails *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    PKPassKitBundle();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[NSArray count](self->_availableLanguages, "count"))
  {
    objc_msgSend(v4, "preferredLocalizations");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v23)
    {
      v6 = *(_QWORD *)v30;
      v21 = *(_QWORD *)v30;
      v22 = self;
      v24 = v5;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v30 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v9 = self->_availableLanguages;
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v26;
            while (2)
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v26 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
                v15 = v8;
                v16 = v14;
                if (v15 == v16)
                {

LABEL_27:
                  v19 = (__CFString *)v15;

                  v5 = v24;
                  goto LABEL_29;
                }
                v17 = v16;
                if (v8 && v16)
                {
                  v18 = objc_msgSend(v15, "isEqualToString:", v16);

                  if ((v18 & 1) != 0)
                    goto LABEL_27;
                }
                else
                {

                }
              }
              v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v11)
                continue;
              break;
            }
          }

          ++v7;
          self = v22;
          v5 = v24;
          v6 = v21;
        }
        while (v7 != v23);
        v19 = CFSTR("en");
        v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v23);
    }
    else
    {
      v19 = CFSTR("en");
    }
LABEL_29:

  }
  else
  {
    v19 = CFSTR("en");
  }

  return v19;
}

- (id)localizationBundleWithMainBundle:(id)a3
{
  id v3;

  v3 = a3;
  if (!v3)
  {
    PKPassKitBundle();
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)odiAttributes
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPayLaterAccountUserInfo firstName](self->_userInfo, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "odiAttribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
    objc_msgSend(v3, "setObject:forKey:", v6, v5);
  -[PKPayLaterAccountUserInfo lastName](self->_userInfo, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "odiAttribute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v11)
    objc_msgSend(v3, "setObject:forKey:", v11, v10);
  -[PKPayLaterAccountUserInfo phoneNumber](self->_userInfo, "phoneNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "odiAttribute");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && v14)
    objc_msgSend(v3, "setObject:forKey:", v14, v13);
  -[PKPayLaterAccountUserInfo street1](self->_userInfo, "street1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "odiAttribute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && v17)
    objc_msgSend(v3, "setObject:forKey:", v17, v16);
  -[PKPayLaterAccountUserInfo street2](self->_userInfo, "street2");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "odiAttribute");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 && v20)
    objc_msgSend(v3, "setObject:forKey:", v20, v19);
  -[PKPayLaterAccountUserInfo city](self->_userInfo, "city");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "odiAttribute");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22 && v23)
    objc_msgSend(v3, "setObject:forKey:", v23, v22);
  -[PKPayLaterAccountUserInfo state](self->_userInfo, "state");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "odiAttribute");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "text");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && v26)
    objc_msgSend(v3, "setObject:forKey:", v26, v25);
  -[PKPayLaterAccountUserInfo postalCode](self->_userInfo, "postalCode");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "odiAttribute");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "text");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28 && v29)
    objc_msgSend(v3, "setObject:forKey:", v29, v28);
  if (objc_msgSend(v3, "count"))
  {
    v30 = objc_alloc_init(MEMORY[0x1E0D17580]);
    v31 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v30, "setAttributes:", v31);

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (unint64_t)paymentType
{
  if (self->_paymentType)
    return self->_paymentType;
  else
    return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountDetails)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  PKCurrencyAmount *currentBalance;
  uint64_t v12;
  PKCurrencyAmount *amountPaid;
  uint64_t v14;
  PKCurrencyAmount *totalFinanced;
  uint64_t v16;
  NSDate *nextDueDate;
  uint64_t v18;
  PKCurrencyAmount *nextDueAmount;
  uint64_t v20;
  NSString *countryCode;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSSet *products;
  uint64_t v27;
  PKPayLaterAccountTermsDetails *termsDetails;
  uint64_t v29;
  PKPayLaterAccountUserInfo *userInfo;
  uint64_t v31;
  NSURL *associatedPassURL;
  uint64_t v33;
  NSString *associatedPassSerialNumber;
  uint64_t v35;
  NSString *associatedPassTypeIdentifier;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSArray *availableLanguages;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKPayLaterAccountDetails;
  v5 = -[PKPayLaterAccountDetails init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amountPaid"));
    v12 = objc_claimAutoreleasedReturnValue();
    amountPaid = v5->_amountPaid;
    v5->_amountPaid = (PKCurrencyAmount *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalFinanced"));
    v14 = objc_claimAutoreleasedReturnValue();
    totalFinanced = v5->_totalFinanced;
    v5->_totalFinanced = (PKCurrencyAmount *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nextDueDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    nextDueDate = v5->_nextDueDate;
    v5->_nextDueDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nextDueAmount"));
    v18 = objc_claimAutoreleasedReturnValue();
    nextDueAmount = v5->_nextDueAmount;
    v5->_nextDueAmount = (PKCurrencyAmount *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v20 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("products"));
    v25 = objc_claimAutoreleasedReturnValue();
    products = v5->_products;
    v5->_products = (NSSet *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsDetails"));
    v27 = objc_claimAutoreleasedReturnValue();
    termsDetails = v5->_termsDetails;
    v5->_termsDetails = (PKPayLaterAccountTermsDetails *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userInfo"));
    v29 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (PKPayLaterAccountUserInfo *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPassURL"));
    v31 = objc_claimAutoreleasedReturnValue();
    associatedPassURL = v5->_associatedPassURL;
    v5->_associatedPassURL = (NSURL *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPassSerialNumber"));
    v33 = objc_claimAutoreleasedReturnValue();
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPassTypeIdentifier"));
    v35 = objc_claimAutoreleasedReturnValue();
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v35;

    v5->_cardNetwork = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardNetwork"));
    v5->_paymentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentType"));
    v5->_financingPlanFetchLimit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("financingPlanFetchLimit"));
    v37 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("availableLanguages"));
    v40 = objc_claimAutoreleasedReturnValue();
    availableLanguages = v5->_availableLanguages;
    v5->_availableLanguages = (NSArray *)v40;

    v5->_requiresGenericMessaging = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresGenericMessaging"));
  }

  return v5;
}

- (BOOL)hasProvisionedPass
{
  return self->_associatedPassURL != 0;
}

- (id)productForProductType:(unint64_t)a3
{
  NSSet *products;
  _QWORD v5[5];

  products = self->_products;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PKPayLaterAccountDetails_productForProductType___block_invoke;
  v5[3] = &__block_descriptor_40_e34_B16__0__PKPayLaterAccountProduct_8l;
  v5[4] = a3;
  -[NSSet pk_anyObjectPassingTest:](products, "pk_anyObjectPassingTest:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __50__PKPayLaterAccountDetails_productForProductType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "productType") == *(_QWORD *)(a1 + 32);
}

- (id)currencyCode
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PKCurrencyAmount currency](self->_currentBalance, "currency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PKCurrencyAmount currency](self->_amountPaid, "currency");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      -[PKCurrencyAmount currency](self->_totalFinanced, "currency");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        -[PKCurrencyAmount currency](self->_nextDueAmount, "currency");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v10;

    }
  }

  return v5;
}

- (id)maximumEligibleSpendAmount
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = self->_products;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "eligibleSpend", (_QWORD)v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "availableToSpend");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v5)
        {
          if (v9)
          {
            objc_msgSend(v9, "amount");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "pk_isPositiveNumber");

            if (v12)
            {
              +[PKCurrencyAmount maximumCurrencyAmount:otherCurrencyAmount:](PKCurrencyAmount, "maximumCurrencyAmount:otherCurrencyAmount:", v5, v10);
              v13 = objc_claimAutoreleasedReturnValue();

              v5 = (id)v13;
            }
          }
        }
        else
        {
          v5 = v9;
        }

      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasEligibleSpend
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PKPayLaterAccountDetails maximumEligibleSpendAmount](self, "maximumEligibleSpendAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "amount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pk_isPositiveNumber");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isPayLaterSupportedInCurrentRegion
{
  void *v3;

  PKCurrentRegion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "compare:options:", self->_countryCode, 1) == 0;

  return (char)self;
}

- (id)minimumSinglePurchaseAmount
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = self->_products;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v3)
  {
    v5 = 0;
    goto LABEL_16;
  }
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v14;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v2);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "productDetails", (_QWORD)v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "minimumSinglePurchaseAmount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        if (!v9)
          goto LABEL_9;
LABEL_8:
        +[PKCurrencyAmount minimumCurrencyAmount:otherCurrencyAmount:](PKCurrencyAmount, "minimumCurrencyAmount:otherCurrencyAmount:", v5, v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v10;
        goto LABEL_9;
      }
      v5 = v9;
      if (v9)
        goto LABEL_8;
LABEL_9:

      ++v7;
    }
    while (v4 != v7);
    v11 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    v4 = v11;
  }
  while (v11);
LABEL_16:

  return v5;
}

- (id)maximumSinglePurchaseAmount
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = self->_products;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v3)
  {
    v5 = 0;
    goto LABEL_16;
  }
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v14;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v2);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "productDetails", (_QWORD)v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "maximumSinglePurchaseAmount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        if (!v9)
          goto LABEL_9;
LABEL_8:
        +[PKCurrencyAmount maximumCurrencyAmount:otherCurrencyAmount:](PKCurrencyAmount, "maximumCurrencyAmount:otherCurrencyAmount:", v5, v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v10;
        goto LABEL_9;
      }
      v5 = v9;
      if (v9)
        goto LABEL_8;
LABEL_9:

      ++v7;
    }
    while (v4 != v7);
    v11 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    v4 = v11;
  }
  while (v11);
LABEL_16:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *lastUpdatedDate;
  id v5;

  lastUpdatedDate = self->_lastUpdatedDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lastUpdatedDate, CFSTR("lastUpdatedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdDate, CFSTR("createdDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBalance, CFSTR("currentBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amountPaid, CFSTR("amountPaid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalFinanced, CFSTR("totalFinanced"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nextDueDate, CFSTR("nextDueDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nextDueAmount, CFSTR("nextDueAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_products, CFSTR("products"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsDetails, CFSTR("termsDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedPassURL, CFSTR("associatedPassURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedPassSerialNumber, CFSTR("associatedPassSerialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedPassTypeIdentifier, CFSTR("associatedPassTypeIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cardNetwork, CFSTR("cardNetwork"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_paymentType, CFSTR("paymentType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_financingPlanFetchLimit, CFSTR("financingPlanFetchLimit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableLanguages, CFSTR("availableLanguages"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresGenericMessaging, CFSTR("requiresGenericMessaging"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *lastUpdatedDate;
  NSDate *v6;
  NSDate *createdDate;
  NSDate *v8;
  PKCurrencyAmount *currentBalance;
  PKCurrencyAmount *v10;
  PKCurrencyAmount *amountPaid;
  PKCurrencyAmount *v12;
  PKCurrencyAmount *totalFinanced;
  PKCurrencyAmount *v14;
  NSDate *nextDueDate;
  NSDate *v16;
  PKCurrencyAmount *nextDueAmount;
  PKCurrencyAmount *v18;
  NSSet *products;
  NSSet *v20;
  PKPayLaterAccountTermsDetails *termsDetails;
  PKPayLaterAccountTermsDetails *v22;
  PKPayLaterAccountUserInfo *userInfo;
  PKPayLaterAccountUserInfo *v24;
  void *v25;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  _BOOL4 v29;
  NSURL *associatedPassURL;
  NSURL *v31;
  void *v32;
  NSString *v33;
  _BOOL4 v34;
  void *v35;
  NSString *v36;
  _BOOL4 v37;
  BOOL v38;
  NSArray *availableLanguages;
  NSArray *v41;
  unint64_t v42;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_75;
  lastUpdatedDate = self->_lastUpdatedDate;
  v6 = (NSDate *)v4[2];
  if (lastUpdatedDate && v6)
  {
    if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0)
      goto LABEL_75;
  }
  else if (lastUpdatedDate != v6)
  {
    goto LABEL_75;
  }
  createdDate = self->_createdDate;
  v8 = (NSDate *)v4[3];
  if (createdDate && v8)
  {
    if ((-[NSDate isEqual:](createdDate, "isEqual:") & 1) == 0)
      goto LABEL_75;
  }
  else if (createdDate != v8)
  {
    goto LABEL_75;
  }
  currentBalance = self->_currentBalance;
  v10 = (PKCurrencyAmount *)v4[10];
  if (currentBalance && v10)
  {
    if (!-[PKCurrencyAmount isEqual:](currentBalance, "isEqual:"))
      goto LABEL_75;
  }
  else if (currentBalance != v10)
  {
    goto LABEL_75;
  }
  amountPaid = self->_amountPaid;
  v12 = (PKCurrencyAmount *)v4[11];
  if (amountPaid && v12)
  {
    if (!-[PKCurrencyAmount isEqual:](amountPaid, "isEqual:"))
      goto LABEL_75;
  }
  else if (amountPaid != v12)
  {
    goto LABEL_75;
  }
  totalFinanced = self->_totalFinanced;
  v14 = (PKCurrencyAmount *)v4[12];
  if (totalFinanced && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](totalFinanced, "isEqual:"))
      goto LABEL_75;
  }
  else if (totalFinanced != v14)
  {
    goto LABEL_75;
  }
  nextDueDate = self->_nextDueDate;
  v16 = (NSDate *)v4[13];
  if (nextDueDate && v16)
  {
    if ((-[NSDate isEqual:](nextDueDate, "isEqual:") & 1) == 0)
      goto LABEL_75;
  }
  else if (nextDueDate != v16)
  {
    goto LABEL_75;
  }
  nextDueAmount = self->_nextDueAmount;
  v18 = (PKCurrencyAmount *)v4[14];
  if (nextDueAmount && v18)
  {
    if (!-[PKCurrencyAmount isEqual:](nextDueAmount, "isEqual:"))
      goto LABEL_75;
  }
  else if (nextDueAmount != v18)
  {
    goto LABEL_75;
  }
  products = self->_products;
  v20 = (NSSet *)v4[17];
  if (products && v20)
  {
    if ((-[NSSet isEqual:](products, "isEqual:") & 1) == 0)
      goto LABEL_75;
  }
  else if (products != v20)
  {
    goto LABEL_75;
  }
  termsDetails = self->_termsDetails;
  v22 = (PKPayLaterAccountTermsDetails *)v4[18];
  if (termsDetails && v22)
  {
    if (!-[PKPayLaterAccountTermsDetails isEqual:](termsDetails, "isEqual:"))
      goto LABEL_75;
  }
  else if (termsDetails != v22)
  {
    goto LABEL_75;
  }
  userInfo = self->_userInfo;
  v24 = (PKPayLaterAccountUserInfo *)v4[19];
  if (userInfo && v24)
  {
    if (!-[PKPayLaterAccountUserInfo isEqual:](userInfo, "isEqual:"))
      goto LABEL_75;
  }
  else if (userInfo != v24)
  {
    goto LABEL_75;
  }
  v25 = (void *)v4[15];
  v26 = self->_countryCode;
  v27 = v25;
  if (v26 == v27)
  {

  }
  else
  {
    v28 = v27;
    if (!v26 || !v27)
      goto LABEL_74;
    v29 = -[NSString isEqualToString:](v26, "isEqualToString:", v27);

    if (!v29)
      goto LABEL_75;
  }
  associatedPassURL = self->_associatedPassURL;
  v31 = (NSURL *)v4[4];
  if (associatedPassURL && v31)
  {
    if ((-[NSURL isEqual:](associatedPassURL, "isEqual:") & 1) == 0)
      goto LABEL_75;
  }
  else if (associatedPassURL != v31)
  {
    goto LABEL_75;
  }
  v32 = (void *)v4[6];
  v26 = self->_associatedPassSerialNumber;
  v33 = v32;
  if (v26 == v33)
  {

  }
  else
  {
    v28 = v33;
    if (!v26 || !v33)
      goto LABEL_74;
    v34 = -[NSString isEqualToString:](v26, "isEqualToString:", v33);

    if (!v34)
      goto LABEL_75;
  }
  v35 = (void *)v4[5];
  v26 = self->_associatedPassTypeIdentifier;
  v36 = v35;
  if (v26 != v36)
  {
    v28 = v36;
    if (v26 && v36)
    {
      v37 = -[NSString isEqualToString:](v26, "isEqualToString:", v36);

      if (!v37)
        goto LABEL_75;
      goto LABEL_78;
    }
LABEL_74:

    goto LABEL_75;
  }

LABEL_78:
  availableLanguages = self->_availableLanguages;
  v41 = (NSArray *)v4[16];
  if (availableLanguages && v41)
  {
    if ((-[NSArray isEqual:](availableLanguages, "isEqual:") & 1) == 0)
      goto LABEL_75;
  }
  else if (availableLanguages != v41)
  {
    goto LABEL_75;
  }
  if (self->_cardNetwork == v4[7])
  {
    v42 = -[PKPayLaterAccountDetails paymentType](self, "paymentType");
    if (v42 == objc_msgSend(v4, "paymentType") && self->_financingPlanFetchLimit == v4[9])
    {
      v38 = self->_requiresGenericMessaging == *((unsigned __int8 *)v4 + 8);
      goto LABEL_76;
    }
  }
LABEL_75:
  v38 = 0;
LABEL_76:

  return v38;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdatedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_createdDate);
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_amountPaid);
  objc_msgSend(v3, "safelyAddObject:", self->_totalFinanced);
  objc_msgSend(v3, "safelyAddObject:", self->_nextDueDate);
  objc_msgSend(v3, "safelyAddObject:", self->_nextDueAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_countryCode);
  objc_msgSend(v3, "safelyAddObject:", self->_products);
  objc_msgSend(v3, "safelyAddObject:", self->_termsDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_userInfo);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedPassURL);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedPassSerialNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedPassTypeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_availableLanguages);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_cardNetwork - v4 + 32 * v4;
  v6 = -[PKPayLaterAccountDetails paymentType](self, "paymentType");
  v7 = self->_financingPlanFetchLimit - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  v8 = self->_requiresGenericMessaging - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate description](self->_lastUpdatedDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdateDate: '%@'; "), v4);

  -[NSDate description](self->_createdDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("createdDate: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), self->_currentBalance);
  objc_msgSend(v3, "appendFormat:", CFSTR("amountPaid: '%@'; "), self->_amountPaid);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalFinanced: '%@'; "), self->_totalFinanced);
  -[NSDate description](self->_nextDueDate, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("nextDueDate: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("nextDueAmount: '%@'; "), self->_nextDueAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("countryCode: '%@'; "), self->_countryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("products: '%@'; "), self->_products);
  objc_msgSend(v3, "appendFormat:", CFSTR("termsDetails: '%@'; "), self->_termsDetails);
  objc_msgSend(v3, "appendFormat:", CFSTR("userInfo: '%@'; "), self->_userInfo);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedPassURL: '%@'; "), self->_associatedPassURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedPassSerialNumber: '%@'; "), self->_associatedPassSerialNumber);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedPassTypeIdentifier: '%@'; "), self->_associatedPassTypeIdentifier);
  PKPaymentNetworkNameForPaymentCredentialType(self->_cardNetwork);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("cardNetwork: '%@'; "), v7);

  PKPaymentMethodTypeToString(self->_paymentType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentType: '%@'; "), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR("financingPlanFetchLimit: %ld; "), self->_financingPlanFetchLimit);
  objc_msgSend(v3, "appendFormat:", CFSTR("availableLanguages: '%@'; "), self->_availableLanguages);
  if (self->_requiresGenericMessaging)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requiresGenericMessaging: '%@'; "), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  PKCurrencyAmount *v10;
  PKCurrencyAmount *currentBalance;
  PKCurrencyAmount *v12;
  PKCurrencyAmount *amountPaid;
  PKCurrencyAmount *v14;
  PKCurrencyAmount *totalFinanced;
  uint64_t v16;
  NSDate *nextDueDate;
  PKCurrencyAmount *v18;
  PKCurrencyAmount *nextDueAmount;
  uint64_t v20;
  NSString *countryCode;
  uint64_t v22;
  NSSet *products;
  PKPayLaterAccountTermsDetails *v24;
  PKPayLaterAccountTermsDetails *termsDetails;
  PKPayLaterAccountUserInfo *v26;
  PKPayLaterAccountUserInfo *userInfo;
  uint64_t v28;
  NSURL *associatedPassURL;
  uint64_t v30;
  NSString *associatedPassSerialNumber;
  uint64_t v32;
  NSString *associatedPassTypeIdentifier;
  uint64_t v34;
  NSArray *availableLanguages;

  v5 = -[PKPayLaterAccountDetails init](+[PKPayLaterAccountDetails allocWithZone:](PKPayLaterAccountDetails, "allocWithZone:"), "init");
  v6 = -[NSDate copyWithZone:](self->_lastUpdatedDate, "copyWithZone:", a3);
  lastUpdatedDate = v5->_lastUpdatedDate;
  v5->_lastUpdatedDate = (NSDate *)v6;

  v8 = -[NSDate copyWithZone:](self->_createdDate, "copyWithZone:", a3);
  createdDate = v5->_createdDate;
  v5->_createdDate = (NSDate *)v8;

  v10 = -[PKCurrencyAmount copyWithZone:](self->_currentBalance, "copyWithZone:", a3);
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = v10;

  v12 = -[PKCurrencyAmount copyWithZone:](self->_amountPaid, "copyWithZone:", a3);
  amountPaid = v5->_amountPaid;
  v5->_amountPaid = v12;

  v14 = -[PKCurrencyAmount copyWithZone:](self->_totalFinanced, "copyWithZone:", a3);
  totalFinanced = v5->_totalFinanced;
  v5->_totalFinanced = v14;

  v16 = -[NSDate copyWithZone:](self->_nextDueDate, "copyWithZone:", a3);
  nextDueDate = v5->_nextDueDate;
  v5->_nextDueDate = (NSDate *)v16;

  v18 = -[PKCurrencyAmount copyWithZone:](self->_nextDueAmount, "copyWithZone:", a3);
  nextDueAmount = v5->_nextDueAmount;
  v5->_nextDueAmount = v18;

  v20 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  countryCode = v5->_countryCode;
  v5->_countryCode = (NSString *)v20;

  v22 = -[NSSet copyWithZone:](self->_products, "copyWithZone:", a3);
  products = v5->_products;
  v5->_products = (NSSet *)v22;

  v24 = -[PKPayLaterAccountTermsDetails copyWithZone:](self->_termsDetails, "copyWithZone:", a3);
  termsDetails = v5->_termsDetails;
  v5->_termsDetails = v24;

  v26 = -[PKPayLaterAccountUserInfo copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  userInfo = v5->_userInfo;
  v5->_userInfo = v26;

  v28 = -[NSURL copyWithZone:](self->_associatedPassURL, "copyWithZone:", a3);
  associatedPassURL = v5->_associatedPassURL;
  v5->_associatedPassURL = (NSURL *)v28;

  v30 = -[NSString copyWithZone:](self->_associatedPassSerialNumber, "copyWithZone:", a3);
  associatedPassSerialNumber = v5->_associatedPassSerialNumber;
  v5->_associatedPassSerialNumber = (NSString *)v30;

  v32 = -[NSString copyWithZone:](self->_associatedPassTypeIdentifier, "copyWithZone:", a3);
  associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
  v5->_associatedPassTypeIdentifier = (NSString *)v32;

  v34 = -[NSArray copyWithZone:](self->_availableLanguages, "copyWithZone:", a3);
  availableLanguages = v5->_availableLanguages;
  v5->_availableLanguages = (NSArray *)v34;

  v5->_cardNetwork = self->_cardNetwork;
  v5->_paymentType = self->_paymentType;
  v5->_financingPlanFetchLimit = self->_financingPlanFetchLimit;
  v5->_requiresGenericMessaging = self->_requiresGenericMessaging;
  return v5;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)associatedPassURL
{
  return self->_associatedPassURL;
}

- (void)setAssociatedPassURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)associatedPassTypeIdentifier
{
  return self->_associatedPassTypeIdentifier;
}

- (void)setAssociatedPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)associatedPassSerialNumber
{
  return self->_associatedPassSerialNumber;
}

- (void)setAssociatedPassSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)cardNetwork
{
  return self->_cardNetwork;
}

- (void)setCardNetwork:(int64_t)a3
{
  self->_cardNetwork = a3;
}

- (void)setPaymentType:(unint64_t)a3
{
  self->_paymentType = a3;
}

- (int64_t)financingPlanFetchLimit
{
  return self->_financingPlanFetchLimit;
}

- (void)setFinancingPlanFetchLimit:(int64_t)a3
{
  self->_financingPlanFetchLimit = a3;
}

- (PKCurrencyAmount)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PKCurrencyAmount)amountPaid
{
  return self->_amountPaid;
}

- (void)setAmountPaid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PKCurrencyAmount)totalFinanced
{
  return self->_totalFinanced;
}

- (void)setTotalFinanced:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)nextDueDate
{
  return self->_nextDueDate;
}

- (void)setNextDueDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (PKCurrencyAmount)nextDueAmount
{
  return self->_nextDueAmount;
}

- (void)setNextDueAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)availableLanguages
{
  return self->_availableLanguages;
}

- (void)setAvailableLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)requiresGenericMessaging
{
  return self->_requiresGenericMessaging;
}

- (void)setRequiresGenericMessaging:(BOOL)a3
{
  self->_requiresGenericMessaging = a3;
}

- (NSSet)products
{
  return self->_products;
}

- (void)setProducts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (PKPayLaterAccountTermsDetails)termsDetails
{
  return self->_termsDetails;
}

- (void)setTermsDetails:(id)a3
{
  objc_storeStrong((id *)&self->_termsDetails, a3);
}

- (PKPayLaterAccountUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_termsDetails, 0);
  objc_storeStrong((id *)&self->_products, 0);
  objc_storeStrong((id *)&self->_availableLanguages, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_nextDueAmount, 0);
  objc_storeStrong((id *)&self->_nextDueDate, 0);
  objc_storeStrong((id *)&self->_totalFinanced, 0);
  objc_storeStrong((id *)&self->_amountPaid, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_associatedPassSerialNumber, 0);
  objc_storeStrong((id *)&self->_associatedPassTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedPassURL, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
}

@end

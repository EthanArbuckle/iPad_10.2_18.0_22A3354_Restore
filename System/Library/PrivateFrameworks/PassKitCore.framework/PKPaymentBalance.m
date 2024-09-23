@implementation PKPaymentBalance

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentBalance *v5;
  uint64_t v6;
  NSDecimalNumber *value;
  uint64_t v8;
  NSString *currencyCode;
  uint64_t v10;
  NSString *localizedTitle;
  uint64_t v12;
  NSString *localizedDescription;
  uint64_t v14;
  NSDate *lastUpdateDate;
  uint64_t v16;
  NSDate *expirationDate;
  uint64_t v18;
  NSString *preformattedString;
  uint64_t v20;
  NSArray *componentBalances;
  uint64_t v22;
  NSSet *identifiers;

  v5 = -[PKPaymentBalance init](+[PKPaymentBalance allocWithZone:](PKPaymentBalance, "allocWithZone:"), "init");
  v6 = -[NSDecimalNumber copyWithZone:](self->_value, "copyWithZone:", a3);
  value = v5->_value;
  v5->_value = (NSDecimalNumber *)v6;

  v8 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v8;

  v5->_exponent = self->_exponent;
  v10 = -[NSString copyWithZone:](self->_localizedTitle, "copyWithZone:", a3);
  localizedTitle = v5->_localizedTitle;
  v5->_localizedTitle = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3);
  localizedDescription = v5->_localizedDescription;
  v5->_localizedDescription = (NSString *)v12;

  v5->_isPrimary = self->_isPrimary;
  v14 = -[NSDate copyWithZone:](self->_lastUpdateDate, "copyWithZone:", a3);
  lastUpdateDate = v5->_lastUpdateDate;
  v5->_lastUpdateDate = (NSDate *)v14;

  v16 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  expirationDate = v5->_expirationDate;
  v5->_expirationDate = (NSDate *)v16;

  v18 = -[NSString copyWithZone:](self->_preformattedString, "copyWithZone:", a3);
  preformattedString = v5->_preformattedString;
  v5->_preformattedString = (NSString *)v18;

  v20 = -[NSArray copyWithZone:](self->_componentBalances, "copyWithZone:", a3);
  componentBalances = v5->_componentBalances;
  v5->_componentBalances = (NSArray *)v20;

  v22 = -[NSSet copyWithZone:](self->_identifiers, "copyWithZone:", a3);
  identifiers = v5->_identifiers;
  v5->_identifiers = (NSSet *)v22;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_exponent, CFSTR("exponent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPrimary, CFSTR("isPrimaryBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdateDate, CFSTR("lastUpdatedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preformattedString, CFSTR("preformattedString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_componentBalances, CFSTR("componentBalances"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifiers, CFSTR("identifiers"));

}

- (PKPaymentBalance)initWithCoder:(id)a3
{
  id v4;
  PKPaymentBalance *v5;
  uint64_t v6;
  NSString *currencyCode;
  uint64_t v8;
  NSDecimalNumber *value;
  uint64_t v10;
  NSString *localizedTitle;
  uint64_t v12;
  NSString *localizedDescription;
  uint64_t v14;
  NSDate *lastUpdateDate;
  uint64_t v16;
  NSDate *expirationDate;
  uint64_t v18;
  NSString *preformattedString;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *componentBalances;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSSet *identifiers;
  void *v30;
  uint64_t v31;
  NSSet *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKPaymentBalance;
  v5 = -[PKPaymentBalance init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v6 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSDecimalNumber *)v8;

    v5->_exponent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("exponent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v12;

    v5->_isPrimary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrimaryBalance"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastUpdateDate = v5->_lastUpdateDate;
    v5->_lastUpdateDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preformattedString"));
    v18 = objc_claimAutoreleasedReturnValue();
    preformattedString = v5->_preformattedString;
    v5->_preformattedString = (NSString *)v18;

    v20 = objc_alloc(MEMORY[0x1E0C99E60]);
    v21 = objc_opt_class();
    v22 = (void *)objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("componentBalances"));
    v23 = objc_claimAutoreleasedReturnValue();
    componentBalances = v5->_componentBalances;
    v5->_componentBalances = (NSArray *)v23;

    v25 = objc_alloc(MEMORY[0x1E0C99E60]);
    v26 = objc_opt_class();
    v27 = (void *)objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("identifiers"));
    v28 = objc_claimAutoreleasedReturnValue();
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSSet *)v28;

    if (!v5->_identifiers)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v30, 0);
        v32 = v5->_identifiers;
        v5->_identifiers = (NSSet *)v31;

      }
    }
  }

  return v5;
}

- (PKPaymentBalance)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentBalance *v5;
  void *v6;
  uint64_t v7;
  void *identifiers;
  uint64_t v9;
  NSSet *v10;
  uint64_t v11;
  NSString *currencyCode;
  void *v13;
  uint64_t v14;
  NSString *localizedTitle;
  uint64_t v16;
  NSString *localizedDescription;
  uint64_t v18;
  NSDate *lastUpdateDate;
  uint64_t v20;
  NSDate *expirationDate;
  uint64_t v22;
  NSString *preformattedString;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentBalance;
  v5 = -[PKPaymentBalance init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("identifiers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
      identifiers = v5->_identifiers;
      v5->_identifiers = (NSSet *)v7;
    }
    else
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
      identifiers = (void *)objc_claimAutoreleasedReturnValue();
      if (identifiers)
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", identifiers, 0);
        v10 = v5->_identifiers;
        v5->_identifiers = (NSSet *)v9;

      }
    }

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v11 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v11;

    v5->_exponent = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("exponent"));
    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentBalance _setValueWithRounding:](v5, "_setValueWithRounding:", v13);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDescription"));
    v16 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v16;

    v5->_isPrimary = objc_msgSend(v4, "PKBoolForKey:", CFSTR("isPrimaryBalance"));
    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdatedDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    lastUpdateDate = v5->_lastUpdateDate;
    v5->_lastUpdateDate = (NSDate *)v18;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("expirationDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v20;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("preformattedString"));
    v22 = objc_claimAutoreleasedReturnValue();
    preformattedString = v5->_preformattedString;
    v5->_preformattedString = (NSString *)v22;

  }
  return v5;
}

- (PKPaymentBalance)initWithIdentifier:(id)a3 forCurrencyAmount:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  PKPaymentBalance *v9;

  v6 = a4;
  if (a3)
  {
    v7 = (objc_class *)MEMORY[0x1E0C99E60];
    v8 = a3;
    a3 = (id)objc_msgSend([v7 alloc], "initWithObjects:", v8, 0);

  }
  v9 = -[PKPaymentBalance initWithIdentifiers:forCurrencyAmount:](self, "initWithIdentifiers:forCurrencyAmount:", a3, v6);

  return v9;
}

- (PKPaymentBalance)initWithIdentifiers:(id)a3 forCurrencyAmount:(id)a4
{
  id v6;
  id v7;
  PKPaymentBalance *v8;
  uint64_t v9;
  NSSet *identifiers;
  uint64_t v11;
  NSString *currencyCode;
  uint64_t v13;
  NSString *preformattedString;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentBalance;
  v8 = -[PKPaymentBalance init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifiers = v8->_identifiers;
    v8->_identifiers = (NSSet *)v9;

    objc_msgSend(v7, "currency");
    v11 = objc_claimAutoreleasedReturnValue();
    currencyCode = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v11;

    v8->_exponent = objc_msgSend(v7, "exponent");
    objc_msgSend(v7, "preformattedString");
    v13 = objc_claimAutoreleasedReturnValue();
    preformattedString = v8->_preformattedString;
    v8->_preformattedString = (NSString *)v13;

    objc_msgSend(v7, "amount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentBalance _setValueWithRounding:](v8, "_setValueWithRounding:", v15);

  }
  return v8;
}

- (PKPaymentBalance)initWithIdentifier:(id)a3 forValue:(id)a4 roundingToExponent:(int64_t)a5
{
  id v8;
  objc_class *v9;
  id v10;
  PKPaymentBalance *v11;

  v8 = a4;
  if (a3)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99E60];
    v10 = a3;
    a3 = (id)objc_msgSend([v9 alloc], "initWithObjects:", v10, 0);

  }
  v11 = -[PKPaymentBalance initWithIdentifiers:forValue:roundingToExponent:](self, "initWithIdentifiers:forValue:roundingToExponent:", a3, v8, a5);

  return v11;
}

- (PKPaymentBalance)initWithIdentifiers:(id)a3 forValue:(id)a4 roundingToExponent:(int64_t)a5
{
  id v8;
  id v9;
  PKPaymentBalance *v10;
  uint64_t v11;
  NSSet *identifiers;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentBalance;
  v10 = -[PKPaymentBalance init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifiers = v10->_identifiers;
    v10->_identifiers = (NSSet *)v11;

    v10->_exponent = a5;
    objc_storeStrong((id *)&v10->_currencyCode, CFSTR("XXX"));
    -[PKPaymentBalance _setValueWithRounding:](v10, "_setValueWithRounding:", v9);
  }

  return v10;
}

- (PKPaymentBalance)initWithComponentBalances:(id)a3
{
  return -[PKPaymentBalance initWithComponentBalances:identifiers:](self, "initWithComponentBalances:identifiers:", a3, 0);
}

- (PKPaymentBalance)initWithComponentBalances:(id)a3 identifiers:(id)a4
{
  return -[PKPaymentBalance initWithComponentBalances:identifiers:expiredBalances:](self, "initWithComponentBalances:identifiers:expiredBalances:", a3, a4, 0);
}

- (PKPaymentBalance)initWithComponentBalances:(id)a3 identifiers:(id)a4 expiredBalances:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  PKPaymentBalance *v33;
  PKPaymentBalance *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSString *localizedTitle;
  void *v39;
  uint64_t v40;
  NSString *localizedDescription;
  uint64_t v42;
  NSArray *componentBalances;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  PKPaymentBalance *v48;
  NSSet *identifiers;
  void *v51;
  id v52;
  id v53;
  id v54;
  PKPaymentBalance *v55;
  id obj;
  void *v57;
  uint64_t v58;
  objc_super v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") || objc_msgSend(v10, "count"))
  {
    v55 = self;
    v11 = objc_msgSend(v8, "count");
    if (v11)
      v12 = v8;
    else
      v12 = v10;
    v13 = v12;
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currencyCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v14, "exponent");
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = v13;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v61;
      v53 = v9;
      v54 = v8;
      v51 = v14;
      v52 = v10;
LABEL_8:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v61 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v20);
        objc_msgSend(v21, "currencyCode", v51, v52, v53, v54);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v15;
        v24 = v22;
        if (v23 == v24)
        {

        }
        else
        {
          v25 = v24;
          if (!v15 || !v24)
          {

LABEL_37:
            PKLogFacilityTypeGetObject(0);
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v21, "currencyCode");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v65 = (uint64_t)v23;
              v66 = 2112;
              v67 = (uint64_t)v47;
              _os_log_impl(&dword_18FC92000, v45, OS_LOG_TYPE_DEFAULT, "Cannot create a combined balance with multiple currency codes (%@, %@)", buf, 0x16u);

            }
LABEL_39:
            v9 = v53;
            v8 = v54;
            v14 = v51;
            v10 = v52;
            v32 = obj;
            v35 = v57;

            v48 = 0;
            goto LABEL_44;
          }
          v26 = objc_msgSend(v23, "isEqualToString:", v24);

          if ((v26 & 1) == 0)
            goto LABEL_37;
        }
        if (v58 != objc_msgSend(v21, "exponent"))
        {
          PKLogFacilityTypeGetObject(0);
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = objc_msgSend(v21, "exponent");
            *(_DWORD *)buf = 134218240;
            v65 = v58;
            v66 = 2048;
            v67 = v46;
            _os_log_impl(&dword_18FC92000, v45, OS_LOG_TYPE_DEFAULT, "Cannot create a combined balance with multiple exponents (%ld, %ld)", buf, 0x16u);
          }
          goto LABEL_39;
        }
        if (v11)
        {
          objc_msgSend(v21, "value");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(v57, "decimalNumberByAdding:", v27);
            v28 = objc_claimAutoreleasedReturnValue();

            v57 = (void *)v28;
          }

        }
        objc_msgSend(v21, "lastUpdateDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v18 || !v29)
        {
          if (objc_msgSend(v18, "compare:", v29) == -1)
          {
            v31 = v30;

            v18 = v31;
          }
        }
        else
        {
          v18 = v29;
        }

        if (v17 == ++v20)
        {
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
          v9 = v53;
          v8 = v54;
          v14 = v51;
          v10 = v52;
          if (v17)
            goto LABEL_8;
          goto LABEL_31;
        }
      }
    }
    v18 = 0;
LABEL_31:
    v32 = obj;

    v59.receiver = v55;
    v59.super_class = (Class)PKPaymentBalance;
    v33 = -[PKPaymentBalance init](&v59, sel_init);
    v34 = v33;
    v35 = v57;
    if (v33)
    {
      objc_storeStrong((id *)&v33->_currencyCode, v15);
      objc_storeStrong((id *)&v34->_value, v57);
      v34->_exponent = v58;
      objc_msgSend(obj, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedTitle");
      v37 = objc_claimAutoreleasedReturnValue();
      localizedTitle = v34->_localizedTitle;
      v34->_localizedTitle = (NSString *)v37;

      objc_msgSend(obj, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedDescription");
      v40 = objc_claimAutoreleasedReturnValue();
      localizedDescription = v34->_localizedDescription;
      v34->_localizedDescription = (NSString *)v40;

      objc_storeStrong((id *)&v34->_lastUpdateDate, v18);
      v42 = objc_msgSend(v8, "copy");
      componentBalances = v34->_componentBalances;
      v34->_componentBalances = (NSArray *)v42;

      if (v9)
      {
        v44 = objc_msgSend(v9, "copy");
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "identifiersFromComponentBalances:", v34->_componentBalances);
        v44 = objc_claimAutoreleasedReturnValue();
      }
      identifiers = v34->_identifiers;
      v34->_identifiers = (NSSet *)v44;

    }
    v48 = v34;
    v55 = v48;
LABEL_44:

    self = v55;
  }
  else
  {
    v48 = 0;
  }

  return v48;
}

- (NSSet)identifiers
{
  NSSet *identifiers;

  identifiers = self->_identifiers;
  if (identifiers)
    return identifiers;
  else
    return (NSSet *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ApplicationStoredValueBalanceDefault"), 0);
}

- (BOOL)isExpired
{
  void *v3;
  BOOL v4;

  if (!self->_expirationDate)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", self->_expirationDate) == 1;

  return v4;
}

- (void)_setValueWithRounding:(id)a3
{
  NSDecimalNumber *v4;
  void *value;
  NSDecimalNumber *v6;
  NSDecimalNumber *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    if (-[PKPaymentBalance isCurrency](self, "isCurrency"))
    {
      PKCurrencyDecimalAmountRound(v8);
      v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      value = self->_value;
      self->_value = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35A0], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, SLOWORD(self->_exponent), 0, 0, 0, 0);
      value = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "decimalNumberByRoundingAccordingToBehavior:", value);
      v6 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      v7 = self->_value;
      self->_value = v6;

    }
  }
  else
  {
    value = self->_value;
    self->_value = 0;
  }

}

- (BOOL)isCurrency
{
  NSString *currencyCode;

  currencyCode = self->_currencyCode;
  if (currencyCode)
    LOBYTE(currencyCode) = !-[NSString isEqualToString:](currencyCode, "isEqualToString:", CFSTR("XXX"));
  return (char)currencyCode;
}

- (PKCurrencyAmount)currencyValue
{
  void *v3;
  PKCurrencyAmount *v4;

  -[PKPaymentBalance preformattedString](self, "preformattedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[PKCurrencyAmount initWithAmount:exponent:preformattedString:]([PKCurrencyAmount alloc], "initWithAmount:exponent:preformattedString:", self->_value, self->_exponent, self->_preformattedString);
  }
  else if (-[PKPaymentBalance isCurrency](self, "isCurrency"))
  {
    PKCurrencyAmountCreate(self->_value, self->_currencyCode, self->_exponent);
    v4 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)formattedValue
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPaymentBalance currencyValue](self, "currencyValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "formattedStringValue");
  else
    PKFormattedStringMinimalFractionDigitsFromNumber(self->_value, self->_exponent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSSet allObjects](self->_identifiers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isPrimary)
    v6 = " (Primary)";
  else
    v6 = "";
  -[PKPaymentBalance formattedValue](self, "formattedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@}%s: %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  const __CFString *currencyCode;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_value);
  if (self->_currencyCode)
    currencyCode = (const __CFString *)self->_currencyCode;
  else
    currencyCode = CFSTR("XXX");
  objc_msgSend(v3, "safelyAddObject:", currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedTitle);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdateDate);
  objc_msgSend(v3, "safelyAddObject:", self->_componentBalances);
  objc_msgSend(v3, "safelyAddObject:", self->_identifiers);
  v5 = PKCombinedHash(17, v3);
  v6 = self->_exponent - v5 + 32 * v5;
  v7 = self->_isPrimary - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSDecimalNumber *value;
  uint64_t v6;
  void *v7;
  BOOL v8;
  char v9;
  char v10;
  __CFString *currencyCode;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  int64_t exponent;
  NSString *localizedTitle;
  uint64_t v17;
  void *v18;
  NSString *localizedDescription;
  uint64_t v20;
  void *v21;
  int isPrimary;
  NSDate *lastUpdateDate;
  uint64_t v24;
  void *v25;
  NSArray *componentBalances;
  uint64_t v27;
  void *v28;
  NSSet *identifiers;
  uint64_t v30;
  void *v31;

  v4 = a3;
  value = self->_value;
  objc_msgSend(v4, "value");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (value)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (value == (NSDecimalNumber *)v6)
    {
LABEL_9:
      if (self->_currencyCode)
        currencyCode = (__CFString *)self->_currencyCode;
      else
        currencyCode = CFSTR("XXX");
      objc_msgSend(v4, "currencyCode");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (const __CFString *)v12;
      else
        v14 = CFSTR("XXX");
      if (!-[__CFString isEqualToString:](currencyCode, "isEqualToString:", v14)
        || (exponent = self->_exponent, exponent != objc_msgSend(v4, "exponent")))
      {
        v9 = 0;
LABEL_49:

        goto LABEL_50;
      }
      localizedTitle = self->_localizedTitle;
      objc_msgSend(v4, "localizedTitle");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (localizedTitle && v17)
      {
        if ((-[NSString isEqual:](localizedTitle, "isEqual:", v17) & 1) != 0)
        {
LABEL_20:
          localizedDescription = self->_localizedDescription;
          objc_msgSend(v4, "localizedDescription");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          if (localizedDescription && v20)
          {
            if ((-[NSString isEqual:](localizedDescription, "isEqual:", v20) & 1) == 0)
              goto LABEL_38;
          }
          else if (localizedDescription != (NSString *)v20)
          {
            goto LABEL_38;
          }
          isPrimary = self->_isPrimary;
          if (isPrimary == objc_msgSend(v4, "isPrimary"))
          {
            lastUpdateDate = self->_lastUpdateDate;
            objc_msgSend(v4, "lastUpdateDate");
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = (void *)v24;
            if (lastUpdateDate && v24)
            {
              if ((-[NSDate isEqual:](lastUpdateDate, "isEqual:", v24) & 1) != 0)
              {
LABEL_32:
                componentBalances = self->_componentBalances;
                objc_msgSend(v4, "componentBalances");
                v27 = objc_claimAutoreleasedReturnValue();
                v28 = (void *)v27;
                if (componentBalances && v27)
                {
                  if ((-[NSArray isEqual:](componentBalances, "isEqual:", v27) & 1) != 0)
                    goto LABEL_35;
                }
                else if (componentBalances == (NSArray *)v27)
                {
LABEL_35:
                  identifiers = self->_identifiers;
                  objc_msgSend(v4, "identifiers");
                  v30 = objc_claimAutoreleasedReturnValue();
                  v31 = (void *)v30;
                  if (identifiers && v30)
                    v9 = -[NSSet isEqual:](identifiers, "isEqual:", v30);
                  else
                    v9 = identifiers == (NSSet *)v30;

                  goto LABEL_45;
                }
                v9 = 0;
LABEL_45:

                goto LABEL_46;
              }
            }
            else if (lastUpdateDate == (NSDate *)v24)
            {
              goto LABEL_32;
            }
            v9 = 0;
LABEL_46:

            goto LABEL_47;
          }
LABEL_38:
          v9 = 0;
LABEL_47:

          goto LABEL_48;
        }
      }
      else if (localizedTitle == (NSString *)v17)
      {
        goto LABEL_20;
      }
      v9 = 0;
LABEL_48:

      goto LABEL_49;
    }
  }
  else
  {
    v10 = -[NSDecimalNumber isEqual:](value, "isEqual:", v6);
    if ((v10 & 1) != 0)
      goto LABEL_9;
  }
  v9 = 0;
LABEL_50:

  return v9;
}

+ (id)identifiersFromComponentBalances:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "identifiers", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (BOOL)isComposed
{
  return self->_componentBalances != 0;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDecimalNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)exponent
{
  return self->_exponent;
}

- (void)setExponent:(int64_t)a3
{
  self->_exponent = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)preformattedString
{
  return self->_preformattedString;
}

- (void)setPreformattedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setIsExpired:(BOOL)a3
{
  self->_isExpired = a3;
}

- (NSArray)componentBalances
{
  return self->_componentBalances;
}

- (void)setComponentBalances:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentBalances, 0);
  objc_storeStrong((id *)&self->_preformattedString, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end

@implementation PKAppleBalanceDirectTopUpConfiguration

- (PKAppleBalanceDirectTopUpConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKAppleBalanceDirectTopUpConfiguration *v5;
  uint64_t v6;
  NSDecimalNumber *minAmount;
  uint64_t v8;
  NSDecimalNumber *maxAmount;
  uint64_t v10;
  NSDecimalNumber *maxBalance;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PKAppleBalanceDirectTopUpConfigurationDenomination *v18;
  uint64_t v19;
  NSURL *termsURL;
  PKAppleBalanceDirectTopUpConfiguration *v21;
  NSObject *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[8];
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKAppleBalanceDirectTopUpConfiguration;
  v5 = -[PKAppleBalanceDirectTopUpConfiguration init](&v29, sel_init);
  if (!v5)
  {
LABEL_11:
    v21 = v5;
    goto LABEL_15;
  }
  if (v4)
  {
    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("minAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    minAmount = v5->_minAmount;
    v5->_minAmount = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("maxAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    maxAmount = v5->_maxAmount;
    v5->_maxAmount = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("maxBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    maxBalance = v5->_maxBalance;
    v5->_maxBalance = (NSDecimalNumber *)v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("denominations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          v18 = -[PKAppleBalanceDirectTopUpConfigurationDenomination initWithDictionary:]([PKAppleBalanceDirectTopUpConfigurationDenomination alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17));
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v15);
    }
    -[PKAppleBalanceDirectTopUpConfiguration setDenominations:](v5, "setDenominations:", v12);
    objc_msgSend(v4, "PKURLForKey:", CFSTR("termsURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v19;

    goto LABEL_11;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Error: dtu configuration dictionary missing", buf, 2u);
  }

  v21 = 0;
LABEL_15:

  return v21;
}

- (PKAppleBalanceDirectTopUpConfiguration)initWithAMSResponseDictionary:(id)a3
{
  id v4;
  PKAppleBalanceDirectTopUpConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSDecimalNumber *maxAmount;
  uint64_t v9;
  NSDecimalNumber *minAmount;
  uint64_t v11;
  NSDecimalNumber *maxBalance;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  PKAppleBalanceDirectTopUpConfigurationDenomination *v22;
  void *v23;
  PKAppleBalanceDirectTopUpConfigurationDenomination *v24;
  void *v25;
  uint64_t v26;
  NSURL *termsURL;
  PKAppleBalanceDirectTopUpConfiguration *v28;
  NSObject *v29;
  void *v31;
  PKAppleBalanceDirectTopUpConfiguration *v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[16];
  objc_super v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PKAppleBalanceDirectTopUpConfiguration;
  v5 = -[PKAppleBalanceDirectTopUpConfiguration init](&v40, sel_init);
  if (!v5)
  {
LABEL_11:
    v28 = v5;
    goto LABEL_15;
  }
  if (v4)
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("amount-limit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKDecimalNumberForKey:", CFSTR("max"));
    v7 = objc_claimAutoreleasedReturnValue();
    maxAmount = v5->_maxAmount;
    v5->_maxAmount = (NSDecimalNumber *)v7;

    objc_msgSend(v6, "PKDecimalNumberForKey:", CFSTR("min"));
    v9 = objc_claimAutoreleasedReturnValue();
    minAmount = v5->_minAmount;
    v5->_minAmount = (NSDecimalNumber *)v9;

    v31 = v6;
    objc_msgSend(v6, "PKDecimalNumberForKey:", CFSTR("max-balance"));
    v11 = objc_claimAutoreleasedReturnValue();
    maxBalance = v5->_maxBalance;
    v32 = v5;
    v5->_maxBalance = (NSDecimalNumber *)v11;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currency-code-iso3a"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = v4;
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("amounts"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v36;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v18), "PKDecimalNumberForKey:", CFSTR("amount"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithInt:", 1000);
          objc_msgSend(v19, "decimalNumberByDividingBy:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = [PKAppleBalanceDirectTopUpConfigurationDenomination alloc];
          v41[0] = CFSTR("amount");
          v41[1] = CFSTR("currencyCode");
          v42[0] = v21;
          v42[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[PKAppleBalanceDirectTopUpConfigurationDenomination initWithDictionary:](v22, "initWithDictionary:", v23);

          objc_msgSend(v14, "addObject:", v24);
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v16);
    }
    v5 = v32;
    -[PKAppleBalanceDirectTopUpConfiguration setDenominations:](v32, "setDenominations:", v14);
    v4 = v33;
    objc_msgSend(v33, "PKStringForKey:", CFSTR("link-terms-conditions"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    termsURL = v32->_termsURL;
    v32->_termsURL = (NSURL *)v26;

    goto LABEL_11;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Error: ams response dictionary missing", buf, 2u);
  }

  v28 = 0;
LABEL_15:

  return v28;
}

- (void)setDenominations:(id)a3
{
  NSArray *v4;
  NSArray *denominations;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_124);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  denominations = self->_denominations;
  self->_denominations = v4;

}

BOOL __59__PKAppleBalanceDirectTopUpConfiguration_setDenominations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v4 = a3;
  objc_msgSend(a2, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6) == 1;
  return v7;
}

- (id)displayableDenominations
{
  void *v3;
  NSArray *denominations;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  PKNumericSuggestion *v15;
  void *v16;
  void *v17;
  PKNumericSuggestion *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSArray copy](self->_denominations, "copy");
  if ((unint64_t)objc_msgSend(v3, "count") >= 4)
  {
    denominations = self->_denominations;
    -[NSArray count](denominations, "count");
    v5 = -[NSArray count](self->_denominations, "count") - 3;
    if (-[NSArray count](self->_denominations, "count") <= 3)
      v6 = -[NSArray count](self->_denominations, "count");
    else
      v6 = 3;
    -[NSArray subarrayWithRange:](denominations, "subarrayWithRange:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = [PKNumericSuggestion alloc];
        objc_msgSend(v14, "amount", (_QWORD)v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "currencyCode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[PKNumericSuggestion initWithValue:currencyCode:](v15, "initWithValue:currencyCode:", v16, v17);

        objc_msgSend(v8, "addObject:", v18);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v19 = (void *)objc_msgSend(v8, "copy");
  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleBalanceDirectTopUpConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKAppleBalanceDirectTopUpConfiguration *v5;
  uint64_t v6;
  NSDecimalNumber *minAmount;
  uint64_t v8;
  NSDecimalNumber *maxAmount;
  uint64_t v10;
  NSDecimalNumber *maxBalance;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSURL *termsURL;

  v4 = a3;
  v5 = -[PKAppleBalanceDirectTopUpConfiguration init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    minAmount = v5->_minAmount;
    v5->_minAmount = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    maxAmount = v5->_maxAmount;
    v5->_maxAmount = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    maxBalance = v5->_maxBalance;
    v5->_maxBalance = (NSDecimalNumber *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("denominations"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAppleBalanceDirectTopUpConfiguration setDenominations:](v5, "setDenominations:", v15);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *minAmount;
  id v5;

  minAmount = self->_minAmount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", minAmount, CFSTR("minAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maxAmount, CFSTR("maxAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maxBalance, CFSTR("maxBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_denominations, CFSTR("denominations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsURL, CFSTR("termsURL"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *minAmount;
  NSDecimalNumber *v6;
  NSDecimalNumber *maxAmount;
  NSDecimalNumber *v8;
  NSDecimalNumber *maxBalance;
  NSDecimalNumber *v10;
  NSArray *denominations;
  NSArray *v12;
  NSURL *termsURL;
  NSURL *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_24;
  minAmount = self->_minAmount;
  v6 = (NSDecimalNumber *)v4[1];
  if (minAmount && v6)
  {
    if ((-[NSDecimalNumber isEqual:](minAmount, "isEqual:") & 1) == 0)
      goto LABEL_24;
  }
  else if (minAmount != v6)
  {
    goto LABEL_24;
  }
  maxAmount = self->_maxAmount;
  v8 = (NSDecimalNumber *)v4[2];
  if (maxAmount && v8)
  {
    if ((-[NSDecimalNumber isEqual:](maxAmount, "isEqual:") & 1) == 0)
      goto LABEL_24;
  }
  else if (maxAmount != v8)
  {
    goto LABEL_24;
  }
  maxBalance = self->_maxBalance;
  v10 = (NSDecimalNumber *)v4[3];
  if (maxBalance && v10)
  {
    if ((-[NSDecimalNumber isEqual:](maxBalance, "isEqual:") & 1) == 0)
      goto LABEL_24;
  }
  else if (maxBalance != v10)
  {
    goto LABEL_24;
  }
  denominations = self->_denominations;
  v12 = (NSArray *)v4[4];
  if (!denominations || !v12)
  {
    if (denominations == v12)
      goto LABEL_20;
LABEL_24:
    v15 = 0;
    goto LABEL_25;
  }
  if ((-[NSArray isEqual:](denominations, "isEqual:") & 1) == 0)
    goto LABEL_24;
LABEL_20:
  termsURL = self->_termsURL;
  v14 = (NSURL *)v4[5];
  if (termsURL && v14)
    v15 = -[NSURL isEqual:](termsURL, "isEqual:");
  else
    v15 = termsURL == v14;
LABEL_25:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v15 = -[NSDecimalNumber hash](self->_minAmount, "hash");
  v16 = -[NSDecimalNumber hash](self->_maxAmount, "hash");
  v17 = -[NSDecimalNumber hash](self->_maxBalance, "hash");
  v18 = -[NSURL hash](self->_termsURL, "hash");
  v19 = 0;
  v3 = SipHash();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_denominations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v20 = v3;
        v21 = 0;
        v21 = objc_msgSend(v9, "hash", (_QWORD)v11);
        v3 = SipHash();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber description](self->_minAmount, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("minAmount: '%@'; "), v4);

  -[NSDecimalNumber description](self->_maxAmount, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("maxAmount: '%@'; "), v5);

  -[NSDecimalNumber description](self->_maxBalance, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("maxBalance: '%@'; "), v6);

  -[NSArray description](self->_denominations, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("denominations: '%@'; "), v7);

  -[NSURL description](self->_termsURL, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("termsURL: '%@'; "), v8);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAppleBalanceDirectTopUpConfiguration *v5;
  uint64_t v6;
  NSDecimalNumber *minAmount;
  uint64_t v8;
  NSDecimalNumber *maxAmount;
  uint64_t v10;
  NSDecimalNumber *maxBalance;
  uint64_t v12;
  NSArray *denominations;
  uint64_t v14;
  NSURL *termsURL;

  v5 = -[PKAppleBalanceDirectTopUpConfiguration init](+[PKAppleBalanceDirectTopUpConfiguration allocWithZone:](PKAppleBalanceDirectTopUpConfiguration, "allocWithZone:"), "init");
  v6 = -[NSDecimalNumber copyWithZone:](self->_minAmount, "copyWithZone:", a3);
  minAmount = v5->_minAmount;
  v5->_minAmount = (NSDecimalNumber *)v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_maxAmount, "copyWithZone:", a3);
  maxAmount = v5->_maxAmount;
  v5->_maxAmount = (NSDecimalNumber *)v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_maxBalance, "copyWithZone:", a3);
  maxBalance = v5->_maxBalance;
  v5->_maxBalance = (NSDecimalNumber *)v10;

  v12 = -[NSArray copyWithZone:](self->_denominations, "copyWithZone:", a3);
  denominations = v5->_denominations;
  v5->_denominations = (NSArray *)v12;

  v14 = -[NSURL copyWithZone:](self->_termsURL, "copyWithZone:", a3);
  termsURL = v5->_termsURL;
  v5->_termsURL = (NSURL *)v14;

  return v5;
}

- (NSDecimalNumber)minAmount
{
  return self->_minAmount;
}

- (void)setMinAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDecimalNumber)maxAmount
{
  return self->_maxAmount;
}

- (void)setMaxAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDecimalNumber)maxBalance
{
  return self->_maxBalance;
}

- (void)setMaxBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)denominations
{
  return self->_denominations;
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_denominations, 0);
  objc_storeStrong((id *)&self->_maxBalance, 0);
  objc_storeStrong((id *)&self->_maxAmount, 0);
  objc_storeStrong((id *)&self->_minAmount, 0);
}

@end

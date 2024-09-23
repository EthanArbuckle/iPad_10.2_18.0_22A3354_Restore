@implementation PKEnteredValueActionItem

- (PKEnteredValueActionItem)init
{

  return 0;
}

- (PKEnteredValueActionItem)initWithDictionary:(id)a3
{
  id v4;
  PKEnteredValueActionItem *v5;
  void *v6;
  uint64_t v7;
  NSDecimalNumber *minLoadAmount;
  void *v9;
  uint64_t v10;
  NSDecimalNumber *maxLoadAmount;
  void *v12;
  uint64_t v13;
  NSDecimalNumber *minLoadedBalance;
  void *v15;
  uint64_t v16;
  NSDecimalNumber *maxLoadedBalance;
  void *v18;
  uint64_t v19;
  NSDecimalNumber *v20;
  void *v21;
  uint64_t v22;
  NSDecimalNumber *v23;
  void *v24;
  uint64_t v25;
  NSString *currency;
  void *v27;
  uint64_t v28;
  NSDictionary *serviceProviderData;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSArray *defaultSuggestions;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSArray *lowBalanceReminderOptions;
  PKEnteredValueActionItem *v53;
  void *v54;
  _QWORD v55[2];
  int v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[2];
  int v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)PKEnteredValueActionItem;
  v5 = -[PKEnteredValueActionItem init](&v67, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("minLoadAmount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    minLoadAmount = v5->_minLoadAmount;
    v5->_minLoadAmount = (NSDecimalNumber *)v7;

    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("maxLoadAmount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    maxLoadAmount = v5->_maxLoadAmount;
    v5->_maxLoadAmount = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("minLoadedBalance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    minLoadedBalance = v5->_minLoadedBalance;
    v5->_minLoadedBalance = (NSDecimalNumber *)v13;

    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("maxLoadedBalance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    maxLoadedBalance = v5->_maxLoadedBalance;
    v5->_maxLoadedBalance = (NSDecimalNumber *)v16;

    if (!v5->_minLoadAmount)
    {
      objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("minAmount"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      v20 = v5->_minLoadAmount;
      v5->_minLoadAmount = (NSDecimalNumber *)v19;

      objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("maxAmount"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      v23 = v5->_maxLoadedBalance;
      v5->_maxLoadedBalance = (NSDecimalNumber *)v22;

    }
    v5->_maxAmountIncludesLocalBalance = objc_msgSend(v4, "PKBoolForKey:", CFSTR("maxAmountIncludesLocalBalance"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("currency"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    currency = v5->_currency;
    v5->_currency = (NSString *)v25;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("serviceProviderData"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v28;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v54 = v4;
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("defaultSuggestions"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v64;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v64 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v35);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v37 = (void *)MEMORY[0x1E0CB3598];
            if (v36)
            {
              objc_msgSend(v36, "decimalValue");
            }
            else
            {
              v61[0] = 0;
              v61[1] = 0;
              v62 = 0;
            }
            objc_msgSend(v37, "decimalNumberWithDecimal:", v61);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v38)
              objc_msgSend(v30, "addObject:", v38);

          }
          ++v35;
        }
        while (v33 != v35);
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      }
      while (v33);
    }

    v39 = objc_msgSend(v30, "copy");
    defaultSuggestions = v5->_defaultSuggestions;
    v53 = v5;
    v5->_defaultSuggestions = (NSArray *)v39;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v54, "PKArrayForKey:", CFSTR("lowBalanceReminderOptions"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v58;
      do
      {
        v46 = 0;
        do
        {
          if (*(_QWORD *)v58 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v46);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v48 = (void *)MEMORY[0x1E0CB3598];
            if (v47)
            {
              objc_msgSend(v47, "decimalValue");
            }
            else
            {
              v55[0] = 0;
              v55[1] = 0;
              v56 = 0;
            }
            objc_msgSend(v48, "decimalNumberWithDecimal:", v55);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
              objc_msgSend(v41, "addObject:", v49);

          }
          ++v46;
        }
        while (v44 != v46);
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
      }
      while (v44);
    }

    v50 = objc_msgSend(v41, "copy");
    v5 = v53;
    lowBalanceReminderOptions = v53->_lowBalanceReminderOptions;
    v53->_lowBalanceReminderOptions = (NSArray *)v50;

    v4 = v54;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKEnteredValueActionItem)initWithCoder:(id)a3
{
  id v4;
  PKEnteredValueActionItem *v5;
  void *v6;
  uint64_t v7;
  NSDecimalNumber *minLoadAmount;
  void *v9;
  uint64_t v10;
  NSDecimalNumber *maxLoadAmount;
  void *v12;
  uint64_t v13;
  NSDecimalNumber *minLoadedBalance;
  void *v15;
  uint64_t v16;
  NSDecimalNumber *maxLoadedBalance;
  void *v18;
  uint64_t v19;
  NSDecimalNumber *v20;
  void *v21;
  uint64_t v22;
  NSDecimalNumber *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *defaultSuggestions;
  void *v30;
  uint64_t v31;
  NSArray *lowBalanceReminderOptions;
  void *v33;
  uint64_t v34;
  NSString *currency;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSDictionary *serviceProviderData;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKEnteredValueActionItem;
  v5 = -[PKEnteredValueActionItem init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minLoadAmount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    minLoadAmount = v5->_minLoadAmount;
    v5->_minLoadAmount = (NSDecimalNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxLoadAmount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    maxLoadAmount = v5->_maxLoadAmount;
    v5->_maxLoadAmount = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minLoadedBalance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    minLoadedBalance = v5->_minLoadedBalance;
    v5->_minLoadedBalance = (NSDecimalNumber *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxLoadedBalance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    maxLoadedBalance = v5->_maxLoadedBalance;
    v5->_maxLoadedBalance = (NSDecimalNumber *)v16;

    if (!v5->_minLoadAmount)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minAmount"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      v20 = v5->_minLoadAmount;
      v5->_minLoadAmount = (NSDecimalNumber *)v19;

    }
    if (!v5->_maxLoadedBalance)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxAmount"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      v23 = v5->_maxLoadedBalance;
      v5->_maxLoadedBalance = (NSDecimalNumber *)v22;

    }
    v5->_maxAmountIncludesLocalBalance = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("maxAmountIncludesLocalBalance"));
    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("defaultSuggestions"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    defaultSuggestions = v5->_defaultSuggestions;
    v5->_defaultSuggestions = (NSArray *)v28;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("lowBalanceReminderOptions"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    lowBalanceReminderOptions = v5->_lowBalanceReminderOptions;
    v5->_lowBalanceReminderOptions = (NSArray *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copy");
    currency = v5->_currency;
    v5->_currency = (NSString *)v34;

    v36 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    v40 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, v38, v39, v40, objc_opt_class(), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("serviceProviderData"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copy");
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v43;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *minLoadAmount;
  id v5;

  minLoadAmount = self->_minLoadAmount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", minLoadAmount, CFSTR("minLoadAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maxLoadAmount, CFSTR("maxLoadAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minLoadedBalance, CFSTR("minLoadedBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maxLoadedBalance, CFSTR("maxLoadedBalance"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_maxAmountIncludesLocalBalance, CFSTR("maxAmountIncludesLocalBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultSuggestions, CFSTR("defaultSuggestions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lowBalanceReminderOptions, CFSTR("lowBalanceReminderOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceProviderData, CFSTR("serviceProviderData"));

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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSDecimalNumber copyWithZone:](self->_minLoadAmount, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_maxLoadAmount, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_minLoadedBalance, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_maxLoadedBalance, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSArray copyWithZone:](self->_defaultSuggestions, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[NSString copyWithZone:](self->_currency, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v16;

  v18 = -[NSArray copyWithZone:](self->_lowBalanceReminderOptions, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  v20 = -[NSDictionary copyWithZone:](self->_serviceProviderData, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v20;

  *(_BYTE *)(v5 + 8) = self->_maxAmountIncludesLocalBalance;
  return (id)v5;
}

- (NSDecimalNumber)minAmount
{
  return (NSDecimalNumber *)(id)-[NSDecimalNumber copy](self->_minLoadAmount, "copy");
}

- (NSDecimalNumber)maxAmount
{
  return (NSDecimalNumber *)(id)-[NSDecimalNumber copy](self->_maxLoadedBalance, "copy");
}

- (NSDecimalNumber)minLoadAmount
{
  return self->_minLoadAmount;
}

- (NSDecimalNumber)maxLoadAmount
{
  return self->_maxLoadAmount;
}

- (NSDecimalNumber)minLoadedBalance
{
  return self->_minLoadedBalance;
}

- (NSDecimalNumber)maxLoadedBalance
{
  return self->_maxLoadedBalance;
}

- (NSArray)defaultSuggestions
{
  return self->_defaultSuggestions;
}

- (NSArray)lowBalanceReminderOptions
{
  return self->_lowBalanceReminderOptions;
}

- (BOOL)maxAmountIncludesLocalBalance
{
  return self->_maxAmountIncludesLocalBalance;
}

- (NSString)currency
{
  return self->_currency;
}

- (NSDictionary)serviceProviderData
{
  return self->_serviceProviderData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_lowBalanceReminderOptions, 0);
  objc_storeStrong((id *)&self->_defaultSuggestions, 0);
  objc_storeStrong((id *)&self->_maxLoadedBalance, 0);
  objc_storeStrong((id *)&self->_minLoadedBalance, 0);
  objc_storeStrong((id *)&self->_maxLoadAmount, 0);
  objc_storeStrong((id *)&self->_minLoadAmount, 0);
}

@end

@implementation PKAutoTopUpActionItem

- (PKAutoTopUpActionItem)init
{

  return 0;
}

- (PKAutoTopUpActionItem)initWithDictionary:(id)a3
{
  id v4;
  PKAutoTopUpActionItem *v5;
  void *v6;
  uint64_t v7;
  NSString *currency;
  void *v9;
  uint64_t v10;
  NSDictionary *serviceProviderData;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *defaultAmountSuggestions;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *defaultThresholdSuggestions;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSArray *lowBalanceReminderOptions;
  id v46;
  _QWORD v47[2];
  int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[2];
  int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[2];
  int v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)PKAutoTopUpActionItem;
  v5 = -[PKAutoTopUpActionItem init](&v65, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("currency"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    currency = v5->_currency;
    v5->_currency = (NSString *)v7;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("serviceProviderData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("defaultAmountSuggestions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v62;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v62 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x1E0CB3598];
          if (v18)
          {
            objc_msgSend(v18, "decimalValue");
          }
          else
          {
            v59[0] = 0;
            v59[1] = 0;
            v60 = 0;
          }
          objc_msgSend(v19, "decimalNumberWithDecimal:", v59);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v12, "addObject:", v20);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      }
      while (v15);
    }

    v21 = objc_msgSend(v12, "copy");
    defaultAmountSuggestions = v5->_defaultAmountSuggestions;
    v5->_defaultAmountSuggestions = (NSArray *)v21;

    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("defaultThresholdSuggestions"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v56;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v56 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v28);
          v30 = (void *)MEMORY[0x1E0CB3598];
          if (v29)
          {
            objc_msgSend(v29, "decimalValue");
          }
          else
          {
            v53[0] = 0;
            v53[1] = 0;
            v54 = 0;
          }
          objc_msgSend(v30, "decimalNumberWithDecimal:", v53);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            objc_msgSend(v23, "addObject:", v31);

          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      }
      while (v26);
    }

    v32 = objc_msgSend(v23, "copy");
    defaultThresholdSuggestions = v5->_defaultThresholdSuggestions;
    v5->_defaultThresholdSuggestions = (NSArray *)v32;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v46 = v4;
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("lowBalanceReminderOptions"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v50;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v50 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v39);
          v41 = (void *)MEMORY[0x1E0CB3598];
          if (v40)
          {
            objc_msgSend(v40, "decimalValue");
          }
          else
          {
            v47[0] = 0;
            v47[1] = 0;
            v48 = 0;
          }
          objc_msgSend(v41, "decimalNumberWithDecimal:", v47);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
            objc_msgSend(v34, "addObject:", v42);

          ++v39;
        }
        while (v37 != v39);
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
      }
      while (v37);
    }

    v43 = objc_msgSend(v34, "copy");
    lowBalanceReminderOptions = v5->_lowBalanceReminderOptions;
    v5->_lowBalanceReminderOptions = (NSArray *)v43;

    v4 = v46;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAutoTopUpActionItem)initWithCoder:(id)a3
{
  id v4;
  PKAutoTopUpActionItem *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *defaultAmountSuggestions;
  void *v12;
  uint64_t v13;
  NSArray *defaultThresholdSuggestions;
  void *v15;
  uint64_t v16;
  NSArray *lowBalanceReminderOptions;
  void *v18;
  uint64_t v19;
  NSString *currency;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDictionary *serviceProviderData;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKAutoTopUpActionItem;
  v5 = -[PKAutoTopUpActionItem init](&v31, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("defaultAmountSuggestions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    defaultAmountSuggestions = v5->_defaultAmountSuggestions;
    v5->_defaultAmountSuggestions = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("defaultThresholdSuggestions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    defaultThresholdSuggestions = v5->_defaultThresholdSuggestions;
    v5->_defaultThresholdSuggestions = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("lowBalanceReminderOptions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    lowBalanceReminderOptions = v5->_lowBalanceReminderOptions;
    v5->_lowBalanceReminderOptions = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    currency = v5->_currency;
    v5->_currency = (NSString *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, v23, v24, v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("serviceProviderData"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *defaultAmountSuggestions;
  id v5;

  defaultAmountSuggestions = self->_defaultAmountSuggestions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", defaultAmountSuggestions, CFSTR("defaultAmountSuggestions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultThresholdSuggestions, CFSTR("defaultThresholdSuggestions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lowBalanceReminderOptions, CFSTR("lowBalanceReminderOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceProviderData, CFSTR("serviceProviderData"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
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

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSArray copyWithZone:](self->_defaultAmountSuggestions, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSArray copyWithZone:](self->_defaultThresholdSuggestions, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_currency, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSArray copyWithZone:](self->_lowBalanceReminderOptions, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSDictionary copyWithZone:](self->_serviceProviderData, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (NSArray)defaultAmountSuggestions
{
  return self->_defaultAmountSuggestions;
}

- (NSArray)defaultThresholdSuggestions
{
  return self->_defaultThresholdSuggestions;
}

- (NSArray)lowBalanceReminderOptions
{
  return self->_lowBalanceReminderOptions;
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
  objc_storeStrong((id *)&self->_defaultThresholdSuggestions, 0);
  objc_storeStrong((id *)&self->_defaultAmountSuggestions, 0);
}

@end

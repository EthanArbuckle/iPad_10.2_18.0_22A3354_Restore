@implementation WFCurrencyQuantityFieldParameter

- (WFCurrencyQuantityFieldParameter)initWithDefinition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  WFCurrencyQuantityFieldParameter *v11;
  objc_super v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("PossibleUnits"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCurrencyCodes");
    v8 = objc_claimAutoreleasedReturnValue();

    v14 = CFSTR("PossibleUnits");
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "definitionByAddingEntriesInDictionary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v8;
    v4 = (id)v10;
  }
  v13.receiver = self;
  v13.super_class = (Class)WFCurrencyQuantityFieldParameter;
  v11 = -[WFQuantityFieldParameter initWithDefinition:](&v13, sel_initWithDefinition_, v4);

  return v11;
}

- (id)defaultUnit
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currencyCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFQuantityFieldParameter possibleUnits](self, "possibleUnits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

@end

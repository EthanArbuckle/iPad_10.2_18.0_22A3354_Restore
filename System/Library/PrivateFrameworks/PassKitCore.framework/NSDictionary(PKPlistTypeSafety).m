@implementation NSDictionary(PKPlistTypeSafety)

- (id)PKStringForKey:()PKPlistTypeSafety
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (uint64_t)PKIntegerForKey:()PKPlistTypeSafety
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "PKNumberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (uint64_t)PKBoolForKey:()PKPlistTypeSafety
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "PKNumberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (id)PKNumberForKey:()PKPlistTypeSafety
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)PKDateForKey:()PKPlistTypeSafety
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v1, 0, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = 0;
      goto LABEL_7;
    }
    v2 = v1;
  }
  v3 = v2;
LABEL_7:

  return v3;
}

- (id)PKURLForKey:()PKPlistTypeSafety
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "PKStringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)PKSetForKey:()PKPlistTypeSafety
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
LABEL_7:

  return v3;
}

- (id)PKDictionaryForKey:()PKPlistTypeSafety
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)PKArrayContaining:()PKPlistTypeSafety forKey:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "PKArrayForKey:", a4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  v9 = v4;
LABEL_11:

  return v9;
}

- (id)PKArrayForKey:()PKPlistTypeSafety
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)PKDictionaryOfKeyClass:()PKPlistTypeSafety valueClass:ForKey:
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "PKDictionaryForKey:", a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
          {

            v13 = 0;
            goto LABEL_14;
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  v13 = v6;
LABEL_14:

  return v13;
}

- (id)PKColorForKey:()PKPlistTypeSafety
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "PKStringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    +[PKColor colorFromString:](PKColor, "colorFromString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)PKDecimalNumberFromStringForKey:()PKPlistTypeSafety
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)PKDecimalNumberForKey:()PKPlistTypeSafety
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  int v6;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1E0CB3598];
    if (v1)
    {
      objc_msgSend(v1, "decimalValue");
    }
    else
    {
      v5[0] = 0;
      v5[1] = 0;
      v6 = 0;
    }
    objc_msgSend(v2, "decimalNumberWithDecimal:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)PKDateComponentsForKey:()PKPlistTypeSafety
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)PKUUIDForKey:()PKPlistTypeSafety
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "PKStringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v1);
  else
    v2 = 0;

  return v2;
}

- (double)PKDoubleForKey:()PKPlistTypeSafety
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "PKNumberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (id)PKDataForKey:()PKPlistTypeSafety
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (PKCurrencyAmount)PKCurrencyAmountForKey:()PKPlistTypeSafety
{
  void *v1;
  PKCurrencyAmount *v2;

  objc_msgSend(a1, "PKDictionaryForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[PKCurrencyAmount initWithDictionary:]([PKCurrencyAmount alloc], "initWithDictionary:", v1);

  return v2;
}

- (id)PKSetContaining:()PKPlistTypeSafety forKey:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "PKSetForKey:", a4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  v9 = v4;
LABEL_11:

  return v9;
}

@end

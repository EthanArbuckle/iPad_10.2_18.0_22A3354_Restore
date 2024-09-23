@implementation KeychainSyncCountryInfo

+ (void)_loadCountriesIfNeeded
{
  if (_loadCountriesIfNeeded_onceToken != -1)
    dispatch_once(&_loadCountriesIfNeeded_onceToken, &__block_literal_global);
}

void __49__KeychainSyncCountryInfo__loadCountriesIfNeeded__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathForResource:ofType:", CFSTR("CountryCodes"), CFSTR("plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    v8 = *MEMORY[0x1E0C997B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[KeychainSyncCountryInfo countryInfoWithDictionary:](KeychainSyncCountryInfo, "countryInfoWithDictionary:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "countryCode");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "displayNameForKey:value:", v8, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "setLocalizedCountryName:", v14);
            objc_msgSend(v17, "addObject:", v12);

          }
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_20);
  v15 = (void *)_countryInfoCountries;
  _countryInfoCountries = (uint64_t)v17;

}

uint64_t __49__KeychainSyncCountryInfo__loadCountriesIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "localizedCountryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(v4, "countryName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "localizedCountryName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_msgSend(v7, "localizedCompare:", v8);
  }
  else
  {
    objc_msgSend(v5, "countryName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "localizedCompare:", v10);

  }
  if (!v6)

  return v9;
}

+ (id)allCountries
{
  objc_msgSend(a1, "_loadCountriesIfNeeded");
  return (id)_countryInfoCountries;
}

+ (id)countryInfoWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  KeychainSyncCountryInfo *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("prefix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v4, "length")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v5, "length")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(KeychainSyncCountryInfo);
    -[KeychainSyncCountryInfo setCountryCode:](v7, "setCountryCode:", v6);
    -[KeychainSyncCountryInfo setCountryName:](v7, "setCountryName:", v5);
    -[KeychainSyncCountryInfo setDialingPrefix:](v7, "setDialingPrefix:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)countryInfoForCountryCode:(id)a3 dialingPrefix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "allCountries", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "countryCode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v6))
        {
          if (!objc_msgSend(v7, "length"))
          {

LABEL_15:
            v9 = v12;
            goto LABEL_16;
          }
          objc_msgSend(v12, "dialingPrefix");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v7);

          if ((v15 & 1) != 0)
            goto LABEL_15;
        }
        else
        {

        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_16:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[KeychainSyncCountryInfo countryCode](self, "countryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[KeychainSyncCountryInfo dialingPrefix](self, "dialingPrefix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dialingPrefix");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  KeychainSyncCountryInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(KeychainSyncCountryInfo);
  -[KeychainSyncCountryInfo countryCode](self, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KeychainSyncCountryInfo setCountryCode:](v4, "setCountryCode:", v5);

  -[KeychainSyncCountryInfo countryName](self, "countryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KeychainSyncCountryInfo setCountryName:](v4, "setCountryName:", v6);

  -[KeychainSyncCountryInfo localizedCountryName](self, "localizedCountryName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KeychainSyncCountryInfo setLocalizedCountryName:](v4, "setLocalizedCountryName:", v7);

  -[KeychainSyncCountryInfo dialingPrefix](self, "dialingPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[KeychainSyncCountryInfo setDialingPrefix:](v4, "setDialingPrefix:", v8);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KeychainSyncCountryInfo dialingPrefix](self, "dialingPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KeychainSyncCountryInfo countryName](self, "countryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p +%@ (%@)>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSString)countryName
{
  return self->_countryName;
}

- (void)setCountryName:(id)a3
{
  objc_storeStrong((id *)&self->_countryName, a3);
}

- (NSString)localizedCountryName
{
  return self->_localizedCountryName;
}

- (void)setLocalizedCountryName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedCountryName, a3);
}

- (NSString)dialingPrefix
{
  return self->_dialingPrefix;
}

- (void)setDialingPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_dialingPrefix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialingPrefix, 0);
  objc_storeStrong((id *)&self->_localizedCountryName, 0);
  objc_storeStrong((id *)&self->_countryName, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end

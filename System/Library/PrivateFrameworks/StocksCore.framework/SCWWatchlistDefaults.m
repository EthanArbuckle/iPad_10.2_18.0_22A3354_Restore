@implementation SCWWatchlistDefaults

- (SCWWatchlistDefaults)initWithDefaultSymbols:(id)a3
{
  id v4;
  SCWWatchlistDefaults *v5;
  uint64_t v6;
  NSArray *defaultSymbols;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWWatchlistDefaults;
  v5 = -[SCWWatchlistDefaults init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    defaultSymbols = v5->_defaultSymbols;
    v5->_defaultSymbols = (NSArray *)v6;

  }
  return v5;
}

+ (id)defaultsForCurrentCountry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "_defaultSymbolsByCountryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(a1, "_defaultSymbolsByCountryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("US"));
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  StocksLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = v4;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_1ABCEF000, v9, OS_LOG_TYPE_DEFAULT, "for country code=%{public}@, found default symbols: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  v10 = objc_alloc((Class)objc_opt_class());
  if (v6)
    v11 = v6;
  else
    v11 = (void *)MEMORY[0x1E0C9AA60];
  v12 = (void *)objc_msgSend(v10, "initWithDefaultSymbols:", v11);

  return v12;
}

+ (SCWWatchlistDefaults)defaultsWithDefaultSymbols:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDefaultSymbols:", v3);

  return (SCWWatchlistDefaults *)v4;
}

+ (id)emptyDefaults
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDefaultSymbols:", MEMORY[0x1E0C9AA60]);
}

+ (id)defaultsHistoryForCurrentCountry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[3];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultsForCurrentCountry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_iOS10DefaultsForCurrentCountry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_iOS7DefaultsForCurrentCountry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17[0] = v4;
  v17[1] = v5;
  v17[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);
  }

  return v3;
}

- (id)defaultsByAppendingDefaults:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0C99E10];
  v5 = a3;
  objc_msgSend(v4, "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCWWatchlistDefaults defaultSymbols](self, "defaultSymbols");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(v5, "defaultSymbols");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", v8);
  v9 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v6, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithDefaultSymbols:", v10);

  return v11;
}

+ (id)_defaultSymbolsByCountryCode
{
  return &unk_1E5B1BE60;
}

+ (id)_iOS10DefaultsForCurrentCountry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "_legacyDefaultSymbolsByCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObjectsFromArray:", v7);
  }
  objc_msgSend(v3, "addObject:", CFSTR("^DJI"));
  objc_msgSend(v3, "addObject:", CFSTR("AAPL"));
  objc_msgSend(v3, "addObject:", CFSTR("SBUX"));
  objc_msgSend(v3, "addObject:", CFSTR("NKE"));
  objc_msgSend(v3, "addObject:", CFSTR("YHOO"));
  v8 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v3, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithDefaultSymbols:", v9);

  return v10;
}

+ (id)_iOS7DefaultsForCurrentCountry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "_legacyDefaultSymbolsByCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isEqualToString:", CFSTR("US")))
    {

      v7 = &unk_1E5B1BB48;
    }
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  objc_msgSend(v3, "addObject:", CFSTR("AAPL"));
  objc_msgSend(v3, "addObject:", CFSTR("GOOG"));
  objc_msgSend(v3, "addObject:", CFSTR("YHOO"));
  objc_msgSend(v3, "addObject:", CFSTR("^DJI"));
  objc_msgSend(v3, "addObject:", CFSTR("^FTSE"));
  objc_msgSend(v3, "addObject:", CFSTR("^GDAXI"));
  objc_msgSend(v3, "addObject:", CFSTR("^HSI"));
  objc_msgSend(v3, "addObject:", CFSTR("^N225"));
  v8 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v3, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithDefaultSymbols:", v9);

  return v10;
}

+ (id)_legacyDefaultSymbolsByCountryCode
{
  return &unk_1E5B1BE88;
}

- (NSArray)defaultSymbols
{
  return self->_defaultSymbols;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSymbols, 0);
}

@end

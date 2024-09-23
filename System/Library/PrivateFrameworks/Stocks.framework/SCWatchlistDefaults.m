@implementation SCWatchlistDefaults

- (SCWatchlistDefaults)initWithDefaultSymbols:(id)a3
{
  id v4;
  SCWatchlistDefaults *v5;
  uint64_t v6;
  NSArray *defaultSymbols;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWatchlistDefaults;
  v5 = -[SCWatchlistDefaults init](&v9, sel_init);
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

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDBCAE8]);
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
    _os_log_impl(&dword_21736B000, v9, OS_LOG_TYPE_DEFAULT, "for country code=%{public}@, found default symbols: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  v10 = objc_alloc((Class)objc_opt_class());
  if (v6)
    v11 = v6;
  else
    v11 = (void *)MEMORY[0x24BDBD1A8];
  v12 = (void *)objc_msgSend(v10, "initWithDefaultSymbols:", v11);

  return v12;
}

+ (id)defaultsFromCarrierBundle
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v31;
  uint64_t v32;
  id v33;
  id obj;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDC2810]);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
  v48 = 0;
  objc_msgSend(v3, "getSubscriptionInfoWithError:", &v48);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v48;
  if (v5)
  {
    StocksLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SCWatchlistDefaults defaultsFromCarrierBundle].cold.1((uint64_t)v5, v6);

  }
  v31 = v4;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v4, "subscriptions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v36)
  {
    v7 = *(_QWORD *)v45;
    v32 = *(_QWORD *)v45;
    v33 = v3;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v45 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v8);
        v43 = 0;
        v10 = (void *)objc_msgSend(v3, "copyCarrierBundleValue:key:bundleType:error:", v9, CFSTR("StockSymboli"), v35, &v43);
        v11 = v43;
        v38 = v10;
        if (v11)
        {
          StocksLogForCategory(4);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v51 = (uint64_t)v11;
            _os_log_error_impl(&dword_21736B000, v12, OS_LOG_TYPE_ERROR, "failed to get carrier stocks with error: %{public}@", buf, 0xCu);
          }

          v10 = v38;
        }
        v37 = v11;
        StocksLogForCategory(4);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_msgSend(v9, "slotID");
          objc_msgSend(v9, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v51 = v14;
          v10 = v38;
          v52 = 2114;
          v53 = v15;
          v54 = 2114;
          v55 = v38;
          _os_log_impl(&dword_21736B000, v13, OS_LOG_TYPE_DEFAULT, "for SIM slot=%ld, id=%{public}@, found stock symbols: %{public}@", buf, 0x20u);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v16 = v10;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v40 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v21, "objectForKey:", CFSTR("symbol"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v22, "length"))
                  {
                    objc_msgSend(v22, "uppercaseString");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v2, "addObject:", v23);

                  }
                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
            }
            while (v18);
          }

          v7 = v32;
          v3 = v33;
          v10 = v38;
        }

        ++v8;
      }
      while (v8 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v36);
  }

  StocksLogForCategory(4);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend(v2, "count");
    objc_msgSend(v2, "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v51 = v25;
    v52 = 2114;
    v53 = v26;
    _os_log_impl(&dword_21736B000, v24, OS_LOG_TYPE_DEFAULT, "found %lu carrier symbols: %{public}@", buf, 0x16u);

  }
  v27 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v2, "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithDefaultSymbols:", v28);

  return v29;
}

+ (id)defaultsWithDefaultSymbols:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDefaultSymbols:", v3);

  return v4;
}

+ (id)emptyDefaults
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDefaultSymbols:", MEMORY[0x24BDBD1A8]);
}

+ (id)defaultsHistoryForCurrentCountry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[3];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultsForCurrentCountry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_iOS10DefaultsForCurrentCountry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_iOS7DefaultsForCurrentCountry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultsFromCarrierBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20[0] = v4;
  v20[1] = v5;
  v20[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v3, "addObject:", v13);
        objc_msgSend(v13, "defaultsByAppendingDefaults:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
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

  v4 = (void *)MEMORY[0x24BDBCEE0];
  v5 = a3;
  objc_msgSend(v4, "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCWatchlistDefaults defaultSymbols](self, "defaultSymbols");
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
  return &unk_24D760350;
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

  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCAE8]);
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

  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "_legacyDefaultSymbolsByCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isEqualToString:", CFSTR("US")))
    {

      v7 = &unk_24D760718;
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
  return &unk_24D760378;
}

- (NSArray)defaultSymbols
{
  return self->_defaultSymbols;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSymbols, 0);
}

+ (void)defaultsFromCarrierBundle
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21736B000, a2, OS_LOG_TYPE_ERROR, "failed to get subscription info for carrier stocks with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end

@implementation STRegionRatings

+ (void)loadRegionRatingsWithCompletionHandler:(id)a3
{
  +[STRegionRatings loadRegionRatingsWithUnrated:completionHandler:](STRegionRatings, "loadRegionRatingsWithUnrated:completionHandler:", 0, a3);
}

+ (void)loadRegionRatingsWithUnrated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__STRegionRatings_loadRegionRatingsWithUnrated_completionHandler___block_invoke;
  v9[3] = &unk_24DB87028;
  v10 = v6;
  v11 = v5;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v7, "loadRegionRatingsDataWithUnrated:completionHandler:", v4, v9);

}

uint64_t __66__STRegionRatings_loadRegionRatingsWithUnrated_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

+ (STRegionRatings)sharedRatings
{
  if (sharedRatings_onceToken != -1)
    dispatch_once(&sharedRatings_onceToken, &__block_literal_global_13);
  return (STRegionRatings *)(id)sharedRatings_sharedRatings;
}

void __32__STRegionRatings_sharedRatings__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedRatings_sharedRatings;
  sharedRatings_sharedRatings = v0;

}

- (void)loadRegionRatingsDataWithCompletionHandler:(id)a3
{
  -[STRegionRatings loadRegionRatingsDataWithUnrated:completionHandler:](self, "loadRegionRatingsDataWithUnrated:completionHandler:", 0, a3);
}

- (void)loadRegionRatingsDataWithUnrated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v4 = a3;
  v6 = a4;
  -[STRegionRatings preferredRegion](self, "preferredRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08380], "createBagForSubProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE08380]);
  if (v4)
    v10 = (void *)objc_msgSend(v9, "initForAllMediaWithUnratedRatingsForStoreFront:clientIdentifier:useCase:bag:", v7, CFSTR("com.apple.ScreenTimeSettingsUI"), 1, v8);
  else
    v10 = (void *)objc_msgSend(v9, "initForAllMediaWithStoreFront:clientIdentifier:useCase:bag:", v7, CFSTR("com.apple.ScreenTimeSettingsUI"), 1, v8);
  v11 = v10;
  objc_msgSend(v10, "performTask");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "promiseWithTimeout:", 20.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __70__STRegionRatings_loadRegionRatingsDataWithUnrated_completionHandler___block_invoke;
  v16[3] = &unk_24DB877A0;
  v17 = v7;
  v18 = v6;
  v16[4] = self;
  v14 = v7;
  v15 = v6;
  objc_msgSend(v13, "addFinishBlock:", v16);

}

void __70__STRegionRatings_loadRegionRatingsDataWithUnrated_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[STUILog contentPrivacy](STUILog, "contentPrivacy");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_219AB4000, v7, OS_LOG_TYPE_DEFAULT, "AMSRatingsProvider returned: %@ %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__STRegionRatings_loadRegionRatingsDataWithUnrated_completionHandler___block_invoke_16;
  block[3] = &unk_24DB87778;
  v13 = v5;
  v17 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v14 = v6;
  v15 = v8;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __70__STRegionRatings_loadRegionRatingsDataWithUnrated_completionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  NSObject *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v1 = a1;
  v55 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_opt_new();
    objc_msgSend(*(id *)(v1 + 32), "ratingsStoreFronts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count") == 1)
    {
      v31 = v3;
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ratingSystems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v6 = v5;
      v36 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v36)
      {
        v34 = v2;
        v35 = *(_QWORD *)v44;
        v32 = v6;
        v33 = v1;
        while (2)
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v44 != v35)
              objc_enumerationMutation(v6);
            v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            if (objc_msgSend(v6, "count"))
            {
              objc_msgSend(v8, "contentRatings");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
              v11 = *(void **)(v1 + 48);
              objc_msgSend(v8, "types");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "getRatingSystemTypeFrom:", v12);
              v13 = objc_claimAutoreleasedReturnValue();

              if (!v13)
              {
                v29 = *(_QWORD *)(v1 + 64);
                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE84710], 103, 0);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v30);

                goto LABEL_29;
              }
              v37 = (void *)v13;
              v38 = i;
              v41 = 0u;
              v42 = 0u;
              v39 = 0u;
              v40 = 0u;
              v14 = v9;
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v40;
                do
                {
                  for (j = 0; j != v16; ++j)
                  {
                    if (*(_QWORD *)v40 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                    objc_msgSend(v19, "value");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v20, "isEqual:", &unk_24DBBEA78) & 1) == 0)
                    {
                      v49[1] = CFSTR("rating");
                      v50[0] = v20;
                      v49[0] = CFSTR("rank");
                      objc_msgSend(v19, "name");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      v50[1] = v21;
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v10, "addObject:", v22);

                    }
                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
                }
                while (v16);
              }

              v2 = v34;
              -[NSObject setValue:forKey:](v34, "setValue:forKey:", v10, v37);

              v6 = v32;
              v1 = v33;
              i = v38;
            }
          }
          v36 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v36)
            continue;
          break;
        }
      }

      v47 = *(_QWORD *)(v1 + 56);
      v48 = v2;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 48), "setRegionRatingsData:", v23);

      +[STUILog contentPrivacy](STUILog, "contentPrivacy");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(v1 + 48), "regionRatingsData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v54 = v25;
        _os_log_impl(&dword_219AB4000, v24, OS_LOG_TYPE_DEFAULT, "STRegionRatings loadRegionRatingsDataWithCompletionHandler returning ratings data: %@", buf, 0xCu);

      }
      (*(void (**)(void))(*(_QWORD *)(v1 + 64) + 16))();
LABEL_29:
      v3 = v31;

    }
    else
    {
      v27 = *(_QWORD *)(v1 + 64);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE84710], 102, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    +[STUILog contentPrivacy](STUILog, "contentPrivacy");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(void **)(v1 + 40);
      *(_DWORD *)buf = 138412290;
      v54 = v26;
      _os_log_impl(&dword_219AB4000, v2, OS_LOG_TYPE_DEFAULT, "STRegionRatings loadRegionRatingsDataWithCompletionHandler returned error: %@", buf, 0xCu);
    }
  }

}

- (NSString)preferredRegion
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = CFSTR("us");

  return (NSString *)v5;
}

- (id)_overrideValueForString:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, CFSTR("xx"), CFSTR("RatingProviders"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5 == CFSTR("xx"))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(\\d+)"), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "range");
      objc_msgSend(v3, "substringWithRange:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%ld"), 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)_localizedLabelForRegion:(id)a3 rating:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_%@"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRegionRatings _overrideValueForString:](self, "_overrideValueForString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = v7;
  v11 = v9;

  return v11;
}

- (NSDictionary)localizedRegionsByCode
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[STRegionRatings regionRatingsData](self, "regionRatingsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[STRegionRatings _overrideValueForString:](self, "_overrideValueForString:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedStringForCountryCode:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return (NSDictionary *)v5;
}

- (NSArray)localizedRegionAndCodePairs
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  STKeyValuePair *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[STRegionRatings localizedRegionsByCode](self, "localizedRegionsByCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keysSortedByValueUsingSelector:", sel_localizedStandardCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[STKeyValuePair initWithKey:value:]([STKeyValuePair alloc], "initWithKey:value:", v10, v9);
        objc_msgSend(v3, "addObject:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_localizedRatingsForRegion:(id)a3 type:(id)a4 allContentKey:(id)a5 noContentKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[STRegionRatings regionRatingsData](self, "regionRatingsData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_14;
    goto LABEL_12;
  }
  v36 = v13;
  v37 = v12;
  v38 = v11;
  objc_msgSend(v16, "valueForKey:", CFSTR("rank"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v34, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v35 = v16;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("rating"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[STRegionRatings _localizedLabelForRegion:rating:](self, "_localizedLabelForRegion:rating:", v10, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v20);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjects:forKeys:", v17, v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v37;
  v11 = v38;
  v16 = v35;
  v13 = v36;
  if (v36)
  {
LABEL_12:
    objc_msgSend(v25, "objectForKeyedSubscript:", &unk_24DBBEA78);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", v13, CFSTR("xx"), CFSTR("RatingProviders"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, &unk_24DBBEA78);

    }
  }
LABEL_14:
  if (v12)
  {
    objc_msgSend(v25, "objectForKeyedSubscript:", &unk_24DBBEA48);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", v12, CFSTR("xx"), CFSTR("RatingProviders"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v31, &unk_24DBBEA48);

    }
  }
  v32 = (void *)objc_msgSend(v25, "copy");

  return v32;
}

- (id)localizedMovieRatingsForRegion:(id)a3
{
  return -[STRegionRatings _localizedRatingsForRegion:type:allContentKey:noContentKey:](self, "_localizedRatingsForRegion:type:allContentKey:noContentKey:", a3, CFSTR("ratingMovies"), CFSTR("AllowAll"), CFSTR("DontAllow"));
}

- (id)localizedTVRatingsForRegion:(id)a3
{
  return -[STRegionRatings _localizedRatingsForRegion:type:allContentKey:noContentKey:](self, "_localizedRatingsForRegion:type:allContentKey:noContentKey:", a3, CFSTR("ratingTVShows"), CFSTR("AllowAll"), CFSTR("DontAllow"));
}

- (id)localizedAppRatingsForRegion:(id)a3
{
  return -[STRegionRatings _localizedRatingsForRegion:type:allContentKey:noContentKey:](self, "_localizedRatingsForRegion:type:allContentKey:noContentKey:", a3, CFSTR("ratingApps"), 0, CFSTR("DontAllow"));
}

- (id)localizedStringForAppRatingLabel:(id)a3
{
  return -[STRegionRatings _localizedLabelForRegion:rating:](self, "_localizedLabelForRegion:rating:", CFSTR("us"), a3);
}

- (id)getRatingSystemTypeFrom:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (getRatingSystemTypeFrom__onceToken != -1)
    dispatch_once(&getRatingSystemTypeFrom__onceToken, &__block_literal_global_47);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend((id)getRatingSystemTypeFrom__typeValues, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

void __43__STRegionRatings_getRatingSystemTypeFrom___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("movies");
  v2[1] = CFSTR("movie-bundles");
  v3[0] = CFSTR("ratingMovies");
  v3[1] = CFSTR("ratingMovies");
  v2[2] = CFSTR("tv-seasons");
  v2[3] = CFSTR("tv-episodes");
  v3[2] = CFSTR("ratingTVShows");
  v3[3] = CFSTR("ratingTVShows");
  v2[4] = CFSTR("apps");
  v2[5] = CFSTR("in-apps");
  v3[4] = CFSTR("ratingApps");
  v3[5] = CFSTR("ratingApps");
  v2[6] = CFSTR("app-bundles");
  v3[6] = CFSTR("ratingApps");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getRatingSystemTypeFrom__typeValues;
  getRatingSystemTypeFrom__typeValues = v0;

}

- (id)getClosestRestrictionMatch:(id)a3 within:(id)a4 forPayloadKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[5];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "integerValue");
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("ratingApps")))
    v13 = &unk_24DBBEA60;
  else
    v13 = &unk_24DBBEA48;
  if (objc_msgSend(v7, "isEqual:", v13))
  {
    v14 = v7;
  }
  else
  {
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_65);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __67__STRegionRatings_getClosestRestrictionMatch_within_forPayloadKey___block_invoke_2;
    v18[3] = &__block_descriptor_40_e25_B32__0__NSNumber_8Q16_B24l;
    v18[4] = v10;
    v16 = objc_msgSend(v15, "indexOfObjectPassingTest:", v18);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = &unk_24DBBEA78;
    }
    else
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v16);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v15;
  }

  return v14;
}

uint64_t __67__STRegionRatings_getClosestRestrictionMatch_within_forPayloadKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

BOOL __67__STRegionRatings_getClosestRestrictionMatch_within_forPayloadKey___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  if (objc_msgSend(a2, "integerValue") > *(_QWORD *)(a1 + 32))
    return *a4 != 0;
  result = 1;
  *a4 = 1;
  return result;
}

- (NSDictionary)regionRatingsData
{
  return self->_regionRatingsData;
}

- (void)setRegionRatingsData:(id)a3
{
  objc_storeStrong((id *)&self->_regionRatingsData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionRatingsData, 0);
}

@end

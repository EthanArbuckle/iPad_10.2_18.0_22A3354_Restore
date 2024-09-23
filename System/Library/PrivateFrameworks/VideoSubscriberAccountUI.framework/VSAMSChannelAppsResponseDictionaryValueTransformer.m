@implementation VSAMSChannelAppsResponseDictionaryValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v4;
  NSObject *v5;
  VSIdentityProviderChannelAppsResponse *v6;
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  _BOOL4 v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  VSAMSChannelAppsResponseDictionaryValueTransformer *v33;
  id v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v4;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Handling response %@", buf, 0xCu);
  }

  v6 = objc_alloc_init(VSIdentityProviderChannelAppsResponse);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_opt_class();
  v9 = 0x24BDF8000;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_26;
  objc_msgSend(v4, "vs_arrayOfDictionariesForKey:", CFSTR("data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vs_dictionaryForKey:", CFSTR("relationships"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "vs_dictionaryForKey:", CFSTR("subscription-apps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "vs_dictionaryForKey:", CFSTR("channel-apps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "vs_dictionaryForKey:", CFSTR("apps"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = !v12 || v13 == 0;
  v38 = (void *)v15;
  v39 = v14;
  v17 = v16 || v14 == 0;
  v18 = v17 || v15 == 0;
  v19 = !v18;
  v36 = v19;
  v37 = v13;
  if (v18)
  {
    v9 = 0x24BDF8000uLL;
    v30 = (void *)MEMORY[0x24BDF8BF0];
    -[VSAMSChannelAppsResponseDictionaryValueTransformer parseAppData:](self, "parseAppData:", v4);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "failableWithObject:", v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = self;
    v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v13, "vs_arrayForKey:", CFSTR("data"));
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_msgSend(v20, "addObjectsFromArray:", v21);
    objc_msgSend(v14, "vs_arrayForKey:", CFSTR("data"));
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v20, "addObjectsFromArray:", v22);
    v32 = (void *)v22;
    v35 = (void *)v21;
    objc_msgSend(v38, "vs_arrayForKey:", CFSTR("data"));
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v20, "addObjectsFromArray:", v23);
    v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v24, "setObject:forKey:", v20, CFSTR("data"));
    -[VSAMSChannelAppsResponseDictionaryValueTransformer parseAppData:](v33, "parseAppData:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allApps");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v26);

    objc_msgSend(v25, "appsByChannelID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v7;
    v28 = (void *)v23;
    v29 = (void *)objc_msgSend(v27, "mutableCopy");
    objc_msgSend(v8, "addEntriesFromDictionary:", v29);

    v7 = v34;
    v9 = 0x24BDF8000;
  }

  if (v36)
  {
LABEL_26:
    -[VSIdentityProviderChannelAppsResponse setAllApps:](v6, "setAllApps:", v7);
    -[VSIdentityProviderChannelAppsResponse setAppsByChannelID:](v6, "setAppsByChannelID:", v8);
    objc_msgSend(*(id *)(v9 + 3056), "failableWithObject:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

- (id)parseAppData:(id)a3
{
  id v3;
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  VSIdentityProviderChannelAppsResponse *v27;
  id obj;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v27 = objc_alloc_init(VSIdentityProviderChannelAppsResponse);
  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD1970], "valueTransformerForName:", CFSTR("VSAMSAppsValueTransformer"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v26 = v3;
  objc_msgSend(v3, "vs_arrayOfDictionariesForKey:", CFSTR("data"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v32)
  {
    v30 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v31, "transformedValue:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v36 = i;
          objc_msgSend(v6, "vs_dictionaryForKey:", CFSTR("meta"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "vs_arrayOfStringsForKey:", CFSTR("channels"));
          v9 = objc_claimAutoreleasedReturnValue();
          v35 = v8;
          objc_msgSend(v8, "vs_arrayOfStringsForKey:", CFSTR("subscriptions"));
          v10 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v10;
          v34 = (void *)v9;
          if (v9)
            v11 = (void *)v9;
          else
            v11 = (void *)v10;
          v12 = v11;
          v13 = v12;
          if (v12)
          {
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v38;
              do
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v38 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
                  objc_msgSend(v4, "objectForKey:", v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = v19;
                  if (v19)
                    v21 = v19;
                  else
                    v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                  v22 = v21;

                  objc_msgSend(v22, "addObject:", v7);
                  objc_msgSend(v4, "setObject:forKey:", v22, v18);

                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              }
              while (v15);
            }
          }
          v23 = 1;
          if (v33)
            v23 = 2;
          if (v34)
            v24 = 0;
          else
            v24 = v23;
          objc_msgSend(v7, "setAppType:", v24);
          objc_msgSend(v29, "addObject:", v7);

          i = v36;
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v32);
  }

  -[VSIdentityProviderChannelAppsResponse setAllApps:](v27, "setAllApps:", v29);
  -[VSIdentityProviderChannelAppsResponse setAppsByChannelID:](v27, "setAppsByChannelID:", v4);

  return v27;
}

@end

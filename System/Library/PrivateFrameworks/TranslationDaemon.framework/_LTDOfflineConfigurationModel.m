@implementation _LTDOfflineConfigurationModel

- (_LTDOfflineConfigurationModel)initWithDictionary:(id)a3
{
  id v5;
  _LTDOfflineConfigurationModel *v6;
  _LTDOfflineConfigurationModel *v7;
  id *p_root;
  void *v9;
  uint64_t v10;
  NSDictionary *v11;
  char v12;
  NSDictionary *v13;
  NSDictionary *languagePairConfigs;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *pairAssetConfigFile;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *pairAssetList;
  void *v24;
  void *v25;
  void *v26;
  _LTDOfflineConfigurationModel *v27;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_LTDOfflineConfigurationModel;
  v6 = -[_LTDOfflineConfigurationModel init](&v29, sel_init);
  v7 = v6;
  if (v6)
  {
    p_root = (id *)&v6->_root;
    objc_storeStrong((id *)&v6->_root, a3);
    -[NSDictionary objectForKeyedSubscript:](v7->_root, "objectForKeyedSubscript:", CFSTR("LanguagePairs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = v9;
    if (!v11
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (v12 = -[NSDictionary lt_ensureTypesForKeys:values:](v11, "lt_ensureTypesForKeys:values:", v10, 0),
          v13 = v11,
          (v12 & 1) == 0))
    {

      v13 = 0;
    }

    languagePairConfigs = v7->_languagePairConfigs;
    v7->_languagePairConfigs = v13;

    -[NSDictionary allValues](v7->_languagePairConfigs, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7->_hasCapabilityIdentifiers = objc_opt_isKindOfClass() & 1;

    if (!v7->_languagePairConfigs)
    {
      objc_msgSend(*p_root, "objectForKeyedSubscript:", CFSTR("config"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSDictionary objectForKeyedSubscript:](v7->_root, "objectForKeyedSubscript:", CFSTR("config"));
        v18 = objc_claimAutoreleasedReturnValue();
        pairAssetConfigFile = v7->_pairAssetConfigFile;
        v7->_pairAssetConfigFile = (NSString *)v18;
      }
      else
      {
        pairAssetConfigFile = v7->_pairAssetConfigFile;
        v7->_pairAssetConfigFile = 0;
      }

      objc_msgSend(*p_root, "objectForKeyedSubscript:", CFSTR("asset_list"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (objc_msgSend(v20, "lt_ensureElementType:", objc_opt_class()))
          v21 = v20;
        else
          v21 = 0;
      }
      else
      {

        v20 = 0;
        v21 = 0;
      }
      v22 = v21;

      pairAssetList = v7->_pairAssetList;
      v7->_pairAssetList = v22;

      -[NSDictionary objectForKeyedSubscript:](v7->_root, "objectForKeyedSubscript:", CFSTR("RequiredCapabilityIdentifier"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*p_root, "objectForKeyedSubscript:", CFSTR("RequiredCapabilityIdentifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = (void *)objc_opt_new();
      }
      v26 = v25;
      v7->_pairAssetRequiredANECapability = objc_msgSend(v25, "integerValue");

    }
    v27 = v7;
  }

  return v7;
}

+ (id)passthroughConfiguration
{
  _LTDOfflineConfigurationModel *v2;
  void *v3;
  _LTDOfflineConfigurationModel *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v2 = [_LTDOfflineConfigurationModel alloc];
  v6[0] = CFSTR("config");
  v6[1] = CFSTR("asset_list");
  v7[0] = &stru_251A15610;
  v7[1] = MEMORY[0x24BDBD1A8];
  v6[2] = CFSTR("RequiredCapabilityIdentifier");
  v7[2] = &unk_251A50A58;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_LTDOfflineConfigurationModel initWithDictionary:](v2, "initWithDictionary:", v3);

  return v4;
}

+ (BOOL)isPassthroughLocalePairIdentifier:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  int v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 >= 9)
  {
    v5 = v4 >> 1;
    if (objc_msgSend(v3, "characterAtIndex:", v4 >> 1) == 45)
    {
      v6 = 0;
      v7 = 0;
      while (1)
      {
        v8 = objc_msgSend(v3, "characterAtIndex:", v6);
        if (v8 != objc_msgSend(v3, "characterAtIndex:", v5 + v6 + 1))
          break;
        v7 |= v8 == 95;
        if (v5 == ++v6)
          goto LABEL_8;
      }
    }
  }
  v7 = 0;
LABEL_8:

  return v7 & 1;
}

- (NSArray)languagePairs
{
  return -[NSDictionary allKeys](self->_languagePairConfigs, "allKeys");
}

- (NSArray)languageIdentifiers
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[_LTDOfflineConfigurationModel languagePairs](self, "languagePairs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v6 = 138543362;
    v17 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("-"), v17, (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v11, "count") > 1)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);
          objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v14);

        }
        else
        {
          v12 = _LTOSLogAssets();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v23 = v10;
            _os_log_error_impl(&dword_2491B9000, v12, OS_LOG_TYPE_ERROR, "Offline configuration locale pair with nil source and/or target: %{public}@", buf, 0xCu);
          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (id)offlinePairConfigurationWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_LTDOfflineConfigurationModel _offlinePairConfigurationWithIdentifier:capability:](self, "_offlinePairConfigurationWithIdentifier:capability:", v4, +[_LTDANEService capability](_LTDANEService, "capability"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_offlinePairConfigurationWithIdentifier:(id)a3 capability:(int64_t)a4
{
  id v6;
  _LTDOfflineConfigurationModel *v7;
  _BOOL4 hasCapabilityIdentifiers;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isPassthroughLocalePairIdentifier:", v6))
  {
    objc_msgSend((id)objc_opt_class(), "passthroughConfiguration");
    v7 = (_LTDOfflineConfigurationModel *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    hasCapabilityIdentifiers = self->_hasCapabilityIdentifiers;
    -[NSDictionary objectForKeyedSubscript:](self->_languagePairConfigs, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (hasCapabilityIdentifiers)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSDictionary objectForKeyedSubscript:](self->_languagePairConfigs, "objectForKeyedSubscript:", v6);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = objc_opt_new();
      }
      v12 = (void *)v10;

      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0x24BDBC000uLL;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "firstObject");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = objc_opt_new();
      }
      v16 = (void *)v15;

      if (objc_msgSend(v12, "count"))
      {
        v17 = 0;
        while (1)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("RequiredCapabilityIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
            v20 = a4;
            v21 = v14;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("RequiredCapabilityIdentifier"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = v21;
            a4 = v20;
          }
          else
          {
            v23 = (void *)objc_opt_new();
          }

          if (objc_msgSend(v23, "integerValue") > a4)
            break;
          objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
            v25 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v25 = objc_opt_new();
          }
          v26 = (void *)v25;

          ++v17;
          v16 = v26;
          if (v17 >= objc_msgSend(v12, "count"))
          {
            v16 = v26;
            goto LABEL_26;
          }
        }

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSDictionary objectForKeyedSubscript:](self->_languagePairConfigs, "objectForKeyedSubscript:", v6);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = objc_opt_new();
      }
      v16 = (void *)v11;
      v12 = v9;
    }
LABEL_26:

    if (objc_msgSend(v16, "count"))
    {
      v7 = -[_LTDOfflineConfigurationModel initWithDictionary:]([_LTDOfflineConfigurationModel alloc], "initWithDictionary:", v16);

    }
    else
    {
      v27 = _LTOSLogAssets();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v30 = v6;
        _os_log_impl(&dword_2491B9000, v27, OS_LOG_TYPE_INFO, "No offline configuration available for language identifier: %{public}@", buf, 0xCu);
      }

      v7 = 0;
    }
  }

  return v7;
}

- (id)debugDescription
{
  return (id)-[NSDictionary debugDescription](self->_root, "debugDescription");
}

- (NSString)pairAssetConfigFile
{
  return self->_pairAssetConfigFile;
}

- (NSArray)pairAssetList
{
  return self->_pairAssetList;
}

- (NSDictionary)root
{
  return self->_root;
}

- (NSDictionary)languagePairConfigs
{
  return self->_languagePairConfigs;
}

- (BOOL)hasCapabilityIdentifiers
{
  return self->_hasCapabilityIdentifiers;
}

- (int64_t)pairAssetRequiredANECapability
{
  return self->_pairAssetRequiredANECapability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languagePairConfigs, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_pairAssetList, 0);
  objc_storeStrong((id *)&self->_pairAssetConfigFile, 0);
}

@end

@implementation _ICQUpgradeFlowSpecification

- (_ICQUpgradeFlowSpecification)initWithServerDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  _ICQUpgradeOfferPageSpecification *v15;
  void *v16;
  _ICQUpgradeOfferPageSpecification *v17;
  void *v18;
  _ICQUpgradeFlowSpecification *v19;
  _ICQUpgradeFlowSpecification *v20;
  id obj;
  void *v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ICQServerDictToOfferTypeAndLevel(v4, (unint64_t *)&self->_offerType, 0);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("needsWifi"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_needsWiFi = _ICQBooleanForServerObjectDefault(v5, 0);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offerInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = v4;
  v23 = v4;
  +[_ICQUpgradeFlowSpecification sanitizedUpgradeFlowServerDict:](_ICQUpgradeFlowSpecification, "sanitizedUpgradeFlowServerDict:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v7;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v15 = [_ICQUpgradeOfferPageSpecification alloc];
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[_ICQUpgradeOfferPageSpecification initWithServerDictionary:pageIdentifier:](v15, "initWithServerDictionary:pageIdentifier:", v16, v14);

        if (objc_msgSend(v14, "isEqualToString:", CFSTR("UpgradeOffer")))
          objc_msgSend(v8, "insertObject:atIndex:", v17, 0);
        else
          objc_msgSend(v8, "addObject:", v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v18 = (void *)objc_msgSend(v8, "copy");
  v24.receiver = self;
  v24.super_class = (Class)_ICQUpgradeFlowSpecification;
  v19 = -[_ICQFlowSpecification initWithPages:](&v24, sel_initWithPages_, v18);
  v20 = v19;
  if (v19)
    objc_storeStrong((id *)&v19->_serverDict, obj);

  return v20;
}

+ (id)sanitizedUpgradeFlowServerDict:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[16];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  _ICQDictionaryForOneOfKeys(v3, &unk_1E8B55348);
  v5 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v5;
  if (v5)
  {
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("UpgradeOffer"));
  }
  else
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "missing upgradeInfo and actionInfo", buf, 2u);
    }

  }
  _ICQDictionaryForKey(v3, CFSTR("postUpgradeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQDictionaryForKey(v3, CFSTR("successInfo"));
  v8 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v8;
  v39 = v7;
  if (!v7)
  {
    v19 = (void *)v8;
    if (!v8)
    {
      _ICQGetLogSystem();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v33, OS_LOG_TYPE_DEFAULT, "missing postUpgradeInfo and successInfo", buf, 2u);
      }
      goto LABEL_49;
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("UpgradeComplete"));
LABEL_21:
    _ICQDictionaryForKey(v3, CFSTR("failureInfo"));
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("UpgradeFailure"));
    }
    else if (!v7)
    {
      _ICQGetLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v21, OS_LOG_TYPE_DEFAULT, "missing failureInfo", buf, 2u);
      }

    }
    _ICQDictionaryForKey(v3, CFSTR("network"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("UpgradeFailureNetwork"));
    }
    else if (!v7)
    {
      _ICQGetLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v23, OS_LOG_TYPE_DEFAULT, "missing network failure page (might not be needed)", buf, 2u);
      }

    }
    v36 = v20;
    _ICQDictionaryForKey(v3, CFSTR("wifi"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("UpgradeSuccessWiFi"));
    }
    else if (!v7)
    {
      _ICQGetLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v25, OS_LOG_TYPE_DEFAULT, "missing wifi failure page (might not be needed)", buf, 2u);
      }

    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v26 = v3;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v41 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (objc_msgSend(v31, "integerValue", v36, v37))
          {
            _ICQDictionaryForKey(v26, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v32, v31);

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v28);
    }

    v19 = v38;
    v7 = v39;
    v33 = v36;
LABEL_49:

    goto LABEL_50;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v9);
        v14 = *(__CFString **)(*((_QWORD *)&v44 + 1) + 8 * j);
        _ICQDictionaryForKey(v9, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("200")))
        {
          v16 = v4;
          v17 = v15;
          v18 = CFSTR("UpgradeComplete");
        }
        else
        {
          v16 = v4;
          v17 = v15;
          v18 = v14;
        }
        objc_msgSend(v16, "setObject:forKey:", v17, v18);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v11);
  }

  v19 = v38;
  v7 = v39;
  if (v38)
    goto LABEL_21;
LABEL_50:
  v34 = (void *)objc_msgSend(v4, "copy", v36);

  return v34;
}

+ (id)upgradeFlowSpecificationSampleForLevel:(int64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___UpgradeFlowSpecificationSampleForLevel_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (_UpgradeFlowSpecificationSampleForLevel_onceToken != -1)
    dispatch_once(&_UpgradeFlowSpecificationSampleForLevel_onceToken, block);
  return (id)_UpgradeFlowSpecificationSampleForLevel_sUpgradeFlowSpecification;
}

- (id)upgradeSuccessPage
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  -[_ICQFlowSpecification pagesByIdentifier](self, "pagesByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("UpgradeComplete"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "no upgrade success page available", v6, 2u);
    }

  }
  return v3;
}

- (id)upgradeFailurePage
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  -[_ICQFlowSpecification pagesByIdentifier](self, "pagesByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("UpgradeFailure"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "no upgrade failure page available", v6, 2u);
    }

  }
  return v3;
}

- (id)upgradePageForSuccess:(BOOL)a3
{
  if (a3)
    -[_ICQUpgradeFlowSpecification upgradeSuccessPage](self, "upgradeSuccessPage");
  else
    -[_ICQUpgradeFlowSpecification upgradeFailurePage](self, "upgradeFailurePage");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)upgradeSuccessPageForWiFi
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  -[_ICQFlowSpecification pagesByIdentifier](self, "pagesByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("UpgradeSuccessWiFi"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "missing wireless network success page, falling back on generic", v7, 2u);
    }

    -[_ICQUpgradeFlowSpecification upgradeSuccessPage](self, "upgradeSuccessPage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)upgradeFailurePageForNetwork
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  -[_ICQFlowSpecification pagesByIdentifier](self, "pagesByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("UpgradeFailureNetwork"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "missing network failure page, falling back on generic", v7, 2u);
    }

    -[_ICQUpgradeFlowSpecification upgradeFailurePage](self, "upgradeFailurePage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)upgradePageForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "_upgradePageIdentifierForError:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQFlowSpecification pagesByIdentifier](self, "pagesByIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      _ICQGetLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "missing page spec for error: %@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_upgradePageIdentifierForError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFD808]);

  if (!v5)
  {
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      v8 = objc_msgSend(v3, "code");

      if (v8 == -1001)
      {
        v6 = CFSTR("UpgradeFailureNetwork");
        goto LABEL_10;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "code"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (objc_msgSend(v3, "code") == 6)
    v6 = 0;
  else
    v6 = CFSTR("UpgradeFailure");
LABEL_10:

  return v6;
}

- (NSDictionary)serverDict
{
  return self->_serverDict;
}

- (int64_t)offerType
{
  return self->_offerType;
}

- (void)setOfferType:(int64_t)a3
{
  self->_offerType = a3;
}

- (BOOL)needsWiFi
{
  return self->_needsWiFi;
}

- (void)setNeedsWiFi:(BOOL)a3
{
  self->_needsWiFi = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDict, 0);
}

@end

@implementation WLKServerConfigurationResponse

void __72__WLKServerConfigurationResponse_requiredRequestKeyValuePairsDictionary__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    NSLog(CFSTR("WLKServerConfigurationResponse: Unsupported type in rrkvp key:%@ obj:%@"), v8, v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (id)_requiredRequestKVPMap:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  WLKServerConfigurationResponse *v53;
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  -[WLKServerConfigurationResponse _routes](self, "_routes");
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v70;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v70 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "wlk_stringForKey:", CFSTR("url"));
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v58, "isEqualToString:", v11))
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "wlk_stringForKey:", CFSTR("requiredParamsType"));
          v43 = objc_claimAutoreleasedReturnValue();

          -[WLKServerConfigurationResponse _applicationProperties](self, "_applicationProperties");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "wlk_dictionaryForKey:", CFSTR("requiredParamsMap"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "wlk_dictionaryForKey:", v43);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v4;
          goto LABEL_37;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
      if (v6)
        continue;
      break;
    }
  }
  v53 = self;

  v54 = v4;
  v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v12 = v4;
  v13 = v58;
  v57 = v12;
  v59 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (v59)
  {
    v14 = *(_QWORD *)v66;
    v15 = CFSTR("url");
    do
    {
      for (j = 0; j != v59; ++j)
      {
        if (*(_QWORD *)v66 != v14)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
        objc_msgSend(v12, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "wlk_stringForKey:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "componentsSeparatedByString:", CFSTR("/"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("/"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count") && objc_msgSend(v21, "count"))
        {
          v22 = v15;
          v23 = v14;
          objc_msgSend(v19, "componentsSeparatedByString:", CFSTR("{"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "count"))
          {
            objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v58, "containsString:", v25);

            v13 = v58;
            if (v26)
              objc_msgSend(v55, "addObject:", v17);
          }

          v12 = v57;
          v14 = v23;
          v15 = v22;
        }

      }
      v59 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    }
    while (v59);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v11 = v55;
  v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
  if (!v27)
  {
    v29 = 0;
    v46 = 0;
    v49 = v11;
    self = v53;
    v4 = v54;
LABEL_38:

    v11 = v49;
    v41 = v58;
    goto LABEL_39;
  }
  v28 = v27;
  v29 = 0;
  v56 = *(_QWORD *)v62;
  while (2)
  {
    v60 = v29;
    for (k = 0; k != v28; ++k)
    {
      if (*(_QWORD *)v62 != v56)
        objc_enumerationMutation(v11);
      v31 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
      objc_msgSend(v12, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "wlk_stringForKey:", CFSTR("url"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "componentsSeparatedByString:", CFSTR("/"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "componentsSeparatedByString:", CFSTR("/"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "lastObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lastObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqualToString:", v37);

      if ((v38 & 1) != 0)
      {
        v47 = v31;

        v29 = v47;
        v12 = v57;
        v41 = v58;
        goto LABEL_35;
      }
      v39 = objc_msgSend(v35, "count");
      if (v39 == objc_msgSend(v34, "count"))
      {
        v40 = v31;

        v60 = v40;
      }
      v12 = v57;
      v41 = v58;

    }
    v28 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
    v29 = v60;
    if (v28)
      continue;
    break;
  }
LABEL_35:

  if (v29)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v29);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "wlk_stringForKey:", CFSTR("requiredParamsType"));
    v43 = objc_claimAutoreleasedReturnValue();

    self = v53;
    -[WLKServerConfigurationResponse _applicationProperties](v53, "_applicationProperties");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "wlk_dictionaryForKey:", CFSTR("requiredParamsMap"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "wlk_dictionaryForKey:", v43);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v54;
LABEL_37:
    v49 = v11;

    v11 = (id)v43;
    goto LABEL_38;
  }
  v46 = 0;
  self = v53;
  v4 = v54;
LABEL_39:

  if (!v46)
  {
    NSLog(CFSTR("WLKServerConfigurationResponse: requiredKeys is nil. Defaulting to Default required params type: %@."), v41);
    -[WLKServerConfigurationResponse _applicationProperties](self, "_applicationProperties");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "wlk_dictionaryForKey:", CFSTR("requiredParamsMap"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "wlk_dictionaryForKey:", CFSTR("Default"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v58;
  }

  return v46;
}

- (BOOL)isValid
{
  NSDate *expirationDate;
  NSDictionary *responseDictionary;
  double v5;
  BOOL v6;
  unint64_t environmentHash;
  void *v8;
  uint64_t v9;

  responseDictionary = self->_responseDictionary;
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    -[NSDate timeIntervalSinceNow](expirationDate, "timeIntervalSinceNow");
    v6 = v5 > 0.0;
  }
  else
  {
    v6 = 0;
  }
  environmentHash = self->_environmentHash;
  +[WLKUserEnvironment currentEnvironment](WLKUserEnvironment, "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  if (!responseDictionary)
    return 0;
  if (environmentHash == v9)
    return v6;
  return 0;
}

- (BOOL)isValidWithinExtendedExpiration:(double)a3
{
  NSDate *expirationDate;
  NSDictionary *responseDictionary;
  double v7;
  _BOOL4 v8;
  unint64_t environmentHash;
  void *v10;
  uint64_t v11;
  NSDate *v14;
  double v15;
  BOOL v16;

  responseDictionary = self->_responseDictionary;
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    -[NSDate timeIntervalSinceNow](expirationDate, "timeIntervalSinceNow");
    v8 = v7 > 0.0;
  }
  else
  {
    v8 = 0;
  }
  environmentHash = self->_environmentHash;
  +[WLKUserEnvironment currentEnvironment](WLKUserEnvironment, "currentEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");

  if (v8)
  {
    return responseDictionary && environmentHash == v11;
  }
  else
  {
    v14 = self->_expirationDate;
    if (v14)
    {
      -[NSDate timeIntervalSinceNow](v14, "timeIntervalSinceNow");
      v16 = v15 + a3 > 0.0;
    }
    else
    {
      v16 = 0;
    }
    if (environmentHash != v11)
      v16 = 0;
    return responseDictionary && v16;
  }
}

- (WLKServerConfigurationResponse)initWithCoder:(id)a3
{
  id v4;
  WLKServerConfigurationResponse *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;
  uint64_t v8;
  NSDate *expirationDate;
  void *v10;
  WLKServerConfigurationResponse *v11;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = -[WLKServerConfigurationResponse init](self, "init");
    if (v5)
    {
      objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("response"));
      v6 = objc_claimAutoreleasedReturnValue();
      responseDictionary = v5->_responseDictionary;
      v5->_responseDictionary = (NSDictionary *)v6;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
      v8 = objc_claimAutoreleasedReturnValue();
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v8;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environmentHash"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_environmentHash = objc_msgSend(v10, "unsignedIntegerValue");

    }
    self = v5;
    v11 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
    v11 = 0;
  }

  return v11;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)utsk
{
  void *v2;
  void *v3;

  -[WLKServerConfigurationResponse _utskProperties](self, "_utskProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_stringForKey:", CFSTR("utsk"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_utskProperties
{
  return -[NSDictionary wlk_dictionaryForKey:](self->_responseDictionary, "wlk_dictionaryForKey:", CFSTR("utskProps"));
}

- (NSString)vppaStatusString
{
  void *v2;
  void *v3;

  -[WLKServerConfigurationResponse _VPPAInfo](self, "_VPPAInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_stringForKey:", CFSTR("state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)utsc
{
  void *v2;
  void *v3;

  -[WLKServerConfigurationResponse _userProperties](self, "_userProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_stringForKey:", CFSTR("utsc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)requiredRequestKeyValuePairsDictionary
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  -[WLKServerConfigurationResponse _requiredRequestKVPMap](self, "_requiredRequestKVPMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_dictionaryForKey:", CFSTR("Default"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__WLKServerConfigurationResponse_requiredRequestKeyValuePairsDictionary__block_invoke;
  v6[3] = &unk_1E68A7B50;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  if (*((_BYTE *)v8 + 24))
  {
    v4 = v3;
  }
  else
  {
    NSLog(CFSTR("WLKServerConfigurationResponse: Error: Non-string value encountered in rrkvp dictionary. Returning nil."));
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (BOOL)isActiveUser
{
  void *v2;
  void *v3;
  char v4;

  -[WLKServerConfigurationResponse _userProperties](self, "_userProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_numberForKey:", CFSTR("activeUser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_requiredRequestKVPMap
{
  void *v2;
  void *v3;

  -[WLKServerConfigurationResponse _applicationProperties](self, "_applicationProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_dictionaryForKey:", CFSTR("requiredParamsMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_VPPAInfo
{
  void *v2;
  void *v3;

  -[WLKServerConfigurationResponse _userProperties](self, "_userProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_dictionaryForKey:", CFSTR("vppa"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_userProperties
{
  return -[NSDictionary wlk_dictionaryForKey:](self->_responseDictionary, "wlk_dictionaryForKey:", CFSTR("userProps"));
}

- (id)_applicationProperties
{
  return -[NSDictionary wlk_dictionaryForKey:](self->_responseDictionary, "wlk_dictionaryForKey:", CFSTR("applicationProps"));
}

void __73__WLKServerConfigurationResponse_requiredRequestKeyValuePairsDictionary___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    NSLog(CFSTR("WLKServerConfigurationResponse: Unsupported type in rrkvp key:%@ obj:%@"), v8, v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (id)requiredRequestKeyValuePairsDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  -[WLKServerConfigurationResponse _requiredRequestKVPMap:](self, "_requiredRequestKVPMap:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__WLKServerConfigurationResponse_requiredRequestKeyValuePairsDictionary___block_invoke;
  v8[3] = &unk_1E68A7B50;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (*((_BYTE *)v10 + 24))
  {
    v6 = v5;
  }
  else
  {
    NSLog(CFSTR("WLKServerConfigurationResponse: Error: Non-string value encountered in rrkvp dictionary. Returning nil."));
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)isValidIgnoringExpiration
{
  NSDictionary *responseDictionary;
  unint64_t environmentHash;
  void *v4;
  uint64_t v5;

  responseDictionary = self->_responseDictionary;
  environmentHash = self->_environmentHash;
  +[WLKUserEnvironment currentEnvironment](WLKUserEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return responseDictionary && environmentHash == v5;
}

- (unint64_t)environmentHash
{
  return self->_environmentHash;
}

- (id)_routes
{
  void *v2;
  void *v3;

  -[WLKServerConfigurationResponse _applicationProperties](self, "_applicationProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_dictionaryForKey:", CFSTR("routes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (WLKServerConfigurationResponse)initWithDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  WLKServerConfigurationResponse *v12;

  v4 = (void *)MEMORY[0x1E0CB36D8];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("response"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "JSONObjectWithData:options:error:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expirationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("environmentHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10 || v9 == 0)
  {
    v12 = 0;
  }
  else
  {
    self = -[WLKServerConfigurationResponse initWithServerResponseDictionary:expirationDate:environmentHash:](self, "initWithServerResponseDictionary:expirationDate:environmentHash:", v7, v8, objc_msgSend(v9, "unsignedIntegerValue"));
    v12 = self;
  }

  return v12;
}

- (WLKServerConfigurationResponse)initWithServerResponseDictionary:(id)a3 expirationDate:(id)a4 environmentHash:(unint64_t)a5
{
  id v8;
  id v9;
  WLKServerConfigurationResponse *v10;
  uint64_t v11;
  NSDictionary *responseDictionary;
  NSDate *v13;
  NSDate *expirationDate;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WLKServerConfigurationResponse;
  v10 = -[WLKServerConfigurationResponse init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    responseDictionary = v10->_responseDictionary;
    v10->_responseDictionary = (NSDictionary *)v11;

    v13 = (NSDate *)v9;
    if (!v13)
    {
      -[WLKServerConfigurationResponse _expirationDateFromResponse:](v10, "_expirationDateFromResponse:", v10->_responseDictionary);
      v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    expirationDate = v10->_expirationDate;
    v10->_expirationDate = v13;

    v10->_environmentHash = a5;
  }

  return v10;
}

- (id)configurationResponseByReplacingUTSK:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WLKServerConfigurationResponse *v7;
  void *v8;
  WLKServerConfigurationResponse *v9;

  v4 = a3;
  -[WLKServerConfigurationResponse responseDictionary](self, "responseDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wlk_dictionaryByReplacingOccurrencesOfKey:with:", CFSTR("utsk"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [WLKServerConfigurationResponse alloc];
  -[WLKServerConfigurationResponse expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WLKServerConfigurationResponse initWithServerResponseDictionary:expirationDate:environmentHash:](v7, "initWithServerResponseDictionary:expirationDate:environmentHash:", v6, v8, -[WLKServerConfigurationResponse environmentHash](self, "environmentHash"));

  return v9;
}

- (NSNumber)vppaSessionDurationInMillis
{
  void *v2;
  void *v3;

  -[WLKServerConfigurationResponse _VPPAInfo](self, "_VPPAInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_numberForKey:", CFSTR("sessionDurationInMillis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (int64_t)vppaStatus
{
  void *v2;
  void *v3;
  int64_t v4;

  -[WLKServerConfigurationResponse vppaStatusString](self, "vppaStatusString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("reminder")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("grace")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("expired")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSDictionary)features
{
  void *v2;
  void *v3;

  -[WLKServerConfigurationResponse _applicationProperties](self, "_applicationProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_dictionaryForKey:", CFSTR("featureEnablers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)naturalLanguageSearchProperty
{
  void *v2;
  char v3;

  -[WLKServerConfigurationResponse _applicationProperties](self, "_applicationProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wlk_BOOLForKey:defaultValue:", CFSTR("naturalLanguageSearchEnabled"), 0);

  return v3;
}

- (NSDictionary)searchReportConcernProps
{
  void *v2;
  void *v3;

  -[WLKServerConfigurationResponse _applicationProperties](self, "_applicationProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_dictionaryForKey:", CFSTR("searchReportConcernProps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)isFavoritesSyncEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[WLKServerConfigurationResponse _userProperties](self, "_userProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_numberForKey:", CFSTR("favoritesSyncEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)requiredRequestKeyValuePairsForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WLKServerConfigurationResponse _requiredRequestKVPMap](self, "_requiredRequestKVPMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wlk_dictionaryForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)serverRouteNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WLKServerRoute *v7;

  v4 = a3;
  -[WLKServerConfigurationResponse _routes](self, "_routes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wlk_dictionaryForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[WLKServerRoute initWithDictionary:routeName:]([WLKServerRoute alloc], "initWithDictionary:routeName:", v6, v4);
  else
    v7 = 0;

  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", self->_responseDictionary))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", self->_responseDictionary, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("response"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_expirationDate, CFSTR("expirationDate"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_environmentHash);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("environmentHash"));

    v6 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      -[WLKServerConfigurationResponse dictionaryRepresentation].cold.1();
    v6 = 0;
  }
  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[WLKServerConfigurationResponse environmentHash](self, "environmentHash");
  -[WLKServerConfigurationResponse responseDictionary](self, "responseDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  -[WLKServerConfigurationResponse expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WLKServerConfigurationResponse *v4;
  WLKServerConfigurationResponse *v5;
  WLKServerConfigurationResponse *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  unint64_t v18;

  v4 = (WLKServerConfigurationResponse *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[WLKServerConfigurationResponse expirationDate](self, "expirationDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLKServerConfigurationResponse expirationDate](v6, "expirationDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          if (!v9 || !v10)
            goto LABEL_17;
          v12 = objc_msgSend(v9, "isEqual:", v10);

          if ((v12 & 1) == 0)
            goto LABEL_18;
        }
        -[WLKServerConfigurationResponse responseDictionary](self, "responseDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLKServerConfigurationResponse responseDictionary](v6, "responseDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v14;
        v16 = v15;
        if (v9 == v16)
        {

LABEL_20:
          v18 = -[WLKServerConfigurationResponse environmentHash](self, "environmentHash");
          v13 = v18 == -[WLKServerConfigurationResponse environmentHash](v6, "environmentHash");
          goto LABEL_21;
        }
        v11 = v16;
        if (v9 && v16)
        {
          v17 = objc_msgSend(v9, "isEqual:", v16);

          if ((v17 & 1) != 0)
            goto LABEL_20;
LABEL_18:
          v13 = 0;
LABEL_21:

          goto LABEL_22;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    v13 = 0;
  }
LABEL_22:

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t environmentHash;
  NSDate *expirationDate;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)WLKServerConfigurationResponse;
  -[WLKServerConfigurationResponse description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  expirationDate = self->_expirationDate;
  environmentHash = self->_environmentHash;
  v12[0] = CFSTR("expiration");
  v12[1] = CFSTR("environment hash");
  v13[0] = expirationDate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", environmentHash);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSDictionary copy](self->_responseDictionary, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSDate copy](self->_expirationDate, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v4[4] = self->_environmentHash;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeObject:forKey:", self->_responseDictionary, CFSTR("response"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_environmentHash);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("environmentHash"));

}

- (id)_expirationDateFromResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[WLKServerConfigurationResponse _utskProperties](self, "_utskProperties", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wlk_numberForKey:", CFSTR("expirationInSeconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(unint64_t)objc_msgSend(v4, "unsignedIntegerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)isFromDiskCache
{
  return self->_fromDiskCache;
}

- (void)setFromDiskCache:(BOOL)a3
{
  self->_fromDiskCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

- (void)dictionaryRepresentation
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1B515A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[WLKServerConfigurationResponse]: Attempted to serialize an invalid JSON object.", v0, 2u);
}

@end

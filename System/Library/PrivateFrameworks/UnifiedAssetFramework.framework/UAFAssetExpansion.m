@implementation UAFAssetExpansion

- (id)getTrialFactorName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UAFAssetExpansion trialFactorTemplate](self, "trialFactorTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFAssetExpansion specializeTemplate:usages:](self, "specializeTemplate:usages:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getAutoAssetSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UAFAssetExpansion autoAssetSpecifierTemplate](self, "autoAssetSpecifierTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFAssetExpansion specializeTemplate:usages:](self, "specializeTemplate:usages:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)specializeTemplate:(id)a3 usages:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  char v12;

  v6 = a3;
  v7 = a4;
  if (v6 && -[UAFAssetExpansion isValidUsages:](self, "isValidUsages:", v7))
  {
    v12 = 0;
    +[UAFAssetExpansion specializeTemplate:usages:invalid:error:](UAFAssetExpansion, "specializeTemplate:usages:invalid:error:", v6, v7, &v12, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
    if (!v12)
      v10 = v8;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isValidUsages:(id)a3
{
  id v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSDictionary *usageValues;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[UAFAssetExpansion requiredUsageTypes](self, "requiredUsageTypes");
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_24;
      if (v7 == ++v9)
      {
        v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  if (v4)
  {
    usageValues = self->_usageValues;
    if (usageValues)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v5 = usageValues;
      v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v5);
            v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v4, "objectForKeyedSubscript:", v16, (_QWORD)v22);
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = (void *)v17;
              -[NSDictionary objectForKeyedSubscript:](self->_usageValues, "objectForKeyedSubscript:", v16);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "containsObject:", v18);

              if (!v20)
              {
                LOBYTE(v10) = 0;
                goto LABEL_24;
              }
            }
          }
          v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          LOBYTE(v10) = 1;
          if (v13)
            continue;
          break;
        }
      }
      else
      {
        LOBYTE(v10) = 1;
      }
LABEL_24:

      goto LABEL_25;
    }
  }
  LOBYTE(v10) = 1;
LABEL_25:

  return (char)v10;
}

- (NSArray)requiredUsageTypes
{
  return self->_requiredUsageTypes;
}

- (NSString)autoAssetSpecifierTemplate
{
  return self->_autoAssetSpecifierTemplate;
}

- (NSString)trialFactorTemplate
{
  return self->_trialFactorTemplate;
}

- (UAFAssetExpansion)initWithDictionary:(id)a3
{
  id v4;
  UAFAssetExpansion *v5;
  uint64_t v6;
  NSArray *requiredUsageTypes;
  uint64_t v8;
  NSString *trialFactorTemplate;
  uint64_t v10;
  NSString *trialFactorFallbackTemplate;
  uint64_t v12;
  NSString *autoAssetSpecifierTemplate;
  uint64_t v14;
  NSDictionary *usageValues;
  UAFAssetExpansion *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UAFAssetExpansion;
  v5 = -[UAFAssetExpansion init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequiredUsageTypes"));
    v6 = objc_claimAutoreleasedReturnValue();
    requiredUsageTypes = v5->_requiredUsageTypes;
    v5->_requiredUsageTypes = (NSArray *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TrialFactorTemplate"));
    v8 = objc_claimAutoreleasedReturnValue();
    trialFactorTemplate = v5->_trialFactorTemplate;
    v5->_trialFactorTemplate = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TrialFactorFallbackTemplate"));
    v10 = objc_claimAutoreleasedReturnValue();
    trialFactorFallbackTemplate = v5->_trialFactorFallbackTemplate;
    v5->_trialFactorFallbackTemplate = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AutoAssetSpecifierTemplate"));
    v12 = objc_claimAutoreleasedReturnValue();
    autoAssetSpecifierTemplate = v5->_autoAssetSpecifierTemplate;
    v5->_autoAssetSpecifierTemplate = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UsageValues"));
    v14 = objc_claimAutoreleasedReturnValue();
    usageValues = v5->_usageValues;
    v5->_usageValues = (NSDictionary *)v14;

    v16 = v5;
  }

  return v5;
}

+ (BOOL)isValid:(id)a3 validUsageTypes:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const __CFString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void **v42;
  uint64_t *v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;
  void *v56;
  _QWORD v57[2];
  _QWORD v58[2];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = 0;
  if (+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("RequiredUsageTypes"), objc_opt_class(), 0, a5))
  {
    if (v8)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RequiredUsageTypes"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v51;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v51 != v13)
              objc_enumerationMutation(v10);
            v15 = *(const __CFString **)(*((_QWORD *)&v50 + 1) + 8 * i);
            if ((objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
            {
              UAFGetLogCategory((id *)&UAFLogContextConfiguration);
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v60 = "+[UAFAssetExpansion isValid:validUsageTypes:error:]";
                v61 = 2112;
                v62 = CFSTR("RequiredUsageTypes");
                v63 = 2112;
                v64 = v15;
                v65 = 2112;
                v66 = v8;
                _os_log_impl(&dword_229282000, v17, OS_LOG_TYPE_DEFAULT, "%s %@ has value \"%@\" which isn't one of \"%@\", buf, 0x2Au);
              }

              goto LABEL_17;
            }
          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
          if (v12)
            continue;
          break;
        }
      }

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TrialFactorTemplate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AutoAssetSpecifierTemplate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        if (a5)
        {
          v39 = (void *)MEMORY[0x24BDD1540];
          if (*a5)
          {
            v57[0] = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("One of keys %@ and %@ must have a value"), CFSTR("TrialFactorTemplate"), CFSTR("AutoAssetSpecifierTemplate"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v57[1] = *MEMORY[0x24BDD1398];
            v58[0] = v40;
            v58[1] = *a5;
            v41 = (void *)MEMORY[0x24BDBCE70];
            v42 = (void **)v58;
            v43 = v57;
            v44 = 2;
          }
          else
          {
            v55 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("One of keys %@ and %@ must have a value"), CFSTR("TrialFactorTemplate"), CFSTR("AutoAssetSpecifierTemplate"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v40;
            v41 = (void *)MEMORY[0x24BDBCE70];
            v42 = &v56;
            v43 = &v55;
            v44 = 1;
          }
          objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", v42, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v45);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v60 = "+[UAFAssetExpansion isValid:validUsageTypes:error:]";
          v61 = 2112;
          v62 = CFSTR("TrialFactorTemplate");
          v63 = 2112;
          v64 = CFSTR("AutoAssetSpecifierTemplate");
          _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s One of keys %@ and %@ must have a value", buf, 0x20u);
        }
LABEL_17:
        v9 = 0;
LABEL_18:

        goto LABEL_42;
      }
    }
    v9 = 0;
    if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("TrialFactorTemplate"), objc_opt_class(), 0, a5))goto LABEL_42;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TrialFactorTemplate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TrialFactorTemplate"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RequiredUsageTypes"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = +[UAFAssetExpansion isValidTemplate:requiredUsageTypes:error:](UAFAssetExpansion, "isValidTemplate:requiredUsageTypes:error:", v20, v21, a5);

      if (!v22)
        goto LABEL_41;
    }
    v9 = 0;
    if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("TrialFactorFallbackTemplate"), objc_opt_class(), 0, a5))goto LABEL_42;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TrialFactorFallbackTemplate"));
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TrialFactorFallbackTemplate"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RequiredUsageTypes"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = +[UAFAssetExpansion isValidTemplate:requiredUsageTypes:error:](UAFAssetExpansion, "isValidTemplate:requiredUsageTypes:error:", v25, v26, a5);

      if (!v27)
        goto LABEL_41;
    }
    v9 = 0;
    if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("AutoAssetSpecifierTemplate"), objc_opt_class(), 0, a5))goto LABEL_42;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AutoAssetSpecifierTemplate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AutoAssetSpecifierTemplate"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RequiredUsageTypes"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = +[UAFAssetExpansion isValidTemplate:requiredUsageTypes:error:](UAFAssetExpansion, "isValidTemplate:requiredUsageTypes:error:", v29, v30, a5);

      if (!v31)
      {
LABEL_41:
        v9 = 0;
        goto LABEL_42;
      }
    }
    v9 = 0;
    if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("UsageValues"), objc_opt_class(), 0, a5))goto LABEL_42;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UsageValues"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v32 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v47;
      while (2)
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v47 != v34)
            objc_enumerationMutation(v10);
          v36 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
          -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || v8 && !objc_msgSend(v8, "containsObject:", v36))
          {

            v9 = 0;
            goto LABEL_52;
          }

        }
        v33 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        v9 = 1;
        if (v33)
          continue;
        break;
      }
    }
    else
    {
      v9 = 1;
    }
LABEL_52:

    goto LABEL_18;
  }
LABEL_42:

  return v9;
}

+ (id)getTemplatePart:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("{"));
  v5 = objc_msgSend(v3, "rangeOfString:", CFSTR("}"));
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || v5 == 0x7FFFFFFFFFFFFFFFLL || v5 <= v4)
  {
    objc_msgSend(v6, "addObject:", v3);
    v12 = v7;
  }
  else
  {
    objc_msgSend(v3, "substringWithRange:", 0, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);
    objc_msgSend(v3, "substringWithRange:", v4 + 1, v5 - (v4 + 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);
    v10 = v5 + 1;
    if (v10 == objc_msgSend(v3, "length"))
    {
      v11 = v7;
    }
    else
    {
      objc_msgSend(v3, "substringWithRange:", v10, objc_msgSend(v3, "length") - v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v13);
      v14 = v7;

    }
  }

  return v7;
}

+ (id)specializeTemplate:(id)a3 usages:(id)a4 invalid:(BOOL *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void **v25;
  uint64_t *v26;
  uint64_t v27;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  *a5 = 0;
  +[UAFAssetExpansion getTemplatePart:](UAFAssetExpansion, "getTemplatePart:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ((unint64_t)objc_msgSend(v10, "count") < 2
         || (objc_msgSend(v10, "objectAtIndexedSubscript:", 1),
             v12 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v9, "objectForKey:", v12),
             v13 = (void *)objc_claimAutoreleasedReturnValue(),
             v13,
             v12,
             v13))
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v10, "count") > 2)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[UAFAssetExpansion specializeTemplate:usages:invalid:error:](UAFAssetExpansion, "specializeTemplate:usages:invalid:error:", v18, v9, a5, a6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (*a5)
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(v17, "stringByAppendingString:", v19);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v11 = v17;
    }

  }
  else
  {
    if (a6)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      if (*a6)
      {
        v41[0] = *MEMORY[0x24BDD0FC8];
        v21 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("Templated usage for type \"%@\" is not in provided usages \"%@\"), v22, v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = *MEMORY[0x24BDD1398];
        v42[0] = v23;
        v42[1] = *a6;
        v24 = (void *)MEMORY[0x24BDBCE70];
        v25 = (void **)v42;
        v26 = v41;
        v27 = 2;
      }
      else
      {
        v39 = *MEMORY[0x24BDD0FC8];
        v29 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("Templated usage for type \"%@\" is not in provided usages \"%@\"), v22, v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v23;
        v24 = (void *)MEMORY[0x24BDBCE70];
        v25 = &v40;
        v26 = &v39;
        v27 = 1;
      }
      objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v30);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v34 = "+[UAFAssetExpansion specializeTemplate:usages:invalid:error:]";
      v35 = 2112;
      v36 = v32;
      v37 = 2112;
      v38 = v9;
      _os_log_impl(&dword_229282000, v31, OS_LOG_TYPE_DEFAULT, "%s Templated usage for type \"%@\" is not in provided usages \"%@\", buf, 0x20u);

    }
    v11 = 0;
    *a5 = 1;
  }

  return v11;
}

- (id)getTrialFactorFallbackName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UAFAssetExpansion trialFactorFallbackTemplate](self, "trialFactorFallbackTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[UAFAssetExpansion requiredUsageTypes](self, "requiredUsageTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {

            goto LABEL_14;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
    }

    v16 = 0;
    -[UAFAssetExpansion trialFactorFallbackTemplate](self, "trialFactorFallbackTemplate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFAssetExpansion specializeTemplate:usages:invalid:error:](UAFAssetExpansion, "specializeTemplate:usages:invalid:error:", v12, v4, &v16, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    if (!v16)
      v14 = v13;

  }
  else
  {
LABEL_14:
    v14 = 0;
  }

  return v14;
}

- (NSString)trialFactorFallbackTemplate
{
  return self->_trialFactorFallbackTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageValues, 0);
  objc_storeStrong((id *)&self->_autoAssetSpecifierTemplate, 0);
  objc_storeStrong((id *)&self->_trialFactorFallbackTemplate, 0);
  objc_storeStrong((id *)&self->_trialFactorTemplate, 0);
  objc_storeStrong((id *)&self->_requiredUsageTypes, 0);
}

+ (BOOL)isValidTemplate:(id)a3 requiredUsageTypes:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  +[UAFAssetExpansion getTemplatePart:](UAFAssetExpansion, "getTemplatePart:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") < 2
    || (objc_msgSend(v8, "objectAtIndexedSubscript:", 1),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v7, "containsObject:", v9),
        v9,
        (v10 & 1) != 0))
  {
    if ((unint64_t)objc_msgSend(v8, "count") >= 3)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[UAFAssetExpansion isValidTemplate:requiredUsageTypes:error:](UAFAssetExpansion, "isValidTemplate:requiredUsageTypes:error:", v12, v7, a5);

    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      if (*a5)
      {
        v34[0] = *MEMORY[0x24BDD0FC8];
        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("Templated usage type \"%@\" is not in required usage types %@"), v15, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = *MEMORY[0x24BDD1398];
        v35[0] = v16;
        v35[1] = *a5;
        v17 = (void *)MEMORY[0x24BDBCE70];
        v18 = (void **)v35;
        v19 = v34;
        v20 = 2;
      }
      else
      {
        v32 = *MEMORY[0x24BDD0FC8];
        v21 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("Templated usage type \"%@\" is not in required usage types %@"), v15, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v16;
        v17 = (void *)MEMORY[0x24BDBCE70];
        v18 = &v33;
        v19 = &v32;
        v20 = 1;
      }
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v27 = "+[UAFAssetExpansion isValidTemplate:requiredUsageTypes:error:]";
      v28 = 2112;
      v29 = v24;
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_229282000, v23, OS_LOG_TYPE_DEFAULT, "%s Templated usage type \"%@\" is not in required usage types %@", buf, 0x20u);

    }
    v11 = 0;
  }

  return v11;
}

- (void)setRequiredUsageTypes:(id)a3
{
  objc_storeStrong((id *)&self->_requiredUsageTypes, a3);
}

- (void)setTrialFactorTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_trialFactorTemplate, a3);
}

- (void)setTrialFactorFallbackTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_trialFactorFallbackTemplate, a3);
}

- (void)setAutoAssetSpecifierTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_autoAssetSpecifierTemplate, a3);
}

- (NSDictionary)usageValues
{
  return self->_usageValues;
}

- (void)setUsageValues:(id)a3
{
  objc_storeStrong((id *)&self->_usageValues, a3);
}

@end

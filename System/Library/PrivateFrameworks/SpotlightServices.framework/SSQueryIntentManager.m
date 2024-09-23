@implementation SSQueryIntentManager

+ (BOOL)isEnabled
{
  void *v2;
  char v3;
  char v4;

  +[SSQueryIntentManagerConfig sharedInstance](SSQueryIntentManagerConfig, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getBoolParameter:", CFSTR("IntentModelingEnabledMobile"));
  v4 = SSEnableSpotlightIntentModeling() & v3;

  return v4;
}

+ (void)setQueryIntentForQueryContext:(id)a3 sections:(id)a4 rankingInfo:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "isEnabled"))
  {
    +[SSQueryIntentManagerConfig sharedInstance](SSQueryIntentManagerConfig, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_intentForQueryContext:sections:", v13, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setIntentType:", objc_msgSend(v9, "intentType"));
    objc_msgSend(a1, "_suggestionConfigurationForIntent:queryContext:config:", v9, v13, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSuggestionConfig:", v11);

    objc_msgSend(a1, "_sectionConfigurationForIntentType:sections:config:", v9, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSectionConfig:", v12);

    objc_msgSend(v13, "setQueryIntent:", v10);
  }

}

+ (id)applySectionPolicyForQueryContext:(id)a3 sections:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  id v40;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryIntent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "intentType")
    && (objc_msgSend(v11, "sectionConfig"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    v47 = v10;
    v45 = v8;
    v44 = v5;
    v42 = v11;
    objc_msgSend(v11, "sectionConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v43 = v6;
    obj = v6;
    v14 = (void *)v48;
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v51)
    {
      v50 = *(_QWORD *)v57;
      v46 = v13;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v57 != v50)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v16, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sectionDisplayStrategies");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "intValue");

          switch(v20)
          {
            case 1:
              SSGeneralLog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v62 = v17;
                _os_log_impl(&dword_1B86C5000, v21, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Rule] Promoting section %@ due to intent.", buf, 0xCu);
              }

              objc_msgSend(v16, "setIsInitiallyHidden:", 0);
              v22 = v9;
              break;
            case 2:
              SSGeneralLog();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v62 = v17;
                _os_log_impl(&dword_1B86C5000, v23, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Rule] Demoting section %@ due to local intent.", buf, 0xCu);
              }

              v22 = v47;
              break;
            case 3:
              SSGeneralLog();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v62 = v17;
                _os_log_impl(&dword_1B86C5000, v24, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Rule] Hiding section %@ under show more due to strong local intent.", buf, 0xCu);
              }

              objc_msgSend(v16, "setIsInitiallyHidden:", 1);
              v22 = v14;
              break;
            case 5:
              v25 = v9;
              v26 = v7;
              SSGeneralLog();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v62 = v17;
                _os_log_impl(&dword_1B86C5000, v27, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Rule] Unhiding section %@ and results due to QU intent match", buf, 0xCu);
              }

              objc_msgSend(v16, "setIsInitiallyHidden:", 0);
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              objc_msgSend(v16, "resultSet");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
              if (v29)
              {
                v30 = v29;
                v31 = *(_QWORD *)v53;
                do
                {
                  for (j = 0; j != v30; ++j)
                  {
                    if (*(_QWORD *)v53 != v31)
                      objc_enumerationMutation(v28);
                    objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "rankingItem");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "setShouldHideUnderShowMore:", 0);

                  }
                  v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
                }
                while (v30);
              }

              v7 = v26;
              v9 = v25;
              v14 = (void *)v48;
              v13 = v46;
              goto LABEL_28;
            default:
LABEL_28:
              v34 = objc_msgSend(v16, "isInitiallyHidden");
              v22 = v14;
              if ((v34 & 1) == 0)
              {
                objc_msgSend(v16, "bundleIdentifier");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.spotlight.tophits")))
                {

                  v22 = v7;
                }
                else
                {
                  objc_msgSend(v16, "bundleIdentifier");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.searchd.suggestions"));

                  if (v37)
                    v22 = v7;
                  else
                    v22 = v45;
                }
              }
              break;
          }
          objc_msgSend(v22, "addObject:", v16);

        }
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v51);
    }

    objc_msgSend(v7, "addObjectsFromArray:", v9);
    v38 = v13;
    v8 = v45;
    objc_msgSend(v7, "addObjectsFromArray:", v45);
    v10 = v47;
    objc_msgSend(v7, "addObjectsFromArray:", v47);
    objc_msgSend(v7, "addObjectsFromArray:", v14);
    v39 = v14;
    v40 = v7;

    v6 = v43;
    v5 = v44;
    v11 = v42;
  }
  else
  {
    v40 = v6;
    v39 = (void *)v48;
  }

  return v40;
}

+ (id)_intentForQueryContext:(id)a3 sections:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  +[SSQueryIntentManager _prepareSectionInformation:intentHelper:](SSQueryIntentManager, "_prepareSectionInformation:intentHelper:", v6, v8);
  objc_msgSend(v8, "setIntentPrefixLength:", objc_msgSend(a1, "_prefixLengthModeling:", v7));
  v9 = objc_msgSend(a1, "_postRetrievalModeling:", v6);

  objc_msgSend(v8, "setIntentPostRetrieval:", v9);
  objc_msgSend(v8, "setIntentNextSection:", objc_msgSend(a1, "_nextSectionModeling:", v8));
  v10 = objc_msgSend(a1, "_queryUnderstandingModeling:intentHelper:", v7, v8);

  objc_msgSend(v8, "setIntentQU:", v10);
  objc_msgSend(a1, "_determineIntentAndStrength:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_determineIntentAndStrength:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setIntentType:", objc_msgSend(a1, "_ruleBasedIntent:", v4));
  if (!objc_msgSend(v4, "intentType"))
  {
    if (objc_msgSend(v4, "intentPostRetrieval"))
    {
      v5 = objc_msgSend(v4, "intentPostRetrieval");
    }
    else if (objc_msgSend(v4, "intentQU"))
    {
      v5 = objc_msgSend(v4, "intentQU");
    }
    else if (objc_msgSend(v4, "intentNextSection"))
    {
      v5 = objc_msgSend(v4, "intentNextSection");
    }
    else
    {
      v5 = objc_msgSend(v4, "intentPrefixLength");
    }
    objc_msgSend(v4, "setIntentType:", v5);
  }
  objc_msgSend(v4, "setIntentStrength:", +[SSQueryIntent intentStrength:](SSQueryIntent, "intentStrength:", objc_msgSend(v4, "intentType")));
  SSGeneralLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1B86C5000, v6, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling] %@", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

+ (int)_ruleBasedIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;

  v3 = a3;
  objc_msgSend(v3, "topHitResultBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.weather")) & 1) != 0)
  {
    objc_msgSend(v3, "retrievedBundleIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", CFSTR("com.apple.parsec.weather"));

    if (v6)
      v7 = 20;
    else
      v7 = 0;
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

+ (id)_suggestionConfigurationOverrideForQueryContext:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  BOOL v13;
  _BOOL4 v14;
  BOOL v15;
  _BOOL4 v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "getIntParameter:", CFSTR("IntentModelingSuppressSuggestionsUpToPrefixLength"));
  v9 = objc_msgSend(v7, "getIntParameter:", CFSTR("IntentModelingShowSuggestionsAsOfPrefixLength"));
  v10 = v9;
  if ((v8 & 0x80000000) == 0 || (v9 & 0x80000000) == 0)
  {
    objc_msgSend(v6, "searchString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if ((v12 & 0x80000000) == 0)
    {
      v13 = v8 < 0 || v8 < v12;
      v14 = !v13;
      v15 = v10 >= 0 && v10 <= v12;
      v16 = v15;
      if (v14 || v16)
      {
        v17 = (void *)objc_opt_new();
        objc_msgSend(v17, "setShowWebAsTypedSuggestion:", objc_msgSend(v7, "getBoolParameter:", CFSTR("IntentModelingShowWebAsTypedBaseline")));
        objc_msgSend(v17, "setLocalSuggestionQuota:", objc_msgSend(v7, "getIntParameter:", CFSTR("IntentModelingLocalSuggestionQuotaLocal")));
        if (objc_msgSend(a1, "_isJaJP:", v6))
        {
          objc_msgSend(v17, "setLocalSuggestionQuota:", objc_msgSend(v7, "getIntParameter:", CFSTR("IntentModelingLocalSuggestionQuotaBaseline")));
          if (!v14)
          {
LABEL_22:
            if (!v16)
              goto LABEL_19;
LABEL_26:
            objc_msgSend(v17, "setServerSuggestionQuota:", objc_msgSend(v7, "getIntParameter:", CFSTR("IntentModelingServerSuggestionQuotaBaseline")));
            goto LABEL_19;
          }
        }
        else if (!v14)
        {
          goto LABEL_22;
        }
        objc_msgSend(v17, "setServerSuggestionQuota:", 0);
        if (!v16)
          goto LABEL_19;
        goto LABEL_26;
      }
    }
  }
  v17 = 0;
LABEL_19:

  return v17;
}

+ (id)_suggestionConfigurationForIntent:(id)a3 queryContext:(id)a4 config:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_suggestionConfigurationOverrideForQueryContext:config:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = (void *)objc_opt_new();
    if (objc_msgSend(a1, "_isJaJP:", v9))
    {
      objc_msgSend(v11, "setShowWebAsTypedSuggestion:", objc_msgSend(v10, "getBoolParameter:", CFSTR("IntentModelingShowWebAsTypedBaseline")));
      objc_msgSend(v11, "setLocalSuggestionQuota:", objc_msgSend(v10, "getIntParameter:", CFSTR("IntentModelingLocalSuggestionQuotaBaseline")));
      v12 = objc_msgSend(v10, "getIntParameter:", CFSTR("IntentModelingServerSuggestionQuotaBaseline"));
      v13 = v11;
LABEL_4:
      objc_msgSend(v13, "setServerSuggestionQuota:", v12);
      goto LABEL_15;
    }
    objc_msgSend(v11, "setShowWebAsTypedSuggestion:", objc_msgSend(v10, "getBoolParameter:", CFSTR("IntentModelingShowWebAsTypedLocal")));
    objc_msgSend(v11, "setLocalSuggestionQuota:", objc_msgSend(v10, "getIntParameter:", CFSTR("IntentModelingLocalSuggestionQuotaLocal")));
    objc_msgSend(v11, "setServerSuggestionQuota:", objc_msgSend(v10, "getIntParameter:", CFSTR("IntentModelingServerSuggestionQuotaLocal")));
    if (objc_msgSend(v8, "intentStrength") == 2)
    {
      objc_msgSend(v11, "setShowWebAsTypedSuggestion:", objc_msgSend(v10, "getBoolParameter:", CFSTR("IntentModelingShowWebAsTypedLocalStrong")));
      goto LABEL_15;
    }
    v14 = objc_msgSend(v8, "intentType");
    if (v14 <= 0x12 && ((1 << v14) & 0x74008) != 0)
      objc_msgSend(v11, "setServerSuggestionQuota:", objc_msgSend(v10, "getIntParameter:", CFSTR("IntentModelingServerSuggestionQuotaServer")));
    if (objc_msgSend(v8, "intentType") != 15
      && objc_msgSend(v8, "resultSetHasAppSectionWithinTop3")
      && !objc_msgSend(v11, "serverSuggestionQuota")
      && objc_msgSend(v10, "getBoolParameter:", CFSTR("IntentModelingServerAppAccelerator")))
    {
      v13 = v11;
      v12 = 1;
      goto LABEL_4;
    }
  }
LABEL_15:
  v15 = v11;

  return v15;
}

+ (id)_sectionConfigurationForIntentType:(id)a3 sections:(id)a4 config:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString **v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  void *v37;
  id v38;
  id v39;
  id v40;
  id obj;
  unsigned int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v8 = a4;
  v40 = a5;
  if (_sectionConfigurationForIntentType_sections_config__onceToken != -1)
    dispatch_once(&_sectionConfigurationForIntentType_sections_config__onceToken, &__block_literal_global_11);
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSectionDisplayStrategies:", v10);
  v11 = v38;
  v12 = objc_msgSend(v38, "intentStrength");
  if (v12 == 1)
  {
    v13 = SSIntentModelingServerSectionDisplayStrategyLocal;
    goto LABEL_7;
  }
  if (v12 == 2)
  {
    v13 = SSIntentModelingServerSectionDisplayStrategyLocalStrong;
LABEL_7:
    v42 = objc_msgSend(v40, "getIntParameter:", *v13);
    goto LABEL_9;
  }
  v42 = 0;
LABEL_9:
  v39 = a1;
  if (objc_msgSend(v38, "intentType") == 20)
    v14 = objc_msgSend(v40, "getBoolParameter:", CFSTR("IntentModelingServerWeatherIntent"));
  else
    v14 = 0;
  if (objc_msgSend(a1, "isPhotosRelatedIntent:", objc_msgSend(v38, "intentType", v9)))
    v15 = objc_msgSend(v40, "getBoolParameter:", CFSTR("IntentModelingPhotosIntent"));
  else
    v15 = 0;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v8;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v16)
  {
    v17 = v16;
    v18 = v14 | v15;
    v19 = *(_QWORD *)v44;
    do
    {
      v20 = 0;
      v21 = v39;
      do
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v20);
        objc_msgSend(v22, "bundleIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42
          && objc_msgSend(v21, "_isParsecSection:", v23)
          && objc_msgSend(v21, "_demoteParsecForIntent:section:config:", v11, v22, v40))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v42);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, v23);

        }
        if (v18
          && (objc_msgSend((id)_sectionConfigurationForIntentType_sections_config___weatherSectionIdentifiersForPromotion, "containsObject:", v23)&& objc_msgSend(v11, "intentType") == 20|| objc_msgSend((id)_sectionConfigurationForIntentType_sections_config___photosSectionIdentifiersForPromotion, "containsObject:", v23)&& objc_msgSend(v21, "isPhotosRelatedIntent:", objc_msgSend(v11, "intentType"))))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, v23);

        }
        objc_msgSend(v10, "objectForKeyedSubscript:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {

        }
        else
        {
          objc_msgSend(v11, "quIntentLabel");
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = (void *)v27;
            objc_msgSend(v11, "quIntentLabel");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[SSRankingManager bundleIDSetsForQUIntent:](SSRankingManager, "bundleIDSetsForQUIntent:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "containsObject:", v23);

            v21 = v39;
            v11 = v38;

            if (v31)
              objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E6E97788, v23);
          }
        }

        ++v20;
      }
      while (v17 != v20);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      v17 = v32;
    }
    while (v32);
  }

  if ((objc_msgSend(v11, "resultSetHasTopHits") & 1) == 0 && v42 == 3)
  {
    v33 = objc_msgSend(v10, "count");
    v34 = v33 == objc_msgSend(v38, "resultSetSectionCount");
    v11 = v38;
    if (v34)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setSectionDisplayStrategies:", v35);

      v11 = v38;
    }
  }

  return v37;
}

void __75__SSQueryIntentManager__sectionConfigurationForIntentType_sections_config___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = CFSTR("com.apple.parsec.weather");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_sectionConfigurationForIntentType_sections_config___weatherSectionIdentifiersForPromotion;
  _sectionConfigurationForIntentType_sections_config___weatherSectionIdentifiersForPromotion = v2;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v8 = CFSTR("com.apple.searchd.syndicatedPhotos");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_sectionConfigurationForIntentType_sections_config___photosSectionIdentifiersForPromotion;
  _sectionConfigurationForIntentType_sections_config___photosSectionIdentifiersForPromotion = v6;

}

+ (int)_intentForSection:(id)a3 withTopHit:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  int v11;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "results");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(v7, "isInitiallyHidden");

      if ((v10 & 1) == 0)
      {
        objc_msgSend(v7, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "results");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
        {
          if (!objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"))
            || !objc_msgSend(v15, "topHit"))
          {
            v11 = 0;
LABEL_19:

            goto LABEL_5;
          }
          objc_msgSend(v15, "sectionBundleIdentifier");
          v16 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v16;
        }
        if (_intentForSection_withTopHit__onceToken != -1)
          dispatch_once(&_intentForSection_withTopHit__onceToken, &__block_literal_global_64);
        v17 = objc_msgSend(a1, "isServerResult:", v15);
        objc_msgSend((id)_intentForSection_withTopHit___bundleIntents, "objectForKey:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v17)
        {
          if (!v18)
          {
            v11 = 14;
            goto LABEL_18;
          }
        }
        else if (!v18)
        {
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.calculation")))
          {
            objc_msgSend(v15, "sectionHeader");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CONVERSION_SECTION_TITLE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "isEqualToString:", v22))
              v11 = 3;
            else
              v11 = 2;

          }
          else
          {
            if (!objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
            {
              v11 = 1;
              goto LABEL_18;
            }
            objc_msgSend(v15, "resultBundleId");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.safari.userTypedURL")))
              v11 = 19;
            else
              v11 = 13;
          }

LABEL_18:
          goto LABEL_19;
        }
        v11 = objc_msgSend(v18, "intValue");
        goto LABEL_18;
      }
    }
  }
  v11 = 0;
LABEL_5:

  return v11;
}

void __53__SSQueryIntentManager__intentForSection_withTopHit___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[20];
  _QWORD v3[21];

  v3[20] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.parsec.itunes.iosSoftware");
  v2[1] = CFSTR("com.apple.parsec.sports");
  v3[0] = &unk_1E6E977A0;
  v3[1] = &unk_1E6E977B8;
  v2[2] = CFSTR("com.apple.parsec.maps");
  v2[3] = CFSTR("com.apple.parsec.kg");
  v3[2] = &unk_1E6E977D0;
  v3[3] = &unk_1E6E977E8;
  v2[4] = CFSTR("com.apple.parsec.weather");
  v2[5] = CFSTR("com.apple.mobileslideshow");
  v3[4] = &unk_1E6E97800;
  v3[5] = &unk_1E6E97818;
  v2[6] = CFSTR("com.apple.mobilenotes");
  v2[7] = CFSTR("com.apple.DocumentsApp");
  v3[6] = &unk_1E6E97830;
  v3[7] = &unk_1E6E97830;
  v2[8] = CFSTR("com.apple.mobilemail");
  v2[9] = CFSTR("com.apple.MobileSMS");
  v3[8] = &unk_1E6E97848;
  v3[9] = &unk_1E6E97848;
  v2[10] = CFSTR("com.apple.mobilecal");
  v2[11] = CFSTR("com.apple.reminders");
  v3[10] = &unk_1E6E97860;
  v3[11] = &unk_1E6E97860;
  v2[12] = CFSTR("com.apple.searchd.syndicatedPhotos");
  v2[13] = CFSTR("com.apple.searchd.syndicatedPhotos.MobileSMS");
  v3[12] = &unk_1E6E97818;
  v3[13] = &unk_1E6E97818;
  v2[14] = CFSTR("com.apple.searchd.syndicatedPhotos.mobilenotes");
  v2[15] = CFSTR("com.apple.searchd.syndicatedPhotos.mobileslideshow");
  v3[14] = &unk_1E6E97818;
  v3[15] = &unk_1E6E97818;
  v2[16] = CFSTR("com.apple.Preferences");
  v2[17] = CFSTR("com.apple.shortcuts");
  v3[16] = &unk_1E6E97878;
  v3[17] = &unk_1E6E97890;
  v2[18] = CFSTR("com.apple.datadetector.quick_actions");
  v2[19] = CFSTR("com.apple.application");
  v3[18] = &unk_1E6E978A8;
  v3[19] = &unk_1E6E97788;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_intentForSection_withTopHit___bundleIntents;
  _intentForSection_withTopHit___bundleIntents = v0;

}

+ (int)_postRetrievalModeling:(id)a3
{
  void *v4;

  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "_intentForSection:withTopHit:", v4, 1);

  return (int)a1;
}

+ (int)_nextSectionModeling:(id)a3
{
  void *v4;

  objc_msgSend(a3, "nextSectionForIntent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "_intentForSection:withTopHit:", v4, 0);

  return (int)a1;
}

+ (int)_prefixLengthModeling:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4 < 0xB)
    return 1;
  else
    return 14;
}

+ (int)_queryUnderstandingModeling:(id)a3 intentHelper:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  float v20;
  float v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  uint64_t v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!_os_feature_enabled_impl())
    goto LABEL_44;
  if (_queryUnderstandingModeling_intentHelper__onceToken != -1)
    dispatch_once(&_queryUnderstandingModeling_intentHelper__onceToken, &__block_literal_global_88);
  objc_msgSend(v6, "queryUnderstandingOutput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 < 2)
    goto LABEL_44;
  objc_msgSend(v6, "queryUnderstandingOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kQPQUIntentLabels"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "queryUnderstandingOutput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kQPQUIntentScores"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "queryUnderstandingOutput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kQPQUIntentIds"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "intValue");

  objc_msgSend(v13, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v21 = v20;

  if (v18 < 1 || v21 < 0.9)
    goto LABEL_42;
  v53 = v11;
  objc_msgSend(v7, "setQuIntentLabel:", v16);
  objc_msgSend((id)_queryUnderstandingModeling_intentHelper___quIntentsLocalFiles, "objectForKeyedSubscript:", v16);
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    objc_msgSend(v7, "retrievedBundleIDs");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_queryUnderstandingModeling_intentHelper___quIntentsLocalFiles, "objectForKeyedSubscript:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend((id)v4, "containsObject:", v24);

    if ((v25 & 1) != 0)
    {
      v26 = 0;
      LODWORD(v4) = 10;
      goto LABEL_43;
    }
  }
  objc_msgSend((id)_queryUnderstandingModeling_intentHelper___quIntentsLocalPhotos, "objectForKeyedSubscript:", v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend((id)_queryUnderstandingModeling_intentHelper___quIntentsLocalPhotos, "objectForKeyedSubscript:", v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (!v29)
    {
      LODWORD(v4) = 9;
      goto LABEL_41;
    }
    v30 = v29;
    v52 = v13;
    v31 = *(_QWORD *)v59;
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v59 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v7, "retrievedBundleIDs", v52);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v33) = objc_msgSend(v34, "containsObject:", v33);

        if ((v33 & 1) != 0)
        {

          v26 = 0;
          LODWORD(v4) = 9;
          goto LABEL_33;
        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (v30)
        continue;
      break;
    }
    LODWORD(v4) = 9;
LABEL_30:
    v13 = v52;
LABEL_41:

    v11 = v53;
LABEL_42:
    v26 = 1;
    goto LABEL_43;
  }
  objc_msgSend((id)_queryUnderstandingModeling_intentHelper___quIntentsLocalCommunications, "objectForKeyedSubscript:", v16);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend((id)_queryUnderstandingModeling_intentHelper___quIntentsLocalCommunications, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (!v36)
    {
      LODWORD(v4) = 11;
      goto LABEL_41;
    }
    v37 = v36;
    v52 = v13;
    v38 = *(_QWORD *)v55;
    while (2)
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v55 != v38)
          objc_enumerationMutation(v28);
        v40 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend(v7, "retrievedBundleIDs", v52);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v40) = objc_msgSend(v41, "containsObject:", v40);

        if ((v40 & 1) != 0)
        {

          v26 = 0;
          LODWORD(v4) = 11;
LABEL_33:
          v13 = v52;
          v11 = v53;
          goto LABEL_43;
        }
      }
      v37 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      LODWORD(v4) = 11;
      if (v37)
        continue;
      goto LABEL_30;
    }
  }
  objc_msgSend((id)_queryUnderstandingModeling_intentHelper___quIntentsLocalEvents, "objectForKeyedSubscript:", v16);
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    objc_msgSend(v7, "retrievedBundleIDs");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_queryUnderstandingModeling_intentHelper___quIntentsLocalEvents, "objectForKeyedSubscript:", v16);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend((id)v4, "containsObject:", v44);

    if ((v45 & 1) != 0)
    {
      v26 = 0;
      LODWORD(v4) = 12;
      goto LABEL_43;
    }
  }
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("INTENT_SETTINGS_SEARCH")))
  {
    objc_msgSend(v7, "retrievedBundleIDs");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v46, "containsObject:", CFSTR("com.apple.Preferences"));

    if ((v4 & 1) != 0)
    {
      v26 = 0;
      LODWORD(v4) = 6;
      goto LABEL_43;
    }
  }
  objc_msgSend((id)_queryUnderstandingModeling_intentHelper___quIntentsLocalGeneric, "objectForKeyedSubscript:", v16);
  v48 = objc_claimAutoreleasedReturnValue();
  if (!v48)
    goto LABEL_52;
  v49 = (void *)v48;
  objc_msgSend(v7, "retrievedBundleIDs");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_queryUnderstandingModeling_intentHelper___quIntentsLocalGeneric, "objectForKeyedSubscript:", v16);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend((id)v4, "containsObject:", v50);

  if ((v51 & 1) != 0)
  {
    v26 = 0;
    LODWORD(v4) = 1;
  }
  else
  {
LABEL_52:
    if ((objc_msgSend(v16, "hasPrefix:", CFSTR("INTENT_FLIGHT")) & 1) == 0
      && (objc_msgSend(v16, "hasPrefix:", CFSTR("INTENT_HOTEL")) & 1) == 0
      && !objc_msgSend(v16, "hasPrefix:", CFSTR("INTENT_RESTAURANT"))
      || objc_msgSend(v7, "resultSetSectionCount") <= 0)
    {
      goto LABEL_42;
    }
    v26 = 0;
    LODWORD(v4) = 1;
  }
LABEL_43:

  if (v26)
LABEL_44:
    LODWORD(v4) = 0;

  return v4;
}

void __65__SSQueryIntentManager__queryUnderstandingModeling_intentHelper___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("com.apple.mobileslideshow");
  v22[1] = CFSTR("com.apple.searchd.syndicatedPhotos");
  v22[2] = CFSTR("com.apple.searchd.syndicatedPhotos.MobileSMS");
  v22[3] = CFSTR("com.apple.searchd.syndicatedPhotos.mobilenotes");
  v22[4] = CFSTR("com.apple.searchd.syndicatedPhotos.mobileslideshow");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_queryUnderstandingModeling_intentHelper___photosBundles;
  _queryUnderstandingModeling_intentHelper___photosBundles = v0;

  v20[0] = CFSTR("INTENT_PHOTO_SEARCH");
  v20[1] = CFSTR("INTENT_PHOTO_SEARCH_OCR");
  v21[0] = _queryUnderstandingModeling_intentHelper___photosBundles;
  v21[1] = _queryUnderstandingModeling_intentHelper___photosBundles;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_queryUnderstandingModeling_intentHelper___quIntentsLocalPhotos;
  _queryUnderstandingModeling_intentHelper___quIntentsLocalPhotos = v2;

  v18[0] = CFSTR("INTENT_NOTES_SEARCH");
  v18[1] = CFSTR("INTENT_FILE_SEARCH");
  v19[0] = CFSTR("com.apple.mobilenotes");
  v19[1] = CFSTR("com.apple.DocumentsApp");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_queryUnderstandingModeling_intentHelper___quIntentsLocalFiles;
  _queryUnderstandingModeling_intentHelper___quIntentsLocalFiles = v4;

  v16[0] = CFSTR("INTENT_MAIL_SEARCH");
  v16[1] = CFSTR("INTENT_MESSAGE_SEARCH");
  v17[0] = CFSTR("com.apple.mobilemail");
  v17[1] = CFSTR("com.apple.MobileSMS");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_queryUnderstandingModeling_intentHelper___quIntentsLocalCommunications;
  _queryUnderstandingModeling_intentHelper___quIntentsLocalCommunications = v6;

  v14[0] = CFSTR("INTENT_CALENDAR_SEARCH");
  v14[1] = CFSTR("INTENT_REMINDER_SEARCH");
  v15[0] = CFSTR("com.apple.mobilecal");
  v15[1] = CFSTR("com.apple.reminders");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_queryUnderstandingModeling_intentHelper___quIntentsLocalEvents;
  _queryUnderstandingModeling_intentHelper___quIntentsLocalEvents = v8;

  v12 = CFSTR("INTENT_SAFARI_SEARCH");
  v13 = CFSTR("com.apple.mobilesafari");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_queryUnderstandingModeling_intentHelper___quIntentsLocalGeneric;
  _queryUnderstandingModeling_intentHelper___quIntentsLocalGeneric = v10;

}

+ (void)_prepareSectionInformation:(id)a3 intentHelper:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResultSetHasTopHits:", 0);
  objc_msgSend(v6, "setResultSetHasSuggestions:", 0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v33;
    do
    {
      v11 = 0;
      v29 = v9;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
        objc_msgSend(v12, "bundleIdentifier", v29);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v13);

        objc_msgSend(v12, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.spotlight.tophits")) & 1) != 0)
        {
          objc_msgSend(v12, "results");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          if (v16)
          {
            objc_msgSend(v6, "setResultSetHasTopHits:", 1);
            objc_msgSend(v12, "results");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "firstObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "resultBundleId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setTopHitResultBundleId:", v19);

            goto LABEL_15;
          }
        }
        else
        {

        }
        objc_msgSend(v12, "bundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.searchd.suggestions"));

        if (v21)
        {
          objc_msgSend(v6, "setResultSetHasSuggestions:", 1);
        }
        else
        {
          objc_msgSend(v12, "bundleIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.parsec.itunes.iosSoftware"));

          if (v23 && (int)v29 + (int)v11 <= 2)
            objc_msgSend(v6, "setResultSetHasAppSectionWithinTop3:", 1);
        }
LABEL_15:
        objc_msgSend(v6, "nextSectionForIntent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24 || (objc_msgSend(v6, "resultSetHasSuggestions") & 1) == 0)
        {

        }
        else
        {
          objc_msgSend(v12, "bundleIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.searchd.suggestions"));

          if ((v26 & 1) == 0)
            objc_msgSend(v6, "setNextSectionForIntent:", v12);
        }
        ++v11;
      }
      while (v8 != v11);
      v9 = v29 + v8;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRetrievedBundleIDs:", v27);

  objc_msgSend(v6, "retrievedBundleIDs");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResultSetSectionCount:", objc_msgSend(v28, "count") - objc_msgSend(v6, "resultSetHasSuggestions"));

}

+ (BOOL)_demoteParsecForIntent:(id)a3 section:(id)a4 config:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverDomainDemotionExclusionSet");
  v12 = objc_claimAutoreleasedReturnValue();
  v16 = (!v12
      || (v13 = (void *)v12,
          objc_msgSend(v10, "serverDomainDemotionExclusionSet"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "containsObject:", v11),
          v14,
          v13,
          (v15 & 1) == 0))
     && (!objc_msgSend(a1, "isPhotosRelatedIntent:", objc_msgSend(v8, "intentType"))
      || (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.parsec.web_images")) & 1) == 0)
     && objc_msgSend(v8, "intentType") != 20
     && (!objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.parsec.maps"))
      || !objc_msgSend(v10, "getBoolParameter:", CFSTR("IntentModelingMapsPoiIntent"))
      || (objc_msgSend(a1, "_hasMapsPOIResults:", v9) & 1) == 0);

  return v16;
}

+ (BOOL)_hasMapsPOIResults:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.parsec.maps"));

  if (v6)
  {
    if (_hasMapsPOIResults__onceToken != -1)
      dispatch_once(&_hasMapsPOIResults__onceToken, &__block_literal_global_121);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "results", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(a1, "_getParsecMapsDetailedIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "hasPrefix:", _hasMapsPOIResults__mapsCategoryPrefix) & 1) != 0
            || (objc_msgSend(v12, "hasPrefix:", _hasMapsPOIResults__mapsChainBizPrefix) & 1) != 0)
          {

            v13 = 1;
            goto LABEL_17;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v13 = 0;
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v13 = 0;
    }
LABEL_17:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __43__SSQueryIntentManager__hasMapsPOIResults___block_invoke()
{
  void *v0;
  void *v1;

  v0 = (void *)_hasMapsPOIResults__mapsCategoryPrefix;
  _hasMapsPOIResults__mapsCategoryPrefix = (uint64_t)CFSTR("m:category:");

  v1 = (void *)_hasMapsPOIResults__mapsChainBizPrefix;
  _hasMapsPOIResults__mapsChainBizPrefix = (uint64_t)CFSTR("m:chainBusiness:");

}

+ (id)_getParsecMapsDetailedIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "inlineCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "inlineCard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      v5 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v3, "inlineCard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "resultIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v5;
}

+ (BOOL)_isParsecSection:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.parsec"));
}

+ (BOOL)isServerResult:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if ((SSResultTypeIsServer(objc_msgSend(v4, "type")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "resultBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(a1, "_isParsecSection:", v6);

  }
  return v5;
}

+ (BOOL)isPhotosRelatedIntent:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 8;
}

+ (BOOL)_isJaJP:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "keyboardPrimaryLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ja-JP"));

  return v4;
}

@end

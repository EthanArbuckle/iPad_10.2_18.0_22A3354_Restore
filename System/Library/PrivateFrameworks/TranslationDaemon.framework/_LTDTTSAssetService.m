@implementation _LTDTTSAssetService

+ (id)_queue
{
  if (_queue_onceToken_1 != -1)
    dispatch_once(&_queue_onceToken_1, &__block_literal_global_14);
  return (id)_queue__queue_1;
}

+ (int64_t)_preferredGender
{
  void *v2;
  int64_t v3;

  _AFPreferencesOutputVoice();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "gender");

  return v3;
}

+ (id)_preferredName
{
  void *v2;
  void *v3;

  _AFPreferencesOutputVoice();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)preferredVoiceType
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "_preferredGender");
  if (v2 == 1)
    return 1;
  else
    return 2 * (v2 == 2);
}

+ (int64_t)_genderForLocaleIdentifier:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "lt_localeWithLTIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _LTPreferredVoiceTypeForLocale(v3);
  v5 = 2;
  if (v4 != 2)
    v5 = 3;
  if (v4 == 1)
    v6 = 1;
  else
    v6 = v5;

  return v6;
}

+ (id)_ttsAssetForLanguage:(id)a3 name:(id)a4 gender:(int64_t)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDBCED8];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, &unk_251A50A70);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, &unk_251A50A88);
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, &unk_251A50AA0);

  }
  objc_msgSend(MEMORY[0x24BEA7A78], "turiTrial");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, &unk_251A50AB8);

  v13 = (void *)MEMORY[0x24BEA7A68];
  objc_msgSend(MEMORY[0x24BEA7A80], "gryphonVoice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  objc_msgSend(MEMORY[0x24BEA7A80], "vocalizerVoice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bestAssetOfTypes:matching:", v16, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)ttsAssetForLocaleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  BOOL v34;
  id v36;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_preferredName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "_genderForLocaleIdentifier:", v4);
  objc_msgSend(a1, "_availableTTSAssetsByLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _LTOSLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[_LTDTTSAssetService ttsAssetForLocaleIdentifier:].cold.3();
  if (!objc_msgSend(v9, "count"))
  {
    v43 = v9;
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "languageCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("-"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __51___LTDTTSAssetService_ttsAssetForLocaleIdentifier___block_invoke;
    v49[3] = &unk_251A12528;
    v14 = v12;
    v50 = v14;
    v15 = objc_msgSend(v13, "indexOfObjectPassingTest:", v49);
    v41 = v8;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = _LTOSLogAssets();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[_LTDTTSAssetService ttsAssetForLocaleIdentifier:].cold.2();
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v43 = (void *)v18;
    }

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = 0;
      v8 = v41;
      v9 = v43;
      goto LABEL_45;
    }
    v8 = v41;
    v9 = v43;
  }
  if ((unint64_t)(v7 - 1) >= 3)
    v20 = 0;
  else
    v20 = v7;
  objc_msgSend(a1, "_ttsAssetForLanguage:name:gender:", v5, v6, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = _LTOSLogAssets();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      +[_LTDTTSAssetService ttsAssetForLocaleIdentifier:].cold.1();
    v19 = v21;
  }
  else
  {
    v38 = v5;
    v40 = v4;
    v42 = v8;
    objc_msgSend(v9, "firstObject");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v44 = v9;
    v23 = v9;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v46;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v46 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v28, "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "caseInsensitiveCompare:", v6);

          v31 = objc_msgSend(v28, "gender");
          if (v30)
            v32 = v31 == v20;
          else
            v32 = 0;
          if (v32)
          {
            v36 = v28;

            v19 = v36;
            goto LABEL_43;
          }
          v33 = v31;
          if (v30)
            v34 = v19 == 0;
          else
            v34 = 0;
          if (v34)
            v19 = v28;
          if (v33 == v20 && v19 == 0)
            v19 = v28;
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        if (v25)
          continue;
        break;
      }
    }
LABEL_43:

    v5 = v38;
    v4 = v40;
    v8 = v42;
    v9 = v44;
    v21 = 0;
  }

LABEL_45:
  return v19;
}

+ (id)voiceForLocaleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "ttsAssetForLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "_siriVoiceForTTSAsset:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_6;
  }
  v7 = _LTOSLogAssets();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v9;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_2491B9000, v8, OS_LOG_TYPE_INFO, "SiriTTS cannot load voice for TTS asset %{public}@, attempt default voice for language %{public}@", (uint8_t *)&v13, 0x16u);

  }
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A58]), "initWithLanguage:name:", v4, 0);
  if (objc_msgSend(v6, "footprint"))
  {
LABEL_6:
    v6 = v6;
    v10 = v6;
  }
  else
  {
    v11 = _LTOSLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[_LTDTTSAssetService voiceForLocaleIdentifier:].cold.1();
    v10 = 0;
  }

  return v10;
}

+ (id)_siriVoiceForTTSAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v13;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "supportedLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "gender");
    if (v8 > 3)
      v9 = 0;
    else
      v9 = qword_249338680[v8];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A58]), "initWithLanguage:name:", v6, v7);
    if (v11 || (v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A58]), "initWithLanguage:name:", v6, 0)) != 0)
    {
      objc_msgSend(v11, "setGender:", v9);
    }
    else
    {
      v13 = _LTOSLogAssets();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[_LTDTTSAssetService _siriVoiceForTTSAsset:].cold.2();
      v11 = 0;
    }

  }
  else
  {
    v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[_LTDTTSAssetService _siriVoiceForTTSAsset:].cold.1(v10);
    v11 = 0;
  }

  return v11;
}

+ (id)_availableTTSAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEA7A68];
  objc_msgSend(MEMORY[0x24BEA7A80], "gryphonVoice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BEA7A80], "vocalizerVoice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listAssetsOfTypes:matching:", v6, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_availableTTSAssetsByLanguage
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_availableTTSAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    v8 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "supportedLanguages", (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v13)
            v15 = (void *)v13;
          else
            v15 = v8;
          v16 = v15;

          objc_msgSend(v16, "arrayByAddingObject:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v12);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  v18 = _LTOSLogAssets();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    +[_LTDTTSAssetService _availableTTSAssetsByLanguage].cold.1();

  return v3;
}

+ (id)installedAssetIdentifiers
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_availableTTSAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v20 = *(_QWORD *)v29;
    v21 = v4;
    do
    {
      v8 = 0;
      v22 = v6;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
        if (objc_msgSend(v9, "locallyAvailable"))
        {
          v23 = v8;
          objc_msgSend(v9, "supportedLanguages");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v10);
                v15 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "stringWithFormat:", CFSTR("TTS-%@"), v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v3, "addObject:", v17);
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v12);
          }

          v7 = v20;
          v4 = v21;
          v6 = v22;
          v8 = v23;
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

  v18 = _LTOSLogAssets();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    +[_LTDTTSAssetService installedAssetIdentifiers].cold.1();

  return v3;
}

+ (void)setAutoDownloadedAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isTTSModel", (_QWORD)v15))
        {
          +[_LTDTTSAssetModel modelFromAsset:](_LTDTTSAssetModel, "modelFromAsset:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "ttsAsset");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_siriVoiceForTTSAsset:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "setSubscribedVoices:", v5);
}

+ (void)setSiriTTSSession:(id)a3
{
  objc_storeStrong((id *)&_siriTTSSession, a3);
}

+ (SiriTTSDaemonSession)siriTTSSession
{
  void *v3;
  id v4;

  v3 = (void *)_siriTTSSession;
  if (_siriTTSSession)
  {
    objc_msgSend(a1, "setSiriTTSSession:", _siriTTSSession);
    v4 = v3;
  }
  else
  {
    v4 = (id)objc_opt_new();
    objc_msgSend(a1, "setSiriTTSSession:", v4);
  }
  return (SiriTTSDaemonSession *)v4;
}

+ (void)setSubscribedVoices:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[_LTDTTSAssetService setSubscribedVoices:].cold.1();
  objc_msgSend(a1, "siriTTSSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43___LTDTTSAssetService_setSubscribedVoices___block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a1;
  objc_msgSend(v6, "subscribeWithVoices:reply:", v4, v7);

}

+ (NSArray)subscribedVoices
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  _LTPreferencesInstalledLocales();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "voiceForLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v10 = _LTOSLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[_LTDTTSAssetService subscribedVoices].cold.1();

  return (NSArray *)v3;
}

+ (void)downloadVoiceAssetsForLanguagePair:(id)a3
{
  id v4;
  NSObject *v5;
  _LTDTTSAssetModel *v6;
  void *v7;
  void *v8;
  _LTDTTSAssetModel *v9;
  _LTDAssetModel *v10;
  _LTDTTSAssetModel *v11;
  void *v12;
  void *v13;
  _LTDTTSAssetModel *v14;
  _LTDAssetModel *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v16 = 138543362;
    v17 = v4;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "SiriTTS downloaded voice assets for pair %{public}@", (uint8_t *)&v16, 0xCu);
  }
  v6 = [_LTDTTSAssetModel alloc];
  objc_msgSend(v4, "sourceLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_LTDTTSAssetModel initWithAssetIdentifier:](v6, "initWithAssetIdentifier:", v8);

  v10 = -[_LTDAssetModel initWithProvider:]([_LTDAssetModel alloc], "initWithProvider:", v9);
  v11 = [_LTDTTSAssetModel alloc];
  objc_msgSend(v4, "targetLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_LTDTTSAssetModel initWithAssetIdentifier:](v11, "initWithAssetIdentifier:", v13);

  v15 = -[_LTDAssetModel initWithProvider:]([_LTDAssetModel alloc], "initWithProvider:", v14);
  objc_msgSend(a1, "downloadAsset:options:progress:completion:", v10, 0, 0, 0);
  objc_msgSend(a1, "downloadAsset:options:progress:completion:", v15, 0, 0, 0);

}

+ (void)downloadAsset:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a1, "_queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke;
  v16[3] = &unk_251A12638;
  v17 = v9;
  v18 = v11;
  v19 = v10;
  v20 = a1;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  dispatch_async(v12, v16);

}

+ (void)ttsAssetForLocaleIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2491B9000, v0, v1, "SiriTTS found candidate %{public}@ for locale: %{public}@");
  OUTLINED_FUNCTION_1_2();
}

+ (void)ttsAssetForLocaleIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "SiriTTS failed to locate TTS assets for language prefix %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)ttsAssetForLocaleIdentifier:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2491B9000, v0, v1, "SiriTTS candidates for locale %{public}@ are: %{public}@");
  OUTLINED_FUNCTION_1_2();
}

+ (void)voiceForLocaleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "SiriTTS cannot find default voice for language %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_siriVoiceForTTSAsset:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "SiriTTS cannot derive voice for nil TTS asset", v1, 2u);
}

+ (void)_siriVoiceForTTSAsset:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "SiriTTS failed to derive voice for language %{public}@ with name %{public}@");
  OUTLINED_FUNCTION_1_2();
}

+ (void)_availableTTSAssetsByLanguage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "SiriTTS available assets: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)installedAssetIdentifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "SiriTTS installed assets: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)setSubscribedVoices:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "SiriTTS set subscribed voices: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)subscribedVoices
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "SiriTTS get subscribed voices: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end

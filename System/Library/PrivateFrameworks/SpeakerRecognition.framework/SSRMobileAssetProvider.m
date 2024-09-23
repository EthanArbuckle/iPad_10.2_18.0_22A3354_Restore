@implementation SSRMobileAssetProvider

- (id)installedAssetOfType:(unint64_t)a3 forLanguageCode:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(MEMORY[0x24BE28488], "supportsSpeakerRecognitionAssets");
  if (a3 != 3 || v7)
  {
    if ((objc_msgSend(MEMORY[0x24BE28488], "isDarwinOS") & 1) == 0)
    {
      if (a3 != 8)
      {
LABEL_17:
        -[SSRMobileAssetProvider _installedMobileAssetOfType:forLanguage:](self, "_installedMobileAssetOfType:forLanguage:", a3, v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
        v9 = v22;
        objc_msgSend(v22, "getCSAssetOfType:", a3);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isVoiceTriggerRepromptAssetOverridingEnabled");

      if (v15)
      {
        objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fakeVoiceTriggerRepromptAssetPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "stringByDeletingLastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "fileExistsAtPath:", v9);

        if (v19)
        {
          v20 = *MEMORY[0x24BE28368];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
          {
            v25 = 136315138;
            v26 = "-[SSRMobileAssetProvider installedAssetOfType:forLanguageCode:]";
            _os_log_impl(&dword_2117D4000, v20, OS_LOG_TYPE_DEFAULT, "%s Retuning the override asset", (uint8_t *)&v25, 0xCu);
          }
          objc_msgSend(MEMORY[0x24BE28388], "assetForAssetType:resourcePath:configVersion:", 8, v17, CFSTR("override-asset"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_25;
        }

      }
      a3 = 8;
      -[SSRMobileAssetProvider _installedMobileAssetOfType:forLanguage:ofType:](self, "_installedMobileAssetOfType:forLanguage:ofType:", 8, v6, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
  }
  else
  {
    if (CSIsGibraltarMac())
      a3 = 7;
    else
      a3 = 0;
    if (!objc_msgSend(MEMORY[0x24BE28488], "isDarwinOS"))
      goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BE28478], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetForCurrentLanguageOfType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE28478], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "isEqualToString:", v11);

  if (v12)
  {
    v13 = v9;
    v9 = v13;
LABEL_24:
    v21 = v13;
    goto LABEL_25;
  }
  v23 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v25 = 136315138;
    v26 = "-[SSRMobileAssetProvider installedAssetOfType:forLanguageCode:]";
    _os_log_error_impl(&dword_2117D4000, v23, OS_LOG_TYPE_ERROR, "%s Locale doesn't match, return nil", (uint8_t *)&v25, 0xCu);
  }
  v21 = 0;
LABEL_25:

  return v21;
}

- (id)allInstalledAssetsOfType:(unint64_t)a3 forLanguage:(id)a4
{
  id v6;
  int v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  unint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(MEMORY[0x24BE28488], "supportsSpeakerRecognitionAssets");
  if (a3 == 3)
    v8 = v7;
  else
    v8 = 1;
  if (v8)
    v9 = a3;
  else
    v9 = 0;
  -[SSRMobileAssetProvider _buildAssetQueryForAssetType:](self, "_buildAssetQueryForAssetType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "returnTypes:", 2);
    v12 = objc_msgSend(v11, "queryMetaDataSync");
    objc_msgSend(v11, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRMobileAssetProvider _filteredAssets:forLanguage:](self, "_filteredAssets:forLanguage:", v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *MEMORY[0x24BE284B8];
    v16 = *MEMORY[0x24BE284B8];
    if ((v12 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "-[SSRMobileAssetProvider allInstalledAssetsOfType:forLanguage:]";
        v34 = 2114;
        v35 = (uint64_t)v11;
        v36 = 2050;
        v37 = v12;
        _os_log_error_impl(&dword_2117D4000, v15, OS_LOG_TYPE_ERROR, "%s Error running query: %{public}@, error: %{public}lu", buf, 0x20u);
      }
      v17 = 0;
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v15;
        v19 = objc_msgSend(v14, "count");
        objc_msgSend(v11, "queryParams");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v33 = "-[SSRMobileAssetProvider allInstalledAssetsOfType:forLanguage:]";
        v34 = 2050;
        v35 = v19;
        v36 = 2114;
        v37 = (uint64_t)v20;
        _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s ::: found %{public}lu installed assets for matching query: %{public}@", buf, 0x20u);

      }
      objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_6735);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = MEMORY[0x24BDAC760];
      v27 = 3221225472;
      v28 = __63__SSRMobileAssetProvider_allInstalledAssetsOfType_forLanguage___block_invoke_2;
      v29 = &unk_24CC860C0;
      v30 = v22;
      v31 = v9;
      v23 = v22;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", &v26);
      if (objc_msgSend(v23, "count", v26, v27, v28, v29))
        v24 = v23;
      else
        v24 = 0;
      v17 = v24;

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)getAssetProviderType
{
  return 0;
}

- (id)_getVoiceTriggerAssetTypeString
{
  return (id)objc_msgSend(MEMORY[0x24BE28458], "getVoiceTriggerAssetTypeString");
}

- (unint64_t)_getVoiceTriggerAssetCurrentCompatibilityVersion
{
  return objc_msgSend(MEMORY[0x24BE28458], "getVoiceTriggerCurrentCompatibilityVersion");
}

- (unint64_t)_getSSRAssetCurrentCompatibilityVersion
{
  return 1;
}

- (id)_getSSRAssetTypeString
{
  if (CSIsASMacWithAOP())
    return CFSTR("com.apple.MobileAsset.SpeakerRecognitionASMacAssets");
  else
    return CFSTR("com.apple.MobileAsset.SpeakerRecognitionAssets");
}

- (id)_getVTRepromptListAssetTypeString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("iPhone16,1"), CFSTR("iPhone16,2"), CFSTR("iPhone15,4"), CFSTR("iPhone15,5"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("iPhone14,7"), CFSTR("iPhone14,8"), CFSTR("iPhone15,2"), CFSTR("iPhone15,3"), CFSTR("iPhone14,6"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("iPhone14,2"), CFSTR("iPhone14,3"), CFSTR("iPhone14,4"), CFSTR("iPhone14,5"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((CSIsIPad() & 1) != 0)
  {
    v6 = CFSTR("com.apple.MobileAsset.VoiceTriggerRePromptListiPad");
  }
  else if ((objc_msgSend(v3, "containsObject:", v2) & 1) != 0)
  {
    v6 = CFSTR("com.apple.MobileAsset.VoiceTriggerRePromptListiPhone15x");
  }
  else if ((objc_msgSend(v4, "containsObject:", v2) & 1) != 0)
  {
    v6 = CFSTR("com.apple.MobileAsset.VoiceTriggerRePromptListiPhone14x");
  }
  else if (objc_msgSend(v5, "containsObject:", v2))
  {
    v6 = CFSTR("com.apple.MobileAsset.VoiceTriggerRePromptListiPhone13x");
  }
  else
  {
    v6 = CFSTR("com.apple.MobileAsset.VoiceTriggerRePromptListiPhone12AndOlder");
  }
  v7 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[SSRMobileAssetProvider _getVTRepromptListAssetTypeString]";
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v2;
    _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Fetched assetStr: %{public}@ for deviceType: %{public}@", buf, 0x20u);
  }

  return (id)v6;
}

- (unint64_t)_getVTRepromptListCurrentCompatibilityVersion
{
  return 1;
}

- (id)_getEndpointAssetTypeString
{
  if ((CSIsWatch() & 1) != 0)
    return CFSTR("com.apple.MobileAsset.SpeechEndpointAssetsWatch");
  if ((CSIsTV() & 1) != 0)
    return CFSTR("com.apple.MobileAsset.SpeechEndpointAssetsTV");
  if ((CSIsHorseman() & 1) != 0)
    return CFSTR("com.apple.MobileAsset.SpeechEndpointMarshAssets");
  if (CSIsOSX())
    return CFSTR("com.apple.MobileAsset.SpeechEndpointMacOSAssets");
  return CFSTR("com.apple.MobileAsset.SpeechEndpointAssets");
}

- (unint64_t)_getEndpointAssetCurrentCompatibilityVersion
{
  if ((CSIsWatch() & 1) != 0)
    return 3;
  if ((CSIsTV() & 1) != 0)
    return 5;
  if ((CSIsHorseman() & 1) != 0)
    return 2;
  if (CSIsOSX())
    return 6;
  return 3;
}

- (id)_buildAssetQueryForAssetType:(unint64_t)a3
{
  int v3;
  __CFString *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("com.apple.MobileAsset.VoiceTriggerAssetsMac");
  v6 = 15;
  switch(a3)
  {
    case 0uLL:
      -[SSRMobileAssetProvider _getVoiceTriggerAssetTypeString](self, "_getVoiceTriggerAssetTypeString");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = -[SSRMobileAssetProvider _getVoiceTriggerAssetCurrentCompatibilityVersion](self, "_getVoiceTriggerAssetCurrentCompatibilityVersion");
      goto LABEL_5;
    case 1uLL:
      -[SSRMobileAssetProvider _getEndpointAssetTypeString](self, "_getEndpointAssetTypeString");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = -[SSRMobileAssetProvider _getEndpointAssetCurrentCompatibilityVersion](self, "_getEndpointAssetCurrentCompatibilityVersion");
      goto LABEL_5;
    case 3uLL:
      -[SSRMobileAssetProvider _getSSRAssetTypeString](self, "_getSSRAssetTypeString");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = -[SSRMobileAssetProvider _getSSRAssetCurrentCompatibilityVersion](self, "_getSSRAssetCurrentCompatibilityVersion");
LABEL_5:
      v6 = v7;
      if (v5)
        goto LABEL_6;
      goto LABEL_8;
    case 7uLL:
      goto LABEL_6;
    case 8uLL:
      -[SSRMobileAssetProvider _getVTRepromptListAssetTypeString](self, "_getVTRepromptListAssetTypeString");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = 1;
      if (!v5)
        goto LABEL_8;
LABEL_6:
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", v5);
      v9 = *MEMORY[0x24BE66A88];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addKeyValuePair:with:", v9, v10);

      break;
    default:
LABEL_8:
      v11 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[SSRMobileAssetProvider _buildAssetQueryForAssetType:]";
        v15 = 1026;
        v16 = v3;
        _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s Failed to get assetString for assetType %{public}d", buf, 0x12u);
      }
      v8 = 0;
      break;
  }
  return v8;
}

- (id)_installedMobileAssetOfType:(unint64_t)a3 forLanguage:(id)a4
{
  return -[SSRMobileAssetProvider _installedMobileAssetOfType:forLanguage:ofType:](self, "_installedMobileAssetOfType:forLanguage:ofType:", a3, a4, 2);
}

- (id)_installedMobileAssetOfType:(unint64_t)a3 forLanguage:(id)a4 ofType:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[SSRMobileAssetProvider _buildAssetQueryForAssetType:](self, "_buildAssetQueryForAssetType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "returnTypes:", a5);
  v10 = objc_msgSend(v9, "queryMetaDataSync");
  objc_msgSend(v9, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRMobileAssetProvider _filteredAssets:forLanguage:](self, "_filteredAssets:forLanguage:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x24BE284B8];
  v14 = *MEMORY[0x24BE284B8];
  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315650;
      v21 = "-[SSRMobileAssetProvider _installedMobileAssetOfType:forLanguage:ofType:]";
      v22 = 2114;
      v23 = (uint64_t)v9;
      v24 = 2050;
      v25 = v10;
      _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s Error running asset-query: %{public}@, error: %{public}lu", (uint8_t *)&v20, 0x20u);
    }
    v15 = 0;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v13;
      v17 = objc_msgSend(v12, "count");
      objc_msgSend(v9, "queryParams");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "-[SSRMobileAssetProvider _installedMobileAssetOfType:forLanguage:ofType:]";
      v22 = 2050;
      v23 = v17;
      v24 = 2114;
      v25 = (uint64_t)v18;
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s ::: found %{public}lu assets matching query: %{public}@", (uint8_t *)&v20, 0x20u);

    }
    -[SSRMobileAssetProvider _findLatestInstalledAsset:](self, "_findLatestInstalledAsset:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_findLatestInstalledAsset:(id)a3
{
  uint64_t v3;
  __int128 v4;
  os_log_t *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  id v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  unint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  v5 = (os_log_t *)MEMORY[0x24BE284B8];
  if (v3)
  {
    v6 = v3;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v4 = 136315394;
    v19 = v4;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "state", v19);
        v12 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v19;
          v26 = "-[SSRMobileAssetProvider _findLatestInstalledAsset:]";
          v27 = 2050;
          v28 = v11;
          _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Asset state : %{public}ld", buf, 0x16u);
        }
        if (v11 <= 6 && ((1 << v11) & 0x6C) != 0)
        {
          if (v7)
          {
            if (objc_msgSend(v10, "isLatestCompareTo:", v7))
            {
              v14 = v10;

              v7 = v14;
            }
          }
          else
          {
            v7 = v10;
          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v15 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v7, "attributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v26 = "-[SSRMobileAssetProvider _findLatestInstalledAsset:]";
    v27 = 2114;
    v28 = (unint64_t)v17;
    _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s Chosen Asset %{public}@", buf, 0x16u);

  }
  return v7;
}

- (id)_filteredAssets:(id)a3 forLanguage:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    v12 = *MEMORY[0x24BE284D8];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "attributes", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "valueForKey:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (!v6 || objc_msgSend(v16, "containsObject:", v6))
          objc_msgSend(v7, "addObject:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v7;
}

void __63__SSRMobileAssetProvider_allInstalledAssetsOfType_forLanguage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "state") == 2
    || objc_msgSend(v3, "state") == 3
    || objc_msgSend(v3, "state") == 5
    || objc_msgSend(v3, "state") == 6)
  {
    objc_msgSend(v3, "getCSAssetOfType:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    }
    else
    {
      v5 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v6 = v5;
        objc_msgSend(v3, "attributes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 136315394;
        v9 = "-[SSRMobileAssetProvider allInstalledAssetsOfType:forLanguage:]_block_invoke_2";
        v10 = 2114;
        v11 = v7;
        _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, "%s ERR: Failed to asset for %{public}@", (uint8_t *)&v8, 0x16u);

      }
    }

  }
}

uint64_t __63__SSRMobileAssetProvider_allInstalledAssetsOfType_forLanguage___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "isLatestCompareTo:"))
    return -1;
  else
    return 1;
}

@end

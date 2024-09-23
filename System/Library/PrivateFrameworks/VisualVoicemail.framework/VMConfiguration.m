@implementation VMConfiguration

+ (NSArray)VMExpansionAvailableLocales
{
  return (NSArray *)&unk_24CC61CC0;
}

+ (NSArray)VMASRSupportedLocales
{
  return (NSArray *)&unk_24CC61CD8;
}

+ (BOOL)isSystemLocaleSupportedForTranscription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regionCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "languageCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@-%@"), v4, v3);

  }
  else
  {
    objc_msgSend(v2, "languageIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)objc_opt_class(), "VMExpansionAvailableLocales");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);
  vm_framework_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v5;
    v12 = 1024;
    v13 = v7;
    _os_log_impl(&dword_2116D5000, v8, OS_LOG_TYPE_DEFAULT, "isSystemLocaleSupportedForTranscription: System locale's language identifier = %@, is it enabled? %d", buf, 0x12u);
  }

  return v7;
}

+ (NSLocale)matchLocaleForTranscriptionLanguage
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend((id)objc_opt_class(), "isSystemLocaleSupportedForTranscription") & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "VMASRSupportedLocales");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:", v2, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    vm_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        objc_msgSend(v4, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138413058;
        v15 = v3;
        v16 = 2112;
        v17 = v2;
        v18 = 2112;
        v19 = v4;
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_2116D5000, v6, OS_LOG_TYPE_DEFAULT, "matchLocaleForTranscriptionLanguage: Mapping preferred languages %@ to languages supported by Siri: %@. Mapped languages: %@ Returning identifier %@", (uint8_t *)&v14, 0x2Au);

      }
      v9 = (void *)MEMORY[0x24BDBCEA0];
      objc_msgSend(v4, "firstObject");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localeWithLocaleIdentifier:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7)
      {
        v14 = 138412546;
        v15 = v3;
        v16 = 2112;
        v17 = v2;
        _os_log_impl(&dword_2116D5000, v6, OS_LOG_TYPE_DEFAULT, "matchLocaleForTranscriptionLanguage: No preferred languages %@ supported by Siri: %@.", (uint8_t *)&v14, 0x16u);
      }
      v10 = 0;
    }

    v11 = v10;
    v12 = v11;
  }
  else
  {
    vm_framework_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_2116D5000, v11, OS_LOG_TYPE_DEFAULT, "matchLocaleForTranscriptionLanguage: Transcription not supported for system locale", (uint8_t *)&v14, 2u);
    }
    v12 = 0;
  }

  return (NSLocale *)v12;
}

+ (NSLocale)localeForTranscriptionLanguage
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      vm_framework_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_2116D5000, v3, OS_LOG_TYPE_DEFAULT, "localeForTranscriptionLanguage: Flag lvmExpansionLiveOnEnabled enabled", (uint8_t *)&v20, 2u);
      }

      objc_msgSend((id)objc_opt_class(), "matchLocaleForTranscriptionLanguage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      vm_framework_log();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v6)
        {
          objc_msgSend(v4, "languageIdentifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412290;
          v21 = v7;
          _os_log_impl(&dword_2116D5000, v5, OS_LOG_TYPE_DEFAULT, "localeForTranscriptionLanguage: Returning %@", (uint8_t *)&v20, 0xCu);

        }
        v8 = v4;
LABEL_22:
        v10 = v8;
        goto LABEL_23;
      }
      if (v6)
      {
        objc_msgSend(v2, "languageIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v11;
        _os_log_impl(&dword_2116D5000, v5, OS_LOG_TYPE_DEFAULT, "localeForTranscriptionLanguage: No preferred languages supported by Siri. Defaulting to fallback current %@", (uint8_t *)&v20, 0xCu);

      }
    }
    v12 = v2;
    objc_msgSend(v12, "languageIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("en-CA"));

    if (v14)
    {
      vm_framework_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_2116D5000, v15, OS_LOG_TYPE_DEFAULT, "localeForTranscriptionLanguage: Mapping Canadian Siri to US Siri language for transcription", (uint8_t *)&v20, 2u);
      }

      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en-US"));
      v16 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v16;
    }
    vm_framework_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "languageIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v18;
      _os_log_impl(&dword_2116D5000, v17, OS_LOG_TYPE_DEFAULT, "localeForTranscriptionLanguage: Returning %@", (uint8_t *)&v20, 0xCu);

    }
    v8 = v12;
    goto LABEL_22;
  }
  vm_framework_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_2116D5000, v9, OS_LOG_TYPE_DEFAULT, "localeForTranscriptionLanguage: Error: nil system locale returned.", (uint8_t *)&v20, 2u);
  }

  v10 = 0;
LABEL_23:

  return (NSLocale *)v10;
}

+ (float)confidenceThreshold
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  NSObject *v10;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "confidenceThresholdFromAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = v5;
  }
  else
  {
    objc_msgSend(a1, "confidenceThresholdFromDefaultsForKey:", CFSTR("VoicemailTranscriptionConfidenceThreshold"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1, "confidenceThresholdFromDefaultsForKey:", CFSTR("VoicemailTranscriptionConfidenceThreshold"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v6 = v9;

    }
    else
    {
      v6 = 0.45096;
    }
  }
  vm_framework_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = v6;
    _os_log_impl(&dword_2116D5000, v10, OS_LOG_TYPE_DEFAULT, "Returning confidenceThreshold of %f", (uint8_t *)&v12, 0xCu);
  }

  return v6;
}

+ (float)confidenceLowQualityThreshold
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  NSObject *v10;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "confidenceLowQualityThresholdFromAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = v5;
  }
  else
  {
    objc_msgSend(a1, "confidenceThresholdFromDefaultsForKey:", CFSTR("VoicemailTranscriptionLowQualityConfidenceThreshold"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1, "confidenceThresholdFromDefaultsForKey:", CFSTR("VoicemailTranscriptionLowQualityConfidenceThreshold"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v6 = v9;

    }
    else
    {
      v6 = 0.6878;
    }
  }
  vm_framework_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = v6;
    _os_log_impl(&dword_2116D5000, v10, OS_LOG_TYPE_DEFAULT, "Returning confidenceLowQualityThreshold of %f", (uint8_t *)&v12, 0xCu);
  }

  return v6;
}

+ (float)confidenceSegmentThreshold
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  NSObject *v10;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "confidenceSegmentThresholdFromAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = v5;
  }
  else
  {
    objc_msgSend(a1, "confidenceThresholdFromDefaultsForKey:", CFSTR("VoicemailTranscriptionSegmentConfidenceThreshold"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1, "confidenceThresholdFromDefaultsForKey:", CFSTR("VoicemailTranscriptionSegmentConfidenceThreshold"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v6 = v9;

    }
    else
    {
      v6 = 0.3;
    }
  }
  vm_framework_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = v6;
    _os_log_impl(&dword_2116D5000, v10, OS_LOG_TYPE_DEFAULT, "Returning confidenceSegmentThreshold of %f", (uint8_t *)&v12, 0xCu);
  }

  return v6;
}

+ (id)confidenceThresholdFromDefaultsForKey:(id)a3
{
  CFPropertyListRef v3;
  void *v4;
  CFTypeID v5;

  v3 = CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.visualvoicemail"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = CFGetTypeID(v3);
    if (v5 != CFNumberGetTypeID())
    {
      CFRelease(v4);
      v4 = 0;
    }
  }
  return v4;
}

+ (id)confidenceThresholdFromAsset
{
  return (id)objc_msgSend(a1, "confidenceThresholdFromAssetForKey:", CFSTR("confidence-threshold"));
}

+ (id)confidenceLowQualityThresholdFromAsset
{
  return (id)objc_msgSend(a1, "confidenceThresholdFromAssetForKey:", CFSTR("low-quality-confidence-threshold"));
}

+ (id)confidenceSegmentThresholdFromAsset
{
  return (id)objc_msgSend(a1, "confidenceThresholdFromAssetForKey:", CFSTR("segment-confidence-threshold"));
}

+ (id)confidenceThresholdFromAssetForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  NSObject *v17;
  NSObject *v18;
  int v20;
  NSObject *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "localeForTranscriptionLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLanguageIdentifierFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "metadataDictionaryForSpeechAssetWithLanguage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_15;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("voicemail-confidence-parameters"));
  v10 = objc_claimAutoreleasedReturnValue();
  vm_framework_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v12)
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_2116D5000, v11, OS_LOG_TYPE_DEFAULT, "Could not find a confidence threshold dictionary in this asset metadata", (uint8_t *)&v20, 2u);
    }
    goto LABEL_14;
  }
  if (v12)
  {
    v20 = 138412290;
    v21 = v10;
    _os_log_impl(&dword_2116D5000, v11, OS_LOG_TYPE_DEFAULT, "Found confidence dictionary in asset: %@", (uint8_t *)&v20, 0xCu);
  }

  -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v13, "floatValue");
  objc_msgSend(v14, "numberWithFloat:");
  v11 = objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (-[NSObject floatValue](v11, "floatValue"), v15 < 0.0)
      || (-[NSObject floatValue](v11, "floatValue"), v16 > 1.0))
    {
      vm_framework_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[VMConfiguration confidenceThresholdFromAssetForKey:].cold.1((uint64_t)v11, v17);

LABEL_14:
LABEL_15:
      v11 = 0;
    }
  }
  vm_framework_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_2116D5000, v18, OS_LOG_TYPE_DEFAULT, "Returning threshold from asset of %@, for key %@", (uint8_t *)&v20, 0x16u);
  }

  return v11;
}

+ (id)metadataDictionaryForSpeechAssetWithLanguage:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  __int128 v32;
  void *v33;
  void *v34;
  id obj;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v3;
    _os_log_impl(&dword_2116D5000, v4, OS_LOG_TYPE_DEFAULT, "Fetching JSON transcription object for %@", buf, 0xCu);
  }

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", CFSTR("com.apple.MobileAsset.EmbeddedSpeech"));
  objc_msgSend(v5, "addKeyValuePair:with:", CFSTR("Language"), v3);
  objc_msgSend(v5, "returnTypes:", 1);
  v34 = v3;
  if (objc_msgSend(v5, "queryMetaDataSync"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "results");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7
      || (v8 = (void *)v7,
          objc_msgSend(v5, "results"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "count"),
          v9,
          v8,
          !v10))
    {
      vm_framework_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2116D5000, v11, OS_LOG_TYPE_DEFAULT, "No embedded speech assets were found", buf, 2u);
      }

    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v33 = v5;
    objc_msgSend(v5, "results");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v12)
    {
      v14 = v12;
      v6 = 0;
      v15 = *(_QWORD *)v39;
      *(_QWORD *)&v13 = 138412290;
      v32 = v13;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v17, "getLocalUrl", v32);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          vm_framework_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v43 = v3;
            v44 = 2112;
            v45 = v18;
            _os_log_impl(&dword_2116D5000, v19, OS_LOG_TYPE_DEFAULT, "Local url for language %@ is %@", buf, 0x16u);
          }

          if (v18)
          {
            objc_msgSend(v17, "attributes");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKey:", CFSTR("QuasarDir"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              objc_msgSend(v18, "URLByAppendingPathComponent:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "URLByAppendingPathComponent:", CFSTR("mini.json"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              v37 = v6;
              objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v23, 0, &v37);
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = v37;

              if (v24)
              {
                v36 = v25;
                objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v24, 0, &v36);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v6 = v36;

                if (v26)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    vm_framework_log();
                    v28 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_2116D5000, v28, OS_LOG_TYPE_DEFAULT, "Found appropriate JSON object in asset", buf, 2u);
                    }

                    vm_framework_log();
                    v29 = objc_claimAutoreleasedReturnValue();
                    v5 = v33;
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = v32;
                      v43 = v26;
                      _os_log_impl(&dword_2116D5000, v29, OS_LOG_TYPE_DEFAULT, "Found metadata for speech asset: %@", buf, 0xCu);
                    }
                    goto LABEL_42;
                  }
                }
                vm_framework_log();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v43 = v6;
                  v44 = 2112;
                  v45 = v26;
                  _os_log_error_impl(&dword_2116D5000, v27, OS_LOG_TYPE_ERROR, "Did not find a JSON object in asset, error %@. Did find %@", buf, 0x16u);
                }

                v3 = v34;
              }
              else
              {
                vm_framework_log();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v32;
                  v43 = v25;
                  _os_log_error_impl(&dword_2116D5000, v24, OS_LOG_TYPE_ERROR, "Skipping asset, no JSON data found file error %@", buf, 0xCu);
                }
                v6 = v25;
              }

            }
          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v14)
          continue;
        break;
      }
    }
    else
    {
      v6 = 0;
    }

    v5 = v33;
  }
  vm_framework_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    +[VMConfiguration metadataDictionaryForSpeechAssetWithLanguage:].cold.1(v29);
  v26 = 0;
LABEL_42:

  v30 = v26;
  return v30;
}

+ (void)confidenceThresholdFromAssetForKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2116D5000, a2, OS_LOG_TYPE_ERROR, "Confidence threshold failed a sanity check: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)metadataDictionaryForSpeechAssetWithLanguage:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2116D5000, log, OS_LOG_TYPE_ERROR, "Could not find an appropriate asset metadata object", v1, 2u);
}

@end

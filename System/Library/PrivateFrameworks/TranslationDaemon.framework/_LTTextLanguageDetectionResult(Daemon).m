@implementation _LTTextLanguageDetectionResult(Daemon)

- (id)initWithDetectedLocales:()Daemon unknownLanguages:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v34.receiver = a1;
  v34.super_class = (Class)&off_257885AA0;
  v8 = objc_msgSendSuper2(&v34, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v8, "setLocaleDetectionCount:", v9);

    v28 = v7;
    v10 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v8, "setUnsupportedLanguageCounts:", v10);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v29 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = 0;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "unsignedIntegerValue");

          if (v20 > v15)
          {
            v21 = v18;

            v14 = v21;
            v15 = v20;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    objc_msgSend(v8, "setDominantLocale:", v14);
    v22 = _LTOSLogLID();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      objc_msgSend(v8, "dominantLocale");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localeIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v25;
      _os_log_impl(&dword_2491B9000, v23, OS_LOG_TYPE_INFO, "Detection result via detected locales: %{public}@", buf, 0xCu);

    }
    v26 = v8;

    v7 = v28;
    v6 = v29;
  }

  return v8;
}

- (void)initWithDetectionCounts:()Daemon availableLocales:lowConfidenceLocales:strategy:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  BOOL v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  id v41;
  __CFString *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  id v46;
  __CFString *v47;
  id v48;
  uint64_t v50;
  void *v51;
  void *v52;
  id obj;
  uint64_t v54;
  id v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  objc_super v63;
  uint8_t buf[4];
  const __CFString *v65;
  __int16 v66;
  const __CFString *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v55 = a4;
  v11 = a5;
  v63.receiver = a1;
  v63.super_class = (Class)&off_257885AA0;
  v12 = objc_msgSendSuper2(&v63, sel_init);
  v13 = v12;
  if (v12)
  {
    v50 = a6;
    v51 = v11;
    v52 = v12;
    objc_msgSend(MEMORY[0x24BDD14E0], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14E0], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    objc_msgSend(v10, "allObjects");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v56 = 0;
      v54 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v60 != v54)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          _LTLanguageCodeToSupportedLocale();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v10;
          v23 = objc_msgSend(v10, "countForObject:", v20);
          v24 = v23;
          if (v23 > v18 || (v21 ? (v25 = v23 >= v18) : (v25 = 0), v25))
          {
            v26 = v20;

            v18 = v24;
            v56 = v26;
          }
          v10 = v22;
          if (v21)
          {
            for (; v24; --v24)
              objc_msgSend(v14, "addObject:", v21);
          }
          else
          {
            for (; v24; --v24)
              objc_msgSend(v15, "addObject:", v20);
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      }
      while (v17);
    }
    else
    {
      v56 = 0;
    }

    v13 = v52;
    objc_msgSend(v52, "setLocaleDetectionCount:", v14);
    objc_msgSend(v52, "setUnsupportedLanguageCounts:", v15);
    v27 = v56;
    _LTLanguageCodeToSupportedLocale();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50 == 2)
    {
      if (objc_msgSend(v56, "isEqualToString:", CFSTR("en")))
      {
        objc_msgSend(v10, "allObjects");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x24BDAC760];
        v57[1] = 3221225472;
        v57[2] = __113___LTTextLanguageDetectionResult_Daemon__initWithDetectionCounts_availableLocales_lowConfidenceLocales_strategy___block_invoke;
        v57[3] = &unk_251A13B50;
        v58 = v10;
        objc_msgSend(v29, "sortedArrayWithOptions:usingComparator:", 16, v57);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v30, "count") >= 2)
        {
          v31 = v10;
          objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("hi"));

          if (v33)
          {
            v34 = _LTOSLogLID();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              v65 = CFSTR("en");
              v66 = 2114;
              v67 = CFSTR("hi");
              _os_log_impl(&dword_2491B9000, v34, OS_LOG_TYPE_INFO, "Overriding dominant language from %{public}@ to %{public}@", buf, 0x16u);
            }
            _LTLanguageCodeToSupportedLocale();
            v35 = objc_claimAutoreleasedReturnValue();

            v28 = (void *)v35;
          }
          v10 = v31;
          v27 = v56;
        }

      }
      v13 = v52;
    }
    v11 = v51;
    objc_msgSend(v13, "setDominantLocale:", v28);
    v36 = (void *)objc_msgSend(v51, "copy");
    objc_msgSend(v13, "setLowConfidenceLocales:", v36);

    objc_msgSend((id)objc_opt_class(), "sendAnalytics:isSupported:", v27, v28 != 0);
    if (objc_msgSend(v51, "count"))
    {
      objc_msgSend(v51, "_ltCompactMap:", &__block_literal_global_25);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v38 = _LTOSLogLID();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = v38;
        objc_msgSend(v13, "dominantLocale");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localeIdentifier");
        v41 = v10;
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v42;
        v66 = 2114;
        v67 = v37;
        _os_log_impl(&dword_2491B9000, v39, OS_LOG_TYPE_INFO, "Detection result via detection counts: %{public}@; however there are low-confidence locales: %{public}@",
          buf,
          0x16u);

        v10 = v41;
        v27 = v56;

      }
    }
    else
    {
      v43 = _LTOSLogLID();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = v43;
        objc_msgSend(v13, "dominantLocale");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localeIdentifier");
        v46 = v10;
        v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v65 = v47;
        _os_log_impl(&dword_2491B9000, v44, OS_LOG_TYPE_INFO, "Detection result via detection counts: %{public}@", buf, 0xCu);

        v10 = v46;
        v27 = v56;

      }
    }
    v48 = v13;

  }
  return v13;
}

- (id)initWithScorer:()Daemon
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&off_257885AA0;
  v5 = objc_msgSendSuper2(&v16, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD14E0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocaleDetectionCount:", v6);

    objc_msgSend(MEMORY[0x24BDD14E0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUnsupportedLanguageCounts:", v7);

    objc_msgSend(v4, "weightedLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDominantLocale:", v8);
    v9 = (void *)objc_opt_class();
    objc_msgSend(v8, "languageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendAnalytics:isSupported:", v10, v8 != 0);

    v11 = _LTOSLogLID();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      objc_msgSend(v8, "localeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_2491B9000, v12, OS_LOG_TYPE_INFO, "Detection result via weighted locale: %{public}@", buf, 0xCu);

    }
    v14 = v5;

  }
  return v5;
}

+ (void)sendAnalytics:()Daemon isSupported:
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

@end

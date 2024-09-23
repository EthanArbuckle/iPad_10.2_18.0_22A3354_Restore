@implementation VSLocalizedString

+ (id)localizedStringForKey:(id)a3 language:(id)a4 table:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v34 = a5;
  VSGetLogDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v42 = v7;
    v43 = 2114;
    v44 = v8;
    _os_log_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_INFO, "Localize for '%@' in '%{public}@'", buf, 0x16u);
  }

  v33 = v7;
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("_MALE"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/VoiceServices.framework/"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v10, "localizations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v8;
  v40 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredLocalizationsFromArray:forPreferences:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = v14;
  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v16)
    goto LABEL_13;
  v17 = v16;
  v18 = *(_QWORD *)v36;
  while (2)
  {
    v19 = 0;
    do
    {
      if (*(_QWORD *)v36 != v18)
        objc_enumerationMutation(v15);
      objc_msgSend(v10, "URLForResource:withExtension:subdirectory:localization:", v34, CFSTR("strings"), 0, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v19));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v20);
      v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, "objectForKeyedSubscript:", v33);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v27 = v33;
          v28 = v33;
        }
        else
        {
          objc_msgSend(v22, "objectForKeyedSubscript:", v32);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
            goto LABEL_11;
          v28 = v32;
          v27 = v33;
        }
        objc_msgSend(v22, "objectForKeyedSubscript:", v28);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v25 = v15;
        goto LABEL_18;
      }
LABEL_11:

      ++v19;
    }
    while (v17 != v19);
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v17)
      continue;
    break;
  }
LABEL_13:

  VSGetLogDefault();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v29 = v31;
    v42 = v31;
    v43 = 2112;
    v27 = v33;
    v44 = v33;
    _os_log_error_impl(&dword_1DE15E000, v25, OS_LOG_TYPE_ERROR, "Unable to find '%{public}@' localized string for key '%@', return empty string", buf, 0x16u);
    v26 = &stru_1EA8B0C98;
  }
  else
  {
    v26 = &stru_1EA8B0C98;
    v27 = v33;
LABEL_18:
    v29 = v31;
  }

  return v26;
}

+ (id)predefinedStringForKey:(id)a3 language:(id)a4 table:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  NSObject *v19;
  _BOOL4 v20;
  __CFString *v21;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  VSGetLogDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v23 = 138412546;
    v24 = v8;
    v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_1DE15E000, v11, OS_LOG_TYPE_INFO, "Searching predefined string for '%@' in '%{public}@'", (uint8_t *)&v23, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathForResource:ofType:inDirectory:", v9, CFSTR("strings"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v13);
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", v8);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v21 = (__CFString *)v17;
      goto LABEL_14;
    }
  }
  v18 = objc_msgSend(v9, "isEqualToString:", CFSTR("en-US"));
  VSGetLogDefault();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  if ((v18 & 1) == 0)
  {
    if (v20)
    {
      v23 = 138543618;
      v24 = v9;
      v25 = 2112;
      v26 = v8;
      _os_log_error_impl(&dword_1DE15E000, v19, OS_LOG_TYPE_ERROR, "Unable to find '%{public}@' predefined string for key '%@', return default en-US string", (uint8_t *)&v23, 0x16u);
    }

    objc_msgSend(a1, "predefinedStringForKey:language:table:", v8, CFSTR("en-US"), v10);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (v20)
  {
    v23 = 138543618;
    v24 = v9;
    v25 = 2112;
    v26 = v8;
    _os_log_error_impl(&dword_1DE15E000, v19, OS_LOG_TYPE_ERROR, "Unable to find '%{public}@' predefined string for key '%@', return empty string", (uint8_t *)&v23, 0x16u);
  }

  v21 = &stru_1EA8B0C98;
LABEL_14:

  return v21;
}

+ (id)appendRandomizationKey:(id)a3 withCount:(int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), v5, (rand() % a4 + 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)localizedInterstitialStringForKey:(id)a3 language:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;

  v6 = (__CFString *)a3;
  v7 = a4;
  if (v6 == CFSTR("VOICE_SERVICES_NETWORK_STALL"))
  {
    objc_msgSend(a1, "appendRandomizationKey:withCount:", CFSTR("VOICE_SERVICES_NETWORK_STALL"), 3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "localizedStringForKey:language:table:", v6, v7, CFSTR("Interstitials"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)localizedOOBStringForKey:(id)a3 language:(id)a4
{
  return (id)objc_msgSend(a1, "predefinedStringForKey:language:table:", a3, a4, CFSTR("DeviceSetup"));
}

@end

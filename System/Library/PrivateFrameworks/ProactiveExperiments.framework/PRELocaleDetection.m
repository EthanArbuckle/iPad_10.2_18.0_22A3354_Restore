@implementation PRELocaleDetection

- (PRELocaleDetection)init
{
  void *v3;
  void *v4;
  PRELocaleDetection *v5;

  objc_msgSend(MEMORY[0x1E0D70A90], "userLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PRELocaleDetection initWithLanguageLimit:withPreferredLocales:](self, "initWithLanguageLimit:withPreferredLocales:", 0, v4);

  return v5;
}

- (PRELocaleDetection)initWithLanguageLimit:(unint64_t)a3 withPreferredLocales:(id)a4
{
  id v5;
  PRELocaleDetection *v6;
  PRELocaleDetection *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDictionary *preferredLocales;
  uint64_t v21;
  _PASLRUCache *lastConfidentLocaleForSender;
  void *context;
  PRELocaleDetection *v25;
  id v26;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PRELocaleDetection;
  v6 = -[PRELocaleDetection init](&v34, sel_init);
  v7 = v6;
  if (v6)
  {
    v25 = v6;
    context = (void *)MEMORY[0x1C3BD39FC]();
    v8 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v26 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v31;
      do
      {
        v13 = 0;
        v28 = v10;
        do
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(obj);
          if (a3 - 1 >= v11)
          {
            v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v13);
            objc_msgSend(MEMORY[0x1E0D70A90], "languageForLocaleIdentifier:", v14, context);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("@"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "firstObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v17);
              ++v11;
            }
            v10 = v28;

          }
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v10);
    }

    v7 = v25;
    v25->_languageLimit = a3;
    v19 = objc_msgSend(v8, "copy");
    preferredLocales = v25->_preferredLocales;
    v25->_preferredLocales = (NSDictionary *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 50);
    lastConfidentLocaleForSender = v25->_lastConfidentLocaleForSender;
    v25->_lastConfidentLocaleForSender = (_PASLRUCache *)v21;

    objc_autoreleasePoolPop(context);
    v5 = v26;
  }

  return v7;
}

- (id)_getPreferredLocales
{
  return self->_preferredLocales;
}

- (id)_userLanguageDetectedFromString:(id)a3 preferredLocales:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  float v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend((id)objc_opt_class(), "languageTagForLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13), (_QWORD)v27);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v11);
  }

  pre_locale_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v16;
    _os_log_impl(&dword_1C35DB000, v15, OS_LOG_TYPE_DEFAULT, "Setting language tags as constraints: %@", buf, 0xCu);

  }
  v17 = (void *)objc_opt_new();
  v18 = v17;
  if (v8)
    objc_msgSend(v17, "setLanguageConstraints:", v8);
  objc_msgSend(v18, "processString:", v6, (_QWORD)v27);
  objc_msgSend(v18, "languageHypothesesWithMaximum:", self->_languageLimit);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dominantLanguage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 == (void *)*MEMORY[0x1E0CCDFB8])
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    pre_locale_handle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = &unk_1E7DA4918;
      if (v21)
        v23 = v21;
      *(_DWORD *)buf = 138412546;
      v32 = v20;
      v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_1C35DB000, v22, OS_LOG_TYPE_DEFAULT, "The probability for this message being for language %@ is %@", buf, 0x16u);
    }

    objc_msgSend(v21, "floatValue");
    if (v24 <= 0.95)
      v25 = 0;
    else
      v25 = v20;

  }
  return v25;
}

- (id)_userLocaleDetectedFromString:(id)a3
{
  NSDictionary *preferredLocales;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  preferredLocales = self->_preferredLocales;
  v5 = a3;
  -[NSDictionary allKeys](preferredLocales, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRELocaleDetection _userLanguageDetectedFromString:preferredLocales:](self, "_userLanguageDetectedFromString:preferredLocales:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_preferredLocales, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      pre_locale_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_1C35DB000, v9, OS_LOG_TYPE_DEFAULT, "Found a directly matching locale based on locale identifier: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      -[PRELocaleDetection _bestLocaleForLanguageTag:](self, "_bestLocaleForLanguageTag:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v11, "length"))
      {
        v10 = 0;
        goto LABEL_11;
      }
      pre_locale_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_1C35DB000, v9, OS_LOG_TYPE_DEFAULT, "Found a matching locale: %@", (uint8_t *)&v13, 0xCu);
      }
      v8 = v11;
    }

    v10 = v8;
    v11 = v10;
LABEL_11:

    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)isLanguageMismatchedForMessage:(id)a3 withLocaleIdentifier:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  LOBYTE(v8) = 0;
  if (a3 && v6)
  {
    -[PRELocaleDetection _userLanguageDetectedFromString:preferredLocales:](self, "_userLanguageDetectedFromString:preferredLocales:", a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend((id)objc_opt_class(), "languageTagForLocaleIdentifier:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
      pre_locale_handle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_1C35DB000, v11, OS_LOG_TYPE_DEFAULT, "Detected language for isLanguageMismatchedForMessage:withLocaleIdentifier: is %@, and language tag for comparison is %@.", (uint8_t *)&v13, 0x16u);
      }

      v8 = objc_msgSend(v9, "isEqualToString:", v10) ^ 1;
    }
    else
    {
      pre_locale_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1C35DB000, v10, OS_LOG_TYPE_DEFAULT, "Could not detect language for isLanguageMismatchedForMessage:withLocaleIdentifier: with sufficiently high confidence.", (uint8_t *)&v13, 2u);
      }
      LOBYTE(v8) = 0;
    }

  }
  return v8;
}

- (id)localeForIncomingMessages:(id)a3 outgoingMessages:(id)a4 defaultLocale:(id)a5 defaultLocaleLastChangedDate:(id)a6 sender:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  objc_msgSend(a3, "_pas_componentsJoinedByString:", CFSTR("\n"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRELocaleDetection localeForMessage:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:](self, "localeForMessage:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:", v16, v15, v14, v13, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)localeForMessage:(id)a3 outgoingMessageHistory:(id)a4 defaultLocale:(id)a5 defaultLocaleLastChangedDate:(id)a6 sender:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)MEMORY[0x1C3BD39FC]();
  if (!v14 || !v15)
  {
    if (!v14 && -[NSDictionary count](self->_preferredLocales, "count"))
    {
      -[NSDictionary allValues](self->_preferredLocales, "allValues");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v23 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
      if (-[NSDictionary count](self->_preferredLocales, "count") <= 1)
      {
        pre_locale_handle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v42 = (uint64_t)v14;
          v43 = 2112;
          v44 = (uint64_t)v23;
          _os_log_impl(&dword_1C35DB000, v24, OS_LOG_TYPE_DEFAULT, "Monolingual, default locale %@, detection result %@.", buf, 0x16u);
        }

        v22 = v23;
        goto LABEL_38;
      }
      if (objc_msgSend(v12, "length"))
      {
        -[PRELocaleDetection _userLocaleDetectedFromString:](self, "_userLocaleDetectedFromString:", v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "length"))
        {
          pre_locale_handle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218498;
            v42 = objc_msgSend(v12, "length");
            v43 = 2112;
            v44 = (uint64_t)v14;
            v45 = 2112;
            v46 = v25;
            _os_log_impl(&dword_1C35DB000, v26, OS_LOG_TYPE_DEFAULT, "Message length: %lu, default locale: %@, detected locale: %@.", buf, 0x20u);
          }

          if (v16)
            -[_PASLRUCache setObject:forKey:](self->_lastConfidentLocaleForSender, "setObject:forKey:", v25, v16);
          v27 = v25;
          v22 = v27;
          goto LABEL_37;
        }
      }
      else
      {
        v25 = 0;
      }
      v29 = (void *)objc_opt_new();
      if (objc_msgSend(v13, "count"))
        objc_msgSend(v29, "addObjectsFromArray:", v13);
      v40 = v29;
      objc_msgSend(v29, "_pas_componentsJoinedByString:", CFSTR("\n"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRELocaleDetection _userLocaleDetectedFromString:](self, "_userLocaleDetectedFromString:");
      v27 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v27, "length"))
      {
        pre_locale_handle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v42 = objc_msgSend(v40, "count");
          v43 = 2112;
          v44 = (uint64_t)v14;
          v45 = 2112;
          v46 = v27;
          _os_log_impl(&dword_1C35DB000, v30, OS_LOG_TYPE_DEFAULT, "Number of messages used for detection: %lu, default locale: %@, detected locale: %@.", buf, 0x20u);
        }

        if (v16)
          -[_PASLRUCache setObject:forKey:](self->_lastConfidentLocaleForSender, "setObject:forKey:", v27, v16);
        v31 = v27;
      }
      else
      {
        if (!objc_msgSend(v14, "length"))
        {
          -[_PASLRUCache objectForKey:](self->_lastConfidentLocaleForSender, "objectForKey:", v16);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          v36 = v23;
          if (v16)
          {
            v37 = objc_msgSend(v34, "length");
            v36 = v23;
            if (v37)
            {
              pre_locale_handle();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v42 = (uint64_t)v35;
                _os_log_impl(&dword_1C35DB000, v38, OS_LOG_TYPE_DEFAULT, "There was no default locale specified. Falling back to last confident locale for sender: %@", buf, 0xCu);
              }

              v36 = v35;
            }
          }
          v22 = v36;

          goto LABEL_36;
        }
        pre_locale_handle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = (uint64_t)v14;
          _os_log_impl(&dword_1C35DB000, v32, OS_LOG_TYPE_DEFAULT, "Failed to detect a locale so falling back to the default locale: %@", buf, 0xCu);
        }

        v31 = v14;
      }
      v22 = v31;
LABEL_36:

LABEL_37:
LABEL_38:

      goto LABEL_39;
    }
LABEL_8:
    v23 = v14;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v15);
  v20 = v19;

  if (v20 > 3600.0)
    goto LABEL_8;
  pre_locale_handle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v42 = (uint64_t)v14;
    v43 = 2048;
    v44 = 3600;
    v45 = 2112;
    v46 = v14;
    _os_log_impl(&dword_1C35DB000, v21, OS_LOG_TYPE_DEFAULT, "Default locale %@ was changed less than %lu seconds ago, detection result %@.", buf, 0x20u);
  }

  v22 = v14;
LABEL_39:
  objc_autoreleasePoolPop(v17);

  return v22;
}

- (id)_bestLocaleForLanguageTag:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary allKeys](self->_preferredLocales, "allKeys");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "hasPrefix:", v4, (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConfidentLocaleForSender, 0);
  objc_storeStrong((id *)&self->_preferredLocales, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global);
  return (id)sharedInstance__pasExprOnceResult;
}

+ (id)languageTagForLocaleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "containsString:", CFSTR("@")))
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("@"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D70A90], "languageForLocaleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isLanguageMismatchedForIdentifier:(id)a3 withIdentifier:(id)a4
{
  int v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  LOBYTE(v4) = 0;
  if (a3 && a4)
  {
    v6 = (void *)MEMORY[0x1E0D70A90];
    v7 = a4;
    objc_msgSend(v6, "languageForLocaleIdentifier:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D70A90], "languageForLocaleIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v8, "isEqualToString:", v9) ^ 1;
  }
  return v4;
}

void __36__PRELocaleDetection_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end

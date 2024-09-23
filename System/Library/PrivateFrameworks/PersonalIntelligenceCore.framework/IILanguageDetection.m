@implementation IILanguageDetection

+ (id)languageForLocaleIdentifier:(id)a3
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BD74CC]();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("IILanguageDetection.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localeIdentifier != nil"));

  }
  if ((unint64_t)objc_msgSend(v5, "length") > 1)
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("-"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "count");
    v14 = objc_msgSend(v11, "isEqualToString:", CFSTR("zh"));
    if (v13 == 1)
    {
      if ((v14 & 1) != 0)
      {
        v7 = CFSTR("zh-Hans");
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      if (v14)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Hans"));

        v7 = CFSTR("zh-Hans");
        if ((v16 & 1) == 0)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Hant"));

          if ((v18 & 1) != 0 || (objc_msgSend(v12, "isEqualToString:", CFSTR("HK")) & 1) != 0)
          {
            v7 = CFSTR("zh-Hant");
          }
          else
          {
            v7 = CFSTR("zh-Hant");
            if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MO")) & 1) == 0
              && !objc_msgSend(v12, "isEqualToString:", CFSTR("TW")))
            {
              v7 = CFSTR("zh-Hans");
            }
          }
        }
        goto LABEL_36;
      }
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("uz")))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Cyrl"));

        if ((v20 & 1) != 0)
        {
          v7 = CFSTR("uz");
          goto LABEL_36;
        }
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("Arab"));

        if ((v22 & 1) != 0)
          goto LABEL_19;
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("Latn"));

        if ((v24 & 1) != 0
          || (objc_msgSend(v12, "isEqualToString:", CFSTR("UZ")) & 1) != 0
          || (objc_msgSend(v12, "isEqualToString:", CFSTR("AZ")) & 1) != 0)
        {
          v7 = CFSTR("uz-Latn");
          goto LABEL_36;
        }
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("AF")) & 1) != 0)
        {
LABEL_19:
          v7 = CFSTR("uz-Arab");
          goto LABEL_36;
        }
      }
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("sr")))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("Latn"));

        if ((v26 & 1) != 0)
        {
          v7 = CFSTR("sr-Latn");
          goto LABEL_36;
        }
      }
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("hi")))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("Latn"));

        if ((v28 & 1) != 0)
        {
          v7 = CFSTR("hi-Latn");
          goto LABEL_36;
        }
      }
    }
    v7 = v11;
    goto LABEL_36;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v5;
    _os_log_fault_impl(&dword_1C3B51000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Provided locale identifier (%@) is not a valid identifier", buf, 0xCu);
  }
  v7 = (__CFString *)v5;
LABEL_37:
  objc_autoreleasePoolPop(v6);

  return v7;
}

+ (int)languageIdForLanguageString:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  unint64_t v6;
  int v7;

  v3 = a3;
  v4 = 0;
  while (v4 == -4)
  {
LABEL_5:
    v6 = v4 + 57;
    --v4;
    if (v6 <= 1)
    {
      v7 = 1;
      goto LABEL_8;
    }
  }
  objc_opt_self();
  v5 = off_1E7E5D900[v4 + 56];
  if ((objc_msgSend(v3, "hasPrefix:", v5) & 1) == 0)
  {

    goto LABEL_5;
  }
  v7 = v4 + 58;

LABEL_8:
  return v7;
}

+ (id)defaultLanguage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IILanguageDetection languageForLocaleIdentifier:](IILanguageDetection, "languageForLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)userLanguages
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringArrayForKey:", CFSTR("AppleKeyboards"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_opt_new();
  if (v3 && objc_msgSend(v3, "count"))
  {
    v19 = v2;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_msgSend(v10, "containsString:", CFSTR("Emoji")) & 1) == 0
            && (objc_msgSend(v10, "containsString:", CFSTR("emoji")) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }

    v2 = v19;
  }
  if (!objc_msgSend(v4, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v14);
    }

  }
  return v4;
}

+ (id)detectLanguageFromText:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  +[IILanguageDetection dominantLanguageTagFromText:](IILanguageDetection, "dominantLanguageTagFromText:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[IILanguageDetection defaultLanguage](IILanguageDetection, "defaultLanguage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)detectLanguageFromTextHeuristically:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (+[IILanguageDetection _userIsMultilingual]())
  {
    +[IILanguageDetection userLanguages](IILanguageDetection, "userLanguages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[IILanguageDetection detectLanguageFromTextHeuristicallyWithLanguages:languages:defaultLanguage:](IILanguageDetection, "detectLanguageFromTextHeuristicallyWithLanguages:languages:defaultLanguage:", v3, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[IILanguageDetection defaultLanguage](IILanguageDetection, "defaultLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)detectLanguageFromTextHeuristicallyWithLanguages:(id)a3 languages:(id)a4 defaultLanguage:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  float *v13;
  unint64_t v14;
  unint64_t v15;
  float v16;
  float *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  objc_opt_self();
  v13 = (float *)malloc_type_malloc(8 * objc_msgSend(v12, "count"), 0x100004000313F17uLL);
  v14 = objc_msgSend(v12, "count");
  if (objc_msgSend(v12, "count"))
  {
    v15 = 0;
    v16 = 0.2 / (float)v14;
    v17 = v13 + 1;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)v17 - 1) = objc_msgSend(v18, "intValue");

      *v17 = v16;
      v17 += 2;
      ++v15;
    }
    while (v15 < objc_msgSend(v12, "count"));
  }

  +[IILanguageDetection _dominantLanguageTagFromTextWithMaxLength:maxLength:minimumProbability:hints:hintsCount:](0.575, (uint64_t)IILanguageDetection, v7, 30, (uint64_t)v13, objc_msgSend(v12, "count"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (void *)v19;
  else
    v21 = v9;
  v22 = v21;

  if (objc_msgSend(v22, "length"))
  {
    if (!v22)
      goto LABEL_15;
  }
  else
  {
    +[IILanguageDetection _dominantLanguageTagFromTextWithMaxLength:maxLength:minimumProbability:hints:hintsCount:](0.75, (uint64_t)IILanguageDetection, v7, 500, (uint64_t)v13, objc_msgSend(v12, "count"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (void *)v23;
    else
      v25 = v9;
    v26 = v25;

    v22 = v26;
    if (!v26)
      goto LABEL_15;
  }
  if ((objc_msgSend(v8, "containsObject:", v22) & 1) == 0)
  {
LABEL_15:
    v27 = v9;

    v22 = v27;
  }
  free(v13);

  return v22;
}

+ (id)detectLanguageFromTextWithMaxLength:(id)a3 maxLength:(unint64_t)a4 minimumProbability:(double)a5
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  +[IILanguageDetection _dominantLanguageTagFromTextWithMaxLength:maxLength:minimumProbability:](a5, (uint64_t)IILanguageDetection, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[IILanguageDetection defaultLanguage](IILanguageDetection, "defaultLanguage");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)detectLanguageFromTextIfMultilingual:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (+[IILanguageDetection _userIsMultilingual]())
    +[IILanguageDetection detectLanguageFromText:](IILanguageDetection, "detectLanguageFromText:", v3);
  else
    +[IILanguageDetection defaultLanguage](IILanguageDetection, "defaultLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)detectLanguageFromLanguageTags:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "dominantLanguageTagFromLanguageTags:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[IILanguageDetection defaultLanguage](IILanguageDetection, "defaultLanguage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)dominantLanguageTagFromText:(id)a3
{
  return +[IILanguageDetection _dominantLanguageTagFromTextWithMaxLength:maxLength:minimumProbability:](0.575, (uint64_t)IILanguageDetection, a3, 30);
}

+ (id)dominantLanguageTagFromLanguageTags:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_self();
  objc_msgSend(v3, "count");
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "firstObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithArray:", v3);
      if (objc_msgSend(v5, "count") == 1)
      {
        objc_msgSend(v3, "firstObject");
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if ((unint64_t)objc_msgSend(v5, "count") <= 2)
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v6 = v5;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v7)
        {
          v8 = v7;
          v9 = 0;
          v10 = 0;
          v11 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v6);
              v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
              v14 = objc_msgSend(v6, "countForObject:", v13, (_QWORD)v18);
              if (v14 >= v10)
              {
                v15 = v14;
                v16 = v13;

                v9 = v16;
                v10 = v15;
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v8);
        }
        else
        {
          v9 = 0;
          v10 = 0;
        }

        if ((double)v10 / (double)(unint64_t)objc_msgSend(v3, "count") >= 0.6)
          v4 = v9;
        else
          v4 = 0;

      }
      else
      {
        v4 = 0;
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_dominantLanguageTagFromTextWithMaxLength:(void *)a3 maxLength:(uint64_t)a4 minimumProbability:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_opt_self();
  +[IILanguageDetection _dominantLanguageTagFromTextWithMaxLength:maxLength:minimumProbability:hints:hintsCount:](a1, (uint64_t)IILanguageDetection, v6, a4, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_dominantLanguageTagFromTextWithMaxLength:(void *)a3 maxLength:(uint64_t)a4 minimumProbability:(uint64_t)a5 hints:(uint64_t)a6 hintsCount:
{
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v10 = a3;
  objc_opt_self();
  if (objc_msgSend(v10, "length"))
  {
    if (_dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___pasOnceToken3 != -1)
      dispatch_once(&_dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___pasOnceToken3, &__block_literal_global_172);
    objc_msgSend((id)_dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___pasExprOnceResult, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    v26 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __111__IILanguageDetection__dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___block_invoke_178;
    v14[3] = &unk_1E7E5D8E0;
    v17 = a5;
    v18 = a6;
    v19 = a4;
    v20 = a1;
    v15 = v10;
    v16 = &v21;
    objc_msgSend(v11, "runWithLockAcquired:", v14);
    v12 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __111__IILanguageDetection__dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___block_invoke_178(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD74CC]();
  if (*(_QWORD *)(a1 + 48) && *(_QWORD *)(a1 + 56))
    NLLanguageIdentifierSetLanguageHints();
  CFStringGetLength(*(CFStringRef *)(a1 + 32));
  NLLanguageIdentifierConsumeString();
  NLLanguageIdentifierGetTopHypotheses();
  NLLanguageIdentifierReset();
  if (*(double *)(a1 + 72) > 0.0 || 0.0 + 0.1 >= 0.0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;
  }
  else
  {
    objc_opt_self();
    v6 = 0;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }

  objc_autoreleasePoolPop(v4);
}

void __111__IILanguageDetection__dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD74CC]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:", &__block_literal_global_175);
  v2 = (void *)_dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___pasExprOnceResult;
  _dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __111__IILanguageDetection__dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___block_invoke_2()
{
  _QWORD *v0;
  void *v1;

  v0 = (_QWORD *)objc_opt_new();
  v0[1] = NLLanguageIdentifierCreate();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v0);

  return v1;
}

+ (BOOL)_userIsMultilingual
{
  void *v0;
  _BOOL8 v1;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (unint64_t)objc_msgSend(v0, "count") > 1;

  return v1;
}

uint64_t __98__IILanguageDetection_detectLanguageFromTextHeuristicallyWithLanguages_languages_defaultLanguage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[IILanguageDetection languageIdForLanguageString:](IILanguageDetection, "languageIdForLanguageString:", a2));
}

@end

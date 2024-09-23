@implementation CRLanguageResources

- (CRLanguageResources)initWithLanguageIdentifier:(id)a3 type:(int64_t)a4
{
  __CFString *v6;
  CRLanguageResources *v7;
  __CFString **v8;
  CRLanguageResources *v9;
  __CFString *v10;
  uint64_t v11;
  NSLocale *locale;
  CVNLPLanguageResourceBundle *cvnlpLanguageResourceBundle;
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
  objc_super v25;

  v6 = (__CFString *)a3;
  v25.receiver = self;
  v25.super_class = (Class)CRLanguageResources;
  v7 = -[CRLanguageResources init](&v25, sel_init);
  if (!v7)
    goto LABEL_30;
  if ((objc_msgSend((id)objc_opt_class(), "isLanguageSupported:", v6) & 1) != 0)
  {
    if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("yue-Hans")) & 1) != 0)
    {
      v8 = CRImageReaderLanguageZh_Hans;
    }
    else
    {
      if (!-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("yue-Hant")))
        goto LABEL_9;
      v8 = CRImageReaderLanguageZh_Hant;
    }
    v10 = *v8;

    v6 = v10;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v11;

    cvnlpLanguageResourceBundle = v7->__cvnlpLanguageResourceBundle;
    v7->__cvnlpLanguageResourceBundle = 0;

    if (+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v6))
    {
      v14 = (void *)objc_opt_class();
      -[NSLocale localeIdentifier](v7->_locale, "localeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_cvnlpCharacterLanguageModel = (CVNLPLanguageModel *)objc_msgSend(v14, "createCVNLPCharacterLanguageModel:", v15);

      v7->_lmCharacterLanguageModel = 0;
      v7->_wordTokenizer = 0;
      v7->_staticLexicon = 0;
LABEL_11:
      v7->_wordLanguageModel = 0;
LABEL_30:
      v9 = v7;
      goto LABEL_31;
    }
    if (a4 == 2)
    {
      v7->_cvnlpCharacterLanguageModel = 0;
      v7->_staticLexicon = 0;
      if (!+[CRImageReader languageIsKorean:](CRImageReader, "languageIsKorean:", v6)
        && !+[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", v6)
        && !+[CRImageReader languageIsThai:](CRImageReader, "languageIsThai:", v6))
      {
        v7->_wordLanguageModel = (void *)objc_msgSend((id)objc_opt_class(), "createWordLanguageModel:type:", v7->_locale, 2);
        v7->_wordTokenizer = (void *)LMStreamTokenizerCreate();
        v7->_lmCharacterLanguageModel = 0;
        goto LABEL_30;
      }
      v16 = (void *)objc_opt_class();
      -[NSLocale localeIdentifier](v7->_locale, "localeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_lmCharacterLanguageModel = (void *)objc_msgSend(v16, "createCharacterModel:", v17);

      v7->_wordTokenizer = 0;
      goto LABEL_11;
    }
    if (a4 == 1)
    {
      v7->_lmCharacterLanguageModel = 0;
      v7->_staticLexicon = 0;
      v7->_wordLanguageModel = 0;
      if (!+[CRImageReader languageIsVietnamese:](CRImageReader, "languageIsVietnamese:", v6))
      {
        v18 = (void *)objc_opt_class();
        -[NSLocale localeIdentifier](v7->_locale, "localeIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_cvnlpCharacterLanguageModel = (CVNLPLanguageModel *)objc_msgSend(v18, "createCVNLPCharacterLanguageModel:", v19);

LABEL_29:
        v7->_wordTokenizer = 0;
        goto LABEL_30;
      }
    }
    else
    {
      if (a4)
        goto LABEL_30;
      if (+[CRImageReader languageIsVietnamese:](CRImageReader, "languageIsVietnamese:", v6))
      {
        v7->_lmCharacterLanguageModel = 0;
      }
      else
      {
        v20 = (void *)objc_opt_class();
        -[NSLocale localeIdentifier](v7->_locale, "localeIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_lmCharacterLanguageModel = (void *)objc_msgSend(v20, "createCharacterModel:", v21);

      }
      if (+[CRImageReader languageIsKorean:](CRImageReader, "languageIsKorean:", v6)
        || +[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", v6))
      {
        v7->_staticLexicon = 0;
        v7->_wordLanguageModel = 0;
      }
      else
      {
        v22 = (void *)objc_opt_class();
        -[NSLocale languageCode](v7->_locale, "languageCode");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_staticLexicon = (_LXLexicon *)objc_msgSend(v22, "createStaticLexicon:", v23);

        v7->_wordLanguageModel = (void *)objc_msgSend((id)objc_opt_class(), "createWordLanguageModel:type:", v7->_locale, 0);
      }
    }
    v7->_cvnlpCharacterLanguageModel = 0;
    goto LABEL_29;
  }
  v9 = 0;
LABEL_31:

  return v9;
}

+ (BOOL)isCustomWordsSupportedForLanguageIdentifier:(id)a3
{
  id v3;
  _BOOL4 v4;

  v3 = a3;
  if (+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v3)
    || +[CRImageReader languageIsKorean:](CRImageReader, "languageIsKorean:", v3))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = !+[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", v3);
  }

  return v4;
}

- (BOOL)isCustomWordsSupported
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[CRLanguageResources locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isCustomWordsSupportedForLanguageIdentifier:", v5);

  return (char)v3;
}

- (id)cvnlpLanguageResourceBundle:(id)a3 lmConfig:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  CVNLPLanguageModel *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  uint8_t buf[8];
  CFTypeRef cf;

  v41 = a3;
  v6 = a4;
  -[CRLanguageResources _cvnlpLanguageResourceBundle](self, "_cvnlpLanguageResourceBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_30;
  if (-[CRLanguageResources staticLexicon](self, "staticLexicon"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09AC8]), "initWithLexicon:", -[CRLanguageResources staticLexicon](self, "staticLexicon"));
    objc_msgSend(v8, "addObject:", v9);

    v10 = v8;
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)objc_opt_class();
  -[CRLanguageResources locale](self, "locale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "isCustomWordsSupportedForLanguageIdentifier:", v13);

  if ((_DWORD)v11)
  {
    objc_msgSend(v41, "customWords");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v41, "customWords");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self isKindOfClass: %@"), objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "filteredArrayUsingPredicate:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          -[CRLanguageResources locale](self, "locale");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          cf = +[CRLanguageUtils createDynamicLexicon:forLocale:error:](CRLanguageUtils, "createDynamicLexicon:forLocale:error:", v17, v18, 0);

          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09AC8]), "initWithLexicon:", cf);
          if (!v10)
            v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v10, "addObject:", v19);

          if (cf)
            CFRelease(cf);
        }
        else
        {
          CROSLogForCategory(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D4FB8000, v20, OS_LOG_TYPE_ERROR, "Custom words array can only contain strings. Ignoring custom words array.", buf, 2u);
          }

        }
      }

    }
  }
  v21 = v10;
  if (v10)
  {
    v22 = objc_alloc(MEMORY[0x1E0D09AD0]);
    objc_msgSend(v6, "lexiconWeight");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithLexicons:decodingWeight:", v10, v23);

  }
  else
  {
    v24 = 0;
  }
  if (-[CRLanguageResources lmCharacterLanguageModel](self, "lmCharacterLanguageModel"))
  {
    v25 = objc_alloc(MEMORY[0x1E0D09AC0]);
    v26 = -[CRLanguageResources lmCharacterLanguageModel](self, "lmCharacterLanguageModel");
    -[CRLanguageResources locale](self, "locale");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characterLMWeight");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v25, "initWithLMLanguageModel:locale:decodingWeight:", v26, v27, v28);
  }
  else
  {
    if (!-[CRLanguageResources cvnlpCharacterLanguageModel](self, "cvnlpCharacterLanguageModel"))
    {
      v32 = 0;
      goto LABEL_26;
    }
    v30 = objc_alloc(MEMORY[0x1E0D09AC0]);
    v31 = -[CRLanguageResources cvnlpCharacterLanguageModel](self, "cvnlpCharacterLanguageModel");
    -[CRLanguageResources locale](self, "locale");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characterLMWeight");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v30, "initWithCVNLPLanguageModel:locale:decodingWeight:", v31, v27, v28);
  }
  v32 = (void *)v29;

LABEL_26:
  if (-[CRLanguageResources wordLanguageModel](self, "wordLanguageModel"))
  {
    v33 = objc_alloc(MEMORY[0x1E0D09AC0]);
    v34 = -[CRLanguageResources wordLanguageModel](self, "wordLanguageModel");
    -[CRLanguageResources locale](self, "locale");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wordLMWeight");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v33, "initWithLMLanguageModel:locale:decodingWeight:", v34, v35, v36);

  }
  else
  {
    v37 = 0;
  }
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09AD8]), "initWithLexicons:characterLanguageModel:wordLanguageModel:", v24, v32, v37);
  -[CRLanguageResources set_cvnlpLanguageResourceBundle:](self, "set_cvnlpLanguageResourceBundle:", v38);

LABEL_30:
  -[CRLanguageResources _cvnlpLanguageResourceBundle](self, "_cvnlpLanguageResourceBundle");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

+ (void)createCharacterModel:(id)a3
{
  NSLocale *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSLocale *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v30;
  void *v31;
  void *v32;
  NSLocale *v33;
  _QWORD v34[4];
  _QWORD v35[4];
  uint8_t buf[4];
  id v37;
  uint8_t v38[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:");
  v3 = (NSLocale *)objc_claimAutoreleasedReturnValue();
  -[NSLocale languageCode](v3, "languageCode");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLocale countryCode](v3, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend((id)objc_opt_class(), "isCharLMForLanguageAvailableInTextRecognition:", v32))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v3;
    v33 = v12;
    LDEnumerateAssetDataItems();
    -[NSLocale localeIdentifier](v12, "localeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (v15)
    {
      -[NSLocale languageCode](v12, "languageCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (v19)
      {
        v8 = 0;
        v11 = 0;
        goto LABEL_14;
      }
      -[NSLocale languageCode](v12, "languageCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v8);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSLocale localeIdentifier](v12, "localeIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v8);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v16;
LABEL_14:

    v7 = v5;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v32, v31);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("lm"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  bzero(v38, 0x400uLL);
  v7 = objc_retainAutorelease(v6);
  if (!pathForResource((const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4), 0, v38))
  {
    CROSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v7;
      _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_DEFAULT, "Resource path not found for '%@'. Character LM will be disabled.", buf, 0xCu);
    }
    v8 = 0;
    v11 = 0;
    goto LABEL_10;
  }
  firstMatchingResourceForLocale(v3, &stru_1E98DC948, CFSTR("lm"), v38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v38);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURLWithPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_15;
  }
  v11 = 0;
LABEL_15:

  if (v11)
  {
    objc_msgSend(v11, "path");
    v20 = objc_claimAutoreleasedReturnValue();
    -[NSObject lastPathComponent](v20, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByDeletingPathExtension");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject stringByDeletingLastPathComponent](v20, "stringByDeletingLastPathComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0D43450];
    v34[0] = *MEMORY[0x1E0D434C8];
    v34[1] = v24;
    v35[0] = v8;
    v35[1] = MEMORY[0x1E0C9AAA0];
    v25 = *MEMORY[0x1E0D43468];
    v34[2] = *MEMORY[0x1E0D43478];
    v34[3] = v25;
    v35[2] = v23;
    v35[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)LMLanguageModelCreate();
    if (!v27)
    {
      CROSLogForCategory(0);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v38 = 138412290;
        v39 = v8;
        _os_log_impl(&dword_1D4FB8000, v28, OS_LOG_TYPE_DEFAULT, "Unable to load character LM for language '%@'", v38, 0xCu);
      }

    }
  }
  else
  {
    CROSLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v38 = 138412546;
      v39 = v8;
      v40 = 2112;
      v41 = v30;
      _os_log_impl(&dword_1D4FB8000, v20, OS_LOG_TYPE_DEFAULT, "Resource not found for '%@'. Character LM will be disabled for locale '%@'", v38, 0x16u);
    }
    v27 = 0;
  }

  return v27;
}

void __44__CRLanguageResources_createCharacterModel___block_invoke(uint64_t a1, void *a2, int a3, void *a4, CFStringRef theString1, _BYTE *a6)
{
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (CFStringCompare(theString1, (CFStringRef)*MEMORY[0x1E0D43828], 0) == kCFCompareEqualTo)
  {
    v17 = a2;
    objc_msgSend(v17, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("char.lm"));

    if (v11)
    {
      v12 = a4;
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v12, "localeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v17, v14);

      objc_msgSend(v12, "localeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "localeIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = objc_msgSend(v15, "isEqualToString:", v16);

      if ((_DWORD)v13)
        *a6 = 1;

    }
  }
}

+ (_LXLexicon)createStaticLexicon:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  _LXLexicon *v6;
  NSObject *v7;
  uint8_t buf[4];
  id v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D43450];
  v11[0] = *MEMORY[0x1E0D434C8];
  v11[1] = v4;
  v12[0] = v3;
  v12[1] = MEMORY[0x1E0C9AAA0];
  v11[2] = *MEMORY[0x1E0D434F8];
  v12[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_LXLexicon *)LXLexiconCreate();
  if (!v6)
  {
    CROSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_DEFAULT, "Unable to load lexicon for language '%@'", buf, 0xCu);
    }

  }
  return v6;
}

+ (void)createWordLanguageModel:(id)a3 type:(int64_t)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("en-US"));

  if (a4 == 2)
  {
    objc_msgSend(v5, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v8);

  }
  v26[0] = *MEMORY[0x1E0D434C8];
  objc_msgSend(v5, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D43450];
  v27[0] = v9;
  v27[1] = MEMORY[0x1E0C9AAA0];
  v11 = *MEMORY[0x1E0D434F8];
  v26[1] = v10;
  v26[2] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 ^ 1u);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = *MEMORY[0x1E0D434D0];
  v27[2] = v12;
  v27[3] = &unk_1E9926A90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D09AC0], "pathForLanguageModelForLocale:modelType:resourceType:", v5, 2, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v14, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByDeletingPathExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "stringByDeletingLastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D43478]);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D43468]);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D43458]);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D434B8]);
    v19 = objc_msgSend(v15, "copy");

    v13 = (void *)v19;
  }
  v20 = (void *)LMLanguageModelCreate();
  if (!v20)
  {
    CROSLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "localeIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v22;
      _os_log_impl(&dword_1D4FB8000, v21, OS_LOG_TYPE_DEFAULT, "Unable to load language model for '%@'.", (uint8_t *)&v24, 0xCu);

    }
  }

  return v20;
}

+ (CVNLPLanguageModel)createCVNLPCharacterLanguageModel:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CVNLPLanguageModel *v7;
  NSObject *v8;
  int v10;
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D09B28];
  v12[0] = *MEMORY[0x1E0D09B20];
  v12[1] = v4;
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (CVNLPLanguageModel *)CVNLPLanguageModelCreate();
  if (!v7)
  {
    CROSLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1D4FB8000, v8, OS_LOG_TYPE_DEFAULT, "Unable to load language model for '%@'.", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

+ (BOOL)isLanguageSupported:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (qword_1ED0B4680 != -1)
    dispatch_once(&qword_1ED0B4680, &__block_literal_global_24);
  v4 = objc_msgSend((id)_MergedGlobals_24, "containsObject:", v3);

  return v4;
}

void __43__CRLanguageResources_isLanguageSupported___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[31];

  v2[30] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("en-US");
  v2[1] = CFSTR("pt-BR");
  v2[2] = CFSTR("fr-FR");
  v2[3] = CFSTR("it-IT");
  v2[4] = CFSTR("de-DE");
  v2[5] = CFSTR("es-ES");
  v2[6] = CFSTR("ru-RU");
  v2[7] = CFSTR("uk-UA");
  v2[8] = CFSTR("zh-Hans");
  v2[9] = CFSTR("zh-Hant");
  v2[10] = CFSTR("yue-Hans");
  v2[11] = CFSTR("yue-Hant");
  v2[12] = CFSTR("ko-KR");
  v2[13] = CFSTR("ja-JP");
  v2[14] = CFSTR("th-TH");
  v2[15] = CFSTR("vi-VT");
  v2[16] = CFSTR("tr-TR");
  v2[17] = CFSTR("id-ID");
  v2[18] = CFSTR("cs-CZ");
  v2[19] = CFSTR("da-DK");
  v2[20] = CFSTR("nl-NL");
  v2[21] = CFSTR("no-NO");
  v2[22] = CFSTR("nn-NO");
  v2[23] = CFSTR("nb-NO");
  v2[24] = CFSTR("ms-MY");
  v2[25] = CFSTR("pl-PL");
  v2[26] = CFSTR("ro-RO");
  v2[27] = CFSTR("sv-SE");
  v2[28] = CFSTR("ar-SA");
  v2[29] = CFSTR("ars-SA");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 30);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_24;
  _MergedGlobals_24 = v0;

}

+ (BOOL)isCharLMForLanguageAvailableInTextRecognition:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (qword_1ED0B4690 != -1)
    dispatch_once(&qword_1ED0B4690, &__block_literal_global_26_1);
  v4 = objc_msgSend((id)qword_1ED0B4688, "containsObject:", v3);

  return v4;
}

void __69__CRLanguageResources_isCharLMForLanguageAvailableInTextRecognition___block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ED0B4688;
  qword_1ED0B4688 = (uint64_t)&unk_1E993F7E8;

}

- (void)dealloc
{
  _LXLexicon *staticLexicon;
  CVNLPLanguageModel *cvnlpCharacterLanguageModel;
  objc_super v5;

  if (self->_lmCharacterLanguageModel)
  {
    LMLanguageModelRelease();
    self->_lmCharacterLanguageModel = 0;
  }
  staticLexicon = self->_staticLexicon;
  if (staticLexicon)
  {
    CFRelease(staticLexicon);
    self->_staticLexicon = 0;
  }
  if (self->_wordLanguageModel)
  {
    LMLanguageModelRelease();
    self->_wordLanguageModel = 0;
  }
  cvnlpCharacterLanguageModel = self->_cvnlpCharacterLanguageModel;
  if (cvnlpCharacterLanguageModel)
  {
    CFRelease(cvnlpCharacterLanguageModel);
    self->_cvnlpCharacterLanguageModel = 0;
  }
  if (self->_wordTokenizer)
  {
    LMStreamTokenizerRelease();
    self->_wordTokenizer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLanguageResources;
  -[CRLanguageResources dealloc](&v5, sel_dealloc);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)lmCharacterLanguageModel
{
  return self->_lmCharacterLanguageModel;
}

- (CVNLPLanguageModel)cvnlpCharacterLanguageModel
{
  return self->_cvnlpCharacterLanguageModel;
}

- (_LXLexicon)staticLexicon
{
  return self->_staticLexicon;
}

- (void)wordLanguageModel
{
  return self->_wordLanguageModel;
}

- (void)wordTokenizer
{
  return self->_wordTokenizer;
}

- (CVNLPLanguageResourceBundle)_cvnlpLanguageResourceBundle
{
  return (CVNLPLanguageResourceBundle *)objc_getProperty(self, a2, 56, 1);
}

- (void)set_cvnlpLanguageResourceBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cvnlpLanguageResourceBundle, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end

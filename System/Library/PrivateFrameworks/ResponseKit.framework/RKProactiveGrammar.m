@implementation RKProactiveGrammar

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__RKProactiveGrammar_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, block);
  return (id)sharedManager_sharedProactiveManager;
}

void __35__RKProactiveGrammar_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedProactiveManager;
  sharedManager_sharedProactiveManager = (uint64_t)v1;

}

- (RKProactiveGrammar)init
{
  RKProactiveGrammar *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RKProactiveGrammar;
  v2 = -[RKProactiveGrammar init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = (void *)_localeLangModel;
    _localeLangModel = (uint64_t)v3;

    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6 = (void *)_localeEquivalenceClass;
    _localeEquivalenceClass = (uint64_t)v5;

    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = (void *)_localeGrammarBundlePath;
    _localeGrammarBundlePath = (uint64_t)v7;

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)_localeLangModel;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend((id)_localeLangModel, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        LMLanguageModelRelease();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  if (_chineseTokenizer)
    ChineseTokenizerRelease();
  v8.receiver = self;
  v8.super_class = (Class)RKProactiveGrammar;
  -[RKProactiveGrammar dealloc](&v8, sel_dealloc);
}

+ (id)getOTAPathForRKBundle:(id)a3
{
  __CFString *v3;
  CFLocaleRef v4;
  void *v5;
  __CFString *v6;
  id v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = (__CFString *)a3;
  v4 = CFLocaleCreate(0, v3);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  LDEnumerateAssetDataItems();
  if (v10[5])
  {
    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFLocaleCreate(0, v6);
  LDEnumerateAssetDataItems();

  if (v4)
LABEL_5:
    CFRelease(v4);
LABEL_6:
  v7 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v7;
}

void __44__RKProactiveGrammar_getOTAPathForRKBundle___block_invoke(uint64_t a1, const __CFURL *a2, int a3, int a4, CFTypeRef cf1, _BYTE *a6)
{
  CFStringRef v9;
  uint64_t v10;
  void *v11;

  if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x24BE5F7F0]))
  {
    v9 = CFURLCopyPath(a2);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a6 = 1;
  }
}

void __44__RKProactiveGrammar_getOTAPathForRKBundle___block_invoke_2(uint64_t a1, const __CFURL *a2, int a3, int a4, CFTypeRef cf1, _BYTE *a6)
{
  CFStringRef v9;
  uint64_t v10;
  void *v11;

  if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x24BE5F7F0]))
  {
    v9 = CFURLCopyPath(a2);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a6 = 1;
  }
}

- (void)getLanguageModel:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFDictionary *Mutable;
  CFLocaleRef v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD *v13;
  const void *v14;
  void *v15;
  uint64_t *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CFLocaleRef cf;
  uint8_t buf[16];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[5];

  v39[3] = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  objc_msgSend((id)_localeLangModel, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)_localeLangModel, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("RK_Bundle"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_localeGrammarBundlePath, "setObject:forKeyedSubscript:", v8, v3);

    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v10 = CFLocaleCreate(0, v3);
    v11 = (_QWORD *)MEMORY[0x24BE5EEB8];
    cf = v10;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE5EEB8], v10);
    v12 = (uint64_t *)MEMORY[0x24BE5EE60];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE5EE60], (const void *)*MEMORY[0x24BDBD268]);
    v13 = (_QWORD *)MEMORY[0x24BE5EE80];
    v14 = (const void *)*MEMORY[0x24BE5EE80];
    objc_msgSend((id)_localeGrammarBundlePath, "objectForKeyedSubscript:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(Mutable, v14, v15);

    v5 = (void *)LMLanguageModelCreate();
    LMVocabularyGetSharedVocabulary();
    if (v5)
    {
      LMLanguageModelAddTransientVocabulary();
      objc_msgSend((id)_localeLangModel, "setObject:forKeyedSubscript:", v5, v3);
      v16 = v12;
    }
    else
    {
      v30 = v7;
      v32 = v6;
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKey:", *MEMORY[0x24BDBCB20]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *v12;
      v38[0] = *v11;
      v38[1] = v18;
      v39[0] = v17;
      v39[1] = MEMORY[0x24BDBD1C0];
      v38[2] = *v13;
      objc_msgSend((id)_localeGrammarBundlePath, "objectForKeyedSubscript:", v3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
      v20 = LMLanguageModelCreate();

      v16 = v12;
      if (v20)
      {
        LMLanguageModelAddTransientVocabulary();
        objc_msgSend((id)_localeLangModel, "setObject:forKeyedSubscript:", v20, v3);
      }

      v7 = v30;
      v6 = v32;
    }
    +[RKProactiveGrammar getOTAPathForRKBundle:](RKProactiveGrammar, "getOTAPathForRKBundle:", v3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_localeLangModel, "objectForKeyedSubscript:", v3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22 && v21)
    {
      v31 = v7;
      v33 = v6;
      objc_msgSend((id)_localeGrammarBundlePath, "setObject:forKeyedSubscript:", v21, v3);
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "languageCode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *v16;
      v36[0] = *MEMORY[0x24BE5EEB8];
      v36[1] = v25;
      v37[0] = v24;
      v37[1] = MEMORY[0x24BDBD1C0];
      v36[2] = *MEMORY[0x24BE5EE80];
      objc_msgSend((id)_localeGrammarBundlePath, "objectForKeyedSubscript:", v3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
      v27 = LMLanguageModelCreate();

      if (v27)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D3BA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "(RKProactiveGrammar) Loading grammar from OTA resources", buf, 2u);
        }
        LMLanguageModelAddTransientVocabulary();
        objc_msgSend((id)_localeLangModel, "setObject:forKeyedSubscript:", v27, v3);
      }

      v7 = v31;
      v6 = v33;
    }
    CFRelease(cf);
    CFRelease(Mutable);

  }
  return v5;
}

- (void)chineseTokenizer
{
  CFLocaleRef v2;

  if (!_chineseTokenizer)
  {
    v2 = CFLocaleCreate(0, CFSTR("zh-Hans"));
    _chineseTokenizer = ChineseTokenizerCreate();
    if (_chineseTokenizer)
      ChineseTokenizerSetCustomWordCheckBlock();
    if (v2)
      CFRelease(v2);
  }
  return (void *)_chineseTokenizer;
}

BOOL __38__RKProactiveGrammar_chineseTokenizer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 < 2)
    return 0;
  LMVocabularyGetSharedVocabulary();
  return LMVocabularyContainsLemmaForCharacters() != 0;
}

- (id)getEquivalenceClass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v3 = a3;
  objc_msgSend((id)_localeEquivalenceClass, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_9;
  objc_msgSend((id)_localeGrammarBundlePath, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[RKProactiveGrammar getOTAPathForRKBundle:](RKProactiveGrammar, "getOTAPathForRKBundle:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_localeGrammarBundlePath, "setObject:forKeyedSubscript:", v6, v3);

  }
  objc_msgSend((id)_localeGrammarBundlePath, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_8:
    v13 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    objc_msgSend((id)_localeEquivalenceClass, "setObject:forKeyedSubscript:", v13, v3);

LABEL_9:
    objc_msgSend((id)_localeEquivalenceClass, "objectForKeyedSubscript:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend((id)_localeGrammarBundlePath, "objectForKeyedSubscript:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("/equivalenceClasses.plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if (!v11)
  {

    goto LABEL_8;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithContentsOfFile:", v9);
  objc_msgSend((id)_localeEquivalenceClass, "setObject:forKeyedSubscript:", v12, v3);

LABEL_10:
  return v12;
}

+ (id)getEntities:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDD1638]);
  v8 = *MEMORY[0x24BDD0F58];
  v21[0] = *MEMORY[0x24BDD0F68];
  v7 = v21[0];
  v21[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithTagSchemes:options:", v9, 4);

  objc_msgSend(v10, "setString:", v4);
  objc_msgSend(v10, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __34__RKProactiveGrammar_getEntities___block_invoke;
  v18[3] = &unk_24C6AF430;
  v19 = v10;
  v13 = v5;
  v20 = v13;
  v14 = v10;
  objc_msgSend(v14, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v12, v7, 4, v18);

  v15 = v20;
  v16 = v13;

  return v16;
}

void __34__RKProactiveGrammar_getEntities___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a2;
  v10 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringWithRange:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setString:", v9);

  objc_msgSend(v10, "setPartOfSpeech:", v7);
  objc_msgSend(v10, "setTokenType:", 0);
  objc_msgSend(v10, "setLanguage:", 0);
  objc_msgSend(v10, "setTokenRange:", a3, a4);
  objc_msgSend(v10, "setLemma:", 0);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

}

- (id)copyAttributedTokenForText:(id)a3 forLanguage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  RKProactiveGrammar *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  id obj;
  char v52;
  uint64_t v53;
  uint64_t v54;
  CFMutableStringRef string;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[RKProactiveGrammar getLanguageModel:](self, "getLanguageModel:", v7);
  v47 = self;
  v48 = v7;
  -[RKProactiveGrammar getEquivalenceClass:](self, "getEquivalenceClass:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RKProactiveGrammar getEntities:](RKProactiveGrammar, "getEntities:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (__CFString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
  string = (CFMutableStringRef)objc_alloc_init(MEMORY[0x24BDD16A8]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v10;
  v12 = 0x24BDD1000uLL;
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v54)
  {
    v52 = 0;
    v53 = *(_QWORD *)v57;
    v49 = v9;
    v50 = v11;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v57 != v53)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v14, "partOfSpeech");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Punctuation")) & 1) != 0)
        {
          v16 = 1;
        }
        else
        {
          objc_msgSend(v14, "partOfSpeech");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SentenceTerminator")) & 1) != 0)
          {
            v16 = 1;
          }
          else
          {
            objc_msgSend(v14, "string");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "length") == 1)
            {
              objc_msgSend(v14, "string");
              v19 = v6;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v12 + 1192), "characterSetWithCharactersInString:", CFSTR("！＂＃＄％＆＇（）＊＋，－．／：；＜＝＞？?＠［＼］＾＿｀｛｜｝～"));
              v21 = v8;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "rangeOfCharacterFromSet:", v22);
              v16 = v23 != 0;

              v8 = v21;
              v6 = v19;
              v9 = v49;
              v11 = v50;
            }
            else
            {
              v16 = 0;
            }

          }
        }

        objc_msgSend(v14, "string");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v14, "string");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendString:](string, "appendString:", v27);

          v52 = 1;
        }
        if (!v16
          || (objc_msgSend(v14, "string"),
              v28 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v9, "objectForKeyedSubscript:", v28),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              v29,
              v28,
              v29))
        {
          objc_msgSend(v14, "string");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            v32 = objc_msgSend(v14, "tokenRange");
            objc_msgSend(v6, "substringWithRange:", v32, v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](string, "appendString:", v34);

          }
          -[__CFString appendString:](string, "appendString:", CFSTR(" "));
          if (!v16)
          {
            v35 = objc_msgSend(v14, "tokenRange");
            objc_msgSend(v6, "substringWithRange:", v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v11, "appendString:", v37);
            -[__CFString appendString:](v11, "appendString:", CFSTR(" "));

          }
        }
        v12 = 0x24BDD1000;
      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v54);
  }
  else
  {
    v52 = 0;
  }

  -[__CFString replaceOccurrencesOfString:withString:options:range:](v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("’"), CFSTR("'"), 1, 0, -[__CFString length](v11, "length"));
  -[__CFString replaceOccurrencesOfString:withString:options:range:](string, "replaceOccurrencesOfString:withString:options:range:", CFSTR("’"), CFSTR("'"), 1, 0, -[__CFString length](string, "length"));
  -[__CFString replaceOccurrencesOfString:withString:options:range:](v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" 's"), CFSTR("'s"), 1, 0, -[__CFString length](v11, "length"));
  -[__CFString replaceOccurrencesOfString:withString:options:range:](string, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" 's"), CFSTR("'s"), 1, 0, -[__CFString length](string, "length"));
  if (objc_msgSend(v48, "isEqualToString:", CFSTR("en")))
  {
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" 'll"), CFSTR("'ll"), 1, 0, -[__CFString length](v11, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](string, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" 'll"), CFSTR("'ll"), 1, 0, -[__CFString length](string, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" 've"), CFSTR("'ve"), 1, 0, -[__CFString length](v11, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](string, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" 've"), CFSTR("'ve"), 1, 0, -[__CFString length](string, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" 're"), CFSTR("'re"), 1, 0, -[__CFString length](v11, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](string, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" 're"), CFSTR("'re"), 1, 0, -[__CFString length](string, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" 'd"), CFSTR("'d"), 1, 0, -[__CFString length](v11, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](string, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" 'd"), CFSTR("'d"), 1, 0, -[__CFString length](string, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("y' all"), CFSTR("you"), 1, 0, -[__CFString length](v11, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](string, "replaceOccurrencesOfString:withString:options:range:", CFSTR("y' all"), CFSTR("you"), 1, 0, -[__CFString length](string, "length"));
  }
  if (objc_msgSend(v48, "isEqualToString:", CFSTR("fr")))
  {
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("c' est"), CFSTR("c'est"), 1, 0, -[__CFString length](v11, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](string, "replaceOccurrencesOfString:withString:options:range:", CFSTR("c' est"), CFSTR("c'est"), 1, 0, -[__CFString length](string, "length"));
  }
  if ((objc_msgSend(v48, "isEqualToString:", CFSTR("pt")) & 1) != 0
    || (objc_msgSend(v48, "isEqualToString:", CFSTR("tr")) & 1) != 0
    || (objc_msgSend(v48, "isEqualToString:", CFSTR("it")) & 1) != 0
    || (objc_msgSend(v48, "isEqualToString:", CFSTR("de")) & 1) != 0
    || objc_msgSend(v48, "isEqualToString:", CFSTR("fr")))
  {
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" - "), CFSTR("-"), 1, 0, -[__CFString length](v11, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](string, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" - "), CFSTR("-"), 1, 0, -[__CFString length](string, "length"));
  }
  if ((objc_msgSend(v48, "isEqualToString:", CFSTR("it")) & 1) != 0
    || objc_msgSend(v48, "isEqualToString:", CFSTR("fr")))
  {
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("' "), CFSTR("'"), 1, 0, -[__CFString length](v11, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](string, "replaceOccurrencesOfString:withString:options:range:", CFSTR("' "), CFSTR("'"), 1, 0, -[__CFString length](string, "length"));
  }
  if (objc_msgSend(v48, "isEqualToString:", CFSTR("es"))
    && objc_msgSend(v6, "containsString:", CFSTR(" c.p."))
    && -[__CFString containsString:](v11, "containsString:", CFSTR(" c.p ")))
  {
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" c.p "), CFSTR(" c.p. "), 1, 0, -[__CFString length](v11, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](string, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" c.p "), CFSTR(" c.p. "), 1, 0, -[__CFString length](string, "length"));
  }
  if ((objc_msgSend(v48, "isEqualToString:", CFSTR("es")) & 1) != 0
    || (objc_msgSend(v48, "isEqualToString:", CFSTR("it")) & 1) != 0
    || (objc_msgSend(v48, "isEqualToString:", CFSTR("pt")) & 1) != 0
    || objc_msgSend(v48, "isEqualToString:", CFSTR("fr")))
  {
    v38 = (const __CFString *)*MEMORY[0x24BDBD660];
    CFStringTransform(v11, 0, (CFStringRef)*MEMORY[0x24BDBD660], 0);
    CFStringTransform(string, 0, v38, 0);
    v39 = +[RKUtilities stripDiacritics:](RKUtilities, "stripDiacritics:", v11);
    v40 = +[RKUtilities stripDiacritics:](RKUtilities, "stripDiacritics:", string);
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByTrimmingCharactersInSet:](v11, "stringByTrimmingCharactersInSet:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = -[RKProactiveGrammar copyAttributedTokenForText:forLanguageModel:withLanguageCode:](v47, "copyAttributedTokenForText:forLanguageModel:withLanguageCode:", v42, v8, v48);
  if (((v43 == 0) & v52) == 1)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByTrimmingCharactersInSet:](string, "stringByTrimmingCharactersInSet:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = -[RKProactiveGrammar copyAttributedTokenForText:forLanguageModel:withLanguageCode:](v47, "copyAttributedTokenForText:forLanguageModel:withLanguageCode:", v45, v8, v48);
  }

  return v43;
}

- (id)copyAttributedTokenForText:(id)a3 forLanguageModel:(void *)a4 withLanguageCode:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t CurrentTokenRange;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  char *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  uint64_t PredictionEnumerator;
  void *v36;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  char *v42;
  int v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  int v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  LMVocabularyGetSharedVocabulary();
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 <= 2)
  {
    objc_msgSend(CFSTR("<s> "), "stringByAppendingString:", v8);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("zh-Hans")))
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C6B9E08);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[RKProactiveGrammar chineseTokenizer](self, "chineseTokenizer"))
    {
      objc_msgSend(v13, "length");
      ChineseTokenizerSetString();
      v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (ChineseTokenizerAdvanceToNextToken())
      {
        do
        {
          CurrentTokenRange = ChineseTokenizerGetCurrentTokenRange();
          objc_msgSend(v13, "substringWithRange:", CurrentTokenRange, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v17);

        }
        while ((ChineseTokenizerAdvanceToNextToken() & 1) != 0);
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(" "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v18, "mutableCopy");

    v13 = v8;
  }
  v50 = 0;
  v19 = objc_msgSend(v14, "count");
  if (v19)
  {
    v40 = v13;
    v41 = v9;
    v38 = v19;
    v20 = (char *)malloc_type_malloc(4 * v19, 0x100004052888210uLL);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v39 = v14;
    v21 = v14;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = *(_QWORD *)v47;
      v26 = CFSTR("'s");
      v42 = v20;
      v44 = *(_QWORD *)v47;
      v45 = v21;
      do
      {
        v27 = 0;
        v43 = v24;
        v28 = &v20[4 * v24];
        do
        {
          if (*(_QWORD *)v47 != v25)
            objc_enumerationMutation(v21);
          v29 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v27);
          objc_msgSend(v29, "lowercaseString", v38);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!LMVocabularyContainsLemma() && objc_msgSend(v29, "hasSuffix:", v26))
          {
            v31 = a4;
            v32 = v26;
            objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", v26, &stru_24C6B9E08);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (LMVocabularyContainsLemma())
            {
              v30 = v33;
            }
            else
            {
              objc_msgSend(v29, "lowercaseString");
              v34 = objc_claimAutoreleasedReturnValue();

              v30 = (void *)v34;
            }
            v26 = v32;
            a4 = v31;
            v25 = v44;
            v21 = v45;
          }
          *(_DWORD *)&v28[4 * v27] = LMLanguageModelGetTokenIDForString();

          ++v27;
        }
        while (v23 != v27);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        v20 = v42;
        v24 = v43 + v27;
      }
      while (v23);
    }

    v13 = v40;
    v9 = v41;
    v14 = v39;
  }
  else
  {
    v20 = 0;
  }
  PredictionEnumerator = LMLanguageModelCreatePredictionEnumerator();
  if (!PredictionEnumerator
    || !LMPredictionEnumeratorAdvance()
    || (LMPredictionEnumeratorGetPrediction(), !v50))
  {
    v36 = 0;
    if (!v20)
      goto LABEL_34;
    goto LABEL_33;
  }
  v36 = (void *)LMLanguageModelCopyTokenAttributes();
  if (v20)
LABEL_33:
    free(v20);
LABEL_34:
  if (PredictionEnumerator)
    LMPredictionEnumeratorRelease();

  return v36;
}

@end

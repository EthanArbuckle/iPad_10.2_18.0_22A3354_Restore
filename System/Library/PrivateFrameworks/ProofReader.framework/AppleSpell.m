@implementation AppleSpell

+ (id)availableLanguages
{
  return +[PRLanguage supportedKeyboardLanguages](PRLanguage, "supportedKeyboardLanguages");
}

+ (id)sharedInstance
{
  id result;

  result = (id)sharedInstance;
  if (!sharedInstance)
  {
    result = objc_alloc_init(AppleSpell);
    sharedInstance = (uint64_t)result;
  }
  return result;
}

+ (void)resetSharedInstance
{
  if (sharedInstance)
  {

    sharedInstance = 0;
  }
}

- (AppleSpell)init
{
  AppleSpell *v2;
  _QWORD *v3;
  const CFDictionaryKeyCallBacks *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AppleSpell;
  v2 = -[AppleSpell init](&v6, sel_init);
  v2->_languageModelSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ProofReader.languageModelSerialQueue", 0);
  v2->_lexiconSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ProofReader.lexiconSerialQueue", 0);
  v2->_taggerSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ProofReader.taggerSerialQueue", 0);
  v2->_nerTaggerSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ProofReader.nerTaggerSerialQueue", 0);
  v3 = malloc_type_malloc(0x18uLL, 0x1000040FAD7398DuLL);
  v2->_proofReaderConnection = v3;
  v3[1] = 0;
  v3[2] = 0;
  *v3 = 0;
  if (PRapp((unsigned __int8 *)v2->_proofReaderConnection, 1, 0))
  {
    free(v2->_proofReaderConnection);
    v2->_proofReaderConnection = 0;
  }
  v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  v2->_databaseConnections = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], 0);
  v2->_databaseConnectionsByPathAndCode = CFDictionaryCreateMutable(0, 0, v4, 0);
  v2->_languageModelDicts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->_characterLanguageModelDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->_transformerLanguageModelDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->_sentencePieceLanguageModelDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->_siriLanguageModelDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->_lexiconDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->_phraseLexiconDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->_nerTaggerDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->_cachedTaggers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2->_emojiPredictorDict = CFDictionaryCreateMutable(0, 0, v4, MEMORY[0x1E0C9B3A0]);
  v2->_localDictionaryArrays = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->_userAdaptationDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->_assetDataBundleSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ProofReader.assetDataBundleSerialQueue", 0);
  v2->_assetDataBundleURLDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->_updatedDataBundleLanguages = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v2->_guessRequestTimestamps = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2->_recipientNames = 0;
  v2->_previousSingleCompletion = 0;
  v2->_foundNamesProhibited = 0;
  v2->_hasUpdatedDataBundleLanguages = 0;
  v2->_lastLanguage = 0;
  v2->_lastCandidateLanguage = 0;
  -[AppleSpell resetTimer](v2, "resetTimer");
  return v2;
}

- (id)dataBundle
{
  return +[PRLanguage dataBundle](PRLanguage, "dataBundle");
}

- (id)dataBundlesForLanguageObject:(id)a3
{
  uint64_t v5;
  NSObject *assetDataBundleSerialQueue;
  void *v7;
  NSMutableArray *altBundleURLs;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  NSObject *global_queue;
  _QWORD v20[7];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD block[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = objc_msgSend(a3, "identifier");
  else
    v5 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3052000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  if (v5)
  {
    assetDataBundleSerialQueue = self->_assetDataBundleSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__AppleSpell_dataBundlesForLanguageObject___block_invoke;
    block[3] = &unk_1EA8CCA88;
    block[5] = v5;
    block[6] = &v30;
    block[4] = self;
    dispatch_sync(assetDataBundleSerialQueue, block);
  }
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", -[AppleSpell dataBundle](self, "dataBundle"));
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  v25 = 0u;
  altBundleURLs = self->_altBundleURLs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](altBundleURLs, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(altBundleURLs);
        v12 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        if (v12)
          objc_msgSend(v7, "addObject:", v12);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](altBundleURLs, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v9);
  }
  v13 = (void *)v31[5];
  if (v13)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v36, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v13);
          v17 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
          if (v17)
            objc_msgSend(v7, "addObject:", v17);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v36, 16);
      }
      while (v14);
    }

  }
  else if (v5)
  {
    global_queue = dispatch_get_global_queue(25, 0);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __43__AppleSpell_dataBundlesForLanguageObject___block_invoke_2;
    v20[3] = &unk_1EA8CCAB0;
    v20[4] = self;
    v20[5] = a3;
    v20[6] = v5;
    dispatch_async(global_queue, v20);
  }
  _Block_object_dispose(&v30, 8);
  return v7;
}

id __43__AppleSpell_dataBundlesForLanguageObject___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 400), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    return (id)objc_msgSend(*(id *)(a1[4] + 400), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "array"), a1[5]);
  return result;
}

void __43__AppleSpell_dataBundlesForLanguageObject___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[7];

  v2 = (void *)MEMORY[0x1DF0EACE0]();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "assetDataBundleURLsForLanguageObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 392);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__AppleSpell_dataBundlesForLanguageObject___block_invoke_3;
    block[3] = &unk_1EA8CCAB0;
    block[4] = v4;
    block[5] = v3;
    block[6] = *(_QWORD *)(a1 + 48);
    dispatch_sync(v5, block);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __43__AppleSpell_dataBundlesForLanguageObject___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 400), "setObject:forKey:", a1[5], a1[6]);
  result = objc_msgSend(*(id *)(a1[4] + 408), "addObject:", a1[6]);
  *(_BYTE *)(a1[4] + 578) = 1;
  return result;
}

- (void)resetDataBundlesForLanguageObject:(id)a3
{
  uint64_t v4;
  NSObject *assetDataBundleSerialQueue;
  _QWORD v6[6];

  if (a3)
  {
    v4 = objc_msgSend(a3, "identifier");
    if (v4)
    {
      assetDataBundleSerialQueue = self->_assetDataBundleSerialQueue;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __48__AppleSpell_resetDataBundlesForLanguageObject___block_invoke;
      v6[3] = &unk_1EA8CCAD8;
      v6[4] = self;
      v6[5] = v4;
      dispatch_sync(assetDataBundleSerialQueue, v6);
    }
  }
}

uint64_t __48__AppleSpell_resetDataBundlesForLanguageObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)resetDataBundlesForAllLanguages
{
  NSObject *assetDataBundleSerialQueue;
  _QWORD block[5];

  assetDataBundleSerialQueue = self->_assetDataBundleSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AppleSpell_resetDataBundlesForAllLanguages__block_invoke;
  block[3] = &unk_1EA8CCB00;
  block[4] = self;
  dispatch_sync(assetDataBundleSerialQueue, block);
}

uint64_t __45__AppleSpell_resetDataBundlesForAllLanguages__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "removeAllObjects");
}

- (id)databasePathForLanguageObject:(id)a3
{
  id v4;
  id result;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[AppleSpell dataBundlesForLanguageObject:](self, "dataBundlesForLanguageObject:", 0);
  result = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v11;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
      result = (id)objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Dictionary.dat"), 0, 0, objc_msgSend(a3, "localization"));
      if (result)
        break;
      result = (id)objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Dictionary.dat"), 0, 0, objc_msgSend(a3, "fallbackLocalization"));
      if (result)
        break;
      if (v6 == (id)++v8)
      {
        v6 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        result = 0;
        if (v6)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (void)databaseConnectionForLanguageObject:(id)a3
{
  void *v5;
  char *Value;
  id v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const char *v13;
  const char *v14;
  size_t v15;
  size_t v16;
  char *v17;
  _QWORD *v18;
  int v19;
  char *v20;
  char *v21;
  _QWORD *v22;
  __int16 v24;
  __int16 v25;

  if (a3)
    v5 = (void *)objc_msgSend(a3, "identifier");
  else
    v5 = 0;
  Value = (char *)CFDictionaryGetValue(self->_databaseConnections, v5);
  if (!Value)
  {
    if (!self->_proofReaderConnection)
      return 0;
    v7 = -[AppleSpell databasePathForLanguageObject:](self, "databasePathForLanguageObject:", a3);
    if (!v7)
      return 0;
    v8 = v7;
    Value = (char *)malloc_type_malloc(0x68uLL, 0x10300404E556F13uLL);
    *(_OWORD *)Value = 0u;
    *((_OWORD *)Value + 1) = 0u;
    *((_OWORD *)Value + 2) = 0u;
    *((_OWORD *)Value + 3) = 0u;
    *((_OWORD *)Value + 4) = 0u;
    *((_OWORD *)Value + 5) = 0u;
    *((_QWORD *)Value + 12) = 0;
    *Value = *(_BYTE *)self->_proofReaderConnection;
    v9 = 16;
    Value[24] = 16;
    *(_DWORD *)(Value + 26) = 8388736;
    *((_WORD *)Value + 17) = 0x8000;
    Value[7] = 2;
    *((_WORD *)Value + 4) = 80;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("English")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("en")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("American English")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("AmericanEnglish")) & 1) != 0
      || (objc_msgSend(v5, "hasPrefix:", CFSTR("en_US")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("en-US")))
    {
      goto LABEL_13;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Indian English")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("IndianEnglish")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("en_IN"))
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("Singapore English")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("SingaporeEnglish")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("en_SG")))
    {
LABEL_35:
      v9 = 16;
LABEL_36:
      Value[24] = v9;
      v24 = 64;
LABEL_37:
      *((_WORD *)Value + 13) = v24;
      goto LABEL_14;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Japanese English")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("JapaneseEnglish")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("en_JP"))
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("Chinese English")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("ChineseEnglish")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("en_CN")))
    {
      goto LABEL_44;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Australian English")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("AustralianEnglish")) & 1) != 0
      || (objc_msgSend(v5, "hasPrefix:", CFSTR("en_AU")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("en-AU")))
    {
      goto LABEL_35;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Canadian English")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("CanadianEnglish")) & 1) != 0
      || (objc_msgSend(v5, "hasPrefix:", CFSTR("en_CA")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("en-CA")))
    {
      v9 = 16;
      Value[24] = 16;
      v24 = 32;
      goto LABEL_37;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("New Zealand English")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("NewZealandEnglish")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("en_NZ"))
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("South African English")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("SouthAfricanEnglish")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("en_ZA"))
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("British English")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("BritishEnglish")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("en")))
    {
      goto LABEL_35;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("en")))
    {
LABEL_44:
      v9 = 16;
LABEL_13:
      Value[24] = v9;
      goto LABEL_14;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Swiss German")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("SwissGerman")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("de_CH")))
    {
      v9 = 6;
      goto LABEL_36;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("German")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("de")))
    {
      v9 = 6;
LABEL_71:
      Value[24] = v9;
      v24 = 128;
      goto LABEL_37;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Brazilian Portuguese")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("BrazilianPortuguese")) & 1) != 0
      || (objc_msgSend(v5, "hasPrefix:", CFSTR("pt_BR")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("pt-BR")))
    {
      v9 = 12;
      goto LABEL_36;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("European Portuguese")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("EuropeanPortuguese")) & 1) != 0
      || (objc_msgSend(v5, "hasPrefix:", CFSTR("pt_PT")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("pt-PT"))
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("Portuguese")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("pt")))
    {
      v9 = 12;
      goto LABEL_71;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Arabic")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("ar")))
    {
      v9 = 20;
      goto LABEL_13;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Bulgarian")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("bg")))
    {
      v9 = 25;
      goto LABEL_13;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Catalan")) & 1) != 0
      || objc_msgSend(v5, "hasPrefix:", CFSTR("ca")))
    {
      v9 = 3;
    }
    else
    {
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Czech")) & 1) != 0
        || objc_msgSend(v5, "hasPrefix:", CFSTR("cs")))
      {
        v9 = 1;
        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Danish")) & 1) != 0
        || objc_msgSend(v5, "hasPrefix:", CFSTR("da")))
      {
        v9 = 10;
        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Dutch")) & 1) != 0
        || objc_msgSend(v5, "hasPrefix:", CFSTR("nl")))
      {
        v9 = 11;
        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Finnish")) & 1) != 0
        || objc_msgSend(v5, "hasPrefix:", CFSTR("fi")))
      {
        v9 = 14;
        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("French")) & 1) != 0
        || objc_msgSend(v5, "hasPrefix:", CFSTR("fr")))
      {
        v9 = 5;
        Value[24] = 5;
        v25 = 96;
        goto LABEL_94;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Greek")) & 1) != 0
        || objc_msgSend(v5, "hasPrefix:", CFSTR("el")))
      {
        v9 = 15;
        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Hebrew")) & 1) != 0
        || objc_msgSend(v5, "hasPrefix:", CFSTR("he")))
      {
        v9 = 22;
        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Hungarian")) & 1) != 0
        || objc_msgSend(v5, "hasPrefix:", CFSTR("hu")))
      {
        v9 = 4;
        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Italian")) & 1) != 0
        || objc_msgSend(v5, "hasPrefix:", CFSTR("it")))
      {
        v9 = 9;
        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Korean")) & 1) != 0
        || objc_msgSend(v5, "hasPrefix:", CFSTR("ko")))
      {
        v9 = 29;
        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Norwegian")) & 1) != 0
        || objc_msgSend(v5, "hasPrefix:", CFSTR("nb")))
      {
        v9 = 13;
        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Polish")) & 1) != 0
        || objc_msgSend(v5, "hasPrefix:", CFSTR("pl")))
      {
        v9 = 18;
        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Russian")) & 1) == 0
        && !objc_msgSend(v5, "hasPrefix:", CFSTR("ru")))
      {
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Spanish")) & 1) == 0
          && !objc_msgSend(v5, "hasPrefix:", CFSTR("es")))
        {
          if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Swedish")) & 1) != 0
            || objc_msgSend(v5, "hasPrefix:", CFSTR("sv")))
          {
            v9 = 7;
            goto LABEL_13;
          }
          if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Thai")) & 1) != 0
            || objc_msgSend(v5, "hasPrefix:", CFSTR("th")))
          {
            v9 = 35;
            goto LABEL_13;
          }
          if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Turkish")) & 1) != 0
            || objc_msgSend(v5, "hasPrefix:", CFSTR("tr")))
          {
            v9 = 28;
            goto LABEL_13;
          }
          if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Vietnamese")) & 1) != 0
            || (objc_msgSend(v5, "hasPrefix:", CFSTR("vi")) & 1) != 0)
          {
            v9 = 36;
            goto LABEL_13;
          }
          v9 = Value[24];
LABEL_14:
          v10 = (const void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u:%u:%u:%@"), v9, *((__int16 *)Value + 13), *((__int16 *)Value + 14), v8);
          v11 = CFDictionaryGetValue(self->_databaseConnectionsByPathAndCode, v10);
          if (v11)
          {
            v12 = v11;
            free(Value);
            CFDictionaryAddValue(self->_databaseConnections, v5, v12);
            return (void *)v12;
          }
          v13 = (const char *)objc_msgSend((id)objc_msgSend(v8, "lastPathComponent"), "fileSystemRepresentation");
          v14 = (const char *)objc_msgSend((id)objc_msgSend(v8, "stringByDeletingLastPathComponent"), "fileSystemRepresentation");
          v15 = strlen(v13);
          v16 = strlen(v14);
          v17 = (char *)malloc_type_malloc(v15 + 1, 0xCC94F0B4uLL);
          strncpy(v17, v13, v15 + 1);
          if (Value[24] != 16)
            Value[7] = 1;
          v18 = malloc_type_malloc(0x208uLL, 0x1010040F1668D93uLL);
          *((_QWORD *)Value + 5) = v18;
          *v18 = v17;
          strncpy((char *)(*((_QWORD *)Value + 5) + 8), v14, v16 + 1);
          *(_WORD *)(*((_QWORD *)Value + 5) + 8 + strlen((const char *)(*((_QWORD *)Value + 5) + 8))) = 47;
          v19 = Value[24];
          if (v19 == 18)
          {
            if (v15 < 5)
              goto LABEL_24;
          }
          else if (v15 < 5 || v19 != 4)
          {
            goto LABEL_24;
          }
          v20 = (char *)malloc_type_malloc(v15 + 1, 0xD8971693uLL);
          v21 = &strncpy(v20, v13, v15 + 1)[v15];
          *(_WORD *)(v21 - 3) = 25964;
          *(v21 - 1) = 120;
          v22 = malloc_type_malloc(0x208uLL, 0x1010040F1668D93uLL);
          *((_QWORD *)Value + 9) = v22;
          *v22 = v20;
          __strncpy_chk();
          *(_WORD *)(*((_QWORD *)Value + 9) + 8 + strlen((const char *)(*((_QWORD *)Value + 9) + 8))) = 47;
LABEL_24:
          if (!PRdb((unsigned __int8 *)Value, 1, 0))
          {
            CFDictionaryAddValue(self->_databaseConnections, v5, Value);
            CFDictionaryAddValue(self->_databaseConnectionsByPathAndCode, v10, Value);
            return Value;
          }
          _freeDatabaseConnection(Value);
          return 0;
        }
        v9 = 8;
        Value[24] = 8;
        v25 = 64;
LABEL_94:
        *((_WORD *)Value + 14) = v25;
        goto LABEL_14;
      }
      v9 = 2;
    }
    Value[24] = v9;
    v25 = 128;
    goto LABEL_94;
  }
  return Value;
}

- (void)releaseDatabaseConnections
{
  CFDictionaryApplyFunction(self->_databaseConnectionsByPathAndCode, (CFDictionaryApplierFunction)_releaseDatabaseConnection, 0);
  CFDictionaryRemoveAllValues(self->_databaseConnections);
  CFDictionaryRemoveAllValues(self->_databaseConnectionsByPathAndCode);
}

- (void)loadLexiconsAndLanguageModelsForLanguage:(id)a3
{
  id v4;

  v4 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a3);
  -[AppleSpell lexiconForLanguageObject:](self, "lexiconForLanguageObject:", v4);
  -[AppleSpell loadWordLanguageModelForLanguageObject:](self, "loadWordLanguageModelForLanguageObject:", v4);
}

- (BOOL)spellServer:(id)a3 shouldBlockWord:(id)a4 language:(id)a5 offensiveOnly:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  _BOOL4 v10;
  int v13;

  v6 = a6;
  v9 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a5);
  v10 = -[AppleSpell shouldBlockWord:languageObject:](self, "shouldBlockWord:languageObject:", a4, v9);
  if (v10 && v6)
  {
    v13 = 0;
    LOBYTE(v10) = -[AppleSpell getMetaFlagsForWord:inLexiconForLanguageObject:metaFlags:otherMetaFlags:](self, "getMetaFlagsForWord:inLexiconForLanguageObject:metaFlags:otherMetaFlags:", a4, v9, &v13, 0)&& (v13 & 0x1000000) != 0;
  }
  return v10;
}

- (id)spellServer:(id)a3 regionalCorrectionForWord:(id)a4 language:(id)a5
{
  id v7;
  id result;
  id v9;
  uint64_t v10;
  void *v11;

  v7 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a5);
  result = -[AppleSpell regionalCorrectionsDictionaryForLanguageObject:](self, "regionalCorrectionsDictionaryForLanguageObject:", v7);
  if (result)
  {
    v9 = result;
    result = (id)objc_msgSend(result, "objectForKey:", a4);
    if (!result)
    {
      v10 = objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", objc_msgSend(v7, "localization"));
      v11 = (void *)objc_msgSend(a4, "lowercaseString");
      if (objc_msgSend(a4, "isEqualToString:", initialCapitalizedString(v11, v10)))
      {
        result = (id)objc_msgSend(v9, "objectForKey:", v11);
        if (result)
          return (id)initialCapitalizedString(result, v10);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)_checkGrammarInString:(id)a3 range:(_NSRange)a4 language:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 bufIO:(_PR_BUF_IO *)a8 errorRange:(_NSRange *)a9 details:(id *)a10
{
  NSUInteger length;
  NSUInteger location;
  id v16;
  CFStringEncoding v17;
  CFStringEncoding v19;
  char *var0;
  uint64_t v21;
  CFIndex Bytes;
  unint64_t v23;
  unint64_t v24;
  unint64_t var5;
  BOOL v27;
  unint64_t v28;
  CFRange v29;
  CFIndex v30;
  unint64_t v32;
  unsigned int v33;
  int v35;
  char *v36;
  int var6;
  BOOL v38;
  CFStringEncoding encoding;
  id v41;
  AppleSpell *v42;
  NSUInteger v43;
  CFIndex usedBufLen;
  int v45;

  length = a4.length;
  location = a4.location;
  v45 = 200;
  v16 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a5);
  v17 = objc_msgSend(v16, "encoding");
  if (a6->var6 == 16 && length >= 5)
  {
    v19 = v17;
    var0 = a8->var0;
    objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet"), 0, location, length);
    if (v21)
    {
      encoding = v19;
      v41 = v16;
      v42 = self;
      Bytes = 0;
      v23 = 0;
      v24 = 0;
      v43 = location + length;
      a8->var5 = 0;
      while (1)
      {
        var5 = a8->var5;
        if (v45 == 200 || v24 <= var5)
        {
          usedBufLen = 0;
          if ((_DWORD)var5)
            v27 = v24 > var5;
          else
            v27 = 0;
          if (v27)
          {
            v23 = v24 - var5;
            memmove(var0, &var0[var5], v24 - var5);
            v28 = 1024 - v23;
          }
          else
          {
            v23 = 0;
            v28 = 1024;
          }
          location += Bytes;
          if (v43 <= location)
            return 0;
          if (v43 - location >= v28)
            v29.length = v28;
          else
            v29.length = v43 - location;
          v29.location = location;
          Bytes = CFStringGetBytes((CFStringRef)a3, v29, encoding, 0x5Fu, 0, (UInt8 *)&var0[v23], v28, &usedBufLen);
          v30 = usedBufLen;
          if (Bytes + location >= v43 || usedBufLen < v28)
            a8->var3 = 32;
          v24 = v30 + v23;
          if (!(v30 + v23))
            return 0;
          if (v23 < v24)
          {
            v32 = v23;
            while (1)
            {
              v33 = var0[v32];
              if (v33 < 9 || v33 - 14 < 0x12)
                break;
              v35 = 32;
              if (var0[v32] > 0x9Fu)
              {
                if (var0[v32] > 0xB3u)
                {
                  if (v33 == 187)
                    goto LABEL_51;
                  if (v33 == 180)
                  {
LABEL_39:
                    v35 = 39;
                    goto LABEL_52;
                  }
                }
                else
                {
                  if (v33 == 160)
                    goto LABEL_52;
                  if (v33 == 171)
                  {
LABEL_51:
                    v35 = 34;
                    goto LABEL_52;
                  }
                }
              }
              else
              {
                if (var0[v32] > 0x81u)
                {
                  switch(var0[v32])
                  {
                    case -126:
                    case -124:
                    case -117:
                    case -111:
                    case -110:
                    case -101:
                      goto LABEL_39;
                    case -123:
                    case -105:
                      goto LABEL_52;
                    case -109:
                    case -108:
                      goto LABEL_51;
                    case -106:
                      v35 = 45;
                      goto LABEL_52;
                    default:
                      goto LABEL_53;
                  }
                  goto LABEL_53;
                }
                if (v33 == 92 || v33 == 95)
                  goto LABEL_52;
                if (v33 == 96)
                  goto LABEL_39;
              }
LABEL_53:
              if (v32 + 2 < v24 && v33 == 46)
              {
                v36 = &var0[v32];
                if (var0[v32 + 1] == 46 && v36[2] == 46)
                {
                  v36[2] = 32;
                  v36[1] = 32;
                  var0[v32] = 32;
                }
              }
              ++v32;
              if (!--v30)
                goto LABEL_61;
            }
            v35 = 32;
LABEL_52:
            var0[v32] = v35;
            v33 = v35;
            goto LABEL_53;
          }
LABEL_61:
          LODWORD(var5) = 0;
          var0[v24] = 0;
          a8->var5 = 0;
          a8->var4 = v24;
        }
        if (var0[var5] <= 0x20u)
        {
          do
          {
            LODWORD(var5) = var5 + 1;
            a8->var5 = var5;
          }
          while (var0[(unsigned __int16)var5] < 0x21u);
        }
        var6 = a6->var6;
        v38 = var6 == 16;
        if (var6 != 16
          || -[AppleSpell _checkEnglishGrammarInString:range:indexIntoBuffer:bufferLength:languageObject:connection:sender:bufIO:retval:errorRange:details:](v42, "_checkEnglishGrammarInString:range:indexIntoBuffer:bufferLength:languageObject:connection:sender:bufIO:retval:errorRange:details:", a3, location, Bytes, v23, v24, v41, a6, a7, a8, &v45, a9, a10))
        {
          return v38;
        }
      }
    }
  }
  return 0;
}

- (_NSRange)spellServer:(id)a3 checkGrammarInString:(id)a4 range:(_NSRange)a5 language:(id)a6 orthography:(id)a7 mutableResults:(id)a8 offset:(unint64_t)a9 details:(id *)a10
{
  NSUInteger length;
  NSUInteger v13;
  id v15;
  _BOOL4 v16;
  NSUInteger v17;
  NSUInteger v18;
  _BYTE *v19;
  uint64_t v20;
  NSUInteger v21;
  uint64_t v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  uint64_t v28;
  id v30;
  id v31;
  void *v32;
  NSUInteger v33;
  _BYTE *v34;
  AppleSpell *v35;
  void *v36;
  unint64_t v37;
  NSUInteger location;
  NSUInteger v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  _OWORD v45[5];
  __int128 v46;
  char v47;
  uint64_t v48;
  _NSRange result;

  v48 = *MEMORY[0x1E0C80C00];
  memset(v45, 0, sizeof(v45));
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v41 = 0;
  v40 = 0;
  location = a5.location;
  v39 = 0;
  v37 = 0;
  v46 = xmmword_1DE2EC5B0;
  if (!a6
    || (length = a5.length, v13 = a5.location, v15 = a3, (objc_msgSend(a6, "isEqualToString:", CFSTR("und")) & 1) != 0)
    || (objc_msgSend(a6, "isEqualToString:", CFSTR("Multilingual")) & 1) != 0)
  {
    v16 = 1;
    if (!a10)
      goto LABEL_7;
    goto LABEL_5;
  }
  v19 = -[AppleSpell databaseConnectionForLanguageObject:](self, "databaseConnectionForLanguageObject:", +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a6));
  if (v19 && v19[24] == 16)
  {
    v20 = 0;
    v34 = v19;
    memset((char *)&v45[1] + 8, 0, 56);
    *(_OWORD *)((char *)v45 + 8) = 0u;
    v44 = 0;
    v42 = 0;
    v43 = 0;
    v40 = 0;
    v41 = 0;
    *(_QWORD *)&v45[0] = &v47;
    WORD4(v45[0]) = *(_WORD *)v19;
    HIWORD(v42) = 256;
    v21 = v13 + length;
    *((_QWORD *)&v45[1] + 1) = &v42;
    *(_QWORD *)&v45[2] = &v40;
    BYTE13(v45[3]) = 0;
    while (location < v21)
    {
      objc_msgSend(a4, "getParagraphStart:end:contentsEnd:forRange:", &v39, &location, &v37);
      if (v39 < v21 && v37 > v39 && v37 > v13)
      {
        v35 = self;
        v24 = v20;
        v36 = 0;
        v25 = v37 - v39;
        if (v39 >= v13)
        {
          v26 = v39;
        }
        else
        {
          v25 = v37 - v13;
          v26 = v13;
        }
        if (v37 <= v21)
          v27 = v25;
        else
          v27 = v21 - v26;
        if (v27)
        {
          do
          {
            v46 = xmmword_1DE2EC5B0;
            v28 = -[AppleSpell _checkGrammarInString:range:language:connection:sender:bufIO:errorRange:details:](v35, "_checkGrammarInString:range:language:connection:sender:bufIO:errorRange:details:", a4, v26, v27, a6, v34, v15, v45, &v46, &v36);
            v24 = v28;
            if (!(_DWORD)v28)
              break;
            if ((_QWORD)v46 == 0x7FFFFFFFFFFFFFFFLL || *((_QWORD *)&v46 + 1) == 0)
              break;
            if (!a8)
            {
              if (a10)
                *a10 = v36;
              LOBYTE(v20) = v28;
              self = v35;
              goto LABEL_39;
            }
            v30 = objc_alloc(MEMORY[0x1E0CB3668]);
            v31 = v15;
            v32 = (void *)objc_msgSend(v30, "initWithRange:details:", (_QWORD)v46 + a9, *((_QWORD *)&v46 + 1), v36);
            objc_msgSend(a8, "addObject:", v32);

            v15 = v31;
            v33 = v26 + v27;
            v26 = *((_QWORD *)&v46 + 1) + v46;
            v27 = v33 - (*((_QWORD *)&v46 + 1) + v46);
          }
          while (v33 > *((_QWORD *)&v46 + 1) + (_QWORD)v46);
        }
        v20 = v24;
        self = v35;
      }
    }
LABEL_39:
    PRbuf((uint64_t)v45, 0x11u, 0);
  }
  else
  {
    LOBYTE(v20) = 0;
  }
  v16 = (v20 & 1) == 0;
  if (a10)
  {
LABEL_5:
    if (v16)
      *a10 = 0;
  }
LABEL_7:
  -[AppleSpell resetTimer](self, "resetTimer", a3, a4, a5.location, a5.length);
  v18 = *((_QWORD *)&v46 + 1);
  v17 = v46;
  result.length = v18;
  result.location = v17;
  return result;
}

- (_NSRange)spellServer:(id)a3 checkGrammarInString:(id)a4 language:(id)a5 details:(id *)a6
{
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v6 = -[AppleSpell spellServer:checkGrammarInString:range:language:orthography:mutableResults:offset:details:](self, "spellServer:checkGrammarInString:range:language:orthography:mutableResults:offset:details:", a3, a4, 0, objc_msgSend(a4, "length"), a5, 0, 0, 0, a6);
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)spellServer:(id)a3 checkGrammarInString:(id)a4 range:(_NSRange)a5 language:(id)a6 offset:(unint64_t)a7 options:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;

  length = a5.length;
  location = a5.location;
  v15 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a6);
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_msgSend(a8, "objectForKey:", CFSTR("IgnoreTermination"));
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      LOBYTE(v17) = objc_msgSend(v17, "BOOLValue");
    else
      LOBYTE(v17) = 0;
  }
  -[AppleSpell spellServer:checkGrammarInString:range:language:orthography:mutableResults:offset:details:](self, "spellServer:checkGrammarInString:range:language:orthography:mutableResults:offset:details:", a3, a4, location, length, a6, 0, v16, a7, 0);
  if (-[AppleSpell supportSentenceCorrectionForLanguageObject:appIdentifier:](self, "supportSentenceCorrectionForLanguageObject:appIdentifier:", v15, 0))
  {
    BYTE2(v19) = (_BYTE)v17;
    LOWORD(v19) = 257;
    -[AppleSpell spellServer:checkSentenceCorrectionInString:range:languageObject:offset:keyEventArray:selectedRangeValue:autocorrect:checkGrammar:ignoreTermination:mutableResults:](self, "spellServer:checkSentenceCorrectionInString:range:languageObject:offset:keyEventArray:selectedRangeValue:autocorrect:checkGrammar:ignoreTermination:mutableResults:", a3, a4, location, length, v15, a7, 0, 0, v19, v16);
  }
  return v16;
}

- (_NSRange)spellServer:(id)a3 findMisspelledWordInString:(id)a4 language:(id)a5 wordCount:(int64_t *)a6 countOnly:(BOOL)a7
{
  NSUInteger v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _NSRange result;

  if (a5
    && (objc_msgSend(a5, "isEqualToString:", CFSTR("und")) & 1) == 0
    && !objc_msgSend(a5, "isEqualToString:", CFSTR("Multilingual")))
  {
    v14 = (void *)MEMORY[0x1E0C99D20];
    v16 = (const __CFString *)a5;
    goto LABEL_8;
  }
  v13 = -[NSArray count](self->_userPreferredLatinLanguages, "count");
  v14 = (void *)MEMORY[0x1E0C99D20];
  if (!v13)
  {
    v16 = CFSTR("en");
LABEL_8:
    v15 = objc_msgSend(v14, "arrayWithObject:", v16);
    goto LABEL_9;
  }
  v15 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_userPreferredLatinLanguages);
LABEL_9:
  LOWORD(v21) = a7;
  LODWORD(v20) = 0;
  LOBYTE(v19) = 0;
  v17 = -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](self, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, objc_msgSend(a4, "length"), v15, 0, 0, v19, 0, 0, v20, 0, 0, 0, 0,
          a6,
          v21,
          0);
  result.length = v18;
  result.location = v17;
  return result;
}

- (_NSRange)spellServer:(id)a3 findMisspelledWordInString:(id)a4 language:(id)a5 wordCount:(int64_t *)a6 countOnly:(BOOL)a7 correction:(id *)a8
{
  NSUInteger v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _NSRange result;

  if (a5
    && (objc_msgSend(a5, "isEqualToString:", CFSTR("und")) & 1) == 0
    && !objc_msgSend(a5, "isEqualToString:", CFSTR("Multilingual")))
  {
    v16 = (void *)MEMORY[0x1E0C99D20];
    v18 = (const __CFString *)a5;
    goto LABEL_8;
  }
  v15 = -[NSArray count](self->_userPreferredLatinLanguages, "count");
  v16 = (void *)MEMORY[0x1E0C99D20];
  if (!v15)
  {
    v18 = CFSTR("en");
LABEL_8:
    v17 = objc_msgSend(v16, "arrayWithObject:", v18);
    goto LABEL_9;
  }
  v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_userPreferredLatinLanguages);
LABEL_9:
  LOWORD(v23) = a7;
  BYTE3(v22) = 0;
  BYTE2(v22) = 0;
  LOWORD(v22) = a8 != 0;
  LOBYTE(v21) = 0;
  v19 = -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](self, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, objc_msgSend(a4, "length"), v17, 0, 0, v21, 0, 0, v22, 0, 0, 0, 0,
          a6,
          v23,
          a8);
  result.length = v20;
  result.location = v19;
  return result;
}

- (_NSRange)spellServer:(id)a3 findMisspelledWordInString:(id)a4 languages:(id)a5 wordCount:(int64_t *)a6 countOnly:(BOOL)a7 correction:(id *)a8
{
  id v11;
  void *v15;
  void *v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _NSRange result;

  v11 = a5;
  v15 = (void *)objc_msgSend(a5, "firstObject");
  if (!v15
    || (v16 = v15, (objc_msgSend(v15, "isEqualToString:", CFSTR("und")) & 1) != 0)
    || objc_msgSend(v16, "isEqualToString:", CFSTR("Multilingual")))
  {
    if (-[NSArray count](self->_userPreferredLatinLanguages, "count"))
      v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_userPreferredLatinLanguages);
    else
      v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("en"));
    v11 = (id)v17;
  }
  LOWORD(v22) = a7;
  BYTE3(v21) = 0;
  BYTE2(v21) = 0;
  LOWORD(v21) = a8 != 0;
  LOBYTE(v20) = 0;
  v18 = -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](self, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, objc_msgSend(a4, "length"), v11, 0, 0, v20, 0, 0, v21, 0, 0, 0, 0,
          a6,
          v22,
          a8);
  result.length = v19;
  result.location = v18;
  return result;
}

- (id)spellServer:(id)a3 checkString:(id)a4 offset:(unint64_t)a5 types:(unint64_t)a6 options:(id)a7 orthography:(id)a8 wordCount:(int64_t *)a9
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  BOOL v26;
  int v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSArray *userTopLanguages;
  _BOOL4 userPrefersUncheckedCyrillicLanguage;
  void *v34;
  const __CFString *v35;
  int v36;
  int v37;
  NSArray *userPreferredLanguages;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  char v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSArray *v48;
  int v49;
  uint64_t v50;
  uint64_t j;
  uint64_t v52;
  uint64_t v53;
  NSArray *v54;
  int v55;
  uint64_t v56;
  uint64_t k;
  uint64_t v58;
  uint64_t v59;
  NSArray *v60;
  int v61;
  uint64_t v62;
  uint64_t m;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t n;
  int64_t *v68;
  id v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t ii;
  int v77;
  BOOL v78;
  uint64_t v79;
  void *v81;
  NSArray *userPreferredLatinLanguages;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t jj;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t kk;
  BOOL v93;
  void *v94;
  NSArray *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t mm;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t nn;
  int v105;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  int64_t *v118;
  uint64_t v119;
  uint64_t v120;
  char v121;
  char v122;
  char v123;
  uint64_t v124;
  void *v125;
  int v126;
  char v127;
  char v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v134;
  void *v135;
  int v136;
  void *v137;
  uint64_t v138;
  AppleSpell *v140;
  id v141;
  int obj;
  id obja;
  id objb;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  uint64_t v185;
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  uint64_t v196;

  obj = a6;
  v196 = *MEMORY[0x1E0C80C00];
  v134 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v138 = objc_msgSend(a4, "length");
  v185 = -1;
  v12 = (void *)objc_msgSend(a7, "objectForKey:", CFSTR("KeyEventArray"));
  v130 = _appIdentifierFromOptions(a7);
  v135 = (void *)objc_msgSend(a7, "objectForKey:", CFSTR("RecheckOrthography"));
  v13 = (void *)objc_msgSend(a7, "objectForKey:", CFSTR("InsertionPoint"));
  v14 = (void *)objc_msgSend(a7, "objectForKey:", CFSTR("SelectedRangeLocation"));
  v15 = (void *)objc_msgSend(a7, "objectForKey:", CFSTR("SelectedRangeLength"));
  v16 = (void *)objc_msgSend(a7, "objectForKey:", CFSTR("OnlyAtInsertionPoint"));
  v17 = (void *)objc_msgSend(a7, "objectForKey:", CFSTR("AppendCorrectionLanguage"));
  v18 = objc_msgSend(a7, "objectForKey:", CFSTR("SelectedRange"));
  v141 = a8;
  v19 = objc_msgSend(a8, "dominantScript");
  v137 = v12;
  v125 = (void *)objc_msgSend(v12, "lastObject");
  v129 = objc_msgSend(a7, "objectForKey:", CFSTR("ParameterBundles"));
  v131 = v18;
  if (!v18)
  {
    if (v14 && v15)
    {
      v20 = (void *)MEMORY[0x1E0CB3B18];
      v21 = objc_msgSend(v14, "unsignedIntegerValue");
      v22 = objc_msgSend(v15, "unsignedIntegerValue");
    }
    else
    {
      if (!v13)
      {
        v131 = 0;
        if (v16)
          goto LABEL_9;
        goto LABEL_11;
      }
      v20 = (void *)MEMORY[0x1E0CB3B18];
      v21 = objc_msgSend(v13, "unsignedIntegerValue");
      v22 = 0;
    }
    v131 = objc_msgSend(v20, "valueWithRange:", v21, v22);
  }
  if (v16)
  {
LABEL_9:
    v128 = objc_msgSend(v16, "BOOLValue");
    goto LABEL_12;
  }
LABEL_11:
  v128 = 0;
LABEL_12:
  v23 = (uint64_t)v141;
  v24 = v12;
  if (v17)
    v127 = objc_msgSend(v17, "BOOLValue");
  else
    v127 = 0;
  v140 = self;
  if (objc_msgSend(CFSTR("Cyrl"), "isEqualToString:", v19))
  {
    v25 = (__CFString *)objc_msgSend(v141, "dominantLanguage");
    v26 = !self->_userPrefersUncheckedCyrillicLanguage;
    v27 = *(_DWORD *)&v26 & (obj >> 2);
    v28 = *(_DWORD *)&v26 & (obj >> 1);
    if (!v25)
      goto LABEL_24;
  }
  else
  {
    v27 = (obj >> 2) & 1;
    v28 = (obj >> 1) & 1;
    if (objc_msgSend(CFSTR("Kore"), "isEqualToString:", v19)
      || (v29 = objc_msgSend(v141, "dominantLanguageForScript:", CFSTR("Latn"))) == 0)
    {
      v25 = (__CFString *)objc_msgSend(v141, "dominantLanguage");
      if (!v25)
        goto LABEL_24;
    }
    else
    {
      v25 = (__CFString *)v29;
    }
  }
  if ((-[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("und")) & 1) != 0
    || -[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("Multilingual")))
  {
LABEL_24:
    if (objc_msgSend(CFSTR("Cyrl"), "isEqualToString:", v19))
    {
      v30 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", CFSTR("ru"));
      objc_msgSend(v30, "addObjectsFromArray:", self->_userPreferredLanguages);
      v31 = (void *)objc_msgSend(v30, "array");
      v126 = 0;
      userTopLanguages = 0;
      userPrefersUncheckedCyrillicLanguage = self->_userPrefersUncheckedCyrillicLanguage;
LABEL_26:
      if (userPrefersUncheckedCyrillicLanguage)
      {
        v27 = 0;
        v28 = 0;
      }
      goto LABEL_65;
    }
    if (objc_msgSend(CFSTR("Kore"), "isEqualToString:", v19))
    {
      v34 = (void *)MEMORY[0x1E0C99E10];
      v35 = CFSTR("ko");
    }
    else if (objc_msgSend(CFSTR("Arab"), "isEqualToString:", v19))
    {
      v34 = (void *)MEMORY[0x1E0C99E10];
      v35 = CFSTR("ar");
    }
    else if (objc_msgSend(CFSTR("Grek"), "isEqualToString:", v19))
    {
      v34 = (void *)MEMORY[0x1E0C99E10];
      v35 = CFSTR("el");
    }
    else if (objc_msgSend(CFSTR("Deva"), "isEqualToString:", v19))
    {
      v34 = (void *)MEMORY[0x1E0C99E10];
      v35 = CFSTR("hi");
    }
    else if (objc_msgSend(CFSTR("Telu"), "isEqualToString:", v19))
    {
      v34 = (void *)MEMORY[0x1E0C99E10];
      v35 = CFSTR("te");
    }
    else
    {
      if (!objc_msgSend(CFSTR("Guru"), "isEqualToString:", v19))
      {
        if (-[NSArray count](self->_userPreferredLatinLanguages, "count"))
          v107 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_userPreferredLatinLanguages);
        else
          v107 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("en"));
        v31 = v107;
        if (v125)
        {
          if (objc_msgSend(v107, "containsObject:", CFSTR("tr")))
          {
            objc_msgSend((id)objc_msgSend(v125, "keyboardLayoutIdentifier"), "rangeOfString:", CFSTR("Turkish"));
            if (v109)
            {
              v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v31);
              objc_msgSend(v31, "removeObject:", CFSTR("tr"));
              objc_msgSend(v31, "insertObject:atIndex:", CFSTR("tr"), 0);
            }
          }
          if (objc_msgSend(v31, "containsObject:", CFSTR("vi"))
            && (objc_msgSend((id)objc_msgSend(v125, "primaryLanguage"), "isEqualToString:", CFSTR("vi")) & 1) == 0)
          {
            v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v31);
            objc_msgSend(v31, "removeObject:", CFSTR("vi"));
            objc_msgSend(v31, "addObject:", CFSTR("vi"));
          }
        }
        v126 = 0;
        userTopLanguages = 0;
        userPrefersUncheckedCyrillicLanguage = self->_userPrefersUncheckedLatinLanguage;
        goto LABEL_26;
      }
      v34 = (void *)MEMORY[0x1E0C99E10];
      v35 = CFSTR("pa");
    }
    v45 = (void *)objc_msgSend(v34, "orderedSetWithObject:", v35);
    objc_msgSend(v45, "addObjectsFromArray:", self->_userPreferredLanguages);
    v31 = (void *)objc_msgSend(v45, "array");
    v126 = 0;
    userTopLanguages = 0;
LABEL_65:
    v44 = 1;
    v25 = CFSTR("Multilingual");
    goto LABEL_66;
  }
  if ((-[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("en")) & 1) != 0
    || -[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("pt")))
  {
    v36 = v28;
    v37 = v27;
    v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v181 = 0u;
    v182 = 0u;
    v183 = 0u;
    v184 = 0u;
    userPreferredLanguages = self->_userPreferredLanguages;
    v39 = -[NSArray countByEnumeratingWithState:objects:count:](userPreferredLanguages, "countByEnumeratingWithState:objects:count:", &v181, v195, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v182;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v182 != v41)
            objc_enumerationMutation(userPreferredLanguages);
          v43 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * i);
          if (objc_msgSend(v43, "hasPrefix:", v25))
            objc_msgSend(v31, "addObject:", v43);
        }
        v40 = -[NSArray countByEnumeratingWithState:objects:count:](userPreferredLanguages, "countByEnumeratingWithState:objects:count:", &v181, v195, 16);
      }
      while (v40);
    }
    v27 = v37;
    if (!objc_msgSend(v31, "count"))
      objc_msgSend(v31, "addObject:", v25);
    v23 = (uint64_t)v141;
    v24 = v137;
    v28 = v36;
  }
  else
  {
    if ((objc_msgSend(CFSTR("Kore"), "isEqualToString:", v19) & 1) != 0
      || (objc_msgSend(CFSTR("Grek"), "isEqualToString:", v19) & 1) != 0
      || (objc_msgSend(CFSTR("Telu"), "isEqualToString:", v19) & 1) != 0
      || objc_msgSend(CFSTR("Guru"), "isEqualToString:", v19))
    {
      v31 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v25);
LABEL_59:
      v126 = 0;
      v44 = 0;
      userTopLanguages = 0;
      goto LABEL_66;
    }
    v31 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v25);
  }
  if (!v135 || !objc_msgSend(v135, "BOOLValue"))
    goto LABEL_59;
  v44 = 0;
  userTopLanguages = v140->_userTopLanguages;
  v126 = 1;
LABEL_66:
  v136 = v27;
  if (objc_msgSend(CFSTR("Arab"), "isEqualToString:", v19))
  {
    if ((objc_msgSend(v31, "containsObject:", CFSTR("ur")) & 1) == 0)
    {
      v179 = 0u;
      v180 = 0u;
      v177 = 0u;
      v178 = 0u;
      v46 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v177, v194, 16);
      if (v46)
      {
        v47 = v46;
        v121 = v44;
        v48 = userTopLanguages;
        v49 = v28;
        v50 = *(_QWORD *)v178;
        while (2)
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v178 != v50)
              objc_enumerationMutation(v24);
            if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v177 + 1) + 8 * j), "primaryLanguage"), "isEqualToString:", CFSTR("ur")))
            {
              v31 = (void *)objc_msgSend(v31, "arrayByAddingObject:", CFSTR("ur"));
              goto LABEL_78;
            }
          }
          v47 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v177, v194, 16);
          if (v47)
            continue;
          break;
        }
LABEL_78:
        v23 = (uint64_t)v141;
        v27 = v136;
        v28 = v49;
        userTopLanguages = v48;
        v44 = v121;
      }
    }
  }
  if (objc_msgSend(CFSTR("Cyrl"), "isEqualToString:", v19)
    && (objc_msgSend(v31, "containsObject:", CFSTR("bg")) & 1) == 0)
  {
    v175 = 0u;
    v176 = 0u;
    v173 = 0u;
    v174 = 0u;
    v52 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v173, v193, 16);
    if (v52)
    {
      v53 = v52;
      v122 = v44;
      v54 = userTopLanguages;
      v55 = v28;
      v56 = *(_QWORD *)v174;
      while (2)
      {
        for (k = 0; k != v53; ++k)
        {
          if (*(_QWORD *)v174 != v56)
            objc_enumerationMutation(v24);
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * k), "primaryLanguage"), "isEqualToString:", CFSTR("bg")))
          {
            v31 = (void *)objc_msgSend(v31, "arrayByAddingObject:", CFSTR("bg"));
            goto LABEL_91;
          }
        }
        v53 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v173, v193, 16);
        if (v53)
          continue;
        break;
      }
LABEL_91:
      v23 = (uint64_t)v141;
      v27 = v136;
      v28 = v55;
      userTopLanguages = v54;
      v44 = v122;
    }
    else
    {
      v27 = v136;
    }
  }
  if (objc_msgSend(CFSTR("Cyrl"), "isEqualToString:", v19)
    && (objc_msgSend(v31, "containsObject:", CFSTR("uk")) & 1) == 0)
  {
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    v58 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v169, v192, 16);
    if (v58)
    {
      v59 = v58;
      v123 = v44;
      v60 = userTopLanguages;
      v61 = v28;
      v62 = *(_QWORD *)v170;
      while (2)
      {
        for (m = 0; m != v59; ++m)
        {
          if (*(_QWORD *)v170 != v62)
            objc_enumerationMutation(v24);
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v169 + 1) + 8 * m), "primaryLanguage"), "isEqualToString:", CFSTR("uk")))
          {
            v31 = (void *)objc_msgSend(v31, "arrayByAddingObject:", CFSTR("uk"));
            goto LABEL_105;
          }
        }
        v59 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v169, v192, 16);
        if (v59)
          continue;
        break;
      }
LABEL_105:
      v23 = (uint64_t)v141;
      v27 = v136;
      v28 = v61;
      userTopLanguages = v60;
      v44 = v123;
    }
    else
    {
      v27 = v136;
    }
  }
  if (objc_msgSend(CFSTR("Deva"), "isEqualToString:", v19)
    && (objc_msgSend(v31, "containsObject:", CFSTR("mr")) & 1) == 0)
  {
    v167 = 0u;
    v168 = 0u;
    v165 = 0u;
    v166 = 0u;
    v64 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v165, v191, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v166;
      while (2)
      {
        for (n = 0; n != v65; ++n)
        {
          if (*(_QWORD *)v166 != v66)
            objc_enumerationMutation(v24);
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * n), "primaryLanguage"), "isEqualToString:", CFSTR("mr")))
          {
            v31 = (void *)objc_msgSend(v31, "arrayByAddingObject:", CFSTR("mr"));
            goto LABEL_119;
          }
        }
        v65 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v165, v191, 16);
        if (v65)
          continue;
        break;
      }
LABEL_119:
      v23 = (uint64_t)v141;
      v27 = v136;
    }
    else
    {
      v23 = (uint64_t)v141;
    }
  }
  v68 = a9;
  if ((-[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("Multilingual")) & 1) != 0)
  {
    v69 = 0;
    if (!v28)
    {
LABEL_123:
      if (a9)
      {
        LOWORD(v115) = 1;
        LODWORD(v112) = 0;
        LOBYTE(v110) = 0;
        v70 = a4;
        -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](v140, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, v138, v31, 0, v23, v110, 0, 0, v112, 0, 0, 0, 0,
          &v185,
          v115,
          0);
      }
      else
      {
        v70 = a4;
      }
      v71 = v134;
      goto LABEL_216;
    }
  }
  else
  {
    v69 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", v25);
    if (!v28)
      goto LABEL_123;
  }
  v119 = obj & 0x80000202;
  v120 = obj & 0x40000202;
  v124 = obj & 0x202;
  BYTE1(v115) = v127;
  LOBYTE(v115) = 0;
  v114 = v24;
  BYTE1(v112) = v128;
  v70 = a4;
  v71 = v134;
  LOBYTE(v110) = v44;
  BYTE3(v112) = v119 == 2147484162;
  BYTE2(v112) = v120 == 1073742338;
  LOBYTE(v112) = v124 == 514;
  -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](v140, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, v138, v31, userTopLanguages, v23, v110, v134, a5, v112, v114, v130, v131, v129,
    &v185,
    v115,
    0);
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v72 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v161, v190, 16);
  if (v72)
  {
    v73 = v72;
    v74 = 0;
    v75 = *(_QWORD *)v162;
    do
    {
      for (ii = 0; ii != v73; ++ii)
      {
        if (*(_QWORD *)v162 != v75)
          objc_enumerationMutation(v134);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v161 + 1) + 8 * ii), "resultType") == 2)
          ++v74;
      }
      v73 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v161, v190, 16);
    }
    while (v73);
  }
  else
  {
    v74 = 0;
  }
  v77 = v126;
  if (v185 <= 0)
    v77 = 0;
  if (v77 != 1)
    goto LABEL_216;
  if ((unint64_t)v185 >= 6)
  {
    v78 = v185 >= 2 * v74 || v69 == 0;
    if (!v78
      && (objc_msgSend(v69, "isGreek") & 1) == 0
      && (objc_msgSend(v69, "isKorean") & 1) == 0
      && (objc_msgSend(v69, "isPunjabi") & 1) == 0
      && (objc_msgSend(v69, "isTelugu") & 1) == 0)
    {
      if (-[NSArray count](v140->_userPreferredLatinLanguages, "count"))
        v108 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v140->_userPreferredLatinLanguages);
      else
        v108 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("en"));
      objb = (id)v108;
      v23 = objc_msgSend(MEMORY[0x1E0CB3840], "orthographyWithDominantScript:languageMap:", CFSTR("Latn"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("und")), CFSTR("Latn")));
      objc_msgSend(v134, "removeAllObjects");
      BYTE1(v116) = v127;
      LOBYTE(v116) = 0;
      BYTE3(v113) = v119 == 2147484162;
      BYTE2(v113) = v120 == 1073742338;
      BYTE1(v113) = v128;
      LOBYTE(v113) = v124 == 514;
      LOBYTE(v111) = 1;
      -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](v140, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, v138, objb, 0, v23, v111, v134, a5, v113, v137, v130, v131, v129,
        &v185,
        v116,
        0);
      v27 = v136;
      goto LABEL_216;
    }
  }
  v79 = v185;
  if (v185 <= 5 && v74 >= 1 && v69 != 0)
  {
    if ((objc_msgSend(v69, "isItalian") & 1) != 0
      || (objc_msgSend(v69, "isSpanish") & 1) != 0
      || (objc_msgSend(v69, "isPortuguese") & 1) != 0)
    {
      v117 = v69;
      v118 = a9;
      v81 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      obja = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v157 = 0u;
      v158 = 0u;
      v159 = 0u;
      v160 = 0u;
      userPreferredLatinLanguages = v140->_userPreferredLatinLanguages;
      v83 = -[NSArray countByEnumeratingWithState:objects:count:](userPreferredLatinLanguages, "countByEnumeratingWithState:objects:count:", &v157, v189, 16);
      if (v83)
      {
        v84 = v83;
        v85 = *(_QWORD *)v158;
        do
        {
          for (jj = 0; jj != v84; ++jj)
          {
            if (*(_QWORD *)v158 != v85)
              objc_enumerationMutation(userPreferredLatinLanguages);
            v87 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * jj);
            if ((objc_msgSend(v87, "hasPrefix:", CFSTR("it")) & 1) != 0
              || (objc_msgSend(v87, "hasPrefix:", CFSTR("es")) & 1) != 0
              || objc_msgSend(v87, "hasPrefix:", CFSTR("pt")))
            {
              objc_msgSend(v81, "addObject:", v87);
            }
          }
          v84 = -[NSArray countByEnumeratingWithState:objects:count:](userPreferredLatinLanguages, "countByEnumeratingWithState:objects:count:", &v157, v189, 16);
        }
        while (v84);
      }
      v70 = a4;
      v71 = v134;
      v23 = (uint64_t)v141;
      v27 = v136;
      v69 = v117;
      v68 = a9;
      if (objc_msgSend(v81, "count"))
      {
        v23 = objc_msgSend(MEMORY[0x1E0CB3840], "orthographyWithDominantScript:languageMap:", CFSTR("Latn"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("und")), CFSTR("Latn")));
        BYTE1(v116) = v127;
        LOBYTE(v116) = 0;
        BYTE3(v113) = v119 == 2147484162;
        BYTE2(v113) = v120 == 1073742338;
        BYTE1(v113) = v128;
        LOBYTE(v113) = v124 == 514;
        LOBYTE(v111) = 1;
        -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](v140, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, v138, v81, 0, v23, v111, obja, a5, v113, v137, v130, v131, v129,
          &v185,
          v116,
          0);
        v153 = 0u;
        v154 = 0u;
        v155 = 0u;
        v156 = 0u;
        v88 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v153, v188, 16);
        if (v88)
        {
          v89 = v88;
          v90 = 0;
          v91 = *(_QWORD *)v154;
          v27 = v136;
          v69 = v117;
          do
          {
            for (kk = 0; kk != v89; ++kk)
            {
              if (*(_QWORD *)v154 != v91)
                objc_enumerationMutation(obja);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * kk), "resultType") == 2)
                ++v90;
            }
            v89 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v153, v188, 16);
          }
          while (v89);
          goto LABEL_213;
        }
LABEL_212:
        v90 = 0;
        v27 = v136;
        v69 = v117;
LABEL_213:
        if (v90 < v74)
          v71 = obja;
        v68 = v118;
        goto LABEL_216;
      }
      goto LABEL_216;
    }
    v79 = v185;
  }
  if (v79 <= 20)
  {
    v93 = v74 < 1 || v69 == 0;
    if (!v93
      && ((objc_msgSend(v69, "isDanish") & 1) != 0
       || (objc_msgSend(v69, "isNorwegian") & 1) != 0
       || objc_msgSend(v69, "isSwedish")))
    {
      v117 = v69;
      v118 = a9;
      v94 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      obja = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v149 = 0u;
      v150 = 0u;
      v151 = 0u;
      v152 = 0u;
      v95 = v140->_userPreferredLatinLanguages;
      v96 = -[NSArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v149, v187, 16);
      if (v96)
      {
        v97 = v96;
        v98 = *(_QWORD *)v150;
        do
        {
          for (mm = 0; mm != v97; ++mm)
          {
            if (*(_QWORD *)v150 != v98)
              objc_enumerationMutation(v95);
            v100 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * mm);
            if ((objc_msgSend(v100, "hasPrefix:", CFSTR("da")) & 1) != 0
              || (objc_msgSend(v100, "hasPrefix:", CFSTR("nb")) & 1) != 0
              || objc_msgSend(v100, "hasPrefix:", CFSTR("sv")))
            {
              objc_msgSend(v94, "addObject:", v100);
            }
          }
          v97 = -[NSArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v149, v187, 16);
        }
        while (v97);
      }
      v70 = a4;
      v71 = v134;
      v23 = (uint64_t)v141;
      v27 = v136;
      v69 = v117;
      v68 = a9;
      if (objc_msgSend(v94, "count"))
      {
        v23 = objc_msgSend(MEMORY[0x1E0CB3840], "orthographyWithDominantScript:languageMap:", CFSTR("Latn"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("und")), CFSTR("Latn")));
        BYTE1(v116) = v127;
        LOBYTE(v116) = 0;
        BYTE3(v113) = v119 == 2147484162;
        BYTE2(v113) = v120 == 1073742338;
        BYTE1(v113) = v128;
        LOBYTE(v113) = v124 == 514;
        LOBYTE(v111) = 1;
        -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](v140, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, v138, v94, 0, v23, v111, obja, a5, v113, v137, v130, v131, v129,
          &v185,
          v116,
          0);
        v145 = 0u;
        v146 = 0u;
        v147 = 0u;
        v148 = 0u;
        v101 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v145, v186, 16);
        if (v101)
        {
          v102 = v101;
          v90 = 0;
          v103 = *(_QWORD *)v146;
          v27 = v136;
          v69 = v117;
          do
          {
            for (nn = 0; nn != v102; ++nn)
            {
              if (*(_QWORD *)v146 != v103)
                objc_enumerationMutation(obja);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * nn), "resultType") == 2)
                ++v90;
            }
            v102 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v145, v186, 16);
          }
          while (v102);
          goto LABEL_213;
        }
        goto LABEL_212;
      }
    }
  }
LABEL_216:
  if (v69)
    v105 = v27;
  else
    v105 = 0;
  if (v105 == 1)
    -[AppleSpell spellServer:checkGrammarInString:range:language:orthography:mutableResults:offset:details:](v140, "spellServer:checkGrammarInString:range:language:orthography:mutableResults:offset:details:", a3, v70, 0, v138, objc_msgSend(v69, "identifier"), v23, v71, a5, 0);
  if (v68)
    *v68 = v185;
  return v71;
}

- (id)spellServer:(id)a3 generateCandidatesForSelectedRange:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 types:(unint64_t)a7 options:(id)a8 orthography:(id)a9
{
  return -[AppleSpell spellServer:candidatesForSelectedRange:inString:offset:types:options:orthography:](self, "spellServer:candidatesForSelectedRange:inString:offset:types:options:orthography:", a3, a4.location, a4.length, a5, a6, a7);
}

- (id)spellServer:(id)a3 suggestGuessesForWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6
{
  return -[AppleSpell spellServer:suggestGuessesForWordRange:inString:inLanguage:options:](self, "spellServer:suggestGuessesForWordRange:inString:inLanguage:options:", a3, a4.location, a4.length, a5, a6, 0);
}

- (id)spellServer:(id)a3 suggestGuessesForWord:(id)a4 inLanguage:(id)a5
{
  return -[AppleSpell spellServer:suggestGuessesForWordRange:inString:inLanguage:options:](self, "spellServer:suggestGuessesForWordRange:inString:inLanguage:options:", a3, 0, objc_msgSend(a4, "length"), a4, a5, 0);
}

- (id)spellServer:(id)a3 suggestGuessDictionariesForWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6 options:(id)a7 errorModel:(id)a8
{
  return -[AppleSpell spellServer:suggestGuessDictionariesForWordRange:inString:inLanguage:options:errorModel:](self, "spellServer:suggestGuessDictionariesForWordRange:inString:inLanguage:options:errorModel:", a3, a4.location, a4.length, a5, a6, a7);
}

- (id)spellServer:(id)a3 suggestCompletionsForPartialWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6
{
  return -[AppleSpell spellServer:suggestCompletionsForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestCompletionsForPartialWordRange:inString:inLanguage:options:", a3, a4.location, a4.length, a5, a6, 0);
}

- (id)spellServer:(id)a3 suggestCompletionDictionariesForPartialWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6
{
  return -[AppleSpell spellServer:suggestCompletionDictionariesForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestCompletionDictionariesForPartialWordRange:inString:inLanguage:options:", a3, a4.location, a4.length, a5, a6, 0);
}

- (id)spellServer:(id)a3 suggestNextLetterDictionariesForPartialWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6
{
  return -[AppleSpell spellServer:suggestNextLetterDictionariesForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestNextLetterDictionariesForPartialWordRange:inString:inLanguage:options:", a3, a4.location, a4.length, a5, a6, 0);
}

- (id)spellServer:(id)a3 suggestWordWithLengthInRange:(_NSRange)a4 language:(id)a5
{
  return -[AppleSpell spellServer:suggestWordWithMinimumLength:maximumLength:language:](self, "spellServer:suggestWordWithMinimumLength:maximumLength:language:", a3);
}

- (id)spellServer:(id)a3 stringForInputString:(id)a4 language:(id)a5
{
  NSUInteger v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  CFStringEncoding v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFStringRef v18;
  CFIndex v19;
  CFIndex Bytes;
  CFIndex v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFIndex v27;
  CFIndex usedBufLen;
  CFStringRef theString;
  UInt8 v30[25];
  UInt8 buffer[25];
  uint64_t v32;
  CFRange v33;
  CFRange v34;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a5
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("und")) & 1) != 0
    || objc_msgSend(a5, "isEqualToString:", CFSTR("Multilingual")))
  {
    v9 = -[NSArray count](self->_userPreferredLatinLanguages, "count");
    v10 = (void *)MEMORY[0x1E0C99D20];
    if (v9)
    {
      v11 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_userPreferredLatinLanguages);
      goto LABEL_9;
    }
    v12 = CFSTR("en");
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C99D20];
    v12 = (const __CFString *)a5;
  }
  v11 = objc_msgSend(v10, "arrayWithObject:", v12);
LABEL_9:
  v13 = v11;
  v14 = objc_msgSend(+[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a5), "encoding");
  v15 = objc_msgSend(a4, "length");
  theString = 0;
  LOWORD(v26) = 0;
  LODWORD(v25) = 1;
  LOBYTE(v24) = 0;
  -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](self, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, v15, v13, 0, 0, v24, 0, 0, v25, 0, 0, 0, 0,
    0,
    v26,
    &theString);
  if (v16)
  {
    v27 = 0;
    usedBufLen = 0;
    v17 = -[__CFString length]((id)theString, "length");
    v18 = 0;
    if (v15 >= 5)
    {
      if (theString)
      {
        v19 = v17;
        v33.location = 0;
        v33.length = v15;
        Bytes = CFStringGetBytes((CFStringRef)a4, v33, v14, 0x5Fu, 0, buffer, 24, &usedBufLen);
        v18 = 0;
        if (v15 == Bytes)
        {
          v34.location = 0;
          v34.length = v19;
          v21 = CFStringGetBytes(theString, v34, v14, 0x5Fu, 0, v30, 24, &v27);
          v18 = 0;
          if (v19 == v21)
          {
            v22 = effectiveEditDistance((uint64_t)buffer, usedBufLen, (uint64_t)v30, v27);
            v18 = theString;
            if (v22 != 1)
              return 0;
          }
        }
      }
    }
    return (id)v18;
  }
  return a4;
}

- (BOOL)spellServer:(id)a3 canChangeCaseOfFirstLetterInString:(id)a4 toUpperCase:(BOOL)a5 language:(id)a6
{
  return -[AppleSpell _spellServer:canChangeCaseOfFirstLetterInString:toUpperCase:languageObject:](self, "_spellServer:canChangeCaseOfFirstLetterInString:toUpperCase:languageObject:", a3, a4, a5, +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a6));
}

- (id)sentenceTerminatorCharacterSet
{
  if (sentenceTerminatorCharacterSet_onceToken != -1)
    dispatch_once(&sentenceTerminatorCharacterSet_onceToken, &__block_literal_global);
  return (id)sentenceTerminatorCharacterSet_terminatorCharacterSet;
}

id __62__AppleSpell_LanguageModeling__sentenceTerminatorCharacterSet__block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".!?։۔।።᙮‼‽⁇⁈⁉。！．？｡"));
  sentenceTerminatorCharacterSet_terminatorCharacterSet = (uint64_t)result;
  return result;
}

- (id)_standardizedLanguageModelStringForString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;

  if ((_standardizedLanguageModelStringForString__initedStrings & 1) == 0)
  {
    v14 = 8216;
    v13 = 8217;
    v12 = 8220;
    v11 = 8221;
    v10 = 0;
    _standardizedLanguageModelStringForString__curlyOpenSingleQuote = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v14, 1);
    _standardizedLanguageModelStringForString__curlyCloseSingleQuote = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v13, 1);
    _standardizedLanguageModelStringForString__curlyOpenDoubleQuote = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v12, 1);
    _standardizedLanguageModelStringForString__curlyCloseDoubleQuote = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v11, 1);
    _standardizedLanguageModelStringForString__embeddedNull = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v10, 1);
    _standardizedLanguageModelStringForString__initedStrings = 1;
  }
  objc_msgSend(a3, "rangeOfString:", _standardizedLanguageModelStringForString__curlyOpenSingleQuote);
  if (v4)
    a3 = (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", _standardizedLanguageModelStringForString__curlyOpenSingleQuote, CFSTR("'"));
  objc_msgSend(a3, "rangeOfString:", _standardizedLanguageModelStringForString__curlyCloseSingleQuote);
  if (v5)
    a3 = (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", _standardizedLanguageModelStringForString__curlyCloseSingleQuote, CFSTR("'"));
  objc_msgSend(a3, "rangeOfString:", _standardizedLanguageModelStringForString__curlyOpenDoubleQuote);
  if (v6)
    a3 = (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", _standardizedLanguageModelStringForString__curlyOpenDoubleQuote, CFSTR("\"));
  objc_msgSend(a3, "rangeOfString:", _standardizedLanguageModelStringForString__curlyCloseDoubleQuote);
  if (v7)
    a3 = (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", _standardizedLanguageModelStringForString__curlyCloseDoubleQuote, CFSTR("\"));
  objc_msgSend(a3, "rangeOfString:", _standardizedLanguageModelStringForString__embeddedNull);
  if (v8)
    return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", _standardizedLanguageModelStringForString__embeddedNull, CFSTR("_"));
  return a3;
}

- (unsigned)_tokenIDForString:(id)a3 languageModel:(id)a4 languageObject:(id)a5 createIfAbsent:(BOOL)a6 terminatorTokenID:(unsigned int)a7
{
  uint64_t v12;
  int v13;
  id v14;
  id v15;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__AppleSpell_LanguageModeling___tokenIDForString_languageModel_languageObject_createIfAbsent_terminatorTokenID___block_invoke;
  block[3] = &unk_1EA8CCB00;
  block[4] = self;
  if (_tokenIDForString_languageModel_languageObject_createIfAbsent_terminatorTokenID__onceToken != -1)
  {
    dispatch_once(&_tokenIDForString_languageModel_languageObject_createIfAbsent_terminatorTokenID__onceToken, block);
    if (a4)
      goto LABEL_3;
    return 0;
  }
  if (!a4)
    return 0;
LABEL_3:
  if (!objc_msgSend(a3, "length")
    || (objc_msgSend(a3, "rangeOfCharacterFromSet:", _tokenIDForString_languageModel_languageObject_createIfAbsent_terminatorTokenID__nonTerminatorSet), v12)|| (objc_msgSend(a3, "isEqualToString:", CFSTR("..")) & 1) != 0|| objc_msgSend(a3, "isEqualToString:", CFSTR("...")))
  {
    v13 = objc_msgSend(a5, "isKorean");
    v14 = -[AppleSpell _standardizedLanguageModelStringForString:](self, "_standardizedLanguageModelStringForString:", a3);
    if (v13)
    {
      v15 = -[AppleSpell internalStringForKoreanExternalString:](self, "internalStringForKoreanExternalString:", v14);
      return objc_msgSend(a4, "tokenIDForString:", v15);
    }
    a7 = objc_msgSend(a4, "tokenIDForString:", v14);
    if (!a7)
    {
      v15 = (id)objc_msgSend(v14, "lowercaseString");
      return objc_msgSend(a4, "tokenIDForString:", v15);
    }
  }
  return a7;
}

id __112__AppleSpell_LanguageModeling___tokenIDForString_languageModel_languageObject_createIfAbsent_terminatorTokenID___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sentenceTerminatorCharacterSet"), "invertedSet");
  _tokenIDForString_languageModel_languageObject_createIfAbsent_terminatorTokenID__nonTerminatorSet = (uint64_t)result;
  return result;
}

- (unsigned)_tokenIDForString:(id)a3 languageModel:(id)a4 languageObject:(id)a5 terminatorTokenID:(unsigned int)a6
{
  return -[AppleSpell _tokenIDForString:languageModel:languageObject:createIfAbsent:terminatorTokenID:](self, "_tokenIDForString:languageModel:languageObject:createIfAbsent:terminatorTokenID:", a3, a4, a5, 0, *(_QWORD *)&a6);
}

- (id)_stringForTokenIDs:(const unsigned int *)a3 tokenCount:(unint64_t)a4 entryString:(id)a5 languageModel:(id)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8 sender:(id)a9 prefix:(id)a10 capitalized:(BOOL)a11
{
  void *v16;
  uint64_t v17;
  __CFString *v18;
  int v19;
  uint64_t v20;
  CFIndex v21;
  int v22;
  int v23;
  __CFString *v24;
  int v25;
  id result;
  CFIndex *usedBufLen;
  uint64_t v28;
  CFStringEncoding encoding;
  CFIndex v32;
  UInt8 buffer[256];
  uint64_t v34;
  CFRange v35;

  v34 = *MEMORY[0x1E0C80C00];
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  encoding = objc_msgSend(a7, "encoding");
  if (!a6)
    return 0;
  if (a4)
  {
    v17 = 0;
    v28 = 0;
    do
    {
      if (a3[v17] < 0x1F4)
        v18 = 0;
      else
        v18 = (__CFString *)objc_msgSend(a6, "stringForTokenID:");
      v19 = objc_msgSend(a7, "isArabic");
      if (!a5 || v17)
      {
        if (!v18)
          goto LABEL_42;
      }
      else if (v18)
      {
        if (v19 && !-[__CFString isEqualToString:](v18, "isEqualToString:", a5))
          v18 = (__CFString *)a5;
      }
      else
      {
        v18 = (__CFString *)a5;
        if (*a3)
          goto LABEL_42;
      }
      if ((-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("NUMBER")) & 1) != 0
        || (-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("LINK")) & 1) != 0)
      {
        goto LABEL_42;
      }
      if (!a10 || v17)
      {
        -[__CFString rangeOfCharacterFromSet:](v18, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet"));
        if (!v20)
          goto LABEL_42;
      }
      else if ((acceptAsCompletion(v18, (uint64_t)a10, a7) & 1) == 0)
      {
        goto LABEL_42;
      }
      v21 = -[__CFString length](v18, "length");
      v32 = 0;
      if (v21)
      {
        v35.location = 0;
        v35.length = v21;
        if (v21 == CFStringGetBytes(v18, v35, encoding, 0x5Fu, 0, buffer, 254, &v32))
        {
          BYTE6(usedBufLen) = 1;
          WORD2(usedBufLen) = 257;
          LODWORD(usedBufLen) = 16842753;
          if (!-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, v32, a7, a8, a9, 1, usedBufLen, 0)|| -[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", buffer, v32, a7, 1)|| -[AppleSpell acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:](
                 self,
                 "acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:",
                 buffer,
                 v32,
                 a7,
                 1,
                 a11) < 2)
          {
LABEL_42:
            objc_msgSend(v16, "removeAllObjects");
            break;
          }
        }
      }
      v22 = objc_msgSend(a7, "isKorean");
      v23 = objc_msgSend(a7, "isTurkish");
      if (v22)
      {
        v24 = -[AppleSpell externalStringForKoreanInternalString:](self, "externalStringForKoreanInternalString:", v18);
      }
      else
      {
        if (v17)
          goto LABEL_32;
        if (!a11)
          goto LABEL_32;
        v25 = v23;
        if (!-[__CFString isEqualToString:](v18, "isEqualToString:", -[__CFString lowercaseString](v18, "lowercaseString")))goto LABEL_32;
        if (v25)
        {
          v28 = _stringForTokenIDs_tokenCount_entryString_languageModel_languageObject_connection_sender_prefix_capitalized__turkishLocale;
          if (!_stringForTokenIDs_tokenCount_entryString_languageModel_languageObject_connection_sender_prefix_capitalized__turkishLocale)
          {
            v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("tr"));
            _stringForTokenIDs_tokenCount_entryString_languageModel_languageObject_connection_sender_prefix_capitalized__turkishLocale = v28;
          }
        }
        v24 = (__CFString *)initialCapitalizedString(v18, v28);
      }
      v18 = v24;
LABEL_32:
      objc_msgSend(v16, "addObject:", v18);
      ++v17;
    }
    while (a4 != v17);
  }
  result = (id)objc_msgSend(v16, "count");
  if (result)
    return (id)objc_msgSend(v16, "componentsJoinedByString:", CFSTR(" "));
  return result;
}

- (id)_stringForCompletion:(id)a3 languageModel:(id)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 prefix:(id)a8 capitalized:(BOOL)a9
{
  CFStringEncoding v16;
  uint64_t v17;
  CFIndex v18;
  unint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  CFIndex *usedBufLen;
  CFIndex v25;
  UInt8 buffer[256];
  uint64_t v27;
  CFRange v28;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = objc_msgSend(a5, "encoding");
  if (a8)
  {
    if ((acceptAsCompletion(a3, (uint64_t)a8, a5) & 1) == 0)
      return 0;
  }
  else
  {
    objc_msgSend(a3, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet"));
    if (!v17)
      return 0;
  }
  v18 = objc_msgSend(a3, "length");
  v25 = 0;
  if (v18)
  {
    v28.location = 0;
    v28.length = v18;
    if (v18 == CFStringGetBytes((CFStringRef)a3, v28, v16, 0x5Fu, 0, buffer, 254, &v25))
    {
      BYTE6(usedBufLen) = 1;
      WORD2(usedBufLen) = 257;
      LODWORD(usedBufLen) = 16842753;
      if (!-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, v25, a5, a6, a7, 1, usedBufLen, 0))return 0;
      if (-[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", buffer, v25, a5, 1))
      {
        return 0;
      }
      v19 = -[AppleSpell acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:](self, "acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:", buffer, v25, a5, 1, a9);
      if (!v19 || a4 && v19 == 1)
        return 0;
    }
  }
  v20 = objc_msgSend(a5, "isTurkish");
  if (a9)
  {
    v21 = v20;
    if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(a3, "lowercaseString")))
    {
      if (v21)
      {
        v22 = _stringForCompletion_languageModel_languageObject_connection_sender_prefix_capitalized__turkishLocale;
        if (!_stringForCompletion_languageModel_languageObject_connection_sender_prefix_capitalized__turkishLocale)
        {
          v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("tr"));
          _stringForCompletion_languageModel_languageObject_connection_sender_prefix_capitalized__turkishLocale = v22;
        }
      }
      else
      {
        v22 = 0;
      }
      return (id)initialCapitalizedString(a3, v22);
    }
  }
  return a3;
}

- (BOOL)shouldBlockWord:(id)a3 languageObject:(id)a4
{
  CFStringEncoding v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  CFIndex Bytes;
  CFIndex usedBufLen;
  UInt8 buffer[256];
  uint64_t v15;
  CFRange v16;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a4, "encoding");
  v8 = -[AppleSpell _standardizedLanguageModelStringForString:](self, "_standardizedLanguageModelStringForString:", a3);
  if (objc_msgSend(a4, "isKorean"))
    v8 = -[AppleSpell internalStringForKoreanExternalString:](self, "internalStringForKoreanExternalString:", v8);
  v9 = -[__CFString length](v8, "length");
  if (v9)
  {
    v10 = v9;
    usedBufLen = 0;
    v16.location = 0;
    v16.length = v9;
    Bytes = CFStringGetBytes(v8, v16, v7, 0, 0, buffer, 254, &usedBufLen);
    LOBYTE(v9) = 0;
    if (v10 == Bytes)
      LOBYTE(v9) = -[AppleSpell checkNegativeWordBuffer:length:languageObject:](self, "checkNegativeWordBuffer:length:languageObject:", buffer, usedBufLen, a4);
  }
  return v9;
}

- (id)backgroundMaintenanceQueue
{
  if (backgroundMaintenanceQueue_onceToken != -1)
    dispatch_once(&backgroundMaintenanceQueue_onceToken, &__block_literal_global_23);
  return (id)backgroundMaintenanceQueue__backgroundMaintenanceQueue;
}

dispatch_queue_t __58__AppleSpell_LanguageModeling__backgroundMaintenanceQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  result = dispatch_queue_create("com.apple.ProofReader.backgroundMaintenanceQueue", v0);
  backgroundMaintenanceQueue__backgroundMaintenanceQueue = (uint64_t)result;
  return result;
}

- (unint64_t)_contextLengthForRange:(_NSRange)a3 languageObject:(id)a4 tagger:(id)a5 languageModel:(id)a6 maxContextLength:(unint64_t)a7 context:(unsigned int *)a8 cleanOffset:(unint64_t *)a9 cleanContextRange:(_NSRange *)a10 lastTokenRange:(_NSRange *)a11 lastTokenID:(unsigned int *)a12
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v19;
  uint64_t v20;
  NSRange *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  BOOL v32;
  int v33;
  NSRange v34;
  NSUInteger v35;
  _QWORD v37[2];
  int v38;
  unsigned __int128 v39;
  uint64_t v40;
  _QWORD *v41;
  unsigned int v42;
  _NSRange v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t, unint64_t, unint64_t, _BYTE *);
  void *v48;
  id v49;
  uint64_t *v50;
  NSUInteger v51;
  NSUInteger v52;
  NSRange *v53;
  _QWORD *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  length = a3.length;
  location = a3.location;
  v60 = *MEMORY[0x1E0C80C00];
  v44 = (id)objc_msgSend(a5, "string");
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v19 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v21 = (NSRange *)&v37[-2 * v20];
  MEMORY[0x1E0C80A78](v19);
  v41 = (_QWORD *)((char *)v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v38 = objc_msgSend((id)objc_msgSend(a4, "identifier"), "isEqualToString:", CFSTR("en_CN"));
  if (!a6)
  {
    v25 = 0;
    goto LABEL_47;
  }
  if (length)
  {
    v23 = objc_msgSend(a5, "sentenceRangeForRange:", location, length);
  }
  else
  {
    if (!location)
    {
      v24 = 0;
      v26 = 0;
      goto LABEL_8;
    }
    v23 = objc_msgSend(a5, "sentenceRangeForRange:", location - 1, 1);
  }
  v26 = v23;
LABEL_8:
  if (a7)
  {
    if ((v38 & 1) == 0)
    {
      v57[3] = 1;
      *v21 = (NSRange)xmmword_1DE2EC5B0;
      *v41 = *MEMORY[0x1E0CCE068];
    }
    if (v24 && v26 + v24 >= location)
    {
      v45 = MEMORY[0x1E0C809B0];
      v46 = 3221225472;
      v47 = __173__AppleSpell_LanguageModeling___contextLengthForRange_languageObject_tagger_languageModel_maxContextLength_context_cleanOffset_cleanContextRange_lastTokenRange_lastTokenID___block_invoke;
      v48 = &unk_1EA8CCB68;
      v51 = location;
      v52 = length;
      v49 = a5;
      v50 = &v56;
      v53 = v21;
      v54 = v41;
      v55 = a7;
      objc_msgSend(a5, "enumerateTagsInRange:unit:scheme:options:usingBlock:");
    }
  }
  v37[1] = v37;
  if (v57[3])
  {
    v27 = 0;
    v28 = 0;
    v29 = 0;
    *((_QWORD *)&v39 + 1) = 0;
    v43 = (_NSRange)xmmword_1DE2EC5B0;
    v40 = *MEMORY[0x1E0CCE0A0];
    *(_QWORD *)&v39 = 0x7FFFFFFFFFFFFFFFLL;
    v42 = 1;
    while (1)
    {
      if (v21->length)
      {
        v30 = objc_msgSend(v44, "substringWithRange:", v21->location);
        v31 = -[AppleSpell _tokenIDForString:languageModel:languageObject:terminatorTokenID:](self, "_tokenIDForString:languageModel:languageObject:terminatorTokenID:", v30, a6, a4, 1);
        if (v31 || v41[v27] != v40)
        {
          v32 = -[AppleSpell shouldBlockWord:languageObject:](self, "shouldBlockWord:languageObject:", v30, a4);
          a8[v29] = v31;
          if (v31 != 1)
          {
            v43 = *v21;
            v42 = v31;
          }
          v25 = v29 + 1;
          if (v32 || (objc_msgSend(a6, "tokenSequenceIsBlocklisted:length:", a8, v29 + 1) & 1) != 0)
          {
            v28 = v29 + 1;
          }
          else if (v31 == 1)
          {
            v33 = v38;
            if (v29 == -1)
              v33 = 1;
            if (v33)
              v28 = v29 + 1;
            else
              v28 = v29;
          }
          else
          {
            v34.length = *((_QWORD *)&v39 + 1);
            if (*((_QWORD *)&v39 + 1))
            {
              v34.location = v39;
              v39 = (unsigned __int128)NSUnionRange(v34, *v21);
            }
            else
            {
              v39 = (unsigned __int128)*v21;
            }
          }
          goto LABEL_36;
        }
      }
      else if (!v27)
      {
        v25 = v29 + 1;
        a8[v29] = 1;
        goto LABEL_36;
      }
      v25 = v29;
LABEL_36:
      ++v27;
      ++v21;
      v29 = v25;
      if (v27 >= v57[3])
        goto LABEL_39;
    }
  }
  v39 = 0x7FFFFFFFFFFFFFFFuLL;
  v25 = 0;
  v28 = 0;
  v43 = (_NSRange)xmmword_1DE2EC5B0;
  v42 = 1;
LABEL_39:
  if (a9)
    *a9 = v28;
  v35 = *((_QWORD *)&v39 + 1);
  if (a10)
  {
    a10->location = v39;
    a10->length = v35;
  }
  if (a11)
    *a11 = v43;
  if (a12)
    *a12 = v42;
LABEL_47:
  _Block_object_dispose(&v56, 8);
  return v25;
}

uint64_t __173__AppleSpell_LanguageModeling___contextLengthForRange_languageObject_tagger_languageModel_maxContextLength_context_cleanOffset_cleanContextRange_lastTokenRange_lastTokenID___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, _BYTE *a5)
{
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a3 >= *(_QWORD *)(result + 48))
  {
    *a5 = 1;
  }
  else
  {
    v8 = (_QWORD *)result;
    result = objc_msgSend(*(id *)(result + 32), "orthoIndex");
    v9 = *(_QWORD *)(*(_QWORD *)(v8[5] + 8) + 24);
    if (result != 239
      && v9
      && ((v10 = v8[8], v11 = v9 - 1, v12 = (uint64_t *)(v10 + 16 * (v9 - 1)), v14 = *v12, v13 = v12[1], v13 + v14 == a3)
        ? (v15 = *MEMORY[0x1E0CCE108] == a2)
        : (v15 = 0),
          v15 && *(_QWORD *)(v8[9] + 8 * v11) == a2))
    {
      *(_QWORD *)(v10 + 16 * v11 + 8) = v13 + a4;
    }
    else
    {
      v16 = v8[10];
      if (v9 >= v16)
      {
        if (v16 >= 2)
        {
          v19 = 0;
          v20 = 0;
          do
          {
            *(_OWORD *)(v8[8] + v19) = *(_OWORD *)(v8[8] + v19 + 16);
            *(_QWORD *)(v8[9] + 8 * v20) = *(_QWORD *)(v8[9] + 8 * v20 + 8);
            v16 = v8[10];
            v21 = v20 + 2;
            ++v20;
            v19 += 16;
          }
          while (v21 < v16);
        }
        v22 = v8[9];
        v23 = v8[8] + 16 * v16;
        *(_QWORD *)(v23 - 16) = a3;
        *(_QWORD *)(v23 - 8) = a4;
        *(_QWORD *)(v22 + 8 * v8[10] - 8) = a2;
      }
      else
      {
        v17 = v8[9];
        v18 = (unint64_t *)(v8[8] + 16 * v9);
        *v18 = a3;
        v18[1] = a4;
        *(_QWORD *)(v17 + 8 * (*(_QWORD *)(*(_QWORD *)(v8[5] + 8) + 24))++) = a2;
      }
    }
  }
  return result;
}

- (id)languageModelLocalizationForLanguage:(id)a3
{
  return +[PRLanguage languageModelLocalizationForLanguage:](PRLanguage, "languageModelLocalizationForLanguage:", a3);
}

- (void)_readLanguageModelParametersFromDefaults
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_readLanguageModelParametersFromDefaults_readDefaults & 1) == 0)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    if (objc_msgSend(v2, "objectForKey:", CFSTR("NSSpellCheckerUseCharacterLanguageModels")))
      _kUseCharacterLanguageModels = objc_msgSend(v2, "BOOLForKey:", CFSTR("NSSpellCheckerUseCharacterLanguageModels"));
    if (objc_msgSend(v2, "objectForKey:", CFSTR("NSSpellCheckerSuppressLanguageModels")))
      _kSuppressLanguageModels = objc_msgSend(v2, "BOOLForKey:", CFSTR("NSSpellCheckerSuppressLanguageModels"));
    if (objc_msgSend(v2, "objectForKey:", CFSTR("NSSpellCheckerSuppressAdaptation")))
      _kSuppressAdaptation = objc_msgSend(v2, "BOOLForKey:", CFSTR("NSSpellCheckerSuppressAdaptation"));
    if (objc_msgSend(v2, "objectForKey:", CFSTR("NSSpellCheckerMaxContextLength")))
    {
      v3 = objc_msgSend(v2, "integerForKey:", CFSTR("NSSpellCheckerMaxContextLength"));
      _kMaxContextLength = v3 & ~(v3 >> 63);
    }
    if (objc_msgSend(v2, "objectForKey:", CFSTR("NSSpellCheckerMaxCorrectionRescoreCount")))
    {
      v4 = objc_msgSend(v2, "integerForKey:", CFSTR("NSSpellCheckerMaxCorrectionRescoreCount"));
      _kMaxCorrectionRescoreCount = v4 & ~(v4 >> 63);
    }
    if (objc_msgSend(v2, "objectForKey:", CFSTR("NSSpellCheckerMaxCompletionRescoreCount")))
    {
      v5 = objc_msgSend(v2, "integerForKey:", CFSTR("NSSpellCheckerMaxCompletionRescoreCount"));
      _kMaxCompletionRescoreCount = v5 & ~(v5 >> 63);
    }
    if (objc_msgSend(v2, "objectForKey:", CFSTR("NSSpellCheckerMaxPredictionSampleCount")))
    {
      v6 = objc_msgSend(v2, "integerForKey:", CFSTR("NSSpellCheckerMaxPredictionSampleCount"));
      _kMaxPredictionSampleCount = v6 & ~(v6 >> 63);
    }
    if (objc_msgSend(v2, "objectForKey:", CFSTR("NSSpellCheckerMaxTokensPerPrediction")))
    {
      v7 = objc_msgSend(v2, "integerForKey:", CFSTR("NSSpellCheckerMaxTokensPerPrediction"));
      _kMaxTokensPerPrediction = v7 & ~(v7 >> 63);
    }
    if (objc_msgSend(v2, "objectForKey:", CFSTR("NSSpellCheckerMaxPredictionsToExamine")))
    {
      v8 = objc_msgSend(v2, "integerForKey:", CFSTR("NSSpellCheckerMaxPredictionsToExamine"));
      _kMaxPredictionsToExamine = v8 & ~(v8 >> 63);
    }
    if (objc_msgSend(v2, "objectForKey:", CFSTR("NSSpellCheckerMaxPredictionsToAdd")))
    {
      v9 = objc_msgSend(v2, "integerForKey:", CFSTR("NSSpellCheckerMaxPredictionsToAdd"));
      _kMaxPredictionsToAdd = v9 & ~(v9 >> 63);
    }
    if (objc_msgSend(v2, "objectForKey:", CFSTR("NSSpellCheckerMaxCompletionsToExamine")))
    {
      v10 = objc_msgSend(v2, "integerForKey:", CFSTR("NSSpellCheckerMaxCompletionsToExamine"));
      _kMaxCompletionsToExamine = v10 & ~(v10 >> 63);
    }
    if (objc_msgSend(v2, "objectForKey:", CFSTR("NSSpellCheckerMaxCompletionsToAdd")))
    {
      v11 = objc_msgSend(v2, "integerForKey:", CFSTR("NSSpellCheckerMaxCompletionsToAdd"));
      _kMaxCompletionsToAdd = v11 & ~(v11 >> 63);
    }
    _readLanguageModelParametersFromDefaults_readDefaults = 1;
  }
}

- (void)_readLanguageModelParametersFromDictionary:(id)a3
{
  uint64_t v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;

  v4 = objc_msgSend(a3, "objectForKey:", CFSTR("NSSpellCheckerUseCharacterLanguageModels"));
  if (v4)
  {
    v5 = (void *)v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "BOOLValue");
      _kUseCharacterLanguageModels = v6;
      NSLog((NSString *)CFSTR("NSSpellCheckerUseCharacterLanguageModels -> %d"), v6);
    }
  }
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("NSSpellCheckerSuppressLanguageModels"));
  if (v7)
  {
    v8 = (void *)v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "BOOLValue");
      _kSuppressLanguageModels = v9;
      NSLog((NSString *)CFSTR("NSSpellCheckerSuppressLanguageModels -> %d"), v9);
    }
  }
  v10 = objc_msgSend(a3, "objectForKey:", CFSTR("NSSpellCheckerSuppressAdaptation"));
  if (v10)
  {
    v11 = (void *)v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = objc_msgSend(v11, "BOOLValue");
      _kSuppressAdaptation = v12;
      NSLog((NSString *)CFSTR("NSSpellCheckerSuppressAdaptation -> %d"), v12);
    }
  }
  v13 = objc_msgSend(a3, "objectForKey:", CFSTR("NSSpellCheckerMaxContextLength"));
  if (v13)
  {
    v14 = (void *)v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "integerValue");
      _kMaxContextLength = v15 & ~(v15 >> 63);
      NSLog((NSString *)CFSTR("NSSpellCheckerMaxContextLength -> %lu"), v15 & ~(v15 >> 63));
    }
  }
  v16 = objc_msgSend(a3, "objectForKey:", CFSTR("NSSpellCheckerMaxCorrectionRescoreCount"));
  if (v16)
  {
    v17 = (void *)v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = objc_msgSend(v17, "integerValue");
      _kMaxCorrectionRescoreCount = v18 & ~(v18 >> 63);
      NSLog((NSString *)CFSTR("NSSpellCheckerMaxCorrectionRescoreCount -> %lu"), v18 & ~(v18 >> 63));
    }
  }
  v19 = objc_msgSend(a3, "objectForKey:", CFSTR("NSSpellCheckerMaxCompletionRescoreCount"));
  if (v19)
  {
    v20 = (void *)v19;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v21 = objc_msgSend(v20, "integerValue");
      _kMaxCompletionRescoreCount = v21 & ~(v21 >> 63);
      NSLog((NSString *)CFSTR("NSSpellCheckerMaxCompletionRescoreCount -> %lu"), v21 & ~(v21 >> 63));
    }
  }
  v22 = objc_msgSend(a3, "objectForKey:", CFSTR("NSSpellCheckerMaxPredictionSampleCount"));
  if (v22)
  {
    v23 = (void *)v22;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v24 = objc_msgSend(v23, "integerValue");
      _kMaxPredictionSampleCount = v24 & ~(v24 >> 63);
      NSLog((NSString *)CFSTR("NSSpellCheckerMaxPredictionSampleCount -> %lu"), v24 & ~(v24 >> 63));
    }
  }
  v25 = objc_msgSend(a3, "objectForKey:", CFSTR("NSSpellCheckerMaxTokensPerPrediction"));
  if (v25)
  {
    v26 = (void *)v25;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v27 = objc_msgSend(v26, "integerValue");
      _kMaxTokensPerPrediction = v27 & ~(v27 >> 63);
      NSLog((NSString *)CFSTR("NSSpellCheckerMaxTokensPerPrediction -> %lu"), v27 & ~(v27 >> 63));
    }
  }
  v28 = objc_msgSend(a3, "objectForKey:", CFSTR("NSSpellCheckerMaxPredictionsToExamine"));
  if (v28)
  {
    v29 = (void *)v28;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v30 = objc_msgSend(v29, "integerValue");
      _kMaxPredictionsToExamine = v30 & ~(v30 >> 63);
      NSLog((NSString *)CFSTR("NSSpellCheckerMaxPredictionsToExamine -> %lu"), v30 & ~(v30 >> 63));
    }
  }
  v31 = objc_msgSend(a3, "objectForKey:", CFSTR("NSSpellCheckerMaxPredictionsToAdd"));
  if (v31)
  {
    v32 = (void *)v31;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v33 = objc_msgSend(v32, "integerValue");
      _kMaxPredictionsToAdd = v33 & ~(v33 >> 63);
      NSLog((NSString *)CFSTR("NSSpellCheckerMaxPredictionsToAdd -> %lu"), v33 & ~(v33 >> 63));
    }
  }
  v34 = objc_msgSend(a3, "objectForKey:", CFSTR("NSSpellCheckerMaxCompletionsToExamine"));
  if (v34)
  {
    v35 = (void *)v34;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v36 = objc_msgSend(v35, "integerValue");
      _kMaxCompletionsToExamine = v36 & ~(v36 >> 63);
      NSLog((NSString *)CFSTR("NSSpellCheckerMaxCompletionsToExamine -> %lu"), v36 & ~(v36 >> 63));
    }
  }
  v37 = objc_msgSend(a3, "objectForKey:", CFSTR("NSSpellCheckerMaxCompletionsToAdd"));
  if (v37)
  {
    v38 = (void *)v37;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v39 = objc_msgSend(v38, "integerValue");
      _kMaxCompletionsToAdd = v39 & ~(v39 >> 63);
      NSLog((NSString *)CFSTR("NSSpellCheckerMaxCompletionsToAdd -> %lu"), v39 & ~(v39 >> 63));
    }
  }
}

- (id)_loadWordLanguageModelForLanguage:(id)a3 localization:(id)a4 appIdentifier:(id)a5 onQueue:(id)a6
{
  id v10;
  NSObject *languageModelSerialQueue;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[8];
  _QWORD v18[8];
  _QWORD block[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v10 = -[AppleSpell lexiconForLanguage:](self, "lexiconForLanguage:", a3);
  languageModelSerialQueue = self->_languageModelSerialQueue;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__AppleSpell_LanguageModeling___loadWordLanguageModelForLanguage_localization_appIdentifier_onQueue___block_invoke;
  block[3] = &unk_1EA8CCB90;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  block[7] = &v20;
  dispatch_sync(languageModelSerialQueue, block);
  v13 = (void *)v21[5];
  if (!v13 || objc_msgSend(v13, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
  {
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __101__AppleSpell_LanguageModeling___loadWordLanguageModelForLanguage_localization_appIdentifier_onQueue___block_invoke_2;
    v18[3] = &unk_1EA8CCBB8;
    v18[4] = a4;
    v18[5] = a5;
    v18[6] = v10;
    v18[7] = &v20;
    dispatch_sync((dispatch_queue_t)a6, v18);
    v14 = self->_languageModelSerialQueue;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __101__AppleSpell_LanguageModeling___loadWordLanguageModelForLanguage_localization_appIdentifier_onQueue___block_invoke_3;
    v17[3] = &unk_1EA8CCB90;
    v17[4] = self;
    v17[5] = a4;
    v17[6] = a5;
    v17[7] = &v20;
    dispatch_sync(v14, v17);
  }
  v15 = (void *)v21[5];
  _Block_object_dispose(&v20, 8);
  return v15;
}

id __101__AppleSpell_LanguageModeling___loadWordLanguageModelForLanguage_localization_appIdentifier_onQueue___block_invoke(_QWORD *a1)
{
  id result;
  const __CFString *v3;

  result = (id)objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  if (result)
  {
    if (a1[6])
      v3 = (const __CFString *)a1[6];
    else
      v3 = &stru_1EA8D8440;
    result = (id)objc_msgSend(result, "objectForKey:", v3);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  }
  return result;
}

PRWordLanguageModel *__101__AppleSpell_LanguageModeling___loadWordLanguageModelForLanguage_localization_appIdentifier_onQueue___block_invoke_2(_QWORD *a1)
{
  PRWordLanguageModel *result;

  result = +[PRWordLanguageModel languageModelWithLocalization:appIdentifier:lexicon:](PRWordLanguageModel, "languageModelWithLocalization:appIdentifier:lexicon:", a1[4], a1[5], a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  return result;
}

uint64_t __101__AppleSpell_LanguageModeling___loadWordLanguageModelForLanguage_localization_appIdentifier_onQueue___block_invoke_3(uint64_t a1)
{
  return _setLanguageModel(*(void **)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 40), *(const __CFString **)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
}

- (id)modelCreationQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AppleSpell_LanguageModeling__modelCreationQueue__block_invoke;
  block[3] = &unk_1EA8CCB00;
  block[4] = self;
  if (modelCreationQueue_onceToken != -1)
    dispatch_once(&modelCreationQueue_onceToken, block);
  return (id)modelCreationQueue__modelCreationSerialQueue;
}

uint64_t __50__AppleSpell_LanguageModeling__modelCreationQueue__block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  modelCreationQueue__modelCreationSerialQueue = (uint64_t)dispatch_queue_create("com.apple.ProofReader.modelCreationSerialQueue", v2);
  return objc_msgSend(*(id *)(a1 + 32), "_readLanguageModelParametersFromDefaults");
}

- (id)wordLanguageModelForLanguage:(id)a3 appIdentifier:(id)a4 waitForResult:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  NSObject *languageModelSerialQueue;
  uint64_t v12;
  id v13;
  _QWORD v15[9];
  _QWORD block[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v5 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v9 = -[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:");
  v10 = -[AppleSpell modelCreationQueue](self, "modelCreationQueue");
  if (_allowModelUsage())
  {
    languageModelSerialQueue = self->_languageModelSerialQueue;
    v12 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__AppleSpell_LanguageModeling__wordLanguageModelForLanguage_appIdentifier_waitForResult___block_invoke;
    block[3] = &unk_1EA8CCB90;
    block[4] = self;
    block[5] = v9;
    block[6] = a4;
    block[7] = &v17;
    dispatch_sync(languageModelSerialQueue, block);
    if (objc_msgSend((id)v18[5], "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
    {
      v13 = 0;
      v18[5] = 0;
    }
    else
    {
      v13 = (id)v18[5];
      if (!v13 && !_kSuppressLanguageModels)
      {
        if (v5)
        {
          v13 = -[AppleSpell _loadWordLanguageModelForLanguage:localization:appIdentifier:onQueue:](self, "_loadWordLanguageModelForLanguage:localization:appIdentifier:onQueue:", a3, v9, a4, v10);
          v18[5] = (uint64_t)v13;
        }
        else
        {
          v15[0] = v12;
          v15[1] = 3221225472;
          v15[2] = __89__AppleSpell_LanguageModeling__wordLanguageModelForLanguage_appIdentifier_waitForResult___block_invoke_2;
          v15[3] = &unk_1EA8CCBE0;
          v15[4] = self;
          v15[5] = a3;
          v15[6] = v9;
          v15[7] = a4;
          v15[8] = v10;
          dispatch_async((dispatch_queue_t)-[AppleSpell backgroundLoadingQueue](self, "backgroundLoadingQueue"), v15);
          v13 = (id)v18[5];
        }
      }
    }
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v17, 8);
  return v13;
}

id __89__AppleSpell_LanguageModeling__wordLanguageModelForLanguage_appIdentifier_waitForResult___block_invoke(uint64_t a1)
{
  id result;
  const __CFString *v3;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (result)
  {
    if (*(_QWORD *)(a1 + 48))
      v3 = *(const __CFString **)(a1 + 48);
    else
      v3 = &stru_1EA8D8440;
    result = (id)objc_msgSend(result, "objectForKey:", v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    return (id)_setLanguageModel(*(void **)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 40), *(const __CFString **)(a1 + 48), 0);
  return result;
}

void __89__AppleSpell_LanguageModeling__wordLanguageModelForLanguage_appIdentifier_waitForResult___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF0EACE0]();
  objc_msgSend(*(id *)(a1 + 32), "_loadWordLanguageModelForLanguage:localization:appIdentifier:onQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_autoreleasePoolPop(v2);
}

- (id)wordLanguageModelForLanguageObject:(id)a3 appIdentifier:(id)a4 waitForResult:(BOOL)a5
{
  return -[AppleSpell wordLanguageModelForLanguage:appIdentifier:waitForResult:](self, "wordLanguageModelForLanguage:appIdentifier:waitForResult:", objc_msgSend(a3, "identifier"), a4, a5);
}

- (BOOL)useWordLanguageModelForLanguageObject:(id)a3 tagger:(id)a4 appIdentifier:(id)a5
{
  _BOOL4 v9;
  uint64_t v10;

  v9 = _allowModelUsage();
  LOBYTE(v10) = 0;
  if (a4)
  {
    if (v9)
    {
      v10 = objc_msgSend(a4, "orthoIndex");
      if (v10)
        LOBYTE(v10) = -[AppleSpell wordLanguageModelForLanguageObject:appIdentifier:waitForResult:](self, "wordLanguageModelForLanguageObject:appIdentifier:waitForResult:", a3, a5, 0) != 0;
    }
  }
  return v10;
}

- (BOOL)useCharacterLanguageModelForLanguageObject:(id)a3 tagger:(id)a4 appIdentifier:(id)a5
{
  _BOOL4 v8;
  uint64_t v9;

  v8 = _allowModelUsage();
  LOBYTE(v9) = 0;
  if (a4)
  {
    if (v8)
    {
      v9 = objc_msgSend(a4, "orthoIndex");
      if (v9)
        LOBYTE(v9) = -[AppleSpell characterLanguageModelForLanguageObject:waitForResult:](self, "characterLanguageModelForLanguageObject:waitForResult:", a3, 0) != 0;
    }
  }
  return v9;
}

- (BOOL)useTransformerLanguageModelForLanguageObject:(id)a3 tagger:(id)a4 appIdentifier:(id)a5
{
  uint64_t v8;
  int v9;

  LODWORD(v8) = _allowModelUsage();
  if ((_DWORD)v8)
  {
    v9 = objc_msgSend(a3, "isEnglish");
    LOBYTE(v8) = 0;
    if (a4)
    {
      if (v9)
      {
        v8 = objc_msgSend(a4, "orthoIndex");
        if (v8)
          LOBYTE(v8) = -[AppleSpell transformerLanguageModelForLanguageObject:waitForResult:](self, "transformerLanguageModelForLanguageObject:waitForResult:", a3, 0) != 0;
      }
    }
  }
  return v8;
}

- (BOOL)useSentencePieceLanguageModelForLanguageObject:(id)a3 tagger:(id)a4 appIdentifier:(id)a5
{
  uint64_t v8;
  int v9;

  LODWORD(v8) = _allowModelUsage();
  if ((_DWORD)v8)
  {
    v9 = objc_msgSend(a3, "usesSentencePieceModel");
    LOBYTE(v8) = 0;
    if (a4)
    {
      if (v9)
      {
        v8 = objc_msgSend(a4, "orthoIndex");
        if (v8)
          LOBYTE(v8) = -[AppleSpell sentencePieceLanguageModelForLanguageObject:waitForResult:](self, "sentencePieceLanguageModelForLanguageObject:waitForResult:", a3, 0) != 0;
      }
    }
  }
  return v8;
}

- (void)loadWordLanguageModelForLanguageObject:(id)a3
{
  -[AppleSpell wordLanguageModelForLanguageObject:appIdentifier:waitForResult:](self, "wordLanguageModelForLanguageObject:appIdentifier:waitForResult:", a3, 0, 1);
}

- (BOOL)useUnigramProbabilityForLanguageObject:(id)a3
{
  int v4;

  v4 = _allowModelUsage();
  if (v4)
    LOBYTE(v4) = objc_msgSend(a3, "usesUnigramProbabilities");
  return v4;
}

- (id)_loadNLPLanguageModelWithType:(int64_t)a3 forLanguageObject:(id)a4 onQueue:(id)a5
{
  int *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *languageModelSerialQueue;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[7];
  _QWORD v18[7];
  _QWORD block[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  if ((unint64_t)(a3 - 1) > 3)
    v8 = &OBJC_IVAR___AppleSpell__sentencePieceLanguageModelDictionary;
  else
    v8 = off_1EA8CCE80[a3 - 1];
  v9 = *(uint64_t *)((char *)&self->super.isa + *v8);
  v10 = objc_msgSend(a4, "languageModelLocalization");
  languageModelSerialQueue = self->_languageModelSerialQueue;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__AppleSpell_LanguageModeling___loadNLPLanguageModelWithType_forLanguageObject_onQueue___block_invoke;
  block[3] = &unk_1EA8CCA88;
  block[5] = v10;
  block[6] = &v20;
  block[4] = v9;
  dispatch_sync(languageModelSerialQueue, block);
  v13 = (void *)v21[5];
  if (!v13 || objc_msgSend(v13, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
  {
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __88__AppleSpell_LanguageModeling___loadNLPLanguageModelWithType_forLanguageObject_onQueue___block_invoke_2;
    v18[3] = &unk_1EA8CCC08;
    v18[4] = v10;
    v18[5] = &v20;
    v18[6] = a3;
    dispatch_sync((dispatch_queue_t)a5, v18);
    v14 = self->_languageModelSerialQueue;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __88__AppleSpell_LanguageModeling___loadNLPLanguageModelWithType_forLanguageObject_onQueue___block_invoke_3;
    v17[3] = &unk_1EA8CCC30;
    v17[5] = v10;
    v17[6] = &v20;
    v17[4] = v9;
    dispatch_sync(v14, v17);
  }
  v15 = (void *)v21[5];
  _Block_object_dispose(&v20, 8);
  return v15;
}

uint64_t __88__AppleSpell_LanguageModeling___loadNLPLanguageModelWithType_forLanguageObject_onQueue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

PRNLPLanguageModel *__88__AppleSpell_LanguageModeling___loadNLPLanguageModelWithType_forLanguageObject_onQueue___block_invoke_2(_QWORD *a1)
{
  PRNLPLanguageModel *result;

  result = +[PRNLPLanguageModel languageModelWithLocalization:type:](PRNLPLanguageModel, "languageModelWithLocalization:type:", a1[4], a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = result;
  return result;
}

uint64_t __88__AppleSpell_LanguageModeling___loadNLPLanguageModelWithType_forLanguageObject_onQueue___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v3)
    v3 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  return objc_msgSend(v2, "setObject:forKey:", v3, a1[5]);
}

- (id)_NLPLanguageModelWithType:(int64_t)a3 forLanguageObject:(id)a4 waitForResult:(BOOL)a5
{
  _BOOL4 v5;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *languageModelSerialQueue;
  uint64_t v14;
  id v15;
  _QWORD v17[8];
  _QWORD block[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v5 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  if ((unint64_t)(a3 - 1) > 3)
    v9 = &OBJC_IVAR___AppleSpell__sentencePieceLanguageModelDictionary;
  else
    v9 = off_1EA8CCE80[a3 - 1];
  v10 = *(uint64_t *)((char *)&self->super.isa + *v9);
  v11 = objc_msgSend(a4, "languageModelLocalization");
  v12 = -[AppleSpell modelCreationQueue](self, "modelCreationQueue");
  if (_allowModelUsage())
  {
    languageModelSerialQueue = self->_languageModelSerialQueue;
    v14 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__AppleSpell_LanguageModeling___NLPLanguageModelWithType_forLanguageObject_waitForResult___block_invoke;
    block[3] = &unk_1EA8CCA88;
    block[5] = v11;
    block[6] = &v19;
    block[4] = v10;
    dispatch_sync(languageModelSerialQueue, block);
    if (objc_msgSend((id)v20[5], "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
    {
      v15 = 0;
      v20[5] = 0;
    }
    else
    {
      v15 = (id)v20[5];
      if (!v15 && !_kSuppressLanguageModels)
      {
        if (v5)
        {
          v15 = -[AppleSpell _loadNLPLanguageModelWithType:forLanguageObject:onQueue:](self, "_loadNLPLanguageModelWithType:forLanguageObject:onQueue:", a3, a4, v12);
          v20[5] = (uint64_t)v15;
        }
        else
        {
          v17[0] = v14;
          v17[1] = 3221225472;
          v17[2] = __90__AppleSpell_LanguageModeling___NLPLanguageModelWithType_forLanguageObject_waitForResult___block_invoke_2;
          v17[3] = &unk_1EA8CCC58;
          v17[4] = self;
          v17[5] = a4;
          v17[6] = v12;
          v17[7] = a3;
          dispatch_async((dispatch_queue_t)-[AppleSpell backgroundLoadingQueue](self, "backgroundLoadingQueue"), v17);
          v15 = (id)v20[5];
        }
      }
    }
  }
  else
  {
    v15 = 0;
  }
  _Block_object_dispose(&v19, 8);
  return v15;
}

id __90__AppleSpell_LanguageModeling___NLPLanguageModelWithType_forLanguageObject_waitForResult___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    return (id)objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), *(_QWORD *)(a1 + 40));
  return result;
}

void __90__AppleSpell_LanguageModeling___NLPLanguageModelWithType_forLanguageObject_waitForResult___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF0EACE0]();
  objc_msgSend(*(id *)(a1 + 32), "_loadNLPLanguageModelWithType:forLanguageObject:onQueue:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

- (id)characterLanguageModelForLanguageObject:(id)a3 waitForResult:(BOOL)a4
{
  return -[AppleSpell _NLPLanguageModelWithType:forLanguageObject:waitForResult:](self, "_NLPLanguageModelWithType:forLanguageObject:waitForResult:", 1, a3, a4);
}

- (id)transformerLanguageModelForLanguageObject:(id)a3 waitForResult:(BOOL)a4
{
  return -[AppleSpell _NLPLanguageModelWithType:forLanguageObject:waitForResult:](self, "_NLPLanguageModelWithType:forLanguageObject:waitForResult:", 2, a3, a4);
}

- (id)sentencePieceLanguageModelForLanguageObject:(id)a3 waitForResult:(BOOL)a4
{
  return -[AppleSpell _NLPLanguageModelWithType:forLanguageObject:waitForResult:](self, "_NLPLanguageModelWithType:forLanguageObject:waitForResult:", 3, a3, a4);
}

- (id)transformerOrSiriLanguageModelForLanguageObject:(id)a3 appIdentifier:(id)a4 waitForResult:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;

  v5 = a5;
  if (a4)
  {
    if (objc_msgSend(a4, "isEqual:", CFSTR("com.apple.SiriNCService")))
      v8 = 4;
    else
      v8 = 2;
  }
  else
  {
    v8 = 2;
  }
  return -[AppleSpell _NLPLanguageModelWithType:forLanguageObject:waitForResult:](self, "_NLPLanguageModelWithType:forLanguageObject:waitForResult:", v8, a3, v5);
}

- (unint64_t)_resetLanguageModels
{
  NSObject *languageModelSerialQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  languageModelSerialQueue = self->_languageModelSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AppleSpell_LanguageModeling___resetLanguageModels__block_invoke;
  v5[3] = &unk_1EA8CCC80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(languageModelSerialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__AppleSpell_LanguageModeling___resetLanguageModels__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  uint64_t result;
  uint64_t v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture"), "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = v2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v17 != v10)
                objc_enumerationMutation(v7);
              v12 = (void *)objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
              if ((objc_msgSend(v12, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0)
              {
                objc_msgSend(v12, "reset");
                ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v9);
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }
  result = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = v14;
  return result;
}

- (void)_releaseLanguageModels
{
  NSObject *languageModelSerialQueue;
  _QWORD block[5];

  languageModelSerialQueue = self->_languageModelSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AppleSpell_LanguageModeling___releaseLanguageModels__block_invoke;
  block[3] = &unk_1EA8CCB00;
  block[4] = self;
  dispatch_sync(languageModelSerialQueue, block);
}

uint64_t __54__AppleSpell_LanguageModeling___releaseLanguageModels__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture"), "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  result = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = v4;
  return result;
}

- (void)resetLanguageModels
{
  -[AppleSpell _resetLanguageModels](self, "_resetLanguageModels");
}

- (void)releaseLanguageModels
{
  -[AppleSpell _releaseLanguageModels](self, "_releaseLanguageModels");
}

- (void)_addLanguageModelCompletionsForPrefix:(id)a3 languageModel:(id)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 capitalized:(BOOL)a8 candidates:(id)a9
{
  uint64_t v16;
  _QWORD v17[13];
  BOOL v18;
  _QWORD v19[13];
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v16 = objc_msgSend(a3, "lowercaseString");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __140__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPrefix_languageModel_languageObject_connection_sender_capitalized_candidates___block_invoke;
  v19[3] = &unk_1EA8CCCA8;
  v19[10] = &v25;
  v19[11] = &v21;
  v19[4] = self;
  v19[5] = a4;
  v19[12] = a6;
  v19[6] = a5;
  v19[7] = a7;
  v20 = a8;
  v19[8] = a3;
  v19[9] = a9;
  objc_msgSend(a4, "enumerateCompletionEntriesForPrefix:maxCompletions:withBlock:", v16, _kMaxCompletionsToExamine, v19);
  if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend(a3, "lowercaseString")) & 1) == 0)
  {
    v22[3] = 0;
    v26[3] = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __140__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPrefix_languageModel_languageObject_connection_sender_capitalized_candidates___block_invoke_2;
    v17[3] = &unk_1EA8CCCA8;
    v17[10] = &v25;
    v17[11] = &v21;
    v17[4] = self;
    v17[5] = a4;
    v17[12] = a6;
    v17[6] = a5;
    v17[7] = a7;
    v18 = a8;
    v17[8] = a3;
    v17[9] = a9;
    objc_msgSend(a4, "enumerateCompletionEntriesForPrefix:maxCompletions:withBlock:", a3, _kMaxCompletionsToExamine, v17);
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

uint64_t __140__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPrefix_languageModel_languageObject_connection_sender_capitalized_candidates___block_invoke(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v5 = result;
  v8 = a3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 80) + 8) + 24) < (unint64_t)_kMaxCompletionsToExamine
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 88) + 8) + 24) < (unint64_t)_kMaxCompletionsToAdd)
  {
    LOBYTE(v7) = *(_BYTE *)(result + 104);
    result = objc_msgSend(*(id *)(result + 32), "_stringForTokenIDs:tokenCount:entryString:languageModel:languageObject:connection:sender:prefix:capitalized:", &v8, 1, a2, *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 96), *(_QWORD *)(result + 56), *(_QWORD *)(result + 64), v7);
    if (result)
    {
      v6 = result;
      result = objc_msgSend(*(id *)(v5 + 72), "containsObject:", result);
      if ((result & 1) == 0)
      {
        result = objc_msgSend(*(id *)(v5 + 72), "addObject:", v6);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 88) + 8) + 24);
      }
    }
  }
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 80) + 8) + 24) >= (unint64_t)_kMaxCompletionsToExamine
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 88) + 8) + 24) >= (unint64_t)_kMaxCompletionsToAdd)
  {
    *a4 = 1;
  }
  return result;
}

uint64_t __140__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPrefix_languageModel_languageObject_connection_sender_capitalized_candidates___block_invoke_2(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v5 = result;
  v8 = a3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 80) + 8) + 24) < (unint64_t)_kMaxCompletionsToExamine
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 88) + 8) + 24) < (unint64_t)_kMaxCompletionsToAdd)
  {
    LOBYTE(v7) = *(_BYTE *)(result + 104);
    result = objc_msgSend(*(id *)(result + 32), "_stringForTokenIDs:tokenCount:entryString:languageModel:languageObject:connection:sender:prefix:capitalized:", &v8, 1, a2, *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 96), *(_QWORD *)(result + 56), *(_QWORD *)(result + 64), v7);
    if (result)
    {
      v6 = result;
      result = objc_msgSend(*(id *)(v5 + 72), "containsObject:", result);
      if ((result & 1) == 0)
      {
        result = objc_msgSend(*(id *)(v5 + 72), "addObject:", v6);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 88) + 8) + 24);
      }
    }
  }
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 80) + 8) + 24) >= (unint64_t)_kMaxCompletionsToExamine
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 88) + 8) + 24) >= (unint64_t)_kMaxCompletionsToAdd)
  {
    *a4 = 1;
  }
  return result;
}

- (id)languageModelCompletionsForPartialWord:(id)a3 languageObject:(id)a4 sender:(id)a5 appIdentifier:(id)a6
{
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;

  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = -[AppleSpell _standardizedLanguageModelStringForString:](self, "_standardizedLanguageModelStringForString:", a3);
  v13 = -[AppleSpell databaseConnectionForLanguageObject:](self, "databaseConnectionForLanguageObject:", a4);
  v14 = -[AppleSpell wordLanguageModelForLanguageObject:appIdentifier:waitForResult:](self, "wordLanguageModelForLanguageObject:appIdentifier:waitForResult:", a4, a6, 1);
  if (v14 && v12)
  {
    v15 = v14;
    if (objc_msgSend(a4, "isKorean"))
    {
      v12 = -[AppleSpell internalStringForKoreanExternalString:](self, "internalStringForKoreanExternalString:", v12);
      v16 = 0;
    }
    else
    {
      v16 = objc_msgSend(v12, "isEqualToString:", objc_msgSend(v12, "capitalizedString"));
    }
    -[AppleSpell _addLanguageModelCompletionsForPrefix:languageModel:languageObject:connection:sender:capitalized:candidates:](self, "_addLanguageModelCompletionsForPrefix:languageModel:languageObject:connection:sender:capitalized:candidates:", v12, v15, a4, v13, a5, v16, v11);
  }
  return v11;
}

- (BOOL)_addLanguageModelCompletionsForPartialWordRange:(_NSRange)a3 languageObject:(id)a4 connection:(_PR_DB_IO *)a5 sender:(id)a6 tagger:(id)a7 appIdentifier:(id)a8 waitForLanguageModel:(BOOL)a9 allowTransformer:(BOOL)a10 candidates:(id)a11 scoreDictionary:(id)a12 tryTransliteration:(BOOL *)a13
{
  NSUInteger length;
  NSUInteger location;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  int v22;
  _BOOL4 v23;
  _BOOL4 v24;
  NSUInteger v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  unint64_t v33;
  char *v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  BOOL v45;
  const __CFString *v47;
  int v48;
  unint64_t v49;
  id v50;
  id v51;
  NSUInteger v52;
  id v53;
  _PR_DB_IO *v54;
  char *v55;
  id v56;
  id v57;
  _QWORD v58[14];
  char v59;
  char v60;
  _QWORD v61[14];
  char v62;
  _QWORD v63[14];
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[4];
  __int128 v70;
  __int128 v71;
  unint64_t v72;
  int v73;
  uint64_t v74;

  v53 = a6;
  v54 = a5;
  length = a3.length;
  location = a3.location;
  v56 = a8;
  v74 = *MEMORY[0x1E0C80C00];
  v18 = (void *)objc_msgSend(a7, "string");
  v51 = v18;
  v52 = location;
  if (length)
    v19 = -[AppleSpell _standardizedLanguageModelStringForString:](self, "_standardizedLanguageModelStringForString:", objc_msgSend(v18, "substringWithRange:", location, length));
  else
    v19 = 0;
  v20 = v56;
  v57 = -[AppleSpell wordLanguageModelForLanguageObject:appIdentifier:waitForResult:](self, "wordLanguageModelForLanguageObject:appIdentifier:waitForResult:", a4, v56, a9);
  MEMORY[0x1E0C80A78](v57);
  v55 = (char *)&v47 - ((v21 + 19) & 0xFFFFFFFFFFFFFFF0);
  v73 = 1;
  v72 = 0;
  v70 = xmmword_1DE2EC5B0;
  v71 = xmmword_1DE2EC5B0;
  v22 = objc_msgSend(a4, "isArabic");
  v23 = -[AppleSpell useSentencePieceLanguageModelForLanguageObject:tagger:appIdentifier:](self, "useSentencePieceLanguageModelForLanguageObject:tagger:appIdentifier:", a4, a7, v20);
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  v69[3] = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  if (_addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration__onceToken != -1)
    dispatch_once(&_addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration__onceToken, &__block_literal_global_92);
  if (a13)
    *a13 = 0;
  if (v57)
  {
    v24 = v23;
    v48 = v22;
    v25 = v52;
    v49 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](self, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", v52, length, a4, a7, v57, _kMaxContextLength, v55, &v72, &v70, &v71, &v73);
    v26 = v53;
    if (*((_QWORD *)&v70 + 1))
    {
      v27 = (void *)objc_msgSend(a7, "string");
      v47 = (const __CFString *)objc_msgSend(v27, "substringWithRange:", (_QWORD)v70, *((_QWORD *)&v70 + 1));
      if (v19)
      {
LABEL_11:
        if (objc_msgSend(a4, "isKorean", v47))
        {
          v19 = -[AppleSpell internalStringForKoreanExternalString:](self, "internalStringForKoreanExternalString:", v19);
LABEL_18:
          v28 = 0;
          goto LABEL_19;
        }
        v28 = objc_msgSend(v19, "isEqualToString:", objc_msgSend(v19, "capitalizedString"));
        goto LABEL_19;
      }
    }
    else
    {
      v47 = &stru_1EA8D8440;
      if (v19)
        goto LABEL_11;
    }
    if (!v49)
    {
      v19 = 0;
      goto LABEL_18;
    }
    v19 = 0;
    v28 = *(_DWORD *)&v55[4 * v49 - 4] == 1;
LABEL_19:
    v50 = a12;
    if (_kMaxTokensPerPrediction)
    {
      if (a10)
      {
        if (_kMaxPredictionSampleCount)
        {
          if (-[AppleSpell useTransformerLanguageModelForLanguageObject:tagger:appIdentifier:](self, "useTransformerLanguageModelForLanguageObject:tagger:appIdentifier:", a4, a7, v56))
          {
            v29 = -[AppleSpell transformerOrSiriLanguageModelForLanguageObject:appIdentifier:waitForResult:](self, "transformerOrSiriLanguageModelForLanguageObject:appIdentifier:waitForResult:", a4, v56, 0);
            if (v29)
            {
              v30 = (void *)objc_msgSend(v29, "stateWithContext:", v47);
              if (v30)
              {
                v63[0] = MEMORY[0x1E0C809B0];
                v63[1] = 3221225472;
                v63[2] = __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_2;
                v63[3] = &unk_1EA8CCCF0;
                v63[4] = self;
                v63[5] = v57;
                v63[11] = v69;
                v63[12] = &v65;
                v63[13] = v54;
                v63[6] = a4;
                v63[7] = v26;
                v64 = v28;
                v63[8] = v19;
                v63[9] = a11;
                v63[10] = v50;
                objc_msgSend(v30, "enumeratePredictions:maxTokensPerPrediction:withBlock:", _kMaxPredictionSampleCount, 1, v63);
              }
            }
          }
        }
      }
      if (v24)
      {
        v31 = -[AppleSpell sentencePieceLanguageModelForLanguageObject:waitForResult:](self, "sentencePieceLanguageModelForLanguageObject:waitForResult:", a4, 0);
        if (v31)
        {
          v32 = (void *)objc_msgSend(v31, "stateWithContext:", v47);
          if (v32)
          {
            v61[0] = MEMORY[0x1E0C809B0];
            v61[1] = 3221225472;
            v61[2] = __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_3;
            v61[3] = &unk_1EA8CCCF0;
            v61[4] = self;
            v61[5] = v57;
            v61[11] = v69;
            v61[12] = &v65;
            v61[13] = v54;
            v61[6] = a4;
            v61[7] = v26;
            v62 = v28;
            v61[8] = v19;
            v61[9] = a11;
            v61[10] = v50;
            objc_msgSend(v32, "enumeratePredictions:maxTokensPerPrediction:withBlock:", _kMaxPredictionsToExamine, _kMaxTokensPerPrediction, v61);
          }
        }
      }
      v33 = v66[3];
      if (!v33 || v33 < _kMaxPredictionSampleCount)
      {
        if (v49 <= v72)
          v34 = 0;
        else
          v34 = &v55[4 * v72];
        if (v49 >= v72)
          v35 = v49 - v72;
        else
          v35 = 0;
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_4;
        v58[3] = &unk_1EA8CCD40;
        v58[4] = self;
        v58[5] = v57;
        v58[11] = v69;
        v58[12] = &v65;
        v58[13] = v54;
        v58[6] = a4;
        v58[7] = v26;
        v59 = v28;
        v58[8] = v19;
        v58[9] = a11;
        v58[10] = v50;
        v60 = v48;
        objc_msgSend(v57, "enumeratePredictionsForContext:length:maxPredictions:maxTokensPerPrediction:withBlock:", v34, v35, _kMaxPredictionsToExamine, _kMaxTokensPerPrediction, v58, v47);
      }
    }
    if (v19)
      -[AppleSpell _addLanguageModelCompletionsForPrefix:languageModel:languageObject:connection:sender:capitalized:candidates:](self, "_addLanguageModelCompletionsForPrefix:languageModel:languageObject:connection:sender:capitalized:candidates:", v19, v57, a4, v54, v26, v28, a11);
    if (*((_QWORD *)&v71 + 1))
    {
      if (*((_QWORD *)&v71 + 1) + (_QWORD)v71 <= v25)
      {
        v36 = (void *)objc_msgSend(v51, "substringWithRange:", (_QWORD)v71, v25 - (_QWORD)v71);
        v37 = objc_msgSend(v36, "length");
        v38 = objc_msgSend(a11, "count");
        if (v38)
        {
          for (i = 0; i != v38; ++i)
          {
            v40 = objc_msgSend(a11, "objectAtIndex:", i, v47);
            v41 = -[AppleSpell phraseMatching:inLexiconForLanguageObject:](self, "phraseMatching:inLexiconForLanguageObject:", objc_msgSend(v36, "stringByAppendingString:", v40), a4);
            v42 = v41;
            if (v41)
            {
              if (objc_msgSend(v41, "hasPrefix:", v36))
              {
                if (objc_msgSend(v42, "length") > v37)
                {
                  v43 = (void *)objc_msgSend(v42, "substringFromIndex:", v37);
                  if ((objc_msgSend(v43, "isEqualToString:", v40) & 1) == 0
                    && objc_msgSend((id)objc_msgSend(v43, "lowercaseString"), "isEqualToString:", v40)
                    && (objc_msgSend(a11, "containsObject:", v43) & 1) == 0)
                  {
                    v44 = objc_msgSend(v50, "objectForKey:", v40);
                    if (v44)
                    {
                      objc_msgSend(v50, "setObject:forKey:", v44, v43);
                      objc_msgSend(v50, "removeObjectForKey:", v40);
                    }
                    objc_msgSend(a11, "replaceObjectAtIndex:withObject:", i, v43);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v45 = v57 != 0;
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(v69, 8);
  return v45;
}

uint64_t __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1EA8E7228);
  _addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration__transliterationExceptionSet = result;
  return result;
}

uint64_t __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_2(uint64_t result, uint64_t a2, _BYTE *a3, double a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v5 = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 88) + 8) + 24) < (unint64_t)_kMaxPredictionsToExamine
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 96) + 8) + 24) < (unint64_t)_kMaxPredictionsToAdd)
  {
    LOBYTE(v8) = *(_BYTE *)(result + 112);
    result = objc_msgSend(*(id *)(result + 32), "_stringForCompletion:languageModel:languageObject:connection:sender:prefix:capitalized:", a2, *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 104), *(_QWORD *)(result + 56), *(_QWORD *)(result + 64), v8);
    if (result)
    {
      v7 = result;
      result = objc_msgSend(*(id *)(v5 + 72), "containsObject:", result);
      if ((result & 1) == 0)
      {
        objc_msgSend(*(id *)(v5 + 72), "addObject:", v7);
        result = objc_msgSend(*(id *)(v5 + 80), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4), v7);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 96) + 8) + 24);
      }
    }
  }
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 88) + 8) + 24) >= (unint64_t)_kMaxPredictionsToExamine
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 96) + 8) + 24) >= (unint64_t)_kMaxPredictionsToAdd)
  {
    *a3 = 1;
  }
  return result;
}

uint64_t __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_3(uint64_t result, uint64_t a2, _BYTE *a3, double a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v5 = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 88) + 8) + 24) < (unint64_t)_kMaxPredictionsToExamine
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 96) + 8) + 24) < (unint64_t)_kMaxPredictionsToAdd)
  {
    LOBYTE(v8) = *(_BYTE *)(result + 112);
    result = objc_msgSend(*(id *)(result + 32), "_stringForCompletion:languageModel:languageObject:connection:sender:prefix:capitalized:", a2, *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 104), *(_QWORD *)(result + 56), *(_QWORD *)(result + 64), v8);
    if (result)
    {
      v7 = result;
      result = objc_msgSend(*(id *)(v5 + 72), "containsObject:", result);
      if ((result & 1) == 0)
      {
        objc_msgSend(*(id *)(v5 + 72), "addObject:", v7);
        result = objc_msgSend(*(id *)(v5 + 80), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4), v7);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 96) + 8) + 24);
      }
    }
  }
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 88) + 8) + 24) >= (unint64_t)_kMaxPredictionsToExamine
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 96) + 8) + 24) >= (unint64_t)_kMaxPredictionsToAdd)
  {
    *a3 = 1;
  }
  return result;
}

void __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) >= (unint64_t)_kMaxPredictionsToExamine
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) >= (unint64_t)_kMaxPredictionsToAdd)
  {
    v10 = 0;
  }
  else
  {
    LOBYTE(v15) = *(_BYTE *)(a1 + 112);
    v10 = objc_msgSend(*(id *)(a1 + 32), "_stringForTokenIDs:tokenCount:entryString:languageModel:languageObject:connection:sender:prefix:capitalized:", a2, a3, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v15);
    if (v10 && (objc_msgSend(*(id *)(a1 + 72), "containsObject:", v10) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 72), "addObject:", v10);
      objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5), v10);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    }
  }
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) >= (unint64_t)_kMaxPredictionsToExamine
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) >= (unint64_t)_kMaxPredictionsToAdd)
  {
    *a4 = 1;
  }
  else if (a3 == 1 && v10 && *(_BYTE *)(a1 + 113))
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3052000000;
    v27 = __Block_byref_object_copy__0;
    v28 = __Block_byref_object_dispose__0;
    v29 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_5;
    v16[3] = &unk_1EA8CCD18;
    v19 = &v24;
    v20 = a2;
    v11 = *(_QWORD *)(a1 + 32);
    v16[4] = v10;
    v16[5] = v11;
    v12 = *(_OWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 104);
    v21 = 1;
    v22 = v13;
    v14 = *(_OWORD *)(a1 + 56);
    v17 = v12;
    v18 = v14;
    v23 = *(_BYTE *)(a1 + 112);
    objc_msgSend((id)v12, "enumerateEntriesForString:withBlock:", v10, v16);
    if (v25[5])
    {
      if ((objc_msgSend(*(id *)(a1 + 72), "containsObject:") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 72), "addObject:", v25[5]);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
        if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) >= (unint64_t)_kMaxPredictionsToExamine
          || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) >= (unint64_t)_kMaxPredictionsToAdd)
        {
          *a4 = 1;
        }
      }
    }
    _Block_object_dispose(&v24, 8);
  }
}

uint64_t __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_5(uint64_t result, void *a2, int a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v7;

  if (a2)
  {
    v4 = result;
    if (**(_DWORD **)(result + 88) == a3)
    {
      result = objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(result + 32));
      if ((result & 1) == 0)
      {
        LOBYTE(v7) = *(_BYTE *)(v4 + 112);
        result = objc_msgSend(*(id *)(v4 + 40), "_stringForTokenIDs:tokenCount:entryString:languageModel:languageObject:connection:sender:prefix:capitalized:", *(_QWORD *)(v4 + 88), *(_QWORD *)(v4 + 96), a2, *(_QWORD *)(v4 + 48), *(_QWORD *)(v4 + 56), *(_QWORD *)(v4 + 104), *(_QWORD *)(v4 + 64), *(_QWORD *)(v4 + 72), v7);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 80) + 8) + 40) = result;
        *a4 = 1;
      }
    }
  }
  return result;
}

- (BOOL)_getUnigramProbabilityForString:(id)a3 languageModel:(id)a4 probability:(double *)a5
{
  id v7;
  int v8;
  unint64_t v10;

  v10 = 0xC03E000000000000;
  v7 = -[AppleSpell _standardizedLanguageModelStringForString:](self, "_standardizedLanguageModelStringForString:", a3);
  if ((objc_msgSend(a4, "getUnigramProbabilityForString:probability:", v7, &v10) & 1) != 0)
  {
    v8 = 1;
    if (!a5)
      return v8;
  }
  else
  {
    v8 = objc_msgSend(a4, "getUnigramProbabilityForString:probability:", objc_msgSend(v7, "lowercaseString"), &v10);
    if (!a5)
      return v8;
  }
  if (v8)
    *(_QWORD *)a5 = v10;
  return v8;
}

- (id)_rankedCandidatesForRange:(_NSRange)a3 candidates:(id)a4 languageObject:(id)a5 tagger:(id)a6 appIdentifier:(id)a7 allowTransformer:(BOOL)a8 scoreDictionary:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  uint64_t v16;
  char *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  unint64_t v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  double v37;
  uint64_t v38;
  char v39;
  void *v40;
  id v41;
  char *v42;
  void *v43;
  unint64_t v44;
  char *v45;
  unint64_t v46;
  char v47;
  double v48;
  double v49;
  double v50;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  unint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  uint64_t v65;
  uint64_t v67;
  _BOOL4 v68;
  id v69;
  id v70;
  const __CFString *v71;
  unint64_t v72;
  void *v73;
  int v74;
  char *v75;
  int v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  id v82;
  _BOOL4 v83;
  AppleSpell *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  double v89;
  double v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  unint64_t v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  length = a3.length;
  location = a3.location;
  v83 = a8;
  v99 = *MEMORY[0x1E0C80C00];
  v69 = a7;
  v15 = -[AppleSpell wordLanguageModelForLanguageObject:appIdentifier:waitForResult:](self, "wordLanguageModelForLanguageObject:appIdentifier:waitForResult:", a5, a7, 0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v67 - ((v16 + 23) & 0xFFFFFFFFFFFFFFF0);
  v96 = xmmword_1DE2EC5B0;
  v80 = a4;
  v78 = objc_msgSend(a4, "count");
  v95 = 0;
  v75 = v17;
  v84 = self;
  v82 = a5;
  v77 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](self, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", location, length, a5, a6, v15, _kMaxContextLength, v17, &v95, &v96, 0, 0);
  if (*((_QWORD *)&v96 + 1))
  {
    v18 = (void *)objc_msgSend(a6, "string");
    v71 = (const __CFString *)objc_msgSend(v18, "substringWithRange:", (_QWORD)v96, *((_QWORD *)&v96 + 1));
  }
  else
  {
    v71 = &stru_1EA8D8440;
  }
  v19 = a9;
  v20 = v82;
  v76 = -[AppleSpell useUnigramProbabilityForLanguageObject:](v84, "useUnigramProbabilityForLanguageObject:", v82);
  v74 = objc_msgSend(v20, "isArabic");
  v21 = v69;
  if (v83)
  {
    v22 = objc_msgSend(v80, "count");
    v23 = 0;
    if (v22 >= 2 && _kMaxCompletionRescoreCount)
      v23 = -[AppleSpell useTransformerLanguageModelForLanguageObject:tagger:appIdentifier:](v84, "useTransformerLanguageModelForLanguageObject:tagger:appIdentifier:", v82, a6, v21);
  }
  else
  {
    v23 = 0;
  }
  v68 = v23;
  if (-[AppleSpell useSentencePieceLanguageModelForLanguageObject:tagger:appIdentifier:](v84, "useSentencePieceLanguageModelForLanguageObject:tagger:appIdentifier:", v82, a6, v21)&& (v24 = -[AppleSpell sentencePieceLanguageModelForLanguageObject:waitForResult:](v84, "sentencePieceLanguageModelForLanguageObject:waitForResult:", v82, 0)) != 0)
  {
    v70 = v24;
    v25 = (void *)objc_msgSend(v24, "stateWithContext:", v71);
    v26 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", a9);
    if (v25)
      v25 = (void *)objc_msgSend(v25, "conditionalProbabilityDictionaryForStrings:", v80);
  }
  else
  {
    v26 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", a9);
    v70 = 0;
    v25 = 0;
  }
  objc_msgSend(a9, "removeAllObjects");
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v27 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
  if (v27)
  {
    v28 = v27;
    v79 = 0;
    v81 = *(_QWORD *)v92;
    v29 = v76;
    if (!v15)
      v29 = 1;
    v83 = v29;
    v72 = v77 + 1;
    v30 = (double)v78;
    v73 = v25;
    do
    {
      v31 = 0;
      v78 = v28;
      do
      {
        if (*(_QWORD *)v92 != v81)
          objc_enumerationMutation(v80);
        v32 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v31);
        v33 = -[AppleSpell _tokenIDForString:languageModel:languageObject:terminatorTokenID:](v84, "_tokenIDForString:languageModel:languageObject:terminatorTokenID:", v32, v15, v82, 0);
        v34 = (void *)objc_msgSend(v26, "objectForKey:", v32);
        if (v25)
        {
          v35 = (void *)objc_msgSend(v25, "objectForKey:", v32);
          v90 = 0.0;
          if (v35)
            v36 = v83;
          else
            v36 = 1;
          if ((v36 & 1) == 0)
          {
            objc_msgSend(v35, "doubleValue");
            v90 = v37;
            v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v71, v32);
            if ((objc_msgSend(v70, "stringIsBlocklisted:", v38) & 1) != 0)
              goto LABEL_53;
            goto LABEL_43;
          }
        }
        else
        {
          v90 = 0.0;
        }
        v39 = v83;
        if (!(_DWORD)v33)
          v39 = 1;
        if ((v39 & 1) != 0)
        {
          if (v76)
            -[AppleSpell _getUnigramProbabilityForString:languageModel:probability:](v84, "_getUnigramProbabilityForString:languageModel:probability:", v32, v15, &v90);
LABEL_43:
          if (v34)
          {
            objc_msgSend(v34, "doubleValue");
            v49 = v48;
            v50 = v90;
            if (v49 < 0.0 && v49 > v90)
            {
              v90 = v49;
              v50 = v49;
            }
          }
          else
          {
            v50 = v90;
          }
          if (v50 >= 0.0)
            v90 = -30.0 - (double)(unint64_t)(v79 + v31) / v30;
          objc_msgSend(v19, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), v32);
          goto LABEL_53;
        }
        v40 = v26;
        v41 = v19;
        v42 = v75;
        v43 = v15;
        v44 = v77;
        if (v77 <= v95)
          v45 = 0;
        else
          v45 = &v75[4 * v95];
        if (v77 >= v95)
          v46 = v77 - v95;
        else
          v46 = 0;
        objc_msgSend(v43, "getConditionalProbabilityForTokenID:context:length:probability:", v33, v45, v46, &v90);
        *(_DWORD *)&v42[4 * v44] = v33;
        v15 = v43;
        v47 = objc_msgSend(v43, "tokenSequenceIsBlocklisted:length:", v42, v72);
        if (v74)
        {
          v89 = 0.0;
          -[AppleSpell _getUnigramProbabilityForString:languageModel:probability:](v84, "_getUnigramProbabilityForString:languageModel:probability:", v32, v43, &v89);
          v90 = v90 + v89 * 0.000001;
        }
        v19 = v41;
        v26 = v40;
        v25 = v73;
        v28 = v78;
        if ((v47 & 1) == 0)
          goto LABEL_43;
LABEL_53:
        ++v31;
      }
      while (v28 != v31);
      v28 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
      v79 += v31;
    }
    while (v28);
  }
  v52 = (void *)objc_msgSend(v19, "keysSortedByValueUsingComparator:", &__block_literal_global_310);
  v53 = v52;
  if (v68 && (unint64_t)objc_msgSend(v52, "count") >= 2)
  {
    v54 = -[AppleSpell transformerOrSiriLanguageModelForLanguageObject:appIdentifier:waitForResult:](v84, "transformerOrSiriLanguageModelForLanguageObject:appIdentifier:waitForResult:", v82, v69, 0);
    if (v54)
    {
      v55 = objc_msgSend(v54, "stateWithContext:", v71);
      if (v55)
      {
        v56 = (void *)v55;
        v57 = objc_msgSend(v53, "count");
        v58 = (uint64_t)v53;
        if (v57 > _kMaxCompletionRescoreCount)
          v58 = objc_msgSend(v53, "subarrayWithRange:", 0);
        v59 = (void *)objc_msgSend(v56, "conditionalProbabilityDictionaryForStrings:", v58);
        v60 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend(v59, "keysSortedByValueUsingComparator:", &__block_literal_global_310));
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v61 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
        if (v61)
        {
          v62 = v61;
          v63 = *(_QWORD *)v86;
          do
          {
            for (i = 0; i != v62; ++i)
            {
              if (*(_QWORD *)v86 != v63)
                objc_enumerationMutation(v53);
              v65 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
              if ((objc_msgSend(v60, "containsObject:", v65) & 1) == 0)
                objc_msgSend(v60, "addObject:", v65);
            }
            v62 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
          }
          while (v62);
        }
        return v60;
      }
    }
  }
  return v53;
}

- (void)getParameterValue:(double *)a3 forName:(id)a4 languageObject:(id)a5 tagger:(id)a6 appIdentifier:(id)a7 parameterBundles:(id)a8 defaultValue:(double)a9
{
  uint64_t v17;
  id v18;
  id v19;
  char v20;

  if (!a8
    || (v17 = objc_msgSend(a8, "objectForKey:", objc_msgSend(a5, "identifier"))) == 0
    && (v17 = objc_msgSend(a8, "objectForKey:", objc_msgSend(a5, "languageModelLocalization"))) == 0
    && (v17 = objc_msgSend(a8, "objectForKey:", objc_msgSend(a5, "languageModelFallbackLocalization"))) == 0
    || (v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE160]), "initWithDictionaryRepresentation:error:", v17, 0)) == 0|| (objc_msgSend(v18, "getContinuousParameterValueForName:value:", a4, a3) & 1) == 0)
  {
    if (_kMaxCorrectionRescoreCount
      && -[AppleSpell useTransformerLanguageModelForLanguageObject:tagger:appIdentifier:](self, "useTransformerLanguageModelForLanguageObject:tagger:appIdentifier:", a5, a6, a7))
    {
      v19 = -[AppleSpell transformerParameterBundleForLanguageObject:](self, "transformerParameterBundleForLanguageObject:", a5);
      if (!v19)
        goto LABEL_10;
    }
    else
    {
      v19 = -[AppleSpell parameterBundleForLanguageObject:](self, "parameterBundleForLanguageObject:", a5);
      if (!v19)
      {
LABEL_10:
        if (!a3)
          return;
LABEL_15:
        *a3 = a9;
        return;
      }
    }
    v20 = objc_msgSend(v19, "getContinuousParameterValueForName:value:", a4, a3);
    if (a3 && (v20 & 1) == 0)
      goto LABEL_15;
  }
}

- (id)_languageModelStateScoresForCandidateList:(id)a3 languageModel:(id)a4 state:(id)a5 language:(id)a6 tagger:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  id v31;
  __int128 v32;
  void *v33;
  AppleSpell *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[88];
  uint64_t v46;

  v36 = a6;
  v35 = a4;
  v34 = self;
  v46 = *MEMORY[0x1E0C80C00];
  v10 = objc_msgSend(a3, "defaultReplacementRange");
  v37 = a5;
  if (!a5)
    return 0;
  v12 = v10;
  v13 = v11;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v38 = (id)objc_msgSend(a3, "candidates");
  v15 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v42;
    v32 = xmmword_1DE2EC5B0;
    v33 = v14;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(v38);
        v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "replacementRange");
        v40 = 0.0;
        if (v12 == v20 && v13 == v21)
        {
          objc_msgSend(v14, "addObject:", objc_msgSend(v19, "string"));
        }
        else
        {
          v39 = v32;
          MEMORY[0x1E0C80A78](v20);
          -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](v34, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", (char *)&v30 - ((v23 + 19) & 0xFFFFFFFFFFFFFFF0), 0, &v39, 0, 0);
          if (*((_QWORD *)&v39 + 1))
          {
            v24 = (void *)objc_msgSend(a7, "string");
            v25 = (const __CFString *)objc_msgSend(v24, "substringWithRange:", (_QWORD)v39, *((_QWORD *)&v39 + 1));
          }
          else
          {
            v25 = &stru_1EA8D8440;
          }
          if (objc_msgSend((id)objc_msgSend(v37, "languageModel"), "getConditionalProbabilityForString:context:probability:", objc_msgSend(v19, "string"), v25, &v40))
          {
            v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
            v27 = objc_msgSend(v19, "string");
            objc_msgSend(v31, "setObject:forKey:", v26, v27);
          }
          v14 = v33;
        }
      }
      v16 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v16);
  }
  if (objc_msgSend(v14, "count"))
  {
    v28 = objc_msgSend(v37, "conditionalProbabilityDictionaryForStrings:", v14);
    objc_msgSend(v31, "addEntriesFromDictionary:", v28);
  }
  return v31;
}

- (id)_rankedCandidatesForCandidateList:(id)a3 languageObject:(id)a4 tagger:(id)a5 appIdentifier:(id)a6 parameterBundles:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _BYTE *v17;
  AppleSpell *v18;
  AppleSpell *v19;
  id v20;
  void *v21;
  unint64_t v22;
  _BOOL4 v23;
  _BOOL4 v24;
  id v25;
  _BOOL4 v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  char *v31;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  int v38;
  unint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  _BOOL4 v48;
  BOOL v49;
  int v50;
  unint64_t v51;
  _BOOL4 v52;
  int v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  uint64_t v61;
  uint64_t v62;
  int v63;
  char v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE *v68;
  uint64_t v69;
  char *v70;
  void *v71;
  unsigned int v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  void *v78;
  unint64_t v79;
  int v80;
  char v81;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  _BYTE *v88;
  unint64_t v89;
  id v90;
  char v91;
  unint64_t v92;
  _BYTE *v93;
  _BYTE *v94;
  unint64_t v95;
  id v96;
  unsigned int v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _BOOL4 v102;
  uint64_t v103;
  BOOL v108;
  double v109;
  double v110;
  uint64_t v111;
  void *v112;
  void *v113;
  _BOOL4 v114;
  id v115;
  void *v116;
  uint64_t v117;
  void *v118;
  unint64_t v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t k;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v129;
  id v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  uint64_t v150;
  void *v151;
  void *v152;
  const __CFString *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t m;
  uint64_t v160;
  _BYTE v161[12];
  _BOOL4 v162;
  _BYTE *v163;
  uint64_t v164;
  id v165;
  id v166;
  AppleSpell *v167;
  id v168;
  __int128 v169;
  unint64_t v170;
  _BYTE *v171;
  unint64_t v172;
  int v173;
  id v174;
  const __CFString *v175;
  int v176;
  id v177;
  void *v178;
  id v179;
  int v180;
  uint64_t v181;
  char *v182;
  _BYTE *v183;
  int v184;
  int v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;
  id v189;
  id v190;
  uint64_t v191;
  unint64_t v192;
  unsigned int v193;
  id v194;
  id v195;
  uint64_t v196;
  id v197;
  char *v198;
  id v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  uint64_t v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  double v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  unint64_t v236;
  __int128 v237;
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  _BYTE v244[128];
  uint64_t v245;

  v198 = (char *)a7;
  v245 = *MEMORY[0x1E0C80C00];
  v164 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = objc_msgSend(a3, "defaultReplacementRange");
  v14 = v13;
  v169 = xmmword_1DE2EC5B0;
  v237 = xmmword_1DE2EC5B0;
  v165 = a6;
  v15 = -[AppleSpell wordLanguageModelForLanguageObject:appIdentifier:waitForResult:](self, "wordLanguageModelForLanguageObject:appIdentifier:waitForResult:", a4, a6, 0);
  v163 = v161;
  MEMORY[0x1E0C80A78](v15);
  v17 = &v161[-((v16 + 19) & 0xFFFFFFFFFFFFFFF0)];
  v166 = a3;
  v197 = (id)objc_msgSend(a3, "count");
  v236 = 0;
  v171 = v17;
  v18 = self;
  v19 = self;
  v181 = v14;
  v182 = (char *)v12;
  v20 = a4;
  v199 = v15;
  v172 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](v19, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", v12, v14, a4, a5, v15, _kMaxContextLength, v17, &v236, &v237, 0, 0);
  if (*((_QWORD *)&v237 + 1))
  {
    v21 = (void *)objc_msgSend(a5, "string");
    v175 = (const __CFString *)objc_msgSend(v21, "substringWithRange:", v237);
  }
  else
  {
    v175 = &stru_1EA8D8440;
  }
  v176 = (unint64_t)objc_msgSend(v166, "count") < 2
      || -[AppleSpell useUnigramProbabilityForLanguageObject:](v18, "useUnigramProbabilityForLanguageObject:", a4);
  v22 = objc_msgSend(v166, "count");
  v23 = 0;
  if (v22 >= 2 && _kMaxCorrectionRescoreCount)
    v23 = -[AppleSpell useTransformerLanguageModelForLanguageObject:tagger:appIdentifier:](v18, "useTransformerLanguageModelForLanguageObject:tagger:appIdentifier:", a4, a5, v165);
  v162 = v23;
  v24 = 0;
  if ((unint64_t)objc_msgSend(v166, "count") >= 2 && _kUseCharacterLanguageModels)
    v24 = -[AppleSpell useCharacterLanguageModelForLanguageObject:tagger:appIdentifier:](v18, "useCharacterLanguageModelForLanguageObject:tagger:appIdentifier:", a4, a5, v165);
  v25 = a4;
  v26 = -[AppleSpell useSentencePieceLanguageModelForLanguageObject:tagger:appIdentifier:](v18, "useSentencePieceLanguageModelForLanguageObject:tagger:appIdentifier:", a4, a5, v165);
  v174 = 0;
  v27 = 0;
  v235 = 0.0;
  v234 = 0.0;
  v233 = 0.0;
  v232 = 0.0;
  v231 = 0.0;
  v177 = a5;
  LODWORD(v196) = v26;
  if (v26)
  {
    v28 = -[AppleSpell sentencePieceLanguageModelForLanguageObject:waitForResult:](v18, "sentencePieceLanguageModelForLanguageObject:waitForResult:", a4, 0);
    if (v28)
    {
      v174 = v28;
      v29 = objc_msgSend(v28, "stateWithContext:", v175);
      if (v29)
      {
        a5 = v177;
        v27 = -[AppleSpell _languageModelStateScoresForCandidateList:languageModel:state:language:tagger:](v18, "_languageModelStateScoresForCandidateList:languageModel:state:language:tagger:", v166, v199, v29, a4, v177);
        goto LABEL_19;
      }
    }
    else
    {
      v174 = 0;
    }
    v27 = 0;
    a5 = v177;
  }
LABEL_19:
  v30 = v165;
  v31 = v198;
  -[AppleSpell getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:](v18, "getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:", &v235, *MEMORY[0x1E0CCE020], v20, a5, v165, v198, 1.0);
  -[AppleSpell getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:](v18, "getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:", &v234, *MEMORY[0x1E0CCE010], v20, a5, v30, v31, 0.0);
  -[AppleSpell getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:](v18, "getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:", &v233, *MEMORY[0x1E0CCE018], v20, a5, v30, v31, 0.0);
  -[AppleSpell getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:](v18, "getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:", &v232, CFSTR("StandaloneLexiconWeight"), v20, a5, v30, v31, 1.0);
  -[AppleSpell getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:](v18, "getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:", &v231, CFSTR("TransformerLanguageModelWeight"), v20, a5, v30, v31, 1.0);
  if (v234 > 0.0 && v24)
  {
    v33 = -[AppleSpell characterLanguageModelForLanguageObject:waitForResult:](v18, "characterLanguageModelForLanguageObject:waitForResult:", v20, 0, v234);
    v34 = v20;
    if (v33 && (v35 = objc_msgSend(v33, "stateWithContext:", v175)) != 0)
      v36 = -[AppleSpell _languageModelStateScoresForCandidateList:languageModel:state:language:tagger:](v18, "_languageModelStateScoresForCandidateList:languageModel:state:language:tagger:", v166, v199, v35, v25, v177);
    else
      v36 = 0;
  }
  else
  {
    v36 = 0;
    v34 = v20;
  }
  v229 = 0u;
  v230 = 0u;
  v227 = 0u;
  v228 = 0u;
  v179 = (id)objc_msgSend(v166, "candidates");
  v37 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v227, v244, 16);
  v186 = v36;
  v188 = v37;
  if (v37)
  {
    v187 = *(_QWORD *)v228;
    if (v199)
      v38 = v176;
    else
      v38 = 1;
    v39 = 0;
    v173 = v38;
    v180 = v38 | v196 ^ 1;
    v170 = v172 + 1;
    v40 = (double)(unint64_t)v197;
    v178 = v27;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v228 != v187)
        {
          v42 = v41;
          objc_enumerationMutation(v179);
          v41 = v42;
        }
        v191 = v41;
        v43 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * v41);
        v44 = objc_msgSend(v43, "numberOfWords");
        v198 = (char *)objc_msgSend(v43, "replacementRange");
        v46 = v45;
        v194 = v43;
        if (v36)
          v190 = (id)objc_msgSend(v36, "objectForKey:", objc_msgSend(v43, "string"));
        else
          v190 = 0;
        v192 = v39;
        if (v27)
          v47 = (id)objc_msgSend(v27, "objectForKey:", objc_msgSend(v194, "string"));
        else
          v47 = 0;
        *(_QWORD *)&v204 = 0;
        v226 = 0.0;
        v48 = v44 > 1;
        if (v44 != 1)
        {
          v52 = 0;
          v53 = 0;
          v193 = 0;
          v54 = v194;
          goto LABEL_49;
        }
        v49 = v182 == v198 && v181 == v46;
        v54 = v194;
        if (!v49)
        {
          LOBYTE(v50) = 0;
          v193 = 0;
          v51 = v192;
LABEL_144:
          objc_msgSend(v54, "setLinguisticScore:", -30.0 - (double)v51 / v40);
          if ((v50 & 1) == 0)
            goto LABEL_146;
          goto LABEL_145;
        }
        v189 = v47;
        v61 = objc_msgSend(v194, "string");
        v62 = -[AppleSpell _tokenIDForString:languageModel:languageObject:terminatorTokenID:](v18, "_tokenIDForString:languageModel:languageObject:terminatorTokenID:", v61, v199, v34, 0);
        v196 = v46;
        if ((v180 & 1) != 0)
        {
          v63 = v62;
          if ((_DWORD)v62)
            v64 = v173;
          else
            v64 = 1;
          if ((v64 & 1) != 0)
          {
            objc_msgSend((id)objc_msgSend(v54, "string"), "rangeOfString:", CFSTR("-"));
            v65 = 0;
            v193 = 0;
            v48 = v66 != 0;
            goto LABEL_116;
          }
          v93 = v171;
          v92 = v172;
          if (v172 <= v236)
            v94 = 0;
          else
            v94 = &v171[4 * v236];
          if (v172 >= v236)
            v95 = v172 - v236;
          else
            v95 = 0;
          v96 = v199;
          v65 = objc_msgSend(v199, "getConditionalProbabilityForTokenID:context:length:probability:", v62, v94, v95, &v204);
          *(_DWORD *)&v93[4 * v92] = v63;
          v27 = v178;
          v97 = objc_msgSend(v96, "tokenSequenceIsBlocklisted:length:", v93, v170);
        }
        else
        {
          if (v189)
          {
            objc_msgSend(v189, "doubleValue");
            *(_QWORD *)&v204 = v87;
            v65 = 1;
          }
          else
          {
            v65 = 0;
          }
          v98 = (void *)MEMORY[0x1E0CB3940];
          v54 = v194;
          v99 = objc_msgSend(v194, "string");
          v100 = objc_msgSend(v98, "stringWithFormat:", CFSTR("%@ %@"), v175, v99);
          v97 = objc_msgSend(v174, "stringIsBlocklisted:", v100);
        }
        v193 = v97;
        v48 = 0;
LABEL_116:
        v101 = objc_msgSend(v54, "string");
        v102 = -[AppleSpell _getUnigramProbabilityForString:languageModel:probability:](v18, "_getUnigramProbabilityForString:languageModel:probability:", v101, v199, &v226);
        v52 = v65 != 0;
        if (!v102)
        {
          v53 = 0;
          v54 = v194;
          v47 = v189;
          v46 = v196;
LABEL_49:
          if (!v48)
            goto LABEL_135;
          goto LABEL_50;
        }
        v103 = *(_QWORD *)&v226 & 0x7FFFFFFFFFFFFFFFLL;
        v108 = *(uint64_t *)&v226 > -1 && ((*(_QWORD *)&v226 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF
            || (*(_QWORD *)&v226 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000
            || v103 == 0x7FF0000000000000
            || (unint64_t)(*(_QWORD *)&v226 - 1) < 0xFFFFFFFFFFFFFLL
            || v103 == 0;
        v46 = v196;
        if (!v108)
        {
          v53 = 1;
          v54 = v194;
          v47 = v189;
          goto LABEL_49;
        }
        v53 = 0;
        v54 = v194;
        v47 = v189;
        if (!v48)
        {
LABEL_135:
          v51 = v192;
          if (!v52)
            goto LABEL_91;
          goto LABEL_136;
        }
LABEL_50:
        v184 = v53;
        v185 = v52;
        v189 = v47;
        v55 = (void *)objc_msgSend(v54, "candidateWords");
        v222 = 0u;
        v223 = 0u;
        v224 = 0u;
        v225 = 0u;
        v197 = v55;
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v222, v243, 16);
        if (v56)
        {
          v57 = v56;
          v58 = 0;
          v59 = *(_QWORD *)v223;
          do
          {
            for (i = 0; i != v57; ++i)
            {
              if (*(_QWORD *)v223 != v59)
                objc_enumerationMutation(v197);
              v58 += objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v222 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("-")), "count");
            }
            v57 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v222, v243, 16);
          }
          while (v57);
        }
        v183 = v161;
        MEMORY[0x1E0C80A78](0);
        v68 = &v161[-v67];
        v221 = 0;
        v34 = v20;
        v69 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](v18, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", v198, v46, v20, v177, v199, &v161[-v67], &v221, 0, 0, 0);
        v217 = 0u;
        v218 = 0u;
        v219 = 0u;
        v220 = 0u;
        v196 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v217, v242, 16);
        if (v196)
        {
          v195 = *(id *)v218;
          do
          {
            v70 = 0;
            do
            {
              if (*(id *)v218 != v195)
                objc_enumerationMutation(v197);
              v71 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * (_QWORD)v70);
              v72 = -[AppleSpell _tokenIDForString:languageModel:languageObject:terminatorTokenID:](v18, "_tokenIDForString:languageModel:languageObject:terminatorTokenID:", v71, v199, v34, 0);
              v198 = v70;
              if (v72)
              {
                *(_DWORD *)&v68[4 * v69++] = v72;
              }
              else
              {
                v73 = (void *)objc_msgSend(v71, "componentsSeparatedByString:", CFSTR("-"));
                v213 = 0u;
                v214 = 0u;
                v215 = 0u;
                v216 = 0u;
                v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v213, v241, 16);
                if (v74)
                {
                  v75 = v74;
                  v76 = *(_QWORD *)v214;
                  do
                  {
                    for (j = 0; j != v75; ++j)
                    {
                      if (*(_QWORD *)v214 != v76)
                        objc_enumerationMutation(v73);
                      v78 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * j);
                      if (objc_msgSend(v78, "length"))
                        *(_DWORD *)&v68[4 * v69++] = -[AppleSpell _tokenIDForString:languageModel:languageObject:terminatorTokenID:](v18, "_tokenIDForString:languageModel:languageObject:terminatorTokenID:", v78, v199, v20, 0);
                    }
                    v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v213, v241, 16);
                  }
                  while (v75);
                }
              }
              v70 = v198 + 1;
              v34 = v20;
            }
            while (v198 + 1 != (char *)v196);
            v196 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v217, v242, 16);
          }
          while (v196);
        }
        if ((v180 & 1) == 0)
        {
          if (v189)
          {
            objc_msgSend(v189, "doubleValue");
            *(_QWORD *)&v204 = v82;
            v185 = 1;
          }
          v83 = (void *)MEMORY[0x1E0CB3940];
          v84 = v194;
          v160 = objc_msgSend(v194, "string");
          v85 = v83;
          v54 = v84;
          v86 = objc_msgSend(v85, "stringWithFormat:", CFSTR("%@ %@"), v175, v160);
          v193 = objc_msgSend(v174, "stringIsBlocklisted:", v86);
          v27 = v178;
          v51 = v192;
LABEL_90:
          v53 = v184;
          if ((v185 & 1) == 0)
            goto LABEL_91;
          goto LABEL_136;
        }
        v79 = v69 - 1;
        v80 = *(_DWORD *)&v68[4 * v69 - 4];
        v81 = v173;
        if (!v80)
          v81 = 1;
        if ((v81 & 1) != 0)
        {
          v34 = v20;
          v27 = v178;
          v51 = v192;
          v54 = v194;
          goto LABEL_90;
        }
        if (v79 <= v236)
          v88 = 0;
        else
          v88 = &v68[4 * v236];
        if (v79 >= v236)
          v89 = v79 - v236;
        else
          v89 = 0;
        v90 = v199;
        v91 = objc_msgSend(v199, "getConditionalProbabilityForTokenID:context:length:probability:", *(unsigned int *)&v68[4 * v69 - 4], v88, v89, &v204);
        *(_DWORD *)&v68[4 * v79] = v80;
        v193 = objc_msgSend(v90, "tokenSequenceIsBlocklisted:length:", v68, v69);
        v34 = v20;
        v27 = v178;
        v51 = v192;
        v54 = v194;
        v53 = v184;
        if ((v91 & 1) == 0)
        {
LABEL_91:
          if ((v176 & v53 & 1) == 0)
          {
            v36 = v186;
            LOBYTE(v50) = v53;
            goto LABEL_144;
          }
          v36 = v186;
          if (v232 * v226 >= 0.0)
          {
            LOBYTE(v50) = 1;
            goto LABEL_144;
          }
          objc_msgSend(v54, "setLinguisticScore:", v232 * v226);
LABEL_145:
          objc_msgSend(v54, "setLexiconScore:", v226);
          goto LABEL_146;
        }
LABEL_136:
        v50 = v53;
        if (v53)
          v109 = v235 * *(double *)&v204 + v233 * v226;
        else
          v109 = v235 * *(double *)&v204;
        if (v190)
        {
          objc_msgSend(v190, "doubleValue");
          v109 = v109 + v234 * v110;
        }
        v36 = v186;
        if (v109 >= 0.0)
          goto LABEL_144;
        objc_msgSend(v54, "setLinguisticScore:", v109);
        if (v50)
          goto LABEL_145;
LABEL_146:
        objc_msgSend(v54, "setBlocklisted:", v193);
        v39 = v51 + 1;
        v41 = v191 + 1;
      }
      while (v191 + 1 != v188);
      v111 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v227, v244, 16);
      v188 = v111;
    }
    while (v111);
  }
  v112 = (void *)objc_msgSend((id)objc_msgSend(v166, "candidates"), "sortedArrayUsingComparator:", &__block_literal_global_311);
  v113 = v112;
  v114 = v231 > 0.0 && v162;
  if (v114 && (unint64_t)objc_msgSend(v112, "count", v231) >= 2)
  {
    v115 = -[AppleSpell transformerOrSiriLanguageModelForLanguageObject:appIdentifier:waitForResult:](v18, "transformerOrSiriLanguageModelForLanguageObject:appIdentifier:waitForResult:", v34, v165, 0);
    if (v115)
    {
      v116 = v115;
      v117 = objc_msgSend(v115, "stateWithContext:", v175);
      if (v117)
      {
        v118 = (void *)v117;
        v119 = objc_msgSend(v113, "count");
        v195 = v116;
        if (v119 > _kMaxCorrectionRescoreCount)
          v113 = (void *)objc_msgSend(v113, "subarrayWithRange:", 0);
        v120 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v209 = 0u;
        v210 = 0u;
        v211 = 0u;
        v212 = 0u;
        v121 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v209, v240, 16);
        if (v121)
        {
          v122 = v121;
          v123 = *(_QWORD *)v210;
          do
          {
            for (k = 0; k != v122; ++k)
            {
              if (*(_QWORD *)v210 != v123)
                objc_enumerationMutation(v113);
              v125 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * k);
              v126 = objc_msgSend(v125, "replacementRange");
              if (v182 == (char *)v126 && v181 == v127)
                objc_msgSend(v120, "addObject:", objc_msgSend(v125, "string"));
            }
            v122 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v209, v240, 16);
          }
          while (v122);
        }
        v129 = objc_msgSend(v120, "count");
        v167 = v18;
        v168 = v20;
        if (v129)
          v130 = (id)objc_msgSend(v118, "conditionalProbabilityDictionaryForStrings:", v120);
        else
          v130 = 0;
        v131 = v186;
        v207 = 0u;
        v208 = 0u;
        v205 = 0u;
        v206 = 0u;
        v132 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v205, v239, 16);
        if (v132)
        {
          v133 = v132;
          v134 = *(char **)v206;
          v197 = v130;
          v198 = v134;
          do
          {
            v135 = 0;
            do
            {
              if (*(char **)v206 != v198)
                objc_enumerationMutation(v113);
              v136 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * v135);
              v226 = 0.0;
              if (v130)
                v130 = (id)objc_msgSend(v130, "objectForKey:", objc_msgSend(v136, "string"));
              v137 = v113;
              if (v131)
                v138 = (void *)objc_msgSend(v131, "objectForKey:", objc_msgSend(v136, "string"));
              else
                v138 = 0;
              v139 = objc_msgSend(v136, "replacementRange");
              v141 = v140;
              v142 = objc_msgSend(v136, "lexiconScore");
              v144 = v143;
              if (v130)
              {
                objc_msgSend(v130, "doubleValue");
                v226 = v145;
              }
              else
              {
                if (v182 == (char *)v139 && v181 == v141)
                  goto LABEL_202;
                v196 = (uint64_t)v161;
                v204 = v169;
                MEMORY[0x1E0C80A78](v142);
                v151 = v177;
                -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](v167, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", v139, v141, v168, v177, v199, &v161[-((v150 + 19) & 0xFFFFFFFFFFFFFFF0)], 0, &v204, 0, 0);
                if (*((_QWORD *)&v204 + 1))
                {
                  v152 = (void *)objc_msgSend(v151, "string");
                  v153 = (const __CFString *)objc_msgSend(v152, "substringWithRange:", (_QWORD)v204, *((_QWORD *)&v204 + 1));
                }
                else
                {
                  v153 = &stru_1EA8D8440;
                }
                if (!objc_msgSend(v195, "getConditionalProbabilityForString:context:probability:", objc_msgSend(v136, "string"), v153, &v226))goto LABEL_202;
                v145 = v226;
              }
              v146 = v231 * v145;
              if (v144 >= 0.0)
                v147 = v146;
              else
                v147 = v146 + v233 * v144;
              if (v138)
              {
                objc_msgSend(v138, "doubleValue");
                v147 = v147 + v234 * v148;
              }
              objc_msgSend(v136, "setLinguisticScore:", v147);
LABEL_202:
              ++v135;
              v131 = v186;
              v113 = v137;
              v130 = v197;
            }
            while (v133 != v135);
            v133 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v205, v239, 16);
          }
          while (v133);
        }
        v113 = (void *)objc_msgSend(v113, "sortedArrayUsingComparator:", &__block_literal_global_311);
      }
    }
  }
  v202 = 0u;
  v203 = 0u;
  v200 = 0u;
  v201 = 0u;
  v154 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v200, v238, 16);
  v155 = (void *)v164;
  if (v154)
  {
    v156 = v154;
    v157 = *(_QWORD *)v201;
    do
    {
      for (m = 0; m != v156; ++m)
      {
        if (*(_QWORD *)v201 != v157)
          objc_enumerationMutation(v113);
        objc_msgSend(v155, "addObject:", *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * m));
      }
      v156 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v200, v238, 16);
    }
    while (v156);
  }
  return v155;
}

- (BOOL)_useAlternateLanguageForRange:(_NSRange)a3 ofString:(id)a4 languageObject:(id)a5 tagger:(id)a6 alternateLanguageObject:(id)a7 alternateTagger:(id)a8 appIdentifier:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  BOOL result;
  id v23;
  NSUInteger v24;
  unint64_t v25;
  unint64_t v26;
  unsigned int v27;
  BOOL v28;
  unsigned int v29;
  char v30;
  BOOL v31;
  BOOL v32;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  id v37;
  char *v38;
  char *v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  _QWORD v43[2];

  v41 = a6;
  length = a3.length;
  location = a3.location;
  v43[1] = *MEMORY[0x1E0C80C00];
  v40 = objc_msgSend(a4, "length");
  v15 = -[AppleSpell wordLanguageModelForLanguageObject:appIdentifier:waitForResult:](self, "wordLanguageModelForLanguageObject:appIdentifier:waitForResult:", a5, a9, 0);
  v16 = -[AppleSpell wordLanguageModelForLanguageObject:appIdentifier:waitForResult:](self, "wordLanguageModelForLanguageObject:appIdentifier:waitForResult:", a7, a9, 0);
  v17 = MEMORY[0x1E0C80A78](v16);
  v39 = (char *)&v34 - ((v18 + 23) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v38 = (char *)&v34 - v19;
  v42 = 0;
  v43[0] = 0;
  v36 = objc_msgSend(v15, "getFirstDynamicTokenID:lastDynamicTokenID:", (char *)v43 + 4, v43);
  v35 = objc_msgSend(v16, "getFirstDynamicTokenID:lastDynamicTokenID:", (char *)&v42 + 4, &v42);
  v20 = -[AppleSpell useUnigramProbabilityForLanguageObject:](self, "useUnigramProbabilityForLanguageObject:", a5);
  v21 = -[AppleSpell useUnigramProbabilityForLanguageObject:](self, "useUnigramProbabilityForLanguageObject:", a7);
  result = 0;
  v37 = a8;
  if (a8)
  {
    v23 = v41;
    if (v41)
    {
      if (a4)
      {
        if (v15)
        {
          if (v16)
          {
            if (!v20 && !v21 && v40 >= location + length)
            {
              v24 = location - objc_msgSend(a4, "paragraphRangeForRange:", location, length);
              v25 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](self, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", v24, length, a5, v23, v15, _kMaxContextLength, v39, 0, 0, 0, 0);
              v26 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](self, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", v24, length, a7, v37, v16, _kMaxContextLength, v38, 0, 0, 0, 0);
              result = 0;
              if (v25)
              {
                if (v26)
                {
                  v27 = *(_DWORD *)&v39[4 * v25 - 4];
                  v28 = v27 != 0;
                  v29 = *(_DWORD *)&v38[4 * v26 - 4];
                  v30 = v36;
                  if (!v27)
                    v30 = 0;
                  v31 = HIDWORD(v43[0]) > v27;
                  v32 = v27 > LODWORD(v43[0]);
                  v33 = v35;
                  if (!v29)
                    v33 = 0;
                  if (v33 == 1)
                  {
                    if (HIDWORD(v42) <= v29 && v29 <= v42)
                      return 0;
                  }
                  else if (!v29)
                  {
                    return 0;
                  }
                  return (v31 | ~v30 | v32) & v28 ^ 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (float)dynamicScoreForWord:(id)a3 languageModel:(id)a4 languageObject:(id)a5
{
  uint64_t v6;
  float result;

  if (!a3)
    return 0.0;
  if (!a4)
    return 0.0;
  v6 = -[AppleSpell _tokenIDForString:languageModel:languageObject:terminatorTokenID:](self, "_tokenIDForString:languageModel:languageObject:terminatorTokenID:");
  if (!(_DWORD)v6)
    return 0.0;
  objc_msgSend(a4, "usageCountForTokenID:", v6);
  return result;
}

- (float)dynamicScoreForWord:(id)a3 languageObject:(id)a4 appIdentifier:(id)a5
{
  float result;

  -[AppleSpell dynamicScoreForWord:languageModel:languageObject:](self, "dynamicScoreForWord:languageModel:languageObject:", a3, -[AppleSpell wordLanguageModelForLanguageObject:appIdentifier:waitForResult:](self, "wordLanguageModelForLanguageObject:appIdentifier:waitForResult:", a4, a5, 0), a4);
  return result;
}

- (id)assetDataBundleURLsForLanguageObject:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];

  if (!a3)
    return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = objc_msgSend(a3, "identifier");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v4)
  {
    v6 = objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
    if (v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __69__AppleSpell_LanguageModeling__assetDataBundleURLsForLanguageObject___block_invoke;
      v8[3] = &unk_1EA8CCD68;
      v8[4] = v5;
      -[AppleSpell enumerateAssetDataItemsForLocale:withBlock:](self, "enumerateAssetDataItemsForLocale:withBlock:", v6, v8);
    }
  }
  return v5;
}

uint64_t __69__AppleSpell_LanguageModeling__assetDataBundleURLsForLanguageObject___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(CFSTR("Spelling"), "isEqualToString:", a4);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return result;
}

- (BOOL)getConditionalProbabilityForWord:(id)a3 context:(id)a4 language:(id)a5 probability:(double *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v18;
  char v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a5);
  v11 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", v10, a4, 0, objc_msgSend(a4, "length"));
  v12 = -[AppleSpell wordLanguageModelForLanguageObject:appIdentifier:waitForResult:](self, "wordLanguageModelForLanguageObject:appIdentifier:waitForResult:", v10, 0, 1);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v21 - ((v13 + 23) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend(a4, "length");
  v16 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](self, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", v15, 0, v10, v11, v12, _kMaxContextLength, v14, 0, 0, 0, 0);
  v17 = -[AppleSpell _tokenIDForString:languageModel:languageObject:terminatorTokenID:](self, "_tokenIDForString:languageModel:languageObject:terminatorTokenID:", a3, v12, v10, 0);
  v18 = -[AppleSpell useUnigramProbabilityForLanguageObject:](self, "useUnigramProbabilityForLanguageObject:", v10);
  v19 = 0;
  if (v12 && !v18 && (_DWORD)v17)
    v19 = objc_msgSend(v12, "getConditionalProbabilityForTokenID:context:length:probability:", v17, v14, v16, a6);
  -[AppleSpell invalidateTagger:](self, "invalidateTagger:", v11);
  return v19;
}

- (BOOL)getCharacterModelConditionalProbabilityForString:(id)a3 context:(id)a4 language:(id)a5 probability:(double *)a6
{
  id v9;

  v9 = -[AppleSpell characterLanguageModelForLanguageObject:waitForResult:](self, "characterLanguageModelForLanguageObject:waitForResult:", +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a5), 1);
  if (v9)
    LOBYTE(v9) = objc_msgSend(v9, "getConditionalProbabilityForString:context:probability:", a3, a4, a6);
  return (char)v9;
}

- (BOOL)getTransformerModelConditionalProbabilityForString:(id)a3 context:(id)a4 language:(id)a5 probability:(double *)a6
{
  id v9;

  v9 = -[AppleSpell transformerLanguageModelForLanguageObject:waitForResult:](self, "transformerLanguageModelForLanguageObject:waitForResult:", +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a5), 1);
  if (v9)
    LOBYTE(v9) = objc_msgSend(v9, "getConditionalProbabilityForString:context:probability:", a3, a4, a6);
  return (char)v9;
}

- (id)globalDictionaryArray
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  PRDictionary *v9;
  PRDictionary *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_globalDictionaryArray)
  {
    self->_globalDictionaryArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = -[AppleSpell dataBundlesForLanguageObject:](self, "dataBundlesForLanguageObject:", 0, 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "URLForResource:withExtension:subdirectory:localization:", CFSTR("gbindict.dat"), 0, 0, 0);
          if (v8)
          {
            v9 = -[PRDictionary initWithURL:fallbackURL:]([PRDictionary alloc], "initWithURL:fallbackURL:", v8, 0);
            if (v9)
            {
              v10 = v9;
              -[NSMutableArray addObject:](self->_globalDictionaryArray, "addObject:", v9);

            }
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }
  }
  return self->_globalDictionaryArray;
}

- (id)localDictionaryArrayForLanguageObject:(id)a3
{
  uint64_t v5;
  NSObject *assetDataBundleSerialQueue;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  PRDictionary *v17;
  PRDictionary *v18;
  uint64_t v20;
  AppleSpell *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD block[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = objc_msgSend(a3, "identifier");
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    if (v5)
    {
      if (self->_hasUpdatedDataBundleLanguages)
      {
        assetDataBundleSerialQueue = self->_assetDataBundleSerialQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __64__AppleSpell_Dictionary__localDictionaryArrayForLanguageObject___block_invoke;
        block[3] = &unk_1EA8CCEA8;
        block[4] = self;
        block[5] = v5;
        block[6] = &v28;
        dispatch_sync(assetDataBundleSerialQueue, block);
        if (*((_BYTE *)v29 + 24))
        {
          -[NSMutableDictionary removeObjectForKey:](self->_localDictionaryArrays, "removeObjectForKey:", v5);
          -[AppleSpell updateLexiconsForLanguageIfNecessary:](self, "updateLexiconsForLanguageIfNecessary:", v5);
        }
      }
    }
  }
  else
  {
    v5 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
  }
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_localDictionaryArrays, "objectForKey:", v5);
  if (!v7)
  {
    v20 = v5;
    v21 = self;
    v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = -[AppleSpell dataBundlesForLanguageObject:](self, "dataBundlesForLanguageObject:", a3);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (!v9)
      goto LABEL_24;
    v10 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v13 = objc_msgSend(a3, "localization");
        v14 = (void *)objc_msgSend(a3, "fallbackLocalization");
        v15 = objc_msgSend(v12, "URLForResource:withExtension:subdirectory:localization:", CFSTR("bindict.dat"), 0, 0, v13);
        if (v14 && (objc_msgSend(v14, "isEqualToString:", v13) & 1) == 0)
        {
          v16 = objc_msgSend(v12, "URLForResource:withExtension:subdirectory:localization:", CFSTR("bindict.dat"), 0, 0, v14);
          if (v15)
          {
LABEL_16:
            v17 = [PRDictionary alloc];
            goto LABEL_20;
          }
        }
        else
        {
          v16 = 0;
          if (v15)
            goto LABEL_16;
        }
        if (!v16)
          continue;
        v17 = [PRDictionary alloc];
        v15 = v16;
        v16 = 0;
LABEL_20:
        v18 = -[PRDictionary initWithURL:fallbackURL:](v17, "initWithURL:fallbackURL:", v15, v16);
        if (v18)
        {
          objc_msgSend(v22, "addObject:", v18);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (!v9)
      {
LABEL_24:
        v7 = v22;
        -[NSMutableDictionary setObject:forKey:](v21->_localDictionaryArrays, "setObject:forKey:", v22, v20);
        break;
      }
    }
  }
  _Block_object_dispose(&v28, 8);
  return v7;
}

uint64_t __64__AppleSpell_Dictionary__localDictionaryArrayForLanguageObject___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 408), "containsObject:", a1[5]);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1[4] + 408), "removeObject:", a1[5]);
    result = objc_msgSend(*(id *)(a1[4] + 408), "count");
    if (!result)
      *(_BYTE *)(a1[4] + 578) = 0;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)checkWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 index:(unint64_t)a6
{
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t i;
  void *v16;
  uint64_t v17;
  BOOL result;

  v11 = -[AppleSpell localDictionaryArrayForLanguageObject:](self, "localDictionaryArrayForLanguageObject:", a5);
  v12 = -[AppleSpell globalDictionaryArray](self, "globalDictionaryArray");
  v13 = objc_msgSend(v11, "count");
  v14 = objc_msgSend(v12, "count") + v13;
  if (!v14)
    return 0;
  for (i = 0; i < v14; ++i)
  {
    if (i >= v13)
    {
      v17 = i - v13;
      v16 = v12;
    }
    else
    {
      v16 = v11;
      v17 = i;
    }
    result = objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", v17), "checkWordBuffer:length:encoding:index:caseInsensitive:", a3, a4, objc_msgSend(a5, "encoding"), a6, 1);
    if (result)
      break;
  }
  return result;
}

- (BOOL)checkNameWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 globalOnly:(BOOL)a6
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = -[AppleSpell globalDictionaryArray](self, "globalDictionaryArray");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (!v12)
  {
    v14 = 0;
LABEL_14:
    if (!a6)
    {
      v17 = -[AppleSpell localDictionaryArrayForLanguageObject:](self, "localDictionaryArrayForLanguageObject:", a5);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v18)
      {
        v19 = v18;
        v14 = 0;
        v20 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v17);
            if ((v14 & 1) != 0)
              v14 = 1;
            else
              v14 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "checkWordBuffer:length:encoding:index:caseInsensitive:", a3, a4, objc_msgSend(a5, "encoding"), 7, 0);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v19);
      }
      else
      {
        return 0;
      }
    }
    return v14;
  }
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v28;
  do
  {
    for (j = 0; j != v13; ++j)
    {
      if (*(_QWORD *)v28 != v15)
        objc_enumerationMutation(v11);
      if ((v14 & 1) != 0)
        v14 = 1;
      else
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "checkWordBuffer:length:encoding:index:caseInsensitive:", a3, a4, objc_msgSend(a5, "encoding"), 7, 0);
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  }
  while (v13);
  if ((v14 & 1) == 0)
    goto LABEL_14;
  return v14;
}

- (id)dictionaryForLanguageObject:(id)a3 index:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[AppleSpell localDictionaryArrayForLanguageObject:](self, "localDictionaryArrayForLanguageObject:", a3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if (!v8)
          v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryAtIndex:", a4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)autocorrectionDictionaryForLanguageObject:(id)a3
{
  return -[AppleSpell dictionaryForLanguageObject:index:](self, "dictionaryForLanguageObject:index:", a3, 0);
}

- (id)guessesDictionaryForLanguageObject:(id)a3
{
  return -[AppleSpell dictionaryForLanguageObject:index:](self, "dictionaryForLanguageObject:index:", a3, 1);
}

- (id)capitalizationDictionaryArrayForLanguageObject:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[AppleSpell dictionaryForLanguageObject:index:](self, "dictionaryForLanguageObject:index:", a3, 2);
  v5 = -[AppleSpell globalDictionaryArray](self, "globalDictionaryArray");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        if (!v8)
          v8 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryAtIndex:", 2);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  if (v4)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, v8, 0);
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v8, 0, v12);
}

- (id)phraseCorrectionsDictionaryForLanguageObject:(id)a3
{
  return -[AppleSpell dictionaryForLanguageObject:index:](self, "dictionaryForLanguageObject:index:", a3, 3);
}

- (id)sentenceCorrectionsDictionaryForLanguageObject:(id)a3
{
  return -[AppleSpell dictionaryForLanguageObject:index:](self, "dictionaryForLanguageObject:index:", a3, 4);
}

- (id)regionalCorrectionsDictionaryForLanguageObject:(id)a3
{
  return -[AppleSpell dictionaryForLanguageObject:index:](self, "dictionaryForLanguageObject:index:", a3, 7);
}

- (id)parameterBundleForLanguageObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[AppleSpell localDictionaryArrayForLanguageObject:](self, "localDictionaryArrayForLanguageObject:", a3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      v4 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "parameterBundle");
      if (v4)
        break;
      if (v5 == (void *)++v7)
      {
        v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v5 = v4;
        if (v4)
          goto LABEL_3;
        return v4;
      }
    }
  }
  return v4;
}

- (id)transformerParameterBundleForLanguageObject:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[AppleSpell localDictionaryArrayForLanguageObject:](self, "localDictionaryArrayForLanguageObject:");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "transformerParameterBundle");
      if (v10)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = -[AppleSpell parameterBundleForLanguageObject:](self, "parameterBundleForLanguageObject:", a3);
  }
  return v10;
}

- (void)clearCaches
{
  -[AppleSpell releaseDatabaseConnections](self, "releaseDatabaseConnections");
  -[NSMutableDictionary removeAllObjects](self->_localDictionaryArrays, "removeAllObjects");

  self->_globalDictionaryArray = 0;
}

- (id)_taggerForOrthoIndex:(unint64_t)a3
{
  NSObject *taggerSerialQueue;
  PRTagger *v5;
  PRTagger *v6;
  PRTagger *v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  taggerSerialQueue = self->_taggerSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AppleSpell_Tagger___taggerForOrthoIndex___block_invoke;
  block[3] = &unk_1EA8CCED0;
  block[4] = self;
  block[5] = &v10;
  block[6] = a3;
  dispatch_sync(taggerSerialQueue, block);
  v5 = (PRTagger *)v11[5];
  if (!v5)
  {
    v6 = [PRTagger alloc];
    v5 = -[PRTagger initWithTagSchemes:orthoIndex:](v6, "initWithTagSchemes:orthoIndex:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CCE0E8], 0), a3);
    v11[5] = (uint64_t)v5;
  }
  v7 = v5;
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __43__AppleSpell_Tagger___taggerForOrthoIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 88), "count");
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = (id)objc_msgSend(*(id *)(a1[4] + 88), "lastObject");
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setOrthoIndex:", a1[6]);
    return objc_msgSend(*(id *)(a1[4] + 88), "removeLastObject");
  }
  return result;
}

- (void)invalidateTagger:(id)a3
{
  NSObject *taggerSerialQueue;
  _QWORD v6[6];

  if (a3)
  {
    objc_msgSend(a3, "setString:", &stru_1EA8D8440);
    objc_msgSend(a3, "setOrthoIndex:", 0);
    taggerSerialQueue = self->_taggerSerialQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__AppleSpell_Tagger__invalidateTagger___block_invoke;
    v6[3] = &unk_1EA8CCAD8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(taggerSerialQueue, v6);
  }
}

unint64_t __39__AppleSpell_Tagger__invalidateTagger___block_invoke(uint64_t a1)
{
  unint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
  if (result <= 4)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "containsObject:", *(_QWORD *)(a1 + 40));
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (id)taggerForLanguageObject:(id)a3 string:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  length = a5.length;
  location = a5.location;
  v10 = objc_msgSend(a3, "orthographyIndex");
  if (!v10)
    return 0;
  v11 = v10;
  v12 = -[AppleSpell _taggerForOrthoIndex:](self, "_taggerForOrthoIndex:", v10);
  objc_msgSend(v12, "setString:", a4);
  if (v11 > 191)
  {
    if (v11 > 230)
    {
      switch(v11)
      {
        case 231:
          v13 = (void *)MEMORY[0x1E0CB3840];
          v14 = CFSTR("pa");
          goto LABEL_24;
        case 235:
          v13 = (void *)MEMORY[0x1E0CB3840];
          v14 = CFSTR("te");
          goto LABEL_24;
        case 239:
          v13 = (void *)MEMORY[0x1E0CB3840];
          v14 = CFSTR("th");
          goto LABEL_24;
      }
      goto LABEL_28;
    }
    if (v11 != 192)
    {
      if (v11 == 224)
      {
        v13 = (void *)MEMORY[0x1E0CB3840];
        v14 = CFSTR("el");
        goto LABEL_24;
      }
      if (v11 == 227)
      {
        v13 = (void *)MEMORY[0x1E0CB3840];
        v14 = CFSTR("he");
LABEL_24:
        v16 = objc_msgSend(v13, "defaultOrthographyForLanguage:", v14);
        goto LABEL_25;
      }
      goto LABEL_28;
    }
    v15 = (void *)MEMORY[0x1E0CB3920];
LABEL_19:
    v16 = objc_msgSend(v15, "orthographyWithFlags:", NSOrthographyFlagsForScriptAndOrthographyIndexes());
LABEL_25:
    v17 = v16;
LABEL_26:
    objc_msgSend(v12, "setOrthography:range:", v17, location, length);
    return v12;
  }
  if ((unint64_t)(v11 - 128) < 3)
  {
    v15 = (void *)MEMORY[0x1E0CB3920];
    goto LABEL_19;
  }
  if (v11 == 3)
  {
    v13 = (void *)MEMORY[0x1E0CB3840];
    v14 = CFSTR("ko");
    goto LABEL_24;
  }
  if (v11 == 160)
  {
    v15 = (void *)MEMORY[0x1E0CB3920];
    goto LABEL_19;
  }
LABEL_28:
  v19 = NSOrthographyFlagsForScriptAndOrthographyIndexes();
  if ((_DWORD)v19)
  {
    v17 = objc_msgSend(MEMORY[0x1E0CB3920], "orthographyWithFlags:", v19);
    if (v17)
      goto LABEL_26;
  }
  v17 = objc_msgSend(MEMORY[0x1E0CB3840], "defaultOrthographyForLanguage:", objc_msgSend(a3, "identifier", v17));
  if (v17)
    goto LABEL_26;
  return v12;
}

- (id)spellServer:(id)a3 suggestCompletionsForPartialWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)lastLanguage options:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  length = a4.length;
  location = a4.location;
  v29 = *MEMORY[0x1E0C80C00];
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (!lastLanguage
    || (objc_msgSend(lastLanguage, "isEqualToString:", CFSTR("und")) & 1) != 0
    || objc_msgSend(lastLanguage, "isEqualToString:", CFSTR("Multilingual")))
  {
    lastLanguage = self->_lastLanguage;
    if (!lastLanguage)
    {
      if (-[NSArray count](self->_userPreferredLanguages, "count"))
        lastLanguage = -[NSArray objectAtIndex:](self->_userPreferredLanguages, "objectAtIndex:", 0);
      else
        lastLanguage = CFSTR("en");
    }
  }
  v16 = -[AppleSpell spellServer:suggestCompletionDictionariesForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestCompletionDictionariesForPartialWordRange:inString:inLanguage:options:", a3, location, length, a5, lastLanguage, a7);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
LABEL_10:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v19)
        objc_enumerationMutation(v16);
      v21 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v20), "objectForKey:", CFSTR("Completion"));
      if (v21)
      {
        v22 = v21;
        if ((objc_msgSend(v14, "containsObject:", v21) & 1) == 0)
          objc_msgSend(v14, "addObject:", v22);
      }
      if ((unint64_t)objc_msgSend(v14, "count") > 0x13)
        break;
      if (v18 == ++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v18)
          goto LABEL_10;
        break;
      }
    }
  }
  -[AppleSpell resetTimer](self, "resetTimer");

  return v14;
}

- (id)spellServer:(id)a3 suggestCompletionDictionariesForPartialWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)lastLanguage options:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  int v17;
  CFIndex v18;
  id v19;
  void *v20;
  CFStringEncoding v21;
  id v22;
  uint64_t v24;
  BOOL v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t i;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  CFIndex *usedBufLen;
  uint64_t v48;
  id v49;
  char v50;
  uint64_t v51;
  NSUInteger v52;
  id v54;
  void *v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CFIndex v69;
  char v70;
  _BYTE v71[128];
  _BYTE v72[128];
  UInt8 v73[128];
  UInt8 buffer[256];
  uint64_t v75;
  CFRange v76;

  length = a4.length;
  location = a4.location;
  v75 = *MEMORY[0x1E0C80C00];
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v13 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v52 = location;
  if (length)
    v15 = (__CFString *)objc_msgSend(a5, "substringWithRange:", location, length);
  else
    v15 = 0;
  v51 = _appIdentifierFromOptions(a7);
  v16 = (void *)objc_msgSend(a7, "objectForKey:", CFSTR("AsynchronousLanguageModelCreation"));
  v55 = (void *)v13;
  if (v16)
    v17 = objc_msgSend(v16, "BOOLValue") ^ 1;
  else
    LOBYTE(v17) = 1;
  v50 = v17;
  v70 = 0;
  v18 = -[__CFString length](v15, "length");
  v69 = 0;
  if (!lastLanguage
    || (objc_msgSend(lastLanguage, "isEqualToString:", CFSTR("und")) & 1) != 0
    || objc_msgSend(lastLanguage, "isEqualToString:", CFSTR("Multilingual")))
  {
    lastLanguage = self->_lastLanguage;
    if (!lastLanguage)
    {
      if (-[NSArray count](self->_userPreferredLanguages, "count"))
        lastLanguage = -[NSArray objectAtIndex:](self->_userPreferredLanguages, "objectAtIndex:", 0);
      else
        lastLanguage = CFSTR("en");
    }
  }
  v19 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", lastLanguage);
  v20 = -[AppleSpell databaseConnectionForLanguageObject:](self, "databaseConnectionForLanguageObject:", v19);
  v21 = objc_msgSend(v19, "encoding");
  v22 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", v19, a5, 0, objc_msgSend(a5, "length"));
  if (v22)
  {
    BYTE1(v48) = v50;
    LOBYTE(v48) = v50;
    -[AppleSpell _addLanguageModelCompletionsForPartialWordRange:languageObject:connection:sender:tagger:appIdentifier:waitForLanguageModel:allowTransformer:candidates:scoreDictionary:tryTransliteration:](self, "_addLanguageModelCompletionsForPartialWordRange:languageObject:connection:sender:tagger:appIdentifier:waitForLanguageModel:allowTransformer:candidates:scoreDictionary:tryTransliteration:", v52, length, v19, v20, a3, v22, v51, v48, v55, v14, &v70);
  }
  if (v15)
  {
    if (v20 && v18 != 0)
    {
      v76.location = 0;
      v76.length = v18;
      CFStringGetBytes(v15, v76, v21, 0x5Fu, 0, buffer, 253, &v69);
    }
  }
  v24 = objc_msgSend(v55, "count");
  v54 = v22;
  if (v22)
    v25 = v24 == 0;
  else
    v25 = 1;
  if (!v25)
  {
    LOBYTE(usedBufLen) = v50;
    v26 = -[AppleSpell _rankedCandidatesForRange:candidates:languageObject:tagger:appIdentifier:allowTransformer:scoreDictionary:](self, "_rankedCandidatesForRange:candidates:languageObject:tagger:appIdentifier:allowTransformer:scoreDictionary:", v52, length, v55, v19, v22, v51, usedBufLen, v14);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v66;
      v30 = 0.0;
      v31 = 0.0;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v66 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend((id)objc_msgSend(v14, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i)), "doubleValue");
          if (v33 < v31)
            v31 = v33;
          v30 = v30 + v33;
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      }
      while (v28);
      if (v31 >= 0.0)
      {
        if (v30 > 0.0)
        {
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v40 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v58;
LABEL_48:
            v43 = 0;
            while (1)
            {
              if (*(_QWORD *)v58 != v42)
                objc_enumerationMutation(v26);
              v44 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v43);
              objc_msgSend((id)objc_msgSend(v14, "objectForKey:", v44), "doubleValue");
              objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v44, CFSTR("Completion"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45 / v30), CFSTR("Score"), 0));
              if ((unint64_t)objc_msgSend(v12, "count") > 0x13)
                break;
              if (v41 == ++v43)
              {
                v41 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
                if (v41)
                  goto LABEL_48;
                break;
              }
            }
          }
        }
      }
      else
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v34 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v62;
LABEL_38:
          v37 = 0;
          while (1)
          {
            if (*(_QWORD *)v62 != v36)
              objc_enumerationMutation(v26);
            v38 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v37);
            objc_msgSend((id)objc_msgSend(v14, "objectForKey:", v38), "doubleValue");
            objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v38, CFSTR("Completion"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39 - v31), CFSTR("Score"), 0));
            if ((unint64_t)objc_msgSend(v12, "count") > 0x13)
              break;
            if (v35 == ++v37)
            {
              v35 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
              if (v35)
                goto LABEL_38;
              break;
            }
          }
        }
      }
    }
  }
  -[AppleSpell resetTimer](self, "resetTimer");
  -[AppleSpell invalidateTagger:](self, "invalidateTagger:", v54);

  return v12;
}

- (id)spellServer:(id)a3 suggestNextLetterDictionariesForPartialWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)a6 options:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  double v19;
  float v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  float v29;
  float v30;
  uint64_t j;
  uint64_t v32;
  double v33;
  id v35;
  void *v36;
  AppleSpell *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _OWORD v43[6];
  uint64_t v44;
  uint64_t v45;

  length = a4.length;
  location = a4.location;
  v45 = *MEMORY[0x1E0C80C00];
  v14 = (void *)objc_msgSend(a5, "substringWithRange:", a4.location, a4.length);
  v36 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v15 = objc_msgSend(v14, "length");
  v16 = 0;
  v44 = 0;
  memset(v43, 0, sizeof(v43));
  v17 = spellServer_suggestNextLetterDictionariesForPartialWordRange_inString_inLanguage_options__total_frequency;
  do
    *(float *)&v17 = *(float *)&spellServer_suggestNextLetterDictionariesForPartialWordRange_inString_inLanguage_options__letter_unigram_frequencies[v16++]
                   + *(float *)&v17;
  while (v16 != 26);
  v18 = 0;
  spellServer_suggestNextLetterDictionariesForPartialWordRange_inString_inLanguage_options__total_frequency = v17;
  v19 = *(float *)&v17;
  do
  {
    v20 = *(float *)&spellServer_suggestNextLetterDictionariesForPartialWordRange_inString_inLanguage_options__letter_unigram_frequencies[v18]
        * 0.1
        / v19;
    *(float *)((char *)v43 + v18 * 4) = v20;
    ++v18;
  }
  while (v18 != 26);
  v37 = self;
  v21 = -[AppleSpell spellServer:suggestCompletionDictionariesForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestCompletionDictionariesForPartialWordRange:inString:inLanguage:options:", a3, location, length, a5, a6, a7);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v27 = (void *)objc_msgSend(v26, "objectForKey:", CFSTR("Completion"));
        if (objc_msgSend(v27, "length") > v15)
        {
          if (objc_msgSend(v27, "hasPrefix:", v14))
          {
            v28 = objc_msgSend(v27, "characterAtIndex:", v15);
            objc_msgSend((id)objc_msgSend(v26, "objectForKey:", CFSTR("Score")), "floatValue");
            if ((v28 - 97) <= 0x19)
            {
              v30 = v29 * 0.9;
              *((float *)v43 + (v28 - 97)) = *((float *)v43 + (v28 - 97)) + v30;
            }
          }
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v23);
  }
  for (j = 0; j != 26; ++j)
  {
    v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), j + 97);
    LODWORD(v33) = *((_DWORD *)v43 + j);
    objc_msgSend(v36, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v32, CFSTR("Letter"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33), CFSTR("Score"), 0));
  }
  objc_msgSend(v36, "sortUsingComparator:", &__block_literal_global_212);
  -[AppleSpell resetTimer](v37, "resetTimer");

  return v36;
}

uint64_t __115__AppleSpell_Completion__spellServer_suggestNextLetterDictionariesForPartialWordRange_inString_inLanguage_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v10;
  float v11;
  float v12;

  v4 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("Score"));
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Score"));
  objc_msgSend(v4, "floatValue");
  v7 = v6;
  objc_msgSend(v5, "floatValue");
  if (v7 > v8)
    return -1;
  objc_msgSend(v4, "floatValue");
  v11 = v10;
  objc_msgSend(v5, "floatValue");
  return v11 < v12;
}

- (id)spellServer:(id)a3 suggestWordWithMinimumLength:(unint64_t)a4 maximumLength:(unint64_t)a5 language:(id)lastLanguage
{
  id v10;
  __CFString *v11;
  CFStringEncoding v12;
  double Current;
  uint64_t v14;
  unsigned int v15;
  unint64_t v16;
  int v17;
  BOOL v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  size_t v28;
  BOOL v29;
  int v30;
  int v31;
  unint64_t v32;
  unsigned int v33;
  BOOL v34;
  uint64_t v35;
  const char *v36;
  size_t v37;
  size_t v38;
  CFStringEncoding encoding;
  id v41;
  id v42;
  AppleSpell *v43;
  int v44;
  _BYTE v45[2];
  __int16 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  int v63;
  _OWORD v64[9];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v42 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (!lastLanguage
    || (objc_msgSend(lastLanguage, "isEqualToString:", CFSTR("und")) & 1) != 0
    || objc_msgSend(lastLanguage, "isEqualToString:", CFSTR("Multilingual")))
  {
    lastLanguage = self->_lastLanguage;
    if (!lastLanguage)
    {
      if (-[NSArray count](self->_userPreferredLanguages, "count"))
        lastLanguage = -[NSArray objectAtIndex:](self->_userPreferredLanguages, "objectAtIndex:", 0);
      else
        lastLanguage = CFSTR("en");
    }
  }
  memset(v64, 0, sizeof(v64));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0;
  v10 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", lastLanguage);
  v44 = objc_msgSend(v10, "isGerman");
  v43 = self;
  v11 = -[AppleSpell databaseConnectionForLanguageObject:](self, "databaseConnectionForLanguageObject:", v10);
  v12 = objc_msgSend(v10, "encoding");
  if (v11)
  {
    encoding = v12;
    v41 = v10;
    Current = CFAbsoluteTimeGetCurrent();
    memset((char *)v64 + 8, 0, 136);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    HIDWORD(v62) = 0;
    v63 = 0;
    *(_QWORD *)&v64[0] = v45;
    *((_QWORD *)&v64[6] + 1) = &v47;
    HIBYTE(v64[7]) = 1;
    *(_WORD *)((char *)&v64[8] + 1) = v11->isa;
    srandom(((Current - floor(Current)) * 100000.0));
    v14 = 0;
    while (v14 != 10)
    {
      v45[0] = aAaaaabbbccddee[random() % 0x39uLL];
      HIDWORD(v16) = v45[0] - 65;
      LODWORD(v16) = HIDWORD(v16);
      v15 = v16 >> 1;
      v29 = v15 > 0x1C;
      v17 = (1 << v15) & 0x14951495;
      v18 = v29 || v17 == 0;
      if (!v18
        || (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1DE2EC910, (uint32x4_t)vaddq_s32(vdupq_n_s32(v45[0]), (int32x4_t)xmmword_1DE2EC900)))) & 1) != 0|| v45[0] - 248 < 6|| (v45[0] & 0xD8) == 0xC8)
      {
        v19 = &aAaaaabbbccddee[random() % 0x39uLL];
      }
      else
      {
        v19 = &aAeiou[random() % 5uLL];
      }
      v45[1] = *v19;
      v46 = 42;
      PRword((uint64_t)v64, 5, 0);
      v20 = (uint64_t *)*((_QWORD *)&v64[0] + 1);
      if (*((_QWORD *)&v64[0] + 1) && *(_QWORD *)(*((_QWORD *)&v64[0] + 1) + 8) && **((_QWORD **)&v64[0] + 1))
      {
        v21 = *(unsigned __int16 *)(*((_QWORD *)&v64[0] + 1) + 18);
        if (*(_WORD *)(*((_QWORD *)&v64[0] + 1) + 18))
        {
          v22 = 0;
          v23 = 0;
          v24 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            v25 = *v20;
            if (*v20)
            {
              v26 = *(__int16 *)(v20[1] + 2 * v23);
              v27 = (char *)(v25 + v26);
              v28 = strlen((const char *)(v25 + v26));
              v29 = v28 < a4 || v28 > a5;
              if (!v29)
              {
                v30 = *v27;
                if ((v30 & 0xFFFFFFDF) - 65 <= 0x19)
                {
                  v34 = __CFADD__(v30 - 91, 26);
                  v31 = v44;
                  if (!v34)
                    v31 = 1;
                  if (v31 == 1)
                  {
                    if (v28 < 2)
                      goto LABEL_38;
                    v32 = 1;
                    do
                    {
                      v33 = v27[v32++] - 97;
                      v34 = v33 > 0x19 || v32 >= v28;
                    }
                    while (!v34);
                    if (v33 <= 0x19)
                    {
LABEL_38:
                      if (!(random() % (unint64_t)++v22))
                        v24 = v26;
                    }
                  }
                }
              }
            }
            ++v23;
          }
          while (v23 != v21);
          if (v24 != 0x7FFFFFFFFFFFFFFFLL
            && (v35 = *v20) != 0
            && (v36 = (const char *)(v35 + v24), (v37 = strlen((const char *)(v35 + v24))) != 0))
          {
            v38 = v37;
            if (-[AppleSpell checkWordBuffer:length:languageObject:index:](v43, "checkWordBuffer:length:languageObject:index:", v36, v37, v41, 1)|| -[AppleSpell checkNegativeWordBuffer:length:languageObject:](v43, "checkNegativeWordBuffer:length:languageObject:", v36, v38, v41))
            {
              v11 = 0;
            }
            else
            {
              v11 = (__CFString *)CFStringCreateWithCString(0, v36, encoding);
            }
          }
          else
          {
            v11 = 0;
          }
        }
        else
        {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
      ++v14;
      PRword((uint64_t)v64, 17, 0);
      if (v11)
        goto LABEL_58;
    }
    v11 = 0;
  }
LABEL_58:
  -[AppleSpell resetTimer](v43, "resetTimer");

  return v11;
}

- (void)personalizeEmojiArray:(id)a3
{
  CFPropertyListRef v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  int SkinTone;

  v4 = CFPreferencesCopyAppValue(CFSTR("SkinTones:com.apple.CharacterPicker.DefaultDataStorage"), CFSTR("com.apple.CharacterPicker"));
  if (v4)
  {
    v5 = (void *)v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(a3, "count");
      if (v6)
      {
        v7 = v6;
        for (i = 0; i != v7; ++i)
        {
          v9 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
          v10 = objc_msgSend(v5, "objectForKey:", v9);
          if (v10)
          {
            v11 = v10;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v9, "isEqual:", v11) & 1) == 0 && _loadEmojiKit())
            {
              if (_CEMStringIsSingleEmoji(v11))
              {
                if (!objc_msgSend(v9, "hasPrefix:", CFSTR("✊"))
                  || !_loadEmojiKit()
                  || !_CEMStringIsSingleEmoji(v9)
                  || (v12 = _CEMEmojiTokenCreateWithString(v9, 0)) == 0
                  || (v13 = (const void *)v12, SkinTone = _CEMEmojiTokenGetSkinTone(), CFRelease(v13), !SkinTone))
                {
                  objc_msgSend(a3, "replaceObjectAtIndex:withObject:", i, v11);
                }
              }
            }
          }
        }
      }
    }
    CFRelease(v5);
  }
}

- (BOOL)noSuggestForCompletion:(id)a3 languageObject:(id)a4 appIdentifier:(id)a5 alreadyCapitalized:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v10;

  v6 = a6;
  v10 = 0;
  v7 = -[AppleSpell getMetaFlagsForWord:inLexiconForLanguageObject:metaFlags:otherMetaFlags:](self, "getMetaFlagsForWord:inLexiconForLanguageObject:metaFlags:otherMetaFlags:", a3, a4, (char *)&v10 + 4, &v10);
  LOBYTE(v8) = 0;
  if (v7)
  {
    if (v6)
    {
      if ((v10 & 0x8000000000) != 0)
        return v10 >> 7;
      else
        LOBYTE(v8) = 0;
    }
    else
    {
      return (HIDWORD(v10) >> 7) & 1;
    }
  }
  return v8;
}

- (id)spellServer:(id)a3 candidatesForSelectedRange:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 types:(unint64_t)a7 options:(id)a8 orthography:(id)a9
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  NSArray *userPreferredLanguages;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __CFString *v22;
  const __CFString *v23;
  id v24;
  CFStringEncoding v25;
  id v26;
  char *v27;
  char v28;
  char v29;
  void *v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CFIndex v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  unsigned int v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  int v75;
  void *v76;
  int v77;
  id v78;
  NSArray *userTransliterationLocalizations;
  id v80;
  uint64_t *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  const __CFString *v101;
  uint64_t v102;
  uint64_t v103;
  NSUInteger v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t n;
  uint64_t v108;
  id v109;
  void *v110;
  uint64_t v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  uint64_t v117;
  uint64_t m;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  id v124;
  unint64_t jj;
  unint64_t v126;
  uint64_t v127;
  const __CFString *v128;
  id v129;
  void *v130;
  uint64_t v132;
  NSUInteger v133;
  uint64_t v134;
  uint64_t ii;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  id v141;
  uint64_t v142;
  uint64_t k;
  void *v144;
  int v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  unsigned int v149;
  void *v150;
  AppleSpell *v151;
  id v152;
  int v154;
  int v155;
  id v156;
  int v158;
  unint64_t v159;
  void *v160;
  NSUInteger length;
  void *v162;
  __CFString *theString;
  NSUInteger location;
  void *v165;
  id v166;
  id obj;
  void *v168;
  const __CFString *v169;
  void *v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _QWORD v179[23];
  uint64_t v180;
  uint64_t *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t (*v186)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v187;
  __CFString *v188;
  id v189;
  void *v190;
  uint64_t *v191;
  uint64_t *v192;
  uint64_t *v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  _QWORD v198[18];
  _QWORD v199[7];
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  _QWORD block[5];
  CFIndex usedBufLen;
  _QWORD v206[4];
  uint64_t v207;
  uint64_t *v208;
  uint64_t v209;
  void *v210;
  NSUInteger v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t *v214;
  uint64_t v215;
  void *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t *v220;
  uint64_t v221;
  void *v222;
  NSUInteger v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t *v226;
  uint64_t v227;
  void *v228;
  NSUInteger v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t *v232;
  uint64_t v233;
  void *v234;
  NSUInteger v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t *v238;
  uint64_t v239;
  void *v240;
  NSUInteger v241;
  uint64_t v242;
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  UInt8 v246[135];
  UInt8 buffer[73];
  uint64_t v248;
  CFRange v249;

  v158 = a7;
  length = a4.length;
  location = a4.location;
  v248 = *MEMORY[0x1E0C80C00];
  v170 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v166 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v165 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v168 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a8);
  v11 = objc_msgSend(a9, "dominantScript");
  v12 = (void *)_appIdentifierFromOptions(a8);
  theString = (__CFString *)a5;
  v159 = objc_msgSend(a5, "length");
  v160 = v12;
  v154 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.DiskUtility"));
  objc_msgSend(a8, "objectForKey:", CFSTR("AppIdentifier"));
  v13 = (void *)objc_msgSend(a8, "objectForKey:", CFSTR("KeyEventArray"));
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = (void *)objc_msgSend(v13, "lastObject");
    else
      v13 = 0;
  }
  if (PRUseSingleCompletions_onceToken == -1)
  {
    if (!v13)
      goto LABEL_10;
  }
  else
  {
    dispatch_once(&PRUseSingleCompletions_onceToken, &__block_literal_global_307);
    if (!v13)
      goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)objc_msgSend(v13, "keyboardLayoutIdentifier");
    if (v14)
      objc_msgSend(v14, "rangeOfString:", CFSTR("inputmethod"));
  }
LABEL_10:
  v15 = objc_msgSend(a8, "objectForKey:", CFSTR("InlinePredictionsOnly"));
  if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v155 = objc_msgSend(v16, "BOOLValue");
  else
    v155 = 0;
  v237 = 0;
  v238 = &v237;
  v239 = 0x3010000000;
  v240 = &unk_1DE2FED5E;
  v241 = location;
  v242 = 0;
  v231 = 0;
  v232 = &v231;
  v233 = 0x3010000000;
  v234 = &unk_1DE2FED5E;
  v235 = location;
  v236 = 0;
  v225 = 0;
  v226 = &v225;
  v227 = 0x3010000000;
  v228 = &unk_1DE2FED5E;
  v229 = location;
  v230 = 0;
  v219 = 0;
  v220 = &v219;
  v221 = 0x3010000000;
  v222 = &unk_1DE2FED5E;
  v223 = location;
  v224 = 0;
  v213 = 0;
  v214 = &v213;
  v215 = 0x3010000000;
  v218 = 0;
  v216 = &unk_1DE2FED5E;
  v217 = 0;
  v207 = 0;
  v208 = &v207;
  v209 = 0x3010000000;
  v210 = &unk_1DE2FED5E;
  v211 = location;
  v212 = 0;
  v206[0] = 0;
  v206[1] = v206;
  v206[2] = 0x2020000000;
  v206[3] = 0;
  usedBufLen = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke;
  block[3] = &unk_1EA8CCB00;
  block[4] = self;
  if (spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__onceToken != -1)
    dispatch_once(&spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__onceToken, block);
  objc_msgSend(v168, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length), CFSTR("SelectedRange"));
  objc_msgSend(v168, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("SuppressAdaptation"));
  objc_msgSend(v168, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("OnlyAtInsertionPoint"));
  if (((objc_msgSend(CFSTR("Latn"), "isEqualToString:", v11) & 1) != 0
     || (objc_msgSend(CFSTR("Cyrl"), "isEqualToString:", v11) & 1) != 0
     || (objc_msgSend(CFSTR("Kore"), "isEqualToString:", v11) & 1) != 0
     || (v17 = (__CFString *)objc_msgSend(a9, "dominantLanguageForScript:", CFSTR("Latn"))) == 0)
    && (v17 = (__CFString *)objc_msgSend(a9, "dominantLanguage")) == 0
    || (-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("und")) & 1) != 0
    || -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("Multilingual")))
  {
    if ((objc_msgSend(CFSTR("Cyrl"), "isEqualToString:", v11) & 1) != 0)
    {
      v17 = CFSTR("ru");
    }
    else if ((objc_msgSend(CFSTR("Kore"), "isEqualToString:", v11) & 1) != 0)
    {
      v17 = CFSTR("ko");
    }
    else if ((objc_msgSend(CFSTR("Thai"), "isEqualToString:", v11) & 1) != 0)
    {
      v17 = CFSTR("th");
    }
    else
    {
      v17 = -[NSArray firstObject](self->_userPreferredLanguages, "firstObject");
    }
  }
  else if ((-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("en")) & 1) != 0
         || -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("pt")))
  {
    v202 = 0u;
    v203 = 0u;
    v200 = 0u;
    v201 = 0u;
    userPreferredLanguages = self->_userPreferredLanguages;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](userPreferredLanguages, "countByEnumeratingWithState:objects:count:", &v200, v246, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v201;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v201 != v20)
            objc_enumerationMutation(userPreferredLanguages);
          v22 = *(__CFString **)(*((_QWORD *)&v200 + 1) + 8 * i);
          if ((-[__CFString hasPrefix:](v22, "hasPrefix:", v17) & 1) != 0)
          {
            v17 = v22;
            goto LABEL_42;
          }
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](userPreferredLanguages, "countByEnumeratingWithState:objects:count:", &v200, v246, 16);
        if (v19)
          continue;
        break;
      }
    }
  }
LABEL_42:
  if (v17)
    v23 = v17;
  else
    v23 = CFSTR("en_US");
  v24 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", v23);
  v156 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", objc_msgSend(v24, "identifier"));
  v25 = objc_msgSend(v24, "encoding");
  v26 = -[AppleSpell autocorrectionDictionaryForLanguageObject:](self, "autocorrectionDictionaryForLanguageObject:", v24);
  v27 = (char *)objc_msgSend(v24, "oneLetterWords");
  v28 = objc_msgSend(v24, "isThai");
  if (v26)
    v29 = v28;
  else
    v29 = 1;
  if ((v29 & 1) != 0 || !objc_msgSend(v24, "isSupportedCompletionLanguage"))
    goto LABEL_244;
  v152 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", v24, theString, 0, -[__CFString length](theString, "length"));
  v151 = self;
  if (!-[AppleSpell useWordLanguageModelForLanguageObject:tagger:appIdentifier:](self, "useWordLanguageModelForLanguageObject:tagger:appIdentifier:", v24, v152, v160))goto LABEL_243;

  v149 = 0;
  self->_lastCandidateLanguage = (NSString *)objc_msgSend((id)objc_msgSend(v24, "identifier"), "copy");
  v147 = 0;
  if (!theString)
  {
    v146 = location;
    v150 = 0;
    v30 = 0;
    goto LABEL_192;
  }
  v146 = location;
  v150 = 0;
  v30 = 0;
  if (v159 < location)
    goto LABEL_192;
  v148 = -[__CFString paragraphRangeForRange:](theString, "paragraphRangeForRange:", location, 0);
  if (location > v148)
  {
    v199[0] = MEMORY[0x1E0C809B0];
    v199[1] = 3221225472;
    v199[2] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_2;
    v199[3] = &unk_1EA8CD008;
    v199[6] = location;
    v199[4] = theString;
    v199[5] = &v237;
    -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:", v148, location - v148, 771, v199);
    *((_OWORD *)v232 + 2) = *((_OWORD *)v238 + 2);
  }
  if (v159 > v232[5] + v232[4])
  {
    v198[10] = MEMORY[0x1E0C809B0];
    v198[11] = 3221225472;
    v198[12] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_3;
    v198[13] = &unk_1EA8CD030;
    v198[14] = theString;
    v198[15] = &v231;
    v198[16] = location;
    v198[17] = length;
    -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:");
  }
  v31 = v238;
  *((_OWORD *)v226 + 2) = *((_OWORD *)v238 + 2);
  v32 = v31[4] - v148;
  v33 = v214;
  v214[4] = v148;
  v33[5] = v32;
  v198[0] = MEMORY[0x1E0C809B0];
  v198[1] = 3221225472;
  v198[2] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_4;
  v198[3] = &unk_1EA8CD058;
  v198[4] = theString;
  v198[5] = &v225;
  v198[6] = &v219;
  v198[7] = &v213;
  v198[8] = &v237;
  v198[9] = v206;
  -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:", v33[4], v33[5], 771, v198);
  v36 = v226;
  v37 = v226[4];
  v38 = v37 - v148;
  if (v37 > v148)
  {
    v39 = v238;
    if (v37 == v238[4])
    {
      v40 = v226[5];
      if (v40 == v238[5])
      {
        v226[4] = v148;
        v36[5] = v38 + v40;
        v41 = v39[5];
        if (v38 + v40 > (unint64_t)(v41 + 256))
        {
          v36[4] = v37 + v40 - v41 - 256;
          v36[5] = v41 + 256;
        }
      }
    }
  }
  if ((v158 & 0x40000000) != 0)
  {
    v42 = v220[5];
    if (!v42
      || v220[4] + v42 >= v159
      || -[__CFString characterAtIndex:](theString, "characterAtIndex:") != 46
      || (v249.location = v220[4],
          v43 = v220[5] + 1,
          v249.length = v43,
          v43 != CFStringGetBytes(theString, v249, v25, 0x5Fu, 0, buffer, 72, &usedBufLen))
      || !-[AppleSpell checkNoCapAbbreviationWordBuffer:length:languageObject:](self, "checkNoCapAbbreviationWordBuffer:length:languageObject:", buffer, usedBufLen, v24))
    {
      v44 = v214[4];
      if (v44 == v148)
      {
        v149 = treatWordAsSentenceInitial(theString, v148, v238[4], v238[5], v24);
        goto LABEL_79;
      }
      v45 = -[__CFString rangeOfCharacterFromSet:options:range:](theString, "rangeOfCharacterFromSet:options:range:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__terminatorCharacterSet, 0, v44, v214[5]);
      v47 = v45;
      v149 = 0;
      if (v45 == 0x7FFFFFFFFFFFFFFFLL || !v46)
        goto LABEL_79;
      v48 = v45 + v46;
      v49 = v214;
      if (v45 + v46 < (unint64_t)(v214[5] + v214[4]))
      {
        v50 = v238[4] - v48;
        v214[4] = v48;
        v49[5] = v50;
        v34 = -[__CFString rangeOfCharacterFromSet:options:range:](theString, "rangeOfCharacterFromSet:options:range:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__nonPunctuationCharacterSet, 0);
        v149 = 0;
        if (v34 == 0x7FFFFFFFFFFFFFFFLL || !v51)
          goto LABEL_79;
        if (objc_msgSend((id)spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__whitespaceCharacterSet, "characterIsMember:", -[__CFString characterAtIndex:](theString, "characterAtIndex:", v34)))
        {
          v149 = treatWordAsSentenceInitial(theString, v47, v238[4], v238[5], v24);
          goto LABEL_79;
        }
      }
    }
  }
  v149 = 0;
LABEL_79:
  if ((v155 & 1) != 0)
  {
    v145 = 0;
  }
  else
  {
    v52 = -[AppleSpell spellServer:suggestCompletionsForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestCompletionsForPartialWordRange:inString:inLanguage:options:", a3, v232[4], v232[5], theString, objc_msgSend(v24, "identifier", v34), v168);
    v53 = objc_msgSend(v52, "count");
    if (v232[5]
      && (v54 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](theString, "rangeOfComposedCharacterSequenceAtIndex:", v232[4]), v55))
    {
      v56 = (void *)-[__CFString substringWithRange:](theString, "substringWithRange:", v54, v55);
      v145 = objc_msgSend(v56, "isEqualToString:", objc_msgSend(v56, "capitalizedString"));
    }
    else
    {
      v145 = 0;
    }
    if (v53)
    {
      v57 = 0;
      do
      {
        if ((unint64_t)objc_msgSend(v166, "count") > 0x63)
          break;
        v58 = (void *)objc_msgSend(v52, "objectAtIndex:", v57);
        if (objc_msgSend(v58, "length") == 1)
        {
          if (v27)
          {
            v59 = objc_msgSend(v58, "characterAtIndex:", 0);
            if (v59 > 0xFF || !strchr(v27, (char)v59))
              continue;
          }
        }
        if (!-[AppleSpell noSuggestForCompletion:languageObject:appIdentifier:alreadyCapitalized:](self, "noSuggestForCompletion:languageObject:appIdentifier:alreadyCapitalized:", v58, v24, v160, v145 | v149))
        {
          if (v149)
            v58 = (void *)initialCapitalizedString(v58, (uint64_t)v156);
          if ((objc_msgSend(v166, "containsObject:", v58) & 1) == 0)
            objc_msgSend(v166, "addObject:", v58);
        }
        ++v57;
      }
      while (v53 != v57);
    }
  }
  v150 = 0;
  if ((v158 & 0x100) != 0)
  {
    v35 = v232[5];
    if (v35)
    {
      v60 = (void *)-[__CFString substringWithRange:](theString, "substringWithRange:", v232[4]);
      v150 = (void *)-[NSMutableDictionary objectForKey:](self->_foundShortcutsDictionary, "objectForKey:", objc_msgSend(v60, "lowercaseStringWithLocale:", v156));
      if (v150)
      {
        if (!spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__lowercaseLetterCharacterSet)
          spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__lowercaseLetterCharacterSet = objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
        if (!spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__uppercaseLetterCharacterSet)
          spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__uppercaseLetterCharacterSet = objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
        objc_msgSend(v150, "rangeOfCharacterFromSet:");
        if (v61)
        {
          objc_msgSend(v150, "rangeOfCharacterFromSet:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__uppercaseLetterCharacterSet);
          if (!v62)
          {
            objc_msgSend(v60, "rangeOfCharacterFromSet:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__lowercaseLetterCharacterSet);
            if (v63)
            {
              if ((v149 & 1) != 0
                || objc_msgSend(v60, "isEqualToString:", initialCapitalizedString(v60, (uint64_t)v156)))
              {
                v150 = (void *)initialCapitalizedString(v150, (uint64_t)v156);
              }
            }
            else
            {
              v150 = (void *)uppercasedString(v150, (uint64_t)v156);
            }
          }
        }
      }
      else
      {
        v150 = 0;
      }
    }
  }
  if ((v158 & 2) == 0)
    goto LABEL_123;
  v64 = v232[5] + v232[4];
  v65 = v226[4];
  v35 = v64 - v65;
  if (v64 <= v65)
    goto LABEL_123;
  v66 = -[__CFString substringWithRange:](theString, "substringWithRange:", v226[4], v35);
  objc_msgSend(v168, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location - v65, length), CFSTR("SelectedRange"));
  v67 = -[AppleSpell spellServer:checkString:offset:types:options:orthography:wordCount:](self, "spellServer:checkString:offset:types:options:orthography:wordCount:", a3, v66, v65, v158 & 0xC0000000 | 0x202, v168, a9, 0);
  v196 = 0u;
  v197 = 0u;
  v194 = 0u;
  v195 = 0u;
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v194, v245, 16);
  if (!v68)
    goto LABEL_123;
  v69 = *(_QWORD *)v195;
  while (2)
  {
    for (j = 0; j != v68; ++j)
    {
      if (*(_QWORD *)v195 != v69)
        objc_enumerationMutation(v67);
      v71 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * j);
      if (objc_msgSend(v71, "resultType") == 512)
      {
        v72 = objc_msgSend(v71, "range");
        if (v72 + v73 == v232[5] + v232[4])
        {
          v74 = (void *)objc_msgSend(v71, "replacementString");
          v146 = objc_msgSend(v71, "range");
          v147 = v89;
          if (v149)
          {
            v90 = objc_msgSend(v71, "range");
            if (v90 == v232[4]
              && v91 == v232[5]
              && (objc_msgSend(v74, "isEqualToString:", initialCapitalizedString((void *)-[__CFString substringWithRange:](theString, "substringWithRange:"), (uint64_t)v156)) & 1) != 0)
            {
              goto LABEL_171;
            }
            v74 = (void *)initialCapitalizedString(v74, (uint64_t)v156);
          }
          if (v74)
            v92 = v155;
          else
            v92 = 1;
          if ((v92 & 1) != 0)
            goto LABEL_124;
          if (!objc_msgSend(v166, "count") && v146 == v232[4] && v147 == v232[5])
          {
            v140 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", theString);
            objc_msgSend(v140, "replaceCharactersInRange:withString:", v232[4], v232[5], v74);
            v141 = -[AppleSpell spellServer:suggestCompletionsForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestCompletionsForPartialWordRange:inString:inLanguage:options:", a3, v232[4], objc_msgSend(v74, "length"), v140, objc_msgSend(v24, "identifier"), v168);
            v142 = objc_msgSend(v141, "count");
            if (v142)
            {
              for (k = 0; k != v142; ++k)
              {
                if ((unint64_t)objc_msgSend(v166, "count") > 0x63)
                  break;
                v144 = (void *)objc_msgSend(v141, "objectAtIndex:", k);
                if (!-[AppleSpell noSuggestForCompletion:languageObject:appIdentifier:alreadyCapitalized:](self, "noSuggestForCompletion:languageObject:appIdentifier:alreadyCapitalized:", v144, v24, v160, v145 | v149))
                {
                  if (v149)
                    v144 = (void *)initialCapitalizedString(v144, (uint64_t)v156);
                  if ((objc_msgSend(v166, "containsObject:", v144) & 1) == 0)
                    objc_msgSend(v166, "addObject:", v144);
                }
              }
            }
          }
          if ((v158 & 0x200) != 0 && !v150)
            goto LABEL_124;
          if ((objc_msgSend(v166, "containsObject:", v74) & 1) == 0 && v146 == v232[4] && v147 == v232[5])
          {
            objc_msgSend(v166, "insertObject:atIndex:", v74, 0);
            v74 = 0;
            goto LABEL_124;
          }
LABEL_171:
          v74 = 0;
          goto LABEL_124;
        }
      }
    }
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v194, v245, 16);
    if (v68)
      continue;
    break;
  }
LABEL_123:
  v74 = 0;
  v146 = location;
  v147 = 0;
LABEL_124:
  v75 = v155;
  if (v150)
    v75 = 1;
  v76 = v74;
  if (v74)
    v77 = 1;
  else
    v77 = v75;
  if (((v77 | v154) & 1) == 0)
  {
    *((_OWORD *)v208 + 2) = *((_OWORD *)v232 + 2);
    v78 = v24;
    if (v226[5])
    {
      userTransliterationLocalizations = self->_userTransliterationLocalizations;
      v78 = v24;
      if (userTransliterationLocalizations)
      {
        v78 = v24;
        if (-[NSArray count](userTransliterationLocalizations, "count", v34, v35) == 1)
        {
          v80 = -[NSArray firstObject](self->_userTransliterationLocalizations, "firstObject");
          v78 = v24;
          if ((objc_msgSend((id)objc_msgSend(v24, "identifier"), "isEqualToString:", v80) & 1) == 0)
          {
            v81 = v232;
            if (v232[5] || (v81 = v220, v35 = v220[5], v78 = v24, v35))
            {
              v82 = (void *)-[__CFString substringWithRange:](theString, "substringWithRange:", v81[4]);
              v83 = v82;
              v78 = v24;
              if (v82)
              {
                v78 = v24;
                if ((unint64_t)objc_msgSend(v82, "length") >= 3)
                {
                  v78 = v24;
                  if (-[AppleSpell validateWord:inLexiconForLanguage:](self, "validateWord:inLexiconForLanguage:", v83, v80))
                  {
                    v78 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", v80);
                  }
                }
              }
            }
          }
        }
      }
    }
    if (v232[5] && v226[5])
    {
      v184 = MEMORY[0x1E0C809B0];
      v185 = 3221225472;
      v186 = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_5;
      v187 = &unk_1EA8CD080;
      v188 = theString;
      v189 = v78;
      v191 = &v231;
      v190 = v165;
      v192 = &v225;
      v193 = &v207;
      -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:");
    }
    if (!objc_msgSend(v165, "count", v34, v35) && !v232[5] && v220[5] && v226[5])
    {
      v180 = 0;
      v181 = &v180;
      v182 = 0x2020000000;
      v183 = 0;
      if (!objc_msgSend(v165, "count"))
      {
        v179[14] = MEMORY[0x1E0C809B0];
        v179[15] = 3221225472;
        v179[16] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_6;
        v179[17] = &unk_1EA8CD0A8;
        v179[22] = &v225;
        v179[18] = theString;
        v179[19] = v78;
        v179[21] = &v219;
        v179[20] = v165;
        -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:");
        if (v232[4] > (unint64_t)(v220[5] + v220[4]))
        {
          v179[7] = MEMORY[0x1E0C809B0];
          v179[8] = 3221225472;
          v179[9] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_7;
          v179[10] = &unk_1EA8CD0D0;
          v179[11] = v78;
          v179[12] = v165;
          v179[13] = &v180;
          -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:");
        }
      }
      v94 = objc_msgSend(v165, "count");
      if (v94)
      {
        v95 = v94 - 1;
        do
        {
          v96 = objc_msgSend(v165, "objectAtIndex:", v95);
          -[__CFString rangeOfString:options:range:](theString, "rangeOfString:options:range:", v96, 4, v220[4], location - v220[4]);
          if (v97)
            objc_msgSend(v165, "removeObjectAtIndex:", v95);
          --v95;
        }
        while (v95 != -1);
      }
      goto LABEL_182;
    }
    if (!objc_msgSend(v165, "count") && !v232[5])
    {
      v85 = v232[4];
      v84 = v85 - v148;
      if (v85 > v148)
      {
        v180 = 0;
        v181 = &v180;
        v182 = 0x2020000000;
        v183 = 0;
        v179[0] = MEMORY[0x1E0C809B0];
        v179[1] = 3221225472;
        v179[2] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_8;
        v179[3] = &unk_1EA8CD0D0;
        v179[4] = v78;
        v179[5] = v165;
        v179[6] = &v180;
        -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:", v148, v84, 258, v179);
        v86 = objc_msgSend(v165, "count");
        if (v86)
        {
          v87 = v86 - 1;
          do
          {
            -[__CFString rangeOfString:options:range:](theString, "rangeOfString:options:range:", objc_msgSend(v165, "objectAtIndex:", v87), 4, v148, location - v148);
            if (v88)
              objc_msgSend(v165, "removeObjectAtIndex:", v87);
            --v87;
          }
          while (v87 != -1);
        }
LABEL_182:
        _Block_object_dispose(&v180, 8);
      }
    }
    -[AppleSpell personalizeEmojiArray:](self, "personalizeEmojiArray:", v165, v84);
    v98 = objc_msgSend(v165, "count");
    if (v98)
    {
      v99 = v98 - 1;
      do
      {
        if (objc_msgSend(v165, "indexOfObject:", objc_msgSend(v165, "objectAtIndex:", v99)) < v99)
          objc_msgSend(v165, "removeObjectAtIndex:", v99);
        --v99;
      }
      while (v99 != -1);
    }
  }
  if ((v77 & 1) != 0)
  {
    v30 = v76;
  }
  else
  {
    if (!objc_msgSend(v166, "count", v34, v35))
    {
      v116 = -[AppleSpell _spellServer:suggestGuessesForWordRange:inString:languageObject:options:](self, "_spellServer:suggestGuessesForWordRange:inString:languageObject:options:", a3, v232[4] - v226[4], v232[5], -[__CFString substringWithRange:](theString, "substringWithRange:"), v24, v168);
      v117 = objc_msgSend(v116, "count");
      if (v117)
      {
        for (m = 0; m != v117; ++m)
        {
          if ((unint64_t)objc_msgSend(v166, "count") > 0x63)
            break;
          v119 = (void *)objc_msgSend(v116, "objectAtIndex:", m);
          if (!-[AppleSpell noSuggestForCompletion:languageObject:appIdentifier:alreadyCapitalized:](self, "noSuggestForCompletion:languageObject:appIdentifier:alreadyCapitalized:", v119, v24, v160, v145 | v149))
          {
            if (v149)
              v119 = (void *)initialCapitalizedString(v119, (uint64_t)v156);
            if ((objc_msgSend(v166, "containsObject:", v119) & 1) == 0)
              objc_msgSend(v166, "addObject:", v119);
          }
        }
      }
    }
    v150 = 0;
    v30 = 0;
  }
LABEL_192:
  v162 = v30;
  if (v238[4] - 1 >= v159)
  {
    v169 = &stru_1EA8D8440;
    v100 = v147;
  }
  else
  {
    v169 = &stru_1EA8D8440;
    v100 = v147;
    if (!v238[5])
    {
      -[__CFString rangeOfCharacterFromSet:options:range:](theString, "rangeOfCharacterFromSet:options:range:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__followingSpaceCharacterSet, 12, 0);
      v101 = CFSTR(" ");
      if (!v102)
        v101 = &stru_1EA8D8440;
      v169 = v101;
    }
  }
  v104 = v232[4];
  v103 = v232[5];
  if (objc_msgSend(obj, "count"))
  {
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v244, 16);
    v104 = location;
    if (v105)
    {
      v106 = *(_QWORD *)v176;
      do
      {
        for (n = 0; n != v105; ++n)
        {
          if (*(_QWORD *)v176 != v106)
            objc_enumerationMutation(obj);
          v108 = *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * n);
          v109 = objc_alloc(MEMORY[0x1E0CB3520]);
          v110 = (void *)objc_msgSend(v109, "initWithRange:replacementString:", location + a6, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v169, v108, CFSTR(" ")));
          objc_msgSend(v170, "addObject:", v110);

        }
        v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v244, 16);
      }
      while (v105);
      v103 = 0;
      v111 = 0;
      v104 = location;
      goto LABEL_229;
    }
    v103 = 0;
LABEL_228:
    v111 = 0;
    goto LABEL_229;
  }
  if (v150)
  {
    v112 = objc_alloc(MEMORY[0x1E0CB38F8]);
    v113 = (void *)objc_msgSend(v112, "initWithRange:replacementString:", v232[4] + a6, v232[5], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v169, v150, CFSTR(" ")));
    objc_msgSend(v170, "addObject:", v113);

  }
  else if (v162)
  {
    v114 = objc_alloc(MEMORY[0x1E0CB3548]);
    v115 = (void *)objc_msgSend(v114, "initWithRange:replacementString:", v146 + a6, v100, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v169, v162, CFSTR(" ")));
    objc_msgSend(v170, "addObject:", v115);

    v103 = v100;
    v104 = v146;
  }
  else if (objc_msgSend(v165, "count"))
  {
    v104 = v208[4];
    v103 = v208[5];
  }
  if (!v103)
    goto LABEL_228;
  v120 = (void *)-[__CFString substringWithRange:](theString, "substringWithRange:", v104, v103);
  v111 = (uint64_t)v120;
  if (v149)
    v111 = initialCapitalizedString(v120, (uint64_t)v156);
  v121 = objc_alloc(MEMORY[0x1E0CB3520]);
  v122 = (void *)objc_msgSend(v121, "initWithRange:replacementString:", v104 + a6, v103, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v169, v111, CFSTR(" ")));
  objc_msgSend(v170, "insertObject:atIndex:", v122, 0);

LABEL_229:
  if (!objc_msgSend(obj, "count") && objc_msgSend(v166, "count"))
  {
    v126 = v238[4];
    if (v126 <= v104)
    {
      v128 = &stru_1EA8D8440;
LABEL_246:
      v173 = 0u;
      v174 = 0u;
      v171 = 0u;
      v172 = 0u;
      v132 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v171, v243, 16);
      if (v132)
      {
        v133 = v104 + a6;
        v134 = *(_QWORD *)v172;
        do
        {
          for (ii = 0; ii != v132; ++ii)
          {
            if (*(_QWORD *)v172 != v134)
              objc_enumerationMutation(v166);
            v136 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v128, *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * ii));
            v137 = v136;
            if (!v111 || (objc_msgSend(v136, "isEqualToString:", v111) & 1) == 0)
            {
              v138 = objc_alloc(MEMORY[0x1E0CB3520]);
              v139 = (void *)objc_msgSend(v138, "initWithRange:replacementString:", v133, v103, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v169, v137, CFSTR(" ")));
              objc_msgSend(v170, "addObject:", v139);

            }
          }
          v132 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v171, v243, 16);
        }
        while (v132);
      }
    }
    else
    {
      v127 = -[__CFString substringWithRange:](theString, "substringWithRange:", v104, v126 - v104);
      if (!v162)
      {
        v128 = (const __CFString *)v127;
        if (!objc_msgSend(v165, "count"))
          goto LABEL_246;
      }
    }
  }
  if (!objc_msgSend(obj, "count") && !v150 && !v162 && objc_msgSend(v165, "count"))
  {
    v123 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v124 = (id)objc_msgSend(v165, "firstObject");
    for (jj = 1; jj < objc_msgSend(v165, "count"); ++jj)
      objc_msgSend(v123, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v169, objc_msgSend(v165, "objectAtIndex:", jj), CFSTR(" ")));
    v129 = objc_alloc(MEMORY[0x1E0CB35B8]);
    v130 = (void *)objc_msgSend(v129, "initWithRange:replacementString:alternativeStrings:", v208[4] + a6, v208[5], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v169, v124, CFSTR(" ")), v123);
    objc_msgSend(v170, "addObject:", v130);

  }
LABEL_243:
  -[AppleSpell invalidateTagger:](v151, "invalidateTagger:", v152);
LABEL_244:
  _Block_object_dispose(v206, 8);
  _Block_object_dispose(&v207, 8);
  _Block_object_dispose(&v213, 8);
  _Block_object_dispose(&v219, 8);
  _Block_object_dispose(&v225, 8);
  _Block_object_dispose(&v231, 8);
  _Block_object_dispose(&v237, 8);
  return v170;
}

id __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke(uint64_t a1)
{
  void *v2;
  id result;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet"));
  objc_msgSend(v2, "invert");
  spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__nonPunctuationWhitespaceAndNewlineCharacterSet = objc_msgSend(v2, "copy");
  spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__terminatorCharacterSet = (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "sentenceTerminatorCharacterSet");
  spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__nonPunctuationCharacterSet = (uint64_t)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet"), "invertedSet");
  spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__whitespaceCharacterSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".!?։۔।።᙮‼‽⁈⁉。！．？｡,;:)]}”’"));
  spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__followingSpaceCharacterSet = (uint64_t)result;
  return result;
}

uint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v9 = objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequencesForRange:");
  v11 = v10;
  result = objc_msgSend(*(id *)(a1 + 32), "rangeOfCharacterFromSet:options:range:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__nonPunctuationWhitespaceAndNewlineCharacterSet, 0, v9, v10);
  if (v13)
  {
    v14 = *(_QWORD *)(a1 + 48);
    if (v9 + v11 < v14)
    {
      if (v9 + v11 + 1 != v14)
        goto LABEL_8;
      result = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", v14 - 1);
      if ((_DWORD)result != 8217 && (_DWORD)result != 39)
        goto LABEL_8;
      ++v11;
    }
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v15 + 32) = v9;
    *(_QWORD *)(v15 + 40) = v11;
LABEL_8:
    *a7 = 1;
  }
  return result;
}

uint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v18;

  v9 = objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequencesForRange:");
  v11 = v10;
  result = objc_msgSend(*(id *)(a1 + 32), "rangeOfCharacterFromSet:options:range:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__nonPunctuationWhitespaceAndNewlineCharacterSet, 0, v9, v10);
  if (v13)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(_QWORD *)(v14 + 32);
    v16 = v9 + v11;
    if (v9 <= *(_QWORD *)(v14 + 40) + v15 && v16 >= v15)
    {
      *(_QWORD *)(v14 + 40) = v16 - v15;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(_QWORD *)(v14 + 32);
    }
    v18 = *(_QWORD *)(a1 + 56) + *(_QWORD *)(a1 + 48);
    if (v18 >= v15 && v18 <= *(_QWORD *)(v14 + 40) + v15)
      *(_QWORD *)(v14 + 40) = v18 - v15;
    *a7 = 1;
  }
  return result;
}

uint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v9 = objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequencesForRange:");
  v11 = v10;
  result = objc_msgSend(*(id *)(a1 + 32), "rangeOfCharacterFromSet:options:range:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__nonPunctuationWhitespaceAndNewlineCharacterSet, 0, v9, v10);
  if (v13)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!*(_QWORD *)(v14 + 40))
      *(_QWORD *)(v14 + 32) = v9 + v11;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (!*(_QWORD *)(v15 + 40))
    {
      *(_QWORD *)(v15 + 32) = v9;
      *(_QWORD *)(v15 + 40) = v11;
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) - (v9 + v11);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      *(_QWORD *)(v17 + 32) = v9 + v11;
      *(_QWORD *)(v17 + 40) = v16;
    }
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(_QWORD *)(v18 + 32);
    v20 = v19 > v9;
    v21 = v19 - v9;
    if (v20)
    {
      v22 = v21 + *(_QWORD *)(v18 + 40);
      *(_QWORD *)(v18 + 32) = v9;
      *(_QWORD *)(v18 + 40) = v22;
    }
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v24 = *(_QWORD *)(v23 + 24);
    *(_QWORD *)(v23 + 24) = v24 + 1;
    if (v24 >= 6)
      *a7 = 1;
  }
  return result;
}

uint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_5(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v10;
  int v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v10 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  v11 = a3 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32)
     && objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", a3 - 1) == 45;
  _addEmojiForStringToArray(v10, *(void **)(a1 + 40), *(void **)(a1 + 48), 0, v11);
  result = objc_msgSend(*(id *)(a1 + 48), "count");
  if (result)
  {
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32)
        - a3
        + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    *(_QWORD *)(v14 + 32) = a3;
    *(_QWORD *)(v14 + 40) = v13;
    *a7 = 1;
  }
  return result;
}

unint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_6(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v10;
  int v11;
  unint64_t result;

  v10 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  v11 = a3 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32)
     && objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", a3 - 1) == 45;
  _addEmojiForStringToArray(v10, *(void **)(a1 + 40), *(void **)(a1 + 48), 0, v11);
  result = objc_msgSend(*(id *)(a1 + 48), "count");
  if (result >= 5)
    *a7 = 1;
  return result;
}

unint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;

  _addEmojiForStringToArray(a2, *(void **)(a1 + 32), *(void **)(a1 + 40), 1, 0);
  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (result > 4
    || (v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8),
        v11 = *(_QWORD *)(v10 + 24),
        *(_QWORD *)(v10 + 24) = v11 + 1,
        v11 >= 0x11))
  {
    *a7 = 1;
  }
  return result;
}

unint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;

  _addEmojiForStringToArray(a2, *(void **)(a1 + 32), *(void **)(a1 + 40), 1, 0);
  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (result > 4
    || (v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8),
        v11 = *(_QWORD *)(v10 + 24),
        *(_QWORD *)(v10 + 24) = v11 + 1,
        v11 >= 0x11))
  {
    *a7 = 1;
  }
  return result;
}

- (id)vietnameseModificationForWord:(id)a3
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", objc_msgSend(a3, "decomposedStringWithCanonicalMapping"));
  if (vietnameseModificationForWord__onceToken != -1)
    dispatch_once(&vietnameseModificationForWord__onceToken, &__block_literal_global_2);
  v4 = objc_msgSend(v3, "length");
  do
  {
    if (v4 >= 2)
    {
      v5 = objc_msgSend(v3, "characterAtIndex:", --v4);
      if ((objc_msgSend((id)vietnameseModificationForWord__vietnameseVowelCharacterSet, "characterIsMember:", v5) & 1) == 0)
        continue;
    }
    goto LABEL_17;
  }
  while (!objc_msgSend((id)vietnameseModificationForWord__vietnameseToneLetterCharacterSet, "characterIsMember:", v5));
  v6 = 1;
  objc_msgSend(v3, "replaceCharactersInRange:withString:", v4, 1, &stru_1EA8D8440);
  if ((_DWORD)v5 == objc_msgSend(v3, "characterAtIndex:", v4 - 1))
  {
    v7 = 0;
    goto LABEL_18;
  }
  if ((int)v5 <= 113)
  {
    if ((_DWORD)v5 != 102)
    {
      if ((_DWORD)v5 == 106)
      {
        v6 = 0;
        v7 = CFSTR("̣");
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    v6 = 0;
    v7 = CFSTR("̀");
  }
  else
  {
    switch((_DWORD)v5)
    {
      case 'r':
        v6 = 0;
        v7 = CFSTR("̉");
        break;
      case 's':
        v6 = 0;
        v7 = CFSTR("́");
        break;
      case 'x':
        v6 = 0;
        v7 = CFSTR("̃");
        break;
      default:
LABEL_17:
        v7 = 0;
        v6 = 1;
        break;
    }
  }
LABEL_18:
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("dd"), CFSTR("đ"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("aa"), CFSTR("â"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("ee"), CFSTR("ê"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("oo"), CFSTR("ô"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("aw"), CFSTR("ă"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("ow"), CFSTR("ơ"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("uw"), CFSTR("ư"), 0, 0, objc_msgSend(v3, "length"));
  if ((v6 & 1) == 0)
  {
    v8 = objc_msgSend(v3, "length");
    while (v8)
    {
      if (objc_msgSend((id)vietnameseModificationForWord__vietnameseToneVowelCharacterSet, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", --v8)))
      {
        if (v8
          && ((objc_msgSend((id)vietnameseModificationForWord__vietnameseToneVowelCharacterSet, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v8 - 1)) & 1) != 0|| objc_msgSend((id)vietnameseModificationForWord__vietnameseAccentCharacterSet, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v8 - 1))))
        {
          --v8;
        }
        v9 = v8 + 1;
        if (v8 + 1 < (unint64_t)objc_msgSend(v3, "length"))
        {
          if (objc_msgSend((id)vietnameseModificationForWord__vietnameseAccentCharacterSet, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v8 + 1)))v10 = v8 + 1;
          else
            v10 = v8;
          v9 = v10 + 1;
        }
        objc_msgSend(v3, "replaceCharactersInRange:withString:", v9, 0, v7);
        return (id)objc_msgSend(v3, "precomposedStringWithCanonicalMapping");
      }
    }
  }
  return (id)objc_msgSend(v3, "precomposedStringWithCanonicalMapping");
}

id __56__AppleSpell_Correction__vietnameseModificationForWord___block_invoke()
{
  id result;

  vietnameseModificationForWord__vietnameseVowelCharacterSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("aeiou"));
  vietnameseModificationForWord__vietnameseToneVowelCharacterSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("aeou"));
  vietnameseModificationForWord__vietnameseToneLetterCharacterSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("fjrsxz"));
  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("̛̂̆"));
  vietnameseModificationForWord__vietnameseAccentCharacterSet = (uint64_t)result;
  return result;
}

- (char)_validatedGuessWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkUser:(BOOL)a8 additionalBuffer:(char *)a9
{
  char *result;
  char *v13;
  CFIndex v14;
  CFIndex Bytes;
  CFIndex *usedBufLen;
  CFIndex *usedBufLena;
  CFIndex v18;
  CFRange v19;

  if (a9)
  {
    result = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, a4, 0x8000100u, 0);
    if (result)
    {
      result = -[AppleSpell vietnameseModificationForWord:](self, "vietnameseModificationForWord:", result);
      if (result)
      {
        v13 = result;
        v14 = objc_msgSend(result, "length");
        v18 = 0;
        v19.location = 0;
        v19.length = v14;
        Bytes = CFStringGetBytes((CFStringRef)v13, v19, 0x8000100u, 0x5Fu, 0, (UInt8 *)a9, 24, &v18);
        result = 0;
        if (v14 == Bytes)
        {
          a9[v18] = 0;
          HIBYTE(usedBufLen) = 1;
          *(_DWORD *)((char *)&usedBufLen + 3) = 257;
          BYTE2(usedBufLen) = a8;
          LOWORD(usedBufLen) = 1;
          if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a9, usedBufLen, 0))
          {
            return a9;
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  else
  {
    HIBYTE(usedBufLena) = 1;
    *(_DWORD *)((char *)&usedBufLena + 3) = 257;
    BYTE2(usedBufLena) = a8;
    LOWORD(usedBufLena) = 1;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, a4, a5, a6, a7, 1, usedBufLena, 0))
    {
      return a3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_addGuessesForWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 minAutocorrectionLength:(unint64_t)a8 previousLetter:(unsigned __int16)a9 nextLetter:(unsigned __int16)a10 basicOnly:(BOOL)a11 toGuesses:(id)a12
{
  uint64_t v15;
  char *v16;
  unsigned int v17;
  int v18;
  int v19;
  int v20;
  char *v21;
  int v22;
  int v23;
  unsigned int v24;
  char v25;
  char *v26;
  char *v27;
  int v28;
  uint64_t v29;
  int v30;
  _BYTE *v31;
  char *v32;
  int v33;
  _BYTE *v34;
  int v35;
  unsigned __int8 *v36;
  char *v37;
  int v38;
  int v39;
  int v40;
  int v41;
  char v42;
  char *v43;
  char *v44;
  int v45;
  unsigned __int8 v46;
  char *v47;
  char v49;
  int v50;
  char v51;
  char v52;
  char *v53;
  char *v54;
  int v55;
  char v57;
  char v58;
  char *v59;
  char *v60;
  int v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unsigned __int8 *v67;
  char v68;
  unsigned __int8 v69;
  uint64_t v70;
  unsigned __int8 v71;
  char *v72;
  int v73;
  uint64_t v74;
  char v75;
  char *v76;
  char *v77;
  int v78;
  unsigned int v79;
  uint64_t v80;
  uint64_t v81;
  unsigned __int8 *v82;
  unsigned int v83;
  char *v84;
  char v85;
  char *v86;
  char *v87;
  int v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unsigned __int8 *v94;
  char v95;
  unsigned __int8 v96;
  uint64_t v97;
  unsigned __int8 v98;
  char *v99;
  _BOOL4 v100;
  char v101;
  char *v102;
  char *v103;
  char v104;
  int v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unsigned __int8 *v109;
  int v110;
  unsigned __int8 *v111;
  char v112;
  char v113;
  uint64_t v114;
  char *v115;
  int v116;
  uint64_t v117;
  char *v118;
  char v119;
  char *v120;
  char *v121;
  uint64_t v122;
  int v123;
  char *v124;
  uint64_t v125;
  int v126;
  _BOOL4 v127;
  uint64_t v128;
  uint64_t v129;
  int v130;
  char v131;
  char *v132;
  char *v133;
  int v134;
  unsigned __int8 *v135;
  uint64_t v136;
  char v137;
  uint64_t v138;
  int64_t v139;
  unsigned __int8 *v140;
  int64_t v141;
  unsigned __int8 *v142;
  int v143;
  char v144;
  int v145;
  int v146;
  char v147;
  uint64_t v148;
  unsigned __int8 v149;
  unsigned __int8 v150;
  char *v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  int v155;
  int v156;
  char *v157;
  uint64_t v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  int v162;
  char v163;
  char *v164;
  char *v165;
  int v166;
  unsigned __int8 *v167;
  unsigned __int8 *v168;
  unsigned __int8 *v169;
  int64_t v170;
  uint64_t v171;
  unsigned __int8 *v172;
  char v173;
  unsigned __int8 *v174;
  uint64_t v175;
  char *v176;
  uint64_t v177;
  uint64_t v178;
  int v179;
  char v180;
  char v181;
  uint64_t v182;
  char v183;
  uint64_t v184;
  int v185;
  int v186;
  unsigned __int8 *v187;
  int v188;
  char v189;
  unint64_t v190;
  uint64_t v191;
  char v194;
  int v195;
  char v196;
  unsigned __int8 *v197;
  uint64_t v198;
  uint64_t v199;
  _BYTE *v200;
  unsigned int v201;
  unsigned int v202;
  uint64_t v203;
  uint64_t v204;
  int v205;
  char v206;
  char v207;
  uint64_t v208;
  char v209;
  int v210;
  int v211;
  unsigned int v212;
  char *v213;
  unint64_t v214;
  char v215;
  _BYTE *v216;
  char v219;
  unsigned __int8 v220;
  unsigned __int8 v221;
  uint64_t v222;

  v222 = *MEMORY[0x1E0C80C00];
  v15 = objc_msgSend(a5, "encoding");
  v216 = (_BYTE *)objc_msgSend(a5, "accents");
  v196 = objc_msgSend(a5, "isEnglish");
  if ((v196 & 1) != 0)
  {
    v16 = 0;
  }
  else if (objc_msgSend(a5, "isVietnamese"))
  {
    v16 = &v219;
  }
  else
  {
    v16 = 0;
  }
  v17 = *a3;
  v18 = isUpperCaseX(v17, v15);
  v19 = v18;
  v190 = a4 - 1;
  if (a4 > 1)
    v20 = v18;
  else
    v20 = 0;
  if (v17)
  {
    v21 = a3 + 1;
    v22 = 1;
    do
    {
      if (isAnyAlphaX(v17, v15))
      {
        v20 &= isUpperCaseX(v17, v15);
      }
      else
      {
        if (v17 == 45)
          v23 = v22;
        else
          v23 = 0;
        if (v17 != 39)
          v22 = v23;
      }
      v24 = *v21++;
      v17 = v24;
    }
    while (v24);
  }
  else
  {
    v22 = 1;
  }
  v194 = v20;
  v195 = v19 & ~v20;
  v188 = (v16 == 0) & (v22 ^ 1);
  if (a4 >= a8
    && v216
    && (v20 & 1) == 0
    && a4 <= 0x1B
    && ((v16 == 0) & (v22 ^ 1)) == 0
    && (objc_msgSend(a12, "isFull") & 1) == 0)
  {
    v25 = *a3;
    if (*a3)
    {
      v26 = a3 + 1;
      v27 = (char *)&v220;
      do
      {
        *v27++ = v25;
        v28 = *v26++;
        v25 = v28;
      }
      while (v28);
    }
    else
    {
      v27 = (char *)&v220;
    }
    *v27 = 0;
    v205 = v220;
    if (v220)
    {
      if (v195)
        v29 = 3;
      else
        v29 = 1;
      v197 = &v220;
      do
      {
        v30 = *v216;
        if (*v216)
        {
          v200 = v197 + 1;
          v31 = v216;
          do
          {
            if (v30 == v205)
            {
              *v197 = v31[1];
              v32 = -[AppleSpell _validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:](self, "_validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:", &v220, a4, a5, a6, a7, 0, v16);
              if (v32)
                objc_msgSend(a12, "addCandidateWithBuffer:encoding:transform:errorType:", v32, v15, v29, 1);
              v33 = *v200;
              if (*v200)
              {
                v34 = v197 + 1;
                do
                {
                  v35 = *v216;
                  if (*v216)
                  {
                    v36 = v216 + 2;
                    do
                    {
                      if (v35 == v33)
                      {
                        *v34 = *(v36 - 1);
                        v37 = -[AppleSpell _validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:](self, "_validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:", &v220, a4, a5, a6, a7, 0, v16);
                        if (v37)
                          objc_msgSend(a12, "addCandidateWithBuffer:encoding:transform:errorType:", v37, v15, v29, 1);
                      }
                      v38 = *v36;
                      v36 += 2;
                      v35 = v38;
                    }
                    while (v38);
                  }
                  *v34 = v33;
                  v39 = *++v34;
                  v33 = v39;
                }
                while (v39);
              }
            }
            v40 = v31[2];
            v31 += 2;
            v30 = v40;
          }
          while (v40);
        }
        *v197 = v205;
        v41 = *++v197;
        v205 = v41;
      }
      while (v41);
    }
  }
  if (a4 > a8 && (_DWORD)v15 == 1280 && (objc_msgSend(a12, "isFull") & 1) == 0)
  {
    v42 = *a3;
    if (*a3)
    {
      v43 = a3 + 1;
      v44 = (char *)&v220;
      do
      {
        *v44++ = v42;
        v45 = *v43++;
        v42 = v45;
      }
      while (v45);
    }
    else
    {
      v44 = (char *)&v220;
    }
    *v44 = 0;
    v46 = v220;
    if (v220)
    {
      v47 = (char *)&v220;
      while (v46 - 65 >= 0x1A && v46 - 192 >= 0x17)
      {
        if (v46 - 216 < 7 || v46 - 138 <= 0x15 && ((1 << (v46 + 118)) & 0x200015) != 0)
        {
          if (v46 - 216 >= 7)
          {
            v49 = v46;
            if (v46 - 138 > 0x15)
              goto LABEL_80;
            v49 = v46;
            if (((1 << (v46 + 118)) & 0x200015) == 0)
              goto LABEL_80;
LABEL_77:
            if (v46 == 159)
              v49 = -1;
            else
              v49 = v46 + 16;
            goto LABEL_80;
          }
          goto LABEL_74;
        }
        if (v46 > 0xF7u || v46 - 97 < 0x1A || v46 - 223 < 0x18)
        {
          if (v46 - 154 > 4 || ((1 << (v46 + 102)) & 0x15) == 0)
          {
            v49 = v46;
            if (v46 != 223)
            {
              if (v46 == 255)
                v49 = -97;
              else
                v49 = v46 - 32;
            }
            goto LABEL_80;
          }
        }
        else
        {
          v49 = v46;
          if (v46 - 154 > 4)
            goto LABEL_80;
          v49 = v46;
          if (((1 << (v46 + 102)) & 0x15) == 0)
            goto LABEL_80;
        }
        v49 = v46 - 16;
LABEL_80:
        *v47 = v49;
        if (-[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](self, "checkNameWordBuffer:length:languageObject:globalOnly:", &v220, a4, a5, 0))
        {
          objc_msgSend(a12, "addCandidateWithBuffer:encoding:errorType:", &v220, 1280, 2);
        }
        *v47 = v46;
        v50 = *++v47;
        v46 = v50;
        if (!v50)
          goto LABEL_97;
      }
      if (v46 - 138 <= 0x15 && ((1 << (v46 + 118)) & 0x200015) != 0)
        goto LABEL_77;
LABEL_74:
      v49 = v46 + 32;
      goto LABEL_80;
    }
  }
LABEL_97:
  v51 = v196 & v195 ^ 1;
  if (a4 <= a8)
    v51 = 1;
  if ((v51 & 1) == 0 && a3[v190] == 115 && a3[a4 - 2] != 39 && (objc_msgSend(a12, "isFull") & 1) == 0)
  {
    v52 = *a3;
    if (*a3)
    {
      v53 = a3 + 1;
      v54 = (char *)&v220;
      do
      {
        *v54++ = v52;
        v55 = *v53++;
        v52 = v55;
      }
      while (v55);
    }
    *(&v220 + v190) = 0;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", &v220, 0x100000101000001, 0))
    {
      *(&v220 + v190) = 39;
      *(_WORD *)(&v220 + a4) = 115;
      objc_msgSend(a12, "addCandidateWithBuffer:encoding:errorType:", &v220, v15, 3);
    }
  }
  if (a4 < a8 || a4 > 0x1B)
    v57 = 1;
  else
    v57 = v188;
  if ((v57 & 1) == 0 && (objc_msgSend(a12, "isFull") & 1) == 0)
  {
    v58 = *a3;
    if (*a3)
    {
      v59 = a3 + 1;
      v60 = (char *)&v220;
      do
      {
        *v60++ = v58;
        v61 = *v59++;
        v58 = v61;
      }
      while (v61);
    }
    else
    {
      v60 = (char *)&v220;
    }
    *v60 = 0;
    if (a4)
    {
      if ((_DWORD)v15 == 517)
        v62 = 32;
      else
        v62 = 26;
      v63 = 97;
      if ((_DWORD)v15 == 517)
        v63 = -48;
      v181 = v63;
      v184 = v62;
      v64 = 3;
      if (!v195)
        v64 = 1;
      if ((v194 & 1) != 0)
        v64 = 2;
      v198 = v64;
      v65 = a4;
      do
      {
        v66 = v65 - 1;
        if (v65 == 1 && !isAnyAlphaX(v221, v15))
          break;
        v67 = &v220 + v66;
        if (v65 != a4 || isAnyAlphaX(*(v67 - 1), v15))
        {
          v201 = *(&v220 + v66);
          v210 = toLowerX(*(&v220 + v66), v15);
          v68 = v195;
          if (v65 != 1)
            v68 = 0;
          v206 = v194 | v68;
          v69 = v181;
          v70 = v184;
          do
          {
            if (v210 != v69 && adjacentMatch(v210, v69, v15))
            {
              v71 = v69;
              if ((v206 & 1) != 0)
                v71 = toUpperX(v69, v15);
              *v67 = v71;
              v72 = -[AppleSpell _validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:](self, "_validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:", &v220, a4, a5, a6, a7, 0, v16);
              if (v72)
                objc_msgSend(a12, "addReplacementCandidateWithBuffer:encoding:transform:intendedCharacter:actualCharacter:", v72, v15, v198, *v67, v201);
            }
            ++v69;
            --v70;
          }
          while (v70);
          *v67 = v201;
          v66 = v65 - 1;
        }
        v65 = v66;
      }
      while (v66);
    }
  }
  v73 = a11 | v188;
  if (a4 < a8)
    v73 = 1;
  v185 = v73;
  if ((v73 & 1) == 0)
  {
    v74 = v15;
    if ((objc_msgSend(a12, "isFull") & 1) == 0)
    {
      v75 = *a3;
      if (*a3)
      {
        v76 = a3 + 1;
        v77 = (char *)&v220;
        do
        {
          *v77++ = v75;
          v78 = *v76++;
          v75 = v78;
        }
        while (v78);
      }
      else
      {
        v77 = (char *)&v220;
      }
      *v77 = 0;
      v79 = v220;
      if (v220)
      {
        v80 = 3;
        if (!v195)
          v80 = 1;
        if ((v194 & 1) != 0)
          v81 = 2;
        else
          v81 = v80;
        v82 = &v221;
        do
        {
          v83 = *v82;
          if (!*v82)
            break;
          if (isAnyAlphaX(v79, v15) && isAnyAlphaX(v83, v15))
          {
            *(v82 - 1) = v83;
            *v82 = v79;
            v84 = -[AppleSpell _validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:](self, "_validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:", &v220, a4, a5, a6, a7, 0, v16);
            if (v84)
              objc_msgSend(a12, "addTranspositionCandidateWithBuffer:encoding:transform:intendedFirstCharacter:intendedSecondCharacter:", v84, v15, v81, *(v82 - 1), *v82);
            v83 = *(v82 - 1);
            *(v82 - 1) = *v82;
            *v82 = v83;
          }
          ++v82;
          v79 = v83;
        }
        while (v83);
      }
    }
    if (a4 > 0x1B)
    {
      v186 = 0;
LABEL_213:
      v183 = 1;
      goto LABEL_245;
    }
    if ((objc_msgSend(a12, "isFull") & 1) == 0)
    {
      v85 = *a3;
      if (*a3)
      {
        v86 = a3 + 1;
        v87 = (char *)&v220;
        do
        {
          *v87++ = v85;
          v88 = *v86++;
          v85 = v88;
        }
        while (v88);
      }
      else
      {
        v87 = (char *)&v220;
      }
      *v87 = 0;
      if (a4)
      {
        if ((_DWORD)v15 == 517)
          v89 = 32;
        else
          v89 = 26;
        v90 = 97;
        if ((_DWORD)v15 == 517)
          v90 = -48;
        v180 = v90;
        v182 = v89;
        v91 = 3;
        if (!v195)
          v91 = 1;
        if ((v194 & 1) != 0)
          v91 = 2;
        v199 = v91;
        v92 = a4;
        do
        {
          v93 = v92 - 1;
          if (v92 == 1 && !isAnyAlphaX(v221, v15))
            break;
          v94 = &v220 + v93;
          if (v92 != a4 || isAnyAlphaX(*(v94 - 1), v15))
          {
            v202 = *(&v220 + v93);
            v211 = toLowerX(*(&v220 + v93), v15);
            v95 = v195;
            if (v92 != 1)
              v95 = 0;
            v207 = v194 | v95;
            v96 = v180;
            v97 = v182;
            do
            {
              if (v211 != v96 && !adjacentMatch(v211, v96, v15))
              {
                v98 = v96;
                if ((v207 & 1) != 0)
                  v98 = toUpperX(v96, v15);
                *v94 = v98;
                v99 = -[AppleSpell _validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:](self, "_validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:", &v220, a4, a5, a6, a7, 0, v16);
                if (v99)
                  objc_msgSend(a12, "addReplacementCandidateWithBuffer:encoding:transform:intendedCharacter:actualCharacter:", v99, v15, v199, *v94, v202);
              }
              ++v96;
              --v97;
            }
            while (v97);
            *v94 = v202;
            v93 = v92 - 1;
          }
          v92 = v93;
        }
        while (v93);
      }
    }
  }
  v100 = a11;
  if (!v216)
    v100 = 1;
  v186 = v185 ^ 1;
  if (a4 > 0x1B)
  {
    v183 = 1;
LABEL_244:
    v74 = v15;
    goto LABEL_245;
  }
  v74 = v15;
  if (a4 < a8 || ((v100 | v188) & 1) != 0)
    goto LABEL_213;
  if ((objc_msgSend(a12, "isFull") & 1) == 0)
  {
    v101 = *a3;
    if (*a3)
    {
      v102 = a3 + 1;
      v103 = (char *)&v220;
      v104 = v194;
      do
      {
        *v103++ = v101;
        v105 = *v102++;
        v101 = v105;
      }
      while (v105);
    }
    else
    {
      v103 = (char *)&v220;
      v104 = v194;
    }
    *v103 = 0;
    if (a4)
    {
      v106 = 3;
      if (!v195)
        v106 = 1;
      if ((v104 & 1) != 0)
        v106 = 2;
      v208 = v106;
      v107 = a4;
      do
      {
        v108 = v107 - 1;
        if (v107 == 1 && !isAnyAlphaX(v221, v15))
          break;
        v109 = &v220 + v108;
        if (v107 != a4 || isAnyAlphaX(*(v109 - 1), v15))
        {
          v212 = *v109;
          if (*v216)
          {
            v110 = toLowerX(*v109, v15);
            v111 = v216 + 2;
            if (v107 == 1)
              v112 = v195;
            else
              v112 = 0;
            v113 = v194 | v112;
            do
            {
              v114 = *(v111 - 1);
              if (v110 != (_DWORD)v114)
              {
                if ((v113 & 1) != 0)
                  LOBYTE(v114) = toUpperX(v114, v15);
                *v109 = v114;
                v115 = -[AppleSpell _validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:](self, "_validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:", &v220, a4, a5, a6, a7, 0, v16);
                if (v115)
                  objc_msgSend(a12, "addReplacementCandidateWithBuffer:encoding:transform:intendedCharacter:actualCharacter:", v115, v15, v208, *v109, v212);
              }
              v116 = *v111;
              v111 += 2;
            }
            while (v116);
          }
          *v109 = v212;
          v108 = v107 - 1;
        }
        v107 = v108;
      }
      while (v108);
    }
    v183 = 0;
    goto LABEL_244;
  }
  v183 = 0;
LABEL_245:
  if (a4 >= a8 && !a11 && (objc_msgSend(a12, "isFull") & 1) == 0 && *a3)
  {
    v117 = 0;
    v213 = &a3[a4 - 1];
    v118 = a3;
    while (1)
    {
      if (v118 == a3 && !isAnyAlphaX(a3[1], v74)
        || v118 == v213 && !isAnyAlphaX(a3[a4 - 2], v74))
      {
        goto LABEL_283;
      }
      v119 = *a3;
      if (*a3)
      {
        v120 = (char *)&v220;
        v121 = a3 + 1;
        v122 = v117;
        do
        {
          if (v122)
            *v120++ = v119;
          v123 = *v121++;
          v119 = v123;
          --v122;
        }
        while (v123);
      }
      else
      {
        v120 = (char *)&v220;
      }
      *v120 = 0;
      v124 = -[AppleSpell _validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:](self, "_validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:", &v220, v190, a5, a6, a7, 0, v16);
      if (!v124)
        goto LABEL_283;
      if (v118 != a3)
        break;
      v126 = *a3;
      v127 = v126 == a9;
      if (v118 == v213 && v126 != a9)
        goto LABEL_268;
LABEL_269:
      if (a4 != a8 || v127)
      {
        if ((v195 & (v118 == a3)) != 0)
          v125 = 3;
        else
          v125 = 0;
        if (!v127)
          goto LABEL_276;
        objc_msgSend(a12, "addCandidateWithBuffer:encoding:transform:errorType:", v124, v74, v125, 5);
      }
LABEL_283:
      v130 = *++v118;
      ++v117;
      if (!v130)
        goto LABEL_284;
    }
    if (v118 != v213)
    {
      if (a4 != a8)
      {
        v125 = 0;
LABEL_276:
        if (v118 <= a3)
          v128 = 0;
        else
          v128 = *(v118 - 1);
        if (v118 >= v213)
          v129 = 0;
        else
          v129 = v118[1];
        objc_msgSend(a12, "addInsertionCandidateWithBuffer:encoding:transform:intendedPrecedingCharacter:insertedCharacter:intendedFollowingCharacter:", v124, v74, v125, v128, *v118, v129);
        goto LABEL_283;
      }
      goto LABEL_283;
    }
LABEL_268:
    v127 = *v118 == a10;
    goto LABEL_269;
  }
LABEL_284:
  if (v186 && (objc_msgSend(a12, "isFull") & 1) == 0)
  {
    v131 = *a3;
    if (*a3)
    {
      v132 = a3 + 1;
      v133 = (char *)&v220;
      do
      {
        *v133++ = v131;
        v134 = *v132++;
        v131 = v134;
      }
      while (v134);
    }
    else
    {
      v133 = (char *)&v220;
    }
    *v133 = 0;
    v187 = &v220 + a4;
    if ((a4 & 0x8000000000000000) == 0)
    {
      v135 = &v220 + a4;
      do
      {
        v135[1] = *v135;
        --v135;
      }
      while (&v220 <= v135);
    }
    if (v220)
    {
      if ((_DWORD)v74 == 517)
        v136 = 32;
      else
        v136 = 26;
      v137 = 97;
      if ((_DWORD)v74 == 517)
        v137 = -48;
      v189 = v137;
      v191 = v136;
      v214 = a4 + 1;
      v138 = 3;
      if (!v195)
        v138 = 1;
      if ((v194 & 1) != 0)
        v138 = 2;
      v203 = v138;
      v139 = 0;
      v140 = &v220;
      while (1)
      {
        v141 = v139;
        v142 = v140;
        if (!v139)
          break;
        if (v139 != 1)
          goto LABEL_310;
        v143 = isAnyAlphaX(v140[1], v74);
        v139 = v141;
        if (v143)
          goto LABEL_310;
LABEL_341:
        ++v139;
        v140 = &v220 + v139;
        if (!*(&v220 + v139))
          goto LABEL_342;
      }
      v144 = isAnyAlphaX(v140[2], v74);
      v139 = 0;
      if ((v144 & 1) == 0)
        goto LABEL_341;
LABEL_310:
      if (v142 == v187 - 1)
      {
        v145 = isAnyAlphaX(*(v187 - 2), v74);
        v139 = v141;
        if (!v145)
          goto LABEL_341;
      }
      if (v139 == a4)
      {
        v146 = isAnyAlphaX(*(v142 - 2), v74);
        v139 = v141;
        if (!v146)
          goto LABEL_341;
      }
      v147 = v195;
      if (v139)
        v147 = 0;
      v209 = v194 | v147;
      v149 = v189;
      v148 = v191;
      while (1)
      {
        v150 = v149;
        if ((v209 & 1) != 0)
          v150 = toUpperX(v149, v74);
        *v142 = v150;
        v151 = -[AppleSpell _validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:](self, "_validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:", &v220, v214, a5, a6, a7, 0, v16);
        if (!v151)
          break;
        v152 = v151;
        v153 = *v142;
        if (v141)
        {
          if (v141 != a4 || (_DWORD)v153 != a10)
          {
            v154 = *(v142 - 1);
            goto LABEL_334;
          }
        }
        else
        {
          v162 = a9;
          if (!a4 && (_DWORD)v153 != a9)
            v162 = a10;
          if ((_DWORD)v153 != v162)
          {
            v154 = 0;
LABEL_334:
            if (v141 >= (uint64_t)a4)
              v158 = 0;
            else
              v158 = v142[1];
            v159 = a12;
            v160 = v74;
            v161 = v203;
LABEL_338:
            objc_msgSend(v159, "addOmissionCandidateWithBuffer:encoding:transform:intendedPrecedingCharacter:omittedCharacter:intendedFollowingCharacter:", v152, v160, v161, v154, v153, v158);
            goto LABEL_339;
          }
        }
        objc_msgSend(a12, "addCandidateWithBuffer:encoding:transform:errorType:", v151, v74, v203, 5);
LABEL_339:
        ++v149;
        if (!--v148)
        {
          *v142 = v142[1];
          v139 = v141;
          goto LABEL_341;
        }
      }
      if (v141)
        goto LABEL_339;
      v155 = *v142;
      v156 = toUpperX(*v142, v74);
      if (v156 == v155)
        goto LABEL_339;
      *v142 = v156;
      v157 = -[AppleSpell _validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:](self, "_validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:", &v220, v214, a5, a6, a7, 0, v16);
      if (!v157)
        goto LABEL_339;
      v152 = v157;
      v153 = *v142;
      v158 = v142[1];
      v159 = a12;
      v160 = v74;
      v161 = 0;
      v154 = 0;
      goto LABEL_338;
    }
  }
LABEL_342:
  if ((v183 & 1) == 0 && (objc_msgSend(a12, "isFull") & 1) == 0)
  {
    v163 = *a3;
    if (*a3)
    {
      v164 = a3 + 1;
      v165 = (char *)&v220;
      do
      {
        *v165++ = v163;
        v166 = *v164++;
        v163 = v166;
      }
      while (v166);
    }
    else
    {
      v165 = (char *)&v220;
    }
    *v165 = 0;
    v167 = &v220 + a4;
    v168 = &v220;
    do
    {
      v169 = &v168[a4];
      v169[1] = v168[a4];
      --v168;
    }
    while (&v220 <= v169 - 1);
    if (v220)
    {
      v170 = 0;
      v171 = 3;
      if (!v195)
        v171 = 1;
      if ((v194 & 1) != 0)
        v171 = 2;
      v204 = v171;
      v172 = &v220;
      do
      {
        if (v170)
        {
          if (v170 != 1 || isAnyAlphaX(v172[1], v74))
          {
LABEL_362:
            if ((v172 != v167 - 1 || isAnyAlphaX(*(v167 - 2), v74))
              && (v170 != a4 || isAnyAlphaX(*(v172 - 2), v74)))
            {
              if (*v216)
              {
                if (v170)
                  v173 = 0;
                else
                  v173 = v195;
                v215 = v194 | v173;
                v174 = v216 + 2;
                do
                {
                  v175 = *(v174 - 1);
                  if ((v215 & 1) != 0)
                    LOBYTE(v175) = toUpperX(v175, v74);
                  *v172 = v175;
                  v176 = -[AppleSpell _validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:](self, "_validatedGuessWordBuffer:length:languageObject:connection:sender:checkUser:additionalBuffer:", &v220, a4 + 1, a5, a6, a7, 0, v16);
                  if (v176)
                  {
                    if (v170)
                      v177 = *(v172 - 1);
                    else
                      v177 = 0;
                    if (v170 >= (uint64_t)a4)
                      v178 = 0;
                    else
                      v178 = v172[1];
                    objc_msgSend(a12, "addOmissionCandidateWithBuffer:encoding:transform:intendedPrecedingCharacter:omittedCharacter:intendedFollowingCharacter:", v176, v74, v204, v177, *v172, v178);
                  }
                  v179 = *v174;
                  v174 += 2;
                }
                while (v179);
              }
              *v172 = v172[1];
            }
          }
        }
        else if ((isAnyAlphaX(v172[2], v74) & 1) != 0)
        {
          goto LABEL_362;
        }
        ++v170;
        v172 = &v220 + v170;
      }
      while (*(&v220 + v170));
    }
  }
}

- (BOOL)_findMatchingRangesForRange:(_NSRange)a3 inString:(id)a4 keyEventArray:(id)a5 endingAtIndex:(unint64_t)a6 matchingStringRange:(_NSRange *)a7 correctableStringRange:(_NSRange *)a8 matchingKeyEventRange:(_NSRange *)a9 firstMisspelledKeyEventIndex:(unint64_t *)a10 lastMisspelledKeyEventIndex:(unint64_t *)a11 previousBackspaceCount:(unint64_t *)a12
{
  NSUInteger length;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  NSUInteger v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  unsigned __int8 v30;
  uint64_t *v31;
  unint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  NSUInteger v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  int v42;
  _NSRange *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v48;
  unint64_t v50;
  int v52;
  NSUInteger location;
  int v54;
  unint64_t v55;
  NSUInteger v56;
  unint64_t v57;
  unint64_t v58;

  length = a3.length;
  location = a3.location;
  v15 = objc_msgSend(a4, "length");
  v16 = objc_msgSend(a5, "count");
  if (_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__onceToken == -1)
  {
    if (a6)
    {
LABEL_3:
      v17 = 0;
      v18 = 0;
      v54 = 0;
      v50 = location + length;
      v19 = a6;
      v48 = a6;
      v55 = v16;
      v56 = a6;
      v20 = v16;
      v57 = 0x7FFFFFFFFFFFFFFFLL;
      v58 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        while (1)
        {
          while (1)
          {
            v21 = v20;
            if (v19 > v15 || !v20 || v20 > v16)
            {
LABEL_50:
              v20 = v21;
LABEL_51:
              a6 = v48;
              v43 = a7;
              v32 = v55;
              goto LABEL_55;
            }
            --v20;
            v22 = (void *)objc_msgSend(a5, "objectAtIndex:", v21 - 1);
            v23 = v21 < 2 ? 0 : (void *)objc_msgSend(a5, "objectAtIndex:", v21 - 2);
            if ((objc_msgSend(v22, "flags") & 0x400) == 0)
              break;
            ++v17;
            v18 = 1;
          }
          if (!v17)
            break;
          --v17;
        }
        v52 = v18;
        v24 = (void *)objc_msgSend(v22, "characters");
        v25 = objc_msgSend(a4, "rangeOfString:options:range:", v24, 13, 0, v19);
        v27 = v26;
        if (v23 && !objc_msgSend((id)objc_msgSend(v23, "characters"), "length"))
          goto LABEL_50;
        if (objc_msgSend(v24, "length") == 1)
        {
          v28 = objc_msgSend(v24, "characterAtIndex:", 0);
          v29 = objc_msgSend((id)_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__wsSet, "characterIsMember:", v28);
          v30 = objc_msgSend((id)_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__nlSet, "characterIsMember:", v28);
          if (!v27)
          {
            v31 = &_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__nlSet;
            if (v29)
              v31 = &_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__wsSet;
            if (((v29 | v30) & 1) != 0)
            {
              v32 = v55;
            }
            else
            {
              v31 = &_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__sqSet;
              v32 = v55;
              if ((_DWORD)v28 != 39)
              {
                if ((_DWORD)v28 != 34)
                  goto LABEL_52;
                v31 = &_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__dqSet;
              }
            }
            v34 = objc_msgSend(a4, "rangeOfCharacterFromSet:options:range:", *v31, 12, 0, v19);
            if (!v35)
            {
LABEL_52:
              v20 = v21;
              a6 = v48;
              v43 = a7;
              goto LABEL_55;
            }
            v25 = v34;
          }
          v33 = v54;
          if ((v54 & v29 & 1) != 0)
            goto LABEL_50;
        }
        else
        {
          if (!v27)
            goto LABEL_50;
          v29 = 0;
          v33 = v54;
        }
        v17 = 0;
        if ((v52 & 1) != 0)
          v36 = v55;
        else
          v36 = v21;
        v37 = v56;
        v38 = v57;
        if ((v52 & 1) == 0)
          v37 = v25;
        v55 = v36;
        v56 = v37;
        if (v25 >= v50)
          v39 = v57;
        else
          v39 = v21 - 1;
        if (v25 >= v50)
          v40 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v40 = v21 - 1;
        v41 = v58;
        if (v58 != 0x7FFFFFFFFFFFFFFFLL)
          v40 = v58;
        if (location <= v25)
        {
          v38 = v39;
          v41 = v40;
        }
        v57 = v38;
        v58 = v41;
        if (location > v25)
          v42 = v29;
        else
          v42 = 0;
        v54 = v42 | v33;
        v19 = v25;
        v18 = v52;
        if (!v19)
          goto LABEL_51;
      }
    }
  }
  else
  {
    dispatch_once(&_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__onceToken, &__block_literal_global_72);
    if (a6)
      goto LABEL_3;
  }
  v19 = 0;
  v58 = 0x7FFFFFFFFFFFFFFFLL;
  v56 = 0;
  v57 = 0x7FFFFFFFFFFFFFFFLL;
  v20 = v16;
  v32 = v16;
  v43 = a7;
LABEL_55:
  if (v32)
  {
    v44 = v32 - 1;
    if (v32 == 1)
    {
      v20 = 0;
    }
    else
    {
      v45 = a6;
      v46 = 0;
      v20 = v44;
      while ((objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", v20 - 1), "flags") & 0x400) != 0)
      {
        ++v46;
        if (!--v20)
          goto LABEL_64;
      }
      v44 = v46;
LABEL_64:
      a6 = v45;
    }
  }
  else
  {
    v44 = 0;
  }
  if (v43)
  {
    v43->location = v19;
    v43->length = a6 - v19;
  }
  if (a8)
  {
    a8->location = v56;
    a8->length = a6 - v56;
  }
  if (a9)
  {
    a9->location = v20;
    a9->length = v16 - v20;
  }
  if (a10)
    *a10 = v57;
  if (a11)
    *a11 = v58;
  if (a12)
    *a12 = v44;
  return a6 > v19;
}

id __236__AppleSpell_Correction___findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount___block_invoke()
{
  id result;

  _findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__wsSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  _findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__nlSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  _findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__sqSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("'‘’‚"));
  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\"«»“”„"));
  _findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__dqSet = (uint64_t)result;
  return result;
}

- (BOOL)findMatchingRangesForRange:(_NSRange)a3 inString:(id)a4 keyEventArray:(id)a5 selectedRangeValue:(id)a6 matchingStringRange:(_NSRange *)a7 correctableStringRange:(_NSRange *)a8 matchingKeyEventRange:(_NSRange *)a9 firstMisspelledKeyEventIndex:(unint64_t *)a10 lastMisspelledKeyEventIndex:(unint64_t *)a11 previousBackspaceCount:(unint64_t *)a12
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _NSRange *v23;
  unint64_t v24;
  _NSRange v26;
  __int128 v27;
  _NSRange v28;
  _NSRange v29;
  __int128 v30;
  _NSRange v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;

  length = a3.length;
  location = a3.location;
  v19 = objc_msgSend(a4, "length");
  v20 = objc_msgSend(a5, "count");
  v36 = 0x7FFFFFFFFFFFFFFFLL;
  v37 = 0x7FFFFFFFFFFFFFFFLL;
  v33 = 0;
  v30 = xmmword_1DE2EC5B0;
  v31 = (_NSRange)xmmword_1DE2EC5B0;
  v29 = (_NSRange)xmmword_1DE2EC5B0;
  if (a5)
  {
    v21 = v20;
    v22 = objc_msgSend(a5, "count");
    if (v22)
    {
      v23 = a8;
      v34 = 0;
      v35 = 0;
      v32 = 0;
      v28 = (_NSRange)0;
      v27 = 0uLL;
      v26 = (_NSRange)0;
      if (a6)
      {
        LOBYTE(v22) = -[AppleSpell _findMatchingRangesForRange:inString:keyEventArray:endingAtIndex:matchingStringRange:correctableStringRange:matchingKeyEventRange:firstMisspelledKeyEventIndex:lastMisspelledKeyEventIndex:previousBackspaceCount:](self, "_findMatchingRangesForRange:inString:keyEventArray:endingAtIndex:matchingStringRange:correctableStringRange:matchingKeyEventRange:firstMisspelledKeyEventIndex:lastMisspelledKeyEventIndex:previousBackspaceCount:", location, length, a4, a5, objc_msgSend(a6, "rangeValue"), &v31, &v30, &v29, &v37, &v36, &v33);
      }
      else
      {
        v24 = v21 + location + length;
        if (__CFADD__(v21, location + length))
        {
          LOBYTE(v22) = 0;
        }
        else
        {
          do
          {
            if (v24 <= v19
              && -[AppleSpell _findMatchingRangesForRange:inString:keyEventArray:endingAtIndex:matchingStringRange:correctableStringRange:matchingKeyEventRange:firstMisspelledKeyEventIndex:lastMisspelledKeyEventIndex:previousBackspaceCount:](self, "_findMatchingRangesForRange:inString:keyEventArray:endingAtIndex:matchingStringRange:correctableStringRange:matchingKeyEventRange:firstMisspelledKeyEventIndex:lastMisspelledKeyEventIndex:previousBackspaceCount:", location, length, a4, a5, v24, &v28, &v27, &v26, &v35, &v34, &v32)&& v28.length >= v31.length)
            {
              v30 = v27;
              v31 = v28;
              v29 = v26;
              v36 = v34;
              v37 = v35;
              v33 = v32;
            }
            --v24;
          }
          while (v24 >= location + length);
          LOBYTE(v22) = v31.length != 0;
        }
        v23 = a8;
      }
      if (a7)
        *a7 = v31;
      if (v23)
        *v23 = (_NSRange)v30;
      if (a9)
        *a9 = v29;
      if (a10)
        *a10 = v37;
      if (a11)
        *a11 = v36;
      if (a12)
        *a12 = v33;
    }
  }
  else
  {
    LOBYTE(v22) = 0;
  }
  return v22;
}

- (id)_capitalizationResultForString:(id)a3 range:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 languageObject:(id)a7 onlyAtInsertionPoint:(BOOL)a8 keyEventArray:(id)a9 selectedRangeValue:(id)a10
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v14;
  uint64_t v15;

  length = a4.length;
  location = a4.location;
  v14 = initialCapitalizedString(a3, 0);
  if (v14 && (v15 = v14, (objc_msgSend(a3, "isEqualToString:", v14) & 1) == 0))
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3548]), "initWithRange:replacementString:", location + a6, length, v15);
  else
    return 0;
}

- (id)_phraseCapitalizationResultForString:(id)a3 range:(_NSRange)a4 currentWordRange:(_NSRange)a5 inString:(id)a6 offset:(unint64_t)a7 languageObject:(id)a8 onlyAtInsertionPoint:(BOOL)a9 keyEventArray:(id)a10 selectedRangeValue:(id)a11
{
  NSUInteger location;
  NSUInteger length;
  NSUInteger v14;
  id v16;
  void *v17;
  id v18;
  uint64_t v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  location = a5.location;
  length = a4.length;
  v14 = a4.location;
  v16 = -[AppleSpell phraseMatching:inLexiconForLanguageObject:](self, "phraseMatching:inLexiconForLanguageObject:", a3, a8, a4.length, a5.location, a5.length);
  if (!v16)
    return 0;
  v17 = v16;
  if ((objc_msgSend(v16, "isEqualToString:", a3) & 1) != 0
    || (objc_msgSend(v17, "isEqualToString:", objc_msgSend(v17, "lowercaseString")) & 1) != 0)
  {
    return 0;
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v20 = objc_msgSend(a3, "length");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __171__AppleSpell_Correction___phraseCapitalizationResultForString_range_currentWordRange_inString_offset_languageObject_onlyAtInsertionPoint_keyEventArray_selectedRangeValue___block_invoke;
  v21[3] = &unk_1EA8CD178;
  v21[4] = v17;
  v21[5] = &v22;
  objc_msgSend(a3, "enumerateSubstringsInRange:options:usingBlock:", 0, v20, 3, v21);
  if (*((_BYTE *)v23 + 24))
  {
    v18 = 0;
  }
  else
  {
    if (location > v14
      && objc_msgSend(v17, "length") + v14 > location
      && objc_msgSend((id)objc_msgSend(a6, "substringWithRange:", v14, location - v14), "isEqualToString:", objc_msgSend(v17, "substringToIndex:", location - v14)))
    {
      v17 = (void *)objc_msgSend(v17, "substringFromIndex:", location - v14);
      length = v14 + length - location;
      v14 = location;
    }
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3548]), "initWithRange:replacementString:", v14 + a7, length, v17);
  }
  _Block_object_dispose(&v22, 8);
  return v18;
}

uint64_t __171__AppleSpell_Correction___phraseCapitalizationResultForString_range_currentWordRange_inString_offset_languageObject_onlyAtInsertionPoint_keyEventArray_selectedRangeValue___block_invoke(uint64_t result, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v11;
  const __CFString *v12;

  if (a2)
  {
    if (a4 >= 2)
    {
      v11 = result;
      result = objc_msgSend(a2, "isEqualToString:", objc_msgSend(a2, "uppercaseString"));
      if ((_DWORD)result)
      {
        if (a3 + a4 <= objc_msgSend(*(id *)(v11 + 32), "length"))
          v12 = (const __CFString *)objc_msgSend(*(id *)(v11 + 32), "substringWithRange:", a3, a4);
        else
          v12 = &stru_1EA8D8440;
        result = objc_msgSend(a2, "isEqualToString:", v12);
        if ((result & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v11 + 40) + 8) + 24) = 1;
          *a7 = 1;
        }
      }
    }
  }
  return result;
}

- (BOOL)wordIsAlreadyAccented:(id)a3
{
  uint64_t v4;

  if (wordIsAlreadyAccented__onceToken != -1)
    dispatch_once(&wordIsAlreadyAccented__onceToken, &__block_literal_global_79);
  objc_msgSend(a3, "rangeOfCharacterFromSet:", wordIsAlreadyAccented__nonPlainSet);
  return v4 != 0;
}

id __48__AppleSpell_Correction__wordIsAlreadyAccented___block_invoke()
{
  void *v0;
  id result;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_'"));
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 913, 27));
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 945, 27));
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 2308, 54));
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 2366, 15));
  result = (id)objc_msgSend(v0, "invertedSet");
  wordIsAlreadyAccented__nonPlainSet = (uint64_t)result;
  return result;
}

- (id)_accentCorrectionResultForString:(id)a3 range:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 languageObject:(id)a7 onlyAtInsertionPoint:(BOOL)a8 capitalize:(BOOL)a9 keyEventArray:(id)a10 selectedRangeValue:(id)a11
{
  id v12;
  void *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  BOOL v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  NSUInteger location;
  NSUInteger length;
  int v40;
  uint64_t v41;
  int v42;
  _QWORD v43[5];
  _QWORD v44[9];
  BOOL v45;
  BOOL v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;

  length = a4.length;
  location = a4.location;
  v12 = a3;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4.location, a4.length, a5);
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  objc_msgSend(v12, "rangeOfString:", CFSTR("-"));
  v16 = v15 != 0;
  objc_msgSend(v12, "rangeOfString:", CFSTR("’"));
  v41 = v17;
  v18 = objc_msgSend(a7, "isGreek");
  v42 = objc_msgSend(a7, "isIrishGaelic");
  v19 = objc_msgSend(a7, "isPolish");
  v20 = objc_msgSend(a7, "isRomanian");
  v40 = objc_msgSend(a7, "isVietnamese");
  if (_accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue__onceToken != -1)
    dispatch_once(&_accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue__onceToken, &__block_literal_global_88);
  if (objc_msgSend(v12, "length") == 1 && ((v18 | v42 | v19 | v20) & 1) != 0)
    goto LABEL_15;
  objc_msgSend(v12, "rangeOfCharacterFromSet:", _accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue__nonPlainCapsSet);
  if (!v21)
    goto LABEL_15;
  if (v41)
    v12 = (id)objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v22 = -[AppleSpell wordIsAlreadyAccented:](self, "wordIsAlreadyAccented:", v12);
  if (a7)
  {
    if (v12)
    {
      v23 = -[AppleSpell autocorrectionDictionaryForLanguageObject:](self, "autocorrectionDictionaryForLanguageObject:", a7);
      v24 = v23;
      if (v23)
      {
        if (objc_msgSend(v23, "objectForKey:", v12))
          goto LABEL_15;
        v25 = objc_msgSend(v12, "lowercaseStringWithLocale:", 0);
        if (v25)
        {
          if (objc_msgSend(v24, "objectForKey:", v25))
            goto LABEL_15;
        }
      }
    }
  }
  v26 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __161__AppleSpell_Correction___accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue___block_invoke_2;
  v44[3] = &unk_1EA8CD1C0;
  v45 = v16;
  v46 = v22;
  v47 = v42;
  v44[4] = self;
  v44[5] = v12;
  v44[7] = v14;
  v44[8] = &v48;
  v44[6] = 0;
  -[AppleSpell enumerateEntriesForWord:inLexiconForLanguageObject:withBlock:](self, "enumerateEntriesForWord:inLexiconForLanguageObject:withBlock:", v12, a7, v44);
  if (*((_BYTE *)v49 + 24) || !objc_msgSend(v14, "count"))
    goto LABEL_15;
  v43[0] = v26;
  v43[1] = 3221225472;
  v43[2] = __161__AppleSpell_Correction___accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue___block_invoke_3;
  v43[3] = &unk_1EA8CD1E8;
  v43[4] = v14;
  v29 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "allKeys"), "sortedArrayUsingComparator:", v43), "firstObject");
  v30 = v29;
  if ((v18 | v42 | v19 | v20 | v40) != 1
    || !objc_msgSend(v29, "isEqualToString:", objc_msgSend(v29, "lowercaseStringWithLocale:", 0)))
  {
    goto LABEL_25;
  }
  if ((objc_msgSend(v12, "isEqualToString:", objc_msgSend(v12, "capitalizedStringWithLocale:", 0)) & 1) != 0)
  {
LABEL_38:
    v31 = initialCapitalizedString(v30, 0);
    goto LABEL_24;
  }
  if (objc_msgSend(v12, "isEqualToString:", uppercasedString(v12, 0)))
  {
    v31 = uppercasedString(v30, 0);
  }
  else
  {
    if (!v42)
    {
      if (!a9)
        goto LABEL_25;
      goto LABEL_38;
    }
    v32 = objc_msgSend(v12, "rangeOfComposedCharacterSequenceAtIndex:", 0);
    v34 = v32 + v33;
    if (v34 >= objc_msgSend(v12, "length"))
      goto LABEL_25;
    v35 = objc_msgSend(v12, "substringToIndex:", v34);
    v36 = (void *)objc_msgSend(v12, "substringFromIndex:", v34);
    if (!objc_msgSend((id)_accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue__irishInitialsArray, "containsObject:", v35)|| !objc_msgSend(v36, "isEqualToString:", objc_msgSend(v36, "capitalizedString")))
    {
      if (!a9)
        goto LABEL_25;
      goto LABEL_38;
    }
    v31 = secondCapitalizedString(v30, 0);
  }
LABEL_24:
  v30 = (void *)v31;
LABEL_25:
  if (!v30 || (objc_msgSend(v12, "isEqualToString:", v30) & 1) != 0)
  {
LABEL_15:
    v27 = 0;
    goto LABEL_16;
  }
  if (v41)
    v30 = (void *)objc_msgSend(v30, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("’"));
  v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3548]), "initWithRange:replacementString:", location + a6, length, v30);
LABEL_16:
  _Block_object_dispose(&v48, 8);
  return v27;
}

void *__161__AppleSpell_Correction___accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue___block_invoke()
{
  void *v0;
  void *result;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZ-_'"));
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 913, 27));
  _accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue__nonPlainCapsSet = (uint64_t)(id)objc_msgSend(v0, "invertedSet");
  result = &unk_1EA8E7288;
  _accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue__irishInitialsArray = (uint64_t)result;
  return result;
}

uint64_t __161__AppleSpell_Correction___accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue___block_invoke_2(uint64_t a1, void *a2, double a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  int v13;
  BOOL v14;
  BOOL v15;
  int v16;
  uint64_t result;

  objc_msgSend(a2, "rangeOfString:", CFSTR("-"));
  v10 = v9;
  v11 = objc_msgSend(*(id *)(a1 + 32), "wordIsAlreadyAccented:", a2);
  if (*(_BYTE *)(a1 + 72))
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (*(_BYTE *)(a1 + 73))
      v13 = v11;
    else
      v13 = 1;
    if (*(_BYTE *)(a1 + 72))
      v14 = 0;
    else
      v14 = v10 == 0;
    if (v14)
    {
      v16 = 0;
    }
    else
    {
      if (*(_BYTE *)(a1 + 74))
        v15 = *(_BYTE *)(a1 + 72) == 0;
      else
        v15 = 0;
      v16 = !v15;
    }
  }
  else
  {
    v16 = 0;
    if (*(_BYTE *)(a1 + 73))
      v13 = v11;
    else
      v13 = 1;
  }
  result = objc_msgSend(*(id *)(a1 + 40), "compare:options:range:locale:", a2, 1, 0, objc_msgSend(*(id *)(a1 + 40), "length"), *(_QWORD *)(a1 + 48));
  if (result)
  {
    if (((v16 | v13 ^ 1) & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __161__AppleSpell_Correction___accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2), "doubleValue");
  v6 = v5;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a3), "doubleValue");
  if (v6 > v7)
    return -1;
  else
    return v6 < v7;
}

- (BOOL)_acceptWithoutAccentForString:(id)a3 range:(_NSRange)a4 inString:(id)a5 languageObject:(id)a6
{
  int v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = objc_msgSend(a6, "isGreek", a3, a4.location, a4.length, a5);
  v10 = v9;
  if (_acceptWithoutAccentForString_range_inString_languageObject__onceToken == -1)
  {
    if (!v9)
    {
LABEL_4:
      v12 = 0;
      goto LABEL_5;
    }
  }
  else
  {
    dispatch_once(&_acceptWithoutAccentForString_range_inString_languageObject__onceToken, &__block_literal_global_108);
    if (!v10)
      goto LABEL_4;
  }
  objc_msgSend(a3, "rangeOfCharacterFromSet:", _acceptWithoutAccentForString_range_inString_languageObject__nonGreekPlainUppercaseLetterCharacterSet);
  if (v11)
    goto LABEL_4;
  if (objc_msgSend(a3, "length") == 1)
  {
    v12 = 1;
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__AppleSpell_Correction___acceptWithoutAccentForString_range_inString_languageObject___block_invoke_2;
    v14[3] = &unk_1EA8CD210;
    v14[4] = a3;
    v14[5] = &v15;
    -[AppleSpell enumerateEntriesForWord:inLexiconForLanguageObject:withBlock:](self, "enumerateEntriesForWord:inLexiconForLanguageObject:withBlock:", a3, a6, v14);
    v12 = *((_BYTE *)v16 + 24) != 0;
  }
LABEL_5:
  _Block_object_dispose(&v15, 8);
  return v12;
}

id __86__AppleSpell_Correction___acceptWithoutAccentForString_range_inString_languageObject___block_invoke()
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 913, 27), "invertedSet");
  _acceptWithoutAccentForString_range_inString_languageObject__nonGreekPlainUppercaseLetterCharacterSet = (uint64_t)result;
  return result;
}

uint64_t __86__AppleSpell_Correction___acceptWithoutAccentForString_range_inString_languageObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", uppercasedString(a2, 0));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)_initialCorrectionForString:(id)a3 lowercaseString:(id)a4 isFirstSecondCapitalized:(BOOL)a5 dictionary:(id)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8
{
  CFStringEncoding v15;
  id result;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  CFIndex v22;
  CFIndex v23;
  CFIndex Bytes;
  CFIndex *usedBufLen;
  CFIndex v26;
  UInt8 buffer[256];
  uint64_t v28;
  CFRange v29;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = objc_msgSend(a7, "encoding");
  result = (id)objc_msgSend(a6, "objectForKey:", a3);
  if (!result && !a5)
  {
    result = (id)objc_msgSend(a6, "objectForKey:", a4);
    if (a8)
    {
      if (!result)
      {
        v17 = objc_msgSend(a3, "rangeOfString:", CFSTR("-"));
        result = 0;
        if (v18)
        {
          if (v17)
          {
            v19 = (void *)objc_msgSend(a3, "substringToIndex:", v17);
            v20 = objc_msgSend(a3, "substringFromIndex:", v17);
            result = (id)objc_msgSend(a6, "objectForKey:", v19);
            if (result || (result = (id)objc_msgSend(a6, "objectForKey:", objc_msgSend(v19, "lowercaseString"))) != 0)
            {
              v21 = (__CFString *)objc_msgSend(result, "stringByAppendingString:", v20);
              v22 = -[__CFString length](v21, "length");
              if (v21)
              {
                v23 = v22;
                v26 = 0;
                v29.location = 0;
                v29.length = v22;
                Bytes = CFStringGetBytes(v21, v29, v15, 0, 0, buffer, 254, &v26);
                result = 0;
                if (v23 == Bytes)
                {
                  BYTE4(usedBufLen) = 0;
                  LODWORD(usedBufLen) = 65793;
                  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, v26, a7, a8, 0, 1, usedBufLen, 0))
                  {
                    return v21;
                  }
                  else
                  {
                    return 0;
                  }
                }
              }
              else
              {
                return 0;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (BOOL)_prohibitCorrectionBasedOnCountsForString:(id)a3 lowercaseString:(id)a4 appIdentifier:(id)a5 languageObject:(id)a6 typologyCorrection:(id)a7
{
  NSMutableDictionary *learnedResponses;
  NSMutableDictionary *probationaryLearnedResponses;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  double Current;
  uint64_t v19;
  BOOL v20;
  double v21;
  double v22;
  uint64_t v23;
  double probationaryInterval;
  _BOOL4 v25;
  int v26;
  char v27;
  char v28;

  learnedResponses = self->_learnedResponses;
  if (!learnedResponses)
  {
    probationaryLearnedResponses = self->_probationaryLearnedResponses;
    if (!probationaryLearnedResponses)
      return (char)probationaryLearnedResponses;
  }
  v13 = (void *)-[NSMutableDictionary objectForKey:](learnedResponses, "objectForKey:", a3, a4, a5, a6, a7);
  v14 = (void *)-[NSMutableDictionary objectForKey:](self->_probationaryLearnedResponses, "objectForKey:", a3);
  v15 = (void *)-[NSMutableDictionary objectForKey:](self->_probationaryLearnedResponseTimes, "objectForKey:", a3);
  -[AppleSpell dynamicScoreForWord:languageObject:appIdentifier:](self, "dynamicScoreForWord:languageObject:appIdentifier:", a3, a6, a5);
  v17 = v16;
  Current = CFAbsoluteTimeGetCurrent();
  if (v13)
  {
    if (v14)
      goto LABEL_5;
LABEL_8:
    v14 = (void *)-[NSMutableDictionary objectForKey:](self->_probationaryLearnedResponses, "objectForKey:", a4);
    v15 = (void *)-[NSMutableDictionary objectForKey:](self->_probationaryLearnedResponseTimes, "objectForKey:", a4);
    if (v13)
      goto LABEL_6;
    goto LABEL_9;
  }
  v13 = (void *)-[NSMutableDictionary objectForKey:](self->_learnedResponses, "objectForKey:", a4);
  if (!v14)
    goto LABEL_8;
LABEL_5:
  if (v13)
  {
LABEL_6:
    v19 = objc_msgSend(v13, "integerValue");
    goto LABEL_10;
  }
LABEL_9:
  v19 = 0;
LABEL_10:
  if (v14)
    v20 = v15 == 0;
  else
    v20 = 1;
  if (v20)
  {
    v23 = 0;
    v25 = 0;
  }
  else
  {
    objc_msgSend(v15, "doubleValue");
    v22 = v21;
    v23 = objc_msgSend(v14, "integerValue");
    probationaryInterval = self->_probationaryInterval;
    v25 = v22 + probationaryInterval > Current;
    if (v22 + probationaryInterval / 10.0 > Current)
    {
      v26 = 1;
      goto LABEL_19;
    }
  }
  v26 = 0;
LABEL_19:
  if (v17 >= 2.0)
  {
    if (v19 > -3 || (LOBYTE(probationaryLearnedResponses) = 0, (v25 | v26) == 1) && v23 >= -2)
      LOBYTE(probationaryLearnedResponses) = 1;
  }
  else
  {
    v27 = v23 > 1 && v25;
    if (v19 > 2)
      v27 = 1;
    if (v23 > 0)
      v28 = v26;
    else
      v28 = 0;
    LOBYTE(probationaryLearnedResponses) = v27 | v28;
  }
  return (char)probationaryLearnedResponses;
}

- (id)_umlautCorrectionForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 connection:(_PR_DB_IO *)a7 typologyCorrection:(id)a8
{
  char *v10;
  int v12;
  int v13;
  int v14;
  int v15;
  char v16;
  __CFString *v17;
  char v18;
  char v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  int v24;
  char *v25;
  int v26;
  int v27;
  unsigned int v28;
  BOOL v29;
  int v30;
  int v32;
  char v33;
  unsigned __int8 *v34;
  int v35;
  unsigned __int8 *v36;
  int v37;
  char v38;
  char v39;
  char v40;
  char *v41;
  char *v42;
  int v43;
  char v44;
  int v45;
  uint64_t v47;
  char __s[256];
  uint64_t v49;

  v10 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v12 = objc_msgSend(a6, "encoding", a3, a4, a5);
  v13 = objc_msgSend(a6, "isGerman");
  v14 = objc_msgSend(a6, "isDanish");
  v15 = objc_msgSend(a6, "isNorwegian");
  v16 = objc_msgSend(a6, "isNynorsk");
  v17 = 0;
  if (!v13 || v12 != 1280)
    goto LABEL_48;
  v18 = *v10;
  if (!*v10)
  {
    v17 = 0;
    __s[0] = 0;
    goto LABEL_48;
  }
  v17 = 0;
  v19 = 0;
  v20 = __s;
  v21 = v10;
  v22 = v10;
  do
  {
    v23 = v20;
    *v20++ = v18;
    v26 = v22[1];
    v25 = v22 + 1;
    v24 = v26;
    if (v26 == 115)
    {
      if (*v21 == 115)
        v17 = (__CFString *)v23;
LABEL_13:
      v25 = v21;
      goto LABEL_23;
    }
    if (v24 != 101)
      goto LABEL_13;
    v27 = *v21;
    switch(v27)
    {
      case 'u':
        if (v21 != v10)
        {
          v28 = *(v21 - 1) - 97;
          v29 = v28 > 0x10;
          v30 = (1 << v28) & 0x10011;
          if (!v29 && v30 != 0)
            goto LABEL_13;
        }
        *v23 = -4;
        break;
      case 'o':
        *v23 = -10;
        break;
      case 'a':
        *v23 = -28;
        break;
      default:
        goto LABEL_13;
    }
    v19 = 1;
LABEL_23:
    v32 = v25[1];
    v22 = v25 + 1;
    v18 = v32;
    v21 = v22;
  }
  while (v32);
  *v20 = 0;
  if ((v19 & 1) == 0)
  {
    v17 = 0;
    goto LABEL_48;
  }
  BYTE4(v47) = 0;
  LODWORD(v47) = 257;
  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", __s, strlen(__s), a6, a7, 0, 1, v47, 0))
  {
    goto LABEL_47;
  }
  v33 = __s[0];
  if (__s[0] > 0xF7u
    || __s[0] - 97 < 0x1A
    || __s[0] - 223 < 0x18)
  {
    if (__s[0] - 154 <= 4 && ((1 << (__s[0] + 102)) & 0x15) != 0)
      goto LABEL_40;
    if (__s[0] != 223)
    {
      if (__s[0] == 255)
        v33 = -97;
      else
        v33 = __s[0] - 32;
    }
  }
  else
  {
    if (__s[0] - 154 > 4 || ((1 << (__s[0] + 102)) & 0x15) == 0)
    {
      if (v17)
      {
        LOBYTE(v17->isa) = -33;
        if (BYTE1(v17->isa))
        {
          v34 = (unsigned __int8 *)&v17->isa + 2;
          do
          {
            v35 = *v34;
            *(v34++ - 1) = v35;
          }
          while (v35);
        }
        goto LABEL_46;
      }
      goto LABEL_48;
    }
LABEL_40:
    v33 = __s[0] - 16;
  }
  __s[0] = v33;
  BYTE4(v47) = 0;
  LODWORD(v47) = 257;
  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", __s, strlen(__s), a6, a7, 0, 1, v47, 0))
  {
    goto LABEL_47;
  }
  if (v17)
  {
    LOBYTE(v17->isa) = -33;
    if (BYTE1(v17->isa))
    {
      v36 = (unsigned __int8 *)&v17->isa + 2;
      do
      {
        v37 = *v36;
        *(v36++ - 1) = v37;
      }
      while (v37);
    }
LABEL_46:
    BYTE4(v47) = 0;
    LODWORD(v47) = 257;
    v17 = 0;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", __s, strlen(__s), a6, a7, 0, 1, v47, 0))
    {
LABEL_47:
      v17 = (id)CFStringCreateWithCString(0, __s, 0x500u);
    }
  }
LABEL_48:
  if (((v14 | v15) & 1) != 0)
  {
    if (v12 != 1280)
      return v17;
LABEL_55:
    v39 = *v10;
    if (!*v10)
      return v17;
    v40 = 0;
    v41 = __s;
    while (2)
    {
      v42 = v41;
      *v41++ = v39;
      if (*v10 == 97)
      {
        v43 = v10[1];
        if (v43 == 101)
        {
          v44 = -26;
LABEL_62:
          *v42 = v44;
          v40 = 1;
          ++v10;
        }
        else if (v43 == 97)
        {
          v44 = -27;
          goto LABEL_62;
        }
      }
      v45 = *++v10;
      v39 = v45;
      if (!v45)
      {
        *v41 = 0;
        if ((v40 & 1) != 0)
        {
          BYTE4(v47) = 0;
          LODWORD(v47) = 257;
          if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", __s, strlen(__s), a6, a7, 0, 1, v47, 0))
          {
            return (id)(id)CFStringCreateWithCString(0, __s, 0x500u);
          }
        }
        return v17;
      }
      continue;
    }
  }
  if (v12 == 1280)
    v38 = v16;
  else
    v38 = 0;
  if ((v38 & 1) != 0)
    goto LABEL_55;
  return v17;
}

- (id)_connectionCorrectionForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 connection:(_PR_DB_IO *)a7 flags:(unint64_t)a8 isCapitalized:(BOOL)a9 accentCorrectionOnly:(BOOL)a10 isAbbreviation:(BOOL *)a11 trySpaceInsertion:(BOOL *)a12 hasAccentCorrections:(BOOL *)a13 candidateList:(id)a14 typologyCorrection:(id)a15
{
  uint64_t v20;
  int v21;
  CFStringRef v22;
  int v23;
  _QWORD *v24;
  uint64_t v25;
  unint64_t v26;
  __int16 *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  size_t v31;
  unint64_t v32;
  unint64_t v33;
  __int16 *v34;
  const char *v35;
  unint64_t v36;
  int v37;
  int v38;
  BOOL v40;
  uint64_t v41;
  int v43;
  unint64_t v44;
  const char *v45;
  size_t v46;
  unint64_t v47;
  BOOL v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  int v52;
  __int16 *v53;
  const char *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  const char *v63;
  unint64_t v64;
  BOOL v65;
  unint64_t v66;
  int v67;
  int v68;
  _BOOL4 v69;
  uint64_t v71;
  const char *v72;
  size_t v73;
  unint64_t v74;
  int v75;
  int v76;
  _BOOL4 v78;
  size_t v79;
  int v80;
  int v81;
  _BOOL4 v82;
  uint64_t v84;
  int v85;
  const char *v86;
  size_t v87;
  unint64_t v88;
  unint64_t v89;
  int v90;
  uint64_t v92;
  BOOL *v93;
  unint64_t v94;
  char v95;
  char v96;
  int v97;
  __int16 *v98;
  _QWORD *v99;
  unint64_t v100;
  unint64_t v101;
  _OWORD v102[15];
  __int128 v103;
  int v104;
  char *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v20 = objc_msgSend(a6, "encoding", a3);
  v21 = objc_msgSend(a6, "isGerman");
  v22 = 0;
  if (a5 - 2 > 0x3D || !a7)
    return (id)v22;
  v23 = v21;
  v114 = 0;
  v113 = 0u;
  v112 = 0u;
  v111 = 0u;
  v110 = 0u;
  v109 = 0u;
  v108 = 0u;
  v107 = 0u;
  v106 = 0u;
  memset(v102, 0, sizeof(v102));
  v103 = 0u;
  HIDWORD(v103) = 0;
  v104 = 0;
  v105 = a4;
  *(_QWORD *)&v112 = v102;
  BYTE7(v113) = 1;
  *(_WORD *)((char *)&v113 + 9) = *(_WORD *)&a7->var0;
  PRword((uint64_t)&v105, 8, 0);
  v24 = (_QWORD *)v106;
  if (!(_QWORD)v106 || !*(_QWORD *)(v106 + 8) || (v97 = v23, (v25 = *(_QWORD *)v106) == 0))
  {
    v22 = 0;
    goto LABEL_36;
  }
  v93 = a11;
  v26 = *(unsigned __int16 *)(v106 + 18);
  v99 = (_QWORD *)v106;
  v101 = v26;
  if (!*(_WORD *)(v106 + 18))
  {
    v22 = 0;
    LOBYTE(v43) = a10;
    if (a10)
      goto LABEL_122;
    goto LABEL_123;
  }
  v94 = a8;
  v27 = *(__int16 **)(v106 + 8);
  v28 = 0;
  v98 = v27;
  while (1)
  {
    v29 = *v27++;
    v30 = (const char *)(v25 + v29);
    v31 = strlen((const char *)(v25 + v29));
    if (v31)
      break;
LABEL_15:
    if (!--v26)
      goto LABEL_16;
  }
  if (v31 != a5 + 1 || v30[a5] != 46 || strncmp(a4, v30, a5))
  {
    if (((v97 | a9) & 1) != 0 || (isUpperCaseX(*(unsigned __int8 *)v30, v20) & 1) == 0)
      ++v28;
    goto LABEL_15;
  }
  v28 = 0;
  *a11 = 1;
  *a12 = 0;
LABEL_16:
  if (a10)
  {
    v32 = 0;
    v33 = 0;
    v100 = 0x7FFFFFFFFFFFFFFFLL;
    v34 = v98;
    do
    {
      v35 = (const char *)(v25 + v34[v33]);
      if (((v94 >> 1) & 1 | v97 & 1 | a9 || (isUpperCaseX(*(unsigned __int8 *)v35, v20) & 1) == 0) && strlen(v35) == a5)
      {
        if (!a5)
          goto LABEL_29;
        v36 = 0;
        do
        {
          v37 = removeDiacriticsX(a4[v36], v20);
          v38 = removeDiacriticsX(v35[v36++], v20);
        }
        while (v37 == v38 && v36 < a5);
        v34 = v98;
        if (v37 == v38)
        {
LABEL_29:
          v40 = v32++ == 0;
          *a13 = 1;
          v41 = 0x7FFFFFFFFFFFFFFFLL;
          if (v40)
            v41 = v33;
          v100 = v41;
          *a12 = 0;
        }
      }
      ++v33;
    }
    while (v33 < v101 && v32 < 2);
    goto LABEL_97;
  }
  a8 = v94;
  if (!v28)
  {
    v22 = 0;
    v24 = v99;
    LOBYTE(v43) = a10;
LABEL_123:
    if (!a14)
      goto LABEL_36;
    if (*a11)
      goto LABEL_36;
    objc_msgSend(a14, "addCandidateWithString:errorType:", v22, 6);
    if (!(_DWORD)v101)
      goto LABEL_36;
    v84 = 0;
    v85 = (a8 >> 1) & 1 | v97 | a9;
    v96 = v43;
    while (1)
    {
      v86 = (const char *)(*v24 + *(__int16 *)(v24[1] + 2 * v84));
      if ((v85 & 1) == 0 && (isUpperCaseX(*(unsigned __int8 *)v86, v20) & 1) != 0)
        goto LABEL_145;
      v87 = strlen(v86);
      if (!v87)
        goto LABEL_145;
      v88 = effectiveEditDistance((uint64_t)a4, a5, (uint64_t)v86, v87);
      if ((v43 & 1) != 0)
        break;
      if (v88 < 3)
      {
        v92 = 8;
LABEL_144:
        objc_msgSend(a14, "addCandidateWithBuffer:encoding:errorType:", v86, v20, v92, v93);
      }
LABEL_145:
      if (++v84 == v101)
        goto LABEL_36;
    }
    if (strlen(v86) != a5)
      goto LABEL_145;
    if (a5)
    {
      v89 = 0;
      do
      {
        v43 = removeDiacriticsX(a4[v89], v20);
        v90 = removeDiacriticsX(v86[v89++], v20);
      }
      while (v43 == v90 && v89 < a5);
      v40 = v43 == v90;
      v24 = v99;
      LOBYTE(v43) = v96;
      if (!v40)
        goto LABEL_145;
    }
    v92 = 1;
    goto LABEL_144;
  }
  if (v28 == 1)
  {
    v44 = 0;
    v100 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v45 = (const char *)(*v99 + *(__int16 *)(v99[1] + 2 * v44));
      if ((v94 >> 1) & 1 | v97 & 1 | a9 || (isUpperCaseX(*(unsigned __int8 *)v45, v20) & 1) == 0)
      {
        v46 = strlen(v45);
        v47 = effectiveEditDistance((uint64_t)a4, a5, (uint64_t)v45, v46);
        if (v47 >= 2)
        {
          v48 = v47 == 2 && a5 > 6;
          v49 = v100;
          if (v48)
            v49 = v44;
          v100 = v49;
        }
        else
        {
          *a12 = 0;
          v100 = v44;
        }
      }
      ++v44;
    }
    while (v101 != v44);
  }
  else
  {
    v50 = 0;
    v51 = 0;
    v52 = (v94 >> 1) & 1 | v97 | a9;
    v100 = 0x7FFFFFFFFFFFFFFFLL;
    v53 = v98;
    v95 = v52;
    do
    {
      v54 = (const char *)(v25 + v53[v51]);
      if (((v52 & 1) != 0 || (isUpperCaseX(*(unsigned __int8 *)v54, v20) & 1) == 0) && strlen(v54) == a5)
      {
        if (!a5)
          goto LABEL_69;
        v55 = 0;
        do
        {
          v56 = removeDiacriticsX(a4[v55], v20);
          v52 = toLowerX(v56, v20);
          v57 = removeDiacriticsX(v54[v55], v20);
          v58 = toLowerX(v57, v20);
          ++v55;
        }
        while (v52 == v58 && v55 < a5);
        v40 = v52 == v58;
        v53 = v98;
        LOBYTE(v52) = v95;
        if (v40)
        {
LABEL_69:
          v40 = v50++ == 0;
          *a13 = 1;
          v60 = 0x7FFFFFFFFFFFFFFFLL;
          if (v40)
            v60 = v51;
          v100 = v60;
          *a12 = 0;
        }
      }
      ++v51;
    }
    while (v51 < v101 && v50 < 2);
    if (v100 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v61 = 0;
      v62 = 0;
      v100 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v63 = (const char *)(*v99 + *(__int16 *)(v99[1] + 2 * v62));
        if (((v95 & 1) != 0 || (isUpperCaseX(*(unsigned __int8 *)v63, v20) & 1) == 0) && strlen(v63) == a5)
        {
          v64 = v101;
          if (!a5)
            goto LABEL_90;
          v65 = 0;
          v66 = 0;
          do
          {
            v67 = a4[v66];
            v68 = v63[v66];
            v69 = v67 == v68;
            if (v67 != v68 && !v65)
            {
              v69 = adjacentMatch(a4[v66], v68, v20);
              v65 = v69;
            }
            ++v66;
          }
          while (v69 && v66 < a5);
          if (v69)
          {
LABEL_90:
            v40 = v61++ == 0;
            if (v40)
              v71 = v62;
            else
              v71 = 0x7FFFFFFFFFFFFFFFLL;
            v100 = v71;
            *a12 = 0;
          }
        }
        else
        {
          v64 = v101;
        }
        ++v62;
      }
      while (v62 < v64 && v61 < 2);
    }
  }
LABEL_97:
  v22 = 0;
  if (v100 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v24 = v99;
    v43 = a10;
    a8 = v94;
  }
  else
  {
    v24 = v99;
    v43 = a10;
    a8 = v94;
    if (v100 < v101)
    {
      v72 = (const char *)(*v99 + *(__int16 *)(v99[1] + 2 * v100));
      v73 = strlen(v72);
      if (a5)
      {
        v74 = 0;
        do
        {
          v75 = a4[v74];
          v76 = removeDiacriticsX(a4[v74++], v20);
        }
        while (v76 == v75 && v74 < a5);
        v78 = v76 == v75;
      }
      else
      {
        v78 = 1;
      }
      if (v73)
      {
        v79 = 0;
        do
        {
          v80 = v72[v79];
          v81 = removeDiacriticsX(v72[v79], v20);
          v82 = v81 != v80;
          ++v79;
        }
        while (v81 == v80 && v79 < v73);
        v43 = a10;
      }
      else
      {
        v82 = 0;
      }
      if (v82 || v78)
        v22 = (id)CFStringCreateWithCString(0, v72, v20);
      else
        v22 = 0;
    }
  }
  if (!v43)
    goto LABEL_123;
LABEL_122:
  if (*a13)
    goto LABEL_123;
LABEL_36:
  PRword((uint64_t)&v105, 17, 0);
  return (id)v22;
}

- (id)_spaceInsertionCorrectionForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 connection:(_PR_DB_IO *)a7 flags:(unint64_t)a8 isCapitalized:(BOOL)a9 typologyCorrection:(id)a10
{
  unsigned __int8 v10;
  id v11;
  CFStringEncoding v15;
  char *v16;
  uint64_t v17;
  const char *v18;
  BOOL v19;
  char v20;
  char *v21;
  char *p_cStr;
  int v23;
  char *v24;
  int64_t v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  _BYTE *v31;
  int v32;
  unint64_t v33;
  char *v34;
  BOOL v35;
  uint64_t v36;
  int64_t v37;
  char *v38;
  AppleSpell *v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  const char *v44;
  char *v45;
  int v46;
  unint64_t v47;
  char *v48;
  BOOL v49;
  unsigned int v50;
  unsigned int v51;
  unint64_t v52;
  BOOL v53;
  int v54;
  BOOL v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  int v59;
  int v60;
  size_t v61;
  char v62;
  size_t i;
  unsigned int v64;
  unsigned int v65;
  unint64_t v66;
  int v67;
  BOOL v68;
  uint64_t v69;
  unsigned int v70;
  unsigned int v71;
  unint64_t v72;
  _BOOL4 v74;
  id result;
  char v77;
  unsigned __int8 *v78;
  char *v79;
  CFStringEncoding v80;
  int v81;
  char *v82;
  uint64_t v84;
  char *v85;
  CFStringEncoding encoding;
  unint64_t v87;
  const char *v88;
  char *v89;
  unint64_t v90;
  unsigned __int8 v91;
  char v92;
  char *__s;
  char *__sa;
  unsigned int v95;
  int64_t v96;
  id v97;
  char *v98;
  AppleSpell *v99;
  _PR_DB_IO *v100;
  char cStr;
  _BYTE v102[255];
  uint64_t v103;

  v10 = a8;
  v100 = a7;
  v11 = a6;
  v103 = *MEMORY[0x1E0C80C00];
  v15 = objc_msgSend(a6, "encoding", a3);
  v16 = (char *)objc_msgSend(v11, "oneLetterWords");
  v17 = objc_msgSend(v11, "twoLetterWords");
  if (a5 - 3 > 0x14)
    return 0;
  v18 = (const char *)v17;
  v99 = self;
  v19 = a9;
  v20 = *a4;
  v97 = v11;
  encoding = v15;
  v85 = a4;
  v91 = v10;
  if (*a4)
  {
    v21 = a4 + 1;
    p_cStr = &cStr;
    do
    {
      *p_cStr++ = v20;
      v23 = *v21++;
      v20 = v23;
    }
    while (v23);
    *p_cStr = 0;
    v24 = &v102[a5 - 1];
    v25 = a5 - 1;
    v26 = &cStr + a5 - 1;
    if ((uint64_t)a5 < 3)
    {
      v96 = 0x7FFFFFFFFFFFFFFFLL;
      if ((a5 & 0x8000000000000000) != 0)
        return 0;
      goto LABEL_29;
    }
    v87 = a5 - 1;
    v88 = (const char *)v17;
    v89 = &v102[a5 - 1];
    v27 = a5;
    __s = v16;
    v19 = a9;
  }
  else
  {
    v88 = (const char *)v17;
    __s = v16;
    cStr = 0;
    v89 = &v102[a5 - 1];
    v27 = a5;
    v87 = a5 - 1;
    v26 = &cStr + a5 - 1;
  }
  v28 = 0;
  v29 = 0;
  v30 = &v26[~(unint64_t)&cStr];
  v95 = (v10 | v19) & 1;
  v96 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v31 = &v102[v28 - 1];
    v32 = v102[v28];
    if (v32 == 59 || v32 == 44)
    {
      v33 = v29;
      v34 = v26;
      v31[1] = 45;
      BYTE4(v84) = 0;
      LODWORD(v84) = 65793;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &cStr, v27, v97, v100, 0, 1, v84, 0)&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:](self, "checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:", &cStr, v28 + 1, v97, v95))
      {
        v35 = -[AppleSpell checkNegativeWordBuffer:length:languageObject:](self, "checkNegativeWordBuffer:length:languageObject:", &v102[v28 + 1], v30, v97);
        v36 = v28 + 2;
        if (v33)
          v36 = 0x7FFFFFFFFFFFFFFFLL;
        v37 = v96;
        if (!v35)
          v37 = v36;
        v96 = v37;
        if (v35)
          v29 = v33;
        else
          v29 = v33 + 1;
        v26 = v34;
      }
      else
      {
        v26 = v34;
        v29 = v33;
      }
      v31[1] = v32;
    }
    if (&v102[v28 + 1] >= v26)
      break;
    ++v28;
    --v30;
  }
  while (v29 < 2);
  v16 = __s;
  a5 = v27;
  v24 = v89;
  v11 = v97;
  v18 = v88;
  v25 = v87;
  if (!v29)
  {
    if ((a5 & 0x8000000000000000) != 0)
      return 0;
LABEL_29:
    v38 = v24;
    do
    {
      v38[1] = *v38;
      --v38;
    }
    while (&cStr <= v38);
    v39 = self;
    if ((uint64_t)a5 < 2)
      return 0;
    v29 = 0;
    v40 = a5;
    v41 = v102;
    v90 = v40;
    __sa = (char *)(v40 + 1);
    v92 = v91 | a9;
    v42 = 1;
    v98 = v26;
    while (1)
    {
      *v41 = 45;
      if (v42 != 1 && v41 != v26)
        goto LABEL_35;
      v44 = v18;
      v45 = v41 - 1;
      if (v42 != 1)
        v45 = v41 + 1;
      v46 = *v45;
      if ((v46 - 48) >= 0xA)
      {
        if (!v16)
          goto LABEL_63;
        v47 = v29;
        v48 = strchr(v16, v46);
        v29 = v47;
        v26 = v98;
        v39 = v99;
        if (!v48)
          goto LABEL_63;
      }
      if (v42 == 1)
      {
        v49 = v46 == 97 && v16 == englishOneLetterWords[0];
        if (v49)
        {
          v50 = v41[1];
          HIDWORD(v52) = v50 - 65;
          LODWORD(v52) = v50 - 65;
          v51 = v52 >> 1;
          v53 = v51 > 0x1C;
          v54 = (1 << v51) & 0x14951495;
          v55 = v53 || v54 == 0;
          if (!v55
            || vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1DE2EC910, (uint32x4_t)vaddq_s32(vdupq_n_s32(v50), (int32x4_t)xmmword_1DE2EC900)))) & 1 | (v50 - 248 < 6) | ((v50 & 0xD8) == 200 || v50 == 255))
          {
LABEL_63:
            v18 = v44;
            goto LABEL_120;
          }
        }
      }
      if (v16 == frenchOneLetterWords)
      {
        if (v42 == 1 && v46 == 108)
        {
LABEL_105:
          v70 = v41[1];
          HIDWORD(v72) = v70 - 65;
          LODWORD(v72) = v70 - 65;
          v71 = v72 >> 1;
          if ((v71 > 0x1C || ((1 << v71) & 0x14951495) == 0)
            && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1DE2EC910, (uint32x4_t)vaddq_s32(vdupq_n_s32(v70), (int32x4_t)xmmword_1DE2EC900)))) & 1) == 0&& v70 - 248 >= 6&& v70 != 255&& v70 != 104&& (v70 & 0xD8) != 0xC8)
          {
            goto LABEL_63;
          }
        }
      }
      else if (v42 == 1 && v46 == 108 && v16 == (char *)italianOneLetterWords)
      {
        goto LABEL_105;
      }
      v74 = v16 == frenchOneLetterWords || v16 == (char *)italianOneLetterWords;
      v49 = v46 == 108;
      v18 = v44;
      if (v49 && v74 && v41 == v26)
        goto LABEL_120;
LABEL_35:
      if (v42 == 2 || v41 == v24 - 2)
      {
        v56 = -2;
        if (v42 != 2)
          v56 = 1;
        v57 = 2;
        if (v42 == 2)
          v57 = -1;
        if (!v18)
          goto LABEL_120;
        v58 = v29;
        v59 = v41[v56];
        v60 = v41[v57];
        v61 = strlen(v18);
        if (!v61)
        {
          v26 = v98;
          v29 = v58;
LABEL_96:
          v39 = v99;
          goto LABEL_120;
        }
        v62 = 0;
        for (i = 0; i < v61; i += 2)
        {
          if (v18[i] == v59 && v18[i + 1] == v60)
            v62 = 1;
          if ((v62 & 1) != 0)
            break;
        }
        v26 = v98;
        v29 = v58;
        if ((v62 & 1) == 0)
          goto LABEL_96;
        v39 = v99;
        if (v42 == 2 && v18 == englishTwoLetterWords[0] && v59 == 97 && v60 == 110)
        {
          v64 = v41[1];
          HIDWORD(v66) = v64 - 65;
          LODWORD(v66) = v64 - 65;
          v65 = v66 >> 1;
          v53 = v65 > 0x1C;
          v67 = (1 << v65) & 0x14951495;
          v68 = v53 || v67 == 0;
          if (v68
            && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1DE2EC910, (uint32x4_t)vaddq_s32(vdupq_n_s32(v64), (int32x4_t)xmmword_1DE2EC900)))) & 1) == 0&& v64 - 248 >= 6&& v64 != 255&& v64 != 104&& (v64 & 0xD8) != 0xC8)
          {
            goto LABEL_120;
          }
        }
      }
      v43 = v29;
      BYTE4(v84) = 0;
      LODWORD(v84) = 1;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v39, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &cStr, __sa, v11, v100, 0, 1, v84, 0)&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:](v39, "checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:", &cStr, v42, v11, v92 & 1)&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:](
              v39,
              "checkNegativeWordBuffer:length:languageObject:",
              v41 + 1,
              v24 - v41,
              v11)
        || v42 == 1
        && (BYTE4(v84) = 0,
            LODWORD(v84) = 1,
            -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v39, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &v102[1], v25, v11, v100, 0, 1, v84, 0))&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:](v39, "checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:", &v102[1], v25, v11, v92 & 1))
      {
LABEL_92:
        v29 = v43 + 1;
        v69 = 0x7FFFFFFFFFFFFFFFLL;
        if (!v43)
          v69 = v42;
        v96 = v69;
        v26 = v98;
        v39 = v99;
        goto LABEL_120;
      }
      v26 = v98;
      if (v41 == v98)
      {
        BYTE4(v84) = 0;
        LODWORD(v84) = 1;
        if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v39, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &cStr, v25, v11, v100, 0, 1, v84, 0)&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:](v39, "checkNegativeWordBuffer:length:languageObject:", &cStr, v25, v11))
        {
          goto LABEL_92;
        }
        v26 = v98;
      }
      v29 = v43;
LABEL_120:
      *v41 = v41[1];
      if (v42 < v25)
      {
        v41 = &v102[v42++];
        if (v29 < 2)
          continue;
      }
      a5 = v90;
      break;
    }
  }
  result = 0;
  if (v29 && v96 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5 == 4 && v96 == 2)
      return 0;
    v77 = *v85;
    if (*v85)
    {
      v78 = (unsigned __int8 *)(v85 + 1);
      v79 = &cStr;
      v80 = encoding;
      do
      {
        *v79++ = v77;
        v81 = *v78++;
        v77 = v81;
      }
      while (v81);
    }
    else
    {
      v79 = &cStr;
      v80 = encoding;
    }
    *v79 = 0;
    v82 = &v102[v96 - 1];
    if (v96 <= (uint64_t)a5)
    {
      do
      {
        v24[1] = *v24;
        --v24;
      }
      while (v82 <= v24);
    }
    v102[v96 - 1] = 32;
    if (v96 == 1 && cStr == 108 && (v16 == frenchOneLetterWords || v16 == (char *)italianOneLetterWords))
      *v82 = 39;
    return (id)(id)CFStringCreateWithCString(0, &cStr, v80);
  }
  return result;
}

- (BOOL)_prohibitCorrectionForLanguageObject:(id)a3 lastKeyboardLanguageObject:(id)a4
{
  BOOL result;
  uint64_t v7;

  result = 0;
  if (a3 && a4)
    result = (objc_msgSend((id)objc_msgSend(a3, "identifier"), "isEqualToString:", objc_msgSend(a4, "identifier")) & 1) == 0
          && (v7 = objc_msgSend(a3, "orthographyIndex"), v7 != objc_msgSend(a4, "orthographyIndex"))
          && (objc_msgSend(a3, "usesArabicScript") && (objc_msgSend(a4, "usesArabicScript") & 1) != 0
           || objc_msgSend(a3, "usesCyrillicScript") && (objc_msgSend(a4, "usesCyrillicScript") & 1) != 0
           || objc_msgSend(a3, "usesDevanagariScript")
           && (objc_msgSend(a4, "usesDevanagariScript") & 1) != 0
           || objc_msgSend(a4, "isVietnamese") && !objc_msgSend(a3, "isVietnamese"));
  return result;
}

- (BOOL)_permitCorrection:(id)a3 languageObject:(id)a4 flags:(unint64_t)a5 isCapitalized:(BOOL)a6 typologyCorrection:(id)a7
{
  unsigned __int8 v7;
  CFIndex v11;
  CFStringEncoding v12;
  int v13;
  int v14;
  int v15;
  int v16;
  BOOL result;
  CFIndex usedBufLen;
  UInt8 buffer[256];
  uint64_t v21;
  CFRange v22;

  v7 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(a3, "length");
  v12 = objc_msgSend(a4, "encoding");
  v13 = objc_msgSend(a4, "isSwedish");
  v14 = objc_msgSend(a4, "isDanish");
  v15 = objc_msgSend(a4, "isNorwegian");
  v16 = objc_msgSend(a4, "isTurkish");
  result = 1;
  if (a3 && v11)
  {
    usedBufLen = 0;
    v22.location = 0;
    v22.length = v11;
    if (v11 != CFStringGetBytes((CFStringRef)a3, v22, v12, 0, 0, buffer, 254, &usedBufLen))
      return 1;
    if (-[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", buffer, usedBufLen, a4, 1)|| -[AppleSpell checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:](self, "checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:", buffer, usedBufLen, a4, (v7 | a6) & 1))
    {
      return 0;
    }
    return (v13 | v14 | v15 | v16) != 1
        || -[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](self, "checkNameWordBuffer:length:languageObject:globalOnly:", buffer, usedBufLen, a4, 0)|| -[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", buffer, usedBufLen, a4, 0)|| -[AppleSpell validateWord:inLexiconForLanguageObject:](self, "validateWord:inLexiconForLanguageObject:", a3, a4);
  }
  return result;
}

- (id)_correctionResultForWord:(id)a3 replacementRange:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 languageObject:(id)a7 capitalize:(BOOL)a8 isCapitalized:(BOOL)a9 isSecondCapitalized:(BOOL)a10 hasCurlyApostrophe:(BOOL)a11 appendCorrectionLanguage:(BOOL)a12 capitalizationLocale:(id)a13 proposedCorrection:(id)a14
{
  NSUInteger length;
  NSUInteger location;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  uint64_t v24;
  id result;
  int v26;
  unint64_t v27;
  unsigned int v28;
  BOOL v29;
  unint64_t v30;
  unsigned int v31;
  int v32;
  void *v33;
  BOOL v34;
  NSUInteger v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  NSUInteger v39;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  _BOOL4 v48;
  unint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  unint64_t v53;
  id v54;
  NSUInteger v55;
  unint64_t v56;
  id v57;
  __int16 v58;

  length = a4.length;
  location = a4.location;
  v20 = a14;
  v21 = objc_msgSend(a14, "length");
  v22 = objc_msgSend(a3, "length");
  v23 = objc_msgSend(a7, "encoding");
  v58 = 8217;
  v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v58, 1);
  result = 0;
  if (!a14 || !v21)
    return result;
  v52 = v24;
  v53 = a6;
  v54 = a5;
  v57 = a7;
  v26 = a9;
  if (a9)
  {
    v26 = a9;
    if (v22 >= 2)
    {
      v27 = 2;
      do
      {
        v28 = objc_msgSend(a3, "characterAtIndex:", v27 - 1);
        if (isAnyAlphaX(v28, v23))
        {
          v26 = isUpperCaseX(v28, v23);
          if (!v26)
            break;
        }
        else
        {
          v26 = 1;
        }
        v29 = v27++ >= v22;
      }
      while (!v29);
    }
  }
  v55 = location;
  v56 = length;
  v30 = 1;
  do
  {
    v31 = objc_msgSend(a14, "characterAtIndex:", v30 - 1);
    if (isAnyAlphaX(v31, v23))
    {
      v32 = isUpperCaseX(v31, v23);
      if (!v32)
        break;
    }
    else
    {
      LOBYTE(v32) = 1;
    }
    v29 = v30++ >= v21;
  }
  while (!v29);
  if (v26)
  {
    if ((v32 & 1) == 0)
    {
      if (v22 < 5)
        v20 = 0;
      else
        v20 = (void *)uppercasedString(a14, (uint64_t)a13);
    }
    v35 = v55;
    v33 = v57;
    v34 = a9;
    goto LABEL_34;
  }
  v33 = v57;
  v34 = a9;
  if (!a9)
  {
    if (!a10
      || (v36 = toLowerX(objc_msgSend(a14, "characterAtIndex:", 0), v23),
          v36 != toLowerX(objc_msgSend(a3, "characterAtIndex:", 1), v23)))
    {
LABEL_31:
      v35 = v55;
      goto LABEL_34;
    }
  }
  if (v21 < 2)
  {
    v20 = (void *)objc_msgSend(a14, "capitalizedStringWithLocale:", a13);
    goto LABEL_31;
  }
  v35 = v55;
  if ((isUpperCaseX(objc_msgSend(a14, "characterAtIndex:", 1), v23) & 1) == 0)
    v20 = (void *)initialCapitalizedString(a14, (uint64_t)a13);
LABEL_34:
  if (a11)
  {
    objc_msgSend(v20, "rangeOfString:", CFSTR("'"));
    if (v37)
      v20 = (void *)objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), v52);
  }
  if (!v20)
    return 0;
  v38 = objc_msgSend(v20, "length");
  if (v38 != length + 1 || (v39 = v38, v40 = v35 + length, v35 + length >= objc_msgSend(v54, "length")))
  {
    if (objc_msgSend(v20, "length") == length + 2)
    {
      v49 = objc_msgSend(v54, "length");
      if (length)
      {
        if (v35 + length < v49 && objc_msgSend(v20, "characterAtIndex:", length) == 39)
        {
          objc_msgSend(v54, "rangeOfString:options:range:", objc_msgSend(v20, "substringToIndex:", length), 9, v35, length);
          if (v50)
          {
            v51 = objc_msgSend(v54, "characterAtIndex:", v35 + length);
            v48 = a8;
            if (v51 == 8217 || v51 == 39)
              ++length;
            goto LABEL_65;
          }
        }
      }
    }
    goto LABEL_64;
  }
  v41 = length - 2;
  if (length >= 2)
  {
    v42 = length - 1;
    if (objc_msgSend(v20, "characterAtIndex:", v42) == 39)
    {
      objc_msgSend(v54, "rangeOfString:options:range:", objc_msgSend(v20, "substringToIndex:", v42), 9, v35, v42);
      if (v43)
      {
        objc_msgSend(v54, "rangeOfString:options:range:", objc_msgSend(v20, "substringFromIndex:", v56), 9, v40 - 1, 1);
        if (v44)
          goto LABEL_48;
      }
    }
    if (v56 < 3)
    {
      length = 2;
    }
    else
    {
      if (objc_msgSend(v20, "characterAtIndex:", v41) == 39)
      {
        objc_msgSend(v54, "rangeOfString:options:range:", objc_msgSend(v20, "substringToIndex:", v41), 9, v35, v41);
        if (v45)
        {
          objc_msgSend(v54, "rangeOfString:options:range:", objc_msgSend(v20, "substringFromIndex:", v42), 9, v40 - 2, 2);
          if (v46)
          {
LABEL_48:
            v47 = objc_msgSend(v54, "characterAtIndex:", v40);
            if (v47 != 8217)
            {
              length = v56;
              v33 = v57;
              v48 = a8;
              if (v47 == 39)
                length = v39;
              goto LABEL_65;
            }
            length = v39;
            goto LABEL_63;
          }
        }
      }
      length = v56;
    }
  }
LABEL_63:
  v33 = v57;
LABEL_64:
  v48 = a8;
LABEL_65:
  if (v48)
    v20 = (void *)initialCapitalizedString(v20, 0);
  if (a12 && !v34)
    v20 = (void *)objc_msgSend(v20, "stringByAppendingFormat:", CFSTR("/%@"), objc_msgSend(v33, "identifier"));
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3548]), "initWithRange:replacementString:", v35 + v53, length, v20);
}

- (id)_correctionResultForString:(id)a3 range:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 tagger:(id)a7 appIdentifier:(id)a8 dictionary:(id)a9 languages:(id)a10 connection:(_PR_DB_IO *)a11 flags:(unint64_t)a12 keyEventArray:(id)a13 selectedRangeValue:(id)a14 parameterBundles:(id)a15 previousLetter:(unsigned __int16)a16 nextLetter:(unsigned __int16)a17 extraMisspellingCount:(unint64_t)a18 extraCorrectionCount:(unint64_t *)a19
{
  __CFString *v20;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  int v26;
  id v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  _PR_DB_IO *v35;
  uint64_t v36;
  uint64_t v37;
  __CFString *v38;
  int v39;
  __CFString *v40;
  int v41;
  void *v42;
  char v43;
  char v44;
  int v45;
  const __CFString *v46;
  int v47;
  _QWORD *v48;
  CFIndex v49;
  _BOOL4 v50;
  int v51;
  __CFString *v52;
  CFIndex v53;
  _BOOL4 v54;
  _BOOL4 v55;
  PRCandidateList *v56;
  int v57;
  uint64_t v58;
  BOOL v59;
  _PR_DB_IO *v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  void *v64;
  uint64_t v65;
  NSUInteger v66;
  char v67;
  double *v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  CFIndex v72;
  __CFString *v73;
  id v74;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unsigned int v81;
  unsigned __int8 v83;
  int v84;
  unint64_t v85;
  int v86;
  unsigned int v87;
  int v88;
  uint64_t v89;
  double v90;
  UInt8 v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t i;
  int v97;
  id v98;
  void *v99;
  uint64_t v100;
  CFIndex *usedBufLen;
  _PR_DB_IO *v102;
  int v103;
  int v104;
  int v105;
  int v106;
  unint64_t v107;
  int v108;
  CFIndex v109;
  uint64_t v110;
  PRCandidateList *v111;
  unsigned int v112;
  id obj;
  CFStringEncoding encoding;
  unint64_t range;
  int v116;
  uint64_t v117;
  void *v118;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  id v126;
  AppleSpell *v127;
  unsigned int v128;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint64_t v134;
  double v135;
  char v136;
  char v137;
  BOOL v138;
  CFIndex v139;
  CFIndex v140;
  __int16 v141;
  __int16 v142;
  UInt8 v143[128];
  UInt8 v144[256];
  UInt8 buffer[256];
  uint64_t v146;
  CFRange v147;
  CFRange v148;
  CFRange v149;

  v20 = (__CFString *)a3;
  v146 = *MEMORY[0x1E0C80C00];
  v142 = 8217;
  v141 = 0;
  v118 = (void *)objc_msgSend(a3, "lowercaseString");
  v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v142, 1);
  v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v141, 1);
  v24 = -[__CFString length](v20, "length");
  v139 = 0;
  v140 = 0;
  v25 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", objc_msgSend(a10, "firstObject"));
  v26 = objc_msgSend(v25, "encoding");
  v27 = -[AppleSpell capitalizationDictionaryArrayForLanguageObject:](self, "capitalizationDictionaryArrayForLanguageObject:", v25);
  v28 = isUpperCaseX(-[__CFString characterAtIndex:](v20, "characterAtIndex:", 0), v26);
  v29 = 0;
  if (!v28 && v24 >= 2)
    v29 = isUpperCaseX(-[__CFString characterAtIndex:](v20, "characterAtIndex:", 1), v26);
  v121 = v29;
  if (v24 > 1)
    v30 = v28;
  else
    v30 = 0;
  v128 = v28;
  encoding = v26;
  if (v30 == 1)
    v31 = isUpperCaseX(-[__CFString characterAtIndex:](v20, "characterAtIndex:", 1), v26);
  else
    v31 = 0;
  range = v24;
  v138 = v24 > 3;
  v137 = 0;
  v136 = 0;
  v104 = objc_msgSend(v25, "isEnglish");
  objc_msgSend(v25, "isFrench");
  v112 = objc_msgSend(v25, "isGerman");
  objc_msgSend(v25, "isSpanish");
  objc_msgSend(v25, "isItalian");
  objc_msgSend(v25, "isPortuguese");
  v108 = objc_msgSend(v25, "isDanish");
  v106 = objc_msgSend(v25, "isNorwegian");
  v105 = objc_msgSend(v25, "isNynorsk");
  v32 = objc_msgSend(v25, "isTurkish");
  v116 = objc_msgSend(v25, "isKorean");
  v103 = objc_msgSend((id)objc_msgSend(v25, "identifier"), "isEqualToString:", CFSTR("en_JP"));
  v125 = objc_msgSend(v25, "isArabic");
  v124 = objc_msgSend(v25, "isHindi");
  v123 = objc_msgSend(v25, "isTelugu");
  v122 = objc_msgSend(v25, "isPunjabi");
  obj = v27;
  v111 = -[PRCandidateList initWithMaxCount:defaultReplacementRange:customErrorModel:capitalizationDictionaryArray:]([PRCandidateList alloc], "initWithMaxCount:defaultReplacementRange:customErrorModel:capitalizationDictionaryArray:", 32, a4.location, a4.length, 0, v27);
  v134 = 0;
  v135 = 0.0;
  -[AppleSpell getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:](self, "getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:", &v135, CFSTR("CapitalizedWordThreshold"), v25, a7, a8, a15, -7.0);
  v127 = self;
  -[AppleSpell getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:](self, "getParameterValue:forName:languageObject:tagger:appIdentifier:parameterBundles:defaultValue:", &v134, CFSTR("CapitalizedWordSingleThreshold"), v25, a7, a8, a15, v135 + -2.0);
  v126 = a7;
  if ((_correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__readMinAutocorrectionLengthDefault & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSSpellCheckerMinAutocorrectionLength")))
    {
      _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__minAutocorrectionLength = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", CFSTR("NSSpellCheckerMinAutocorrectionLength"));
    }
    _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__readMinAutocorrectionLengthDefault = 1;
  }
  if (v32)
  {
    v33 = _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__turkishLocale;
    if (!_correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__turkishLocale)
    {
      v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("tr"));
      _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__turkishLocale = v33;
    }
  }
  else
  {
    v33 = 0;
  }
  if ((v125 | v124 | v123 | v122) == 1)
  {
    v31 = 0;
    v121 = 0;
    v128 = 0;
  }
  -[__CFString rangeOfString:](v20, "rangeOfString:", v23);
  if (v34)
    v20 = (__CFString *)-[__CFString stringByReplacingOccurrencesOfString:withString:](v20, "stringByReplacingOccurrencesOfString:withString:", v23, CFSTR("_"));
  v35 = a11;
  -[__CFString rangeOfString:](v20, "rangeOfString:", v22);
  v37 = v36;
  if (v36)
    v20 = (__CFString *)-[__CFString stringByReplacingOccurrencesOfString:withString:](v20, "stringByReplacingOccurrencesOfString:withString:", v22, CFSTR("'"));
  v38 = -[AppleSpell _initialCorrectionForString:lowercaseString:isFirstSecondCapitalized:dictionary:languageObject:connection:](self, "_initialCorrectionForString:lowercaseString:isFirstSecondCapitalized:dictionary:languageObject:connection:", v20, v118, v31, a9, v25, a11);
  if (v38)
    v39 = 0;
  else
    v39 = v31;
  v110 = v37;
  if (v39 != 1)
  {
    v40 = v38;
    goto LABEL_32;
  }
  if (range >= _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__minAutocorrectionLength
    && (isUpperCaseX(-[__CFString characterAtIndex:](v20, "characterAtIndex:", 2), encoding) & 1) == 0)
  {
    v40 = (__CFString *)a11;
    v52 = (__CFString *)initialCapitalizedString(v118, v33);
    v53 = -[__CFString length](v52, "length");
    if (a11)
    {
      v148.location = 0;
      v148.length = v53;
      if (v53 == CFStringGetBytes(v52, v148, encoding, 0, 0, buffer, 254, &v140))
      {
        BYTE4(usedBufLen) = 0;
        LODWORD(usedBufLen) = 65793;
        v54 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, v140, v25, a11, 0, 1, usedBufLen, 0);
        v41 = !v54;
        if (v54)
          v40 = v52;
        else
          v40 = 0;
        goto LABEL_62;
      }
      v40 = 0;
    }
    v41 = 1;
LABEL_62:
    v35 = a11;
    goto LABEL_33;
  }
  v40 = 0;
LABEL_32:
  v41 = 1;
LABEL_33:
  if (v116)
    return -[AppleSpell _correctionResultForKoreanString:range:inString:offset:tagger:appIdentifier:dictionary:keyEventArray:](self, "_correctionResultForKoreanString:range:inString:offset:tagger:appIdentifier:dictionary:keyEventArray:", v20, a4.location, a4.length, a5, a6, v126, a8, a9, a13);
  v43 = v128 ^ 1;
  if (v40)
    v43 = 1;
  v44 = v43 | v112;
  if (v40)
    v45 = 0;
  else
    v45 = v41;
  if ((v44 & 1) != 0)
  {
    v41 = v45;
  }
  else
  {
    if (v126 && objc_msgSend(v126, "orthoIndex"))
      objc_msgSend(v126, "sentenceRangeForRange:", a4.location, a4.length);
    v138 = 0;
  }
  v46 = 0;
  v47 = 0;
  v117 = v33;
  if (!v41)
  {
    v51 = 0;
    v48 = &unk_1F043C000;
    goto LABEL_71;
  }
  v48 = &unk_1F043C000;
  if (range < _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__minAutocorrectionLength)
    goto LABEL_70;
  v102 = v35;
  v147.location = 0;
  v147.length = range;
  if (range != CFStringGetBytes(v20, v147, encoding, 0, 0, buffer, 254, &v140)
    || (v49 = v140, buffer[v140] = 0, !v49))
  {
    v47 = 0;
    v51 = 0;
    v46 = 0;
    goto LABEL_53;
  }
  if ((v112 | v108 | v106 | v105) == 1)
  {
    v40 = -[AppleSpell _umlautCorrectionForWord:buffer:length:languageObject:connection:typologyCorrection:](self, "_umlautCorrectionForWord:buffer:length:languageObject:connection:typologyCorrection:", v20, buffer);
    v50 = v40 == 0;
  }
  else
  {
    v50 = 1;
  }
  v46 = 0;
  v47 = 0;
  if (!a9 || !v50)
  {
LABEL_70:
    v51 = 0;
    goto LABEL_71;
  }
  if (objc_msgSend(v25, "isSupportedAssetLexiconLanguage")
    && !-[AppleSpell loadedLexiconsCountForLanguageObject:](self, "loadedLexiconsCountForLanguageObject:", v25)
    || -[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", buffer, v140, v25, 4))
  {
    v47 = 0;
    v51 = 0;
    v46 = 0;
    goto LABEL_71;
  }
  v76 = v140;
  if (!v140)
  {
LABEL_154:
    v85 = v76;
    v51 = 0;
    if ((v104 & 1) != 0)
    {
      v87 = v128;
      v88 = v121;
      v86 = encoding;
      v48 = (_QWORD *)&unk_1F043C000;
    }
    else
    {
      v86 = encoding;
      v87 = v128;
      v88 = v121;
      v48 = (_QWORD *)&unk_1F043C000;
      if (encoding == 1280 && range >= 4)
      {
        if (-[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", buffer, v85, +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("en_US")), 0))
        {
          v138 = 0;
          v51 = 1;
        }
        else
        {
          v51 = 0;
        }
      }
    }
    if (((v87 | v88) & 1) != 0)
    {
      v46 = 0;
      v35 = v102;
    }
    else
    {
      v91 = buffer[0];
      buffer[0] = toUpperX(buffer[0], v86);
      BYTE4(usedBufLen) = 0;
      LODWORD(usedBufLen) = 65793;
      v35 = v102;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, v140, v25, v102, 0, 1, usedBufLen, 0))
      {
        if (((a12 >> 1) & 1 | v112) == 1)
          v46 = (id)CFStringCreateWithCString(0, (const char *)buffer, encoding);
        else
          v46 = 0;
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v143, 16);
        if (v92)
        {
          v93 = v92;
          v94 = 0;
          v95 = *(_QWORD *)v131;
          do
          {
            for (i = 0; i != v93; ++i)
            {
              if (*(_QWORD *)v131 != v95)
                objc_enumerationMutation(obj);
              v94 |= objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * i), "objectForKey:", v20) != 0;
            }
            v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v143, 16);
          }
          while (v93);
        }
        else
        {
          v94 = 0;
        }
        if ((v94 & 1) != 0 || range >= 4)
        {
          v138 = 0;
          v51 = 1;
        }
        self = v127;
        v88 = v121;
        v35 = v102;
        v48 = (_QWORD *)&unk_1F043C000;
      }
      else
      {
        v46 = 0;
      }
      buffer[0] = v91;
    }
    v97 = v128 & (v88 ^ 1);
    v47 = 1;
    if (v97 != 1 || range < 4)
      goto LABEL_71;
    v98 = -[AppleSpell nerTaggerWaitForResult:](self, "nerTaggerWaitForResult:", 0);
    v99 = v98;
    if (_correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__onceToken != -1)
    {
      dispatch_once(&_correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__onceToken, &__block_literal_global_125);
      if (!v99)
        goto LABEL_53;
      goto LABEL_197;
    }
    if (v98)
    {
LABEL_197:
      objc_msgSend(v99, "setString:", v20);
      objc_msgSend(v99, "setLanguage:range:", objc_msgSend(v25, "localization"), 0, -[__CFString length](v20, "length"));
      v100 = objc_msgSend(v99, "tagAtIndex:unit:scheme:tokenRange:", 0, 0, *MEMORY[0x1E0CCE0C8], 0);
      v47 = objc_msgSend((id)_correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__nerTags, "containsObject:", v100) ^ 1;
      objc_msgSend(v99, "setString:", &stru_1EA8D8440);
    }
LABEL_53:
    v35 = v102;
    goto LABEL_71;
  }
  v77 = 0;
  v78 = 0;
  v79 = 0;
  v80 = 0;
  v107 = _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__minAutocorrectionLength;
  v109 = v140 - 1;
  while (1)
  {
    v81 = buffer[v80];
    if (v81 > 0x2F || ((1 << v81) & 0xA00100000000) == 0)
    {
      v83 = isUpperCaseX(v81, encoding);
      v84 = 0;
      if (!v80)
      {
LABEL_141:
        v77 = 0;
        goto LABEL_142;
      }
    }
    else
    {
      v83 = isUpperCaseX(v81, encoding);
      ++v79;
      v84 = 1;
      if (!v80)
        goto LABEL_141;
    }
    if (v81 == buffer[v80 - 1])
      ++v77;
    else
      v77 = 0;
LABEL_142:
    if (v81 == 46 || v81 - 48 < 0xA || v81 == 64 || v81 == 95)
    {
      v47 = 0;
      v51 = 0;
      v46 = 0;
      v35 = v102;
      goto LABEL_169;
    }
    v78 += ((v83 ^ 1 | v125 | (v124 | v123 | v122)) & 1) == 0;
    v35 = v102;
    if (v84)
    {
      if (v79 > 1 || v80 < v107 || v107 + v80 >= v76)
        break;
    }
    if (v78 > 2 || v109 == v80 && v77 > 1)
      break;
    if (++v80 >= v76)
      goto LABEL_154;
  }
  v47 = 0;
  v51 = 0;
  v46 = 0;
LABEL_169:
  v48 = (_QWORD *)&unk_1F043C000;
LABEL_71:
  if (v35 && v47 && (unint64_t)v140 >= 2 && (unint64_t)v140 <= 0x3F)
  {
    v55 = -[AppleSpell useWordLanguageModelForLanguageObject:tagger:appIdentifier:](self, "useWordLanguageModelForLanguageObject:tagger:appIdentifier:", v25, v126, a8);
    v56 = v111;
    if (!v55)
      v56 = 0;
    BYTE1(usedBufLen) = v51;
    LOBYTE(usedBufLen) = v128;
    v40 = -[AppleSpell _connectionCorrectionForWord:buffer:length:languageObject:connection:flags:isCapitalized:accentCorrectionOnly:isAbbreviation:trySpaceInsertion:hasAccentCorrections:candidateList:typologyCorrection:](self, "_connectionCorrectionForWord:buffer:length:languageObject:connection:flags:isCapitalized:accentCorrectionOnly:isAbbreviation:trySpaceInsertion:hasAccentCorrections:candidateList:typologyCorrection:", v20, buffer, v140, v25, v35, a12, usedBufLen, &v137, &v138, &v136, v56, 0);
  }
  if (!v47)
  {
    v58 = v128;
LABEL_123:
    v70 = v110;
    goto LABEL_124;
  }
  if (v40)
  {
    v57 = 1;
  }
  else
  {
    if (v136)
      v59 = 1;
    else
      v59 = v46 == 0;
    v57 = v59;
    if (v59)
      v40 = 0;
    else
      v40 = (__CFString *)v46;
  }
  v60 = v35;
  v58 = v128;
  if (v57
    && v51 != 1
    && !v137
    && -[AppleSpell useWordLanguageModelForLanguageObject:tagger:appIdentifier:](self, "useWordLanguageModelForLanguageObject:tagger:appIdentifier:", v25, v126, a8))
  {
    -[PRCandidateList addCandidateWithString:errorType:](v111, "addCandidateWithString:errorType:", v40, 6);
    BYTE4(usedBufLen) = 1;
    LODWORD(usedBufLen) = __PAIR32__(a17, a16);
    -[AppleSpell _addGuessesForWordBuffer:length:languageObject:connection:sender:minAutocorrectionLength:previousLetter:nextLetter:basicOnly:toGuesses:](self, "_addGuessesForWordBuffer:length:languageObject:connection:sender:minAutocorrectionLength:previousLetter:nextLetter:basicOnly:toGuesses:", buffer, v140, v25, v35, 0, v48[89], usedBufLen, v111);
  }
  if (!v111)
    goto LABEL_121;
  if (-[PRCandidateList count](v111, "count")
    && -[AppleSpell useWordLanguageModelForLanguageObject:tagger:appIdentifier:](self, "useWordLanguageModelForLanguageObject:tagger:appIdentifier:", v25, v126, a8))
  {
    v61 = -[AppleSpell _rankedCandidatesForCandidateList:languageObject:tagger:appIdentifier:parameterBundles:](self, "_rankedCandidatesForCandidateList:languageObject:tagger:appIdentifier:parameterBundles:", v111, v25, v126, a8, a15);
    v62 = objc_msgSend(v61, "count");
    if (v61)
    {
      v63 = v62;
      if (v62)
      {
        v64 = (void *)objc_msgSend(v61, "objectAtIndex:", 0);
        goto LABEL_105;
      }
    }
    goto LABEL_121;
  }
  if (v40 || -[PRCandidateList count](v111, "count") != 1)
    goto LABEL_121;
  v64 = (void *)objc_msgSend(-[PRCandidateList candidates](v111, "candidates"), "objectAtIndex:", 0);
  v63 = 1;
LABEL_105:
  if (!v64)
  {
LABEL_121:
    if (v138)
    {
      LOBYTE(usedBufLen) = v128;
      v40 = -[AppleSpell _spaceInsertionCorrectionForWord:buffer:length:languageObject:connection:flags:isCapitalized:typologyCorrection:](self, "_spaceInsertionCorrectionForWord:buffer:length:languageObject:connection:flags:isCapitalized:typologyCorrection:", v20, buffer, v140, v25, v60, a12, usedBufLen, 0);
    }
    goto LABEL_123;
  }
  v65 = objc_msgSend(v64, "string");
  a4.location = objc_msgSend(v64, "replacementRange");
  a4.length = v66;
  if (objc_msgSend(v64, "isBlocklisted"))
    v40 = 0;
  else
    v40 = (__CFString *)v65;
  v67 = v128 ^ 1;
  if (!v40)
    v67 = 1;
  if ((v67 & 1) != 0)
  {
    v70 = v110;
  }
  else
  {
    v68 = &v135;
    if (v63 < 2)
      v68 = (double *)&v134;
    v69 = *v68;
    v70 = v110;
    if ((v112 | v103) == 1)
    {
      v71 = -[__CFString length](v40, "length");
      if (v71)
      {
        v72 = v71;
LABEL_117:
        v149.location = 0;
        v149.length = v72;
        if (v72 == CFStringGetBytes(v40, v149, encoding, 0, 0, v144, 254, &v139)
          && (-[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](self, "checkNameWordBuffer:length:languageObject:globalOnly:", v144, v139, v25, 0)|| -[AppleSpell validateWord:inLexiconForLanguageObject:](self, "validateWord:inLexiconForLanguageObject:", v40, v25)))
        {
          v69 = -99.0;
        }
      }
    }
    else if (v104)
    {
      if ((unint64_t)-[__CFString length](v40, "length") >= 4)
      {
        if (-[__CFString hasSuffix:](v40, "hasSuffix:", CFSTR("'s")))
        {
          v89 = -[__CFString length](v40, "length");
          v72 = v89 - 2;
          if (v89 != 2)
            goto LABEL_117;
        }
      }
    }
    objc_msgSend(v64, "score");
    if (v90 < v69)
      v40 = 0;
  }
  v138 = 0;
LABEL_124:
  if (-[AppleSpell _permitCorrection:languageObject:flags:isCapitalized:typologyCorrection:](v127, "_permitCorrection:languageObject:flags:isCapitalized:typologyCorrection:", v40, v25, a12, v58, 0))
  {
    v73 = v40;
  }
  else
  {
    v73 = 0;
  }
  -[__CFString length](v73, "length");
  BYTE4(usedBufLen) = (a12 & 0x10) != 0;
  BYTE3(usedBufLen) = v70 != 0;
  BYTE2(usedBufLen) = v121;
  BYTE1(usedBufLen) = v58;
  LOBYTE(usedBufLen) = a12 & 1;
  v74 = -[AppleSpell _correctionResultForWord:replacementRange:inString:offset:languageObject:capitalize:isCapitalized:isSecondCapitalized:hasCurlyApostrophe:appendCorrectionLanguage:capitalizationLocale:proposedCorrection:](v127, "_correctionResultForWord:replacementRange:inString:offset:languageObject:capitalize:isCapitalized:isSecondCapitalized:hasCurlyApostrophe:appendCorrectionLanguage:capitalizationLocale:proposedCorrection:", v20, a4.location, a4.length, a5, a6, v25, usedBufLen, v117, v73);
  v42 = v74;
  if (v74)
    objc_msgSend(v74, "replacementString");
  return v42;
}

id __253__AppleSpell_Correction___correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount___block_invoke()
{
  uint64_t v0;
  id result;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CCE088];
  v2[0] = *MEMORY[0x1E0CCE080];
  v2[1] = v0;
  v2[2] = *MEMORY[0x1E0CCE060];
  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__nerTags = (uint64_t)result;
  return result;
}

- (void)enumerateAssetDataItemsForLocale:(id)a3 withBlock:(id)a4
{
  LDEnumerateAssetDataItems();
}

uint64_t __66__AppleSpell_Lexicon__enumerateAssetDataItemsForLocale_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t result;
  char v8;

  v8 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v8)
    *a6 = 1;
  return result;
}

- (id)_lexiconPathForLocalization:(id)a3 type:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  v7 = objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:");
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@.dat"), a4, a3);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__AppleSpell_Lexicon___lexiconPathForLocalization_type___block_invoke;
    v11[3] = &unk_1EA8CD2E0;
    v11[4] = v8;
    v11[5] = &v12;
    -[AppleSpell enumerateAssetDataItemsForLocale:withBlock:](self, "enumerateAssetDataItemsForLocale:withBlock:", v7, v11);
  }
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __56__AppleSpell_Lexicon___lexiconPathForLocalization_type___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(CFSTR("Lexicon"), "isEqualToString:", a4);
  if ((_DWORD)result)
  {
    result = objc_msgSend((id)objc_msgSend(a2, "lastPathComponent"), "isEqualToString:", *(_QWORD *)(a1 + 32));
    if ((_DWORD)result)
    {
      result = objc_msgSend((id)objc_msgSend(a2, "path"), "copy");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
      *a5 = 1;
    }
  }
  return result;
}

- (id)_lexiconPathForLanguageObject:(id)a3 type:(id)a4
{
  id result;

  result = -[AppleSpell _lexiconPathForLocalization:type:](self, "_lexiconPathForLocalization:type:", objc_msgSend(a3, "languageModelLocalization"), a4);
  if (!result)
    return -[AppleSpell _lexiconPathForLocalization:type:](self, "_lexiconPathForLocalization:type:", objc_msgSend(a3, "languageModelFallbackLocalization"), a4);
  return result;
}

- (id)_phraseLexiconPathForLanguage:(id)a3
{
  return -[AppleSpell _lexiconPathForLanguageObject:type:](self, "_lexiconPathForLanguageObject:type:", +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a3), CFSTR("Phrases"));
}

- (id)backgroundLoadingQueue
{
  if (backgroundLoadingQueue_onceToken != -1)
    dispatch_once(&backgroundLoadingQueue_onceToken, &__block_literal_global_4);
  return (id)backgroundLoadingQueue__backgroundLoadingQueue;
}

dispatch_queue_t __45__AppleSpell_Lexicon__backgroundLoadingQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  result = dispatch_queue_create("com.apple.ProofReader.backgroundLoadingQueue", v0);
  backgroundLoadingQueue__backgroundLoadingQueue = (uint64_t)result;
  return result;
}

- (id)_loadLexiconsForLanguage:(id)a3 localization:(id)a4 cachedOnly:(BOOL)a5 onQueue:(id)a6
{
  _BOOL8 v7;
  id v10;
  NSObject *lexiconSerialQueue;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  PRLexiconGroup *v16;
  NSObject *v17;
  id v18;
  void *v19;
  _QWORD v21[7];
  _QWORD v22[8];
  BOOL v23;
  _QWORD block[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;

  v7 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  v10 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a3);
  lexiconSerialQueue = self->_lexiconSerialQueue;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__AppleSpell_Lexicon___loadLexiconsForLanguage_localization_cachedOnly_onQueue___block_invoke;
  block[3] = &unk_1EA8CCA88;
  block[5] = a4;
  block[6] = &v25;
  block[4] = self;
  dispatch_sync(lexiconSerialQueue, block);
  v13 = (void *)v26[5];
  if (!v13
    || (objc_msgSend(v13, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) != 0
    || !v7 && objc_msgSend((id)v26[5], "cachedOnly"))
  {
    v14 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __80__AppleSpell_Lexicon___loadLexiconsForLanguage_localization_cachedOnly_onQueue___block_invoke_2;
    v22[3] = &unk_1EA8CD308;
    v23 = v7;
    v22[4] = a4;
    v22[5] = v10;
    v22[6] = v14;
    v22[7] = self;
    dispatch_sync((dispatch_queue_t)a6, v22);
    v16 = -[PRLexiconGroup initWithLocalization:lexicons:cachedOnly:]([PRLexiconGroup alloc], "initWithLocalization:lexicons:cachedOnly:", a4, v14, v7);
    v26[5] = (uint64_t)v16;
    v17 = self->_lexiconSerialQueue;
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __80__AppleSpell_Lexicon___loadLexiconsForLanguage_localization_cachedOnly_onQueue___block_invoke_3;
    v21[3] = &unk_1EA8CCC30;
    v21[5] = a4;
    v21[6] = &v25;
    v21[4] = self;
    dispatch_sync(v17, v21);

    v18 = (id)v26[5];
  }
  v19 = (void *)v26[5];
  _Block_object_dispose(&v25, 8);
  return v19;
}

id __80__AppleSpell_Lexicon___loadLexiconsForLanguage_localization_cachedOnly_onQueue___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 64), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

uint64_t __80__AppleSpell_Lexicon___loadLexiconsForLanguage_localization_cachedOnly_onQueue___block_invoke_2(uint64_t a1)
{
  PRLexicon *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  PRLexicon *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = +[PRLexicon lexiconWithLocalization:unigramsPath:cachedOnly:](PRLexicon, "lexiconWithLocalization:unigramsPath:cachedOnly:", *(_QWORD *)(a1 + 32), 0, *(unsigned __int8 *)(a1 + 64));
  v3 = objc_msgSend(*(id *)(a1 + 40), "transliterationLocalization");
  v14 = objc_msgSend(*(id *)(a1 + 40), "spellingFallbackLocalization");
  v12 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v2)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v2);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 56), "dataBundlesForLanguageObject:", *(_QWORD *)(a1 + 40), v12);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Unigrams"), CFSTR("dat"), 0, objc_msgSend(*(id *)(a1 + 40), "localization"));
        if (v10
          || (v10 = objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Unigrams"), CFSTR("dat"), 0, objc_msgSend(*(id *)(a1 + 40), "localization"))) != 0)
        {
          v11 = +[PRLexicon lexiconWithLocalization:unigramsPath:](PRLexicon, "lexiconWithLocalization:unigramsPath:", *(_QWORD *)(a1 + 32), v10);
          if (v11)
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
        }
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v6 = result;
    }
    while (result);
  }
  if (v3)
  {
    result = objc_msgSend(v13, "containsObject:", v3);
    if ((result & 1) == 0)
    {
      result = +[PRLexicon lexiconWithLocalization:unigramsPath:cachedOnly:](PRLexicon, "lexiconWithLocalization:unigramsPath:cachedOnly:", v3, 0, *(unsigned __int8 *)(a1 + 64));
      if (result)
        result = objc_msgSend(*(id *)(a1 + 48), "addObject:", result);
    }
  }
  if (v14)
  {
    result = objc_msgSend(v13, "containsObject:", v14);
    if ((result & 1) == 0)
    {
      result = +[PRLexicon lexiconWithLocalization:unigramsPath:cachedOnly:](PRLexicon, "lexiconWithLocalization:unigramsPath:cachedOnly:", v14, 0, *(unsigned __int8 *)(a1 + 64));
      if (result)
        return objc_msgSend(*(id *)(a1 + 48), "addObject:", result);
    }
  }
  return result;
}

uint64_t __80__AppleSpell_Lexicon___loadLexiconsForLanguage_localization_cachedOnly_onQueue___block_invoke_3(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 64), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
}

- (id)_lexiconsForLanguage:(id)a3 loadType:(int64_t)a4
{
  id v7;
  NSObject *lexiconSerialQueue;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[7];
  _QWORD block[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  v7 = -[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:");
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  if (_lexiconsForLanguage_loadType__onceToken != -1)
    dispatch_once(&_lexiconsForLanguage_loadType__onceToken, &__block_literal_global_48);
  lexiconSerialQueue = self->_lexiconSerialQueue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AppleSpell_Lexicon___lexiconsForLanguage_loadType___block_invoke_2;
  block[3] = &unk_1EA8CCA88;
  block[5] = v7;
  block[6] = &v18;
  block[4] = self;
  dispatch_sync(lexiconSerialQueue, block);
  if (objc_msgSend((id)v19[5], "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
  {
    v19[5] = 0;
    goto LABEL_14;
  }
  v10 = (void *)v19[5];
  if (v10)
  {
    if (a4 != 2 || (objc_msgSend(v10, "cachedOnly") & 1) == 0)
      goto LABEL_14;
    goto LABEL_11;
  }
  if (a4 == 1)
  {
    v12 = -[AppleSpell _loadLexiconsForLanguage:localization:cachedOnly:onQueue:](self, "_loadLexiconsForLanguage:localization:cachedOnly:onQueue:", a3, v7, 1, _lexiconsForLanguage_loadType___lexiconCreationSerialQueue);
    v19[5] = (uint64_t)v12;
  }
  else if (a4 == 2)
  {
LABEL_11:
    v11 = -[AppleSpell _loadLexiconsForLanguage:localization:cachedOnly:onQueue:](self, "_loadLexiconsForLanguage:localization:cachedOnly:onQueue:", a3, v7, 0, _lexiconsForLanguage_loadType___lexiconCreationSerialQueue);
    v19[5] = (uint64_t)v11;
    goto LABEL_14;
  }
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __53__AppleSpell_Lexicon___lexiconsForLanguage_loadType___block_invoke_3;
  v16[3] = &unk_1EA8CCAB0;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = v7;
  dispatch_async((dispatch_queue_t)-[AppleSpell backgroundLoadingQueue](self, "backgroundLoadingQueue"), v16);
LABEL_14:
  v13 = (void *)v19[5];
  if (v13)
    v14 = (id)objc_msgSend(v13, "lexicons");
  else
    v14 = 0;
  _Block_object_dispose(&v18, 8);
  return v14;
}

dispatch_queue_t __53__AppleSpell_Lexicon___lexiconsForLanguage_loadType___block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.ProofReader.lexiconCreationSerialQueue", 0);
  _lexiconsForLanguage_loadType___lexiconCreationSerialQueue = (uint64_t)result;
  return result;
}

id __53__AppleSpell_Lexicon___lexiconsForLanguage_loadType___block_invoke_2(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 64), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    return (id)objc_msgSend(*(id *)(a1[4] + 64), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), a1[5]);
  return result;
}

void __53__AppleSpell_Lexicon___lexiconsForLanguage_loadType___block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF0EACE0]();
  objc_msgSend(*(id *)(a1 + 32), "_loadLexiconsForLanguage:localization:cachedOnly:onQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, _lexiconsForLanguage_loadType___lexiconCreationSerialQueue);
  objc_autoreleasePoolPop(v2);
}

- (id)_lexiconsForLanguage:(id)a3
{
  return -[AppleSpell _lexiconsForLanguage:loadType:](self, "_lexiconsForLanguage:loadType:", a3, 1);
}

- (id)lexiconForLanguage:(id)a3
{
  return (id)objc_msgSend(-[AppleSpell _lexiconsForLanguage:loadType:](self, "_lexiconsForLanguage:loadType:", a3, 2), "firstObject");
}

- (id)_lexiconsForLanguageObject:(id)a3
{
  return -[AppleSpell _lexiconsForLanguage:loadType:](self, "_lexiconsForLanguage:loadType:", objc_msgSend(a3, "identifier"), 1);
}

- (id)lexiconForLanguageObject:(id)a3
{
  return (id)objc_msgSend(-[AppleSpell _lexiconsForLanguage:loadType:](self, "_lexiconsForLanguage:loadType:", objc_msgSend(a3, "identifier"), 2), "firstObject");
}

- (unint64_t)loadedLexiconsCountForLanguageObject:(id)a3
{
  return objc_msgSend(-[AppleSpell _lexiconsForLanguage:loadType:](self, "_lexiconsForLanguage:loadType:", objc_msgSend(a3, "identifier"), 0), "count");
}

- (id)_loadPhraseLexiconsForLanguage:(id)a3 localization:(id)a4 onQueue:(id)a5
{
  NSObject *lexiconSerialQueue;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[7];
  _QWORD v18[8];
  _QWORD block[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  lexiconSerialQueue = self->_lexiconSerialQueue;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__AppleSpell_Lexicon___loadPhraseLexiconsForLanguage_localization_onQueue___block_invoke;
  block[3] = &unk_1EA8CCA88;
  block[5] = a4;
  block[6] = &v20;
  block[4] = self;
  dispatch_sync(lexiconSerialQueue, block);
  v11 = (void *)v21[5];
  if (!v11 || objc_msgSend(v11, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
  {
    v12 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __75__AppleSpell_Lexicon___loadPhraseLexiconsForLanguage_localization_onQueue___block_invoke_2;
    v18[3] = &unk_1EA8CD350;
    v18[4] = self;
    v18[5] = a3;
    v18[6] = a4;
    v18[7] = v12;
    dispatch_sync((dispatch_queue_t)a5, v18);
    v21[5] = v12;
    v14 = self->_lexiconSerialQueue;
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __75__AppleSpell_Lexicon___loadPhraseLexiconsForLanguage_localization_onQueue___block_invoke_3;
    v17[3] = &unk_1EA8CCC30;
    v17[5] = a4;
    v17[6] = &v20;
    v17[4] = self;
    dispatch_sync(v14, v17);

  }
  v15 = (void *)v21[5];
  _Block_object_dispose(&v20, 8);
  return v15;
}

id __75__AppleSpell_Lexicon___loadPhraseLexiconsForLanguage_localization_onQueue___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 72), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

PRLexicon *__75__AppleSpell_Lexicon___loadPhraseLexiconsForLanguage_localization_onQueue___block_invoke_2(uint64_t a1)
{
  PRLexicon *result;

  result = (PRLexicon *)objc_msgSend(*(id *)(a1 + 32), "_phraseLexiconPathForLanguage:", *(_QWORD *)(a1 + 40));
  if (result)
  {
    result = +[PRLexicon lexiconWithLocalization:unigramsPath:](PRLexicon, "lexiconWithLocalization:unigramsPath:", *(_QWORD *)(a1 + 48), result);
    if (result)
      return (PRLexicon *)objc_msgSend(*(id *)(a1 + 56), "addObject:", result);
  }
  return result;
}

uint64_t __75__AppleSpell_Lexicon___loadPhraseLexiconsForLanguage_localization_onQueue___block_invoke_3(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 72), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
}

- (id)_phraseLexiconsForLanguage:(id)a3 waitForResult:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *lexiconSerialQueue;
  uint64_t v9;
  id v10;
  _QWORD v12[7];
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v4 = a4;
  v7 = -[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:");
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  if (_phraseLexiconsForLanguage_waitForResult__onceToken != -1)
    dispatch_once(&_phraseLexiconsForLanguage_waitForResult__onceToken, &__block_literal_global_50);
  lexiconSerialQueue = self->_lexiconSerialQueue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AppleSpell_Lexicon___phraseLexiconsForLanguage_waitForResult___block_invoke_2;
  block[3] = &unk_1EA8CCA88;
  block[5] = v7;
  block[6] = &v14;
  block[4] = self;
  dispatch_sync(lexiconSerialQueue, block);
  if (objc_msgSend((id)v15[5], "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
  {
    v10 = 0;
    v15[5] = 0;
  }
  else
  {
    v10 = (id)v15[5];
    if (!v10)
    {
      if (v4)
      {
        v10 = -[AppleSpell _loadPhraseLexiconsForLanguage:localization:onQueue:](self, "_loadPhraseLexiconsForLanguage:localization:onQueue:", a3, v7, _phraseLexiconsForLanguage_waitForResult___phraseLexiconCreationSerialQueue);
        v15[5] = (uint64_t)v10;
      }
      else
      {
        v12[0] = v9;
        v12[1] = 3221225472;
        v12[2] = __64__AppleSpell_Lexicon___phraseLexiconsForLanguage_waitForResult___block_invoke_3;
        v12[3] = &unk_1EA8CCAB0;
        v12[4] = self;
        v12[5] = a3;
        v12[6] = v7;
        dispatch_async((dispatch_queue_t)-[AppleSpell backgroundLoadingQueue](self, "backgroundLoadingQueue"), v12);
        v10 = (id)v15[5];
      }
    }
  }
  _Block_object_dispose(&v14, 8);
  return v10;
}

dispatch_queue_t __64__AppleSpell_Lexicon___phraseLexiconsForLanguage_waitForResult___block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.ProofReader.phraseLexiconCreationSerialQueue", 0);
  _phraseLexiconsForLanguage_waitForResult___phraseLexiconCreationSerialQueue = (uint64_t)result;
  return result;
}

id __64__AppleSpell_Lexicon___phraseLexiconsForLanguage_waitForResult___block_invoke_2(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 72), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    return (id)objc_msgSend(*(id *)(a1[4] + 72), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), a1[5]);
  return result;
}

void __64__AppleSpell_Lexicon___phraseLexiconsForLanguage_waitForResult___block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF0EACE0]();
  objc_msgSend(*(id *)(a1 + 32), "_loadPhraseLexiconsForLanguage:localization:onQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), _phraseLexiconsForLanguage_waitForResult___phraseLexiconCreationSerialQueue);
  objc_autoreleasePoolPop(v2);
}

- (id)_phraseLexiconsForLanguage:(id)a3
{
  return -[AppleSpell _phraseLexiconsForLanguage:waitForResult:](self, "_phraseLexiconsForLanguage:waitForResult:", a3, 1);
}

- (void)updateLexiconsForLanguage:(id)a3
{
  id v4;
  NSObject *lexiconSerialQueue;
  _QWORD v6[6];

  v4 = -[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:", a3);
  lexiconSerialQueue = self->_lexiconSerialQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__AppleSpell_Lexicon__updateLexiconsForLanguage___block_invoke;
  v6[3] = &unk_1EA8CCAD8;
  v6[4] = self;
  v6[5] = v4;
  dispatch_sync(lexiconSerialQueue, v6);
}

uint64_t __49__AppleSpell_Lexicon__updateLexiconsForLanguage___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", *(_QWORD *)(a1 + 40)))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)updateLexiconsForLanguageIfNecessary:(id)a3
{
  id v5;

  if (a3)
  {
    v5 = -[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:");
    if (v5)
    {
      if (objc_msgSend(+[PRLanguage supportedAssetLexiconLanguages](PRLanguage, "supportedAssetLexiconLanguages"), "containsObject:", v5))-[AppleSpell updateLexiconsForLanguage:](self, "updateLexiconsForLanguage:", a3);
    }
  }
}

- (void)updateLexiconsForLanguageObject:(id)a3
{
  -[AppleSpell updateLexiconsForLanguage:](self, "updateLexiconsForLanguage:", objc_msgSend(a3, "identifier"));
}

- (void)updateLexiconsForLanguageObjectIfNecessary:(id)a3
{
  if (objc_msgSend(a3, "isSupportedAssetLexiconLanguage"))
    -[AppleSpell updateLexiconsForLanguageObject:](self, "updateLexiconsForLanguageObject:", a3);
}

- (void)updateAllLexicons
{
  NSObject *lexiconSerialQueue;
  _QWORD block[5];

  lexiconSerialQueue = self->_lexiconSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AppleSpell_Lexicon__updateAllLexicons__block_invoke;
  block[3] = &unk_1EA8CCB00;
  block[4] = self;
  dispatch_sync(lexiconSerialQueue, block);
}

uint64_t __40__AppleSpell_Lexicon__updateAllLexicons__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
}

- (BOOL)validateWord:(id)a3 inLexicons:(id)a4 forLanguage:(id)a5 requiredMetaFlags:(unsigned int)a6 alternativeRequiredMetaFlags:(unsigned int)a7 prohibitedMetaFlags:(unsigned int)a8 caseInsensitive:(BOOL)a9
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  BOOL v19;
  _QWORD v25[10];
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  BOOL v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[3];
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  v12 = objc_msgSend(a3, "length");
  if (objc_msgSend(-[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:", a5), "isEqualToString:", CFSTR("tr")))
  {
    v13 = validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive__turkishLocale;
    if (!validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive__turkishLocale)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("tr"));
      validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive__turkishLocale = v13;
    }
  }
  else
  {
    v13 = 0;
  }
  if (a4 && v12)
  {
    v14 = objc_msgSend(a4, "count");
    v15 = *((unsigned __int8 *)v35 + 24);
    if (!*((_BYTE *)v35 + 24))
    {
      v16 = v14;
      if (v14)
      {
        v17 = 0;
        do
        {
          v18 = (void *)objc_msgSend(a4, "objectAtIndex:", v17);
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __142__AppleSpell_Lexicon__validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive___block_invoke;
          v25[3] = &unk_1EA8CD378;
          v29 = a9;
          v26 = a6;
          v27 = a7;
          v28 = a8;
          v25[6] = v30;
          v25[7] = v32;
          v25[4] = a3;
          v25[5] = v13;
          v25[8] = &v34;
          v25[9] = v12;
          objc_msgSend(v18, "enumerateEntriesForString:usingBlock:", a3, v25);
          v15 = *((unsigned __int8 *)v35 + 24);
          if (*((_BYTE *)v35 + 24))
            break;
          ++v17;
        }
        while (v17 < v16);
      }
    }
  }
  else
  {
    v15 = *((unsigned __int8 *)v35 + 24);
  }
  v19 = v15 != 0;
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);
  return v19;
}

uint64_t __142__AppleSpell_Lexicon__validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive___block_invoke(uint64_t result, void *a2, uint64_t a3, int a4, _BYTE *a5)
{
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;

  v7 = result;
  if (((*(_DWORD *)(result + 80) & ~a4) == 0 || (*(_DWORD *)(result + 84) & ~a4) == 0)
    && (*(_DWORD *)(result + 88) & a4) == 0)
  {
    if (*(_BYTE *)(result + 92) || (objc_msgSend(a2, "isEqualToString:", objc_msgSend(a2, "lowercaseString")) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 48) + 8) + 24))
      {
        if (!validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive__lowercaseSet)
          validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive__lowercaseSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
        objc_msgSend(*(id *)(v7 + 32), "rangeOfCharacterFromSet:");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 56) + 8) + 24) = v9 != 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 48) + 8) + 24) = 1;
      }
      v8 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 56) + 8) + 24) == 0;
    }
    result = objc_msgSend(*(id *)(v7 + 32), "compare:options:range:locale:", a2, v8, 0, *(_QWORD *)(v7 + 72), *(_QWORD *)(v7 + 40));
    if (!result)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 64) + 8) + 24) = 1;
      *a5 = 1;
    }
  }
  return result;
}

- (BOOL)validateWord:(id)a3 inLexiconForLanguage:(id)a4
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  return -[AppleSpell validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, -[AppleSpell _lexiconsForLanguage:](self, "_lexiconsForLanguage:", a4), a4, 0, 0, 66, v5);
}

- (BOOL)validateAdditionalWord:(id)a3 inLexiconForLanguage:(id)a4
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  return -[AppleSpell validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, -[AppleSpell _lexiconsForLanguage:](self, "_lexiconsForLanguage:", a4), a4, 0, 0, 64, v5);
}

- (BOOL)validateVariantWord:(id)a3 inLexiconForLanguage:(id)a4
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  return -[AppleSpell validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, -[AppleSpell _lexiconsForLanguage:](self, "_lexiconsForLanguage:", a4), a4, 0, 0, 0, v5);
}

- (BOOL)validateNoCapAbbreviation:(id)a3 inLexiconForLanguage:(id)a4
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  return -[AppleSpell validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, -[AppleSpell _lexiconsForLanguage:](self, "_lexiconsForLanguage:", a4), a4, 64, 64, 0, v5);
}

- (BOOL)validateUntilLearnedWord:(id)a3 inLexiconForLanguage:(id)a4
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  return -[AppleSpell validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, -[AppleSpell _lexiconsForLanguage:](self, "_lexiconsForLanguage:", a4), a4, 4, 128, 66, v5);
}

- (BOOL)validateWord:(id)a3 inLexiconsForLanguageObject:(id)a4 requiredMetaFlags:(unsigned int)a5 alternativeRequiredMetaFlags:(unsigned int)a6 prohibitedMetaFlags:(unsigned int)a7 caseInsensitive:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[AppleSpell validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, -[AppleSpell _lexiconsForLanguage:](self, "_lexiconsForLanguage:", objc_msgSend(a4, "identifier")), objc_msgSend(a4, "identifier"), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, v9);
}

- (BOOL)validateWord:(id)a3 inLexiconForLanguageObject:(id)a4
{
  return -[AppleSpell validateWord:inLexiconsForLanguageObject:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexiconsForLanguageObject:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, a4, 0, 0, 66, 0);
}

- (BOOL)validateAdditionalWord:(id)a3 inLexiconForLanguageObject:(id)a4
{
  return -[AppleSpell validateWord:inLexiconsForLanguageObject:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexiconsForLanguageObject:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, a4, 0, 0, 64, 0);
}

- (BOOL)validateVariantWord:(id)a3 inLexiconForLanguageObject:(id)a4
{
  return -[AppleSpell validateWord:inLexiconsForLanguageObject:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexiconsForLanguageObject:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, a4, 0, 0, 0, 1);
}

- (BOOL)validateNoCapAbbreviation:(id)a3 inLexiconForLanguageObject:(id)a4
{
  return -[AppleSpell validateWord:inLexiconsForLanguageObject:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexiconsForLanguageObject:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, a4, 64, 64, 0, 1);
}

- (BOOL)validateUntilLearnedWord:(id)a3 inLexiconForLanguageObject:(id)a4
{
  return -[AppleSpell validateWord:inLexiconsForLanguageObject:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexiconsForLanguageObject:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, a4, 4, 128, 66, 0);
}

- (BOOL)validateWord:(id)a3 inLexicon:(id)a4
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  return -[AppleSpell validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a4), 0, 0, 0, 66, v5);
}

- (BOOL)getMetaFlagsForWord:(id)a3 inLexiconForLanguage:(id)a4 metaFlags:(unsigned int *)a5 otherMetaFlags:(unsigned int *)a6
{
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t i;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v22;
  _QWORD v23[13];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  int v47;

  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v22 = objc_msgSend(a3, "length");
  v9 = -[AppleSpell _lexiconsForLanguage:](self, "_lexiconsForLanguage:", a4);
  if (getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__onceToken != -1)
    dispatch_once(&getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__onceToken, &__block_literal_global_57);
  if (objc_msgSend(-[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:", a4), "isEqualToString:", CFSTR("tr")))
  {
    v10 = getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__turkishLocale;
    if (!getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__turkishLocale)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("tr"));
      getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__turkishLocale = v10;
    }
  }
  else
  {
    v10 = 0;
  }
  if (v9 && v22)
  {
    v11 = objc_msgSend(v9, "count");
    for (i = 0; ; ++i)
    {
      if (*((_BYTE *)v33 + 24) && *((_BYTE *)v29 + 24))
      {
        if (*((_BYTE *)v25 + 24))
          v13 = 1;
        else
          v13 = i >= v11;
        if (v13)
          break;
      }
      else if (i >= v11)
      {
        break;
      }
      v14 = (void *)objc_msgSend(v9, "objectAtIndex:", i);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __89__AppleSpell_Lexicon__getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags___block_invoke_2;
      v23[3] = &unk_1EA8CD3A0;
      v23[5] = v10;
      v23[6] = &v24;
      v23[7] = &v32;
      v23[8] = &v36;
      v23[9] = &v44;
      v23[10] = &v28;
      v23[11] = &v40;
      v23[12] = v22;
      v23[4] = a3;
      objc_msgSend(v14, "enumerateEntriesForString:usingBlock:", a3, v23);
    }
  }
  objc_msgSend(a3, "rangeOfCharacterFromSet:", getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__lowercaseSet);
  if (v15)
  {
    *((_DWORD *)v45 + 6) = 0;
    *((_BYTE *)v33 + 24) = 0;
  }
  if (a5)
  {
    if (*((_BYTE *)v25 + 24))
    {
      v16 = v37;
    }
    else if (*((_BYTE *)v29 + 24))
    {
      v16 = v41;
    }
    else
    {
      v16 = v45;
    }
    *a5 = *((_DWORD *)v16 + 6);
  }
  if (a6)
  {
    if (*((_BYTE *)v29 + 24))
    {
      v17 = v41;
    }
    else if (*((_BYTE *)v25 + 24))
    {
      v17 = v37;
    }
    else
    {
      v17 = v45;
    }
    *a6 = *((_DWORD *)v17 + 6);
  }
  v18 = *((_BYTE *)v33 + 24) || *((_BYTE *)v29 + 24) || *((_BYTE *)v25 + 24) != 0;
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  return v18;
}

id __89__AppleSpell_Lexicon__getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags___block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
  getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__lowercaseSet = (uint64_t)result;
  return result;
}

uint64_t __89__AppleSpell_Lexicon__getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  v7 = objc_msgSend(a2, "isEqualToString:", objc_msgSend(a2, "lowercaseString"));
  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2);
  if (!(_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "compare:options:range:locale:", a2, 1, 0, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 40));
    if (result)
      return result;
    if (!v7 || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (*(_BYTE *)(v9 + 24))
        return result;
      *(_BYTE *)(v9 + 24) = 1;
      v10 = *(_QWORD *)(a1 + 72);
      goto LABEL_12;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a4;
LABEL_11:
    v10 = *(_QWORD *)(a1 + 88);
LABEL_12:
    *(_DWORD *)(*(_QWORD *)(v10 + 8) + 24) = a4;
    return result;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a4;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a4;
    if (v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      goto LABEL_11;
    }
  }
  return result;
}

- (id)phraseMatching:(id)a3 inLexiconForLanguage:(id)a4
{
  CFIndex v7;
  CFIndex Bytes;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  CFRange v26;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v7 = objc_msgSend(a3, "length");
  v26.location = 0;
  v26.length = v7;
  Bytes = CFStringGetBytes((CFStringRef)a3, v26, 0x8000100u, 0, 0, 0, 0, 0);
  v9 = -[AppleSpell _phraseLexiconsForLanguage:](self, "_phraseLexiconsForLanguage:", a4);
  v10 = 0;
  if (v7 && v7 == Bytes)
  {
    v11 = v9;
    if (v9)
    {
      v12 = objc_msgSend(v9, "count");
      v10 = (void *)v21[5];
      if (!v10)
      {
        v13 = v12;
        if (v12)
        {
          v14 = 0;
          v15 = MEMORY[0x1E0C809B0];
          do
          {
            v16 = (void *)objc_msgSend(v11, "objectAtIndex:", v14);
            v19[0] = v15;
            v19[1] = 3221225472;
            v19[2] = __59__AppleSpell_Lexicon__phraseMatching_inLexiconForLanguage___block_invoke;
            v19[3] = &unk_1EA8CD3C8;
            v19[4] = a3;
            v19[5] = &v20;
            objc_msgSend(v16, "enumerateEntriesForString:usingBlock:", a3, v19);
            ++v14;
            v10 = (void *)v21[5];
            if (v10)
              v17 = 1;
            else
              v17 = v14 >= v13;
          }
          while (!v17);
        }
      }
    }
    else
    {
      v10 = (void *)v21[5];
    }
  }
  _Block_object_dispose(&v20, 8);
  return v10;
}

_QWORD *__59__AppleSpell_Lexicon__phraseMatching_inLexiconForLanguage___block_invoke(_QWORD *result, void *a2, uint64_t a3, char a4, _BYTE *a5)
{
  _QWORD *v7;

  if ((a4 & 0xCA) == 0)
  {
    v7 = result;
    result = (_QWORD *)objc_msgSend(a2, "compare:options:", result[4], 129);
    if (!result)
    {
      result = (id)objc_msgSend(a2, "copy");
      *(_QWORD *)(*(_QWORD *)(v7[5] + 8) + 40) = result;
      *a5 = 1;
    }
  }
  return result;
}

- (void)enumerateEntriesForWord:(id)a3 inLexiconForLanguage:(id)a4 withBlock:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = -[AppleSpell _lexiconsForLanguage:](self, "_lexiconsForLanguage:", a4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        v14[0] = v11;
        v14[1] = 3221225472;
        v14[2] = __78__AppleSpell_Lexicon__enumerateEntriesForWord_inLexiconForLanguage_withBlock___block_invoke;
        v14[3] = &unk_1EA8CCDB8;
        v14[4] = a5;
        objc_msgSend(v13, "enumerateEntriesForString:usingBlock:", a3, v14);
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
}

uint64_t __78__AppleSpell_Lexicon__enumerateEntriesForWord_inLexiconForLanguage_withBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 0xC2) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)enumerateCorrectionEntriesForWord:(id)a3 maxCorrections:(unint64_t)a4 inLexiconForLanguage:(id)a5 withBlock:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = -[AppleSpell _lexiconsForLanguage:](self, "_lexiconsForLanguage:", a5);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v16[0] = v13;
        v16[1] = 3221225472;
        v16[2] = __103__AppleSpell_Lexicon__enumerateCorrectionEntriesForWord_maxCorrections_inLexiconForLanguage_withBlock___block_invoke;
        v16[3] = &unk_1EA8CD3F0;
        v16[4] = a6;
        objc_msgSend(v15, "enumerateCorrectionEntriesForWord:maxCorrections:withBlock:", a3, a4, v16);
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
}

uint64_t __103__AppleSpell_Lexicon__enumerateCorrectionEntriesForWord_maxCorrections_inLexiconForLanguage_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)getMetaFlagsForWord:(id)a3 inLexiconForLanguageObject:(id)a4 metaFlags:(unsigned int *)a5 otherMetaFlags:(unsigned int *)a6
{
  return -[AppleSpell getMetaFlagsForWord:inLexiconForLanguage:metaFlags:otherMetaFlags:](self, "getMetaFlagsForWord:inLexiconForLanguage:metaFlags:otherMetaFlags:", a3, objc_msgSend(a4, "identifier"), a5, a6);
}

- (id)phraseMatching:(id)a3 inLexiconForLanguageObject:(id)a4
{
  return -[AppleSpell phraseMatching:inLexiconForLanguage:](self, "phraseMatching:inLexiconForLanguage:", a3, objc_msgSend(a4, "identifier"));
}

- (void)enumerateEntriesForWord:(id)a3 inLexiconForLanguageObject:(id)a4 withBlock:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = -[AppleSpell _lexiconsForLanguageObject:](self, "_lexiconsForLanguageObject:", a4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        v14[0] = v11;
        v14[1] = 3221225472;
        v14[2] = __84__AppleSpell_Lexicon__enumerateEntriesForWord_inLexiconForLanguageObject_withBlock___block_invoke;
        v14[3] = &unk_1EA8CCDB8;
        v14[4] = a5;
        objc_msgSend(v13, "enumerateEntriesForString:usingBlock:", a3, v14);
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
}

uint64_t __84__AppleSpell_Lexicon__enumerateEntriesForWord_inLexiconForLanguageObject_withBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 0xC2) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)enumerateCorrectionEntriesForWord:(id)a3 maxCorrections:(unint64_t)a4 inLexiconForLanguageObject:(id)a5 withBlock:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = -[AppleSpell _lexiconsForLanguageObject:](self, "_lexiconsForLanguageObject:", a5);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v16[0] = v13;
        v16[1] = 3221225472;
        v16[2] = __109__AppleSpell_Lexicon__enumerateCorrectionEntriesForWord_maxCorrections_inLexiconForLanguageObject_withBlock___block_invoke;
        v16[3] = &unk_1EA8CD3F0;
        v16[4] = a6;
        objc_msgSend(v15, "enumerateCorrectionEntriesForWord:maxCorrections:withBlock:", a3, a4, v16);
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
}

uint64_t __109__AppleSpell_Lexicon__enumerateCorrectionEntriesForWord_maxCorrections_inLexiconForLanguageObject_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_loadNERTaggerOnQueue:(id)a3
{
  NSObject *nerTaggerSerialQueue;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  nerTaggerSerialQueue = self->_nerTaggerSerialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AppleSpell_Lexicon___loadNERTaggerOnQueue___block_invoke;
  block[3] = &unk_1EA8CD418;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(nerTaggerSerialQueue, block);
  v7 = (void *)v16[5];
  if (!v7 || objc_msgSend(v7, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __45__AppleSpell_Lexicon___loadNERTaggerOnQueue___block_invoke_2;
    v13[3] = &unk_1EA8CCF40;
    v13[4] = &v15;
    dispatch_sync((dispatch_queue_t)a3, v13);
    v9 = self->_nerTaggerSerialQueue;
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __45__AppleSpell_Lexicon___loadNERTaggerOnQueue___block_invoke_3;
    v12[3] = &unk_1EA8CD418;
    v12[4] = self;
    v12[5] = &v15;
    dispatch_sync(v9, v12);

  }
  v10 = (void *)v16[5];
  _Block_object_dispose(&v15, 8);
  return v10;
}

id __45__AppleSpell_Lexicon___loadNERTaggerOnQueue___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", CFSTR("NER"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void *__45__AppleSpell_Lexicon___loadNERTaggerOnQueue___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *result;

  v2 = objc_alloc(MEMORY[0x1E0CCE168]);
  v3 = *MEMORY[0x1E0CCE0C8];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(v2, "initWithTagSchemes:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CCE0C8], 0));
  result = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (result)
  {
    objc_msgSend(result, "setString:", CFSTR("This is a test string."));
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "tagAtIndex:unit:scheme:tokenRange:", 0, 0, v3, 0);
  }
  return result;
}

uint64_t __45__AppleSpell_Lexicon___loadNERTaggerOnQueue___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
  if (v1)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 80), "setObject:forKey:", v1, CFSTR("NER"));
  return result;
}

- (id)nerTaggerWaitForResult:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *nerTaggerSerialQueue;
  uint64_t v6;
  id v7;
  _QWORD v9[5];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  if (nerTaggerWaitForResult__onceToken != -1)
    dispatch_once(&nerTaggerWaitForResult__onceToken, &__block_literal_global_64);
  nerTaggerSerialQueue = self->_nerTaggerSerialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AppleSpell_Lexicon__nerTaggerWaitForResult___block_invoke_2;
  block[3] = &unk_1EA8CD418;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(nerTaggerSerialQueue, block);
  if (objc_msgSend((id)v12[5], "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
  {
    v7 = 0;
    v12[5] = 0;
  }
  else
  {
    v7 = (id)v12[5];
    if (!v7)
    {
      if (v3)
      {
        v7 = -[AppleSpell _loadNERTaggerOnQueue:](self, "_loadNERTaggerOnQueue:", nerTaggerWaitForResult___taggerCreationSerialQueue);
        v12[5] = (uint64_t)v7;
      }
      else
      {
        v9[0] = v6;
        v9[1] = 3221225472;
        v9[2] = __46__AppleSpell_Lexicon__nerTaggerWaitForResult___block_invoke_3;
        v9[3] = &unk_1EA8CCB00;
        v9[4] = self;
        dispatch_async((dispatch_queue_t)-[AppleSpell backgroundLoadingQueue](self, "backgroundLoadingQueue"), v9);
        v7 = (id)v12[5];
      }
    }
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

dispatch_queue_t __46__AppleSpell_Lexicon__nerTaggerWaitForResult___block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.ProofReader.nerTaggerCreationSerialQueue", 0);
  nerTaggerWaitForResult___taggerCreationSerialQueue = (uint64_t)result;
  return result;
}

id __46__AppleSpell_Lexicon__nerTaggerWaitForResult___block_invoke_2(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", CFSTR("NER"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("NER"));
  return result;
}

void __46__AppleSpell_Lexicon__nerTaggerWaitForResult___block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF0EACE0]();
  objc_msgSend(*(id *)(a1 + 32), "_loadNERTaggerOnQueue:", nerTaggerWaitForResult___taggerCreationSerialQueue);
  objc_autoreleasePoolPop(v2);
}

- (void)_checkEnglishArticlesInSentence:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 mutableCorrections:(id)a6
{
  id v10;
  _BYTE *v11;
  CFStringEncoding v12;
  CFStringEncoding v13;
  unsigned __int16 *v14;
  CFIndex v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  int v23;
  int v24;
  int v25;
  const __CFString *v26;
  unint64_t v27;
  const __CFString *v28;
  size_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  const __CFString *v34;
  const __CFString *v35;
  CFIndex v36;
  CFIndex v37;
  uint64_t v38;
  unsigned int v39;
  char v40;
  unint64_t v41;
  int v42;
  uint64_t v43;
  PRSentenceCorrection *v44;
  PRSentenceCorrection *v45;
  id v46;
  __CFString *v47;
  _BOOL4 v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;
  int v53;
  int v54;
  char *v55;
  int v56;
  __int16 v57;
  _QWORD v58[2];
  int v59;
  char *v60;
  __int16 v61;
  __int16 v62;
  __int16 v63;
  __int16 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v10 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("en"));
  v11 = -[AppleSpell databaseConnectionForLanguageObject:](self, "databaseConnectionForLanguageObject:", v10);
  v12 = objc_msgSend(v10, "encoding");
  if (v11)
  {
    if (v11[24] == 16)
    {
      v68 = 0u;
      v67 = 0u;
      v66 = 0u;
      v65 = 0u;
      v59 = 0;
      v58[0] = 0;
      v58[1] = 0;
      v56 = 0;
      v57 = 0;
      v60 = a4;
      v61 = *(_WORD *)v11;
      HIWORD(v58[0]) = 256;
      *((_QWORD *)&v65 + 1) = v58;
      *(_QWORD *)&v66 = &v56;
      BYTE13(v67) = 0;
      v62 = 32;
      v64 = 0;
      v63 = a5;
      if (a5)
      {
        v13 = v12;
        v46 = a6;
        PRbuf((uint64_t)&v60, 0xEu, 0);
        v14 = (unsigned __int16 *)*((_QWORD *)&v66 + 1);
        if (*((_QWORD *)&v66 + 1))
        {
          v55 = a4 + 1;
          do
          {
            if (*((_BYTE *)v14 + 12) == 6)
            {
              v15 = v14[1];
              if ((v15 - 1) <= 1)
              {
                v16 = *v14;
                if (v15 + v16 + 3 < a5)
                {
                  v17 = (id)CFStringCreateWithBytes(0, (const UInt8 *)&a4[v16], v15, v13, 0);
                  v18 = (void *)-[__CFString lowercaseString](v17, "lowercaseString");
                  v47 = v17;
                  v50 = -[__CFString isEqualToString:](v17, "isEqualToString:", v18);
                  v19 = *v14;
                  v20 = v14[1];
                  v21 = v20 + v19;
                  v22 = &a4[v20 + v19];
                  v23 = isLowerCaseX(*(v22 - 1), v13);
                  v24 = 0;
                  if (v23)
                  {
                    if (a4[v21] == 32
                      && isAnyAlphaX_0(a4[v21 + 1], v13)
                      && isLowerCaseX(a4[v21 + 2], v13))
                    {
                      v24 = isLowerCaseX(a4[v21 + 3], v13);
                    }
                    else
                    {
                      v24 = 0;
                    }
                  }
                  v54 = v24;
                  v53 = toLowerX_0(v22[1], v13);
                  v48 = v21 + 5 < a5 && strncasecmp_l(&a4[v19 + 1 + v20], "for-", 4uLL, 0) == 0;
                  v25 = v50;
                  v51 = objc_msgSend(v18, "isEqualToString:", CFSTR("a"), v46);
                  v26 = CFSTR("an");
                  v49 = objc_msgSend(v18, "isEqualToString:", CFSTR("an"));
                  v27 = 0;
                  if (v25)
                  {
                    v28 = CFSTR("a");
                  }
                  else
                  {
                    v26 = CFSTR("An");
                    v28 = CFSTR("A");
                  }
                  do
                  {
                    v29 = strlen(off_1EA8CD598[v27]);
                    v30 = *v14;
                    v31 = v14[1];
                    if (v29 + v30 + v31 + 1 >= a5)
                    {
                      v32 = 0;
                    }
                    else
                    {
                      v32 = strncasecmp_l(&a4[v30 + 1 + v31], off_1EA8CD598[v27], v29, 0) == 0;
                      if (v32)
                        break;
                    }
                  }
                  while (v27++ <= 3);
                  if (v51)
                    v34 = v26;
                  else
                    v34 = 0;
                  if (v49)
                    v35 = v28;
                  else
                    v35 = v34;
                  v36 = *v14;
                  v52 = v14[1];
                  v37 = v52 + v36;
                  if (v52 + v36 + 1 < a5)
                  {
                    while (1)
                    {
                      v38 = v55[v37];
                      if (!isAnyAlphaX_0(v55[v37], v13))
                        break;
                      v39 = toLowerX_0(v38, v13);
                      v40 = vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(vdupq_n_s32(v39), (int32x4_t)xmmword_1DE2EFC60))) | ((v39 & 0x1FB) == 97);
                      if ((v40 & 1) == 0)
                      {
                        v41 = v37 + 2;
                        ++v37;
                        if (v41 < a5)
                          continue;
                      }
                      goto LABEL_39;
                    }
                  }
                  v40 = 0;
LABEL_39:
                  v42 = v54 ^ 1;
                  if (!v35)
                    v42 = 1;
                  if (v53 == 104)
                    v42 = 1;
                  if (!(v32 | (v42 | v48) & 1 | ((v40 & 1) == 0)))
                  {
                    if ((_DWORD)v36)
                      v43 = -[__CFString length]((id)(id)CFStringCreateWithBytes(0, (const UInt8 *)a4, v36, v13, 0), "length");
                    else
                      v43 = 0;
                    v44 = [PRSentenceCorrection alloc];
                    v69[0] = v35;
                    v45 = -[PRSentenceCorrection initWithCategory:range:word:corrections:](v44, "initWithCategory:range:word:corrections:", 4, v43, v52, v47, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1));
                    objc_msgSend(v46, "addObject:", v45);

                  }
                }
              }
            }
            v14 = (unsigned __int16 *)*((_QWORD *)v14 + 5);
          }
          while (v14);
        }
        PRbuf((uint64_t)&v60, 0x11u, 0);
      }
    }
  }
}

- (const)englishPhraseRoot
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AppleSpell_SentenceCorrection__englishPhraseRoot__block_invoke;
  block[3] = &unk_1EA8CCB00;
  block[4] = self;
  if (englishPhraseRoot_onceToken != -1)
    dispatch_once(&englishPhraseRoot_onceToken, block);
  return (const void *)englishPhraseRoot_phrase_root;
}

uint64_t *__51__AppleSpell_SentenceCorrection__englishPhraseRoot__block_invoke(uint64_t a1)
{
  id v2;
  CFStringEncoding v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __CFString *v11;
  __CFString *v12;
  CFIndex v13;
  CFIndex v14;
  CFIndex Bytes;
  CFIndex v16;
  UInt8 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  __CFString *v23;
  __CFString *v24;
  CFIndex v25;
  CFIndex v26;
  UInt8 *v27;
  BOOL v28;
  unint64_t v29;
  UInt8 *v30;
  UInt8 *v31;
  uint64_t *result;
  uint64_t v33;
  id obj;
  unint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CFIndex v40;
  CFIndex usedBufLen;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;
  CFRange v49;
  CFRange v50;
  CFRange v51;
  CFRange v52;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("en"));
  v3 = objc_msgSend(v2, "encoding");
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "phraseCorrectionsDictionaryForLanguageObject:", v2);
  obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  v7 = 0x1ED0A4000;
  if (v6)
  {
    v8 = v6;
    v35 = 0;
    v9 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v5);
        v11 = *(__CFString **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v12 = (__CFString *)objc_msgSend(v5, "objectForKey:", v11);
        v13 = -[__CFString length](v11, "length");
        v14 = -[__CFString length](v12, "length");
        v40 = 0;
        usedBufLen = 0;
        v49.location = 0;
        v49.length = v13;
        Bytes = CFStringGetBytes(v11, v49, v3, 0x5Fu, 0, 0, 0, &usedBufLen);
        v50.location = 0;
        v50.length = v14;
        v16 = CFStringGetBytes(v12, v50, v3, 0x5Fu, 0, 0, 0, &v40);
        if (Bytes == v13 && v16 == v14)
        {
          v35 += usedBufLen + v40 + 2;
          objc_msgSend(obj, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v8);
    v7 = 0x1ED0A4000uLL;
    if (v35)
    {
      v18 = (UInt8 *)malloc_type_malloc(v35 + 2, 0xA495E794uLL);
      englishPhraseRoot_strings = (uint64_t)v18;
      *(_WORD *)&v18[v35] = 0;
      objc_msgSend(obj, "sortUsingSelector:", sel_compare_);
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      if (v19)
      {
        v20 = v19;
        v33 = *(_QWORD *)v37;
        while (2)
        {
          v21 = 0;
          v22 = v35;
          do
          {
            if (*(_QWORD *)v37 != v33)
              objc_enumerationMutation(obj);
            v23 = *(__CFString **)(*((_QWORD *)&v36 + 1) + 8 * v21);
            v24 = (__CFString *)objc_msgSend(v5, "objectForKey:", v23);
            v25 = -[__CFString length](v23, "length");
            v26 = -[__CFString length](v24, "length");
            v40 = 0;
            usedBufLen = 0;
            v51.location = 0;
            v51.length = v25;
            CFStringGetBytes(v23, v51, v3, 0x5Fu, 0, v18, v22, &usedBufLen);
            v27 = &v18[usedBufLen];
            v18[usedBufLen] = 0;
            v28 = v22 > usedBufLen + 1;
            v29 = v22 - (usedBufLen + 1);
            if (!v28)
              goto LABEL_27;
            v30 = v27 + 1;
            v52.location = 0;
            v52.length = v26;
            CFStringGetBytes(v24, v52, v3, 0x5Fu, 0, v27 + 1, v29, &v40);
            v31 = &v30[v40];
            v30[v40] = 0;
            v28 = v29 > v40 + 1;
            v22 = v29 - (v40 + 1);
            if (!v28)
            {
LABEL_27:
              v7 = 0x1ED0A4000uLL;
              goto LABEL_28;
            }
            v18 = v31 + 1;
            ++v21;
          }
          while (v20 != v21);
          v35 = v22;
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
          v7 = 0x1ED0A4000;
          if (v20)
            continue;
          break;
        }
      }
    }
  }
LABEL_28:
  result = *(uint64_t **)(v7 + 3288);
  if (result)
  {
    result = create_phrase_root_from_strings((const char *)result);
    englishPhraseRoot_phrase_root = (uint64_t)result;
  }
  return result;
}

- (void)_checkEnglishPhrasesInSentence:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 mutableCorrections:(id)a6
{
  id v9;
  CFStringEncoding v10;
  const void *v11;
  uint64_t v12;
  char *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unint64_t v16;
  void *v17;
  const __CFString *v18;
  __CFString *v19;
  CFIndex v20;
  uint64_t v21;
  uint64_t v22;
  AppleSpell *v23;
  _QWORD v25[10];
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  const char *v31;
  char *v32;

  v9 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("en"));
  v10 = objc_msgSend(v9, "encoding");
  v32 = a4;
  v23 = self;
  v11 = -[AppleSpell englishPhraseRoot](self, "englishPhraseRoot");
  if (v11 && a4)
  {
    v12 = (uint64_t)v11;
    v31 = 0;
    v13 = &a4[a5];
    v14 = (unsigned __int8 *)a4;
    while (v14 < (unsigned __int8 *)v13)
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 0;
      v15 = next_phrase(v14, v13 - (char *)v14, v12, (unsigned __int8 **)&v32, &v31);
      v16 = (unint64_t)v15;
      if (v15 < (unsigned __int8 *)a4 || !v15 || !v31 || v32 < (char *)v15)
      {
        _Block_object_dispose(&v27, 8);
        return;
      }
      v17 = (void *)-[__CFString lowercaseString]((id)(id)CFStringCreateWithBytes(0, v15, v32 - (char *)v15, v10, 0), "lowercaseString");
      v18 = (id)CFStringCreateWithCString(0, v31, v10);
      v19 = &stru_1EA8D8440;
      v20 = v16 - (_QWORD)a4;
      if (v16 > (unint64_t)a4)
        v19 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a4, v20, v10, 0);
      v21 = -[__CFString length](v19, "length", v20);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __98__AppleSpell_SentenceCorrection___checkEnglishPhrasesInSentence_buffer_length_mutableCorrections___block_invoke;
      v26[3] = &unk_1EA8CD178;
      v26[4] = v19;
      v26[5] = &v27;
      -[__CFString enumerateSubstringsInRange:options:usingBlock:](v19, "enumerateSubstringsInRange:options:usingBlock:", 0, v21, 771, v26);
      if (!*((_BYTE *)v28 + 24))
      {
        v22 = objc_msgSend(v17, "length");
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __98__AppleSpell_SentenceCorrection___checkEnglishPhrasesInSentence_buffer_length_mutableCorrections___block_invoke_2;
        v25[3] = &unk_1EA8CD5C8;
        v25[4] = v23;
        v25[5] = v9;
        v25[6] = v18;
        v25[7] = v17;
        v25[8] = v19;
        v25[9] = a6;
        objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v22, 3, v25);
      }
      _Block_object_dispose(&v27, 8);
      v14 = (unsigned __int8 *)v32;
      if (!v32)
        return;
    }
  }
}

unint64_t __98__AppleSpell_SentenceCorrection___checkEnglishPhrasesInSentence_buffer_length_mutableCorrections___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  unint64_t v9;
  unint64_t result;

  v9 = a3 + a4;
  result = objc_msgSend(*(id *)(a1 + 32), "length");
  if (v9 >= result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  *a7 = 1;
  return result;
}

void __98__AppleSpell_SentenceCorrection___checkEnglishPhrasesInSentence_buffer_length_mutableCorrections___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  PRSentenceCorrection *v18;
  PRSentenceCorrection *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "potentialSentenceCorrectionsForWord:languageObject:", a2, *(_QWORD *)(a1 + 40));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", objc_msgSend(*(id *)(a1 + 56), "stringByReplacingCharactersInRange:withString:", a3, a4, v16)))
        {
          v17 = objc_msgSend(*(id *)(a1 + 64), "length") + a3;
          v18 = [PRSentenceCorrection alloc];
          v25 = v16;
          v19 = -[PRSentenceCorrection initWithCategory:range:word:corrections:](v18, "initWithCategory:range:word:corrections:", 5, v17, a4, a2, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1));
          objc_msgSend(*(id *)(a1 + 72), "addObject:", v19);

          *a7 = 1;
          return;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v13)
        continue;
      break;
    }
  }
}

- (id)_checkSentence:(id)a3 languageObject:(id)a4
{
  void *v7;
  CFStringEncoding v8;
  CFIndex v9;
  unint64_t v10;
  uint64_t i;
  unsigned int v12;
  int v13;
  UInt8 *v14;
  CFIndex usedBufLen;
  UInt8 buffer[1025];
  uint64_t v18;
  CFRange v19;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = objc_msgSend(a4, "encoding");
  v9 = objc_msgSend(a3, "length");
  usedBufLen = 0;
  if (objc_msgSend(a4, "isEnglish"))
  {
    v19.location = 0;
    v19.length = v9;
    if (v9 == CFStringGetBytes((CFStringRef)a3, v19, v8, 0x5Fu, 0, buffer, 1024, &usedBufLen))
    {
      v10 = usedBufLen;
      if (usedBufLen)
      {
        for (i = 0; v10 != i; ++i)
        {
          v12 = buffer[i];
          v13 = 32;
          if (v12 > 0x9F)
          {
            if (buffer[i] > 0xB3u)
            {
              if (v12 == 187)
                goto LABEL_20;
              if (v12 == 180)
              {
LABEL_8:
                v13 = 39;
LABEL_22:
                buffer[i] = v13;
                v12 = v13;
              }
            }
            else
            {
              if (v12 == 160)
                goto LABEL_22;
              if (v12 == 171)
              {
LABEL_20:
                v13 = 34;
                goto LABEL_22;
              }
            }
          }
          else
          {
            if (buffer[i] > 0x81u)
            {
              switch(buffer[i])
              {
                case 0x82u:
                case 0x84u:
                case 0x8Bu:
                case 0x91u:
                case 0x92u:
                case 0x9Bu:
                  goto LABEL_8;
                case 0x85u:
                case 0x97u:
                  goto LABEL_22;
                case 0x93u:
                case 0x94u:
                  goto LABEL_20;
                case 0x96u:
                  v13 = 45;
                  goto LABEL_22;
                default:
                  goto LABEL_23;
              }
              goto LABEL_23;
            }
            if (v12 == 92 || v12 == 95)
              goto LABEL_22;
            if (v12 == 96)
              goto LABEL_8;
          }
LABEL_23:
          if (i + 2 < v10 && v12 == 46)
          {
            v14 = &buffer[i];
            if (buffer[i + 1] == 46 && v14[2] == 46)
            {
              v14[2] = 32;
              v14[1] = 32;
              buffer[i] = 32;
            }
          }
        }
      }
      buffer[v10] = 0;
      -[AppleSpell _checkEnglishArticlesInSentence:buffer:length:mutableCorrections:](self, "_checkEnglishArticlesInSentence:buffer:length:mutableCorrections:", a3, buffer);
      -[AppleSpell _checkEnglishPhrasesInSentence:buffer:length:mutableCorrections:](self, "_checkEnglishPhrasesInSentence:buffer:length:mutableCorrections:", a3, buffer, usedBufLen, v7);
    }
  }
  return v7;
}

- (void)_checkSentence:(id)a3 languageObject:(id)a4 mutableCorrections:(id)a5
{
  uint64_t v9;
  id v10;
  uint64_t i;

  if (_checkSentence_languageObject_mutableCorrections__onceToken != -1)
    dispatch_once(&_checkSentence_languageObject_mutableCorrections__onceToken, &__block_literal_global_58);
  v9 = objc_msgSend((id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionDictionary, "objectForKey:", a3);
  if (v9)
  {
    v10 = (id)v9;
    objc_msgSend((id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionArray, "removeObject:", a3);
  }
  else
  {
    v10 = -[AppleSpell _checkSentence:languageObject:](self, "_checkSentence:languageObject:", a3, a4);
    if ((unint64_t)objc_msgSend((id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionArray, "count") >= 0x80)
    {
      for (i = 0; i != 32; ++i)
        objc_msgSend((id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionDictionary, "removeObjectForKey:", objc_msgSend((id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionArray, "objectAtIndex:", i));
      objc_msgSend((id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionArray, "removeObjectsInRange:", 0, 32);
    }
    objc_msgSend((id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionDictionary, "setObject:forKey:", v10, a3);
  }
  objc_msgSend((id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionArray, "addObject:", a3);
  objc_msgSend(a5, "addObjectsFromArray:", v10);
}

id __83__AppleSpell_SentenceCorrection___checkSentence_languageObject_mutableCorrections___block_invoke()
{
  id result;

  _checkSentence_languageObject_mutableCorrections__sentenceCorrectionDictionary = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  result = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  _checkSentence_languageObject_mutableCorrections__sentenceCorrectionArray = (uint64_t)result;
  return result;
}

- (void)spellServer:(id)a3 checkSentenceCorrectionInString:(id)a4 rangeInParagraph:(_NSRange)a5 languageObject:(id)a6 locale:(id)a7 tagger:(id)a8 offset:(unint64_t)a9 keyEventArray:(id)a10 selectedRangeValue:(id)a11 autocorrect:(BOOL)a12 checkGrammar:(BOOL)a13 ignoreTermination:(BOOL)a14 mutableResults:(id)a15
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BOOL4 v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  NSUInteger v75;
  uint64_t v76;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v83;
  id obj;
  int v87;
  void *v88;
  _BOOL4 v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t i;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[6];
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v106;
  id v107;
  uint64_t *v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  char v124;
  _QWORD block[5];
  __int16 v126;
  __int16 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;

  length = a5.length;
  location = a5.location;
  v145 = *MEMORY[0x1E0C80C00];
  v127 = 8217;
  v126 = 0;
  v73 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v127, 1);
  v74 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v126, 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __222__AppleSpell_SentenceCorrection__spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults___block_invoke;
  block[3] = &unk_1EA8CCB00;
  block[4] = self;
  if (spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__onceToken != -1)
    dispatch_once(&spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__onceToken, block);
  v75 = location + length;
  if (location < location + length)
  {
    v18 = 0x1E0C99000uLL;
    v19 = a8;
    v76 = *MEMORY[0x1E0CCE0E8];
    do
    {
      v121 = 0;
      v122 = &v121;
      v123 = 0x2020000000;
      v124 = 0;
      v115 = 0;
      v116 = &v115;
      v117 = 0x3010000000;
      v118 = &unk_1DE2FED5E;
      v119 = 0;
      v120 = 0;
      v111 = 0;
      v112 = &v111;
      v113 = 0x2020000000;
      v114 = 0;
      v20 = objc_msgSend(v19, "sentenceRangeForRange:", location, 0);
      v21 = v116;
      v116[4] = v20;
      v21[5] = 0;
      v103 = MEMORY[0x1E0C809B0];
      v104 = 3221225472;
      v105 = __222__AppleSpell_SentenceCorrection__spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults___block_invoke_2;
      v106 = &unk_1EA8CD5F0;
      v107 = a4;
      v108 = &v121;
      v109 = &v115;
      v110 = &v111;
      v80 = v22;
      v81 = v20;
      objc_msgSend(v19, "enumerateTagsInRange:unit:scheme:options:usingBlock:");
      if ((*((_BYTE *)v122 + 24) || a14)
        && (unint64_t)v112[3] <= 0x50
        && (unint64_t)(v116[5] - 1) <= 0xFF)
      {
        obj = (id)objc_msgSend(*(id *)(v18 + 3560), "array");
        v83 = (void *)objc_msgSend(*(id *)(v18 + 3560), "array");
        v101 = xmmword_1DE2EC5B0;
        v102 = xmmword_1DE2EC5B0;
        v91 = (void *)objc_msgSend(a4, "substringWithRange:", v116[4], v116[5]);
        objc_msgSend(v91, "rangeOfString:", v74);
        if (v23)
          v91 = (void *)objc_msgSend(v91, "stringByReplacingOccurrencesOfString:withString:", v74, CFSTR("_"));
        objc_msgSend(v91, "rangeOfString:", v73);
        if (v24)
          v91 = (void *)objc_msgSend(v91, "stringByReplacingOccurrencesOfString:withString:", v73, CFSTR("'"));
        -[AppleSpell _checkSentence:languageObject:mutableCorrections:](self, "_checkSentence:languageObject:mutableCorrections:", v91, a6, obj);
        objc_msgSend(obj, "count");
        if (a12)
        {
          v141 = 0;
          v142 = &v141;
          v143 = 0x2020000000;
          v144 = 6;
          v100[0] = MEMORY[0x1E0C809B0];
          v100[1] = 3221225472;
          v100[2] = __222__AppleSpell_SentenceCorrection__spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults___block_invoke_3;
          v100[3] = &unk_1EA8CD618;
          v100[4] = &v115;
          v100[5] = &v141;
          objc_msgSend(a8, "enumerateTagsInRange:unit:scheme:options:usingBlock:", v81, v80, 0, v76, 6, v100);
          v25 = v142[3];
          if (v25 >= 0xD)
          {
            v142[3] = 12;
            v25 = 12;
          }
          if (v116[5] + v116[4] > v25
            && -[AppleSpell findMatchingRangesForRange:inString:keyEventArray:selectedRangeValue:matchingStringRange:correctableStringRange:matchingKeyEventRange:firstMisspelledKeyEventIndex:lastMisspelledKeyEventIndex:previousBackspaceCount:](self, "findMatchingRangesForRange:inString:keyEventArray:selectedRangeValue:matchingStringRange:correctableStringRange:matchingKeyEventRange:firstMisspelledKeyEventIndex:lastMisspelledKeyEventIndex:previousBackspaceCount:", &v101, 0, 0, 0, 0))
          {
            *(_QWORD *)&v102 = v102 + a9;
            *(_QWORD *)&v101 = v101 + a9;
          }
          _Block_object_dispose(&v141, 8);
        }
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v136, 16);
        if (v93)
        {
          v92 = *(_QWORD *)v97;
          do
          {
            for (i = 0; i != v93; ++i)
            {
              if (*(_QWORD *)v97 != v92)
                objc_enumerationMutation(obj);
              v26 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
              v94 = objc_msgSend(v26, "range");
              v28 = v27;
              if (v27)
              {
                v90 = v116[4];
                if (v94 + v27 <= (unint64_t)objc_msgSend(v91, "length"))
                {
                  v29 = (void *)objc_msgSend(v91, "substringWithRange:", v94, v28);
                  v30 = (void *)objc_msgSend(v26, "corrections");
                  v31 = -[AppleSpell potentialSentenceCorrectionsForWord:languageObject:](self, "potentialSentenceCorrectionsForWord:languageObject:", v29, a6);
                  if (objc_msgSend(v26, "presentAsSpellingError"))
                  {
                    v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
                    v134 = 0u;
                    v135 = 0u;
                    v132 = 0u;
                    v133 = 0u;
                    v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v132, &v141, 16);
                    v34 = v28;
                    v35 = v26;
                    if (v33)
                    {
                      v36 = *(_QWORD *)v133;
                      do
                      {
                        for (j = 0; j != v33; ++j)
                        {
                          if (*(_QWORD *)v133 != v36)
                            objc_enumerationMutation(v30);
                          objc_msgSend(v32, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v132 + 1) + 8 * j), "lowercaseString"));
                        }
                        v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v132, &v141, 16);
                      }
                      while (v33);
                    }
                    v130 = 0u;
                    v131 = 0u;
                    v128 = 0u;
                    v129 = 0u;
                    v38 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v128, &v137, 16);
                    v26 = v35;
                    if (v38)
                    {
                      v39 = *(_QWORD *)v129;
                      while (2)
                      {
                        for (k = 0; k != v38; ++k)
                        {
                          if (*(_QWORD *)v129 != v39)
                            objc_enumerationMutation(v31);
                          if ((objc_msgSend(v32, "containsObject:", objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * k), "lowercaseString")) & 1) != 0)
                          {
                            v26 = v35;
                            v28 = v34;
                            v89 = objc_msgSend(a3, "isWordInUserDictionaries:caseSensitive:", v29, 0) == 0;
                            goto LABEL_46;
                          }
                        }
                        v38 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v128, &v137, 16);
                        v26 = v35;
                        if (v38)
                          continue;
                        break;
                      }
                    }
                    v89 = 0;
                    v28 = v34;
                  }
                  else
                  {
                    v89 = 0;
                  }
LABEL_46:
                  if (a12)
                    v87 = objc_msgSend(v26, "presentAsAutocorrection");
                  else
                    v87 = 0;
                  v88 = v29;
                  if (v29)
                  {
                    if (objc_msgSend(v29, "length"))
                    {
                      v41 = objc_msgSend(v29, "rangeOfComposedCharacterSequenceAtIndex:", 0);
                      v43 = v42;
                      if (v42)
                      {
                        v44 = v41;
                        objc_msgSend(v29, "rangeOfCharacterFromSet:options:range:", objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet"), 0, v41, v42);
                        if (v45)
                        {
                          v46 = (void *)objc_msgSend(v29, "substringWithRange:", v44, v43);
                          if (objc_msgSend(v46, "isEqualToString:", objc_msgSend(v46, "capitalizedStringWithLocale:", a7)))
                          {
                            v47 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                            v139 = 0u;
                            v140 = 0u;
                            v137 = 0u;
                            v138 = 0u;
                            v48 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v137, &v141, 16);
                            if (v48)
                            {
                              v78 = v28;
                              v79 = v26;
                              v49 = *(_QWORD *)v138;
                              do
                              {
                                for (m = 0; m != v48; ++m)
                                {
                                  if (*(_QWORD *)v138 != v49)
                                    objc_enumerationMutation(v30);
                                  v51 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * m);
                                  if (objc_msgSend(v51, "length")
                                    && objc_msgSend(v51, "isEqualToString:", objc_msgSend(v51, "lowercaseStringWithLocale:", a7)))
                                  {
                                    v52 = objc_msgSend(v51, "rangeOfComposedCharacterSequenceAtIndex:", 0);
                                    v54 = v53;
                                    if (v53
                                      && (v55 = v52,
                                          v56 = v52 + v53,
                                          v52 + v53 < (unint64_t)objc_msgSend(v51, "length")))
                                    {
                                      v57 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v51, "substringWithRange:", v55, v54), "capitalizedStringWithLocale:", a7), "stringByAppendingString:", objc_msgSend(v51, "substringFromIndex:", v56));
                                    }
                                    else
                                    {
                                      v57 = objc_msgSend(v51, "capitalizedStringWithLocale:", a7);
                                    }
                                    v51 = (void *)v57;
                                  }
                                  objc_msgSend(v47, "addObject:", v51);
                                }
                                v48 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v137, &v141, 16);
                              }
                              while (v48);
                              v30 = v47;
                              v28 = v78;
                              v26 = v79;
                            }
                            else
                            {
                              v30 = v47;
                            }
                          }
                        }
                      }
                    }
                  }
                  v58 = v94 + a9 + v90;
                  v59 = v89;
                  if (spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__disableSpellingErrors)
                    v59 = 0;
                  if (v59)
                  {
                    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3930]), "initWithRange:", v58, v28);
                    objc_msgSend(a15, "addObject:", v60);

                  }
                  v61 = v87;
                  if (spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__disableAutocorrections)
                    v61 = 0;
                  v18 = 0x1E0C99000;
                  if (v61 == 1)
                  {
                    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3548]), "initWithRange:replacementString:", v58, v28, objc_msgSend(v30, "firstObject"));
                    objc_msgSend(a15, "addObject:", v62);

                  }
                  if (v89 || a13 && objc_msgSend(v26, "presentAsGrammarError"))
                  {
                    v63 = (void *)MEMORY[0x1E0CB3B18];
                    v64 = objc_msgSend(v26, "range");
                    v66 = objc_msgSend(v63, "valueWithRange:", v64, v65);
                    v67 = objc_msgSend(v26, "category");
                    if (v67 > 5)
                      v68 = 0;
                    else
                      v68 = qword_1DE2EFCC8[v67];
                    if (objc_msgSend(v26, "category") == 3)
                    {
                      v69 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Consider adding an article before the word ‘%@’."), v88);
                      v30 = 0;
                    }
                    else
                    {
                      if (objc_msgSend(v30, "count") == 1)
                      {
                        v70 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Consider ‘%@’ instead"), objc_msgSend(v30, "firstObject"));
                      }
                      else if (objc_msgSend(v30, "count") == 2)
                      {
                        v70 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Consider ‘%@’ or ‘%@’ instead"), objc_msgSend(v30, "firstObject"), objc_msgSend(v30, "lastObject"));
                      }
                      else
                      {
                        v70 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The word ‘%@’ may not agree with the rest of the sentence."), v88);
                      }
                      v69 = v70;
                    }
                    objc_msgSend(v83, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v66, CFSTR("NSGrammarRange"), v69, CFSTR("NSGrammarUserDescription"), v30, CFSTR("NSGrammarCorrections"), &unk_1EA8E7548, CFSTR("NSGrammarConfidenceScore"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v68), CFSTR("NSGrammarIssueType"), 0));
                  }
                }
              }
            }
            v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v136, 16);
          }
          while (v93);
        }
        if (objc_msgSend(v83, "count"))
        {
          v71 = objc_alloc(MEMORY[0x1E0CB3668]);
          v72 = (void *)objc_msgSend(v71, "initWithRange:details:", v116[4] + a9, v116[5], v83);
          objc_msgSend(a15, "addObject:", v72);

        }
      }
      _Block_object_dispose(&v111, 8);
      _Block_object_dispose(&v115, 8);
      _Block_object_dispose(&v121, 8);
      location = v81 + v80;
      v19 = a8;
    }
    while (v81 + v80 < v75);
  }
}

id __222__AppleSpell_SentenceCorrection__spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSSpellCheckerSentenceCorrectionDisableSpellingErrors")))
  {
    spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__disableSpellingErrors = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSSpellCheckerSentenceCorrectionDisableSpellingErrors"));
  }
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSSpellCheckerSentenceCorrectionDisableAutocorrections"));
  if (v2)
    LOBYTE(v2) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSSpellCheckerSentenceCorrectionDisableAutocorrections"));
  spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__disableAutocorrections = v2;
  spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__sentenceTerminatorCharacterSet = (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "sentenceTerminatorCharacterSet");
  result = (id)objc_msgSend((id)spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__sentenceTerminatorCharacterSet, "invertedSet");
  spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__nonSentenceTerminatorCharacterSet = (uint64_t)result;
  return result;
}

uint64_t __222__AppleSpell_SentenceCorrection__spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = result;
  if (*MEMORY[0x1E0CCE0A0] == a2 && a4 != 0)
  {
    result = objc_msgSend(*(id *)(result + 32), "rangeOfCharacterFromSet:options:range:", spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__sentenceTerminatorCharacterSet, 0, a3, a4);
    if (v8)
    {
      result = objc_msgSend(*(id *)(v6 + 32), "rangeOfCharacterFromSet:options:range:", spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__nonSentenceTerminatorCharacterSet, 0, a3, a4);
      if (!v9)
      {
        v10 = (void *)objc_msgSend(*(id *)(v6 + 32), "substringWithRange:", a3, a4);
        result = objc_msgSend(v10, "isEqualToString:", CFSTR(".."));
        if ((result & 1) == 0)
        {
          result = objc_msgSend(v10, "isEqualToString:", CFSTR("..."));
          if ((result & 1) == 0)
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24) = 1;
        }
      }
    }
  }
  v11 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8);
  v12 = *(_QWORD *)(v11 + 32);
  if (a3 + a4 > (unint64_t)(*(_QWORD *)(v11 + 40) + v12))
    *(_QWORD *)(v11 + 40) = a3 + a4 - v12;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 56) + 8) + 24);
  return result;
}

uint64_t __222__AppleSpell_SentenceCorrection__spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40)
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 32);
  if (a3 + 6 < v3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v3 - a3;
  return result;
}

- (BOOL)supportSentenceCorrectionForLanguageObject:(id)a3 appIdentifier:(id)a4
{
  if (supportSentenceCorrectionForLanguageObject_appIdentifier__onceToken != -1)
    dispatch_once(&supportSentenceCorrectionForLanguageObject_appIdentifier__onceToken, &__block_literal_global_98);
  if (supportSentenceCorrectionForLanguageObject_appIdentifier__sentenceCorrectionDisabled)
    return 0;
  if ((objc_msgSend(a3, "isEnglish") & 1) != 0)
    return 1;
  return objc_msgSend(a3, "isSpanish");
}

uint64_t __91__AppleSpell_SentenceCorrection__supportSentenceCorrectionForLanguageObject_appIdentifier___block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSSpellCheckerSentenceCorrectionDisabled"));
  if (result)
  {
    result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSSpellCheckerSentenceCorrectionDisabled"));
    supportSentenceCorrectionForLanguageObject_appIdentifier__sentenceCorrectionDisabled = result;
  }
  return result;
}

- (void)spellServer:(id)a3 checkSentenceCorrectionInString:(id)a4 range:(_NSRange)a5 languageObject:(id)a6 offset:(unint64_t)a7 keyEventArray:(id)a8 selectedRangeValue:(id)a9 autocorrect:(BOOL)a10 checkGrammar:(BOOL)a11 ignoreTermination:(BOOL)a12 mutableResults:(id)a13
{
  NSUInteger length;
  NSUInteger v16;
  uint64_t v19;
  id v20;
  id v21;
  BOOL v22;
  NSUInteger v23;
  NSUInteger v25;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  uint64_t v31;
  unint64_t v33;
  NSUInteger location;
  NSUInteger v35;

  v33 = 0;
  v35 = 0;
  location = a5.location;
  if (a6)
  {
    length = a5.length;
    v16 = a5.location;
    v19 = objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", objc_msgSend(a6, "identifier"));
    v20 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", a6, a4, v16, length);
    v21 = v20;
    if (v19)
      v22 = v20 == 0;
    else
      v22 = 1;
    v23 = v16 + length;
    if (!v22 && v16 < v23)
    {
      v25 = v16;
      do
      {
        objc_msgSend(a4, "getParagraphStart:end:contentsEnd:forRange:", &v35, &location, &v33, v25, 0);
        if (v35 < v23 && v33 > v35 && v33 > v16)
        {
          v28 = v33 - v35;
          if (v35 >= v16)
          {
            v29 = v35;
          }
          else
          {
            v28 = v33 - v16;
            v29 = v16;
          }
          if (v33 <= v23)
            v30 = v28;
          else
            v30 = v23 - v29;
          if (v30)
          {
            BYTE2(v31) = a12;
            LOWORD(v31) = __PAIR16__(a11, a10);
            -[AppleSpell spellServer:checkSentenceCorrectionInString:rangeInParagraph:languageObject:locale:tagger:offset:keyEventArray:selectedRangeValue:autocorrect:checkGrammar:ignoreTermination:mutableResults:](self, "spellServer:checkSentenceCorrectionInString:rangeInParagraph:languageObject:locale:tagger:offset:keyEventArray:selectedRangeValue:autocorrect:checkGrammar:ignoreTermination:mutableResults:", a3, a4, v29, v30, a6, v19, v21, a7, a8, a9, v31, a13);
          }
        }
        v25 = location;
      }
      while (location < v23);
    }
  }
  else
  {
    v21 = 0;
  }
  -[AppleSpell invalidateTagger:](self, "invalidateTagger:", v21);
}

- (id)potentialSentenceCorrectionsForWord:(id)a3 languageObject:(id)a4
{
  uint64_t *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  AppleSpell *v13;
  uint64_t block;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  AppleSpell *v18;

  if (objc_msgSend(a4, "isEnglish"))
  {
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __85__AppleSpell_SentenceCorrection__potentialSentenceCorrectionsForWord_languageObject___block_invoke;
    v17 = &unk_1EA8CCB00;
    v18 = self;
    if (potentialSentenceCorrectionsForWord_languageObject__onceToken != -1)
      dispatch_once(&potentialSentenceCorrectionsForWord_languageObject__onceToken, &block);
    v7 = &potentialSentenceCorrectionsForWord_languageObject__potentialCorrectionsDictionary;
    return (id)objc_msgSend((id)objc_msgSend((id)*v7, "objectForKey:", objc_msgSend(a3, "lowercaseString", v9, v10, v11, v12, v13, block, v15, v16, v17, v18)), "componentsSeparatedByString:", CFSTR("/"));
  }
  if (objc_msgSend(a4, "isSpanish"))
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __85__AppleSpell_SentenceCorrection__potentialSentenceCorrectionsForWord_languageObject___block_invoke_2;
    v12 = &unk_1EA8CCB00;
    v13 = self;
    if (potentialSentenceCorrectionsForWord_languageObject__onceToken_103 != -1)
      dispatch_once(&potentialSentenceCorrectionsForWord_languageObject__onceToken_103, &v9);
    v7 = &potentialSentenceCorrectionsForWord_languageObject__potentialCorrectionsDictionary_102;
    return (id)objc_msgSend((id)objc_msgSend((id)*v7, "objectForKey:", objc_msgSend(a3, "lowercaseString", v9, v10, v11, v12, v13, block, v15, v16, v17, v18)), "componentsSeparatedByString:", CFSTR("/"));
  }
  return 0;
}

id __85__AppleSpell_SentenceCorrection__potentialSentenceCorrectionsForWord_languageObject___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "sentenceCorrectionsDictionaryForLanguageObject:", +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("en")));
  potentialSentenceCorrectionsForWord_languageObject__potentialCorrectionsDictionary = (uint64_t)result;
  return result;
}

id __85__AppleSpell_SentenceCorrection__potentialSentenceCorrectionsForWord_languageObject___block_invoke_2(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "sentenceCorrectionsDictionaryForLanguageObject:", +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("es")));
  potentialSentenceCorrectionsForWord_languageObject__potentialCorrectionsDictionary_102 = (uint64_t)result;
  return result;
}

- (unint64_t)numberOfTurkishSuffixPointsInBuffer:(char *)a3 length:(unint64_t)a4 maxSuffixPoints:(unint64_t)a5 suffixPoints:(id *)a6
{
  size_t v7;
  unint64_t v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__AppleSpell_Turkish__numberOfTurkishSuffixPointsInBuffer_length_maxSuffixPoints_suffixPoints___block_invoke;
  v10[3] = &unk_1EA8CDAE8;
  v10[4] = &v11;
  v10[5] = a5;
  v10[6] = a6;
  +[PRTurkishSuffix enumerateSuffixMatchesForBuffer:length:options:usingBlock:](PRTurkishSuffix, "enumerateSuffixMatchesForBuffer:length:options:usingBlock:", a3, a4, 2, v10);
  v7 = v12[3];
  if (v7)
  {
    qsort_b(a6, v7, 0x10uLL, &__block_literal_global_6);
    v8 = v12[3];
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v8;
}

_QWORD *__95__AppleSpell_Turkish__numberOfTurkishSuffixPointsInBuffer_length_maxSuffixPoints_suffixPoints___block_invoke(_QWORD *result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2 >= 2 && a6 - 1 <= 0xB)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
    if (v6 < result[5])
    {
      v7 = a6 > 4;
      if (a6 == 12)
        v7 = 2;
      v8 = result[6];
      if (v6)
      {
        v9 = 0;
        v10 = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
        while (*(_QWORD *)(v8 + v9) != a2 || *(_DWORD *)(v8 + v9 + 8) != v7)
        {
          v8 = result[6];
          v9 += 16;
          if (!--v10)
            goto LABEL_11;
        }
      }
      else
      {
LABEL_11:
        *(_QWORD *)(v8 + 16 * v6) = a2;
        *(_DWORD *)(v8 + 16 * (*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24))++ + 8) = v7;
      }
    }
  }
  return result;
}

uint64_t __95__AppleSpell_Turkish__numberOfTurkishSuffixPointsInBuffer_length_maxSuffixPoints_suffixPoints___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  _BOOL4 v7;

  if (*(_QWORD *)a2 < *(_QWORD *)a3)
    return 0xFFFFFFFFLL;
  if (*(_QWORD *)a2 > *(_QWORD *)a3)
    return 1;
  v4 = *(_DWORD *)(a2 + 8);
  v5 = *(_DWORD *)(a3 + 8);
  v6 = v4 >= v5;
  v7 = v4 > v5;
  if (v6)
    return v7;
  else
    return 0xFFFFFFFFLL;
}

- (BOOL)testTurkishSuffixationPattern:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  BOOL v20;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[36];
  _QWORD __base[37];

  __base[36] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1EA8D8440);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v4);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v6 = objc_msgSend(a3, "length");
  if (v6)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = objc_msgSend(a3, "rangeOfString:options:range:", CFSTR("-"), 0, v8, v6 - v8);
      if (!v11)
        break;
      if (v9 > 0x23)
        break;
      v27[v9++] = v10 + v7;
      v8 = v10 + v11;
      --v7;
    }
    while (v10 + v11 < v6);
  }
  else
  {
    v9 = 0;
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__AppleSpell_Turkish__testTurkishSuffixationPattern___block_invoke;
  v22[3] = &unk_1EA8CDB30;
  v22[4] = &v23;
  v22[5] = __base;
  +[PRTurkishSuffix enumerateSuffixMatchesForWord:options:usingBlock:](PRTurkishSuffix, "enumerateSuffixMatchesForWord:options:usingBlock:", v4, 2, v22);
  v12 = v24[3];
  if (v12)
  {
    qsort_b(__base, v12, 8uLL, &__block_literal_global_1127);
    v13 = v24[3];
    if (v13)
    {
      v14 = 0;
      v15 = -1;
      do
      {
        objc_msgSend(v5, "replaceCharactersInRange:withString:", __base[v13 + v15], 0, CFSTR("-"));
        ++v14;
        v13 = v24[3];
        --v15;
      }
      while (v14 < v13);
    }
    if (!v9)
      goto LABEL_20;
  }
  else
  {
    v13 = 0;
    if (!v9)
      goto LABEL_20;
  }
  v16 = 0;
  while (2)
  {
    v17 = __base;
    v18 = v13;
    do
    {
      if (!v18)
      {
        v20 = 0;
        goto LABEL_22;
      }
      v19 = *v17++;
      --v18;
    }
    while (v19 != v27[v16]);
    if (++v16 < v9)
      continue;
    break;
  }
LABEL_20:
  v20 = 1;
LABEL_22:
  _Block_object_dispose(&v23, 8);
  return v20;
}

uint64_t __53__AppleSpell_Turkish__testTurkishSuffixationPattern___block_invoke(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t i;
  uint64_t v7;

  if (a2 >= 2)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    v3 = *(_QWORD *)(v2 + 24);
    if (v3 <= 0x23)
    {
      v4 = *(uint64_t **)(result + 40);
      v5 = v4;
      for (i = *(_QWORD *)(v2 + 24); i; --i)
      {
        v7 = *v5++;
        if (v7 == a2)
          return result;
      }
      *(_QWORD *)(v2 + 24) = v3 + 1;
      v4[v3] = a2;
    }
  }
  return result;
}

uint64_t __53__AppleSpell_Turkish__testTurkishSuffixationPattern___block_invoke_2(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 < *a3)
    return 0xFFFFFFFFLL;
  else
    return *a2 > *a3;
}

- (unint64_t)acceptabilityOfWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 forPrediction:(BOOL)a6 alreadyCapitalized:(BOOL)a7 depth:(unint64_t)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  CFStringEncoding v15;
  unint64_t v16;
  unint64_t v17;
  CFStringEncoding v18;
  const char *v19;
  char *v20;
  size_t v21;
  _BOOL8 v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  BOOL v27;
  unint64_t v28;
  int v29;
  __CFString *v30;
  unsigned int v31;
  int v32;
  BOOL v33;
  BOOL v34;
  uint64_t v35;
  unint64_t v37;
  int v38;
  BOOL v40;
  BOOL v41;
  char *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  int v46;
  int v47;
  uint64_t v48;

  v9 = a7;
  v10 = a6;
  v48 = 0;
  v47 = 0;
  v15 = objc_msgSend(a5, "encoding");
  v16 = a4 - 2;
  if (a4 < 2)
    return 2;
  v18 = v15;
  if (-[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", a3, a4, a5, 8))
  {
    if (a4 == 4)
    {
      v19 = "sean";
      v20 = a3;
      v21 = 4;
    }
    else
    {
      if (a4 != 2)
        return 0;
      if (!strncasecmp_l(a3, "sa", 2uLL, 0))
        goto LABEL_16;
      v19 = "se";
      v20 = a3;
      v21 = 2;
    }
    v17 = 0;
    if (strncasecmp_l(v20, v19, v21, 0))
      return v17;
LABEL_16:
    if ((objc_msgSend(a5, "isIrishGaelic") & 1) == 0)
      return 0;
LABEL_17:
    if (a4 < 4)
      goto LABEL_29;
    goto LABEL_18;
  }
  if (a4 < 6 || v18 != 517)
    goto LABEL_17;
  if (a3[a4 - 1] == 235 && a3[a4 - 2] == 230 && a3[a4 - 3] == 236)
    return 0;
LABEL_18:
  v22 = v10;
  v23 = v9;
  v24 = a8;
  v25 = 5;
  do
  {
    v26 = strncasecmp_l(&a3[v25 - 5], "porn", 4uLL, 0);
    v27 = v26 == 0;
    if (!v26)
      break;
    v40 = v25++ > a4;
  }
  while (!v40);
  if (v26 && a4 >= 6)
  {
    v28 = 7;
    do
    {
      v29 = strncasecmp_l(&a3[v28 - 7], "hitler", 6uLL, 0);
      v27 = v29 == 0;
      if (!v29)
        break;
      v40 = v28++ > a4;
    }
    while (!v40);
  }
  a8 = v24;
  v9 = v23;
  v10 = v22;
  v16 = a4 - 2;
  if (v27)
    return 0;
LABEL_29:
  v30 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, a4, v18, 0);
  if (v30
    && -[AppleSpell getMetaFlagsForWord:inLexiconForLanguageObject:metaFlags:otherMetaFlags:](self, "getMetaFlagsForWord:inLexiconForLanguageObject:metaFlags:otherMetaFlags:", v30, a5, (char *)&v48 + 4, &v48))
  {
    v31 = HIDWORD(v48);
    if (v9)
    {
      if ((v48 & 0x200000000) == 0)
      {
        v32 = 0;
LABEL_37:
        v46 = 1;
        goto LABEL_38;
      }
      v31 = v48;
    }
    v32 = (v31 >> 1) & 1;
    goto LABEL_37;
  }
  v46 = 0;
  v32 = 0;
LABEL_38:
  if (objc_msgSend(a5, "isEnglish")
    && (unint64_t)-[__CFString length](v30, "length") >= 4
    && -[__CFString hasSuffix:](v30, "hasSuffix:", CFSTR("'s"))
    && -[AppleSpell getMetaFlagsForWord:inLexiconForLanguageObject:metaFlags:otherMetaFlags:](self, "getMetaFlagsForWord:inLexiconForLanguageObject:metaFlags:otherMetaFlags:", -[__CFString substringToIndex:](v30, "substringToIndex:", -[__CFString length](v30, "length") - 2), a5, &v47, 0))
  {
    v32 &= v47 >> 1;
  }
  if (objc_msgSend(a5, "isEnglish") && -[__CFString length](v30, "length") == 2)
  {
    if ((v32 & ~-[__CFString isEqual:](v30, "isEqual:", CFSTR("ve")) & 1) == 0)
      goto LABEL_46;
    return 0;
  }
  if ((v32 & 1) != 0)
    return 0;
LABEL_46:
  if (v10)
  {
    if (v46)
    {
      if (v9)
      {
        v33 = (v48 & 4) == 0 || (v48 & 0x400000000) == 0;
        v34 = (v48 & 0x80) == 0 || (v48 & 0x8000000000) == 0;
        LODWORD(v35) = 1;
        if (v34 && v33)
        {
          if (v9)
            goto LABEL_59;
          goto LABEL_92;
        }
LABEL_93:
        if (v30)
        {
          if ((_DWORD)v35)
          {
            v35 = -[__CFString compare:options:](v30, "compare:options:", CFSTR("covid"), 1);
            if (v35)
            {
              v17 = 1;
              v35 = -[__CFString compare:options:](v30, "compare:options:", CFSTR("covid-19"), 1);
              if (v35)
                return v17;
            }
          }
        }
        goto LABEL_60;
      }
      if ((v48 & 0x8400000000) != 0)
      {
        LODWORD(v35) = 1;
        goto LABEL_93;
      }
    }
LABEL_92:
    LODWORD(v35) = -[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](self, "checkNameWordBuffer:length:languageObject:globalOnly:", a3, a4, a5, 0);
    goto LABEL_93;
  }
LABEL_59:
  LOBYTE(v35) = 0;
LABEL_60:
  if ((v35 & 1) != 0 || ((v46 ^ 1) & 1) != 0 || (v48 & 0x8000000000) == 0)
  {
    if ((v35 & 1) != 0)
      return 1;
  }
  else if ((objc_msgSend(a5, "isKorean") & 1) != 0)
  {
    return 1;
  }
  if (a8 > 3)
    return 2;
  v37 = 0;
  v17 = 2;
  while (1)
  {
    v38 = a3[v37];
    if ((v38 - 32) <= 0x3F && ((1 << (v38 - 32)) & 0x800000000400E001) != 0)
      break;
    v40 = v16 != v37 && v37 > 1;
    v41 = !v40 || a4 - 1 == v37;
    if (v41 && v38 == 39)
      break;
    if (++v37 >= a4)
      return v17;
  }
  v42 = &a3[v37];
  v43 = a8 + 1;
  v44 = -[AppleSpell acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:depth:](self, "acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:depth:", a3, v37, a5, v10, v9, v43);
  v45 = -[AppleSpell acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:depth:](self, "acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:depth:", v42 + 1, ~v37 + a4, a5, v10, v9, v43);
  if (v44 >= v45)
    return v45;
  else
    return v44;
}

- (unint64_t)acceptabilityOfWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 forPrediction:(BOOL)a6 alreadyCapitalized:(BOOL)a7
{
  return -[AppleSpell acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:depth:](self, "acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:depth:", a3, a4, a5, a6, a7, 0);
}

- (BOOL)checkNegativeWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 alreadyCapitalized:(BOOL)a6
{
  return -[AppleSpell acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:depth:](self, "acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:depth:", a3, a4, a5, 0, a6, 0) == 0;
}

- (BOOL)checkNegativeWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5
{
  return -[AppleSpell checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:](self, "checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:", a3, a4, a5, 0);
}

- (BOOL)checkNoCapAbbreviationWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5
{
  CFStringEncoding v9;
  unint64_t v10;
  CFStringEncoding v11;
  unint64_t v12;
  int v13;
  const __CFString *v15;
  __CFString *v16;

  v9 = objc_msgSend(a5, "encoding");
  if (a4 < 3)
    goto LABEL_16;
  v10 = a4 - 1;
  if (a3[v10] != 46)
    goto LABEL_16;
  v11 = v9;
  v12 = 0;
  do
    v13 = a3[v12++];
  while (v13 != 46 && v12 < v10);
  if (v13 == 46
    || -[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", a3, v10, a5, 10))
  {
LABEL_11:
    LOBYTE(v15) = 1;
    return (char)v15;
  }
  v15 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v10, v11, 0);
  if (!v15)
    return (char)v15;
  v16 = (__CFString *)v15;
  if (!-[AppleSpell validateNoCapAbbreviation:inLexiconForLanguageObject:](self, "validateNoCapAbbreviation:inLexiconForLanguageObject:", v15, a5))
  {
    if ((-[__CFString hasSuffix:](v16, "hasSuffix:", CFSTR(".")) & 1) == 0)
    {
      LODWORD(v15) = -[AppleSpell validateNoCapAbbreviation:inLexiconForLanguageObject:](self, "validateNoCapAbbreviation:inLexiconForLanguageObject:", -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", CFSTR(".")), a5);
      goto LABEL_19;
    }
LABEL_16:
    LOBYTE(v15) = 0;
    return (char)v15;
  }
  LODWORD(v15) = 1;
LABEL_19:
  if (v10 == 2 && (_DWORD)v15 && v11 == 1280)
  {
    if (*a3 == 78)
    {
      LOBYTE(v15) = a3[1] != 111;
      return (char)v15;
    }
    goto LABEL_11;
  }
  return (char)v15;
}

- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 connection:(_PR_DB_IO *)a5
{
  BOOL v5;
  char v8;
  _OWORD v10[15];
  __int128 v11;
  int v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v5 = 0;
  v23 = *MEMORY[0x1E0C80C00];
  if (a5 && a4 - 1 <= 0x3E)
  {
    v8 = a3[a4];
    a3[a4] = 0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0;
    memset(v10, 0, sizeof(v10));
    v11 = 0u;
    HIDWORD(v11) = 0;
    v12 = 0;
    v13 = a3;
    *(_QWORD *)&v20 = v10;
    BYTE7(v21) = 1;
    *(_WORD *)((char *)&v21 + 9) = *(_WORD *)&a5->var0;
    v5 = PRword((uint64_t)&v13, 3, 0) == 0;
    PRword((uint64_t)&v13, 17, 0);
    a3[a4] = v8;
  }
  return v5;
}

- (BOOL)validateWordPrefixBuffer:(char *)a3 length:(unint64_t)a4 connection:(_PR_DB_IO *)a5
{
  BOOL v5;
  char v8;
  char v9;
  _OWORD v11[15];
  __int128 v12;
  int v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v5 = 0;
  v24 = *MEMORY[0x1E0C80C00];
  if (a5 && a4 - 1 <= 0x16)
  {
    v8 = a3[a4];
    v9 = a3[a4 + 1];
    *(_WORD *)&a3[a4] = 42;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0;
    memset(v11, 0, sizeof(v11));
    v12 = 0u;
    HIDWORD(v12) = 0;
    v13 = 0;
    v14 = a3;
    *(_QWORD *)&v21 = v11;
    BYTE7(v22) = 1;
    *(_WORD *)((char *)&v22 + 9) = *(_WORD *)&a5->var0;
    v5 = 0;
    if (!PRword((uint64_t)&v14, 5, 0))
      v5 = (_QWORD)v15 && *(_QWORD *)(v15 + 8) && *(_QWORD *)v15 && *(_WORD *)(v15 + 18) != 0;
    PRword((uint64_t)&v14, 17, 0);
    a3[a4] = v8;
    a3[a4 + 1] = v9;
  }
  return v5;
}

- (BOOL)validateAbbreviationOrNumberWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7
{
  int v10;
  BOOL v11;
  int v12;
  char v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  _BOOL4 v25;
  int v26;
  BOOL v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  unsigned int v34;
  BOOL v35;
  BOOL v36;
  BOOL v37;
  int v40;
  _BOOL4 v42;
  int v43;
  uint64_t v44;
  int v45;
  int v46;
  int v47;
  int v48;
  unsigned int v49;
  BOOL v50;
  BOOL v52;
  _BOOL4 v53;
  int v54;
  int v55;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  int v61;
  unsigned int v62;
  BOOL v63;
  int v64;
  int v65;
  int v66;
  _BOOL4 v68;
  int v69;
  unint64_t v70;
  char v71;
  char v72;
  int v73;

  v10 = objc_msgSend(a5, "encoding");
  v11 = a4 < 7 || a6 == 0;
  v12 = v11;
  if (v11 && (v10 & 0xFFFFFFFB) == 0x500)
  {
    v13 = 1;
    if (!a4)
      return v13 & 1;
    v14 = 0;
    v15 = 1;
    v16 = 1;
    v17 = 1;
    do
    {
      v18 = a3[v14];
      v19 = v18 - 216;
      if (v18 - 192 < 0x17
        || (v18 <= 0xF7 ? (v20 = v19 >= 0x1F) : (v20 = 0),
            v20 ? (v21 = (v18 & 0xFFFFFFDF) - 65 >= 0x1A) : (v21 = 0),
            !v21 || (v18 - 138 <= 0x15 ? (v22 = ((1 << (v18 + 118)) & 0x350015) == 0) : (v22 = 1), !v22)))
      {
        v23 = v18 - 65 >= 0x1A && v18 - 192 >= 0x17;
        if (v23 && v19 >= 7)
        {
          v25 = a4 != 3 || v14 != 2;
          v26 = v17 & v16 & v25;
          v27 = v18 - 138 > 0x15 || ((1 << (v18 + 118)) & 0x200015) == 0;
          if (v27)
            v17 = 0;
          if (v27)
            v16 = v26;
        }
      }
      v28 = (v18 == 46) & v15;
      if ((v14 & 1) != 0)
        v15 = v28;
      ++v14;
    }
    while (a4 != v14);
    if (((v16 | v15) & 1) != 0)
      goto LABEL_121;
  }
  v29 = v10 == 514 ? v12 : 0;
  if (v29 == 1)
  {
    v13 = 1;
    if (!a4)
      return v13 & 1;
    v30 = 0;
    v31 = 1;
    v32 = 1;
    v33 = 1;
    do
    {
      v34 = a3[v30];
      if (v34 - 192 < 0x17
        || (v34 <= 0xF7 ? (v35 = v34 - 216 >= 0x1F) : (v35 = 0),
            v35 ? (v36 = (v34 & 0xFFFFFFDF) - 65 >= 0x1A) : (v36 = 0),
            !v36 || (v34 - 161 <= 0x1E ? (v37 = ((1 << (v34 + 95)) & 0x6F356F35) == 0) : (v37 = 1), !v37)))
      {
        if (v34 - 65 >= 0x1A
          && v34 - 192 >= 0x17
          && (v34 - 161 > 0x3D || ((1 << (v34 + 95)) & 0x3F80000000006F35) == 0))
        {
          v42 = a4 != 3 || v30 != 2;
          v32 &= v33 & v42;
          v33 = 0;
        }
      }
      v40 = (v34 == 46) & v31;
      if ((v30 & 1) != 0)
        v31 = v40;
      ++v30;
    }
    while (a4 != v30);
    if (((v32 | v31) & 1) != 0)
      goto LABEL_121;
  }
  v43 = v10 == 517 ? v12 : 0;
  if (v43 != 1)
    goto LABEL_129;
  if (!a4)
    goto LABEL_127;
  v44 = 0;
  v45 = 1;
  v46 = 1;
  v47 = 1;
  do
  {
    v48 = a3[v44];
    v49 = v48 - 174;
    if ((v48 - 161) < 0xC
      || (v49 >= 0x42 ? (v50 = (v48 & 0xFFFFFFDF) - 65 >= 0x1A) : (v50 = 0),
          !v50 || (v48 - 241) < 0xC || (v48 & 0xFE) == 0xFE))
    {
      if ((v48 - 161) >= 0xC && (v48 - 65) >= 0x1A)
      {
        v52 = a4 == 3 && v44 == 2;
        v53 = !v52;
        v54 = v47 & v46 & v53;
        if (v49 >= 0x22)
        {
          v47 = 0;
          v46 = v54;
        }
      }
    }
    v55 = (v48 == 46) & v45;
    if ((v44 & 1) != 0)
      v45 = v55;
    ++v44;
  }
  while (a4 != v44);
  if (((v46 | v45) & 1) != 0)
  {
LABEL_121:
    v13 = 1;
  }
  else
  {
LABEL_129:
    if (v10 != 134217984)
      v12 = 0;
    if (v12 == 1)
    {
      if (a4)
      {
        v57 = 0;
        v58 = 1;
        v59 = 1;
        v60 = 1;
        do
        {
          v61 = a3[v57];
          v62 = v61 - 97;
          v63 = (v61 - 65) >= 0x1A && (v61 - 48) >= 0xA;
          if (v63)
            v64 = 0;
          else
            v64 = v60;
          if (v63)
            v65 = 0;
          else
            v65 = v59;
          if (v63)
            v66 = 0;
          else
            v66 = v58;
          v68 = a4 != 3 || v57 != 2;
          v59 &= v60 & v68;
          if (v62 <= 0x19)
            v60 = 0;
          else
            v60 = v64;
          if (v62 > 0x19)
          {
            v59 = v65;
            v58 = v66;
          }
          v69 = (v61 == 46) & v58;
          if ((v57 & 1) != 0)
            v58 = v69;
          ++v57;
        }
        while (a4 != v57);
      }
      else
      {
        LOBYTE(v59) = 1;
        LOBYTE(v58) = 1;
      }
      v13 = v59 | v58;
    }
    else
    {
      v13 = 0;
    }
    if (a4 >= 3 && (v13 & 1) == 0)
    {
      if (a4 != 4 && a4 != 40 && (*a3 != 48 || a3[1] != 120))
      {
        v13 = 0;
        return v13 & 1;
      }
      if (*a3 == 48)
        v70 = 2 * (a3[1] == 120);
      else
        v70 = 0;
      v71 = 1;
      v72 = 1;
      do
      {
        v73 = a3[v70];
        if ((v73 - 48) >= 0xA)
        {
          v72 &= (v73 - 97) < 6;
          v71 &= (v73 - 65) < 6;
        }
        v13 = v72 | v71;
        if (((v72 | v71) & 1) == 0)
          break;
        ++v70;
      }
      while (v70 < a4);
    }
  }
  if (a4 == 3 && (v13 & 1) != 0)
  {
    if (*a3 == 79 && a3[1] == 83)
    {
      v13 = a3[2] != 88;
      return v13 & 1;
    }
LABEL_127:
    v13 = 1;
  }
  return v13 & 1;
}

- (BOOL)checkSpecialPrefixesForWordBuffer:(char *)a3 length:(unint64_t)a4
{
  uint64_t v4;
  int v5;
  char v10;
  unsigned __int8 v11;
  char v12;
  char v13;
  unsigned __int8 v14;
  char v15;
  char v16;
  char v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a4 - 1 > 0x47)
    return 0;
  v4 = 0;
  do
  {
    v5 = a3[v4];
    if ((v5 - 65) < 0x1A || (v5 - 192) < 0x17)
    {
      if ((v5 - 138) > 0x15 || ((1 << (v5 + 118)) & 0x200015) == 0)
      {
LABEL_14:
        LOBYTE(v5) = v5 + 32;
        goto LABEL_22;
      }
LABEL_19:
      if (v5 == 159)
        LOBYTE(v5) = -1;
      else
        LOBYTE(v5) = v5 + 16;
      goto LABEL_22;
    }
    if ((v5 - 216) < 7)
      goto LABEL_14;
    if ((v5 - 138) <= 0x15 && ((1 << (v5 + 118)) & 0x200015) != 0)
      goto LABEL_19;
LABEL_22:
    *(&v10 + v4++) = v5;
  }
  while (a4 != v4);
  return a4 >= 4 && v10 == 106 && v11 == 252 && v12 == 100
      || a4 >= 5 && v10 == 106 && v11 == 117 && v12 == 100 && v13 == 101
      || a4 >= 0xA
      && v10 == 97
      && v11 == 117
      && v12 == 115
      && v13 == 108
      && v14 == 228
      && v15 == 110
      && v16 == 100
      && v17 == 101
      && v18 == 114
      || a4 >= 0xA
      && v10 == 101
      && v11 == 110
      && v12 == 100
      && v13 == 108
      && v14 == 246
      && v15 == 115
      && v16 == 117
      && v17 == 110
      && v18 == 103
      || a4 >= 7 && v10 == 104 && v11 == 105 && v12 == 116 && v13 == 108 && v14 == 101 && v15 == 114
      || a4 >= 7 && v10 == 103 && v11 == 246 && v12 == 114 && v13 == 105 && v14 == 110 && v15 == 103;
}

- (id)stringByRemovingArabicDiacriticsFromString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (stringByRemovingArabicDiacriticsFromString__onceToken != -1)
    dispatch_once(&stringByRemovingArabicDiacriticsFromString__onceToken, &__block_literal_global_7);
  v4 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", stringByRemovingArabicDiacriticsFromString__diacriticCharacterSet, 4, 0, objc_msgSend(a3, "length"));
  if (v5)
  {
    v6 = v4;
    v7 = v5;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a3);
    do
    {
      objc_msgSend(v8, "replaceCharactersInRange:withString:", v6, v7, &stru_1EA8D8440);
      if (!v6)
        break;
      v6 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", stringByRemovingArabicDiacriticsFromString__diacriticCharacterSet, 4, 0, v6);
      v7 = v9;
    }
    while (v9);
    return v8;
  }
  return a3;
}

id __67__AppleSpell_Spelling__stringByRemovingArabicDiacriticsFromString___block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 1611, 8);
  stringByRemovingArabicDiacriticsFromString__diacriticCharacterSet = (uint64_t)result;
  return result;
}

- (id)stringByReducingArabicAlefVariantsInString:(id)a3
{
  uint64_t v4;

  if (stringByReducingArabicAlefVariantsInString__onceToken != -1)
    dispatch_once(&stringByReducingArabicAlefVariantsInString__onceToken, &__block_literal_global_18);
  objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", stringByReducingArabicAlefVariantsInString__alefVariantSet, 0, 0, objc_msgSend(a3, "length"));
  if (v4)
  {
    a3 = (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a3);
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("آ"), CFSTR("ا"), 0, 0, objc_msgSend(a3, "length"));
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("أ"), CFSTR("ا"), 0, 0, objc_msgSend(a3, "length"));
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("إ"), CFSTR("ا"), 0, 0, objc_msgSend(a3, "length"));
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("ا53"), CFSTR("ا"), 0, 0, objc_msgSend(a3, "length"));
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("ا54"), CFSTR("ا"), 0, 0, objc_msgSend(a3, "length"));
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("ا55"), CFSTR("ا"), 0, 0, objc_msgSend(a3, "length"));
  }
  return a3;
}

id __67__AppleSpell_Spelling__stringByReducingArabicAlefVariantsInString___block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("آأإٕٓٔ"));
  stringByReducingArabicAlefVariantsInString__alefVariantSet = (uint64_t)result;
  return result;
}

- (id)stringByRemovingHebrewDiacriticsFromString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (stringByRemovingHebrewDiacriticsFromString__onceToken != -1)
    dispatch_once(&stringByRemovingHebrewDiacriticsFromString__onceToken, &__block_literal_global_35);
  v4 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", stringByRemovingHebrewDiacriticsFromString__diacriticCharacterSet, 4, 0, objc_msgSend(a3, "length"));
  if (v5)
  {
    v6 = v4;
    v7 = v5;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a3);
    do
    {
      objc_msgSend(v8, "replaceCharactersInRange:withString:", v6, v7, &stru_1EA8D8440);
      if (!v6)
        break;
      v6 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", stringByRemovingHebrewDiacriticsFromString__diacriticCharacterSet, 4, 0, v6);
      v7 = v9;
    }
    while (v9);
    return v8;
  }
  return a3;
}

id __67__AppleSpell_Spelling__stringByRemovingHebrewDiacriticsFromString___block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 1456, 14);
  stringByRemovingHebrewDiacriticsFromString__diacriticCharacterSet = (uint64_t)result;
  return result;
}

- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkBase:(BOOL)a8 checkDict:(BOOL)a9 checkTemp:(BOOL)a10 checkUser:(BOOL)a11 checkNames:(BOOL)a12 checkHyphens:(BOOL)a13 checkIntercaps:(BOOL)a14 checkOptions:(BOOL)a15 forCorrection:(BOOL)a16 depth:(unint64_t)a17
{
  _BOOL4 v17;
  BOOL v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unint64_t v27;
  int v28;
  unint64_t v29;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  int v38;
  unsigned int v39;
  int v40;
  unsigned int v41;
  unint64_t i;
  unsigned int v43;
  BOOL v44;
  unsigned int v46;
  int v47;
  int v49;
  AppleSpell *v50;
  _BOOL4 v51;
  __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  const __CFString *v55;
  int v56;
  unsigned int v57;
  int v58;
  unsigned int v59;
  unint64_t j;
  unsigned int v61;
  unsigned int v64;
  int v65;
  uint64_t v67;
  uint64_t v68;
  id v69;
  const __CFString *v70;
  uint64_t v71;
  uint64_t v72;
  _BOOL4 v73;
  __CFString *v74;
  uint64_t v75;
  _BOOL4 v76;
  const __CFString *v77;
  int v78;
  _PR_DB_IO *v79;
  uint64_t v80;
  CFIndex v81;
  _BOOL4 v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  int v86;
  unsigned int v88;
  uint64_t v89;
  uint64_t v91;
  int v92;
  int v93;
  uint64_t v94;
  int v95;
  int v96;
  unsigned int v98;
  uint64_t v99;
  _BOOL4 v101;
  uint64_t v102;
  unsigned int v103;
  int v104;
  _BOOL4 v105;
  unint64_t v106;
  int v107;
  BOOL v109;
  BOOL v110;
  uint64_t v111;
  uint64_t v112;
  _BOOL4 v113;
  unint64_t v114;
  uint64_t v115;
  int v116;
  uint64_t v117;
  unint64_t v118;
  int v119;
  unsigned __int8 v120;
  int v121;
  unint64_t v122;
  unsigned int v123;
  unsigned int v124;
  unint64_t v125;
  AppleSpell *v126;
  uint32x4_t v127;
  unint64_t v128;
  AppleSpell *v129;
  _BOOL4 v130;
  unint64_t v131;
  unsigned int v132;
  unint64_t v133;
  unsigned __int8 v134;
  unsigned int v135;
  int v136;
  unsigned int v137;
  BOOL v138;
  unint64_t v139;
  AppleSpell *v140;
  _BOOL4 v141;
  char *v142;
  uint64_t v143;
  AppleSpell *v144;
  unint64_t v145;
  char v146;
  unint64_t v147;
  CFIndex *p_length;
  unint64_t v149;
  int v150;
  char *v151;
  const char *v152;
  size_t v153;
  BOOL v154;
  unint64_t v155;
  int v156;
  char v157;
  int v158;
  BOOL v159;
  unint64_t v160;
  int v161;
  BOOL v162;
  uint64_t v163;
  unint64_t v165;
  char *v166;
  BOOL v167;
  uint64_t v168;
  uint32x4_t v173;
  char **v174;
  const __CFLocale *v175;
  const __CFLocale *v176;
  __CFString *v177;
  __CFStringTokenizer *v178;
  CFStringTokenizerTokenType Token;
  char v180;
  CFRange CurrentTokenRange;
  BOOL v182;
  int v183;
  CFIndex *v184;
  uint64_t v185;
  CFIndex v186;
  unint64_t v187;
  unint64_t v188;
  unint64_t v189;
  uint64_t v190;
  BOOL v191;
  unint64_t v194;
  unint64_t v195;
  uint64_t v196;
  unint64_t v197;
  char v198;
  char v199;
  char v200;
  unint64_t v201;
  unsigned int v202;
  unsigned int v203;
  BOOL v204;
  BOOL v207;
  unsigned int v208;
  int v209;
  BOOL v210;
  unint64_t v211;
  int v212;
  unsigned int v213;
  int v214;
  uint64_t v215;
  int v216;
  unsigned int v218;
  int v219;
  BOOL v220;
  unint64_t v221;
  int v222;
  BOOL v223;
  int v224;
  char v225;
  char v226;
  unint64_t k;
  unint64_t v228;
  unsigned int v230;
  BOOL v231;
  const __CFString *v234;
  CFIndex *usedBufLen;
  CFIndex *usedBufLena;
  CFIndex *usedBufLenb;
  CFIndex *usedBufLenc;
  CFIndex *usedBufLend;
  CFIndex *usedBufLene;
  CFIndex *usedBufLenf;
  CFIndex *usedBufLeng;
  CFIndex *usedBufLenh;
  CFIndex *usedBufLeni;
  CFIndex *usedBufLenj;
  CFIndex *usedBufLenk;
  CFIndex *usedBufLenl;
  CFIndex *usedBufLenm;
  CFIndex *usedBufLenn;
  CFIndex *usedBufLeno;
  CFIndex *usedBufLenp;
  CFIndex *usedBufLenq;
  CFIndex *usedBufLenr;
  int v255;
  _BOOL4 v256;
  int v257;
  int v258;
  int v259;
  int v260;
  int v261;
  unsigned __int8 v262;
  int v263;
  unsigned __int8 v264;
  int v265;
  int v266;
  int v267;
  int v268;
  _BOOL4 v269;
  int v270;
  int v271;
  int v272;
  char v273;
  CFIndex CurrentSubTokens;
  int v275;
  unint64_t v276;
  BOOL v277;
  int v278;
  __CFString *v280;
  CFStringEncoding encoding;
  CFIndex v284;
  CFRange buffer[64];
  CFIndex v286[12];
  CFRange v287;
  CFRange v288;
  CFRange v289;
  CFRange v290;
  CFRange v291;

  v17 = a8;
  v21 = a14;
  v286[10] = *MEMORY[0x1E0C80C00];
  v22 = objc_msgSend(a5, "isEnglish");
  v272 = objc_msgSend(a5, "isFrench");
  v275 = objc_msgSend(a5, "isGerman");
  v270 = objc_msgSend(a5, "isSpanish");
  v266 = objc_msgSend(a5, "isItalian");
  v271 = objc_msgSend(a5, "isRussian");
  v23 = objc_msgSend(a5, "isTurkish");
  v263 = objc_msgSend(a5, "isSwedish");
  v262 = objc_msgSend(a5, "isDanish");
  v261 = objc_msgSend(a5, "isHungarian");
  v264 = objc_msgSend(a5, "isIrishGaelic");
  v24 = objc_msgSend(a5, "isKorean");
  v25 = objc_msgSend(a5, "isArabic");
  v260 = objc_msgSend(a5, "isHindi");
  v259 = objc_msgSend(a5, "isPunjabi");
  v258 = objc_msgSend(a5, "isTelugu");
  v268 = objc_msgSend((id)objc_msgSend(a5, "identifier"), "hasPrefix:", CFSTR("ars"));
  v278 = objc_msgSend((id)objc_msgSend(a5, "identifier"), "isEqualToString:", CFSTR("en_CN"));
  v26 = objc_msgSend(a5, "isHebrew");
  encoding = objc_msgSend(a5, "encoding");
  v265 = v22;
  if (validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__onceToken != -1)
    dispatch_once(&validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__onceToken, &__block_literal_global_40);
  do
  {
    if (!a4)
    {
      v29 = 0;
      v33 = a7;
      v267 = !v17;
      v269 = a7 != 0;
      LOBYTE(v34) = 1;
      goto LABEL_607;
    }
    v27 = a4 - 1;
    v28 = a3[--a4];
  }
  while (v28 == 32);
  v255 = v23;
  v29 = v27 + 1;
  if (!a15)
  {
    v280 = 0;
    LODWORD(v30) = 0;
    v35 = encoding == 134217984;
LABEL_15:
    v256 = v35;
    goto LABEL_16;
  }
  LODWORD(v30) = -[AppleSpell validateAbbreviationOrNumberWordBuffer:length:languageObject:connection:sender:](self, "validateAbbreviationOrNumberWordBuffer:length:languageObject:connection:sender:", a3, v27 + 1, a5, a6, a7);
  v280 = 0;
  v256 = encoding == 134217984;
  if (!(_DWORD)v30 && a15 && encoding == 134217984)
  {
    v31 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, 0x8000100u, 0);
    if (v31)
    {
      v280 = v31;
      -[__CFString rangeOfCharacterFromSet:](v31, "rangeOfCharacterFromSet:", validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__nonDigitOrPunctuationCharacterSet);
      LODWORD(v30) = v32 == 0;
    }
    else
    {
      v280 = 0;
      LODWORD(v30) = 0;
    }
    v35 = 1;
    goto LABEL_15;
  }
LABEL_16:
  v36 = !a9;
  if (((v30 | v24 | v36) & 1) == 0)
  {
    v37 = -[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", a3, v27 + 1, a5, 0);
    LODWORD(v30) = v37;
    if (v29 >= 3 && v37 && (encoding & 0xFFFFFFFB) == 0x500)
    {
      v38 = *a3;
      a4 = (unint64_t)v280;
      if ((v38 - 65) >= 0x1A && (v38 - 192) >= 0x17 && (v38 - 216) >= 7)
      {
        v39 = v38 - 138;
        if (v39 > 0x15 || ((1 << v39) & 0x200015) == 0)
          goto LABEL_46;
      }
      v40 = a3[1];
      if ((v40 - 65) >= 0x1A && (v40 - 192) >= 0x17 && (v40 - 216) >= 7)
      {
        v41 = v40 - 138;
        if (v41 > 0x15 || ((1 << v41) & 0x200015) == 0)
          goto LABEL_46;
      }
      for (i = 2; i < v29; ++i)
      {
        v43 = a3[i];
        v44 = v43 <= 0xF7 && v43 - 97 >= 0x1A;
        if (v44 && v43 - 223 >= 0x18)
        {
          v46 = v43 - 154;
          v109 = v46 > 4;
          v47 = (1 << v46) & 0x15;
          if (v109 || v47 == 0)
            goto LABEL_46;
        }
      }
      if (v29 <= 3 && a3[2] == 115)
      {
LABEL_46:
        v267 = !v17;
        goto LABEL_47;
      }
      LODWORD(v30) = 0;
    }
  }
  if ((v30 & 1) == 0 && a12)
    LODWORD(v30) = -[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](self, "checkNameWordBuffer:length:languageObject:globalOnly:", a3, v27 + 1, a5, 0);
  v49 = !v17;
  v267 = !v17;
  if (!a6)
    v49 = 1;
  v257 = v49;
  if ((v30 & 1) != 0)
  {
    v50 = self;
  }
  else
  {
    v50 = self;
    if ((v49 & 1) == 0)
    {
      LODWORD(v30) = -[AppleSpell validateWordBuffer:length:connection:](self, "validateWordBuffer:length:connection:", a3, v27 + 1, a6);
      if ((v30 & v275) == 1)
        LODWORD(v30) = !-[AppleSpell checkSpecialPrefixesForWordBuffer:length:](self, "checkSpecialPrefixesForWordBuffer:length:", a3, v27 + 1);
    }
    if ((v30 & 1) == 0 && a10)
      LODWORD(v30) = -[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", a3, v27 + 1, a5, 4);
  }
  if (((v30 | v36) & 1) != 0)
    goto LABEL_66;
  v51 = a16;
  if (!a6)
    v51 = 0;
  if (((v51 | v278 | v24 | v25) & 1) != 0)
    goto LABEL_65;
  v30 = v280;
  if (!v280)
  {
    v30 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, encoding, 0);
    if (!v30)
    {
      if ((objc_msgSend(a5, "isMarathi") & 1) == 0)
        objc_msgSend(a5, "isUrdu");
      v280 = 0;
      goto LABEL_65;
    }
  }
  v280 = v30;
  if (!-[AppleSpell validateWord:inLexiconForLanguageObject:](v50, "validateWord:inLexiconForLanguageObject:", v30, a5))
  {
    if ((objc_msgSend(a5, "isMarathi") & 1) != 0 || objc_msgSend(a5, "isUrdu"))
    {
      LODWORD(v30) = -[AppleSpell validateAdditionalWord:inLexiconForLanguageObject:](v50, "validateAdditionalWord:inLexiconForLanguageObject:", v30, a5);
      goto LABEL_80;
    }
LABEL_65:
    LODWORD(v30) = 0;
    goto LABEL_66;
  }
  LODWORD(v30) = 1;
LABEL_80:
  if (v29 >= 3 && (_DWORD)v30 && (encoding & 0xFFFFFFFB) == 0x500)
  {
    v56 = *a3;
    a4 = (unint64_t)v280;
    if ((v56 - 65) >= 0x1A && (v56 - 192) >= 0x17 && (v56 - 216) >= 7)
    {
      v57 = v56 - 138;
      if (v57 > 0x15 || ((1 << v57) & 0x200015) == 0)
        goto LABEL_47;
    }
    v58 = a3[1];
    if ((v58 - 65) >= 0x1A && (v58 - 192) >= 0x17 && (v58 - 216) >= 7)
    {
      v59 = v58 - 138;
      if (v59 > 0x15 || ((1 << v59) & 0x200015) == 0)
        goto LABEL_47;
    }
    for (j = 2; j < v29; ++j)
    {
      v61 = a3[j];
      if (v61 <= 0xF7 && v61 - 97 >= 0x1A && v61 - 223 >= 0x18)
      {
        v64 = v61 - 154;
        v109 = v64 > 4;
        v65 = (1 << v64) & 0x15;
        if (v109 || v65 == 0)
          goto LABEL_47;
      }
    }
    if (v29 <= 3 && a3[2] == 115)
    {
LABEL_47:
      v33 = a7;
      v269 = a7 != 0;
      LOBYTE(v34) = 1;
      goto LABEL_606;
    }
    goto LABEL_65;
  }
LABEL_66:
  if (((v30 | v36) & 1) == 0)
  {
    if (objc_msgSend(a5, "isUkrainian"))
    {
      v52 = v280;
      if (!v280)
        v52 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, encoding, 0);
      -[__CFString rangeOfString:](v52, "rangeOfString:", CFSTR("ʼ"));
      v280 = v52;
      if (v53)
      {
        v54 = CFSTR("ʼ");
        v55 = CFSTR("'");
      }
      else
      {
        -[__CFString rangeOfString:](v52, "rangeOfString:", CFSTR("'"));
        if (!v67)
          goto LABEL_114;
        v54 = CFSTR("'");
        v55 = CFSTR("ʼ");
      }
      v68 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v52, "stringByReplacingOccurrencesOfString:withString:", v54, v55);
      if (v68)
      {
        LODWORD(v30) = -[AppleSpell validateWord:inLexiconForLanguageObject:](v50, "validateWord:inLexiconForLanguageObject:", v68, a5);
        goto LABEL_115;
      }
    }
LABEL_114:
    LODWORD(v30) = 0;
  }
LABEL_115:
  if (((v30 | v36) & 1) != 0 || ((v25 ^ 1) & 1) != 0)
  {
    v69 = a7;
  }
  else
  {
    v69 = a7;
    v70 = v280;
    if (!v280)
    {
      v70 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, encoding, 0);
      if (!v70)
      {
        if ((v26 & 1) == 0)
        {
          v280 = 0;
          goto LABEL_142;
        }
        goto LABEL_133;
      }
    }
    v71 = -[AppleSpell stringByRemovingArabicDiacriticsFromString:](v50, "stringByRemovingArabicDiacriticsFromString:", v70);
    v280 = (__CFString *)v70;
    if (!v71)
      goto LABEL_128;
    v72 = v71;
    if (a16)
      v73 = -[AppleSpell validateWord:inLexiconForLanguageObject:](self, "validateWord:inLexiconForLanguageObject:", v71, a5);
    else
      v73 = -[AppleSpell validateAdditionalWord:inLexiconForLanguageObject:](self, "validateAdditionalWord:inLexiconForLanguageObject:", v71, a5);
    LODWORD(v30) = v73;
    if (v73)
      goto LABEL_129;
    if (((v268 ^ 1) & 1) != 0)
      goto LABEL_129;
    v74 = -[AppleSpell stringByReducingArabicAlefVariantsInString:](self, "stringByReducingArabicAlefVariantsInString:", v72);
    v30 = v74;
    if (!v74)
      goto LABEL_129;
    if ((-[__CFString isEqualToString:](v74, "isEqualToString:", v72) & 1) != 0)
    {
LABEL_128:
      LODWORD(v30) = 0;
LABEL_129:
      v50 = self;
      goto LABEL_130;
    }
    v50 = self;
    if (a16)
      v101 = -[AppleSpell validateWord:inLexiconForLanguageObject:](self, "validateWord:inLexiconForLanguageObject:", v30, a5);
    else
      v101 = -[AppleSpell validateAdditionalWord:inLexiconForLanguageObject:](self, "validateAdditionalWord:inLexiconForLanguageObject:", v30, a5);
    LODWORD(v30) = v101;
  }
LABEL_130:
  if (((v30 | v36) & 1) != 0 || ((v26 ^ 1) & 1) != 0)
    goto LABEL_143;
  v30 = v280;
  if (!v280)
  {
LABEL_133:
    v30 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, encoding, 0);
    if (!v30)
    {
      v280 = 0;
      goto LABEL_143;
    }
  }
  v75 = -[AppleSpell stringByRemovingHebrewDiacriticsFromString:](v50, "stringByRemovingHebrewDiacriticsFromString:", v30);
  v280 = v30;
  if (!v75)
  {
LABEL_142:
    LODWORD(v30) = 0;
    goto LABEL_143;
  }
  if (a16)
    v76 = -[AppleSpell validateWord:inLexiconForLanguageObject:](v50, "validateWord:inLexiconForLanguageObject:", v75, a5);
  else
    v76 = -[AppleSpell validateAdditionalWord:inLexiconForLanguageObject:](v50, "validateAdditionalWord:inLexiconForLanguageObject:", v75, a5);
  LODWORD(v30) = v76;
LABEL_143:
  v269 = v69 != 0;
  if ((v30 & 1) != 0 || !v69 || !a11)
  {
LABEL_149:
    v78 = v24 ^ 1;
    v79 = a6;
    if (((v30 | v36) & 1) != 0 || (v78 & 1) != 0)
      goto LABEL_161;
    v286[0] = 0;
    v30 = v280;
    if (v280)
      goto LABEL_153;
    goto LABEL_152;
  }
  v77 = v280;
  if (v280
    || (v77 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, encoding, 0)) != 0)
  {
    v280 = (__CFString *)v77;
    LODWORD(v30) = objc_msgSend(v69, "isWordInUserDictionaries:caseSensitive:", v77, 0);
    goto LABEL_149;
  }
  v78 = v24 ^ 1;
  if (((v36 | v24 ^ 1) & 1) == 0)
  {
    v286[0] = 0;
    v79 = a6;
LABEL_152:
    v30 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, encoding, 0);
    if (!v30)
    {
      v280 = 0;
LABEL_160:
      v78 = 0;
      goto LABEL_161;
    }
LABEL_153:
    -[__CFString rangeOfCharacterFromSet:](v30, "rangeOfCharacterFromSet:", validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__nonPunctuationCharacterSet);
    v280 = v30;
    LODWORD(v30) = !v80
                || (v30 = -[AppleSpell internalStringForKoreanExternalString:](self, "internalStringForKoreanExternalString:", v30), v81 = -[__CFString length](v30, "length"), v287.location = 0, v287.length = v81, v81 == CFStringGetBytes(v30, v287, encoding, 0x5Fu, 0, (UInt8 *)buffer, 72, v286))&& (!v286[0]|| -[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", buffer, v286[0], a5, 5))|| -[AppleSpell validateWord:inLexiconForLanguageObject:](self, "validateWord:inLexiconForLanguageObject:", v30,
                     a5);
    goto LABEL_160;
  }
  v280 = 0;
  LODWORD(v30) = 0;
  v79 = a6;
LABEL_161:
  if (v79)
    v82 = !a15;
  else
    v82 = 1;
  if ((v30 & 1) == 0 && !v82 && ((v275 ^ 1) & 1) == 0)
  {
    v83 = 0;
    while (!v83 || (a3[v83] | 0x20) != 0x73 || (a3[v83 - 1] | 0x20) != 0x73)
    {
      if (++v83 >= v29)
        goto LABEL_177;
    }
    v79->var7 = 64;
    if (PRdb(&v79->var0, 4, 128))
    {
      v79->var7 = 128;
      PRdb(&v79->var0, 4, 128);
    }
    else
    {
      v84 = -[AppleSpell validateWordBuffer:length:connection:](self, "validateWordBuffer:length:connection:", a3, v27 + 1, v79);
      v79->var7 = 128;
      PRdb(&v79->var0, 4, 128);
      if (v84)
      {
        LODWORD(v30) = !-[AppleSpell checkSpecialPrefixesForWordBuffer:length:](self, "checkSpecialPrefixesForWordBuffer:length:", a3, v27 + 1);
        goto LABEL_178;
      }
    }
LABEL_177:
    LODWORD(v30) = 0;
  }
LABEL_178:
  if (((v30 | v82) & 1) == 0 && ((v270 ^ 1) & 1) == 0)
  {
    v85 = 0;
    while (1)
    {
      v86 = a3[v85];
      if ((v86 & 0xF8) == 0xC8)
        break;
      if ((v86 - 210) <= 0xB && ((1 << (v86 + 46)) & 0xF9F) != 0)
        break;
      v88 = v86 - 138;
      v109 = v88 > 0x3B;
      v89 = (1 << v88) & 0xFC0000000200011;
      if (!v109 && v89 != 0)
        break;
      if (++v85 >= v29)
      {
        LODWORD(v30) = 0;
        goto LABEL_198;
      }
    }
    v79->var8 = 128;
    if (PRdb(&v79->var0, 4, 128))
      LODWORD(v30) = 0;
    else
      LODWORD(v30) = -[AppleSpell validateWordBuffer:length:connection:](self, "validateWordBuffer:length:connection:", a3, v27 + 1, v79);
    v79->var8 = 64;
    PRdb(&v79->var0, 4, 128);
  }
LABEL_198:
  if (((v30 | v82) & 1) == 0 && ((v271 ^ 1) & 1) == 0)
  {
    v91 = 0;
    while (1)
    {
      v92 = a3[v91];
      if (v92 == 161 || v92 == 241)
        break;
      if (++v91 >= v29)
      {
        LODWORD(v30) = 0;
        goto LABEL_209;
      }
    }
    v79->var8 = 64;
    if (PRdb(&v79->var0, 4, 128))
      LODWORD(v30) = 0;
    else
      LODWORD(v30) = -[AppleSpell validateWordBuffer:length:connection:](self, "validateWordBuffer:length:connection:", a3, v27 + 1, v79);
    v79->var8 = 128;
    PRdb(&v79->var0, 4, 128);
  }
LABEL_209:
  v93 = v272 ^ 1;
  if (((v30 | v82) & 1) != 0 || (v93 & 1) != 0)
    goto LABEL_254;
  v94 = 0;
  v95 = 1;
  while (1)
  {
    v96 = a3[v94];
    if ((v96 & 0xF8) == 0xC8)
      break;
    if ((v96 - 210) <= 0xB && ((1 << (v96 + 46)) & 0xF9F) != 0)
      goto LABEL_230;
    v98 = v96 - 138;
    v109 = v98 > 0x3B;
    v99 = (1 << v98) & 0xFC0000000200011;
    if (!v109 && v99 != 0)
      goto LABEL_230;
    if (++v94 >= v29)
    {
      v95 = 0;
      goto LABEL_230;
    }
  }
  v95 = 1;
LABEL_230:
  v102 = 0;
  while (1)
  {
    if (v102)
    {
      if ((a3[v102] | 0x20) == 0x65)
      {
        v103 = a3[v102 - 1] - 65;
        if (v103 < 0x2F && ((0x400100004001uLL >> v103) & 1) != 0)
          break;
      }
    }
    if (++v102 >= v29)
    {
      v104 = 0;
      if (!v95)
        goto LABEL_240;
      goto LABEL_237;
    }
  }
  v104 = 1;
  if (!v95)
    goto LABEL_240;
LABEL_237:
  v79->var8 = 160;
  if (!PRdb(&v79->var0, 4, 128))
  {
    LODWORD(v30) = -[AppleSpell validateWordBuffer:length:connection:](self, "validateWordBuffer:length:connection:", a3, v27 + 1, v79);
    goto LABEL_241;
  }
LABEL_240:
  LODWORD(v30) = 0;
LABEL_241:
  if ((v30 & 1) != 0 || ((v104 ^ 1) & 1) != 0)
  {
LABEL_245:
    if ((v30 & 1) == 0)
      goto LABEL_246;
    goto LABEL_252;
  }
  v79->var8 = 80;
  if (PRdb(&v79->var0, 4, 128))
  {
    LODWORD(v30) = 0;
    goto LABEL_245;
  }
  LODWORD(v30) = -[AppleSpell validateWordBuffer:length:connection:](self, "validateWordBuffer:length:connection:", a3, v27 + 1, v79);
  if ((v30 & 1) == 0)
  {
LABEL_246:
    if ((v95 & v104) != 0)
    {
      v79->var8 = 144;
      if (PRdb(&v79->var0, 4, 128))
        LODWORD(v30) = 0;
      else
        LODWORD(v30) = -[AppleSpell validateWordBuffer:length:connection:](self, "validateWordBuffer:length:connection:", a3, v27 + 1, v79);
    }
  }
LABEL_252:
  if ((v95 | v104) == 1)
  {
    v79->var8 = 96;
    PRdb(&v79->var0, 4, 128);
  }
LABEL_254:
  if (((v30 | v257) & 1) == 0 && ((v278 ^ 1) & 1) == 0)
  {
    v79->var7 = 64;
    if (PRdb(&v79->var0, 4, 128))
      LODWORD(v30) = 0;
    else
      LODWORD(v30) = -[AppleSpell validateWordBuffer:length:connection:](self, "validateWordBuffer:length:connection:", a3, v27 + 1, v79);
    v79->var7 = 128;
    PRdb(&v79->var0, 4, 128);
  }
  v105 = a17 < 4 && a13;
  if (!v105 || (_DWORD)v30)
  {
LABEL_281:
    if ((v30 & 1) != 0)
    {
      LOBYTE(v34) = 1;
      goto LABEL_604;
    }
  }
  else
  {
    v106 = 0;
    while (1)
    {
      v107 = a3[v106];
      if ((v107 - 32) <= 0x3F && ((1 << (v107 - 32)) & 0x800000000400E001) != 0)
        break;
      v109 = v27 - 1 != v106 && v106 > 1;
      v110 = !v109 || v27 == v106;
      if (v110 && v107 == 39)
        break;
      if (++v106 >= v29)
        goto LABEL_281;
    }
    if (!v106)
      goto LABEL_744;
    HIBYTE(usedBufLena) = a16;
    BYTE6(usedBufLena) = a15;
    BYTE5(usedBufLena) = a14;
    BYTE4(usedBufLena) = 1;
    BYTE3(usedBufLena) = a12;
    BYTE2(usedBufLena) = a11;
    BYTE1(usedBufLena) = a10;
    LOBYTE(usedBufLena) = a9;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v106, a5, a6, a7, 1, usedBufLena, a17 + 1))
    {
LABEL_744:
      LOBYTE(v34) = 1;
      if (v106 + 1 >= v29)
        goto LABEL_604;
      HIBYTE(usedBufLenb) = a16;
      BYTE6(usedBufLenb) = a15;
      BYTE5(usedBufLenb) = a14;
      BYTE4(usedBufLenb) = 1;
      BYTE3(usedBufLenb) = a12;
      BYTE2(usedBufLenb) = a11;
      BYTE1(usedBufLenb) = a10;
      LOBYTE(usedBufLenb) = a9;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", &a3[v106 + 1], v27 - v106, a5, a6, a7, 1, usedBufLenb, a17 + 1))
      {
        goto LABEL_604;
      }
    }
  }
  LODWORD(v34) = 0;
  if (v29 >= 3 && v105 && v256)
  {
    v111 = 0;
    v112 = 0;
    do
    {
      if (a3[v112] == 226 && a3[v112 + 1] == 128)
      {
        v113 = (a3[v112 + 2] & 0xFE) == 144;
        if ((a3[v112 + 2] & 0xFE) == 0x90)
          v111 = v112;
      }
      else
      {
        v113 = 0;
      }
      if (v113)
        break;
      v114 = v112 + 3;
      ++v112;
    }
    while (v114 < v29);
    if (!v113)
      goto LABEL_303;
    if (!v111)
      goto LABEL_301;
    HIBYTE(usedBufLenc) = a16;
    BYTE6(usedBufLenc) = a15;
    BYTE5(usedBufLenc) = a14;
    BYTE4(usedBufLenc) = 1;
    BYTE3(usedBufLenc) = a12;
    BYTE2(usedBufLenc) = a11;
    BYTE1(usedBufLenc) = a10;
    LOBYTE(usedBufLenc) = a9;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v111, a5, a6, a7, 1, usedBufLenc, a17 + 1))
    {
LABEL_301:
      LOBYTE(v34) = 1;
      if (v111 + 3 >= v29)
        goto LABEL_604;
      HIBYTE(usedBufLend) = a16;
      BYTE6(usedBufLend) = a15;
      BYTE5(usedBufLend) = a14;
      BYTE4(usedBufLend) = 1;
      BYTE3(usedBufLend) = a12;
      BYTE2(usedBufLend) = a11;
      BYTE1(usedBufLend) = a10;
      LOBYTE(usedBufLend) = a9;
      LODWORD(v34) = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", &a3[v111 + 3], v27 - v111 - 2, a5, a6, a7, 1, usedBufLend, a17 + 1);
    }
    else
    {
LABEL_303:
      LODWORD(v34) = 0;
    }
  }
  a4 = (unint64_t)v280;
  if (((v34 | v78 | !v105) & 1) != 0)
    goto LABEL_327;
  v115 = 0;
  while (1)
  {
    v116 = a3[v115];
    if (v116 == 39
      || v115 + 2 < v29 && v116 == 226 && a3[v115 + 1] == 128 && a3[v115 + 2] == 153)
    {
      break;
    }
    if (++v115 >= v29)
      goto LABEL_326;
  }
  v117 = 0;
  v118 = 0;
  do
  {
    v119 = a3[v118];
    if (v118 + 2 < v29 && v119 == 226)
    {
      if (a3[v118 + 1] == 128 && a3[v118 + 2] == 153)
      {
        v118 += 2;
        goto LABEL_323;
      }
      LOBYTE(v119) = -30;
LABEL_322:
      *((_BYTE *)&buffer[0].location + v117++) = v119;
      goto LABEL_323;
    }
    if (v119 != 39)
      goto LABEL_322;
LABEL_323:
    ++v118;
  }
  while (v118 < v29);
  if (v117)
  {
    HIBYTE(usedBufLene) = a16;
    BYTE6(usedBufLene) = a15;
    BYTE5(usedBufLene) = a14;
    BYTE4(usedBufLene) = 1;
    BYTE3(usedBufLene) = a12;
    BYTE2(usedBufLene) = a11;
    BYTE1(usedBufLene) = a10;
    LOBYTE(usedBufLene) = a9;
    LODWORD(v34) = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", buffer, v117, a5, a6, a7, 1, usedBufLene, a17 + 1);
    goto LABEL_327;
  }
LABEL_326:
  LODWORD(v34) = 0;
LABEL_327:
  v120 = v34 ^ 1;
  v121 = v105 & (v34 ^ 1);
  if ((v121 & v266) == 1)
  {
    v33 = a7;
    if (v29 >= 4)
    {
      v122 = 3;
      v21 = a14;
      if (!strncasecmp_l(a3, "un'", 3uLL, 0))
        goto LABEL_345;
      if (v29 >= 5)
      {
        v122 = 4;
        if (strncasecmp_l(a3, "all'", 4uLL, 0))
        {
          v122 = 4;
          if (strncasecmp_l(a3, "com'", 4uLL, 0))
          {
            v122 = 4;
            if (strncasecmp_l(a3, "dev'", 4uLL, 0))
            {
              if (v29 < 6)
              {
                v29 = 5;
                goto LABEL_419;
              }
              v122 = 5;
              if (strncasecmp_l(a3, "dall'", 5uLL, 0))
              {
                v122 = 5;
                if (strncasecmp_l(a3, "dell'", 5uLL, 0))
                {
                  v122 = 5;
                  if (strncasecmp_l(a3, "nell'", 5uLL, 0))
                  {
                    v122 = 5;
                    if (strncasecmp_l(a3, "sant'", 5uLL, 0))
                    {
                      v122 = 5;
                      if (strncasecmp_l(a3, "sull'", 5uLL, 0))
                      {
                        v122 = 5;
                        if (strncasecmp_l(a3, "tutt'", 5uLL, 0))
                        {
                          if (v29 >= 7)
                          {
                            v122 = 6;
                            if (!strncasecmp_l(a3, "quand'", 6uLL, 0))
                              goto LABEL_345;
                            v122 = 6;
                            if (!strncasecmp_l(a3, "quell'", 6uLL, 0))
                              goto LABEL_345;
                            v122 = 6;
                            if (!strncasecmp_l(a3, "quest'", 6uLL, 0))
                              goto LABEL_345;
LABEL_419:
                            a4 = (unint64_t)v280;
                            goto LABEL_607;
                          }
LABEL_431:
                          v29 = 6;
                          goto LABEL_419;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_345:
        if (v122 >= v29)
          goto LABEL_419;
        v123 = a3[v122];
        HIDWORD(v125) = v123 - 65;
        LODWORD(v125) = v123 - 65;
        v124 = v125 >> 1;
        v126 = self;
        if (v124 <= 0x1C && ((1 << v124) & 0x14951495) != 0)
          goto LABEL_379;
        v127 = (uint32x4_t)vaddq_s32(vdupq_n_s32(v123), (int32x4_t)xmmword_1DE2EC900);
        if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1DE2EC910, v127))) & 1) != 0
          || v123 - 248 < 6
          || (v123 & 0xD8) == 0xC8
          || v123 == 255)
        {
          goto LABEL_379;
        }
        if (v123 - 65 >= 0x1A && v127.i32[0] >= 0x17u)
        {
          if (v123 - 216 >= 7)
          {
            if (v123 - 138 <= 0x15 && ((1 << (v123 + 118)) & 0x200015) != 0)
              goto LABEL_419;
            goto LABEL_540;
          }
LABEL_539:
          v123 += 32;
LABEL_540:
          if (v123 != 104)
            goto LABEL_419;
LABEL_379:
          HIBYTE(usedBufLenf) = a16;
          BYTE6(usedBufLenf) = a15;
          BYTE5(usedBufLenf) = v21;
          BYTE4(usedBufLenf) = 1;
          BYTE3(usedBufLenf) = a12;
          BYTE2(usedBufLenf) = a11;
          BYTE1(usedBufLenf) = a10;
          LOBYTE(usedBufLenf) = a9;
          LOBYTE(v34) = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](v126, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", usedBufLenf, a17 + 1);
          goto LABEL_419;
        }
LABEL_537:
        if (v123 - 138 <= 0x15 && ((1 << (v123 + 118)) & 0x200015) != 0)
          goto LABEL_419;
        goto LABEL_539;
      }
LABEL_418:
      v29 = 4;
      goto LABEL_419;
    }
LABEL_606:
    v21 = a14;
    goto LABEL_607;
  }
  v33 = a7;
  if (((v121 ^ 1 | v93) & 1) == 0)
  {
    v21 = a14;
    if (v29 < 4)
      goto LABEL_607;
    v131 = 3;
    if (strncasecmp_l(a3, "qu'", 3uLL, 0))
    {
      if (v29 < 6)
        goto LABEL_419;
      v131 = 5;
      if (strncasecmp_l(a3, "entr'", 5uLL, 0))
      {
        if (v29 < 7)
          goto LABEL_431;
        v131 = 6;
        if (strncasecmp_l(a3, "jusqu'", 6uLL, 0))
        {
          if (v29 < 8)
          {
            v29 = 7;
            goto LABEL_419;
          }
          v131 = 7;
          if (strncasecmp_l(a3, "presqu'", 7uLL, 0))
          {
            v131 = 7;
            if (strncasecmp_l(a3, "quelqu'", 7uLL, 0))
              goto LABEL_419;
          }
        }
      }
    }
    if (v131 >= v29)
      goto LABEL_419;
    v123 = a3[v131];
    HIDWORD(v133) = v123 - 65;
    LODWORD(v133) = v123 - 65;
    v132 = v133 >> 1;
    v126 = self;
    if (v132 <= 0x1C && ((1 << v132) & 0x14951495) != 0)
      goto LABEL_379;
    v173 = (uint32x4_t)vaddq_s32(vdupq_n_s32(v123), (int32x4_t)xmmword_1DE2EC900);
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1DE2EC910, v173))) & 1) != 0
      || v123 - 248 < 6
      || (v123 & 0xD8) == 0xC8
      || v123 == 255)
    {
      goto LABEL_379;
    }
    if (v123 - 65 >= 0x1A && v173.i32[0] >= 0x17u)
    {
      if (v123 - 216 < 7)
        goto LABEL_539;
      if (v123 - 138 > 0x15)
      {
        v33 = a7;
        v126 = self;
        v21 = a14;
      }
      else
      {
        v33 = a7;
        v126 = self;
        v21 = a14;
        if (((1 << (v123 + 118)) & 0x200015) != 0)
          goto LABEL_419;
      }
      goto LABEL_540;
    }
    goto LABEL_537;
  }
  v21 = a14;
  if ((v121 & v265) == 1)
  {
    if (v29 < 4)
      goto LABEL_607;
    v128 = 3;
    if (strncasecmp_l(&a3[v27 - 2], "'ed", 3uLL, 0))
    {
      v128 = 3;
      v129 = self;
      if (strncasecmp_l(&a3[v27 - 2], "'er", 3uLL, 0))
      {
        v128 = 3;
        if (strncasecmp_l(&a3[v27 - 2], "'ll", 3uLL, 0))
        {
          v128 = 3;
          if (strncasecmp_l(&a3[v27 - 2], "'ve", 3uLL, 0))
          {
            a4 = (unint64_t)v280;
            if (v29 < 5)
            {
              v29 = 4;
              goto LABEL_607;
            }
            v130 = strncasecmp_l(&a3[v27 - 3], "'ing", 4uLL, 0) == 0;
            v128 = 4 * v130;
            goto LABEL_423;
          }
        }
      }
      v130 = 1;
    }
    else
    {
      v130 = 1;
      v129 = self;
    }
    a4 = (unint64_t)v280;
LABEL_423:
    if (v130 && v128 < v29)
    {
      HIBYTE(usedBufLenh) = a16;
      BYTE6(usedBufLenh) = a15;
      BYTE5(usedBufLenh) = a14;
      BYTE4(usedBufLenh) = 1;
      BYTE3(usedBufLenh) = a12;
      BYTE2(usedBufLenh) = a11;
      BYTE1(usedBufLenh) = a10;
      LOBYTE(usedBufLenh) = a9;
      v138 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](v129, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v27 - v128 + 1, a5, a6, a7, 1, usedBufLenh, a17 + 1);
      goto LABEL_426;
    }
    goto LABEL_607;
  }
  if (a17 < 4)
    v134 = v34 ^ 1;
  else
    v134 = 0;
  if ((v134 & (a12 && a13) & v264) == 1)
  {
    if (v29 >= 3)
    {
      v135 = *a3 - 98;
      if (v135 <= 0xC && ((1 << v135) & 0x1865) != 0)
      {
        v136 = a3[1];
        if ((v136 - 65) < 0x1A
          || (v136 - 192) < 0x17
          || (v136 - 216) < 7
          || (v137 = v136 - 138, v137 <= 0x15) && ((1 << v137) & 0x200015) != 0)
        {
          v138 = -[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](self, "checkNameWordBuffer:length:languageObject:globalOnly:", a3 + 1, v27, a5, 0);
          goto LABEL_426;
        }
      }
    }
    goto LABEL_607;
  }
  if ((v121 & v263) == 1)
  {
    if (v29 >= 3 && a3[v27] == 115 && toLower(a3[v27 - 1]) != 115)
    {
      HIBYTE(usedBufLeng) = a16;
      BYTE6(usedBufLeng) = 0;
      WORD2(usedBufLeng) = 0;
      LODWORD(usedBufLeng) = 0x1000000;
      v138 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v27, a5, a6, a7, 0, usedBufLeng, a17 + 1);
      goto LABEL_426;
    }
    goto LABEL_607;
  }
  if (a17 >= 2)
    v120 = 0;
  if ((v120 & a13 & v262) == 1)
  {
    if (v29 < 4)
      goto LABEL_607;
    v139 = 3;
    if (strncasecmp_l(&a3[v27 - 2], "'en", 3uLL, 0) && (v139 = 3, strncasecmp_l(&a3[v27 - 2], "'er", 3uLL, 0)))
    {
      v139 = 3;
      v140 = self;
      if (strncasecmp_l(&a3[v27 - 2], "'et", 3uLL, 0))
      {
        if (v29 < 5)
          goto LABEL_418;
        v139 = 4;
        if (strncasecmp_l(&a3[v27 - 3], "'ens", 4uLL, 0))
        {
          v139 = 4;
          if (strncasecmp_l(&a3[v27 - 3], "'ers", 4uLL, 0))
          {
            if (v29 < 6)
            {
              v29 = 5;
              goto LABEL_604;
            }
            if (strncasecmp_l(&a3[v27 - 3], "'erne", 5uLL, 0))
            {
              if (v29 >= 7)
              {
                v141 = strncasecmp_l(&a3[v27 - 3], "'ernes", 5uLL, 0) == 0;
                v139 = 4 * v141;
                goto LABEL_601;
              }
              v29 = 6;
LABEL_604:
              v33 = a7;
LABEL_605:
              a4 = (unint64_t)v280;
              goto LABEL_606;
            }
            v141 = 1;
            v139 = 4;
LABEL_601:
            v33 = a7;
            v140 = self;
            a4 = (unint64_t)v280;
            v21 = a14;
            if (!v141)
            {
LABEL_587:
              if ((v34 & 1) != 0 || v29 < 8)
                goto LABEL_607;
              v194 = v27 - 3;
              v195 = a17 + 1;
              v196 = 4;
              do
              {
                BYTE6(usedBufLen) = a15;
                BYTE5(usedBufLen) = 0;
                *(_WORD *)((char *)&usedBufLen + 3) = 0;
                BYTE2(usedBufLen) = a11;
                LOWORD(usedBufLen) = __PAIR16__(a10, a9);
                LOBYTE(v34) = 0;
                if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", a3, v196, a5, a6, v33, 0, usedBufLen, v195))
                {
                  HIBYTE(usedBufLenn) = a16;
                  BYTE6(usedBufLenn) = a15;
                  BYTE5(usedBufLenn) = 0;
                  *(_WORD *)((char *)&usedBufLenn + 3) = 256;
                  BYTE2(usedBufLenn) = a11;
                  BYTE1(usedBufLenn) = a10;
                  LOBYTE(usedBufLenn) = a9;
                  LOBYTE(v34) = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", &a3[v196], v194, a5, a6, v33, 0, usedBufLenn, v195);
                }
                if ((v34 & 1) != 0)
                  break;
                v197 = v196 + 5;
                --v194;
                ++v196;
              }
              while (v197 <= v29);
              goto LABEL_605;
            }
LABEL_585:
            if (v139 < v29)
            {
              HIBYTE(usedBufLenm) = a16;
              BYTE6(usedBufLenm) = a15;
              BYTE5(usedBufLenm) = v21;
              BYTE4(usedBufLenm) = 1;
              BYTE3(usedBufLenm) = a12;
              BYTE2(usedBufLenm) = a11;
              BYTE1(usedBufLenm) = a10;
              LOBYTE(usedBufLenm) = a9;
              LOBYTE(v34) = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](v140, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v27 - v139 + 1, a5, a6, v33, 1, usedBufLenm, a17 + 1);
            }
            goto LABEL_587;
          }
        }
      }
    }
    else
    {
      v140 = self;
    }
    a4 = (unint64_t)v280;
    goto LABEL_585;
  }
  if ((v121 & v261) == 1)
  {
    if (v29 >= 4 && !strncasecmp_l(a3, "leg", 3uLL, 0))
    {
      v142 = a3 + 3;
      v143 = v27 - 2;
      goto LABEL_525;
    }
    goto LABEL_607;
  }
  if ((v121 & v255) == 1)
  {
    v144 = self;
    v145 = -[AppleSpell numberOfTurkishSuffixPointsInBuffer:length:maxSuffixPoints:suffixPoints:](self, "numberOfTurkishSuffixPointsInBuffer:length:maxSuffixPoints:suffixPoints:", a3, v27 + 1, 36, buffer);
    if (v145)
      v146 = v34;
    else
      v146 = 1;
    if ((v146 & 1) != 0)
      goto LABEL_419;
    v147 = v145;
    v276 = a17 + 1;
    p_length = &buffer[0].length;
    v149 = 1;
    while (2)
    {
      v34 = *(p_length - 1);
      if (v34 >= v29)
        goto LABEL_462;
      v150 = *(_DWORD *)p_length;
      if (*(_DWORD *)p_length == 2)
      {
        if (!a12)
          goto LABEL_462;
        v154 = -[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](v144, "checkNameWordBuffer:length:languageObject:globalOnly:", a3, *(p_length - 1), a5, 1);
      }
      else
      {
        if (v150 != 1)
        {
          if (v150)
            goto LABEL_462;
          HIBYTE(usedBufLeni) = a16;
          BYTE6(usedBufLeni) = a15;
          WORD2(usedBufLeni) = 0;
          BYTE3(usedBufLeni) = a12;
          BYTE2(usedBufLeni) = a11;
          BYTE1(usedBufLeni) = a10;
          LOBYTE(usedBufLeni) = a9;
          if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](v144, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v34, a5, a6, v33, 0, usedBufLeni, v276))
          {
            if (v34 == 3)
            {
              if (!strncasecmp_l(a3, "her", 3uLL, 0))
                goto LABEL_462;
            }
            else
            {
              if (v34 == 2)
              {
                v151 = a3;
                v152 = "am";
                v153 = 2;
LABEL_461:
                if (strncasecmp_l(v151, v152, v153, 0))
                {
LABEL_599:
                  LOBYTE(v34) = 1;
                  goto LABEL_419;
                }
LABEL_462:
                LOBYTE(v34) = 0;
LABEL_463:
                p_length += 2;
                v44 = v149++ >= v147;
                if (v44)
                  goto LABEL_419;
                continue;
              }
              if (v34 < 3)
                goto LABEL_599;
            }
            v151 = a3;
            v152 = "sik";
            v153 = 3;
            goto LABEL_461;
          }
          if (v34 < 2 || !isVowelTurkish(a3[v34]))
            goto LABEL_462;
          v155 = v34 - 1;
          v156 = a3[v34 - 1];
          if ((v156 & 0xFFFFFFDF) == 0x43)
          {
            v157 = v156 - 124;
          }
          else
          {
            if ((v156 & 0xFFFFFFDF) == 0x42)
            {
              v157 = v156 + 14;
              goto LABEL_472;
            }
            v158 = v156 & 0xDF;
            v159 = v158 == 68;
            if (v158 == 68)
              v157 = v156 + 10;
            else
              v157 = a3[v34 - 1];
            if (!v159)
            {
              LOBYTE(v34) = 0;
              v33 = a7;
              v144 = self;
              goto LABEL_473;
            }
          }
LABEL_472:
          v273 = a3[v34 - 1];
          a3[v155] = v157;
          HIBYTE(usedBufLenj) = a16;
          BYTE6(usedBufLenj) = a15;
          WORD2(usedBufLenj) = 0;
          BYTE3(usedBufLenj) = a12;
          BYTE2(usedBufLenj) = a11;
          BYTE1(usedBufLenj) = a10;
          LOBYTE(usedBufLenj) = a9;
          v144 = self;
          v33 = a7;
          LOBYTE(v34) = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v34, a5, a6, a7, 0, usedBufLenj, v276);
          a3[v155] = v273;
LABEL_473:
          v21 = a14;
          if ((v34 & 1) != 0)
            goto LABEL_419;
          goto LABEL_463;
        }
        v154 = -[AppleSpell checkWordBuffer:length:languageObject:index:](v144, "checkWordBuffer:length:languageObject:index:", a3, *(p_length - 1), a5, 6);
      }
      break;
    }
    LOBYTE(v34) = v154;
    if (v154)
      goto LABEL_419;
    goto LABEL_463;
  }
  if (((v121 ^ 1 | v78) & 1) == 0)
  {
    v174 = off_1F043D000;
    if (!validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__koreanTokenizer)
    {
      v175 = CFLocaleCreate(0, CFSTR("ko"));
      v289.location = 0;
      v289.length = 0;
      validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__koreanTokenizer = (uint64_t)CFStringTokenizerCreate(0, &stru_1EA8D8440, v289, 0, v175);
      v176 = v175;
      a4 = (unint64_t)v280;
      CFRelease(v176);
    }
    if (!a4)
      a4 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v29, encoding, 0);
    v177 = (__CFString *)a4;
    v178 = (__CFStringTokenizer *)validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__koreanTokenizer;
    v290.length = -[__CFString length](v177, "length");
    v290.location = 0;
    CFStringTokenizerSetString(v178, v177, v290);
    v280 = v177;
    if (v177)
    {
      v277 = 1;
      do
      {
        Token = CFStringTokenizerAdvanceToNextToken((CFStringTokenizerRef)v174[422]);
        LOBYTE(v34) = Token == 0;
        if (!Token)
          break;
        v180 = Token;
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)v174[422]);
        v284 = 0;
        v182 = (v180 & 6) == 0 || CurrentTokenRange.length < 2;
        if (v182
          || (CurrentSubTokens = CFStringTokenizerGetCurrentSubTokens((CFStringTokenizerRef)v174[422], buffer, 64, 0)) == 0)
        {
          buffer[0] = CurrentTokenRange;
          CurrentSubTokens = 1;
        }
        v183 = v277;
        if (v277)
        {
          v33 = a7;
          if (CurrentSubTokens >= 1)
          {
            v184 = &buffer[0].length;
            v185 = 1;
            while (1)
            {
              v186 = *v184;
              if (*v184 >= 1)
              {
                v187 = *(v184 - 1);
                v188 = v186 + v187;
                if (v186 + v187 > -[__CFString length](v280, "length"))
                  goto LABEL_575;
                v189 = -[__CFString rangeOfCharacterFromSet:options:range:](v280, "rangeOfCharacterFromSet:options:range:", validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__nonDigitCharacterSet, 0, v187, v186);
                if (v190)
                  v191 = v189 > v187;
                else
                  v191 = 0;
                if (v191 && v188 >= v189)
                {
                  v187 = v189;
                  v186 = v188 - v189;
                }
                if (!v187 && !-[__CFString length](v280, "length"))
                {
                  LOBYTE(v34) = 0;
                  v33 = a7;
                  v21 = a14;
                  v174 = off_1F043D000;
                  goto LABEL_597;
                }
                if (v186 >= 1 && v187 + v186 <= -[__CFString length](v280, "length"))
                {
                  v288.location = v187;
                  v288.length = v186;
                  v33 = a7;
                  if (v186 == CFStringGetBytes(v280, v288, encoding, 0x5Fu, 0, (UInt8 *)v286, 72, &v284))
                  {
                    HIBYTE(usedBufLenl) = a16;
                    BYTE6(usedBufLenl) = a15;
                    BYTE5(usedBufLenl) = a14;
                    *(_WORD *)((char *)&usedBufLenl + 3) = a12;
                    BYTE2(usedBufLenl) = a11;
                    BYTE1(usedBufLenl) = a10;
                    LOBYTE(usedBufLenl) = a9;
                    v277 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", v286, v284, a5, a6, a7, 1, usedBufLenl, a17 + 1);
                  }
                }
                else
                {
LABEL_575:
                  v33 = a7;
                }
              }
              v183 = v277;
              if (v277)
              {
                v184 += 2;
                v109 = v185++ < CurrentSubTokens;
                if (v109)
                  continue;
              }
              break;
            }
          }
        }
        else
        {
          v33 = a7;
        }
        v21 = a14;
        v174 = off_1F043D000;
      }
      while (v183);
    }
    else
    {
      LOBYTE(v34) = 1;
    }
LABEL_597:
    v291.location = 0;
    v291.length = 0;
    CFStringTokenizerSetString((CFStringTokenizerRef)v174[422], &stru_1EA8D8440, v291);
    goto LABEL_419;
  }
  if ((v121 & (v260 | v259 | v258)) != 1)
    goto LABEL_607;
  v160 = 0;
  while (2)
  {
    v161 = a3[v160];
    if (v160 + 2 >= v29 || v161 != 224)
      goto LABEL_489;
    v162 = a3[v160 + 1] - 165 > 0xC || ((1 << (a3[v160 + 1] + 91)) & 0x1011) == 0;
    if (v162 || (a3[v160 + 2] + 90) >= 0xAu)
    {
      v161 = 224;
LABEL_489:
      if ((v161 - 48) >= 0xA)
        v163 = v160;
      else
        v163 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_492;
    }
    v163 = 0x7FFFFFFFFFFFFFFFLL;
    v160 += 2;
LABEL_492:
    ++v160;
    if (v163 == 0x7FFFFFFFFFFFFFFFLL && v160 < v29)
      continue;
    break;
  }
  v165 = 0;
  v166 = &a3[v27];
  do
  {
    if (v27 - v165 < 2
      || v166[-v165 - 2] != 224
      || (v166[~v165] - 165 <= 0xC
        ? (v167 = ((1 << (v166[~v165] + 91)) & 0x1011) == 0)
        : (v167 = 1),
          v167 || (v166[-v165] + 90) > 9u))
    {
      if (v166[-v165] - 48 >= 0xA)
        v168 = v165;
      else
        v168 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v165 += 2;
      v168 = 0x7FFFFFFFFFFFFFFFLL;
    }
    ++v165;
  }
  while (v168 == 0x7FFFFFFFFFFFFFFFLL && v165 < v29);
  if (v168 + v163 < v29 && v163 != 0x7FFFFFFFFFFFFFFFLL && v168 != 0x7FFFFFFFFFFFFFFFLL && (v168 | v163) != 0)
  {
    v142 = &a3[v163];
    v143 = v27 - (v163 + v168) + 1;
LABEL_525:
    HIBYTE(usedBufLenk) = a16;
    BYTE6(usedBufLenk) = a15;
    BYTE5(usedBufLenk) = a14;
    BYTE4(usedBufLenk) = 1;
    BYTE3(usedBufLenk) = a12;
    BYTE2(usedBufLenk) = a11;
    BYTE1(usedBufLenk) = a10;
    LOBYTE(usedBufLenk) = a9;
    v138 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", v142, v143, a5, a6, a7, 1, usedBufLenk, a17 + 1);
LABEL_426:
    LOBYTE(v34) = v138;
  }
LABEL_607:
  v198 = a17 > 7 || !v21;
  if ((v34 & 1) != 0 || (v198 & 1) != 0 || (encoding & 0xFFFFFFFB) != 0x500 || !v29)
    goto LABEL_685;
  v199 = 0;
  v200 = 0;
  v201 = 0;
  while (2)
  {
    v202 = a3[v201];
    v203 = v202 - 216;
    if (v202 - 192 >= 0x17)
    {
      v204 = v202 <= 0xF7 && v203 >= 0x1F;
      if (v204 && (v202 & 0xFFFFFFDF) - 65 >= 0x1A && (v202 - 138 > 0x15 || ((1 << (v202 + 118)) & 0x350015) == 0))
      {
        if (v202 - 48 < 0xA || v202 - 178 <= 7 && ((1 << (v202 + 78)) & 0x83) != 0 || v202 - 188 <= 2)
        {
          v200 = 0;
          if ((v201 == 0) | v199 & 1)
            v211 = 0;
          else
            v211 = v201;
          v199 = 1;
          goto LABEL_642;
        }
        goto LABEL_676;
      }
    }
    v207 = v202 - 65 >= 0x1A && v202 - 192 >= 0x17;
    if (!v207
      || v203 < 7
      || ((v208 = v202 - 138, v109 = v208 > 0x15, v209 = (1 << v208) & 0x200015, !v109)
        ? (v210 = v209 == 0)
        : (v210 = 1),
          !v210))
    {
      v199 = 0;
      if ((v201 == 0) | v200 & 1)
        v211 = 0;
      else
        v211 = v201;
      v200 = 1;
      goto LABEL_642;
    }
    if (((v201 != 0) & v199) != 0)
    {
      v211 = v201;
      goto LABEL_680;
    }
    if (v201 < 3 || (v200 & 1) == 0)
    {
      if (v201 == 2 && (v200 & 1) != 0)
      {
        v212 = *a3;
        if ((v212 - 65) >= 0x1A && (v212 - 192) >= 0x17 && (v212 - 216) >= 7)
        {
          v200 = 0;
          v213 = v212 - 138;
          if (v213 > 0x15)
          {
LABEL_677:
            v211 = 1;
            v199 = 0;
            goto LABEL_642;
          }
          v214 = 1 << v213;
          v211 = 1;
          v199 = 0;
          if ((v214 & 0x200015) == 0)
          {
LABEL_642:
            if (v211)
              goto LABEL_680;
            if (++v201 >= v29)
              goto LABEL_680;
            continue;
          }
        }
        if (v29 >= 4)
        {
          v215 = 3;
          while (1)
          {
            v216 = a3[v215];
            v200 = 0;
            if ((v216 - 65) < 0x1A || (v216 - 192) < 0x17)
              break;
            if ((v216 - 216) < 7)
              goto LABEL_677;
            v218 = v216 - 138;
            v109 = v218 > 0x15;
            v219 = (1 << v218) & 0x200015;
            v220 = v109 || v219 == 0;
            v211 = 1;
            v199 = 0;
            if (v220)
            {
              v211 = 0;
              v200 = 0;
              v199 = 0;
              if (++v215 < v29)
                continue;
            }
            goto LABEL_642;
          }
          v199 = 0;
          v211 = 1;
          goto LABEL_642;
        }
      }
LABEL_676:
      v211 = 0;
      v200 = 0;
      v199 = 0;
      goto LABEL_642;
    }
    break;
  }
  v211 = v201 - 1;
LABEL_680:
  if (v211 && v29 > v211)
  {
    v221 = a4;
    HIBYTE(usedBufLeno) = a16;
    BYTE6(usedBufLeno) = a15;
    WORD2(usedBufLeno) = a13;
    v222 = 1;
    WORD1(usedBufLeno) = a11;
    BYTE1(usedBufLeno) = a10;
    LOBYTE(usedBufLeno) = a9;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v211, a5, a6, v33, 1, usedBufLeno, a17 + 1))
    {
      HIBYTE(usedBufLenp) = a16;
      BYTE6(usedBufLenp) = a15;
      BYTE5(usedBufLenp) = 1;
      BYTE4(usedBufLenp) = a13;
      WORD1(usedBufLenp) = a11;
      BYTE1(usedBufLenp) = a10;
      LOBYTE(usedBufLenp) = a9;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", &a3[v211], v29 - v211, a5, a6, v33, 1, usedBufLenp, a17 + 1))
      {
        goto LABEL_687;
      }
    }
LABEL_698:
    LOBYTE(v222) = 0;
    if (encoding == 1280)
      v225 = v198;
    else
      v225 = 1;
    if ((v225 & 1) == 0 && v29)
    {
      v226 = 0;
      for (k = 0; k < v29; ++k)
      {
        v228 = 0;
        if (k >= 3 && (v226 & 1) != 0)
        {
          if (a3[k] != 105 || k + 6 > v29)
          {
            v228 = 0;
          }
          else if (!strncmp(&a3[k], "iCloud", 6uLL))
          {
            v228 = k;
          }
          else
          {
            v228 = 0;
          }
        }
        v230 = a3[k];
        v231 = (v230 + 102) <= 4u && (v230 & 1) == 0;
        v226 = v230 > 0xF7 || v230 - 97 < 0x1A || v230 - 223 < 0x18 || v231;
        if (v228)
          break;
      }
      LOBYTE(v222) = 0;
      if (v228)
      {
        if (v29 > v228)
        {
          HIBYTE(usedBufLenq) = a16;
          BYTE6(usedBufLenq) = a15;
          WORD2(usedBufLenq) = a13;
          WORD1(usedBufLenq) = a11;
          BYTE1(usedBufLenq) = a10;
          LOBYTE(usedBufLenq) = a9;
          LOBYTE(v222) = 0;
          if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v228, a5, a6, v33, 1, usedBufLenq, a17 + 1))
          {
            HIBYTE(usedBufLenr) = a16;
            BYTE6(usedBufLenr) = a15;
            BYTE5(usedBufLenr) = 1;
            BYTE4(usedBufLenr) = a13;
            WORD1(usedBufLenr) = a11;
            BYTE1(usedBufLenr) = a10;
            LOBYTE(usedBufLenr) = a9;
            v222 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", &a3[v228], v29 - v228, a5, a6, v33, 1, usedBufLenr, a17 + 1);
            goto LABEL_687;
          }
        }
      }
    }
    return v222;
  }
LABEL_685:
  v221 = a4;
  if ((v34 & 1) == 0)
    goto LABEL_698;
  v222 = 1;
LABEL_687:
  if (((v222 ^ 1 | v278) & 1) == 0)
  {
    v223 = -[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", a3, v29, a5, 1);
    LOBYTE(v222) = !v223;
    if (v223)
    {
      v224 = v267;
    }
    else
    {
      v224 = v267;
      if (encoding == 1280
        && (!strncmp(a3, "imac", 4uLL)
         || !strncmp(a3, "ipod", 4uLL)
         || !strncmp(a3, "ipad", 4uLL)
         || !strncmp(a3, "ibook", 5uLL)
         || !strncmp(a3, "iphone", 6uLL)
         || !strncmp(a3, "itunes", 6uLL)
         || !strncmp(a3, "icloud", 6uLL)))
      {
        LOBYTE(v222) = 0;
      }
    }
    if (((v224 | !v269) & 1) == 0 && (v222 & 1) == 0)
    {
      v234 = (const __CFString *)v221;
      if (v221
        || (v234 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v29, encoding, 0)) != 0)
      {
        LOBYTE(v222) = objc_msgSend(v33, "isWordInUserDictionaries:caseSensitive:", v234, 0);
      }
      else
      {
        LOBYTE(v222) = 0;
      }
    }
  }
  return v222;
}

id __195__AppleSpell_Spelling__validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth___block_invoke()
{
  void *v0;
  id result;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet");
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet"));
  objc_msgSend(v0, "invert");
  validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__nonDigitOrPunctuationCharacterSet = objc_msgSend(v0, "copy");
  validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__nonDigitCharacterSet = (uint64_t)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet"), "invertedSet");
  result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet"), "invertedSet");
  validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__nonPunctuationCharacterSet = (uint64_t)result;
  return result;
}

- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkBase:(BOOL)a8 checkDict:(BOOL)a9 checkTemp:(BOOL)a10 checkUser:(BOOL)a11 checkNames:(BOOL)a12 checkHyphens:(BOOL)a13 checkIntercaps:(BOOL)a14 checkOptions:(BOOL)a15 depth:(unint64_t)a16
{
  return -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, a4, a5, a6, a7, a8);
}

- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkBase:(BOOL)a8 checkDict:(BOOL)a9 checkTemp:(BOOL)a10 checkNames:(BOOL)a11 checkHyphens:(BOOL)a12 checkIntercaps:(BOOL)a13 checkOptions:(BOOL)a14 depth:(unint64_t)a15
{
  return -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", a3, a4, a5, a6, a7);
}

- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkBase:(BOOL)a8 checkDict:(BOOL)a9 checkNames:(BOOL)a10 checkHyphens:(BOOL)a11 checkIntercaps:(BOOL)a12 checkOptions:(BOOL)a13 depth:(unint64_t)a14
{
  return -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", a3, a4, a5, a6, a7);
}

- (id)_orthographyByModifyingOrthography:(id)a3 withLatinLanguage:(id)a4
{
  void *v6;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(a3, "languageMap"));
  objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a4), CFSTR("Latn"));
  return (id)objc_msgSend(MEMORY[0x1E0CB3840], "orthographyWithDominantScript:languageMap:", objc_msgSend(a3, "dominantScript"), v6);
}

- (id)normalizedStringInString:(id)a3 range:(_NSRange)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "substringWithRange:", a4.location, a4.length);
  if (normalizedStringInString_range__onceToken != -1)
    dispatch_once(&normalizedStringInString_range__onceToken, &__block_literal_global_94_0);
  objc_msgSend(v4, "rangeOfCharacterFromSet:", normalizedStringInString_range__allSet);
  if (v5)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v4);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = (void *)normalizedStringInString_range__sets;
    v7 = objc_msgSend((id)normalizedStringInString_range__sets, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v12 = objc_msgSend((id)normalizedStringInString_range__sets, "objectForKey:", v11);
          if (objc_msgSend(v4, "length"))
          {
            v13 = 0;
            do
            {
              v14 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v12, 0, v13, objc_msgSend(v4, "length") - v13);
              if (!v15)
                break;
              v16 = v14;
              objc_msgSend(v4, "replaceCharactersInRange:withString:", v14, v15, v11);
              v13 = objc_msgSend(v11, "length") + v16;
            }
            while (v13 < objc_msgSend(v4, "length"));
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
  }
  return v4;
}

id __55__AppleSpell_Spelling__normalizedStringInString_range___block_invoke()
{
  uint64_t v0;
  id result;
  _QWORD v2[5];
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("            ");
  v4[1] = CFSTR("‘’‚‛′");
  v4[2] = CFSTR("“”„‟″");
  v4[3] = CFSTR("·․‧");
  v4[4] = CFSTR("‐‑‒–—");
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5), "componentsJoinedByString:", &stru_1EA8D8440);
  v3[0] = objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("            "), CFSTR(" "));
  v2[1] = CFSTR("'");
  v3[1] = objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("‘’‚‛′"));
  v2[2] = CFSTR("\");
  v3[2] = objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("“”„‟″"));
  v2[3] = CFSTR(".");
  v3[3] = objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("·․‧"));
  v2[4] = CFSTR("-");
  v3[4] = objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("‐‑‒–—"));
  normalizedStringInString_range__sets = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v0);
  normalizedStringInString_range__allSet = (uint64_t)result;
  return result;
}

- (_NSRange)spellServer:(id)a3 findMisspelledWordInString:(id)a4 range:(_NSRange)a5 languages:(id)a6 topLanguages:(id)a7 orthography:(id)a8 checkOrthography:(BOOL)a9 mutableResults:(id)a10 offset:(unint64_t)a11 autocorrect:(BOOL)a12 onlyAtInsertionPoint:(BOOL)a13 initialCapitalize:(BOOL)a14 autocapitalize:(BOOL)a15 keyEventArray:(id)a16 appIdentifier:(id)a17 selectedRangeValue:(id)a18 parameterBundles:(id)a19 wordCount:(int64_t *)a20 countOnly:(BOOL)a21 appendCorrectionLanguage:(BOOL)a22 correction:(id *)a23
{
  unint64_t v27;
  const __CFString *v28;
  id v29;
  signed int v30;
  int v31;
  uint64_t v32;
  int64x2_t v33;
  __int128 v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  NSUInteger v44;
  const char *CStringPtr;
  size_t v46;
  unint64_t v47;
  BOOL v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  __CFString *v52;
  NSUInteger v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  int v57;
  unsigned int v58;
  BOOL v59;
  BOOL v60;
  unsigned int v64;
  unint64_t v65;
  int v66;
  int v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  _QWORD *v72;
  size_t v73;
  unint64_t v74;
  uint64_t v75;
  size_t v76;
  unint64_t v77;
  int v78;
  size_t v79;
  NSRange v80;
  _QWORD *v81;
  unint64_t i;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  void *v88;
  NSUInteger v89;
  uint64_t v90;
  NSUInteger *v91;
  unint64_t v92;
  unsigned int v93;
  unint64_t v94;
  NSUInteger v95;
  __int128 v96;
  __int128 v97;
  __CFString *v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  char v102;
  uint64_t v103;
  _QWORD *v104;
  unint64_t v105;
  UInt8 v106;
  int v107;
  BOOL v108;
  BOOL v109;
  BOOL v110;
  uint64_t v111;
  char v112;
  unint64_t v113;
  unsigned int v114;
  unint64_t v115;
  _BYTE *v116;
  unint64_t v117;
  int v118;
  _BOOL4 v120;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  __int128 v130;
  __int128 v131;
  uint64_t v132;
  int v133;
  BOOL v134;
  uint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  id v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t j;
  int v151;
  BOOL v152;
  _BOOL4 v153;
  BOOL v154;
  id v155;
  void *v156;
  __CFString *v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  unint64_t v162;
  char v163;
  _BOOL4 v164;
  uint64_t v165;
  int v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  int v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  CFIndex v176;
  uint64_t v177;
  char v178;
  CFIndex v179;
  uint64_t v180;
  id v181;
  CFStringRef v182;
  CFIndex v183;
  UInt8 *v184;
  id v185;
  uint64_t v186;
  CFStringEncoding v187;
  int v188;
  int v189;
  _BOOL4 v191;
  uint64_t v192;
  BOOL v194;
  char v195;
  BOOL v196;
  _BOOL4 v197;
  CFIndex Bytes;
  uint64_t v199;
  id v200;
  int v201;
  int v202;
  int v203;
  uint64_t v205;
  BOOL v206;
  uint64_t v207;
  uint64_t v208;
  _BOOL4 v209;
  char v210;
  _BOOL4 v211;
  uint64_t v212;
  int v213;
  void *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t k;
  void *v219;
  uint64_t v220;
  uint64_t v221;
  unsigned int v222;
  uint64_t v223;
  _BOOL4 v224;
  int v225;
  uint64_t v226;
  _BOOL4 v227;
  int v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  __int16 v233;
  __int16 v234;
  __CFString *v235;
  id v236;
  id v237;
  uint64_t v238;
  char v239;
  uint64_t v240;
  NSRange v241;
  _QWORD *v242;
  _BOOL4 v243;
  unint64_t m;
  unint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  NSString *v249;
  id v250;
  NSUInteger v251;
  NSUInteger v252;
  CFIndex *usedBufLen;
  CFIndex *usedBufLena;
  CFIndex *usedBufLenb;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  _BOOL4 v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  int v263;
  uint64_t v264;
  uint64_t v265;
  id v266;
  const __CFString *v267;
  unint64_t v268;
  uint64_t v269;
  int v270;
  void *v271;
  void *v272;
  unint64_t v273;
  unint64_t v274;
  BOOL v275;
  id v276;
  uint64_t v277;
  _BOOL4 v278;
  id v280;
  uint64_t v281;
  uint64_t v282;
  id v283;
  unsigned int v284;
  void *v285;
  int obj;
  const __CFString *obja;
  id objb;
  uint64_t v289;
  NSUInteger v290;
  NSUInteger range2;
  unsigned int v292;
  int v293;
  signed int v294;
  uint64_t v295;
  CFIndex maxBufLen;
  void *v297;
  void *v298;
  _BOOL4 v299;
  unint64_t v300;
  size_t v301;
  unint64_t v302;
  void *v303;
  AppleSpell *v304;
  size_t v305;
  _QWORD *v306;
  int64_t v307;
  _BOOL4 v308;
  int v309;
  unint64_t v310;
  __CFString *theString;
  NSUInteger range1;
  unint64_t v313[3];
  __int128 v314;
  __int128 v315;
  __int128 v316;
  CFIndex v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  _QWORD block[5];
  UniChar v323[8];
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  uint64_t v334;
  CFIndex numBytes;
  uint64_t v336;
  UInt8 v337[135];
  UInt8 v338[73];
  _QWORD v339[27];
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  UInt8 buffer[73];
  _QWORD v345[12];
  NSRange v346;
  NSRange v347;
  _NSRange result;
  CFRange v349;
  CFRange v350;
  NSRange v351;
  NSRange v352;

  range1 = a5.length;
  v313[0] = a5.location;
  v345[9] = *MEMORY[0x1E0C80C00];
  v276 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v310 = objc_msgSend(a4, "length");
  v27 = objc_msgSend(a6, "count");
  v273 = objc_msgSend(a7, "count");
  v336 = 0;
  if (v27)
    v28 = (const __CFString *)objc_msgSend(a6, "objectAtIndex:", 0);
  else
    v28 = CFSTR("en");
  theString = (__CFString *)a4;
  v267 = v28;
  v29 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", v28);
  v30 = objc_msgSend(v29, "encoding");
  numBytes = 0;
  v334 = 0;
  v332 = 0u;
  v333 = 0u;
  v330 = 0u;
  v331 = 0u;
  v328 = 0u;
  v329 = 0u;
  v326 = 0u;
  v327 = 0u;
  v324 = 0u;
  v325 = 0u;
  *(_OWORD *)v323 = 0u;
  memset(&v339[22], 0, 40);
  memset(&v339[16], 0, 40);
  v304 = self;
  if ((objc_msgSend(a17, "isEqualToString:", CFSTR("com.apple.mail")) & 1) != 0)
    v31 = 1;
  else
    v31 = objc_msgSend(a17, "hasPrefix:", CFSTR("com.apple.iWork"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __329__AppleSpell_Spelling__spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction___block_invoke;
  block[3] = &unk_1EA8CCB00;
  block[4] = v304;
  if (spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__onceToken != -1)
    dispatch_once(&spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__onceToken, block);
  v32 = 0;
  v33 = vdupq_n_s64(v313[0]);
  v34 = 0uLL;
  do
  {
    v35 = (double *)((char *)&v340 + v32);
    vst2q_f64(v35, *(float64x2x2_t *)v33.i8);
    v32 += 32;
  }
  while (v32 != 64);
  v36 = 0;
  v37 = 24;
  if (v30 == 134217984)
    v37 = 48;
  maxBufLen = v37;
  v308 = a10 != 0;
  if (a10 && v27 >= 2 && a9)
    v36 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8 * v27 + 8), "mutableBytes");
  v306 = (_QWORD *)v36;
  v297 = v29;
  if (a21)
  {
    v295 = 0;
    v38 = 0;
    v272 = 0;
    v39 = 0;
    v40 = 0;
  }
  else
  {
    v295 = -[AppleSpell databaseConnectionForLanguageObject:](v304, "databaseConnectionForLanguageObject:", v29);
    v39 = objc_msgSend(-[AppleSpell localDictionaryArrayForLanguageObject:](v304, "localDictionaryArrayForLanguageObject:", v29), "count") != 0;
    v41 = -[AppleSpell taggerForLanguageObject:string:range:](v304, "taggerForLanguageObject:string:range:", v29, a4, v313[0], range1);
    v40 = v41;
    if (a12 && v41)
      -[AppleSpell useWordLanguageModelForLanguageObject:tagger:appIdentifier:](v304, "useWordLanguageModelForLanguageObject:tagger:appIdentifier:", v29, v41, a17);
    if (a10)
    {
      v281 = 0;
      if (v27 > 1)
      {
        v272 = 0;
        v38 = 0;
      }
      else
      {
        v272 = 0;
        v38 = 0;
        if (a12)
        {
          if (objc_msgSend(a7, "count"))
          {
            v309 = v31;
            v38 = objc_msgSend(a7, "firstObject");
            v42 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", v38);
            if ((objc_msgSend(v42, "isEqual:", v297) & 1) != 0
              || (v43 = -[AppleSpell taggerForLanguageObject:string:range:](v304, "taggerForLanguageObject:string:range:", v42, theString, v313[0], range1)) == 0)
            {
              v281 = 0;
              v272 = 0;
              v38 = 0;
            }
            else
            {
              v272 = v42;
              v281 = v43;
              -[AppleSpell useWordLanguageModelForLanguageObject:tagger:appIdentifier:](v304, "useWordLanguageModelForLanguageObject:tagger:appIdentifier:", v42);
            }
            v31 = v309;
          }
          else
          {
            v281 = 0;
            v272 = 0;
            v38 = 0;
          }
        }
      }
      v280 = 0;
      v308 = 1;
      if (a18 && !a13)
      {
        BYTE2(usedBufLen) = a15;
        BYTE1(usedBufLen) = a14;
        LOBYTE(usedBufLen) = a12;
        v280 = +[PRTypologyRecord openTypologyRecordWithString:range:languageObject:languages:topLanguages:autocorrect:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:](PRTypologyRecord, "openTypologyRecordWithString:range:languageObject:languages:topLanguages:autocorrect:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:", theString, v313[0], range1, v297, a6, a7, usedBufLen, a16, a17, a18);
        v308 = 1;
      }
      goto LABEL_31;
    }
    v308 = 0;
    v38 = 0;
    v272 = 0;
  }
  v280 = 0;
  v281 = 0;
LABEL_31:
  v282 = v40;
  v44 = 0x7FFFFFFFFFFFFFFFLL;
  v283 = a6;
  if (!theString || !v310)
  {
    v307 = -1;
    range2 = 0;
    v285 = 0;
    v301 = 0;
    v277 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_570;
  }
  if (!range1)
  {
    v307 = -1;
    range2 = 0;
    v285 = 0;
    v301 = 0;
    v277 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_570;
  }
  *(_QWORD *)&v331 = theString;
  *((_QWORD *)&v332 + 1) = v313[0];
  *(_QWORD *)&v333 = range1;
  *((_QWORD *)&v331 + 1) = CFStringGetCharactersPtr(theString);
  v266 = a7;
  v264 = v38;
  if (*((_QWORD *)&v331 + 1))
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
  v301 = 0;
  v46 = 0;
  range2 = 0;
  v307 = 0;
  v265 = 0;
  v274 = 0;
  v285 = 0;
  v47 = 0;
  v299 = 0;
  v48 = v30 != -1 && v39;
  v275 = v48;
  v263 = v31 ^ 1;
  v49 = 1;
  if (v27 + 1 > 1)
    v49 = v27 + 1;
  v269 = 8 * v49;
  v334 = 0;
  *(_QWORD *)&v332 = CStringPtr;
  *((_QWORD *)&v333 + 1) = 0;
  v277 = 0x7FFFFFFFFFFFFFFFLL;
  v50 = v313[0];
  v51 = v313[0];
  v44 = 0x7FFFFFFFFFFFFFFFLL;
  v52 = theString;
  v294 = v30;
  v300 = v27;
  do
  {
    v53 = v44;
    v54 = simpleTokenRangeAfterIndex(v323, v313[0], range1, v50 + v47);
    if (v55 < 1)
    {
      v44 = v53;
      break;
    }
    v50 = v54;
    v47 = v55;
    v56 = v54 - 1;
    if (v54 < 1)
    {
      v64 = 0;
    }
    else
    {
      v57 = -[__CFString characterAtIndex:](v52, "characterAtIndex:", v56);
      v58 = v57 - 39;
      v59 = v57 != 39 && (v57 - 45) >= 2;
      v60 = !v59 || v57 == 64;
      v64 = v60 || v57 == 95 || (v57 & 0xFFFE) == 8208 || v57 == 8217;
      if (v58 <= 0x38 && ((1 << v58) & 0x1000000020000C1) != 0
        || (v57 - 8208) <= 9 && ((1 << (v57 - 16)) & 0x203) != 0)
      {
        ++v47;
        v50 = v56;
      }
    }
    v65 = v47 + v50;
    if (v47 + v50 < v310)
    {
      while (1)
      {
        v66 = -[__CFString characterAtIndex:](v52, "characterAtIndex:", v65);
        v67 = v66;
        v68 = v66 - 39;
        if (((v66 - 39) > 0x39 || ((1 << v68) & 0x3000000021800E1) == 0)
          && ((v66 - 8208) > 9 || ((1 << (v66 - 16)) & 0x203) == 0)
          && v66 != 180)
        {
          break;
        }
        v69 = simpleTokenRangeAfterIndex(v323, v313[0], range1, v65);
        if (v70 < 1 || v69 != v65 + 1 || (v65 = v69 + v70, v69 + v70 > v50 + maxBufLen))
        {
          v72 = v306;
          v44 = v53;
          if (v68 <= 0x38 && ((1 << v68) & 0x1000000020000C1) != 0
            || (v71 = 0, (v67 - 8208) <= 9) && ((1 << (v67 - 16)) & 0x203) != 0)
          {
            ++v47;
            v71 = 1;
          }
          v52 = theString;
          v30 = v294;
          goto LABEL_91;
        }
        v47 = v65 - v50;
        v52 = theString;
        if (v65 >= v310)
        {
          v71 = 0;
LABEL_82:
          v30 = v294;
          goto LABEL_84;
        }
      }
      v71 = 0;
      v52 = theString;
      goto LABEL_82;
    }
    v71 = 0;
LABEL_84:
    v72 = v306;
    v44 = v53;
LABEL_91:
    if (a21)
    {
      v73 = v46;
      v74 = v51;
      v27 = v300;
      goto LABEL_565;
    }
    if (v47 > 1)
      v75 = v64;
    else
      v75 = 0;
    v76 = v47 - v75;
    obj = v75;
    v289 = v47 - v75;
    v77 = v50 + v75;
    v292 = v71;
    if (v47 - v75 > 1)
      v78 = v71;
    else
      v78 = 0;
    if (v78 == 1)
      v79 = v76 - (v77 + v76 == v47 + v50);
    else
      v79 = v76;
    v305 = v79;
    if (v308)
    {
      v27 = v300;
      if (v50 < v44 || v50 - v44 >= range2)
      {
        if (v72)
        {
          v351.location = v44;
          v346.location = v313[0];
          v346.length = range1;
          v351.length = range2;
          v80 = NSIntersectionRange(v346, v351);
          v81 = v306;
          if (v80.length && v306[v300] && v300)
          {
            for (i = 0; i < v300; ++i)
            {
              v83 = v81[i];
              if (v83 >= 2 && v81[v300] <= 2 * v83)
              {
                v84 = objc_msgSend(v283, "objectAtIndex:", i);
                v81 = v306;
                if (v84)
                  break;
              }
              else
              {
                v84 = 0;
              }
            }
            v52 = theString;
            if (v84)
            {
              v85 = -[AppleSpell _orthographyByModifyingOrthography:withLatinLanguage:](v304, "_orthographyByModifyingOrthography:withLatinLanguage:", a8);
              v86 = objc_alloc(MEMORY[0x1E0CB3848]);
              v87 = v85;
              v52 = theString;
              v88 = (void *)objc_msgSend(v86, "initWithRange:orthography:", v80.location + a11, v80.length, v87);
              objc_msgSend(a10, "addObject:", v88);

              v81 = v306;
            }
          }
          bzero(v81, v269);
          v30 = v294;
        }
        v44 = -[__CFString paragraphRangeForRange:](v52, "paragraphRangeForRange:", v50, v47);
        range2 = v89;
        v90 = 0;
        if (v51 < v44)
          v46 = 0;
        do
        {
          if (*(_QWORD *)((char *)&v340 + v90) < v44)
          {
            v91 = (NSUInteger *)((char *)&v340 + v90);
            *v91 = v44;
            v91[1] = 0;
          }
          v90 += 16;
        }
        while (v90 != 64);
        if (v51 <= v44)
          v51 = v44;
        v72 = v306;
      }
    }
    else
    {
      v27 = v300;
    }
    if (v72)
      ++v72[v27];
    if (!v308 || !a14 || v299)
    {
      v74 = v77;
LABEL_132:
      v93 = 0;
      goto LABEL_138;
    }
    v92 = v51 + v46;
    v74 = v77;
    if (v77 < v51 + v46)
      goto LABEL_132;
    v94 = v44;
    v95 = v44;
    if (v92 == v44)
      goto LABEL_134;
    if (v74 == v92)
      goto LABEL_136;
    v122 = -[__CFString rangeOfCharacterFromSet:options:range:](v52, "rangeOfCharacterFromSet:options:range:", spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__terminatorCharacterSet, 0);
    v93 = 0;
    if (v122 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_137;
    v94 = v122;
    v44 = v95;
    if (v123)
    {
      if (v74 <= v94 + v123)
        goto LABEL_132;
      v124 = -[__CFString rangeOfCharacterFromSet:options:range:](v52, "rangeOfCharacterFromSet:options:range:", spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__nonPunctuationCharacterSet, 0, v94 + v123, v74 - (v94 + v123));
      v93 = 0;
      if (v124 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_137;
      v126 = v124;
      v44 = v95;
      if (v125)
      {
        v127 = spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__whitespaceCharacterSet;
        v128 = -[__CFString characterAtIndex:](theString, "characterAtIndex:", v126);
        v129 = (void *)v127;
        v52 = theString;
        if (objc_msgSend(v129, "characterIsMember:", v128))
LABEL_134:
          v93 = treatWordAsSentenceInitial(v52, v94, v74, v305, v297);
        else
LABEL_136:
          v93 = 0;
LABEL_137:
        v44 = v95;
      }
    }
LABEL_138:
    v96 = v342;
    v97 = v341;
    v341 = v340;
    v342 = v97;
    v343 = v96;
    *(_QWORD *)&v340 = v51;
    *((_QWORD *)&v340 + 1) = v46;
    if (v295)
    {
      v73 = v305;
      if (v30 == -1)
      {
        v299 = 0;
        goto LABEL_565;
      }
    }
    else
    {
      v73 = v305;
      if (!v275)
      {
        v299 = 0;
        v295 = 0;
        goto LABEL_565;
      }
    }
    v284 = v93;
    v290 = v44;
    v98 = -[AppleSpell normalizedStringInString:range:](v304, "normalizedStringInString:range:", v52, v50, v47);
    v99 = -[__CFString length](v98, "length");
    v349.length = -[__CFString length](v98, "length");
    v349.location = 0;
    if (v99 != CFStringGetBytes(v98, v349, v30, 0x5Fu, 0, buffer, maxBufLen, &numBytes))
    {
      v299 = 0;
      v52 = theString;
      goto LABEL_564;
    }
    if (v30 > 1279)
    {
      v52 = theString;
      if (v30 != 1280 && v30 != 1284)
      {
LABEL_248:
        v270 = 0;
        v100 = numBytes;
        if (!numBytes)
          goto LABEL_249;
        goto LABEL_228;
      }
    }
    else
    {
      v52 = theString;
      if (v30 != 514 && v30 != 517)
        goto LABEL_248;
    }
    v100 = numBytes;
    if (numBytes)
    {
      v101 = 0;
      v102 = 0;
      v103 = -1;
      v104 = v345;
      while (1)
      {
        v105 = v101;
        v106 = buffer[v101];
        if ((v106 & 0xFC) == 0x28
          || ((v107 = buffer[v101], v106 - 35 <= 0x3B)
            ? (v108 = ((1 << (v106 - 35)) & 0xF0000003E00000FLL) == 0)
            : (v108 = 1),
              !v108
           || ((v107 - 123) <= 0x25
             ? (v109 = ((1 << (v107 - 123)) & 0x201000041FLL) == 0)
             : (v109 = 1),
               v109 ? (v110 = v107 == 0) : (v110 = 1),
               v110)))
        {
          v106 = 32;
          buffer[v105] = 32;
        }
        if ((v30 | 4) == 0x504)
          break;
        if (v30 == 514)
        {
          if (v106 > 0xF7u
            || v106 - 216 < 0x1F
            || v106 - 192 < 0x17
            || (v106 & 0xDFu) - 65 < 0x1A)
          {
            goto LABEL_201;
          }
          v112 = v106 + 95;
          if ((v106 + 95) < 0x1Fu && ((0x6F356F35u >> v112) & 1) != 0)
          {
            v106 = byte_1DE2F1AF8[v112];
LABEL_201:
            v102 = 1;
          }
        }
        else
        {
          if (v30 != 517)
            goto LABEL_201;
          if (v106 <= 0x2Fu && ((1 << v106) & 0xE00400000000) != 0)
          {
            v106 = 32;
            buffer[v105] = 32;
          }
          if (v106 - 174 < 0x42
            || v106 - 161 < 0xC
            || (v106 & 0xDFu) - 65 < 0x1A
            || v106 - 241 < 0xC
            || (v106 & 0xFE) == 0xFE)
          {
            goto LABEL_201;
          }
        }
LABEL_202:
        if (v106 == 33 || v106 == 63)
        {
          v106 = 46;
          buffer[v105] = 46;
          v113 = v105 + 2;
          if (v105 + 2 < v100)
            goto LABEL_208;
        }
        else
        {
          v113 = v105 + 2;
          if (v105 + 2 < v100 && v106 == 46)
          {
LABEL_208:
            if (buffer[v105 + 1] == 46 && buffer[v113] == 46)
            {
              v106 = 32;
              buffer[v113] = 32;
              buffer[v105 + 1] = 32;
              buffer[v105] = 32;
            }
            else
            {
              v106 = 46;
            }
          }
        }
        v101 = v105 + 1;
        if (v105 + 1 < v100
          && v106 <= 0x2Eu
          && ((1 << v106) & 0x700200000000) != 0
          && (v114 = buffer[v101], v114 <= 0x3F)
          && ((1 << v114) & 0x8000700200000000) != 0)
        {
          buffer[v101] = 32;
          buffer[v105] = 32;
        }
        else if (v30 == 1280 && v106 == 173)
        {
          if (v101 < v100)
          {
            v115 = v100 + v103;
            v116 = v104;
            do
            {
              *(v116 - 1) = *v116;
              ++v116;
              --v115;
            }
            while (v115);
          }
          numBytes = --v100;
        }
        --v103;
        v104 = (_QWORD *)((char *)v104 + 1);
        if (v101 >= v100)
          goto LABEL_227;
      }
      v111 = v106 - 130;
      if (v111 <= 0x39)
      {
        if (((1 << (v106 + 126)) & 0x2018205) != 0)
        {
          v106 = 39;
          goto LABEL_194;
        }
        if (((1 << (v106 + 126)) & 0x200020000060000) != 0)
        {
          v106 = 34;
          goto LABEL_194;
        }
        if (v111 == 20)
        {
          v106 = 45;
LABEL_194:
          buffer[v105] = v106;
        }
      }
      if (v106 > 0xF7u
        || v106 - 216 < 0x1F
        || v106 - 192 < 0x17
        || (v106 & 0xDFu) - 65 < 0x1A
        || v106 - 138 <= 0x15 && ((1 << (v106 + 118)) & 0x350015) != 0)
      {
        goto LABEL_201;
      }
      goto LABEL_202;
    }
    v102 = 0;
LABEL_227:
    v270 = v102 & 1;
    if (!v100)
    {
LABEL_249:
      v120 = 1;
      goto LABEL_250;
    }
LABEL_228:
    v117 = 0;
    do
    {
      v118 = buffer[v117];
      v120 = (v118 & 0x80u) == 0 && v118 != 95;
      ++v117;
    }
    while (v120 && v117 < v100);
LABEL_250:
    v299 = 0;
    buffer[v100] = 0;
    if (!v308)
    {
      v133 = !a12 || !v308;
      v134 = !a12;
      goto LABEL_270;
    }
    v130 = *(_OWORD *)&v339[24];
    *(_OWORD *)&v339[23] = *(_OWORD *)&v339[22];
    *(_OWORD *)&v339[25] = v130;
    v131 = *(_OWORD *)&v339[18];
    *(_OWORD *)&v339[17] = *(_OWORD *)&v339[16];
    *(_OWORD *)&v339[19] = v131;
    v339[16] = 0;
    v339[22] = 0;
    v132 = v339[23];
    v299 = v308
        && a14
        && -[AppleSpell checkNoCapAbbreviationWordBuffer:length:languageObject:](v304, "checkNoCapAbbreviationWordBuffer:length:languageObject:", buffer);
    v274 += v132;
    if (!a12)
    {
      v134 = 1;
      v133 = !v308 | 1;
      goto LABEL_269;
    }
    v73 = v305;
    if (a15)
    {
      v135 = 0;
      v136 = v47 + v50;
      while (v135 != -64)
      {
        if (v135 == -48)
        {
          v137 = v340;
        }
        else
        {
          v137 = *(_QWORD *)&buffer[v135 - 9];
          if (v137 == *(_QWORD *)((char *)&v342 + v135))
            goto LABEL_267;
        }
        if (v137 < v50)
        {
          v138 = v136 - v137;
          v139 = v136 - v137 > 1 ? v292 : 0;
          v140 = v138 - v139;
          v141 = -[__CFString substringWithRange:](theString, "substringWithRange:", v137, v138 - v139);
          LOBYTE(v257) = a13;
          v142 = v140;
          v52 = theString;
          v143 = -[AppleSpell _phraseCapitalizationResultForString:range:currentWordRange:inString:offset:languageObject:onlyAtInsertionPoint:keyEventArray:selectedRangeValue:](v304, "_phraseCapitalizationResultForString:range:currentWordRange:inString:offset:languageObject:onlyAtInsertionPoint:keyEventArray:selectedRangeValue:", v141, v137, v142, v74, v305, theString, a11, v297, v257, a16, a18);
          if (v143)
          {
            v160 = v143;
            v27 = v300;
            goto LABEL_562;
          }
        }
LABEL_267:
        v135 -= 16;
      }
    }
    if (!a12 || !v308)
    {
      v144 = 0;
      v134 = !a12;
      v151 = !v308;
LABEL_286:
      v27 = v300;
      goto LABEL_302;
    }
    v161 = v297;
    v27 = v300;
    if (!objc_msgSend(v297, "isEnglish"))
    {
      v133 = 0;
      v134 = 0;
      goto LABEL_270;
    }
    v162 = 0;
    v163 = 0;
    do
    {
      if (v305 == strlen(off_1EA8CEE40[v162]) && !strncasecmp_l((const char *)buffer, off_1EA8CEE40[v162], v305, 0))
        v163 = 1;
      if ((v163 & 1) != 0)
        break;
      v59 = v162++ >= 0xB;
    }
    while (!v59);
    if ((v163 & 1) == 0)
    {
      v133 = 0;
      v134 = 0;
      v30 = v294;
LABEL_269:
      v73 = v305;
LABEL_270:
      if (((v133 | !a15) & 1) != 0)
      {
        v144 = 0;
LABEL_301:
        v151 = !v308;
LABEL_302:
        v153 = v144 == 0;
        v154 = v308 && v153;
        if (v308 && v153)
          v155 = 0;
        else
          v155 = v144;
        v293 = v151;
        if (!v134 && v154)
        {
          if ((objc_msgSend(v297, "isIrishGaelic") & 1) != 0
            || (objc_msgSend(v297, "isNynorsk") & 1) != 0
            || objc_msgSend(v297, "isRomanian"))
          {
            v156 = (void *)-[__CFString substringWithRange:](v52, "substringWithRange:", v74, v305);
            v157 = v52;
            v158 = -[AppleSpell autocorrectionDictionaryForLanguageObject:](v304, "autocorrectionDictionaryForLanguageObject:", v297);
            if (objc_msgSend(v297, "isNynorsk"))
              v158 = &unk_1EA8E7520;
            if (objc_msgSend(v158, "objectForKey:", objc_msgSend(v156, "lowercaseString")))
            {
              LODWORD(v258) = 0;
              v159 = -[AppleSpell _correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:](v304, "_correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:", v156, 0, v158, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(v297, "identifier")), 0, correctionFlags(v284, 0, a13, 0, a22), 0, 0, a19, v258, v265, &v336);
              v52 = v157;
              v73 = v305;
              if (v159)
              {
                v160 = v159;
                v27 = v300;
                v30 = v294;
                goto LABEL_562;
              }
              v134 = 0;
              v155 = 0;
              v27 = v300;
              v30 = v294;
            }
            else
            {
              v134 = 0;
              v155 = 0;
              v52 = v157;
              v30 = v294;
              v73 = v305;
            }
          }
          else
          {
            v134 = 0;
            v155 = 0;
            v73 = v305;
          }
        }
        if (v155)
          v164 = 0;
        else
          v164 = v308;
        if (v134 || !v164)
        {
          v161 = v297;
        }
        else
        {
          v161 = v297;
          if ((objc_msgSend(v297, "isGreek") & 1) != 0
            || (objc_msgSend(v297, "isHindi") & 1) != 0
            || (objc_msgSend(v297, "isIrishGaelic") & 1) != 0
            || (objc_msgSend(v297, "isPunjabi") & 1) != 0
            || (objc_msgSend(v297, "isPolish") & 1) != 0
            || (objc_msgSend(v297, "isRomanian") & 1) != 0
            || (objc_msgSend(v297, "isTelugu") & 1) != 0
            || objc_msgSend(v297, "isVietnamese"))
          {
            BYTE1(usedBufLena) = v284;
            LOBYTE(usedBufLena) = a13;
            v165 = -[AppleSpell _accentCorrectionResultForString:range:inString:offset:languageObject:onlyAtInsertionPoint:capitalize:keyEventArray:selectedRangeValue:](v304, "_accentCorrectionResultForString:range:inString:offset:languageObject:onlyAtInsertionPoint:capitalize:keyEventArray:selectedRangeValue:", -[__CFString substringWithRange:](v52, "substringWithRange:", v74, v73), v74, v73, v52, a11, v297, usedBufLena, a16, a18);
            if (v165)
            {
              v160 = v165;
              goto LABEL_562;
            }
          }
        }
        goto LABEL_345;
      }
      v144 = -[AppleSpell capitalizationDictionaryArrayForLanguageObject:](v304, "capitalizationDictionaryArrayForLanguageObject:", v297);
      if (!v144)
        goto LABEL_301;
      v145 = (void *)-[__CFString substringWithRange:](v52, "substringWithRange:", v74, v73);
      objc_msgSend(v145, "rangeOfString:", CFSTR("’"));
      if (v146)
        v145 = (void *)objc_msgSend(v145, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
      v320 = 0u;
      v321 = 0u;
      v318 = 0u;
      v319 = 0u;
      v147 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v318, v339, 16);
      v148 = (uint64_t)v285;
      if (v147)
      {
        v149 = *(_QWORD *)v319;
        while (2)
        {
          for (j = 0; j != v147; ++j)
          {
            if (*(_QWORD *)v319 != v149)
              objc_enumerationMutation(v144);
            v148 = objc_msgSend(*(id *)(*((_QWORD *)&v318 + 1) + 8 * j), "objectForKey:", v145);
            if (v148)
            {
              v30 = v294;
              v73 = v305;
              goto LABEL_288;
            }
          }
          v147 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v318, v339, 16);
          if (v147)
            continue;
          break;
        }
        v144 = 0;
        v285 = 0;
        v151 = !v308;
        v27 = v300;
        v52 = theString;
        v30 = v294;
        v73 = v305;
        goto LABEL_302;
      }
LABEL_288:
      if (v148)
        v152 = v73 == 1;
      else
        v152 = 0;
      v285 = (void *)v148;
      if (v152)
      {
        v27 = v300;
        v52 = theString;
        if ((v74 + 1 >= v310
           || -[__CFString characterAtIndex:](theString, "characterAtIndex:", v74 + 1) != 46
           && -[__CFString characterAtIndex:](theString, "characterAtIndex:", v74 + 1) != 41)
          && (!v74
           || v74 + 1 != v310
           || -[__CFString characterAtIndex:](theString, "characterAtIndex:", v74 - 1) != 40))
        {
          goto LABEL_293;
        }
      }
      else
      {
        v27 = v300;
        v52 = theString;
        if (v148)
        {
LABEL_293:
          v144 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3548]), "initWithRange:replacementString:", v74 + a11, v73, v285);
          objc_msgSend(a10, "addObject:", v144);
          goto LABEL_301;
        }
      }
      v144 = 0;
      v285 = 0;
      goto LABEL_301;
    }
    v180 = -[__CFString substringWithRange:](v52, "substringWithRange:", v74, v305);
    LODWORD(v258) = 0;
    v256 = -[AppleSpell autocorrectionDictionaryForLanguageObject:](v304, "autocorrectionDictionaryForLanguageObject:", v297);
    v52 = theString;
    v73 = v305;
    v181 = -[AppleSpell _correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:](v304, "_correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:", v180, v74, v305, theString, a11, v282, 0, v256, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(v297, "identifier")), 0, correctionFlags(v284, 0, a13, 0, a22), 0, 0, a19, v258, v265,
             &v336);
    v144 = v181;
    v30 = v294;
    if (!v181)
    {
      v134 = 0;
      v151 = 0;
      goto LABEL_286;
    }
    v285 = (void *)objc_msgSend(v181, "replacementString");
    objc_msgSend(a10, "addObject:", v144);
    v293 = 0;
    v27 = v300;
LABEL_345:
    if (objc_msgSend(v161, "isGreek")
      && -[AppleSpell _acceptWithoutAccentForString:range:inString:languageObject:](v304, "_acceptWithoutAccentForString:range:inString:languageObject:", -[__CFString substringWithRange:](v52, "substringWithRange:", v74, v73), v74, v73, v52, v161))
    {
      goto LABEL_564;
    }
    WORD2(usedBufLena) = 257;
    LODWORD(usedBufLena) = 16843009;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v304, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, numBytes, v161, v295, a3, 1, usedBufLena, 0))
    {
      if (v306)
      {
        v166 = numBytes > 1 ? v270 : 0;
        if (v166 == 1
          && !-[AppleSpell validateAbbreviationOrNumberWordBuffer:length:languageObject:connection:sender:](v304, "validateAbbreviationOrNumberWordBuffer:length:languageObject:connection:sender:", buffer)&& !-[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](v304, "checkNameWordBuffer:length:languageObject:globalOnly:", buffer, numBytes, v161, 1))
        {
          v167 = objc_msgSend(v283, "indexOfObject:", v267);
          ++v306[v167];
        }
      }
      if (v264)
      {
        if (v30 == objc_msgSend(v272, "encoding"))
        {
          v168 = -[AppleSpell databaseConnectionForLanguageObject:](v304, "databaseConnectionForLanguageObject:", v272);
          WORD2(usedBufLenb) = 257;
          LODWORD(usedBufLenb) = 16777473;
          if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v304, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, numBytes, v272, v168, a3, 1, usedBufLenb, 0))
          {
            v339[16] = 1;
          }
        }
      }
      goto LABEL_557;
    }
    v169 = -[__CFString substringWithRange:](v52, "substringWithRange:", v50, v47);
    v170 = (void *)v169;
    if (v47 == v73)
      v171 = obj;
    else
      v171 = 1;
    if (v171 == 1)
    {
      v172 = v161;
      v173 = v169;
      v174 = -[__CFString substringWithRange:](v52, "substringWithRange:", v74, v73);
      v170 = (void *)v173;
      v161 = v172;
      v175 = v174;
      if (!v170)
        goto LABEL_557;
    }
    else
    {
      v175 = 0;
      if (!v169)
        goto LABEL_557;
    }
    v271 = v170;
    if ((objc_msgSend(a3, "isWordInUserDictionaries:caseSensitive:", v170, 0) & 1) != 0
      || v175
      && ((objc_msgSend(v271, "hasPrefix:", CFSTR("@")) & 1) != 0
       || (objc_msgSend(a3, "isWordInUserDictionaries:caseSensitive:", v175, 0) & 1) != 0))
    {
      goto LABEL_557;
    }
    v176 = numBytes;
    v268 = v74;
    if (numBytes)
    {
      v177 = 0;
      v178 = 0;
      v179 = numBytes - 1;
      do
      {
        while (buffer[v177] == 39)
        {
          buffer[v177] = -110;
          v178 = 1;
          v60 = v179 == v177++;
          if (v60)
            goto LABEL_384;
        }
        ++v177;
      }
      while (v176 != v177);
      if ((v178 & 1) == 0)
        goto LABEL_393;
LABEL_384:
      v182 = (id)CFStringCreateWithBytes(0, buffer, v176, v30, 0);
      if (v182)
        LOBYTE(v182) = objc_msgSend(a3, "isWordInUserDictionaries:caseSensitive:", v182, 0);
      v183 = numBytes;
      if (numBytes)
      {
        v184 = buffer;
        do
        {
          if (*v184 == 146)
            *v184 = 39;
          ++v184;
          --v183;
        }
        while (v183);
      }
      if ((v182 & 1) != 0)
      {
        v185 = v161;
        goto LABEL_507;
      }
    }
LABEL_393:
    v262 = (void *)v175;
    v298 = v161;
    if (v27 < 2)
    {
      v191 = 0;
LABEL_430:
      if (!v191 && v273)
      {
        v199 = 0;
        v74 = v268;
        while (1)
        {
          v200 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", objc_msgSend(v266, "objectAtIndex:", v199));
          v201 = objc_msgSend(v200, "encoding");
          if ((objc_msgSend(v161, "isEqual:", v200) & 1) == 0)
          {
            v202 = objc_msgSend(v283, "containsObject:", objc_msgSend(v200, "identifier"));
            v203 = v30 == v201 || v120;
            if (!v202 && v203 != 0)
            {
              v205 = -[AppleSpell databaseConnectionForLanguageObject:](v304, "databaseConnectionForLanguageObject:", v200);
              WORD2(usedBufLenb) = 257;
              LODWORD(usedBufLenb) = 16777473;
              v161 = v298;
              if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v304, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, numBytes, v200, v205, a3, 1, usedBufLenb, 0))
              {
                break;
              }
            }
          }
          if (++v199 >= v273)
            goto LABEL_446;
        }
        v52 = theString;
        if (!v199)
          v339[16] = 1;
        v185 = v298;
        v27 = v300;
        if (v306)
          goto LABEL_508;
        goto LABEL_509;
      }
      v74 = v268;
      if (v191)
      {
        v185 = v161;
        v27 = v300;
        goto LABEL_506;
      }
LABEL_446:
      v27 = v300;
      if ((spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__readDefault & 1) == 0)
      {
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSSpellCheckerAutocorrectMultilingual")))
        {
          spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__autocorrectMultilingual = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSSpellCheckerAutocorrectMultilingual"));
        }
        spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__readDefault = 1;
      }
      if (spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__autocorrectMultilingual)
        v206 = 0;
      else
        v206 = v300 > 1;
      if (v206)
        v207 = 0;
      else
        v207 = v295;
      if (a12)
      {
        v208 = -[AppleSpell autocorrectionDictionaryForLanguageObject:](v304, "autocorrectionDictionaryForLanguageObject:", v161);
        v209 = 0;
        v210 = 1;
        v278 = v74 != 0x7FFFFFFFFFFFFFFFLL;
        v52 = theString;
        if (v74 != 0x7FFFFFFFFFFFFFFFLL && v305 >= 3)
        {
          v210 = 0;
          v209 = (v208 | v207) != 0;
          v278 = 1;
        }
      }
      else
      {
        v208 = 0;
        v209 = 0;
        v278 = v74 != 0x7FFFFFFFFFFFFFFFLL;
        v210 = 1;
        v52 = theString;
      }
      if (a23)
        *a23 = 0;
      if (v308)
      {
        if (v208)
          v210 = 1;
        if ((v210 & 1) == 0 && !v207)
          v339[22] = 1;
      }
      v260 = v208;
      if (v74)
        v211 = v209;
      else
        v211 = 0;
      v73 = v305;
      if (v211)
      {
        if (!spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__precedingCharacterSet)
          spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__precedingCharacterSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("~!@#$%^&*-_=+[]\\|<./?"));
        -[__CFString rangeOfCharacterFromSet:options:range:](v52, "rangeOfCharacterFromSet:options:range:");
        v209 = v212 == 0;
      }
      v261 = v207;
      if (v30 == 1280 && v209 && v74 >= 4)
      {
        v259 = v209;
        v213 = isUpperCase(-[__CFString characterAtIndex:](v52, "characterAtIndex:", v74));
        v209 = v259;
        if (v213)
        {
          v214 = (void *)spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__titlesArray;
          if (!spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__titlesArray)
          {
            v214 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("Mr"), CFSTR("Mrs"), CFSTR("Ms"), CFSTR("Mme"), CFSTR("Mlle"), CFSTR("Sr"), CFSTR("Sra"), CFSTR("Srta"), CFSTR("Dr"), 0);
            spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__titlesArray = (uint64_t)v214;
          }
          v315 = 0u;
          v316 = 0u;
          *(_OWORD *)&v313[1] = 0u;
          v314 = 0u;
          v215 = objc_msgSend(v214, "countByEnumeratingWithState:objects:count:", &v313[1], v337, 16);
          v209 = v259;
          if (v215)
          {
            v216 = v215;
            v217 = *(_QWORD *)v314;
            v302 = v74 - 2;
            objb = v214;
            while (2)
            {
              for (k = 0; k != v216; ++k)
              {
                if (*(_QWORD *)v314 != v217)
                  objc_enumerationMutation(objb);
                v219 = *(void **)(v313[2] + 8 * k);
                v220 = objc_msgSend(v219, "length");
                if (v74 >= v220 + 2
                  && -[__CFString characterAtIndex:](theString, "characterAtIndex:", v302) == 46
                  && !-[__CFString compare:options:range:](theString, "compare:options:range:", v219, 0, v302 - v220, v220)|| v74 >= v220 + 1&& !-[__CFString compare:options:range:](theString, "compare:options:range:", v219, 0, v74 + ~v220, v220))
                {
                  v224 = 0;
                  v27 = v300;
                  v161 = v298;
                  goto LABEL_516;
                }
              }
              v216 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v313[1], v337, 16);
              v27 = v300;
              v52 = theString;
              v209 = v259;
              if (v216)
                continue;
              break;
            }
          }
        }
      }
      if (v209)
      {
        v161 = v298;
        v221 = (uint64_t)v285;
        v222 = v284;
        if (v310 <= v305 + v74)
        {
          v224 = 1;
          v52 = theString;
          goto LABEL_518;
        }
        if (!spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__followingCharacterSet)
          spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__followingCharacterSet = (uint64_t)objc_retain((id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("@#$%^&*-_=+([]\\|>/")));
        -[__CFString rangeOfCharacterFromSet:options:range:](theString, "rangeOfCharacterFromSet:options:range:");
        v224 = v223 == 0;
        if (!v223)
        {
          v52 = theString;
          v221 = (uint64_t)v285;
          v222 = v284;
          if (v305 <= 3)
          {
            v225 = -[__CFString characterAtIndex:](theString, "characterAtIndex:", v305 + v74);
            v222 = v284;
            v60 = v225 == 46;
            v221 = (uint64_t)v285;
            v224 = !v60;
          }
LABEL_518:
          if (v308)
          {
            v227 = v339[23] && v224;
            if (v227
              && (unint64_t)(4 * vaddvq_s64(vaddq_s64(*(int64x2_t *)&v339[25], *(int64x2_t *)&v339[23]))) > 0xB)
            {
              v339[22] = 1;
              if ((v278 & ~v293) == 1 && v305)
              {
                v224 = 0;
                goto LABEL_532;
              }
LABEL_542:
              v301 = v305;
              v277 = v74;
              goto LABEL_559;
            }
          }
          v228 = v278;
          if (((v293 | !v224 | v263) & 1) != 0)
            v228 = v278 & ~v293;
          else
            v265 = vaddvq_s64(vaddq_s64(vshlq_n_s64(vaddq_s64(*(int64x2_t *)&v339[23], *(int64x2_t *)&v339[25]), 2uLL), (int64x2_t)v274));
          if (!v228 || !v305)
          {
            if (v224)
            {
              if (v262)
                v232 = v262;
              else
                v232 = v271;
              LODWORD(v258) = 0;
              v52 = theString;
              v221 = objc_msgSend(-[AppleSpell _correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:](v304, "_correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:", v232, v74, v305, theString, a11, v282, a17, v260, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(v161, "identifier")), v261, correctionFlags(v284, a15, a13, 0, a22), a16, a18, a19,
                         v258,
                         v265,
                         &v336),
                       "replacementString");
              v222 = v284;
              goto LABEL_542;
            }
            v301 = v305;
            v277 = v74;
LABEL_558:
            v222 = v284;
            goto LABEL_559;
          }
LABEL_532:
          v229 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3930]), "initWithRange:", v74 + a11, v305);
          objc_msgSend(a10, "addObject:", v229);

          if (v224)
          {
            v230 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", objc_msgSend(v161, "identifier"));
            v231 = v262;
            if (v272)
            {
              if (*(_OWORD *)&v339[17] == 0
                || !-[AppleSpell _useAlternateLanguageForRange:ofString:languageObject:tagger:alternateLanguageObject:alternateTagger:appIdentifier:](v304, "_useAlternateLanguageForRange:ofString:languageObject:tagger:alternateLanguageObject:alternateTagger:appIdentifier:", v74, v305, v52, v161, v282, v272, v281, a17))
              {
                objc_msgSend(v230, "addObject:", objc_msgSend(v272, "identifier"));
              }
              else
              {
                objc_msgSend(v230, "insertObject:atIndex:", objc_msgSend(v272, "identifier"), 0);
              }
            }
            if (v74 < 2)
              v233 = 0;
            else
              v233 = -[__CFString characterAtIndex:](v52, "characterAtIndex:", v74 - 2);
            v303 = v230;
            if (v305 + v74 + 2 <= v310)
            {
              v235 = theString;
              v234 = -[__CFString characterAtIndex:](theString, "characterAtIndex:", v305 + v74 + 1);
            }
            else
            {
              v234 = 0;
              v235 = theString;
            }
            if (!v262)
              v231 = v271;
            WORD1(v258) = v234;
            LOWORD(v258) = v233;
            v236 = -[AppleSpell _correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:](v304, "_correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:", v231, v74, v305, v235, a11, v282, a17, v260, v303, v261, correctionFlags(v284, a15, a13, 0, a22), a16, a18, a19, v258,
                     v265,
                     &v336);
            v52 = v235;
            if (v236)
            {
              v237 = v236;
              v238 = objc_msgSend(v236, "replacementString");
              objc_msgSend(a10, "addObject:", v237);
              v221 = v238;
              v301 = v305;
              v277 = v74;
              v27 = v300;
              goto LABEL_558;
            }
            v339[22] = 1;
            v301 = v305;
            v277 = v74;
            v27 = v300;
          }
          else
          {
            v301 = v305;
            v277 = v74;
          }
LABEL_557:
          v221 = (uint64_t)v285;
          goto LABEL_558;
        }
LABEL_516:
        v52 = theString;
      }
      else
      {
        v224 = 0;
        v161 = v298;
      }
      v221 = (uint64_t)v285;
      v222 = v284;
      goto LABEL_518;
    }
    v186 = 0;
    while (1)
    {
      obja = (const __CFString *)objc_msgSend(v283, "objectAtIndex:", v186);
      v185 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:");
      v187 = objc_msgSend(v185, "encoding");
      v188 = objc_msgSend(v161, "isEqual:", v185);
      v189 = v30 == v187 || v120;
      if (!v188 && v189 != 0)
        break;
      if (((objc_msgSend(v161, "isEqual:", v185) | v120) & 1) == 0
        && (v30 == 1280 && v187 == 514
         || (v30 == 1280 ? (v194 = v187 == 134217984) : (v194 = 0),
             !v194 ? (v195 = 0) : (v195 = 1),
             v187 == 1280 ? (v196 = v30 == 514) : (v196 = 0),
             v187 == 1280 ? (v197 = v30 == 134217984) : (v197 = 0),
             v196 || (v195 & 1) != 0 || v197)))
      {
        v317 = 0;
        -[AppleSpell databaseConnectionForLanguageObject:](v304, "databaseConnectionForLanguageObject:", v185);
        v350.location = v50;
        v350.length = v47;
        Bytes = CFStringGetBytes(theString, v350, v187, 0x5Fu, 0, v338, maxBufLen, &v317);
        v191 = 0;
        if (v47 == Bytes)
        {
          v338[v317] = 0;
          WORD2(usedBufLenb) = 257;
          LODWORD(usedBufLenb) = 16777473;
          v191 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v304, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", v338, usedBufLenb, 0);
        }
        v27 = v300;
        if (v191)
          goto LABEL_430;
      }
      else
      {
        v191 = 0;
      }
LABEL_427:
      if (++v186 >= v27)
        goto LABEL_430;
    }
    v192 = -[AppleSpell databaseConnectionForLanguageObject:](v304, "databaseConnectionForLanguageObject:", v185);
    WORD2(usedBufLenb) = 257;
    LODWORD(usedBufLenb) = 16777473;
    if (!-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v304, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, numBytes, v185, v192, a3, 1, usedBufLenb, 0))
    {
      v191 = 0;
      v161 = v298;
      goto LABEL_427;
    }
    v267 = obja;
    v295 = v192;
LABEL_506:
    v52 = theString;
LABEL_507:
    if (v306)
    {
LABEL_508:
      v226 = objc_msgSend(v283, "indexOfObject:", objc_msgSend(v185, "identifier"));
      ++v306[v226];
    }
LABEL_509:
    v161 = v185;
    v221 = (uint64_t)v285;
    v222 = v284;
    v74 = v268;
LABEL_559:
    v297 = v161;
    if ((v308 & v222) != 1 || v221)
    {
      v285 = (void *)v221;
    }
    else
    {
      LOBYTE(usedBufLenb) = a13;
      v160 = -[AppleSpell _capitalizationResultForString:range:inString:offset:languageObject:onlyAtInsertionPoint:keyEventArray:selectedRangeValue:](v304, "_capitalizationResultForString:range:inString:offset:languageObject:onlyAtInsertionPoint:keyEventArray:selectedRangeValue:", -[__CFString substringWithRange:](v52, "substringWithRange:", v74, v289), v74, v289, v52, a11, v161, usedBufLenb, a16, a18);
      v285 = 0;
      if (v160)
LABEL_562:
        objc_msgSend(a10, "addObject:", v160);
    }
LABEL_564:
    v44 = v290;
LABEL_565:
    ++v307;
    v239 = v308;
    if (!v301)
      v239 = 1;
    v51 = v74;
    v46 = v73;
  }
  while ((v239 & 1) != 0);
LABEL_570:
  if (a20)
    *a20 = v307;
  v240 = v282;
  if (v27 >= 2)
  {
    v352.location = v44;
    v347.location = v313[0];
    v347.length = range1;
    v352.length = range2;
    v241 = NSIntersectionRange(v347, v352);
    v242 = v306;
    v243 = v308;
    if (!v306)
      v243 = 0;
    if (v243 && v241.length && v306[v27])
    {
      for (m = 0; m < v27; ++m)
      {
        v245 = v242[m];
        if (v245 >= 2 && v242[v27] <= 2 * v245)
        {
          v246 = objc_msgSend(v283, "objectAtIndex:", m);
          v242 = v306;
          if (v246)
            break;
        }
        else
        {
          v246 = 0;
        }
      }
      v240 = v282;
      if (v246)
      {
        v247 = -[AppleSpell _orthographyByModifyingOrthography:withLatinLanguage:](v304, "_orthographyByModifyingOrthography:withLatinLanguage:", a8);
        v248 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3848]), "initWithRange:orthography:", v241.location + a11, v241.length, v247);
        objc_msgSend(a10, "addObject:", v248);

      }
    }
    v249 = v304->_lastLanguage;
    v304->_lastLanguage = (NSString *)objc_msgSend((id)objc_msgSend(v297, "identifier"), "copy");
  }
  objc_msgSend(v280, "closeTypologyRecordWithResults:", a10);
  -[AppleSpell resetTimer](v304, "resetTimer");
  if (a23 && v285)
  {
    v250 = v285;
    -[AppleSpell invalidateTagger:](v304, "invalidateTagger:", v240);
    -[AppleSpell invalidateTagger:](v304, "invalidateTagger:", v281);

    *a23 = v285;
  }
  else
  {
    -[AppleSpell invalidateTagger:](v304, "invalidateTagger:", v240);
    -[AppleSpell invalidateTagger:](v304, "invalidateTagger:", v281);

  }
  v251 = v277;
  v252 = v301;
  result.length = v252;
  result.location = v251;
  return result;
}

id __329__AppleSpell_Spelling__spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction___block_invoke(uint64_t a1)
{
  id result;

  spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__terminatorCharacterSet = (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "sentenceTerminatorCharacterSet");
  spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__nonPunctuationCharacterSet = (uint64_t)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet"), "invertedSet");
  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__whitespaceCharacterSet = (uint64_t)result;
  return result;
}

- (BOOL)_spellServer:(id)a3 canChangeCaseOfFirstLetterInString:(id)a4 toUpperCase:(BOOL)a5 languageObject:(id)a6
{
  _BOOL4 v7;
  unint64_t v11;
  void *v12;
  CFStringEncoding v13;
  _BOOL4 v14;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v17;
  CFIndex v18;
  CFIndex v19;
  CFIndex v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  CFIndex Bytes;
  BOOL v27;
  UInt8 v28;
  BOOL v29;
  CFIndex *usedBufLen;
  CFStringEncoding encoding;
  void *v33;
  id v34;
  UniChar v35[8];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  const UniChar *v44;
  const char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CFIndex v50;
  UInt8 buffer[73];
  uint64_t v52;
  CFRange v53;

  v7 = a5;
  v52 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(a4, "length");
  v12 = -[AppleSpell databaseConnectionForLanguageObject:](self, "databaseConnectionForLanguageObject:", a6);
  v13 = objc_msgSend(a6, "encoding");
  LOBYTE(v14) = 0;
  if (a4 && v11)
  {
    encoding = v13;
    v34 = a3;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    *(_OWORD *)v35 = 0u;
    v36 = 0u;
    v43 = a4;
    v46 = 0;
    v47 = v11;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a4);
    CStringPtr = 0;
    v44 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr((CFStringRef)a4, 0x600u);
    v33 = v12;
    v50 = 0;
    v48 = 0;
    v49 = 0;
    v45 = CStringPtr;
    v17 = simpleTokenRangeAfterIndex(v35, 0, v11, 0);
    v18 = v17;
    v20 = v19;
    v21 = v19 + v17;
    if (v19 + v17 < v11)
    {
      v22 = v17 + 72;
      do
      {
        v23 = objc_msgSend(a4, "characterAtIndex:", v21);
        if (((v23 - 39) > 0x38 || ((1 << (v23 - 39)) & 0x1000000020000C1) == 0)
          && ((v23 - 8208) > 9 || ((1 << (v23 - 16)) & 0x203) == 0))
        {
          break;
        }
        v24 = simpleTokenRangeAfterIndex(v35, 0, v11, v21);
        if (v25 < 1 || v24 != v21 + 1 || (v21 = v24 + v25, v24 + v25 > v22))
        {
          if (++v20)
            goto LABEL_16;
          goto LABEL_26;
        }
        v20 = v21 - v18;
      }
      while (v21 < v11);
    }
    if (!v20)
    {
LABEL_26:
      LOBYTE(v14) = 0;
      return v14;
    }
LABEL_16:
    v53.location = v18;
    v53.length = v20;
    Bytes = CFStringGetBytes((CFStringRef)a4, v53, encoding, 0x5Fu, 0, buffer, 72, &v50);
    LOBYTE(v14) = 0;
    if (v20 == Bytes)
    {
      if (v7)
      {
        if (buffer[0] > 0xF7u
          || buffer[0] - 97 < 0x1A
          || buffer[0] - 223 < 0x18
          || (LOBYTE(v14) = 1, buffer[0] - 154 <= 4) && ((1 << (buffer[0] + 102)) & 0x15) != 0)
        {
          v27 = -[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](self, "checkNameWordBuffer:length:languageObject:globalOnly:", buffer, v50, a6, 0);
          LOBYTE(v14) = 0;
          if (!v27)
          {
            v28 = toUpper(buffer[0]);
            goto LABEL_35;
          }
        }
      }
      else if (buffer[0] - 65 < 0x1A
             || buffer[0] - 192 < 0x17
             || buffer[0] - 216 < 7
             || (LOBYTE(v14) = 1, buffer[0] - 138 <= 0x15) && ((1 << (buffer[0] + 118)) & 0x200015) != 0)
      {
        v29 = -[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](self, "checkNameWordBuffer:length:languageObject:globalOnly:", buffer, v50, a6, 0);
        LOBYTE(v14) = 0;
        if (!v29)
        {
          v28 = toLower(buffer[0]);
LABEL_35:
          buffer[0] = v28;
          WORD2(usedBufLen) = 257;
          LODWORD(usedBufLen) = 16843009;
          v14 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, v50, a6, v33, v34, 1, usedBufLen, 0);
          if (v14)
            LOBYTE(v14) = !-[AppleSpell validateAbbreviationOrNumberWordBuffer:length:languageObject:connection:sender:](self, "validateAbbreviationOrNumberWordBuffer:length:languageObject:connection:sender:", buffer, v50, a6, v33, v34);
        }
      }
    }
  }
  return v14;
}

- (id)_modifiedGrammarDescriptionForDescription:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int16 v13;
  unsigned __int16 v14;

  v3 = a3;
  v4 = objc_msgSend(a3, "rangeOfString:", CFSTR(".  "));
  v6 = v5;
  objc_msgSend(v3, "rangeOfString:", CFSTR("{"));
  v8 = v7;
  objc_msgSend(v3, "rangeOfString:", CFSTR("'"));
  v10 = v9;
  v14 = 8216;
  v13 = 8217;
  if (v6)
  {
    v11 = v4 + v6;
    if (v11 < objc_msgSend(v3, "length"))
      v3 = (id)objc_msgSend(v3, "substringFromIndex:", v11);
  }
  if (v8 | v10)
  {
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v3);
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v14, 1), 0, 0, objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("}"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v13, 1), 0, 0, objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" '"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %C"), v14), 0, 0, objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v13, 1), 0, 0, objc_msgSend(v3, "length"));
  }
  return v3;
}

- (id)_detailWithRange:(_NSRange)a3 description:(id)a4 corrections:(id)a5 issueType:(unint64_t)a6
{
  uint64_t v10;
  id v11;

  v10 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3.location, a3.length);
  v11 = -[AppleSpell _modifiedGrammarDescriptionForDescription:](self, "_modifiedGrammarDescriptionForDescription:", a4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v10, CFSTR("NSGrammarRange"), v11, CFSTR("NSGrammarUserDescription"), a5, CFSTR("NSGrammarCorrections"), &unk_1EA8E7558, CFSTR("NSGrammarConfidenceScore"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6), CFSTR("NSGrammarIssueType"), 0);
}

- (id)_detailWithRange:(_NSRange)a3 description:(id)a4 corrections:(id)a5
{
  return -[AppleSpell _detailWithRange:description:corrections:issueType:](self, "_detailWithRange:description:corrections:issueType:", a3.location, a3.length, a4, a5, 0);
}

- (_NSRange)_modifiedGrammarRangeForDoubledWordRange:(_NSRange)a3 sentenceRange:(_NSRange)a4 inString:(id)a5 corrections:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  _QWORD v16[11];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  _NSRange v21;
  _NSRange result;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3010000000;
  v20 = &unk_1DE2FED5E;
  v21 = a3;
  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    if (a3.location > a3.length)
    {
      v8 = a4.length;
      if (a3.location + a3.length <= a4.length)
      {
        v11 = a4.location;
        if (a4.location + a4.length <= objc_msgSend(a5, "length"))
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __106__AppleSpell_EnglishGrammar___modifiedGrammarRangeForDoubledWordRange_sentenceRange_inString_corrections___block_invoke;
          v16[3] = &unk_1EA8D6F50;
          v16[8] = v8;
          v16[9] = location;
          v16[10] = length;
          v16[6] = &v17;
          v16[7] = v11;
          v16[4] = a5;
          v16[5] = a6;
          objc_msgSend(a5, "enumerateSubstringsInRange:options:usingBlock:", v11, location, 259, v16);
        }
      }
    }
  }
  v12 = v18[4];
  v13 = v18[5];
  _Block_object_dispose(&v17, 8);
  v14 = v12;
  v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

uint64_t __106__AppleSpell_EnglishGrammar___modifiedGrammarRangeForDoubledWordRange_sentenceRange_inString_corrections___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  unint64_t v8;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = *(_QWORD *)(result + 56);
  if (a3 >= v8)
  {
    v11 = result;
    result = objc_msgSend(*(id *)(result + 32), "compare:options:range:", a2, 1, *(_QWORD *)(v11 + 72) + v8, *(_QWORD *)(v11 + 80));
    if (!result)
    {
      v12 = a3 - *(_QWORD *)(v11 + 56);
      v13 = *(_QWORD *)(v11 + 72) - v12 + *(_QWORD *)(v11 + 80);
      v14 = *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8);
      *(_QWORD *)(v14 + 32) = v12;
      *(_QWORD *)(v14 + 40) = v13;
      result = objc_msgSend(*(id *)(v11 + 40), "addObject:", a2);
    }
  }
  *a7 = 1;
  return result;
}

- (BOOL)_acceptErrorWithRuleType:(unint64_t)a3 ruleNumber:(unint64_t)a4 grammarRange:(_NSRange)a5 sentenceRange:(_NSRange)a6 inString:(id)a7 corrections:(id)a8 issueType:(unint64_t *)a9
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  int v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a5.length)
  {
    LOBYTE(v13) = 0;
    return v13;
  }
  length = a5.length;
  location = a5.location;
  if (a5.location + a5.length > a6.length)
    goto LABEL_4;
  v11 = a6.location;
  if (a6.location + a6.length > objc_msgSend(a7, "length", a3, a4))
    goto LABEL_4;
  v14 = (void *)objc_msgSend(a7, "substringWithRange:", v11 + location, length);
  LOBYTE(v13) = 0;
  if ((uint64_t)a3 > 51)
  {
    if ((uint64_t)a3 <= 63)
    {
      if (a3 == 52)
      {
        v13 = objc_msgSend(&unk_1EA8E7498, "containsObject:", v14);
        v15 = 8;
        goto LABEL_28;
      }
      if (a3 == 60)
        return v13;
    }
    else
    {
      switch(a3)
      {
        case '@':
          return v13;
        case 'A':
          v13 = objc_msgSend(&unk_1EA8E74B0, "containsObject:", v14);
          v15 = 10;
          goto LABEL_28;
        case 'N':
          return v13;
      }
    }
    goto LABEL_27;
  }
  if ((uint64_t)a3 <= 6)
  {
    if (a3 == 3)
      return v13;
    if (a3 == 4)
    {
      v13 = objc_msgSend(&unk_1EA8E7480, "containsObject:", v14) ^ 1;
      v15 = 12;
      goto LABEL_28;
    }
LABEL_27:
    v15 = 0;
    v13 = 1;
    goto LABEL_28;
  }
  if (a3 - 7 >= 2)
  {
    if (a3 == 51)
    {
      objc_msgSend(v14, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet"));
      if (!v16)
      {
LABEL_4:
        LOBYTE(v13) = 0;
        return v13;
      }
      objc_msgSend(v14, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet"));
      v15 = 0;
      v13 = v17 == 0;
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  v13 = 1;
  v15 = 11;
LABEL_28:
  if (a9 && v13)
  {
    *a9 = v15;
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (BOOL)_checkEnglishGrammarInString:(id)a3 range:(_NSRange)a4 indexIntoBuffer:(unint64_t)a5 bufferLength:(unint64_t)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8 sender:(id)a9 bufIO:(_PR_BUF_IO *)a10 retval:(int *)a11 errorRange:(_NSRange *)a12 details:(id *)a13
{
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int16 v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  _PR_BUF_IO *v22;
  int *v23;
  const __CFLocale *v24;
  unint64_t v25;
  char **v26;
  uint64_t v27;
  int v28;
  char *v29;
  _PR_ERROR *var9;
  unsigned int v31;
  int v32;
  int v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  char v40;
  unint64_t v41;
  int v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  const __CFString *v57;
  int v58;
  const __CFString *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  unsigned int v63;
  int v64;
  unsigned int v65;
  uint64_t v66;
  __CFString *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  const __CFString *v73;
  uint64_t v74;
  uint64_t var6;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  char *v83;
  BOOL v84;
  uint64_t v85;
  unsigned int v86;
  CFRange v87;
  __CFStringTokenizer *v88;
  __CFStringTokenizer *v89;
  unint64_t v90;
  double v91;
  unint64_t v92;
  CFRange CurrentTokenRange;
  CFIndex location;
  CFIndex length;
  __int128 *v96;
  uint64_t v97;
  CFIndex v98;
  BOOL v99;
  uint64_t i;
  int v101;
  BOOL v102;
  unsigned __int8 *v105;
  unsigned int v106;
  int v107;
  unsigned int v108;
  int v109;
  unsigned int v110;
  unsigned int v111;
  int v112;
  unsigned int v113;
  unsigned int v114;
  int v115;
  unsigned int v116;
  unsigned int v117;
  unsigned int v118;
  int v119;
  unsigned int v120;
  unsigned int v121;
  int v122;
  unsigned int v123;
  unsigned int v124;
  int v125;
  unsigned int v126;
  unint64_t v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  BOOL v131;
  unsigned int v132;
  CFRange v133;
  unsigned int v134;
  uint64_t v135;
  unint64_t v136;
  CFIndex *v137;
  int v138;
  int v139;
  unsigned int v141;
  _BOOL4 v142;
  unsigned int v143;
  uint64_t v144;
  int v145;
  _BOOL4 v146;
  unsigned int v147;
  unsigned int v148;
  int v150;
  int v151;
  unsigned int v152;
  CFIndex v153;
  _BOOL4 v154;
  int v155;
  CFIndex v156;
  int v157;
  uint64_t v158;
  __int128 *v159;
  int v160;
  BOOL v161;
  int v162;
  unint64_t v163;
  unint64_t v164;
  char v165;
  int v166;
  int v167;
  void *v168;
  int v169;
  int v170;
  int v171;
  uint64_t v172;
  uint64_t v173;
  unsigned __int8 v174;
  int *v175;
  unint64_t v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  uint64_t v184;
  unint64_t *v185;
  int v186;
  int v187;
  uint64_t v188;
  unint64_t v189;
  uint64_t v190;
  _BOOL4 v191;
  unsigned int v192;
  uint64_t v193;
  char v194;
  uint64_t v195;
  BOOL v196;
  void *v197;
  uint64_t v198;
  char *v199;
  uint64_t v200;
  char *v201;
  uint64_t v202;
  void *v203;
  _BOOL4 v205;
  uint64_t v206;
  int v207;
  int v208;
  uint64_t v209;
  int v210;
  int v211;
  int v212;
  unint64_t v213;
  unint64_t v214;
  int v215;
  int v216;
  int v217;
  int v218;
  int v219;
  int v220;
  int v221;
  int v222;
  int v223;
  char *v224;
  int v225;
  int v226;
  char *v227;
  int v228;
  uint64_t v229;
  NSUInteger v230;
  char v232;
  unsigned __int16 v233;
  int v234;
  int *v235;
  const __CFLocale *v236;
  void *v237;
  void *v238;
  uint64_t v239;
  uint64_t v240;
  int v241;
  _PR_BUF_IO *v242;
  unint64_t v243;
  uint64_t v244;
  int v245;
  char *var0;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  char *v250;
  unint64_t v251;
  __CFString *v252;
  _BYTE v253[72];
  _QWORD v254[128];
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  uint64_t v261;
  uint64_t v262;

  v13 = MEMORY[0x1E0C80A78](self);
  v15 = v14;
  v233 = v16;
  v247 = v17;
  v248 = v18;
  v20 = v19;
  v21 = (void *)v13;
  v22 = a10;
  v23 = a11;
  v262 = *MEMORY[0x1E0C80C00];
  var0 = a10->var0;
  v238 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = CFLocaleCreate(0, CFSTR("en"));
  v25 = -[__CFString length](v20, "length");
  v26 = off_1F043D000;
  if (!_checkEnglishGrammarInString_range_indexIntoBuffer_bufferLength_languageObject_connection_sender_bufIO_retval_errorRange_details__bindictData)
  {
    v27 = objc_msgSend((id)objc_msgSend(v21, "dataBundle"), "URLForResource:withExtension:subdirectory:localization:", CFSTR("bindict3"), 0, 0, objc_msgSend(v15, "localization"));
    if (v27
      || (v27 = objc_msgSend((id)objc_msgSend(v21, "dataBundle"), "URLForResource:withExtension:subdirectory:localization:", CFSTR("bindict3"), 0, 0, objc_msgSend(v15, "fallbackLocalization"))) != 0)
    {
      _checkEnglishGrammarInString_range_indexIntoBuffer_bufferLength_languageObject_connection_sender_bufIO_retval_errorRange_details__bindictData = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v27, 8, 0);
    }
  }
  v237 = v21;
  v28 = PRbuf((uint64_t)a10, 0xEu, 0);
  *a11 = v28;
  var9 = a10->var9;
  v252 = v20;
  if (var9)
  {
    v243 = v25;
    v261 = 0;
    v249 = v247 - v248;
    v259 = 0u;
    v260 = 0u;
    v257 = 0u;
    v258 = 0u;
    v255 = 0u;
    v256 = 0u;
    while (1)
    {
      v31 = *((unsigned __int8 *)var9 + 12);
      if (v31 < 2 || !*((_WORD *)var9 + 1))
        goto LABEL_101;
      if (v31 == 52)
      {
        v32 = *((unsigned __int8 *)var9 + 13);
        if ((v32 - 101) <= 7)
        {
          v33 = 1 << (v32 - 101);
          if ((v33 & 0x11) != 0)
          {
            v49 = -[__CFString paragraphRangeForRange:](v252, "paragraphRangeForRange:", v249 + a10->var5 + *(_WORD *)var9);
            if (v49 >= v49 + v50)
              goto LABEL_101;
            v51 = v49;
            v52 = v50;
            v53 = 0;
            v54 = 0;
            do
            {
              v55 = -[__CFString characterAtIndex:](v252, "characterAtIndex:", v51);
              if (v55 == 40)
                v56 = v53 + 1;
              else
                v56 = v53;
              if (v55 == 41)
                ++v54;
              else
                v53 = v56;
              ++v51;
              --v52;
            }
            while (v52);
            if (v53 == v54)
              goto LABEL_101;
            goto LABEL_49;
          }
          if ((v33 & 0x44) != 0)
          {
            v43 = -[__CFString paragraphRangeForRange:](v252, "paragraphRangeForRange:", v249 + a10->var5 + *(_WORD *)var9);
            if (v43 >= v43 + v44)
              goto LABEL_101;
            v45 = v43;
            v46 = v44;
            v47 = 0;
            do
            {
              v48 = -[__CFString characterAtIndex:](v252, "characterAtIndex:", v45);
              if ((v48 - 8220) < 4 || v48 == 34)
                ++v47;
              ++v45;
              --v46;
            }
            while (v46);
            if ((v47 & 1) == 0)
              goto LABEL_101;
            goto LABEL_49;
          }
          if ((v33 & 0x88) != 0)
          {
            v34 = -[__CFString paragraphRangeForRange:](v252, "paragraphRangeForRange:", v249 + a10->var5 + *(_WORD *)var9);
            v36 = v35;
            v37 = objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
            v38 = v34 + v36;
            if (v34 >= v34 + v36)
              goto LABEL_101;
            v39 = (void *)v37;
            v40 = 0;
            v41 = v34;
            do
            {
              v42 = -[__CFString characterAtIndex:](v252, "characterAtIndex:", v41);
              if (((v42 - 8216) < 4 || v42 == 96 || v42 == 39)
                && (v41 <= v34
                 || v41 + 1 >= v38
                 || !objc_msgSend(v39, "characterIsMember:", -[__CFString characterAtIndex:](v252, "characterAtIndex:", v41 - 1))|| (objc_msgSend(v39, "characterIsMember:", -[__CFString characterAtIndex:](v252, "characterAtIndex:", v41 + 1)) & 1) == 0))
              {
                ++v40;
              }
              ++v41;
              --v36;
            }
            while (v36);
            if ((v40 & 1) == 0)
              goto LABEL_101;
            goto LABEL_49;
          }
        }
        if (v32 == 74)
          goto LABEL_101;
      }
LABEL_49:
      v255 = 0u;
      v256 = 0u;
      v261 = 0;
      v259 = 0u;
      v260 = 0u;
      v257 = 0u;
      v258 = 0u;
      LOWORD(v255) = *(_WORD *)&a8->var0;
      *((_QWORD *)&v255 + 1) = var9;
      LOBYTE(v256) = 16;
      LOBYTE(v260) = a8->var6;
      LOWORD(v261) = a8->var7;
      if (!PRerr((unsigned __int8 *)&v255, 16, 1))
      {
        if (*((_QWORD *)&v256 + 1))
        {
          v57 = (id)CFStringCreateWithCString(0, *((const char **)&v256 + 1), 0x500u);
          if (v57)
          {
            v58 = *((unsigned __int8 *)var9 + 12);
            if ((v58 - 3) <= 0x60)
            {
              v59 = v57;
              v60 = *(_WORD *)var9;
              v61 = *((unsigned __int16 *)var9 + 1);
              if (*((unsigned __int8 *)var9 + 12) > 0x33u)
              {
                if (*((unsigned __int8 *)var9 + 12) > 0x41u)
                {
                  if (v58 != 66 && (v58 != 78 || *((_BYTE *)var9 + 13) != 24))
                    goto LABEL_84;
                }
                else if (v58 == 52)
                {
                  v64 = *((unsigned __int8 *)var9 + 13);
                  if ((v64 - 18) > 0x3D
                    || ((1 << (v64 - 18)) & 0x2780000040000001) == 0)
                  {
                    v65 = v64 - 81;
                    if (v65 > 0x22 || ((1 << v65) & 0x400000043) == 0)
                    {
LABEL_84:
                      v66 = *((_QWORD *)var9 + 3);
                      if (v66)
                      {
                        v67 = v252;
                        if (*(_QWORD *)(v66 + 8) && *(_QWORD *)v66)
                        {
                          v240 = *((unsigned __int16 *)var9 + 1);
                          v68 = *(_WORD *)var9;
                          v69 = *(unsigned __int16 *)(v66 + 18);
                          v70 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                          if (v69)
                          {
                            v71 = 0;
                            v72 = 2 * v69;
                            do
                            {
                              v73 = (id)CFStringCreateWithCString(0, (const char *)(*(_QWORD *)v66+ *(__int16 *)(*(_QWORD *)(v66 + 8) + v71)), 0x500u);
                              if (v73)
                                objc_msgSend(v70, "addObject:", v73);
                              v71 += 2;
                            }
                            while (v72 != v71);
                          }
                          v60 = v68;
                          v67 = v252;
                          v61 = v240;
                        }
                        else
                        {
                          v70 = 0;
                        }
                      }
                      else
                      {
                        v70 = 0;
                        v67 = v252;
                      }
                      v74 = v249 + a10->var5;
                      var6 = a10->var6;
                      v254[0] = 0;
                      v76 = v60;
                      v77 = v61;
                      if (objc_msgSend(v237, "_acceptErrorWithRuleType:ruleNumber:grammarRange:sentenceRange:inString:corrections:issueType:", *((unsigned __int8 *)var9 + 12), *((unsigned __int8 *)var9 + 13), v67, v70, v254))
                      {
                        if (*((_BYTE *)var9 + 12) == 4)
                        {
                          v70 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                          v78 = v237;
                          v79 = objc_msgSend(v237, "_modifiedGrammarRangeForDoubledWordRange:sentenceRange:inString:corrections:", v76, v77, v74, var6, v252, v70);
                          v81 = v80;
                        }
                        else
                        {
                          v78 = v237;
                          v79 = v76;
                          v81 = v77;
                        }
                        objc_msgSend(v238, "addObject:", objc_msgSend(v78, "_detailWithRange:description:corrections:issueType:", v79, v81, v59, v70, v254[0]));
                      }
                    }
                  }
                }
                else
                {
                  if (v58 != 65)
                    goto LABEL_84;
                  v62 = *((unsigned __int8 *)var9 + 13);
                  if (v62 != 2 && v62 != 19)
                    goto LABEL_84;
                }
              }
              else if (*((unsigned __int8 *)var9 + 12) > 6u)
              {
                if (v58 == 7)
                {
                  if (*((_BYTE *)var9 + 13) != 3)
                    goto LABEL_84;
                }
                else
                {
                  if (v58 != 51)
                    goto LABEL_84;
                  v63 = *((unsigned __int8 *)var9 + 13);
                  if ((v63 > 0x3E || ((1 << v63) & 0x40183C0000001800) == 0)
                    && (v63 - 132 > 0x3B || ((1 << (v63 + 124)) & 0x800000200344001) == 0)
                    && v63 != 122)
                  {
                    goto LABEL_84;
                  }
                }
              }
              else if (v58 == 3)
              {
                if (*((_BYTE *)var9 + 13) != 1)
                  goto LABEL_84;
              }
              else if (v58 != 6)
              {
                goto LABEL_84;
              }
            }
          }
        }
      }
      PRerr((unsigned __int8 *)&v255, 17, 0);
LABEL_101:
      var9 = (_PR_ERROR *)*((_QWORD *)var9 + 5);
      if (!var9)
      {
        v23 = a11;
        v82 = *a11;
        v22 = a10;
        v25 = v243;
        v20 = v252;
        v26 = off_1F043D000;
        goto LABEL_104;
      }
    }
  }
  v82 = v28;
LABEL_104:
  v83 = v26[441];
  v84 = v82 == 200 || v83 == 0;
  if (v84 || v247 + (unint64_t)v22->var5 >= v25 + v248)
    goto LABEL_566;
  v235 = v23;
  v85 = objc_msgSend(v83, "bytes");
  v86 = objc_msgSend(v26[441], "length");
  v87.location = v247 - v248 + v22->var5;
  if (v87.location + (unint64_t)v22->var6 <= v25)
    v87.length = v22->var6;
  else
    v87.length = v25 - v87.location;
  v88 = CFStringTokenizerCreate(0, v20, v87, 0, v24);
  v89 = v88;
  v90 = 0;
  v242 = v22;
  v236 = v24;
  if (!v85 || v86 < 8 || !v88)
    goto LABEL_244;
  v90 = 0;
  if (!CFStringTokenizerAdvanceToNextToken(v88))
  {
LABEL_245:
    CFRelease(v89);
    goto LABEL_246;
  }
  v91 = (double)(v86 >> 3);
  v92 = (v86 >> 3) - 1;
  v250 = &var0[v248 - v247];
  do
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v89);
    if ((unint64_t)(CurrentTokenRange.length - 1) > 0x47)
      continue;
    location = CurrentTokenRange.location;
    length = CurrentTokenRange.length;
    if (v90
      && (v96 = &v255 + v90, v97 = *((_QWORD *)v96 - 2), CurrentTokenRange.location == v97 + *((_QWORD *)v96 - 1) + 1)
      && (v98 = CurrentTokenRange.location + CurrentTokenRange.length,
          CurrentTokenRange.location + CurrentTokenRange.length <= (unint64_t)(v97 + 72)))
    {
      v155 = var0[~v247 + v248 + CurrentTokenRange.location];
      if (v155 == 39 || v155 == 46)
      {
        v99 = 0;
        length = v98 - v97;
        v244 = -1;
        location = v97;
      }
      else
      {
        v156 = v98 - v97;
        v99 = v155 == 45;
        v244 = 0;
        if (v155 == 45)
        {
          location = v97;
          length = v156;
        }
      }
    }
    else
    {
      v99 = 0;
      v244 = 0;
    }
    while (2)
    {
      if (!length)
        goto LABEL_145;
      for (i = 0; i != length; ++i)
      {
        v101 = v250[location + i];
        v102 = (v101 - 65) >= 0x1A && (v101 - 192) >= 0x17;
        if (!v102)
        {
          if ((v101 - 138) > 0x15 || ((1 << (v101 + 118)) & 0x200015) == 0)
          {
LABEL_135:
            LOBYTE(v101) = v101 + 32;
            goto LABEL_143;
          }
LABEL_140:
          if (v101 == 159)
            LOBYTE(v101) = -1;
          else
            LOBYTE(v101) = v101 + 16;
          goto LABEL_143;
        }
        if ((v101 - 216) < 7)
          goto LABEL_135;
        if ((v101 - 138) <= 0x15 && ((1 << (v101 + 118)) & 0x200015) != 0)
          goto LABEL_140;
LABEL_143:
        v253[i] = v101;
      }
      if ((unint64_t)length <= 0x47)
LABEL_145:
        memset(&v253[length], length, 72 - length);
      v105 = v253;
      if (length < 0xC)
      {
        v109 = -1640531527;
        v108 = -1640531527;
        v107 = -1640531527;
        v106 = length;
      }
      else
      {
        v106 = length;
        v107 = -1640531527;
        v108 = -1640531527;
        v109 = -1640531527;
        do
        {
          v110 = *((_DWORD *)v105 + 1) + v108;
          v111 = *((_DWORD *)v105 + 2) + v107;
          v112 = (*(_DWORD *)v105 + v109 - (v110 + v111)) ^ (v111 >> 13);
          v113 = (v110 - v111 - v112) ^ (v112 << 8);
          v114 = (v111 - v112 - v113) ^ (v113 >> 13);
          v115 = (v112 - v113 - v114) ^ (v114 >> 12);
          v116 = (v113 - v114 - v115) ^ (v115 << 16);
          v117 = (v114 - v115 - v116) ^ (v116 >> 5);
          v109 = (v115 - v116 - v117) ^ (v117 >> 3);
          v108 = (v116 - v117 - v109) ^ (v109 << 10);
          v107 = (v117 - v109 - v108) ^ (v108 >> 15);
          v105 += 12;
          v106 -= 12;
        }
        while (v106 > 0xB);
      }
      v118 = v107 + length;
      switch(v106)
      {
        case 1u:
          goto LABEL_162;
        case 2u:
          goto LABEL_161;
        case 3u:
          goto LABEL_160;
        case 4u:
          goto LABEL_159;
        case 5u:
          goto LABEL_158;
        case 6u:
          goto LABEL_157;
        case 7u:
          goto LABEL_156;
        case 8u:
          goto LABEL_155;
        case 9u:
          goto LABEL_154;
        case 0xAu:
          goto LABEL_153;
        case 0xBu:
          v118 += v105[10] << 24;
LABEL_153:
          v118 += v105[9] << 16;
LABEL_154:
          v118 += v105[8] << 8;
LABEL_155:
          v108 += v105[7] << 24;
LABEL_156:
          v108 += v105[6] << 16;
LABEL_157:
          v108 += v105[5] << 8;
LABEL_158:
          v108 += v105[4];
LABEL_159:
          v109 += v105[3] << 24;
LABEL_160:
          v109 += v105[2] << 16;
LABEL_161:
          v109 += v105[1] << 8;
LABEL_162:
          v109 += *v105;
          break;
        default:
          break;
      }
      v119 = (v109 - v108 - v118) ^ (v118 >> 13);
      v120 = (v108 - v118 - v119) ^ (v119 << 8);
      v121 = (v118 - v119 - v120) ^ (v120 >> 13);
      v122 = (v119 - v120 - v121) ^ (v121 >> 12);
      v123 = (v120 - v121 - v122) ^ (v122 << 16);
      v124 = (v121 - v122 - v123) ^ (v123 >> 5);
      v125 = (v122 - v123 - v124) ^ (v124 >> 3);
      v126 = (v124 - v125 - ((v123 - v124 - v125) ^ (v125 << 10))) ^ (((v123 - v124 - v125) ^ (v125 << 10)) >> 15);
      v127 = ((double)(v126 - 1) / 4294967300.0 * v91);
      v128 = 2 * v127;
      if (bswap32(*(_DWORD *)(v85 + 4 * (2 * v127))) <= v126)
      {
        do
        {
          v129 = bswap32(*(_DWORD *)(v85 + 4 * v128));
          v131 = v129 >= v126 || v127++ >= v92;
          v128 += 2;
        }
        while (!v131);
        v130 = v128 - 2;
      }
      else
      {
        do
        {
          v129 = bswap32(*(_DWORD *)(v85 + 4 * v128));
          v128 -= 2;
          v102 = v127-- != 0;
        }
        while (v102 && v129 > v126);
        v130 = v128 + 2;
      }
      if (v129 != v126)
      {
        if (v99)
        {
LABEL_179:
          v133 = CFStringTokenizerGetCurrentTokenRange(v89);
          location = v133.location;
          length = v133.length;
          v99 = 0;
          continue;
        }
        v134 = 0;
        goto LABEL_182;
      }
      break;
    }
    v132 = *(_DWORD *)(v85 + 4 * (v130 | 1));
    if (!v99)
    {
      v134 = bswap32(v132);
LABEL_182:
      v135 = v244;
      goto LABEL_183;
    }
    if (!v132)
      goto LABEL_179;
    v134 = bswap32(v132);
    v135 = -1;
LABEL_183:
    v136 = v90 + v135;
    v137 = (CFIndex *)(&v255 + v90 + v135);
    *v137 = location;
    v137[1] = length;
    *((_DWORD *)v254 + v136) = v134;
    v138 = var0[location - v247 + v248];
    v139 = 1;
    if ((v138 - 65) >= 0x1A && (v138 - 192) >= 0x17 && (v138 - 216) >= 7)
    {
      v141 = v138 - 138;
      if (v141 > 0x15 || ((1 << v141) & 0x200015) == 0)
        v139 = 0;
    }
    v142 = length >= 2 && v253[length - 1] == 115 && v253[length - 2] != 39;
    v143 = v134;
    if (v134 || (v143 = 0, length < 1))
    {
LABEL_212:
      if (!v139)
        goto LABEL_225;
LABEL_213:
      if (v136)
      {
        if (v142)
          v150 = 10;
        else
          v150 = 2;
        if ((v143 & 0xA) != 0)
          v150 = 0;
        v143 = v143 & 0xFFF87FFF | v150;
        *((_DWORD *)v254 + v136) = v143;
      }
      if (v143)
        goto LABEL_234;
      if (v142)
        v151 = 14;
      else
        v151 = 3;
LABEL_233:
      *((_DWORD *)v254 + v136) = v151;
      goto LABEL_234;
    }
    v144 = 0;
    while (2)
    {
      v145 = v250[location + v144];
      if ((v145 - 33) < 0x20
        || (v145 - 91) < 0x24 && ((0xF0000003FuLL >> (v145 - 91)) & 1) != 0)
      {
        v146 = 1;
        goto LABEL_209;
      }
      v147 = v145 - 161;
      v148 = v145 & 0xFFFFFFDF;
      v146 = v147 < 0x1F || v148 == 215;
      if (v146)
      {
LABEL_209:
        if (++v144 >= (unint64_t)length)
          break;
        continue;
      }
      break;
    }
    if (v146)
    {
      v143 = 0x2000;
      *((_DWORD *)v254 + v136) = 0x2000;
      goto LABEL_212;
    }
    v143 = 0;
    if (v139)
      goto LABEL_213;
LABEL_225:
    v152 = v143 & 0xFFFFFFF5;
    if (!v134 || v152)
    {
      *((_DWORD *)v254 + v136) = v152;
      if (v152)
        goto LABEL_234;
LABEL_230:
      if (v142)
        v151 = 4;
      else
        v151 = 1;
      goto LABEL_233;
    }
    v153 = location;
    v154 = v142;
    objc_msgSend((id)-[__CFString substringWithRange:](v252, "substringWithRange:", v153, length), "capitalizedString");
    v142 = v154;
    if (!v143)
      goto LABEL_230;
LABEL_234:
    v90 = v136 + 1;
  }
  while (CFStringTokenizerAdvanceToNextToken(v89) && v90 < 0x100);
LABEL_244:
  if (v89)
    goto LABEL_245;
LABEL_246:
  v29 = var0;
  v251 = v90;
  if (v90)
  {
    LOBYTE(v157) = 0;
    v158 = 0;
    v159 = &v255;
    while (2)
    {
      if ((v157 & 1) != 0 && v158)
      {
        if (*(_QWORD *)v159 > (unint64_t)(*((_QWORD *)v159 - 2) + *((_QWORD *)v159 - 1) + 1))
          goto LABEL_262;
      }
      else if ((v157 & 1) == 0)
      {
        goto LABEL_262;
      }
      v160 = *((_DWORD *)v254 + v158);
      if (v160)
        v161 = (v160 & 0xFFF82BFF) == 0;
      else
        v161 = 0;
      if (v161)
      {
        objc_msgSend(v238, "addObject:", objc_msgSend(v237, "_detailWithRange:description:corrections:", *(_QWORD *)v159 + v248 - (v247 + v242->var5), *((_QWORD *)v159 + 1), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The word '%@' may not agree with the rest of the sentence."), -[__CFString substringWithRange:](v252, "substringWithRange:")), 0));
        v29 = var0;
      }
      else
      {
        if ((v160 & 0x182070) != 0)
          v162 = *((_DWORD *)v254 + v158) | ((*((_DWORD *)v254 + v158) & 5) == 0) | 4;
        else
          v162 = *((_DWORD *)v254 + v158) | ((*((_DWORD *)v254 + v158) & 5) == 0);
        *((_DWORD *)v254 + v158) = v162 & 0x18207F;
      }
LABEL_262:
      v157 = (*((_DWORD *)v254 + v158++) >> 10) & 1;
      ++v159;
      if (v90 != v158)
        continue;
      break;
    }
    v163 = v248 - v247 + *((_QWORD *)&v255 + 2 * v90 - 2) + *((_QWORD *)&v255 + 2 * v90 - 1);
    v164 = v242->var6 + (unint64_t)v242->var5;
    if (v163 >= v164)
    {
      LOBYTE(v167) = 0;
      LOBYTE(v166) = 0;
      v165 = 0;
      v168 = v237;
    }
    else
    {
      v165 = 0;
      v166 = 0;
      v167 = 0;
      v168 = v237;
      do
      {
        v169 = v29[v163];
        if (v169 == 63)
          v170 = 1;
        else
          v170 = v166;
        if (v169 == 46)
          v171 = 1;
        else
          v171 = v167;
        if (v169 == 46)
          v170 = v166;
        if (v169 == 33)
        {
          v165 = 1;
        }
        else
        {
          v167 = v171;
          v166 = v170;
        }
        ++v163;
      }
      while (v163 < v164);
    }
    v172 = 0;
    v173 = 0;
    v174 = ((v167 & 1) == 0) | v166;
    do
    {
      if ((*((_DWORD *)v254 + v173) & 0x7C000) != 0)
        ++v172;
      ++v173;
    }
    while (v90 != v173);
    if (v172 == 1)
    {
      if (!(v174 & 1 | ((v254[0] & 0x40000000) == 0)))
        goto LABEL_293;
      v175 = (int *)v254;
      v176 = v90;
      do
      {
        v177 = *v175;
        if ((*v175 & 0x7C000) != 0)
          v177 = *v175 & 0x7C000;
        *v175++ = v177;
        --v176;
      }
      while (v176);
    }
    else if (!v172 && ((v174 | v165) & 1) == 0)
    {
LABEL_293:
      objc_msgSend(v238, "addObject:", objc_msgSend(v168, "_detailWithRange:description:corrections:", 0, v242->var6, CFSTR("This may be a sentence fragment."), 0));
      v29 = var0;
    }
    v178 = 0;
    v232 = 0;
    v179 = 0;
    LOBYTE(v180) = 0;
    v181 = 0;
    v241 = 0;
    v234 = 0;
    v239 = 0;
    v245 = 0;
    v182 = 0;
    v183 = 0;
    v184 = 0;
    v185 = (unint64_t *)&v255 + 1;
    v186 = 1;
    while (2)
    {
      if (v184)
      {
        v187 = v181;
        v188 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet", v29), "invertedSet");
        v189 = *(v185 - 2) + *(v185 - 3);
        -[__CFString rangeOfCharacterFromSet:options:range:](v252, "rangeOfCharacterFromSet:options:range:", v188, 0, v189, *(v185 - 1) - v189);
        v191 = v190 == 0;
        if ((v180 & v191) != 0)
        {
          v29 = var0;
          v181 = v187;
          break;
        }
        v178 &= v191;
        v179 &= v191;
        v181 = v187 & v191;
        v29 = var0;
      }
      else if ((v180 & 1) != 0)
      {
        break;
      }
      v192 = *((_DWORD *)v254 + v184);
      if ((v192 & 0x8000) != 0 && *v185 == 2)
      {
        v193 = *(v185 - 1) - v247 + v248;
        if (v29[v193] == 97 && v29[v193 + 1] == 109)
        {
          if (((v178 | v179 | v181) & 1) != 0)
          {
            v194 = v183 | v182;
            goto LABEL_385;
          }
          if ((v239 & 1) == 0)
          {
            v194 = v183 | v182;
            if (((v183 | v182) & 1) != 0)
            {
LABEL_385:
              v196 = (v194 & 1) == 0;
              v197 = &unk_1EA8E74C8;
              goto LABEL_386;
            }
          }
LABEL_361:
          v181 = v192 == 0x10000;
          if ((v192 & 0x800) == 0 || *v185 != 2)
            goto LABEL_391;
          v206 = *(v185 - 1) - v247 + v248;
          v207 = v29[v206];
          if ((v207 - 65) < 0x1A || (v207 - 192) < 0x17)
          {
            if ((v207 - 138) > 0x15 || ((1 << (v207 + 118)) & 0x200015) == 0)
            {
LABEL_366:
              v207 += 32;
              goto LABEL_367;
            }
            goto LABEL_391;
          }
          if ((v207 - 216) < 7)
            goto LABEL_366;
          if ((v207 - 138) <= 0x15 && ((1 << (v207 + 118)) & 0x200015) != 0)
            goto LABEL_391;
LABEL_367:
          if (v207 != 116)
            goto LABEL_391;
          v208 = v29[v206 + 1];
          if ((v208 - 65) < 0x1A || (v208 - 192) < 0x17)
          {
            if ((v208 - 138) <= 0x15 && ((1 << (v208 + 118)) & 0x200015) != 0)
              goto LABEL_391;
LABEL_371:
            v208 += 32;
          }
          else
          {
            if ((v208 - 216) < 7)
              goto LABEL_371;
            if ((v208 - 138) <= 0x15 && ((1 << (v208 + 118)) & 0x200015) != 0)
            {
LABEL_391:
              v179 = 0;
              goto LABEL_392;
            }
          }
          if (v208 != 111)
            goto LABEL_391;
          v234 = 1;
          v179 = 1;
LABEL_392:
          if ((v192 & 0x68000) == 0)
            goto LABEL_422;
          v209 = *(v185 - 1) - v247 + v248;
          v210 = v29[v209];
          if ((v210 - 65) < 0x1A || (v210 - 192) < 0x17)
          {
            if ((v210 - 138) > 0x15 || ((1 << (v210 + 118)) & 0x200015) == 0)
            {
LABEL_396:
              v210 += 32;
              goto LABEL_397;
            }
            goto LABEL_422;
          }
          if ((v210 - 216) < 7)
            goto LABEL_396;
          if ((v210 - 138) <= 0x15 && ((1 << (v210 + 118)) & 0x200015) != 0)
            goto LABEL_422;
LABEL_397:
          if (v210 != 104)
            goto LABEL_422;
          v211 = v29[v209 + 1];
          if ((v211 - 65) < 0x1A || (v211 - 192) < 0x17)
          {
            if ((v211 - 138) <= 0x15 && ((1 << (v211 + 118)) & 0x200015) != 0)
              goto LABEL_422;
LABEL_401:
            v211 += 32;
          }
          else
          {
            if ((v211 - 216) < 7)
              goto LABEL_401;
            if ((v211 - 138) <= 0x15 && ((1 << (v211 + 118)) & 0x200015) != 0)
            {
LABEL_422:
              v213 = *v185;
              if (*v185 < 3)
                goto LABEL_497;
              v214 = v248 - v247 + v213 + *(v185 - 1);
              v215 = v29[v214 - 2];
              if (v215 != 39)
                goto LABEL_437;
              v216 = v29[v214 - 1];
              if ((v216 - 65) < 0x1A || (v216 - 192) < 0x17)
              {
                if ((v216 - 138) <= 0x15 && ((1 << (v216 + 118)) & 0x200015) != 0)
                  goto LABEL_437;
                if (v216 == 83)
                  goto LABEL_436;
              }
              else if ((v216 - 216) >= 7)
              {
                if ((v216 - 115) > 0x2C)
                  goto LABEL_435;
                if (((1 << (v216 - 115)) & 0x10000A800000) == 0)
                {
                  if (v216 == 115)
                    goto LABEL_436;
LABEL_435:
                  if (v216 == 100)
                  {
LABEL_436:
                    v232 = 1;
                    v178 = 1;
                    goto LABEL_498;
                  }
                }
LABEL_437:
                if (v213 < 4 || v29[v214 - 3] != 39)
                  goto LABEL_497;
                if ((v215 - 65) >= 0x1A && (v215 - 192) >= 0x17)
                {
                  if ((v215 - 216) < 7)
                    goto LABEL_442;
                  if ((v215 - 138) <= 0x15 && ((1 << (v215 + 118)) & 0x200015) != 0)
                    goto LABEL_497;
LABEL_443:
                  if (v215 != 118)
                    goto LABEL_497;
                  v217 = v29[v214 - 1];
                  if ((v217 - 65) < 0x1A || (v217 - 192) < 0x17)
                  {
                    if ((v217 - 138) <= 0x15 && ((1 << (v217 + 118)) & 0x200015) != 0)
                      goto LABEL_497;
LABEL_447:
                    v217 += 32;
                  }
                  else
                  {
                    if ((v217 - 216) < 7)
                      goto LABEL_447;
                    if ((v217 - 138) <= 0x15 && ((1 << (v217 + 118)) & 0x200015) != 0)
                    {
LABEL_497:
                      v178 = 0;
LABEL_498:
                      v183 |= (v192 & 0x44083003) != 0;
                      v182 |= (v192 & 0x7280300C) != 0;
                      v245 |= (v192 & 0x72A0300C) != 0;
                      LODWORD(v239) = v239 | ((v192 & 0x200000) >> 21);
                      HIDWORD(v239) |= (v192 & 0x10000) >> 16;
                      v180 = (v192 >> 13) & 1;
                      v241 |= (unsigned __int16)(v192 & 0x800) >> 11;
                      v186 = ((v192 & 0x7C000) == 0) & v186;
                      ++v184;
                      v185 += 2;
                      if (v251 == v184)
                        goto LABEL_565;
                      continue;
                    }
                  }
                  if (v217 == 101)
                    goto LABEL_436;
                  goto LABEL_497;
                }
                if ((v215 - 138) > 0x15 || ((1 << (v215 + 118)) & 0x200015) == 0)
                {
LABEL_442:
                  v215 += 32;
                  goto LABEL_443;
                }
                goto LABEL_497;
              }
              v216 += 32;
              goto LABEL_435;
            }
          }
          if (v211 != 97)
            goto LABEL_422;
          switch(*v185)
          {
            case 3uLL:
              v212 = v29[v209 + 2];
              if ((v212 - 65) < 0x1A || (v212 - 192) < 0x17)
              {
                if ((v212 - 138) <= 0x15 && ((1 << (v212 + 118)) & 0x200015) != 0)
                  goto LABEL_422;
                if (v212 == 83)
                  goto LABEL_436;
LABEL_503:
                v212 += 32;
                goto LABEL_504;
              }
              if ((v212 - 216) < 7)
                goto LABEL_503;
              if ((v212 - 115) <= 0x2C)
              {
                if (((1 << (v212 - 115)) & 0x10000A800000) != 0)
                  goto LABEL_422;
                if (v212 == 115)
                  goto LABEL_436;
              }
LABEL_504:
              if (v212 != 100)
                goto LABEL_422;
              goto LABEL_436;
            case 4uLL:
              v218 = v29[v209 + 2];
              if ((v218 - 65) < 0x1A || (v218 - 192) < 0x17)
              {
                if ((v218 - 138) <= 0x15 && ((1 << (v218 + 118)) & 0x200015) != 0)
                  goto LABEL_422;
LABEL_462:
                v218 += 32;
                goto LABEL_463;
              }
              if ((v218 - 216) < 7)
                goto LABEL_462;
              if ((v218 - 138) <= 0x15 && ((1 << (v218 + 118)) & 0x200015) != 0)
                goto LABEL_422;
LABEL_463:
              if (v218 != 118)
                goto LABEL_422;
              v219 = v29[v209 + 3];
              if ((v219 - 65) < 0x1A || (v219 - 192) < 0x17)
              {
                if ((v219 - 138) <= 0x15 && ((1 << (v219 + 118)) & 0x200015) != 0)
                  goto LABEL_422;
LABEL_467:
                v219 += 32;
                goto LABEL_468;
              }
              if ((v219 - 216) < 7)
                goto LABEL_467;
              if ((v219 - 138) <= 0x15 && ((1 << (v219 + 118)) & 0x200015) != 0)
                goto LABEL_422;
LABEL_468:
              if (v219 != 101)
                goto LABEL_422;
              goto LABEL_436;
            case 6uLL:
              v220 = v29[v209 + 2];
              if ((v220 - 65) >= 0x1A && (v220 - 192) >= 0x17)
              {
                if ((v220 - 216) < 7)
                {
LABEL_512:
                  v220 += 32;
                }
                else if ((v220 - 115) <= 0x2C)
                {
                  if (((1 << (v220 - 115)) & 0x10000A800000) != 0)
                    goto LABEL_422;
                  if (v220 == 115)
                    goto LABEL_514;
                }
                if (v220 != 100)
                  goto LABEL_422;
                goto LABEL_514;
              }
              if ((v220 - 138) <= 0x15 && ((1 << (v220 + 118)) & 0x200015) != 0)
                goto LABEL_422;
              if (v220 != 83)
                goto LABEL_512;
LABEL_514:
              v226 = v29[v209 + 3];
              if ((v226 - 65) < 0x1A || (v226 - 192) < 0x17)
              {
                if ((v226 - 138) <= 0x15 && ((1 << (v226 + 118)) & 0x200015) != 0)
                  goto LABEL_422;
              }
              else if ((v226 - 216) >= 7)
              {
                if ((v226 - 138) <= 0x15 && ((1 << (v226 + 118)) & 0x200015) != 0)
                  goto LABEL_422;
LABEL_518:
                if (v226 != 110)
                  goto LABEL_422;
                v227 = &v29[v209];
                if (v227[4] != 39)
                  goto LABEL_422;
                v228 = v227[5];
                if ((v228 - 65) < 0x1A || (v228 - 192) < 0x17)
                {
                  if ((v228 - 138) <= 0x15 && ((1 << (v228 + 118)) & 0x200015) != 0)
                    goto LABEL_422;
                }
                else if ((v228 - 216) >= 7)
                {
                  if ((v228 - 138) <= 0x15 && ((1 << (v228 + 118)) & 0x200015) != 0)
                    goto LABEL_422;
                  goto LABEL_524;
                }
                v228 += 32;
LABEL_524:
                if (v228 != 116)
                  goto LABEL_422;
                goto LABEL_436;
              }
              v226 += 32;
              goto LABEL_518;
            case 7uLL:
              v221 = v29[v209 + 2];
              if ((v221 - 65) < 0x1A || (v221 - 192) < 0x17)
              {
                if ((v221 - 138) <= 0x15 && ((1 << (v221 + 118)) & 0x200015) != 0)
                  goto LABEL_422;
LABEL_480:
                v221 += 32;
                goto LABEL_481;
              }
              if ((v221 - 216) < 7)
                goto LABEL_480;
              if ((v221 - 138) <= 0x15 && ((1 << (v221 + 118)) & 0x200015) != 0)
                goto LABEL_422;
LABEL_481:
              if (v221 != 118)
                goto LABEL_422;
              v222 = v29[v209 + 3];
              if ((v222 - 65) < 0x1A || (v222 - 192) < 0x17)
              {
                if ((v222 - 138) <= 0x15 && ((1 << (v222 + 118)) & 0x200015) != 0)
                  goto LABEL_422;
LABEL_485:
                v222 += 32;
                goto LABEL_486;
              }
              if ((v222 - 216) < 7)
                goto LABEL_485;
              if ((v222 - 138) <= 0x15 && ((1 << (v222 + 118)) & 0x200015) != 0)
                goto LABEL_422;
LABEL_486:
              if (v222 != 101)
                goto LABEL_422;
              v223 = v29[v209 + 4];
              if ((v223 - 65) < 0x1A || (v223 - 192) < 0x17)
              {
                if ((v223 - 138) <= 0x15 && ((1 << (v223 + 118)) & 0x200015) != 0)
                  goto LABEL_422;
LABEL_490:
                v223 += 32;
                goto LABEL_491;
              }
              if ((v223 - 216) < 7)
                goto LABEL_490;
              if ((v223 - 138) <= 0x15 && ((1 << (v223 + 118)) & 0x200015) != 0)
                goto LABEL_422;
LABEL_491:
              if (v223 != 110)
                goto LABEL_422;
              v224 = &v29[v209];
              if (v224[5] != 39)
                goto LABEL_422;
              v225 = toLower(v224[6]);
              v181 = v192 == 0x10000;
              v29 = var0;
              if (v225 != 116)
                goto LABEL_422;
              goto LABEL_436;
            default:
              goto LABEL_422;
          }
        }
      }
      break;
    }
    v192 = *((_DWORD *)v254 + v184);
    if ((v192 & 0x20000) != 0 && *v185 == 2)
    {
      v195 = *(v185 - 1) - v247 + v248;
      if (v29[v195] == 105 && v29[v195 + 1] == 115)
      {
        if (((v178 | v179 | v181) & 1) == 0 && ((v245 & ~v183 & 1) == 0 || ((v234 ^ 1 | v186) & 1) == 0))
          goto LABEL_361;
        v196 = (v245 & 1) == 0;
        v197 = &unk_1EA8E74E0;
LABEL_386:
        if (v196)
          v203 = 0;
        else
          v203 = v197;
LABEL_360:
        objc_msgSend(v238, "addObject:", objc_msgSend(v237, "_detailWithRange:description:corrections:", *(v185 - 1) + v248 - (v247 + v242->var5), *v185, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The word '%@' may not agree with the rest of the sentence."), -[__CFString substringWithRange:](v252, "substringWithRange:")), v203));
        v29 = var0;
        goto LABEL_361;
      }
    }
    if ((v192 & 0x8000) != 0
      && *v185 == 3
      && (v198 = *(v185 - 1) - v247 + v248, v29[v198] == 97)
      && (v199 = &v29[v198], v199[1] == 114)
      && v199[2] == 101)
    {
      if (((v178 | v179 | v181) & 1) == 0 && v182 & 1 | (((v183 | v239) & 1) == 0))
        goto LABEL_361;
    }
    else if ((v192 & 0x40000) != 0
           && *v185 == 3
           && (v200 = *(v185 - 1) - v247 + v248, v29[v200] == 119)
           && (v201 = &v29[v200], v201[1] == 97)
           && v201[2] == 115)
    {
      if (((v178 | v179 | v181) & 1) == 0 && (((v239 | v183) & 1) != 0 || ((v182 ^ 1) & 1) != 0))
        goto LABEL_361;
    }
    else if ((v192 & 0x100000) != 0
           && *v185 == 4
           && (v202 = *(v185 - 1) - v247 + v248, v29[v202] == 98)
           && v29[v202 + 1] == 101
           && v29[v202 + 2] == 101
           && v29[v202 + 3] == 110)
    {
      if ((v232 & 1) != 0)
        goto LABEL_361;
    }
    else
    {
      switch(v192)
      {
        case 0x40000u:
          if (((v178 | v179 | v181) & 1) == 0)
            goto LABEL_361;
          break;
        case 0x20000u:
          if (((v178 | v179 | v181) & 1) != 0)
          {
            v203 = 0;
            v192 = 0x20000;
            goto LABEL_360;
          }
          v192 = 0x20000;
          if ((v245 & ~v183 & 1) == 0 || ((v234 ^ 1 | v186) & 1) == 0)
            goto LABEL_361;
          break;
        case 0x8000u:
          if (v245 & 1 | ((v186 & v183 & 1) == 0) | (BYTE4(v239) | v234) & 1)
            goto LABEL_361;
          break;
        default:
          v205 = (v192 & 0xFEBFFFFF) == 0 && v192 != 0;
          if (v241 & 1 | ((v205 & v186 & 1) == 0))
            goto LABEL_361;
          break;
      }
    }
    v203 = 0;
    goto LABEL_360;
  }
LABEL_565:
  v22 = v242;
  v23 = v235;
  v24 = v236;
LABEL_566:
  v229 = objc_msgSend(v238, "count", v29);
  if (!v229)
  {
    if (*v23 != 200)
    {
      if (!v22->var6)
      {
        v22->var5 = v233;
        if (!v24)
          return v229 != 0;
        goto LABEL_576;
      }
      v22->var5 += v22->var6;
    }
    goto LABEL_575;
  }
  if (a13)
    *a13 = v238;
  if (!a12)
  {
LABEL_575:
    if (v24)
      goto LABEL_576;
    return v229 != 0;
  }
  v230 = v22->var6;
  a12->location = v247 - v248 + v22->var5;
  a12->length = v230;
  if (!v24)
    return v229 != 0;
LABEL_576:
  CFRelease(v24);
  return v229 != 0;
}

- (void)_addContextAlternativesForZhuyinInputString:(id)a3 modifications:(id)a4 afterIndex:(unint64_t)a5 delta:(int64_t)a6 toArray:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t i;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    v34 = *(_QWORD *)v49;
    v35 = a6;
    do
    {
      v12 = 0;
      v36 = v10;
      do
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(a4);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
        v14 = objc_msgSend(v13, "range");
        v41 = v15;
        v16 = objc_msgSend(v13, "syllableRange");
        v42 = v17;
        v40 = v14;
        if (v14 >= a5 && v16 >= a5)
        {
          v19 = v16;
          v39 = v12;
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v20 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (!v20)
          {
            v24 = 1;
LABEL_27:
            v30 = (void *)objc_msgSend(a3, "mutableCopy");
            v31 = (void *)objc_msgSend(v13, "replacementString");
            v32 = objc_msgSend(v31, "length");
            objc_msgSend(v30, "replaceCharactersInRange:withString:", v40 + a6, v41, v31);
            if ((v24 & 1) != 0)
            {
              if ((objc_msgSend(a7, "containsObject:", v30) & 1) == 0)
                objc_msgSend(a7, "addObject:", v30);
            }
            else
            {
              -[AppleSpell _addContextAlternativesForZhuyinInputString:modifications:afterIndex:delta:toArray:](self, "_addContextAlternativesForZhuyinInputString:modifications:afterIndex:delta:toArray:", v30, a4, v19 + v42, a6 - v41 + v32, a7);
            }

            v12 = v39;
            goto LABEL_32;
          }
          v21 = v20;
          v22 = *(_QWORD *)v45;
          v23 = 1;
          v24 = 1;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v45 != v22)
                objc_enumerationMutation(a4);
              v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              v27 = objc_msgSend(v26, "syllableRange");
              if (v26 != v13 && v27 >= a5)
              {
                v23 &= v27 + v28 > v19;
                v24 &= v19 + v42 > v27;
              }
            }
            v21 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v21);
          v11 = v34;
          a6 = v35;
          v10 = v36;
          v12 = v39;
          if ((v23 & 1) != 0)
            goto LABEL_27;
        }
LABEL_32:
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v10);
  }
}

- (id)contextAlternativeAnnotatedStringsForZhuyinInputString:(id)a3
{
  PRZhuyinContext *v5;
  uint64_t v6;
  void *v7;
  uint64_t i;

  v5 = objc_alloc_init(PRZhuyinContext);
  v6 = objc_msgSend(a3, "length");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      -[PRZhuyinContext addInputCharacter:geometryModel:geometryData:](v5, "addInputCharacter:geometryModel:geometryData:", objc_msgSend(a3, "characterAtIndex:", i), 0, 0);
  }
  -[AppleSpell _addContextAlternativesForZhuyinInputString:modifications:afterIndex:delta:toArray:](self, "_addContextAlternativesForZhuyinInputString:modifications:afterIndex:delta:toArray:", a3, -[PRZhuyinContext currentModifications](v5, "currentModifications"), 0, 0, v7);

  return v7;
}

- (void)_addTwoLetterWordGuessesForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 isCapitalized:(BOOL)a7 isAllCaps:(BOOL)a8 twoLetterWords:(const char *)a9 candidateList:(id)a10
{
  _BOOL4 v10;
  _BOOL4 v11;
  uint64_t v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  size_t v16;
  size_t v17;
  size_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  size_t i;
  uint64_t v28;
  unsigned __int8 v29;
  char v30;
  char v31;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a5 == 2)
  {
    if (a9)
    {
      v10 = a8;
      v11 = a7;
      v13 = objc_msgSend(a6, "encoding", a3);
      v14 = toLowerX_1(*a4, v13);
      v15 = toLowerX_1(a4[1], v13);
      v16 = strlen(a9);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = v15;
        v20 = v14;
        while (a9[v18] != v15 || a9[v18 + 1] != v14)
        {
          v18 += 2;
          if (v18 >= v16)
            goto LABEL_15;
        }
        v30 = v15;
        v31 = v14;
        v32 = 0;
        v21 = 3;
        if (!v11)
          v21 = 1;
        if (v10)
          v22 = 2;
        else
          v22 = v21;
        objc_msgSend(a10, "addTranspositionCandidateWithBuffer:encoding:transform:intendedFirstCharacter:intendedSecondCharacter:", &v30, v13, v22, v15, v14);
LABEL_15:
        v29 = v14;
        v23 = 0;
        v24 = 3;
        if (!v11)
          v24 = 1;
        if (v10)
          v25 = 2;
        else
          v25 = v24;
        do
        {
          if (a9[v23] == v20)
          {
            v26 = a9[v23 + 1];
            if (adjacentMatch(v15, a9[v23 + 1], v13))
            {
              v30 = v20;
              v31 = v26;
              v32 = 0;
              objc_msgSend(a10, "addReplacementCandidateWithBuffer:encoding:transform:intendedCharacter:actualCharacter:", &v30, v13, v25, v26, v15);
            }
          }
          v23 += 2;
        }
        while (v23 < v17);
        for (i = 0; i < v17; i += 2)
        {
          if (a9[i + 1] == v19)
          {
            v28 = a9[i];
            if (adjacentMatch(v29, a9[i], v13))
            {
              v30 = v28;
              v31 = v19;
              v32 = 0;
              objc_msgSend(a10, "addReplacementCandidateWithBuffer:encoding:transform:intendedCharacter:actualCharacter:", &v30, v13, v25, v28, v29);
            }
          }
        }
      }
    }
  }
}

- (void)_addConnectionGuessesForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 connection:(_PR_DB_IO *)a7 candidateList:(id)a8
{
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t i;
  const char *v25;
  BOOL v26;
  unint64_t v27;
  int v28;
  int v29;
  _BOOL4 v30;
  uint64_t v32;
  _OWORD v33[15];
  __int128 v34;
  int v35;
  char *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (a5 - 2 <= 0x3D && a7 != 0)
  {
    v13 = objc_msgSend(a6, "encoding", a3);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0;
    memset(v33, 0, sizeof(v33));
    v34 = 0u;
    HIDWORD(v34) = 0;
    v35 = 0;
    v36 = a4;
    *(_QWORD *)&v43 = v33;
    BYTE7(v44) = 1;
    *(_WORD *)((char *)&v44 + 9) = *(_WORD *)&a7->var0;
    PRword((uint64_t)&v36, 8, 0);
    v14 = (_QWORD *)v37;
    if ((_QWORD)v37)
    {
      if (*(_QWORD *)(v37 + 8))
      {
        if (*(_QWORD *)v37)
        {
          v15 = *(unsigned __int16 *)(v37 + 18);
          if (*(_WORD *)(v37 + 18))
          {
            v16 = 0;
            do
            {
              v17 = (const char *)(*v14 + *(__int16 *)(v14[1] + 2 * v16));
              if (strlen(v17) == a5)
              {
                v18 = 0;
                do
                {
                  v19 = removeDiacriticsX_0(a4[v18], v13);
                  v20 = toLowerX_1(v19, v13);
                  v21 = removeDiacriticsX_0(v17[v18], v13);
                  v22 = toLowerX_1(v21, v13);
                  ++v18;
                }
                while (v20 == v22 && v18 < a5);
                if (v20 == v22)
                  objc_msgSend(a8, "addCandidateWithBuffer:encoding:errorType:", v17, v13, 1);
              }
              ++v16;
            }
            while (v16 != v15);
            if ((_DWORD)v15)
            {
              for (i = 0; i != v15; ++i)
              {
                v25 = (const char *)(*v14 + *(__int16 *)(v14[1] + 2 * i));
                if (strlen(v25) == a5)
                {
                  if (!a5)
                    goto LABEL_34;
                  v26 = 0;
                  v27 = 0;
                  do
                  {
                    v28 = a4[v27];
                    v29 = v25[v27];
                    v30 = v28 == v29;
                    if (v28 != v29 && !v26)
                    {
                      v30 = adjacentMatch(a4[v27], v29, v13);
                      v26 = v30;
                    }
                    ++v27;
                  }
                  while (v30 && v27 < a5);
                  if (v30)
LABEL_34:
                    objc_msgSend(a8, "addCandidateWithBuffer:encoding:errorType:", v25, v13, 7);
                }
              }
              v32 = 0;
              do
              {
                objc_msgSend(a8, "addCandidateWithBuffer:encoding:errorType:", *v14 + *(__int16 *)(v14[1] + v32), v13, 8);
                v32 += 2;
              }
              while (2 * v15 != v32);
            }
          }
        }
      }
    }
    PRword((uint64_t)&v36, 17, 0);
  }
}

- (void)_addAdditionalGuessesForWord:(id)a3 sender:(id)a4 buffer:(char *)a5 length:(unint64_t)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8 accents:(const char *)a9 isCapitalized:(BOOL)a10 isAllCaps:(BOOL)a11 isAllAlpha:(BOOL)a12 hasLigature:(BOOL)a13 suggestPossessive:(BOOL)a14 checkUser:(BOOL)a15 checkHyphens:(BOOL)a16 candidateList:(id)a17
{
  char *p_s;
  char *i;
  unsigned int v23;
  BOOL v24;
  int v26;
  _BOOL4 v27;
  char *v28;
  char *v29;
  int v30;
  char *v31;
  int v32;
  unint64_t v34;
  char v35;
  char *v36;
  char *v37;
  int v38;
  uint64_t v39;
  int v40;
  const char *v41;
  int v42;
  _BYTE *v43;
  int v44;
  const char *v45;
  int v46;
  int v47;
  int v48;
  int v49;
  _BOOL4 v51;
  char *v52;
  char v53;
  char *v54;
  char *v55;
  int v56;
  uint64_t v57;
  char *v58;
  char v59;
  unsigned int v60;
  unsigned __int8 v61;
  char *v62;
  char *v63;
  BOOL v64;
  char v65;
  int v66;
  unint64_t v67;
  char v68;
  unsigned __int8 *v69;
  char *v70;
  int v71;
  char v72;
  char *v73;
  char *v74;
  int v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  unsigned __int8 *v79;
  int v80;
  char *v81;
  char v82;
  char *v83;
  char *v84;
  int v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unsigned __int8 *v91;
  uint64_t v92;
  int v93;
  _BOOL4 v94;
  unsigned __int8 v95;
  uint64_t v96;
  unsigned __int8 v97;
  char v98;
  unsigned __int8 *v99;
  char *v100;
  int v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unsigned __int8 *v107;
  uint64_t v108;
  int v109;
  _BOOL4 v110;
  unsigned __int8 v111;
  uint64_t v112;
  unsigned __int8 v113;
  char v114;
  unsigned __int8 *v115;
  char *v116;
  int v117;
  uint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unsigned __int8 *v121;
  uint64_t v122;
  int v123;
  _BOOL4 v124;
  int v125;
  const char *v126;
  uint64_t v127;
  int v128;
  char v129;
  unsigned __int8 *v130;
  char *v131;
  int v132;
  int v133;
  uint64_t v134;
  char *v135;
  char *v136;
  uint64_t j;
  char *v139;
  int v140;
  char v141;
  char *v142;
  uint64_t v143;
  unint64_t v144;
  unsigned __int8 *v145;
  char v146;
  char *v147;
  unsigned __int8 *v148;
  uint64_t v149;
  int v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  int v154;
  char v155;
  unsigned __int8 *v156;
  char *v157;
  int v158;
  char *v159;
  char *v160;
  int64_t v161;
  uint64_t v162;
  char v163;
  unint64_t v164;
  uint64_t v165;
  char *v166;
  _BOOL4 v167;
  unsigned __int8 v168;
  uint64_t v169;
  char v170;
  uint64_t v171;
  int v172;
  int v173;
  uint64_t v174;
  uint64_t v175;
  id v176;
  uint64_t v177;
  uint64_t v178;
  char v179;
  unsigned __int8 *v180;
  char *v181;
  int v182;
  char *v183;
  char *v184;
  int64_t v185;
  uint64_t v186;
  unsigned __int8 *v187;
  uint64_t v188;
  _BOOL4 v189;
  int v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  int v195;
  uint64_t v196;
  int v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  char v201;
  char *v202;
  char *v203;
  char v204;
  char v205;
  uint64_t v206;
  int64_t v207;
  _BYTE *v208;
  int v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  int v214;
  int v215;
  uint64_t v216;
  uint64_t v217;
  int v218;
  unsigned int v219;
  _PR_DB_IO *v221;
  char __s;
  unsigned __int8 v223;
  char v224;
  char v225;
  char v226;
  uint64_t v227;

  v221 = a8;
  v227 = *MEMORY[0x1E0C80C00];
  v219 = objc_msgSend(a7, "encoding", a3);
  if ((a6 & 0x7FFFFFFFFFFFFF80) != 0 || a6 < 2 || !a13)
    goto LABEL_21;
  p_s = &__s;
  for (i = a5; ; ++i)
  {
    v23 = *i;
    if (v23 > 0xC5)
    {
      switch(v23)
      {
        case 0xC6u:
          *(_WORD *)p_s = 25921;
          p_s += 2;
          continue;
        case 0xDFu:
          *(_WORD *)p_s = 29555;
          p_s += 2;
          continue;
        case 0xE6u:
          *(_WORD *)p_s = 25953;
          p_s += 2;
          continue;
      }
      goto LABEL_17;
    }
    if (v23 == 140)
    {
      *(_WORD *)p_s = 25935;
      p_s += 2;
      continue;
    }
    if (v23 == 156)
    {
      *(_WORD *)p_s = 25967;
      p_s += 2;
      continue;
    }
    if (!*i)
      break;
LABEL_17:
    *p_s++ = v23;
  }
  *p_s = 0;
  *(_WORD *)((char *)&v196 + 5) = 0;
  BYTE4(v196) = a16;
  BYTE3(v196) = 0;
  BYTE2(v196) = a15;
  LOWORD(v196) = 1;
  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, strlen(&__s), a7, v221, a4, 1, v196, 0))
  {
    objc_msgSend(a17, "addCandidateWithBuffer:encoding:errorType:", &__s, v219, 4);
  }
LABEL_21:
  v24 = danishAccents == (_UNKNOWN *)a9 || norwegianAccents == (_UNKNOWN *)a9;
  v26 = !v24 && nynorskAccents != (_UNKNOWN *)a9;
  v27 = a6 < 3 || a11;
  if (a6 > 0x17 || v27 || v26 || (objc_msgSend(a17, "isFull") & 1) != 0)
    goto LABEL_52;
  v28 = &__s;
  v29 = a5;
  while (2)
  {
    v30 = *v29;
    if (v30 == 65)
    {
      v31 = v29 + 1;
      if (v29[1] != 101)
        goto LABEL_49;
      LOBYTE(v30) = -58;
LABEL_48:
      v29 = v31;
      goto LABEL_49;
    }
    if (v30 == 97)
    {
      v31 = v29 + 1;
      v32 = v29[1];
      if (v32 == 97)
      {
        LOBYTE(v30) = -27;
      }
      else
      {
        if (v32 != 101)
          goto LABEL_49;
        LOBYTE(v30) = -26;
      }
      goto LABEL_48;
    }
    if (*v29)
    {
LABEL_49:
      *v28++ = v30;
      ++v29;
      continue;
    }
    break;
  }
  *v28 = 0;
  *(_WORD *)((char *)&v196 + 5) = 0;
  BYTE4(v196) = a16;
  BYTE3(v196) = 0;
  BYTE2(v196) = a15;
  LOWORD(v196) = 1;
  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, strlen(&__s), a7, v221, a4, 1, v196, 0))
  {
    objc_msgSend(a17, "addCandidateWithBuffer:encoding:errorType:", &__s, v219, 4);
  }
LABEL_52:
  v202 = a5;
  v34 = a6;
  if (a6 <= 0x17 && a9 && !v27 && (objc_msgSend(a17, "isFull") & 1) == 0)
  {
    v35 = *a5;
    if (*a5)
    {
      v36 = a5 + 1;
      v37 = &__s;
      do
      {
        *v37++ = v35;
        v38 = *v36++;
        v35 = v38;
      }
      while (v38);
    }
    else
    {
      v37 = &__s;
    }
    *v37 = 0;
    v209 = __s;
    if (__s)
    {
      if (a10)
        v39 = 3;
      else
        v39 = 1;
      v203 = &__s;
      do
      {
        v40 = *(unsigned __int8 *)a9;
        if (*a9)
        {
          v208 = v203 + 1;
          v41 = a9;
          do
          {
            if (v40 == v209)
            {
              *v203 = v41[1];
              *(_WORD *)((char *)&v196 + 5) = 0;
              BYTE4(v196) = a16;
              BYTE3(v196) = 1;
              BYTE2(v196) = a15;
              LOWORD(v196) = 1;
              if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
              {
                objc_msgSend(a17, "addCandidateWithBuffer:encoding:transform:errorType:", &__s, v219, v39, 1);
              }
              v42 = *v208;
              if (*v208)
              {
                v43 = v203 + 1;
                do
                {
                  v44 = *(unsigned __int8 *)a9;
                  if (*a9)
                  {
                    v45 = a9 + 2;
                    do
                    {
                      if (v44 == v42)
                      {
                        *v43 = *(v45 - 1);
                        *(_DWORD *)((char *)&v196 + 3) = 257;
                        BYTE2(v196) = a15;
                        LOWORD(v196) = 1;
                        if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
                        {
                          objc_msgSend(a17, "addCandidateWithBuffer:encoding:transform:errorType:", &__s, v219, v39, 1);
                        }
                      }
                      v46 = *(unsigned __int8 *)v45;
                      v45 += 2;
                      v44 = v46;
                    }
                    while (v46);
                  }
                  *v43 = v42;
                  v47 = *++v43;
                  v42 = v47;
                }
                while (v47);
              }
            }
            v48 = *((unsigned __int8 *)v41 + 2);
            v41 += 2;
            v40 = v48;
          }
          while (v48);
        }
        *v203 = v209;
        v49 = *++v203;
        v209 = v49;
      }
      while (v49);
    }
  }
  v51 = v219 == 1280 || v219 == 517;
  v207 = v34;
  if (v34 < 4 || !v51)
  {
LABEL_104:
    v52 = a5;
    if (v34 != 3 || v219 != 1280)
      goto LABEL_128;
    if ((objc_msgSend(a17, "isFull") & 1) != 0)
      goto LABEL_139;
    v61 = *a5;
    if (!*a5)
    {
LABEL_126:
      v225 = v224;
      v224 = 38;
      v226 = 0;
      if (-[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](self, "checkNameWordBuffer:length:languageObject:globalOnly:", &__s, 4, a7, 0))
      {
        objc_msgSend(a17, "addCandidateWithBuffer:encoding:errorType:", &__s, 1280, 2);
      }
      goto LABEL_128;
    }
    v62 = a5 + 1;
    v63 = &__s;
    while (1)
    {
      if (v61 <= 0xF7u && (v61 - 97 >= 0x1A ? (v64 = v61 - 223 >= 0x18) : (v64 = 0), v64))
      {
        if (v61 - 154 > 4 || ((1 << (v61 + 102)) & 0x15) == 0)
          goto LABEL_125;
      }
      else if (v61 - 154 > 4 || ((1 << (v61 + 102)) & 0x15) == 0)
      {
        v65 = v61 - 32;
        if (v61 == 255)
          v65 = -97;
        if (v61 != 223)
          v61 = v65;
        goto LABEL_125;
      }
      v61 -= 16;
LABEL_125:
      *v63++ = v61;
      v66 = *v62++;
      v61 = v66;
      if (!v66)
        goto LABEL_126;
    }
  }
  v52 = a5;
  if ((objc_msgSend(a17, "isFull") & 1) == 0)
  {
    v53 = *a5;
    if (*a5)
    {
      v54 = a5 + 1;
      v55 = &__s;
      do
      {
        *v55++ = v53;
        v56 = *v54++;
        v53 = v56;
      }
      while (v56);
    }
    else
    {
      v55 = &__s;
    }
    *v55 = 0;
    v57 = __s;
    if (__s)
    {
      v58 = &__s;
      do
      {
        if (isUpperCaseX(v57, v219))
          v59 = toLowerX_1(v57, v219);
        else
          v59 = toUpperX_0(v57, v219);
        *v58 = v59;
        if (-[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](self, "checkNameWordBuffer:length:languageObject:globalOnly:", &__s, v34, a7, 0))
        {
          objc_msgSend(a17, "addCandidateWithBuffer:encoding:errorType:", &__s, v219, 2);
        }
        *v58 = v57;
        v60 = *++v58;
        v57 = v60;
      }
      while (v60);
    }
    goto LABEL_104;
  }
LABEL_128:
  if (v34 >= 4 && a14)
  {
    v67 = v34 - 1;
    if (v52[v34 - 1] == 115 && v52[v34 - 2] != 39 && (objc_msgSend(a17, "isFull") & 1) == 0)
    {
      v68 = *v52;
      if (*v52)
      {
        v69 = (unsigned __int8 *)(v52 + 1);
        v70 = &__s;
        do
        {
          *v70++ = v68;
          v71 = *v69++;
          v68 = v71;
        }
        while (v71);
      }
      *(&__s + v67) = 0;
      *(_WORD *)((char *)&v196 + 5) = 0;
      BYTE4(v196) = a16;
      BYTE3(v196) = 1;
      BYTE2(v196) = a15;
      LOWORD(v196) = 1;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34 - 1, a7, v221, a4, 1, v196, 0))
      {
        *(&__s + v67) = 39;
        *(_WORD *)(&__s + v34) = 115;
        objc_msgSend(a17, "addCandidateWithBuffer:encoding:errorType:", &__s, v219, 3);
      }
      goto LABEL_138;
    }
LABEL_139:
    if ((objc_msgSend(a17, "isFull") & 1) == 0)
    {
      v72 = *a5;
      if (*a5)
      {
        v73 = a5 + 1;
        v74 = &__s;
        do
        {
          *v74++ = v72;
          v75 = *v73++;
          v72 = v75;
        }
        while (v75);
      }
      else
      {
        v74 = &__s;
      }
      *v74 = 0;
      v76 = __s;
      if (__s)
      {
        v77 = 3;
        if (!a10)
          v77 = 1;
        if (a11)
          v78 = 2;
        else
          v78 = v77;
        v79 = &v223;
        do
        {
          v80 = *v79;
          if (!*v79)
            break;
          if (isAnyAlphaX_0(v76, v219) && isAnyAlphaX_0(v80, v219))
          {
            *(v79 - 1) = v80;
            *v79 = v76;
            *(_WORD *)((char *)&v196 + 5) = 0;
            BYTE4(v196) = a16;
            BYTE3(v196) = 1;
            BYTE2(v196) = a15;
            LOWORD(v196) = 1;
            if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
            {
              objc_msgSend(a17, "addTranspositionCandidateWithBuffer:encoding:transform:intendedFirstCharacter:intendedSecondCharacter:", &__s, v219, v78, *(v79 - 1), *v79);
            }
            v80 = *(v79 - 1);
            *(v79 - 1) = *v79;
            *v79 = v80;
          }
          ++v79;
          v76 = v80;
        }
        while (v80);
      }
    }
    if (v34 > 0x17)
      goto LABEL_228;
    v81 = a5;
    if ((objc_msgSend(a17, "isFull") & 1) == 0)
    {
      v82 = *a5;
      if (*a5)
      {
        v83 = a5 + 1;
        v84 = &__s;
        do
        {
          *v84++ = v82;
          v85 = *v83++;
          v82 = v85;
        }
        while (v85);
      }
      else
      {
        v84 = &__s;
      }
      *v84 = 0;
      v86 = 26;
      if (v219 == 517)
        v86 = 32;
      v199 = v86;
      v87 = 97;
      if (v219 == 517)
        v87 = -48;
      v204 = v87;
      v88 = 3;
      if (!a10)
        v88 = 1;
      if (a11)
        v88 = 2;
      v210 = v88;
      v89 = v34;
      do
      {
        v90 = v89 - 1;
        if (v89 == 1 && !isAnyAlphaX_0(v223, v219))
          break;
        v91 = (unsigned __int8 *)(&__s + v90);
        if (v89 != v34 || isAnyAlphaX_0(*(v91 - 1), v219))
        {
          v92 = *(&__s + v90);
          v93 = toLowerX_1(v92, v219);
          v94 = a10;
          if (v89 != 1)
            v94 = 0;
          v214 = v94 || a11;
          v95 = v204;
          v96 = v199;
          do
          {
            if (v93 != v95 && adjacentMatch(v93, v95, v219))
            {
              v97 = v95;
              if (v214)
                v97 = toUpperX_0(v95, v219);
              *v91 = v97;
              *(_WORD *)((char *)&v196 + 5) = 0;
              BYTE4(v196) = a16;
              BYTE3(v196) = 1;
              BYTE2(v196) = a15;
              LOWORD(v196) = 1;
              if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
              {
                objc_msgSend(a17, "addReplacementCandidateWithBuffer:encoding:transform:intendedCharacter:actualCharacter:", &__s, v219, v210, *v91, v92);
              }
            }
            ++v95;
            --v96;
          }
          while (v96);
          *v91 = v92;
          v81 = v202;
        }
        --v89;
      }
      while (v90);
    }
    if ((objc_msgSend(a17, "isFull") & 1) == 0)
    {
      v98 = *v81;
      if (*v81)
      {
        v99 = (unsigned __int8 *)(v81 + 1);
        v100 = &__s;
        do
        {
          *v100++ = v98;
          v101 = *v99++;
          v98 = v101;
        }
        while (v101);
      }
      else
      {
        v100 = &__s;
      }
      *v100 = 0;
      v102 = 26;
      if (v219 == 517)
        v102 = 32;
      v200 = v102;
      v103 = 97;
      if (v219 == 517)
        v103 = -48;
      v205 = v103;
      v104 = 3;
      if (!a10)
        v104 = 1;
      if (a11)
        v104 = 2;
      v211 = v104;
      v105 = v34;
      do
      {
        v106 = v105 - 1;
        if (v105 == 1 && !isAnyAlphaX_0(v223, v219))
          break;
        v107 = (unsigned __int8 *)(&__s + v106);
        if (v105 != v34 || isAnyAlphaX_0(*(v107 - 1), v219))
        {
          v108 = *(&__s + v106);
          v109 = toLowerX_1(v108, v219);
          v110 = a10;
          if (v105 != 1)
            v110 = 0;
          v215 = v110 || a11;
          v111 = v205;
          v112 = v200;
          do
          {
            if (v109 != v111 && !adjacentMatch(v109, v111, v219))
            {
              v113 = v111;
              if (v215)
                v113 = toUpperX_0(v111, v219);
              *v107 = v113;
              *(_WORD *)((char *)&v196 + 5) = 0;
              BYTE4(v196) = a16;
              BYTE3(v196) = 1;
              BYTE2(v196) = a15;
              LOWORD(v196) = 1;
              if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
              {
                objc_msgSend(a17, "addReplacementCandidateWithBuffer:encoding:transform:intendedCharacter:actualCharacter:", &__s, v219, v211, *v107, v108);
              }
            }
            ++v111;
            --v112;
          }
          while (v112);
          *v107 = v108;
          v81 = v202;
        }
        --v105;
      }
      while (v106);
    }
    if (a9)
    {
      if ((objc_msgSend(a17, "isFull") & 1) == 0)
      {
        v114 = *v81;
        if (*v81)
        {
          v115 = (unsigned __int8 *)(v81 + 1);
          v116 = &__s;
          do
          {
            *v116++ = v114;
            v117 = *v115++;
            v114 = v117;
          }
          while (v117);
        }
        else
        {
          v116 = &__s;
        }
        *v116 = 0;
        v118 = 3;
        if (!a10)
          v118 = 1;
        if (a11)
          v118 = 2;
        v216 = v118;
        v119 = v34;
        do
        {
          v120 = v119 - 1;
          if (v119 == 1 && !isAnyAlphaX_0(v223, v219))
            break;
          v121 = (unsigned __int8 *)(&__s + v120);
          if (v119 != v34 || isAnyAlphaX_0(*(v121 - 1), v219))
          {
            v122 = *v121;
            if (*a9)
            {
              v123 = toLowerX_1(*v121, v219);
              v124 = a10;
              if (v119 != 1)
                v124 = 0;
              v125 = v124 || a11;
              v126 = a9 + 2;
              do
              {
                v127 = *((unsigned __int8 *)v126 - 1);
                if (v123 != (_DWORD)v127)
                {
                  if (v125)
                    LOBYTE(v127) = toUpperX_0(v127, v219);
                  *v121 = v127;
                  *(_WORD *)((char *)&v196 + 5) = 0;
                  BYTE4(v196) = a16;
                  BYTE3(v196) = 1;
                  BYTE2(v196) = a15;
                  LOWORD(v196) = 1;
                  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
                  {
                    objc_msgSend(a17, "addReplacementCandidateWithBuffer:encoding:transform:intendedCharacter:actualCharacter:", &__s, v219, v216, *v121, v122);
                  }
                }
                v128 = *(unsigned __int8 *)v126;
                v126 += 2;
              }
              while (v128);
            }
            *v121 = v122;
          }
          --v119;
        }
        while (v120);
      }
      v197 = 1;
    }
    else
    {
LABEL_228:
      v197 = 0;
    }
    if ((objc_msgSend(a17, "isFull") & 1) == 0)
    {
      v129 = *v202;
      if (*v202)
      {
        v130 = (unsigned __int8 *)(v202 + 1);
        v131 = &__s;
        do
        {
          *v131++ = v129;
          v132 = *v130++;
          v129 = v132;
        }
        while (v132);
      }
      else
      {
        v131 = &__s;
      }
      *v131 = 0;
      if (__s)
      {
        v133 = __s;
        v134 = 3;
        if (!a10)
          v134 = 1;
        if (a11)
          v134 = 2;
        v217 = v134;
        v135 = &__s;
        v136 = &__s;
        do
        {
          if (!*++v136)
            break;
          for (j = 0; j != 2; ++j)
          {
            v139 = &v135[j];
            v140 = v135[j + 2];
            if (!v135[j + 2])
              break;
            if (isAnyAlphaX_0(v133, v219)
              && isAnyAlphaX_0(*v136, v219)
              && isAnyAlphaX_0(v135[j + 1], v219)
              && isAnyAlphaX_0(v140, v219))
            {
              *v135 = v140;
              v139[2] = v133;
              *(_WORD *)((char *)&v196 + 5) = 0;
              BYTE4(v196) = a16;
              BYTE3(v196) = 1;
              BYTE2(v196) = a15;
              LOWORD(v196) = 1;
              if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
              {
                objc_msgSend(a17, "addCandidateWithBuffer:encoding:transform:errorType:", &__s, v219, v217, 13);
              }
              v141 = *v135;
              v133 = v139[2];
              *v135 = v133;
              v139[2] = v141;
            }
          }
          v135 = v136;
          v133 = *v136;
        }
        while (*v136);
      }
    }
    v142 = v202;
    if (v34 < 4)
      goto LABEL_312;
    if ((objc_msgSend(a17, "isFull") & 1) == 0 && *v202)
    {
      v143 = 0;
      v144 = (unint64_t)&v202[v34 - 1];
      v145 = (unsigned __int8 *)v202;
      do
      {
        if ((v145 != (unsigned __int8 *)v202 || isAnyAlphaX_0(v202[1], v219))
          && (v145 != (unsigned __int8 *)v144 || isAnyAlphaX_0(v202[v34 - 2], v219)))
        {
          v146 = *v202;
          if (*v202)
          {
            v147 = &__s;
            v148 = (unsigned __int8 *)(v202 + 1);
            v149 = v143;
            do
            {
              if (v149)
                *v147++ = v146;
              v150 = *v148++;
              v146 = v150;
              --v149;
            }
            while (v150);
          }
          else
          {
            v147 = &__s;
          }
          *v147 = 0;
          *(_WORD *)((char *)&v196 + 5) = 0;
          BYTE4(v196) = a16;
          BYTE3(v196) = 1;
          BYTE2(v196) = a15;
          LOWORD(v196) = 1;
          if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34 - 1, a7, v221, a4, 1, v196, 0))
          {
            if (v145 == (unsigned __int8 *)v202 && a10)
              v151 = 3;
            else
              v151 = 0;
            if (v145 <= (unsigned __int8 *)v202)
              v152 = 0;
            else
              v152 = *(v145 - 1);
            if ((unint64_t)v145 >= v144)
              v153 = 0;
            else
              v153 = v145[1];
            objc_msgSend(a17, "addInsertionCandidateWithBuffer:encoding:transform:intendedPrecedingCharacter:insertedCharacter:intendedFollowingCharacter:", &__s, v219, v151, v152, *v145, v153);
          }
        }
        v154 = *++v145;
        ++v143;
      }
      while (v154);
    }
    if (v34 <= 0x17)
    {
LABEL_312:
      if ((objc_msgSend(a17, "isFull") & 1) == 0)
      {
        v155 = *v202;
        if (*v202)
        {
          v156 = (unsigned __int8 *)(v202 + 1);
          v157 = &__s;
          do
          {
            *v157++ = v155;
            v158 = *v156++;
            v155 = v158;
          }
          while (v158);
        }
        else
        {
          v157 = &__s;
        }
        *v157 = 0;
        v198 = &__s + v34;
        v159 = &__s;
        do
        {
          v160 = &v159[v34];
          v160[1] = v159[v34];
          --v159;
        }
        while (&__s <= v160 - 1);
        if (__s)
        {
          v161 = 0;
          v162 = 26;
          if (v219 == 517)
            v162 = 32;
          v206 = v162;
          v163 = 97;
          if (v219 == 517)
            v163 = -48;
          v201 = v163;
          v164 = v34 + 1;
          v165 = 3;
          if (!a10)
            v165 = 1;
          if (a11)
            v165 = 2;
          v212 = v165;
          v166 = &__s;
          while (v161)
          {
            if (v161 != 1 || isAnyAlphaX_0(v166[1], v219))
              goto LABEL_327;
LABEL_351:
            ++v161;
            v166 = &__s + v161;
            if (!*(&__s + v161))
              goto LABEL_352;
          }
          if ((isAnyAlphaX_0(v166[2], v219) & 1) == 0)
            goto LABEL_351;
LABEL_327:
          if (v166 == v198 - 1 && !isAnyAlphaX_0(*(v198 - 2), v219)
            || v161 == v34 && !isAnyAlphaX_0(*(v166 - 2), v219))
          {
            goto LABEL_351;
          }
          v167 = a10;
          if (v161)
            v167 = 0;
          v218 = v167 || a11;
          v168 = v201;
          v169 = v206;
          while (1)
          {
            v170 = v168;
            if (v218)
              v170 = toUpperX_0(v168, v219);
            *v166 = v170;
            *(_WORD *)((char *)&v196 + 5) = 0;
            BYTE4(v196) = a16;
            BYTE3(v196) = 1;
            BYTE2(v196) = a15;
            LOWORD(v196) = 1;
            if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v164, a7, v221, a4, 1, v196, 0))
            {
              if (v161)
                v171 = *(v166 - 1);
              else
                v171 = 0;
              if (v161 >= (uint64_t)v34)
                v175 = 0;
              else
                v175 = v166[1];
              v174 = *v166;
              v176 = a17;
              v177 = v219;
              v178 = v212;
            }
            else
            {
              if (v161)
                goto LABEL_349;
              v172 = *v166;
              v173 = toUpperX_0(*v166, v219);
              v24 = v173 == v172;
              v161 = 0;
              if (v24)
                goto LABEL_349;
              *v166 = v173;
              *(_WORD *)((char *)&v196 + 5) = 0;
              BYTE4(v196) = a16;
              BYTE3(v196) = 1;
              BYTE2(v196) = a15;
              LOWORD(v196) = 1;
              if (!-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v164, a7, v221, a4, 1, v196, 0))goto LABEL_349;
              v174 = *v166;
              v175 = v166[1];
              v176 = a17;
              v177 = v219;
              v178 = 0;
              v171 = 0;
            }
            objc_msgSend(v176, "addOmissionCandidateWithBuffer:encoding:transform:intendedPrecedingCharacter:omittedCharacter:intendedFollowingCharacter:", &__s, v177, v178, v171, v174, v175);
LABEL_349:
            ++v168;
            if (!--v169)
            {
              *v166 = v166[1];
              v142 = v202;
              goto LABEL_351;
            }
          }
        }
      }
    }
LABEL_352:
    if (v197 && (objc_msgSend(a17, "isFull") & 1) == 0)
    {
      v179 = *v142;
      if (*v142)
      {
        v180 = (unsigned __int8 *)(v142 + 1);
        v181 = &__s;
        do
        {
          *v181++ = v179;
          v182 = *v180++;
          v179 = v182;
        }
        while (v182);
      }
      else
      {
        v181 = &__s;
      }
      *v181 = 0;
      v183 = &__s + v34;
      if ((v34 & 0x8000000000000000) == 0)
      {
        v184 = &__s + v34;
        do
        {
          v184[1] = *v184;
          --v184;
        }
        while (&__s <= v184);
      }
      if (__s)
      {
        v185 = 0;
        v186 = 3;
        if (!a10)
          v186 = 1;
        if (a11)
          v186 = 2;
        v213 = v186;
        v187 = (unsigned __int8 *)&__s;
        do
        {
          if (v185)
          {
            v188 = v219;
            if (v185 != 1 || isAnyAlphaX_0(v187[1], v219))
            {
LABEL_373:
              if ((v187 != (unsigned __int8 *)(v183 - 1)
                 || isAnyAlphaX_0(*(v183 - 2), v188))
                && (v185 != v207 || isAnyAlphaX_0(*(v187 - 2), v188)))
              {
                if (*a9)
                {
                  v189 = a10;
                  if (v185)
                    v189 = 0;
                  v190 = v189 || a11;
                  v191 = a9 + 2;
                  do
                  {
                    v192 = *((unsigned __int8 *)v191 - 1);
                    if (v190)
                      LOBYTE(v192) = toUpperX_0(v192, v188);
                    *v187 = v192;
                    *(_WORD *)((char *)&v196 + 5) = 0;
                    BYTE4(v196) = a16;
                    BYTE3(v196) = 1;
                    BYTE2(v196) = a15;
                    LOWORD(v196) = 1;
                    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v207 + 1, a7, v221, a4, 1, v196, 0))
                    {
                      if (v185)
                        v193 = *(v187 - 1);
                      else
                        v193 = 0;
                      if (v185 >= v207)
                        v194 = 0;
                      else
                        v194 = v187[1];
                      objc_msgSend(a17, "addOmissionCandidateWithBuffer:encoding:transform:intendedPrecedingCharacter:omittedCharacter:intendedFollowingCharacter:", &__s, v188, v213, v193, *v187, v194);
                    }
                    v195 = *(unsigned __int8 *)v191;
                    v191 += 2;
                  }
                  while (v195);
                }
                *v187 = v187[1];
              }
            }
          }
          else
          {
            v188 = v219;
            if ((isAnyAlphaX_0(v187[2], v219) & 1) != 0)
              goto LABEL_373;
          }
          ++v185;
          v187 = (unsigned __int8 *)(&__s + v185);
        }
        while (*(&__s + v185));
      }
    }
  }
  else
  {
LABEL_138:
    if (v34 >= 3)
      goto LABEL_139;
  }
}

- (void)_addSpaceInsertionGuessesForWord:(id)a3 sender:(id)a4 buffer:(char *)a5 length:(unint64_t)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8 isCapitalized:(BOOL)a9 checkUser:(BOOL)a10 oneLetterWords:(const char *)a11 twoLetterWords:(const char *)a12 candidateList:(id)a13
{
  char v17;
  char *v18;
  char *v19;
  int v20;
  _BYTE *v21;
  _BYTE *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char v26;
  char *v27;
  int v28;
  unsigned int v30;
  unsigned int v31;
  unint64_t v32;
  BOOL v33;
  int v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  size_t v40;
  char v41;
  size_t i;
  unsigned int v43;
  unsigned int v44;
  unint64_t v45;
  int v46;
  BOOL v47;
  unsigned int v48;
  unsigned int v49;
  unint64_t v50;
  _BOOL4 v52;
  uint64_t v54;
  _BYTE *v55;
  unint64_t v56;
  unsigned int v57;
  _PR_DB_IO *v59;
  _BYTE v60[256];
  _BYTE v61[271];

  v59 = a8;
  *(_QWORD *)&v61[255] = *MEMORY[0x1E0C80C00];
  v57 = objc_msgSend(a7, "encoding", a3);
  if (a6 - 3 <= 0x14 && (objc_msgSend(a13, "isFull") & 1) == 0)
  {
    v17 = *a5;
    if (*a5)
    {
      v18 = a5 + 1;
      v19 = v60;
      do
      {
        *v19++ = v17;
        v20 = *v18++;
        v17 = v20;
      }
      while (v20);
      *v19 = 0;
      if ((a6 & 0x8000000000000000) != 0)
        return;
    }
    else
    {
      v60[0] = 0;
    }
    v55 = &v60[a6];
    v21 = v60;
    do
    {
      v22 = &v21[a6];
      v22[1] = v21[a6];
      --v21;
    }
    while (v60 <= v22 - 1);
    if ((uint64_t)a6 < 2)
      return;
    v56 = a6 - 1;
    v23 = &v60[a6 - 1];
    v24 = v61;
    v25 = 1;
    do
    {
      *v24 = 45;
      if (v25 != 1 && v24 != v23)
        goto LABEL_16;
      v27 = v24 - 1;
      if (v25 != 1)
        v27 = v24 + 1;
      v28 = *v27;
      if ((v28 - 48) >= 0xA && (!a11 || !strchr((char *)a11, v28)))
        goto LABEL_101;
      if (v25 == 1 && v28 == 97 && englishOneLetterWords[0] == a11)
      {
        v30 = v24[1];
        HIDWORD(v32) = v30 - 65;
        LODWORD(v32) = v30 - 65;
        v31 = v32 >> 1;
        v33 = v31 > 0x1C;
        v34 = (1 << v31) & 0x14951495;
        v35 = v33 || v34 == 0;
        if (!v35
          || vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1DE2EC910, (uint32x4_t)vaddq_s32(vdupq_n_s32(v30), (int32x4_t)xmmword_1DE2EC900)))) & 1 | (v30 - 248 < 6) | ((v30 & 0xD8) == 200 || v30 == 255))
        {
          goto LABEL_101;
        }
      }
      if (frenchOneLetterWords == a11)
      {
        if (v25 != 1 || v28 != 108)
          goto LABEL_86;
      }
      else if (v25 != 1 || v28 != 108 || italianOneLetterWords != (_UNKNOWN *)a11)
      {
        goto LABEL_86;
      }
      v48 = v24[1];
      HIDWORD(v50) = v48 - 65;
      LODWORD(v50) = v48 - 65;
      v49 = v50 >> 1;
      if ((v49 > 0x1C || ((1 << v49) & 0x14951495) == 0)
        && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1DE2EC910, (uint32x4_t)vaddq_s32(vdupq_n_s32(v48), (int32x4_t)xmmword_1DE2EC900)))) & 1) == 0&& v48 - 248 >= 6&& v48 != 255&& v48 != 104&& (v48 & 0xD8) != 0xC8)
      {
        goto LABEL_101;
      }
LABEL_86:
      v52 = frenchOneLetterWords == a11 || italianOneLetterWords == (_UNKNOWN *)a11;
      if (v28 == 108 && v52 && v24 == v23)
        goto LABEL_101;
LABEL_16:
      if (v25 == 2 || v24 == v55 - 2)
      {
        v36 = -2;
        if (v25 != 2)
          v36 = 1;
        v37 = 2;
        if (v25 == 2)
          v37 = -1;
        if (!a12)
          goto LABEL_101;
        v38 = v24[v36];
        v39 = v24[v37];
        v40 = strlen(a12);
        if (!v40)
          goto LABEL_101;
        v41 = 0;
        for (i = 0; i < v40; i += 2)
        {
          if (a12[i] == v38 && a12[i + 1] == v39)
            v41 = 1;
          if ((v41 & 1) != 0)
            break;
        }
        if ((v41 & 1) == 0)
          goto LABEL_101;
        if (v25 == 2 && englishTwoLetterWords[0] == a12 && v38 == 97 && v39 == 110)
        {
          v43 = v24[1];
          HIDWORD(v45) = v43 - 65;
          LODWORD(v45) = v43 - 65;
          v44 = v45 >> 1;
          v33 = v44 > 0x1C;
          v46 = (1 << v44) & 0x14951495;
          v47 = v33 || v46 == 0;
          if (v47
            && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1DE2EC910, (uint32x4_t)vaddq_s32(vdupq_n_s32(v43), (int32x4_t)xmmword_1DE2EC900)))) & 1) == 0&& v43 - 248 >= 6&& v43 != 255&& v43 != 104&& (v43 & 0xD8) != 0xC8)
          {
            goto LABEL_101;
          }
        }
      }
      *(_DWORD *)((char *)&v54 + 3) = 0;
      BYTE2(v54) = a10;
      LOWORD(v54) = 1;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", v60, a6 + 1, a7, v59, a4, 1, v54, 0)&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:](self, "checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:", v60, v25, a7, a9)&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:](
              self,
              "checkNegativeWordBuffer:length:languageObject:",
              v24 + 1,
              v55 - v24,
              a7))
      {
        *v24 = 32;
        objc_msgSend(a13, "addCandidateWithBuffer:encoding:errorType:", v60, v57, 10);
        v26 = 45;
LABEL_99:
        *v24 = v26;
        goto LABEL_100;
      }
      if (v25 != 1
        || (*(_DWORD *)((char *)&v54 + 3) = 0,
            BYTE2(v54) = a10,
            LOWORD(v54) = 1,
            !-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &v61[1], v56, a7, v59, a4, 1, v54, 0))|| -[AppleSpell checkNegativeWordBuffer:length:languageObject:](self, "checkNegativeWordBuffer:length:languageObject:", &v61[1], v56, a7))
      {
        if (v24 != v23)
          goto LABEL_101;
        *(_DWORD *)((char *)&v54 + 3) = 0;
        BYTE2(v54) = a10;
        LOWORD(v54) = 1;
        if (!-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", v60, v56, a7, v59, a4, 1, v54, 0)|| -[AppleSpell checkNegativeWordBuffer:length:languageObject:](self, "checkNegativeWordBuffer:length:languageObject:", v60, v56, a7))
        {
          goto LABEL_101;
        }
      }
      *v24 = 32;
      if (v25 == 1 && v60[0] == 108)
      {
        v26 = 39;
        if (frenchOneLetterWords == a11 || italianOneLetterWords == (_UNKNOWN *)a11)
          goto LABEL_99;
      }
LABEL_100:
      objc_msgSend(a13, "addCandidateWithBuffer:encoding:errorType:", v60, v57, 10);
LABEL_101:
      *v24 = v24[1];
      v24 = &v60[++v25];
    }
    while (v25 != a6);
  }
}

- (void)addLexiconGuessesForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 minCorrectionLength:(unint64_t)a7 minExtendedCorrectionLength:(unint64_t)a8 isCapitalized:(BOOL)a9 stopAfterFreeInsertions:(BOOL)a10 toGuesses:(id)a11
{
  int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  int v23;
  int v24;
  CFIndex Bytes;
  uint64_t v26;
  _QWORD v27[15];
  int v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  _QWORD v32[3];
  char v33;
  char v34;
  UInt8 buffer[128];
  uint64_t v36;
  CFRange v37;

  v36 = *MEMORY[0x1E0C80C00];
  v18 = objc_msgSend(a6, "encoding");
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v19 = objc_msgSend(a3, "length");
  if (a5 >= a7)
  {
    v20 = v19;
    if (objc_msgSend(a6, "isTurkish"))
    {
      v21 = addLexiconGuessesForWord_buffer_length_languageObject_minCorrectionLength_minExtendedCorrectionLength_isCapitalized_stopAfterFreeInsertions_toGuesses__turkishLocale;
      if (addLexiconGuessesForWord_buffer_length_languageObject_minCorrectionLength_minExtendedCorrectionLength_isCapitalized_stopAfterFreeInsertions_toGuesses__turkishLocale)
      {
        v22 = 0;
      }
      else
      {
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("tr"));
        v22 = 0;
        addLexiconGuessesForWord_buffer_length_languageObject_minCorrectionLength_minExtendedCorrectionLength_isCapitalized_stopAfterFreeInsertions_toGuesses__turkishLocale = v21;
      }
    }
    else
    {
      v23 = objc_msgSend(a6, "isVietnamese");
      if (v20 < 0x40)
        v24 = v23;
      else
        v24 = 0;
      if (v24 == 1)
      {
        v37.location = 0;
        v37.length = v20;
        Bytes = CFStringGetBytes((CFStringRef)a3, v37, 0x100u, 0, 0, buffer, 126, 0);
        v21 = 0;
        v22 = v20 == Bytes;
        if (v22)
          v26 = 40;
        else
          v26 = 20;
        goto LABEL_15;
      }
      v22 = 0;
      v21 = 0;
    }
    v26 = 20;
LABEL_15:
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __174__AppleSpell_Guessing__addLexiconGuessesForWord_buffer_length_languageObject_minCorrectionLength_minExtendedCorrectionLength_isCapitalized_stopAfterFreeInsertions_toGuesses___block_invoke;
    v27[3] = &unk_1EA8D6F78;
    v29 = a9;
    v27[4] = v21;
    v27[5] = a11;
    v30 = a10;
    v31 = v22;
    v27[8] = a7;
    v27[9] = &v34;
    v27[10] = buffer;
    v27[11] = v20;
    v28 = v18;
    v27[12] = a4;
    v27[13] = a5;
    v27[14] = a8;
    v27[6] = a6;
    v27[7] = v32;
    -[AppleSpell enumerateCorrectionEntriesForWord:maxCorrections:inLexiconForLanguageObject:withBlock:](self, "enumerateCorrectionEntriesForWord:maxCorrections:inLexiconForLanguageObject:withBlock:", a3, v26, a6, v27);
  }
  _Block_object_dispose(v32, 8);
}

unint64_t __174__AppleSpell_Guessing__addLexiconGuessesForWord_buffer_length_languageObject_minCorrectionLength_minExtendedCorrectionLength_isCapitalized_stopAfterFreeInsertions_toGuesses___block_invoke(uint64_t a1, __CFString *a2, uint64_t a3, char a4, unint64_t a5, _BYTE *a6)
{
  __CFString *v8;
  unint64_t v10;
  unint64_t result;
  unint64_t v12;
  unint64_t v13;
  CFIndex usedBufLen;
  UInt8 buffer[256];
  uint64_t v16;
  CFRange v17;
  CFRange v18;

  v8 = a2;
  v16 = *MEMORY[0x1E0C80C00];
  if ((a4 & 0x20) == 0 && *(_BYTE *)(a1 + 124))
    v8 = (__CFString *)initialCapitalizedString(a2, *(_QWORD *)(a1 + 32));
  v10 = -[__CFString length](v8, "length");
  result = objc_msgSend(*(id *)(a1 + 40), "isFull");
  if ((result & 1) != 0
    || *(_BYTE *)(a1 + 125) && a5 >= 5 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *a6 = 1;
    goto LABEL_9;
  }
  if (*(_BYTE *)(a1 + 126))
  {
    if (v10 <= 0x3F && v10 >= *(_QWORD *)(a1 + 64))
    {
      v17.location = 0;
      v17.length = v10;
      result = CFStringGetBytes(v8, v17, 0x100u, 0, 0, *(UInt8 **)(a1 + 72), 126, 0);
      if (v10 == result)
      {
        result = effectiveUTF16EditDistance(*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(unsigned __int16 **)(a1 + 72), v10);
        if (result <= 2)
        {
LABEL_28:
          result = objc_msgSend(*(id *)(a1 + 40), "addCandidateWithString:errorType:", v8, a5);
          goto LABEL_9;
        }
      }
    }
    goto LABEL_9;
  }
  usedBufLen = 0;
  v18.location = 0;
  v18.length = v10;
  result = CFStringGetBytes(v8, v18, *(_DWORD *)(a1 + 120), 0, 0, buffer, 254, &usedBufLen);
  if (v10 != result || (unint64_t)usedBufLen < *(_QWORD *)(a1 + 64))
    goto LABEL_9;
  v12 = effectiveEditDistance(*(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), (uint64_t)buffer, usedBufLen);
  if (v12 < 2)
    goto LABEL_28;
  v13 = v12;
  if (v12 == 2 && *(_QWORD *)(a1 + 104) >= *(_QWORD *)(a1 + 112))
    goto LABEL_28;
  result = objc_msgSend(*(id *)(a1 + 48), "isIrishGaelic");
  if (a5 > 4 || !(_DWORD)result)
  {
LABEL_9:
    if (a5 > 4)
      return result;
    goto LABEL_10;
  }
  if (v13 == 3 && *(_QWORD *)(a1 + 104) >= *(_QWORD *)(a1 + 112))
    result = objc_msgSend(*(id *)(a1 + 40), "addCandidateWithString:errorType:", v8, a5);
LABEL_10:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

- (id)_spellServer:(id)a3 suggestGuessesForWordRange:(_NSRange)a4 inString:(id)a5 languageObject:(id)a6 options:(id)a7 tagger:(id)a8 errorModel:(id)a9 guessesDictionaries:(id)a10
{
  NSUInteger length;
  NSUInteger location;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  CFStringEncoding v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  unint64_t v32;
  BOOL v33;
  CFIndex Bytes;
  void *v36;
  unint64_t v37;
  int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned __int8 *v41;
  int v42;
  char v43;
  int v44;
  unsigned int v45;
  int v46;
  int v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  AppleSpell *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  char v63;
  uint64_t i;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  char v74;
  uint64_t j;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  AppleSpell *v81;
  id v82;
  uint64_t v83;
  int v84;
  __CFString *v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  _QWORD *v91;
  char v92;
  unint64_t v93;
  const __CFString *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t k;
  uint64_t v99;
  id v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  CFIndex *usedBufLen;
  CFIndex *usedBufLena;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  id v116;
  unsigned __int8 v117;
  uint64_t v118;
  int v119;
  _WORD *v120;
  int v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id obj;
  AppleSpell *v128;
  uint64_t v129;
  id v130;
  __CFString *v132;
  char v133;
  unsigned int v134;
  unint64_t v135;
  CFStringEncoding encoding;
  void *v137;
  unsigned int v138;
  char v139;
  void *v140;
  PRCandidateList *v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int16 v158;
  __int16 v159;
  CFIndex v160;
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  UInt8 v164[128];
  UInt8 buffer;
  _BYTE v166[7];
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  int v183;
  _OWORD v184[9];
  uint64_t v185;
  CFRange v186;
  CFRange v187;

  length = a4.length;
  location = a4.location;
  v185 = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_msgSend(a5, "substringWithRange:", a4.location, a4.length);
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v130 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v17 = (void *)objc_msgSend(a7, "objectForKey:", CFSTR("ContextualGuessDictionaries"));
  if (v17)
    v18 = objc_msgSend(v17, "BOOLValue");
  else
    v18 = 0;
  memset(v184, 0, sizeof(v184));
  v183 = 0;
  v182 = 0u;
  v181 = 0u;
  v180 = 0u;
  v179 = 0u;
  v178 = 0u;
  v177 = 0u;
  v176 = 0u;
  v175 = 0u;
  v174 = 0u;
  v173 = 0u;
  v172 = 0u;
  v171 = 0u;
  v170 = 0u;
  v169 = 0u;
  v168 = 0u;
  v167 = 0u;
  v160 = 0;
  v159 = 8217;
  v158 = 0;
  v129 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v159, 1);
  v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v158, 1);
  v125 = _appIdentifierFromOptions(a7);
  v124 = objc_msgSend(a7, "objectForKey:", CFSTR("ParameterBundles"));
  if (objc_msgSend(a6, "isKorean"))
  {

    return -[AppleSpell spellServer:suggestGuessesForKoreanWordRange:inString:options:](self, "spellServer:suggestGuessesForKoreanWordRange:inString:options:", a3, location, length, a5, a7);
  }
  v121 = v18;
  obj = -[AppleSpell capitalizationDictionaryArrayForLanguageObject:](self, "capitalizationDictionaryArrayForLanguageObject:", a6);
  v141 = -[PRCandidateList initWithMaxCount:defaultReplacementRange:customErrorModel:capitalizationDictionaryArray:]([PRCandidateList alloc], "initWithMaxCount:defaultReplacementRange:customErrorModel:capitalizationDictionaryArray:", 32, location, length, a9, obj);
  v20 = objc_msgSend(a6, "oneLetterWords");
  v118 = objc_msgSend(a6, "twoLetterWords");
  v115 = objc_msgSend(a6, "accents");
  v139 = objc_msgSend(a6, "isEnglish");
  if ((v139 & 1) != 0)
  {
LABEL_7:
    v113 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(a6, "isGerman") & 1) != 0)
  {
    v112 = 0;
    v113 = 0;
    v119 = 0;
    v114 = 1;
    goto LABEL_13;
  }
  if ((objc_msgSend(a6, "isDutch") & 1) != 0 || (objc_msgSend(a6, "isSwedish") & 1) != 0)
  {
    v112 = 0;
    v113 = 0;
    v119 = 0;
    v114 = 1;
    v21 = 4;
    goto LABEL_14;
  }
  if ((objc_msgSend(a6, "isDanish") & 1) != 0
    || (objc_msgSend(a6, "isNorwegian") & 1) != 0
    || (objc_msgSend(a6, "isNynorsk") & 1) != 0
    || (objc_msgSend(a6, "isIrishGaelic") & 1) != 0)
  {
    v113 = 0;
    v119 = 0;
    v114 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(a6, "isTurkish"))
  {
    if (objc_msgSend(a6, "isFinnish"))
    {
      v112 = 0;
      v113 = 0;
      v119 = 1;
      v123 = 2;
      v114 = 1;
      goto LABEL_15;
    }
    goto LABEL_7;
  }
  if (!_spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries__turkishLocale)
  {
    v119 = 0;
    v113 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("tr"));
    _spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries__turkishLocale = v113;
    goto LABEL_9;
  }
  v113 = _spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries__turkishLocale;
LABEL_8:
  v119 = 0;
LABEL_9:
  v114 = 1;
LABEL_10:
  v112 = 2;
LABEL_13:
  v21 = 6;
LABEL_14:
  v123 = v21;
LABEL_15:
  objc_msgSend(v15, "rangeOfString:", v19);
  if (v22)
    v15 = (void *)objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", v19, CFSTR("_"));
  v23 = (__CFString *)objc_msgSend(v15, "stringByTrimmingCharactersInSet:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet"), "invertedSet"));
  -[__CFString rangeOfString:](v23, "rangeOfString:", v129);
  v25 = v24;
  if (v24)
    v23 = (__CFString *)-[__CFString stringByReplacingOccurrencesOfString:withString:](v23, "stringByReplacingOccurrencesOfString:withString:", v129, CFSTR("'"));
  v26 = -[__CFString length](v23, "length");
  v120 = -[AppleSpell databaseConnectionForLanguageObject:](self, "databaseConnectionForLanguageObject:", a6);
  v27 = objc_msgSend(a6, "encoding");
  v116 = -[AppleSpell autocorrectionDictionaryForLanguageObject:](self, "autocorrectionDictionaryForLanguageObject:", a6);
  if (!_spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries__disallowedInternalPunctuationCharacterSet)
  {
    v28 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet"), "mutableCopy");
    objc_msgSend(v28, "removeCharactersInString:", CFSTR("'-:/&_"));
    objc_msgSend(v28, "removeCharactersInRange:", 8208, 2);
    _spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries__disallowedInternalPunctuationCharacterSet = (uint64_t)v28;
  }
  v29 = 0;
  v30 = 0;
  v31 = a8;
  v128 = self;
  encoding = v27;
  v122 = v25;
  v132 = v23;
  while (1)
  {
    v32 = v29 + v30;
    if (v26 <= v29 + v30)
      break;
    v29 = -[__CFString rangeOfCharacterFromSet:options:range:](v23, "rangeOfCharacterFromSet:options:range:", _spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries__disallowedInternalPunctuationCharacterSet, 0, v32, v26 - (v29 + v30));
    if (v30)
      v33 = v29 == 0;
    else
      v33 = 1;
    if (!v33 && v29 + v30 < v26)
      goto LABEL_32;
  }
  if (!v26)
  {
    v137 = 0;
    v36 = 0;
    goto LABEL_102;
  }
LABEL_32:
  v186.location = 0;
  v186.length = v26;
  Bytes = CFStringGetBytes(v23, v186, v27, 0, 0, &buffer, 254, &v160);
  v137 = 0;
  v36 = 0;
  if (v26 != Bytes)
    goto LABEL_102;
  v111 = v20;
  v37 = v160;
  v166[v160 - 1] = 0;
  v38 = buffer;
  v39 = isUpperCaseX(buffer, v27);
  v138 = v39;
  if (v37 > 1)
    v40 = v39;
  else
    v40 = 0;
  v134 = v40;
  if (v38)
  {
    v133 = 0;
    v41 = v166;
    v42 = 1;
    v43 = 1;
    do
    {
      if ((v38 - 140) <= 0x3A && ((1 << (v38 + 116)) & 0x400000000010001) != 0
        || v38 == 230
        || v38 == 223)
      {
        v133 = 1;
      }
      if ((v38 - 48) >= 0xA)
        v43 = 0;
      if (isAnyAlphaX_0(v38, v27))
      {
        v44 = isUpperCaseX(v38, v27);
        v45 = v134;
        if (!v44)
          v45 = 0;
        v134 = v45;
      }
      else
      {
        if (v38 == 45)
          v46 = v42;
        else
          v46 = 0;
        if (v38 != 39)
          v42 = v46;
      }
      v47 = *v41++;
      v38 = v47;
    }
    while (v47);
  }
  else
  {
    v133 = 0;
    v43 = 1;
    LOBYTE(v42) = 1;
  }
  v48 = v134;
  if ((v134 & 1) != 0)
    v49 = 0;
  else
    v49 = v138;
  v36 = (void *)objc_msgSend(v116, "objectForKey:", v132);
  if (!v36)
    v36 = (void *)objc_msgSend(v116, "objectForKey:", -[__CFString lowercaseString](v132, "lowercaseString"));
  v117 = v139 & v49;
  v50 = objc_msgSend(v36, "length");
  v51 = v128;
  v31 = a8;
  if (v36 && v50)
  {
    if ((v134 & 1) != 0)
    {
      if (v26 < 5)
      {
        v36 = 0;
        goto LABEL_80;
      }
      v52 = uppercasedString(v36, v113);
    }
    else
    {
      if (!v138)
      {
LABEL_80:
        -[PRCandidateList addCandidateWithString:errorType:](v141, "addCandidateWithString:errorType:", v36, 6);
        goto LABEL_81;
      }
      v52 = initialCapitalizedString(v36, v113);
    }
    v36 = (void *)v52;
    goto LABEL_80;
  }
LABEL_81:
  if (((v49 | v134) & 1) != 0)
  {
    v137 = 0;
  }
  else
  {
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v164, 16);
    if (v49)
    {
      v53 = *(_QWORD *)v155;
LABEL_85:
      v54 = 0;
      while (1)
      {
        if (*(_QWORD *)v155 != v53)
          objc_enumerationMutation(obj);
        v55 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v154 + 1) + 8 * v54), "objectForKey:", -[__CFString lowercaseString](v132, "lowercaseString"));
        if (v55)
          break;
        if (v49 == ++v54)
        {
          v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v164, 16);
          if (v49)
            goto LABEL_85;
          v137 = 0;
          goto LABEL_98;
        }
      }
      v56 = v55;
      v137 = v55;
      if (!objc_msgSend(v55, "length"))
      {
        v49 = 0;
LABEL_98:
        v51 = v128;
        v31 = a8;
        v48 = v134;
        goto LABEL_99;
      }
      v51 = v128;
      v48 = v134;
      if ((objc_msgSend(v56, "isEqualToString:", v132) & 1) == 0)
        -[PRCandidateList addCandidateWithString:errorType:](v141, "addCandidateWithString:errorType:", v56, 2);
      v49 = 0;
      v31 = a8;
    }
    else
    {
      v137 = 0;
      v117 = 0;
    }
  }
LABEL_99:
  if (v26 <= v32 && (v43 & 1) == 0)
  {
    -[AppleSpell _addTwoLetterWordGuessesForWord:buffer:length:languageObject:isCapitalized:isAllCaps:twoLetterWords:candidateList:](v51, "_addTwoLetterWordGuessesForWord:buffer:length:languageObject:isCapitalized:isAllCaps:twoLetterWords:candidateList:", v132, &buffer, v160, a6, v49, v48 & 1, v118, v141);
    -[AppleSpell _addConnectionGuessesForWord:buffer:length:languageObject:connection:candidateList:](v51, "_addConnectionGuessesForWord:buffer:length:languageObject:connection:candidateList:", v132, &buffer, v160, a6, v120, v141);
    BYTE6(v110) = v114;
    WORD2(v110) = v117;
    BYTE3(v110) = v133 & 1;
    BYTE2(v110) = v42 & 1;
    BYTE1(v110) = v48 & 1;
    LOBYTE(v110) = v49;
    -[AppleSpell _addAdditionalGuessesForWord:sender:buffer:length:languageObject:connection:accents:isCapitalized:isAllCaps:isAllAlpha:hasLigature:suggestPossessive:checkUser:checkHyphens:candidateList:](v51, "_addAdditionalGuessesForWord:sender:buffer:length:languageObject:connection:accents:isCapitalized:isAllCaps:isAllAlpha:hasLigature:suggestPossessive:checkUser:checkHyphens:candidateList:", v132, a3, &buffer, v160, a6, v120, v115, v110, v141);
    v31 = a8;
    LOWORD(usedBufLen) = v49;
    -[AppleSpell _addSpaceInsertionGuessesForWord:sender:buffer:length:languageObject:connection:isCapitalized:checkUser:oneLetterWords:twoLetterWords:candidateList:](v51, "_addSpaceInsertionGuessesForWord:sender:buffer:length:languageObject:connection:isCapitalized:checkUser:oneLetterWords:twoLetterWords:candidateList:", v132, a3, &buffer, v160, a6, v120, usedBufLen, v111, v118, v141);
    LOWORD(usedBufLena) = v49;
    -[AppleSpell addLexiconGuessesForWord:buffer:length:languageObject:minCorrectionLength:minExtendedCorrectionLength:isCapitalized:stopAfterFreeInsertions:toGuesses:](v51, "addLexiconGuessesForWord:buffer:length:languageObject:minCorrectionLength:minExtendedCorrectionLength:isCapitalized:stopAfterFreeInsertions:toGuesses:", v132, &buffer, v160, a6, 3, 5, usedBufLena, v141);
  }
LABEL_102:
  v140 = v36;
  if (v31)
  {
    v57 = -[AppleSpell _rankedCandidatesForCandidateList:languageObject:tagger:appIdentifier:parameterBundles:](v128, "_rankedCandidatesForCandidateList:languageObject:tagger:appIdentifier:parameterBundles:", v141, a6, v31, v125, v124);
    if (v57)
    {
      v58 = v57;
      v152 = 0u;
      v153 = 0u;
      v150 = 0u;
      v151 = 0u;
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v150, v163, 16);
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v151;
        if (a10)
          v62 = v121 == 0;
        else
          v62 = 1;
        v63 = v62;
        do
        {
          for (i = 0; i != v60; ++i)
          {
            if (*(_QWORD *)v151 != v61)
              objc_enumerationMutation(v58);
            v65 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * i);
            if ((objc_msgSend(v65, "isBlocklisted") & 1) == 0)
            {
              v66 = objc_msgSend(v65, "string");
              if ((objc_msgSend(v16, "containsObject:", v66) & 1) == 0)
              {
                objc_msgSend(v16, "addObject:", v66);
                if ((v63 & 1) == 0)
                {
                  v67 = (void *)MEMORY[0x1E0C99D80];
                  v68 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v65, "score");
                  objc_msgSend(a10, "addObject:", objc_msgSend(v67, "dictionaryWithObjectsAndKeys:", v66, CFSTR("Guess"), objc_msgSend(v68, "numberWithDouble:"), CFSTR("Score"), 0));
                }
              }
            }
          }
          v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v150, v163, 16);
        }
        while (v60);
      }
    }
  }
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v69 = -[PRCandidateList candidates](v141, "candidates");
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v146, v162, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v147;
    if (a10)
      v73 = v121 == 0;
    else
      v73 = 1;
    v74 = v73;
    do
    {
      for (j = 0; j != v71; ++j)
      {
        if (*(_QWORD *)v147 != v72)
          objc_enumerationMutation(v69);
        v76 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * j);
        if ((objc_msgSend(v76, "isBlocklisted") & 1) == 0)
        {
          v77 = objc_msgSend(v76, "string");
          if ((objc_msgSend(v16, "containsObject:", v77) & 1) == 0)
          {
            objc_msgSend(v16, "addObject:", v77);
            if ((v74 & 1) == 0)
            {
              v78 = (void *)MEMORY[0x1E0C99D80];
              v79 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v76, "score");
              objc_msgSend(a10, "addObject:", objc_msgSend(v78, "dictionaryWithObjectsAndKeys:", v77, CFSTR("Guess"), objc_msgSend(v79, "numberWithDouble:"), CFSTR("Score"), 0));
            }
          }
        }
      }
      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v146, v162, 16);
    }
    while (v71);
  }
  objc_msgSend(v16, "removeObject:", v132);
  v80 = objc_msgSend(v16, "count");
  v81 = v128;
  v82 = a6;
  if (v80)
  {
    v83 = v80;
    if (v120)
      v84 = 1;
    else
      v84 = v119;
    do
    {
      v85 = (__CFString *)objc_msgSend(v16, "objectAtIndex:", --v83);
      v86 = -[__CFString length](v85, "length");
      if (v140 && (-[__CFString isEqualToString:](v85, "isEqualToString:", v140) & 1) != 0)
        continue;
      if (v137 && (-[__CFString isEqualToString:](v85, "isEqualToString:", v137) & 1) != 0)
        continue;
      v187.location = 0;
      v187.length = v86;
      if (v86 != CFStringGetBytes(v85, v187, encoding, 0, 0, &buffer, 254, &v160))
        continue;
      if (!-[AppleSpell checkWordBuffer:length:languageObject:index:](v81, "checkWordBuffer:length:languageObject:index:", &buffer, v160, v82, 1)&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:](v81, "checkNegativeWordBuffer:length:languageObject:", &buffer, v160, v82))
      {
        if (!v84)
          continue;
        if (v86 < v123)
          continue;
        if (v160 < v123)
          continue;
        -[__CFString rangeOfString:](v85, "rangeOfString:", CFSTR(" "));
        if (v87)
          continue;
        -[__CFString rangeOfString:](v85, "rangeOfString:", CFSTR("-"));
        if (v88)
          continue;
        -[__CFString rangeOfString:](v85, "rangeOfString:", CFSTR("'"));
        if (v89)
        {
          if (-[__CFString rangeOfString:](v85, "rangeOfString:", CFSTR("'")))
            continue;
        }
        if (objc_msgSend(v16, "count") <= v112
          || (objc_msgSend(a3, "isWordInUserDictionaries:caseSensitive:", v85, 0) & 1) != 0)
        {
          continue;
        }
        if (v119)
        {
          if (!-[AppleSpell checkWordBuffer:length:languageObject:index:](v81, "checkWordBuffer:length:languageObject:index:", &buffer, v160, v82, 0))continue;
        }
        else
        {
          if (-[AppleSpell checkNameWordBuffer:length:languageObject:globalOnly:](v81, "checkNameWordBuffer:length:languageObject:globalOnly:", &buffer, v160, v82, 0))
          {
            continue;
          }
          v90 = -[AppleSpell checkWordBuffer:length:languageObject:index:](v81, "checkWordBuffer:length:languageObject:index:", &buffer, v160, v82, 0);
          if (!v120 || v90)
            continue;
          *(_WORD *)&v166[v160 - 2] = 42;
          memset((char *)v184 + 8, 0, 136);
          v167 = 0u;
          v168 = 0u;
          v169 = 0u;
          v170 = 0u;
          v171 = 0u;
          v172 = 0u;
          v173 = 0u;
          v174 = 0u;
          v175 = 0u;
          v176 = 0u;
          v177 = 0u;
          v178 = 0u;
          v179 = 0u;
          v180 = 0u;
          v181 = 0u;
          v182 = 0u;
          v183 = 0;
          HIDWORD(v182) = 0;
          *(_QWORD *)&v184[0] = &buffer;
          *((_QWORD *)&v184[6] + 1) = &v167;
          HIBYTE(v184[7]) = 1;
          *(_WORD *)((char *)&v184[8] + 1) = *v120;
          PRword((uint64_t)v184, 5, 0);
          v91 = (_QWORD *)*((_QWORD *)&v184[0] + 1);
          if (*((_QWORD *)&v184[0] + 1)
            && *(_QWORD *)(*((_QWORD *)&v184[0] + 1) + 8)
            && **((_QWORD **)&v184[0] + 1)
            && (v135 = *(unsigned __int16 *)(*((_QWORD *)&v184[0] + 1) + 18),
                *(_WORD *)(*((_QWORD *)&v184[0] + 1) + 18)))
          {
            v92 = 0;
            v93 = 0;
            do
            {
              v94 = (id)CFStringCreateWithCString(0, (const char *)(*v91 + *(__int16 *)(v91[1] + 2 * v93)), encoding);
              if (v94 && !-[__CFString caseInsensitiveCompare:](v85, "caseInsensitiveCompare:", v94))
                v92 = 1;
              if ((v92 & 1) != 0)
                break;
              ++v93;
            }
            while (v93 < v135);
            PRword((uint64_t)v184, 17, 0);
            v81 = v128;
            v82 = a6;
            if ((v92 & 1) != 0)
              continue;
          }
          else
          {
            PRword((uint64_t)v184, 17, 0);
            v82 = a6;
          }
        }
      }
      objc_msgSend(v16, "removeObjectAtIndex:", v83);
    }
    while (v83);
  }
  if (a10)
  {
    v144 = 0u;
    v145 = 0u;
    v142 = 0u;
    v143 = 0u;
    v95 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v142, v161, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v143;
      do
      {
        for (k = 0; k != v96; ++k)
        {
          if (*(_QWORD *)v143 != v97)
            objc_enumerationMutation(v16);
          v99 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * k);
          v100 = -[PRCandidateList candidateWithString:](v141, "candidateWithString:", v99);
          if (v100)
          {
            v101 = v100;
            if (objc_msgSend(v100, "hasCustomErrorScore"))
            {
              objc_msgSend(v101, "errorScore");
              objc_msgSend(a10, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v99, CFSTR("Guess"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("Score"), 0));
            }
          }
        }
        v96 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v142, v161, 16);
      }
      while (v96);
    }
    objc_msgSend(a10, "sortUsingComparator:", &__block_literal_global_8);
    v81 = v128;
  }
  v102 = objc_msgSend(v16, "count");
  if (v122)
  {
    v103 = v102;
    if (v102)
    {
      v104 = 0;
      do
      {
        v105 = (void *)objc_msgSend(v16, "objectAtIndex:", v104);
        objc_msgSend(v105, "rangeOfString:", CFSTR("'"));
        if (v106)
          objc_msgSend(v16, "replaceObjectAtIndex:withObject:", v104, objc_msgSend(v105, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), v129));
        ++v104;
      }
      while (v103 != v104);
    }
  }
  -[AppleSpell resetTimer](v81, "resetTimer");

  return v16;
}

uint64_t __134__AppleSpell_Guessing___spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v10;
  float v11;
  float v12;

  v4 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("Score"));
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Score"));
  objc_msgSend(v4, "floatValue");
  v7 = v6;
  objc_msgSend(v5, "floatValue");
  if (v7 > v8)
    return -1;
  objc_msgSend(v4, "floatValue");
  v11 = v10;
  objc_msgSend(v5, "floatValue");
  return v11 < v12;
}

- (id)_spellServer:(id)a3 suggestGuessesForWordRange:(_NSRange)a4 inString:(id)a5 languageObject:(id)a6 options:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;

  length = a4.length;
  location = a4.location;
  v14 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", a6, a5, 0, objc_msgSend(a5, "length"));
  v15 = -[AppleSpell _spellServer:suggestGuessesForWordRange:inString:languageObject:options:tagger:errorModel:guessesDictionaries:](self, "_spellServer:suggestGuessesForWordRange:inString:languageObject:options:tagger:errorModel:guessesDictionaries:", a3, location, length, a5, a6, a7, v14, objc_msgSend(a7, "objectForKey:", PRErrorModelKey), 0);
  -[AppleSpell invalidateTagger:](self, "invalidateTagger:", v14);
  return v15;
}

- (id)spellServer:(id)a3 suggestGuessesForWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)a6 options:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  __CFString *lastLanguage;

  length = a4.length;
  location = a4.location;
  if (!a6
    || (lastLanguage = (__CFString *)a6, (objc_msgSend(a6, "isEqualToString:", CFSTR("und")) & 1) != 0)
    || -[__CFString isEqualToString:](lastLanguage, "isEqualToString:", CFSTR("Multilingual")))
  {
    lastLanguage = (__CFString *)self->_lastLanguage;
    if (!lastLanguage)
    {
      if (-[NSArray count](self->_userPreferredLanguages, "count"))
        lastLanguage = -[NSArray objectAtIndex:](self->_userPreferredLanguages, "objectAtIndex:", 0);
      else
        lastLanguage = CFSTR("en");
    }
  }
  return -[AppleSpell _spellServer:suggestGuessesForWordRange:inString:languageObject:options:](self, "_spellServer:suggestGuessesForWordRange:inString:languageObject:options:", a3, location, length, a5, +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", lastLanguage), a7);
}

- (id)spellServer:(id)a3 suggestContextualGuessDictionariesForWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)a6 options:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  __CFString *lastLanguage;
  id v14;
  void *v15;
  id v16;
  void *v17;

  length = a4.length;
  location = a4.location;
  if (!a6
    || (lastLanguage = (__CFString *)a6, (objc_msgSend(a6, "isEqualToString:", CFSTR("und")) & 1) != 0)
    || -[__CFString isEqualToString:](lastLanguage, "isEqualToString:", CFSTR("Multilingual")))
  {
    lastLanguage = (__CFString *)self->_lastLanguage;
    if (!lastLanguage)
    {
      if (-[NSArray count](self->_userPreferredLanguages, "count"))
        lastLanguage = -[NSArray objectAtIndex:](self->_userPreferredLanguages, "objectAtIndex:", 0);
      else
        lastLanguage = CFSTR("en");
    }
  }
  v14 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", lastLanguage);
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", v14, a5, 0, objc_msgSend(a5, "length"));
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a7);
  objc_msgSend(v17, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("ContextualGuessDictionaries"));
  -[AppleSpell _spellServer:suggestGuessesForWordRange:inString:languageObject:options:tagger:errorModel:guessesDictionaries:](self, "_spellServer:suggestGuessesForWordRange:inString:languageObject:options:tagger:errorModel:guessesDictionaries:", a3, location, length, a5, v14, v17, v16, 0, v15);
  -[AppleSpell invalidateTagger:](self, "invalidateTagger:", v16);
  return v15;
}

- (id)spellServer:(id)a3 suggestGuessDictionariesForWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)a6 options:(id)a7 errorModel:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  __CFString *lastLanguage;
  id v15;
  void *v16;

  length = a4.length;
  location = a4.location;
  if (!a6
    || (lastLanguage = (__CFString *)a6, (objc_msgSend(a6, "isEqualToString:", CFSTR("und")) & 1) != 0)
    || -[__CFString isEqualToString:](lastLanguage, "isEqualToString:", CFSTR("Multilingual")))
  {
    lastLanguage = (__CFString *)self->_lastLanguage;
    if (!lastLanguage)
    {
      if (-[NSArray count](self->_userPreferredLanguages, "count"))
        lastLanguage = -[NSArray objectAtIndex:](self->_userPreferredLanguages, "objectAtIndex:", 0);
      else
        lastLanguage = CFSTR("en");
    }
  }
  v15 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", lastLanguage);
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  -[AppleSpell _spellServer:suggestGuessesForWordRange:inString:languageObject:options:tagger:errorModel:guessesDictionaries:](self, "_spellServer:suggestGuessesForWordRange:inString:languageObject:options:tagger:errorModel:guessesDictionaries:", a3, location, length, a5, v15, a7, 0, a8, v16);
  return v16;
}

- (id)englishStringsFromWordBuffer:(char *)a3 length:(unint64_t)a4 connection:(_PR_DB_IO *)a5
{
  void *v8;
  id v9;
  unint64_t v10;
  int v11;
  int v12;
  _BOOL4 v13;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;
  int v18;
  int v20;
  uint64_t v21;
  unsigned int v22;
  BOOL v23;
  BOOL v24;
  unsigned int v26;
  int v27;
  int v29;
  unint64_t v30;
  int v31;
  int v32;
  unsigned int v34;
  int v35;
  int v37;
  uint64_t v38;
  unsigned int v39;
  BOOL v40;
  unsigned int v42;
  int v43;
  id v45;
  AppleSpell *v46;
  id v47;
  void *v48;
  id v49;
  int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  size_t v55;
  int v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  char *v71;
  _BYTE v72[128];
  _BYTE __dst[256];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, a4, 12);
  v9 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("en_CN"));
  if (a4)
  {
    v10 = 0;
    v11 = *a3;
    do
    {
      v12 = a3[v10];
      v13 = v12 == v11;
      ++v10;
    }
    while (v12 == v11 && v10 < a4);
    v15 = 0;
    while (1)
    {
      v16 = a3[v15] - 99;
      v17 = v16 > 0x15;
      v18 = (1 << v16) & 0x280643;
      if (v17 || v18 == 0)
        break;
      if (++v15 >= a4)
      {
        v20 = 1;
        goto LABEL_15;
      }
    }
    v20 = 0;
LABEL_15:
    v21 = 0;
    while (1)
    {
      v22 = a3[v21];
      v23 = v22 <= 0xF7 && v22 - 216 >= 0x1F;
      v24 = v23 && v22 - 192 >= 0x17;
      if (v24 && (v22 & 0xFFFFFFDF) - 65 >= 0x1A)
      {
        v26 = v22 - 138;
        v17 = v26 > 0x15;
        v27 = (1 << v26) & 0x350015;
        if (v17 || v27 == 0)
          break;
      }
      if (++v21 >= a4)
      {
        v29 = 0;
        goto LABEL_33;
      }
    }
    v29 = 1;
LABEL_33:
    v30 = 0;
    v31 = 1;
    do
    {
      v32 = a3[v30];
      if ((v32 - 65) < 0x1A || (v32 - 192) < 0x17)
      {
        v31 = 1;
        goto LABEL_49;
      }
      if ((v32 - 216) < 7)
        goto LABEL_49;
      v34 = v32 - 138;
      v17 = v34 > 0x15;
      v35 = (1 << v34) & 0x200015;
      if (!v17 && v35 != 0)
        goto LABEL_49;
      ++v30;
    }
    while (v30 < a4);
    v31 = 0;
LABEL_49:
    v38 = 0;
    v65 = v29;
    v66 = v20;
    while (1)
    {
      v39 = a3[v38];
      v40 = v39 <= 0xF7 && v39 - 97 >= 0x1A;
      if (!v40 || v39 - 223 < 0x18)
        break;
      v42 = v39 - 154;
      v17 = v42 > 4;
      v43 = (1 << v42) & 0x15;
      if (!v17 && v43 != 0)
        break;
      if (++v38 >= a4)
      {
        v37 = 0;
        goto LABEL_66;
      }
    }
    v37 = 1;
  }
  else
  {
    v31 = 0;
    v37 = 0;
    v65 = 0;
    v66 = 1;
    v13 = 1;
  }
LABEL_66:
  v45 = (id)englishStringsFromWordBuffer_length_connection__autocorrectionDictionary;
  if (!englishStringsFromWordBuffer_length_connection__autocorrectionDictionary)
  {
    v45 = -[AppleSpell autocorrectionDictionaryForLanguageObject:](self, "autocorrectionDictionaryForLanguageObject:", v9);
    englishStringsFromWordBuffer_length_connection__autocorrectionDictionary = (uint64_t)v45;
  }
  v46 = self;
  v47 = (id)objc_msgSend(v45, "objectForKey:", v8);
  if (!v47)
  {
    v48 = (void *)objc_msgSend((id)englishStringsFromWordBuffer_length_connection__autocorrectionDictionary, "objectForKey:", objc_msgSend(v8, "lowercaseString"));
    v47 = v48;
    if (((v37 | v31 ^ 1) & 1) == 0)
      v47 = (id)objc_msgSend(v48, "uppercaseString");
  }
  v71 = 0;
  if (objc_msgSend(&stru_1EA8D8440, "isEqualToString:", v47))
    goto LABEL_72;
  if (v47)
  {
LABEL_76:

    goto LABEL_77;
  }
  v51 = *a3;
  v52 = v51 - 65;
  v53 = v51 - 192;
  if ((v51 - 65) >= 0x1A
    && v53 >= 0x17
    && (v51 - 216) >= 7
    && ((v51 - 138) > 0x15 || ((1 << (v51 + 118)) & 0x200015) == 0))
  {
    if (next_pinyin((unsigned __int8 *)a3, a4, 0, 1, (unsigned __int8 **)&v71, 0) && v71 == &a3[a4])
      goto LABEL_140;
    v51 = *a3;
    v52 = v51 - 65;
    v53 = v51 - 192;
  }
  if (v52 >= 0x1A
    && v53 >= 0x17
    && (v51 - 216) >= 7
    && ((v51 - 138) > 0x15 || ((1 << (v51 + 118)) & 0x200015) == 0)
    && ((v13 | v66 | v65) & 1) != 0
    || a4 <= 3 && (isUpperCase(v51) & 1) == 0)
  {
    goto LABEL_140;
  }
  WORD2(v63) = 0;
  LODWORD(v63) = 65793;
  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v46, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", a3, a4, v9, v63, 0)&& ((isUpperCase(*a3) & 1) != 0|| !-[AppleSpell checkWordBuffer:length:languageObject:index:](v46, "checkWordBuffer:length:languageObject:index:", a3, a4, v9, 1))&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:](v46, "checkNegativeWordBuffer:length:languageObject:",
          a3,
          a4,
          v9))
  {
    v56 = isUpperCase(*a3);
    if (a4 < 2
      || !v56
      || !next_pinyin((unsigned __int8 *)a3 + 1, a4 - 1, 0, 1, (unsigned __int8 **)&v71, 0)
      || v71 != &a3[a4]
      || !-[AppleSpell checkWordBuffer:length:languageObject:index:](v46, "checkWordBuffer:length:languageObject:index:", a3, a4, v9, 1))
    {
      v57 = (id)englishStringsFromWordBuffer_length_connection__capitalizationDictionaryArray;
      if (!englishStringsFromWordBuffer_length_connection__capitalizationDictionaryArray)
      {
        v57 = -[AppleSpell capitalizationDictionaryArrayForLanguageObject:](v46, "capitalizationDictionaryArrayForLanguageObject:", v9);
        englishStringsFromWordBuffer_length_connection__capitalizationDictionaryArray = (uint64_t)v57;
      }
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v68;
        while (2)
        {
          for (i = 0; i != v59; ++i)
          {
            if (*(_QWORD *)v68 != v60)
              objc_enumerationMutation(v57);
            v62 = objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "objectForKey:", v8);
            if (v62)
            {
              v47 = (id)v62;
              goto LABEL_76;
            }
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
          if (v59)
            continue;
          break;
        }
      }
LABEL_72:
      v49 = v8;
      goto LABEL_73;
    }
LABEL_140:

    return 0;
  }
  if (a4 < 4)
    goto LABEL_140;
  v54 = *a3;
  if (v54 - 65 < 0x1A || v54 - 192 < 0x17 || v54 - 216 < 7 || v54 - 138 <= 0x15 && ((1 << (v54 + 118)) & 0x200015) != 0)
    goto LABEL_140;
  if (a4 + 1 > 1)
    v55 = a4 + 1;
  else
    v55 = 1;
  memcpy(__dst, a3, v55);
  if (v54 <= 0xF7 && v54 - 97 >= 0x1A && v54 - 223 >= 0x18)
  {
    if (v54 - 154 > 4 || ((1 << (v54 + 102)) & 0x15) == 0)
      goto LABEL_137;
LABEL_136:
    LOBYTE(v54) = v54 - 16;
    goto LABEL_137;
  }
  if (v54 - 154 <= 4 && ((1 << (v54 + 102)) & 0x15) != 0)
    goto LABEL_136;
  if (v54 != 223)
  {
    if (v54 == 255)
      LOBYTE(v54) = -97;
    else
      LOBYTE(v54) = v54 - 32;
  }
LABEL_137:
  __dst[0] = v54;
  WORD2(v64) = 0;
  LODWORD(v64) = 65793;
  if (!-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v46, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", __dst, a4, v9, v64, 0)|| -[AppleSpell checkWordBuffer:length:languageObject:index:](v46, "checkWordBuffer:length:languageObject:index:", __dst, a4, v9, 1)|| -[AppleSpell checkNegativeWordBuffer:length:languageObject:](v46, "checkNegativeWordBuffer:length:languageObject:", __dst,
         a4,
         v9))
  {
    goto LABEL_140;
  }
  v49 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", __dst, a4, 12);
LABEL_73:
  v47 = v49;

  if (!v47)
    return 0;
LABEL_77:
  if (objc_msgSend(v47, "isEqualToString:", CFSTR("apple")))
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Apple"), CFSTR("apple"), 0);
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v47);
}

- (id)englishStringFromWordBuffer:(char *)a3 length:(unint64_t)a4 connection:(_PR_DB_IO *)a5
{
  id v5;
  void *v6;

  v5 = -[AppleSpell englishStringsFromWordBuffer:length:connection:](self, "englishStringsFromWordBuffer:length:connection:", a3, a4, a5);
  if (v5 && (v6 = v5, objc_msgSend(v5, "count")))
    return (id)objc_msgSend(v6, "objectAtIndex:", 0);
  else
    return 0;
}

- (void)addSpecialModifiedPinyinToArray:(id)a3 inBuffer:(char *)a4 length:(unint64_t)a5 atEnd:(BOOL)a6
{
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  unsigned int v12;
  int v13;
  _BOOL4 v14;
  size_t v15;
  size_t v16;
  unint64_t v17;
  size_t v18;
  id v19;
  const __CFString *v20;
  const __CFString *v21;
  PRPinyinString *v22;
  uint64_t v23;
  PRPinyinString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int16 v31;
  char __dst;
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v29 = 0;
  v30 = 0;
  v27 = 0;
  v28 = 0;
  v25 = 0;
  v26 = 0;
  if (a5 < 4)
    return;
  v9 = 0;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (a4[v9] != 105)
    {
LABEL_25:
      v11 = 0;
      goto LABEL_26;
    }
    v11 = 0;
    v12 = a4[v9 + 1];
    if (v12 > 0x6C)
    {
      if (v12 == 109)
      {
LABEL_19:
        if (a4[v9 + 2] != 97 || a4[v9 + 3] != 99)
          goto LABEL_25;
        goto LABEL_21;
      }
      if (v12 != 112)
        goto LABEL_26;
    }
    else
    {
      if (v12 == 77)
        goto LABEL_19;
      if (v12 != 80)
        goto LABEL_26;
    }
    v13 = a4[v9 + 2];
    if (v13 != 111 && v13 != 97 || a4[v9 + 3] != 100)
    {
      v11 = 0;
      if (v9 + 5 >= a5 || v13 != 104)
        goto LABEL_26;
      if (a4[v9 + 3] != 111 || a4[v9 + 4] != 110 || a4[v9 + 5] != 101)
        goto LABEL_25;
      v11 = 6;
      goto LABEL_22;
    }
LABEL_21:
    v11 = 4;
LABEL_22:
    if (v11 + v9 < a5)
      v11 |= a4[v11 + v9] == 115;
    v10 = v9;
LABEL_26:
    v14 = v10 + v11 < a5;
    if (a6 && v14)
      v15 = 0;
    else
      v15 = v11;
    if (a6 && v14)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v9 + 4 >= a5)
      break;
    ++v9;
  }
  while (!v15);
  if (v15
    && (!v10
     || findPinyin((unsigned __int8 *)a4, v10, 0, 1, 0, 0, 0, 0, &v30, 0, &v29, (_BYTE *)&v31 + 1, &v28, 0, 0, 0, 0, 0)&& !HIBYTE(v31)
     && v30 == v10))
  {
    v16 = v10 + v15;
    v17 = a5 - (v10 + v15);
    if (a5 > v10 + v15)
    {
      v18 = v16 - 1;
      if (a4[v16 - 1] == 115)
      {
        if (findPinyin((unsigned __int8 *)&a4[v16 - 1], v17 + 1, 0, 1, 0, 0, 0, 0, &v27, 0, &v26, &v31, &v25, 0, 0, 0, 0, 0))
        {
          LOBYTE(v17) = v27 + v18;
          if (v27 + v18 == a5)
          {
            v11 = v15 - 1;
            goto LABEL_46;
          }
        }
      }
    }
    if (a5 == v16
      || findPinyin((unsigned __int8 *)&a4[v16], a5 - v16, 0, 1, 0, 0, 0, 0, &v27, 0, &v26, &v31, &v25, 0, 0, 0, 0, 0)&& (LOBYTE(v17) = v27 + v16, v27 + v16 == a5))
    {
LABEL_46:
      if (v11)
      {
        memcpy(&__dst, &a4[v10], v11);
        LOBYTE(v17) = v33;
      }
      if (v17 > 0xF7u
        || v17 - 97 < 0x1A
        || v17 - 223 < 0x18)
      {
        if (v17 - 154 <= 4 && ((1 << (v17 + 102)) & 0x15) != 0)
          goto LABEL_56;
        if (v17 != 223)
        {
          if (v17 == 255)
            LOBYTE(v17) = -97;
          else
            LOBYTE(v17) = v17 - 32;
        }
      }
      else
      {
        if (v17 - 154 > 4 || ((1 << (v17 + 102)) & 0x15) == 0)
          goto LABEL_57;
LABEL_56:
        LOBYTE(v17) = v17 - 16;
      }
LABEL_57:
      v33 = v17;
      v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &__dst, v11, 12);
      if (v10)
        v20 = (const __CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a4, v10, 12);
      else
        v20 = &stru_1EA8D8440;
      if (a5 <= v11 + v10)
        v21 = &stru_1EA8D8440;
      else
        v21 = (const __CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &a4[v11 + v10], a5 - (v11 + v10), 12);
      objc_msgSend(v19, "length");
      v22 = [PRPinyinString alloc];
      v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v20, v19, v21);
      v24 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v22, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v23, v29 + v26 + 1, v31, v28 + v25 + 128, a5, 5, v10, v11, v10, v11, v10, v11);
      if ((objc_msgSend(a3, "containsObject:", v24) & 1) == 0)
        objc_msgSend(a3, "addObject:", v24);

    }
  }
}

- (void)addModifiedPinyinToArray:(id)a3 connection:(_PR_DB_IO *)a4 fromIndex:(unint64_t)a5 prevIndex:(unint64_t)a6 prevPrevIndex:(unint64_t)a7 startingModificationsAt:(unint64_t)a8 inBuffer:(char *)a9 length:(unint64_t)a10 initialSyllableCount:(unint64_t)a11 initialScore:(unint64_t)a12 prevScore:(unint64_t)a13 prevPrevScore:(unint64_t)a14 lastSyllableScore:(unint64_t)a15 couldBeAbbreviatedPinyin:(BOOL)a16
{
  unint64_t v20;
  char *v21;
  unint64_t v22;
  char v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  void *v29;
  __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  PRPinyinString *v35;
  uint64_t v36;
  PRPinyinString *v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t i;
  unint64_t v41;
  id v42;
  void *v43;
  id v44;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  PRPinyinString *v49;
  uint64_t v50;
  PRPinyinString *v51;
  PRPinyinString *v52;
  char *v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;
  __CFString *v59;
  const __CFString *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  PRPinyinString *v64;
  uint64_t v65;
  PRPinyinString *v66;
  AppleSpell *v67;
  char *v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t j;
  unint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  const __CFString *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  PRPinyinString *v80;
  uint64_t v81;
  PRPinyinString *v82;
  PRPinyinString *v83;
  unsigned __int8 *v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  void *v90;
  __CFString *v91;
  const __CFString *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  PRPinyinString *v96;
  uint64_t v97;
  PRPinyinString *v98;
  PRPinyinString *v99;
  uint64_t v100;
  unint64_t k;
  uint64_t v102;
  void *v103;
  __CFString *v104;
  const __CFString *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  PRPinyinString *v109;
  uint64_t v110;
  PRPinyinString *v111;
  unint64_t v112;
  uint64_t v113;
  void *v114;
  __CFString *v115;
  unint64_t v116;
  char *v117;
  uint64_t v118;
  void *v119;
  __CFString *v120;
  const __CFString *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  PRPinyinString *v125;
  uint64_t v126;
  int v127;
  unsigned int v128;
  char *v129;
  unint64_t v130;
  int v131;
  unsigned int v132;
  __CFString *v133;
  __CFString *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  PRPinyinString *v139;
  uint64_t v140;
  const __CFString *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  PRPinyinString *v146;
  void *v147;
  char *v148;
  size_t v149;
  _QWORD *v150;
  uint64_t v151;
  unint64_t v152;
  unint64_t v153;
  unint64_t v154;
  unint64_t v155;
  int v156;
  unsigned int v157;
  BOOL v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  unint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  PRPinyinString *v177;
  uint64_t v178;
  PRPinyinString *v179;
  void *v180;
  unint64_t v181;
  unint64_t v182;
  unint64_t v183;
  unint64_t v184;
  unint64_t v185;
  unsigned __int8 *v186;
  unint64_t v187;
  int v188;
  uint64_t v189;
  unsigned int v190;
  int v191;
  uint64_t v192;
  uint64_t v193;
  unint64_t v194;
  uint64_t v195;
  unint64_t v196;
  uint64_t v197;
  uint64_t v198;
  BOOL v199;
  void *v200;
  PRPinyinString *v201;
  PRPinyinString *v202;
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  unint64_t v206;
  unint64_t v207;
  int v208;
  unint64_t v209;
  uint64_t v211;
  unsigned int v212;
  unint64_t v213;
  int v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  uint64_t v218;
  unint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  BOOL v223;
  void *v224;
  PRPinyinString *v225;
  PRPinyinString *v226;
  unint64_t v227;
  unint64_t v228;
  unint64_t v229;
  uint64_t v230;
  unint64_t v231;
  unint64_t v232;
  char *v233;
  unint64_t v234;
  int v235;
  int v236;
  int v237;
  unsigned int v238;
  int v239;
  int v240;
  int v241;
  int v242;
  int v243;
  int v244;
  unint64_t v245;
  uint64_t v246;
  uint64_t v247;
  unint64_t v248;
  uint64_t v249;
  unint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  BOOL v254;
  PRPinyinString *v255;
  PRPinyinString *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  id v261;
  unint64_t v262;
  uint64_t v263;
  unint64_t v264;
  size_t __na;
  size_t __nb;
  size_t __n;
  uint64_t v268;
  unint64_t v269;
  char *v270;
  unint64_t v271;
  unint64_t v272;
  unsigned __int8 *v273;
  unint64_t v274;
  unint64_t v275;
  unint64_t v276;
  unint64_t v277;
  char *v278;
  char *v279;
  unint64_t v280;
  char *v281;
  unsigned __int8 *v282;
  unint64_t v283;
  void *v284;
  unint64_t v285;
  unint64_t v286;
  unint64_t v287;
  char *v288;
  unsigned __int8 *v289;
  unint64_t v290;
  unint64_t v291;
  uint64_t v292;
  unint64_t v293;
  AppleSpell *v295;
  unint64_t v296;
  unint64_t v297;
  unint64_t v298;
  char *v299;
  char *v300;
  char *v301;
  uint64_t v302;
  unint64_t v303;
  unint64_t v304;
  unint64_t v307;
  char *v308;
  unsigned int v309;
  unsigned __int8 v310;
  uint64_t v311;
  unint64_t v312;
  uint64_t v313;
  uint64_t v314;
  unsigned __int8 __dst[256];
  uint64_t v316;

  v20 = a14;
  v21 = a9;
  v22 = a10;
  v316 = *MEMORY[0x1E0C80C00];
  v313 = 0;
  v314 = 0;
  v311 = 0;
  v312 = 0;
  v310 = 0;
  v261 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("en_CN"));
  v23 = 0;
  v309 = 0;
  v308 = 0;
  v304 = a5;
  v295 = self;
  v291 = a6;
  if (a7 < a5 && a7 < a6)
  {
    v23 = 0;
    v24 = &a9[a7];
    v298 = a10 - a7;
    v25 = a10 - a7 - 14;
    v26 = 14;
    v278 = &a9[a7];
    v285 = a7;
    do
    {
      v27 = a7 + v26;
      if (a7 + v26 <= v22)
      {
        v311 = 0;
        v312 = 0;
        v313 = 0;
        v28 = -[AppleSpell englishStringFromWordBuffer:length:connection:](self, "englishStringFromWordBuffer:length:connection:", v24, v26, a4);
        if (v28)
        {
          v29 = v28;
          if (v298 == v26
            || findPinyin((unsigned __int8 *)&v24[v26], v25, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, 0)&& v298 - v313 == v26)
          {
            if (a7)
            {
              v30 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a9, a7, 12);
              v31 = &stru_1EA8D8440;
            }
            else
            {
              v31 = &stru_1EA8D8440;
              v30 = &stru_1EA8D8440;
            }
            if (v27 < v22)
              v31 = (const __CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v24[v26], v25, 12);
            v32 = objc_msgSend(v29, "length");
            v33 = -[__CFString length](v30, "length");
            v34 = -[__CFString length](v30, "length");
            v35 = [PRPinyinString alloc];
            v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v30, v29, v31);
            v260 = v33;
            v257 = v33;
            v22 = a10;
            v37 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v35, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v36, a11 - 1 + v312, v310, a14 + 128 + v311, a10, 5, v257, v26, v34, v32, v260, v26);
            if ((objc_msgSend(a3, "containsObject:", v37) & 1) == 0)
              objc_msgSend(a3, "addObject:", v37);

            v23 = 1;
            a5 = v304;
            self = v295;
            v24 = v278;
            a7 = v285;
          }
        }
      }
      --v26;
      ++v25;
    }
    while (v26 > 2);
    v21 = a9;
    a6 = v291;
    v20 = a14;
  }
  if (a7 + 2 < a6)
  {
    v38 = a6 - 1;
    if (next_pinyin((unsigned __int8 *)&v21[a7], a6 - 1 - a7, 0, 0, (unsigned __int8 **)&v308, &v309))
    {
      if (&v21[v38] == v308)
      {
        v299 = &v21[v38];
        v271 = v20 + 128;
        v274 = a6 - 1;
        v279 = &v21[a6];
        v39 = v22 - a6 - 13;
        v286 = a6 - v22 + 13;
        for (i = 14; i > 2; --i)
        {
          v41 = a6 + i - 1;
          if (v41 <= v22)
          {
            v311 = 0;
            v312 = 0;
            v313 = 0;
            v42 = -[AppleSpell englishStringFromWordBuffer:length:connection:](self, "englishStringFromWordBuffer:length:connection:", v299, i, a4);
            if (v42)
            {
              v43 = v42;
              if (v286 + i == 14
                || findPinyin((unsigned __int8 *)&v279[i - 1], v39, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, 0)&& v286 + i + v313 == 14)
              {
                v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v21, v38, 12);
                v45 = &stru_1EA8D8440;
                if (v41 < v22)
                  v45 = (const __CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v279[i - 1], v39, 12);
                v46 = objc_msgSend(v43, "length");
                v47 = objc_msgSend(v44, "length");
                v48 = objc_msgSend(v44, "length");
                v49 = [PRPinyinString alloc];
                v50 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v44, v43, v45);
                v51 = v49;
                v22 = a10;
                v52 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v51, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v50, v312 + a11, v310, v271 + v309 + v311, a10, 5, v47, i, v48, v46, v47, i);
                if ((objc_msgSend(a3, "containsObject:", v52) & 1) == 0)
                  objc_msgSend(a3, "addObject:", v52);

                v23 = 1;
                a5 = v304;
                v21 = a9;
                self = v295;
                v38 = v274;
              }
            }
          }
          ++v39;
          a6 = v291;
        }
      }
    }
  }
  if (a6 < a5)
  {
    v53 = &v21[a6];
    v54 = v22 - a6;
    v55 = v22 - a6 - 14;
    v56 = 14;
    v300 = v53;
    v280 = v22 - a6;
    do
    {
      if (a6 + v56 <= v22)
      {
        v311 = 0;
        v312 = 0;
        v313 = 0;
        v57 = -[AppleSpell englishStringFromWordBuffer:length:connection:](v295, "englishStringFromWordBuffer:length:connection:", v53, v56, a4);
        if (v57)
        {
          v58 = (void *)v57;
          if (v54 == v56
            || findPinyin((unsigned __int8 *)&v53[v56], v55, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, 0)&& v54 - v313 == v56)
          {
            if (a6)
            {
              v59 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a9, a6, 12);
              v60 = &stru_1EA8D8440;
            }
            else
            {
              v60 = &stru_1EA8D8440;
              v59 = &stru_1EA8D8440;
            }
            if (a6 + v56 < v22)
              v60 = (const __CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v53[v56], v55, 12);
            v61 = objc_msgSend(v58, "length");
            v62 = -[__CFString length](v59, "length");
            v63 = -[__CFString length](v59, "length");
            v64 = [PRPinyinString alloc];
            v65 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v59, v58, v60);
            v258 = v63;
            v22 = a10;
            v66 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v64, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v65, v312 + a11, v310, a13 + 128 + v311, a10, 5, v62, v56, v258, v61, v62, v56);
            if ((objc_msgSend(a3, "containsObject:", v66) & 1) == 0)
              objc_msgSend(a3, "addObject:", v66);

            v23 = 1;
            v53 = v300;
            a5 = v304;
            a6 = v291;
            v54 = v280;
          }
        }
      }
      --v56;
      ++v55;
    }
    while (v56 > 2);
  }
  v67 = v295;
  if (a6 + 2 >= a5)
  {
    v68 = a9;
  }
  else
  {
    v68 = a9;
    v69 = a5 - 1;
    if (next_pinyin((unsigned __int8 *)&a9[a6], a5 - 1 - a6, 0, 0, (unsigned __int8 **)&v308, &v309)
      && &a9[v69] == v308)
    {
      v301 = &a9[v69];
      v275 = a5 - 1;
      v281 = &a9[a5];
      v70 = v22 - a5 - 13;
      v287 = a5 - v22 + 13;
      for (j = 14; j > 2; --j)
      {
        v72 = a5 + j - 1;
        if (v72 <= v22)
        {
          v311 = 0;
          v312 = 0;
          v313 = 0;
          v73 = -[AppleSpell englishStringFromWordBuffer:length:connection:](v67, "englishStringFromWordBuffer:length:connection:", v301, j, a4);
          if (v73)
          {
            v74 = (void *)v73;
            if (v287 + j == 14
              || findPinyin((unsigned __int8 *)&v281[j - 1], v70, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, 0)&& v287 + j + v313 == 14)
            {
              v75 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v68, v69, 12);
              v76 = &stru_1EA8D8440;
              if (v72 < v22)
                v76 = (const __CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v281[j - 1], v70, 12);
              v77 = objc_msgSend(v74, "length");
              v78 = objc_msgSend(v75, "length");
              v79 = objc_msgSend(v75, "length");
              v80 = [PRPinyinString alloc];
              v81 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v75, v74, v76);
              v82 = v80;
              v22 = a10;
              v83 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v82, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v81, a11 + 1 + v312, v310, a13 + 128 + v309 + v311, a10, 5, v78, j, v79, v77, v78, j);
              if ((objc_msgSend(a3, "containsObject:", v83) & 1) == 0)
                objc_msgSend(a3, "addObject:", v83);

              v23 = 1;
              a5 = v304;
              v68 = a9;
              v67 = v295;
              v69 = v275;
            }
          }
        }
        ++v70;
      }
    }
  }
  v84 = (unsigned __int8 *)&v68[a5];
  v85 = a8;
  v272 = a11 + 1;
  v276 = a12 + 128;
  v302 = v22 - a5;
  v86 = v22 - a5 - 14;
  v87 = 14;
  v282 = v84;
  do
  {
    v88 = a5 + v87;
    if (a5 + v87 <= v22)
    {
      v311 = 0;
      v312 = 0;
      v313 = 0;
      v89 = -[AppleSpell englishStringFromWordBuffer:length:connection:](v67, "englishStringFromWordBuffer:length:connection:", v84, v87, a4);
      if (v89)
      {
        v90 = (void *)v89;
        if (v302 == v87
          || findPinyin(&v84[v87], v86, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, 0)&& v302 - v313 == v87)
        {
          if (a5)
          {
            v91 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a9, a5, 12);
            v92 = &stru_1EA8D8440;
          }
          else
          {
            v92 = &stru_1EA8D8440;
            v91 = &stru_1EA8D8440;
          }
          if (v88 < v22)
            v92 = (const __CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v84[v87], v86, 12);
          v93 = objc_msgSend(v90, "length");
          v94 = -[__CFString length](v91, "length");
          v95 = -[__CFString length](v91, "length");
          v96 = [PRPinyinString alloc];
          v97 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v91, v90, v92);
          v98 = v96;
          v22 = a10;
          v99 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v98, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v97, v272 + v312, v310, v276 + v311, a10, 5, v94, v87, v95, v93, v94, v87);
          if ((objc_msgSend(a3, "containsObject:", v99) & 1) == 0)
            objc_msgSend(a3, "addObject:", v99);

          v23 = 1;
          a5 = v304;
          v85 = a8;
          v67 = v295;
          v84 = v282;
        }
      }
    }
    --v87;
    ++v86;
  }
  while (v87 > 2);
  if (v85 != a5)
  {
    v288 = &a9[v85];
    v269 = v22 - v85;
    v100 = v22 - v85 - 14;
    for (k = 14; k > 2; --k)
    {
      if (v85 + k <= v22)
      {
        v311 = 0;
        v312 = 0;
        v313 = 0;
        v102 = -[AppleSpell englishStringFromWordBuffer:length:connection:](v67, "englishStringFromWordBuffer:length:connection:", v288, k, a4);
        if (v102)
        {
          v103 = (void *)v102;
          if (v269 == k
            || findPinyin((unsigned __int8 *)&v288[k], v100, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, 0)&& v269 - v313 == k)
          {
            if (v85)
            {
              v104 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a9, v85, 12);
              v105 = &stru_1EA8D8440;
            }
            else
            {
              v105 = &stru_1EA8D8440;
              v104 = &stru_1EA8D8440;
            }
            if (v85 + k < v22)
              v105 = (const __CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v288[k], v100, 12);
            v106 = objc_msgSend(v103, "length");
            v107 = -[__CFString length](v104, "length");
            v108 = -[__CFString length](v104, "length");
            v109 = [PRPinyinString alloc];
            v110 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v104, v103, v105);
            v259 = v108;
            v22 = a10;
            v111 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v109, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v110, a11 + 2 + v312, v310, v276 + a15 + v311, a10, 5, v107, k, v259, v106, v107, k);
            if ((objc_msgSend(a3, "containsObject:", v111) & 1) == 0)
              objc_msgSend(a3, "addObject:", v111);

            v23 = 1;
            a5 = v304;
            v85 = a8;
            v67 = v295;
            v84 = v282;
          }
        }
      }
      ++v100;
    }
  }
  if ((v23 & 1) == 0)
  {
    v112 = a5 + 2;
    if (a5 + 2 <= v22
      && (v311 = 0,
          v312 = 0,
          v313 = 0,
          (v113 = -[AppleSpell englishStringFromWordBuffer:length:connection:](v67, "englishStringFromWordBuffer:length:connection:", v84, 2, a4)) != 0)&& ((v114 = (void *)v113, v112 == v22)|| findPinyin(v84 + 2, v302 - 2, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310,
                          &v311,
                          0,
                          0,
                          0,
                          0,
                          0)
       && v313 + v112 == v22))
    {
      if (a5)
        v115 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a9, a5, 12);
      else
        v115 = &stru_1EA8D8440;
      if (v112 >= v22)
        v121 = &stru_1EA8D8440;
      else
        v121 = (const __CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v84 + 2, v302 - 2, 12);
      v122 = objc_msgSend(v114, "length");
      v123 = -[__CFString length](v115, "length");
      v124 = -[__CFString length](v115, "length");
      v125 = [PRPinyinString alloc];
      v126 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v115, v114, v121);
    }
    else
    {
      if (v85 == a5
        || (v116 = v85 + 2, v85 + 2 > v22)
        || (v311 = 0,
            v312 = 0,
            v117 = &a9[v85],
            v313 = 0,
            (v118 = -[AppleSpell englishStringFromWordBuffer:length:connection:](v67, "englishStringFromWordBuffer:length:connection:", &a9[v85], 2, a4)) == 0)|| (v119 = (void *)v118, v116 != v22)&& (!findPinyin((unsigned __int8 *)v117 + 2, v22 - v85 - 2, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310,
                             &v311,
                             0,
                             0,
                             0,
                             0,
                             0)
         || v313 + v116 != v22))
      {
        if (a5 + 4 < v22
          && a5 + 14 >= v22
          && -[AppleSpell validateWordPrefixBuffer:length:connection:](v67, "validateWordPrefixBuffer:length:connection:", v84, v302, a4)&& ((v127 = *v84, (v127 - 65) < 0x1A)|| (v127 - 192) < 0x17|| (v127 - 216) < 7|| (v128 = v127 - 138, v128 <= 0x15) && ((1 << v128) & 0x200015) != 0|| !-[AppleSpell checkWordBuffer:length:languageObject:index:](v67, "checkWordBuffer:length:languageObject:index:", v84, v302, v261, 1))&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:](v67, "checkNegativeWordBuffer:length:languageObject:",
                v84,
                v302,
                v261))
        {
          if (a5)
            v134 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a9, a5, 12);
          else
            v134 = &stru_1EA8D8440;
          v135 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v84, v302, 12);
          v136 = objc_msgSend(v135, "length");
          v137 = -[__CFString length](v134, "length");
          v138 = -[__CFString length](v134, "length");
          v139 = [PRPinyinString alloc];
          v140 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v139, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v134, v135, &stru_1EA8D8440), a11 + 2, 1, v276 + a15, v22, 5, v137, v302, v138, v136, v137, v302);
        }
        else
        {
          if (v85 + 4 >= v22)
            goto LABEL_155;
          if (v85 + 14 < v22)
            goto LABEL_155;
          v129 = &a9[v85];
          v130 = v22 - v85;
          if (!-[AppleSpell validateWordPrefixBuffer:length:connection:](v67, "validateWordPrefixBuffer:length:connection:", &a9[v85], v22 - v85, a4))goto LABEL_155;
          v131 = *v129;
          if ((v131 - 65) >= 0x1A
            && (v131 - 192) >= 0x17
            && (v131 - 216) >= 7)
          {
            v132 = v131 - 138;
            if ((v132 > 0x15 || ((1 << v132) & 0x200015) == 0)
              && -[AppleSpell checkWordBuffer:length:languageObject:index:](v67, "checkWordBuffer:length:languageObject:index:", v129, v22 - v85, v261, 1))
            {
              goto LABEL_155;
            }
          }
          if (-[AppleSpell checkNegativeWordBuffer:length:languageObject:](v67, "checkNegativeWordBuffer:length:languageObject:", v129, v22 - v85, v261))
          {
            goto LABEL_155;
          }
          if (v85)
            v133 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a9, v85, 12);
          else
            v133 = &stru_1EA8D8440;
          v142 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v129, v130, 12);
          v143 = objc_msgSend(v142, "length");
          v144 = -[__CFString length](v133, "length");
          v145 = -[__CFString length](v133, "length");
          v146 = [PRPinyinString alloc];
          v140 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v146, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v133, v142, &stru_1EA8D8440), a11 + 2, 1, v276 + a15, v22, 5, v144, v130, v145, v143, v144, v130);
        }
        goto LABEL_152;
      }
      if (v85)
        v120 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a9, v85, 12);
      else
        v120 = &stru_1EA8D8440;
      if (v116 >= v22)
        v141 = &stru_1EA8D8440;
      else
        v141 = (const __CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v117 + 2, v22 - a8 - 2, 12);
      v122 = objc_msgSend(v119, "length");
      v123 = -[__CFString length](v120, "length");
      v124 = -[__CFString length](v120, "length");
      v125 = [PRPinyinString alloc];
      v126 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v120, v119, v141);
    }
    v140 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v125, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v126, v272 + v312, v310, v276 + a15 + v311, v22, 5, v123, 2, v124, v122, v123, 2);
LABEL_152:
    v147 = (void *)v140;
    if ((objc_msgSend(a3, "containsObject:", v140) & 1) == 0)
      objc_msgSend(a3, "addObject:", v147);

    a5 = v304;
    v85 = a8;
    v67 = v295;
  }
LABEL_155:
  v148 = a9;
  -[AppleSpell addSpecialModifiedPinyinToArray:inBuffer:length:atEnd:](v67, "addSpecialModifiedPinyinToArray:inBuffer:length:atEnd:", a3, a9, v22, 0);
  v307 = v22 + 1;
  if (v22 + 1 > 1)
    v149 = v22 + 1;
  else
    v149 = 1;
  memcpy(__dst, a9, v149);
  v150 = malloc_type_malloc(8 * v22, 0x100004000313F17uLL);
  if (v22 >= 3)
  {
    if (v85 <= a5)
      v151 = 0;
    else
      v151 = -1;
    v268 = v151;
    v152 = v85 + 5;
    v277 = v85 + 5;
    v283 = ((__PAIR128__(v85, a5) - v85) >> 64) + 1;
    v296 = (__PAIR128__(v85, a5) - v85) >> 64;
    if (v296 < v85 + 5 && v283 < a10)
    {
      v289 = &__dst[a5];
      v153 = ((__PAIR128__(v85, a5) - v85) >> 64) + 1;
      v154 = (__PAIR128__(v85, a5) - v85) >> 64;
      while (1)
      {
        v155 = v153;
        v156 = v148[v154];
        v157 = v148[v153];
        v158 = (v156 - 65) >= 0x1A && v157 - 65 >= 0x1A;
        if (!v158)
          goto LABEL_213;
        if ((v156 - 97) <= 0x19 && v157 >= 0x61 && v157 <= 0x7A)
          break;
LABEL_211:
        if (v155 < v152)
        {
          v153 = v155 + 1;
          v154 = v155;
          if (v155 + 1 < a10)
            continue;
        }
        goto LABEL_213;
      }
      __dst[v154] = v157;
      __dst[v153] = v156;
      if (findPinyin(v289, v302, 0, 0, 0, 0, 0, &v314, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, v150)&& v313 + a5 == a10
        && (!v310 || v155 < v314 + a5))
      {
        if (v312)
        {
          v159 = 0;
          v160 = 0;
          v161 = 0;
          v162 = 0x7FFFFFFFFFFFFFFFLL;
          v163 = v304;
          while (1)
          {
            v164 = v150[v159];
            v165 = v164 + v163;
            if (v154 < v163)
              goto LABEL_184;
            if (v155 < v165)
            {
              v160 = v150[v159];
              v166 = v163;
              goto LABEL_185;
            }
            if (v154 >= v165)
            {
LABEL_184:
              v166 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else
            {
              v160 = v150[v159 + 1];
              v161 = v150[v159];
              v162 = v163;
              v166 = v164 + v163;
            }
LABEL_185:
            if (v166 == 0x7FFFFFFFFFFFFFFFLL)
            {
              ++v159;
              v163 += v164;
              if (v159 < v312)
                continue;
            }
            goto LABEL_204;
          }
        }
        v161 = 0;
        v160 = 0;
        v162 = 0x7FFFFFFFFFFFFFFFLL;
        v166 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_204:
        __na = v162;
        v175 = v161;
        v176 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", __dst, a10, 12);
        v177 = [PRPinyinString alloc];
        v178 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:originalAdditionalSyllableRange:](v177, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:originalAdditionalSyllableRange:", v176, v312 + a11, v310, v311 + a12, a10, 2, v154, 2, v154, 2, v166, v160, __na, v175);
        goto LABEL_207;
      }
      if (!findPinyin(&__dst[v291], a10 - v291, 0, 0, 0, 0, 0, &v314, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, v150)|| v313 + v291 != a10
        || v310 && v155 >= v314 + v291)
      {
LABEL_210:
        __dst[v154] = v156;
        __dst[v155] = v157;
        goto LABEL_211;
      }
      if (!v312)
      {
        v169 = 0;
        v168 = 0;
        v174 = 0x7FFFFFFFFFFFFFFFLL;
        v170 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_206:
        v263 = v168;
        __nb = v170;
        v176 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", __dst, a10, 12);
        v179 = [PRPinyinString alloc];
        v178 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:originalAdditionalSyllableRange:](v179, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:originalAdditionalSyllableRange:", v176, a11 - 1 + v312, v310, v311 + a13, a10, 2, v154, 2, v154, 2, v174, v169, __nb, v263);
LABEL_207:
        v180 = (void *)v178;
        if ((objc_msgSend(a3, "containsObject:", v178) & 1) == 0)
          objc_msgSend(a3, "addObject:", v180);

        a5 = v304;
        v148 = a9;
        v152 = v277;
        goto LABEL_210;
      }
      v167 = 0;
      v168 = 0;
      v169 = 0;
      v170 = 0x7FFFFFFFFFFFFFFFLL;
      v171 = v291;
      while (1)
      {
        v172 = v150[v167];
        v173 = v172 + v171;
        if (v154 < v171)
          goto LABEL_199;
        if (v155 < v173)
        {
          v174 = v171;
          v169 = v150[v167];
          goto LABEL_200;
        }
        if (v154 >= v173)
        {
LABEL_199:
          v174 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v169 = v150[v167 + 1];
          v174 = v172 + v171;
          v170 = v171;
          v168 = v150[v167];
        }
LABEL_200:
        if (v174 == 0x7FFFFFFFFFFFFFFFLL)
        {
          ++v167;
          v171 += v172;
          if (v167 < v312)
            continue;
        }
        goto LABEL_206;
      }
    }
LABEL_213:
    v181 = a8;
    if (a10 >= 4)
    {
      v182 = a10;
      if (v277 >= a10)
        v183 = a10;
      else
        v183 = v277;
      v184 = v296;
      if (v296 < v183)
      {
        v185 = v304;
        v186 = &__dst[v304];
        v290 = v183;
        v187 = v296;
        do
        {
          v188 = v148[v187];
          if ((v188 - 65) < 0x1A)
            break;
          if ((v188 - 97) <= 0x19)
          {
            v189 = 0;
            v190 = v188 - 97;
            do
            {
              v191 = adjacentMatchesChinese[6 * v190 + v189];
              if ((_BYTE)v191)
              {
                __dst[v187] = v191;
                if (findPinyin(v186, v302, 0, 0, 0, 0, 0, &v314, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, v150))
                {
                  if (v313 + v185 == a10 && (!v310 || v187 < v314 + v185))
                  {
                    if (v312)
                    {
                      v192 = 0;
                      v193 = 0;
                      v194 = v185;
                      do
                      {
                        v195 = v150[v192];
                        v196 = v195 + v194;
                        if (v187 >= v195 + v194)
                          v197 = 0x7FFFFFFFFFFFFFFFLL;
                        else
                          v197 = v194;
                        if (v187 >= v195 + v194)
                          v195 = v193;
                        if (v187 >= v194)
                          v198 = v197;
                        else
                          v198 = 0x7FFFFFFFFFFFFFFFLL;
                        if (v187 >= v194)
                          v193 = v195;
                        v199 = v198 != 0x7FFFFFFFFFFFFFFFLL || ++v192 >= v312;
                        v194 = v196;
                      }
                      while (!v199);
                    }
                    else
                    {
                      v193 = 0;
                      v198 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    v200 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", __dst, a10, 12);
                    v201 = [PRPinyinString alloc];
                    v202 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v201, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v200, v312 + a11, v310, a12 + 12 + v311, a10, 1, v187, 1, v187, 1, v198, v193);
                    if ((objc_msgSend(a3, "containsObject:", v202) & 1) == 0)
                      objc_msgSend(a3, "addObject:", v202);

                    v185 = v304;
                    v181 = a8;
                    v148 = a9;
                  }
                }
              }
              ++v189;
            }
            while (v189 != 6);
            LOBYTE(v188) = v148[v187];
            v184 = v296;
            v183 = v290;
          }
          __dst[v187++] = v188;
        }
        while (v187 < v183);
        v203 = 0;
        v204 = v307;
        v205 = v307 - v185;
        v206 = v184 + 2;
        v262 = v184 + 2;
        v264 = ~v181;
        v182 = a10;
        do
        {
          if (v206 + v203 <= v204)
            v207 = v204;
          else
            v207 = v206 + v203;
          v208 = v148[v184];
          if ((v208 - 65) < 0x1A)
            break;
          if ((v208 - 97) >= 0x1A)
          {
            v213 = v184 + 1;
          }
          else
          {
            v209 = v182;
            if (v204 > v184)
            {
              do
                __dst[v209 + 1] = __dst[v209];
              while (v209-- > v184);
            }
            v211 = 0;
            v270 = &v148[v283 + v203];
            v273 = &__dst[v283 + v203];
            v292 = v203;
            __n = v207 + v264 - (v203 + v268);
            v212 = v208 - 97;
            v297 = v184;
            v213 = v184 + 1;
            do
            {
              v214 = insertionFollowers[6 * v212 + v211];
              if ((_BYTE)v214)
              {
                __dst[v213] = v214;
                if (findPinyin(v186, v205, 0, 0, 0, 0, 0, &v314, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, v150))
                {
                  if (v313 + v304 == v204 && (!v310 || v213 < v314 + v304))
                  {
                    if (v312)
                    {
                      v215 = 0;
                      v216 = 0;
                      v217 = v304;
                      do
                      {
                        v218 = v150[v215];
                        v219 = v218 + v217;
                        v220 = v218 - 1;
                        if (v213 >= v219)
                          v221 = 0x7FFFFFFFFFFFFFFFLL;
                        else
                          v221 = v217;
                        if (v213 >= v219)
                          v220 = v216;
                        if (v213 >= v217)
                          v222 = v221;
                        else
                          v222 = 0x7FFFFFFFFFFFFFFFLL;
                        if (v213 >= v217)
                          v216 = v220;
                        v223 = v222 != 0x7FFFFFFFFFFFFFFFLL || ++v215 >= v312;
                        v217 = v219;
                      }
                      while (!v223);
                    }
                    else
                    {
                      v216 = 0;
                      v222 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    v224 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", __dst, v204, 12);
                    v225 = [PRPinyinString alloc];
                    v226 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v225, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v224, v312 + a11, v310, a12 + 32 + v311, a10, 3, v213, 0, v213, 1, v222, v216);
                    if ((objc_msgSend(a3, "containsObject:", v226) & 1) == 0)
                      objc_msgSend(a3, "addObject:", v226);

                    v182 = a10;
                    v204 = v307;
                  }
                }
              }
              ++v211;
            }
            while (v211 != 6);
            v181 = a8;
            if (v297 < v182)
              memcpy(v273, v270, __n);
            v183 = v290;
            v203 = v292;
            v206 = v262;
          }
          ++v203;
          v184 = v213;
          v158 = v213 >= v183;
          v148 = a9;
        }
        while (!v158);
      }
      v227 = v304;
      if (v182 >= 5)
      {
        v228 = v181 <= 1 ? 1 : v181;
        v303 = v228;
        if (v228 < v277)
        {
          v229 = v228 + 1;
          if (v228 + 1 < a10)
          {
            v230 = 0;
            v293 = a10 - 1;
            v231 = v228;
            do
            {
              v232 = v229;
              v233 = &v148[v231];
              if (v229 <= v307)
                v234 = v307;
              else
                v234 = v229;
              v235 = *v233;
              if ((v235 - 65) < 0x1A)
                break;
              v236 = v148[v231 - 1];
              if ((v236 - 65) < 0x1A)
                break;
              v237 = v148[v229];
              if ((v237 - 65) < 0x1A)
                break;
              if ((v235 - 97) <= 0x19)
              {
                if (v235 == v236
                  || !a16
                  || (v238 = v235 - 97, v239 = adjacentMatchesChinese[6 * (v235 - 97)], v239 == v236)
                  || (v240 = adjacentMatchesChinese[6 * v238 + 1], v240 == v236)
                  || (v241 = adjacentMatchesChinese[6 * v238 + 2], v241 == v236)
                  || (v242 = adjacentMatchesChinese[6 * v238 + 3], v242 == v236)
                  || (v243 = adjacentMatchesChinese[6 * v238 + 4], v243 == v236)
                  || (v244 = adjacentMatchesChinese[6 * v238 + 5], v244 == v236)
                  || v235 == v237
                  || v239 == v237
                  || v240 == v237
                  || v241 == v237
                  || v242 == v237
                  || v243 == v237
                  || v244 == v237)
                {
                  if (v231 < a10)
                  {
                    v245 = v231;
                    do
                    {
                      __dst[v245] = __dst[v245 + 1];
                      ++v245;
                    }
                    while (v245 < a10);
                  }
                  if (findPinyin(&__dst[v304], a10 - 1 - v304, 0, 0, 0, 0, 0, &v314, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, v150)&& v313 + v227 == v293
                    && (!v310 || v231 <= v314 + v227))
                  {
                    if (v312)
                    {
                      v246 = 0;
                      v247 = 0;
                      v248 = v227;
                      do
                      {
                        v249 = v150[v247];
                        v250 = v249 + v248;
                        if (v231 >= v249 + v248)
                          v251 = 0x7FFFFFFFFFFFFFFFLL;
                        else
                          v251 = v248;
                        if (v231 < v249 + v248)
                          v252 = v249 + 1;
                        else
                          v252 = v246;
                        if (v231 >= v248)
                          v253 = v251;
                        else
                          v253 = 0x7FFFFFFFFFFFFFFFLL;
                        if (v231 >= v248)
                          v246 = v252;
                        v254 = v253 != 0x7FFFFFFFFFFFFFFFLL || ++v247 >= v312;
                        v248 = v250;
                      }
                      while (!v254);
                    }
                    else
                    {
                      v246 = 0;
                      v253 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    v284 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", __dst, v293, 12);
                    v255 = [PRPinyinString alloc];
                    v256 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v255, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v284, v312 + a11, v310, a12 + 42 + v311, a10, 4, v231, 1, v231, 0, v253, v246);
                    if ((objc_msgSend(a3, "containsObject:", v256) & 1) == 0)
                      objc_msgSend(a3, "addObject:", v256);

                    v227 = v304;
                    v148 = a9;
                  }
                  if (v231 <= a10)
                    memcpy(&__dst[v231], v233, v234 - (v303 + v230));
                }
              }
              if (v232 >= v277)
                break;
              v229 = v232 + 1;
              ++v230;
              v231 = v232;
            }
            while (v232 + 1 < a10);
          }
        }
      }
    }
  }
  if (v150)
    free(v150);
}

- (void)addModifiedPartialPinyinToArray:(id)a3 connection:(_PR_DB_IO *)a4 fromIndex:(unint64_t)a5 prevIndex:(unint64_t)a6 prevPrevIndex:(unint64_t)a7 prePrevPrevIndex:(unint64_t)a8 startingModificationsAt:(unint64_t)a9 inBuffer:(char *)a10 length:(unint64_t)a11 initialSyllableCount:(unint64_t)a12 initialScore:(unint64_t)a13 prevScore:(unint64_t)a14 prevPrevScore:(unint64_t)a15 lastSyllableScore:(unint64_t)a16
{
  unint64_t v18;
  _PR_DB_IO *v19;
  AppleSpell *v21;
  unint64_t v22;
  char *v23;
  unint64_t v24;
  id v25;
  void *v26;
  __CFString *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  PRPinyinString *v32;
  uint64_t v33;
  PRPinyinString *v34;
  unint64_t v35;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  PRPinyinString *v46;
  uint64_t v47;
  PRPinyinString *v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  __CFString *v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  PRPinyinString *v58;
  uint64_t v59;
  PRPinyinString *v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  PRPinyinString *v71;
  uint64_t v72;
  PRPinyinString *v73;
  unint64_t v74;
  uint64_t v75;
  void *v76;
  __CFString *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  PRPinyinString *v81;
  uint64_t v82;
  PRPinyinString *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  unint64_t v97;
  unsigned int v101;
  unsigned __int8 *v102[2];

  v18 = a6;
  v19 = a4;
  v21 = self;
  v23 = a10;
  v22 = a11;
  if (a8 < a7)
  {
    v24 = a11 - a8;
    if (a11 > a8)
    {
      v25 = -[AppleSpell englishStringFromWordBuffer:length:connection:](self, "englishStringFromWordBuffer:length:connection:", &a10[a8], a11 - a8, a4);
      if (v25)
      {
        v26 = v25;
        if (a8)
          v27 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a10, a8, 12);
        else
          v27 = &stru_1EA8D8440;
        v28 = a3;
        v29 = objc_msgSend(v26, "length");
        v30 = -[__CFString length](v27, "length");
        v31 = -[__CFString length](v27, "length");
        v32 = [PRPinyinString alloc];
        v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v27, v26);
        v93 = v30;
        v89 = v29;
        a3 = v28;
        v84 = v30;
        v22 = a11;
        v34 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v32, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v33, a12 - 2, 0, a15 + 128, a11, 5, v84, v24, v31, v89, v93, v24);
        if ((objc_msgSend(v28, "containsObject:", v34) & 1) == 0)
          objc_msgSend(v28, "addObject:", v34);

        v18 = a6;
        v21 = self;
        v23 = a10;
        v19 = a4;
      }
    }
  }
  v102[0] = 0;
  v101 = 0;
  if (a8 + 2 < a7)
  {
    v35 = a7 - 1;
    if (next_pinyin((unsigned __int8 *)&v23[a8], a7 - 1 - a8, 0, 0, v102, &v101) && &v23[a7 - 1] == (char *)v102[0])
    {
      v37 = v22 - v35;
      v38 = -[AppleSpell englishStringFromWordBuffer:length:connection:](v21, "englishStringFromWordBuffer:length:connection:", &v23[v35], v22 - v35, v19);
      if (v38)
      {
        v39 = (void *)v38;
        v40 = a3;
        v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v23, a7 - 1, 12);
        v42 = v22;
        v43 = objc_msgSend(v39, "length");
        v44 = objc_msgSend(v41, "length");
        v45 = objc_msgSend(v41, "length");
        v46 = [PRPinyinString alloc];
        v85 = v41;
        a3 = v40;
        v47 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v85, v39);
        v90 = v43;
        v22 = v42;
        v48 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v46, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v47, a12 - 1, 0, a15 + v101 + 128, v42, 5, v44, v37, v45, v90, v44, v37);
        if ((objc_msgSend(v40, "containsObject:", v48) & 1) == 0)
          objc_msgSend(v40, "addObject:", v48);

        v18 = a6;
        v21 = self;
        v23 = a10;
        v19 = a4;
      }
    }
  }
  if (a7 < v18)
  {
    v49 = v22 - a7;
    if (v22 > a7)
    {
      v50 = -[AppleSpell englishStringFromWordBuffer:length:connection:](v21, "englishStringFromWordBuffer:length:connection:", &v23[a7], v22 - a7, v19);
      if (v50)
      {
        v51 = (void *)v50;
        if (a7)
          v52 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v23, a7, 12);
        else
          v52 = &stru_1EA8D8440;
        v53 = a3;
        v54 = objc_msgSend(v51, "length");
        v55 = v22;
        v56 = -[__CFString length](v52, "length");
        v57 = -[__CFString length](v52, "length");
        v58 = [PRPinyinString alloc];
        v59 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v52, v51);
        v94 = v56;
        v91 = v54;
        a3 = v53;
        v86 = v56;
        v22 = v55;
        v60 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v58, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v59, a12 - 1, 0, a15 + 128, v55, 5, v86, v49, v57, v91, v94, v49);
        if ((objc_msgSend(v53, "containsObject:", v60) & 1) == 0)
          objc_msgSend(v53, "addObject:", v60);

        v18 = a6;
        v21 = self;
        v23 = a10;
        v19 = a4;
      }
    }
  }
  if (a7 + 2 < v18)
  {
    v61 = v18 - 1;
    if (next_pinyin((unsigned __int8 *)&v23[a7], v18 - 1 - a7, 0, 0, v102, &v101))
    {
      if (&v23[v61] == (char *)v102[0])
      {
        v62 = v22 - v61;
        v63 = -[AppleSpell englishStringFromWordBuffer:length:connection:](v21, "englishStringFromWordBuffer:length:connection:", &v23[v61], v22 - v61, v19);
        if (v63)
        {
          v64 = (void *)v63;
          v65 = a3;
          v66 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v23, v18 - 1, 12);
          v67 = v22;
          v68 = objc_msgSend(v64, "length");
          v69 = objc_msgSend(v66, "length");
          v70 = objc_msgSend(v66, "length");
          v71 = [PRPinyinString alloc];
          v87 = v66;
          a3 = v65;
          v72 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v87, v64);
          v92 = v68;
          v22 = v67;
          v73 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v71, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v72, a12, 0, a15 + v101 + 128, v67, 5, v69, v62, v70, v92, v69, v62);
          if ((objc_msgSend(v65, "containsObject:", v73) & 1) == 0)
            objc_msgSend(v65, "addObject:", v73);

          v18 = a6;
          v21 = self;
          v23 = a10;
          v19 = a4;
        }
      }
    }
  }
  v74 = v22 - v18;
  if (v22 > v18)
  {
    v75 = -[AppleSpell englishStringFromWordBuffer:length:connection:](v21, "englishStringFromWordBuffer:length:connection:", &v23[v18], v22 - v18, v19);
    if (v75)
    {
      v76 = (void *)v75;
      v96 = a3;
      v97 = v22;
      if (v18)
        v77 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v23, v18, 12);
      else
        v77 = &stru_1EA8D8440;
      v78 = objc_msgSend(v76, "length");
      v79 = -[__CFString length](v77, "length");
      v80 = -[__CFString length](v77, "length");
      v81 = [PRPinyinString alloc];
      v82 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v77, v76);
      v95 = v79;
      v88 = v79;
      v22 = v97;
      v83 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v81, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v82, a12, 0, a14 + 128, v97, 5, v88, v74, v80, v78, v95, v74);
      a3 = v96;
      if ((objc_msgSend(v96, "containsObject:", v83) & 1) == 0)
        objc_msgSend(v96, "addObject:", v83);

      v23 = a10;
    }
  }
  -[AppleSpell addSpecialModifiedPinyinToArray:inBuffer:length:atEnd:](v21, "addSpecialModifiedPinyinToArray:inBuffer:length:atEnd:", a3, v23, v22, 1);
}

- (id)_primitiveRetainedAlternativesForPinyinInputString:(id)a3
{
  id v5;
  void *v6;
  CFIndex v7;
  void *v8;
  void *v9;
  CFIndex Bytes;
  int v11;
  CFIndex v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unsigned __int8 *v39;
  unsigned __int8 *v40;
  uint64_t v41;
  CFIndex usedBufLen;
  UInt8 v43[128];
  UInt8 buffer[256];
  uint64_t v45;
  CFRange v46;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = 0;
  usedBufLen = 0;
  v39 = 0;
  v40 = 0;
  v37 = 0;
  v38 = 0;
  v35 = 0;
  v36 = 0;
  v33 = 0;
  v34 = 0;
  v31 = 0;
  v32 = 0;
  v29 = 0;
  v30 = 0;
  v28 = 0;
  v7 = objc_msgSend(a3, "length");
  v8 = -[AppleSpell databaseConnectionForLanguageObject:](self, "databaseConnectionForLanguageObject:", +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("en_CN")));
  if (v7)
  {
    v9 = v8;
    v46.location = 0;
    v46.length = v7;
    Bytes = CFStringGetBytes((CFStringRef)a3, v46, 0x500u, 0, 0, buffer, 254, &usedBufLen);
    v11 = 0;
    if (v7 == Bytes)
    {
      v12 = usedBufLen;
      buffer[usedBufLen] = 0;
      v11 = isFullOrAbbreviatedPinyin((uint64_t)buffer, v12, 0, &v34);
      if (findPinyin(buffer, usedBufLen, 0, 1, &v41, &v40, &v39, &v38, &v37, &v36, &v35, &v28, &v30, &v29, &v33, &v32, &v31, 0))
      {
        if (v37 && v37 < usedBufLen)
        {
          LOBYTE(v22) = v11;
          -[AppleSpell addModifiedPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:couldBeAbbreviatedPinyin:](self, "addModifiedPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:couldBeAbbreviatedPinyin:", v6, v9, v38, v39, v40, buffer, usedBufLen, v35 - 1, v33, v32, v31, v30 - v33, v22);
          if (v36 && v36 < usedBufLen)
          {
            LOBYTE(v23) = v11;
            -[AppleSpell addModifiedPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:couldBeAbbreviatedPinyin:](self, "addModifiedPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:couldBeAbbreviatedPinyin:", v6, v9, v38, v39, v40, buffer, usedBufLen, v35 - 1, v33, v32, v31, v29 - v33, v23);
          }
        }
        else if (v28)
        {
          -[AppleSpell addModifiedPartialPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:prePrevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:](self, "addModifiedPartialPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:prePrevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:", v6, v9, v38, v39, v40, v41, v37, buffer, usedBufLen, v35 - 1, v33, v32, v31, v30 - v33);
        }
      }
      else
      {
        LOBYTE(v22) = v11;
        -[AppleSpell addModifiedPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:couldBeAbbreviatedPinyin:](self, "addModifiedPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:couldBeAbbreviatedPinyin:", v6, v9, 0, 0, 0, buffer, usedBufLen, 0, 0, 0, 0, 0, v22);
      }
    }
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v6, "sortWithOptions:usingComparator:", 16, &__block_literal_global_9);
  if (objc_msgSend(v6, "count"))
  {
    v35 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 0), "syllableCount");
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v6);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "syllableCount");
          if (v19 <= v35 || objc_msgSend(v18, "numberOfNonPinyinRanges"))
          {
            if (!v11
              || (v20 = objc_msgSend(v18, "syllableCount"), v20 < v34)
              || objc_msgSend(v18, "numberOfNonPinyinRanges"))
            {
              objc_msgSend(v13, "addObject:", v18);
            }
          }
        }
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v43, 16);
      }
      while (v15);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __74__AppleSpell_Chinese___primitiveRetainedAlternativesForPinyinInputString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend(a2, "syllableCount");
  v6 = objc_msgSend(a3, "syllableCount");
  v7 = objc_msgSend(a2, "score");
  v8 = objc_msgSend(a3, "score");
  v9 = -1;
  if (v5 < v6)
    v10 = -1;
  else
    v10 = 1;
  if (v7 >= v8)
    v9 = 1;
  if (v7 == v8)
    v9 = 0;
  if (v5 == v6)
    return v9;
  else
    return v10;
}

- (unint64_t)_getSplitIndexes:(unint64_t *)a3 maxCount:(unint64_t)a4 forPinyinInputString:(id)a5
{
  CFIndex v8;
  CFIndex v9;
  CFIndex Bytes;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  UInt8 *v14;
  unsigned __int8 *v15;
  unsigned int v17;
  BOOL v18;
  BOOL v19;
  unsigned int v20;
  BOOL v21;
  int v22;
  BOOL v23;
  int v24;
  unsigned int v26;
  unint64_t v28;
  CFIndex usedBufLen;
  unsigned __int8 *v30;
  UInt8 buffer[256];
  uint64_t v32;
  CFRange v33;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a5, "length");
  v28 = 0;
  if (!v8)
    return 0;
  v9 = v8;
  usedBufLen = 0;
  v30 = 0;
  v33.location = 0;
  v33.length = v8;
  Bytes = CFStringGetBytes((CFStringRef)a5, v33, 0x500u, 0, 0, buffer, 254, &usedBufLen);
  v11 = 0;
  if (v9 == Bytes)
  {
    findPinyin(buffer, usedBufLen, 0, 1, 0, 0, 0, 0, &v28, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    v11 = 0;
    v13 = v28;
    v12 = usedBufLen;
    if (v28 < usedBufLen)
    {
      v11 = 0;
      while (1)
      {
        v14 = &buffer[v13];
        v15 = next_pinyin(&buffer[v13], v12 - v13, 0, 0, &v30, 0);
        v12 = usedBufLen;
        if (v15)
        {
          if (v30 > v14 + 1 && v30 < &buffer[usedBufLen])
            break;
        }
        if (++v13 < usedBufLen)
        {
          v17 = *v14;
          v18 = v17 <= 0xF7 && v17 - 97 >= 0x1A;
          v19 = v18 && v17 - 223 >= 0x18;
          if (!v19
            || ((v20 = v17 - 154, v21 = v20 > 4, v22 = (1 << v20) & 0x15, !v21) ? (v23 = v22 == 0) : (v23 = 1), !v23))
          {
            v24 = buffer[v13];
            if ((v24 - 65) < 0x1A || (v24 - 192) < 0x17)
              goto LABEL_32;
            if ((v24 - 216) < 7)
              goto LABEL_32;
            v26 = v24 - 138;
            if (v26 <= 0x15 && ((1 << v26) & 0x200015) != 0)
              goto LABEL_32;
          }
        }
LABEL_33:
        if (v13 >= v12)
          return v11;
      }
      v13 = v30 - buffer;
LABEL_32:
      a3[v11++] = v13;
      if (v11 >= a4)
        return v11;
      goto LABEL_33;
    }
  }
  return v11;
}

- (id)_pinyinStringByCombiningPinyinString:(id)a3 withPinyinString:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  PRPinyinString *v13;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  char *v29;
  char *v30;
  char *v31;
  _QWORD *v32;
  _QWORD *v33;
  char *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  _QWORD *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  char *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL4 v60;
  uint64_t v61;

  if ((objc_msgSend(a3, "lastSyllableIsPartial") & 1) != 0
    || (v6 = objc_msgSend(a3, "originalLength"), v6 != objc_msgSend(a3, "originalCheckedLength")))
  {
    v13 = 0;
  }
  else
  {
    v58 = objc_msgSend(a3, "length");
    v61 = objc_msgSend(a3, "originalLength");
    v7 = objc_msgSend(a3, "numberOfModifications");
    v8 = objc_msgSend(a4, "numberOfModifications");
    v9 = v8 + v7;
    v10 = (void *)objc_msgSend(a3, "string");
    v52 = objc_msgSend(a4, "string");
    v60 = 0;
    if (v7 && v8)
      v60 = objc_msgSend(a3, "typeOfModificationAtIndex:", v7 - 1) == 5
         && objc_msgSend(a4, "typeOfModificationAtIndex:", 0) == 5
         && (v11 = objc_msgSend(a3, "finalRangeForModificationAtIndex:", v7 - 1), v11 + v12 == v58)
         && objc_msgSend(a4, "finalRangeForModificationAtIndex:", 0) == 0;
    if (v9)
    {
      v59 = v8;
      v50 = v10;
      v15 = malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
      v51 = v8 + v7;
      v16 = malloc_type_malloc(16 * v9, 0x1000040451B5BE8uLL);
      v53 = malloc_type_malloc(16 * v9, 0x1000040451B5BE8uLL);
      v55 = malloc_type_malloc(16 * v9, 0x1000040451B5BE8uLL);
      v56 = (char *)malloc_type_malloc(16 * v9, 0x1000040451B5BE8uLL);
      if (v7)
      {
        v17 = 0;
        v18 = v56 + 8;
        v19 = v16 + 1;
        v20 = v55 + 1;
        v21 = v53 + 1;
        do
        {
          v15[v17] = objc_msgSend(a3, "typeOfModificationAtIndex:", v17);
          *(v19 - 1) = objc_msgSend(a3, "originalRangeForModificationAtIndex:", v17);
          *v19 = v22;
          *(v21 - 1) = objc_msgSend(a3, "finalRangeForModificationAtIndex:", v17);
          *v21 = v23;
          *(v20 - 1) = objc_msgSend(a3, "originalSyllableRangeForModificationAtIndex:", v17);
          *v20 = v24;
          *(v18 - 1) = objc_msgSend(a3, "originalAdditionalSyllableRangeForModificationAtIndex:", v17);
          *v18 = v25;
          ++v17;
          v18 += 2;
          v19 += 2;
          v20 += 2;
          v21 += 2;
        }
        while (v7 != v17);
      }
      if (v59)
      {
        v26 = 0;
        v27 = 16 * v7;
        v28 = v15;
        v29 = v56 + 8;
        v30 = (char *)(v55 + 1);
        v49 = v16;
        v31 = (char *)(v16 + 1);
        v32 = v53;
        v54 = v28;
        v33 = &v28[v7];
        do
        {
          v33[v26] = objc_msgSend(a4, "typeOfModificationAtIndex:", v26);
          v34 = &v31[v27];
          *((_QWORD *)v34 - 1) = objc_msgSend(a4, "originalRangeForModificationAtIndex:", v26) + v61;
          *(_QWORD *)v34 = v35;
          v36 = &v32[(unint64_t)v27 / 8];
          v38 = objc_msgSend(a4, "finalRangeForModificationAtIndex:", v26) + v58;
          *v36 = v38;
          v36[1] = v37;
          if (v60)
          {
            v39 = v36 + 1;
            if (v26)
              v39 = &v32[(unint64_t)v27 / 8];
            else
              v38 = v37;
            *v39 = v38 + 1;
          }
          v40 = &v30[v27];
          v41 = objc_msgSend(a4, "originalSyllableRangeForModificationAtIndex:", v26);
          *((_QWORD *)v40 - 1) = v41;
          *(_QWORD *)v40 = v42;
          if (v41 != 0x7FFFFFFFFFFFFFFFLL)
            *((_QWORD *)v40 - 1) = v41 + v61;
          v43 = &v29[v27];
          v44 = objc_msgSend(a4, "originalAdditionalSyllableRangeForModificationAtIndex:", v26);
          *((_QWORD *)v43 - 1) = v44;
          *(_QWORD *)v43 = v45;
          if (v44 != 0x7FFFFFFFFFFFFFFFLL)
            *((_QWORD *)v43 - 1) = v44 + v61;
          ++v26;
          v32 += 2;
          v29 += 16;
          v30 += 16;
          v31 += 16;
        }
        while (v59 != v26);
        v10 = v50;
        v9 = v51;
        v46 = v56;
        v47 = v53;
        v15 = v54;
        v16 = v49;
      }
      else
      {
        v10 = v50;
        v9 = v51;
        v46 = v56;
        v47 = v53;
      }
    }
    else
    {
      v46 = 0;
      v55 = 0;
      v47 = 0;
      v16 = 0;
      v15 = 0;
    }
    v57 = v46;
    if (v60)
      v48 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v10, v52);
    else
      v48 = objc_msgSend(v10, "stringByAppendingString:", v52);
    v13 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:originalCheckedLength:numberOfModifications:modificationTypes:originalModificationRanges:finalModificationRanges:originalSyllableRanges:originalAdditionalSyllableRanges:]([PRPinyinString alloc], "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:originalCheckedLength:numberOfModifications:modificationTypes:originalModificationRanges:finalModificationRanges:originalSyllableRanges:originalAdditionalSyllableRanges:", v48, objc_msgSend(a4, "syllableCount") + objc_msgSend(a3, "syllableCount"), objc_msgSend(a4, "lastSyllableIsPartial"), objc_msgSend(a4, "score") + objc_msgSend(a3, "score"), objc_msgSend(a4, "originalLength") + objc_msgSend(a3, "originalLength"), objc_msgSend(a4, "originalCheckedLength") + objc_msgSend(a3, "originalCheckedLength"), v9, v15, v16, v47, v55, v57);
    if (v15)
      free(v15);
    if (v16)
      free(v16);
    if (v47)
      free(v47);
    if (v55)
      free(v55);
    if (v57)
      free(v57);
  }
  return v13;
}

- (id)_retainedAlternativesByCombiningAlternatives:(id)a3 withAlternatives:(id)a4 andAddingAlternatives:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v30 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = a3;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v12);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v36, v45, 16, v30);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v37;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v37 != v16)
                objc_enumerationMutation(a4);
              v18 = -[AppleSpell _pinyinStringByCombiningPinyinString:withPinyinString:](self, "_pinyinStringByCombiningPinyinString:withPinyinString:", v13, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v17));
              if (v18)
                objc_msgSend(v8, "addObject:", v18);
              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          }
          while (v15);
        }
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v10);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = v30;
  v20 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v32, v44, 16, v30);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v23++));
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v21);
  }
  objc_msgSend(v8, "sortWithOptions:usingComparator:", 16, &__block_literal_global_148);
  v24 = objc_msgSend(v8, "count");
  if (v24)
  {
    v25 = v24;
    v26 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "syllableCount");
    v27 = v25 - 1;
    do
    {
      v28 = (void *)objc_msgSend(v8, "objectAtIndex:", v27);
      if (objc_msgSend(v28, "syllableCount") > v26)
        goto LABEL_29;
      if (!v27)
        return v8;
      if (objc_msgSend(v28, "isEqual:", objc_msgSend(v8, "objectAtIndex:", v27 - 1)))
LABEL_29:
        objc_msgSend(v8, "removeObjectAtIndex:", v27);
      --v27;
    }
    while (v27 != -1);
  }
  return v8;
}

uint64_t __107__AppleSpell_Chinese___retainedAlternativesByCombiningAlternatives_withAlternatives_andAddingAlternatives___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend(a2, "syllableCount");
  v6 = objc_msgSend(a3, "syllableCount");
  v7 = objc_msgSend(a2, "score");
  v8 = objc_msgSend(a3, "score");
  v9 = -1;
  if (v5 < v6)
    v10 = -1;
  else
    v10 = 1;
  if (v7 >= v8)
    v9 = 1;
  if (v7 == v8)
    v9 = 0;
  if (v5 == v6)
    return v9;
  else
    return v10;
}

- (id)_recursiveRetainedAlternativesForPinyinInputString:(id)a3 depth:(unint64_t)a4
{
  AppleSpell *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  char v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  PRPinyinString *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v30;
  unint64_t v31;
  id v32;
  AppleSpell *v33;
  unint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  char v40[24];
  uint64_t v41;

  v6 = self;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = -[AppleSpell _primitiveRetainedAlternativesForPinyinInputString:](self, "_primitiveRetainedAlternativesForPinyinInputString:");
  v8 = objc_msgSend(a3, "length");
  if (objc_msgSend(v7, "count") || a4 + 1 > 2)
    return v7;
  v31 = a4 + 1;
  v9 = -[AppleSpell _getSplitIndexes:maxCount:forPinyinInputString:](v6, "_getSplitIndexes:maxCount:forPinyinInputString:", v40, 3, a3);
  v10 = 0;
  v32 = 0;
LABEL_4:
  v34 = v10;
  if (a4)
    v11 = 1;
  else
    v11 = v10 >= 2;
  v12 = !v11;
  v13 = v9;
  while (1)
  {
    if (!objc_msgSend(v7, "count"))
    {
      if (!v13)
        break;
      goto LABEL_18;
    }
    v14 = v13 ? v12 : 0;
    if ((v14 & 1) == 0)
      break;
LABEL_18:
    v9 = v13 - 1;
    v15 = *(_QWORD *)&v39[8 * v13 + 120];
    if (v15)
      v16 = v8 > v15;
    else
      v16 = 0;
    --v13;
    if (v16)
    {
      v33 = v6;
      v17 = -[AppleSpell _primitiveRetainedAlternativesForPinyinInputString:](v6, "_primitiveRetainedAlternativesForPinyinInputString:", objc_msgSend(a3, "substringToIndex:", v15));
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v18)
      {
        v19 = v18;
        v30 = a4;
        v20 = *(_QWORD *)v36;
LABEL_25:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(v17);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v21), "lastSyllableIsPartial"))
            break;
          if (v19 == ++v21)
          {
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
            if (v19)
              goto LABEL_25;
            goto LABEL_38;
          }
        }
        if (!objc_msgSend(v17, "count"))
        {
LABEL_38:
          a4 = v30;
          goto LABEL_39;
        }
        v22 = -[AppleSpell _recursiveRetainedAlternativesForPinyinInputString:depth:](v33, "_recursiveRetainedAlternativesForPinyinInputString:depth:", objc_msgSend(a3, "substringFromIndex:", v15), v31);
        a4 = v30;
        if (objc_msgSend(v22, "count"))
        {
          v23 = -[AppleSpell _retainedAlternativesByCombiningAlternatives:withAlternatives:andAddingAlternatives:](v33, "_retainedAlternativesByCombiningAlternatives:withAlternatives:andAddingAlternatives:", v17, v22, v7);

          v7 = (id)v23;
        }

        v24 = v34;
        if (!objc_msgSend(v7, "count") && !objc_msgSend(v32, "count"))
        {
          v25 = -[PRPinyinString initWithUncheckedString:score:originalLength:]([PRPinyinString alloc], "initWithUncheckedString:score:originalLength:", objc_msgSend(a3, "substringFromIndex:", v15), 255, v8 - v15);
          v26 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v25);

          v27 = v26;
          a4 = v30;
          v32 = -[AppleSpell _retainedAlternativesByCombiningAlternatives:withAlternatives:andAddingAlternatives:](v33, "_retainedAlternativesByCombiningAlternatives:withAlternatives:andAddingAlternatives:", v17, v27, 0);
        }
      }
      else
      {
LABEL_39:
        v24 = v34;
      }

      v10 = v24 + 1;
      v6 = v33;
      goto LABEL_4;
    }
  }
  v28 = v32;
  if (!v32)
    return v7;
  if (objc_msgSend(v7, "count"))
  {

    return v7;
  }

  return v28;
}

- (id)spellServer:(id)a3 _retainedAlternativesForPinyinInputString:(id)a4 extended:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  id obj;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v5 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  v33 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v8 = -[AppleSpell _recursiveRetainedAlternativesForPinyinInputString:depth:](self, "_recursiveRetainedAlternativesForPinyinInputString:depth:", a4, 0);
  v9 = v8;
  if (v5 && objc_msgSend(v8, "count"))
  {
    v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v9;
    v37 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v37)
    {
      v35 = *(_QWORD *)v43;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(obj);
          v41 = v10;
          v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v10);
          v12 = objc_msgSend(v11, "numberOfNonPinyinRanges");
          if (v12)
          {
            v13 = v12;
            v39 = (void *)MEMORY[0x1E0C99DE8];
            v38 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfReplacements"));
            v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfTranspositions"));
            v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfInsertions"));
            v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfDeletions"));
            v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "syllableCount"));
            v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "lastSyllableIsPartial"));
            v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "score"));
            v20 = (void *)objc_msgSend(v39, "arrayWithObjects:", v11, v38, v14, v15, v16, v17, v18, v19, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfFirstModification")), 0);
            for (i = 0; i != v13; ++i)
            {
              v22 = objc_msgSend(v11, "nonPinyinRangeAtIndex:", i);
              v24 = v23;
              objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22));
              objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24));
            }
          }
          else
          {
            v40 = (void *)MEMORY[0x1E0C99D20];
            v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfReplacements"));
            v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfTranspositions"));
            v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfInsertions"));
            v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfDeletions"));
            v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "syllableCount"));
            v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "lastSyllableIsPartial"));
            v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "score"));
            v20 = (void *)objc_msgSend(v40, "arrayWithObjects:", v11, v25, v26, v27, v28, v29, v30, v31, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfFirstModification")), 0);
          }
          objc_msgSend(v36, "addObject:", v20);
          v10 = v41 + 1;
        }
        while (v41 + 1 != v37);
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v37);
    }

  }
  else
  {
    v36 = v9;
  }

  return v36;
}

- (id)spellServer:(id)a3 alternativesForPinyinInputString:(id)a4
{
  return -[AppleSpell spellServer:_retainedAlternativesForPinyinInputString:extended:](self, "spellServer:_retainedAlternativesForPinyinInputString:extended:", a3, a4, 0);
}

- (id)spellServer:(id)a3 extendedAlternativesForPinyinInputString:(id)a4
{
  return -[AppleSpell spellServer:_retainedAlternativesForPinyinInputString:extended:](self, "spellServer:_retainedAlternativesForPinyinInputString:extended:", a3, a4, 1);
}

- (id)spellServer:(id)a3 _retainedPrefixesForPinyinInputString:(id)a4
{
  id v6;
  unint64_t v7;
  CFIndex v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  PRPinyinString *v15;
  unint64_t v16;
  PRPinyinString *v17;
  BOOL v18;
  unint64_t v19;
  PRPinyinString *v20;
  unint64_t v21;
  PRPinyinString *v22;
  unint64_t v23;
  PRPinyinString *v24;
  id v26;
  uint64_t v27;
  CFIndex usedBufLen;
  UInt8 buffer;
  char v30;
  unsigned __int8 v31;
  unsigned __int8 v32[253];
  uint64_t v33;
  CFRange v34;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (spellServer__retainedPrefixesForPinyinInputString___cachedStringWithoutPrefixes
    && objc_msgSend(a4, "hasPrefix:"))
  {
    v7 = objc_msgSend((id)spellServer__retainedPrefixesForPinyinInputString___cachedStringWithoutPrefixes, "length") + 1;
  }
  else
  {
    v7 = 1;
  }
  v27 = 0;
  usedBufLen = 0;
  v8 = objc_msgSend(a4, "length");
  v9 = -[AppleSpell databaseConnectionForLanguageObject:](self, "databaseConnectionForLanguageObject:", +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("en_CN")));
  if (v8)
  {
    v10 = v9;
    v34.location = 0;
    v34.length = v8;
    if (v8 == CFStringGetBytes((CFStringRef)a4, v34, 0x500u, 0, 0, &buffer, 254, &usedBufLen))
    {
      v11 = usedBufLen;
      *(&buffer + usedBufLen) = 0;
      v12 = 14;
      while (1)
      {
        while (v12 > v11)
        {
          if (--v12 <= 2)
            goto LABEL_23;
        }
        v13 = -[AppleSpell englishStringFromWordBuffer:length:connection:](self, "englishStringFromWordBuffer:length:connection:", &buffer, v12, v10);
        if (v13)
        {
          v14 = v13;
          if (!objc_msgSend(v6, "count")
            || usedBufLen == v12
            || findPinyin(&buffer + v12, usedBufLen - v12, 0, 1, 0, 0, 0, 0, &v27, 0, 0, 0, 0, 0, 0, 0, 0, 0)&& usedBufLen - v27 == v12)
          {
            v15 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:]([PRPinyinString alloc], "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v14, 0, 0, 128, v12, 5, 0, v12, 0, objc_msgSend(v14, "length"), 0, v12);
            if ((objc_msgSend(v6, "containsObject:", v15) & 1) == 0)
              objc_msgSend(v6, "addObject:", v15);

          }
        }
        if (v12 <= v7)
          break;
        if (--v12 < 3)
          break;
        v11 = usedBufLen;
      }
LABEL_23:
      if (!objc_msgSend(v6, "count"))
      {

        spellServer__retainedPrefixesForPinyinInputString___cachedStringWithoutPrefixes = objc_msgSend(a4, "copy");
      }
      if ((unint64_t)usedBufLen >= 2)
      {
        v16 = 0;
        do
        {
          if (additionalTwoLetterWords[v16] == buffer
            && additionalTwoLetterWords[v16 + 1] == v30
            && (usedBufLen == 2
             || findPinyin(&v31, usedBufLen - 2, 0, 1, 0, 0, 0, 0, &v27, 0, 0, 0, 0, 0, 0, 0, 0, 0)&& v27 + 2 == usedBufLen))
          {
            v17 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:]([PRPinyinString alloc], "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &buffer, 2, 12), 0, 0, 128, 2, 5, 0, 2, 0, 2, 0,
                    2);
            if ((objc_msgSend(v6, "containsObject:", v17) & 1) == 0)
              objc_msgSend(v6, "addObject:", v17);

          }
          v18 = v16 >= 0x2E;
          v16 += 2;
        }
        while (!v18);
        if ((unint64_t)usedBufLen >= 2)
        {
          v19 = 0;
          do
          {
            if (additionalTwoLetterAcronyms[v19] == buffer
              && additionalTwoLetterAcronyms[v19 + 1] == v30
              && (usedBufLen == 2
               || findPinyin(&v31, usedBufLen - 2, 0, 1, 0, 0, 0, 0, &v27, 0, 0, 0, 0, 0, 0, 0, 0, 0)&& v27 + 2 == usedBufLen))
            {
              v20 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:]([PRPinyinString alloc], "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &buffer, 2, 12), "uppercaseString"), 0, 0, 128, 2, 5, 0, 2, 0,
                      2,
                      0,
                      2);
              if ((objc_msgSend(v6, "containsObject:", v20) & 1) == 0)
                objc_msgSend(v6, "addObject:", v20);

            }
            v18 = v19 >= 8;
            v19 += 2;
          }
          while (!v18);
          if ((unint64_t)usedBufLen >= 3)
          {
            v21 = 0;
            do
            {
              if (additionalThreeLetterWords[v21] == buffer
                && additionalThreeLetterWords[v21 + 1] == v30
                && additionalThreeLetterWords[v21 + 2] == v31
                && (usedBufLen == 3
                 || findPinyin(v32, usedBufLen - 3, 0, 1, 0, 0, 0, 0, &v27, 0, 0, 0, 0, 0, 0, 0, 0, 0)&& v27 + 3 == usedBufLen))
              {
                v22 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:]([PRPinyinString alloc], "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &buffer, 3, 12), 0, 0, 128, 3, 5, 0, 3, 0, 3, 0,
                        3);
                if ((objc_msgSend(v6, "containsObject:", v22) & 1) == 0)
                  objc_msgSend(v6, "addObject:", v22);

              }
              v18 = v21 >= 0x12F;
              v21 += 3;
            }
            while (!v18);
            if ((unint64_t)usedBufLen >= 3)
            {
              v23 = 0;
              do
              {
                if (additionalThreeLetterAcronyms[v23] == buffer
                  && additionalThreeLetterAcronyms[v23 + 1] == v30
                  && additionalThreeLetterAcronyms[v23 + 2] == v31
                  && (usedBufLen == 3
                   || findPinyin(v32, usedBufLen - 3, 0, 1, 0, 0, 0, 0, &v27, 0, 0, 0, 0, 0, 0, 0, 0, 0)&& v27 + 3 == usedBufLen))
                {
                  v24 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:]([PRPinyinString alloc], "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &buffer, 3, 12), "uppercaseString"), 0, 0, 128, 3, 5, 0, 3, 0,
                          3,
                          0,
                          3);
                  if ((objc_msgSend(v6, "containsObject:", v24) & 1) == 0)
                    objc_msgSend(v6, "addObject:", v24);

                }
                v18 = v23 >= 0xC;
                v23 += 3;
              }
              while (!v18);
            }
          }
        }
      }
    }
  }

  return v6;
}

- (id)spellServer:(id)a3 prefixesForPinyinInputString:(id)a4
{
  return -[AppleSpell spellServer:_retainedPrefixesForPinyinInputString:](self, "spellServer:_retainedPrefixesForPinyinInputString:", a3, a4);
}

- (id)spellServer:(id)a3 _retainedCorrectionsForPinyinInputString:(id)a4
{
  CFIndex v5;
  unint64_t v6;
  size_t v7;
  unint64_t i;
  int v9;
  uint64_t v10;
  _DWORD *v11;
  int v12;
  id v13;
  void *v14;
  PRPinyinString *v15;
  PRPinyinString *v16;
  id v18;
  id v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  CFIndex usedBufLen;
  unsigned __int8 __dst[256];
  UInt8 buffer[256];
  uint64_t v28;
  CFRange v29;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0;
  usedBufLen = 0;
  v22 = 0;
  v23 = 0;
  v21 = 0;
  v20 = 0;
  v5 = objc_msgSend(a4, "length");
  if (v5)
  {
    v29.location = 0;
    v29.length = v5;
    if (v5 == CFStringGetBytes((CFStringRef)a4, v29, 0x500u, 0, 0, buffer, 254, &usedBufLen))
    {
      v6 = usedBufLen;
      buffer[usedBufLen] = 0;
      v7 = v6 + 1 > 1 ? v6 + 1 : 1;
      memcpy(__dst, buffer, v7);
      if (v6)
      {
        for (i = 0; i < v6; ++i)
        {
          v9 = buffer[i];
          if ((v9 - 65) < 0x1A)
            break;
          if ((v9 - 97) <= 0x19)
          {
            v10 = 0;
            v11 = &adjacentMatchesChinese[6 * (v9 - 97)];
            do
            {
              v12 = v11[v10];
              if ((_BYTE)v12)
              {
                __dst[i] = v12;
                if (findPinyin(__dst, usedBufLen, 0, 0, 0, 0, 0, &v23, &v24, 0, &v22, &v20, &v21, 0, 0, 0, 0, 0))
                {
                  if (v24 == usedBufLen && (!v20 || i < v23))
                  {
                    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v14 = (void *)objc_msgSend(v13, "initWithBytes:length:encoding:", __dst, usedBufLen, 12);
                    v15 = [PRPinyinString alloc];
                    v16 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:](v15, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:", v14, v22, v20, v21, usedBufLen, 1, i, 1, i, 1);
                    if ((objc_msgSend(v19, "containsObject:", v16) & 1) == 0)
                      objc_msgSend(v19, "addObject:", v16);

                  }
                }
              }
              ++v10;
            }
            while (v10 != 6);
            LOBYTE(v9) = buffer[i];
            v6 = usedBufLen;
          }
          __dst[i] = v9;
        }
      }
    }
  }

  return v19;
}

- (id)spellServer:(id)a3 correctionsForPinyinInputString:(id)a4
{
  return -[AppleSpell spellServer:_retainedCorrectionsForPinyinInputString:](self, "spellServer:_retainedCorrectionsForPinyinInputString:", a3, a4);
}

- (id)spellServer:(id)a3 _retainedModificationsForPinyinInputString:(id)a4 geometryModelData:(id)a5
{
  uint64_t v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  PRPinyinModification *v20;
  id v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = -[AppleSpell _recursiveRetainedAlternativesForPinyinInputString:depth:](self, "_recursiveRetainedAlternativesForPinyinInputString:depth:", a4, 0);
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v26 = v7;
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v7);
        v27 = objc_msgSend(v8, "numberOfModifications");
        if (v27)
        {
          for (i = 0; i != v27; ++i)
          {
            v30 = objc_msgSend(v8, "typeOfModificationAtIndex:", i);
            v29 = objc_msgSend(v8, "originalRangeForModificationAtIndex:", i);
            v11 = v10;
            v12 = objc_msgSend(v8, "finalRangeForModificationAtIndex:", i);
            v14 = v13;
            v15 = objc_msgSend(v8, "originalSyllableRangeForModificationAtIndex:", i);
            v17 = v16;
            v18 = objc_msgSend(v8, "originalAdditionalSyllableRangeForModificationAtIndex:", i);
            v20 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:", v29, v11, objc_msgSend(v8, "substringWithRange:", v12, v14), v30, v15, v17, 0.0, v18, v19);
            if ((objc_msgSend(v28, "containsObject:", v20) & 1) == 0)
              objc_msgSend(v28, "addObject:", v20);

          }
        }
        v7 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v25);
  }

  return v28;
}

- (id)spellServer:(id)a3 _retainedFinalModificationsForPinyinInputString:(id)a4 geometryModelData:(id)a5
{
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a4, "length");
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = -[AppleSpell spellServer:_retainedModificationsForPinyinInputString:geometryModelData:](self, "spellServer:_retainedModificationsForPinyinInputString:geometryModelData:", a3, a4, a5);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "syllableRange");
        if (v17 + v18 == v9)
          objc_msgSend(v10, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v10;
}

- (id)spellServer:(id)a3 modificationsForPinyinInputString:(id)a4
{
  return -[AppleSpell spellServer:_retainedModificationsForPinyinInputString:geometryModelData:](self, "spellServer:_retainedModificationsForPinyinInputString:geometryModelData:", a3, a4, 0);
}

- (id)spellServer:(id)a3 modificationsForPinyinInputString:(id)a4 geometryModelData:(id)a5
{
  return -[AppleSpell spellServer:_retainedModificationsForPinyinInputString:geometryModelData:](self, "spellServer:_retainedModificationsForPinyinInputString:geometryModelData:", a3, a4, a5);
}

- (id)spellServer:(id)a3 finalModificationsForPinyinInputString:(id)a4
{
  return -[AppleSpell spellServer:_retainedFinalModificationsForPinyinInputString:geometryModelData:](self, "spellServer:_retainedFinalModificationsForPinyinInputString:geometryModelData:", a3, a4, 0);
}

- (BOOL)inputStringIsPinyin:(id)a3 allowPartialLastSyllable:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  CFIndex Bytes;
  CFIndex v9;
  int Pinyin;
  char v12;
  uint64_t v13;
  CFIndex usedBufLen;
  UInt8 buffer[256];
  uint64_t v16;
  CFRange v17;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v12 = 0;
  v6 = objc_msgSend(a3, "length");
  if (v6)
  {
    v7 = v6;
    usedBufLen = 0;
    v17.location = 0;
    v17.length = v6;
    Bytes = CFStringGetBytes((CFStringRef)a3, v17, 0x500u, 0, 0, buffer, 254, &usedBufLen);
    LOBYTE(v6) = 0;
    if (v7 == Bytes)
    {
      v9 = usedBufLen;
      buffer[usedBufLen] = 0;
      Pinyin = findPinyin(buffer, v9, 0, 1, 0, 0, 0, 0, &v13, 0, 0, &v12, 0, 0, 0, 0, 0, 0);
      LOBYTE(v6) = 0;
      if (Pinyin)
      {
        if (v13 == usedBufLen)
        {
          if (v12)
            LOBYTE(v6) = a4;
          else
            LOBYTE(v6) = 1;
        }
        else
        {
          LOBYTE(v6) = 0;
        }
      }
    }
  }
  return v6;
}

- (BOOL)inputStringIsFullOrAbbreviatedPinyin:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CFIndex Bytes;
  CFIndex v7;
  CFIndex usedBufLen;
  UInt8 buffer[256];
  uint64_t v11;
  CFRange v12;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "length");
  if (v4)
  {
    v5 = v4;
    usedBufLen = 0;
    v12.location = 0;
    v12.length = v4;
    Bytes = CFStringGetBytes((CFStringRef)a3, v12, 0x500u, 0, 0, buffer, 254, &usedBufLen);
    LOBYTE(v4) = 0;
    if (v5 == Bytes)
    {
      v7 = usedBufLen;
      buffer[usedBufLen] = 0;
      LOBYTE(v4) = isFullOrAbbreviatedPinyin((uint64_t)buffer, v7, 0, 0);
    }
  }
  return v4;
}

- (void)_addContextAlternativesForPinyinInputString:(id)a3 modifications:(id)a4 afterIndex:(unint64_t)a5 delta:(int64_t)a6 toArray:(id)a7
{
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t j;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  uint64_t v34;
  int64_t v35;
  unint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v39 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v39)
  {
    v9 = *(_QWORD *)v49;
    v34 = *(_QWORD *)v49;
    v35 = a6;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(a4);
        v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "range");
        v41 = v13;
        v14 = objc_msgSend(v11, "syllableRange");
        v42 = v15;
        if (v12 >= a5 && v14 >= a5)
        {
          v17 = v14;
          v40 = i;
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (!v18)
          {
            v22 = 1;
LABEL_27:
            v28 = (void *)objc_msgSend(a3, "mutableCopy");
            if (objc_msgSend(v11, "modificationType") == 5)
              v29 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), objc_msgSend(v11, "replacementString"));
            else
              v29 = (void *)objc_msgSend(v11, "replacementString");
            v30 = v29;
            v31 = objc_msgSend(v29, "length");
            objc_msgSend(v28, "replaceCharactersInRange:withString:", v12 + a6, v41, v30);
            if ((v22 & 1) != 0)
            {
              if ((objc_msgSend(a7, "containsObject:", v28) & 1) == 0)
                objc_msgSend(a7, "addObject:", v28);
            }
            else
            {
              -[AppleSpell _addContextAlternativesForPinyinInputString:modifications:afterIndex:delta:toArray:](self, "_addContextAlternativesForPinyinInputString:modifications:afterIndex:delta:toArray:", v28, a4, v17 + v42, a6 - v41 + v31, a7);
            }

            objc_msgSend(v11, "modificationScore");
            i = v40;
            if (v32 < 1.0)
            {
              if ((v22 & 1) != 0)
              {
                if ((objc_msgSend(a7, "containsObject:", a3) & 1) == 0)
                  objc_msgSend(a7, "addObject:", a3);
              }
              else
              {
                -[AppleSpell _addContextAlternativesForPinyinInputString:modifications:afterIndex:delta:toArray:](self, "_addContextAlternativesForPinyinInputString:modifications:afterIndex:delta:toArray:", a3, a4, v17 + v42, a6, a7);
              }
            }
            continue;
          }
          v19 = v18;
          v37 = v12;
          v20 = *(_QWORD *)v45;
          v21 = 1;
          v22 = 1;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v45 != v20)
                objc_enumerationMutation(a4);
              v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              v25 = objc_msgSend(v24, "syllableRange");
              if (v24 != v11 && v25 >= a5)
              {
                v21 &= v25 + v26 > v17;
                v22 &= v17 + v42 > v25;
              }
            }
            v19 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v19);
          v9 = v34;
          a6 = v35;
          i = v40;
          v12 = v37;
          if ((v21 & 1) != 0)
            goto LABEL_27;
        }
      }
      v39 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v39);
  }
}

- (id)contextAlternativeAnnotatedStringsForPinyinInputString:(id)a3
{
  PRPinyinContext *v5;
  uint64_t v6;
  void *v7;
  double Current;
  uint64_t i;
  double v10;
  uint64_t j;

  v5 = objc_alloc_init(PRPinyinContext);
  v6 = objc_msgSend(a3, "length");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  Current = CFAbsoluteTimeGetCurrent();
  if (v6)
  {
    for (i = 0;
          i != v6;
          -[AppleSpell spellServer:alternativesForPinyinInputString:](self, "spellServer:alternativesForPinyinInputString:", 0, objc_msgSend(a3, "substringToIndex:", i)))
    {
      ++i;
    }
  }
  *(double *)&contextAlternativeAnnotatedStringsForPinyinInputString__oldTimeTotal = *(double *)&contextAlternativeAnnotatedStringsForPinyinInputString__oldTimeTotal
                                                                                   + CFAbsoluteTimeGetCurrent()
                                                                                   - Current;
  v10 = CFAbsoluteTimeGetCurrent();
  if (v6)
  {
    for (j = 0; j != v6; ++j)
      -[PRPinyinContext addInputCharacter:geometryModel:geometryData:](v5, "addInputCharacter:geometryModel:geometryData:", objc_msgSend(a3, "characterAtIndex:", j), 0, 0);
  }
  *(double *)&contextAlternativeAnnotatedStringsForPinyinInputString__newTimeTotal = *(double *)&contextAlternativeAnnotatedStringsForPinyinInputString__newTimeTotal
                                                                                   + CFAbsoluteTimeGetCurrent()
                                                                                   - v10;
  -[AppleSpell _addContextAlternativesForPinyinInputString:modifications:afterIndex:delta:toArray:](self, "_addContextAlternativesForPinyinInputString:modifications:afterIndex:delta:toArray:", a3, -[PRPinyinContext currentModifications](v5, "currentModifications"), 0, 0, v7);

  return v7;
}

- (id)contextAlternativeAnnotatedStringsForJyutpingInputString:(id)a3
{
  PRJyutpingContext *v5;
  uint64_t v6;
  void *v7;
  double Current;
  uint64_t i;

  v5 = objc_alloc_init(PRJyutpingContext);
  v6 = objc_msgSend(a3, "length");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  Current = CFAbsoluteTimeGetCurrent();
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      -[PRPinyinContext addInputCharacter:geometryModel:geometryData:](v5, "addInputCharacter:geometryModel:geometryData:", objc_msgSend(a3, "characterAtIndex:", i), 0, 0);
  }
  *(double *)&contextAlternativeAnnotatedStringsForJyutpingInputString__timeTotal = *(double *)&contextAlternativeAnnotatedStringsForJyutpingInputString__timeTotal
                                                                                  + CFAbsoluteTimeGetCurrent()
                                                                                  - Current;
  -[AppleSpell _addContextAlternativesForPinyinInputString:modifications:afterIndex:delta:toArray:](self, "_addContextAlternativesForPinyinInputString:modifications:afterIndex:delta:toArray:", a3, -[PRPinyinContext currentModifications](v5, "currentModifications"), 0, 0, v7);

  return v7;
}

- (id)internalStringForKoreanExternalString:(id)a3
{
  uint64_t v4;
  __CFString *MutableCopy;
  void *v6;

  if (!_nonPunctuationCharacterSet)
    _nonPunctuationCharacterSet = (uint64_t)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet"), "invertedSet");
  objc_msgSend(a3, "rangeOfCharacterFromSet:");
  if (!v4)
    return a3;
  MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)a3);
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormD);
  v6 = (void *)ConvertStringToHangulCompatibilityJamo(MutableCopy);
  CFRelease(MutableCopy);
  return v6;
}

- (id)externalStringForKoreanInternalString:(id)a3
{
  id result;
  uint64_t v5;
  const __CFString *v6;
  __CFString *MutableCopy;

  if (!_nonPunctuationCharacterSet)
    _nonPunctuationCharacterSet = (uint64_t)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet"), "invertedSet");
  objc_msgSend(a3, "rangeOfCharacterFromSet:");
  result = a3;
  if (v5)
  {
    v6 = (const __CFString *)ConvertStringFromHangulCompatibilityJamo(a3);
    MutableCopy = CFStringCreateMutableCopy(0, 0, v6);
    CFStringNormalize(MutableCopy, kCFStringNormalizationFormC);
    return MutableCopy;
  }
  return result;
}

- (void)addGuessesForKoreanWord:(id)a3 includeAdditionalGuesses:(BOOL)a4 toGuesses:(id)a5
{
  id v7;
  CFMutableStringRef MutableCopy;
  CFIndex i;
  unsigned int CharacterAtIndex;
  uint64_t v12;
  const UniChar *v13;
  unsigned int v14;
  char *v15;
  const __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  CFIndex v19;
  unint64_t Length;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  CFIndex usedBufLen;
  UInt8 buffer[256];
  uint64_t v29;
  CFRange v30;
  CFRange v31;

  v29 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  usedBufLen = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v7 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("ko"), a4);
  MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)a3);
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormD);
  Length = CFStringGetLength(MutableCopy);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __81__AppleSpell_Korean__addGuessesForKoreanWord_includeAdditionalGuesses_toGuesses___block_invoke;
  v22[3] = &unk_1EA8D7000;
  v22[4] = &v23;
  -[__CFString enumerateSubstringsInRange:options:usingBlock:](MutableCopy, "enumerateSubstringsInRange:options:usingBlock:", 0, Length, 2, v22);
  objc_msgSend((id)ConvertStringToHangulCompatibilityJamo(MutableCopy), "length");
  if ((unint64_t)(v24[3] - 2) <= 0x11 && Length >= 3)
  {
    for (i = 0; i != Length; ++i)
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(MutableCopy, i);
      if (CharacterAtIndex >> 8 == 17)
      {
        if (CharacterAtIndex == 4527)
        {
          v12 = 13;
          v13 = (const UniChar *)&LJongMatches;
          goto LABEL_20;
        }
        if (CharacterAtIndex >> 3 < 0x235)
        {
          if (CharacterAtIndex < 0x1161)
          {
            v14 = CharacterAtIndex - 4352;
            if (CharacterAtIndex - 4352 <= 0x12)
            {
              v15 = (char *)&ChoMatches;
LABEL_18:
              v13 = (const UniChar *)&v15[12 * v14];
LABEL_19:
              v12 = 6;
              do
              {
LABEL_20:
                if (*v13)
                {
                  v16 = CFStringCreateWithCharacters(0, v13, 1);
                  v17 = CFStringCreateMutableCopy(0, 0, MutableCopy);
                  v30.location = i;
                  v30.length = 1;
                  CFStringReplace(v17, v30, v16);
                  v18 = (__CFString *)ConvertStringToHangulCompatibilityJamo(v17);
                  v19 = -[__CFString length](v18, "length");
                  v31.location = 0;
                  v31.length = v19;
                  if (v19 == CFStringGetBytes(v18, v31, 0x8000100u, 0x5Fu, 0, buffer, 72, &usedBufLen)
                    && (-[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", buffer, usedBufLen, v7, 5)|| -[AppleSpell validateWord:inLexiconForLanguageObject:](self, "validateWord:inLexiconForLanguageObject:", v18, v7)))
                  {
                    CFStringNormalize(v17, kCFStringNormalizationFormC);
                    objc_msgSend(a5, "addCandidateWithString:errorType:", v17, 8);
                  }
                  CFRelease(v17);
                  CFRelease(v16);
                }
                ++v13;
                --v12;
              }
              while (v12);
            }
          }
          else
          {
            v14 = CharacterAtIndex - 4449;
            if (CharacterAtIndex - 4449 <= 0x14)
            {
              v15 = (char *)&JungMatches;
              goto LABEL_18;
            }
          }
        }
        else if (CharacterAtIndex - 4520 <= 0x1A)
        {
          v13 = (const UniChar *)((char *)&JongMatches + 12 * CharacterAtIndex - 54240);
          goto LABEL_19;
        }
      }
    }
  }
  CFRelease(MutableCopy);
  _Block_object_dispose(&v23, 8);
}

uint64_t __81__AppleSpell_Korean__addGuessesForKoreanWord_includeAdditionalGuesses_toGuesses___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (id)_correctionResultForKoreanString:(id)a3 range:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 tagger:(id)a7 appIdentifier:(id)a8 dictionary:(id)a9 keyEventArray:(id)a10
{
  return 0;
}

- (id)spellServer:(id)a3 suggestGuessesForKoreanWordRange:(_NSRange)a4 inString:(id)a5 options:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  PRCandidateList *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __CFString *v38;
  CFIndex v39;
  uint64_t v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CFIndex usedBufLen;
  _BYTE v53[128];
  UInt8 v54[128];
  UInt8 buffer[256];
  uint64_t v56;
  CFRange v57;

  length = a4.length;
  location = a4.location;
  v56 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v42 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v12 = objc_msgSend(a5, "substringWithRange:", location, length);
  v13 = _appIdentifierFromOptions(a6);
  v14 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("ko"));
  v15 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", v14, a5, 0, objc_msgSend(a5, "length"));
  v16 = -[PRCandidateList initWithMaxCount:defaultReplacementRange:customErrorModel:capitalizationDictionaryArray:]([PRCandidateList alloc], "initWithMaxCount:defaultReplacementRange:customErrorModel:capitalizationDictionaryArray:", 32, location, length, objc_msgSend(a6, "objectForKey:", PRErrorModelKey), 0);
  v17 = objc_msgSend(-[AppleSpell autocorrectionDictionaryForLanguageObject:](self, "autocorrectionDictionaryForLanguageObject:", v14), "objectForKey:", v12);
  usedBufLen = 0;
  v18 = objc_msgSend(a6, "objectForKey:", CFSTR("ParameterBundles"));
  v41 = v12;
  -[AppleSpell addGuessesForKoreanWord:includeAdditionalGuesses:toGuesses:](self, "addGuessesForKoreanWord:includeAdditionalGuesses:toGuesses:", v12, 1, v16);
  v43 = v15;
  if (v15)
  {
    v19 = -[AppleSpell _rankedCandidatesForCandidateList:languageObject:tagger:appIdentifier:parameterBundles:](self, "_rankedCandidatesForCandidateList:languageObject:tagger:appIdentifier:parameterBundles:", v16, v14, v15, v13, v18);
    if (v19)
    {
      v20 = v19;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v49 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            if ((objc_msgSend(v25, "isBlocklisted") & 1) == 0)
            {
              v26 = objc_msgSend(v25, "string");
              if ((objc_msgSend(v11, "containsObject:", v26) & 1) == 0)
                objc_msgSend(v11, "addObject:", v26);
            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        }
        while (v22);
      }
    }
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v27 = -[PRCandidateList candidates](v16, "candidates");
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        if ((objc_msgSend(v32, "isBlocklisted") & 1) == 0)
        {
          v33 = objc_msgSend(v32, "string");
          if ((objc_msgSend(v11, "containsObject:", v33) & 1) == 0)
            objc_msgSend(v11, "addObject:", v33);
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v29);
  }
  objc_msgSend(v11, "removeObject:", v41);
  v34 = objc_msgSend(v11, "count");
  if (v34)
  {
    v35 = v34 - 1;
    do
    {
      v36 = (void *)objc_msgSend(v11, "objectAtIndex:", v35);
      v37 = v36;
      if (!v17 || (objc_msgSend(v36, "isEqualToString:", v17) & 1) == 0)
      {
        v38 = -[AppleSpell internalStringForKoreanExternalString:](self, "internalStringForKoreanExternalString:", v37);
        v39 = -[__CFString length](v38, "length");
        v57.location = 0;
        v57.length = v39;
        if (v39 == CFStringGetBytes(v38, v57, 0x8000100u, 0, 0, buffer, 254, &usedBufLen)
          && !-[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", buffer, usedBufLen, v14, 1)&& -[AppleSpell acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:](self, "acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:", buffer, usedBufLen, v14, 0, 0) != 2)
        {
          objc_msgSend(v11, "removeObjectAtIndex:", v35);
        }
      }
      --v35;
    }
    while (v35 != -1);
  }
  -[AppleSpell resetTimer](self, "resetTimer");
  -[AppleSpell invalidateTagger:](self, "invalidateTagger:", v43);

  return v11;
}

@end

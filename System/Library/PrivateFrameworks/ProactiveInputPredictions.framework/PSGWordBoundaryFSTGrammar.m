@implementation PSGWordBoundaryFSTGrammar

- (void)clearLMCache
{
  NSObject *v3;
  uint8_t v4[16];

  psg_default_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1DBD27000, v3, OS_LOG_TYPE_DEBUG, "[PSGWordBoundaryFSTGrammar] Clearing LM cache", v4, 2u);
  }

  -[NSCache removeAllObjects](self->_lmWrapperCache, "removeAllObjects");
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PSGWordBoundaryFSTGrammar_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[PSGWordBoundaryFSTGrammar sharedInstance]::_pasOnceToken5 != -1)
    dispatch_once(&+[PSGWordBoundaryFSTGrammar sharedInstance]::_pasOnceToken5, block);
  return (id)+[PSGWordBoundaryFSTGrammar sharedInstance]::_pasExprOnceResult;
}

- (void)warmUpForLocaleIdentifier:(id)a3 waitForCompletion:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  psg_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_debug_impl(&dword_1DBD27000, v7, OS_LOG_TYPE_DEBUG, "[PSGWordBoundaryFSTGrammar] warming up for %@", (uint8_t *)&v11, 0xCu);
  }

  -[PSGWordBoundaryFSTGrammar _getLMWrapper:](self, "_getLMWrapper:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    dispatch_sync((dispatch_queue_t)self->_lmWrapperQueue, &__block_literal_global);
    -[NSCache objectForKey:](self->_lmWrapperCache, "objectForKey:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  psg_default_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v8;
    _os_log_debug_impl(&dword_1DBD27000, v10, OS_LOG_TYPE_DEBUG, "[PSGWordBoundaryFSTGrammar] wrapper instance %@", (uint8_t *)&v11, 0xCu);
  }

}

- (void)warmUpForLocaleIdentifier:(id)a3
{
  -[PSGWordBoundaryFSTGrammar warmUpForLocaleIdentifier:waitForCompletion:](self, "warmUpForLocaleIdentifier:waitForCompletion:", a3, 0);
}

- (id)_getLMWrapper:(id)a3
{
  id v4;
  void *v5;
  NSObject *lmWrapperQueue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[NSCache objectForKey:](self->_lmWrapperCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    lmWrapperQueue = self->_lmWrapperQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__PSGWordBoundaryFSTGrammar__getLMWrapper___block_invoke;
    v8[3] = &unk_1EA3F0AA0;
    v8[4] = self;
    v9 = v4;
    dispatch_async(lmWrapperQueue, v8);

  }
  return v5;
}

void __43__PSGWordBoundaryFSTGrammar__getLMWrapper___block_invoke(uint64_t a1)
{
  PSGLMWrapper *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  PSGLMWrapper *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (PSGLMWrapper *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_createLanguageModel:", *(_QWORD *)(a1 + 40));
    if (v3 && objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR("zh")))
      v4 = objc_msgSend(*(id *)(a1 + 32), "_createLexicon:", *(_QWORD *)(a1 + 40));
    else
      v4 = 0;
    v2 = -[PSGLMWrapper initWithLangModel:lexicon:]([PSGLMWrapper alloc], "initWithLangModel:lexicon:", v3, v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
    psg_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = -[PSGLMWrapper langModel](v2, "langModel");
      v7 = -[PSGLMWrapper lexicon](v2, "lexicon");
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138413058;
      v10 = v2;
      v11 = 1024;
      v12 = v6 != 0;
      v13 = 1024;
      v14 = v7 != 0;
      v15 = 2112;
      v16 = v8;
      _os_log_debug_impl(&dword_1DBD27000, v5, OS_LOG_TYPE_DEBUG, "[PSGWordBoundaryFSTGrammar] created wrapper instance %@ (model? %d; lexicon? %d) for %@",
        (uint8_t *)&v9,
        0x22u);
    }

  }
}

- (void)_createLanguageModel:(id)a3
{
  __CFString *v4;
  __CFDictionary *Mutable;
  CFLocaleRef v6;
  const void *v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v6 = CFLocaleCreate(0, v4);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D434C8], v6);
  v7 = (const void *)*MEMORY[0x1E0C9AE40];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D43450], (const void *)*MEMORY[0x1E0C9AE40]);
  v8 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D434B0], (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D434F8], v7);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D434D8], v8);
  if (-[__CFString hasPrefix:](v4, "hasPrefix:", CFSTR("hi")))
  {
    -[PSGWordBoundaryFSTGrammar getOTAPathForProactiveBundle:](self, "getOTAPathForProactiveBundle:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v9);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D43478], (const void *)objc_msgSend(v10, "path"));
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D43468], CFSTR("hi"));

    }
  }
  v11 = (void *)LMLanguageModelCreate();
  if (v11)
  {
    LMVocabularyGetSharedVocabulary();
    LMLanguageModelAddTransientVocabulary();
  }
  else
  {
    psg_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_error_impl(&dword_1DBD27000, v12, OS_LOG_TYPE_ERROR, "Cannot create language model for %@ locale.", (uint8_t *)&v14, 0xCu);
    }

  }
  CFRelease(v6);
  CFRelease(Mutable);

  return v11;
}

- (PSGWordBoundaryFSTGrammar)init
{
  PSGWordBoundaryFSTGrammar *v2;
  uint64_t v3;
  NSCache *lmWrapperCache;
  uint64_t v5;
  OS_dispatch_queue *lmWrapperQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSGWordBoundaryFSTGrammar;
  v2 = -[PSGWordBoundaryFSTGrammar init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    lmWrapperCache = v2->_lmWrapperCache;
    v2->_lmWrapperCache = (NSCache *)v3;

    -[NSCache setCountLimit:](v2->_lmWrapperCache, "setCountLimit:", 3);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PSGWordBoundaryFSTGrammar.LMWrapper", 9);
    v5 = objc_claimAutoreleasedReturnValue();
    lmWrapperQueue = v2->_lmWrapperQueue;
    v2->_lmWrapperQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (id)getOTAPathForProactiveBundle:(id)a3
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
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  LDEnumerateAssetDataItems();
  if (v10[5])
  {
    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C997E8]);
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

- (void)_createLexicon:(id)a3
{
  __CFString *v3;
  __CFDictionary *Mutable;
  CFLocaleRef v5;
  void *v6;
  NSObject *v7;
  int v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v5 = CFLocaleCreate(0, v3);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D434C8], v5);
  v6 = (void *)LMLexiconCreate();
  if (!v6)
  {
    psg_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_error_impl(&dword_1DBD27000, v7, OS_LOG_TYPE_ERROR, "Cannot create lexicon for %@ locale.", (uint8_t *)&v9, 0xCu);
    }

  }
  CFRelease(v5);
  CFRelease(Mutable);

  return v6;
}

- (id)_getPrimingToken:(void *)a3 transientTokenID:(unsigned int)a4
{
  int ClassForTokenID;
  id *v5;
  id v6;
  const void *StringForTokenID;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  const void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  LMVocabularyGetSharedVocabulary();
  ClassForTokenID = LMVocabularyGetClassForTokenID();
  switch(ClassForTokenID)
  {
    case 'D':
      v5 = (id *)MEMORY[0x1E0D43340];
      break;
    case 'Y':
      v5 = (id *)MEMORY[0x1E0D43330];
      break;
    case 'E':
      v5 = (id *)MEMORY[0x1E0D43410];
      break;
    default:
      v13 = 0;
      v6 = 0;
      goto LABEL_11;
  }
  v6 = *v5;
  StringForTokenID = (const void *)LMLanguageModelCreateStringForTokenID();
  if (StringForTokenID)
  {
    v8 = *MEMORY[0x1E0D433B8];
    v9 = *MEMORY[0x1E0D43400];
    v17[0] = *MEMORY[0x1E0D43428];
    v17[1] = v9;
    v10 = *MEMORY[0x1E0D43418];
    v18[0] = v8;
    v18[1] = v10;
    v17[2] = *MEMORY[0x1E0D432C8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v11;
    v17[3] = *MEMORY[0x1E0D433D0];
    v15 = v6;
    v16 = StringForTokenID;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(StringForTokenID);
  }
  else
  {
    v13 = 0;
  }
LABEL_11:

  return v13;
}

- (id)triggerAttributesForContext:(id)a3 localeIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t SharedVocabulary;
  char v25;
  const void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  _BYTE *v33;
  _DWORD *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  os_signpost_id_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  unsigned int i;
  int v44;
  int v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v51;
  void *v52;
  void *v54;
  id v55;
  _DWORD *v56;
  _BYTE *v57;
  uint64_t v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[5];
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  __n128 (*v66)(__n128 *, __n128 *);
  void (*v67)(uint64_t);
  const char *v68;
  void *__p;
  void *v70;
  uint64_t v71;
  _BYTE buf[24];
  void *v73;
  uint64_t *v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v55 = a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    psg_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_generate(v8);

    psg_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBD27000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PSGWordBoundaryFSTGrammar_initialization", (const char *)&unk_1DBD3C55A, buf, 2u);
    }

    -[PSGWordBoundaryFSTGrammar _getLMWrapper:](self, "_getLMWrapper:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    psg_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBD27000, v13, OS_SIGNPOST_INTERVAL_END, v9, "PSGWordBoundaryFSTGrammar_initialization", (const char *)&unk_1DBD3C55A, buf, 2u);
    }

    v14 = objc_msgSend(v54, "langModel");
    if (!v14)
    {
      psg_default_log_handle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v55;
        _os_log_error_impl(&dword_1DBD27000, v29, OS_LOG_TYPE_ERROR, "Failed to create language model for locale: %@", buf, 0xCu);
      }

      v28 = 0;
      goto LABEL_67;
    }
    v51 = objc_msgSend(v54, "lexicon");
    psg_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_generate(v15);

    psg_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBD27000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PSGWordBoundaryFSTGrammar_tokenization", (const char *)&unk_1DBD3C55A, buf, 2u);
    }

    v56 = 0;
    v57 = 0;
    v58 = 0;
    v19 = v7;
    v20 = v55;
    v52 = v19;

    v63 = 0;
    v64 = &v63;
    v65 = 0x4812000000;
    v66 = __Block_byref_object_copy__54;
    v67 = __Block_byref_object_dispose__55;
    v68 = "";
    __p = 0;
    v70 = 0;
    v71 = 0;
    if (LMStreamTokenizerCreate())
    {
      v21 = objc_retainAutorelease(v19);
      v22 = objc_msgSend(v21, "cStringUsingEncoding:", 4);
      v23 = objc_msgSend(v21, "lengthOfBytesUsingEncoding:", 4);
      if (v22 && v23)
      {
        SharedVocabulary = LMVocabularyGetSharedVocabulary();
        v61[0] = 0;
        v61[1] = v61;
        v61[2] = 0x3032000000;
        v61[3] = __Block_byref_object_copy_;
        v61[4] = __Block_byref_object_dispose_;
        v62 = 0;
        v59[0] = 0;
        v59[1] = v59;
        v59[2] = 0x3032000000;
        v59[3] = __Block_byref_object_copy_;
        v59[4] = __Block_byref_object_dispose_;
        v60 = 0;
        v25 = objc_msgSend(v20, "hasPrefix:", CFSTR("zh"));
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = ___ZL12tokenizeTextPvS_P8NSStringS1__block_invoke;
        v73 = &unk_1EA3F0A50;
        v78 = SharedVocabulary;
        v79 = v51;
        v80 = v25;
        v74 = &v63;
        v75 = v61;
        v76 = v59;
        v77 = v14;
        LMStreamTokenizerPushBytes();
        LMStreamTokenizerRelease();
        v26 = (const void *)v64[6];
        v27 = v64[7];
        if (v26 == (const void *)v27)
        {
          v27 = v64[6];
        }
        else if (*(_DWORD *)(v27 - 4) == 2)
        {
          v27 -= 4;
          v64[7] = v27;
        }
        v56 = 0;
        v57 = 0;
        v58 = 0;
        std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v56, v26, v27, (v27 - (uint64_t)v26) >> 2);
        _Block_object_dispose(v59, 8);

        v19 = v52;
        _Block_object_dispose(v61, 8);

LABEL_30:
        _Block_object_dispose(&v63, 8);
        if (__p)
        {
          v70 = __p;
          operator delete(__p);
        }

        psg_default_log_handle();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v16 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DBD27000, v32, OS_SIGNPOST_INTERVAL_END, v16, "PSGWordBoundaryFSTGrammar_tokenization", (const char *)&unk_1DBD3C55A, buf, 2u);
        }

        v34 = v56;
        v33 = v57;
        psg_default_log_handle();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v34 == (_DWORD *)v33)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1DBD27000, v36, OS_LOG_TYPE_ERROR, "Tokenizer returns no token.", buf, 2u);
          }

          v46 = 0;
          v28 = 0;
          if (!v34)
            goto LABEL_67;
        }
        else
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v37 = objc_msgSend(v52, "length");
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)&buf[4] = v37;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = (v33 - (_BYTE *)v34) >> 2;
            *(_WORD *)&buf[22] = 2112;
            v73 = v20;
            _os_log_impl(&dword_1DBD27000, v36, OS_LOG_TYPE_DEFAULT, "Context length: %tu, #tokens: %lu, locale: %@", buf, 0x20u);
          }

          psg_default_log_handle();
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = os_signpost_id_generate(v38);

          psg_default_log_handle();
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = v40;
          if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1DBD27000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "PSGWordBoundaryFSTGrammar_prediction", (const char *)&unk_1DBD3C55A, buf, 2u);
          }

          v42 = (v33 - (_BYTE *)v34) >> 2;
          if (!LMLanguageModelCreatePredictionEnumerator())
            goto LABEL_59;
          for (i = 0; ; ++i)
          {
            v44 = LMPredictionEnumeratorAdvance();
            if (i < 0x64)
              v45 = v44;
            else
              v45 = 0;
            if (v45 != 1)
            {
              v46 = 0;
              goto LABEL_56;
            }
            *(_DWORD *)buf = 0;
            LMPredictionEnumeratorGetPrediction();
            if (*(_DWORD *)buf)
            {
              if (LMLanguageModelTokenHasAttributes())
                break;
            }
          }
          v46 = LMLanguageModelCopyTokenAttributes();
LABEL_56:
          psg_default_log_handle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = i;
            _os_log_debug_impl(&dword_1DBD27000, v47, OS_LOG_TYPE_DEBUG, "Prediction enumerator advance #: %d", buf, 8u);
          }

          LMPredictionEnumeratorRelease();
          if (!v46)
          {
LABEL_59:
            if ((v34[v42 - 1] & 0x80000000) != 0)
            {
              -[PSGWordBoundaryFSTGrammar _getPrimingToken:transientTokenID:](self, "_getPrimingToken:transientTokenID:", v14);
              v46 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v46 = 0;
            }
          }
          psg_default_log_handle();
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = v48;
          if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1DBD27000, v49, OS_SIGNPOST_INTERVAL_END, v39, "PSGWordBoundaryFSTGrammar_prediction", (const char *)&unk_1DBD3C55A, buf, 2u);
          }

        }
        operator delete(v34);
        v28 = (void *)v46;
LABEL_67:

        goto LABEL_68;
      }
      psg_default_log_handle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DBD27000, v30, OS_LOG_TYPE_ERROR, "Cannot convert input string with UTF8 encoding.", buf, 2u);
      }
    }
    else
    {
      psg_default_log_handle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v20;
        _os_log_error_impl(&dword_1DBD27000, v30, OS_LOG_TYPE_ERROR, "Cannot create tokenizer for %@ locale.", buf, 0xCu);
      }
    }

    v57 = 0;
    v58 = 0;
    v56 = 0;
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v56, (const void *)v64[6], v64[7], (v64[7] - v64[6]) >> 2);
    goto LABEL_30;
  }
  v28 = 0;
LABEL_68:

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lmWrapperQueue, 0);
  objc_storeStrong((id *)&self->_lmWrapperCache, 0);
}

void __58__PSGWordBoundaryFSTGrammar_getOTAPathForProactiveBundle___block_invoke(uint64_t a1, const __CFURL *a2, int a3, int a4, CFTypeRef cf1, _BYTE *a6)
{
  CFStringRef v9;
  uint64_t v10;
  void *v11;

  if (CFEqual(cf1, CFSTR("ProactiveStatementGrammarFST")))
  {
    v9 = CFURLCopyPath(a2);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a6 = 1;
  }
}

void __58__PSGWordBoundaryFSTGrammar_getOTAPathForProactiveBundle___block_invoke_2(uint64_t a1, const __CFURL *a2, int a3, int a4, CFTypeRef cf1, _BYTE *a6)
{
  CFStringRef v9;
  uint64_t v10;
  void *v11;

  if (CFEqual(cf1, CFSTR("ProactiveStatementGrammarFST")))
  {
    v9 = CFURLCopyPath(a2);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a6 = 1;
  }
}

void __43__PSGWordBoundaryFSTGrammar_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1DF0B9950]();
  v1 = objc_opt_new();
  v2 = (void *)+[PSGWordBoundaryFSTGrammar sharedInstance]::_pasExprOnceResult;
  +[PSGWordBoundaryFSTGrammar sharedInstance]::_pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end

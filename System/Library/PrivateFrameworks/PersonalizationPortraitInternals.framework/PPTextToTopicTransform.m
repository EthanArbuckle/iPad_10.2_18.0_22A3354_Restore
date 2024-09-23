@implementation PPTextToTopicTransform

- (id)_init
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  PPTextToTopicTransform *v8;
  void *v9;
  NSObject *v10;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filepathForFactor:namespaceName:", CFSTR("highLevelTextTopics.trie"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v9;
      _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "trie path not found in %@", (uint8_t *)&v13, 0xCu);

    }
    goto LABEL_9;
  }
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filepathForFactor:namespaceName:", CFSTR("highLevelTextTopics.dat"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
  v7 = objc_claimAutoreleasedReturnValue();

  if (!-[NSObject length](v7, "length"))
  {
    pp_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "weights path not found in %@", (uint8_t *)&v13, 0xCu);

    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  self = (PPTextToTopicTransform *)-[PPTextToTopicTransform _initWithVocabulary:weights:](self, "_initWithVocabulary:weights:", v5, v7);
  v8 = self;
LABEL_10:

  return v8;
}

- (id)_initWithVocabulary:(id)a3 weights:(id)a4
{
  id v7;
  id v8;
  PPTextToTopicTransform *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _PASLock *lock;
  NSString *mappingId;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PPTextToTopicTransform;
  v9 = -[PPTextToTopicTransform init](&v21, sel_init);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0D815F0]);
    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v10, "initWithGuardedData:", v11);
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v12;

    objc_storeStrong((id *)&v9->_vocabularyPath, a3);
    objc_storeStrong((id *)&v9->_weightsPath, a4);
    mappingId = v9->_mappingId;
    v9->_mappingId = (NSString *)CFSTR("high-level-topics-extraction");

    location = 0;
    objc_initWeak(&location, v9);
    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__PPTextToTopicTransform__initWithVocabulary_weights___block_invoke;
    v18[3] = &unk_1E7E1FCC0;
    objc_copyWeak(&v19, &location);
    v16 = (id)objc_msgSend(v15, "addUpdateHandlerForNamespaceName:block:", CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"), v18);

    if ((-[PPTextToTopicTransform _updateFromAssetData]((uint64_t)v9) & 1) == 0)
    {

      v9 = 0;
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeUpdateHandlerForToken:", self->_trialToken);

  v4.receiver = self;
  v4.super_class = (Class)PPTextToTopicTransform;
  -[PPTextToTopicTransform dealloc](&v4, sel_dealloc);
}

- (unint64_t)outputTopicCount
{
  _PASLock *lock;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PPTextToTopicTransform_outputTopicCount__block_invoke;
  v5[3] = &unk_1E7E1A240;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)threshold
{
  _PASLock *lock;
  float v3;
  _QWORD v5[5];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PPTextToTopicTransform_threshold__block_invoke;
  v5[3] = &unk_1E7E1A240;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)iterateTopicsForText:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  _PASLock *lock;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__PPTextToTopicTransform_iterateTopicsForText_block___block_invoke;
  v12[3] = &unk_1E7E1A290;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);

}

- (id)_payloadForTopic:(unsigned int)a3
{
  uint64_t v3;
  _PASLock *lock;
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = *(_QWORD *)&a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__12592;
  v13 = __Block_byref_object_dispose__12593;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PPTextToTopicTransform__payloadForTopic___block_invoke;
  v8[3] = &unk_1E7E1A240;
  v8[4] = &v9;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  objc_msgSend(v5, "payloadForTopic:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUpdateNotificationToken, 0);
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_weightsPath, 0);
  objc_storeStrong((id *)&self->_vocabularyPath, 0);
  objc_storeStrong((id *)&self->_trialToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __43__PPTextToTopicTransform__payloadForTopic___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __53__PPTextToTopicTransform_iterateTopicsForText_block___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  __CFString *v4;
  __CFStringTokenizer *v5;
  void *v6;
  CFMutableStringRef MutableWithExternalCharactersNoCopy;
  CFRange CurrentTokenRange;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  unsigned int i;
  uint64_t v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  const __CFAllocator *externalCharactersAllocator;
  id v37;
  _QWORD v38[7];
  uint64_t v39;
  int *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  UniChar chars[500];
  uint64_t v52;
  CFRange v53;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * objc_msgSend(*(id *)(a1 + 32), "outputTopicCount"));
  v4 = *(__CFString **)(a1 + 40);
  v53.length = -[__CFString length](v4, "length");
  v53.location = 0;
  v5 = CFStringTokenizerCreate(0, v4, v53, 0, 0);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *(const char **)(a1 + 56);
    v32 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v31, v32, CFSTR("PPTextToTopicTransform.m"), 161, CFSTR("tokenizer was nil in %@"), v33);

  }
  v6 = (void *)objc_opt_new();
  bzero(chars, 0x3E8uLL);
  externalCharactersAllocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
  MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(0, chars, 0, 500, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  while (CFStringTokenizerAdvanceToNextToken(v5))
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v5);
    if (CurrentTokenRange.length <= 500)
    {
      CFStringGetCharacters(*(CFStringRef *)(a1 + 40), CurrentTokenRange, chars);
      CFStringSetExternalCharactersNoCopy(MutableWithExternalCharactersNoCopy, chars, CurrentTokenRange.length, 500);
      CFStringFold(MutableWithExternalCharactersNoCopy, 0x181uLL, 0);
      CFStringNormalize(MutableWithExternalCharactersNoCopy, kCFStringNormalizationFormKC);
      if (CFStringGetCharactersPtr(MutableWithExternalCharactersNoCopy) == chars)
      {
        v9 = objc_msgSend(v3[1], "payloadForString:", MutableWithExternalCharactersNoCopy);
        if (v9)
        {
          v10 = (v9 - 1);
          v11 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v13, "integerValue") + 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v15);

        }
      }
      else
      {
        CFRelease(MutableWithExternalCharactersNoCopy);
        MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(0, chars, 0, 500, externalCharactersAllocator);
      }
    }
  }
  CFRelease(MutableWithExternalCharactersNoCopy);
  CFRelease(v5);
  if (objc_msgSend(v6, "count"))
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v16 = malloc_type_malloc(4 * objc_msgSend(v6, "count"), 0x100004052888210uLL);
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v34);
    }
    v48[3] = (uint64_t)v16;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v17 = malloc_type_malloc(4 * objc_msgSend(v6, "count"), 0x100004052888210uLL);
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v35);
    }
    v44[3] = (uint64_t)v17;
    v39 = 0;
    v40 = (int *)&v39;
    v41 = 0x2020000000;
    v42 = 0;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __53__PPTextToTopicTransform_iterateTopicsForText_block___block_invoke_2;
    v38[3] = &unk_1E7E1A268;
    v38[4] = &v47;
    v38[5] = &v39;
    v38[6] = &v43;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v38);
    objc_msgSend(v3[2], "applyFeatureSmoothing:vectorLength:", v44[3], v40[6]);
    objc_msgSend(v3[2], "applyFeatureScaling:vectorLength:", v44[3], v40[6]);
    objc_msgSend(v3[2], "applyFeatureNormalization:vectorLength:", v44[3], v40[6]);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 2 * objc_msgSend(*(id *)(a1 + 32), "outputTopicCount"));
    v19 = objc_msgSend(objc_retainAutorelease(v37), "mutableBytes");
    v20 = objc_retainAutorelease(v18);
    v21 = objc_msgSend(v20, "mutableBytes");
    if (v40[6] >= 1)
    {
      v23 = 0;
      do
      {
        LODWORD(v22) = *(_DWORD *)(v44[3] + 4 * v23);
        objc_msgSend(v3[2], "addWeightedTopicScoreToBuffer:countNonZeroComponentsInBuffer:qid:score:", v19, v21, *(unsigned int *)(v48[3] + 4 * v23++), v22);
      }
      while (v23 < v40[6]);
    }
    free((void *)v48[3]);
    free((void *)v44[3]);
    objc_msgSend(v3[2], "addBias:", v19);
    objc_msgSend(v3[2], "applyOutputScaling:vectorLength:", v19, objc_msgSend(*(id *)(a1 + 32), "outputTopicCount"));
    objc_msgSend(v3[2], "applyOutputActivation:", v19);
    objc_msgSend(v3[2], "applyOutputAttenuation:nonzeroCounts:", v19, v21);
    for (i = 0; ; i = v25 + 1)
    {
      v25 = i;
      if (objc_msgSend(*(id *)(a1 + 32), "outputTopicCount") <= (unint64_t)i)
        break;
      v26 = (void *)MEMORY[0x1C3BD6630]();
      v27 = *(float *)(v19 + 4 * i);
      objc_msgSend(v3[2], "threshold");
      if (v27 >= v28)
      {
        objc_msgSend(*(id *)(a1 + 32), "_payloadForTopic:", i);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(float))(*(_QWORD *)(a1 + 48) + 16))(*(float *)(v19 + 4 * v25));

      }
      objc_autoreleasePoolPop(v26);
    }

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);
  }

}

void __53__PPTextToTopicTransform_iterateTopicsForText_block___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  int v6;
  int v7;

  v5 = a3;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 4 * *(int *)(*(_QWORD *)(a1[5] + 8) + 24)) = objc_msgSend(a2, "integerValue");
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * (int)(*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = v7;
}

uint64_t __35__PPTextToTopicTransform_threshold__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v4;

  result = objc_msgSend(*(id *)(a2 + 16), "threshold");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

uint64_t __42__PPTextToTopicTransform_outputTopicCount__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a2 + 16), "outputTopicCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __54__PPTextToTopicTransform__initWithVocabulary_weights___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PPTextToTopicTransform _updateFromAssetData]((uint64_t)WeakRetained);

}

- (uint64_t)_updateFromAssetData
{
  uint64_t v1;
  void *v2;
  PPTopicTransform *v3;
  PPTopicTransform *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v1 = a1;
  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81548]), "initWithPath:", *(_QWORD *)(a1 + 24));
    if (v2)
    {
      v3 = -[PPTopicTransform initWithPath:mappingId:]([PPTopicTransform alloc], "initWithPath:mappingId:", *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
      if (v3)
      {
        v4 = v3;
        v5 = *(void **)(v1 + 8);
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __46__PPTextToTopicTransform__updateFromAssetData__block_invoke;
        v13[3] = &unk_1E7E1A218;
        v14 = v2;
        v6 = v4;
        v15 = v6;
        objc_msgSend(v5, "runWithLockAcquired:", v13);

        v1 = 1;
LABEL_11:

        return v1;
      }
      pp_topics_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(v1 + 32);
        NSStringFromSelector(sel__updateFromAssetData);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v11;
        v18 = 2112;
        v19 = v12;
        _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "nil topicTransform loaded from %@ in %@", buf, 0x16u);

      }
      v6 = 0;
    }
    else
    {
      pp_default_log_handle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(v1 + 24);
        NSStringFromSelector(sel__updateFromAssetData);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v7;
        v18 = 2112;
        v19 = v8;
        _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "nil vocabulary trie loaded from %@ in %@", buf, 0x16u);

      }
    }
    v1 = 0;
    goto LABEL_11;
  }
  return v1;
}

void __46__PPTextToTopicTransform__updateFromAssetData__block_invoke(uint64_t a1, id *a2)
{
  id *v4;

  objc_storeStrong(a2 + 1, *(id *)(a1 + 32));
  v4 = a2;
  objc_storeStrong(v4 + 2, *(id *)(a1 + 40));

}

+ (PPTextToTopicTransform)sharedInstance
{
  if (sharedInstance__pasOnceToken2_12628 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_12628, &__block_literal_global_12629);
  return (PPTextToTopicTransform *)(id)sharedInstance__pasExprOnceResult_12630;
}

void __40__PPTextToTopicTransform_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = -[PPTextToTopicTransform _init]([PPTextToTopicTransform alloc], "_init");
  v2 = (void *)sharedInstance__pasExprOnceResult_12630;
  sharedInstance__pasExprOnceResult_12630 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

@end

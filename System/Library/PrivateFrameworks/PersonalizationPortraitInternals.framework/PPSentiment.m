@implementation PPSentiment

- (PPSentiment)init
{
  PPSentiment *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _PASLock *lock;
  _PASLock *v11;
  id v12;
  id v13;
  unsigned int v14;
  uint64_t v15;
  float v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  PPSentiment *v20;
  objc_super v22;
  uint8_t v23[8];
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  __int128 *p_buf;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  __int128 buf;
  uint64_t v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PPSentiment;
  v2 = -[PPSentiment init](&v22, sel_init);
  if (!v2)
    goto LABEL_18;
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filepathForFactor:namespaceName:", CFSTR("SentimentTokenWeight.trie"), CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "treatmentNameForNamespaceName:", CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    pp_default_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = CFSTR("SentimentTokenWeight.trie");
      _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, "PPSentiment: Could not find asset path for %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_19;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v39 = 0x2020000000;
  v40 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v7 = objc_alloc(MEMORY[0x1E0D815F0]);
  v8 = (void *)objc_opt_new();
  v9 = objc_msgSend(v7, "initWithGuardedData:", v8);
  lock = v2->_lock;
  v2->_lock = (_PASLock *)v9;

  v11 = v2->_lock;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __29__PPSentiment__loadAssetData__block_invoke;
  v24[3] = &unk_1E7E18C08;
  v12 = v6;
  v25 = v12;
  v13 = v4;
  v26 = v13;
  v27 = &v30;
  p_buf = &buf;
  v29 = &v34;
  -[_PASLock runWithLockAcquired:](v11, "runWithLockAcquired:", v24);
  if (*((_BYTE *)v31 + 24))
  {
    v14 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);
    if (v14)
    {
      v15 = *((unsigned int *)v35 + 6);
      if ((_DWORD)v15)
      {
        v16 = ((double)v14 + (double)v14) / 4294967300.0;
        v2->_weightBucketSize = v16;
        v2->_intercept = v16 * (float)(v15 - 0x80000000);
        v17 = 1;
        goto LABEL_17;
      }
      pp_default_log_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_error_impl(&dword_1C392E000, v19, OS_LOG_TYPE_ERROR, "PPSentiment: Token weight trie does not contain intercept key", v23, 2u);
      }
    }
    else
    {
      pp_default_log_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_error_impl(&dword_1C392E000, v19, OS_LOG_TYPE_ERROR, "PPSentiment: Token weight trie does not contain range key", v23, 2u);
      }
    }

  }
  v17 = 0;
LABEL_17:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&buf, 8);

  if (!v17)
  {
LABEL_19:
    v20 = 0;
    goto LABEL_20;
  }
LABEL_18:
  v20 = v2;
LABEL_20:

  return v20;
}

- (float)sentimentScoreForText:(id)a3
{
  id v4;
  void *v5;
  _PASLock *lock;
  float v7;
  _QWORD v9[4];
  id v10;
  PPSentiment *v11;
  uint64_t *v12;
  uint64_t v13;
  float *v14;
  uint64_t v15;
  float intercept;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13 = 0;
    v14 = (float *)&v13;
    v15 = 0x2020000000;
    intercept = self->_intercept;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__PPSentiment_sentimentScoreForText___block_invoke;
    v9[3] = &unk_1E7E18C78;
    v10 = v4;
    v11 = self;
    v12 = &v13;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
    v7 = 2.0 / (exp((float)-v14[6]) + 1.0) + -1.0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7 = INFINITY;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUpdateNotificationToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __37__PPSentiment_sentimentScoreForText___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t v4;
  id *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id *v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(v3[2], "result");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(*(id *)(a1 + 32), "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__PPSentiment_sentimentScoreForText___block_invoke_2;
  v7[3] = &unk_1E7E18C50;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = *(_OWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v6, "enumerateTokensInRange:usingBlock:", 0, v4, v7);
  objc_msgSend(v6, "setString:", CFSTR("⌘"));

}

void __37__PPSentiment_sentimentScoreForText___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  float v11;

  v6 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "payloadForString:", v8);
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
      v11 = *(float *)(v10 + 8) * (float)(v9 - 0x80000000);
    else
      v11 = 0.0;
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11
                                                               + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
  }

  objc_autoreleasePoolPop(v6);
}

void __29__PPSentiment__loadAssetData__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __int16 v9[8];

  v3 = a2;
  objc_storeStrong(v3 + 3, *(id *)(a1 + 32));
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81548]), "initWithPath:", *(_QWORD *)(a1 + 40));
  v5 = v3[1];
  v3[1] = (id)v4;

  if (v3[1])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:idleTimeout:", &__block_literal_global_9650, 1.0);
    v7 = v3[2];
    v3[2] = (id)v6;

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3[1], "payloadForString:", CFSTR("_half_range_"));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v3[1], "payloadForString:", CFSTR("_intercept_"));
  }
  else
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 0;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "PPSentiment: Failed to create token weight trie", (uint8_t *)v9, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

id __29__PPSentiment__loadAssetData__block_invoke_18()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE180]), "initWithUnit:", 0);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_9659 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_9659, &__block_literal_global_24);
  return (id)sharedInstance__pasExprOnceResult_9660;
}

void __29__PPSentiment_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_9660;
  sharedInstance__pasExprOnceResult_9660 = v1;

  objc_autoreleasePoolPop(v0);
}

@end

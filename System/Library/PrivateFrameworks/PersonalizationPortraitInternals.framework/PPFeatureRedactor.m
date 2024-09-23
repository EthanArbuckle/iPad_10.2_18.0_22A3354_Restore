@implementation PPFeatureRedactor

- (PPFeatureRedactor)initWithTrialWrapper:(id)a3 namespaceName:(id)a4
{
  id v7;
  id v8;
  PPFeatureRedactor *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _PASLock *lock;
  void *v14;
  void *v15;
  id v16;
  _PASLock *v17;
  id v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[8];
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PPFeatureRedactor;
  v9 = -[PPFeatureRedactor init](&v21, sel_init);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0D815F0]);
    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v10, "initWithGuardedData:", v11);
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v12;

    objc_storeStrong((id *)&v9->_trialWrapper, a3);
    -[PPTrialWrapper plistForFactorName:namespaceName:](v9->_trialWrapper, "plistForFactorName:namespaceName:", CFSTR("FeatureRedactorConfiguration.plist"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
      v17 = v9->_lock;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __40__PPFeatureRedactor__loadWithAssetData___block_invoke;
      v25 = &unk_1E7E1D400;
      v18 = v16;
      v26 = v18;
      -[_PASLock runWithLockAcquired:](v17, "runWithLockAcquired:", buf);

    }
    else
    {
      pp_default_log_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C392E000, v19, OS_LOG_TYPE_ERROR, "No asset data found for feature redactor.", buf, 2u);
      }

    }
  }

  return v9;
}

- (void)transformFeaturesInPlace:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PPFeatureRedactor_transformFeaturesInPlace___block_invoke;
  v7[3] = &unk_1E7E1D428;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

  _Block_object_dispose(v10, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __46__PPFeatureRedactor_transformFeaturesInPlace___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  char v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v19;
    *(_QWORD *)&v7 = 138412290;
    v17 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3[1], "objectForKeyedSubscript:", v11, v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length"))
        {
          if (!*((_BYTE *)v3 + 17))
            goto LABEL_21;
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v12);

LABEL_20:
          objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v11);
          goto LABEL_21;
        }
        if (*((_BYTE *)v3 + 16))
          v14 = 0;
        else
          v14 = v4;
        if ((v14 & 1) == 0)
          goto LABEL_20;
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        {
          pp_default_log_handle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "Feature redaction is disabled and features not in the allow list are present", buf, 2u);
          }

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        }
        pp_private_log_handle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v17;
          v23 = v11;
          _os_log_debug_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEBUG, "Feature %@ not redacted!", buf, 0xCu);
        }

LABEL_21:
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

}

void __40__PPFeatureRedactor__loadWithAssetData___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ShouldRedact"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v7 = v5, (isKindOfClass & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v20 = 138412290;
        v21 = CFSTR("ShouldRedact");
        _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v20, 0xCu);
      }
      v7 = &unk_1E7E5C0F8;
    }
    v8 = v7;

    v9 = objc_msgSend(v8, "BOOLValue");
    v3[16] = v9;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ShouldTranslate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 || (objc_opt_class(), v11 = objc_opt_isKindOfClass(), v12 = v10, (v11 & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v20 = 138412290;
        v21 = CFSTR("ShouldTranslate");
        _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v20, 0xCu);
      }
      v12 = &unk_1E7E5C0F8;
    }
    v13 = v12;

    v14 = objc_msgSend(v13, "BOOLValue");
    v3[17] = v14;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Translations"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15 || (objc_opt_class(), v16 = objc_opt_isKindOfClass(), v17 = v15, (v16 & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v20 = 138412290;
        v21 = CFSTR("Translations");
        _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v20, 0xCu);
      }
      v17 = (void *)MEMORY[0x1E0C9AA70];
    }
    v18 = v17;

    v19 = (void *)*((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = v18;

  }
}

@end

@implementation PPConfiguration

double __47__PPConfiguration_socialHighlightDecayInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 456);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __54__PPConfiguration_socialHighlightCacheTimeoutInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 472);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __50__PPConfiguration_socialHighlightMaxNumHighlights__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 496);
  return result;
}

uint64_t __43__PPConfiguration_socialHighlightTopKCount__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 500);
  return result;
}

+ (id)sharedInstance
{
  void *v2;
  void *v3;
  BOOL v4;
  PPConfiguration *v5;
  void *v6;
  id v7;

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&configLock_22535);
  v3 = (void *)sharedConfig;
  if (!sharedConfig || (!*(_QWORD *)(sharedConfig + 32) ? (v4 = v2 == 0) : (v4 = 1), !v4))
  {
    v5 = -[PPConfiguration initWithTrialWrapper:]([PPConfiguration alloc], "initWithTrialWrapper:", v2);
    v6 = (void *)sharedConfig;
    sharedConfig = (uint64_t)v5;

    v3 = (void *)sharedConfig;
  }
  v7 = v3;
  pthread_mutex_unlock(&configLock_22535);

  return v7;
}

- (double)socialHighlightDecayInterval
{
  _PASLock *lock;
  double v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x2020000000;
  v11 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PPConfiguration_socialHighlightDecayInterval__block_invoke;
  v8[3] = &unk_1E7E1F6B0;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(double *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.SocialLayer"));
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("SharedWithYouDecayOverride"));
  if (v5 >= 1)
  {
    pp_social_highlights_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "PPConfiguration: Social highlights decay override with nonzero value found: %ld", (uint8_t *)&buf, 0xCu);
    }

    v3 = (double)v5;
  }

  return v3;
}

- (unsigned)socialHighlightMaxNumHighlights
{
  _PASLock *lock;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PPConfiguration_socialHighlightMaxNumHighlights__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)extractionAlgorithmsForBundleId:(id)a3 sourceLanguage:(id)a4 conservative:(BOOL)a5 domain:(unsigned __int8)a6
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _PASLock *v26;
  _PASLock *lock;
  _PASLock *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  _PASLRUCache *cachedAlgorithms;
  void *v53;
  void *v55;
  void *v56;
  id v57;
  void *context;
  unsigned int v59;
  id v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  id v64;
  id obj;
  id v66;
  __CFString *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t);
  void *v76;
  _BYTE *v77;
  _BYTE v78[128];
  _QWORD v79[3];
  _BYTE buf[48];
  uint64_t v81;

  v59 = a6;
  v6 = a5;
  v81 = *MEMORY[0x1E0C80C00];
  v66 = a3;
  v60 = a4;
  context = (void *)MEMORY[0x1C3BD6630]();
  v8 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsFromLocaleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C997E8];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &stru_1E7E221D0;
  if (v13)
    v15 = (__CFString *)v13;
  v68 = v15;

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v60);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v12);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = v68;
  if (v17)
    v19 = (void *)v17;
  v64 = v19;

  if (self)
  {
    if (v59 > 2)
      v20 = CFSTR("UNK_ALGORITHM");
    else
      v20 = off_1E7E1F6F8[v59];
    v63 = v20;
  }
  else
  {
    v63 = 0;
  }
  pp_default_log_handle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "localeIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v63;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v60;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v56;
    *(_WORD *)&buf[32] = 2112;
    *(_QWORD *)&buf[34] = v66;
    _os_log_debug_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEBUG, "PPConfiguration: %@: determining extraction algorithms based on detected language %@, system language %@, and bundle %@", buf, 0x2Au);

  }
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@:%@:%d"), v63, v64, v66, v6);
  -[_PASLRUCache objectForKey:](self->_cachedAlgorithms, "objectForKey:", v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    pp_default_log_handle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEBUG, "PPConfiguration: returning cached value for extraction algorithms.", buf, 2u);
    }

    pp_default_log_handle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v63;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v61;
      _os_log_impl(&dword_1C392E000, v23, OS_LOG_TYPE_DEFAULT, "PPConfiguration: %@: running the following algorithms: %@", buf, 0x16u);
    }

    v24 = v61;
    v25 = v61;
  }
  else
  {
    if (v59 == 2)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__22184;
      *(_QWORD *)&buf[32] = __Block_byref_object_dispose__22185;
      *(_QWORD *)&buf[40] = 0;
      lock = self->_lock;
      v73 = MEMORY[0x1E0C809B0];
      v74 = 3221225472;
      v75 = __40__PPConfiguration__dictionaryForDomain___block_invoke_3;
      v76 = &unk_1E7E1F6B0;
      v77 = buf;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v73);
      v57 = *(id *)(*(_QWORD *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

    }
    else if (v59 == 1)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__22184;
      *(_QWORD *)&buf[32] = __Block_byref_object_dispose__22185;
      *(_QWORD *)&buf[40] = 0;
      v28 = self->_lock;
      v73 = MEMORY[0x1E0C809B0];
      v74 = 3221225472;
      v75 = __40__PPConfiguration__dictionaryForDomain___block_invoke_2;
      v76 = &unk_1E7E1F6B0;
      v77 = buf;
      -[_PASLock runWithLockAcquired:](v28, "runWithLockAcquired:", &v73);
      v57 = *(id *)(*(_QWORD *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

    }
    else if (v59)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1C3BD6630]());
      v57 = (id)MEMORY[0x1E0C9AA70];
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__22184;
      *(_QWORD *)&buf[32] = __Block_byref_object_dispose__22185;
      *(_QWORD *)&buf[40] = 0;
      v26 = self->_lock;
      v73 = MEMORY[0x1E0C809B0];
      v74 = 3221225472;
      v75 = __40__PPConfiguration__dictionaryForDomain___block_invoke;
      v76 = &unk_1E7E1F6B0;
      v77 = buf;
      -[_PASLock runWithLockAcquired:](v26, "runWithLockAcquired:", &v73);
      v57 = *(id *)(*(_QWORD *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

    }
    pp_default_log_handle();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v30)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v63;
        _os_log_debug_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEBUG, "PPConfiguration: %@: running only conservative algorithms.", buf, 0xCu);
      }

      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("CONSERVATIVE_RULES"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("CONSERVATIVE"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "initWithArray:", v33);
    }
    else
    {
      if (v30)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v63;
        _os_log_debug_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEBUG, "PPConfiguration: %@: running non-conservative algorithms.", buf, 0xCu);
      }

      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("AGGRESSIVE_RULES"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("AGGRESSIVE"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v35, "initWithArray:", v33);
    }
    v36 = (void *)v34;

    v37 = objc_alloc(MEMORY[0x1E0C99E40]);
    v79[0] = CFSTR("*");
    v79[1] = v68;
    v79[2] = v64;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v37, "initWithArray:", v38);

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v39;
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v70 != v41)
            objc_enumerationMutation(obj);
          v43 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          v44 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v31, "objectForKeyedSubscript:", v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPConfiguration _algorithmsForNode:bundleId:customRules:](self, "_algorithmsForNode:bundleId:customRules:", v43, v66, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v36, "unionSet:", v46);
          if (objc_msgSend(v43, "isEqualToString:", v68)
            && -[__CFString isEqualToString:](v68, "isEqualToString:", v64))
          {
            objc_msgSend(v31, "objectForKeyedSubscript:", v43);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[PPConfiguration _algorithmsToDelete:bundleId:customRules:](self, "_algorithmsToDelete:bundleId:customRules:", v43, v66, v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            pp_default_log_handle();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v63;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v48;
              *(_WORD *)&buf[22] = 2048;
              *(_QWORD *)&buf[24] = v59;
              *(_WORD *)&buf[32] = 2112;
              *(_QWORD *)&buf[34] = v43;
              _os_log_impl(&dword_1C392E000, v49, OS_LOG_TYPE_INFO, "PPConfiguration: %@: removing algorithms %@ for domain %lu and language %@.", buf, 0x2Au);
            }

            objc_msgSend(v36, "minusSet:", v48);
          }

          objc_autoreleasePoolPop(v44);
        }
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v40);
    }

    if (objc_msgSend(v36, "count"))
    {
      -[PPConfiguration _mapAlgorithmNamesToNumbers:domain:](self, "_mapAlgorithmNamesToNumbers:domain:", v36, v59);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      pp_default_log_handle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v63;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v25;
        _os_log_impl(&dword_1C392E000, v50, OS_LOG_TYPE_DEFAULT, "PPConfiguration: %@: running the following algorithms: %@", buf, 0x16u);
      }

      -[_PASLRUCache setObject:forKey:](self->_cachedAlgorithms, "setObject:forKey:", v25, v62);
    }
    else
    {
      pp_default_log_handle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v63;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v59;
        *(_WORD *)&buf[18] = 2112;
        *(_QWORD *)&buf[20] = v68;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v66;
        _os_log_impl(&dword_1C392E000, v51, OS_LOG_TYPE_DEFAULT, "PPConfiguration: %@: not running any algorithms for domain %d as language %@ has no algorithms for bundle ID %@", buf, 0x26u);
      }

      cachedAlgorithms = self->_cachedAlgorithms;
      v53 = (void *)objc_opt_new();
      -[_PASLRUCache setObject:forKey:](cachedAlgorithms, "setObject:forKey:", v53, v62);

      v25 = (id)objc_opt_new();
    }

    v24 = 0;
  }

  objc_autoreleasePoolPop(context);
  return v25;
}

- (BOOL)isMultilingual
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (unsigned)socialHighlightTopKCount
{
  _PASLock *lock;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PPConfiguration_socialHighlightTopKCount__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)socialHighlightCacheTimeoutInterval
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PPConfiguration_socialHighlightCacheTimeoutInterval__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (PPConfiguration)initWithTrialWrapper:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  _PASLock *lock;
  uint64_t v9;
  _PASLRUCache *cachedAlgorithms;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  PPTrialWrapper *trialWrapper;
  id v17;
  id v19;
  PPConfiguration *val;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id location;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PPConfiguration;
  val = -[PPConfiguration init](&v28, sel_init);
  if (val)
  {
    v5 = objc_alloc(MEMORY[0x1E0D815F0]);
    v6 = (void *)objc_opt_new();
    v7 = objc_msgSend(v5, "initWithGuardedData:", v6);
    lock = val->_lock;
    val->_lock = (_PASLock *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 32);
    cachedAlgorithms = val->_cachedAlgorithms;
    val->_cachedAlgorithms = (_PASLRUCache *)v9;

    objc_storeStrong((id *)&val->_trialWrapper, a3);
    -[PPConfiguration _loadConfigParams](val, "_loadConfigParams");
    location = 0;
    objc_initWeak(&location, val);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = objc_msgSend(&unk_1E7E5BDE8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v24;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(&unk_1E7E5BDE8);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          trialWrapper = val->_trialWrapper;
          v21[0] = v13;
          v21[1] = 3221225472;
          v21[2] = __40__PPConfiguration_initWithTrialWrapper___block_invoke;
          v21[3] = &unk_1E7E1F660;
          v21[4] = v15;
          objc_copyWeak(&v22, &location);
          v17 = -[PPTrialWrapper addUpdateHandlerForNamespaceName:block:](trialWrapper, "addUpdateHandlerForNamespaceName:block:", v15, v21);
          objc_destroyWeak(&v22);
        }
        v11 = objc_msgSend(&unk_1E7E5BDE8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v11);
    }
    objc_destroyWeak(&location);
  }

  return val;
}

- (id)trialWrapperReloadingIfNeeded
{
  PPTrialWrapper *trialWrapper;

  trialWrapper = self->_trialWrapper;
  if (trialWrapper)
    return trialWrapper;
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_loadGlobalConfigParams
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PPConfiguration__loadGlobalConfigParams__block_invoke;
  v3[3] = &unk_1E7E1F688;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (void)_loadGlobalConfigParamsWithGuardedData:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  id v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  NSObject *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  NSObject *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  NSObject *v59;
  id v60;
  id v61;
  void *v62;
  char v63;
  void *v64;
  NSObject *v65;
  id v66;
  id v67;
  void *v68;
  char v69;
  void *v70;
  NSObject *v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  char v76;
  void *v77;
  NSObject *v78;
  id v79;
  id v80;
  void *v81;
  char v82;
  void *v83;
  NSObject *v84;
  id v85;
  id v86;
  __CFString *v87;
  char v88;
  __CFString *v89;
  NSObject *v90;
  id v91;
  __CFString *v92;
  id v93;
  void *v94;
  char v95;
  void *v96;
  NSObject *v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  char v102;
  void *v103;
  NSObject *v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  char v109;
  void *v110;
  NSObject *v111;
  id v112;
  id v113;
  id v114;
  void *v115;
  char v116;
  void *v117;
  NSObject *v118;
  id v119;
  id v120;
  void *v121;
  char v122;
  void *v123;
  NSObject *v124;
  id v125;
  id v126;
  void *v127;
  char v128;
  void *v129;
  NSObject *v130;
  id v131;
  id v132;
  int v133;
  void *v134;
  char v135;
  void *v136;
  NSObject *v137;
  id v138;
  id v139;
  id v140;
  void *v141;
  char v142;
  void *v143;
  NSObject *v144;
  id v145;
  id v146;
  int v147;
  void *v148;
  char v149;
  void *v150;
  NSObject *v151;
  id v152;
  id v153;
  void *v154;
  char v155;
  void *v156;
  NSObject *v157;
  id v158;
  id v159;
  void *v160;
  char v161;
  void *v162;
  NSObject *v163;
  id v164;
  id v165;
  void *v166;
  void *v167;
  char v168;
  void *v169;
  NSObject *v170;
  id v171;
  id v172;
  void *v173;
  char v174;
  void *v175;
  NSObject *v176;
  id v177;
  id v178;
  id v179;
  void *v180;
  char v181;
  void *v182;
  NSObject *v183;
  id v184;
  id v185;
  void *v186;
  char v187;
  void *v188;
  NSObject *v189;
  id v190;
  id v191;
  void *v192;
  char v193;
  void *v194;
  NSObject *v195;
  id v196;
  id v197;
  int v198;
  const __CFString *v199;
  _QWORD v200[2];

  v200[1] = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "plistForFactorName:namespaceName:", CFSTR("configuration.plist"), CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v198) = 0;
        _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v198, 2u);
      }

      v10 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "defaultFilepathForFactor:namespaceName:", CFSTR("configuration.plist"), CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "initWithContentsOfFile:", v12);

      v7 = (void *)v13;
    }
  }
  -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "concatenatedTreatmentNames");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (__CFString *)v15;
  else
    v17 = CFSTR("TRIAL_NOT_AVAILABLE");
  v18 = v17;

  objc_storeStrong(v4 + 12, v17);
  objc_storeStrong(v4 + 13, v17);
  v200[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v200, 1);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v4[14];
  v4[14] = (id)v19;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HalfValuePosition"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v23 = v21, (isKindOfClass & 1) == 0))
  {
    v24 = MEMORY[0x1E0C81028];
    v25 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("HalfValuePosition");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v23 = &unk_1E7E5C108;
  }
  v26 = v23;

  objc_msgSend(v26, "doubleValue");
  v4[2] = v27;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NonReaderTextWeight"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28 || (objc_opt_class(), v29 = objc_opt_isKindOfClass(), v30 = v28, (v29 & 1) == 0))
  {
    v31 = MEMORY[0x1E0C81028];
    v32 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("NonReaderTextWeight");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v30 = &unk_1E7E5C108;
  }
  v33 = v30;

  objc_msgSend(v33, "doubleValue");
  v4[3] = v34;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AnalyticsSamplingRate"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35 || (objc_opt_class(), v36 = objc_opt_isKindOfClass(), v37 = v35, (v36 & 1) == 0))
  {
    v38 = MEMORY[0x1E0C81028];
    v39 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("AnalyticsSamplingRate");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v37 = &unk_1E7E5C108;
  }
  v40 = v37;

  objc_msgSend(v40, "doubleValue");
  v4[4] = v41;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MusicDataCollectionSamplingRateForCTS"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v42 || (objc_opt_class(), v43 = objc_opt_isKindOfClass(), v44 = v42, (v43 & 1) == 0))
  {
    v45 = MEMORY[0x1E0C81028];
    v46 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("MusicDataCollectionSamplingRateForCTS");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v44 = &unk_1E7E5C108;
  }
  v47 = v44;

  objc_msgSend(v47, "doubleValue");
  v4[5] = v48;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MusicDataCollectionSamplingRateForAMP"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v49 || (objc_opt_class(), v50 = objc_opt_isKindOfClass(), v51 = v49, (v50 & 1) == 0))
  {
    v52 = MEMORY[0x1E0C81028];
    v53 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("MusicDataCollectionSamplingRateForAMP");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v51 = &unk_1E7E5C108;
  }
  v54 = v51;

  objc_msgSend(v54, "doubleValue");
  v4[6] = v55;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MusicDataCollectionMaximumRecordsPerType"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v56 || (objc_opt_class(), v57 = objc_opt_isKindOfClass(), v58 = v56, (v57 & 1) == 0))
  {
    v59 = MEMORY[0x1E0C81028];
    v60 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("MusicDataCollectionMaximumRecordsPerType");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v58 = &unk_1E7E5C108;
  }
  v61 = v58;

  *((_DWORD *)v4 + 14) = objc_msgSend(v61, "intValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MusicDataCollectionCollectNonAMPNowPlaying"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v62 || (objc_opt_class(), v63 = objc_opt_isKindOfClass(), v64 = v62, (v63 & 1) == 0))
  {
    v65 = MEMORY[0x1E0C81028];
    v66 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("MusicDataCollectionCollectNonAMPNowPlaying");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v64 = &unk_1E7E5C108;
  }
  v67 = v64;

  *((_BYTE *)v4 + 60) = objc_msgSend(v67, "BOOLValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MusicDataCollectionAMPBundleIds"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v68 || (objc_opt_class(), v69 = objc_opt_isKindOfClass(), v70 = v68, (v69 & 1) == 0))
  {
    v71 = MEMORY[0x1E0C81028];
    v72 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("MusicDataCollectionAMPBundleIds");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v70 = (void *)MEMORY[0x1E0C9AA60];
  }
  v73 = v70;

  v74 = v4[8];
  v4[8] = v73;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SportsMetricsNumberOfTeamsLogged"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v75 || (objc_opt_class(), v76 = objc_opt_isKindOfClass(), v77 = v75, (v76 & 1) == 0))
  {
    v78 = MEMORY[0x1E0C81028];
    v79 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("SportsMetricsNumberOfTeamsLogged");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v77 = &unk_1E7E5C108;
  }
  v80 = v77;

  *((_DWORD *)v4 + 18) = objc_msgSend(v80, "intValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SportsMetricsNumberOfLeaguesLogged"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v81 || (objc_opt_class(), v82 = objc_opt_isKindOfClass(), v83 = v81, (v82 & 1) == 0))
  {
    v84 = MEMORY[0x1E0C81028];
    v85 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("SportsMetricsNumberOfLeaguesLogged");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v83 = &unk_1E7E5C108;
  }
  v86 = v83;

  *((_DWORD *)v4 + 19) = objc_msgSend(v86, "intValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SportsMetricsEventName"));
  v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v87 || (objc_opt_class(), v88 = objc_opt_isKindOfClass(), v89 = v87, (v88 & 1) == 0))
  {
    v90 = MEMORY[0x1E0C81028];
    v91 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("SportsMetricsEventName");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v89 = &stru_1E7E221D0;
  }
  v92 = v89;

  v93 = v4[10];
  v4[10] = v92;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SportsMetricsSamplingRate"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v94 || (objc_opt_class(), v95 = objc_opt_isKindOfClass(), v96 = v94, (v95 & 1) == 0))
  {
    v97 = MEMORY[0x1E0C81028];
    v98 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("SportsMetricsSamplingRate");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v96 = &unk_1E7E5C108;
  }
  v99 = v96;

  objc_msgSend(v99, "doubleValue");
  v4[11] = v100;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TopicsSourceMultiplier"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v101 || (objc_opt_class(), v102 = objc_opt_isKindOfClass(), v103 = v101, (v102 & 1) == 0))
  {
    v104 = MEMORY[0x1E0C81028];
    v105 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("TopicsSourceMultiplier");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v103 = (void *)MEMORY[0x1E0C9AA70];
  }
  v106 = v103;

  v107 = v4[16];
  v4[16] = v106;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TopicsAlgorithmMultiplier"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v108 || (objc_opt_class(), v109 = objc_opt_isKindOfClass(), v110 = v108, (v109 & 1) == 0))
  {
    v111 = MEMORY[0x1E0C81028];
    v112 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("TopicsAlgorithmMultiplier");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v110 = (void *)MEMORY[0x1E0C9AA70];
  }
  v113 = v110;

  v114 = v4[17];
  v4[17] = v113;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SafariDonationTitleExtractionEnabled"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v115 || (objc_opt_class(), v116 = objc_opt_isKindOfClass(), v117 = v115, (v116 & 1) == 0))
  {
    v118 = MEMORY[0x1E0C81028];
    v119 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("SafariDonationTitleExtractionEnabled");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v117 = &unk_1E7E5C108;
  }
  v120 = v117;

  *((_BYTE *)v4 + 176) = objc_msgSend(v120, "BOOLValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SafariDataDetectorsEnabledForHighMemoryDevices"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v121 || (objc_opt_class(), v122 = objc_opt_isKindOfClass(), v123 = v121, (v122 & 1) == 0))
  {
    v124 = MEMORY[0x1E0C81028];
    v125 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("SafariDataDetectorsEnabledForHighMemoryDevices");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v123 = &unk_1E7E5C108;
  }
  v126 = v123;

  *((_BYTE *)v4 + 177) = objc_msgSend(v126, "BOOLValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FeedbackSessionLogsSamplingRate"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v127 || (objc_opt_class(), v128 = objc_opt_isKindOfClass(), v129 = v127, (v128 & 1) == 0))
  {
    v130 = MEMORY[0x1E0C81028];
    v131 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("FeedbackSessionLogsSamplingRate");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v129 = &unk_1E7E5C108;
  }
  v132 = v129;

  objc_msgSend(v132, "floatValue");
  *((_DWORD *)v4 + 48) = v133;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FeedbackSessionLogsSamplingRateOverrides"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v134 || (objc_opt_class(), v135 = objc_opt_isKindOfClass(), v136 = v134, (v135 & 1) == 0))
  {
    v137 = MEMORY[0x1E0C81028];
    v138 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("FeedbackSessionLogsSamplingRateOverrides");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v136 = (void *)MEMORY[0x1E0C9AA70];
  }
  v139 = v136;

  v140 = v4[25];
  v4[25] = v139;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FeedbackSessionLogsExtractionsSamplingRate"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v141 || (objc_opt_class(), v142 = objc_opt_isKindOfClass(), v143 = v141, (v142 & 1) == 0))
  {
    v144 = MEMORY[0x1E0C81028];
    v145 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("FeedbackSessionLogsExtractionsSamplingRate");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v143 = &unk_1E7E5C108;
  }
  v146 = v143;

  objc_msgSend(v146, "floatValue");
  *((_DWORD *)v4 + 52) = v147;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FeedbackSessionLogsGeohashLength"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v148 || (objc_opt_class(), v149 = objc_opt_isKindOfClass(), v150 = v148, (v149 & 1) == 0))
  {
    v151 = MEMORY[0x1E0C81028];
    v152 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("FeedbackSessionLogsGeohashLength");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v150 = &unk_1E7E5C108;
  }
  v153 = v150;

  *((_DWORD *)v4 + 53) = objc_msgSend(v153, "intValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AnalyticsMaximumNumberOfRecords"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v154 || (objc_opt_class(), v155 = objc_opt_isKindOfClass(), v156 = v154, (v155 & 1) == 0))
  {
    v157 = MEMORY[0x1E0C81028];
    v158 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("AnalyticsMaximumNumberOfRecords");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v156 = &unk_1E7E5C108;
  }
  v159 = v156;

  *((_DWORD *)v4 + 54) = objc_msgSend(v159, "intValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DecayedFeedbackCountsHalfLifeDays"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v160 || (objc_opt_class(), v161 = objc_opt_isKindOfClass(), v162 = v160, (v161 & 1) == 0))
  {
    v163 = MEMORY[0x1E0C81028];
    v164 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("DecayedFeedbackCountsHalfLifeDays");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v162 = &unk_1E7E5C108;
  }
  v165 = v162;

  objc_msgSend(v165, "doubleValue");
  v4[32] = v166;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NotificationExtractionEnabled"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v167 || (objc_opt_class(), v168 = objc_opt_isKindOfClass(), v169 = v167, (v168 & 1) == 0))
  {
    v170 = MEMORY[0x1E0C81028];
    v171 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("NotificationExtractionEnabled");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v169 = &unk_1E7E5C108;
  }
  v172 = v169;

  *((_BYTE *)v4 + 264) = objc_msgSend(v172, "BOOLValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EngagementKValues"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v173 || (objc_opt_class(), v174 = objc_opt_isKindOfClass(), v175 = v173, (v174 & 1) == 0))
  {
    v176 = MEMORY[0x1E0C81028];
    v177 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("EngagementKValues");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v175 = (void *)MEMORY[0x1E0C9AA60];
  }
  v178 = v175;

  v179 = v4[34];
  v4[34] = v178;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SentenceEmbeddingVersion"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v180 || (objc_opt_class(), v181 = objc_opt_isKindOfClass(), v182 = v180, (v181 & 1) == 0))
  {
    v183 = MEMORY[0x1E0C81028];
    v184 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("SentenceEmbeddingVersion");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v182 = &unk_1E7E5C108;
  }
  v185 = v182;

  v4[53] = (id)objc_msgSend(v185, "unsignedIntegerValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EnableECRMessageTokenCountsPlugin"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v186 || (objc_opt_class(), v187 = objc_opt_isKindOfClass(), v188 = v186, (v187 & 1) == 0))
  {
    v189 = MEMORY[0x1E0C81028];
    v190 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("EnableECRMessageTokenCountsPlugin");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v188 = &unk_1E7E5C108;
  }
  v191 = v188;

  *((_BYTE *)v4 + 520) = objc_msgSend(v191, "BOOLValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MaxUniqueTokensInECRTokenCounts"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v192 || (objc_opt_class(), v193 = objc_opt_isKindOfClass(), v194 = v192, (v193 & 1) == 0))
  {
    v195 = MEMORY[0x1E0C81028];
    v196 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
    {
      v198 = 138412290;
      v199 = CFSTR("MaxUniqueTokensInECRTokenCounts");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v194 = &unk_1E7E5A920;
  }
  v197 = v194;

  v4[66] = (id)objc_msgSend(v197, "unsignedLongValue");
  objc_autoreleasePoolPop(v5);

}

- (void)_loadLocationsConfigParams
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PPConfiguration__loadLocationsConfigParams__block_invoke;
  v3[3] = &unk_1E7E1F688;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (void)_loadLocationsConfigParamsWithGuardedData:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  id v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  int v29;
  int v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  id v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  id v44;
  char v45;
  void *v46;
  char v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  char v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  char v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  char v65;
  void *v66;
  id v67;
  void *v68;
  int v69;
  const __CFString *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "plistForFactorName:namespaceName:", CFSTR("configuration_locations.plist"), CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v69) = 0;
        _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad locations configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v69, 2u);
      }

      v10 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "defaultFilepathForFactor:namespaceName:", CFSTR("configuration_locations.plist"), CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "initWithContentsOfFile:", v12);

      v7 = (void *)v13;
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Use2StageScoreInterpreterForLocationScoring"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v16 = v14, (isKindOfClass & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v69 = 138412290;
      v70 = CFSTR("Use2StageScoreInterpreterForLocationScoring");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    v16 = &unk_1E7E5C108;
  }
  v17 = v16;

  v18 = objc_msgSend(v17, "BOOLValue");
  v4[282] = v18;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LocationDecayHalfLifeSeconds"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19 || (objc_opt_class(), v20 = objc_opt_isKindOfClass(), v21 = v19, (v20 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v69 = 138412290;
      v70 = CFSTR("LocationDecayHalfLifeSeconds");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    v21 = &unk_1E7E5C108;
  }
  v22 = v21;

  objc_msgSend(v22, "doubleValue");
  v24 = v23;

  *((_QWORD *)v4 + 30) = v24;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ScoreThresholdForLocation"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25 || (objc_opt_class(), v26 = objc_opt_isKindOfClass(), v27 = v25, (v26 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v69 = 138412290;
      v70 = CFSTR("ScoreThresholdForLocation");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    v27 = &unk_1E7E5C108;
  }
  v28 = v27;

  objc_msgSend(v28, "floatValue");
  v30 = v29;

  *((_DWORD *)v4 + 47) = v30;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LocationScoringUsesCoreML"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31 || (objc_opt_class(), v32 = objc_opt_isKindOfClass(), v33 = v31, (v32 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v69 = 138412290;
      v70 = CFSTR("LocationScoringUsesCoreML");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    v33 = &unk_1E7E5C108;
  }
  v34 = v33;

  v35 = objc_msgSend(v34, "BOOLValue");
  v4[296] = v35;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LocationFeedbackUsesCoreML"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36 || (objc_opt_class(), v37 = objc_opt_isKindOfClass(), v38 = v36, (v37 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v69 = 138412290;
      v70 = CFSTR("LocationFeedbackUsesCoreML");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    v38 = &unk_1E7E5C108;
  }
  v39 = v38;

  v40 = objc_msgSend(v39, "BOOLValue");
  v4[267] = v40;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LocationScoringUsesHybrid"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41 || (objc_opt_class(), v42 = objc_opt_isKindOfClass(), v43 = v41, (v42 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v69 = 138412290;
      v70 = CFSTR("LocationScoringUsesHybrid");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    v43 = &unk_1E7E5C108;
  }
  v44 = v43;

  v45 = objc_msgSend(v44, "BOOLValue");
  v4[254] = v45;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RoutineExtractionScoreCountWeight"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v46 || (objc_opt_class(), v47 = objc_opt_isKindOfClass(), v48 = v46, (v47 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v69 = 138412290;
      v70 = CFSTR("RoutineExtractionScoreCountWeight");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    v48 = &unk_1E7E5C108;
  }
  v49 = v48;

  objc_msgSend(v49, "doubleValue");
  v51 = v50;

  *((_QWORD *)v4 + 38) = v51;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RoutineExtractionScoreDurationWeight"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52 || (objc_opt_class(), v53 = objc_opt_isKindOfClass(), v54 = v52, (v53 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v69 = 138412290;
      v70 = CFSTR("RoutineExtractionScoreDurationWeight");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    v54 = &unk_1E7E5C108;
  }
  v55 = v54;

  objc_msgSend(v55, "doubleValue");
  v57 = v56;

  *((_QWORD *)v4 + 39) = v57;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RoutineExtractionScoreDecayHalfLifeDays"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v58 || (objc_opt_class(), v59 = objc_opt_isKindOfClass(), v60 = v58, (v59 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v69 = 138412290;
      v70 = CFSTR("RoutineExtractionScoreDecayHalfLifeDays");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    v60 = &unk_1E7E5C108;
  }
  v61 = v60;

  objc_msgSend(v61, "doubleValue");
  v63 = v62;

  *((_QWORD *)v4 + 40) = v63;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ExtractionAlgorithmConfiguration"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v64 || (objc_opt_class(), v65 = objc_opt_isKindOfClass(), v66 = v64, (v65 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v69 = 138412290;
      v70 = CFSTR("ExtractionAlgorithmConfiguration");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    v66 = (void *)MEMORY[0x1E0C9AA70];
  }
  v67 = v66;

  v68 = (void *)*((_QWORD *)v4 + 20);
  *((_QWORD *)v4 + 20) = v67;

  objc_autoreleasePoolPop(v5);
}

- (void)_loadContactsConfigParams
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PPConfiguration__loadContactsConfigParams__block_invoke;
  v3[3] = &unk_1E7E1F688;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (void)_loadContactsConfigParamsWithGuardedData:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  int v23;
  int v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  int v29;
  int v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  char v35;
  int v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "plistForFactorName:namespaceName:", CFSTR("configuration_contacts.plist"), CFSTR("PERSONALIZATION_PORTRAIT_CONTACTS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v36) = 0;
        _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad contacts configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v36, 2u);
      }

      v10 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "defaultFilepathForFactor:namespaceName:", CFSTR("configuration_contacts.plist"), CFSTR("PERSONALIZATION_PORTRAIT_CONTACTS"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "initWithContentsOfFile:", v12);

      v7 = (void *)v13;
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ContactLabelScoringMap"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v16 = v14, (isKindOfClass & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v36 = 138412290;
      v37 = CFSTR("ContactLabelScoringMap");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v36, 0xCu);
    }
    v16 = (void *)MEMORY[0x1E0C9AA70];
  }
  v17 = v16;

  v18 = (void *)v4[46];
  v4[46] = v17;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RecordSourceContactsInitialScore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19 || (objc_opt_class(), v20 = objc_opt_isKindOfClass(), v21 = v19, (v20 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v36 = 138412290;
      v37 = CFSTR("RecordSourceContactsInitialScore");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v36, 0xCu);
    }
    v21 = &unk_1E7E5C108;
  }
  v22 = v21;

  objc_msgSend(v22, "floatValue");
  v24 = v23;

  *((_DWORD *)v4 + 94) = v24;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RecordSourceNonContactsInitialScore"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25 || (objc_opt_class(), v26 = objc_opt_isKindOfClass(), v27 = v25, (v26 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v36 = 138412290;
      v37 = CFSTR("RecordSourceNonContactsInitialScore");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v36, 0xCu);
    }
    v27 = &unk_1E7E5C108;
  }
  v28 = v27;

  objc_msgSend(v28, "floatValue");
  v30 = v29;

  *((_DWORD *)v4 + 95) = v30;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PeopleSuggesterMaxCount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31 || (objc_opt_class(), v32 = objc_opt_isKindOfClass(), v33 = v31, (v32 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v36 = 138412290;
      v37 = CFSTR("PeopleSuggesterMaxCount");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v36, 0xCu);
    }
    v33 = &unk_1E7E5C108;
  }
  v34 = v33;

  v35 = objc_msgSend(v34, "unsignedIntValue");
  *((_BYTE *)v4 + 384) = v35;

  objc_autoreleasePoolPop(v5);
}

- (void)_loadUniversalSearchConfigParams
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PPConfiguration__loadUniversalSearchConfigParams__block_invoke;
  v3[3] = &unk_1E7E1F688;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (void)_loadUniversalSearchConfigParamsWithGuardedData:(id)a3
{
  _DWORD *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  id v18;
  unsigned __int8 v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  id v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  id v44;
  unsigned __int8 v45;
  void *v46;
  char v47;
  void *v48;
  id v49;
  char v50;
  void *v51;
  char v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  const __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "plistForFactorName:namespaceName:", CFSTR("config_universal_search.plist"), CFSTR("PERSONALIZATION_PORTRAIT_UNIVERSAL_SEARCH"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  pp_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v57 = 138412290;
    v58 = v7;
    _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "ppunivSearch %@", (uint8_t *)&v57, 0xCu);
  }

  if ((unint64_t)-[__CFString count](v7, "count") <= 1)
  {
    -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      pp_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v57) = 0;
        _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad universal search configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v57, 2u);
      }

      v11 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defaultFilepathForFactor:namespaceName:", CFSTR("config_universal_search.plist"), CFSTR("PERSONALIZATION_PORTRAIT_UNIVERSAL_SEARCH"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "initWithContentsOfFile:", v13);

      v7 = (__CFString *)v14;
    }
  }
  -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("MaxNEExtractions"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v17 = v15, (isKindOfClass & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v57 = 138412290;
      v58 = CFSTR("MaxNEExtractions");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    v17 = &unk_1E7E5C108;
  }
  v18 = v17;

  v19 = objc_msgSend(v18, "unsignedIntValue");
  v4[109] = v19;
  -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("ScoreThreshold"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20 || (objc_opt_class(), v21 = objc_opt_isKindOfClass(), v22 = v20, (v21 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v57 = 138412290;
      v58 = CFSTR("ScoreThreshold");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    v22 = &unk_1E7E5C108;
  }
  v23 = v22;

  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  *((_QWORD *)v4 + 55) = v25;
  -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("StoreNewExtractions"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26 || (objc_opt_class(), v27 = objc_opt_isKindOfClass(), v28 = v26, (v27 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v57 = 138412290;
      v58 = CFSTR("StoreNewExtractions");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    v28 = &unk_1E7E5C108;
  }
  v29 = v28;

  v30 = objc_msgSend(v29, "BOOLValue");
  *((_BYTE *)v4 + 448) = v30;
  -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("UseRawNEExtractionScores"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31 || (objc_opt_class(), v32 = objc_opt_isKindOfClass(), v33 = v31, (v32 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v57 = 138412290;
      v58 = CFSTR("UseRawNEExtractionScores");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    v33 = &unk_1E7E5C108;
  }
  v34 = v33;

  v35 = objc_msgSend(v34, "BOOLValue");
  *((_BYTE *)v4 + 449) = v35;
  -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("UseCachedPortraitScores"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36 || (objc_opt_class(), v37 = objc_opt_isKindOfClass(), v38 = v36, (v37 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v57 = 138412290;
      v58 = CFSTR("UseCachedPortraitScores");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    v38 = &unk_1E7E5C108;
  }
  v39 = v38;

  v40 = objc_msgSend(v39, "BOOLValue");
  *((_BYTE *)v4 + 450) = v40;
  -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("MaxItemsInFeatureDictionary"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41 || (objc_opt_class(), v42 = objc_opt_isKindOfClass(), v43 = v41, (v42 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v57 = 138412290;
      v58 = CFSTR("MaxItemsInFeatureDictionary");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    v43 = &unk_1E7E5C108;
  }
  v44 = v43;

  v45 = objc_msgSend(v44, "unsignedIntValue");
  v4[113] = v45;
  -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("SkipInsignificantEmailExtractions"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v46 || (objc_opt_class(), v47 = objc_opt_isKindOfClass(), v48 = v46, (v47 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v57 = 138412290;
      v58 = CFSTR("SkipInsignificantEmailExtractions");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    v48 = &unk_1E7E5C108;
  }
  v49 = v48;

  v50 = objc_msgSend(v49, "BOOLValue");
  *((_BYTE *)v4 + 504) = v50;
  -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("MaxEmailHarvestingEligiblityInterval"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v51 || (objc_opt_class(), v52 = objc_opt_isKindOfClass(), v53 = v51, (v52 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v57 = 138412290;
      v58 = CFSTR("MaxEmailHarvestingEligiblityInterval");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    v53 = &unk_1E7E5A8D8;
  }
  v54 = v53;

  objc_msgSend(v54, "doubleValue");
  v56 = v55;

  *((_QWORD *)v4 + 64) = v56;
  objc_autoreleasePoolPop(v5);

}

- (void)_loadSocialHighlightConfigParams
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PPConfiguration__loadSocialHighlightConfigParams__block_invoke;
  v3[3] = &unk_1E7E1F688;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (void)_loadSocialHighlightConfigParamsWithGuardedData:(id)a3
{
  _DWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  id v17;
  int v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  char v50;
  void *v51;
  id v52;
  int v53;
  void *v54;
  char v55;
  void *v56;
  id v57;
  int v58;
  int v59;
  const __CFString *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "plistForFactorName:namespaceName:", CFSTR("configuration_social_highlight.plist"), CFSTR("PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v59) = 0;
        _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad social highlights configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v59, 2u);
      }

      v10 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "defaultFilepathForFactor:namespaceName:", CFSTR("configuration_social_highlight.plist"), CFSTR("PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "initWithContentsOfFile:", v12);

      v7 = (void *)v13;
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MaxRelevantContacts"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v16 = v14, (isKindOfClass & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v59 = 138412290;
      v60 = CFSTR("MaxRelevantContacts");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    v16 = &unk_1E7E5C108;
  }
  v17 = v16;

  v18 = objc_msgSend(v17, "unsignedIntegerValue");
  v4[108] = v18;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HighlightDecayInterval"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19 || (objc_opt_class(), v20 = objc_opt_isKindOfClass(), v21 = v19, (v20 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v59 = 138412290;
      v60 = CFSTR("HighlightDecayInterval");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    v21 = &unk_1E7E5A8D8;
  }
  v22 = v21;

  objc_msgSend(v22, "doubleValue");
  v24 = v23;

  *((_QWORD *)v4 + 57) = v24;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RankedStorageMaxAge"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25 || (objc_opt_class(), v26 = objc_opt_isKindOfClass(), v27 = v25, (v26 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v59 = 138412290;
      v60 = CFSTR("RankedStorageMaxAge");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    v27 = &unk_1E7E5A908;
  }
  v28 = v27;

  objc_msgSend(v28, "doubleValue");
  v30 = v29;

  *((_QWORD *)v4 + 58) = v30;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CacheTimeoutInterval"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31 || (objc_opt_class(), v32 = objc_opt_isKindOfClass(), v33 = v31, (v32 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v59 = 138412290;
      v60 = CFSTR("CacheTimeoutInterval");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    v33 = &unk_1E7E5A8F0;
  }
  v34 = v33;

  objc_msgSend(v34, "doubleValue");
  v36 = v35;

  *((_QWORD *)v4 + 59) = v36;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FeedbackDeletionInterval"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37 || (objc_opt_class(), v38 = objc_opt_isKindOfClass(), v39 = v37, (v38 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v59 = 138412290;
      v60 = CFSTR("FeedbackDeletionInterval");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    v39 = &unk_1E7E5A8C0;
  }
  v40 = v39;

  objc_msgSend(v40, "doubleValue");
  v42 = v41;

  *((_QWORD *)v4 + 60) = v42;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MetricReportingInterval"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v43 || (objc_opt_class(), v44 = objc_opt_isKindOfClass(), v45 = v43, (v44 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v59 = 138412290;
      v60 = CFSTR("MetricReportingInterval");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    v45 = &unk_1E7E5A8C0;
  }
  v46 = v45;

  objc_msgSend(v46, "doubleValue");
  v48 = v47;

  *((_QWORD *)v4 + 61) = v48;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MaxNumHighlights"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v49 || (objc_opt_class(), v50 = objc_opt_isKindOfClass(), v51 = v49, (v50 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v59 = 138412290;
      v60 = CFSTR("MaxNumHighlights");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    v51 = &unk_1E7E5A878;
  }
  v52 = v51;

  v53 = objc_msgSend(v52, "unsignedIntegerValue");
  v4[124] = v53;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TopKCount"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v54 || (objc_opt_class(), v55 = objc_opt_isKindOfClass(), v56 = v54, (v55 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v59 = 138412290;
      v60 = CFSTR("TopKCount");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    v56 = &unk_1E7E5A890;
  }
  v57 = v56;

  v58 = objc_msgSend(v57, "unsignedIntegerValue");
  v4[125] = v58;

  objc_autoreleasePoolPop(v5);
}

- (void)_loadQuickTypeConfigParams
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PPConfiguration__loadQuickTypeConfigParams__block_invoke;
  v3[3] = &unk_1E7E1F688;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (void)_loadQuickTypeConfigParamsWithGuardedData:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  int v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  id v33;
  int v34;
  void *v35;
  char v36;
  void *v37;
  id v38;
  int v39;
  void *v40;
  char v41;
  void *v42;
  id v43;
  int v44;
  int v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "plistForFactorName:namespaceName:", CFSTR("configuration_quicktype.plist"), CFSTR("PERSONALIZATION_PORTRAIT_QUICKTYPE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v45) = 0;
        _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad contacts configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v45, 2u);
      }

      v10 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "defaultFilepathForFactor:namespaceName:", CFSTR("configuration_quicktype.plist"), CFSTR("PERSONALIZATION_PORTRAIT_QUICKTYPE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "initWithContentsOfFile:", v12);

      v7 = (void *)v13;
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NavigationMinimumDistanceInMeters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v16 = v14, (isKindOfClass & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v45 = 138412290;
      v46 = CFSTR("NavigationMinimumDistanceInMeters");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v45, 0xCu);
    }
    v16 = &unk_1E7E5C108;
  }
  v17 = v16;

  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  v4[49] = v19;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NavigationMinimumDistanceInMeters"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20 || (objc_opt_class(), v21 = objc_opt_isKindOfClass(), v22 = v20, (v21 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v45 = 138412290;
      v46 = CFSTR("NavigationMinimumDistanceInMeters");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v45, 0xCu);
    }
    v22 = &unk_1E7E5C108;
  }
  v23 = v22;

  v24 = objc_msgSend(v23, "unsignedIntegerValue");
  *((_DWORD *)v4 + 100) = v24;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NextEventFuzzMinutes"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25 || (objc_opt_class(), v26 = objc_opt_isKindOfClass(), v27 = v25, (v26 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v45 = 138412290;
      v46 = CFSTR("NextEventFuzzMinutes");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v45, 0xCu);
    }
    v27 = &unk_1E7E5C108;
  }
  v28 = v27;

  v29 = objc_msgSend(v28, "unsignedIntValue");
  *((_BYTE *)v4 + 404) = v29;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("QueryTimeNextToMinutes"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30 || (objc_opt_class(), v31 = objc_opt_isKindOfClass(), v32 = v30, (v31 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v45 = 138412290;
      v46 = CFSTR("QueryTimeNextToMinutes");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v45, 0xCu);
    }
    v32 = &unk_1E7E5C108;
  }
  v33 = v32;

  v34 = objc_msgSend(v33, "unsignedIntegerValue");
  *((_DWORD *)v4 + 103) = v34;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("QueryTimeNextFromMinutes"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35 || (objc_opt_class(), v36 = objc_opt_isKindOfClass(), v37 = v35, (v36 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v45 = 138412290;
      v46 = CFSTR("QueryTimeNextFromMinutes");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v45, 0xCu);
    }
    v37 = &unk_1E7E5C108;
  }
  v38 = v37;

  v39 = objc_msgSend(v38, "integerValue");
  *((_DWORD *)v4 + 102) = v39;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("QueryTimeOtherToMinutes"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40 || (objc_opt_class(), v41 = objc_opt_isKindOfClass(), v42 = v40, (v41 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v45 = 138412290;
      v46 = CFSTR("QueryTimeOtherToMinutes");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v45, 0xCu);
    }
    v42 = &unk_1E7E5C108;
  }
  v43 = v42;

  v44 = objc_msgSend(v43, "unsignedIntegerValue");
  *((_DWORD *)v4 + 104) = v44;

  objc_autoreleasePoolPop(v5);
}

- (void)_loadNamedEntitiesConfigParams
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__PPConfiguration__loadNamedEntitiesConfigParams__block_invoke;
  v3[3] = &unk_1E7E1F688;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (void)_loadNamedEntitiesConfigParamsWithGuardedData:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  char v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  void *v38;
  char v39;
  void *v40;
  NSObject *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  char v46;
  void *v47;
  NSObject *v48;
  id v49;
  id v50;
  int v51;
  void *v52;
  char v53;
  void *v54;
  NSObject *v55;
  id v56;
  id v57;
  void *v58;
  char v59;
  void *v60;
  NSObject *v61;
  id v62;
  id v63;
  void *v64;
  char v65;
  void *v66;
  NSObject *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  NSObject *v74;
  id v75;
  id v76;
  void *v77;
  char v78;
  void *v79;
  NSObject *v80;
  id v81;
  id v82;
  void *v83;
  char v84;
  void *v85;
  NSObject *v86;
  id v87;
  id v88;
  void *v89;
  char v90;
  void *v91;
  NSObject *v92;
  id v93;
  id v94;
  uint64_t v95;
  void *v96;
  char v97;
  void *v98;
  NSObject *v99;
  id v100;
  id v101;
  void *v102;
  int v103;
  const __CFString *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "plistForFactorName:namespaceName:", CFSTR("configuration_named_entities.plist"), CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v103) = 0;
        _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad named entities configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v103, 2u);
      }

      v10 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "defaultFilepathForFactor:namespaceName:", CFSTR("configuration_named_entities.plist"), CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "initWithContentsOfFile:", v12);

      v7 = (void *)v13;
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NamedEntityFeedbackUsesCoreML"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v16 = v14, (isKindOfClass & 1) == 0))
  {
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("NamedEntityFeedbackUsesCoreML");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v16 = &unk_1E7E5C108;
  }
  v19 = v16;

  v4[265] = objc_msgSend(v19, "BOOLValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MaxNumberNamedEntities"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20 || (objc_opt_class(), v21 = objc_opt_isKindOfClass(), v22 = v20, (v21 & 1) == 0))
  {
    v23 = MEMORY[0x1E0C81028];
    v24 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("MaxNumberNamedEntities");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v22 = &unk_1E7E5A848;
  }
  v25 = v22;

  *((_DWORD *)v4 + 85) = objc_msgSend(v25, "intValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Use2StageScoreInterpreterForNEScoring"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26 || (objc_opt_class(), v27 = objc_opt_isKindOfClass(), v28 = v26, (v27 & 1) == 0))
  {
    v29 = MEMORY[0x1E0C81028];
    v30 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("Use2StageScoreInterpreterForNEScoring");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v28 = &unk_1E7E5C108;
  }
  v31 = v28;

  v4[280] = objc_msgSend(v31, "BOOLValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NamedEntityScoringUsesCoreML"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32 || (objc_opt_class(), v33 = objc_opt_isKindOfClass(), v34 = v32, (v33 & 1) == 0))
  {
    v35 = MEMORY[0x1E0C81028];
    v36 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("NamedEntityScoringUsesCoreML");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v34 = &unk_1E7E5C108;
  }
  v37 = v34;

  v4[249] = objc_msgSend(v37, "BOOLValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NamedEntityDecayHalfLifeSeconds"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38 || (objc_opt_class(), v39 = objc_opt_isKindOfClass(), v40 = v38, (v39 & 1) == 0))
  {
    v41 = MEMORY[0x1E0C81028];
    v42 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("NamedEntityDecayHalfLifeSeconds");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v40 = &unk_1E7E5C108;
  }
  v43 = v40;

  objc_msgSend(v43, "doubleValue");
  *((_QWORD *)v4 + 29) = v44;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ScoreThresholdForNamedEntity"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v45 || (objc_opt_class(), v46 = objc_opt_isKindOfClass(), v47 = v45, (v46 & 1) == 0))
  {
    v48 = MEMORY[0x1E0C81028];
    v49 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("ScoreThresholdForNamedEntity");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v47 = &unk_1E7E5C108;
  }
  v50 = v47;

  objc_msgSend(v50, "floatValue");
  *((_DWORD *)v4 + 45) = v51;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FlattenNamedEntitiesForCoreML"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52 || (objc_opt_class(), v53 = objc_opt_isKindOfClass(), v54 = v52, (v53 & 1) == 0))
  {
    v55 = MEMORY[0x1E0C81028];
    v56 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("FlattenNamedEntitiesForCoreML");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v54 = &unk_1E7E5C108;
  }
  v57 = v54;

  v4[251] = objc_msgSend(v57, "BOOLValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NamedEntityScoringUsesHybrid"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v58 || (objc_opt_class(), v59 = objc_opt_isKindOfClass(), v60 = v58, (v59 & 1) == 0))
  {
    v61 = MEMORY[0x1E0C81028];
    v62 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("NamedEntityScoringUsesHybrid");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v60 = &unk_1E7E5C108;
  }
  v63 = v60;

  v4[252] = objc_msgSend(v63, "BOOLValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DifferentiallyPrivateLogLevels"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v64 || (objc_opt_class(), v65 = objc_opt_isKindOfClass(), v66 = v64, (v65 & 1) == 0))
  {
    v67 = MEMORY[0x1E0C81028];
    v68 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("DifferentiallyPrivateLogLevels");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v66 = (void *)MEMORY[0x1E0C9AA70];
  }
  v69 = v66;

  v70 = (void *)*((_QWORD *)v4 + 15);
  *((_QWORD *)v4 + 15) = v69;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CustomTaggerMaxTokenCount"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v71 || (objc_opt_class(), v72 = objc_opt_isKindOfClass(), v73 = v71, (v72 & 1) == 0))
  {
    v74 = MEMORY[0x1E0C81028];
    v75 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("CustomTaggerMaxTokenCount");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v73 = &unk_1E7E5C108;
  }
  v76 = v73;

  v4[344] = objc_msgSend(v76, "unsignedShortValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NamedEntityLoadAndMonitorInitialLoadLimit"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v77 || (objc_opt_class(), v78 = objc_opt_isKindOfClass(), v79 = v77, (v78 & 1) == 0))
  {
    v80 = MEMORY[0x1E0C81028];
    v81 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("NamedEntityLoadAndMonitorInitialLoadLimit");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v79 = &unk_1E7E5A860;
  }
  v82 = v79;

  *((_DWORD *)v4 + 90) = objc_msgSend(v82, "unsignedIntegerValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MapsSearchQueryLimit"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v83 || (objc_opt_class(), v84 = objc_opt_isKindOfClass(), v85 = v83, (v84 & 1) == 0))
  {
    v86 = MEMORY[0x1E0C81028];
    v87 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("MapsSearchQueryLimit");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v85 = &unk_1E7E5A860;
  }
  v88 = v85;

  *((_DWORD *)v4 + 87) = objc_msgSend(v88, "unsignedIntegerValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MapsSearchQueryFromDateInterval"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v89 || (objc_opt_class(), v90 = objc_opt_isKindOfClass(), v91 = v89, (v90 & 1) == 0))
  {
    v92 = MEMORY[0x1E0C81028];
    v93 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("MapsSearchQueryFromDateInterval");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v91 = &unk_1E7E5A8A8;
  }
  v94 = v91;

  objc_msgSend(v94, "doubleValue");
  *((_QWORD *)v4 + 44) = v95;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ExtractionAlgorithmConfiguration"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v96 || (objc_opt_class(), v97 = objc_opt_isKindOfClass(), v98 = v96, (v97 & 1) == 0))
  {
    v99 = MEMORY[0x1E0C81028];
    v100 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      v103 = 138412290;
      v104 = CFSTR("ExtractionAlgorithmConfiguration");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v98 = (void *)MEMORY[0x1E0C9AA70];
  }
  v101 = v98;

  v102 = (void *)*((_QWORD *)v4 + 18);
  *((_QWORD *)v4 + 18) = v101;

  objc_autoreleasePoolPop(v5);
}

- (void)_loadTopicsConfigParams
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PPConfiguration__loadTopicsConfigParams__block_invoke;
  v3[3] = &unk_1E7E1F688;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (void)_loadTopicsConfigParamsWithGuardedData:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  int v24;
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  char v32;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  void *v37;
  char v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  char v52;
  void *v53;
  NSObject *v54;
  id v55;
  id v56;
  void *v57;
  char v58;
  void *v59;
  NSObject *v60;
  id v61;
  id v62;
  void *v63;
  char v64;
  void *v65;
  NSObject *v66;
  id v67;
  id v68;
  void *v69;
  char v70;
  void *v71;
  NSObject *v72;
  id v73;
  id v74;
  void *v75;
  char v76;
  void *v77;
  NSObject *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  char v83;
  void *v84;
  NSObject *v85;
  id v86;
  id v87;
  double v88;
  void *v89;
  char v90;
  void *v91;
  NSObject *v92;
  id v93;
  id v94;
  void *v95;
  char v96;
  void *v97;
  NSObject *v98;
  id v99;
  id v100;
  id v101;
  int v102;
  const __CFString *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  v6 = (void *)MEMORY[0x1C3BD6630]();
  -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filepathForFactor:namespaceName:", CFSTR("topicCalibration.trie"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString length](v8, "length"))
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81548]), "initWithPath:", v8);
    objc_storeStrong(v4 + 21, v9);
  }
  else
  {
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = v8;
      _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: Empty or missing asset contents for \"%@\", (uint8_t *)&v102, 0xCu);
    }
  }

  objc_autoreleasePoolPop(v6);
  -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "plistForFactorName:namespaceName:", CFSTR("configuration_topics.plist"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v11, "count") <= 1)
  {
    -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      pp_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v102) = 0;
        _os_log_error_impl(&dword_1C392E000, v13, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad topics configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v102, 2u);
      }

      v14 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[PPConfiguration trialWrapperReloadingIfNeeded](self, "trialWrapperReloadingIfNeeded");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "defaultFilepathForFactor:namespaceName:", CFSTR("configuration_topics.plist"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "initWithContentsOfFile:", v16);

      v11 = (void *)v17;
    }
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("RemoteTopicsMultiplier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v20 = v18, (isKindOfClass & 1) == 0))
  {
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("RemoteTopicsMultiplier");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v20 = &unk_1E7E5C108;
  }
  v23 = v20;

  objc_msgSend(v23, "floatValue");
  *((_DWORD *)v4 + 2) = v24;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TopicFeedbackUsesCoreML"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25 || (objc_opt_class(), v26 = objc_opt_isKindOfClass(), v27 = v25, (v26 & 1) == 0))
  {
    v28 = MEMORY[0x1E0C81028];
    v29 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("TopicFeedbackUsesCoreML");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v27 = &unk_1E7E5C108;
  }
  v30 = v27;

  *((_BYTE *)v4 + 266) = objc_msgSend(v30, "BOOLValue");
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TopicMappingUsesCoreML"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31 || (objc_opt_class(), v32 = objc_opt_isKindOfClass(), v33 = v31, (v32 & 1) == 0))
  {
    v34 = MEMORY[0x1E0C81028];
    v35 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("TopicMappingUsesCoreML");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v33 = &unk_1E7E5C108;
  }
  v36 = v33;

  *((_BYTE *)v4 + 283) = objc_msgSend(v36, "BOOLValue");
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TopicMappingCoreMLThreshold"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37 || (objc_opt_class(), v38 = objc_opt_isKindOfClass(), v39 = v37, (v38 & 1) == 0))
  {
    v40 = MEMORY[0x1E0C81028];
    v41 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("TopicMappingCoreMLThreshold");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v39 = &unk_1E7E5C108;
  }
  v42 = v39;

  objc_msgSend(v42, "doubleValue");
  v4[36] = v43;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("LinearModelHyperparameters"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v44 || (objc_opt_class(), v45 = objc_opt_isKindOfClass(), v46 = v44, (v45 & 1) == 0))
  {
    v47 = MEMORY[0x1E0C81028];
    v48 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("LinearModelHyperparameters");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v46 = (void *)MEMORY[0x1E0C9AA70];
  }
  v49 = v46;

  v50 = v4[41];
  v4[41] = v49;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Use2StageScoreInterpreterForTPScoring"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v51 || (objc_opt_class(), v52 = objc_opt_isKindOfClass(), v53 = v51, (v52 & 1) == 0))
  {
    v54 = MEMORY[0x1E0C81028];
    v55 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("Use2StageScoreInterpreterForTPScoring");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v53 = &unk_1E7E5C108;
  }
  v56 = v53;

  *((_BYTE *)v4 + 281) = objc_msgSend(v56, "BOOLValue");
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FlattenTopicsForCoreML"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v57 || (objc_opt_class(), v58 = objc_opt_isKindOfClass(), v59 = v57, (v58 & 1) == 0))
  {
    v60 = MEMORY[0x1E0C81028];
    v61 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("FlattenTopicsForCoreML");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v59 = &unk_1E7E5C108;
  }
  v62 = v59;

  *((_BYTE *)v4 + 250) = objc_msgSend(v62, "BOOLValue");
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TopicScoringUsesCoreML"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v63 || (objc_opt_class(), v64 = objc_opt_isKindOfClass(), v65 = v63, (v64 & 1) == 0))
  {
    v66 = MEMORY[0x1E0C81028];
    v67 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("TopicScoringUsesCoreML");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v65 = &unk_1E7E5C108;
  }
  v68 = v65;

  *((_BYTE *)v4 + 248) = objc_msgSend(v68, "BOOLValue");
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TopicScoringUsesHybrid"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v69 || (objc_opt_class(), v70 = objc_opt_isKindOfClass(), v71 = v69, (v70 & 1) == 0))
  {
    v72 = MEMORY[0x1E0C81028];
    v73 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("TopicScoringUsesHybrid");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v71 = &unk_1E7E5C108;
  }
  v74 = v71;

  *((_BYTE *)v4 + 253) = objc_msgSend(v74, "BOOLValue");
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TopicDecayHalfLifeSeconds"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v75 || (objc_opt_class(), v76 = objc_opt_isKindOfClass(), v77 = v75, (v76 & 1) == 0))
  {
    v78 = MEMORY[0x1E0C81028];
    v79 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("TopicDecayHalfLifeSeconds");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v77 = &unk_1E7E5C108;
  }
  v80 = v77;

  objc_msgSend(v80, "doubleValue");
  v4[28] = v81;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ScoreThresholdForTopic"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v82 || (objc_opt_class(), v83 = objc_opt_isKindOfClass(), v84 = v82, (v83 & 1) == 0))
  {
    v85 = MEMORY[0x1E0C81028];
    v86 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("ScoreThresholdForTopic");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v84 = &unk_1E7E5C108;
  }
  v87 = v84;

  objc_msgSend(v87, "doubleValue");
  *(float *)&v88 = v88;
  *((_DWORD *)v4 + 46) = LODWORD(v88);

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MaxNumberMappedTopics"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v89 || (objc_opt_class(), v90 = objc_opt_isKindOfClass(), v91 = v89, (v90 & 1) == 0))
  {
    v92 = MEMORY[0x1E0C81028];
    v93 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("MaxNumberMappedTopics");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v91 = &unk_1E7E5C108;
  }
  v94 = v91;

  *((_DWORD *)v4 + 84) = objc_msgSend(v94, "intValue");
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ExtractionAlgorithmConfiguration"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v95 || (objc_opt_class(), v96 = objc_opt_isKindOfClass(), v97 = v95, (v96 & 1) == 0))
  {
    v98 = MEMORY[0x1E0C81028];
    v99 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      v102 = 138412290;
      v103 = CFSTR("ExtractionAlgorithmConfiguration");
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v97 = (void *)MEMORY[0x1E0C9AA70];
  }
  v100 = v97;

  v101 = v4[19];
  v4[19] = v100;

  objc_autoreleasePoolPop(v5);
}

- (void)_loadConfigParams
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__PPConfiguration__loadConfigParams__block_invoke;
  v3[3] = &unk_1E7E1F688;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (float)remoteTopicsMultiplier
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
  v5[2] = __41__PPConfiguration_remoteTopicsMultiplier__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)portraitVariantName
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22184;
  v10 = __Block_byref_object_dispose__22185;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__PPConfiguration_portraitVariantName__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)naturalPortraitVariantName
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22184;
  v10 = __Block_byref_object_dispose__22185;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PPConfiguration_naturalPortraitVariantName__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)availablePortraitVariantNames
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22184;
  v10 = __Block_byref_object_dispose__22185;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PPConfiguration_availablePortraitVariantNames__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (double)halfValuePosition
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PPConfiguration_halfValuePosition__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)nonReaderTextWeight
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__PPConfiguration_nonReaderTextWeight__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)topicsMultiplierForBundleId:(id)a3 algorithm:(unint64_t)a4
{
  id v6;
  void *v7;
  _PASLock *lock;
  id v9;
  id v10;
  uint64_t *v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *, _QWORD *);
  void *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__22184;
  v38 = __Block_byref_object_dispose__22185;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__22184;
  v32 = __Block_byref_object_dispose__22185;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0D70CD0], "describeAlgorithm:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  lock = self->_lock;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __57__PPConfiguration_topicsMultiplierForBundleId_algorithm___block_invoke;
  v23 = &unk_1E7E1F6D8;
  v26 = &v34;
  v9 = v6;
  v24 = v9;
  v27 = &v28;
  v10 = v7;
  v25 = v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v20);
  v11 = v35;
  if (v35[5])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
    v11 = v35;
    v12 = (void *)v35[5];
  }
  else
  {
    v12 = 0;
  }
  v11[5] = (uint64_t)&unk_1E7E5C118;

LABEL_6:
  v13 = v29;
  if (!v29[5])
  {
    v14 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = v29;
    v14 = (void *)v29[5];
LABEL_10:
    v13[5] = (uint64_t)&unk_1E7E5C118;

  }
  objc_msgSend((id)v35[5], "floatValue", v20, v21, v22, v23);
  v16 = v15;
  objc_msgSend((id)v29[5], "floatValue");
  v18 = v16 * v17;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

- (id)differentiallyPrivateEntityLogLevels
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22184;
  v10 = __Block_byref_object_dispose__22185;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PPConfiguration_differentiallyPrivateEntityLogLevels__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_algorithmsForNode:(id)a3 bundleId:(id)a4 customRules:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a5;
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ADD"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BUNDLES"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ADD"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v13);

    }
  }
  else
  {
    v8 = (void *)objc_opt_new();
  }

  return v8;
}

- (id)_algorithmsToDelete:(id)a3 bundleId:(id)a4 customRules:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a5;
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DEL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BUNDLES"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DEL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v13);

    }
  }
  else
  {
    v8 = (void *)objc_opt_new();
  }

  return v8;
}

- (id)_mapAlgorithmNamesToNumbers:(id)a3 domain:(unsigned __int8)a4
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BD6630]();
  v7 = (void *)objc_opt_new();
  objc_autoreleasePoolPop(v6);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
      if (v4 == 2)
      {
        v14 = (void *)MEMORY[0x1E0D70B90];
      }
      else if (v4 == 1)
      {
        v14 = (void *)MEMORY[0x1E0D70BD8];
      }
      else
      {
        if (v4)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0, (_QWORD)v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        v14 = (void *)MEMORY[0x1E0D70CD0];
      }
      objc_msgSend(v14, "algorithmForName:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12), (_QWORD)v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v16 = v15;
      if (!objc_msgSend(v15, "unsignedIntegerValue"))
      {
        pp_default_log_handle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v13;
          v26 = 1024;
          v27 = v4;
          _os_log_fault_impl(&dword_1C392E000, v18, OS_LOG_TYPE_FAULT, "PPConfiguration: unknown algorithm %@ in domain %d", buf, 0x12u);
        }

        v17 = (void *)objc_opt_new();
        goto LABEL_21;
      }
      objc_msgSend(v7, "addObject:", v16);

      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  v17 = (void *)objc_msgSend(v7, "copy");
LABEL_21:

  return v17;
}

- (double)portraitAnalyticsSamplingRate
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PPConfiguration_portraitAnalyticsSamplingRate__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)portraitMusicDataCollectionSamplingRateForCTS
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PPConfiguration_portraitMusicDataCollectionSamplingRateForCTS__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)portraitMusicDataCollectionSamplingRateForAMP
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PPConfiguration_portraitMusicDataCollectionSamplingRateForAMP__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)portraitMusicDataCollectionMaximumRecordsPerType
{
  _PASLock *lock;
  int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PPConfiguration_portraitMusicDataCollectionMaximumRecordsPerType__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)portraitMusicDataCollectionCollectNonAMPNowPlaying
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PPConfiguration_portraitMusicDataCollectionCollectNonAMPNowPlaying__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)portraitMusicDataCollectionAMPBundleIds
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22184;
  v10 = __Block_byref_object_dispose__22185;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PPConfiguration_portraitMusicDataCollectionAMPBundleIds__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (int)sportsMetricsNumberOfTeamsLogged
{
  _PASLock *lock;
  int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PPConfiguration_sportsMetricsNumberOfTeamsLogged__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)sportsMetricsNumberOfLeaguesLogged
{
  _PASLock *lock;
  int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PPConfiguration_sportsMetricsNumberOfLeaguesLogged__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)sportsMetricsEventName
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22184;
  v10 = __Block_byref_object_dispose__22185;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_sportsMetricsEventName__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (double)sportsMetricsSamplingRate
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PPConfiguration_sportsMetricsSamplingRate__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)topicCalibrationTrie
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22184;
  v10 = __Block_byref_object_dispose__22185;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PPConfiguration_topicCalibrationTrie__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)safariDonationTitleExtractionEnabled
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PPConfiguration_safariDonationTitleExtractionEnabled__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)safariDataDetectorsEnabledForHighMemoryDevices
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PPConfiguration_safariDataDetectorsEnabledForHighMemoryDevices__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)scoreThresholdForNamedEntity
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
  v5[2] = __47__PPConfiguration_scoreThresholdForNamedEntity__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)scoreThresholdForTopic
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
  v5[2] = __41__PPConfiguration_scoreThresholdForTopic__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)scoreThresholdForLocation
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
  v5[2] = __44__PPConfiguration_scoreThresholdForLocation__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)feedbackSessionLogsSamplingRate
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
  v5[2] = __50__PPConfiguration_feedbackSessionLogsSamplingRate__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)feedbackSessionLogsSamplingRateOverrides
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22184;
  v10 = __Block_byref_object_dispose__22185;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PPConfiguration_feedbackSessionLogsSamplingRateOverrides__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (float)feedbackSessionLogsExtractionsSamplingRate
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
  v5[2] = __61__PPConfiguration_feedbackSessionLogsExtractionsSamplingRate__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)feedbackSessionLogsGeohashLength
{
  _PASLock *lock;
  int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PPConfiguration_feedbackSessionLogsGeohashLength__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)portraitAnalyticsMaximumNumberOfRecords
{
  _PASLock *lock;
  int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PPConfiguration_portraitAnalyticsMaximumNumberOfRecords__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)topicDecayHalfLifeSeconds
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PPConfiguration_topicDecayHalfLifeSeconds__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)namedEntityDecayHalfLifeSeconds
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PPConfiguration_namedEntityDecayHalfLifeSeconds__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)locationDecayHalfLifeSeconds
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PPConfiguration_locationDecayHalfLifeSeconds__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)topicScoringUsesCoreML
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_topicScoringUsesCoreML__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)namedEntityScoringUsesCoreML
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PPConfiguration_namedEntityScoringUsesCoreML__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)namedEntityScoringUsesHybrid
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PPConfiguration_namedEntityScoringUsesHybrid__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)topicScoringUsesHybrid
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_topicScoringUsesHybrid__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)locationScoringUsesHybrid
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PPConfiguration_locationScoringUsesHybrid__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)flattenTopicsForCoreML
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_flattenTopicsForCoreML__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)flattenNamedEntitiesForCoreML
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PPConfiguration_flattenNamedEntitiesForCoreML__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)decayedFeedbackCountsHalfLifeDays
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PPConfiguration_decayedFeedbackCountsHalfLifeDays__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)notificationExtractionEnabled
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PPConfiguration_notificationExtractionEnabled__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)namedEntityFeedbackUsesCoreML
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PPConfiguration_namedEntityFeedbackUsesCoreML__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)topicFeedbackUsesCoreML
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PPConfiguration_topicFeedbackUsesCoreML__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)locationFeedbackUsesCoreML
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PPConfiguration_locationFeedbackUsesCoreML__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)engagementKValues
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22184;
  v10 = __Block_byref_object_dispose__22185;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PPConfiguration_engagementKValues__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)use2StageScoreInterpreterForNEScoring
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PPConfiguration_use2StageScoreInterpreterForNEScoring__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)use2StageScoreInterpreterForTPScoring
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PPConfiguration_use2StageScoreInterpreterForTPScoring__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)use2StageScoreInterpreterForLocationScoring
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__PPConfiguration_use2StageScoreInterpreterForLocationScoring__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)topicMappingUsesCoreML
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_topicMappingUsesCoreML__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)topicMappingCoreMLThreshold
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PPConfiguration_topicMappingCoreMLThreshold__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)locationScoringUsesCoreML
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PPConfiguration_locationScoringUsesCoreML__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)routineExtractionScoreCountWeight
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PPConfiguration_routineExtractionScoreCountWeight__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)routineExtractionScoreDurationWeight
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PPConfiguration_routineExtractionScoreDurationWeight__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)routineExtractionScoreDecayHalfLifeDays
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PPConfiguration_routineExtractionScoreDecayHalfLifeDays__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)maxNumberMappedTopics
{
  _PASLock *lock;
  int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PPConfiguration_maxNumberMappedTopics__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)maxNumberNamedEntities
{
  _PASLock *lock;
  int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_maxNumberNamedEntities__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)customTaggerMaxTokenCount
{
  _PASLock *lock;
  unsigned __int8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PPConfiguration_customTaggerMaxTokenCount__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)namedEntityLoadAndMonitorInitialLoadLimit
{
  _PASLock *lock;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PPConfiguration_namedEntityLoadAndMonitorInitialLoadLimit__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)mapsSearchQueryLimit
{
  _PASLock *lock;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PPConfiguration_mapsSearchQueryLimit__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)mapsSearchQueryFromDateInterval
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PPConfiguration_mapsSearchQueryFromDateInterval__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)contactsLabelScoringMap
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22184;
  v10 = __Block_byref_object_dispose__22185;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PPConfiguration_contactsLabelScoringMap__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (float)recordSourceContactsInitialScore
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
  v5[2] = __51__PPConfiguration_recordSourceContactsInitialScore__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)recordSourceNonContactsInitialScore
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
  v5[2] = __54__PPConfiguration_recordSourceNonContactsInitialScore__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)peopleSuggesterMax
{
  _PASLock *lock;
  unsigned __int8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__PPConfiguration_peopleSuggesterMax__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)navigationMinimumTimeInterval
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PPConfiguration_navigationMinimumTimeInterval__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)navigationMinimumDistanceInMeters
{
  _PASLock *lock;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PPConfiguration_navigationMinimumDistanceInMeters__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)nextEventsFuzzMinutes
{
  _PASLock *lock;
  unsigned __int8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PPConfiguration_nextEventsFuzzMinutes__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)queryTimeNextToMinutes
{
  _PASLock *lock;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_queryTimeNextToMinutes__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)queryTimeNextFromMinutes
{
  _PASLock *lock;
  int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PPConfiguration_queryTimeNextFromMinutes__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)queryTimeOtherToMinutes
{
  _PASLock *lock;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PPConfiguration_queryTimeOtherToMinutes__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)sentenceEmbeddingVersion
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
  v5[2] = __43__PPConfiguration_sentenceEmbeddingVersion__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)maxRelevantHighlightContacts
{
  _PASLock *lock;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PPConfiguration_maxRelevantHighlightContacts__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)maxNEExtractions
{
  _PASLock *lock;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PPConfiguration_maxNEExtractions__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)scoreThreshold
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__PPConfiguration_scoreThreshold__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)storeNewExtractions
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__PPConfiguration_storeNewExtractions__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)useRawNEExtractionScores
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PPConfiguration_useRawNEExtractionScores__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)useCachedPortraitScores
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PPConfiguration_useCachedPortraitScores__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)maxItemsInFeatureDictionary
{
  _PASLock *lock;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PPConfiguration_maxItemsInFeatureDictionary__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)socialHighlightRankedStorageMaxAge
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PPConfiguration_socialHighlightRankedStorageMaxAge__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)socialHighlightFeedbackDeletionInterval
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PPConfiguration_socialHighlightFeedbackDeletionInterval__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)socialHighlightMetricReportingInterval
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PPConfiguration_socialHighlightMetricReportingInterval__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)skipInsignificantEmailExtractions
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PPConfiguration_skipInsignificantEmailExtractions__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)maxEmailHarvestingEligiblityInterval
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PPConfiguration_maxEmailHarvestingEligiblityInterval__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)enableECRMessageTokenCountsPlugin
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PPConfiguration_enableECRMessageTokenCountsPlugin__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)maxUniqueTokensInECRTokenCounts
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
  v5[2] = __50__PPConfiguration_maxUniqueTokensInECRTokenCounts__block_invoke;
  v5[3] = &unk_1E7E1F6B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)hyperparametersForMappingId:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__22184;
  v14 = __Block_byref_object_dispose__22185;
  v15 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PPConfiguration_hyperparametersForMappingId___block_invoke;
  v9[3] = &unk_1E7E1F6B0;
  v9[4] = &v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_cachedAlgorithms, 0);
  objc_storeStrong((id *)&self->_assetUpdateHandlerToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __47__PPConfiguration_hyperparametersForMappingId___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 328));
}

uint64_t __50__PPConfiguration_maxUniqueTokensInECRTokenCounts__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(a2 + 528);
  return result;
}

uint64_t __52__PPConfiguration_enableECRMessageTokenCountsPlugin__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 520);
  return result;
}

double __55__PPConfiguration_maxEmailHarvestingEligiblityInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 512);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __52__PPConfiguration_skipInsignificantEmailExtractions__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 504);
  return result;
}

double __57__PPConfiguration_socialHighlightMetricReportingInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 488);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __58__PPConfiguration_socialHighlightFeedbackDeletionInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 480);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __53__PPConfiguration_socialHighlightRankedStorageMaxAge__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 464);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __46__PPConfiguration_maxItemsInFeatureDictionary__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 452);
  return result;
}

uint64_t __42__PPConfiguration_useCachedPortraitScores__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 450);
  return result;
}

uint64_t __43__PPConfiguration_useRawNEExtractionScores__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 449);
  return result;
}

uint64_t __38__PPConfiguration_storeNewExtractions__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 448);
  return result;
}

double __33__PPConfiguration_scoreThreshold__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 440);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __35__PPConfiguration_maxNEExtractions__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 436);
  return result;
}

uint64_t __47__PPConfiguration_maxRelevantHighlightContacts__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 432);
  return result;
}

uint64_t __43__PPConfiguration_sentenceEmbeddingVersion__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(a2 + 424);
  return result;
}

uint64_t __42__PPConfiguration_queryTimeOtherToMinutes__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 416);
  return result;
}

uint64_t __43__PPConfiguration_queryTimeNextFromMinutes__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 408);
  return result;
}

uint64_t __41__PPConfiguration_queryTimeNextToMinutes__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 412);
  return result;
}

uint64_t __40__PPConfiguration_nextEventsFuzzMinutes__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 404);
  return result;
}

uint64_t __52__PPConfiguration_navigationMinimumDistanceInMeters__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 400);
  return result;
}

double __48__PPConfiguration_navigationMinimumTimeInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 392);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __37__PPConfiguration_peopleSuggesterMax__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 384);
  return result;
}

float __54__PPConfiguration_recordSourceNonContactsInitialScore__block_invoke(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 380);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

float __51__PPConfiguration_recordSourceContactsInitialScore__block_invoke(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 376);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __42__PPConfiguration_contactsLabelScoringMap__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 368));
}

double __50__PPConfiguration_mapsSearchQueryFromDateInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 352);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __39__PPConfiguration_mapsSearchQueryLimit__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 348);
  return result;
}

uint64_t __60__PPConfiguration_namedEntityLoadAndMonitorInitialLoadLimit__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 360);
  return result;
}

uint64_t __44__PPConfiguration_customTaggerMaxTokenCount__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 344);
  return result;
}

uint64_t __41__PPConfiguration_maxNumberNamedEntities__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 340);
  return result;
}

uint64_t __40__PPConfiguration_maxNumberMappedTopics__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 336);
  return result;
}

double __58__PPConfiguration_routineExtractionScoreDecayHalfLifeDays__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 320);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __55__PPConfiguration_routineExtractionScoreDurationWeight__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 312);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __52__PPConfiguration_routineExtractionScoreCountWeight__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 304);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __44__PPConfiguration_locationScoringUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 296);
  return result;
}

double __46__PPConfiguration_topicMappingCoreMLThreshold__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 288);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __41__PPConfiguration_topicMappingUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 283);
  return result;
}

uint64_t __62__PPConfiguration_use2StageScoreInterpreterForLocationScoring__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 282);
  return result;
}

uint64_t __56__PPConfiguration_use2StageScoreInterpreterForTPScoring__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 281);
  return result;
}

uint64_t __56__PPConfiguration_use2StageScoreInterpreterForNEScoring__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 280);
  return result;
}

void __36__PPConfiguration_engagementKValues__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 272));
}

uint64_t __45__PPConfiguration_locationFeedbackUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 267);
  return result;
}

uint64_t __42__PPConfiguration_topicFeedbackUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 266);
  return result;
}

uint64_t __48__PPConfiguration_namedEntityFeedbackUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 265);
  return result;
}

uint64_t __48__PPConfiguration_notificationExtractionEnabled__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 264);
  return result;
}

double __52__PPConfiguration_decayedFeedbackCountsHalfLifeDays__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 256);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __48__PPConfiguration_flattenNamedEntitiesForCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 251);
  return result;
}

uint64_t __41__PPConfiguration_flattenTopicsForCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 250);
  return result;
}

uint64_t __44__PPConfiguration_locationScoringUsesHybrid__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 254);
  return result;
}

uint64_t __41__PPConfiguration_topicScoringUsesHybrid__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 253);
  return result;
}

uint64_t __47__PPConfiguration_namedEntityScoringUsesHybrid__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 252);
  return result;
}

uint64_t __47__PPConfiguration_namedEntityScoringUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 249);
  return result;
}

uint64_t __41__PPConfiguration_topicScoringUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 248);
  return result;
}

double __47__PPConfiguration_locationDecayHalfLifeSeconds__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 240);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __50__PPConfiguration_namedEntityDecayHalfLifeSeconds__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 232);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __44__PPConfiguration_topicDecayHalfLifeSeconds__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 224);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __58__PPConfiguration_portraitAnalyticsMaximumNumberOfRecords__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 216);
  return result;
}

uint64_t __51__PPConfiguration_feedbackSessionLogsGeohashLength__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 212);
  return result;
}

float __61__PPConfiguration_feedbackSessionLogsExtractionsSamplingRate__block_invoke(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 208);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __59__PPConfiguration_feedbackSessionLogsSamplingRateOverrides__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 200));
}

float __50__PPConfiguration_feedbackSessionLogsSamplingRate__block_invoke(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 192);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

float __44__PPConfiguration_scoreThresholdForLocation__block_invoke(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 188);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

float __41__PPConfiguration_scoreThresholdForTopic__block_invoke(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 184);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

float __47__PPConfiguration_scoreThresholdForNamedEntity__block_invoke(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 180);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __65__PPConfiguration_safariDataDetectorsEnabledForHighMemoryDevices__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 177);
  return result;
}

uint64_t __55__PPConfiguration_safariDonationTitleExtractionEnabled__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 176);
  return result;
}

void __39__PPConfiguration_topicCalibrationTrie__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 168));
}

double __44__PPConfiguration_sportsMetricsSamplingRate__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 88);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __41__PPConfiguration_sportsMetricsEventName__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 80));
}

uint64_t __53__PPConfiguration_sportsMetricsNumberOfLeaguesLogged__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 76);
  return result;
}

uint64_t __51__PPConfiguration_sportsMetricsNumberOfTeamsLogged__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 72);
  return result;
}

void __58__PPConfiguration_portraitMusicDataCollectionAMPBundleIds__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 64));
}

uint64_t __69__PPConfiguration_portraitMusicDataCollectionCollectNonAMPNowPlaying__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 60);
  return result;
}

uint64_t __67__PPConfiguration_portraitMusicDataCollectionMaximumRecordsPerType__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 56);
  return result;
}

double __64__PPConfiguration_portraitMusicDataCollectionSamplingRateForAMP__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 48);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __64__PPConfiguration_portraitMusicDataCollectionSamplingRateForCTS__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 40);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __48__PPConfiguration_portraitAnalyticsSamplingRate__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 32);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __40__PPConfiguration__dictionaryForDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 152));
}

void __40__PPConfiguration__dictionaryForDomain___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 144));
}

void __40__PPConfiguration__dictionaryForDomain___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 160));
}

void __55__PPConfiguration_differentiallyPrivateEntityLogLevels__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 120));
}

void __57__PPConfiguration_topicsMultiplierForBundleId_algorithm___block_invoke(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)a2[16];
  v4 = a1[4];
  v5 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = (void *)v5[17];
  objc_msgSend(v9, "objectForKeyedSubscript:", a1[5]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[7] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

double __38__PPConfiguration_nonReaderTextWeight__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 24);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __36__PPConfiguration_halfValuePosition__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 16);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __48__PPConfiguration_availablePortraitVariantNames__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 112));
}

void __45__PPConfiguration_naturalPortraitVariantName__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 104));
}

void __38__PPConfiguration_portraitVariantName__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 96));
}

float __41__PPConfiguration_remoteTopicsMultiplier__block_invoke(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 8);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __36__PPConfiguration__loadConfigParams__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_loadGlobalConfigParamsWithGuardedData:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_loadTopicsConfigParamsWithGuardedData:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_loadNamedEntitiesConfigParamsWithGuardedData:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_loadLocationsConfigParamsWithGuardedData:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_loadContactsConfigParamsWithGuardedData:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_loadQuickTypeConfigParamsWithGuardedData:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_loadSocialHighlightConfigParamsWithGuardedData:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_loadUniversalSearchConfigParamsWithGuardedData:", v4);

}

uint64_t __42__PPConfiguration__loadTopicsConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadTopicsConfigParamsWithGuardedData:", a2);
}

uint64_t __49__PPConfiguration__loadNamedEntitiesConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadNamedEntitiesConfigParamsWithGuardedData:", a2);
}

uint64_t __45__PPConfiguration__loadQuickTypeConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadQuickTypeConfigParamsWithGuardedData:", a2);
}

uint64_t __51__PPConfiguration__loadSocialHighlightConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadSocialHighlightConfigParamsWithGuardedData:", a2);
}

uint64_t __51__PPConfiguration__loadUniversalSearchConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadUniversalSearchConfigParamsWithGuardedData:", a2);
}

uint64_t __44__PPConfiguration__loadContactsConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadContactsConfigParamsWithGuardedData:", a2);
}

uint64_t __45__PPConfiguration__loadLocationsConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadLocationsConfigParamsWithGuardedData:", a2);
}

uint64_t __42__PPConfiguration__loadGlobalConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadGlobalConfigParamsWithGuardedData:", a2);
}

void __40__PPConfiguration_initWithTrialWrapper___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id *WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "PPConfiguration: updating data in namespace %@ because of trial update.", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL")))
    {
      objc_msgSend(WeakRetained, "_loadGlobalConfigParams");
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("PERSONALIZATION_PORTRAIT_TOPICS")))
    {
      objc_msgSend(WeakRetained, "_loadTopicsConfigParams");
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES")))
    {
      objc_msgSend(WeakRetained, "_loadNamedEntitiesConfigParams");
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS")))
    {
      objc_msgSend(WeakRetained, "_loadLocationsConfigParams");
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("PERSONALIZATION_PORTRAIT_CONTACTS")))
    {
      objc_msgSend(WeakRetained, "_loadContactsConfigParams");
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("PERSONALIZATION_PORTRAIT_QUICKTYPE")))
    {
      objc_msgSend(WeakRetained, "_loadQuickTypeConfigParams");
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT")))
    {
      objc_msgSend(WeakRetained, "_loadSocialHighlightConfigParams");
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("PERSONALIZATION_PORTRAIT_UNIVERSAL_SEARCH")))
    {
      objc_msgSend(WeakRetained, "_loadUniversalSearchConfigParams");
    }
    objc_msgSend(WeakRetained[3], "removeAllObjects");
  }

}

+ (void)reload
{
  PPConfiguration *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  pthread_mutex_lock(&configLock_22535);
  v2 = [PPConfiguration alloc];
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PPConfiguration initWithTrialWrapper:](v2, "initWithTrialWrapper:", v3);
  v5 = (void *)sharedConfig;
  sharedConfig = v4;

  pthread_mutex_unlock(&configLock_22535);
}

@end

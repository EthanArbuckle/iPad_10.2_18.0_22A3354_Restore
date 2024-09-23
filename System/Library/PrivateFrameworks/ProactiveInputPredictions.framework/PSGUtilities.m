@implementation PSGUtilities

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__PSGUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_904 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_904, block);
  return (id)sharedInstance__pasExprOnceResult_905;
}

void __30__PSGUtilities_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1DF0B9950]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_905;
  sharedInstance__pasExprOnceResult_905 = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)prewarmCacheForLocale:(id)a3 usingQueue:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  dispatch_block_t v11;
  void *v12;
  _QWORD block[4];
  id v15;
  PSGUtilities *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__PSGUtilities_prewarmCacheForLocale_usingQueue___block_invoke;
  v18[3] = &unk_1EA3F0FE8;
  v18[4] = self;
  v9 = v6;
  v19 = v9;
  objc_msgSend(&unk_1EA3F4898, "_pas_filteredArrayWithTest:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __49__PSGUtilities_prewarmCacheForLocale_usingQueue___block_invoke_2;
    block[3] = &unk_1EA3F1010;
    v15 = v10;
    v16 = self;
    v17 = v9;
    v11 = dispatch_block_create((dispatch_block_flags_t)0, block);
    dispatch_async(v7, v11);
    v12 = (void *)MEMORY[0x1DF0B9A88](v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)localizedStringForKey:(id)a3 withLocale:(id)a4
{
  void *v6;
  void *v8;

  -[PSGUtilities localizedStringForKey:withLocale:onlyIfCached:wasCached:](self, "localizedStringForKey:withLocale:onlyIfCached:wasCached:", a3, a4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSGUtilities.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  return v6;
}

- (id)localizedStringForKey:(id)a3 withLocale:(id)a4 onlyIfCached:(BOOL)a5 wasCached:(BOOL *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD block[5];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PSGUtilities_localizedStringForKey_withLocale_onlyIfCached_wasCached___block_invoke;
  block[3] = &unk_1EA3F1038;
  block[4] = self;
  if (localizedStringForKey_withLocale_onlyIfCached_wasCached__onceToken != -1)
    dispatch_once(&localizedStringForKey_withLocale_onlyIfCached_wasCached__onceToken, block);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__914;
  v37 = __Block_byref_object_dispose__915;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v13 = (void *)localizedStringForKey_withLocale_onlyIfCached_wasCached__cache;
  v20 = v12;
  v21 = 3221225472;
  v22 = __72__PSGUtilities_localizedStringForKey_withLocale_onlyIfCached_wasCached___block_invoke_14;
  v23 = &unk_1EA3F1060;
  v14 = v11;
  v24 = v14;
  v15 = v10;
  v25 = v15;
  v26 = &v29;
  v27 = &v33;
  v28 = v7;
  objc_msgSend(v13, "runWithLockAcquired:", &v20);
  if (a6)
    *a6 = *((_BYTE *)v30 + 24);
  v16 = (void *)v34[5];
  if (v16 || v7)
  {
    v17 = v16;
  }
  else
  {
    objc_msgSend((id)localizedStringForKey_withLocale_onlyIfCached_wasCached__stringsBundle, "localizedStringForKey:value:table:", v15, &stru_1EA3F1D80, 0, v20, v21, v22, v23, v24);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

void __72__PSGUtilities_localizedStringForKey_withLocale_onlyIfCached_wasCached___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc(MEMORY[0x1E0D815F0]);
  v1 = (void *)objc_opt_new();
  v2 = objc_msgSend(v0, "initWithGuardedData:", v1);
  v3 = (void *)localizedStringForKey_withLocale_onlyIfCached_wasCached__cache;
  localizedStringForKey_withLocale_onlyIfCached_wasCached__cache = v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)localizedStringForKey_withLocale_onlyIfCached_wasCached__stringsBundle;
  localizedStringForKey_withLocale_onlyIfCached_wasCached__stringsBundle = v4;

}

void __72__PSGUtilities_localizedStringForKey_withLocale_onlyIfCached_wasCached___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *context;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v6);

    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v8)
    {
      v10 = *v9;
      *v9 = 0;

    }
    else
    {
      objc_storeStrong(v9, v6);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1DF0B9950]();
    if (*(_BYTE *)(a1 + 64))
    {
      v6 = 0;
    }
    else
    {
      context = v11;
      v30[0] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend((id)localizedStringForKey_withLocale_onlyIfCached_wasCached__stringsBundle, "localizations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)v12;
      objc_msgSend(v13, "preferredLocalizationsFromArray:forPreferences:", v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v26;
        while (2)
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v26 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20);
            v22 = (void *)MEMORY[0x1DF0B9950]();
            objc_msgSend((id)localizedStringForKey_withLocale_onlyIfCached_wasCached__stringsBundle, "localizedStringForKey:value:table:localization:", *(_QWORD *)(a1 + 40), 0, 0, v21);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 40)))
            {

              objc_autoreleasePoolPop(v22);
            }
            else
            {
              objc_autoreleasePoolPop(v22);
              if (v6)
              {

                objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6);
                goto LABEL_19;
              }
            }
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v18)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
      if (objc_msgSend(v3, "count") == 32)
        objc_msgSend(v3, "removeAllObjects");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v4);

      v11 = context;
    }
    objc_autoreleasePoolPop(v11);
  }

}

BOOL __49__PSGUtilities_prewarmCacheForLocale_usingQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;
  char v4;

  v4 = 0;
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:withLocale:onlyIfCached:wasCached:", a2, *(_QWORD *)(a1 + 40), 1, &v4);
  return v4 == 0;
}

void __49__PSGUtilities_prewarmCacheForLocale_usingQueue___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = (id)objc_msgSend(*(id *)(a1 + 40), "localizedStringForKey:withLocale:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), *(_QWORD *)(a1 + 48), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

@end

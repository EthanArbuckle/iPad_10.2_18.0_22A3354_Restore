@implementation PPSocialHighlightStorageUtilities

uint64_t __47__PPSocialHighlightStorageUtilities_clearCache__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

- (void)clearCache
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_996);
}

- (PPSocialHighlightStorageUtilities)init
{
  PPSocialHighlightStorageUtilities *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPSocialHighlightStorageUtilities;
  v2 = -[PPSocialHighlightStorageUtilities init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

  }
  return v2;
}

- (id)resolveBundleIdToApplicationIdentifierIfInstalled:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _PASLock *lock;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  BOOL v22;
  _PASLock *v23;
  NSObject *v24;
  _PASLock *v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  id obj;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v27 = 0;
    goto LABEL_28;
  }
  v30 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v29 = v4;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (!v5)
    goto LABEL_26;
  v6 = *(_QWORD *)v46;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v46 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v7);
      v9 = (void *)MEMORY[0x1C3BD6630]();
      v39 = 0;
      v40 = &v39;
      v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__988;
      v43 = __Block_byref_object_dispose__989;
      v44 = 0;
      lock = self->_lock;
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __87__PPSocialHighlightStorageUtilities_resolveBundleIdToApplicationIdentifierIfInstalled___block_invoke;
      v38[3] = &unk_1E7E159C8;
      v38[4] = v8;
      v38[5] = &v39;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v38);
      v11 = (void *)v40[5];
      if (!v11)
      {
        v15 = v8;
        v16 = objc_alloc(MEMORY[0x1E0CA5870]);
        v37 = 0;
        v17 = (void *)objc_msgSend(v16, "initWithBundleIdentifier:allowPlaceholder:error:", v15, 0, &v37);
        v18 = v37;
        if (v17)
        {
          pp_social_highlights_log_handle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v50 = v15;
            v51 = 2112;
            v52 = v17;
            _os_log_debug_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEBUG, "Considering registered bundleID: %@, got record: %@", buf, 0x16u);
          }

          objc_msgSend(v17, "applicationState");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "isInstalled"))
          {
            objc_msgSend(v17, "URL");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21 == 0;

            if (!v22)
            {
              objc_msgSend(v17, "applicationIdentifier");
              v20 = (id)objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                objc_msgSend(v30, "addObject:", v20);
                v23 = self->_lock;
                v32[0] = MEMORY[0x1E0C809B0];
                v32[1] = 3221225472;
                v32[2] = __87__PPSocialHighlightStorageUtilities_resolveBundleIdToApplicationIdentifierIfInstalled___block_invoke_6;
                v32[3] = &unk_1E7E15450;
                v33 = v15;
                v20 = v20;
                v34 = v20;
                -[_PASLock runWithLockAcquired:](v23, "runWithLockAcquired:", v32);

              }
              goto LABEL_22;
            }
LABEL_23:

            goto LABEL_24;
          }
        }
        else
        {
          pp_social_highlights_log_handle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v50 = v15;
            v51 = 2112;
            v52 = v18;
            _os_log_impl(&dword_1C392E000, v24, OS_LOG_TYPE_INFO, "Failed to initialize LSApplicationRecord with bundle id %@: %@", buf, 0x16u);
          }

          v25 = self->_lock;
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __87__PPSocialHighlightStorageUtilities_resolveBundleIdToApplicationIdentifierIfInstalled___block_invoke_5;
          v35[3] = &unk_1E7E15428;
          v36 = v15;
          -[_PASLock runWithLockAcquired:](v25, "runWithLockAcquired:", v35);
          v20 = v36;
        }
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11 == v12;

      if (!v13)
      {
        pp_social_highlights_log_handle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v26 = (void *)v40[5];
          *(_DWORD *)buf = 138412546;
          v50 = v26;
          v51 = 2112;
          v52 = v8;
          _os_log_debug_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEBUG, "Fetching cached application identifier %@ for bundle ID: %@", buf, 0x16u);
        }

        objc_msgSend(v30, "addObject:", v40[5]);
      }
LABEL_24:
      _Block_object_dispose(&v39, 8);

      objc_autoreleasePoolPop(v9);
      ++v7;
    }
    while (v5 != v7);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  }
  while (v5);
LABEL_26:

  v27 = (void *)objc_msgSend(v30, "copy");
  v4 = v29;
LABEL_28:

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

void __87__PPSocialHighlightStorageUtilities_resolveBundleIdToApplicationIdentifierIfInstalled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __87__PPSocialHighlightStorageUtilities_resolveBundleIdToApplicationIdentifierIfInstalled___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99E38];
  v4 = a2;
  objc_msgSend(v3, "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));

}

uint64_t __87__PPSocialHighlightStorageUtilities_resolveBundleIdToApplicationIdentifierIfInstalled___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end

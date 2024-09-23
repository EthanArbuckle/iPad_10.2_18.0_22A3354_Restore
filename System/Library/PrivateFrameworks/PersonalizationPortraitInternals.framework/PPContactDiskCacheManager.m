@implementation PPContactDiskCacheManager

- (PPContactDiskCacheManager)initWithPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  PPContactDiskCacheManager *v7;
  id v8;
  PPContactDiskCacheManager *v9;
  PPContactDiskCacheManager *v10;
  _QWORD v12[4];
  id v13;
  PPContactDiskCacheManager *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  if (initWithPath___pasOnceToken35 != -1)
    dispatch_once(&initWithPath___pasOnceToken35, &__block_literal_global_5153);
  v5 = (id)initWithPath___pasExprOnceResult_5154;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5136;
  v20 = __Block_byref_object_dispose__5137;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__PPContactDiskCacheManager_initWithPath___block_invoke_2;
  v12[3] = &unk_1E7E19938;
  v15 = &v16;
  v6 = v4;
  v13 = v6;
  v7 = self;
  v14 = v7;
  objc_msgSend(v5, "runWithLockAcquired:", v12);
  v8 = (id)v17[5];

  v9 = v14;
  v10 = (PPContactDiskCacheManager *)v8;

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)accessCacheWithBlock:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PPContactDiskCacheManager_accessCacheWithBlock___block_invoke;
  v7[3] = &unk_1E7E17190;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void)mutateCacheWithBlock:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PPContactDiskCacheManager_mutateCacheWithBlock___block_invoke;
  v7[3] = &unk_1E7E17190;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

void __50__PPContactDiskCacheManager_mutateCacheWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "createFileAtPath:contents:attributes:", v5, 0, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  LOBYTE(v6) = objc_msgSend(v7, "removeItemAtPath:error:", v5, &v10);
  v8 = v10;

  if ((v6 & 1) == 0)
  {
    pp_contacts_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v5;
      v13 = 2112;
      v14 = v8;
      _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "PPContactDiskCacheManager: failed to remove state file: %@ error: %@", buf, 0x16u);
    }

  }
}

void __50__PPContactDiskCacheManager_accessCacheWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, id);
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t, id))(v2 + 16);
  v4 = a2;
  v3(v2, v4);
  objc_msgSend(v4, "deleteCacheIfTooOld");

}

void __42__PPContactDiskCacheManager_initWithPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  PPMutableContactDiskCache *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  char v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  objc_super v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v48.receiver = *(id *)(a1 + 40);
    v48.super_class = (Class)PPContactDiskCacheManager;
    v7 = objc_msgSendSuper2(&v48, sel_init);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v10 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", CFSTR("name_records"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("version"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", CFSTR("name_records.pb"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v13);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "fileExistsAtPath:", v14);

      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeItemAtPath:error:", v14, 0);

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fileExistsAtPath:", v11);

      if ((v19 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v12);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length") == 4)
        {
          v20 = objc_retainAutorelease(v20);
          v21 = *(_DWORD *)objc_msgSend(v20, "bytes") == 1;
        }
        else
        {
          v21 = 0;
        }
      }
      else
      {
        pp_contacts_log_handle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v11;
          _os_log_impl(&dword_1C392E000, v22, OS_LOG_TYPE_INFO, "PPContactDiskCacheManager: creating new cache at %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0;
        v24 = objc_msgSend(v23, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v47);
        v20 = v47;

        if ((v24 & 1) == 0)
        {
          pp_contacts_log_handle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v20;
            _os_log_error_impl(&dword_1C392E000, v25, OS_LOG_TYPE_ERROR, "PPContactDiskCacheManager: failed to create cache directory: %@", buf, 0xCu);
          }

        }
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &kPPContactDiskCacheCurrentVersion, 4);
        v21 = 1;
        objc_msgSend(v26, "writeToFile:atomically:", v12, 1);

      }
      v27 = -[PPContactDiskCache initWithPath:]([PPMutableContactDiskCache alloc], "initWithPath:", v11);
      if (!v21)
      {
        pp_contacts_log_handle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "PPContactDiskCacheManager: versison check failed", buf, 2u);
        }

        if (!-[PPMutableContactDiskCache deleteNameRecordCache](v27, "deleteNameRecordCache"))
        {
          pp_contacts_log_handle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C392E000, v41, OS_LOG_TYPE_ERROR, "PPContactDiskCacheManager: failed to delete cache after version check. Not using cache.", buf, 2u);
          }

          v42 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v30 = *(void **)(v42 + 40);
          *(_QWORD *)(v42 + 40) = 0;
          goto LABEL_37;
        }
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &kPPContactDiskCacheCurrentVersion, 4);
        objc_msgSend(v29, "writeToFile:atomically:", v12, 1);

      }
      objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("state"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "fileExistsAtPath:", v30);

      if (v32)
      {
        pp_contacts_log_handle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v33, OS_LOG_TYPE_DEFAULT, "PPContactDiskCacheManager: interrupted mutation detected, throwing away cache files.", buf, 2u);
        }

        if (!-[PPMutableContactDiskCache deleteNameRecordCache](v27, "deleteNameRecordCache"))
        {
          pp_contacts_log_handle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C392E000, v43, OS_LOG_TYPE_ERROR, "PPContactDiskCacheManager: failed to delete interrupted cache. Not using cache.", buf, 2u);
          }

          v44 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v45 = *(void **)(v44 + 40);
          *(_QWORD *)(v44 + 40) = 0;

          goto LABEL_37;
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0;
        v35 = objc_msgSend(v34, "removeItemAtPath:error:", v30, &v46);
        v36 = v46;

        if ((v35 & 1) == 0)
        {
          pp_contacts_log_handle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v36;
            _os_log_error_impl(&dword_1C392E000, v37, OS_LOG_TYPE_ERROR, "PPContactDiskCacheManager: failed to remove state file after deleting interrupted cache: %@", buf, 0xCu);
          }

        }
      }
      v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v27);
      v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v40 = *(void **)(v39 + 8);
      *(_QWORD *)(v39 + 8) = v38;

      objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
LABEL_37:

    }
  }

}

void __42__PPContactDiskCacheManager_initWithPath___block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)initWithPath___pasExprOnceResult_5154;
  initWithPath___pasExprOnceResult_5154 = v3;

  objc_autoreleasePoolPop(v0);
}

@end

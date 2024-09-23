@implementation SSModelLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_26);
  return (id)sharedInstance_loader;
}

void __31__SSModelLoader_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_loader;
  sharedInstance_loader = v0;

}

- (SSModelLoader)init
{
  SSModelLoader *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSMutableSet *v7;
  NSMutableSet *pendingUpdates;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSModelLoader;
  v2 = -[SSModelLoader init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.searchd.ranking.loader", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingUpdates = v2->_pendingUpdates;
    v2->_pendingUpdates = v7;

  }
  return v2;
}

+ (id)assetDirectoryPathForType:(unint64_t)a3 forUpdate:(BOOL)a4
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v5 = CFSTR("Library/Spotlight/Resources_V3/");
  if (a4)
    v5 = CFSTR("Library/Spotlight/Resources.update_V3/");
  v6 = v5;
  NSHomeDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    v10 = CFSTR("Default");
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    v10 = CFSTR("Experimental");
LABEL_7:
    objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:
  if ((objc_msgSend(v9, "fileExistsAtPath:", v11) & 1) == 0)
    objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, 0);

  return v11;
}

- (BOOL)hasPendingUpdates
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSMutableSet *pendingUpdates;
  void *v9;

  if (-[NSMutableSet count](self->_pendingUpdates, "count"))
    return 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 2;
  do
  {
    objc_msgSend((id)objc_opt_class(), "assetDirectoryPathForType:forUpdate:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      pendingUpdates = self->_pendingUpdates;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](pendingUpdates, "addObject:", v9);

    }
    --v5;
  }
  while (v5);
  v3 = -[NSMutableSet count](self->_pendingUpdates, "count") != 0;

  return v3;
}

- (void)removeAssetsWithName:(id)a3
{
  id v4;
  uint64_t AssetTypeForName;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (assetIsValid(v4))
  {
    AssetTypeForName = getAssetTypeForName(v4);
    PRSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = AssetTypeForName;
      _os_log_impl(&dword_1B86C5000, v6, OS_LOG_TYPE_DEFAULT, "[Model loading] removing resource for type %lu", (uint8_t *)&v7, 0xCu);
    }

    -[SSModelLoader removeAssetsForType:group:](self, "removeAssetsForType:group:", AssetTypeForName, 0);
  }

}

- (void)removeAssetsForType:(unint64_t)a3 group:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SSModelLoader_removeAssetsForType_group___block_invoke;
  block[3] = &unk_1E6E44B90;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __43__SSModelLoader_removeAssetsForType_group___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;

  objc_msgSend((id)objc_opt_class(), "assetDirectoryPathForType:forUpdate:", *(_QWORD *)(a1 + 48), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v3, "removeItemAtPath:error:", v2, &v6);
  v4 = v6;

  v5 = *(NSObject **)(a1 + 40);
  if (v5)
    dispatch_group_leave(v5);
  +[SSADEventReporter reportModelDeletionForType:](SSADEventReporter, "reportModelDeletionForType:", *(_QWORD *)(a1 + 48));

}

- (void)unpackageModelAssets:(id)a3 assetName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t AssetTypeForName;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (assetIsValid(v9))
  {
    AssetTypeForName = getAssetTypeForName(v9);
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "assetDirectoryPathForType:forUpdate:", AssetTypeForName, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PRSLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = 134217984;
      v16 = AssetTypeForName;
      _os_log_impl(&dword_1B86C5000, v14, OS_LOG_TYPE_INFO, "[Model loading] unpackaging %lu", (uint8_t *)&v15, 0xCu);
    }

    -[SSModelLoader unpackageModelAssets:type:intoDirectory:group:completion:](self, "unpackageModelAssets:type:intoDirectory:group:completion:", v12, AssetTypeForName, v13, 0, v10);
  }

}

- (void)unpackageModelAssets:(id)a3 type:(unint64_t)a4 group:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "assetDirectoryPathForType:forUpdate:", a4, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SSModelLoader unpackageModelAssets:type:intoDirectory:group:completion:](self, "unpackageModelAssets:type:intoDirectory:group:completion:", v12, a4, v13, v11, v10);

}

- (void)unpackageModelAssets:(id)a3 type:(unint64_t)a4 intoDirectory:(id)a5 group:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  id location;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  location = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SSModelLoader_unpackageModelAssets_type_intoDirectory_group_completion___block_invoke;
  block[3] = &unk_1E6E44BB8;
  objc_copyWeak(v26, &location);
  v22 = v13;
  v23 = v12;
  v26[1] = (id)a4;
  v24 = v14;
  v25 = v15;
  v17 = v14;
  v18 = v15;
  v19 = v12;
  v20 = v13;
  dispatch_async(queue, block);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

void __74__SSModelLoader_unpackageModelAssets_type_intoDirectory_group_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  char v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
LABEL_6:
    v12 = *(NSObject **)(a1 + 48);
    if (v12)
      dispatch_group_leave(v12);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (uint64_t *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 32);
  v14 = 0;
  v6 = objc_msgSend(v3, "removeItemAtPath:error:", v4, &v14);
  v7 = v14;

  if ((v6 & 1) != 0)
  {
    +[SSCompressionHelper sharedInstance](SSCompressionHelper, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unTarFileWithFd:toPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    if (!v9)
    {
      objc_msgSend(WeakRetained, "pendingUpdates");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

    goto LABEL_6;
  }
  PRSLogCategoryDefault();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    __74__SSModelLoader_unpackageModelAssets_type_intoDirectory_group_completion___block_invoke_cold_1(v5, (uint64_t)v7, v13);

LABEL_11:
}

- (void)moveNewlyPackagedAssets:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  id v7;
  id location;

  location = 0;
  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSModelLoader_moveNewlyPackagedAssets___block_invoke;
  block[3] = &unk_1E6E44BE0;
  objc_copyWeak(&v7, &location);
  block[4] = self;
  dispatch_group_async(v4, queue, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __41__SSModelLoader_moveNewlyPackagedAssets___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
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
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  id obj;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_21;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(WeakRetained, "pendingUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  obj = v4;
  v38 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (!v38)
    goto LABEL_20;
  v37 = *(_QWORD *)v42;
  *(_QWORD *)&v5 = 138412290;
  v34 = v5;
  v36 = v2;
  while (2)
  {
    for (i = 0; i != v38; ++i)
    {
      if (*(_QWORD *)v42 != v37)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      v8 = objc_msgSend(v7, "unsignedIntegerValue", v34);
      objc_msgSend((id)objc_opt_class(), "assetDirectoryPathForType:forUpdate:", v8, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "assetDirectoryPathForType:forUpdate:", v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      v12 = objc_msgSend(v11, "removeItemAtPath:error:", v10, &v40);
      v13 = v40;
      v14 = v13;
      if ((v12 & 1) == 0)
      {
        PRSLogCategoryDefault();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          __41__SSModelLoader_moveNewlyPackagedAssets___block_invoke_cold_2((uint64_t)v14, v18, v22, v23, v24, v25, v26, v27);
        goto LABEL_19;
      }
      v39 = v13;
      v15 = objc_msgSend(v11, "moveItemAtPath:toPath:error:", v9, v10, &v39);
      v16 = v39;

      PRSLogCategoryDefault();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if ((v15 & 1) == 0)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __41__SSModelLoader_moveNewlyPackagedAssets___block_invoke_cold_1((uint64_t)v16, v18, v28, v29, v30, v31, v32, v33);
        v14 = v16;
LABEL_19:
        v2 = v36;

        goto LABEL_20;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v34;
        v46 = v19;
        _os_log_impl(&dword_1B86C5000, v18, OS_LOG_TYPE_INFO, "[Model loading] moved resources for type %@", buf, 0xCu);

      }
      +[SSADEventReporter reportModelUnpackageEventWithType:](SSADEventReporter, "reportModelUnpackageEventWithType:", objc_msgSend(v7, "unsignedIntegerValue"));
      v2 = v36;
      objc_msgSend(v36, "pendingUpdates");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObject:", v21);

    }
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v38)
      continue;
    break;
  }
LABEL_20:

LABEL_21:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableSet)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUpdates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __74__SSModelLoader_unpackageModelAssets_type_intoDirectory_group_completion___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1B86C5000, log, OS_LOG_TYPE_ERROR, "[Model loading] failed to remove dir %@ err %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_8();
}

void __41__SSModelLoader_moveNewlyPackagedAssets___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, a2, a3, "[Model loading] failed moving new resources %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __41__SSModelLoader_moveNewlyPackagedAssets___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, a2, a3, "[Model loading] failed removing old resources %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

@end

@implementation TPSSecureArchivingUtilities

+ (void)archivedDataWithRootObject:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "archivedDataWithRootObject:forKey:userDefaults:", v6, v5, 0);

}

+ (void)archivedDataWithRootObject:(id)a3 forKey:(id)a4 userDefaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v8 = a3;
  v9 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__4;
  v18[4] = __Block_byref_object_dispose__4;
  v10 = a5;
  v19 = v10;
  objc_msgSend(a1, "syncQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__TPSSecureArchivingUtilities_archivedDataWithRootObject_forKey_userDefaults___block_invoke;
  block[3] = &unk_1E395C0B8;
  v16 = v9;
  v17 = v18;
  v15 = v8;
  v12 = v9;
  v13 = v8;
  dispatch_sync(v11, block);

  _Block_object_dispose(v18, 8);
}

+ (id)unarchivedObjectOfClasses:(id)a3 forKey:(id)a4 userDefaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__4;
  v21[4] = __Block_byref_object_dispose__4;
  v10 = a5;
  v22 = v10;
  objc_msgSend(a1, "syncQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__TPSSecureArchivingUtilities_unarchivedObjectOfClasses_forKey_userDefaults___block_invoke;
  v16[3] = &unk_1E395CFA8;
  v19 = v21;
  v20 = &v23;
  v17 = v9;
  v18 = v8;
  v12 = v8;
  v13 = v9;
  dispatch_sync(v11, v16);

  v14 = (id)v24[5];
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

+ (id)syncQueue
{
  if (syncQueue_onceToken != -1)
    dispatch_once(&syncQueue_onceToken, &__block_literal_global_16);
  return (id)syncQueue_syncQueue;
}

+ (id)unarchivedObjectOfClass:(Class)a3 forKey:(id)a4 userDefaults:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "setWithObject:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unarchivedObjectOfClasses:forKey:userDefaults:", v11, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __77__TPSSecureArchivingUtilities_unarchivedObjectOfClasses_forKey_userDefaults___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  objc_msgSend(v2, "objectForKey:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = a1[5];
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v7, v6, &v15);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v15;
    v10 = *(_QWORD *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v8;

    if (v9)
    {
      +[TPSLogger data](TPSLogger, "data");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __77__TPSSecureArchivingUtilities_unarchivedObjectOfClasses_forKey_userDefaults___block_invoke_cold_1();

      v13 = *(_QWORD *)(a1[7] + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = 0;

    }
  }
  else
  {
    v9 = 0;
  }

}

uint64_t __78__TPSSecureArchivingUtilities_archivedDataWithRootObject_forKey_userDefaults___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  v5 = a1[4];
  if (v5)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = v7;
    if (v6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKey:", v6, a1[5]);
    }
    else if (v7)
    {
      +[TPSLogger data](TPSLogger, "data");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __78__TPSSecureArchivingUtilities_archivedDataWithRootObject_forKey_userDefaults___block_invoke_cold_1();

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "removeObjectForKey:", a1[5]);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "synchronize");
}

+ (id)unarchivedObjectOfClass:(Class)a3 forKey:(id)a4
{
  return (id)objc_msgSend(a1, "unarchivedObjectOfClass:forKey:userDefaults:", a3, a4, 0);
}

void __40__TPSSecureArchivingUtilities_syncQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create(0, v2);
  v1 = (void *)syncQueue_syncQueue;
  syncQueue_syncQueue = (uint64_t)v0;

}

+ (id)unarchivedObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "unarchivedObjectOfClasses:forKey:userDefaults:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __77__TPSSecureArchivingUtilities_unarchivedObjectOfClasses_forKey_userDefaults___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_19A906000, v0, v1, "Error secureUnarchiving key %@, error: %@");
  OUTLINED_FUNCTION_0_2();
}

void __77__TPSSecureArchivingUtilities_unarchivedObjectOfClasses_forKey_userDefaults___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_19A906000, v0, v1, "Error secureUnarchiving key %@, exception: %@");
  OUTLINED_FUNCTION_0_2();
}

void __78__TPSSecureArchivingUtilities_archivedDataWithRootObject_forKey_userDefaults___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_19A906000, v0, v1, "Error secureArchiving key %@, error: %@");
  OUTLINED_FUNCTION_0_2();
}

@end

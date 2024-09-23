@implementation PLCacheDeleteUtility

uint64_t __43__PLCacheDeleteUtility_registerCacheDelete__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  +[PLCacheDeleteUtility purgeableBlockWithInfo:withUrgency:](PLCacheDeleteUtility, "purgeableBlockWithInfo:withUrgency:", a3, a2);
  return objc_claimAutoreleasedReturnValue();
}

+ (id)purgeableBlockWithInfo:(id)a3 withUrgency:(int)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[PLCacheDeleteUtility purgeableBlockWithInfo:withUrgency:].cold.2();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("/private/var"));

  if (v8)
  {
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    if (a4 < 2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MajorVersion"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[PLCacheDeleteUtility purgeableSizeForVersionDirectory:](PLCacheDeleteUtility, "purgeableSizeForVersionDirectory:", v13);

      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MinorVersion"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[PLCacheDeleteUtility purgeableSizeForVersionDirectory:](PLCacheDeleteUtility, "purgeableSizeForVersionDirectory:", v10)+ v14;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[PLUtilities directorySize:](PLUtilities, "directorySize:", v10);
    }

  }
  else
  {
    v11 = 0;
  }
  v25[0] = CFSTR("CACHE_DELETE_VOLUME");
  v25[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v26[0] = CFSTR("/private/var");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    +[PLCacheDeleteUtility purgeableBlockWithInfo:withUrgency:].cold.1((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);

  return v16;
}

+ (void)traverseBuildDirectory:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = *MEMORY[0x1E0C998D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, v9, 4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[PLCacheDeleteUtility traverseBuildDirectory:withBlock:].cold.1((uint64_t)v5, v10, v11);

  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__PLCacheDeleteUtility_traverseBuildDirectory_withBlock___block_invoke_2;
  v15[3] = &unk_1E6A52CD8;
  v16 = v10;
  v17 = v6;
  v13 = v10;
  v14 = v6;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

}

int64_t __57__PLCacheDeleteUtility_traverseBuildDirectory_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[PLUtilities compareFilesByKey:file1:file2:sortAscending:](PLUtilities, "compareFilesByKey:file1:file2:sortAscending:", *MEMORY[0x1E0C998D8], a2, a3, 1);
}

void __57__PLCacheDeleteUtility_traverseBuildDirectory_withBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  objc_msgSend(a2, "path");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(_QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7, objc_msgSend(*(id *)(a1 + 32), "count") - a3) & 1) == 0)*a4 = 1;

}

+ (void)traverseVersionDirectory:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__PLCacheDeleteUtility_traverseVersionDirectory_withBlock___block_invoke;
  v11[3] = &unk_1E6A52D00;
  v12 = v5;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

}

void __59__PLCacheDeleteUtility_traverseVersionDirectory_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (unint64_t)purgeableSizeForBuildDirectory:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  _QWORD v9[6];
  _QWORD block[4];
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PLCacheDeleteUtility_purgeableSizeForBuildDirectory___block_invoke;
  block[3] = &unk_1E6A527D8;
  v11 = CFSTR("MaxFilesPostPurge");
  v12 = 2;
  if (purgeableSizeForBuildDirectory__defaultOnce != -1)
    dispatch_once(&purgeableSizeForBuildDirectory__defaultOnce, block);
  v5 = purgeableSizeForBuildDirectory__objectForKey;

  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __55__PLCacheDeleteUtility_purgeableSizeForBuildDirectory___block_invoke_2;
  v9[3] = &unk_1E6A52D28;
  v9[4] = &v13;
  v9[5] = v5;
  +[PLCacheDeleteUtility traverseBuildDirectory:withBlock:](PLCacheDeleteUtility, "traverseBuildDirectory:withBlock:", v3, v9);
  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[PLCacheDeleteUtility purgeableSizeForBuildDirectory:].cold.1();

  v7 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v7;
}

int64_t __55__PLCacheDeleteUtility_purgeableSizeForBuildDirectory___block_invoke(uint64_t a1)
{
  int64_t result;

  result = +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  purgeableSizeForBuildDirectory__objectForKey = result;
  return result;
}

BOOL __55__PLCacheDeleteUtility_purgeableSizeForBuildDirectory___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v12;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4 < a3)
  {
    v6 = (void *)MEMORY[0x1E0CB3620];
    v7 = a2;
    objc_msgSend(v6, "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v8, "attributesOfItemAtPath:error:", v7, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v12;
    if (v9)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v9, "fileSize");

  }
  return v4 < a3;
}

+ (unint64_t)purgeableSizeForVersionDirectory:(id)a3
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PLCacheDeleteUtility_purgeableSizeForVersionDirectory___block_invoke;
  v7[3] = &unk_1E6A52D50;
  v7[4] = &v8;
  +[PLCacheDeleteUtility traverseVersionDirectory:withBlock:](PLCacheDeleteUtility, "traverseVersionDirectory:withBlock:", v3, v7);
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[PLCacheDeleteUtility purgeableSizeForVersionDirectory:].cold.1();

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

unint64_t __57__PLCacheDeleteUtility_purgeableSizeForVersionDirectory___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  result = +[PLCacheDeleteUtility purgeableSizeForBuildDirectory:](PLCacheDeleteUtility, "purgeableSizeForBuildDirectory:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (unint64_t)purgeBuildDirectory:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  _QWORD v9[6];
  _QWORD block[4];
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke;
  block[3] = &unk_1E6A527D8;
  v11 = CFSTR("MaxFilesPostPurge");
  v12 = 2;
  if (purgeBuildDirectory__defaultOnce != -1)
    dispatch_once(&purgeBuildDirectory__defaultOnce, block);
  v5 = purgeBuildDirectory__objectForKey;

  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke_2;
  v9[3] = &unk_1E6A52D28;
  v9[4] = &v13;
  v9[5] = v5;
  +[PLCacheDeleteUtility traverseBuildDirectory:withBlock:](PLCacheDeleteUtility, "traverseBuildDirectory:withBlock:", v3, v9);
  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[PLCacheDeleteUtility purgeBuildDirectory:].cold.1();

  v7 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v7;
}

int64_t __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke(uint64_t a1)
{
  int64_t result;

  result = +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  purgeBuildDirectory__objectForKey = result;
  return result;
}

BOOL __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v16;
  id v17;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 < a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v7, "attributesOfItemAtPath:error:", v5, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;

    if (v8)
      v10 = objc_msgSend(v8, "fileSize");
    else
      v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
    v12 = objc_msgSend(v11, "removeItemAtPath:error:", v5, &v16);
    v13 = v16;

    if ((v12 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v10;
    }
    else
    {
      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke_2_cold_1((uint64_t)v5);

    }
  }

  return v6 < a3;
}

+ (unint64_t)purgeVersionDirectory:(id)a3
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PLCacheDeleteUtility_purgeVersionDirectory___block_invoke;
  v7[3] = &unk_1E6A52D50;
  v7[4] = &v8;
  +[PLCacheDeleteUtility traverseVersionDirectory:withBlock:](PLCacheDeleteUtility, "traverseVersionDirectory:withBlock:", v3, v7);
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[PLCacheDeleteUtility purgeVersionDirectory:].cold.1();

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

unint64_t __46__PLCacheDeleteUtility_purgeVersionDirectory___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  result = +[PLCacheDeleteUtility purgeBuildDirectory:](PLCacheDeleteUtility, "purgeBuildDirectory:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (id)purgeBlockWithInfo:(id)a3 withUrgency:(int)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[PLCacheDeleteUtility purgeBlockWithInfo:withUrgency:].cold.3();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("/private/var"));

  if (!v8)
  {
    v11 = 0;
    goto LABEL_13;
  }
  if (a4 < 2)
  {
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MajorVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[PLCacheDeleteUtility purgeVersionDirectory:](PLCacheDeleteUtility, "purgeVersionDirectory:", v19);

    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MinorVersion"));
    v17 = objc_claimAutoreleasedReturnValue();
    v11 = +[PLCacheDeleteUtility purgeVersionDirectory:](PLCacheDeleteUtility, "purgeVersionDirectory:", v17)+ v20;
LABEL_11:

    goto LABEL_12;
  }
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[PLUtilities directorySize:](PLUtilities, "directorySize:", v10);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v15 = objc_msgSend(v12, "removeItemAtPath:error:", v14, &v31);
  v16 = v31;

  if ((v15 & 1) == 0)
  {
    PLLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[PLCacheDeleteUtility purgeBlockWithInfo:withUrgency:].cold.2((uint64_t)v16, v17);
    v11 = 0;
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  v32[0] = CFSTR("CACHE_DELETE_VOLUME");
  v32[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v33[0] = CFSTR("/private/var");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    +[PLCacheDeleteUtility purgeBlockWithInfo:withUrgency:].cold.1((uint64_t)v22, v23, v24, v25, v26, v27, v28, v29);

  return v22;
}

+ (unint64_t)enforceRetentionForDirectory:(id)a3 withMaxDays:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id *v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t *v22;
  unint64_t v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  id obj;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];

  v39[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__4;
  v33 = __Block_byref_object_dispose__4;
  v34 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v5);
  v8 = *MEMORY[0x1E0C99998];
  v39[0] = *MEMORY[0x1E0C998E8];
  v39[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(v30 + 5);
  obj = (id)v30[5];
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, v9, 4, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v30[5])
  {
    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[PLCacheDeleteUtility enforceRetentionForDirectory:withMaxDays:].cold.1();

    v13 = v36[3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__4;
    v26[4] = __Block_byref_object_dispose__4;
    v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__4;
    v24[4] = __Block_byref_object_dispose__4;
    v25 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__PLCacheDeleteUtility_enforceRetentionForDirectory_withMaxDays___block_invoke;
    v17[3] = &unk_1E6A52D78;
    v19 = v26;
    v20 = &v29;
    v21 = v24;
    v23 = a4;
    v15 = v14;
    v18 = v15;
    v22 = &v35;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v17);
    v13 = v36[3];

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);

  }
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v13;
}

void __65__PLCacheDeleteUtility_enforceRetentionForDirectory_withMaxDays___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  id *v8;
  NSObject *v9;
  id *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id obj;

  v3 = a2;
  v5 = a1 + 48;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  obj = 0;
  v7 = *MEMORY[0x1E0C998E8];
  v8 = (id *)(*(_QWORD *)(v4 + 8) + 40);
  v24 = 0;
  objc_msgSend(v3, "getResourceValue:forKey:error:", &obj, v7, &v24);
  objc_storeStrong(v6, obj);
  objc_storeStrong(v8, v24);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __65__PLCacheDeleteUtility_enforceRetentionForDirectory_withMaxDays___block_invoke_cold_2();
  }
  else
  {
    v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v23 = 0;
    objc_msgSend(v3, "getResourceValue:forKey:error:", &v23, *MEMORY[0x1E0C99998], 0);
    objc_storeStrong(v10, v23);
    v11 = (double)*(unint64_t *)(a1 + 72) * 86400.0;
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    if (v12 > (double)(unint64_t)v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)v5 + 8);
      v22 = *(id *)(v14 + 40);
      v15 = objc_msgSend(v13, "removeItemAtURL:error:", v3, &v22);
      objc_storeStrong((id *)(v14 + 40), v22);

      if (v15)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += (int)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)+ 8)+ 40), "intValue");
      }
      else
      {
        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __65__PLCacheDeleteUtility_enforceRetentionForDirectory_withMaxDays___block_invoke_cold_1();

      }
    }
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;

    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(NSObject **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = 0;
  }

  v20 = *(_QWORD *)(*(_QWORD *)v5 + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = 0;

}

+ (unint64_t)enforceRetentionForVersionDirectory:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD block[4];
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke;
  block[3] = &unk_1E6A527D8;
  v16 = CFSTR("MaxFileRetentionInDays");
  v17 = 365;
  if (enforceRetentionForVersionDirectory__defaultOnce != -1)
    dispatch_once(&enforceRetentionForVersionDirectory__defaultOnce, block);
  v6 = enforceRetentionForVersionDirectory__objectForKey;

  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke_2;
  v11[3] = &unk_1E6A52DC8;
  v7 = v4;
  v12 = v7;
  v13 = &v18;
  v14 = v6;
  +[PLCacheDeleteUtility traverseVersionDirectory:withBlock:](PLCacheDeleteUtility, "traverseVersionDirectory:withBlock:", v3, v11);
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[PLCacheDeleteUtility purgeVersionDirectory:].cold.1();

  v9 = v19[3];
  _Block_object_dispose(&v18, 8);

  return v9;
}

int64_t __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke(uint64_t a1)
{
  int64_t result;

  result = +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  enforceRetentionForVersionDirectory__objectForKey = result;
  return result;
}

void __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke_3;
  v6[3] = &unk_1E6A52DA0;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v7 = v4;
  +[PLCacheDeleteUtility traverseBuildDirectory:withBlock:](PLCacheDeleteUtility, "traverseBuildDirectory:withBlock:", a2, v6);

}

BOOL __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  id v18;
  id v19;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;

  if (!v5)
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke_3_cold_2((uint64_t)v3);

  }
  v8 = (void *)a1[4];
  objc_msgSend(v5, "fileCreationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10;
  v12 = (double)(unint64_t)a1[6] * 86400.0;

  if (v11 <= v12)
  {
    v15 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v6;
    v14 = objc_msgSend(v13, "removeItemAtPath:error:", v3, &v18);
    v15 = v18;

    if (v14)
    {
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v5, "fileSize");
    }
    else
    {
      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke_2_cold_1((uint64_t)v3);

    }
  }

  return v11 > v12;
}

+ (id)periodicPurgeBlockWithInfo:(id)a3 withUrgency:(int)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[PLCacheDeleteUtility periodicPurgeBlockWithInfo:withUrgency:].cold.2();

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MajorVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PLCacheDeleteUtility enforceRetentionForVersionDirectory:](PLCacheDeleteUtility, "enforceRetentionForVersionDirectory:", v7);

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MinorVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[PLCacheDeleteUtility enforceRetentionForVersionDirectory:](PLCacheDeleteUtility, "enforceRetentionForVersionDirectory:", v10)+ v8;

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Debug/"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11
      + +[PLCacheDeleteUtility enforceRetentionForDirectory:withMaxDays:](PLCacheDeleteUtility, "enforceRetentionForDirectory:withMaxDays:", v13, 14);

  v25[0] = CFSTR("CACHE_DELETE_VOLUME");
  v25[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v26[0] = CFSTR("/private/var");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    +[PLCacheDeleteUtility periodicPurgeBlockWithInfo:withUrgency:].cold.1((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);

  return v16;
}

+ (BOOL)registerCacheDelete
{
  return CacheDeleteRegisterInfoCallbacks() == 0;
}

uint64_t __43__PLCacheDeleteUtility_registerCacheDelete__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  +[PLCacheDeleteUtility purgeBlockWithInfo:withUrgency:](PLCacheDeleteUtility, "purgeBlockWithInfo:withUrgency:", a3, a2);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t __43__PLCacheDeleteUtility_registerCacheDelete__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  +[PLCacheDeleteUtility periodicPurgeBlockWithInfo:withUrgency:](PLCacheDeleteUtility, "periodicPurgeBlockWithInfo:withUrgency:", a3, a2);
  return objc_claimAutoreleasedReturnValue();
}

+ (BOOL)registerCacheDeleteFull
{
  return CacheDeleteRegisterInfoCallbacks() == 0;
}

uint64_t __47__PLCacheDeleteUtility_registerCacheDeleteFull__block_invoke()
{
  return 0;
}

uint64_t __47__PLCacheDeleteUtility_registerCacheDeleteFull__block_invoke_2()
{
  return 0;
}

uint64_t __47__PLCacheDeleteUtility_registerCacheDeleteFull__block_invoke_4()
{
  return 0;
}

+ (void)traverseBuildDirectory:(NSObject *)a3 withBlock:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_1B6AB6000, a3, OS_LOG_TYPE_DEBUG, "Build directory: %@ numContents: %lu", (uint8_t *)&v4, 0x16u);
}

+ (void)purgeableSizeForBuildDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1B6AB6000, v0, v1, "Purgeable %lu bytes for build directory: %@");
  OUTLINED_FUNCTION_1_0();
}

+ (void)purgeableSizeForVersionDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1B6AB6000, v0, v1, "Purgeable %lu bytes for version directory: %@");
  OUTLINED_FUNCTION_1_0();
}

+ (void)purgeableBlockWithInfo:(uint64_t)a3 withUrgency:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, a2, a3, "Purgeable result: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)purgeableBlockWithInfo:withUrgency:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0(&dword_1B6AB6000, v0, v1, "Purgeable request with info: %@ urgency: %d");
  OUTLINED_FUNCTION_1_0();
}

+ (void)purgeBuildDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1B6AB6000, v0, v1, "Purged %lu bytes for build directory: %@");
  OUTLINED_FUNCTION_1_0();
}

void __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v1, v2, "Failed to remove file at path: %@ with error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

+ (void)purgeVersionDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1B6AB6000, v0, v1, "Purged %lu bytes for version directory: %@");
  OUTLINED_FUNCTION_1_0();
}

+ (void)purgeBlockWithInfo:(uint64_t)a3 withUrgency:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, a2, a3, "Purge result: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)purgeBlockWithInfo:(uint64_t)a1 withUrgency:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a1;
  _os_log_error_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_ERROR, "Failed to remove file at path: %@ with error: %@", (uint8_t *)&v6, 0x16u);

}

+ (void)purgeBlockWithInfo:withUrgency:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0(&dword_1B6AB6000, v0, v1, "Purge request with info: %@ urgency: %d");
  OUTLINED_FUNCTION_1_0();
}

+ (void)enforceRetentionForDirectory:withMaxDays:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Failed to get contents of directory at %@ with error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __65__PLCacheDeleteUtility_enforceRetentionForDirectory_withMaxDays___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Failed to remove file at path: %@ with error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __65__PLCacheDeleteUtility_enforceRetentionForDirectory_withMaxDays___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Failed to get creation date of file %@ with error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke_3_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v1, v2, "Failed to retreive attributes for file: %@ with error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

+ (void)periodicPurgeBlockWithInfo:(uint64_t)a3 withUrgency:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, a2, a3, "Periodic purge result: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)periodicPurgeBlockWithInfo:withUrgency:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0(&dword_1B6AB6000, v0, v1, "Periodic purge request with info: %@ urgency: %d");
  OUTLINED_FUNCTION_1_0();
}

@end

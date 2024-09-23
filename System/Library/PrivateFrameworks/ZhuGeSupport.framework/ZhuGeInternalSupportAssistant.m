@implementation ZhuGeInternalSupportAssistant

+ (_opaque_pthread_mutex_t)recursiveMutex
{
  if (recursiveMutex_aToken != -1)
    dispatch_once(&recursiveMutex_aToken, &__block_literal_global_2);
  return (_opaque_pthread_mutex_t *)&_recursiveMutex;
}

uint64_t __47__ZhuGeInternalSupportAssistant_recursiveMutex__block_invoke()
{
  return initPthreadRecursiveMutex(&_recursiveMutex);
}

+ (void)setDylibHandler:(void *)a3
{
  _dylibHandler = (uint64_t)a3;
}

+ (void)dylibHandler
{
  return (void *)_dylibHandler;
}

+ (void)setXpcProxy:(id)a3
{
  objc_storeStrong((id *)&_xpcProxy, a3);
}

+ (id)xpcProxy
{
  return (id)_xpcProxy;
}

+ (void)setCacheList:(id)a3
{
  objc_storeStrong((id *)&_cacheList, a3);
}

+ (NSMutableArray)cacheList
{
  return (NSMutableArray *)(id)_cacheList;
}

+ (BOOL)isInternalAssistant
{
  return 1;
}

+ (id)classList
{
  return &unk_1E716C920;
}

+ (id)armoryClassName
{
  return CFSTR("OBJC_CLASS_$_ZhuGeInternalArmory");
}

+ (id)serviceXpcName
{
  return CFSTR("com.apple.ZhuGeInternalService");
}

+ (void)executeCacheRefresh
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)objc_msgSend(a1, "recursiveMutex"));
  if (objc_msgSend(a1, "dylibHandler"))
  {
    dlclose((void *)objc_msgSend(a1, "dylibHandler"));
    objc_msgSend(a1, "setDylibHandler:", 0);
  }
  objc_msgSend(a1, "setXpcProxy:", 0);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(a1, "cacheList", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "clearCache");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  pthread_mutex_unlock((pthread_mutex_t *)objc_msgSend(a1, "recursiveMutex"));
}

+ (id)getInternalSupportPath
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __CFString *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  __CFString *v25;
  BOOL v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  char v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)objc_msgSend(a1, "recursiveMutex"));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  if (isZhuGeInRestoreOS())
  {
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getInternalSupportPath]", 135, CFSTR("Skip retrieving internal support path in restoreOS"), v4, v5, v6, v37);
    v7 = 0;
    v8 = 0;
LABEL_27:
    v33 = 0;
    goto LABEL_28;
  }
  if (objc_msgSend(v3, "fileExistsAtPath:isDirectory:", getInternalSupportPath_oldInternalSupportPath, &v43))v9 = v43 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v8 = (__CFString *)(id)getInternalSupportPath_oldInternalSupportPath;
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getInternalSupportPath]", 142, CFSTR("Retrieving unchanged internal supported path: %@"), v29, v30, v31, (uint64_t)v8);
    v7 = 0;
    goto LABEL_27;
  }
  v8 = CFSTR("/usr/local/ZhuGe/ZhuGeInternalSupport");
  if (objc_msgSend(v3, "fileExistsAtPath:isDirectory:", CFSTR("/usr/local/ZhuGe/ZhuGeInternalSupport"), &v43))v17 = v43 == 0;
  else
    v17 = 1;
  if (v17)
  {
    v42 = 0;
    getZhuGeFDIPathsWithError(&v42, v10, v11, v12, v13, v14, v15, v16);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v42;
    if (v33)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v33 = v33;
      v21 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v39 != v23)
              objc_enumerationMutation(v33);
            v25 = v8;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), v8, (_QWORD)v38);
            v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v8, &v43))
              v26 = v43 == 0;
            else
              v26 = 1;
            if (!v26)
            {

              goto LABEL_29;
            }

            v8 = v25;
          }
          v22 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        }
        while (v22);
      }

      v27 = CFSTR("Didn't find ZhuGe internal Support Path");
      v28 = 167;
    }
    else
    {
      v27 = CFSTR("Failed to get FDI paths");
      v28 = 155;
    }
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getInternalSupportPath]", v28, v27, v18, v19, v20, v37);
    v8 = 0;
  }
  else
  {
    v7 = 0;
    v33 = 0;
LABEL_29:
    objc_storeStrong((id *)&getInternalSupportPath_oldInternalSupportPath, v8);
    ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getInternalSupportPath]", 174, CFSTR("ZhuGe internal support path is updated to: %@"), v34, v35, v36, (uint64_t)v8);
    objc_msgSend(a1, "executeCacheRefresh");
  }
LABEL_28:
  pthread_mutex_unlock((pthread_mutex_t *)objc_msgSend(a1, "recursiveMutex"));

  return v8;
}

+ (void)getDylibHandlerWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)objc_msgSend(a1, "recursiveMutex"));
  if (a3)
  {
    *a3 = 0;
    v8 = 0;
    v9 = 0;
    if (!objc_msgSend(a1, "dylibHandler"))
    {
      objc_msgSend(a1, "getInternalSupportPath");
      v10 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v10;
      if (!v10)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getDylibHandlerWithError:]", 207, CFSTR("Failed to get ZhuGe internal support path for dylib handler!"), v11, v12, v13, v23);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithZhuGeErrorCode:underlyingError:", 43, 0);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        goto LABEL_10;
      }
      v14 = (void *)MEMORY[0x1E0CB3940];
      v24[0] = v10;
      v24[1] = CFSTR("libZhuGeInternalArmory.dylib");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pathWithComponents:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(a1, "dylibHandler"))
      {
        dlclose((void *)objc_msgSend(a1, "dylibHandler"));
        objc_msgSend(a1, "setDylibHandler:", 0);
      }
      v9 = objc_retainAutorelease(v16);
      objc_msgSend(a1, "setDylibHandler:", dlopen((const char *)objc_msgSend(v9, "UTF8String"), 1));
      if (!objc_msgSend(a1, "dylibHandler"))
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getDylibHandlerWithError:]", 218, CFSTR("Failed to dlopen ZhuGe internal armory dylib!"), v17, v18, v19, v23);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithZhuGeErrorCode:underlyingError:", 13, 0);
        v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
        *a3 = v20;
      }
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getDylibHandlerWithError:]", 194, CFSTR("error p-pointer is nil!"), v5, v6, v7, v23);
    v8 = 0;
    v9 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)objc_msgSend(a1, "recursiveMutex"));
  v21 = (void *)objc_msgSend(a1, "dylibHandler");

  return v21;
}

+ (void)registerCacheRefresh:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  pthread_mutex_lock((pthread_mutex_t *)objc_msgSend(a1, "recursiveMutex"));
  if ((isZhuGeInRestoreOS() & 1) == 0)
  {
    objc_msgSend(a1, "cacheList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(a1, "setCacheList:", v5);

    }
    objc_msgSend(a1, "cacheList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v9);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(a1, "cacheList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)objc_msgSend(a1, "recursiveMutex"));

}

+ (id)getXpcProxyWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)objc_msgSend(a1, "recursiveMutex"));
  if ((isZhuGeInRestoreOS() & 1) != 0)
    goto LABEL_9;
  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]", 273, CFSTR("error p-pointer is nil!"), v5, v6, v7, v40);
LABEL_9:
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_10;
  }
  *a3 = 0;
  objc_msgSend(a1, "xpcProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  if (v8)
    goto LABEL_10;
  objc_msgSend(a1, "getInternalSupportPath");
  v13 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v13;
  if (!v13)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]", 286, CFSTR("Failed to get ZhuGe internal support path for xpc proxy!"), v14, v15, v16, v40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithZhuGeErrorCode:underlyingError:", 43, 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = 0;
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  v17 = (void *)MEMORY[0x1E0CB3940];
  v49[0] = v13;
  v49[1] = CFSTR("ZhuGeInternalService.xpc");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pathWithComponents:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v19);
  objc_msgSend(v10, "UTF8String");
  xpc_add_bundle();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.ZhuGeInternalService"));
  if (!v11)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]", 297, CFSTR("Failed to connect \"%@\"!"), v20, v21, v22, (uint64_t)CFSTR("com.apple.ZhuGeInternalService"));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithZhuGeErrorCode:underlyingError:", 67, 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF2437E8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRemoteObjectInterface:", v23);

  v45 = (void *)MEMORY[0x1E0C99E60];
  v44 = objc_opt_class();
  v43 = objc_opt_class();
  v42 = objc_opt_class();
  v41 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  objc_msgSend(v45, "setWithObjects:", v44, v43, v42, v41, v24, v25, v26, v27, v28, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectInterface");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_setBulkKeys_getValuesAndError_, 0, 1);

  objc_msgSend(v11, "remoteObjectInterface");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_setBulkMGKeys_getValuesAndError_, 0, 1);

  v31 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __54__ZhuGeInternalSupportAssistant_getXpcProxyWithError___block_invoke;
  v48[3] = &__block_descriptor_40_e5_v8__0l;
  v48[4] = a1;
  objc_msgSend(v11, "setInvalidationHandler:", v48);
  v47[0] = v31;
  v47[1] = 3221225472;
  v47[2] = __54__ZhuGeInternalSupportAssistant_getXpcProxyWithError___block_invoke_2;
  v47[3] = &__block_descriptor_40_e5_v8__0l;
  v47[4] = a1;
  objc_msgSend(v11, "setInterruptionHandler:", v47);
  objc_msgSend(v11, "activate");
  v46[0] = v31;
  v46[1] = 3221225472;
  v46[2] = __54__ZhuGeInternalSupportAssistant_getXpcProxyWithError___block_invoke_3;
  v46[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v46[4] = a1;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v46);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setXpcProxy:", v32);

  objc_msgSend(a1, "xpcProxy");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]", 339, CFSTR("Failed to get proxy for \"%@\"!"), v34, v35, v36, (uint64_t)CFSTR("com.apple.ZhuGeInternalService"));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithZhuGeErrorCode:underlyingError:", 66, 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    *a3 = v37;
  }
LABEL_10:
  pthread_mutex_unlock((pthread_mutex_t *)objc_msgSend(a1, "recursiveMutex"));
  objc_msgSend(a1, "xpcProxy");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

uint64_t __54__ZhuGeInternalSupportAssistant_getXpcProxyWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  pthread_mutex_lock((pthread_mutex_t *)objc_msgSend(*(id *)(a1 + 32), "recursiveMutex"));
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]_block_invoke", 317, CFSTR("Connection to \"%@\" invalidated!"), v2, v3, v4, (uint64_t)CFSTR("com.apple.ZhuGeInternalService"));
  objc_msgSend(*(id *)(a1 + 32), "setXpcProxy:", 0);
  return pthread_mutex_unlock((pthread_mutex_t *)objc_msgSend(*(id *)(a1 + 32), "recursiveMutex"));
}

uint64_t __54__ZhuGeInternalSupportAssistant_getXpcProxyWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  pthread_mutex_lock((pthread_mutex_t *)objc_msgSend(*(id *)(a1 + 32), "recursiveMutex"));
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]_block_invoke_2", 323, CFSTR("Connection to \"%@\" interrupted!"), v2, v3, v4, (uint64_t)CFSTR("com.apple.ZhuGeInternalService"));
  objc_msgSend(*(id *)(a1 + 32), "setXpcProxy:", 0);
  return pthread_mutex_unlock((pthread_mutex_t *)objc_msgSend(*(id *)(a1 + 32), "recursiveMutex"));
}

uint64_t __54__ZhuGeInternalSupportAssistant_getXpcProxyWithError___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  pthread_mutex_lock((pthread_mutex_t *)objc_msgSend(v3, "recursiveMutex"));
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]_block_invoke_3", 333, CFSTR("Internal connection failed to provide a synchronized proxy, error : %@!"), v5, v6, v7, (uint64_t)v4);

  objc_msgSend(*(id *)(a1 + 32), "setXpcProxy:", 0);
  return pthread_mutex_unlock((pthread_mutex_t *)objc_msgSend(*(id *)(a1 + 32), "recursiveMutex"));
}

@end

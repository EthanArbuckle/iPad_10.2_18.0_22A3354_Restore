@implementation ICURLBagProvider

- (id)_getCacheKeyForRequestContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  ICURLBagProvider *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  id v54;
  uint8_t buf[4];
  ICURLBagProvider *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identity");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = self;
    v54 = 0;
    objc_msgSend(v6, "getPropertiesForUserIdentity:error:", v5, &v54);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v54;
    if (v10)
    {
      v11 = v4;
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v56 = v9;
        v57 = 2114;
        v58 = v10;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch identity properties. err=%{public}@", buf, 0x16u);
      }

      v4 = v11;
    }

    self = v9;
  }
  v48 = v7;
  v49 = (void *)v5;
  objc_msgSend(v8, "storefrontIdentifier");
  v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v47 = v8;
  objc_msgSend(v8, "DSID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clientIdentifier");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clientVersion");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bagProfile");
  v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bagProfileVersion");
  v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentLocale");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "productPlatform");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v4, "personalizationStyle");
  v21 = (void *)MEMORY[0x1E0CB3940];
  if (self->_useAMSBag)
  {
    if (v13)
    {
      v22 = v16;
      v23 = v15;
      v24 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "stringValue");
      v25 = objc_claimAutoreleasedReturnValue();
      v21 = v24;
      v15 = v23;
      v16 = v22;
      v26 = (__CFString *)v25;
    }
    else
    {
      v26 = CFSTR("nil");
    }
    v32 = v51;
    v31 = v52;
    if (!v52)
      v31 = CFSTR("nil");
    if (v15)
      v33 = v15;
    else
      v33 = CFSTR("nil");
    if (v16)
      v34 = v16;
    else
      v34 = CFSTR("nil");
    if (!v51)
      v32 = CFSTR("nil");
    v35 = v50;
    if (!v50)
      v35 = CFSTR("nil");
    v36 = v53;
    if (!v53)
      v36 = CFSTR("nil");
    if (v18)
      v37 = v18;
    else
      v37 = CFSTR("nil");
    if (v19)
      v38 = v19;
    else
      v38 = CFSTR("nil");
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@-%@-%@-%@-%@-%@-%@-%@-%@"), v26, v31, v33, v34, v32, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
LABEL_35:

  }
  else
  {
    if (v13)
    {
      v27 = v16;
      v28 = v15;
      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "stringValue");
      v30 = objc_claimAutoreleasedReturnValue();
      v21 = v29;
      v15 = v28;
      v16 = v27;
      v26 = (__CFString *)v30;
    }
    else
    {
      v26 = CFSTR("nil");
    }
    v41 = CFSTR("personalized");
    if (!v20)
      v41 = CFSTR("unpersonalized");
    if (v15)
      v42 = v15;
    else
      v42 = CFSTR("nil");
    if (v16)
      v43 = v16;
    else
      v43 = CFSTR("nil");
    v44 = v53;
    if (!v53)
      v44 = CFSTR("nil");
    if (v18)
      v45 = v18;
    else
      v45 = CFSTR("nil");
    if (v19)
      v46 = v19;
    else
      v46 = CFSTR("nil");
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%ld-%@-%@-%@-%@-%@-%@-%@"), 0, v26, v41, v42, v43, v44, v45, v46);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_35;
  }

  return v39;
}

void __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  void *v24;
  char v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  id v29;
  int v30;
  void *v31;
  _BOOL4 v32;
  int v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  _BOOL4 v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  dispatch_time_t v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  _QWORD block[4];
  id v61;
  _QWORD v62[5];
  id v63;
  id v64;
  uint64_t *v65;
  _QWORD v66[5];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint8_t buf[4];
  uint64_t v79;
  __int16 v80;
  _BYTE v81[10];
  id v82;
  __int16 v83;
  int v84;
  __int16 v85;
  _BOOL4 v86;
  __int16 v87;
  int v88;
  __int16 v89;
  int v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "_getCacheKeyForRequestContext:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__4896;
  v76 = __Block_byref_object_dispose__4897;
  objc_msgSend(*(id *)(*(_QWORD *)v2 + 8), "objectForKey:", v3);
  v77 = (id)objc_claimAutoreleasedReturnValue();
  if (!v73[5])
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "_cacheDirectoryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@/%@.plist"), v5, v3);

    objc_msgSend(*(id *)(a1 + 32), "_loadPlistAtPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_10:

      goto LABEL_11;
    }
    v8 = -[ICURLBag _initWithPropertyListRepresentation:]([ICURLBag alloc], "_initWithPropertyListRepresentation:", v7);
    v9 = (void *)v73[5];
    v73[5] = (uint64_t)v8;

    v10 = v73[5];
    if (v10)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v10, v3);
      v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v79 = v12;
        v80 = 2114;
        *(_QWORD *)v81 = v3;
        v13 = "%{public}@ Retrieved persisted cache from disk for cache key: %{public}@";
        v14 = v11;
        v15 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
        _os_log_impl(&dword_1A03E3000, v14, v15, v13, buf, 0x16u);
      }
    }
    else
    {
      v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v79 = v16;
        v80 = 2114;
        *(_QWORD *)v81 = v3;
        v13 = "%{public}@ Failed to create bag from cached data for key: %{public}@";
        v14 = v11;
        v15 = OS_LOG_TYPE_ERROR;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
LABEL_11:
  if (*(_BYTE *)(a1 + 56))
  {
    v17 = 1;
  }
  else
  {
    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "shouldBypassURLBagCache");

  }
  v19 = (void *)v73[5];
  if (!v19)
    goto LABEL_23;
  objc_msgSend(v19, "amsBag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v20 != 0) != (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) != 0))
  {
    v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(unsigned __int8 *)(v22 + 64);
      *(_DWORD *)buf = 138543874;
      v79 = v22;
      v80 = 1024;
      *(_DWORD *)v81 = v23;
      *(_WORD *)&v81[4] = 1024;
      *(_DWORD *)&v81[6] = v20 != 0;
      _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Forcing a refresh because _useAMSBag = %{BOOL}u and hasAMSBagPayload = %{BOOL}u", buf, 0x18u);
    }

    goto LABEL_23;
  }
  v24 = (void *)v73[5];
  v25 = v24 ? v17 : 1;
  if ((v25 & 1) != 0
    || objc_msgSend(v24, "isExpired")
    && !objc_msgSend(*(id *)(a1 + 40), "allowsExpiredBags"))
  {
LABEL_23:
    v26 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v59 = v3;
      v28 = *(_QWORD *)(a1 + 32);
      v27 = *(void **)(a1 + 40);
      objc_msgSend(v27, "clientInfo");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = *(unsigned __int8 *)(a1 + 56);
      v31 = (void *)v73[5];
      v32 = v31 != 0;
      v33 = objc_msgSend(v31, "isExpired");
      v34 = objc_msgSend(*(id *)(a1 + 40), "allowsExpiredBags");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      v79 = v28;
      v80 = 2114;
      *(_QWORD *)v81 = v27;
      *(_WORD *)&v81[8] = 2114;
      v82 = v29;
      v83 = 1024;
      v84 = v30;
      v85 = 1024;
      v86 = v32;
      v87 = 1024;
      v88 = v33;
      v89 = 1024;
      v90 = v34;
      v91 = 2114;
      v3 = v59;
      v92 = v59;
      v93 = 2114;
      v94 = v35;
      _os_log_impl(&dword_1A03E3000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching new bag for requestContext %{public}@, clientInfo=%{public}@; force=%{BOOL}u, cached=%{BOOL}"
        "u, expired=%{BOOL}u, allowsExpired=%{BOOL}u, cacheKey='%{public}@', allKeys=%{public}@",
        buf,
        0x4Cu);

    }
    v36 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(v36 + 40), "objectForKey:", v3);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v3);
      else
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *(void **)(a1 + 48);
      if (v40)
      {
        v41 = (void *)objc_msgSend(v40, "copy");
        objc_msgSend(v39, "addObject:", v41);

      }
      if (v37)
      {
        v42 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v79 = v43;
          _os_log_impl(&dword_1A03E3000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ Waiting for a duplicate bag request to complete", buf, 0xCu);
        }

      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", MEMORY[0x1E0C9AAA0], *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", v39, v3);
        v44 = *(void **)(a1 + 32);
        v45 = *(_QWORD *)(a1 + 40);
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_48;
        v62[3] = &unk_1E438A900;
        v62[4] = v44;
        v63 = v3;
        v64 = *(id *)(a1 + 40);
        v65 = &v72;
        objc_msgSend(v44, "_fetchBagForRequestContext:withCompletionHandler:", v45, v62);

      }
    }
    else
    {
      v38 = *(NSObject **)(v36 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_52;
      block[3] = &unk_1E4390D18;
      v61 = *(id *)(a1 + 48);
      dispatch_async(v38, block);
      v39 = v61;
    }
    goto LABEL_48;
  }
  v46 = MEMORY[0x1E0C809B0];
  v47 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_41;
  v69[3] = &unk_1E438FF18;
  v70 = *(id *)(a1 + 48);
  v71 = &v72;
  dispatch_async(v47, v69);
  if (objc_msgSend((id)v73[5], "isExpired"))
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", v3) & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v3);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48 == 0;

      if (v49)
      {
        _ICLogCategoryDefault();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          v51 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v79 = v51;
          _os_log_impl(&dword_1A03E3000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ Returned expired URL bag, so scheduling an URL bag refresh in 10 seconds", buf, 0xCu);
        }

        v52 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        if (!v52)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2);
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = *(_QWORD *)(a1 + 32);
          v55 = *(void **)(v54 + 48);
          *(_QWORD *)(v54 + 48) = v53;

          v52 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        }
        objc_msgSend(v52, "addObject:", v3);
        v56 = dispatch_time(0, 10000000000);
        v57 = *(_QWORD *)(a1 + 32);
        v58 = *(NSObject **)(v57 + 16);
        v66[0] = v46;
        v66[1] = 3221225472;
        v66[2] = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_43;
        v66[3] = &unk_1E4391230;
        v66[4] = v57;
        v67 = v3;
        v68 = *(id *)(a1 + 40);
        dispatch_after(v56, v58, v66);

      }
    }
  }
  v39 = v70;
LABEL_48:

  _Block_object_dispose(&v72, 8);
}

uint64_t __79__ICURLBagProvider_getBagForRequestContext_forceRefetch_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

void __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_52(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7002, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

  }
}

void __49__ICURLBagProvider__cleanBagCacheExcludingPaths___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  uint64_t v25;
  char v26;
  NSObject *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  void *v31;
  id obj;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  NSObject *v44;
  _BYTE v45[128];
  uint64_t v46;

  v1 = a1;
  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_cacheDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v3, "enumeratorAtPath:", v2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v36;
    v30 = *MEMORY[0x1E0CB2A88];
    *(_QWORD *)&v5 = 138543618;
    v29 = v5;
    v31 = v2;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v2, "stringByAppendingPathComponent:", v9, v29);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        objc_msgSend(v3, "attributesOfItemAtPath:error:", v10, &v34);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v34;
        if (v12)
        {
          v13 = v12;
          v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = *(_QWORD *)(v1 + 32);
            *(_DWORD *)buf = 138543874;
            v40 = v15;
            v41 = 2114;
            v42 = v10;
            v43 = 2114;
            v44 = v13;
            _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Error reading file attributes at path %{public}@. error=%{public}@", buf, 0x20u);
          }

        }
        else if (objc_msgSend(*(id *)(v1 + 40), "containsObject:", v10))
        {
          v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v16 = *(_QWORD *)(v1 + 32);
            *(_DWORD *)buf = v29;
            v40 = v16;
            v41 = 2114;
            v42 = v9;
            _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ Cleanup excluding path: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          v17 = v1;
          objc_msgSend(v11, "objectForKey:", v30);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "timeIntervalSinceReferenceDate");
          v21 = v20;
          objc_msgSend(v18, "timeIntervalSinceReferenceDate");
          v23 = v21 - v22;

          if (v23 <= 2419200.0)
          {
            v13 = 0;
          }
          else
          {
            v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = *(_QWORD *)(v17 + 32);
              *(_DWORD *)buf = v29;
              v40 = v25;
              v41 = 2114;
              v42 = v10;
              _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing stale cache at path: %{public}@", buf, 0x16u);
            }

            v33 = 0;
            v26 = objc_msgSend(v3, "removeItemAtPath:error:", v10, &v33);
            v13 = v33;
            if ((v26 & 1) == 0)
            {
              v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v28 = *(_QWORD *)(v17 + 32);
                *(_DWORD *)buf = v29;
                v40 = v28;
                v41 = 2114;
                v42 = v10;
                _os_log_impl(&dword_1A03E3000, v27, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error removing file at path %{public}@", buf, 0x16u);
              }

            }
          }

          v1 = v17;
          v2 = v31;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v6);
  }

}

void __30__ICURLBagProvider__loadCache__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t j;
  void *v25;
  void *v26;
  void *v27;
  os_log_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  char v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_cacheDirectoryPath");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)v2;
  if ((objc_msgSend(v47, "fileExistsAtPath:", v2) & 1) != 0)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v56 = v4;
      v57 = 2114;
      v58 = v2;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Loading bag caches from '%{public}@'", buf, 0x16u);
    }
    v43 = a1;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v47, "enumeratorAtPath:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v52;
      v10 = *MEMORY[0x1E0CB2A88];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v52 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (objc_msgSend(v12, "hasSuffix:", CFSTR(".plist")))
          {
            objc_msgSend(v48, "stringByAppendingPathComponent:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "attributesOfItemAtPath:error:", v13, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "objectForKey:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v5, "setObject:forKey:", v15, v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __30__ICURLBagProvider__loadCache__block_invoke_106;
    v49[3] = &unk_1E438A9E0;
    v42 = v5;
    v50 = v42;
    objc_msgSend(v17, "sortUsingComparator:", v49);
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v19 = v43;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(v43 + 32);
      *(_DWORD *)buf = 138543618;
      v56 = v20;
      v57 = 2114;
      v58 = (uint64_t)v17;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Loading cached bags for keys '%{public}@'", buf, 0x16u);
    }

    v21 = objc_msgSend(v17, "count");
    v22 = 4;
    if (v21 < 4)
      v22 = v21;
    v23 = v17;
    if (v22)
    {
      for (j = 0; j < v41; ++j)
      {
        objc_msgSend(v23, "objectAtIndex:", j);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringByAppendingPathComponent:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v19 + 32), "_loadPlistAtPath:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = -[ICURLBag _initWithPropertyListRepresentation:]([ICURLBag alloc], "_initWithPropertyListRepresentation:", v27);
          if (v28)
          {
            objc_msgSend(v25, "stringByDeletingPathExtension");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "ic_stringValueForKey:", CFSTR("build_version"));
            v29 = (id)objc_claimAutoreleasedReturnValue();
            +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "buildVersion");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v32 = v31;
            v45 = v29;
            if (v29 == v32)
            {

            }
            else
            {
              v33 = objc_msgSend(v29, "isEqual:", v32);

              if ((v33 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "now");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject _setExpirationDate:](v28, "_setExpirationDate:", v34);

                objc_msgSend(*(id *)(v19 + 32), "_persistBagToDisk:withKey:", v28, v46);
              }
            }
            objc_msgSend(*(id *)(*(_QWORD *)(v19 + 32) + 8), "setObject:forKey:", v28, v46);
            objc_msgSend(v44, "addObject:", v26);
            v36 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              v37 = *(_QWORD *)(v19 + 32);
              -[NSObject expirationDate](v28, "expirationDate");
              v38 = v23;
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v56 = v37;
              v57 = 2114;
              v58 = (uint64_t)v25;
              v59 = 2114;
              v60 = v39;
              _os_log_impl(&dword_1A03E3000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded cached bag for key '%{public}@'. expiration=%{public}@", buf, 0x20u);

              v23 = v38;
              v19 = v43;
            }

          }
        }
        else
        {
          v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v35 = *(_QWORD *)(v19 + 32);
            *(_DWORD *)buf = 138543618;
            v56 = v35;
            v57 = 2114;
            v58 = (uint64_t)v26;
            _os_log_impl(&dword_1A03E3000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load cache at path %{public}@", buf, 0x16u);
          }
        }

        v40 = objc_msgSend(v23, "count");
        if (v40 >= 4)
          v41 = 4;
        else
          v41 = v40;
      }
    }
    objc_msgSend(*(id *)(v19 + 32), "_cleanBagCacheExcludingPaths:", v44);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_loadMonoCache");
  }

}

- (id)_loadPlistAtPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v11;
  uint8_t buf[4];
  ICURLBagProvider *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v4, 0, &v11);
  v6 = v11;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v13 = self;
      v14 = 2114;
      v15 = v4;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Could not load plist at path '%{public}@' error=%{public}@", buf, 0x20u);
    }

  }
  if (v5 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (_NSIsNSDictionary())
      v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_cleanBagCacheExcludingPaths:(id)a3
{
  id v4;
  NSObject *persistenceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  persistenceQueue = self->_persistenceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__ICURLBagProvider__cleanBagCacheExcludingPaths___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(persistenceQueue, v7);

}

- (void)getBagForRequestContext:(id)a3 withCompletionHandler:(id)a4
{
  -[ICURLBagProvider getBagForRequestContext:forceRefetch:withCompletionHandler:](self, "getBagForRequestContext:forceRefetch:withCompletionHandler:", a3, 0, a4);
}

+ (ICURLBagProvider)sharedBagProvider
{
  if (sharedBagProvider_sOnceToken != -1)
    dispatch_once(&sharedBagProvider_sOnceToken, &__block_literal_global_5036);
  return (ICURLBagProvider *)(id)sharedBagProvider_sSharedBagProvider;
}

- (void)getBagForRequestContext:(id)a3 forceRefetch:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__ICURLBagProvider_getBagForRequestContext_forceRefetch_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E438A898;
  v11 = v8;
  v9 = v8;
  -[ICURLBagProvider getBagAndURLMetricsForRequestContext:forceRefetch:withCompletionHandler:](self, "getBagAndURLMetricsForRequestContext:forceRefetch:withCompletionHandler:", a3, v5, v10);

}

- (void)getBagAndURLMetricsForRequestContext:(id)a3 forceRefetch:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  BOOL v18;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICURLBagProvider.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestContext != nil"));

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke;
  block[3] = &unk_1E4390B20;
  block[4] = self;
  v16 = v9;
  v18 = a4;
  v17 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_async(accessQueue, block);

}

- (id)_cacheDirectoryPath
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("unknown");
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLsForDirectory:inDomains:", 14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.iTunesCloud/URLBags/%@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)useAMSBag
{
  return self->_useAMSBag;
}

void __37__ICURLBagProvider_sharedBagProvider__block_invoke()
{
  ICURLBagProvider *v0;
  void *v1;

  v0 = objc_alloc_init(ICURLBagProvider);
  v1 = (void *)sharedBagProvider_sSharedBagProvider;
  sharedBagProvider_sSharedBagProvider = (uint64_t)v0;

}

- (ICURLBagProvider)init
{
  ICURLBagProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pendingOperationsForCacheKey;
  uint64_t v5;
  MSVLRUDictionary *cache;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *persistenceQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *callbackQueue;
  uint64_t v14;
  NSMutableDictionary *bagChangeNotificationReceivedForRequestContext;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICURLBagProvider;
  v2 = -[ICURLBagProvider init](&v19, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingOperationsForCacheKey = v2->_pendingOperationsForCacheKey;
    v2->_pendingOperationsForCacheKey = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D078]), "initWithMaximumCapacity:", 4);
    cache = v2->_cache;
    v2->_cache = (MSVLRUDictionary *)v5;

    v7 = dispatch_queue_create("com.apple.iTunesCloud.ICURLBagProvider.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.iTunesCloud.ICURLBagProvider.persistence", v9);
    persistenceQueue = v2->_persistenceQueue;
    v2->_persistenceQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.iTunesCloud.ICURLBagProvider.callback", MEMORY[0x1E0C80D50]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v12;

    v2->_useAMSBag = _os_feature_enabled_impl();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v14 = objc_claimAutoreleasedReturnValue();
    bagChangeNotificationReceivedForRequestContext = v2->_bagChangeNotificationReceivedForRequestContext;
    v2->_bagChangeNotificationReceivedForRequestContext = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel__handleUserIdentityStoreDidChangeNotification_, CFSTR("ICUserIdentityStoreDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel__handleAMSBagChangedNotification_, *MEMORY[0x1E0CFD7C0], 0);

    -[ICURLBagProvider _loadCache](v2, "_loadCache");
  }
  return v2;
}

- (void)_loadCache
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__ICURLBagProvider__loadCache__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_handleAMSBagChangedNotification:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ICURLBagProvider *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__ICURLBagProvider__handleAMSBagChangedNotification___block_invoke;
  v7[3] = &unk_1E4391110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __53__ICURLBagProvider__handleAMSBagChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CFD7D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CFD7D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CFD7C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v29 = v7;
    v30 = 2114;
    v31 = v3;
    v32 = 2114;
    v33 = v4;
    v34 = 2114;
    v35 = v5;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Recevied AMSBag change notification for profile %{public}@/%{public}@ and account '%{public}@", buf, 0x2Au);
  }

  if (v5)
  {
    +[ICMonitoredAccountStore sharedAccountStore](ICMonitoredAccountStore, "sharedAccountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v8, "storeAccountWithIdentifier:error:", v5, &v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v27;

    if (v10)
    {
      v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "msv_description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v5;
        v30 = 2114;
        v31 = v12;
        _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "Failed to get account for identifier '%{public}@' error=%{public}@", buf, 0x16u);

      }
    }
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __53__ICURLBagProvider__handleAMSBagChangedNotification___block_invoke_99;
  v23 = &unk_1E438A9B8;
  v14 = v3;
  v24 = v14;
  v15 = v4;
  v25 = v15;
  v16 = v9;
  v26 = v16;
  objc_msgSend(v13, "msv_firstWhere:", &v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKey:", MEMORY[0x1E0C9AAB0], v17, v20, v21, v22, v23, v24, v25);
  }
  else
  {
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "%{public}@ No matching request context for notification - ignoring", buf, 0xCu);
    }

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("ICUserIdentityStoreDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)ICURLBagProvider;
  -[ICURLBagProvider dealloc](&v4, sel_dealloc);
}

- (void)invalidateCache
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__ICURLBagProvider_invalidateCache__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_fetchBagForRequestContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  ICStoreURLRequest *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  _QWORD v58[5];
  __CFString *v59;
  id v60;
  __CFString *v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[5];
  id v66;
  __CFString *v67;
  id v68;
  __CFString *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  uint8_t buf[4];
  ICURLBagProvider *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "clientInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v76 = self;
    v77 = 2114;
    v78 = v6;
    v79 = 2114;
    v80 = v11;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing bag request for requestContext %{public}@. clientInfo=%{public}@", buf, 0x20u);

  }
  objc_msgSend(v9, "bagProfile");
  v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v57)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v76 = self;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ No bag profile name provided - using default", buf, 0xCu);
    }

    v57 = CFSTR("itunescloudd");
    v13 = CFSTR("itunescloudd");
  }
  objc_msgSend(v9, "bagProfileVersion");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v76 = self;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ No bag profile version provided - using default", buf, 0xCu);
    }

    v14 = CFSTR("1");
    v16 = CFSTR("1");
  }
  v55 = v9;
  objc_msgSend(v6, "identityStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  objc_msgSend(v17, "DSIDForUserIdentity:outError:", v18, &v74);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v74;

  if (v20)
  {
    v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "identity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v76 = self;
      v77 = 2114;
      v78 = v22;
      v79 = 2114;
      v80 = v20;
      _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load account DSID for identity %{public}@. err=%{public}@", buf, 0x20u);

    }
  }
  v53 = v19;
  v56 = v8;
  if (self->_useAMSBag)
  {
    if (v19)
    {
      v23 = v7;
      +[ICMonitoredAccountStore sharedAccountStore](ICMonitoredAccountStore, "sharedAccountStore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v20;
      objc_msgSend(v24, "storeAccountForDSID:error:", v19, &v73);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v73;

      if (v26)
      {
        v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          ICCreateLoggableValueForDSID(v19);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v76 = self;
          v77 = 2114;
          v78 = v28;
          v79 = 2114;
          v80 = v26;
          _os_log_impl(&dword_1A03E3000, v27, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load account for DSID %{public}@. err=%{public}@", buf, 0x20u);

        }
      }
      v29 = (void *)v25;
      v7 = v23;
    }
    else
    {
      v26 = v20;
      v29 = 0;
    }
    -[ICURLBagProvider _amsProcessInfoFromRequestContext:](self, "_amsProcessInfoFromRequestContext:", v6);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v76 = self;
      v77 = 2114;
      v78 = v6;
      v79 = 2114;
      v80 = v29;
      _os_log_impl(&dword_1A03E3000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching AMS bag for context %{public}@ using account %{public}@.", buf, 0x20u);
    }

    v52 = (void *)v46;
    if (v29)
    {
      v45 = v29;
      objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:processInfo:account:", v57, v14, v46, v29);
    }
    else
    {
      v45 = 0;
      objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:processInfo:", v57, v14, v46);
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke;
    v65[3] = &unk_1E438A968;
    v65[4] = self;
    v72 = v7;
    v66 = v48;
    v67 = v57;
    v43 = v54;
    v68 = v54;
    v69 = v14;
    v70 = v53;
    v71 = v6;
    v39 = v53;
    v35 = v48;
    objc_msgSend(v35, "createSnapshotWithCompletion:", v65);

  }
  else
  {
    v30 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v76 = self;
      v77 = 2114;
      v78 = v6;
      _os_log_impl(&dword_1A03E3000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching legacy bag for context %{public}@", buf, 0x16u);
    }
    v50 = v20;
    v51 = v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", CFSTR("6"), CFSTR("ix"));
    objc_msgSend(v8, "currentLocale");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
      objc_msgSend(v31, "setObject:forKey:", v32, CFSTR("locale"));
    v52 = (void *)v32;
    objc_msgSend(v8, "productVersion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "componentsSeparatedByString:", CFSTR("."));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v35, "length"))
      objc_msgSend(v31, "setObject:forKey:", v35, CFSTR("os"));
    v36 = objc_alloc(MEMORY[0x1E0C92C28]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://init.itunes.apple.com/bag.xml"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "ic_URLByAppendingQueryParameters:", v31);
    v49 = v31;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (id)objc_msgSend(v36, "initWithURL:", v38);

    objc_msgSend(v39, "setCachePolicy:", 1);
    v40 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v39, v6);
    -[ICStoreURLRequest setShouldRequireURLBag:](v40, "setShouldRequireURLBag:", 0);
    -[ICStoreURLRequest setAnisetteVersion:](v40, "setAnisetteVersion:", 0);
    -[ICURLRequest setPrioritize:](v40, "setPrioritize:", 1);
    -[ICStoreURLRequest setShouldUseMescalSigning:](v40, "setShouldUseMescalSigning:", 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("urlBag/%@/%@"), v57, v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICURLRequest enableLoadURLMetricsWithRequestName:](v40, "enableLoadURLMetricsWithRequestName:", v41);

    +[ICURLSessionManager unlimitedHighPrioritySession](ICURLSessionManager, "unlimitedHighPrioritySession");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_94;
    v58[3] = &unk_1E438C650;
    v58[4] = self;
    v7 = v51;
    v64 = v51;
    v59 = v57;
    v43 = v54;
    v60 = v54;
    v61 = v14;
    v62 = v19;
    v63 = v6;
    v44 = v19;
    objc_msgSend(v42, "enqueueDataRequest:withCompletionHandler:", v40, v58);

    v45 = v49;
    v26 = v50;
  }

}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  NSObject *v4;
  int v5;
  ICURLBagProvider *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ user identity changed - invalidating bag cache", (uint8_t *)&v5, 0xCu);
  }

  -[ICURLBagProvider invalidateCache](self, "invalidateCache");
}

- (void)_loadMonoCache
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ICURLBagProvider__loadMonoCache__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_persistBagToDisk:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  NSObject *persistenceQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICURLBagProvider *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  persistenceQueue = self->_persistenceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ICURLBagProvider__persistBagToDisk_withKey___block_invoke;
  block[3] = &unk_1E4391230;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(persistenceQueue, block);

}

- (id)_legacyCacheFilePath
{
  void *v2;
  __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v4 = CFSTR("unknown");
  if (v3)
    v4 = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDefaultCacheDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v6, CFSTR("URLBags"), v5, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_amsProcessInfoFromRequestContext:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CFDBD0]);
    goto LABEL_5;
  }
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDBD0]), "initWithBundleIdentifier:", v4);
  if (ICSystemApplicationTypeForBundleIdentifier(v4))
  {
LABEL_5:
    objc_msgSend(v3, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExecutableName:", v6);

    objc_msgSend(v3, "clientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalizedName:", v7);

    objc_msgSend(v3, "clientVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClientVersion:", v8);

  }
  objc_msgSend(v3, "clientBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v3, "clientBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProxyAppBundleID:", v12);

  }
  return v5;
}

- (id)_dictionaryFromBagPayloadDictionaryAddingKnownMissingKeys:(id)a3 forProfileName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4896;
  v22 = __Block_byref_object_dispose__4897;
  v23 = 0;
  -[ICURLBagProvider _knownMissingBagValuesDictionary](self, "_knownMissingBagValuesDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__ICURLBagProvider__dictionaryFromBagPayloadDictionaryAddingKnownMissingKeys_forProfileName___block_invoke;
  v14[3] = &unk_1E438AA30;
  v9 = v6;
  v15 = v9;
  v17 = &v18;
  v10 = v8;
  v16 = v10;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);
  v11 = (void *)v19[5];
  if (!v11)
    v11 = v9;
  v12 = v11;

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (id)_knownMissingBagValuesDictionary
{
  if (_knownMissingBagValuesDictionary_sMissingKeysOnceToken != -1)
    dispatch_once(&_knownMissingBagValuesDictionary_sMissingKeysOnceToken, &__block_literal_global_124);
  return (id)_knownMissingBagValuesDictionary_sKnownMissingBagValuesDictionary;
}

- (void)setUseAMSBag:(BOOL)a3
{
  self->_useAMSBag = a3;
}

- (BOOL)useRawPayload
{
  return self->_useRawPayload;
}

- (void)setUseRawPayload:(BOOL)a3
{
  self->_useRawPayload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagChangeNotificationReceivedForRequestContext, 0);
  objc_storeStrong((id *)&self->_cacheKeysScheduledForRefresh, 0);
  objc_storeStrong((id *)&self->_pendingOperationsForCacheKey, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

void __52__ICURLBagProvider__knownMissingBagValuesDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("podcasts-license-offline-stop");
  v2[1] = CFSTR("podcasts-license-offline-stop-nonce");
  v3[0] = CFSTR("https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/offline/stop");
  v3[1] = CFSTR("https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/offline/stop/nonce");
  v2[2] = CFSTR("cloud-assets-update");
  v3[2] = CFSTR("https://genius-3.itunes.apple.com/SGCourier/updateAssets/");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_knownMissingBagValuesDictionary_sKnownMissingBagValuesDictionary;
  _knownMissingBagValuesDictionary_sKnownMissingBagValuesDictionary = v0;

}

void __93__ICURLBagProvider__dictionaryFromBagPayloadDictionaryAddingKnownMissingKeys_forProfileName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v7)
    {
      v8 = *(void **)(a1 + 32);
      if (v8)
      {
        v9 = (void *)objc_msgSend(v8, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v9);

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v11);
  }

}

void __46__ICURLBagProvider__persistBagToDisk_withKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  char v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  NSObject *v33;
  __int16 v34;
  NSObject *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_propertyListRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("build_version"));

  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, &v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v29;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_cacheDirectoryPath");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@.plist"), v8, *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "fileExistsAtPath:", v8) & 1) != 0)
    {
      v11 = v7;
    }
    else
    {
      v28 = v7;
      v13 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v28);
      v11 = v28;

      if ((v13 & 1) == 0)
      {
        v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        v24 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v31 = v24;
        v32 = 2114;
        v33 = v8;
        v34 = 2114;
        v35 = v11;
        v25 = "%{public}@ Encountered error creating cache directory at %{public}@. error=%{public}@";
        goto LABEL_20;
      }
    }
    if ((objc_msgSend(v10, "fileExistsAtPath:", v9) & 1) != 0
      || (objc_msgSend(v10, "createFileAtPath:contents:attributes:", v9, v6, 0) & 1) != 0)
    {
      v27 = v11;
      v14 = objc_msgSend(v6, "writeToFile:options:error:", v9, 1, &v27);
      v15 = v27;

      v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      v17 = v16;
      if ((v14 & 1) != 0)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v31 = v18;
          v32 = 2114;
          v33 = v9;
          v19 = "%{public}@ Persisted cache at path %{public}@.";
          v20 = v17;
          v21 = OS_LOG_TYPE_DEFAULT;
          v22 = 22;
LABEL_14:
          _os_log_impl(&dword_1A03E3000, v20, v21, v19, buf, v22);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v23 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v31 = v23;
        v32 = 2114;
        v33 = v9;
        v34 = 2114;
        v35 = v15;
        v19 = "%{public}@ Failed to write cache at path %{public}@ error=%{public}@";
        v20 = v17;
        v21 = OS_LOG_TYPE_ERROR;
        v22 = 32;
        goto LABEL_14;
      }
      v11 = v15;
LABEL_21:

      v7 = v11;
      goto LABEL_22;
    }
    v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v26 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v31 = v26;
    v32 = 2114;
    v33 = v9;
    v34 = 2114;
    v35 = v11;
    v25 = "%{public}@ Failed to create cache file at path %{public}@ error=%{public}@";
LABEL_20:
    _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, v25, buf, 0x20u);
    goto LABEL_21;
  }
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v31 = v12;
    v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to serialize bag data. err=%{public}@", buf, 0x16u);
  }
LABEL_22:

}

void __34__ICURLBagProvider__loadMonoCache__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint32_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[5];
  char v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_cacheDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathExtension:", CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_legacyCacheFilePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

    if (v8)
    {
      v9 = v6;

      v3 = v9;
    }

  }
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v46 = v11;
    v47 = 2114;
    v48 = (uint64_t)v3;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Loading bag cache from mono cache file '%{public}@'", buf, 0x16u);
  }

  v44 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v3, 0, &v44);
  v13 = v44;
  if (!objc_msgSend(v12, "length"))
  {
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v46 = v15;
      v47 = 2114;
      v48 = (uint64_t)v13;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load bag cache data. err=%{public}@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v12, 0, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_NSIsNSDictionary())
    {
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v16, "ic_stringValueForKey:", CFSTR("build_version"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "buildVersion");
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = v17;
    v39 = (void *)v19;
    if (v17 == (void *)v19)
      LODWORD(v17) = 0;
    else
      LODWORD(v17) = objc_msgSend(v17, "isEqual:", v19) ^ 1;
    objc_msgSend(v16, "ic_dictionaryValueForKey:", CFSTR("cache_entries"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v40 = v21;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (int)v17;
      v17 = v13;
      v23 = v20;
      v24 = *(_QWORD *)(a1 + 32);
      v25 = objc_msgSend(v21, "count");
      objc_msgSend(v40, "allKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v46 = v24;
      v20 = v23;
      v13 = v17;
      LOBYTE(v17) = v38;
      v47 = 2048;
      v48 = v25;
      v21 = v40;
      v49 = 2114;
      v50 = v20;
      v51 = 1024;
      v52 = v38;
      v53 = 2114;
      v54 = v26;
      _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %lu cached bags. cachedBuildVersion=%{public}@, shouldInvalidateCache=%{BOOL}u, keys=%{public}@", buf, 0x30u);

    }
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __34__ICURLBagProvider__loadMonoCache__block_invoke_110;
    v42[3] = &unk_1E438AA08;
    v42[4] = *(_QWORD *)(a1 + 32);
    v43 = (char)v17;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v42);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v28 = objc_msgSend(v27, "removeItemAtPath:error:", v3, &v41);
    v29 = v41;

    v30 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v31 = v30;
    if (v28)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v46 = v32;
        v47 = 2114;
        v48 = (uint64_t)v3;
        v33 = "%{public}@ Removed mono cache at path %{public}@";
        v34 = v31;
        v35 = OS_LOG_TYPE_DEFAULT;
        v36 = 22;
LABEL_23:
        _os_log_impl(&dword_1A03E3000, v34, v35, v33, buf, v36);
      }
    }
    else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v37 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v46 = v37;
      v47 = 2114;
      v48 = (uint64_t)v3;
      v49 = 2114;
      v50 = v29;
      v33 = "%{public}@ Failed to remove monoCache at path: %{public}@. error=%{public}@";
      v34 = v31;
      v35 = OS_LOG_TYPE_ERROR;
      v36 = 32;
      goto LABEL_23;
    }

    goto LABEL_25;
  }
LABEL_26:

}

void __34__ICURLBagProvider__loadMonoCache__block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (_NSIsNSString() && _NSIsNSDictionary())
  {
    v7 = -[ICURLBag _initWithPropertyListRepresentation:]([ICURLBag alloc], "_initWithPropertyListRepresentation:", v6);
    v8 = v7;
    if (!v7)
    {
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 32);
        v21 = 138543618;
        v22 = v19;
        v23 = 2114;
        v24 = v5;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create bag from cache for key '%{public}@'", (uint8_t *)&v21, 0x16u);
      }
      goto LABEL_15;
    }
    objc_msgSend(v7, "expirationDate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v21 = 138543874;
      v22 = v11;
      v23 = 2114;
      v24 = v5;
      v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded cached bag for key '%{public}@'. expiration=%{public}@", (uint8_t *)&v21, 0x20u);
    }

    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v14 = v13;
      -[NSObject timeIntervalSinceReferenceDate](v9, "timeIntervalSinceReferenceDate");
      v16 = v14 - v15;

      if (v16 > 604800.0)
      {
        v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v21 = 138543618;
          v22 = v18;
          v23 = 2114;
          v24 = v5;
          _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping loading cached bag for key '%{public}@' because its too old", (uint8_t *)&v21, 0x16u);
        }

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setExpirationDate:", v20);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v8, v5);
    objc_msgSend(*(id *)(a1 + 32), "_persistBagToDisk:withKey:", v8, v5);
LABEL_15:

  }
}

BOOL __30__ICURLBagProvider__loadCache__block_invoke_106(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v12 = v10 > v11;

  return v12;
}

uint64_t __53__ICURLBagProvider__handleAMSBagChangedNotification___block_invoke_99(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bagProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v4, "bagProfileVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v7)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v3, "identity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identityStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "DSIDForUserIdentity:outError:", v8, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "ic_DSID");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        v12 = v11;
        v13 = objc_msgSend(v10, "isEqual:", v11);

        if ((v13 & 1) != 0)
          goto LABEL_10;
        goto LABEL_8;
      }

    }
LABEL_10:
    v14 = 1;
    goto LABEL_11;
  }
LABEL_8:
  v14 = 0;
LABEL_11:

  return v14;
}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD block[4];
  _QWORD v25[2];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v42 = v19;
      v43 = 2114;
      v44 = v7;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch url bag. err=%{public}@", buf, 0x16u);
    }

    v20 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_71;
    v38[3] = &unk_1E4390EF8;
    v40 = *(id *)(a1 + 88);
    v39 = v7;
    dispatch_async(v20, v38);

    v10 = v40;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_temporaryDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v8, "resultWithError:", &v37);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v37;
    if (v10 || !v9)
    {
      v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v42 = v22;
        v43 = 2114;
        v44 = v10;
        _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load payload dictionary. err=%{public}@", buf, 0x16u);
      }

      v23 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_74;
      v34[3] = &unk_1E4390EF8;
      v14 = &v36;
      v36 = *(id *)(a1 + 88);
      v35 = v10;
      dispatch_async(v23, v34);
      v17 = v35;
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(v11 + 65))
      {
        objc_msgSend((id)v11, "_dictionaryFromBagPayloadDictionaryAddingKnownMissingKeys:forProfileName:", v9, *(_QWORD *)(a1 + 48));
        v12 = objc_claimAutoreleasedReturnValue();

        v11 = *(_QWORD *)(a1 + 32);
        v9 = (id)v12;
      }
      v13 = *(NSObject **)(v11 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_2;
      block[3] = &unk_1E438A990;
      v14 = (id *)v25;
      v15 = *(id *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 32);
      v25[0] = v15;
      v25[1] = v16;
      v9 = v9;
      v26 = v9;
      v27 = v5;
      v28 = *(id *)(a1 + 56);
      v29 = *(id *)(a1 + 48);
      v30 = *(id *)(a1 + 64);
      v31 = *(id *)(a1 + 72);
      v32 = *(id *)(a1 + 80);
      v33 = *(id *)(a1 + 88);
      dispatch_async(v13, block);

      v17 = v26;
    }

  }
}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "performanceMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "aggregatedPerformanceMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v6)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v42 = v9;
      v43 = 2114;
      v44 = v6;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch legacy url bag. err=%{public}@", buf, 0x16u);
    }

    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_95;
    block[3] = &unk_1E4390E58;
    v40 = *(id *)(a1 + 80);
    v38 = v7;
    v39 = v6;
    dispatch_async(v10, block);

    v11 = v40;
  }
  else
  {
    objc_msgSend(v5, "parsedBodyDictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(v14 + 65))
      {
        objc_msgSend((id)v14, "_dictionaryFromBagPayloadDictionaryAddingKnownMissingKeys:forProfileName:", v13, *(_QWORD *)(a1 + 40));
        v15 = objc_claimAutoreleasedReturnValue();

        v14 = *(_QWORD *)(a1 + 32);
        v13 = (void *)v15;
      }
      v16 = *(NSObject **)(v14 + 16);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_2_97;
      v23[3] = &unk_1E438A990;
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 32);
      v24 = v17;
      v25 = v18;
      v26 = v13;
      v27 = *(id *)(a1 + 48);
      v28 = *(id *)(a1 + 40);
      v29 = *(id *)(a1 + 56);
      v30 = *(id *)(a1 + 64);
      v31 = *(id *)(a1 + 72);
      v33 = *(id *)(a1 + 80);
      v32 = v7;
      v11 = v13;
      dispatch_async(v16, v23);

    }
    else
    {
      v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v5, "parsedBody");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v20;
        v43 = 2114;
        v44 = v21;
        _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to parse the legacy bag response. body=%{public}@", buf, 0x16u);

      }
      v22 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_96;
      v34[3] = &unk_1E4390EF8;
      v36 = *(id *)(a1 + 80);
      v35 = v7;
      dispatch_async(v22, v34);

      v11 = v36;
    }
  }

}

uint64_t __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_95(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 0, a1[4], a1[5]);
}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_96(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v1 + 16))(v1, 0, v2, v3);

}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_2_97(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  double v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  double v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "urlResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_valueForHTTPHeaderField:", CFSTR("x-apple-jingle-correlation-key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_valueForHTTPHeaderField:", CFSTR("X-Apple-Application-Site"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "urlResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_calculatedExpiration");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v8;
  v10 = v8 + 600.0;
  if (v7 < v10)
    v7 = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "timeIntervalSince1970");
    *(_DWORD *)buf = 138543874;
    v18 = v13;
    v19 = 2048;
    v20 = v7 - v9;
    v21 = 2048;
    v22 = (uint64_t)v14;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched new bag which expires in %fs (expiration date: %{time_t}zd).", buf, 0x20u);
  }

  v15 = -[ICURLBag _initWithDictionary:amsBag:requestDate:expirationDate:serverCorrelationKey:serverEnvironment:profileName:profileVersion:sourceAccountDSID:]([ICURLBag alloc], "_initWithDictionary:amsBag:requestDate:expirationDate:serverCorrelationKey:serverEnvironment:profileName:profileVersion:sourceAccountDSID:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56), v11, v3, v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "_getCacheKeyForRequestContext:", *(_QWORD *)(a1 + 88));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", v15, v16);
  objc_msgSend(*(id *)(a1 + 40), "_persistBagToDisk:withKey:", v15, v16);
  (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();

}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_71(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7200, *(_QWORD *)(a1 + 32), CFSTR("Failed to fetch url bag"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_74(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7200, *(_QWORD *)(a1 + 32), CFSTR("Failed to load payload dictionary"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  id v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  if (v2)
    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  else
    v5 = v3 + 7200.0;
  if (v5 >= v4 + 600.0)
    v6 = v5;
  else
    v6 = v4 + 600.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "timeIntervalSince1970");
    v11 = (uint64_t)v10;
    objc_msgSend(v2, "timeIntervalSince1970");
    *(_DWORD *)buf = 138544130;
    v16 = v9;
    v17 = 2048;
    v18 = v6 - v4;
    v19 = 2048;
    v20 = v11;
    v21 = 2048;
    v22 = (uint64_t)v12;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched new bag which expires in %fs (expiration time: %{time_t}zd, adjusted from %{time_t}zd)", buf, 0x2Au);
  }

  v13 = -[ICURLBag _initWithDictionary:amsBag:requestDate:expirationDate:serverCorrelationKey:serverEnvironment:profileName:profileVersion:sourceAccountDSID:]([ICURLBag alloc], "_initWithDictionary:amsBag:requestDate:expirationDate:serverCorrelationKey:serverEnvironment:profileName:profileVersion:sourceAccountDSID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v7, 0, 0, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "_getCacheKeyForRequestContext:", *(_QWORD *)(a1 + 96));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", v13, v14);
  objc_msgSend(*(id *)(a1 + 40), "_persistBagToDisk:withKey:", v13, v14);
  (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();

}

void __35__ICURLBagProvider_invalidateCache__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidating all entries in url bag cache by expiring them", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_56);

}

void __35__ICURLBagProvider_invalidateCache__block_invoke_54(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "now");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setExpirationDate:", v4);

}

uint64_t __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_41(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0, 0);
  return result;
}

void __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_43(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || objc_msgSend(v2, "isExpired"))
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting to refresh an expired URL bag", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "getBagForRequestContext:forceRefetch:withCompletionHandler:", *(_QWORD *)(a1 + 48), 1, &__block_literal_global_46);
  }

}

void __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_48(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(_QWORD *);
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v28 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:", a1[5]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 40), "removeObjectForKey:", a1[5]);
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[4];
    v12 = objc_msgSend(v9, "count");
    v13 = a1[6];
    *(_DWORD *)buf = 138543874;
    v43 = v11;
    v44 = 2048;
    v45 = v12;
    v46 = 2114;
    v47 = v13;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Notifying %lu callers that we got the bag for context %{public}@", buf, 0x20u);
  }

  if (objc_msgSend(v9, "count"))
  {
    v14 = 0;
    v15 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v14, v28);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = *(NSObject **)(a1[4] + 32);
        block[0] = v15;
        block[1] = 3221225472;
        block[2] = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_49;
        block[3] = &unk_1E4390EA8;
        v41 = v16;
        v38 = v28;
        v39 = v7;
        v40 = v8;
        dispatch_async(v18, block);

      }
      ++v14;
    }
    while (v14 < objc_msgSend(v9, "count"));
  }
  if (!v8)
  {
    v19 = a1[4];
    if (*(_BYTE *)(v19 + 64))
    {
      objc_msgSend(*(id *)(v19 + 56), "objectForKey:", a1[6]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLValue");

      if (!v21)
        goto LABEL_17;
    }
    else
    {
      v22 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
      if (v22 && (objc_msgSend(v22, "isEqual:", v28) & 1) != 0)
        goto LABEL_17;
    }
    v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = a1[4];
      v25 = a1[6];
      *(_DWORD *)buf = 138543618;
      v43 = v24;
      v44 = 2114;
      v45 = v25;
      _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected bag change for requestContext %{public}@ - posting notification", buf, 0x16u);
    }

    v26 = a1[4];
    v27 = *(NSObject **)(v26 + 32);
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_50;
    v33 = &unk_1E4391230;
    v34 = v26;
    v35 = (id)a1[6];
    v36 = v28;
    dispatch_async(v27, &v30);

  }
LABEL_17:
  objc_msgSend(*(id *)(a1[4] + 56), "removeObjectForKey:", a1[6], v28, v30, v31, v32, v33, v34);

}

uint64_t __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_49(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_50(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v3 = a1[5];
  v7[0] = CFSTR("request_context");
  v7[1] = CFSTR("url_bag");
  v5 = a1[6];
  v8[0] = v3;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ICURLBagProviderDidUpdateBagNotification"), v4, v6);

}

@end

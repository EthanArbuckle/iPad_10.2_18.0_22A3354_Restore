@implementation MOContextHistoryReader

- (id)_getFrameworkClientIdentity
{
  __SecTask *v2;
  __SecTask *v3;
  __CFString *v4;
  __CFString *v5;
  CFTypeID v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    v3 = v2;
    v4 = (__CFString *)SecTaskCopyValueForEntitlement(v2, CFSTR("application-identifier"), 0);
    if (v4)
    {
      v5 = v4;
      v6 = CFGetTypeID(v4);
      if (v6 == CFStringGetTypeID())
      {
        CFRelease(v3);
        goto LABEL_8;
      }

    }
    CFRelease(v3);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *(_QWORD *)_CFGetProgname(), 4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("bundle-Id"));
  if (v5)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("alt-Id"));
    if (objc_msgSend(&unk_251446370, "containsObject:", v5))
    {
      _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_243AAA000, v10, OS_LOG_TYPE_DEFAULT, "Client is photoanalysisd test alias.", (uint8_t *)&v14, 2u);
      }

      v9 = CFSTR("com.apple.photoanalysisd");
    }
  }
  _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v9;
    _os_log_impl(&dword_243AAA000, v11, OS_LOG_TYPE_DEFAULT, "client bundle-id: %@", (uint8_t *)&v14, 0xCu);
  }

  _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v5;
    _os_log_impl(&dword_243AAA000, v12, OS_LOG_TYPE_DEFAULT, "client alt-id: %@", (uint8_t *)&v14, 0xCu);
  }

  return v7;
}

- (BOOL)_isFetchDetail:(id)a3 matchingBundleId:(id)a4 orAlternateId:(id)a5
{
  void *v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    if (v9)
    {
      objc_msgSend(v8, "clientBundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", v5) & 1) != 0)
      {
        v12 = 1;
LABEL_11:

        goto LABEL_12;
      }
      if (!v11)
      {
        v12 = 0;
        goto LABEL_11;
      }
LABEL_8:
      objc_msgSend(v8, "alternateClientIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v13);

      if (!v9)
        goto LABEL_12;
      goto LABEL_11;
    }
    if (v10)
      goto LABEL_8;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)_enumeratePublishersForStream:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *, void *);
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void (**v23)(id, void *, void *);
  id v24;
  void *v25;
  uint64_t v26;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  v36 = 0;
  objc_msgSend(v5, "remoteDevicesWithError:", &v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v36;
  if (v8)
  {
    _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MOContextHistoryReader _enumeratePublishersForStream:usingBlock:].cold.1(v8);

    v10 = v8;
  }
  else
  {
    v11 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v28 = v7;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      v29 = *(_QWORD *)v33;
      v30 = v12;
      do
      {
        v16 = 0;
        v31 = v14;
        do
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v16);
          v18 = (void *)MEMORY[0x2494FF8B0]();
          if (objc_msgSend(v17, "platform") == 2)
          {
            objc_msgSend(v5, "publisherForDevice:withUseCase:options:", v17, CFSTR("PromptsReader"), v11);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v17, "deviceIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "model");
              v22 = v11;
              v23 = v6;
              v24 = v5;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v17, "platform");
              *(_DWORD *)buf = 138412802;
              v38 = v21;
              v39 = 2112;
              v40 = v25;
              v41 = 2048;
              v42 = v26;
              _os_log_impl(&dword_243AAA000, v20, OS_LOG_TYPE_INFO, "Found sync device: %@, %@, %ld", buf, 0x20u);

              v5 = v24;
              v6 = v23;
              v11 = v22;
              v15 = v29;

              v12 = v30;
            }

            v6[2](v6, v17, v19);
            v14 = v31;
          }
          objc_autoreleasePoolPop(v18);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      }
      while (v14);
    }

    v10 = 0;
    v8 = 0;
    v7 = v28;
  }

  return v10;
}

- (unint64_t)_getLatestFetchIdForClient:(id)a3 usingPublisher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  _QWORD v17[6];
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundle-Id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("alt-Id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  v10 = MEMORY[0x24BDAC760];
  v22 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke;
  v18[3] = &unk_251442900;
  v18[4] = self;
  v11 = v8;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  objc_msgSend(v7, "filterWithIsIncluded:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke_23;
  v17[3] = &unk_251442968;
  v17[4] = v21;
  v17[5] = &v23;
  v14 = (id)objc_msgSend(v13, "sinkWithCompletion:receiveInput:", &__block_literal_global_1, v17);

  v15 = v24[3];
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&v23, 8);
  return v15;
}

uint64_t __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personalizedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "fetchDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "fetchDetails");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "fetchDetails");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "fetchId"))
        {
          v9 = (void *)a1[4];
          objc_msgSend(v4, "fetchDetails");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "_isFetchDetail:matchingBundleId:orAlternateId:", v10, a1[5], a1[6]);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke_2_cold_1(v2);

  }
}

void __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke_23(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personalizedContext");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v4
    || (objc_msgSend(v13, "fetchDetails"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "timestamp"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v4, "isAfterDate:", v6),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    objc_msgSend(v13, "fetchDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timestamp");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(v13, "fetchDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v12, "fetchId");

  }
}

- (void)loadPersonalizedContextWithOptions:(id)a3 withReply:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void (**v18)(id, _QWORD, id);
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  uint8_t *v25;
  uint64_t v26;
  id *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v17 = a3;
  v18 = (void (**)(id, _QWORD, id))a4;
  _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_243AAA000, v6, OS_LOG_TYPE_INFO, "Fetching context from shared stream", buf, 2u);
  }

  -[MOContextHistoryReader _getFrameworkClientIdentity](self, "_getFrameworkClientIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundle-Id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("alt-Id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "PersonalizedSensing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "MomentsContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  v35 = buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = (id)objc_opt_new();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  v33 = 0;
  v26 = 0;
  v27 = (id *)&v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke;
  v19[3] = &unk_251442A30;
  v19[4] = self;
  v13 = v7;
  v20 = v13;
  v14 = v8;
  v21 = v14;
  v15 = v9;
  v22 = v15;
  v23 = &v26;
  v24 = v32;
  v25 = buf;
  -[MOContextHistoryReader _enumeratePublishersForStream:usingBlock:](self, "_enumeratePublishersForStream:usingBlock:", v12, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*((id *)v35 + 5), "count") && v16)
    objc_storeStrong(v27 + 5, v16);
  v18[2](v18, *((_QWORD *)v35 + 5), v27[5]);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(buf, 8);
}

void __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[7];
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_getLatestFetchIdForClient:usingPublisher:", *(_QWORD *)(a1 + 40), v6);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)MEMORY[0x2494FF8B0]();
    v10 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_2;
    v26[3] = &unk_251442990;
    v11 = *(_QWORD *)(a1 + 32);
    v29 = v8;
    v26[4] = v11;
    v27 = *(id *)(a1 + 48);
    v28 = *(id *)(a1 + 56);
    objc_msgSend(v6, "filterWithIsIncluded:", v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy_;
    v24[4] = __Block_byref_object_dispose_;
    v25 = 0;
    v13 = (void *)objc_opt_new();
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_3;
    v23[3] = &unk_2514429B8;
    v23[4] = v24;
    objc_msgSend(v12, "reduceWithInitial:nextPartialResult:", v13, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_26;
    v20[3] = &unk_2514429E0;
    v15 = v5;
    v16 = *(_QWORD *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 72);
    v21 = v15;
    v22 = v16;
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_27;
    v19[3] = &unk_251442A08;
    v19[4] = v17;
    v19[5] = v24;
    v19[6] = *(_QWORD *)(a1 + 80);
    v18 = (id)objc_msgSend(v14, "sinkWithCompletion:receiveInput:", v20, v19);

    _Block_object_dispose(v24, 8);
    objc_autoreleasePoolPop(v9);
  }

}

uint64_t __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personalizedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "fetchDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[7] == objc_msgSend(v5, "fetchId"))
    {
      v6 = (void *)a1[4];
      objc_msgSend(v4, "fetchDetails");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "_isFetchDetail:matchingBundleId:orAlternateId:", v7, a1[5], a1[6]);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personalizedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fetchDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "count");
  if (v9 == objc_msgSend(v8, "batchContextReplyStartIndex"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      objc_msgSend(v8, "timestamp");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    objc_msgSend(v7, "contexts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v7, "contexts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v14);

    }
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v19[0] = 67109376;
        v19[1] = objc_msgSend(v8, "fetchId");
        v20 = 1024;
        v21 = objc_msgSend(v8, "batchContextReplyStartIndex");
        _os_log_impl(&dword_243AAA000, v15, OS_LOG_TYPE_INFO, "Skip split fetch batch fetchId=%u, index=%u", (uint8_t *)v19, 0xEu);
      }

    }
    objc_msgSend(v5, "removeAllObjects");
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

  }
  return v5;
}

void __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _mo_log_facility_get_os_log(MOLogFacilityContextCrossPlatform);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_26_cold_1(a1, v3, v5);

    objc_msgSend(v3, "error");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_27(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  if (!v4 || (objc_msgSend(v4, "isAfterDate:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40)) & 1) == 0)
  {
    v5 = (void *)objc_opt_new();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          +[MOContext fromBiome:](MOContext, "fromBiome:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), *(id *)(*(_QWORD *)(a1[5] + 8) + 40));
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v5);
    }

  }
}

- (void)_enumeratePublishersForStream:(void *)a1 usingBlock:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_243AAA000, v2, v3, "Can't get MomentContext remote devices: %@", v4, v5, v6, v7, 2u);

}

void __68__MOContextHistoryReader__getLatestFetchIdForClient_usingPublisher___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_243AAA000, v3, v4, "Can't load biome sync context: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1();
}

void __71__MOContextHistoryReader_loadPersonalizedContextWithOptions_withReply___block_invoke_26_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_243AAA000, a3, OS_LOG_TYPE_ERROR, "Can't load biome sync context from %@: %@", (uint8_t *)&v8, 0x16u);

  OUTLINED_FUNCTION_1();
}

@end

@implementation LTHotfixManager

void __26___LTHotfixManager_shared__block_invoke()
{
  _LTHotfixManager *v0;
  void *v1;

  v0 = objc_alloc_init(_LTHotfixManager);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;

}

void __34___LTHotfixManager_refreshHotfix___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34___LTHotfixManager_refreshHotfix___block_invoke_2;
  v4[3] = &unk_251A11878;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_replaceHotfix:completion:", 1, v4);

}

void __34___LTHotfixManager_refreshHotfix___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __34___LTHotfixManager_refreshHotfix___block_invoke_2_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __34___LTHotfixManager_refreshHotfix___block_invoke_13;
    v6[3] = &unk_251A12748;
    v5 = *(void **)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v7, "_updateHotfixInternal:", v6);

  }
}

void __34___LTHotfixManager_refreshHotfix___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __34___LTHotfixManager_refreshHotfix___block_invoke_13_cold_1();
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 2;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 3;
  }
  objc_msgSend(v5, "_replaceHotfix:completion:", v7, v6);

}

uint64_t __33___LTHotfixManager_updateHotfix___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHotfixInternal:", *(_QWORD *)(a1 + 40));
}

void __42___LTHotfixManager__updateHotfixInternal___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  const __CFString *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __42___LTHotfixManager__updateHotfixInternal___block_invoke_cold_2();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2E738], "minimumSupportedConfigurationVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    objc_msgSend(MEMORY[0x24BE2E738], "maximumSupportedConfigurationVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Mapping"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (!v13)
      goto LABEL_23;
    v14 = v13;
    v27 = v5;
    v15 = 0;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("FormatVersion"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "intValue");

        if (v20 >= 1 && v20 >= v10 && v20 <= v12)
        {
          v23 = v18;

          v15 = v23;
        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v14);
    v5 = v27;
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "_downloadHotfix:completion:", v15, *(_QWORD *)(a1 + 40));
      v7 = 0;
    }
    else
    {
LABEL_23:
      v24 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BDD0FC8];
      v34 = CFSTR("Cannot find any compatible hotfix");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("HotfixManager"), 0, v25);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = _LTOSLogAssets();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        __42___LTHotfixManager__updateHotfixInternal___block_invoke_cold_1();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v15 = 0;
    }

  }
}

void __33___LTHotfixManager_deleteHotfix___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _LTOSLogHotfix();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v12 = hotfixBasePath;
    _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "Attempting to delete hotfix at base path %{public}@", buf, 0xCu);
  }
  objc_msgSend((id)hotfixBasePath, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "fileExistsAtPath:", v4);

  if (v5)
  {
    v10 = 0;
    objc_msgSend(v2, "removeItemAtURL:error:", hotfixBasePath, &v10);
    v6 = v10;
    if (v6)
    {
      v7 = _LTOSLogHotfix();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __33___LTHotfixManager_deleteHotfix___block_invoke_cold_1();
    }
  }
  else
  {
    v6 = 0;
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __48___LTHotfixManager__downloadWithURL_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void (*v8)(void);
  NSObject *v9;

  v6 = a4;
  v7 = v6;
  if (!a2 || v6)
  {
    v9 = _LTOSLogHotfix();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __48___LTHotfixManager__downloadWithURL_completion___block_invoke_cold_1(a1, (uint64_t)v7, v9);
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

void __42___LTHotfixManager__downloadMappingPlist___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8[6];

  v5 = a3;
  if (v5)
  {
    v8[1] = (id)MEMORY[0x24BDAC760];
    v8[2] = (id)3221225472;
    v8[3] = __42___LTHotfixManager__downloadMappingPlist___block_invoke_2;
    v8[4] = &unk_251A127E8;
    v6 = v5;
    v8[5] = v6;
    AnalyticsSendEventLazy();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v7 = v6;
  }
  else
  {
    v8[0] = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a2, 0, 0, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8[0];
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

id __42___LTHotfixManager__downloadMappingPlist___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = CFSTR("domain");
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = CFSTR("file");
  v8[1] = v4;
  v8[2] = &unk_251A50AD0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __47___LTHotfixManager__downloadHotfix_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v2 = _LTOSLogHotfix();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "Found existing hotfix", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __47___LTHotfixManager__downloadHotfix_completion___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __47___LTHotfixManager__downloadHotfix_completion___block_invoke_2;
    v22 = &unk_251A127E8;
    v8 = &v23;
    v23 = v6;
    AnalyticsSendEventLazy();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47___LTHotfixManager__downloadHotfix_completion___block_invoke_53;
    v13[3] = &unk_251A12860;
    v8 = &v14;
    v14 = v9;
    v18 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    v15 = v11;
    v16 = v12;
    v17 = v5;
    dispatch_async(v10, v13);

  }
}

id __47___LTHotfixManager__downloadHotfix_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = CFSTR("domain");
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = CFSTR("file");
  v8[1] = v4;
  v8[2] = &unk_251A50AE8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __47___LTHotfixManager__downloadHotfix_completion___block_invoke_53(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;

  v2 = (void *)a1[4];
  objc_msgSend((id)hotfixBasePath, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if ((_DWORD)v2)
  {
    v4 = (void *)a1[4];
    v27 = 0;
    objc_msgSend(v4, "removeItemAtURL:error:", hotfixBasePath, &v27);
    v5 = v27;
    if (v5)
    {
      v6 = v5;
      v7 = _LTOSLogHotfix();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __47___LTHotfixManager__downloadHotfix_completion___block_invoke_53_cold_3();
      (*(void (**)(void))(a1[8] + 16))();
      v8 = (void *)a1[4];
      v26 = v6;
      objc_msgSend(v8, "removeItemAtURL:error:", hotfixBasePath, &v26);
      v9 = v26;
LABEL_14:
      v21 = v9;

      return;
    }
  }
  v10 = (void *)a1[4];
  v11 = a1[5];
  v25 = 0;
  objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v25);
  v12 = v25;
  if (v12)
  {
    v6 = v12;
    v13 = _LTOSLogHotfix();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __47___LTHotfixManager__downloadHotfix_completion___block_invoke_53_cold_2();
    (*(void (**)(void))(a1[8] + 16))();
    v14 = (void *)a1[4];
    v24 = v6;
    objc_msgSend(v14, "removeItemAtURL:error:", hotfixBasePath, &v24);
    v9 = v24;
    goto LABEL_14;
  }
  v15 = (void *)a1[6];
  v16 = a1[7];
  v17 = a1[5];
  v23 = 0;
  objc_msgSend(v15, "_decompressArchive:to:error:", v16, v17, &v23);
  v18 = v23;
  if (v18)
  {
    v6 = v18;
    v19 = _LTOSLogHotfix();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __47___LTHotfixManager__downloadHotfix_completion___block_invoke_53_cold_1();
    (*(void (**)(void))(a1[8] + 16))();
    v20 = (void *)a1[4];
    v22 = v6;
    objc_msgSend(v20, "removeItemAtURL:error:", hotfixBasePath, &v22);
    v9 = v22;
    goto LABEL_14;
  }
  objc_storeStrong((id *)(a1[6] + 16), (id)a1[5]);
  (*(void (**)(void))(a1[8] + 16))();
}

void __34___LTHotfixManager_refreshHotfix___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v0, v1, "Hotfix asset refresh prepare failure: %@", v2);
  OUTLINED_FUNCTION_1_2();
}

void __34___LTHotfixManager_refreshHotfix___block_invoke_13_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v0, v1, "Hotfix asset refresh update failure: %@", v2);
  OUTLINED_FUNCTION_1_2();
}

void __42___LTHotfixManager__updateHotfixInternal___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v0, v1, "Update of hotfix assets failed: %@", v2);
  OUTLINED_FUNCTION_1_2();
}

void __42___LTHotfixManager__updateHotfixInternal___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v0, v1, "Update of hotfix map failed: %@", v2);
  OUTLINED_FUNCTION_1_2();
}

void __33___LTHotfixManager_deleteHotfix___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v0, v1, "Failed to delete hotfix: %@", v2);
  OUTLINED_FUNCTION_1_2();
}

void __48___LTHotfixManager__downloadWithURL_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "Failed to download hotfix at URL '%{public}@' with error: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_2();
}

void __47___LTHotfixManager__downloadHotfix_completion___block_invoke_53_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v0, v1, "Decompression failed: %@", v2);
  OUTLINED_FUNCTION_1_2();
}

void __47___LTHotfixManager__downloadHotfix_completion___block_invoke_53_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v0, v1, "Create folder failed: %@", v2);
  OUTLINED_FUNCTION_1_2();
}

void __47___LTHotfixManager__downloadHotfix_completion___block_invoke_53_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v0, v1, "Remove folder failed: %@", v2);
  OUTLINED_FUNCTION_1_2();
}

@end

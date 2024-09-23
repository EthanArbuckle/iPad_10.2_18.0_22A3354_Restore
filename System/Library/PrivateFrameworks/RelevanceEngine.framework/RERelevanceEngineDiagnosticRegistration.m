@implementation RERelevanceEngineDiagnosticRegistration

- (id)_init
{
  _BYTE *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RERelevanceEngineDiagnosticRegistration;
  v2 = -[RESingleton _init](&v6, sel__init);
  if (v2)
  {
    if (_fetchedInternalBuildOnceToken_8 != -1)
      dispatch_once(&_fetchedInternalBuildOnceToken_8, &__block_literal_global_68);
    if (_isInternalDevice_8)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_defaultRegistrationDirectory");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v2[8] = objc_msgSend(v3, "fileExistsAtPath:", v4);

    }
    else
    {
      v2[8] = 0;
    }
  }
  return v2;
}

uint64_t __48__RERelevanceEngineDiagnosticRegistration__init__block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_8 = result;
  return result;
}

- (id)_defaultRegistrationDirectory
{
  _QWORD block[4];
  __CFString *v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__RERelevanceEngineDiagnosticRegistration__defaultRegistrationDirectory__block_invoke;
  block[3] = &unk_24CF8AAF0;
  v4 = CFSTR("/private/var/mobile/Library/RelevanceEngine/Registration/");
  if (_defaultRegistrationDirectory_onceToken != -1)
    dispatch_once(&_defaultRegistrationDirectory_onceToken, block);

  return CFSTR("/private/var/mobile/Library/RelevanceEngine/Registration/");
}

void __72__RERelevanceEngineDiagnosticRegistration__defaultRegistrationDirectory__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 0;
  objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v4);

}

- (id)_processesFileURL
{
  void *v2;
  void *v3;
  void *v4;

  -[RERelevanceEngineDiagnosticRegistration _defaultRegistrationDirectory](self, "_defaultRegistrationDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Processes.dat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_allProcesses
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  if (self->_supportsRegistration)
  {
    v2 = (void *)MEMORY[0x24BDBCE30];
    -[RERelevanceEngineDiagnosticRegistration _processesFileURL](self, "_processesFileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v2, "arrayWithContentsOfURL:error:", v3, &v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;

    if (!v4)
    {
      RELogForDomain(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[RERelevanceEngineDiagnosticRegistration _allProcesses].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

      v4 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v4;
}

- (void)_accessEngineDataForProcess:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  char v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  RERelevanceEngineDiagnosticRegistration *v48;
  void *v49;
  void *v50;
  void *v51;
  void (**v52)(_QWORD, void *);
  id v53;
  uint64_t v54;
  id obj;
  void *v56;
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7 || !self->_supportsRegistration)
    goto LABEL_34;
  v52 = (void (**)(_QWORD, void *))v7;
  -[RERelevanceEngineDiagnosticRegistration _defaultRegistrationDirectory](self, "_defaultRegistrationDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v6);
  v10 = objc_claimAutoreleasedReturnValue();

  v51 = (void *)v10;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDBCEF0];
  v48 = self;
  -[RERelevanceEngineDiagnosticRegistration _allProcesses](self, "_allProcesses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = objc_msgSend(v14, "copy");
  v64 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v11, &v64);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v64;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    RELogForDomain(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[RERelevanceEngineDiagnosticRegistration _accessEngineDataForProcess:usingBlock:].cold.4();

  }
  v49 = v16;
  v50 = (void *)v11;
  v53 = v6;
  REBuildVersion();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "mutableCopy");
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v15;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v61 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v19, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Version"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", v56);

        if (!v27 || (objc_msgSend(v18, "timeIntervalSinceDate:", v18), fabs(v28) > 604800.0))
          objc_msgSend(v19, "removeObjectForKey:", v24);

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    }
    while (v21);
  }

  v8 = v52;
  v52[2](v52, v19);
  if (!objc_msgSend(v19, "count"))
  {
    v29 = v14;
    v6 = v53;
    objc_msgSend(v14, "removeObject:", v53);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    v30 = v50;
    v36 = objc_msgSend(v35, "removeItemAtURL:error:", v50, &v58);
    v32 = v58;

    if (v36)
    {
      RELogForDomain(0);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v54;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[RERelevanceEngineDiagnosticRegistration _accessEngineDataForProcess:usingBlock:].cold.2();
      goto LABEL_25;
    }
LABEL_26:
    v34 = (void *)v54;
    goto LABEL_27;
  }
  v29 = v14;
  v6 = v53;
  objc_msgSend(v14, "addObject:", v53);
  v59 = 0;
  v30 = v50;
  v31 = objc_msgSend(v19, "writeToURL:error:", v50, &v59);
  v32 = v59;
  if ((v31 & 1) != 0)
    goto LABEL_26;
  RELogForDomain(0);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    -[RERelevanceEngineDiagnosticRegistration _accessEngineDataForProcess:usingBlock:].cold.3();
  v34 = (void *)v54;
LABEL_25:

LABEL_27:
  if ((objc_msgSend(v34, "isEqualToSet:", v29) & 1) == 0)
  {
    objc_msgSend(v29, "allObjects");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[RERelevanceEngineDiagnosticRegistration _processesFileURL](v48, "_processesFileURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v39 = objc_msgSend(v37, "writeToURL:error:", v38, &v57);
    v40 = v57;

    if ((v39 & 1) == 0)
    {
      RELogForDomain(0);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[RERelevanceEngineDiagnosticRegistration _accessEngineDataForProcess:usingBlock:].cold.1((uint64_t)v40, v41, v42, v43, v44, v45, v46, v47);

    }
    v34 = (void *)v54;
  }

LABEL_34:
}

- (void)checkinEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (self->_supportsRegistration)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __57__RERelevanceEngineDiagnosticRegistration_checkinEngine___block_invoke;
    v7[3] = &unk_24CF90188;
    v8 = v4;
    -[RERelevanceEngineDiagnosticRegistration _accessEngineDataForProcess:usingBlock:](self, "_accessEngineDataForProcess:usingBlock:", v6, v7);

  }
}

void __57__RERelevanceEngineDiagnosticRegistration_checkinEngine___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  REBuildVersion();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("Version");
  v8[1] = CFSTR("Date");
  v9[0] = v5;
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v4);

}

- (void)enumerateAvailableEngines:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 && self->_supportsRegistration)
  {
    -[RERelevanceEngineDiagnosticRegistration _allProcesses](self, "_allProcesses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v13[0] = v9;
          v13[1] = 3221225472;
          v13[2] = __69__RERelevanceEngineDiagnosticRegistration_enumerateAvailableEngines___block_invoke;
          v13[3] = &unk_24CF901D8;
          v12 = v4;
          v13[4] = v11;
          v14 = v12;
          -[RERelevanceEngineDiagnosticRegistration _accessEngineDataForProcess:usingBlock:](self, "_accessEngineDataForProcess:usingBlock:", v11, v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
}

void __69__RERelevanceEngineDiagnosticRegistration_enumerateAvailableEngines___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__RERelevanceEngineDiagnosticRegistration_enumerateAvailableEngines___block_invoke_2;
  v5[3] = &unk_24CF901B0;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v5);

}

uint64_t __69__RERelevanceEngineDiagnosticRegistration_enumerateAvailableEngines___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)_allProcesses
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "Unable to read registration list: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_accessEngineDataForProcess:(uint64_t)a3 usingBlock:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "Unable to write registration list: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_accessEngineDataForProcess:usingBlock:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_2132F7000, v0, v1, "Unable to remove process %@ registration data: %@");
  OUTLINED_FUNCTION_3();
}

- (void)_accessEngineDataForProcess:usingBlock:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_2132F7000, v0, v1, "Unable to write process %@ registration data: %@");
  OUTLINED_FUNCTION_3();
}

- (void)_accessEngineDataForProcess:usingBlock:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_2132F7000, v0, v1, "Unable to read process %@ registration data: %@");
  OUTLINED_FUNCTION_3();
}

@end

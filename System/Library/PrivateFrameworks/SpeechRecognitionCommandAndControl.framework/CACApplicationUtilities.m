@implementation CACApplicationUtilities

+ (id)installedApplications
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFEA68], "systemApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCache:", 1508);

  if (installedApplications_onceToken != -1)
    dispatch_once(&installedApplications_onceToken, &__block_literal_global_43);
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "carPlayConnected");

  if (v4)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "carPlayApplications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __48__CACApplicationUtilities_installedApplications__block_invoke_2;
    v27[3] = &unk_24F2AC618;
    v28 = v22;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v27);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFEA68], "systemApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uiElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectWithAXAttribute:", 1508);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "count"))
    {
      CACLogGeneral();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[CACApplicationUtilities installedApplications].cold.1(v10);

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v16, "stringByTrimmingCharactersInSet:", installedApplications_sFilterSet);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v17, CFSTR("TargetAppName"), v18, CFSTR("TargetAppIdentifier"), 0);
          objc_msgSend(v22, "addObject:", v19);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      }
      while (v13);
    }

    CACLogGeneral();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v22;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_229A40000, v20, OS_LOG_TYPE_INFO, "Installed applications: %@ \n From dictionary: %@", buf, 0x16u);
    }

  }
  return v22;
}

void __48__CACApplicationUtilities_installedApplications__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1690], "alphanumericCharacterSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formUnionWithCharacterSet:", v0);

  objc_msgSend(v3, "invertedSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)installedApplications_sFilterSet;
  installedApplications_sFilterSet = v1;

}

void __48__CACApplicationUtilities_installedApplications__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("TargetAppName");
  v5 = installedApplications_sFilterSet;
  v6 = a3;
  objc_msgSend(a2, "stringByTrimmingCharactersInSet:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("TargetAppIdentifier");
  v10[0] = v7;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
}

+ (void)launchApplicationWithIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CACLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_229A40000, v4, OS_LOG_TYPE_INFO, "Asking system application to launch app with identifier: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CACApplicationUtilities_launchApplicationWithIdentifier___block_invoke;
  block[3] = &unk_24F2AA860;
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __59__CACApplicationUtilities_launchApplicationWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "carPlayConnected");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE38490], "dashboardService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE152B8]))
    {
      v10 = *MEMORY[0x24BE382F8];
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *MEMORY[0x24BE152C0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "openApplication:withOptions:completion:", CFSTR("com.apple.CarPlayApp"), v7, &__block_literal_global_68);

    }
    else
    {
      objc_msgSend(v4, "openApplication:withOptions:completion:", *(_QWORD *)(a1 + 32), 0, 0);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFEA68], "systemApplication");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uiElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performAXAction:withValue:", 5012, *(_QWORD *)(a1 + 32));

  }
}

void __59__CACApplicationUtilities_launchApplicationWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  CACLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__CACApplicationUtilities_launchApplicationWithIdentifier___block_invoke_2_cold_1((uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_229A40000, v5, OS_LOG_TYPE_INFO, "Launched now playing successfully!", v6, 2u);
  }

}

+ (void)terminateApplicationWithIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CACLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_229A40000, v4, OS_LOG_TYPE_INFO, "Asking system application to terminate app with identifier: %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_69);
}

+ (void)installedApplications
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229A40000, log, OS_LOG_TYPE_ERROR, "[installedApplications] Warning: AXElement systemApplication kAXLaunchableAppsAttribute is empty.", v1, 2u);
}

void __59__CACApplicationUtilities_launchApplicationWithIdentifier___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_229A40000, a2, OS_LOG_TYPE_ERROR, "Failed to launch now playing with: %@", (uint8_t *)&v2, 0xCu);
}

@end

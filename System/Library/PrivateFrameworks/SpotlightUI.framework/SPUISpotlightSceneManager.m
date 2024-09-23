@implementation SPUISpotlightSceneManager

void __75__SPUISpotlightSceneManager_launchSpotlightIfNeededWithForegroundPriority___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[8];
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "spotlightProcessHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_3;
  v3 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 32), "spotlightProcessHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunning");

  if ((v6 & 1) == 0)
  {
LABEL_3:
    v7 = qword_253DC7800;
    if (!qword_253DC7800)
    {
      SPUIInitLogging();
      v7 = qword_253DC7800;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218DEA000, v7, OS_LOG_TYPE_DEFAULT, "Spotlight launch via runningboard", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.Spotlight"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80BE8], "contextWithIdentity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExplanation:", CFSTR("Spotlight launch via runningboard"));
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.spotlight"), CFSTR("LaunchInForeground"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v10;
      v11 = (void **)v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.spotlight"), CFSTR("LaunchInBackground"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v10;
      v11 = &v27;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributes:", v12);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80BF8]), "initWithContext:", v9);
    v14 = v13;
    if (v13)
    {
      v24 = 0;
      v25 = 0;
      v23 = 0;
      v15 = objc_msgSend(v13, "execute:assertion:error:", &v25, &v24, &v23);
      v16 = v25;
      v17 = v24;
      v18 = v23;
      if ((v15 & 1) == 0)
      {
        v19 = qword_253DC7800;
        if (!qword_253DC7800)
        {
          SPUIInitLogging();
          v19 = qword_253DC7800;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __75__SPUISpotlightSceneManager_launchSpotlightIfNeededWithForegroundPriority___block_invoke_cold_2((uint64_t)v18, v19);
      }
      objc_msgSend(*(id *)(a1 + 32), "setSpotlightProcessHandle:", v16);
      objc_msgSend(*(id *)(a1 + 32), "initializationAssertions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "invalidate");

      objc_msgSend(*(id *)(a1 + 32), "setInitializationAssertions:", v17);
      if (!*(_BYTE *)(a1 + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "willLaunchSpotlightInBackground");

      }
    }
    else
    {
      v22 = qword_253DC7800;
      if (!qword_253DC7800)
      {
        SPUIInitLogging();
        v22 = qword_253DC7800;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __75__SPUISpotlightSceneManager_launchSpotlightIfNeededWithForegroundPriority___block_invoke_cold_1(v22);
    }

  }
}

void __33__SPUISpotlightSceneManager_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  char v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("SPUIPrewarmSpotlightDisabled"));

  if ((v6 & 1) != 0)
    goto LABEL_18;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v4, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v8)
  {

    goto LABEL_18;
  }
  v9 = v8;
  obj = v7;
  v22 = a1;
  v23 = v4;
  v10 = 0;
  v11 = 0;
  v24 = 0;
  v12 = *(_QWORD *)v27;
  v13 = *MEMORY[0x24BEB0C28];
  v14 = *MEMORY[0x24BE37FE8];
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v27 != v12)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v16, "identifier", v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v13);

      if ((v18 & 1) != 0)
      {
        v24 = 1;
        if (!v10)
          goto LABEL_9;
      }
      else
      {
        objc_msgSend(v16, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v14);

        v11 |= v21;
        if (!v10)
        {
LABEL_9:
          objc_msgSend(v16, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v19 != 0;

          continue;
        }
      }
      v10 = 1;
    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v9);

  v4 = v23;
  if (!(v11 & 1 | ((v24 & 1) == 0) | v10) && objc_msgSend(v23, "displayBacklightLevel") >= 1)
    objc_msgSend(*(id *)(v22 + 32), "launchSpotlightIfNeededWithForegroundPriority:", 0);
LABEL_18:

}

- (RBSProcessHandle)spotlightProcessHandle
{
  return (RBSProcessHandle *)objc_getProperty(self, a2, 56, 1);
}

- (void)launchSpotlightIfNeededWithForegroundPriority:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__SPUISpotlightSceneManager_launchSpotlightIfNeededWithForegroundPriority___block_invoke;
  v8[3] = &unk_24DA1D3F0;
  v8[4] = self;
  v9 = a3;
  v5 = (void *)MEMORY[0x219A23794](v8, a2);
  -[SPUISpotlightSceneManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
    dispatch_sync(v6, v5);
  else
    dispatch_async(v6, v5);

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_3);
  return (id)sharedManager_manager;
}

void __42__SPUISpotlightSceneManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = v0;

}

- (SPUISpotlightSceneManager)init
{
  SPUISpotlightSceneManager *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  uint64_t v7;
  SPUIAppService *appService;
  void *v9;
  SPUISpotlightSceneManager *v10;
  void *v11;
  _QWORD v13[4];
  SPUISpotlightSceneManager *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SPUISpotlightSceneManager;
  v2 = -[SPUISpotlightSceneManager init](&v15, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 5, 0);
    -[SPUISpotlightSceneManager setManagedScenes:](v2, "setManagedScenes:", v3);

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 5, 0);
    -[SPUISpotlightSceneManager setForegroundScenes:](v2, "setForegroundScenes:", v4);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("spotlight process queue", v5);
    -[SPUISpotlightSceneManager setQueue:](v2, "setQueue:", v6);

    +[SPUIAppService sharedAppService](SPUIAppService, "sharedAppService");
    v7 = objc_claimAutoreleasedReturnValue();
    appService = v2->_appService;
    v2->_appService = (SPUIAppService *)v7;

    objc_msgSend(MEMORY[0x24BE38088], "configurationForDefaultMainDisplayMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsUserInteractivePriority:", 1);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __33__SPUISpotlightSceneManager_init__block_invoke;
    v13[3] = &unk_24DA1D3C8;
    v10 = v2;
    v14 = v10;
    objc_msgSend(v9, "setTransitionHandler:", v13);
    objc_msgSend(MEMORY[0x24BE38080], "monitorWithConfiguration:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISpotlightSceneManager setLayoutMonitor:](v10, "setLayoutMonitor:", v11);

  }
  return v2;
}

- (void)addScene:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPUISpotlightSceneManager managedScenes](self, "managedScenes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeScene:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SPUISpotlightSceneManager managedScenes](self, "managedScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[SPUISpotlightSceneManager foregroundScenes](self, "foregroundScenes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (void)sceneWillForeground:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("searchScreen"));

  if (v6)
  {
    v7 = qword_253DC7800;
    if (!qword_253DC7800)
    {
      SPUIInitLogging();
      v7 = qword_253DC7800;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SPUISpotlightSceneManager sceneWillForeground:].cold.1(v7, v4);
    -[SPUIAppService activate](self->_appService, "activate");
  }
  -[SPUISpotlightSceneManager foregroundScenes](self, "foregroundScenes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

  -[SPUISpotlightSceneManager applyAssertionAsNeeded](self, "applyAssertionAsNeeded");
}

- (void)sceneWillBackground:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("searchScreen"));

  if (v6)
  {
    v7 = qword_253DC7800;
    if (!qword_253DC7800)
    {
      SPUIInitLogging();
      v7 = qword_253DC7800;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SPUISpotlightSceneManager sceneWillBackground:].cold.1(v7, v4);
    -[SPUIAppService deactivate](self->_appService, "deactivate");
  }
  -[SPUISpotlightSceneManager foregroundScenes](self, "foregroundScenes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v4);

  -[SPUISpotlightSceneManager applyAssertionAsNeeded](self, "applyAssertionAsNeeded");
}

- (void)spendMoreTimeReleasingMemory
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  -[SPUISpotlightSceneManager backgroundingAssertions](self, "backgroundingAssertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SPUISpotlightSceneManager spotlightProcessHandle](self, "spotlightProcessHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE80B10]);
    objc_msgSend(MEMORY[0x24BE80D38], "targetWithProcessIdentity:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.spotlight"), CFSTR("ReleaseMemory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithExplanation:target:attributes:", CFSTR("spotlightMemoryBG"), v7, v9);
    -[SPUISpotlightSceneManager setBackgroundingAssertions:](self, "setBackgroundingAssertions:", v10);

    -[SPUISpotlightSceneManager backgroundingAssertions](self, "backgroundingAssertions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v11, "acquireWithError:", &v14);
    v12 = v14;

    if (v12)
    {
      v13 = qword_253DC7800;
      if (!qword_253DC7800)
      {
        SPUIInitLogging();
        v13 = qword_253DC7800;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v12;
        _os_log_impl(&dword_218DEA000, v13, OS_LOG_TYPE_DEFAULT, "Failed to acquire background assertion with error %@", buf, 0xCu);
      }
    }

  }
}

- (SPUISpotlightSceneManagerDelegate)delegate
{
  return (SPUISpotlightSceneManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSHashTable)managedScenes
{
  return (NSHashTable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setManagedScenes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSHashTable)foregroundScenes
{
  return (NSHashTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setForegroundScenes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLayoutMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BSTimer)watchdogTimer
{
  return (BSTimer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWatchdogTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setSpotlightProcessHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (RBSAssertion)initializationAssertions
{
  return (RBSAssertion *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInitializationAssertions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (RBSAssertion)backgroundingAssertions
{
  return (RBSAssertion *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBackgroundingAssertions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_backgroundingAssertions, 0);
  objc_storeStrong((id *)&self->_initializationAssertions, 0);
  objc_storeStrong((id *)&self->_spotlightProcessHandle, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_foregroundScenes, 0);
  objc_storeStrong((id *)&self->_managedScenes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appService, 0);
}

void __75__SPUISpotlightSceneManager_launchSpotlightIfNeededWithForegroundPriority___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218DEA000, log, OS_LOG_TYPE_ERROR, "RBS has no launch request", v1, 2u);
}

void __75__SPUISpotlightSceneManager_launchSpotlightIfNeededWithForegroundPriority___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_218DEA000, a2, OS_LOG_TYPE_ERROR, "Spotlight launch failed because of error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)sceneWillForeground:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_218DEA000, v5, v6, "Activate for %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)sceneWillBackground:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_218DEA000, v5, v6, "Deactivate for %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end

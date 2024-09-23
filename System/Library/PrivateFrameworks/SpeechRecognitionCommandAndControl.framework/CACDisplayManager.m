@implementation CACDisplayManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_491);
  return (id)sDisplayManager;
}

uint64_t __34__CACDisplayManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_allocWithZone((Class)CACDisplayManager), "init");
  v1 = (void *)sDisplayManager;
  sDisplayManager = v0;

  return objc_msgSend((id)sDisplayManager, "setShouldShowTextEditingOverlayInTutorial:", 1);
}

+ (double)durationToDisplayMessageString:(id)a3
{
  double result;

  +[CACBannerViewPresenter durationToDisplayMessageString:](CACBannerViewPresenter, "durationToDisplayMessageString:", a3);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[STVoiceControlStatusDomainPublisher invalidate](self->_voiceControlStatusPublisher, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CACDisplayManager;
  -[CACDisplayManager dealloc](&v3, sel_dealloc);
}

- (void)deinitializeWindowsWithScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBEC10]);

  if (v7)
  {
    -[CACDisplayManager setCarPlayAvailable:](self, "setCarPlayAvailable:", 0);
    -[CACDisplayManager carPlayDidConnect:](self, "carPlayDidConnect:", 0);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_sceneManagers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v14, "scene", (_QWORD)v17);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4)
        {
          v16 = v14;

          v11 = v16;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  -[NSMutableArray removeObject:](self->_sceneManagers, "removeObject:", v11);
}

- (void)_initializeWindows
{
  -[CACDisplayManager _initializeWindowsWithScene:](self, "_initializeWindowsWithScene:", 0);
}

- (void)_initializeWindowsWithScene:(id)a3
{
  id v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  CACSceneManager *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSMutableArray *sceneManagers;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CACContainerViewController *v37;
  void *v38;
  void *v39;
  double v40;
  CACContainerViewController *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  SBSSystemApertureLayoutMonitor *v47;
  SBSSystemApertureLayoutMonitor *layoutMonitor;
  id v49;

  v4 = a3;
  v5 = (uint64_t *)MEMORY[0x24BEBEC10];
  v49 = v4;
  if (v4)
  {
    objc_msgSend(v4, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "role");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEBEA00]))
    {

    }
    else
    {
      objc_msgSend(v49, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "role");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *v5);

      v4 = v49;
      if ((v10 & 1) != 0)
        goto LABEL_7;
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _CACAssertionFailed((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCommandAndControl/CommandAndControlFramework/DisplayManager/CACDisplayManager.m", 941, (uint64_t)"-[CACDisplayManager _initializeWindowsWithScene:]", v6, CFSTR("Attempted to initialize windows on unexpected scene: %@"), v11, v12, v13, (uint64_t)v49);
    }

    v4 = v49;
  }
LABEL_7:
  objc_msgSend(v4, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "role");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *v5;
  v17 = objc_msgSend(v15, "isEqualToString:", *v5);

  if (v17)
  {
    -[CACDisplayManager setCarPlayAvailable:](self, "setCarPlayAvailable:", 1);
    -[CACDisplayManager carPlayDidConnect:](self, "carPlayDidConnect:", 1);
  }
  v18 = objc_alloc_init(CACSceneManager);
  -[CACSceneManager setScene:](v18, "setScene:", v49);
  -[CACSceneManager scene](v18, "scene");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "screen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  sceneManagers = self->_sceneManagers;
  if (v22)
    -[NSMutableArray insertObject:atIndex:](sceneManagers, "insertObject:atIndex:", v18, 0);
  else
    -[NSMutableArray addObject:](sceneManagers, "addObject:", v18);
  objc_msgSend(v49, "session");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "role");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", v16);

  if (v26)
  {
    objc_msgSend(v49, "_FBSScene");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "settings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "safeAreaInsetsPortrait");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;

  }
  else
  {
    v30 = *MEMORY[0x24BEBE158];
    v32 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v34 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v36 = *(double *)(MEMORY[0x24BEBE158] + 24);
  }
  v37 = objc_alloc_init(CACContainerViewController);
  -[CACContainerViewController setAdditionalSafeAreaInsets:](v37, "setAdditionalSafeAreaInsets:", v30, v32, v34, v36);
  if (v49)
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFFAA8]), "initWithWindowScene:", v49);
  else
    v38 = (void *)objc_opt_new();
  v39 = v38;
  objc_msgSend(v38, "setRootViewController:", v37);
  v40 = *MEMORY[0x24BEBE9F0];
  objc_msgSend(v39, "setWindowLevel:", *MEMORY[0x24BEBE9F0]);
  objc_msgSend(v39, "makeKeyAndVisible");
  v41 = objc_alloc_init(CACContainerViewController);
  -[CACContainerViewController setAdditionalSafeAreaInsets:](v41, "setAdditionalSafeAreaInsets:", v30, v32, v34, v36);
  if (v49)
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFFAA0]), "initWithWindowScene:", v49);
  else
    v42 = (void *)objc_opt_new();
  v43 = v42;
  objc_msgSend(v42, "setRootViewController:", v41);
  objc_msgSend(v43, "setWindowLevel:", v40 + 1.0);
  objc_msgSend(v43, "setHidden:", 0);
  objc_msgSend(v43, "setAccessibilityElementsHidden:", 1);
  -[CACSceneManager setWindowContainerViewController:](v18, "setWindowContainerViewController:", v37);
  -[CACSceneManager setWindow:](v18, "setWindow:", v39);
  -[CACSceneManager setOverlayContainerViewController:](v18, "setOverlayContainerViewController:", v41);
  -[CACSceneManager setOverlayWindow:](v18, "setOverlayWindow:", v43);
  objc_msgSend(v49, "screen");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v44, "isEqual:", v45);

  if (v46)
  {
    v47 = (SBSSystemApertureLayoutMonitor *)objc_alloc_init(MEMORY[0x24BEB0B48]);
    layoutMonitor = self->_layoutMonitor;
    self->_layoutMonitor = v47;

    -[SBSSystemApertureLayoutMonitor addObserver:](self->_layoutMonitor, "addObserver:", self);
  }

}

- (CACDisplayManager)init
{
  CACDisplayManager *v2;
  uint64_t v3;
  NSMutableArray *sceneManagers;
  uint64_t v5;
  NSOperationQueue *messageDisplayOperationQueue;
  uint64_t v7;
  CARSessionStatus *sessionStatus;
  void *v9;
  void *v10;
  STVoiceControlStatusDomainPublisher *v11;
  STVoiceControlStatusDomainPublisher *voiceControlStatusPublisher;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CACDisplayManager;
  v2 = -[CACDisplayManager init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    sceneManagers = v2->_sceneManagers;
    v2->_sceneManagers = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    messageDisplayOperationQueue = v2->_messageDisplayOperationQueue;
    v2->_messageDisplayOperationQueue = (NSOperationQueue *)v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_messageDisplayOperationQueue, "setMaxConcurrentOperationCount:", 1);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE15240]), "initWithOptions:", 0);
    sessionStatus = v2->_sessionStatus;
    v2->_sessionStatus = (CARSessionStatus *)v7;

    -[CARSessionStatus currentSession](v2->_sessionStatus, "currentSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_carPlayConnectedWirelessly = objc_msgSend(v10, "transportType") == 3;

    v11 = (STVoiceControlStatusDomainPublisher *)objc_alloc_init(MEMORY[0x24BEB36E0]);
    voiceControlStatusPublisher = v2->_voiceControlStatusPublisher;
    v2->_voiceControlStatusPublisher = v11;

    -[CACDisplayManager _updateForCurrentStatusIndicatorType](v2, "_updateForCurrentStatusIndicatorType");
    -[CACDisplayManager _startVoiceControlServer](v2, "_startVoiceControlServer");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_refreshOverlays, CFSTR("CACSpokenCommandManagerStartedListening"), 0);

    v2->_programmaticallySelectedRange = (_NSRange)xmmword_229AD42F0;
  }
  return v2;
}

- (unsigned)carPlayDisplayID
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;

  if (!self->_carPlayConnected)
    return 0;
  -[CACDisplayManager _carScreenSceneManager](self, "_carScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_integerDisplayID");

  return v5;
}

- (NSDictionary)carPlayApplications
{
  return self->_carPlayApps;
}

- (void)_appendCarPlayLayouts:(id)a3
{
  NSDictionary *v4;
  NSDictionary *carPlayApps;
  id v6;

  -[NSDictionary bs_dictionaryByAddingEntriesFromDictionary:](self->_carPlayApps, "bs_dictionaryByAddingEntriesFromDictionary:", a3);
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  carPlayApps = self->_carPlayApps;
  self->_carPlayApps = v4;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceSynchronizeRecognizersForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF30]);

}

- (void)_processCarPlayLayoutResponse:(id)a3 forVehicleID:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  _QWORD block[5];
  id v31;
  _QWORD v32[5];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v29 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE152D0]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v39;
    v7 = *MEMORY[0x24BE152B8];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(obj);
        v27 = v8;
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v8);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v35;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v35 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
              if (objc_msgSend(v15, "isEqualToString:", v7))
              {
                v16 = objc_alloc_init(MEMORY[0x24BE152C8]);
                v32[0] = MEMORY[0x24BDAC760];
                v32[1] = 3221225472;
                v32[2] = __64__CACDisplayManager__processCarPlayLayoutResponse_forVehicleID___block_invoke;
                v32[3] = &unk_24F2ACB30;
                v32[4] = self;
                v33 = v16;
                v17 = v16;
                objc_msgSend(v17, "fetchApplicationIconInformationForBundleIdentifier:vehicleID:showBorder:completion:", v15, v29, 0, v32);

                goto LABEL_17;
              }
              objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v15);
              v17 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "localizedNameForContext:", CFSTR("Car"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "localizedNameForContext:", 0);
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = (void *)v19;
              if (!v18)
              {
                if (!v19)
                  goto LABEL_16;
LABEL_15:
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v20);
                goto LABEL_16;
              }
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v18);
              if ((objc_msgSend(v18, "isEqualToString:", v20) & 1) == 0)
                goto LABEL_15;
LABEL_16:

LABEL_17:
              ++v14;
            }
            while (v12 != v14);
            v21 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            v12 = v21;
          }
          while (v21);
        }

        v8 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v26);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CACDisplayManager__processCarPlayLayoutResponse_forVehicleID___block_invoke_3;
  block[3] = &unk_24F2AAD70;
  block[4] = self;
  v31 = v6;
  v22 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __64__CACDisplayManager__processCarPlayLayoutResponse_forVehicleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "localizedDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __64__CACDisplayManager__processCarPlayLayoutResponse_forVehicleID___block_invoke_2;
    v8 = &unk_24F2AAD70;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], &v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate", v5, v6, v7, v8, v9);

}

void __64__CACDisplayManager__processCarPlayLayoutResponse_forVehicleID___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "localizedDisplayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5[0] = *MEMORY[0x24BE152B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_appendCarPlayLayouts:", v3);

}

uint64_t __64__CACDisplayManager__processCarPlayLayoutResponse_forVehicleID___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendCarPlayLayouts:", *(_QWORD *)(a1 + 40));
}

- (void)carPlayDidConnect:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSDictionary *v22;
  NSDictionary *carPlayApps;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, void *, uint64_t);
  void *v48;
  CACDisplayManager *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v3 = a3;
  v56 = *MEMORY[0x24BDAC8D0];
  v5 = -[CACDisplayManager carPlayConnected](self, "carPlayConnected") ^ a3;
  -[CACDisplayManager setCarPlayConnected:](self, "setCarPlayConnected:", v3);
  if (v3)
  {
    if (v5)
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      self->_dictationRecognizerModeUponCarPlayConnect = objc_msgSend(v6, "dictationRecognizerMode");

      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDictationRecognizerMode:", 1);

      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "forceElementFetchWithReason:", CFSTR("CarPlay Connected"));

      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hideAnyOverlayAnimated:includeInteractiveOverlays:", 1, 1);

      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "refreshOverlays");

      if (_AXSCommandAndControlEnabled())
      {
        v11 = (void *)MEMORY[0x24BDD17C8];
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.CarPlayInUse"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "primaryStringForCommandIdentifier:", CFSTR("System.WakeListeningIPhoneFromCarPlay"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v16 = self->_sceneManagers;
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v51 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
              if (objc_msgSend(v21, "isMainDisplayScene"))
                objc_msgSend(v21, "showBannerViewWithText:type:", v15, 0);
            }
            v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
          }
          while (v18);
        }

      }
    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    carPlayApps = self->_carPlayApps;
    self->_carPlayApps = v22;

    objc_msgSend(MEMORY[0x24BE15280], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "connectedVehicleAccessories");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "anyObject");
    v26 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[NSMutableArray certificateSerialNumber](v26, "certificateSerialNumber");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = MEMORY[0x24BDAC760];
      v46 = 3221225472;
      v47 = __39__CACDisplayManager_carPlayDidConnect___block_invoke;
      v48 = &unk_24F2ACB80;
      v49 = self;
      CRVehicleIdentifierForCertificateSerial();

    }
LABEL_29:

    goto LABEL_30;
  }
  if (v5)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDictationRecognizerMode:", self->_dictationRecognizerModeUponCarPlayConnect);

    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "forceElementFetchWithReason:", CFSTR("CarPlay Disconnected"));

  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "forceSynchronizeRecognizersForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF30]);

  if (_AXSCommandAndControlEnabled() && -[CACDisplayManager carPlayAvailable](self, "carPlayAvailable"))
  {
    v31 = (void *)MEMORY[0x24BDD17C8];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ReturnedToPhone"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "primaryStringForCommandIdentifier:", CFSTR("System.WakeListeningCarPlay"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithValidatedFormat:validFormatSpecifiers:error:", v32, CFSTR("%@"), 0, v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v26 = self->_sceneManagers;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v42 != v37)
            objc_enumerationMutation(v26);
          v39 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          if (objc_msgSend(v39, "isMainDisplayScene"))
            objc_msgSend(v39, "showBannerViewWithText:type:", v24, 0);
        }
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v36);
    }
    goto LABEL_29;
  }
LABEL_30:
  if (v5)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "carPlayConnectedDidChange");

  }
}

void __39__CACDisplayManager_carPlayDidConnect___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  if (v5 && !a3)
  {
    v6 = objc_alloc_init(MEMORY[0x24BE152C8]);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __39__CACDisplayManager_carPlayDidConnect___block_invoke_2;
    v8[3] = &unk_24F2ACB58;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    v7 = v6;
    objc_msgSend(v7, "fetchIconStateForVehicleID:completion:", v9, v8);

  }
}

uint64_t __39__CACDisplayManager_carPlayDidConnect___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_processCarPlayLayoutResponse:forVehicleID:", a2, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

- (void)willProgrammaticallySelectRange:(_NSRange)a3 forElement:(id)a4
{
  void *length;
  void *v5;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11[3];
  id location;

  length = (void *)a3.length;
  v5 = (void *)a3.location;
  v7 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CACDisplayManager_willProgrammaticallySelectRange_forElement___block_invoke;
  block[3] = &unk_24F2ACBA8;
  objc_copyWeak(v11, &location);
  v11[1] = v5;
  v11[2] = length;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __64__CACDisplayManager_willProgrammaticallySelectRange_forElement___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *((_OWORD *)WeakRetained + 6) = *(_OWORD *)(a1 + 48);
    v3 = WeakRetained;
    objc_storeStrong((id *)WeakRetained + 11, *(id *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)systemApertureLayoutDidChange:(id)a3
{
  id v4;
  double y;
  double x;
  double height;
  double width;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  NSObject *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  BOOL IsEmpty;
  BOOL v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "CGRectValue");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v42.origin.x = x;
        v42.origin.y = y;
        v42.size.width = width;
        v42.size.height = height;
        if (CGRectIsEmpty(v42))
        {
          height = v20;
          width = v18;
          y = v16;
          x = v14;
        }
        else
        {
          v43.origin.x = x;
          v43.origin.y = y;
          v43.size.width = width;
          v43.size.height = height;
          v47.origin.x = v14;
          v47.origin.y = v16;
          v47.size.width = v18;
          v47.size.height = v20;
          v44 = CGRectUnion(v43, v47);
          x = v44.origin.x;
          y = v44.origin.y;
          width = v44.size.width;
          height = v44.size.height;
        }
      }
      v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v10);
  }
  CACLogGeneral();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    NSStringFromCGRect(v46);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v39 = v33;
    _os_log_debug_impl(&dword_229A40000, v21, OS_LOG_TYPE_DEBUG, "System aperature changed sizes. New size: %@", buf, 0xCu);

  }
  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSystemAperatureRect:", x, y, width, height);

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "minimumSystemAperatureRect");
  v25 = v24;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "minimumSystemAperatureRect");
  v28 = v27;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "minimumSystemAperatureRect");
  IsEmpty = CGRectIsEmpty(v45);

  if (IsEmpty || height < v25 || (vabdd_f64(v25, height) < 2.22044605e-16 ? (v31 = width < v28) : (v31 = 0), v31))
  {
    -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMinimumSystemAperatureRect:", x, y, width, height);

  }
  -[CACDisplayManager refreshOverlays](self, "refreshOverlays");

}

- (UIView)view
{
  void *v2;
  void *v3;
  void *v4;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (UIView)overlayView
{
  void *v2;
  void *v3;
  void *v4;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (void)_showBannerViewWithText:(id)a3 type:(int64_t)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[CACDisplayManager carPlayConnected](self, "carPlayConnected"))
  {
    -[CACDisplayManager _carScreenSceneManager](self, "_carScreenSceneManager");
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray showBannerViewWithText:type:](v7, "showBannerViewWithText:type:", v6, a4);
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_sceneManagers;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "showBannerViewWithText:type:", v6, a4, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }

}

- (void)displayMessageString:(id)a3 type:(int64_t)a4
{
  -[CACDisplayManager displayMessageString:type:announcementCompletion:](self, "displayMessageString:type:announcementCompletion:", a3, a4, 0);
}

- (void)displayMessageString:(id)a3 type:(int64_t)a4 announcementCompletion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  int v11;
  NSObject *v12;
  CACMessageDisplayOperation *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 IsVoiceOverRunning;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "carPlayConnected");

  if (v11)
  {
    CACLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = v8;
      _os_log_impl(&dword_229A40000, v12, OS_LOG_TYPE_INFO, "CarPlay Connected with Voice Control display message: %@", (uint8_t *)&v21, 0xCu);
    }

  }
  else
  {
    if (objc_msgSend(v8, "length"))
    {
      if ((unint64_t)(a4 - 1) <= 2)
        -[NSOperationQueue cancelAllOperations](self->_messageDisplayOperationQueue, "cancelAllOperations");
      v13 = -[CACMessageDisplayOperation initWithMessageString:type:]([CACMessageDisplayOperation alloc], "initWithMessageString:type:", v8, a4);
      -[NSOperationQueue operations](self->_messageDisplayOperationQueue, "operations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        -[NSOperationQueue operations](self->_messageDisplayOperationQueue, "operations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACMessageDisplayOperation addDependency:](v13, "addDependency:", v17);

      }
      -[NSOperationQueue addOperation:](self->_messageDisplayOperationQueue, "addOperation:", v13);
      IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
      if (a4 != 2 && IsVoiceOverRunning)
      {
        -[CACDisplayManager voiceOverAnnouncer](self, "voiceOverAnnouncer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "prepareForImmediateAnnouncement");

        -[CACDisplayManager voiceOverAnnouncer](self, "voiceOverAnnouncer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "announceMessage:type:completion:", v8, a4, v9);

      }
    }
    if (v9)
      v9[2](v9);
  }

}

- (void)displayReadyToUseWithLanguageMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("AssetDownload.InstallFinished"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDBCEA0];
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestLocaleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeWithLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bestLocaleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForLocaleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("AssetDownload.InstallFinishedMultipleLanguagesFormat"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@%@"), 0, v13, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayMessageString:type:", v11, 3);

}

- (id)_sceneForModalAlerts
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v15;
  CACDisplayManager *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (-[CACDisplayManager carPlayConnected](self, "carPlayConnected"))
  {
    -[CACDisplayManager _carScreenSceneManager](self, "_carScreenSceneManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = self;
    v4 = self->_sceneManagers;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "scene");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "screen");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if ((v13 & 1) != 0)
          {
            v15 = v9;

            return v15;
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          continue;
        break;
      }
    }

    -[NSMutableArray firstObject](v16->_sceneManagers, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_trackModalAlert:(id)a3
{
  NSMutableSet *modalAlerts;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_modalAlertsLock);
  modalAlerts = self->_modalAlerts;
  if (!modalAlerts)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_modalAlerts;
    self->_modalAlerts = v5;

    modalAlerts = self->_modalAlerts;
  }
  -[NSMutableSet addObject:](modalAlerts, "addObject:", v7);
  os_unfair_lock_unlock(&self->_modalAlertsLock);

}

- (void)_untrackModalAlert:(id)a3
{
  os_unfair_lock_s *p_modalAlertsLock;
  id v5;

  p_modalAlertsLock = &self->_modalAlertsLock;
  v5 = a3;
  os_unfair_lock_lock(p_modalAlertsLock);
  -[NSMutableSet removeObject:](self->_modalAlerts, "removeObject:", v5);

  os_unfair_lock_unlock(p_modalAlertsLock);
}

- (BOOL)_hasModalAlert
{
  CACDisplayManager *v2;
  os_unfair_lock_s *p_modalAlertsLock;

  v2 = self;
  p_modalAlertsLock = &self->_modalAlertsLock;
  os_unfair_lock_lock(&self->_modalAlertsLock);
  LOBYTE(v2) = -[NSMutableSet count](v2->_modalAlerts, "count") != 0;
  os_unfair_lock_unlock(p_modalAlertsLock);
  return (char)v2;
}

- (BOOL)_hasModalAlertWithTitle:(id)a3
{
  id v4;
  os_unfair_lock_s *p_modalAlertsLock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_modalAlertsLock = &self->_modalAlertsLock;
  os_unfair_lock_lock(&self->_modalAlertsLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableSet allObjects](self->_modalAlerts, "allObjects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_modalAlertsLock);
  return v7;
}

- (void)presentModalAlertWithTitle:(id)a3 description:(id)a4 okButtonText:(id)a5 cancelButtonText:(id)a6 object:(id)a7 okButtonHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  CACDisplayManager *v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __113__CACDisplayManager_presentModalAlertWithTitle_description_okButtonText_cancelButtonText_object_okButtonHandler___block_invoke;
  block[3] = &unk_24F2ACBF8;
  v27 = v14;
  v28 = v15;
  v29 = self;
  v30 = v17;
  v32 = v18;
  v33 = v19;
  v31 = v16;
  v20 = v18;
  v21 = v19;
  v22 = v16;
  v23 = v17;
  v24 = v15;
  v25 = v14;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __113__CACDisplayManager_presentModalAlertWithTitle_description_okButtonText_cancelButtonText_object_okButtonHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_trackModalAlert:", v2);
  v3 = (void *)MEMORY[0x24BEBD3A8];
  v4 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __113__CACDisplayManager_presentModalAlertWithTitle_description_okButtonText_cancelButtonText_object_okButtonHandler___block_invoke_2;
  v24[3] = &unk_24F2AA8B0;
  v5 = *(_QWORD *)(a1 + 56);
  v24[4] = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v25 = v6;
  objc_msgSend(v3, "actionWithTitle:style:handler:", v5, 1, v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v7);
  if (objc_msgSend(*(id *)(a1 + 64), "length"))
  {
    v8 = (void *)MEMORY[0x24BEBD3A8];
    v9 = *(_QWORD *)(a1 + 64);
    v16 = v4;
    v17 = 3221225472;
    v18 = __113__CACDisplayManager_presentModalAlertWithTitle_description_okButtonText_cancelButtonText_object_okButtonHandler___block_invoke_3;
    v19 = &unk_24F2ACBD0;
    v23 = *(id *)(a1 + 80);
    v10 = *(id *)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 48);
    v20 = v10;
    v21 = v11;
    v12 = v6;
    v22 = v12;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 2, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v13, v16, v17, v18, v19);

  }
  objc_msgSend(*(id *)(a1 + 48), "_sceneForModalAlerts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "windowContainerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __113__CACDisplayManager_presentModalAlertWithTitle_description_okButtonText_cancelButtonText_object_okButtonHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_untrackModalAlert:", *(_QWORD *)(a1 + 40));
}

uint64_t __113__CACDisplayManager_presentModalAlertWithTitle_description_okButtonText_cancelButtonText_object_okButtonHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_untrackModalAlert:", *(_QWORD *)(a1 + 48));
}

- (void)presentModalAlertWithTitle:(id)a3 description:(id)a4 button1Text:(id)a5 button1Style:(int64_t)a6 button2Text:(id)a7 button2Style:(int64_t)a8 object:(id)a9 button1Handler:(id)a10 button2Handler:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD block[4];
  id v32;
  id v33;
  CACDisplayManager *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  int64_t v40;
  int64_t v41;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __147__CACDisplayManager_presentModalAlertWithTitle_description_button1Text_button1Style_button2Text_button2Style_object_button1Handler_button2Handler___block_invoke;
  block[3] = &unk_24F2ACC20;
  v32 = v16;
  v33 = v17;
  v34 = self;
  v35 = v18;
  v36 = v20;
  v37 = v19;
  v40 = a6;
  v41 = a8;
  v38 = v21;
  v39 = v22;
  v23 = v22;
  v24 = v19;
  v25 = v20;
  v26 = v21;
  v27 = v18;
  v28 = v17;
  v29 = v16;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __147__CACDisplayManager_presentModalAlertWithTitle_description_button1Text_button1Style_button2Text_button2Style_object_button1Handler_button2Handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  id v32;

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_trackModalAlert:", v2);
  v3 = (void *)MEMORY[0x24BEBD3A8];
  v4 = *(_QWORD *)(a1 + 56);
  v5 = MEMORY[0x24BDAC760];
  v6 = *(_QWORD *)(a1 + 96);
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __147__CACDisplayManager_presentModalAlertWithTitle_description_button1Text_button1Style_button2Text_button2Style_object_button1Handler_button2Handler___block_invoke_2;
  v28[3] = &unk_24F2ACBD0;
  v32 = *(id *)(a1 + 80);
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 48);
  v29 = v7;
  v30 = v8;
  v9 = v2;
  v31 = v9;
  objc_msgSend(v3, "actionWithTitle:style:handler:", v4, v6, v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v10);
  if (objc_msgSend(*(id *)(a1 + 72), "length"))
  {
    v11 = (void *)MEMORY[0x24BEBD3A8];
    v12 = *(_QWORD *)(a1 + 72);
    v13 = *(_QWORD *)(a1 + 104);
    v20 = v5;
    v21 = 3221225472;
    v22 = __147__CACDisplayManager_presentModalAlertWithTitle_description_button1Text_button1Style_button2Text_button2Style_object_button1Handler_button2Handler___block_invoke_3;
    v23 = &unk_24F2ACBD0;
    v27 = *(id *)(a1 + 88);
    v14 = *(id *)(a1 + 64);
    v15 = *(_QWORD *)(a1 + 48);
    v24 = v14;
    v25 = v15;
    v16 = v9;
    v26 = v16;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, v13, &v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:", v17, v20, v21, v22, v23);

  }
  objc_msgSend(*(id *)(a1 + 48), "_sceneForModalAlerts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "windowContainerViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentViewController:animated:completion:", v9, 1, 0);

}

uint64_t __147__CACDisplayManager_presentModalAlertWithTitle_description_button1Text_button1Style_button2Text_button2Style_object_button1Handler_button2Handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_untrackModalAlert:", *(_QWORD *)(a1 + 48));
}

uint64_t __147__CACDisplayManager_presentModalAlertWithTitle_description_button1Text_button1Style_button2Text_button2Style_object_button1Handler_button2Handler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_untrackModalAlert:", *(_QWORD *)(a1 + 48));
}

- (void)startShowingTransientOverlayForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  v4 = a3;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientOverlayType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && v6 || (objc_msgSend(v6, "isEqualToString:", v4) & 1) == 0)
    -[CACDisplayManager hideAnyOverlay](self, "hideAnyOverlay");
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTransientOverlayType:", v4);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__CACDisplayManager_startShowingTransientOverlayForType___block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __57__CACDisplayManager_startShowingTransientOverlayForType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePresentationForActiveOverlay");
}

- (id)overlayViewForDisplayID:(unsigned int)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_sceneManagers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(NSMutableArray **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      if (-[NSMutableArray displayID](v10, "displayID", (_QWORD)v14) == a3)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
  }
  -[NSMutableArray overlayContainerViewController](v10, "overlayContainerViewController", (_QWORD)v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)verifyElementExists:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  char v14;

  v3 = a3;
  objc_msgSend(v3, "centerPoint");
  v5 = v4;
  v7 = v6;
  v8 = objc_msgSend(v3, "windowContextId");
  if ((_DWORD)v8)
  {
    v9 = v8;
    objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertPoint:fromContextId:", v9, v5, v7);
    v5 = v11;
    v7 = v12;

  }
  objc_msgSend(MEMORY[0x24BDFEA68], "elementAtCoordinate:withVisualPadding:", 0, v5, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", v3);

  return v14;
}

- (id)_uiPresentingSceneManagers
{
  void *v3;
  void *v4;

  -[NSMutableArray indexesOfObjectsPassingTest:](self->_sceneManagers, "indexesOfObjectsPassingTest:", &__block_literal_global_550);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectsAtIndexes:](self->_sceneManagers, "objectsAtIndexes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __47__CACDisplayManager__uiPresentingSceneManagers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCarPlayScene") ^ 1;
}

- (void)updatePresentationForActiveOverlay
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t ii;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t jj;
  void *v73;
  int v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t mm;
  void *v91;
  int v92;
  int v93;
  void *v94;
  _BOOL4 v95;
  double Height;
  double v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  BOOL v110;
  BOOL v111;
  void *v112;
  _BOOL4 v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  void *v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t nn;
  void *v145;
  void *v146;
  _BOOL4 v147;
  void *v148;
  int v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  BOOL v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t j;
  void *v159;
  int v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t i1;
  void *v170;
  id v171;
  void *v172;
  void *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t i;
  void *v177;
  int v178;
  void *v179;
  void *v180;
  void *v181;
  uint64_t v182;
  void (**v183)(void);
  void (**v184)(void);
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t kk;
  id obj;
  id obja;
  void *v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  _QWORD v208[5];
  id v209;
  uint64_t *v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  _QWORD v231[4];
  _QWORD v232[4];
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  _QWORD v245[6];
  BOOL v246;
  BOOL v247;
  _QWORD v248[6];
  uint64_t v249;
  uint64_t *v250;
  uint64_t v251;
  uint64_t v252;
  _BYTE v253[128];
  _BYTE v254[128];
  _BYTE v255[128];
  _BYTE v256[128];
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  _BYTE v261[128];
  _BYTE v262[128];
  _BYTE v263[128];
  _BYTE v264[128];
  uint64_t v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;

  v265 = *MEMORY[0x24BDAC8D0];
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedElement");
  v191 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v191, "selectedTextRange");
  v6 = v5;
  v7 = v5 != 0;
  v249 = 0;
  v250 = &v249;
  v251 = 0x2020000000;
  v252 = 0;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "disambiguationHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labeledElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v248[0] = MEMORY[0x24BDAC760];
  v248[1] = 3221225472;
  v248[2] = __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke;
  v248[3] = &unk_24F2ACCB0;
  v248[4] = self;
  v248[5] = &v249;
  v184 = (void (**)(void))MEMORY[0x22E2D5D40](v248);
  v245[0] = MEMORY[0x24BDAC760];
  v245[1] = 3221225472;
  v245[2] = __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke_3;
  v245[3] = &unk_24F2ACCD8;
  v246 = v7;
  v247 = v11 != 0;
  v245[4] = self;
  v245[5] = &v249;
  v183 = (void (**)(void))MEMORY[0x22E2D5D40](v245);
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "isActiveOverlayType:", CFSTR("NumberedElements"));

  if ((_DWORD)v9)
  {
    if (!v6
      || ((v13 = -[CACDisplayManager isDisplayingCorrections](self, "isDisplayingCorrections"), v11)
        ? (v14 = 1)
        : (v14 = v13),
          (v14 & 1) != 0))
    {
      v183[2]();
      v184[2]();
      goto LABEL_8;
    }
    v183[2]();
    v184[2]();
    if (_os_feature_enabled_impl())
    {
      if (-[CACDisplayManager shouldShowTextEditingOverlayInTutorial](self, "shouldShowTextEditingOverlayInTutorial"))
      {
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v148, "doesFocusedElementRequireSecureInput") & 1) == 0
          && self->_programmaticallySelectedRange.location == v4
          && self->_programmaticallySelectedRange.length == v6)
        {
          v149 = -[AXElement isEqual:](self->_programmaticallySelectedElement, "isEqual:", v191);

          if (!v149)
            goto LABEL_8;
          objc_msgSend(v191, "value");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "substringWithRange:", v4, v6);
          v148 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "stringByTrimmingCharactersInSet:", v151);
          obja = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obja, "rangeOfCharacterFromSet:", v152);
          v154 = v153 == 0;

          if (v154)
          {
            v239 = 0uLL;
            v240 = 0uLL;
            v237 = 0uLL;
            v238 = 0uLL;
            -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v174 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v237, v263, 16);
            if (v174)
            {
              v175 = *(_QWORD *)v238;
              do
              {
                for (i = 0; i != v174; ++i)
                {
                  if (*(_QWORD *)v238 != v175)
                    objc_enumerationMutation(v155);
                  v177 = *(void **)(*((_QWORD *)&v237 + 1) + 8 * i);
                  v178 = objc_msgSend(v177, "displayID");
                  if (v178 == objc_msgSend(v191, "windowDisplayId"))
                  {
                    objc_msgSend(v177, "editingModeOverlayManager");
                    v179 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v179, "showCharactersForElement:targetRange:startIndex:", v191, v4, v6, v250[3] + 1);

                    objc_msgSend(v177, "editingModeOverlayManager");
                    v180 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v180, "overlayElements");
                    v181 = (void *)objc_claimAutoreleasedReturnValue();
                    v182 = objc_msgSend(v181, "count");
                    v250[3] += v182;

                  }
                }
                v174 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v237, v263, 16);
              }
              while (v174);
            }
          }
          else
          {
            v243 = 0uLL;
            v244 = 0uLL;
            v241 = 0uLL;
            v242 = 0uLL;
            -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v241, v264, 16);
            if (v156)
            {
              v157 = *(_QWORD *)v242;
              do
              {
                for (j = 0; j != v156; ++j)
                {
                  if (*(_QWORD *)v242 != v157)
                    objc_enumerationMutation(v155);
                  v159 = *(void **)(*((_QWORD *)&v241 + 1) + 8 * j);
                  v160 = objc_msgSend(v159, "displayID");
                  if (v160 == objc_msgSend(v191, "windowDisplayId"))
                  {
                    objc_msgSend(v159, "editingModeOverlayManager");
                    v161 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v161, "showWordsForElement:targetRange:startIndex:", v191, v4, v6, v250[3] + 1);

                    objc_msgSend(v159, "editingModeOverlayManager");
                    v162 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v162, "overlayElements");
                    v163 = (void *)objc_claimAutoreleasedReturnValue();
                    v164 = objc_msgSend(v163, "count");
                    v250[3] += v164;

                  }
                }
                v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v241, v264, 16);
              }
              while (v156);
            }
          }

        }
      }
    }
  }
LABEL_8:
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isActiveOverlayType:", CFSTR("NumberedWords"));

  if (v16)
  {
    if (_os_feature_enabled_impl())
      v183[2]();
    v184[2]();
    v235 = 0u;
    v236 = 0u;
    v233 = 0u;
    v234 = 0u;
    -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v233, v262, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v234;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v234 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v233 + 1) + 8 * v20);
          v22 = objc_msgSend(v21, "displayID");
          if (v22 == objc_msgSend(v191, "windowDisplayId"))
          {
            objc_msgSend(v191, "value");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v191, "selectedTextRange");
            v26 = v25;
            v232[0] = 0;
            v232[1] = v232;
            v232[2] = 0x2020000000;
            v232[3] = 0;
            v231[0] = 0;
            v231[1] = v231;
            v231[2] = 0x2020000000;
            v231[3] = 0;
            if (v25 || !self->_targetOverlayRange.length || self->_targetOverlayRange.location == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v21, "editingModeOverlayManager");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "showWordsForElement:targetRange:startIndex:", v191, v24, v26, v250[3]);
            }
            else
            {
              objc_msgSend(v21, "editingModeOverlayManager");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "showWordsForElement:targetRange:startIndex:", v191, self->_targetOverlayRange.location, self->_targetOverlayRange.length, v250[3]);
            }

            _Block_object_dispose(v231, 8);
            _Block_object_dispose(v232, 8);

          }
          ++v20;
        }
        while (v18 != v20);
        v28 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v233, v262, 16);
        v18 = v28;
      }
      while (v28);
    }

    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isActiveOverlayType:", CFSTR("NumberedLines"));

    if (v30)
    {
      v229 = 0u;
      v230 = 0u;
      v227 = 0u;
      v228 = 0u;
      -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v227, v261, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v228;
        do
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v228 != v33)
              objc_enumerationMutation(v31);
            v35 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * k);
            v36 = objc_msgSend(v35, "displayID");
            if (v36 == objc_msgSend(v191, "windowDisplayId"))
            {
              objc_msgSend(v35, "linesEditingModeOverlayManager");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "showLinesForElement:targetRange:startIndex:", v191, 0x7FFFFFFFFFFFFFFFLL, 0, v250[3]);

              objc_msgSend(v35, "editingModeOverlayManager");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "hide");

            }
          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v227, v261, 16);
        }
        while (v32);
      }

    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isActiveOverlayType:", CFSTR("NumberedParagraphs"));

    if (v40)
    {
      v225 = 0u;
      v226 = 0u;
      v223 = 0u;
      v224 = 0u;
      -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v223, v260, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v224;
        do
        {
          for (m = 0; m != v42; ++m)
          {
            if (*(_QWORD *)v224 != v43)
              objc_enumerationMutation(v41);
            v45 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * m);
            v46 = objc_msgSend(v45, "displayID");
            if (v46 == objc_msgSend(v191, "windowDisplayId"))
            {
              objc_msgSend(v45, "linesEditingModeOverlayManager");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "showParagraphsForElement:targetRange:startIndex:", v191, 0x7FFFFFFFFFFFFFFFLL, 0, v250[3]);

            }
          }
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v223, v260, 16);
        }
        while (v42);
      }

    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "isActiveOverlayType:", CFSTR("NumberedSentences"));

    if (v49)
    {
      v221 = 0u;
      v222 = 0u;
      v219 = 0u;
      v220 = 0u;
      -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v219, v259, 16);
      if (v51)
      {
        v52 = *(_QWORD *)v220;
        do
        {
          for (n = 0; n != v51; ++n)
          {
            if (*(_QWORD *)v220 != v52)
              objc_enumerationMutation(v50);
            v54 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * n);
            v55 = objc_msgSend(v54, "displayID");
            if (v55 == objc_msgSend(v191, "windowDisplayId"))
            {
              objc_msgSend(v54, "linesEditingModeOverlayManager");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "showSentencesForElement:targetRange:startIndex:", v191, 0x7FFFFFFFFFFFFFFFLL, 0, v250[3]);

            }
          }
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v219, v259, 16);
        }
        while (v51);
      }

    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "isActiveOverlayType:", CFSTR("NumberedLines"));

    if (v58)
    {
      v217 = 0u;
      v218 = 0u;
      v215 = 0u;
      v216 = 0u;
      -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v215, v258, 16);
      if (v60)
      {
        v61 = *(_QWORD *)v216;
        do
        {
          for (ii = 0; ii != v60; ++ii)
          {
            if (*(_QWORD *)v216 != v61)
              objc_enumerationMutation(v59);
            v63 = *(void **)(*((_QWORD *)&v215 + 1) + 8 * ii);
            v64 = objc_msgSend(v63, "displayID");
            if (v64 == objc_msgSend(v191, "windowDisplayId"))
            {
              objc_msgSend(v63, "linesEditingModeOverlayManager");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "showLinesForElement:targetRange:startIndex:", v191, 0x7FFFFFFFFFFFFFFFLL, 0, v250[3]);

              objc_msgSend(v63, "editingModeOverlayManager");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "hide");

            }
          }
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v215, v258, 16);
        }
        while (v60);
      }

    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "isActiveOverlayType:", CFSTR("NumberedCharacters"));

    if (v68)
    {
      v184[2]();
      v213 = 0u;
      v214 = 0u;
      v211 = 0u;
      v212 = 0u;
      -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v211, v257, 16);
      obj = v69;
      if (v70)
      {
        v71 = *(_QWORD *)v212;
        do
        {
          for (jj = 0; jj != v70; ++jj)
          {
            if (*(_QWORD *)v212 != v71)
              objc_enumerationMutation(obj);
            v73 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * jj);
            v74 = objc_msgSend(v73, "displayID");
            if (v74 == objc_msgSend(v191, "windowDisplayId"))
            {
              objc_msgSend(v191, "value");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = objc_msgSend(v191, "selectedTextRange");
              v78 = v77;
              if (v77)
              {
                objc_msgSend(v73, "editingModeOverlayManager");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "showCharactersForElement:targetRange:startIndex:", v191, v76, v78, v250[3]);

              }
              else
              {
                v80 = objc_msgSend(v75, "length") - v76;
                v208[0] = MEMORY[0x24BDAC760];
                v208[1] = 3221225472;
                v208[2] = __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke_6;
                v208[3] = &unk_24F2AB4E8;
                v208[4] = v73;
                v209 = v191;
                v210 = &v249;
                objc_msgSend(v75, "enumerateSubstringsInRange:options:usingBlock:", v76, v80, 3, v208);

              }
            }
          }
          v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v211, v257, 16);
        }
        while (v70);
      }
LABEL_155:

    }
  }
  else
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "isActiveOverlayType:", CFSTR("NamedElements"));

    if (v82)
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "labeledScreenElementsCollection");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "collectedElements");
      obj = (id)objc_claimAutoreleasedReturnValue();

      v206 = 0u;
      v207 = 0u;
      v204 = 0u;
      v205 = 0u;
      -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
      v185 = (id)objc_claimAutoreleasedReturnValue();
      v187 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v204, v256, 16);
      if (v187)
      {
        v186 = *(_QWORD *)v205;
        do
        {
          for (kk = 0; kk != v187; ++kk)
          {
            if (*(_QWORD *)v205 != v186)
              objc_enumerationMutation(v185);
            v85 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * kk);
            v86 = (void *)objc_opt_new();
            v202 = 0u;
            v203 = 0u;
            v200 = 0u;
            v201 = 0u;
            v87 = obj;
            v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v200, v255, 16);
            if (v88)
            {
              v89 = *(_QWORD *)v201;
              do
              {
                for (mm = 0; mm != v88; ++mm)
                {
                  if (*(_QWORD *)v201 != v89)
                    objc_enumerationMutation(v87);
                  v91 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * mm);
                  v92 = objc_msgSend(v85, "displayID");
                  if (v92 == objc_msgSend(v91, "displayID"))
                  {
                    v93 = objc_msgSend(v91, "displayID");
                    -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    v95 = v93 == objc_msgSend(v94, "displayID");

                    if (!v95)
                      goto LABEL_102;
                    objc_msgSend(v85, "systemAperatureRect");
                    Height = CGRectGetHeight(v266);
                    objc_msgSend(v85, "minimumSystemAperatureRect");
                    v97 = CGRectGetHeight(v267);
                    objc_msgSend(v85, "systemAperatureRect");
                    v99 = v98;
                    v101 = v100;
                    v103 = v102;
                    v105 = v104;
                    objc_msgSend(v91, "rectangle");
                    v270.origin.x = v106;
                    v270.origin.y = v107;
                    v270.size.width = v108;
                    v270.size.height = v109;
                    v268.origin.x = v99;
                    v268.origin.y = v101;
                    v268.size.width = v103;
                    v268.size.height = v105;
                    v110 = CGRectIntersectsRect(v268, v270);
                    v111 = Height > v97 + 10.0 && v110;
                    if (!v111
                      || (objc_msgSend(v91, "element"),
                          v112 = (void *)objc_claimAutoreleasedReturnValue(),
                          v113 = -[CACDisplayManager verifyElementExists:](self, "verifyElementExists:", v112),
                          v112,
                          v113))
                    {
LABEL_102:
                      objc_msgSend(v86, "addObject:", v91);
                    }
                  }
                }
                v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v200, v255, 16);
              }
              while (v88);
            }

            objc_msgSend(v85, "systemAperatureRect");
            if (CGRectIsEmpty(v269))
            {
              v114 = v86;
            }
            else
            {
              +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "_mainScreenSceneManager");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "overlayWindow");
              v117 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v85, "systemAperatureRect");
              v122 = CACViewRectFromPortraitUpRect(v117, v118, v119, v120, v121);
              v124 = v123;
              v126 = v125;
              v128 = v127;
              objc_msgSend(v85, "minimumSystemAperatureRect");
              v133 = CACViewRectFromPortraitUpRect(v117, v129, v130, v131, v132);
              +[CACSystemAperatureBorderItem borderItemsForRect:minimumRect:](CACSystemAperatureBorderItem, "borderItemsForRect:minimumRect:", v122, v124, v126, v128, v133, v134, v135, v136);
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = (void *)objc_msgSend(v137, "mutableCopy");

              objc_msgSend(v114, "addObjectsFromArray:", v86);
            }
            objc_msgSend(v85, "elementNamesOverlayManager");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "showNamesForElements:", v114);

          }
          v187 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v204, v256, 16);
        }
        while (v187);
      }

      v183[2]();
      goto LABEL_155;
    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = objc_msgSend(v139, "isActiveOverlayType:", CFSTR("NumberedGrid"));

    if (v140)
    {
      v198 = 0u;
      v199 = 0u;
      v196 = 0u;
      v197 = 0u;
      -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v196, v254, 16);
      if (v142)
      {
        v143 = *(_QWORD *)v197;
        while (2)
        {
          for (nn = 0; nn != v142; ++nn)
          {
            if (*(_QWORD *)v197 != v143)
              objc_enumerationMutation(v141);
            v145 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * nn);
            objc_msgSend(v145, "labeledGridOverlayManager");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = objc_msgSend(v146, "currentLevel") > 1;

            if (v147)
            {
              objc_msgSend(v145, "labeledGridOverlayManager");
              obj = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_139;
            }
          }
          v142 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v196, v254, 16);
          if (v142)
            continue;
          break;
        }
      }
      obj = 0;
LABEL_139:

      v194 = 0u;
      v195 = 0u;
      v192 = 0u;
      v193 = 0u;
      -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v192, v253, 16);
      if (v166)
      {
        v167 = 0;
        v168 = *(_QWORD *)v193;
        do
        {
          for (i1 = 0; i1 != v166; ++i1)
          {
            if (*(_QWORD *)v193 != v168)
              objc_enumerationMutation(v165);
            v170 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * i1);
            objc_msgSend(v170, "labeledGridOverlayManager");
            v171 = (id)objc_claimAutoreleasedReturnValue();
            v172 = v171;
            if (!obj || v171 == obj)
            {
              if ((objc_msgSend(v171, "isShowing") & 1) != 0)
              {
                if (objc_msgSend(v172, "needsToBeRedrawn"))
                  objc_msgSend(v172, "resetAndDrawAtTopLevelWithStartingNumber:", v167 + 1);
              }
              else
              {
                objc_msgSend(v172, "showOverlayWithStartingNumber:", v167 + 1);
              }
              v167 += objc_msgSend(v170, "numberOfLabelsForGridManager");
            }
            else
            {
              objc_msgSend(v171, "hide");
            }

          }
          v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v192, v253, 16);
        }
        while (v166);
      }

      goto LABEL_155;
    }
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "postNotificationName:object:", CFSTR("SOLabeledElementsOverlayDidUpdateElementsNotification"), 0);

  -[CACDisplayManager showOverlayForDictiationRecognizerMode](self, "showOverlayForDictiationRecognizerMode");
  _Block_object_dispose(&v249, 8);

}

void __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  int v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[5];
  id v26;
  uint64_t v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disambiguationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  v19 = v2;
  if (v3)
  {
    objc_msgSend(v3, "labeledElements");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "labeledScreenElementsCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectedElements");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_uiPresentingSceneManagers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v7 = a1;
        v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v8 = (void *)objc_opt_new();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v9 = v22;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v30 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
              v15 = objc_msgSend(v6, "displayID");
              if (v15 == objc_msgSend(v14, "displayID"))
                objc_msgSend(v8, "addObject:", v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v11);
        }

        a1 = v7;
        v16 = objc_msgSend(*(id *)(v7 + 32), "isDisplayingCorrections");
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke_2;
        block[3] = &unk_24F2ACC88;
        block[4] = v6;
        v26 = v8;
        v28 = v16;
        v27 = v24;
        v17 = v8;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 24) += objc_msgSend(v17, "count");

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v23);
  }

}

void __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "labeledElementsOverlayManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showLabeledElementsOverlayWithLabeledElements:forceNoArrow:startingNumberedLabelsAtIndex:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48) + 1);

}

void __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isDisplayingCorrections") & 1) == 0
      && !*(_BYTE *)(a1 + 48)
      && !*(_BYTE *)(a1 + 49))
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "doesFocusedElementRequireSecureInput");

      if ((v3 & 1) == 0)
      {
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "focusedElement");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "_uiPresentingSceneManagers", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v18;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v18 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
              v12 = objc_msgSend(v11, "displayID");
              if (v12 == objc_msgSend(v5, "windowDisplayId"))
              {
                objc_msgSend(v11, "linesEditingModeOverlayManager");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "showLinesForElement:targetRange:startIndex:", v5, 0x7FFFFFFFFFFFFFFFLL, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 1);

                objc_msgSend(v11, "editingModeOverlayManager");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "hideWithoutAnimation");

                objc_msgSend(v11, "linesEditingModeOverlayManager");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "overlayElements");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v16, "count");

              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v8);
        }

      }
    }
  }
}

void __55__CACDisplayManager_updatePresentationForActiveOverlay__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "editingModeOverlayManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "showCharactersForElement:targetRange:startIndex:", *(_QWORD *)(a1 + 40), a3, a4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

  *a7 = 1;
}

- (BOOL)shouldExpandToLines
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v6, "linesEditingModeOverlayManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "overlayElements");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(v6, "linesEditingModeOverlayManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "overlayType") == 2)
          {

LABEL_15:
            LOBYTE(v3) = 1;
            goto LABEL_16;
          }
          objc_msgSend(v6, "linesEditingModeOverlayManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "overlayType");

          if (v11 == 3)
            goto LABEL_15;
        }
        else
        {

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_16:

  return v3;
}

- (BOOL)shouldExpandToWords
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v6, "linesEditingModeOverlayManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "overlayElements");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(v6, "linesEditingModeOverlayManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "overlayType");

          if (v10 == 1)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }
LABEL_12:

  return v3;
}

- (BOOL)shouldExpandToCharacters
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v6, "editingModeOverlayManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "overlayElements");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(v6, "linesEditingModeOverlayManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "overlayType");

          if (!v10)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }
LABEL_12:

  return v3;
}

- (id)gridNumberForRect:(CGRect)a3 displayID:(unsigned int)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  __CFString *v51;
  void *v52;
  __CFString *v53;
  CGFloat aRect;
  CGFloat v56;
  CGFloat v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[2];
  _QWORD v68[2];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;
  NSPoint v72;
  NSPoint v73;
  NSRect v74;
  NSRect v75;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v71 = *MEMORY[0x24BDAC8D0];
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reorientedRect:", x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v19)
  {
    v20 = v19;
    v56 = v14;
    v57 = v12;
    v21 = v14 + v18 * 0.5;
    aRect = v16;
    v22 = v12 + v16 * 0.5;
    v23 = *(_QWORD *)v64;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v64 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        if (objc_msgSend(v25, "displayID", *(_QWORD *)&aRect, *(_QWORD *)&v56, *(_QWORD *)&v57) == a4)
        {
          objc_msgSend(v25, "labeledGridOverlayManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "labeledElements");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "count");

          if (!v28)
          {
            v29 = 3.0;
            do
            {
              usleep(0x186A0u);
              objc_msgSend(v26, "labeledElements");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "count");

              if (v31)
                break;
              v29 = v29 + -0.1;
            }
            while (v29 > 0.0);
          }
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          objc_msgSend(v26, "labeledElements");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v60;
LABEL_13:
            v36 = 0;
            while (1)
            {
              if (*(_QWORD *)v60 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v36);
              objc_msgSend(v37, "rectangle");
              v39 = v38;
              v41 = v40;
              v43 = v42;
              v45 = v44;
              v72.x = v22;
              v72.y = v21;
              v74.origin.x = v39;
              v74.origin.y = v41;
              v74.size.width = v43;
              v74.size.height = v45;
              if (NSPointInRect(v72, v74))
                break;
              if (v34 == ++v36)
              {
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
                if (v34)
                  goto LABEL_13;
                goto LABEL_21;
              }
            }
            objc_msgSend(v37, "label");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "integerValue");

            if (v47 < 1)
              goto LABEL_21;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v47);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v73.x = v39 + v43 * 0.5;
            v73.y = v41 + v45 * 0.5;
            v75.origin.y = v56;
            v75.origin.x = v57;
            v75.size.width = aRect;
            v75.size.height = v18;
            v50 = NSPointInRect(v73, v75);
            v51 = CFSTR("NO");
            if (v50)
              v51 = CFSTR("YES");
            v67[0] = CFSTR("number");
            v67[1] = CFSTR("isFinal");
            v68[0] = v49;
            v68[1] = v51;
            v52 = (void *)MEMORY[0x24BDBCE70];
            v53 = v51;
            objc_msgSend(v52, "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_28;
          }
LABEL_21:

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      if (v20)
        continue;
      break;
    }
  }
  v48 = &unk_24F2CF6E8;
LABEL_28:

  return v48;
}

- (CGRect)reorientedRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;

  v13 = width * 0.5;
  v14 = height * 0.5;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "orientation");

  if (v16 == 3)
  {
    v17 = v12 - y - v13;
    y = x - v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "orientation");

    if (v19 == 4)
    {
      v17 = v12 - y - v13;
      v20 = v9 - x;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "orientation");

      if (v22 != 2)
      {
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "orientation");

        v17 = x;
        goto LABEL_9;
      }
      v17 = v9 - x - v13;
      v20 = v12 - y;
    }
    y = v20 - v14;
  }
LABEL_9:
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v17;
  return result;
}

- (void)speakVoiceOverDescriptionForActiveOverlayIfNeeded
{
  _QWORD block[5];

  if (UIAccessibilityIsVoiceOverRunning())
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__CACDisplayManager_speakVoiceOverDescriptionForActiveOverlayIfNeeded__block_invoke;
    block[3] = &unk_24F2AA860;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __70__CACDisplayManager_speakVoiceOverDescriptionForActiveOverlayIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActiveOverlayType:", CFSTR("NumberedElements"));

  if (v3)
  {
    +[CACVoiceOverShortDescriptionGenerator sharedInstance](CACVoiceOverShortDescriptionGenerator, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "labeledElementsOverlayManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "labeledElementsCopy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescriptionsForItems:style:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    goto LABEL_7;
  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isActiveOverlayType:", CFSTR("NamedElements"));

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "elementNamesOverlayManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceOverDescriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
        objc_msgSend(*(id *)(a1 + 32), "voiceOverAnnouncer", (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "announceMessage:type:completion:", v15, 0, 0);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

- (void)refreshOverlays
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  char v10;
  _QWORD v11[5];
  _QWORD block[5];

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showUIAsListening");

  if (v4)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "userIsTouching") & 1) == 0)
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isSynchronizingRecognizers"))
      {
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isFetchingElements");

        if ((v10 & 1) == 0)
        {
          v11[0] = MEMORY[0x24BDAC760];
          v11[1] = 3221225472;
          v11[2] = __36__CACDisplayManager_refreshOverlays__block_invoke_2;
          v11[3] = &unk_24F2AA860;
          v11[4] = self;
          v7 = MEMORY[0x24BDAC9B8];
          v8 = v11;
          goto LABEL_7;
        }
LABEL_6:
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __36__CACDisplayManager_refreshOverlays__block_invoke;
        block[3] = &unk_24F2AA860;
        block[4] = self;
        v7 = MEMORY[0x24BDAC9B8];
        v8 = block;
LABEL_7:
        dispatch_async(v7, v8);
        return;
      }

    }
    goto LABEL_6;
  }
  -[CACDisplayManager hideAnyOverlay](self, "hideAnyOverlay");
}

uint64_t __36__CACDisplayManager_refreshOverlays__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_refreshOverlays, 0);
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel_refreshOverlays, 0, 0.25);
}

uint64_t __36__CACDisplayManager_refreshOverlays__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePresentationForActiveOverlay");
}

- (void)hideAnyOverlay
{
  -[CACDisplayManager hideAnyOverlayAnimated:](self, "hideAnyOverlayAnimated:", 0);
}

- (void)hideAnyNonInteractiveOverlay
{
  -[CACDisplayManager hideAnyOverlayAnimated:includeInteractiveOverlays:](self, "hideAnyOverlayAnimated:includeInteractiveOverlays:", 0, 0);
}

- (void)hideAnyOverlayAnimated:(BOOL)a3
{
  -[CACDisplayManager hideAnyOverlayAnimated:includeInteractiveOverlays:](self, "hideAnyOverlayAnimated:includeInteractiveOverlays:", a3, 1);
}

- (void)hideAnyOverlayAnimated:(BOOL)a3 includeInteractiveOverlays:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v5 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[CACDisplayManager setGridDidDrill:](self, "setGridDidDrill:", 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "hideAnyOverlayAnimated:includeInteractiveOverlays:", v5, v4);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)hideObsoletePresentationsIfNeededForElements:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACDisplayManager correctionPresentationManager](self, "correctionPresentationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideIfNeededForElements:", v4);

}

- (void)hideAnyInProcessPresentation
{
  -[CACDisplayManager hideAnyPresentationAnimated:includingOutOfProcessPresentations:](self, "hideAnyPresentationAnimated:includingOutOfProcessPresentations:", 0, 0);
}

- (void)hideAnyPresentation
{
  -[CACDisplayManager hideAnyPresentationAnimated:](self, "hideAnyPresentationAnimated:", 0);
}

- (void)hideAnyPresentationAnimated:(BOOL)a3
{
  -[CACDisplayManager hideAnyPresentationAnimated:includingOutOfProcessPresentations:](self, "hideAnyPresentationAnimated:includingOutOfProcessPresentations:", a3, 1);
}

- (void)hideAnyPresentationAnimated:(BOOL)a3 includingOutOfProcessPresentations:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a4;
  v5 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "hideAnyPresentationAnimated:includingOutOfProcessPresentations:", v5, v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)hideDictationRecognizerModeOverlayNow
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "hideDictationRecognizerModeOverlayNow");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)isDisplayingAnyContentView
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isDisplayingAnyContentView") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDisplayingAnyPresentation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isDisplayingAnyPresentation") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDisplayingCorrections
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isDisplayingCorrections") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDisplayingAnyInteractiveContentInProcess
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "isDisplayingAnyInteractiveContentInProcess") & 1) != 0)
        {

          return 1;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }

  return -[CACDisplayManager _hasModalAlert](self, "_hasModalAlert");
}

- (BOOL)isDisplayingAnyOutOfProcessPresentation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isDisplayingAnyOutOfProcessPresentation") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDisplayingAnyOverlay
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isDisplayingAnyOverlay") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDisplayingConfirmationModalAlert
{
  void *v3;

  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ConfirmationAlertTitle.ExecuteThisCommand"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CACDisplayManager _hasModalAlertWithTitle:](self, "_hasModalAlertWithTitle:", v3);

  return (char)self;
}

- (void)didUpdateOrientation
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

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "redrawGridIfExists");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[CACDisplayManager refreshOverlays](self, "refreshOverlays");
}

- (void)enableStatusBarOverride:(BOOL)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  dispatch_semaphore_t dsema;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  BOOL v10;

  v5 = dispatch_semaphore_create(0);
  -[CACDisplayManager voiceControlStatusPublisher](self, "voiceControlStatusPublisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__CACDisplayManager_enableStatusBarOverride___block_invoke;
  v8[3] = &unk_24F2ACD00;
  v10 = a3;
  dsema = v5;
  v9 = dsema;
  objc_msgSend(v6, "updateDataWithBlock:", v8);

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (!a3)
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.25);

}

intptr_t __45__CACDisplayManager_enableStatusBarOverride___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setVoiceControlActive:", v3);
  objc_msgSend(v4, "setListeningState:", 0);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_startVoiceControlServer
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_229A40000, a2, OS_LOG_TYPE_ERROR, "Failed to start CACVoiceControlServer %@", (uint8_t *)&v2, 0xCu);
}

- (id)currentlyDisplayedCorrections:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[CACDisplayManager correctionPresentationManager](self, "correctionPresentationManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentlyDisplayedCorrections");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x24BDBD1A8];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = +[CACVoiceControlServer _currentDisplayedCorrectionsCommand](CACVoiceControlServer, "_currentDisplayedCorrectionsCommand");
  v13 = CFSTR("result");
  v14[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithKey:payload:", v9, v10);
  return v11;
}

- (id)currentlyDisplayedOverlayLabels:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  const __CFString *v54;
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v51;
    v8 = 0x24F2A9000uLL;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v51 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v9);
        objc_msgSend(*(id *)(v8 + 2344), "sharedCACSpokenCommandManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isActiveOverlayType:", CFSTR("NumberedElements"));

        if (v12)
        {
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          objc_msgSend(v10, "labeledElementsOverlayManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "labeledElementsCopy");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v47;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v47 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
                objc_msgSend(v19, "label");
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (v20)
                {
                  objc_msgSend(v19, "numberedLabel");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "addObject:", v21);

                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
            }
            while (v16);
            goto LABEL_16;
          }
          goto LABEL_19;
        }
        objc_msgSend(*(id *)(v8 + 2344), "sharedCACSpokenCommandManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isActiveOverlayType:", CFSTR("NamedElements"));

        if (v23)
        {
          objc_msgSend(v10, "elementNamesOverlayManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "voiceOverDescriptions");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v24);

          goto LABEL_19;
        }
        objc_msgSend(*(id *)(v8 + 2344), "sharedCACSpokenCommandManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isActiveOverlayType:", CFSTR("NumberedGrid"));

        if (v26)
        {
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          objc_msgSend(v10, "labeledGridOverlayManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "labeledElements");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v43;
            do
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v43 != v30)
                  objc_enumerationMutation(v14);
                v32 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
                objc_msgSend(v32, "label");
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                if (v33)
                {
                  objc_msgSend(v32, "label");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "addObject:", v34);

                }
              }
              v29 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
            }
            while (v29);
LABEL_16:
            v8 = 0x24F2A9000;
          }
LABEL_19:

        }
        ++v9;
      }
      while (v9 != v6);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      v6 = v35;
    }
    while (v35);
  }

  v36 = objc_alloc(MEMORY[0x24BE00648]);
  v37 = +[CACVoiceControlServer _currentlyDisplayedOverlayLabelsCommand](CACVoiceControlServer, "_currentlyDisplayedOverlayLabelsCommand");
  v54 = CFSTR("result");
  v55 = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v36, "initWithKey:payload:", v37, v38);

  return v39;
}

- (void)_updateForCurrentStatusIndicatorType
{
  int64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  v3 = -[CACDisplayManager statusIndicatorType](self, "statusIndicatorType");
  if (v3 == 3)
    v4 = 2;
  else
    v4 = v3 == 2;
  -[CACDisplayManager voiceControlStatusPublisher](self, "voiceControlStatusPublisher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__CACDisplayManager__updateForCurrentStatusIndicatorType__block_invoke;
  v6[3] = &__block_descriptor_40_e47_v16__0__STMutableVoiceControlStatusDomainData_8l;
  v6[4] = v4;
  objc_msgSend(v5, "updateDataWithBlock:", v6);

}

uint64_t __57__CACDisplayManager__updateForCurrentStatusIndicatorType__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setListeningState:", *(_QWORD *)(a1 + 32));
}

- (void)setStatusIndicatorType:(int64_t)a3
{
  if (self->_statusIndicatorType != a3)
  {
    self->_statusIndicatorType = a3;
    -[CACDisplayManager _updateForCurrentStatusIndicatorType](self, "_updateForCurrentStatusIndicatorType");
  }
}

- (id)_defaultScreenSceneManager
{
  if (-[CACDisplayManager carPlayConnected](self, "carPlayConnected"))
    -[CACDisplayManager _carScreenSceneManager](self, "_carScreenSceneManager");
  else
    -[NSMutableArray firstObject](self->_sceneManagers, "firstObject");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_carScreenSceneManager
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = self->_sceneManagers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    v6 = *MEMORY[0x24BEBEC10];
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "scene", (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "session");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "role");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v6);

        if ((v12 & 1) != 0)
        {
          v13 = v8;
          goto LABEL_11;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)_mainScreenSceneManager
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_sceneManagers;
  v3 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "scene", (_QWORD)v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "screen");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if ((v10 & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (CGPoint)defaultPortraitUpPointForGestures
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  -[CACDisplayManager _defaultScreenSceneManager](self, "_defaultScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labeledGridOverlayManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isShowing");

  if (v4)
  {
    objc_msgSend(v2, "labeledGridOverlayManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "portraitUpCenterPoint");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    objc_msgSend(v2, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    AX_CGRectGetCenter();
    v7 = v11;
    v9 = v12;

  }
  v13 = v7;
  v14 = v9;
  result.y = v14;
  result.x = v13;
  return result;
}

- (id)labeledElementsOverlayManager
{
  void *v2;
  void *v3;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labeledElementsOverlayManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)elementNamesOverlayManager
{
  void *v2;
  void *v3;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementNamesOverlayManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)gestureLivePreviewPresentationOverlayManager
{
  void *v2;
  void *v3;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gestureLivePreviewPresentationOverlayManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)elementActionsPresentationManager
{
  void *v2;
  void *v3;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementActionsPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)correctionPresentationManager
{
  void *v2;
  void *v3;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "correctionPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)customCommandEditorPresentationManager
{
  void *v2;
  void *v3;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customCommandEditorPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dictationRecognizerModeOverlayManager
{
  void *v2;
  void *v3;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictationRecognizerModeOverlayManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contactDisambiguationPresentationManager
{
  void *v2;
  void *v3;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactDisambiguationPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contextCluesPresentationManager
{
  void *v2;
  void *v3;

  -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextCluesPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CACVoiceOverAnnouncer)voiceOverAnnouncer
{
  CACVoiceOverAnnouncer *voiceOverAnnouncer;
  CACVoiceOverAnnouncer *v4;
  CACVoiceOverAnnouncer *v5;

  voiceOverAnnouncer = self->_voiceOverAnnouncer;
  if (!voiceOverAnnouncer)
  {
    v4 = objc_alloc_init(CACVoiceOverAnnouncer);
    v5 = self->_voiceOverAnnouncer;
    self->_voiceOverAnnouncer = v4;

    voiceOverAnnouncer = self->_voiceOverAnnouncer;
  }
  return voiceOverAnnouncer;
}

- (id)labeledElementsForItemNumbers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "labeledElementsOverlayManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "labeledElementsCopy");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)labeledTextSegmentElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  CACLabeledElement *v19;
  CACLabeledElement *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  CACLabeledElement *v32;
  CACLabeledElement *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusedElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (+[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager"), v6 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v6, "disambiguationHandler"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v6, !v7))
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v41)
    {
      v40 = *(_QWORD *)v53;
      v9 = MEMORY[0x24BDBD1A8];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v53 != v40)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v10);
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v42 = v11;
          v43 = v10;
          objc_msgSend(v11, "editingModeOverlayManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "overlayElements");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v49;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v49 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v17);
                v19 = [CACLabeledElement alloc];
                objc_msgSend(v18, "axFrame");
                v20 = -[CACLabeledElement initWithElement:recognitionStrings:rectangle:](v19, "initWithElement:recognitionStrings:rectangle:", v5, v9);
                v21 = objc_msgSend(v18, "range");
                +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", v21, v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[CACLabeledElement setTextMarkerRange:](v20, "setTextMarkerRange:", v23);

                objc_msgSend(v18, "label");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[CACLabeledElement setNumberedLabel:](v20, "setNumberedLabel:", v24);

                objc_msgSend(v3, "addObject:", v20);
                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            }
            while (v15);
          }

          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          objc_msgSend(v42, "linesEditingModeOverlayManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "overlayElements");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v45;
            do
            {
              v30 = 0;
              do
              {
                if (*(_QWORD *)v45 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v30);
                v32 = [CACLabeledElement alloc];
                objc_msgSend(v31, "axFrame");
                v33 = -[CACLabeledElement initWithElement:recognitionStrings:rectangle:](v32, "initWithElement:recognitionStrings:rectangle:", v5, v9);
                v34 = objc_msgSend(v31, "range");
                +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", v34, v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[CACLabeledElement setTextMarkerRange:](v33, "setTextMarkerRange:", v36);

                objc_msgSend(v31, "label");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[CACLabeledElement setNumberedLabel:](v33, "setNumberedLabel:", v37);

                objc_msgSend(v3, "addObject:", v33);
                ++v30;
              }
              while (v28 != v30);
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
            }
            while (v28);
          }

          v10 = v43 + 1;
        }
        while (v43 + 1 != v41);
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v41);
    }

    v8 = v3;
  }
  else
  {
    v8 = (id)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

- (id)labeledElementsForGrid
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "labeledGridOverlayManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "labeledElements");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)updateGridLayoutWithNumberOfRows:(unint64_t)a3 numberOfColumns:(unint64_t)a4 shouldPreferRows:(BOOL)a5
{
  _QWORD v5[7];
  BOOL v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__CACDisplayManager_updateGridLayoutWithNumberOfRows_numberOfColumns_shouldPreferRows___block_invoke;
  v5[3] = &unk_24F2ACAC0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  v6 = a5;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
}

void __87__CACDisplayManager_updateGridLayoutWithNumberOfRows_numberOfColumns_shouldPreferRows___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
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

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "updateGridLayoutWithNumberOfRows:numberOfColumns:shouldPreferRows:startingNumber:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), v5 + 1);
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)updateGridLayoutFromPreferences
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "updateGridLayoutFromPreferences");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (void)updatePreferencesFromCurrentGridLayoutForRows:(BOOL)a3 forColumns:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v5 = a3;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setGridOverlayCustomColumnsEnabled:", v4);
  if (v4)
  {
    -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "labeledGridOverlayManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGridOverlayCustomColumnsCount:", objc_msgSend(v8, "currentNumberOfColumns"));

  }
  objc_msgSend(v11, "setGridOverlayCustomRowsEnabled:", v5);
  if (v5)
  {
    -[CACDisplayManager _mainScreenSceneManager](self, "_mainScreenSceneManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "labeledGridOverlayManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGridOverlayCustomRowsCount:", objc_msgSend(v10, "currentNumberOfRows"));

  }
}

- (BOOL)updateGridWithPortraitUpRect:(CGRect)a3 gridContainingLabel:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  id obj;
  CACDisplayManager *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = self;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v27)
  {
    v25 = 0;
    v26 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v11, "labeledGridOverlayManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v12, "labeledElements");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "label");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqualToString:", v9);

              if ((v19 & 1) != 0)
              {
                objc_msgSend(v11, "labeledGridOverlayManager");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setStartingNumber:", 1);

                objc_msgSend(v11, "labeledGridOverlayManager");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v21, "updateOverlayWithPortraitUpRect:gridContainingLabel:", v9, x, y, width, height);

                -[CACDisplayManager setGridDidDrill:](v24, "setGridDidDrill:", -[CACDisplayManager gridDidDrill](v24, "gridDidDrill") ^ 1);
                goto LABEL_16;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v15)
              continue;
            break;
          }
        }

        objc_msgSend(v11, "labeledGridOverlayManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "hide");
LABEL_16:

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v27);
  }
  else
  {
    v25 = 0;
  }

  return v25 & 1;
}

- (void)resetGrid
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "labeledGridOverlayManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "resetAndDrawAtTopLevelWithStartingNumber:", v5 + 1);

        v5 += objc_msgSend(v8, "numberOfLabelsForGridManager");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)resetGridIdleTimer
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "labeledGridOverlayManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "resetIdleTimer");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)isGridAtTopLevel
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CACDisplayManager _uiPresentingSceneManagers](self, "_uiPresentingSceneManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "labeledGridOverlayManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "currentLevel");

        if (v8 > 1)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)showElementActionsForElement:(id)a3 usingPortraitUpRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  id v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  if (+[CACElementActionsPresentationManager canShowElementActionsForElement:](CACElementActionsPresentationManager, "canShowElementActionsForElement:"))
  {
    -[CACDisplayManager elementActionsPresentationManager](self, "elementActionsPresentationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showElementActionsForElement:usingPortraitUpRect:", v10, x, y, width, height);
  }
  else
  {
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.NoElementActionsAvailable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACDisplayManager displayMessageString:type:](self, "displayMessageString:type:", v9, 0);
  }

}

- (void)showContactDisambiguationItems:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CACDisplayManager contactDisambiguationPresentationManager](self, "contactDisambiguationPresentationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("DialMessage.DisambiguationTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showWithDisambiguationItems:alertTitle:", v4, v5);

}

- (void)hideContactDisambiguation
{
  id v2;

  -[CACDisplayManager contactDisambiguationPresentationManager](self, "contactDisambiguationPresentationManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideWithoutAnimation");

}

- (void)showOverlayForDictiationRecognizerMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_8:
    v10 = (void *)MEMORY[0x24BEDCDF0];
    -[CACDisplayManager dictationRecognizerModeOverlayManager](self, "dictationRecognizerModeOverlayManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancelPreviousPerformRequestsWithTarget:selector:object:", v11, sel_showOverlayForDictiationRecognizerMode, 0);

    -[CACDisplayManager dictationRecognizerModeOverlayManager](self, "dictationRecognizerModeOverlayManager");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hideWithoutAnimation");
    goto LABEL_9;
  }
  if (-[CACDisplayManager isDisplayingCorrections](self, "isDisplayingCorrections"))
  {
LABEL_7:
    if (!-[CACDisplayManager isDisplayingCorrections](self, "isDisplayingCorrections"))
      return;
    goto LABEL_8;
  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "dictationRecognizerMode"))
  {

    goto LABEL_7;
  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentInteractionLevel");

  if (v7)
    goto LABEL_7;
  v8 = (void *)MEMORY[0x24BEDCDF0];
  -[CACDisplayManager dictationRecognizerModeOverlayManager](self, "dictationRecognizerModeOverlayManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelPreviousPerformRequestsWithTarget:selector:object:", v9, sel_showOverlayForDictiationRecognizerMode, 0);

  -[CACDisplayManager dictationRecognizerModeOverlayManager](self, "dictationRecognizerModeOverlayManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performSelector:withObject:afterDelay:", sel_showOverlayForDictiationRecognizerMode, 0, 2.5);
LABEL_9:

}

- (void)showCorrectionsForElement:(id)a3 nBestStrings:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CACDisplayManager_showCorrectionsForElement_nBestStrings___block_invoke;
  block[3] = &unk_24F2AAEA0;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__CACDisplayManager_showCorrectionsForElement_nBestStrings___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "correctionPresentationManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showCorrectionsForElement:nBestStrings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)hideCorrections
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__CACDisplayManager_hideCorrections__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __36__CACDisplayManager_hideCorrections__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "correctionPresentationManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hideAnimated:completion:", 1, 0);

}

- (void)showCustomCommandEditorWithGesture:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;

  v4 = a3;
  -[CACDisplayManager customCommandEditorPresentationManager](self, "customCommandEditorPresentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showCustomCommandEditorWithGesture:", v4);

  if ((v6 & 1) == 0)
  {
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Error.RecordedEmptyGesture"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CACDisplayManager displayMessageString:type:](self, "displayMessageString:type:", v7, 1);

  }
}

- (void)showCustomCommandEditorWithTextToInsert:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACDisplayManager customCommandEditorPresentationManager](self, "customCommandEditorPresentationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showCustomCommandEditorWithTextToInsert:", v4);

}

- (void)showCustomCommandEditorWithRecordedUserActionFlow:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;

  v4 = a3;
  -[CACDisplayManager customCommandEditorPresentationManager](self, "customCommandEditorPresentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showCustomCommandEditorWithRecordedUserActionFlow:", v4);

  if ((v6 & 1) == 0)
  {
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Error.RecordedEmptyUserActionFlow"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CACDisplayManager displayMessageString:type:](self, "displayMessageString:type:", v7, 1);

  }
}

- (void)showCustomCommandEditorWithShortcutsWorkflow:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;

  v4 = a3;
  -[CACDisplayManager customCommandEditorPresentationManager](self, "customCommandEditorPresentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showCustomCommandEditorWithShortcutsWorkflow:", v4);

  if ((v6 & 1) == 0)
  {
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Error.MissingShortcutsWorkflow"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CACDisplayManager displayMessageString:type:](self, "displayMessageString:type:", v7, 1);

  }
}

- (void)showContextCluesViewWithCommands:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACDisplayManager contextCluesPresentationManager](self, "contextCluesPresentationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showWithCommands:", v4);

}

- (void)showLiveRecordingGesturePreview
{
  OUTLINED_FUNCTION_0_1(&dword_229A40000, a1, a3, "== Showing Gesture Live Preview", a5, a6, a7, a8, 0);
}

- (void)addPointsToLiveRecordingGesturePreviewByFingerIdentifier:(id)a3 forces:(id)a4 atTime:(double)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[CACDisplayManager gestureLivePreviewPresentationOverlayManager](self, "gestureLivePreviewPresentationOverlayManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPointsToLiveRecordingGesturePreviewByFingerIdentifier:forces:atTime:", v9, v8, a5);

}

- (void)removeTrackingForFingerIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACDisplayManager gestureLivePreviewPresentationOverlayManager](self, "gestureLivePreviewPresentationOverlayManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTrackingForFingerIdentifier:", v4);

}

- (void)hideLiveRecordingGesturePreview
{
  id v2;

  -[CACDisplayManager gestureLivePreviewPresentationOverlayManager](self, "gestureLivePreviewPresentationOverlayManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideAnimated:completion:", 1, &__block_literal_global_615);

}

void __52__CACDisplayManager_hideLiveRecordingGesturePreview__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  CACLogGestureRecording();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __52__CACDisplayManager_hideLiveRecordingGesturePreview__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (id)_test_activeEditingOverlayElements
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_sceneManagers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "linesEditingModeOverlayManager", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "editingModeOverlayManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "viewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v10, "overlayElements");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v13);

        }
        objc_msgSend(v11, "viewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v11, "overlayElements");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v15);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v3;
}

- (_NSRange)targetOverlayRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_targetOverlayRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setTargetOverlayRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_targetOverlayRange, &v3, 16, 1, 0);
}

- (BOOL)shouldShowTextEditingOverlayInTutorial
{
  return self->_shouldShowTextEditingOverlayInTutorial;
}

- (void)setShouldShowTextEditingOverlayInTutorial:(BOOL)a3
{
  self->_shouldShowTextEditingOverlayInTutorial = a3;
}

- (BOOL)carPlayAvailable
{
  return self->_carPlayAvailable;
}

- (void)setCarPlayAvailable:(BOOL)a3
{
  self->_carPlayAvailable = a3;
}

- (BOOL)carPlayConnected
{
  return self->_carPlayConnected;
}

- (void)setCarPlayConnected:(BOOL)a3
{
  self->_carPlayConnected = a3;
}

- (BOOL)carPlayConnectedWirelessly
{
  return self->_carPlayConnectedWirelessly;
}

- (void)setCarPlayConnectedWirelessly:(BOOL)a3
{
  self->_carPlayConnectedWirelessly = a3;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (int64_t)statusIndicatorType
{
  return self->_statusIndicatorType;
}

- (BOOL)gridDidDrill
{
  return self->_gridDidDrill;
}

- (void)setGridDidDrill:(BOOL)a3
{
  self->_gridDidDrill = a3;
}

- (NSTimer)statusIndicatorAnimationTimer
{
  return self->_statusIndicatorAnimationTimer;
}

- (void)setStatusIndicatorAnimationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorAnimationTimer, a3);
}

- (STVoiceControlStatusDomainPublisher)voiceControlStatusPublisher
{
  return self->_voiceControlStatusPublisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusIndicatorAnimationTimer, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_programmaticallySelectedElement, 0);
  objc_storeStrong((id *)&self->_carPlayApps, 0);
  objc_storeStrong((id *)&self->_voiceControlServer, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_voiceControlStatusPublisher, 0);
  objc_storeStrong((id *)&self->_voiceOverAnnouncer, 0);
  objc_storeStrong((id *)&self->_modalAlerts, 0);
  objc_storeStrong((id *)&self->_messageDisplayOperationQueue, 0);
  objc_storeStrong((id *)&self->_sceneManagers, 0);
}

void __52__CACDisplayManager_hideLiveRecordingGesturePreview__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_229A40000, a1, a3, "== Hiding Gesture Live Preview", a5, a6, a7, a8, 0);
}

@end

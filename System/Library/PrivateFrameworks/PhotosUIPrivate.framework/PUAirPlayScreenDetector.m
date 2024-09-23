@implementation PUAirPlayScreenDetector

- (PUAirPlayScreenDetector)init
{
  PUAirPlayScreenDetector *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *detectedScreensMap;
  SBSExternalDisplayService *v5;
  SBSExternalDisplayService *externalDisplayService;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUAirPlayScreenDetector;
  v2 = -[PUAirPlayScreenDetector init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    detectedScreensMap = v2->_detectedScreensMap;
    v2->_detectedScreensMap = v3;

    v5 = (SBSExternalDisplayService *)objc_alloc_init(MEMORY[0x1E0DAAE48]);
    externalDisplayService = v2->_externalDisplayService;
    v2->_externalDisplayService = v5;

    -[SBSExternalDisplayService addObserver:](v2->_externalDisplayService, "addObserver:", v2);
    -[PUAirPlayScreenDetector _setUpSceneNotifications](v2, "_setUpSceneNotifications");
    -[PUAirPlayScreenDetector _scanForAvailableScreens](v2, "_scanForAvailableScreens");
  }
  return v2;
}

- (NSArray)availableScreens
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectEnumerator](self->_detectedScreensMap, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)shouldIgnoreScreen:(id)a3 displayInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 3)
  {
    PLAirPlayGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[UIScreen pu_hardwareIdentifier](v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v10;
      v11 = "Ignoring CarPlay screen: %{public}@";
LABEL_17:
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v21, 0xCu);

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  objc_msgSend(v5, "displayConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isMainDisplay");

  if (v13)
  {
    PLAirPlayGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[UIScreen pu_hardwareIdentifier](v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v10;
      v11 = "Ignoring main screen: %{public}@";
      goto LABEL_17;
    }
LABEL_18:

    v19 = 1;
    goto LABEL_19;
  }
  if ((PLIsCamera() & 1) != 0 || PLIsPhotosApp())
  {
    objc_msgSend(v5, "displayConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2728], "TVOutDisplay");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "isEqualToString:", v17);

    if (v18)
    {
      PLAirPlayGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        -[UIScreen pu_hardwareIdentifier](v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v10;
        v11 = "Ignoring TVOut screen: %{public}@";
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  if (v6 && (objc_msgSend(v6, "isMirrored") & 1) == 0)
  {
    PLAirPlayGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[UIScreen pu_hardwareIdentifier](v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v10;
      v11 = "Ignoring non-mirrored screen: %{public}@";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v19 = 0;
LABEL_19:

  return v19;
}

- (void)_scanForAvailableScreens
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  PLAirPlayGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "Scanning for available AirPlay screens.", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PUAirPlayScreenDetector__scanForAvailableScreens__block_invoke;
  v4[3] = &unk_1E589BC28;
  v4[4] = self;
  -[PUAirPlayScreenDetector _enumerateAllScreensAndDisplayInfos:](self, "_enumerateAllScreensAndDisplayInfos:", v4);
}

- (void)_handleUpdatedDisplayInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *detectedScreensMap;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLAirPlayGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "Received update info for screen: %{public}@", buf, 0xCu);

  }
  detectedScreensMap = self->_detectedScreensMap;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](detectedScreensMap, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PUAirPlayScreenDetector shouldIgnoreScreen:displayInfo:](self, "shouldIgnoreScreen:displayInfo:", v10, v4);

    if (v11)
      -[PUAirPlayScreenDetector _removeAirPlayScreenAndNotifyDelegate:](self, "_removeAirPlayScreenAndNotifyDelegate:", v9);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__PUAirPlayScreenDetector__handleUpdatedDisplayInfo___block_invoke;
    v12[3] = &unk_1E589BC28;
    v12[4] = self;
    -[PUAirPlayScreenDetector _performBlockWithScreenForDisplayInfo:handler:](self, "_performBlockWithScreenForDisplayInfo:handler:", v4, v12);
  }

}

- (void)_createAirPlayScreenAndNotifyDelegate:(id)a3
{
  id v4;
  PUAirPlayScreen *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[UIScreen pu_hardwareIdentifier](v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PUAirPlayScreen initWithScreen:]([PUAirPlayScreen alloc], "initWithScreen:", v4);

  -[NSMutableDictionary setObject:forKey:](self->_detectedScreensMap, "setObject:forKey:", v5, v7);
  -[PUAirPlayScreenDetector receiver](self, "receiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenDetector:didDetectScreen:", self, v5);

}

- (void)_removeAirPlayScreenAndNotifyDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScreen pu_hardwareIdentifier](v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary removeObjectForKey:](self->_detectedScreensMap, "removeObjectForKey:", v7);
    -[PUAirPlayScreenDetector receiver](self, "receiver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screenDetector:didLoseScreen:", self, v4);

  }
}

- (void)_performBlockWithDisplayInfoForScreen:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SBSExternalDisplayService *externalDisplayService;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[UIScreen pu_hardwareIdentifier](v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    externalDisplayService = self->_externalDisplayService;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__PUAirPlayScreenDetector__performBlockWithDisplayInfoForScreen_handler___block_invoke;
    v11[3] = &unk_1E589BC50;
    v12 = v8;
    v14 = v7;
    v13 = v6;
    v10 = v8;
    -[SBSExternalDisplayService getConnectedDisplayInfoWithCompletionHandler:](externalDisplayService, "getConnectedDisplayInfoWithCompletionHandler:", v11);

  }
}

- (void)_performBlockWithScreenForDisplayInfo:(id)a3 handler:(id)a4
{
  void (**v5)(id, void *, id);
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v5 = (void (**)(id, void *, id))a4;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectedScenes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          objc_msgSend(v14, "screen");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIScreen pu_hardwareIdentifier](v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if (v18)
          {

            goto LABEL_14;
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
        continue;
      break;
    }
    v15 = 0;
  }
  else
  {
    v15 = 0;
  }
LABEL_14:

  v5[2](v5, v15, v19);
}

- (void)_enumerateAllScreensAndDisplayInfos:(id)a3
{
  id v4;
  SBSExternalDisplayService *externalDisplayService;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  externalDisplayService = self->_externalDisplayService;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PUAirPlayScreenDetector__enumerateAllScreensAndDisplayInfos___block_invoke;
  v7[3] = &unk_1E58A7700;
  v8 = v4;
  v6 = v4;
  -[SBSExternalDisplayService getConnectedDisplayInfoWithCompletionHandler:](externalDisplayService, "getConnectedDisplayInfoWithCompletionHandler:", v7);

}

- (void)_setUpSceneNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__sceneWillConnect_, *MEMORY[0x1E0DC5328], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__sceneDidDisconnect_, *MEMORY[0x1E0DC5310], 0);

}

- (void)_sceneWillConnect:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__PUAirPlayScreenDetector__sceneWillConnect___block_invoke;
    v9[3] = &unk_1E589BC28;
    v9[4] = self;
    -[PUAirPlayScreenDetector _performBlockWithDisplayInfoForScreen:handler:](self, "_performBlockWithDisplayInfoForScreen:handler:", v8, v9);

  }
}

- (void)_sceneDidDisconnect:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  NSMutableDictionary *detectedScreensMap;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    detectedScreensMap = self->_detectedScreensMap;
    -[UIScreen pu_hardwareIdentifier](v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](detectedScreensMap, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAirPlayScreenDetector _removeAirPlayScreenAndNotifyDelegate:](self, "_removeAirPlayScreenAndNotifyDelegate:", v10);
  }

}

- (void)externalDisplayDidUpdateProperties:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PUAirPlayScreenDetector_externalDisplayDidUpdateProperties___block_invoke;
  v6[3] = &unk_1E58ABCA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (PUAirPlayScreenReceiver)receiver
{
  return (PUAirPlayScreenReceiver *)objc_loadWeakRetained((id *)&self->_receiver);
}

- (void)setReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_receiver, a3);
}

- (SBSExternalDisplayService)externalDisplayService
{
  return self->_externalDisplayService;
}

- (NSMutableDictionary)detectedScreensMap
{
  return self->_detectedScreensMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedScreensMap, 0);
  objc_storeStrong((id *)&self->_externalDisplayService, 0);
  objc_destroyWeak((id *)&self->_receiver);
}

uint64_t __62__PUAirPlayScreenDetector_externalDisplayDidUpdateProperties___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedDisplayInfo:", *(_QWORD *)(a1 + 40));
}

void __45__PUAirPlayScreenDetector__sceneWillConnect___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreScreen:displayInfo:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_createAirPlayScreenAndNotifyDelegate:", v3);

}

void __63__PUAirPlayScreenDetector__enumerateAllScreensAndDisplayInfos___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PUAirPlayScreenDetector__enumerateAllScreensAndDisplayInfos___block_invoke_2;
  v5[3] = &unk_1E58AB968;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __63__PUAirPlayScreenDetector__enumerateAllScreensAndDisplayInfos___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "screen");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIScreen pu_hardwareIdentifier](v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKey:", v12, v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v8);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = *(id *)(a1 + 32);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v40;
    *(_QWORD *)&v16 = 138412290;
    v34 = v16;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v20, "identifier", v34);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v20, "identifier");
          v22 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v20, v22);
        }
        else
        {
          PLAirPlayGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v34;
            v49 = v20;
            _os_log_fault_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_FAULT, "SBSConnectedDisplayInfo had a nil identifier: %@", buf, 0xCu);
          }
        }

      }
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v17);
  }

  v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v2, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObjectsFromArray:", v24);

  objc_msgSend(v3, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObjectsFromArray:", v25);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v26 = v23;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k);
        objc_msgSend(v2, "objectForKey:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v28);
  }

}

void __73__PUAirPlayScreenDetector__performBlockWithDisplayInfoForScreen_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  int v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a2;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v9)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PUAirPlayScreenDetector__performBlockWithDisplayInfoForScreen_handler___block_invoke_2;
  block[3] = &unk_1E58ABAF0;
  v14 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 40);
  v13 = v4;
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __73__PUAirPlayScreenDetector__performBlockWithDisplayInfoForScreen_handler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __53__PUAirPlayScreenDetector__handleUpdatedDisplayInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6 && (objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreScreen:displayInfo:", v6, v5) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_createAirPlayScreenAndNotifyDelegate:", v6);

}

void __51__PUAirPlayScreenDetector__scanForAvailableScreens__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  PUAirPlayScreen *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && (objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreScreen:displayInfo:", v5, v6) & 1) == 0)
  {
    -[UIScreen pu_hardwareIdentifier](v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLAirPlayGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "Found AirPlay screen: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    v9 = -[PUAirPlayScreen initWithScreen:]([PUAirPlayScreen alloc], "initWithScreen:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v9, v7);

  }
}

@end

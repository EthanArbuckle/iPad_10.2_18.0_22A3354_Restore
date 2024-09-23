@implementation VOSCommandManager

- (VOSCommandManager)initWithSystemProfile
{
  VOSCommandManager *v2;
  VOSCommandManager *v3;
  void *v4;
  uint64_t v5;
  NSString *siriShortCutToken;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VOSCommandManager;
  v2 = -[VOSCommandManager init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VOSCommandManager setLoadShortcuts:](v2, "setLoadShortcuts:", 1);
    -[VOSCommandManager _commonInit](v3, "_commonInit");
    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __42__VOSCommandManager_initWithSystemProfile__block_invoke;
    v11 = &unk_24CBAC1D8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "registerShortcutsDidChangeBlock:", &v8);
    v5 = objc_claimAutoreleasedReturnValue();
    siriShortCutToken = v3->_siriShortCutToken;
    v3->_siriShortCutToken = (NSString *)v5;

    -[VOSCommandManager reloadWithSystemProfile](v3, "reloadWithSystemProfile", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __42__VOSCommandManager_initWithSystemProfile__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadWithSystemProfile");

}

- (id)initPreferringUserProfileWithoutShortcuts
{
  VOSCommandManager *v2;
  VOSCommandManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VOSCommandManager;
  v2 = -[VOSCommandManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VOSCommandManager setLoadShortcuts:](v2, "setLoadShortcuts:", 0);
    -[VOSCommandManager _commonInit](v3, "_commonInit");
    -[VOSCommandManager _commonUserProfileInit](v3, "_commonUserProfileInit");
  }
  return v3;
}

- (id)initPreferringUserProfile
{
  VOSCommandManager *v2;
  VOSCommandManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VOSCommandManager;
  v2 = -[VOSCommandManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VOSCommandManager setLoadShortcuts:](v2, "setLoadShortcuts:", 1);
    -[VOSCommandManager _commonInit](v3, "_commonInit");
    -[VOSCommandManager _commonUserProfileInit](v3, "_commonUserProfileInit");
  }
  return v3;
}

- (void)_commonUserProfileInit
{
  -[VOSCommandManager reloadPreferringUserProfile](self, "reloadPreferringUserProfile");
  if (-[VOSCommandManager activeProfileIsUserProfile](self, "activeProfileIsUserProfile"))
  {
    if (-[VOSCommandManager _validateUserProfileDiscrepancies:](self, "_validateUserProfileDiscrepancies:", self->_activeProfile))
    {
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

uint64_t __43__VOSCommandManager__commonUserProfileInit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveAsUserProfile");
}

- (void)_commonInit
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *queue;
  void *v5;
  NSString *v6;
  NSString *siriShortCutToken;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (OS_dispatch_queue *)dispatch_queue_create("VOSCommandManager", 0);
  queue = self->_queue;
  self->_queue = v3;

  if (-[VOSCommandManager loadShortcuts](self, "loadShortcuts"))
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__VOSCommandManager__commonInit__block_invoke;
    v8[3] = &unk_24CBAC1D8;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v5, "registerShortcutsDidChangeBlock:", v8);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    siriShortCutToken = self->_siriShortCutToken;
    self->_siriShortCutToken = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __32__VOSCommandManager__commonInit__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadPreferringUserProfile");

}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[VOSCommandManager loadShortcuts](self, "loadShortcuts"))
  {
    objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shortcuts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[VOSCommandProfile debugDescription](self->_activeProfile, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("VOSCommadManager:<%p>.\nProfile: %@\nDiscovered Shortcuts: %@"), self, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)reloadWithSystemProfile
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__VOSCommandManager_reloadWithSystemProfile__block_invoke;
  block[3] = &unk_24CBAC200;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __44__VOSCommandManager_reloadWithSystemProfile__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadSystemProfile");
}

- (void)reloadPreferringUserProfile
{
  OUTLINED_FUNCTION_0(&dword_211371000, a2, a3, "Could not load user command profile: %@", a5, a6, a7, a8, 2u);
}

uint64_t __48__VOSCommandManager_reloadPreferringUserProfile__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(id **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_storeStrong(v4 + 2, *(id *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:");
  }
  else
  {
    objc_msgSend(v4, "_loadSystemProfile");
  }
  return objc_msgSend(*(id *)(a1 + 32), "setActiveProfileIsUserProfile:", v5 != 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[VOSCommandManager loadShortcuts](self, "loadShortcuts"))
  {
    objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterShortcutsDidChangeBlock:", self->_siriShortCutToken);

  }
  v4.receiver = self;
  v4.super_class = (Class)VOSCommandManager;
  -[VOSCommandManager dealloc](&v4, sel_dealloc);
}

- (BOOL)_validateUserProfileDiscrepancies:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  __int128 v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[VOSCommandResolver resolverForCurrentHost](VOSCommandResolver, "resolverForCurrentHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandManager systemProfile](self, "systemProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  +[VOSGesture allGestures](VOSGesture, "allGestures");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (!v7)
  {
    v10 = 0;
    goto LABEL_27;
  }
  v9 = v7;
  v10 = 0;
  v11 = *(_QWORD *)v28;
  *(_QWORD *)&v8 = 138412546;
  v25 = v8;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12);
      if (objc_msgSend(v6, "availabilityForGesture:withResolver:", v13, v5, v25) != 1)
      {
        if (objc_msgSend(v6, "availabilityForGesture:withResolver:", v13, v5))
          goto LABEL_20;
        objc_msgSend(v4, "commandForTouchGesture:withResolver:", v13, v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "commandForTouchGesture:withResolver:", v13, v5);
        v20 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v20;
        if (v14)
          v21 = 1;
        else
          v21 = v20 == 0;
        if (!v21)
        {
          v22 = (id)objc_msgSend(v4, "addGesture:toCommand:withResolver:", v13, v20, v5);
          VOTLogCommon();
          v17 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            goto LABEL_17;
          *(_DWORD *)buf = v25;
          v32 = v13;
          v33 = 2112;
          v34 = v15;
          v18 = v17;
          v19 = "Found new VO default command that didn't make it into the default set: %@ > %@";
LABEL_23:
          _os_log_error_impl(&dword_211371000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0x16u);
LABEL_17:

          v10 = 1;
        }
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(v4, "commandForTouchGesture:withResolver:", v13, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(v6, "commandForTouchGesture:withResolver:", v13, v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (id)objc_msgSend(v4, "addGesture:toCommand:withResolver:", v13, v15, v5);
          VOTLogCommon();
          v17 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            goto LABEL_17;
          *(_DWORD *)buf = v25;
          v32 = v13;
          v33 = 2112;
          v34 = v15;
          v18 = v17;
          v19 = "Found VO hardwired gesture that was missing command: %@ > %@";
          goto LABEL_23;
        }
        goto LABEL_18;
      }
LABEL_19:

LABEL_20:
      ++v12;
    }
    while (v9 != v12);
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    v9 = v23;
  }
  while (v23);
LABEL_27:

  return v10 & 1;
}

- (void)restoreDefaultProfile
{
  NSObject *queue;
  void *v3;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__VOSCommandManager_restoreDefaultProfile__block_invoke;
  block[3] = &unk_24CBAC200;
  block[4] = self;
  dispatch_sync(queue, block);
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVoiceOverCustomCommandProfile:", 0);

}

uint64_t __42__VOSCommandManager_restoreDefaultProfile__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadSystemProfile");
}

- (void)saveAsUserProfile
{
  OUTLINED_FUNCTION_0(&dword_211371000, a2, a3, "Failed to archive VOSCommandProfile. error: %@", a5, a6, a7, a8, 2u);
}

void __38__VOSCommandManager_saveAsUserProfile__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = *(_QWORD *)(a1[4] + 16);
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)batchUpdateActiveProfile:(id)a3 saveIfSuccessful:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  BOOL v9;
  void (**v10)(id, void *);

  v5 = a4;
  v10 = (void (**)(id, void *))a5;
  (*((void (**)(id, VOSCommandManager *))a3 + 2))(a3, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 1;
  else
    v9 = !v5;
  if (!v9)
    -[VOSCommandManager saveAsUserProfile](self, "saveAsUserProfile");
  if (v10)
    v10[2](v10, v8);

}

- (id)availableSiriShortcuts:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE006E0], "sharedManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortcuts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)addGesture:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__VOSCommandManager_addGesture_toCommand_withResolver___block_invoke;
  block[3] = &unk_24CBAC278;
  v20 = v10;
  v21 = &v22;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __55__VOSCommandManager_addGesture_toCommand_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "addGesture:toCommand:withResolver:", a1[5], a1[6], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)removeGesture:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__VOSCommandManager_removeGesture_fromCommand_withResolver___block_invoke;
  block[3] = &unk_24CBAC278;
  v20 = v10;
  v21 = &v22;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __60__VOSCommandManager_removeGesture_fromCommand_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "removeGesture:fromCommand:withResolver:", a1[5], a1[6], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)addKeyChord:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__VOSCommandManager_addKeyChord_toCommand_withResolver___block_invoke;
  block[3] = &unk_24CBAC278;
  v20 = v10;
  v21 = &v22;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __56__VOSCommandManager_addKeyChord_toCommand_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "addKeyChord:toCommand:withResolver:", a1[5], a1[6], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)removeKeyChord:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__VOSCommandManager_removeKeyChord_fromCommand_withResolver___block_invoke;
  block[3] = &unk_24CBAC278;
  v20 = v10;
  v21 = &v22;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __61__VOSCommandManager_removeKeyChord_fromCommand_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "removeKeyChord:fromCommand:withResolver:", a1[5], a1[6], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)validateCanAddGesture:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__VOSCommandManager_validateCanAddGesture_toCommand_withResolver___block_invoke;
  block[3] = &unk_24CBAC278;
  v20 = v10;
  v21 = &v22;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __66__VOSCommandManager_validateCanAddGesture_toCommand_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "validateCanAddGesture:toCommand:withResolver:", a1[5], a1[6], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)validateCanRemoveGesture:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__VOSCommandManager_validateCanRemoveGesture_fromCommand_withResolver___block_invoke;
  block[3] = &unk_24CBAC278;
  v20 = v10;
  v21 = &v22;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __71__VOSCommandManager_validateCanRemoveGesture_fromCommand_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "validateCanRemoveGesture:fromCommand:withResolver:", a1[5], a1[6], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)validateCanAddKeyChord:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__VOSCommandManager_validateCanAddKeyChord_toCommand_withResolver___block_invoke;
  block[3] = &unk_24CBAC278;
  v20 = v10;
  v21 = &v22;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __67__VOSCommandManager_validateCanAddKeyChord_toCommand_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "validateCanAddKeyChord:toCommand:withResolver:", a1[5], a1[6], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)validateCanRemoveKeyChord:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__VOSCommandManager_validateCanRemoveKeyChord_fromCommand_withResolver___block_invoke;
  block[3] = &unk_24CBAC278;
  v20 = v10;
  v21 = &v22;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __72__VOSCommandManager_validateCanRemoveKeyChord_fromCommand_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "validateCanRemoveKeyChord:fromCommand:withResolver:", a1[5], a1[6], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)commandForTouchGesture:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char IsPad;
  NSObject *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD *);
  void *v21;
  VOSCommandManager *v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  queue = self->_queue;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __57__VOSCommandManager_commandForTouchGesture_withResolver___block_invoke;
  v21 = &unk_24CBAC2A0;
  v25 = &v26;
  v22 = self;
  v9 = v6;
  v23 = v9;
  v10 = v7;
  v24 = v10;
  dispatch_sync(queue, &v18);
  v11 = (void *)v27[5];
  +[VOSCommand ToggleQuickNote](VOSCommand, "ToggleQuickNote", v18, v19, v20, v21, v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", v12))
  {
    IsPad = AXDeviceIsPad();

    if ((IsPad & 1) != 0)
      goto LABEL_5;
    v12 = (void *)v27[5];
    v27[5] = 0;
  }

LABEL_5:
  VOTLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v17 = v27[5];
    *(_DWORD *)buf = 138412802;
    v33 = v17;
    v34 = 2112;
    v35 = v9;
    v36 = 2112;
    v37 = v10;
    _os_log_debug_impl(&dword_211371000, v14, OS_LOG_TYPE_DEBUG, "Resolved command: '%@' for gesture: '%@' resolver: %@", buf, 0x20u);
  }

  v15 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v15;
}

void __57__VOSCommandManager_commandForTouchGesture_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "commandForTouchGesture:withResolver:", a1[5], a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)commandForKeyChord:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __53__VOSCommandManager_commandForKeyChord_withResolver___block_invoke;
  v15[3] = &unk_24CBAC2A0;
  v18 = &v19;
  v15[4] = self;
  v9 = v6;
  v16 = v9;
  v10 = v7;
  v17 = v10;
  dispatch_sync(queue, v15);
  VOTLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = v20[5];
    *(_DWORD *)buf = 138412802;
    v26 = v14;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    _os_log_debug_impl(&dword_211371000, v11, OS_LOG_TYPE_DEBUG, "Resolved command: '%@' for keyChord: '%@' resolver: %@", buf, 0x20u);
  }

  v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __53__VOSCommandManager_commandForKeyChord_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "commandForKeyChord:withResolver:", a1[5], a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allCommandsWithResolver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__VOSCommandManager_allCommandsWithResolver___block_invoke;
  block[3] = &unk_24CBAC2C8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__VOSCommandManager_allCommandsWithResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "allCommandsWithResolver:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allSiriShortcutCommandsWithResolver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__VOSCommandManager_allSiriShortcutCommandsWithResolver___block_invoke;
  block[3] = &unk_24CBAC2C8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__VOSCommandManager_allSiriShortcutCommandsWithResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "allSiriShortcutCommandsWithResolver:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allShortcutBindingsWithResolver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__VOSCommandManager_allShortcutBindingsWithResolver___block_invoke;
  block[3] = &unk_24CBAC2C8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __53__VOSCommandManager_allShortcutBindingsWithResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "allShortcutBindingsWithResolver:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)userPresentableAllShortcutBindingsWithResolver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__VOSCommandManager_userPresentableAllShortcutBindingsWithResolver___block_invoke;
  block[3] = &unk_24CBAC2C8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __68__VOSCommandManager_userPresentableAllShortcutBindingsWithResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "userPresentableAllShortcutBindingsWithResolver:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)gestureBindingsForCommand:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__VOSCommandManager_gestureBindingsForCommand_withResolver___block_invoke;
  v13[3] = &unk_24CBAC2A0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __60__VOSCommandManager_gestureBindingsForCommand_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "gestureBindingsForCommand:withResolver:", a1[5], a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)shortcutBindingsForCommand:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__VOSCommandManager_shortcutBindingsForCommand_withResolver___block_invoke;
  v13[3] = &unk_24CBAC2A0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __61__VOSCommandManager_shortcutBindingsForCommand_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "shortcutBindingsForCommand:withResolver:", a1[5], a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)commandHasAnyBindings:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__VOSCommandManager_commandHasAnyBindings_withResolver___block_invoke;
  v12[3] = &unk_24CBAC2A0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v12);
  LOBYTE(queue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)queue;
}

uint64_t __56__VOSCommandManager_commandHasAnyBindings_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "commandHasAnyBindings:withResolver:", a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (unint64_t)availabilityForGesture:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  unint64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__VOSCommandManager_availabilityForGesture_withResolver___block_invoke;
  v13[3] = &unk_24CBAC2A0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __57__VOSCommandManager_availabilityForGesture_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "availabilityForGesture:withResolver:", a1[5], a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (unint64_t)availabilityForShortcut:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  unint64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__VOSCommandManager_availabilityForShortcut_withResolver___block_invoke;
  v13[3] = &unk_24CBAC2A0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __58__VOSCommandManager_availabilityForShortcut_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "availabilityForShortcut:withResolver:", a1[5], a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (unint64_t)availabilityForCommand:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  unint64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__VOSCommandManager_availabilityForCommand_withResolver___block_invoke;
  v13[3] = &unk_24CBAC2A0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __57__VOSCommandManager_availabilityForCommand_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "availabilityForCommand:withResolver:", a1[5], a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (BOOL)commandHasModifiedBindingsWhenZoomEnabled:(id)a3 withResolver:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __76__VOSCommandManager_commandHasModifiedBindingsWhenZoomEnabled_withResolver___block_invoke;
  v12[3] = &unk_24CBAC2A0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v12);
  LOBYTE(queue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)queue;
}

uint64_t __76__VOSCommandManager_commandHasModifiedBindingsWhenZoomEnabled_withResolver___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "commandHasModifiedBindingsWhenZoomEnabled:withResolver:", a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (id)systemProfile
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  VOSCommandProfile *v8;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("DefaultCommandProfile"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[VOSCommandResolver currentHost](VOSCommandResolver, "currentHost");
  if (v5 > 5)
  {
    v6 = 0;
    v7 = 0;
  }
  else
  {
    objc_msgSend(v2, "pathForResource:ofType:", off_24CBAC2E8[v5], CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[VOSCommandProfile initWithProfileProperties:overlayProperties:]([VOSCommandProfile alloc], "initWithProfileProperties:overlayProperties:", v4, v7);

  return v8;
}

- (void)_loadSystemProfile
{
  VOSCommandProfile *v3;
  VOSCommandProfile *activeProfile;

  -[VOSCommandManager systemProfile](self, "systemProfile");
  v3 = (VOSCommandProfile *)objc_claimAutoreleasedReturnValue();
  activeProfile = self->_activeProfile;
  self->_activeProfile = v3;

  -[VOSCommandProfile setDelegate:](self->_activeProfile, "setDelegate:", self);
}

- (BOOL)activeProfileIsUserProfile
{
  return self->_activeProfileIsUserProfile;
}

- (void)setActiveProfileIsUserProfile:(BOOL)a3
{
  self->_activeProfileIsUserProfile = a3;
}

- (BOOL)loadShortcuts
{
  return self->_loadShortcuts;
}

- (void)setLoadShortcuts:(BOOL)a3
{
  self->_loadShortcuts = a3;
}

- (VOSCommandProfile)activeProfile
{
  return self->_activeProfile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriShortCutToken, 0);
  objc_storeStrong((id *)&self->_activeProfile, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

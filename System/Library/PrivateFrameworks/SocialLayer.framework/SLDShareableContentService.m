@implementation SLDShareableContentService

+ (id)remoteObjectProtocol
{
  return &unk_1EE396B78;
}

+ (void)setupInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion_, 0, 1);

}

+ (id)sharedService
{
  if (sharedService_onceToken_3 != -1)
    dispatch_once(&sharedService_onceToken_3, &__block_literal_global_10);
  return (id)sharedService_sService_3;
}

void __43__SLDShareableContentService_sharedService__block_invoke()
{
  SLDShareableContentService *v0;
  void *v1;

  v0 = objc_alloc_init(SLDShareableContentService);
  v1 = (void *)sharedService_sService_3;
  sharedService_sService_3 = (uint64_t)v0;

}

- (SLDShareableContentService)init
{
  SLDShareableContentService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  void *v6;
  uint64_t v7;
  FBSDisplayLayoutMonitor *layoutMonitor;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, void *);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SLDShareableContentService;
  v2 = -[SLDShareableContentService init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.SharedWithYou.SLDShareableContentService", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v2);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __34__SLDShareableContentService_init__block_invoke;
    v13 = &unk_1E3795530;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v6, "setTransitionHandler:", &v10);
    objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v6, v10, v11, v12, v13);
    v7 = objc_claimAutoreleasedReturnValue();
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v7;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __34__SLDShareableContentService_init__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id to;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v10 = objc_loadWeakRetained(&to);
  objc_msgSend(v10, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SLDShareableContentService_init__block_invoke_2;
  block[3] = &unk_1E3795508;
  v14 = v8;
  v12 = v8;
  objc_copyWeak(&v15, &to);
  dispatch_async(v11, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&to);

}

void __34__SLDShareableContentService_init__block_invoke_2(uint64_t a1)
{
  id *v1;
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  void (**v7)(void);
  id v8;
  id WeakRetained;
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    v1 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (objc_msgSend(WeakRetained, "isLayoutMonitorReady"))
    {

    }
    else
    {
      v2 = objc_loadWeakRetained(v1);
      objc_msgSend(v2, "retrieveShareableContentBlock");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        SLShareableContentLogHandle();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "Layout monitor is now ready.", buf, 2u);
        }

        v5 = objc_loadWeakRetained(v1);
        objc_msgSend(v5, "setIsLayoutMonitorReady:", 1);

        v6 = objc_loadWeakRetained(v1);
        objc_msgSend(v6, "retrieveShareableContentBlock");
        v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v7[2]();

        v8 = objc_loadWeakRetained(v1);
        objc_msgSend(v8, "setRetrieveShareableContentBlock:", 0);

      }
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SLDShareableContentService;
  -[SLDShareableContentService dealloc](&v3, sel_dealloc);
}

- (BOOL)allowsConnection:(id)a3
{
  id v3;
  char IsEntitledForShareableContent;
  NSObject *v5;
  uint64_t v6;

  v3 = a3;
  IsEntitledForShareableContent = SLDConnectionIsEntitledForShareableContent(v3);
  if ((IsEntitledForShareableContent & 1) == 0)
  {
    SLShareableContentLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SLDShareableContentService allowsConnection:].cold.1((uint64_t)v3, v5, v6);

  }
  return IsEntitledForShareableContent;
}

- (id)visibleApplications
{
  void *v3;
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
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  void *v21;
  int v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[SLDShareableContentService layoutMonitor](self, "layoutMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDShareableContentService _applicationIdentifierForConnection:](self, "_applicationIdentifierForConnection:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if (v15)
        {
          SLShareableContentLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "bundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v30 = v17;
            v18 = v16;
            v19 = OS_LOG_TYPE_INFO;
            v20 = "[VisibleApplications] Skipping element for %@ because it's from the process requesting shareable content";
LABEL_16:
            _os_log_impl(&dword_199EFF000, v18, v19, v20, buf, 0xCu);

          }
        }
        else
        {
          objc_msgSend(v11, "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

          if (v22)
          {
            SLShareableContentLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "bundleIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v30 = v17;
              v18 = v16;
              v19 = OS_LOG_TYPE_DEFAULT;
              v20 = "[VisibleApplications] Skipping element for %@ as Purple Buddy is not a valid source of shareable content";
              goto LABEL_16;
            }
          }
          else
          {
            if ((objc_msgSend(v11, "isUIApplicationElement") & 1) != 0)
            {
              objc_msgSend(v24, "addObject:", v11);
              goto LABEL_18;
            }
            SLShareableContentLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v11, "bundleIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v30 = v17;
              v18 = v16;
              v19 = OS_LOG_TYPE_INFO;
              v20 = "[VisibleApplications] Skipping element for %@ because it's not a UI application element";
              goto LABEL_16;
            }
          }
        }

LABEL_18:
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v8);
  }

  return v24;
}

- (id)visibleApplicationForSceneIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SLDShareableContentService visibleApplications](self, "visibleApplications", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
        {
          v14 = v11;

          v8 = v14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)launchApplicationWithBundleIdentifier:(id)a3 forActions:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D00]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D22CE0]);
    objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __97__SLDShareableContentService_launchApplicationWithBundleIdentifier_forActions_completionHandler___block_invoke;
    v21[3] = &unk_1E37949B8;
    v22 = v7;
    v23 = v9;
    objc_msgSend(v12, "openApplication:withOptions:completion:", v22, v11, v21);

  }
  else
  {
    SLShareableContentLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLDShareableContentService launchApplicationWithBundleIdentifier:forActions:completionHandler:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    if (v9)
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __97__SLDShareableContentService_launchApplicationWithBundleIdentifier_forActions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SLShareableContentLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __97__SLDShareableContentService_launchApplicationWithBundleIdentifier_forActions_completionHandler___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_DEFAULT, "Application launch succeeded for bundle identifier: %@", (uint8_t *)&v11, 0xCu);
  }

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);

}

- (void)performAction:(id)a3 onApplicationWithBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDShareableContentService launchApplicationWithBundleIdentifier:forActions:completionHandler:](self, "launchApplicationWithBundleIdentifier:forActions:completionHandler:", v6, v8, 0);

}

- (void)populateInitiatorMetadata:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[5];
  id v27;
  void (**v28)(id, uint64_t, _QWORD);
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE buf[24];
  void *v34;
  uint64_t *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v9, "collaborationMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    SLShareableContentLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_199EFF000, v12, OS_LOG_TYPE_DEFAULT, "Populating initiator name and handle from custom collaboration metadata: %@", buf, 0xCu);
    }

    objc_msgSend(v11, "initiatorHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInitiatorHandle:", v13);

    objc_msgSend(v11, "initiatorNameComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInitiatorNameComponents:", v14);

    v10[2](v10, 1, 0);
    goto LABEL_13;
  }
  objc_msgSend(v9, "fileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

LABEL_8:
    SLShareableContentLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "fileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "containerSetupInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      _os_log_impl(&dword_199EFF000, v17, OS_LOG_TYPE_DEFAULT, "Populating initiator name and handle from initiator metadata (fileURL: %@, containerSetupInfo: %@", buf, 0x16u);

    }
    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v20 = (void *)getCSCloudSharingClass_softClass;
    v32 = getCSCloudSharingClass_softClass;
    v21 = MEMORY[0x1E0C809B0];
    if (!getCSCloudSharingClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getCSCloudSharingClass_block_invoke;
      v34 = &unk_1E3794510;
      v35 = &v29;
      __getCSCloudSharingClass_block_invoke((uint64_t)buf);
      v20 = (void *)v30[3];
    }
    v22 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v29, 8);
    objc_msgSend(v9, "fileURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerSetupInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __82__SLDShareableContentService_populateInitiatorMetadata_request_completionHandler___block_invoke;
    v26[3] = &unk_1E3795580;
    v26[4] = self;
    v28 = v10;
    v27 = v8;
    objc_msgSend(v22, "userNameAndEmail:containerSetupInfo:completionHandler:", v23, v24, v26);

    goto LABEL_13;
  }
  objc_msgSend(v9, "containerSetupInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_8;
  SLShareableContentLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v25, OS_LOG_TYPE_DEFAULT, "Not populating initiator name and handle for shareable content with no collaborative representations", buf, 2u);
  }

  v10[2](v10, 1, 0);
LABEL_13:

}

void __82__SLDShareableContentService_populateInitiatorMetadata_request_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__SLDShareableContentService_populateInitiatorMetadata_request_completionHandler___block_invoke_2;
  v17[3] = &unk_1E3795558;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v22 = v11;
  v17[4] = v12;
  v18 = v13;
  v19 = v7;
  v20 = v8;
  v21 = v9;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  dispatch_async(v10, v17);

}

uint64_t __82__SLDShareableContentService_populateInitiatorMetadata_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 32), "populateInitiatorMetadata:name:email:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)), *(_QWORD *)(a1 + 64));
}

- (BOOL)populateInitiatorMetadata:(id)a3 name:(id)a4 email:(id)a5
{
  id v7;
  unint64_t v8;
  BOOL v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = (unint64_t)a4;
  v9 = (v8 | (unint64_t)a5) != 0;
  if (v8 | (unint64_t)a5)
  {
    objc_msgSend(v7, "setInitiatorHandle:", a5);
    if (v8)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CB3858]);
      objc_msgSend(v10, "personNameComponentsFromString:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInitiatorNameComponents:", v11);

    }
  }

  return v9;
}

- (void)fetchShareableContentMetadataFromBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SLFetchShareableContentMetadataAction *v11;
  id v12;
  id v13;
  SLFetchShareableContentMetadataAction *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  SLDShareableContentService *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [SLFetchShareableContentMetadataAction alloc];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke;
  v16[3] = &unk_1E37955D0;
  v18 = self;
  v19 = v10;
  v17 = v8;
  v12 = v10;
  v13 = v8;
  v14 = -[SLShareableContentAction initWithSceneIdentifier:responseHandler:](v11, "initWithSceneIdentifier:responseHandler:", v9, v16);
  SLShareableContentLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    _os_log_impl(&dword_199EFF000, v15, OS_LOG_TYPE_DEFAULT, "Fetching shareable content metadata for scene: %{public}@", buf, 0xCu);
  }

  -[SLDShareableContentService performAction:onApplicationWithBundleIdentifier:](self, "performAction:onApplicationWithBundleIdentifier:", v14, v13);
}

void __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void (*v13)(void);
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "initiatorRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    SLShareableContentLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_cold_1();

    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_10;
  }
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v10 & 1) == 0)
  {
    SLShareableContentLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_cold_2((uint64_t *)(a1 + 32), v14, v15);

    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_10:
    v13();
    goto LABEL_11;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_79;
  v16[3] = &unk_1E37955A8;
  v11 = *(void **)(a1 + 40);
  v17 = *(id *)(a1 + 32);
  v19 = *(id *)(a1 + 48);
  v18 = v7;
  objc_msgSend(v11, "populateInitiatorMetadata:request:completionHandler:", v18, v8, v16);

LABEL_11:
}

void __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_79(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    SLShareableContentLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_79_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)fetchAsynchronousLPMetadataFromBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SLFetchAsynchronousLPMetadataAction *v11;
  id v12;
  id v13;
  SLFetchAsynchronousLPMetadataAction *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [SLFetchAsynchronousLPMetadataAction alloc];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __105__SLDShareableContentService_fetchAsynchronousLPMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke;
  v19 = &unk_1E37955F8;
  v20 = v8;
  v21 = v10;
  v12 = v10;
  v13 = v8;
  v14 = -[SLShareableContentAction initWithSceneIdentifier:responseHandler:](v11, "initWithSceneIdentifier:responseHandler:", v9, &v16);
  SLShareableContentLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v9;
    _os_log_impl(&dword_199EFF000, v15, OS_LOG_TYPE_DEFAULT, "Fetching asynchronous content metadata for scene: %{public}@", buf, 0xCu);
  }

  -[SLDShareableContentService performAction:onApplicationWithBundleIdentifier:](self, "performAction:onApplicationWithBundleIdentifier:", v14, v13, v16, v17, v18, v19);
}

void __105__SLDShareableContentService_fetchAsynchronousLPMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a2, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);

  }
  else
  {
    SLShareableContentLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __105__SLDShareableContentService_fetchAsynchronousLPMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)fetchShareableContentFromBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 requestedTypeIdentifier:(id)a5 requestedItemProviderIndex:(int64_t)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SLFetchShareableContentAction *v17;
  void *v18;
  NSObject *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (objc_msgSend(v12, "length"))
  {
    v16 = v12;
    if (v16)
    {
LABEL_3:
      v17 = -[SLFetchShareableContentAction initWithSceneIdentifier:requestedTypeIdentifier:requestedItemProviderIndex:responseHandler:]([SLFetchShareableContentAction alloc], "initWithSceneIdentifier:requestedTypeIdentifier:requestedItemProviderIndex:responseHandler:", v13, v14, a6, v15);
      -[SLDShareableContentService performAction:onApplicationWithBundleIdentifier:](self, "performAction:onApplicationWithBundleIdentifier:", v17, v16);

      goto LABEL_8;
    }
  }
  else
  {
    -[SLDShareableContentService visibleApplicationForSceneIdentifier:](self, "visibleApplicationForSceneIdentifier:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleIdentifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_3;
  }
  SLShareableContentLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[SLDShareableContentService fetchShareableContentFromBundleIdentifier:sceneIdentifier:requestedTypeIdentifier:requestedItemProviderIndex:responseHandler:].cold.1((uint64_t)v13, self, v19);

  (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
LABEL_8:

}

- (void)retrieveShareableContentMetadataMatchingBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SLDShareableContentService *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SLDShareableContentService queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke;
  v15[3] = &unk_1E37956C0;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  __int16 v10;
  _QWORD aBlock[4];
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "length") && objc_msgSend(a1[5], "length"))
  {
    SLShareableContentLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = a1[4];
      v4 = a1[5];
      *(_DWORD *)buf = 138412546;
      v19 = v3;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_199EFF000, v2, OS_LOG_TYPE_DEFAULT, "Fetching shareable content from bundle identifier: %@ scene identifier: %@", buf, 0x16u);
    }

    v5 = a1[4];
    v6 = a1[5];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_85;
    v16[3] = &unk_1E3795620;
    v7 = a1[6];
    v17 = a1[7];
    objc_msgSend(v7, "fetchShareableContentMetadataFromBundleIdentifier:sceneIdentifier:completion:", v5, v6, v16);

  }
  else
  {
    objc_initWeak((id *)buf, a1[6]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2;
    aBlock[3] = &unk_1E3795698;
    objc_copyWeak(&v15, (id *)buf);
    v12 = a1[4];
    v13 = a1[5];
    v14 = a1[7];
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(a1[6], "isLayoutMonitorReady"))
    {
      v8[2](v8);
    }
    else
    {
      SLShareableContentLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 0;
        _os_log_impl(&dword_199EFF000, v9, OS_LOG_TYPE_DEFAULT, "Layout monitor is not ready, waiting to fetch shareable content.", (uint8_t *)&v10, 2u);
      }

      objc_msgSend(a1[6], "setRetrieveShareableContentBlock:", v8);
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

void __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id to;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_copyWeak(&to, a1 + 7);
  SLShareableContentLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_199EFF000, v2, OS_LOG_TYPE_DEFAULT, "Fetching shareable content matching bundle identifier: %@ scene identifier: %@", buf, 0x16u);
  }

  v5 = objc_loadWeakRetained(&to);
  objc_msgSend(v5, "visibleApplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_87;
  v10[3] = &unk_1E3795648;
  v11 = a1[4];
  v12 = a1[5];
  objc_copyWeak(&v13, &to);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_94;
  v8[3] = &unk_1E3795670;
  v9 = a1[6];
  objc_msgSend(v6, "sl_mapAsynchronously:completionHandler:", v10, v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&to);
}

void __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  id WeakRetained;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD);
  uint8_t buf[4];
  id v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  if (v8)
    v9 = objc_msgSend(v8, "isEqualToString:", v7) ^ 1;
  else
    v9 = 0;
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    objc_msgSend(v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "isEqualToString:", v11) ^ 1;

  }
  if (objc_msgSend(v7, "length"))
    v12 = v9;
  else
    v12 = 1;
  if ((v12 & 1) != 0 || (v10 & 1) != 0)
  {
    SLShareableContentLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("YES");
      if (v9)
        v17 = CFSTR("NO");
      else
        v17 = CFSTR("YES");
      *(_DWORD *)buf = 138412802;
      v21 = v5;
      v22 = 2112;
      v23 = v17;
      if ((_DWORD)v10)
        v16 = CFSTR("NO");
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_199EFF000, v15, OS_LOG_TYPE_INFO, "Skipping fetching shareable content for layout element: %@ layoutElementMatchesBundleIdentifier: %@ layoutElementMatchesSceneIdentifier: %@", buf, 0x20u);
    }

    v6[2](v6, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v5, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2_88;
    v18[3] = &unk_1E3795620;
    v19 = v6;
    objc_msgSend(WeakRetained, "fetchShareableContentMetadataFromBundleIdentifier:sceneIdentifier:completion:", v7, v14, v18);

  }
}

uint64_t __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2_88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SLShareableContentLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "Fetched shareable content metadata for on screen applications: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retrieveAsynchronousLPMetadataMatchingBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SLDShareableContentService *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SLDShareableContentService queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke;
  v15[3] = &unk_1E37956C0;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  __int16 v10;
  _QWORD aBlock[4];
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "length") && objc_msgSend(a1[5], "length"))
  {
    SLShareableContentLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = a1[4];
      v4 = a1[5];
      *(_DWORD *)buf = 138412546;
      v19 = v3;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_199EFF000, v2, OS_LOG_TYPE_DEFAULT, "Fetching asynchronous content from bundle identifier: %@ scene identifier: %@", buf, 0x16u);
    }

    v5 = a1[4];
    v6 = a1[5];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_96;
    v16[3] = &unk_1E37956E8;
    v7 = a1[6];
    v17 = a1[7];
    objc_msgSend(v7, "fetchAsynchronousLPMetadataFromBundleIdentifier:sceneIdentifier:completion:", v5, v6, v16);

  }
  else
  {
    objc_initWeak((id *)buf, a1[6]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2;
    aBlock[3] = &unk_1E3795698;
    objc_copyWeak(&v15, (id *)buf);
    v12 = a1[4];
    v13 = a1[5];
    v14 = a1[7];
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(a1[6], "isLayoutMonitorReady"))
    {
      v8[2](v8);
    }
    else
    {
      SLShareableContentLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 0;
        _os_log_impl(&dword_199EFF000, v9, OS_LOG_TYPE_DEFAULT, "Layout monitor is not ready, waiting to fetch shareable content.", (uint8_t *)&v10, 2u);
      }

      objc_msgSend(a1[6], "setRetrieveShareableContentBlock:", v8);
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id to;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_copyWeak(&to, a1 + 7);
  SLShareableContentLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_199EFF000, v2, OS_LOG_TYPE_DEFAULT, "Fetching asynchronous content matching bundle identifier: %@ scene identifier: %@", buf, 0x16u);
  }

  v5 = objc_loadWeakRetained(&to);
  objc_msgSend(v5, "visibleApplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_98;
  v10[3] = &unk_1E3795710;
  v11 = a1[4];
  v12 = a1[5];
  objc_copyWeak(&v13, &to);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_101;
  v8[3] = &unk_1E3795670;
  v9 = a1[6];
  objc_msgSend(v6, "sl_mapAsynchronously:completionHandler:", v10, v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&to);
}

void __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_98(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  id WeakRetained;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD);
  uint8_t buf[4];
  id v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  if (v8)
    v9 = objc_msgSend(v8, "isEqualToString:", v7) ^ 1;
  else
    v9 = 0;
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    objc_msgSend(v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "isEqualToString:", v11) ^ 1;

  }
  if (objc_msgSend(v7, "length"))
    v12 = v9;
  else
    v12 = 1;
  if ((v12 & 1) != 0 || (v10 & 1) != 0)
  {
    SLShareableContentLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("YES");
      if (v9)
        v17 = CFSTR("NO");
      else
        v17 = CFSTR("YES");
      *(_DWORD *)buf = 138412802;
      v21 = v5;
      v22 = 2112;
      v23 = v17;
      if ((_DWORD)v10)
        v16 = CFSTR("NO");
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_199EFF000, v15, OS_LOG_TYPE_DEFAULT, "Skipping fetching asynchronous content for layout element: %@ layoutElementMatchesBundleIdentifier: %@ layoutElementMatchesSceneIdentifier: %@", buf, 0x20u);
    }

    v6[2](v6, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v5, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2_99;
    v18[3] = &unk_1E37956E8;
    v19 = v6;
    objc_msgSend(WeakRetained, "fetchAsynchronousLPMetadataFromBundleIdentifier:sceneIdentifier:completion:", v7, v14, v18);

  }
}

uint64_t __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2_99(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SLShareableContentLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "Fetched asynchronous content metadata for on screen applications: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

}

- (void)loadRepresentationFromBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 requestedTypeIdentifier:(id)a5 requestedItemProviderIndex:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v12 = a4;
  v13 = a7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __154__SLDShareableContentService_loadRepresentationFromBundleIdentifier_sceneIdentifier_requestedTypeIdentifier_requestedItemProviderIndex_completionHandler___block_invoke;
  v16[3] = &unk_1E3795738;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  -[SLDShareableContentService fetchShareableContentFromBundleIdentifier:sceneIdentifier:requestedTypeIdentifier:requestedItemProviderIndex:responseHandler:](self, "fetchShareableContentFromBundleIdentifier:sceneIdentifier:requestedTypeIdentifier:requestedItemProviderIndex:responseHandler:", a3, v15, a5, a6, v16);

}

void __154__SLDShareableContentService_loadRepresentationFromBundleIdentifier_sceneIdentifier_requestedTypeIdentifier_requestedItemProviderIndex_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a3;
  objc_msgSend(a2, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    SLShareableContentLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __154__SLDShareableContentService_loadRepresentationFromBundleIdentifier_sceneIdentifier_requestedTypeIdentifier_requestedItemProviderIndex_completionHandler___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)presentMessageComposeSheetForSceneIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SLSendShareableContentAction *v9;
  SLSendShareableContentAction *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[SLDShareableContentService visibleApplicationForSceneIdentifier:](self, "visibleApplicationForSceneIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [SLSendShareableContentAction alloc];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __86__SLDShareableContentService_presentMessageComposeSheetForSceneIdentifier_completion___block_invoke;
    v16 = &unk_1E3795760;
    v17 = v6;
    v18 = v7;
    v10 = -[SLShareableContentAction initWithSceneIdentifier:responseHandler:](v9, "initWithSceneIdentifier:responseHandler:", v17, &v13);
    objc_msgSend(v8, "bundleIdentifier", v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDShareableContentService performAction:onApplicationWithBundleIdentifier:](self, "performAction:onApplicationWithBundleIdentifier:", v10, v11);

  }
  else
  {
    SLShareableContentLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SLDShareableContentService presentMessageComposeSheetForSceneIdentifier:completion:].cold.1(self, v12);

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __86__SLDShareableContentService_presentMessageComposeSheetForSceneIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    SLShareableContentLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __86__SLDShareableContentService_presentMessageComposeSheetForSceneIdentifier_completion___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)shareCollaborationData:(id)a3 faceTimeConversationUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  NSObject *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SLDShareableContentService _connShouldAllowBackgroundCollaboration:](self, "_connShouldAllowBackgroundCollaboration:", v11);

  SLDaemonLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLDShareableContentService shareCollaborationData:faceTimeConversationUUID:completionHandler:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199EFF000, v14, OS_LOG_TYPE_INFO, "Initiating process has background collaboration entitlement, proceeding to initiate collaboration", buf, 2u);
    }
    v37 = v10;

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B10]), "initWithActivityType:", CFSTR("com.apple.Messages.BackgroundCollaboration"));
    -[SLDShareableContentService setActivity:](self, "setActivity:", v22);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v8, CFSTR("shud"));
    -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v9, CFSTR("FaceTimeUUID"));
    v23 = -[NSObject copy](v14, "copy");
    -[SLDShareableContentService activity](self, "activity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUserInfo:", v23);

    SLDaemonLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v14;
      _os_log_impl(&dword_199EFF000, v25, OS_LOG_TYPE_INFO, "Initiating collaboration via messages using userInfoDictionary %@", buf, 0xCu);
    }

    v40 = 0;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithApplicationIdentifier:error:", CFSTR("com.apple.MobileSMS"), &v40);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v40;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v26;
      v29 = objc_opt_new();
      v41 = *MEMORY[0x1E0D22D00];
      v42 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setFrontBoardOptions:](v29, "setFrontBoardOptions:", v30);
      -[SLDShareableContentService activity](self, "activity");
      v36 = v9;
      v31 = v8;
      v32 = v27;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "becomeCurrent");

      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDShareableContentService activity](self, "activity");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __96__SLDShareableContentService_shareCollaborationData_faceTimeConversationUUID_completionHandler___block_invoke;
      v38[3] = &unk_1E3795788;
      v38[4] = self;
      v39 = v37;
      objc_msgSend(v34, "openUserActivity:usingApplicationRecord:configuration:completionHandler:", v35, v28, v29, v38);

      v10 = v37;
      v27 = v32;
      v8 = v31;
      v9 = v36;

    }
    else
    {
      SLDaemonLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199EFF000, v29, OS_LOG_TYPE_DEFAULT, "Did not find LSApplicationRecord for messages, cannot launch user activity to initiate background collaboration", buf, 2u);
      }
    }

  }
}

void __96__SLDShareableContentService_shareCollaborationData_faceTimeConversationUUID_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SLDaemonLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_DEFAULT, "Opened user activity for collaboration success: %@ error: %@", buf, 0x16u);
  }

  v8 = dispatch_time(0, 2000000000);
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__SLDShareableContentService_shareCollaborationData_faceTimeConversationUUID_completionHandler___block_invoke_117;
  v12[3] = &unk_1E37946E0;
  v10 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = v10;
  v11 = v5;
  dispatch_after(v8, v9, v12);

}

uint64_t __96__SLDShareableContentService_shareCollaborationData_faceTimeConversationUUID_completionHandler___block_invoke_117(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)_connShouldAllowBackgroundCollaboration:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D01828], "processHandleForNSXPCConnection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0;
  else
    v4 = objc_msgSend(0, "hasEntitlement:", CFSTR("com.apple.private.sociallayer.background-collaboration"));

  return v4;
}

- (id)_applicationIdentifierForConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v13;
  _OWORD v14[2];

  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CA5898];
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v14, 0, sizeof(v14));
  v13 = 0;
  objc_msgSend(v6, "bundleRecordForAuditToken:error:", v14, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  objc_msgSend(v7, "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    SLShareableContentLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SLDShareableContentService _applicationIdentifierForConnection:].cold.1((uint64_t)self, (uint64_t)v8, v10);

  }
  objc_msgSend(v7, "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (id)retrieveShareableContentBlock
{
  return self->_retrieveShareableContentBlock;
}

- (void)setRetrieveShareableContentBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isLayoutMonitorReady
{
  return self->_isLayoutMonitorReady;
}

- (void)setIsLayoutMonitorReady:(BOOL)a3
{
  self->_isLayoutMonitorReady = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUserActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_retrieveShareableContentBlock, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

- (void)allowsConnection:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, a2, a3, "[SLDShareableContentService] connection does not have the proper entitlement and will not be allowed to access the service: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)launchApplicationWithBundleIdentifier:(uint64_t)a3 forActions:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_199EFF000, a1, a3, "launchApplicationWithBundleIdentifier: bundleIdentifier is nil, cannot call openApplication", a5, a6, a7, a8, 0);
}

void __97__SLDShareableContentService_launchApplicationWithBundleIdentifier_forActions_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "Application launch failed for %{public}@: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "Failed to get shareable content for scene in %{public}@: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, a2, a3, "Invalid metadata for scene in %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

void __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_79_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "Failed to populate metadata for scene in %{public}@: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __105__SLDShareableContentService_fetchAsynchronousLPMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "Failed to fetch asynchronous shareable content for scene in %{public}@: %{public}@");
  OUTLINED_FUNCTION_5();
}

- (void)fetchShareableContentFromBundleIdentifier:(NSObject *)a3 sceneIdentifier:requestedTypeIdentifier:requestedItemProviderIndex:responseHandler:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "visibleApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_199EFF000, a3, OS_LOG_TYPE_ERROR, "Failed to find source application for scene identifier: %@ in visible applications: %@", (uint8_t *)&v6, 0x16u);

}

void __154__SLDShareableContentService_loadRepresentationFromBundleIdentifier_sceneIdentifier_requestedTypeIdentifier_requestedItemProviderIndex_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "Failed to load representation for content in scene %{public}@: %{public}@");
  OUTLINED_FUNCTION_5();
}

- (void)presentMessageComposeSheetForSceneIdentifier:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "visibleApplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, a2, v4, "Failed to find source application in visible applications: %@", (uint8_t *)&v5);

}

void __86__SLDShareableContentService_presentMessageComposeSheetForSceneIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  v3 = 138412290;
  v4 = v0;
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, v1, v2, "Failed to present message compose sheet for sending content attached to scene identifier: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)shareCollaborationData:(uint64_t)a3 faceTimeConversationUUID:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_199EFF000, a1, a3, "Initiating process does not have background collaboration entitlement, so not initiating collaboration", a5, a6, a7, a8, 0);
}

- (void)_applicationIdentifierForConnection:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v7;
  v10 = 2048;
  v11 = a1;
  v12 = 2112;
  v13 = a2;
  _os_log_error_impl(&dword_199EFF000, a3, OS_LOG_TYPE_ERROR, "[%@: %p] Failed to generate a bundle record, or the record's app ID is nil. This is required to look up attribution data. Error: %@", (uint8_t *)&v8, 0x20u);

}

@end

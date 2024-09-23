@implementation SUICApplicationStateHelper

void __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  if (!objc_msgSend(v11, "layoutRole"))
  {
    objc_msgSend(*(id *)(a1 + 32), "displayConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isCarDisplay");

    if (!v7)
      goto LABEL_8;
LABEL_7:
    objc_msgSend(v11, "bundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    goto LABEL_8;
  }
  if (objc_msgSend(v11, "layoutRole") == 1)
    goto LABEL_7;
  if (objc_msgSend(v11, "layoutRole") == 2)
  {
    objc_msgSend(v11, "bundleIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v11, "level");
  }
LABEL_8:

}

void __34__SUICApplicationStateHelper_init__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateForAppInfoDictionaries:displayType:", v3, &unk_1E4A630B8);

}

void __34__SUICApplicationStateHelper_init__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__SUICApplicationStateHelper_init__block_invoke_2;
  v12[3] = &unk_1E4A54D58;
  objc_copyWeak(&v13, v10);
  objc_msgSend(WeakRetained, "_appInfoDictionariesForDisplayLayout:completion:", v8, v12);

  objc_destroyWeak(&v13);
}

- (void)_appInfoDictionariesForDisplayLayout:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SUICApplicationStateHelper *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke;
  block[3] = &unk_1E4A54EC0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __34__SUICApplicationStateHelper_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleApplicationStateUpdate:", v3);

}

- (void)_handleApplicationStateUpdate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICApplicationStateHelper _updateForAppInfoDictionaries:displayType:](self, "_updateForAppInfoDictionaries:displayType:", v6, &unk_1E4A630E8);

  v8 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUICApplicationStateHelper _updateForAppInfoDictionaries:displayType:](self, "_updateForAppInfoDictionaries:displayType:", v7, &unk_1E4A63100);
}

void __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id *v11;
  id *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  NSObject *v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD *v29;
  _QWORD v30[4];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  v36 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(*(id *)(a1 + 32), "elements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_2;
  v25[3] = &unk_1E4A54DF8;
  v27 = &v37;
  v28 = &v31;
  v29 = v30;
  v26 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v25);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_group_create();
  v6 = v5;
  if (v38[5])
  {
    dispatch_group_enter(v5);
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v8 = v38[5];
    v22[0] = v3;
    v22[1] = 3221225472;
    v22[2] = __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_3;
    v22[3] = &unk_1E4A54E20;
    v23 = v4;
    v24 = v6;
    objc_msgSend(v7, "applicationInfoForApplication:completion:", v8, v22);

  }
  v9 = v32[5];
  if (v9)
  {
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v17[0] = v3;
    v17[1] = 3221225472;
    v17[2] = __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_4;
    v17[3] = &unk_1E4A54E70;
    v18 = v6;
    v21 = v30;
    v19 = v4;
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v10, "applicationInfoForApplication:completion:", v9, v17);
    v11 = (id *)&v18;
    v12 = &v19;
    v13 = v20;
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_6;
    v14[3] = &unk_1E4A54E98;
    v11 = &v16;
    v16 = *(id *)(a1 + 48);
    v12 = &v15;
    v15 = v4;
    dispatch_group_notify(v6, v13, v14);
  }

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
}

- (void)_updateForAppInfoDictionaries:(id)a3 displayType:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SUICApplicationStateHelper *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SUICApplicationStateHelper__updateForAppInfoDictionaries_displayType___block_invoke;
  block[3] = &unk_1E4A54DD0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __72__SUICApplicationStateHelper__updateForAppInfoDictionaries_displayType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  id v13;
  void *v14;
  id v15;

  v3 = *MEMORY[0x1E0CFE2A8];
  v4 = a2;
  objc_msgSend(v4, "objectForKey:", v3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFE2C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFE2C0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFE2B0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v9, "BOOLValue");
  v10 = objc_alloc_init(MEMORY[0x1E0CFE7F8]);
  objc_msgSend(v10, "setIdentifier:", v15);
  objc_msgSend(v10, "setPid:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v10);

  if ((v4 & 1) == 0 && (v8 == 32 || v8 == 8))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", v13, *(_QWORD *)(a1 + 40));
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v10);

  }
}

void __72__SUICApplicationStateHelper__updateForAppInfoDictionaries_displayType___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __72__SUICApplicationStateHelper__updateForAppInfoDictionaries_displayType___block_invoke_2;
  v2[3] = &unk_1E4A54DA8;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (SUICApplicationStateHelper)init
{
  SUICApplicationStateHelper *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *foregroundAppInfos;
  BKSApplicationStateMonitor *v5;
  BKSApplicationStateMonitor *appStateMonitor;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  BKSApplicationStateMonitor *v10;
  uint64_t v11;
  void *v12;
  NSObject **v13;
  NSObject *v14;
  uint64_t v15;
  FBSDisplayLayoutMonitor *displayLayoutMonitor;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  FBSDisplayLayoutMonitor *carplayDisplayLayoutMonitor;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *, void *);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)SUICApplicationStateHelper;
  v2 = -[SUICApplicationStateHelper init](&v32, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    foregroundAppInfos = v2->_foregroundAppInfos;
    v2->_foregroundAppInfos = v3;

    v5 = (BKSApplicationStateMonitor *)objc_alloc_init(MEMORY[0x1E0CFE2F0]);
    appStateMonitor = v2->_appStateMonitor;
    v2->_appStateMonitor = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.SUICApplicationStateHelper.queue", v7);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    objc_initWeak(&location, v2);
    v10 = v2->_appStateMonitor;
    v11 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __34__SUICApplicationStateHelper_init__block_invoke;
    v29[3] = &unk_1E4A54D30;
    objc_copyWeak(&v30, &location);
    -[BKSApplicationStateMonitor setHandler:](v10, "setHandler:", v29);
    objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSObject **)MEMORY[0x1E0CFE6A0];
    if (v12)
    {
      v14 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[SUICApplicationStateHelper init]";
        _os_log_impl(&dword_1A3752000, v14, OS_LOG_TYPE_INFO, "%s MainDisplayMonitor configuration is not nil. Proceeding to setup DisplayLayoutMonitor", buf, 0xCu);
      }
      v27[0] = v11;
      v27[1] = 3221225472;
      v27[2] = __34__SUICApplicationStateHelper_init__block_invoke_4;
      v27[3] = &unk_1E4A54D80;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v12, "setTransitionHandler:", v27);
      objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v12);
      v15 = objc_claimAutoreleasedReturnValue();
      displayLayoutMonitor = v2->_displayLayoutMonitor;
      v2->_displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v15;

      objc_destroyWeak(&v28);
    }
    objc_msgSend(MEMORY[0x1E0D230E0], "configurationForCarDisplayMonitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = *v13;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[SUICApplicationStateHelper init]";
        _os_log_impl(&dword_1A3752000, v18, OS_LOG_TYPE_INFO, "%s CarDisplayMonitor configuration is not nil. Proceeding to setup carplayDisplayLayoutMonitor", buf, 0xCu);
      }
      v22 = v11;
      v23 = 3221225472;
      v24 = __34__SUICApplicationStateHelper_init__block_invoke_9;
      v25 = &unk_1E4A54D80;
      objc_copyWeak(&v26, &location);
      objc_msgSend(v17, "setTransitionHandler:", &v22);
      objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v17, v22, v23, v24, v25);
      v19 = objc_claimAutoreleasedReturnValue();
      carplayDisplayLayoutMonitor = v2->_carplayDisplayLayoutMonitor;
      v2->_carplayDisplayLayoutMonitor = (FBSDisplayLayoutMonitor *)v19;

      objc_destroyWeak(&v26);
    }

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__SUICApplicationStateHelper_init__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__SUICApplicationStateHelper_init__block_invoke_2_10;
  v12[3] = &unk_1E4A54D58;
  objc_copyWeak(&v13, v10);
  objc_msgSend(WeakRetained, "_appInfoDictionariesForDisplayLayout:completion:", v8, v12);

  objc_destroyWeak(&v13);
}

void __34__SUICApplicationStateHelper_init__block_invoke_2_10(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateForAppInfoDictionaries:displayType:", v3, &unk_1E4A630D0);

}

- (void)dealloc
{
  FBSDisplayLayoutMonitor *displayLayoutMonitor;
  FBSDisplayLayoutMonitor *carplayDisplayLayoutMonitor;
  objc_super v5;

  -[BKSApplicationStateMonitor invalidate](self->_appStateMonitor, "invalidate");
  displayLayoutMonitor = self->_displayLayoutMonitor;
  if (displayLayoutMonitor)
    -[FBSDisplayLayoutMonitor invalidate](displayLayoutMonitor, "invalidate");
  carplayDisplayLayoutMonitor = self->_carplayDisplayLayoutMonitor;
  if (carplayDisplayLayoutMonitor)
    -[FBSDisplayLayoutMonitor invalidate](carplayDisplayLayoutMonitor, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)SUICApplicationStateHelper;
  -[SUICApplicationStateHelper dealloc](&v5, sel_dealloc);
}

- (id)foregroundAppInfos
{
  return -[SUICApplicationStateHelper _foregroundAppInfosFor:](self, "_foregroundAppInfosFor:", 0);
}

- (id)foregroundAppInfosForCarPlay
{
  return -[SUICApplicationStateHelper _foregroundAppInfosFor:](self, "_foregroundAppInfosFor:", 3);
}

- (id)_foregroundAppInfosFor:(int64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SUICApplicationStateHelper__foregroundAppInfosFor___block_invoke;
  block[3] = &unk_1E4A54C40;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __53__SUICApplicationStateHelper__foregroundAppInfosFor___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)_updateForAppInfoDictionaries:(id)a3
{
  -[SUICApplicationStateHelper _updateForAppInfoDictionaries:displayType:](self, "_updateForAppInfoDictionaries:displayType:", a3, &unk_1E4A630E8);
}

void __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_5;
  v8[3] = &unk_1E4A54E48;
  v6 = *(_QWORD *)(a1 + 56);
  v9 = v3;
  v12 = v6;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_group_notify(v4, v5, v8);

}

uint64_t __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_5(_QWORD *a1)
{
  unint64_t v2;
  void *v3;

  if (a1[4])
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) - 2;
    v3 = (void *)a1[5];
    if (v2 > 0x7FFFFFFFFFFFFFFCLL)
      objc_msgSend(v3, "insertObject:atIndex:");
    else
      objc_msgSend(v3, "addObject:");
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_foregroundAppInfos, 0);
  objc_storeStrong((id *)&self->_carplayDisplayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
}

@end

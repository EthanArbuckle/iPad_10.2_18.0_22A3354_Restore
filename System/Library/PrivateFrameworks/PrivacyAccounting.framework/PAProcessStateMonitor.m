@implementation PAProcessStateMonitor

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_0);
  return (id)sharedInstance_instance_0;
}

void __39__PAProcessStateMonitor_sharedInstance__block_invoke()
{
  PAProcessStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(PAProcessStateMonitor);
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v0;

}

- (id)startMonitoringVisibilityStateForBundleIdentifiers:(id)a3 onQueue:(id)a4 withDelegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    objc_initWeak(&location, v9);
    v10 = (void *)MEMORY[0x1E0D87D90];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__PAProcessStateMonitor_startMonitoringVisibilityStateForBundleIdentifiers_onQueue_withDelegate___block_invoke;
    v13[3] = &unk_1E4FA4D38;
    v14 = v7;
    v15 = v8;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v10, "monitorWithConfiguration:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __97__PAProcessStateMonitor_startMonitoringVisibilityStateForBundleIdentifiers_onQueue_withDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifiers:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v5);

  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("com.apple.frontboard.visibility");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEndowmentNamespaces:", v7);

  objc_msgSend(v3, "setStateDescriptor:", v6);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__PAProcessStateMonitor_startMonitoringVisibilityStateForBundleIdentifiers_onQueue_withDelegate___block_invoke_2;
  v8[3] = &unk_1E4FA4D10;
  v9 = *(id *)(a1 + 40);
  objc_copyWeak(&v10, (id *)(a1 + 48));
  objc_msgSend(v3, "setUpdateHandler:", v8);
  objc_destroyWeak(&v10);

}

void __97__PAProcessStateMonitor_startMonitoringVisibilityStateForBundleIdentifiers_onQueue_withDelegate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16[2];

  v6 = a4;
  objc_msgSend(a3, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endowmentNamespaces");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

    if (v11)
      v12 = 2;
    else
      v12 = 1;
    v13 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__PAProcessStateMonitor_startMonitoringVisibilityStateForBundleIdentifiers_onQueue_withDelegate___block_invoke_3;
    block[3] = &unk_1E4FA4CE8;
    objc_copyWeak(v16, (id *)(a1 + 40));
    v16[1] = (id)v12;
    v15 = v8;
    dispatch_async(v13, block);

    objc_destroyWeak(v16);
  }

}

void __97__PAProcessStateMonitor_startMonitoringVisibilityStateForBundleIdentifiers_onQueue_withDelegate___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setVisibilityState:forBundleID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

@end

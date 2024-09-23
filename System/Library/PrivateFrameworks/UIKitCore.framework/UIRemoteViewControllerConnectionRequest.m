@implementation UIRemoteViewControllerConnectionRequest

void __242___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  _QWORD *WeakRetained;
  void *v5;
  _QWORD *v6;

  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if ((v3 & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v5 = (void *)WeakRetained[16];
      WeakRetained[16] = 0;
      v6 = WeakRetained;

      WeakRetained = v6;
    }

  }
}

uint64_t __242___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelUnconditionallyThen:", a2);
}

uint64_t __242___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectToPlugInKitService");
}

uint64_t __242___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectToViewService");
}

void __242___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[13];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __242___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_6;
  v7[3] = &unk_1E16B1D18;
  v8 = v4;
  v9 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __242___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceErrorDomain"), 1, &unk_1E1A9B6A8);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_cancelWithError:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "whenCompleteDo:", *(_QWORD *)(a1 + 40));

}

void __71___UIRemoteViewControllerConnectionRequest__cancelUnconditionallyThen___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 112))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    *(_BYTE *)(v2 + 112) = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "interface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "interface");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "disconnect");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

    }
    v7 = *(_QWORD **)(a1 + 32);
    v8 = (void *)v7[11];
    if (v8)
    {
      objc_msgSend(v8, "invoke");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v9);

      v7 = *(_QWORD **)(a1 + 32);
    }
    objc_initWeak(&location, v7);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71___UIRemoteViewControllerConnectionRequest__cancelUnconditionallyThen___block_invoke_2;
    v10[3] = &unk_1E16C9110;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v12, &location);
    v11 = *(id *)(a1 + 40);
    +[_UIAsyncInvocationObserver whenInvocationsCompleteForObservers:do:](_UIAsyncInvocationObserver, "whenInvocationsCompleteForObservers:do:", v3, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

void __71___UIRemoteViewControllerConnectionRequest__cancelUnconditionallyThen___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71___UIRemoteViewControllerConnectionRequest__cancelUnconditionallyThen___block_invoke_3;
  v3[3] = &unk_1E16C14D0;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __71___UIRemoteViewControllerConnectionRequest__cancelUnconditionallyThen___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained[2];
  v5 = WeakRetained;
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, WeakRetained[15]);
    WeakRetained = v5;
    v4 = (void *)v5[2];
  }
  else
  {
    v4 = 0;
  }
  WeakRetained[2] = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __115___UIRemoteViewControllerConnectionRequest__connectToDeputyWithInterface_fromExportedHostingObject_successHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(v7 + 8) + 40) + 104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115___UIRemoteViewControllerConnectionRequest__connectToDeputyWithInterface_fromExportedHostingObject_successHandler___block_invoke_2;
  block[3] = &unk_1E16E89A0;
  v13 = v6;
  v17 = v7;
  v14 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v15 = v5;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_sync(v8, block);

}

id __115___UIRemoteViewControllerConnectionRequest__connectToDeputyWithInterface_fromExportedHostingObject_successHandler___block_invoke_2(_QWORD *a1)
{
  unint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1[4])
    return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "_cancelWithError:");
  v3 = _UIInternalPreference_RemoteViewControllerPropagatesUIAppearance_block_invoke___s_category;
  if (!_UIInternalPreference_RemoteViewControllerPropagatesUIAppearance_block_invoke___s_category)
  {
    v3 = __UILogCategoryGetNode("ViewServiceConnectionRequest", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&_UIInternalPreference_RemoteViewControllerPropagatesUIAppearance_block_invoke___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[5];
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Successfully connected to deputy interface %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (id)(*(uint64_t (**)(void))(a1[7] + 16))();
}

void __65___UIRemoteViewControllerConnectionRequest__connectToViewService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(v7 + 8) + 40) + 104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65___UIRemoteViewControllerConnectionRequest__connectToViewService__block_invoke_2;
  block[3] = &unk_1E16C0EA8;
  v13 = v5;
  v14 = v7;
  v12 = v6;
  v9 = v5;
  v10 = v6;
  dispatch_sync(v8, block);

}

id __65___UIRemoteViewControllerConnectionRequest__connectToViewService__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  id *v3;

  v2 = a1[4];
  v3 = *(id **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v2)
    return (id)objc_msgSend(v3, "_cancelWithError:");
  objc_msgSend(v3[12], "setInterface:", a1[5]);
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "_connectToViewControllerOperator");
}

void __70___UIRemoteViewControllerConnectionRequest__connectToPlugInKitService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(v7 + 8) + 40) + 104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70___UIRemoteViewControllerConnectionRequest__connectToPlugInKitService__block_invoke_2;
  block[3] = &unk_1E16C0EA8;
  v13 = v5;
  v14 = v7;
  v12 = v6;
  v9 = v5;
  v10 = v6;
  dispatch_sync(v8, block);

}

id __70___UIRemoteViewControllerConnectionRequest__connectToPlugInKitService__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  id *v3;

  v2 = a1[4];
  v3 = *(id **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v2)
    return (id)objc_msgSend(v3, "_cancelWithError:");
  objc_msgSend(v3[12], "setInterface:", a1[5]);
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "_connectToViewControllerOperator");
}

uint64_t __76___UIRemoteViewControllerConnectionRequest__connectToViewControllerOperator__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 96), "setViewControllerOperatorProxy:", a2);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_sendServiceViewControllerRequest");
}

id __77___UIRemoteViewControllerConnectionRequest__sendServiceViewControllerRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_cancelWithError:", a2);
}

void __77___UIRemoteViewControllerConnectionRequest__sendServiceViewControllerRequest__block_invoke_282(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  v5 = a2;
  v6 = *(_QWORD **)(a1 + 32);
  v16 = v5;
  if (a3)
  {
    v7 = (id)objc_msgSend(v6, "_cancelWithError:", a3);
  }
  else
  {
    v8 = (void *)v6[12];
    objc_msgSend(v5, "serviceWindowHostingHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHostedWindowHostingHandle:", v9);

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    objc_msgSend(v16, "supportedInterfaceOrientations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setServiceViewControllerSupportedInterfaceOrientations:", v11);

    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    objc_msgSend(v16, "accessibilityServerPort");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setServiceAccessibilityServerPortWrapper:", v13);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setPreferredStatusBarStyle:", objc_msgSend(v16, "preferredStatusBarStyle"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setPreferredStatusBarVisibility:", objc_msgSend(v16, "preferredStatusBarVisibility"));
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "__shouldHostRemoteTextEffectsWindow");
    v15 = *(void **)(a1 + 32);
    if (v14)
      objc_msgSend(v15, "_connectToTextEffectsOperator");
    else
      objc_msgSend(v15, "_connectToServiceViewController");
  }

}

uint64_t __73___UIRemoteViewControllerConnectionRequest__connectToTextEffectsOperator__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 96), "setTextEffectsOperatorProxy:", a2);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_sendServiceTextEffectsRequest");
}

id __74___UIRemoteViewControllerConnectionRequest__sendServiceTextEffectsRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_cancelWithError:", a2);
}

uint64_t __74___UIRemoteViewControllerConnectionRequest__sendServiceTextEffectsRequest__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "setTextEffectsWindowHostingHandle:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setTextEffectsWindowAboveStatusBarHostingHandle:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setRemoteKeyboardsWindowHostingHandle:", v8);
  return objc_msgSend(*(id *)(a1 + 32), "_connectToServiceViewController");
}

uint64_t __75___UIRemoteViewControllerConnectionRequest__connectToServiceViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setServiceViewControllerProxy:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_connectToViewControllerControlMessageDeputy");
}

uint64_t __88___UIRemoteViewControllerConnectionRequest__connectToViewControllerControlMessageDeputy__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setServiceViewControllerControlMessageProxy:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishEstablishingConnection");
}

@end

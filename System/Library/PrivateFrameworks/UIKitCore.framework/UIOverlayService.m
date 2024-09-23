@implementation UIOverlayService

void __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "serviceConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = (void *)MEMORY[0x1E0D23018];
      +[_UIOverlayServiceInterfaceSpecification identifier](_UIOverlayServiceInterfaceSpecification, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endpointForMachName:service:instance:", 0x1E1750BC0, v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D23010], "connectionWithEndpoint:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setServiceConnection:", v8);

      objc_msgSend(v3, "serviceConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_initWeak(&location, v3);
        objc_msgSend(v3, "serviceConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_2;
        v14[3] = &unk_1E16EC168;
        objc_copyWeak(&v15, &location);
        v14[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v10, "configureConnection:", v14);

        objc_msgSend(v3, "serviceConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "activate");

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }

    }
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      objc_msgSend(v3, "serviceConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

    }
  }

}

void __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _UIWeakOverlayService *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    +[_UIOverlayServiceInterfaceSpecification interface](_UIOverlayServiceInterfaceSpecification, "interface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInterface:", v5);

    +[_UIOverlayServiceInterfaceSpecification serviceQuality](_UIOverlayServiceInterfaceSpecification, "serviceQuality");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setServiceQuality:", v6);

    v7 = -[_UIWeakOverlayService initWithService:]([_UIWeakOverlayService alloc], "initWithService:", WeakRetained);
    objc_msgSend(v3, "setInterfaceTarget:", v7);

    objc_initWeak(&location, WeakRetained);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_3;
    v8[3] = &unk_1E16EC140;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "setInvalidationHandler:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_initWeak(&location, WeakRetained);
    v5 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_4;
    block[3] = &unk_1E16B3F40;
    objc_copyWeak(&v10, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(WeakRetained, "connectionQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_5;
    v7[3] = &unk_1E16B3F40;
    objc_copyWeak(&v8, &location);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "overlayServiceDidInvalidate:", v3);

    WeakRetained = v3;
  }

}

void __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setServiceConnection:", 0);
    WeakRetained = v2;
  }

}

void __45___UIOverlayService__asyncTargetWithHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D87CD0];
  v4 = a2;
  objc_msgSend(v3, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTargetWithLaunchingAssertionAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39___UIOverlayService_sendOverlayAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performOverlayServerAction:", *(_QWORD *)(a1 + 32));
}

uint64_t __48___UIOverlayService_performOverlayClientAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleClientActionToOverlayService:", *(_QWORD *)(a1 + 40));
}

@end

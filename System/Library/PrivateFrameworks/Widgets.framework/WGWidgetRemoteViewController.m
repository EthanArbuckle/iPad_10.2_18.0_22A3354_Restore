@implementation WGWidgetRemoteViewController

uint64_t __80___WGWidgetRemoteViewController__requestEncodedLayerTreeAtURL_withReplyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64___WGWidgetRemoteViewController__performUpdateWithReplyHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v1, 2, objc_msgSend(WeakRetained, "implementsPerformUpdate"));

}

void __70___WGWidgetRemoteViewController__updateVisibleFrame_withReplyHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "widgetInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(v2, "wantsVisibleFrame"));

}

void __62___WGWidgetRemoteViewController___requestPreferredViewHeight___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  uint64_t v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __62___WGWidgetRemoteViewController___requestPreferredViewHeight___block_invoke_2;
  v2[3] = &unk_24D731D78;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __62___WGWidgetRemoteViewController___requestPreferredViewHeight___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreferredContentSizeWithHeight:", *(double *)(a1 + 40));
}

void __66___WGWidgetRemoteViewController___setLargestAvailableDisplayMode___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66___WGWidgetRemoteViewController___setLargestAvailableDisplayMode___block_invoke_2;
  v4[3] = &unk_24D731D78;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

uint64_t __66___WGWidgetRemoteViewController___setLargestAvailableDisplayMode___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_setLargestAvailableDisplayMode:", *(_QWORD *)(a1 + 40));
  return result;
}

void __93___WGWidgetRemoteViewController___closeTransactionForAppearanceCallWithState_withIdentifier___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __93___WGWidgetRemoteViewController___closeTransactionForAppearanceCallWithState_withIdentifier___block_invoke_2;
  v2[3] = &unk_24D731670;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

void __93___WGWidgetRemoteViewController___closeTransactionForAppearanceCallWithState_withIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_openAppearanceTransactions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3[2](v3);
  }
  else
  {
    v4 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      objc_msgSend(v5, "widgetIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "_containerIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138544130;
      v13 = v7;
      v14 = 2050;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_2172E1000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> No open transaction with identifier '%{public}@'",
        (uint8_t *)&v12,
        0x2Au);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_openAppearanceTransactions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __66___WGWidgetRemoteViewController_viewServiceDidTerminateWithError___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66___WGWidgetRemoteViewController_viewServiceDidTerminateWithError___block_invoke_2;
  block[3] = &unk_24D732EB8;
  v3 = a1[4];
  objc_copyWeak(&v5, a1 + 6);
  v4 = a1[5];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v5);
}

void __66___WGWidgetRemoteViewController_viewServiceDidTerminateWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v2, "widget:didTerminateWithError:", WeakRetained, *(_QWORD *)(a1 + 40));

}

@end

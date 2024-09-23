@implementation DispatchBlockForRequest

void __DispatchBlockForRequest_block_invoke(uint64_t a1)
{
  void *specific;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  specific = dispatch_queue_get_specific(*(dispatch_queue_t *)(a1 + 32), "_WGWidgetViewControllerQueueIsValidTag");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!specific)
  {
    v4 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      objc_msgSend(WeakRetained, "widgetIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_containerIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x219A0A970](*(_QWORD *)(a1 + 56));
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138544642;
      v13 = v6;
      v14 = 2050;
      v15 = WeakRetained;
      v16 = 2114;
      v17 = v7;
      v18 = 2114;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      v22 = 2114;
      v23 = v10;
      _os_log_impl(&dword_2172E1000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Queue is no longer valid (request:%{public}@, queue:%{public}@, "
        "description:%{public}@)",
        (uint8_t *)&v12,
        0x3Eu);

    }
  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, id, _QWORD, BOOL))(v11 + 16))(v11, WeakRetained, *(_QWORD *)(a1 + 48), specific != 0);

}

void __DispatchBlockForRequest_block_invoke_688(uint64_t a1)
{
  dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

@end

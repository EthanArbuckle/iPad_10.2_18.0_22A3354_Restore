@implementation LTDDaemon

void __41___LTDDaemon__setupMemoryWarningListener__block_invoke(uint64_t a1)
{
  dispatch_source_t v2;
  void *v3;
  NSObject *v4;
  _QWORD handler[4];
  id v6;

  v2 = dispatch_source_create(MEMORY[0x24BDAC9F0], 0, 7uLL, MEMORY[0x24BDAC9B8]);
  v3 = (void *)_setupMemoryWarningListener_memoryNotificationSource;
  _setupMemoryWarningListener_memoryNotificationSource = (uint64_t)v2;

  v4 = _setupMemoryWarningListener_memoryNotificationSource;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __41___LTDDaemon__setupMemoryWarningListener__block_invoke_2;
  handler[3] = &unk_251A111A0;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume((dispatch_object_t)_setupMemoryWarningListener_memoryNotificationSource);
  objc_destroyWeak(&v6);
}

void __41___LTDDaemon__setupMemoryWarningListener__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  uintptr_t data;
  NSObject *v3;
  int v5;
  uintptr_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    data = dispatch_source_get_data((dispatch_source_t)_setupMemoryWarningListener_memoryNotificationSource);
    v3 = _LTOSLogXPC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = data;
      _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_DEFAULT, "Memory pressure warning level %lu", (uint8_t *)&v5, 0xCu);
    }
    if (data == 4 || data == 2)
      objc_msgSend(WeakRetained[5], "notifyOfMemoryPressure");
  }

}

void __37___LTDDaemon_clientConnectionClosed___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[4], "removeObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

@end

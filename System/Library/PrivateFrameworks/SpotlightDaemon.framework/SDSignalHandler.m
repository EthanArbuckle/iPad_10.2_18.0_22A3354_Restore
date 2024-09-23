@implementation SDSignalHandler

void __35__SDSignalHandler_addMemoryHandler__block_invoke()
{
  id v0;
  uintptr_t data;
  double v2;
  NSObject *v4;
  int v5;
  uintptr_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (id)_memoryStatusSource;
  objc_sync_enter(v0);
  data = dispatch_source_get_data((dispatch_source_t)_memoryStatusSource);
  v2 = CFAbsoluteTimeGetCurrent() - *(double *)&_block_invoke_lastNotification;
  if (data != _block_invoke_lastStatus || v2 > 30.0)
  {
    logForCSLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = data;
      _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "Memory pressure (%ld)", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend((id)sSignalHandlerDelegate, "didReceiveMemoryPressureNotification:", data);
  }
  _block_invoke_lastStatus = data;
  _block_invoke_lastNotification = CFAbsoluteTimeGetCurrent();
  objc_sync_exit(v0);

}

+ (void)setDelegate:(id)a3 memoryStatusFlags:(unint64_t)a4
{
  objc_storeStrong((id *)&sSignalHandlerDelegate, a3);
  sMemoryStatusFlags = a4;
}

+ (void)setupHandlers
{
  +[SDSignalHandler addSignalHandler](SDSignalHandler, "addSignalHandler");
  +[SDSignalHandler addMemoryHandler](SDSignalHandler, "addMemoryHandler");
}

+ (void)addSignalHandler
{
  __assert_rtn("+[SDSignalHandler addSignalHandler]", "SDSignalHandler.m", 104, "sigSource");
}

uint64_t __35__SDSignalHandler_addSignalHandler__block_invoke()
{
  return signalHandler(2);
}

uint64_t __35__SDSignalHandler_addSignalHandler__block_invoke_2()
{
  return signalHandler(15);
}

uint64_t __35__SDSignalHandler_addSignalHandler__block_invoke_3()
{
  return signalHandler(1);
}

uint64_t __35__SDSignalHandler_addSignalHandler__block_invoke_4()
{
  return signalHandler(30);
}

uint64_t __35__SDSignalHandler_addSignalHandler__block_invoke_5()
{
  return signalHandler(31);
}

+ (void)addMemoryHandler
{
  uintptr_t v2;
  NSObject *v3;
  dispatch_source_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = sMemoryStatusFlags;
  dispatch_get_global_queue(2, 2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_source_create(MEMORY[0x24BDAC9F0], 0, v2, v3);
  v5 = (void *)_memoryStatusSource;
  _memoryStatusSource = (uint64_t)v4;

  if (_memoryStatusSource)
  {
    dispatch_source_set_event_handler((dispatch_source_t)_memoryStatusSource, &__block_literal_global_7_0);
    dispatch_activate((dispatch_object_t)_memoryStatusSource);
  }
  else
  {
    logForCSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEFAULT, "Creating memory pressure handler failed", v7, 2u);
    }

  }
}

@end

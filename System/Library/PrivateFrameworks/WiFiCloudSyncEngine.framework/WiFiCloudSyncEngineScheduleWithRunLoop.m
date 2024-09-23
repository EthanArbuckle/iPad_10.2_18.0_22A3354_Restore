@implementation WiFiCloudSyncEngineScheduleWithRunLoop

uint64_t __WiFiCloudSyncEngineScheduleWithRunLoop_block_invoke(uint64_t a1)
{
  uintptr_t data;
  int *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uintptr_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    data = dispatch_source_get_data(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 224));
    v6 = 136315906;
    v7 = "WiFiCloudSyncEngineScheduleWithRunLoop_block_invoke";
    v8 = 2080;
    v9 = "WiFiCloudSyncEngine.m";
    v10 = 1024;
    v11 = 795;
    v12 = 2048;
    v13 = data;
    LODWORD(v5) = 38;
    v4 = &v6;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "queryKeychainSyncState", v4, v5);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "queryKeychainSyncState");
}

@end

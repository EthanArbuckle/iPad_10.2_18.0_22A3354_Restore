@implementation WiFiCloudSyncEngineProcessCloudChangeEvent

void ____WiFiCloudSyncEngineProcessCloudChangeEvent_block_invoke(uint64_t a1)
{
  char *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  int *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 48))
  {
    v2 = 0;
    v3 = MEMORY[0x24BDACB70];
    do
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v2, v7, v8);
      if (v4)
      {
        v5 = (void *)v4;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136316162;
          v10 = "__WiFiCloudSyncEngineProcessCloudChangeEvent_block_invoke";
          v11 = 2080;
          v12 = "WiFiCloudSyncEngine.m";
          v13 = 1024;
          v14 = 1176;
          v15 = 2048;
          v16 = v2;
          v17 = 2112;
          v18 = v5;
          LODWORD(v8) = 48;
          v7 = &v9;
          _os_log_send_and_compose_impl();
        }
        if (objc_msgSend(*(id *)(a1 + 40), "isKVSEncrypted", v7, v8))
        {
          if (objc_msgSend(v5, "hasPrefix:", CFSTR("network.")))
            goto LABEL_11;
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            v9 = 136315906;
            v10 = "__WiFiCloudSyncEngineProcessCloudChangeEvent_block_invoke";
            v11 = 2080;
            v12 = "WiFiCloudSyncEngine.m";
            v13 = 1024;
            v14 = 1184;
            v15 = 2112;
            v16 = (char *)v5;
            LODWORD(v8) = 38;
            v7 = &v9;
LABEL_14:
            _os_log_send_and_compose_impl();
          }
        }
        else
        {
          v6 = objc_msgSend(v5, "length");
          if (v6 < objc_msgSend(CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_"), "length"))
          {
LABEL_11:
            __WiFiCloudSyncEngineProcessCloudNetworkChangeEvent(*(_QWORD *)(a1 + 56), *(void **)(a1 + 40));
            goto LABEL_15;
          }
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            v9 = 136315906;
            v10 = "__WiFiCloudSyncEngineProcessCloudChangeEvent_block_invoke";
            v11 = 2080;
            v12 = "WiFiCloudSyncEngine.m";
            v13 = 1024;
            v14 = 1193;
            v15 = 2112;
            v16 = (char *)v5;
            LODWORD(v8) = 38;
            v7 = &v9;
            goto LABEL_14;
          }
        }
      }
LABEL_15:
      ++v2;
    }
    while ((unint64_t)v2 < *(_QWORD *)(a1 + 48));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 56) + 280));
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

@end

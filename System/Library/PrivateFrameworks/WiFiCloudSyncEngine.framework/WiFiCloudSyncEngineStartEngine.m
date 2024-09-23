@implementation WiFiCloudSyncEngineStartEngine

uint64_t __WiFiCloudSyncEngineStartEngine_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  __CFRunLoop *v6;
  const void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  void *v12;
  _QWORD v13[5];
  _QWORD block[6];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  if (v2[2] && v2[3])
  {
    v4 = dispatch_semaphore_create(0);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(__CFRunLoop **)(v5 + 16);
    v7 = *(const void **)(v5 + 24);
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __WiFiCloudSyncEngineStartEngine_block_invoke_2;
    block[3] = &unk_24D23E530;
    block[4] = v4;
    block[5] = v5;
    CFRunLoopPerformBlock(v6, v7, block);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(*(_QWORD *)(a1 + 32) + 16));
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v4);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v8 = v2[4];
  if (v8)
  {
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __WiFiCloudSyncEngineStartEngine_block_invoke_3;
    v13[3] = &__block_descriptor_40_e5_v8__0l;
    v13[4] = v2;
    dispatch_sync(v8, v13);
  }
  v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "persistentDomainForName:", CFSTR("com.apple.wifi.network-sync")), "objectForKeyedSubscript:", CFSTR("resetKVS")), "BOOLValue");
  v10 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    objc_msgSend(*(id *)(v10 + 40), "clearKVS");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "clearKVS");
  }
  else
  {
    v12 = *(void **)(v10 + 48);
    objc_msgSend(v12, "pruneKVSStore");
    return objc_msgSend(v12, "synchronizeAndCallMergeNetworks");
  }
}

intptr_t __WiFiCloudSyncEngineStartEngine_block_invoke_2(uint64_t a1)
{
  __WiFiCloudSyncEngineMigrateToEncryptedKVS(*(_QWORD *)(a1 + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __WiFiCloudSyncEngineStartEngine_block_invoke_3(uint64_t a1)
{
  return __WiFiCloudSyncEngineMigrateToEncryptedKVS(*(_QWORD *)(a1 + 32));
}

@end

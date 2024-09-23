@implementation PBBridgeAssetsReachabilityMonitor

void __75__PBBridgeAssetsReachabilityMonitor_checkServerReachabilityWithCompletion___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.ReachabilityResponse", 0);
  v1 = (void *)_responseQueue;
  _responseQueue = (uint64_t)v0;

}

void __75__PBBridgeAssetsReachabilityMonitor_checkServerReachabilityWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  const __CFAllocator *v8;
  id v9;
  SCNetworkReachabilityRef v10;
  SCNetworkReachabilityFlags v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  SCNetworkReachabilityFlags flags;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  SCNetworkReachabilityFlags v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  ASServerURLForAssetType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (v3)
  {
    pbb_setup_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v3;
      v5 = "Asset Server Lookup Failed with Error (%@): Returning Vacuously True";
      v6 = v4;
      v7 = 12;
LABEL_14:
      _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    objc_msgSend(v2, "host");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = SCNetworkReachabilityCreateWithName(v8, (const char *)objc_msgSend(v9, "UTF8String"));

    if (v10)
    {
      flags = 0;
      if (SCNetworkReachabilityGetFlags(v10, &flags))
      {
        v11 = flags & 2;
        pbb_mobileasset_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v2, "host");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v25 = v13;
          v26 = 1024;
          v27 = v11 >> 1;
          _os_log_impl(&dword_2113B6000, v12, OS_LOG_TYPE_DEFAULT, "Network Reachable (%@): %d", buf, 0x12u);

        }
        CFRelease(v10);
        if (v11)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1840]), "initWithURL:cachePolicy:timeoutInterval:", v2, 1, 1.0);
          v15 = (void *)MEMORY[0x24BDD1850];
          objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "sessionWithConfiguration:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x24BDAC760];
          v20[1] = 3221225472;
          v20[2] = __75__PBBridgeAssetsReachabilityMonitor_checkServerReachabilityWithCompletion___block_invoke_179;
          v20[3] = &unk_24CBBE228;
          v21 = *(id *)(a1 + 32);
          objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v14, v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "resume");
          goto LABEL_17;
        }
      }
      else
      {
        CFRelease(v10);
      }
    }
    pbb_mobileasset_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "Network Unreachable: Returning Vacuously True";
      v6 = v4;
      v7 = 2;
      goto LABEL_14;
    }
  }

  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, 1);
LABEL_17:

}

+ (void)checkServerReachabilityWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (checkServerReachabilityWithCompletion__onceToken != -1)
    dispatch_once(&checkServerReachabilityWithCompletion__onceToken, &__block_literal_global_1);
  v4 = _responseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__PBBridgeAssetsReachabilityMonitor_checkServerReachabilityWithCompletion___block_invoke_2;
  block[3] = &unk_24CBBDBA8;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __75__PBBridgeAssetsReachabilityMonitor_checkServerReachabilityWithCompletion___block_invoke_179(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a4 == 0);
  return result;
}

@end

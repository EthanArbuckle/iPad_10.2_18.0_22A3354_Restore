@implementation FBSDisplayConfiguration

id __83__FBSDisplayConfiguration_SSKDisplayMonitorCallbackLogging___flbLoggingDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hardwareIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("hardwareIdentifier"));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("identity"));

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v8, CFSTR("name"));

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "deviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v10, CFSTR("deviceName"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "CADisplay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v11, "appendObject:withName:", v12, CFSTR("CADisplay"));

  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "immutableCADisplay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v14, "appendObject:withName:", v15, CFSTR("immutableCADisplay"));

  v17 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentMode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "appendObject:withName:", v18, CFSTR("currentMode"));

  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v21 = (id)objc_msgSend(v20, "appendRect:withName:", CFSTR("bounds"));
  v22 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pixelSize");
  return (id)objc_msgSend(v22, "appendSize:withName:", CFSTR("pixelSize"));
}

@end

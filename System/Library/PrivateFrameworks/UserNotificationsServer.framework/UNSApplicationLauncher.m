@implementation UNSApplicationLauncher

- (UNSApplicationLauncher)initWithLocationMonitor:(id)a3
{
  id v5;
  UNSApplicationLauncher *v6;
  UNSApplicationLauncher *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *bundleIdentifierToAssertions;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UNSApplicationLauncher;
  v6 = -[UNSApplicationLauncher init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locationMonitor, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    bundleIdentifierToAssertions = v7->_bundleIdentifierToAssertions;
    v7->_bundleIdentifierToAssertions = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.usernotificationsserver.UNSApplicationLauncher", v10);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UNSApplicationLauncher _removeAllProcessAssertionsAndInvalidate:](self, "_removeAllProcessAssertionsAndInvalidate:", 1);
  v3.receiver = self;
  v3.super_class = (Class)UNSApplicationLauncher;
  -[UNSApplicationLauncher dealloc](&v3, sel_dealloc);
}

- (void)foregroundLaunchApplication:(id)a3 withResponse:(id)a4 launchImageName:(id)a5 origin:(id)a6 endpoint:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  UNSApplicationLauncher *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__UNSApplicationLauncher_foregroundLaunchApplication_withResponse_launchImageName_origin_endpoint_completionHandler___block_invoke;
  block[3] = &unk_24D63A798;
  v28 = v15;
  v29 = self;
  v30 = v14;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v14;
  v26 = v15;
  dispatch_async(queue, block);

}

void __117__UNSApplicationLauncher_foregroundLaunchApplication_withResponse_launchImageName_origin_endpoint_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "actionIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_queue_foregroundLaunchOptionsForApplication:withResponse:actionIdentifier:launchImageName:origin:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_queue_foregroundLaunchApplication:withOptions:responseActionIdentifier:endpoint:completionHandler:", *(_QWORD *)(a1 + 48), v2, v3, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

}

- (void)foregroundLaunchOptionsForApplication:(id)a3 withResponse:(id)a4 launchImageName:(id)a5 origin:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  UNSApplicationLauncher *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __124__UNSApplicationLauncher_foregroundLaunchOptionsForApplication_withResponse_launchImageName_origin_queue_completionHandler___block_invoke;
  block[3] = &unk_24D63A798;
  v28 = v15;
  v29 = self;
  v30 = v14;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v14;
  v26 = v15;
  dispatch_async(queue, block);

}

void __124__UNSApplicationLauncher_foregroundLaunchOptionsForApplication_withResponse_launchImageName_origin_queue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "actionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v18 = 0;
  objc_msgSend(v3, "_queue_foregroundLaunchOptionsForApplication:withResponse:actionIdentifier:launchImageName:origin:error:", v5, v4, v2, v6, v7, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __124__UNSApplicationLauncher_foregroundLaunchOptionsForApplication_withResponse_launchImageName_origin_queue_completionHandler___block_invoke_2;
  v14[3] = &unk_24D63A7C0;
  v10 = *(NSObject **)(a1 + 72);
  v11 = *(id *)(a1 + 80);
  v16 = v9;
  v17 = v11;
  v15 = v8;
  v12 = v9;
  v13 = v8;
  dispatch_async(v10, v14);

}

uint64_t __124__UNSApplicationLauncher_foregroundLaunchOptionsForApplication_withResponse_launchImageName_origin_queue_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_queue_foregroundLaunchOptionsForApplication:(id)a3 withResponse:(id)a4 actionIdentifier:(id)a5 launchImageName:(id)a6 origin:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  void *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v32 = a6;
  v17 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v15, "notification");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "request");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "content");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "targetContentIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v38 = v14;
    v39 = 2114;
    v40 = v16;
    _os_log_impl(&dword_216DCB000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launch application in foreground for notification response action %{public}@", buf, 0x16u);
  }
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __130__UNSApplicationLauncher__queue_foregroundLaunchOptionsForApplication_withResponse_actionIdentifier_launchImageName_origin_error___block_invoke;
  v33[3] = &unk_24D63A7E8;
  v23 = v14;
  v34 = v23;
  v24 = v16;
  v35 = v24;
  -[UNSApplicationLauncher _queue_actionForNotificationResponse:bundleIdentifier:withHandler:error:](self, "_queue_actionForNotificationResponse:bundleIdentifier:withHandler:error:", v15, v23, v33, a8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bs_setSafeObject:forKey:", v27, *MEMORY[0x24BE382A0]);

    v28 = v32;
    objc_msgSend(v26, "bs_setSafeObject:forKey:", v32, *MEMORY[0x24BE382C8]);
    objc_msgSend(v26, "bs_setSafeObject:forKey:", v17, *MEMORY[0x24BE382E0]);
    v29 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v26, "bs_setSafeObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE38310]);
    objc_msgSend(v26, "bs_setSafeObject:forKey:", v29, *MEMORY[0x24BE38320]);
    objc_msgSend(v26, "bs_setSafeObject:forKey:", v21, *MEMORY[0x24BEBEC78]);
    objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = 0;
    v28 = v32;
  }

  return v30;
}

void __130__UNSApplicationLauncher__queue_foregroundLaunchOptionsForApplication_withResponse_actionIdentifier_launchImageName_origin_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_216DCB000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application foreground launch action for notification response action %{public}@ recieved action response %{public}@", (uint8_t *)&v7, 0x20u);
  }

}

- (void)_queue_foregroundLaunchApplication:(id)a3 withOptions:(id)a4 responseActionIdentifier:(id)a5 endpoint:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (v12)
  {
    if (v14)
      objc_msgSend(MEMORY[0x24BE38490], "serviceWithEndpoint:", v14);
    else
      objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __125__UNSApplicationLauncher__queue_foregroundLaunchApplication_withOptions_responseActionIdentifier_endpoint_completionHandler___block_invoke;
    v18[3] = &unk_24D63A810;
    v19 = v11;
    v20 = v13;
    v21 = v16;
    objc_msgSend(v17, "openApplication:withOptions:completion:", v19, v12, v18);

  }
  else if (v15)
  {
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

}

void __125__UNSApplicationLauncher__queue_foregroundLaunchApplication_withOptions_responseActionIdentifier_endpoint_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x24BDF8970];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_ERROR))
      __125__UNSApplicationLauncher__queue_foregroundLaunchApplication_withOptions_responseActionIdentifier_endpoint_completionHandler___block_invoke_cold_1();
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[4];
    v9 = a1[5];
    v11 = 138543874;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = 0;
    _os_log_impl(&dword_216DCB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Foreground application launch succeeed for action response %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  v10 = a1[6];
  if (v10)
    (*(void (**)(uint64_t, BOOL))(v10 + 16))(v10, v6 == 0);

}

- (void)backgroundLaunchApplication:(id)a3 withResponse:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_216DCB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] backgroundLaunchApplication: response: %@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __85__UNSApplicationLauncher_backgroundLaunchApplication_withResponse_completionHandler___block_invoke;
  v16[3] = &unk_24D63A748;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(queue, v16);

}

uint64_t __85__UNSApplicationLauncher_backgroundLaunchApplication_withResponse_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_acquireActivityKitAssertionIfNeededForBundleIdentifier:withResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_backgroundLaunchApplication:withResponse:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_queue_acquireActivityKitAssertionIfNeededForBundleIdentifier:(id)a3 withResponse:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject **v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "actionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDF8A70]);

  if ((v8 & 1) == 0)
  {
    v9 = (NSObject **)MEMORY[0x24BDF8970];
    v10 = (void *)*MEMORY[0x24BDF8970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(v6, "actionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v5;
      v27 = 2114;
      v28 = v12;
      _os_log_impl(&dword_216DCB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting to acquire live activity assertion for notification response with action identifier %{public}@.", (uint8_t *)&v25, 0x16u);

    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE85490]), "initWithBundleIdentifier:", v5);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE85488]), "initWithExplanation:target:invalidationHandler:", CFSTR("Background Launch App To Launch Live Activity from Notification"), v13, 0);
    v15 = objc_msgSend(v14, "state");
    v16 = *v9;
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15 == 1)
    {
      if (v17)
      {
        v18 = v16;
        objc_msgSend(v6, "actionIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v14, "state");
        v21 = objc_msgSend(v14, "invalidationReason");
        v25 = 138544130;
        v26 = v5;
        v27 = 2114;
        v28 = v19;
        v29 = 2050;
        v30 = v20;
        v31 = 2050;
        v32 = v21;
        v22 = "[%{public}@] Successfully to acquired live activity assertion for notification response with action identi"
              "fier %{public}@. SNAAssertionState=%{public}lu SNAInvalidationReason=%{public}lu";
        v23 = v18;
        v24 = 42;
LABEL_9:
        _os_log_impl(&dword_216DCB000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, v24);

      }
    }
    else if (v17)
    {
      v18 = v16;
      objc_msgSend(v6, "actionIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v5;
      v27 = 2114;
      v28 = v19;
      v22 = "[%{public}@] Failed to acquire live activity assertion for notification response with action identifier %{public}@.";
      v23 = v18;
      v24 = 22;
      goto LABEL_9;
    }

  }
}

- (void)_queue_backgroundLaunchApplication:(id)a3 withResponse:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  os_log_t *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _BYTE *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _BYTE *v35;
  id v36;
  id location;
  void *v38;
  uint8_t v39[4];
  id v40;
  __int16 v41;
  void *v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v26 = a5;
  objc_msgSend(v9, "actionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (os_log_t *)MEMORY[0x24BDF8970];
  v12 = *MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_216DCB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launch application in background for notification response %{public}@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v44 = __Block_byref_object_copy__3;
  v45 = __Block_byref_object_dispose__3;
  v46 = 0;
  objc_initWeak(&location, self);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke;
  v32[3] = &unk_24D63A860;
  v32[4] = self;
  v13 = v8;
  v33 = v13;
  v14 = v10;
  v34 = v14;
  v25 = &v36;
  objc_copyWeak(&v36, &location);
  v35 = buf;
  -[UNSApplicationLauncher _queue_actionForNotificationResponse:bundleIdentifier:withHandler:](self, "_queue_actionForNotificationResponse:bundleIdentifier:withHandler:", v9, v13, v32);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v39 = 138543618;
    v40 = v13;
    v41 = 2112;
    v42 = v15;
    _os_log_impl(&dword_216DCB000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launch application in background for notification response: %@", v39, 0x16u);
  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", &v36);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bs_setSafeObject:forKey:", v18, *MEMORY[0x24BE382A0]);

    objc_msgSend(v17, "bs_setSafeObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE382B8]);
    objc_msgSend(v9, "notification");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "request");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "content");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "targetContentIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "bs_setSafeObject:forKey:", v22, *MEMORY[0x24BEBEC78]);
    objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_12;
    v27[3] = &unk_24D63A8B0;
    v27[4] = self;
    v28 = v13;
    v29 = v14;
    v31 = buf;
    v30 = v26;
    objc_msgSend(v24, "openApplication:withOptions:completion:", v28, v23, v27);

  }
  else if (v26)
  {
    (*((void (**)(id, _QWORD))v26 + 2))(v26, 0);
  }

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

void __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_2;
  block[3] = &unk_24D63A838;
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v6 = v3;
  objc_copyWeak(&v12, (id *)(a1 + 64));
  v11 = *(_QWORD *)(a1 + 56);
  dispatch_async(v5, block);
  objc_destroyWeak(&v12);

}

void __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138543874;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_216DCB000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application background launch action for notification response action %{public}@ recieved action response %{public}@", (uint8_t *)&v7, 0x20u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_queue_removeProcessAssertion:forBundleID:invalidate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 32), 1);

}

void __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  __int128 v21;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_2_13;
  block[3] = &unk_24D63A888;
  v16 = v6;
  v17 = v7;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v18 = v9;
  v19 = v10;
  v20 = v5;
  v14 = *(_OWORD *)(a1 + 56);
  v11 = (id)v14;
  v21 = v14;
  v12 = v5;
  v13 = v6;
  dispatch_async(v8, block);

}

uint64_t __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_2_13(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t result;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *MEMORY[0x24BDF8970];
  v4 = *MEMORY[0x24BDF8970];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_2_13_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v18 = v5;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Background application launch succeeded for action response %{public}@", buf, 0x16u);
    }
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 56);
    v9 = objc_msgSend(*(id *)(a1 + 64), "pid");
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_16;
    v14[3] = &unk_24D639C20;
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v8, "_queue_newProcessAssertionForBundleID:PID:flags:reason:name:watchdogInterval:acquisitionHandler:invalidationHandler:", v7, v9, 33, 10007, CFSTR("background notification action"), 0, 0.0, v14);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend(*(id *)(a1 + 56), "_queue_removeProcessAssertionsHavingReason:forBundleID:invalidate:", 10007, *(_QWORD *)(a1 + 40), 1);
    objc_msgSend(*(id *)(a1 + 56), "_queue_addProcessAssertion:forBundleID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 40));

  }
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 0);
  return result;
}

void __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_216DCB000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Assertion acquired for application background launch action for notification response action %{public}@ was invalidated", (uint8_t *)&v5, 0x16u);
  }
}

- (id)_queue_actionForNotificationResponse:(id)a3 bundleIdentifier:(id)a4 withHandler:(id)a5
{
  return -[UNSApplicationLauncher _queue_actionForNotificationResponse:bundleIdentifier:withHandler:error:](self, "_queue_actionForNotificationResponse:bundleIdentifier:withHandler:error:", a3, a4, a5, 0);
}

- (id)_queue_actionForNotificationResponse:(id)a3 bundleIdentifier:(id)a4 withHandler:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  id v17;
  void *v18;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  UNSApplicationLauncher *v26;
  id v27;
  char v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "notification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trigger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0
    && (-[UNCLocationMonitor isBundleIdentifierAuthorizedForRegionMonitoring:](self->_locationMonitor, "isBundleIdentifierAuthorizedForRegionMonitoring:", v11) & 1) == 0)
  {
    v20 = (void *)*MEMORY[0x24BDF8970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      objc_msgSend(v10, "actionIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v11;
      v31 = 2114;
      v32 = v22;
      _os_log_impl(&dword_216DCB000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Suppressing response action %{public}@ because app does not have location authorization.", buf, 0x16u);

    }
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 1, 0);
      v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x24BDF6C18]);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __98__UNSApplicationLauncher__queue_actionForNotificationResponse_bundleIdentifier_withHandler_error___block_invoke;
    v23[3] = &unk_24D63A8D8;
    v24 = v11;
    v28 = isKindOfClass & 1;
    v25 = v10;
    v26 = self;
    v27 = v12;
    v18 = (void *)objc_msgSend(v17, "initWithResponse:withHandler:", v25, v23);

  }
  return v18;
}

void __98__UNSApplicationLauncher__queue_actionForNotificationResponse_bundleIdentifier_withHandler_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)*MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v7 = v4;
    objc_msgSend(v5, "actionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_216DCB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] UINotificationResponseAction %{public}@ withHandler called", (uint8_t *)&v10, 0x16u);

  }
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "markAsHavingReceivedLocation");
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

- (void)willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __92__UNSApplicationLauncher_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_24D63A748;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __92__UNSApplicationLauncher_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_willPresentNotification:forBundleIdentifier:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_queue_willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD *v34;
  _BYTE *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  _BYTE *v41;
  id v42;
  id location;
  _QWORD v44[3];
  char v45;
  void *v46;
  _BYTE buf[24];
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29 = v8;
  objc_msgSend(v8, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trigger");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNCLocationMonitor markAsHavingReceivedLocation](self->_locationMonitor, "markAsHavingReceivedLocation");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v30, "isContentAvailable") ^ 1;
      goto LABEL_6;
    }
  }
  v12 = 1;
LABEL_6:
  v13 = (void *)*MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    objc_msgSend(v11, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "un_logDigest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v16;
    _os_log_impl(&dword_216DCB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Send willPresentNotification for notification %{public}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v48 = __Block_byref_object_copy__3;
  v49 = __Block_byref_object_dispose__3;
  v50 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = 0;
  objc_initWeak(&location, self);
  v17 = objc_alloc(MEMORY[0x24BDF6FE8]);
  v18 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke;
  v36[3] = &unk_24D63A928;
  v36[4] = self;
  v19 = v9;
  v37 = v19;
  v20 = v11;
  v38 = v20;
  v40 = v44;
  v41 = buf;
  objc_copyWeak(&v42, &location);
  v21 = v10;
  v39 = v21;
  v22 = (void *)objc_msgSend(v17, "initWithNotification:deliverable:timeout:withHandler:", v29, v12, v36, 30.0);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bs_setSafeObject:forKey:", v24, *MEMORY[0x24BE382A0]);

  objc_msgSend(v23, "bs_setSafeObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE382B8]);
  objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_23;
  v31[3] = &unk_24D63A978;
  v31[4] = self;
  v27 = v19;
  v32 = v27;
  v28 = v20;
  v33 = v28;
  v34 = v44;
  v35 = buf;
  objc_msgSend(v26, "openApplication:withOptions:completion:", v27, v25, v31);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(buf, 8);

}

void __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  block[3] = &unk_24D63A900;
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v12 = *(_OWORD *)(a1 + 64);
  v6 = v3;
  objc_copyWeak(&v13, (id *)(a1 + 80));
  v11 = *(id *)(a1 + 56);
  dispatch_async(v5, block);

  objc_destroyWeak(&v13);
}

void __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  UNSafeCast();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "options");
  v4 = (void *)*MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v7 = v4;
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v6;
    v14 = 2048;
    v15 = v3;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_216DCB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received response %ld for willPresentNotification for notification %{public}@", (uint8_t *)&v12, 0x20u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(WeakRetained, "_queue_removeProcessAssertion:forBundleID:invalidate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 40), 1);

  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v11 + 16))(v11, v3, 0);

}

void __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  __int128 v19;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_2_24;
  block[3] = &unk_24D63A950;
  v14 = v6;
  v15 = v7;
  v9 = *(id *)(a1 + 48);
  v19 = *(_OWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = v10;
  v18 = v5;
  v11 = v5;
  v12 = v6;
  dispatch_async(v8, block);

}

void __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_2_24(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  os_log_t *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  os_log_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (uint64_t *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 32);
  v4 = (os_log_t *)MEMORY[0x24BDF8970];
  v5 = (void *)*MEMORY[0x24BDF8970];
  v6 = *MEMORY[0x24BDF8970];
  if (v2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_2_24_cold_1(a1, v5, v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(a1 + 48);
      v9 = v5;
      objc_msgSend(v7, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v8;
      v29 = 2114;
      v30 = v11;
      _os_log_impl(&dword_216DCB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] willPresentNotification delivery succeeded for notification %{public}@", buf, 0x16u);

    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v12 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 40);
        v13 = *(void **)(a1 + 48);
        v15 = v12;
        objc_msgSend(v13, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "un_logDigest");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v14;
        v29 = 2114;
        v30 = v17;
        _os_log_impl(&dword_216DCB000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Already received response; not acquiring assertion for willPresentNotification for notification %{public}@",
          buf,
          0x16u);

      }
    }
    else
    {
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(void **)(a1 + 56);
      v20 = objc_msgSend(*(id *)(a1 + 64), "pid");
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_27;
      v24[3] = &unk_24D639C20;
      v25 = *(id *)(a1 + 40);
      v26 = *(id *)(a1 + 48);
      objc_msgSend(v19, "_queue_newProcessAssertionForBundleID:PID:flags:reason:name:watchdogInterval:acquisitionHandler:invalidationHandler:", v18, v20, 33, 10007, CFSTR("will present notification"), 0, 0.0, v24);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      objc_msgSend(*(id *)(a1 + 56), "_queue_removeProcessAssertionsHavingReason:forBundleID:invalidate:", 10007, *(_QWORD *)(a1 + 40), 1);
      objc_msgSend(*(id *)(a1 + 56), "_queue_addProcessAssertion:forBundleID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 40));

    }
  }
}

void __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_27(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "un_logDigest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Assertion acquired for willPresentNotification for notification %{public}@ was invalidated", (uint8_t *)&v8, 0x16u);

  }
}

- (id)_queue_newProcessAssertionForBundleID:(id)a3 PID:(int)a4 flags:(unsigned int)a5 reason:(unsigned int)a6 name:(id)a7 watchdogInterval:(double)a8 acquisitionHandler:(id)a9 invalidationHandler:(id)a10
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  dispatch_source_t v27;
  void *v28;
  NSObject *v29;
  dispatch_time_t v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  id v35;
  id v36;
  id v37;
  _QWORD handler[4];
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t *v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  id v49;
  _QWORD *v50;
  uint64_t *v51;
  uint64_t *v52;
  id v53;
  id v54;
  _QWORD v55[6];
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  id *v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  id from;
  id location;
  uint8_t buf[4];
  id v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v13 = *(_QWORD *)&a6;
  v14 = *(_QWORD *)&a5;
  v15 = *(_QWORD *)&a4;
  v81 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a7;
  v19 = a9;
  v20 = a10;
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_queue);
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__3;
  v73 = __Block_byref_object_dispose__3;
  v74 = 0;
  v63 = 0;
  v64 = (id *)&v63;
  v65 = 0x3042000000;
  v66 = __Block_byref_object_copy__28;
  v67 = __Block_byref_object_dispose__29;
  v68 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__3;
  v61 = __Block_byref_object_dispose__3;
  v62 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3810000000;
  v55[3] = "";
  v56 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[2] = __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke;
  aBlock[3] = &unk_24D63A9C8;
  v50 = v55;
  aBlock[1] = 3221225472;
  objc_copyWeak(&v53, &from);
  v37 = v17;
  v47 = v37;
  v21 = v18;
  v48 = v21;
  v51 = &v63;
  objc_copyWeak(&v54, &location);
  v52 = &v57;
  v36 = v20;
  v49 = v36;
  v22 = _Block_copy(aBlock);
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke_30;
  v42[3] = &unk_24D63A9F0;
  v35 = v19;
  v43 = v35;
  v23 = v22;
  v44 = v23;
  v45 = &v57;
  v24 = _Block_copy(v42);
  v25 = objc_msgSend(objc_alloc(MEMORY[0x24BE0B6E0]), "initWithPID:flags:reason:name:withHandler:", v15, v14, v13, v21, v24);
  v26 = (void *)v70[5];
  v70[5] = v25;

  objc_msgSend((id)v70[5], "setInvalidationHandler:", v23);
  objc_storeWeak(v64 + 5, (id)v70[5]);
  if (a8 > 0.0)
  {
    v27 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
    v28 = (void *)v58[5];
    v58[5] = (uint64_t)v27;

    v29 = v58[5];
    v30 = dispatch_time(0, (uint64_t)(a8 * 1000000000.0));
    dispatch_source_set_timer(v29, v30, 0, 0);
    v31 = v58[5];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke_2_33;
    handler[3] = &unk_24D63AA18;
    v40 = &v57;
    v41 = &v69;
    v39 = v23;
    dispatch_source_set_event_handler(v31, handler);

  }
  v32 = *MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v78 = v37;
    v79 = 2114;
    v80 = v21;
    _os_log_impl(&dword_216DCB000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Created process assertion for %{public}@ ", buf, 0x16u);
  }
  v33 = (id)v70[5];

  objc_destroyWeak(&v54);
  objc_destroyWeak(&v53);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  objc_destroyWeak(&v68);
  _Block_object_dispose(&v69, 8);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v33;
}

void __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  NSObject *WeakRetained;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if ((v3 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke_2;
    v7[3] = &unk_24D63A9A0;
    v8 = *(id *)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 64);
    v9 = v5;
    v11 = v6;
    objc_copyWeak(&v13, (id *)(a1 + 88));
    v12 = *(_QWORD *)(a1 + 72);
    v10 = *(id *)(a1 + 48);
    dispatch_async(WeakRetained, v7);

    objc_destroyWeak(&v13);
  }
}

void __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDF8970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v11 = 138543618;
    v12 = v3;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_216DCB000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidated process assertion for %{public}@", (uint8_t *)&v11, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v6, "_queue_removeProcessAssertion:forBundleID:invalidate:", WeakRetained, *(_QWORD *)(a1 + 32), 0);

  }
  v7 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v7)
  {
    dispatch_source_cancel(v7);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

void __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke_30(_QWORD *a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v4 = a1[4];
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  if ((v2 & 1) != 0)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v5)
      dispatch_resume(v5);
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

uint64_t __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke_2_33(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1[5] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "invalidate");
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

- (void)_queue_addProcessAssertion:(id)a3 forBundleID:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToAssertions, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_bundleIdentifierToAssertions, "setObject:forKey:", v7, v6);
    }
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (void)_queue_removeProcessAssertion:(id)a3 forBundleID:(id)a4 invalidate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToAssertions, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "containsObject:", v8))
    {
      v12 = (void *)*MEMORY[0x24BDF8970];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8970], OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        objc_msgSend(v8, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v10;
        v17 = 2114;
        v18 = v14;
        _os_log_impl(&dword_216DCB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing process assertion for %{public}@", (uint8_t *)&v15, 0x16u);

      }
      objc_msgSend(v11, "removeObject:", v8);
      if (!objc_msgSend(v11, "count"))
        -[NSMutableDictionary removeObjectForKey:](self->_bundleIdentifierToAssertions, "removeObjectForKey:", v10);
      if (v5)
        objc_msgSend(v8, "invalidate");
    }

  }
}

- (void)_queue_removeProcessAssertionsHavingReason:(unsigned int)a3 forBundleID:(id)a4 invalidate:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *bundleIdentifierToAssertions;
  void *v13;
  id v14;
  _QWORD v15[4];
  unsigned int v16;
  BOOL v17;

  v8 = a4;
  if (v8)
  {
    v14 = v8;
    -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToAssertions, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __92__UNSApplicationLauncher__queue_removeProcessAssertionsHavingReason_forBundleID_invalidate___block_invoke;
    v15[3] = &__block_descriptor_37_e29__16__0__BKSProcessAssertion_8l;
    v16 = a3;
    v17 = a5;
    objc_msgSend(v9, "bs_mapNoNulls:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    bundleIdentifierToAssertions = self->_bundleIdentifierToAssertions;
    if (v11)
    {
      v13 = (void *)objc_msgSend(v10, "mutableCopy");
      -[NSMutableDictionary setObject:forKey:](bundleIdentifierToAssertions, "setObject:forKey:", v13, v14);

    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](bundleIdentifierToAssertions, "removeObjectForKey:", v14);
    }

    v8 = v14;
  }

}

id __92__UNSApplicationLauncher__queue_removeProcessAssertionsHavingReason_forBundleID_invalidate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (objc_msgSend(v3, "reason") == *(_DWORD *)(a1 + 32))
  {
    if (*(_BYTE *)(a1 + 36))
      objc_msgSend(v3, "invalidate");
    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (void)_removeAllProcessAssertionsAndInvalidate:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__UNSApplicationLauncher__removeAllProcessAssertionsAndInvalidate___block_invoke;
  v4[3] = &unk_24D63AA60;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __67__UNSApplicationLauncher__removeAllProcessAssertionsAndInvalidate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllProcessAssertionsAndInvalidate:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_queue_removeAllProcessAssertionsAndInvalidate:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSMutableDictionary allValues](self->_bundleIdentifierToAssertions, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v16;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v16 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "invalidate");
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v6);
    }

  }
  -[NSMutableDictionary removeAllObjects](self->_bundleIdentifierToAssertions, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToAssertions, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
}

void __125__UNSApplicationLauncher__queue_foregroundLaunchApplication_withOptions_responseActionIdentifier_endpoint_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[24];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_5();
  v3 = v0;
  OUTLINED_FUNCTION_0_1(&dword_216DCB000, v1, (uint64_t)v1, "[%{public}@] Foreground application launch failed for action response %{public}@: %{public}@", v2);
}

void __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_2_13_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[24];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_5();
  v3 = v0;
  OUTLINED_FUNCTION_0_1(&dword_216DCB000, v1, (uint64_t)v1, "[%{public}@] Background application launch failed for action response %{public}@: %{public}@", v2);
}

void __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_2_24_cold_1(uint64_t a1, void *a2, uint64_t *a3)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = a2;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "un_logDigest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *a3;
  v11 = 138543874;
  v12 = v5;
  v13 = 2114;
  v14 = v8;
  v15 = 2114;
  v16 = v9;
  OUTLINED_FUNCTION_0_1(&dword_216DCB000, v6, v10, "[%{public}@] willPresentNotification delivery failed for notification %{public}@: %{public}@", (uint8_t *)&v11);

}

@end

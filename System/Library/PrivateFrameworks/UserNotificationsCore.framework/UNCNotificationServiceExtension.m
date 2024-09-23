@implementation UNCNotificationServiceExtension

+ (id)_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter
{
  if (_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter_onceToken != -1)
    dispatch_once(&_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter_onceToken, &__block_literal_global_19);
  return (id)_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter_instance;
}

void __98__UNCNotificationServiceExtension__extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14E0], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter_instance;
  _extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter_instance = v0;

}

+ (id)_extensionIdentifiersToPerExtensionQueues
{
  if (_extensionIdentifiersToPerExtensionQueues_onceToken[0] != -1)
    dispatch_once(_extensionIdentifiersToPerExtensionQueues_onceToken, &__block_literal_global_2_0);
  return (id)_extensionIdentifiersToPerExtensionQueues_instance;
}

void __76__UNCNotificationServiceExtension__extensionIdentifiersToPerExtensionQueues__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionIdentifiersToPerExtensionQueues_instance;
  _extensionIdentifiersToPerExtensionQueues_instance = v0;

}

+ (BOOL)isAccessToNotificationCenterAllowedForServiceExtensionWithIdentifier:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(a1, "_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  v6 = objc_msgSend(v5, "countForObject:", v4) != 0;
  objc_sync_exit(v5);

  return v6;
}

+ (void)_allowAccessToNotificationCenterForServiceExtensionWithIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  objc_msgSend(v5, "addObject:", v4);
  v6 = (id)*MEMORY[0x24BDF89F0];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = v4;
    v9 = 2048;
    v10 = objc_msgSend(v5, "countForObject:", v4);
    _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Incremented notification center access to service extension: %ld", (uint8_t *)&v7, 0x16u);
  }

  objc_sync_exit(v5);
}

+ (void)_disallowAccessToNotificationCenterForServiceExtensionWithIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  objc_msgSend(v5, "removeObject:", v4);
  v6 = (id)*MEMORY[0x24BDF89F0];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = v4;
    v9 = 2048;
    v10 = objc_msgSend(v5, "countForObject:", v4);
    _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Decremented notification center access to service extension: %ld", (uint8_t *)&v7, 0x16u);
  }

  objc_sync_exit(v5);
}

- (id)_initWithExtension:(id)a3 serviceTime:(double)a4 graceTime:(double)a5
{
  id v9;
  UNCNotificationServiceExtension *v10;
  double *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNCNotificationServiceExtension;
  v10 = -[UNCNotificationServiceExtension init](&v13, sel_init);
  v11 = (double *)v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_extension, a3);
    v11[4] = a4;
    v11[5] = a5;
  }

  return v11;
}

- (double)serviceTime
{
  return self->_serviceTime;
}

- (LSPlugInKitProxy)proxy
{
  void *v2;
  void *v3;

  -[NSExtension identifier](self->_extension, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1588], "pluginKitProxyForIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (LSPlugInKitProxy *)v3;
}

- (OS_dispatch_queue)queue
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  const char *v6;
  NSObject *v7;

  -[NSExtension identifier](self->_extension, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_extensionIdentifiersToPerExtensionQueues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.usernotifications.serviceextension.%@"), v2);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create(v6, v7);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v2);
  }
  objc_sync_exit(v3);

  return (OS_dispatch_queue *)v4;
}

- (id)mutateContentForNotificationRequest:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  double serviceTime;
  id v9;
  double v10;
  double v11;
  NSExtension *extension;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  NSExtensionContext *v19;
  NSExtensionContext *hostContext;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  id v30;
  double v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  UNNotificationContent *v39;
  void *v41;
  id v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD *v48;
  _QWORD v49[5];
  id v50;
  id v51;
  _QWORD *v52;
  uint64_t *v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  _QWORD *v59;
  _QWORD v60[6];
  char v61;
  id obj;
  _QWORD v63[4];
  id v64;
  UNCNotificationServiceExtension *v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  uint8_t buf[4];
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v66 = 0;
  v67[0] = &v66;
  v67[1] = 0x3032000000;
  v67[2] = __Block_byref_object_copy__11;
  v67[3] = __Block_byref_object_dispose__11;
  v68 = 0;
  -[NSExtension identifier](self->_extension, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BD78]), "initWithIdentifier:", CFSTR("com.apple.usernotifications.serviceextension.startuptimer"));
  serviceTime = self->_serviceTime;
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke;
  v63[3] = &unk_251AE10D8;
  v9 = v5;
  v64 = v9;
  v65 = self;
  objc_msgSend(v7, "scheduleWithFireInterval:leewayInterval:queue:handler:", v6, v63, serviceTime, 0.0);
  v44 = (void *)v6;
  BSAbsoluteMachTimeNow();
  v11 = v10;
  extension = self->_extension;
  v13 = v67[0];
  obj = *(id *)(v67[0] + 40);
  -[NSExtension beginExtensionRequestWithOptions:inputItems:error:](extension, "beginExtensionRequestWithOptions:inputItems:error:", 1, 0, &obj);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v13 + 40), obj);
  objc_msgSend(v7, "invalidate");

  v15 = objc_opt_class();
  v16 = v14;
  if (v15)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  -[NSExtension _extensionContextForUUID:](self->_extension, "_extensionContextForUUID:", v18);
  v19 = (NSExtensionContext *)objc_claimAutoreleasedReturnValue();
  hostContext = self->_hostContext;
  self->_hostContext = v19;

  if (self->_hostContext)
  {
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x3810000000;
    v60[3] = &unk_249B4B2D2;
    v61 = 0;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BD78]), "initWithIdentifier:", CFSTR("com.apple.usernotifications.serviceextension.errorwatchdogtimer"));
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BD78]), "initWithIdentifier:", CFSTR("com.apple.usernotifications.serviceextension.gracewatchdogtimer"));
    if (-[NSExtension uns_isExtensionSessionBeingDebugged:](self->_extension, "uns_isExtensionSessionBeingDebugged:", v18))
    {
      v22 = *MEMORY[0x24BDF89F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v70 = v9;
        v71 = 2114;
        v72 = v18;
        _os_log_impl(&dword_2499A5000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Extension is being debugged, will skip scheduling timers: sessionUUID=%{public}@", buf, 0x16u);
      }
      v23 = v21;
    }
    else
    {
      BSAbsoluteMachTimeNow();
      v26 = v25;
      v27 = self->_serviceTime;
      objc_msgSend(v21, "invalidate");
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BD78]), "initWithIdentifier:", CFSTR("com.apple.usernotifications.serviceextension.startuperrortimer"));

      v56[0] = MEMORY[0x24BDAC760];
      v56[1] = 3221225472;
      v28 = fmax(v27 - (v26 - v11), 0.0);
      v56[2] = __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_19;
      v56[3] = &unk_251AE1100;
      v59 = v60;
      v56[4] = self;
      v29 = v9;
      v57 = v29;
      v30 = v18;
      v58 = v30;
      objc_msgSend(v23, "scheduleWithFireInterval:leewayInterval:queue:handler:", v44, v56, v28, 0.0);
      v31 = fmax(v28 - self->_graceTime, 0.0);
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_20;
      v54[3] = &unk_251AE10D8;
      v54[4] = self;
      v32 = v30;
      v55 = v32;
      objc_msgSend(v41, "scheduleWithFireInterval:leewayInterval:queue:handler:", v44, v54, v31, 0.0);
      v33 = *MEMORY[0x24BDF89F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v70 = v29;
        v71 = 2114;
        v72 = v32;
        v73 = 2048;
        v74 = v28;
        v75 = 2048;
        v76 = v31;
        _os_log_impl(&dword_2499A5000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Extension started, scheduled timers: sessionUUID=%{public}@, serviceTime=%lf, graceTime=%lf", buf, 0x2Au);
      }

    }
    objc_msgSend((id)objc_opt_class(), "_allowAccessToNotificationCenterForServiceExtensionWithIdentifier:", v9);
    -[NSExtensionContext _auxiliaryConnection](self->_hostContext, "_auxiliaryConnection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_21;
    v49[3] = &unk_251AE1128;
    v49[4] = self;
    v35 = v9;
    v50 = v35;
    v52 = v60;
    v53 = &v66;
    v36 = v18;
    v51 = v36;
    objc_msgSend(v34, "synchronousRemoteObjectProxyWithErrorHandler:", v49);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_23;
    v45[3] = &unk_251AE1150;
    v45[4] = self;
    v46 = v35;
    v48 = v60;
    v47 = v36;
    objc_msgSend(v37, "didReceiveNotificationRequest:withCompletionHandler:", v43, v45);

    objc_msgSend(v23, "invalidate");
    objc_msgSend(v41, "invalidate");

    _Block_object_dispose(v60, 8);
  }
  else
  {
    v24 = *MEMORY[0x24BDF89F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F0], OS_LOG_TYPE_ERROR))
      -[UNCNotificationServiceExtension mutateContentForNotificationRequest:error:].cold.1((uint64_t)v9, (uint64_t)v67, v24);
  }
  if (a4)
  {
    v38 = *(void **)(v67[0] + 40);
    if (v38)
      *a4 = objc_retainAutorelease(v38);
  }
  v39 = self->_mutatedContent;

  _Block_object_dispose(&v66, 8);
  return v39;
}

uint64_t __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = *MEMORY[0x24BDF89F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F0], OS_LOG_TYPE_ERROR))
    __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_cold_1(a1, v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "_kill:", 9);
}

uint64_t __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_19(uint64_t result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  unsigned __int8 v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;

  v1 = result;
  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 48);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if ((v3 & 1) == 0)
  {
    v4 = *(_QWORD *)(result + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

    v6 = *MEMORY[0x24BDF89F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F0], OS_LOG_TYPE_ERROR))
      __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_19_cold_1(v1, v6, v7);
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(v1 + 48));
  }
  return result;
}

void __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_20(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BDF89F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v4 = v2;
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_2499A5000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Entering grace time: sessionUUID=%{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_auxiliaryConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceExtensionTimeWillExpire");

}

void __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_21(_QWORD *a1, void *a2)
{
  id v4;
  unsigned __int8 *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend((id)objc_opt_class(), "_disallowAccessToNotificationCenterForServiceExtensionWithIdentifier:", a1[5]);
  v5 = (unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 48);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(1u, v5));
  if ((v6 & 1) == 0)
  {
    v7 = a1[4];
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;

    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a2);
    v9 = *MEMORY[0x24BDF89F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F0], OS_LOG_TYPE_ERROR))
    {
      v10 = a1[5];
      v11 = a1[6];
      v12 = 138543874;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      v16 = 2114;
      v17 = v4;
      _os_log_error_impl(&dword_2499A5000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Service extension connection encountered an error: sessionUUID=%{public}@, error=%{public}@", (uint8_t *)&v12, 0x20u);
    }
  }

}

void __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_23(_QWORD *a1, void *a2)
{
  id v3;
  unsigned __int8 *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_disallowAccessToNotificationCenterForServiceExtensionWithIdentifier:", a1[5]);
  v4 = (unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 48);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(1u, v4));
  if ((v5 & 1) == 0)
  {
    v6 = objc_msgSend(v3, "copy");
    v7 = a1[4];
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v6;

    v9 = *MEMORY[0x24BDF89F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[5];
      v11 = a1[6];
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_2499A5000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Service extension delivered mutated content: sessionUUID=%{public}@", (uint8_t *)&v12, 0x16u);
    }
  }

}

- (void)cleanUp
{
  void *v3;
  void *v4;
  UNNotificationContent *mutatedContent;
  void *v6;
  void *v7;
  NSExtensionContext *hostContext;

  if (self->_mutatedContent)
  {
    -[NSExtensionContext _auxiliaryConnection](self->_hostContext, "_auxiliaryConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteAttachmentFilesInContentIfNecessary:", self->_mutatedContent);

    mutatedContent = self->_mutatedContent;
    self->_mutatedContent = 0;

  }
  -[NSExtensionContext _auxiliaryConnection](self->_hostContext, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceExtensionPerformCleanup");

  hostContext = self->_hostContext;
  self->_hostContext = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutatedContent, 0);
  objc_storeStrong((id *)&self->_hostContext, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)mutateContentForNotificationRequest:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  OUTLINED_FUNCTION_2(&dword_2499A5000, a3, (uint64_t)a3, "[%{public}@] Could not start an extension session: error=%{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

void __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_2499A5000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Extension will be killed because it used its runtime in starting up", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_6();
}

void __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_19_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  OUTLINED_FUNCTION_2(&dword_2499A5000, a2, a3, "[%{public}@] Service extension exceeded allowed time: sessionUUID=%{public}@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_6();
}

@end

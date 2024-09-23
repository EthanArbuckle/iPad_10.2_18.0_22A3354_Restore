@implementation UIViewServiceInterfaceConnectionRequest

void __65___UIViewServiceInterfaceConnectionRequest__objc_initiateDealloc__block_invoke(uint64_t a1)
{
  _UIDeallocOnMainThread(*(void **)(a1 + 32));
}

void __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;

  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if ((v3 & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_3;
  block[3] = &unk_1E16E8728;
  block[5] = a2;
  block[6] = v2;
  block[4] = v3;
  dispatch_async(v4, block);
}

uint64_t __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Connection Request for %@ Canceled"), a1[4]);
  v3 = (_QWORD *)a1[6];
  if (!v3[6])
  {
    v5 = CFSTR("Message");
    v6[0] = v2;
    *(_QWORD *)(a1[6] + 48) = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceErrorDomain"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
    v3 = (_QWORD *)a1[6];
  }
  return objc_msgSend(v3, "_cancelUnconditionallyThen:", a1[5]);
}

uint64_t __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchService");
}

void __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_6;
  v4[3] = &unk_1E16C3CF0;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

uint64_t __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_6(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(id **)(a1 + 40);
  if (v3)
    return objc_msgSend(v2, "_cancelWithError:");
  v5 = (void *)objc_msgSend(v2[3], "xpcServiceNameRoot");
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", objc_msgSend(v5, "stringByAppendingString:", CFSTR(".viewservice")));
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 88) = 0;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "multipleInstances"))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "multipleInstanceUUID"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "_xpcConnection");
      v6[0] = 0;
      v6[1] = 0;
      objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "multipleInstanceUUID"), "getUUIDBytes:", v6);
      xpc_connection_set_oneshot_instance();
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "_createPlugInProcessAssertion");
}

void __58___UIViewServiceInterfaceConnectionRequest__launchService__block_invoke(uint64_t a1)
{
  uint64_t v1;
  const char *v3;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[3];
  _QWORD v13[3];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    v3 = (const char *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 16), "stringByAppendingFormat:", CFSTR("-com.apple.uikit.viewService.connectionRequest")), "UTF8String");
    notify_register_check(v3, (int *)(*(_QWORD *)(a1 + 32) + 64));
    notify_set_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 64), 1uLL);
    notify_post(v3);
    v4 = _UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_3;
    if (!_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_3)
    {
      v4 = __UILogCategoryGetNode("ViewServiceConnectionRequest", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_3);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v15 = v6;
      v16 = 2082;
      v17 = v3;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Launching service %{public}@ with notification %{public}s", buf, 0x16u);
    }
    v12[0] = *MEMORY[0x1E0D22CE8];
    v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[UIApplication _classicMode](UIApplication, "_classicMode"));
    v12[1] = *MEMORY[0x1E0DC5CF0];
    v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v12[2] = *MEMORY[0x1E0D22D00];
    v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v8 = objc_alloc_init(MEMORY[0x1E0D23288]);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(v9 + 16);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58___UIViewServiceInterfaceConnectionRequest__launchService__block_invoke_27;
    v11[3] = &unk_1E16E86B0;
    v11[4] = v9;
    objc_msgSend(v8, "openApplication:options:withResult:", v10, v7, v11);

  }
}

void __58___UIViewServiceInterfaceConnectionRequest__launchService__block_invoke_27(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58___UIViewServiceInterfaceConnectionRequest__launchService__block_invoke_2;
  v4[3] = &unk_1E16C3CF0;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

uint64_t __58___UIViewServiceInterfaceConnectionRequest__launchService__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (!v1)
    return objc_msgSend(*(id *)(a1 + 40), "_createProcessAssertion");
  v4 = CFSTR("OriginalError");
  v5[0] = v1;
  return objc_msgSend(v2, "_cancelWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceInterfaceErrorDomain"), 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1)));
}

void __67___UIViewServiceInterfaceConnectionRequest__createProcessAssertion__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67___UIViewServiceInterfaceConnectionRequest__createProcessAssertion__block_invoke_2;
  v4[3] = &unk_1E16E86D8;
  v5 = a2;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

uint64_t __67___UIViewServiceInterfaceConnectionRequest__createProcessAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_createAndEstablishConnection");
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempt to acquire assertions for %@ failed"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v4 = *(void **)(a1 + 32);
  v5 = CFSTR("Message");
  v6[0] = v3;
  return objc_msgSend(v4, "_cancelWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceInterfaceErrorDomain"), 2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
}

void __73___UIViewServiceInterfaceConnectionRequest__createPlugInProcessAssertion__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73___UIViewServiceInterfaceConnectionRequest__createPlugInProcessAssertion__block_invoke_2;
  v4[3] = &unk_1E16E86D8;
  v5 = a2;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

uint64_t __73___UIViewServiceInterfaceConnectionRequest__createPlugInProcessAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_establishConnection");
    return objc_msgSend(*(id *)(a1 + 32), "_didConnectToService");
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempt to acquire assertions for %@ failed"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v4 = *(void **)(a1 + 32);
    v5 = CFSTR("Message");
    v6[0] = v3;
    return objc_msgSend(v4, "_cancelWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceInterfaceErrorDomain"), 2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  }
}

uint64_t __64___UIViewServiceInterfaceConnectionRequest__establishConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error handler triggered for %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16));
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = CFSTR("Message");
  v6[0] = v2;
  return objc_msgSend(v3, "_cancelWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceInterfaceErrorDomain"), 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
}

void __71___UIViewServiceInterfaceConnectionRequest__cancelUnconditionallyThen___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[4];
  __int128 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 48);
  if (!*(_BYTE *)(v2 + 88))
  {
    objc_msgSend(*(id *)(v2 + 80), "resume");
    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 88) = 1;
    v2 = *(_QWORD *)(a1 + 48);
  }
  v3 = *(_QWORD *)(v2 + 72);
  if (*(_BYTE *)(v2 + 41))
    v4 = v3 == 0;
  else
    v4 = 0;
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    _UIViewServiceInterfaceLogAssertionInfo((uint64_t)CFSTR("Invalidating assertion"), *(_QWORD *)(a1 + 32), v3);
    v5 = *(void **)(*(_QWORD *)(a1 + 48) + 72);
  }
  objc_msgSend(v5, "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "invalidate");
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(NSObject **)(v6 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71___UIViewServiceInterfaceConnectionRequest__cancelUnconditionallyThen___block_invoke_2;
  block[3] = &unk_1E16E8728;
  v10 = v6;
  v9 = *(_OWORD *)(a1 + 32);
  dispatch_async(v7, block);
}

uint64_t __71___UIViewServiceInterfaceConnectionRequest__cancelUnconditionallyThen___block_invoke_2(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[6];
  v3 = *(_QWORD *)(v2 + 72);
  if (*(_BYTE *)(v2 + 41))
    v4 = v3 == 0;
  else
    v4 = 0;
  if (!v4)
  {
    _UIViewServiceInterfaceLogAssertionInfo((uint64_t)CFSTR("Calling out to connection handler to cancel active service request"), a1[4], v3);
    v2 = a1[6];
  }
  (*(void (**)(void))(*(_QWORD *)(v2 + 8) + 16))();
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

@end

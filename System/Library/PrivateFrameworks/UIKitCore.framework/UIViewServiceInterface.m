@implementation UIViewServiceInterface

void __48___UIViewServiceInterface__objc_initiateDealloc__block_invoke(uint64_t a1)
{
  _UIDeallocOnMainThread(*(void **)(a1 + 32));
}

void __103___UIViewServiceInterface_connectToViewServiceWithBundleIdentifier_deputyInterfaces_connectionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithConnectionInfo:serviceBundleIdentifier:deputyInterfaces:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v6 = *(_QWORD *)(a1 + 56);
    v10 = (id)v5;
    if (v5)
    {
      v7 = v5;
      v8 = 0;
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceErrorDomain"), 1, &unk_1E1A9B608);
      v7 = 0;
      v8 = v9;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v7, v8);

  }
}

void __83___UIViewServiceInterface_connectToViewService_deputyInterfaces_connectionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithConnectionInfo:service:deputyInterfaces:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v6 = *(_QWORD *)(a1 + 56);
    v10 = (id)v5;
    if (v5)
    {
      v7 = v5;
      v8 = 0;
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceErrorDomain"), 1, &unk_1E1A9B630);
      v7 = 0;
      v8 = v9;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v7, v8);

  }
}

uint64_t __100___UIViewServiceInterface__initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateUnconditionallyThen:", a2);
}

uint64_t __100___UIViewServiceInterface__initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceInterfaceErrorDomain"), 3, &unk_1E1A9B658));
}

uint64_t __100___UIViewServiceInterface__initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceInterfaceErrorDomain"), 3, &unk_1E1A9B680));
}

intptr_t __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempting to connect to %@ but that service is terminated"), *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 48);
  v5 = CFSTR("Message");
  v6[0] = v2;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceErrorDomain"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_4;
  block[3] = &unk_1E16E87E8;
  v2 = *(NSObject **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  block[5] = a2;
  block[6] = v3;
  block[4] = v2;
  dispatch_sync(v2, block);
}

void __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_4(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;

  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(0, v2));
  if ((v3 & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_6;
  v5[3] = &unk_1E16E8810;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = a2;
  v5[5] = v3;
  return (*(uint64_t (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v5);
}

uint64_t __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_8;
  v5[3] = &unk_1E16E8810;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = a2;
  v5[5] = v3;
  return (*(uint64_t (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v5);
}

uint64_t __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), a2);
}

uint64_t __63___UIViewServiceInterface_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

void __57___UIViewServiceInterface__terminateUnconditionallyThen___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

@end

@implementation UIViewServiceSession

void __46___UIViewServiceSession__objc_initiateDealloc__block_invoke(uint64_t a1)
{
  _UIDeallocOnMainThread(*(void **)(a1 + 32));
}

uint64_t __55___UIViewServiceSession_sessionWithConnection_manager___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateUnconditionallyThen:", a2);
}

uint64_t __55___UIViewServiceSession_sessionWithConnection_manager___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invoke");
}

uint64_t __55___UIViewServiceSession_sessionWithConnection_manager___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invoke");
}

uint64_t __61___UIViewServiceSession_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

uint64_t __47___UIViewServiceSession_setTerminationHandler___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 48);
  if (*(void **)(result + 40) != v1)
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 48) = result;
  }
  return result;
}

void __56___UIViewServiceSession__invalidateUnconditionallyThen___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __56___UIViewServiceSession__invalidateUnconditionallyThen___block_invoke_2;
  v13 = &unk_1E16E8DD8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v8;
  v9 = *(void **)(v8 + 16);
  if (v9)
  {
    objc_msgSend(v9, "invalidate", v10, v11, v12, v13, v14, v15);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "invalidate");
    dispatch_async((dispatch_queue_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "_queue"), &v10);
  }
  else
  {
    *(_QWORD *)(v8 + 16) = 0;
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 + 48) + 16))(*(_QWORD *)(v8 + 48), a2, a3, a4, a5, a6);
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
}

uint64_t __56___UIViewServiceSession__invalidateUnconditionallyThen___block_invoke_2(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 0;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67___UIViewServiceSession_registerDeputyClass_withConnectionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v6;
  id *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _OWORD v14[4];
  const __CFString *v15;

  v6 = (id *)(id)objc_msgSend(*(id *)(a1 + 32), "object");
  if (v6)
  {
    v7 = v6;
    v15 = 0;
    if (_UIApplicationIsKeyboardExtension())
    {
      v15 = CFSTR("<null>");
    }
    else
    {
      objc_msgSend(v7[2], "_xpcConnection");
      v8 = xpc_connection_copy_bundle_id();
      if (!v8
        || (v9 = (void *)v8,
            v15 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8),
            free(v9),
            !v15))
      {
        v10 = v7[2];
        if (v10)
          objc_msgSend(v10, "auditToken");
        else
          memset(&v14[2], 0, 32);
        CPCopyBundleIdentifierAndTeamFromAuditToken();
      }
    }
    v11 = *(_QWORD *)(a1 + 40);
    v12 = objc_msgSend(v7[2], "processIdentifier");
    v13 = v7[2];
    if (v13)
      objc_msgSend(v13, "auditToken");
    else
      memset(v14, 0, 32);
    (*(void (**)(uint64_t, uint64_t, uint64_t, const __CFString *, _OWORD *, uint64_t))(v11 + 16))(v11, a2, v12, v15, v14, a3);

  }
}

@end

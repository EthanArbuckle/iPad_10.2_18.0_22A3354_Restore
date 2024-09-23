@implementation UIViewServiceDeputyManager

void __52___UIViewServiceDeputyManager__objc_initiateDealloc__block_invoke(uint64_t a1)
{
  _UIDeallocOnMainThread(*(void **)(a1 + 32));
}

uint64_t __35___UIViewServiceDeputyManager_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateUnconditionallyThen:", a2);
}

uint64_t __62___UIViewServiceDeputyManager__invalidateUnconditionallyThen___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _QWORD v9[4];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count") + 1);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "invalidate"));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62___UIViewServiceDeputyManager__invalidateUnconditionallyThen___block_invoke_2;
  v9[3] = &unk_1E16E8DD8;
  v10 = *(_OWORD *)(a1 + 32);
  return +[_UIAsyncInvocationObserver whenInvocationsCompleteForObservers:do:](_UIAsyncInvocationObserver, "whenInvocationsCompleteForObservers:do:", v2, v9);
}

void __62___UIViewServiceDeputyManager__invalidateUnconditionallyThen___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62___UIViewServiceDeputyManager__invalidateUnconditionallyThen___block_invoke_3;
  v4[3] = &unk_1E16E8DD8;
  v4[4] = v2;
  v4[5] = v1;
  dispatch_async(v3, v4);
}

uint64_t __62___UIViewServiceDeputyManager__invalidateUnconditionallyThen___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeAllObjects");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94___UIViewServiceDeputyManager___requestConnectionToDeputyOfClass_fromHostObject_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  NSString *v6;
  NSString *v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", NSStringFromClass(*(Class *)(a1 + 40)));
  if (v2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __94___UIViewServiceDeputyManager___requestConnectionToDeputyOfClass_fromHostObject_replyHandler___block_invoke_2;
    v8[3] = &unk_1E16E9250;
    v3 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v9 = *(_OWORD *)(a1 + 32);
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v3, v8);
  }
  else
  {
    v5 = objc_opt_class();
    v6 = NSStringFromSelector(*(SEL *)(a1 + 64));
    v7 = NSStringFromClass(*(Class *)(a1 + 40));
    NSLog(CFSTR("-[%@ %@] - received request for unknown deputy class %@"), v5, v6, v7);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __94___UIViewServiceDeputyManager___requestConnectionToDeputyOfClass_fromHostObject_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __int128 v3;
  NSObject *v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v5[1] = 3221225472;
  v5[2] = __94___UIViewServiceDeputyManager___requestConnectionToDeputyOfClass_fromHostObject_replyHandler___block_invoke_3;
  v5[3] = &unk_1E16E9228;
  v5[4] = a2;
  v7 = v2;
  v6 = v3;
  dispatch_async(v4, v5);
}

uint64_t __94___UIViewServiceDeputyManager___requestConnectionToDeputyOfClass_fromHostObject_replyHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "checkDeputyForRotation:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "addObject:", *(_QWORD *)(a1 + 32));
  }
  v2 = *(_QWORD *)(a1 + 56);
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "XPCInterface"), "exportedInterface"))
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __73___UIViewServiceDeputyManager_registerDeputyClass_withConnectionHandler___block_invoke(uint64_t a1, NSString *aClassName)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", -[objc_class XPCInterface](NSClassFromString(aClassName), "XPCInterface"));
}

uint64_t __53___UIViewServiceDeputyManager_unregisterDeputyClass___block_invoke(uint64_t a1, NSString *aClassName)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", -[objc_class XPCInterface](NSClassFromString(aClassName), "XPCInterface"));
}

uint64_t __92___UIViewServiceDeputyManager_viewControllerOperator_didCreateServiceViewControllerOfClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  _QWORD v8[6];

  objc_msgSend(*(id *)(a1 + 32), "unregisterDeputyClass:", *(_QWORD *)(a1 + 40));
  v6 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92___UIViewServiceDeputyManager_viewControllerOperator_didCreateServiceViewControllerOfClass___block_invoke_2;
  v8[3] = &unk_1E16E92F0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = a3;
  return objc_msgSend(v6, "establishViewControllerDeputyWithProxy:completionHandler:", a2, v8);
}

void __92___UIViewServiceDeputyManager_viewControllerOperator_didCreateServiceViewControllerOfClass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD v6[6];

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = __Block_byref_object_copy__225;
  v6[4] = __Block_byref_object_dispose__225;
  v6[5] = a2;
  v3 = *(void **)(a1 + 32);
  v4 = objc_opt_class();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92___UIViewServiceDeputyManager_viewControllerOperator_didCreateServiceViewControllerOfClass___block_invoke_78;
  v5[3] = &unk_1E16E92C8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = v6;
  objc_msgSend(v3, "registerDeputyClass:withConnectionHandler:", v4, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_object_dispose(v6, 8);
}

uint64_t __92___UIViewServiceDeputyManager_viewControllerOperator_didCreateServiceViewControllerOfClass___block_invoke_78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "unregisterDeputyClass:", objc_opt_class());
  return (*(uint64_t (**)(uint64_t, id))(a3 + 16))(a3, +[_UIViewControllerControlMessageDeputy proxyWithTarget:](_UIViewControllerControlMessageDeputy, "proxyWithTarget:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)));
}

@end

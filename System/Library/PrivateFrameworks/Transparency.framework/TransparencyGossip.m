@implementation TransparencyGossip

+ (id)retrieveCurrentVerifiedTLTSTH:(id *)a3
{
  void *v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  v14 = 0;
  v7[4] = &v9;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke;
  v8[3] = &unk_24DC8F2F8;
  v8[4] = &v9;
  v8[5] = &v15;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke_2_8;
  v7[3] = &unk_24DC8F078;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v8, v7);
  if (a3)
  {
    v4 = (void *)v10[5];
    if (v4)
      *a3 = objc_retainAutorelease(v4);
  }
  v5 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v5;
}

void __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  __int128 v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_12 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_12, &__block_literal_global_13);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    if (v7)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_12 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_12, &__block_literal_global_4);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_INFO, "Sending synchronous retrieveCurrentVerifiedTLTSTH", buf, 2u);
    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke_5;
    v10[3] = &unk_24DC8FF88;
    v11 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v5, "retrieveCurrentVerifiedTLTSTH:", v10);
  }

}

void __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

void __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

void __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v8 = a3;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke_2_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_12 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_12, &__block_literal_global_9);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown retrieveCurrentVerifiedTLTSTH error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

+ (void)sthsReceivedFromPeers:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke;
  v10[3] = &unk_24DC8F348;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_2_15;
  v9[3] = &unk_24DC8F078;
  v9[4] = &v13;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v10, v9);
  if (a4)
  {
    v8 = (void *)v14[5];
    if (v8)
      *a4 = objc_retainAutorelease(v8);
  }

  _Block_object_dispose(&v13, 8);
}

void __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_12 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_12, &__block_literal_global_11);
    v10 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    if (v7)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_12 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_12, &__block_literal_global_13);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_INFO, "Sending synchronous sthsReceivedFromPeers", buf, 2u);
    }
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_14;
    v11[3] = &unk_24DC8F078;
    v9 = *(_QWORD *)(a1 + 32);
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "sthsReceivedFromPeers:completionBlock:", v9, v11);
  }

}

void __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

void __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_12()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

void __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_14(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_2_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_12 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_12, &__block_literal_global_16_0);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown sthsReceivedFromPeers error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

@end

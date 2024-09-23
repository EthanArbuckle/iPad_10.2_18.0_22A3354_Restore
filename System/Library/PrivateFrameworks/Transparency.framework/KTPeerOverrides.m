@implementation KTPeerOverrides

+ (void)setPeerOverride:(id)a3 application:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__KTPeerOverrides_setPeerOverride_application_state___block_invoke;
  v13[3] = &unk_24DC8E838;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v13, &__block_literal_global);

}

uint64_t __53__KTPeerOverrides_setPeerOverride_application_state___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "setPeerOverride:application:state:", a1[4], a1[5], a1[6]);
}

void __53__KTPeerOverrides_setPeerOverride_application_state___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK, &__block_literal_global_27);
  v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_21A250000, v3, OS_LOG_TYPE_ERROR, "setPeerOverride error: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __53__KTPeerOverrides_setPeerOverride_application_state___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

+ (void)clearPeerOverride:(id)a3 application:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__KTPeerOverrides_clearPeerOverride_application___block_invoke;
  v9[3] = &unk_24DC8E8A0;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v9, &__block_literal_global_30);

}

uint64_t __49__KTPeerOverrides_clearPeerOverride_application___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearPeerOverride:application:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __49__KTPeerOverrides_clearPeerOverride_application___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK, &__block_literal_global_31);
  v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_21A250000, v3, OS_LOG_TYPE_ERROR, "clearPeerOverride error: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __49__KTPeerOverrides_clearPeerOverride_application___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

+ (id)listPeerOverrides
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__KTPeerOverrides_listPeerOverrides__block_invoke;
  v4[3] = &unk_24DC8E8F0;
  v4[4] = &v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v4, &__block_literal_global_33);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __36__KTPeerOverrides_listPeerOverrides__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__KTPeerOverrides_listPeerOverrides__block_invoke_2;
  v3[3] = &unk_24DC8E8C8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "listPeerOverrides:", v3);
}

void __36__KTPeerOverrides_listPeerOverrides__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __36__KTPeerOverrides_listPeerOverrides__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK, &__block_literal_global_34);
  v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_21A250000, v3, OS_LOG_TYPE_ERROR, "listPeerOverrides error: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __36__KTPeerOverrides_listPeerOverrides__block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

@end

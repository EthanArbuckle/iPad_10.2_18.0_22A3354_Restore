@implementation TransparencyStaticKey

- (void)setupKTSession:(id)a3 complete:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__TransparencyStaticKey_setupKTSession_complete___block_invoke;
  v12[3] = &unk_24DC8FFF8;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __49__TransparencyStaticKey_setupKTSession_complete___block_invoke_2_247;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeIDSXPCWithBlock:errorHandler:](TransparencyXPCConnection, "invokeIDSXPCWithBlock:errorHandler:", v12, v10);

}

void __49__TransparencyStaticKey_setupKTSession_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_243);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __49__TransparencyStaticKey_setupKTSession_complete___block_invoke_244;
    v10[3] = &unk_24DC8FFD0;
    v8 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setupKTSession:complete:", v8, v10);

  }
}

void __49__TransparencyStaticKey_setupKTSession_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

uint64_t __49__TransparencyStaticKey_setupKTSession_complete___block_invoke_244(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__TransparencyStaticKey_setupKTSession_complete___block_invoke_2_247(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_248);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown setupKTSession error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __49__TransparencyStaticKey_setupKTSession_complete___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

- (void)deleteKTSession:(id)a3 complete:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke;
  v12[3] = &unk_24DC8FFF8;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke_2_253;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeIDSXPCWithBlock:errorHandler:](TransparencyXPCConnection, "invokeIDSXPCWithBlock:errorHandler:", v12, v10);

}

void __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_250);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke_251;
    v10[3] = &unk_24DC90020;
    v8 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v5, "deleteKTSession:complete:", v8, v10);

  }
}

void __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

uint64_t __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke_251(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke_2_253(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_254_0);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown deleteKTSession error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

- (void)listKTSessions:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__TransparencyStaticKey_listKTSessions___block_invoke;
  v8[3] = &unk_24DC90090;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __40__TransparencyStaticKey_listKTSessions___block_invoke_2_258;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeIDSXPCWithBlock:errorHandler:](TransparencyXPCConnection, "invokeIDSXPCWithBlock:errorHandler:", v8, v6);

}

void __40__TransparencyStaticKey_listKTSessions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_255);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40__TransparencyStaticKey_listKTSessions___block_invoke_256;
    v9[3] = &unk_24DC90068;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v5, "listKTSession:", v9);

  }
}

void __40__TransparencyStaticKey_listKTSessions___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

uint64_t __40__TransparencyStaticKey_listKTSessions___block_invoke_256(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__TransparencyStaticKey_listKTSessions___block_invoke_2_258(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_259);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown listKTSessions error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __40__TransparencyStaticKey_listKTSessions___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

- (void)getKTSessionByHandle:(id)a3 complete:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke;
  v12[3] = &unk_24DC8FFF8;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke_2_262;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeIDSXPCWithBlock:errorHandler:](TransparencyXPCConnection, "invokeIDSXPCWithBlock:errorHandler:", v12, v10);

}

void __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_260_0);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke_261;
    v10[3] = &unk_24DC90068;
    v8 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v5, "getKTSessionByHandle:complete:", v8, v10);

  }
}

void __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

uint64_t __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke_261(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke_2_262(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_263_0);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown getKTSessionByHandle error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

- (void)getKTSessionByID:(id)a3 complete:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke;
  v12[3] = &unk_24DC8FFF8;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke_2_267;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeIDSXPCWithBlock:errorHandler:](TransparencyXPCConnection, "invokeIDSXPCWithBlock:errorHandler:", v12, v10);

}

void __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_264);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke_265;
    v10[3] = &unk_24DC900B8;
    v8 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v5, "getKTSessionByID:complete:", v8, v10);

  }
}

void __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

uint64_t __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke_265(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke_2_267(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_268);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown getKTSessionByID error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

- (KTAccountPublicID)accountIdentity
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountIdentity:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentity, 0);
}

@end

@implementation TransparencyDaemon

- (void)configurationBagFetch:(id)a3
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
  v8[2] = __44__TransparencyDaemon_configurationBagFetch___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __44__TransparencyDaemon_configurationBagFetch___block_invoke_223;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __44__TransparencyDaemon_configurationBagFetch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_5);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending configurationBagFetch", v8, 2u);
  }
  objc_msgSend(v5, "configurationBagFetch:", *(_QWORD *)(a1 + 32));

}

void __44__TransparencyDaemon_configurationBagFetch___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __44__TransparencyDaemon_configurationBagFetch___block_invoke_223(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyIDSRepair:(id)a3
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
  v8[2] = __44__TransparencyDaemon_transparencyIDSRepair___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __44__TransparencyDaemon_transparencyIDSRepair___block_invoke_2_227;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __44__TransparencyDaemon_transparencyIDSRepair___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_225_0);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyRepair", buf, 2u);
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__TransparencyDaemon_transparencyIDSRepair___block_invoke_226;
  v8[3] = &unk_24DC8EA78;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v5, "transparencyIDSRepair:", v8);

}

void __44__TransparencyDaemon_transparencyIDSRepair___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __44__TransparencyDaemon_transparencyIDSRepair___block_invoke_226(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__TransparencyDaemon_transparencyIDSRepair___block_invoke_2_227(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencySysDiagnose:(id)a3
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
  v8[2] = __46__TransparencyDaemon_transparencySysDiagnose___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __46__TransparencyDaemon_transparencySysDiagnose___block_invoke_229;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __46__TransparencyDaemon_transparencySysDiagnose___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_228);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencySysDiagnose", v8, 2u);
  }
  objc_msgSend(v5, "transparencySysDiagnose:", *(_QWORD *)(a1 + 32));

}

void __46__TransparencyDaemon_transparencySysDiagnose___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __46__TransparencyDaemon_transparencySysDiagnose___block_invoke_229(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)transparencySysDiagnoseData:(id *)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  _QWORD v14[6];
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__2;
  v15[4] = __Block_byref_object_dispose__2;
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v13[4] = v15;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke;
  v14[3] = &unk_24DC8F2F8;
  v14[4] = v15;
  v14[5] = &v17;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_2_234;
  v13[3] = &unk_24DC8F078;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v14, v13);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_3;
  v10[3] = &unk_24DC8F348;
  v12 = v15;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_2_246;
  v9[3] = &unk_24DC8F078;
  v9[4] = v15;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v10, v9);
  if (!objc_msgSend(v6, "count"))
  {

    v6 = 0;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18[5], CFSTR("stateMachine"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("registration"));
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_231);
    v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencySysDiagnose", buf, 2u);
    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_232;
    v8[3] = &unk_24DC8E8C8;
    v8[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "transparencySysDiagnose:", v8);
  }

}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_232(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_2_234(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_236_0);
    v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyDumpKTRegistrationData", buf, 2u);
    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_237;
    v8[3] = &unk_24DC8F320;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "transparencyDumpKTRegistrationData:", v8);

  }
}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_237(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(a2, "registrationData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v5;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v6)
    {
      v7 = v6;
      v8 = CFSTR("app");
      v9 = CFSTR("YES");
      v10 = *(_QWORD *)v38;
      do
      {
        v11 = 0;
        v35 = v7;
        do
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v11);
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v35);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "application");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v8);

          objc_msgSend(v12, "signature");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            v16 = v9;
          else
            v16 = CFSTR("NO");
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("signature"));

          objc_msgSend(v12, "createdAt");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "description");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("createdAt"));

          objc_msgSend(v12, "signedAt");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "description");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("signedAt"));

          objc_msgSend(v12, "createdAt");
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            objc_msgSend(v12, "signedAt");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              v24 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v12, "signedAt");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "createdAt");
              v26 = v10;
              v27 = a1;
              v28 = v9;
              v29 = v8;
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "timeIntervalSinceDate:", v30);
              objc_msgSend(v24, "numberWithInt:", (int)v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, CFSTR("delay"));

              v8 = v29;
              v9 = v28;
              a1 = v27;
              v10 = v26;
              v7 = v35;

            }
          }
          objc_msgSend(v12, "pushToken");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "kt_hexString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v34, CFSTR("pushToken"));

          objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
          ++v11;
        }
        while (v7 != v11);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v7);
    }

  }
}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_2_246(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)transparencyFetchIDMS:(id)a3
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
  v8[2] = __44__TransparencyDaemon_transparencyFetchIDMS___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __44__TransparencyDaemon_transparencyFetchIDMS___block_invoke_253;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __44__TransparencyDaemon_transparencyFetchIDMS___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_252);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyFetchIDMS", v8, 2u);
  }
  objc_msgSend(v5, "transparencyTriggerIDMSFetch:", *(_QWORD *)(a1 + 32));

}

void __44__TransparencyDaemon_transparencyFetchIDMS___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __44__TransparencyDaemon_transparencyFetchIDMS___block_invoke_253(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyValidateSelf:(id)a3
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
  v8[2] = __47__TransparencyDaemon_transparencyValidateSelf___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __47__TransparencyDaemon_transparencyValidateSelf___block_invoke_255;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __47__TransparencyDaemon_transparencyValidateSelf___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_254);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyValidateSelf", v8, 2u);
  }
  objc_msgSend(v5, "triggerSelfValidate:", *(_QWORD *)(a1 + 32));

}

void __47__TransparencyDaemon_transparencyValidateSelf___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __47__TransparencyDaemon_transparencyValidateSelf___block_invoke_255(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyFetchSelf:(id)a3
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
  v8[2] = __44__TransparencyDaemon_transparencyFetchSelf___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __44__TransparencyDaemon_transparencyFetchSelf___block_invoke_257;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __44__TransparencyDaemon_transparencyFetchSelf___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_256);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyTriggerFetchSelf", v8, 2u);
  }
  objc_msgSend(v5, "transparencyTriggerFetchSelf:", *(_QWORD *)(a1 + 32));

}

void __44__TransparencyDaemon_transparencyFetchSelf___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __44__TransparencyDaemon_transparencyFetchSelf___block_invoke_257(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performAndWaitForSelfValidate:(id)a3
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
  v8[2] = __52__TransparencyDaemon_performAndWaitForSelfValidate___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __52__TransparencyDaemon_performAndWaitForSelfValidate___block_invoke_259;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __52__TransparencyDaemon_performAndWaitForSelfValidate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_258);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending performAndWaitForSelfValidate", v8, 2u);
  }
  objc_msgSend(v5, "performAndWaitForSelfValidate:", *(_QWORD *)(a1 + 32));

}

void __52__TransparencyDaemon_performAndWaitForSelfValidate___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __52__TransparencyDaemon_performAndWaitForSelfValidate___block_invoke_259(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)maybeUpdateMonitorState
{
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", &__block_literal_global_260, &__block_literal_global_263);
}

void __45__TransparencyDaemon_maybeUpdateMonitorState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a2;
  v5 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_261);
  v6 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21A250000, v6, OS_LOG_TYPE_INFO, "Sending maybeUpdateMonitorState", v7, 2u);
  }
  objc_msgSend(v4, "maybeUpdateMonitorState");

}

void __45__TransparencyDaemon_maybeUpdateMonitorState__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __45__TransparencyDaemon_maybeUpdateMonitorState__block_invoke_262(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_265);
  v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_21A250000, v3, OS_LOG_TYPE_ERROR, "maybeUpdateMonitorState failed with: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __45__TransparencyDaemon_maybeUpdateMonitorState__block_invoke_2_264()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (id)transparencyIDMSDeviceList:(id *)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke;
  v7[3] = &unk_24DC8F2F8;
  v7[4] = &v14;
  v7[5] = &v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v7, &__block_literal_global_270);
  if (a3)
  {
    v4 = (void *)v9[5];
    if (v4)
      *a3 = objc_retainAutorelease(v4);
  }
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  __int128 v9;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_266);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending deviceStatus", buf, 2u);
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke_267;
  v8[3] = &unk_24DC8F3F0;
  v9 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v5, "idmsDevices:", v8);

}

void __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke_267(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke_2_269(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_271);
  v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_21A250000, v3, OS_LOG_TYPE_ERROR, "deviceStatus failed with: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)replaySelfValidate:(id)a3 application:(id)a4 pcsAccountKey:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 responseTime:(id)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __125__TransparencyDaemon_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler___block_invoke;
  v31[3] = &unk_24DC8F418;
  v32 = v14;
  v33 = v15;
  v34 = v16;
  v35 = v17;
  v36 = v18;
  v37 = v19;
  v38 = v20;
  v29[0] = v21;
  v29[1] = 3221225472;
  v29[2] = __125__TransparencyDaemon_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler___block_invoke_273;
  v29[3] = &unk_24DC8EA78;
  v30 = v38;
  v22 = v38;
  v23 = v19;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  v27 = v15;
  v28 = v14;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v31, v29);

}

void __125__TransparencyDaemon_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_272);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending replay self validate", buf, 2u);
  }
  objc_msgSend(v5, "replaySelfValidate:application:pcsAccountKey:queryRequest:queryResponse:responseTime:completionHandler:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10]);

}

void __125__TransparencyDaemon_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __125__TransparencyDaemon_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler___block_invoke_273(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyFetchPublicKeys:(id)a3
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
  v8[2] = __50__TransparencyDaemon_transparencyFetchPublicKeys___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __50__TransparencyDaemon_transparencyFetchPublicKeys___block_invoke_275;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __50__TransparencyDaemon_transparencyFetchPublicKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_274);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyFetchPublicKeys", v8, 2u);
  }
  objc_msgSend(v5, "transparencyTriggerPublicKeyFetch:", *(_QWORD *)(a1 + 32));

}

void __50__TransparencyDaemon_transparencyFetchPublicKeys___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __50__TransparencyDaemon_transparencyFetchPublicKeys___block_invoke_275(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyTriggerIDSRegistration:(id)a3
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
  v8[2] = __57__TransparencyDaemon_transparencyTriggerIDSRegistration___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __57__TransparencyDaemon_transparencyTriggerIDSRegistration___block_invoke_277;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __57__TransparencyDaemon_transparencyTriggerIDSRegistration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_276);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyTriggerIDSRegistration", v8, 2u);
  }
  objc_msgSend(v5, "transparencyTriggerCheckIDSRegistration:", *(_QWORD *)(a1 + 32));

}

void __57__TransparencyDaemon_transparencyTriggerIDSRegistration___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __57__TransparencyDaemon_transparencyTriggerIDSRegistration___block_invoke_277(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyCheckKTAccountKey:(id)a3 complete:(id)a4
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
  v12[2] = __61__TransparencyDaemon_transparencyCheckKTAccountKey_complete___block_invoke;
  v12[3] = &unk_24DC8F440;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __61__TransparencyDaemon_transparencyCheckKTAccountKey_complete___block_invoke_279;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __61__TransparencyDaemon_transparencyCheckKTAccountKey_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_278);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyCheckKTAccountKey", v8, 2u);
  }
  objc_msgSend(v5, "transparencyCheckKTAccountKey:complete:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __61__TransparencyDaemon_transparencyCheckKTAccountKey_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __61__TransparencyDaemon_transparencyCheckKTAccountKey_complete___block_invoke_279(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)transparencyCheckIDSHealth:(id *)a3
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
  __CFString *v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = CFSTR("unknown");
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  v7[4] = &v9;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke;
  v8[3] = &unk_24DC8F2F8;
  v8[4] = &v9;
  v8[5] = &v15;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke_2_285;
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

void __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  int8x16_t v9;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[2].i64[0] + 8) + 40), a3);
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_282);
    v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyCheckIDSHealth", buf, 2u);
    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke_283;
    v8[3] = &unk_24DC8F488;
    v9 = vextq_s8(a1[2], a1[2], 8uLL);
    objc_msgSend(v5, "transparencyCheckIDSHealth:", v8);
  }

}

void __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke_283(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke_2_285(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)transparencyIDSRegistration:(id)a3
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
  v8[2] = __50__TransparencyDaemon_transparencyIDSRegistration___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __50__TransparencyDaemon_transparencyIDSRegistration___block_invoke_287;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __50__TransparencyDaemon_transparencyIDSRegistration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_286);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyPerformRegistrationSignature", v8, 2u);
  }
  objc_msgSend(v5, "transparencyIDSRegistration:", *(_QWORD *)(a1 + 32));

}

void __50__TransparencyDaemon_transparencyIDSRegistration___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __50__TransparencyDaemon_transparencyIDSRegistration___block_invoke_287(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyPerformRegistrationSignature:(id)a3
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
  v8[2] = __63__TransparencyDaemon_transparencyPerformRegistrationSignature___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __63__TransparencyDaemon_transparencyPerformRegistrationSignature___block_invoke_289;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __63__TransparencyDaemon_transparencyPerformRegistrationSignature___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_288);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyPerformRegistrationSignature", v8, 2u);
  }
  objc_msgSend(v5, "transparencyPerformRegistrationSignature:", *(_QWORD *)(a1 + 32));

}

void __63__TransparencyDaemon_transparencyPerformRegistrationSignature___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __63__TransparencyDaemon_transparencyPerformRegistrationSignature___block_invoke_289(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyDumpKTRegistrationData:(id)a3
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
  v8[2] = __57__TransparencyDaemon_transparencyDumpKTRegistrationData___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __57__TransparencyDaemon_transparencyDumpKTRegistrationData___block_invoke_291;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __57__TransparencyDaemon_transparencyDumpKTRegistrationData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_290);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyDumpKTRegistrationData", v8, 2u);
  }
  objc_msgSend(v5, "transparencyDumpKTRegistrationData:", *(_QWORD *)(a1 + 32));

}

void __57__TransparencyDaemon_transparencyDumpKTRegistrationData___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __57__TransparencyDaemon_transparencyDumpKTRegistrationData___block_invoke_291(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyGetKTSignatures:(id)a3 complete:(id)a4
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
  v12[2] = __59__TransparencyDaemon_transparencyGetKTSignatures_complete___block_invoke;
  v12[3] = &unk_24DC8F440;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __59__TransparencyDaemon_transparencyGetKTSignatures_complete___block_invoke_293;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __59__TransparencyDaemon_transparencyGetKTSignatures_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_292);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyGetKTSignatures:complete:", v8, 2u);
  }
  objc_msgSend(v5, "transparencyGetKTSignatures:complete:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __59__TransparencyDaemon_transparencyGetKTSignatures_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __59__TransparencyDaemon_transparencyGetKTSignatures_complete___block_invoke_293(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyClearKTRegistrationData:(id)a3
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
  v8[2] = __58__TransparencyDaemon_transparencyClearKTRegistrationData___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __58__TransparencyDaemon_transparencyClearKTRegistrationData___block_invoke_295;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __58__TransparencyDaemon_transparencyClearKTRegistrationData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_294);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyClearKTRegistrationData:", v8, 2u);
  }
  objc_msgSend(v5, "transparencyClearKTRegistrationData:", *(_QWORD *)(a1 + 32));

}

void __58__TransparencyDaemon_transparencyClearKTRegistrationData___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __58__TransparencyDaemon_transparencyClearKTRegistrationData___block_invoke_295(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyCloudDevices:(id)a3
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
  v8[2] = __47__TransparencyDaemon_transparencyCloudDevices___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __47__TransparencyDaemon_transparencyCloudDevices___block_invoke_297;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __47__TransparencyDaemon_transparencyCloudDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_296);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyCloudDevices", v8, 2u);
  }
  objc_msgSend(v5, "transparencyCloudDevices:", *(_QWORD *)(a1 + 32));

}

void __47__TransparencyDaemon_transparencyCloudDevices___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __47__TransparencyDaemon_transparencyCloudDevices___block_invoke_297(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearPeerState:(id)a3 uris:(id)a4 block:(id)a5
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
  v13[2] = __48__TransparencyDaemon_clearPeerState_uris_block___block_invoke;
  v13[3] = &unk_24DC8F4F0;
  v14 = v8;
  v15 = v7;
  v16 = v9;
  v10 = v9;
  v11 = v7;
  v12 = v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v13, v10);

}

void __48__TransparencyDaemon_clearPeerState_uris_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_298);
  v7 = (id)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(","));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = CFSTR("all peers");
    }
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending clearPeerState for %@", (uint8_t *)&v10, 0xCu);
    if (v8)

  }
  objc_msgSend(v5, "clearPeerState:uris:block:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void __48__TransparencyDaemon_clearPeerState_uris_block___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)transparencyTriggerOperation:(id)a3 complete:(id)a4
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
  v12[2] = __60__TransparencyDaemon_transparencyTriggerOperation_complete___block_invoke;
  v12[3] = &unk_24DC8F440;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __60__TransparencyDaemon_transparencyTriggerOperation_complete___block_invoke_304;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __60__TransparencyDaemon_transparencyTriggerOperation_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_303);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyTriggerOperation", v8, 2u);
  }
  objc_msgSend(v5, "transparencyTriggerOperation:complete:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __60__TransparencyDaemon_transparencyTriggerOperation_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __60__TransparencyDaemon_transparencyTriggerOperation_complete___block_invoke_304(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)changeOptInState:(unint64_t)a3 application:(id)a4 complete:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;

  v7 = a4;
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__TransparencyDaemon_changeOptInState_application_complete___block_invoke;
  v14[3] = &unk_24DC8F518;
  v17 = a3;
  v15 = v7;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __60__TransparencyDaemon_changeOptInState_application_complete___block_invoke_306;
  v12[3] = &unk_24DC8EA78;
  v13 = v16;
  v10 = v16;
  v11 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v14, v12);

}

void __60__TransparencyDaemon_changeOptInState_application_complete___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_305);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    v8 = a1[6];
    v9[0] = 67109120;
    v9[1] = v8;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending changeOptInState:complete: %d", (uint8_t *)v9, 8u);
  }
  objc_msgSend(v5, "changeOptInState:application:completionBlock:", a1[6], a1[4], a1[5]);

}

void __60__TransparencyDaemon_changeOptInState_application_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __60__TransparencyDaemon_changeOptInState_application_complete___block_invoke_306(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getOptInState:(id)a3 complete:(id)a4
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
  v12[2] = __45__TransparencyDaemon_getOptInState_complete___block_invoke;
  v12[3] = &unk_24DC8F440;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __45__TransparencyDaemon_getOptInState_complete___block_invoke_308;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __45__TransparencyDaemon_getOptInState_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_307);
  v7 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "application");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_INFO, "Sending getOptInState:complete: %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v5, "getOptInStateForAccount:complete:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __45__TransparencyDaemon_getOptInState_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __45__TransparencyDaemon_getOptInState_complete___block_invoke_308(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getOptInForURI:(id)a3 application:(id)a4 complete:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __58__TransparencyDaemon_getOptInForURI_application_complete___block_invoke;
  v16[3] = &unk_24DC8F4F0;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __58__TransparencyDaemon_getOptInForURI_application_complete___block_invoke_310;
  v14[3] = &unk_24DC8EA78;
  v15 = v19;
  v11 = v19;
  v12 = v8;
  v13 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v16, v14);

}

void __58__TransparencyDaemon_getOptInForURI_application_complete___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_309);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending getOptInForURI:application:complete:", v8, 2u);
  }
  objc_msgSend(v5, "getOptInForURI:application:complete:", a1[4], a1[5], a1[6]);

}

void __58__TransparencyDaemon_getOptInForURI_application_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __58__TransparencyDaemon_getOptInForURI_application_complete___block_invoke_310(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setOptInForURI:(id)a3 application:(id)a4 state:(BOOL)a5 smtTimestamp:(id)a6 complete:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__TransparencyDaemon_setOptInForURI_application_state_smtTimestamp_complete___block_invoke;
  v22[3] = &unk_24DC8F540;
  v23 = v11;
  v24 = v12;
  v27 = a5;
  v25 = v13;
  v26 = v14;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __77__TransparencyDaemon_setOptInForURI_application_state_smtTimestamp_complete___block_invoke_312;
  v20[3] = &unk_24DC8EA78;
  v21 = v26;
  v16 = v26;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v22, v20);

}

void __77__TransparencyDaemon_setOptInForURI_application_state_smtTimestamp_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_311);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending setOptInForURI:application:state:complete:", v8, 2u);
  }
  objc_msgSend(v5, "setOptInForURI:application:state:smtTimestamp:complete:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __77__TransparencyDaemon_setOptInForURI_application_state_smtTimestamp_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __77__TransparencyDaemon_setOptInForURI_application_state_smtTimestamp_complete___block_invoke_312(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAllOptInStates:(id)a3
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
  v8[2] = __40__TransparencyDaemon_getAllOptInStates___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __40__TransparencyDaemon_getAllOptInStates___block_invoke_314;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __40__TransparencyDaemon_getAllOptInStates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_313);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending getAllOptInStates:complete:", v8, 2u);
  }
  objc_msgSend(v5, "getAllOptInStates:", *(_QWORD *)(a1 + 32));

}

void __40__TransparencyDaemon_getAllOptInStates___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __40__TransparencyDaemon_getAllOptInStates___block_invoke_314(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getOptInStateForApplication:(id)a3 complete:(id)a4
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
  v12[2] = __59__TransparencyDaemon_getOptInStateForApplication_complete___block_invoke;
  v12[3] = &unk_24DC8F440;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __59__TransparencyDaemon_getOptInStateForApplication_complete___block_invoke_316;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __59__TransparencyDaemon_getOptInStateForApplication_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_315);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending getAggregateOptInState:application:complete:", v8, 2u);
  }
  objc_msgSend(v5, "getOptInStateForApplication:complete:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __59__TransparencyDaemon_getOptInStateForApplication_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __59__TransparencyDaemon_getOptInStateForApplication_complete___block_invoke_316(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearOptInStateForURI:(id)a3 application:(id)a4 complete:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __65__TransparencyDaemon_clearOptInStateForURI_application_complete___block_invoke;
  v16[3] = &unk_24DC8F4F0;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __65__TransparencyDaemon_clearOptInStateForURI_application_complete___block_invoke_318;
  v14[3] = &unk_24DC8EA78;
  v15 = v19;
  v11 = v19;
  v12 = v8;
  v13 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v16, v14);

}

void __65__TransparencyDaemon_clearOptInStateForURI_application_complete___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_317);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending clearOptInStateForURI:application:complete:", v8, 2u);
  }
  objc_msgSend(v5, "clearOptInStateForURI:application:complete:", a1[4], a1[5], a1[6]);

}

void __65__TransparencyDaemon_clearOptInStateForURI_application_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __65__TransparencyDaemon_clearOptInStateForURI_application_complete___block_invoke_318(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyCloudDeviceAdd:(id)a3 clientData:(id)a4 complete:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69__TransparencyDaemon_transparencyCloudDeviceAdd_clientData_complete___block_invoke;
  v16[3] = &unk_24DC8F4F0;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __69__TransparencyDaemon_transparencyCloudDeviceAdd_clientData_complete___block_invoke_320;
  v14[3] = &unk_24DC8EA78;
  v15 = v19;
  v11 = v19;
  v12 = v8;
  v13 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v16, v14);

}

void __69__TransparencyDaemon_transparencyCloudDeviceAdd_clientData_complete___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_319);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyCloudDeviceAdd:complete:", v8, 2u);
  }
  objc_msgSend(v5, "transparencyCloudDeviceAdd:clientData:complete:", a1[4], a1[5], a1[6]);

}

void __69__TransparencyDaemon_transparencyCloudDeviceAdd_clientData_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __69__TransparencyDaemon_transparencyCloudDeviceAdd_clientData_complete___block_invoke_320(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transparencyCloudDeviceRemove:(id)a3 clientData:(id)a4 complete:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __72__TransparencyDaemon_transparencyCloudDeviceRemove_clientData_complete___block_invoke;
  v16[3] = &unk_24DC8F4F0;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __72__TransparencyDaemon_transparencyCloudDeviceRemove_clientData_complete___block_invoke_322;
  v14[3] = &unk_24DC8EA78;
  v15 = v19;
  v11 = v19;
  v12 = v8;
  v13 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v16, v14);

}

void __72__TransparencyDaemon_transparencyCloudDeviceRemove_clientData_complete___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_321);
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending transparencyCloudDeviceRemove:complete:", v8, 2u);
  }
  objc_msgSend(v5, "transparencyCloudDeviceRemove:clientData:complete:", a1[4], a1[5], a1[6]);

}

void __72__TransparencyDaemon_transparencyCloudDeviceRemove_clientData_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

uint64_t __72__TransparencyDaemon_transparencyCloudDeviceRemove_clientData_complete___block_invoke_322(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

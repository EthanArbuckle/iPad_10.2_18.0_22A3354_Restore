@implementation SDRDiagnosticReporter

BOOL __35__SDRDiagnosticReporter_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 result;

  v0 = os_log_create("com.apple.symptomdiagnosticreporter", "framework");
  v1 = (void *)logHandle;
  logHandle = (uint64_t)v0;

  result = +[SDRDiagnosticReporter isABCEnabled](SDRDiagnosticReporter, "isABCEnabled");
  isEnabled = result;
  return result;
}

- (SDRDiagnosticReporter)init
{
  void *v3;
  SDRDiagnosticReporter *v4;

  dispatch_get_global_queue(17, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SDRDiagnosticReporter initWithQueue:](self, "initWithQueue:", v3);

  return v4;
}

- (SDRDiagnosticReporter)initWithQueue:(id)a3
{
  id v4;
  SDRDiagnosticReporter *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SDRDiagnosticReporter;
  v5 = -[SDRDiagnosticReporter init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (OS_dispatch_queue *)v4;
    }
    else
    {
      dispatch_get_global_queue(17, 0);
      v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    queue = v5->_queue;
    v5->_queue = v6;

    +[CaseDampeningExceptions setLoggingHandle:](CaseDampeningExceptions, "setLoggingHandle:", logHandle);
    -[SDRDiagnosticReporter setupXPCInterface](v5, "setupXPCInterface");
  }

  return v5;
}

- (void)setupXPCInterface
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location[2];

  if (isEnabled)
  {
    v3 = +[SDRDiagnosticReporter newXPCConnection](SDRDiagnosticReporter, "newXPCConnection");
    connection = self->_connection;
    self->_connection = v3;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254515EB8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v5);

    objc_initWeak(location, self);
    v6 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke;
    v13[3] = &unk_24BFD3630;
    objc_copyWeak(&v14, location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v13);
    v8 = v6;
    v9 = 3221225472;
    v10 = __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_2;
    v11 = &unk_24BFD3630;
    objc_copyWeak(&v12, location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &v8);
    -[NSXPCConnection resume](self->_connection, "resume", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  else
  {
    v7 = logHandle;
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_20675A000, v7, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter is disabled.", (uint8_t *)location, 2u);
    }
  }
}

+ (BOOL)isABCEnabled
{
  void *v2;
  void *v3;
  uint64_t (*v4)(const __CFString *);
  const __CFString *v5;
  NSObject *v6;

  _MergedGlobals = os_variant_has_internal_diagnostics();
  v2 = dlopen("/usr/lib/libMobileGestalt.dylib", 261);
  if (v2)
  {
    v3 = v2;
    v4 = (uint64_t (*)(const __CFString *))dlsym(v2, "MGGetStringAnswer");
    v5 = (const __CFString *)v4(CFSTR("ReleaseType"));
    if (v5)
      byte_253CFCCD9 = CFStringCompare(v5, CFSTR("Vendor"), 0) == kCFCompareEqualTo;
    dlclose(v3);
  }
  v6 = logHandle;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    +[SDRDiagnosticReporter isABCEnabled].cold.1(v6);
  return (_MergedGlobals | byte_253CFCCD9) != 0;
}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global);
}

+ (id)newXPCConnection
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.symptom_diagnostics"), 4096);
}

- (void)dealloc
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  objc_super v5;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection setInvalidationHandler:](connection, "setInvalidationHandler:", 0);
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SDRDiagnosticReporter;
  -[SDRDiagnosticReporter dealloc](&v5, sel_dealloc);
}

void __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
  {
    __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_cold_1();
    if (!v2)
      goto LABEL_5;
  }
  else if (!v2)
  {
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_118;
    v4[3] = &unk_24BFD3608;
    v5 = v2;
    v6 = WeakRetained;
    dispatch_async(v3, v4);

  }
LABEL_5:

}

uint64_t __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_118(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reporterConnectionInvalidated:", *(_QWORD *)(a1 + 40));
}

void __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
  {
    __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_2_cold_1();
    if (!v2)
      goto LABEL_5;
  }
  else if (!v2)
  {
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_121;
    v4[3] = &unk_24BFD3608;
    v5 = v2;
    v6 = WeakRetained;
    dispatch_async(v3, v4);

  }
LABEL_5:

}

uint64_t __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_121(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reporterConnectionInterrupted:", *(_QWORD *)(a1 + 40));
}

- (int)checkSignatureValidity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int *v6;
  int v7;
  void *v9;
  void *v10;
  int *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int *v18;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("domain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    v6 = &kSymptomDiagnosticErrorInvalidParameters;
    goto LABEL_6;
  }
  if ((unint64_t)objc_msgSend(v5, "length") < 0x101)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "length"))
    {
      if ((unint64_t)objc_msgSend(v10, "length") < 0x101)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtype"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12 && (unint64_t)objc_msgSend(v12, "length") >= 0x101)
        {
          v7 = 23;
        }
        else
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("additional"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14 && (unint64_t)objc_msgSend(v14, "length") >= 0x101)
          {
            v7 = 23;
          }
          else
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("detected"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16 && (unint64_t)objc_msgSend(v16, "length") > 0x100)
              v18 = &kSymptomDiagnosticErrorInvalidSignature;
            else
              v18 = &kSymptomDiagnosticErrorNone;
            v7 = *v18;

          }
        }

        goto LABEL_14;
      }
      v11 = &kSymptomDiagnosticErrorInvalidSignature;
    }
    else
    {
      v11 = &kSymptomDiagnosticErrorInvalidParameters;
    }
    v7 = *v11;
LABEL_14:

    goto LABEL_7;
  }
  v6 = &kSymptomDiagnosticErrorInvalidSignature;
LABEL_6:
  v7 = *v6;
LABEL_7:

  return v7;
}

- (id)actionsDictionary:(id)a3 withIDSDestinations:(id)a4 validFor:(double)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  objc_msgSend(v8, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("idsdest"));

  v12 = 3600.0;
  if (a5 >= 1.0)
    v12 = a5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("remotewindow"));

  return v10;
}

- (id)signatureWithDomain:(id)a3 type:(id)a4 subType:(id)a5 detectedProcess:(id)a6 triggerThresholdValues:(id)a7
{
  return -[SDRDiagnosticReporter signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:](self, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", a3, a4, a5, 0, a6, a7);
}

- (id)signatureWithDomain:(id)a3 type:(id)a4 subType:(id)a5 subtypeContext:(id)a6 detectedProcess:(id)a7 triggerThresholdValues:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;

  v13 = a5;
  v14 = a6;
  v15 = a8;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", a3, CFSTR("domain"), a4, CFSTR("type"), a7, CFSTR("detected"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
    objc_msgSend(v16, "setObject:forKey:", v13, CFSTR("subtype"));
  if (objc_msgSend(v14, "length"))
    objc_msgSend(v16, "setObject:forKey:", v14, CFSTR("additional"));
  if (objc_msgSend(v15, "length"))
    objc_msgSend(v16, "setObject:forKey:", v15, CFSTR("threshval"));

  return v16;
}

- (BOOL)groupCaseIdentifierForSignature:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSXPCConnection *connection;
  uint64_t v11;
  id *v12;
  id v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *queue;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  id v22;
  int v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (isEnabled)
  {
    v9 = -[SDRDiagnosticReporter checkSignatureValidity:](self, "checkSignatureValidity:", v6);
    if (v9)
    {
      if (!v8)
      {
LABEL_13:
        v16 = v9 == 0;
        goto LABEL_14;
      }
      queue = self->_queue;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_4;
      v21[3] = &unk_24BFD36F8;
      v12 = &v22;
      v22 = v8;
      v23 = v9;
      dispatch_async(queue, v21);
    }
    else
    {
      connection = self->_connection;
      v11 = MEMORY[0x24BDAC760];
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke;
      v26[3] = &unk_24BFD3680;
      v12 = &v27;
      v13 = v8;
      v26[4] = self;
      v27 = v13;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v24[0] = v11;
        v24[1] = 3221225472;
        v24[2] = __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_2;
        v24[3] = &unk_24BFD36D0;
        v24[4] = self;
        v25 = v13;
        objc_msgSend(v14, "requestGroupCaseIdentifierForSignature:reply:", v6, v24);

      }
      else
      {
        v9 = 10;
      }

    }
    goto LABEL_13;
  }
  if (v7)
  {
    v15 = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_5;
    block[3] = &unk_24BFD3658;
    v20 = v7;
    dispatch_async(v15, block);

  }
  v16 = 0;
LABEL_14:

  return v16;
}

void __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_cold_1();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_124;
    block[3] = &unk_24BFD3658;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

void __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_124(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 11, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_3;
    v6[3] = &unk_24BFD36A8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, *(int *)(a1 + 40), 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)_payloadAugmentedWithSandboxExtensionTokensDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int *v17;
  char *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  char *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("path"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v24 = v4;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v23 = v5;
      obj = v5;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v27 != v9)
              objc_enumerationMutation(obj);
            v11 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i));
            objc_msgSend(v11, "UTF8String");
            v12 = sandbox_extension_issue_file();
            v13 = logHandle;
            if (v12)
            {
              v14 = (void *)v12;
              if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v31 = v11;
                _os_log_impl(&dword_20675A000, v13, OS_LOG_TYPE_INFO, "SDRDiagnosticReporter: Granted Read sandbox extension for payload path '%{public}@'.", buf, 0xCu);
              }
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14, v23);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v11);

              free(v14);
            }
            else if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_ERROR))
            {
              v16 = v13;
              v17 = __error();
              v18 = strerror(*v17);
              *(_DWORD *)buf = 138543618;
              v31 = v11;
              v32 = 2080;
              v33 = v18;
              _os_log_error_impl(&dword_20675A000, v16, OS_LOG_TYPE_ERROR, "SDRDiagnosticReporter: Failed to grant Read sandbox extension for payload path '%{public}@' with error: %s.", buf, 0x16u);

            }
          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v8);
      }

      v19 = objc_msgSend(v6, "count");
      if (v19 == objc_msgSend(obj, "count"))
      {
        v4 = v24;
        v20 = (id)objc_msgSend(v24, "mutableCopy");
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v6, CFSTR("sandbox_ext_token_dict"));
      }
      else
      {
        v21 = (void *)logHandle;
        if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_ERROR))
          -[SDRDiagnosticReporter _payloadAugmentedWithSandboxExtensionTokensDict:].cold.1(v21, obj, v6);
        v20 = 0;
        v4 = v24;
      }
      v5 = v23;

    }
    else
    {
      v20 = v4;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)commonPreflightChecksForSignature:(id)a3 payload:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (v10)
  {
    if (isEnabled)
    {
      v12 = -[SDRDiagnosticReporter checkSignatureValidity:](self, "checkSignatureValidity:", v8);
      if (!(_DWORD)v12)
      {
        -[SDRDiagnosticReporter _payloadAugmentedWithSandboxExtensionTokensDict:](self, "_payloadAugmentedWithSandboxExtensionTokensDict:", v9);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v9 && !v13)
        {
          v15 = &kSymptomDiagnosticErrorPayloadSandboxTokenError;
LABEL_29:
          v11[2](v11, *v15, 0);
          goto LABEL_30;
        }
        if (+[CaseDampeningExceptions allowDampeningExceptionFor:](CaseDampeningExceptions, "allowDampeningExceptionFor:", v8))
        {
          v17 = logHandle;
          if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v23) = 0;
            _os_log_impl(&dword_20675A000, v17, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: Signature matches dampening exception, will permit XPC call", (uint8_t *)&v23, 2u);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSince1970");
          v20 = v19;

          if (v20 < *(double *)&_dailyCaseLimitActiveUntil)
          {
            v21 = logHandle;
            if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
            {
              v23 = 134217984;
              v24 = _dailyCaseLimitActiveUntil;
              _os_log_impl(&dword_20675A000, v21, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: A daily rate limit is in effect until %.0f. Rejecting case", (uint8_t *)&v23, 0xCu);
            }
            if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
              -[SDRDiagnosticReporter commonPreflightChecksForSignature:payload:callback:].cold.1();
            -[SDRDiagnosticReporter submitDiagnosticIncidentEventForCaseSignature:handledResult:dampeningResult:closureType:](self, "submitDiagnosticIncidentEventForCaseSignature:handledResult:dampeningResult:closureType:", v8, 2, 2, 3);
            v15 = &kSymptomDiagnosticErrorDailyLimitExceeded;
            goto LABEL_29;
          }
          if (*(double *)&_dailyCaseLimitActiveUntil > 0.0)
            -[SDRDiagnosticReporter resetDailyCaseLimit](self, "resetDailyCaseLimit");
          if (v20 < *(double *)&_apiRateLimitActiveUntil)
          {
            v22 = logHandle;
            if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
            {
              v23 = 134217984;
              v24 = _apiRateLimitActiveUntil;
              _os_log_impl(&dword_20675A000, v22, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: An API rate limit is in effect until %.0f. Rejecting case", (uint8_t *)&v23, 0xCu);
            }
            if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
              -[SDRDiagnosticReporter commonPreflightChecksForSignature:payload:callback:].cold.2();
            -[SDRDiagnosticReporter submitDiagnosticIncidentEventForCaseSignature:handledResult:dampeningResult:closureType:](self, "submitDiagnosticIncidentEventForCaseSignature:handledResult:dampeningResult:closureType:", v8, 2, 8, 3);
            v15 = &kSymptomDiagnosticErrorRequestThrottled;
            goto LABEL_29;
          }
          if (*(double *)&_apiRateLimitActiveUntil > 0.0)
            -[SDRDiagnosticReporter resetAPIRateLimit](self, "resetAPIRateLimit");
        }
        ((void (**)(_QWORD, uint64_t, void *))v11)[2](v11, v12, v14);
LABEL_30:

        goto LABEL_31;
      }
      v16 = logHandle;
      if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138477827;
        v24 = (uint64_t)v8;
        _os_log_impl(&dword_20675A000, v16, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: Failed signature validation check for %{private}@", (uint8_t *)&v23, 0xCu);
      }
      v11[2](v11, v12, 0);
    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
    }
  }
LABEL_31:

}

- (void)parseCaseTriggerResponse:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  unint64_t v11;
  double v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("success"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 31)
    {
      objc_msgSend(v8, "timeIntervalSince1970");
      v11 = (unint64_t)v10;
      objc_msgSend(v9, "timeIntervalSince1970");
      *(double *)&_dailyCaseLimitActiveUntil = (double)(v11
                                                      + 86400
                                                      + 86400 * ((unint64_t)v12 / 0x15180)
                                                      - (unint64_t)v12);
      v13 = logHandle;
      if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 134217984;
        v20 = _dailyCaseLimitActiveUntil;
        _os_log_impl(&dword_20675A000, v13, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: Received 'daily limit exceeded' response. Will reject all cases until %.0f", (uint8_t *)&v19, 0xCu);
      }
    }
    else if (v7 == 41)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("expiresIn"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "doubleValue");
        v16 = v15;
        objc_msgSend(v9, "timeIntervalSince1970");
        *(double *)&_apiRateLimitActiveUntil = v16 + v17;
        v18 = logHandle;
        if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 134218240;
          v20 = _apiRateLimitActiveUntil;
          v21 = 2048;
          v22 = v16;
          _os_log_impl(&dword_20675A000, v18, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: Received 'API rate limit exceeded' response. Will reject all cases until %.0f (in %.0f s)", (uint8_t *)&v19, 0x16u);
        }
      }

    }
  }

}

- (void)resetDailyCaseLimit
{
  NSObject *v2;
  uint8_t v3[16];

  if (*(double *)&_dailyCaseLimitActiveUntil > 0.0)
  {
    v2 = logHandle;
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_20675A000, v2, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: Resetting daily case limiter", v3, 2u);
    }
    _dailyCaseLimitActiveUntil = 0;
  }
}

- (void)resetAPIRateLimit
{
  NSObject *v2;
  uint8_t v3[16];

  if (*(double *)&_apiRateLimitActiveUntil > 0.0)
  {
    v2 = logHandle;
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_20675A000, v2, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: Resetting API rate limiter", v3, 2u);
    }
    _apiRateLimitActiveUntil = 0;
  }
}

- (void)submitDiagnosticIncidentEventForCaseSignature:(id)a3 handledResult:(unint64_t)a4 dampeningResult:(unint64_t)a5 closureType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  -[SDRDiagnosticReporter buildDiagnosticIncidentEventForCaseSignature:handledResult:dampeningResult:closureType:](self, "buildDiagnosticIncidentEventForCaseSignature:handledResult:dampeningResult:closureType:", v10, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13;
  v12 = v10;
  AnalyticsSendEventLazy();

}

id __113__SDRDiagnosticReporter_submitDiagnosticIncidentEventForCaseSignature_handledResult_dampeningResult_closureType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)logHandle;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("domain"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("subtype"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("detected"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544130;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_20675A000, v4, OS_LOG_TYPE_INFO, "Submitting analytics for case domain=%{public}@ type=%{public}@ subtype=%{public}@ process=%{public}@ to CoreAnalytics", (uint8_t *)&v10, 0x2Au);

  }
  return *(id *)(a1 + 40);
}

- (id)buildDiagnosticIncidentEventForCaseSignature:(id)a3 handledResult:(unint64_t)a4 dampeningResult:(unint64_t)a5 closureType:(unint64_t)a6
{
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = (objc_class *)MEMORY[0x24BDBCED8];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("domain"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("caseDomain"));

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("caseType"));

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("subtype"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("caseSubtype"));

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("additional"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("caseSubtypeContext"));

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("detected"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("caseDetectedProcess"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &stru_24BFD4148, CFSTR("caseIdentifier"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("hasGroupIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("handledResult"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("dampeningResult"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("closureType"));

  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    -[SDRDiagnosticReporter buildDiagnosticIncidentEventForCaseSignature:handledResult:dampeningResult:closureType:].cold.1();
  return v11;
}

- (BOOL)snapshotWithSignature:(id)a3 delay:(double)a4 events:(id)a5 payload:(id)a6 reply:(id)a7
{
  return -[SDRDiagnosticReporter snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:](self, "snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:", a3, a5, a6, 0, 0, a7, a4);
}

- (BOOL)snapshotWithSignature:(id)a3 delay:(double)a4 events:(id)a5 payload:(id)a6 wantsRemoteCase:(BOOL)a7 reply:(id)a8
{
  return -[SDRDiagnosticReporter snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:](self, "snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:", a3, a5, a6, 0, a7, a8, a4);
}

- (BOOL)snapshotWithSignature:(id)a3 delay:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 reply:(id)a8
{
  return -[SDRDiagnosticReporter snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:](self, "snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:", a3, a5, a6, a7, 0, a8, a4);
}

- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 event:(id)a5 payload:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *queue;
  BOOL v19;
  _QWORD block[4];
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (isEnabled)
  {
    if (v13)
    {
      v23[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    v19 = -[SDRDiagnosticReporter snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:](self, "snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:", v12, v17, v14, 0, 0, v16, a4);
  }
  else
  {
    if (!v15)
    {
      v19 = 0;
      goto LABEL_9;
    }
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__SDRDiagnosticReporter_snapshotWithSignature_duration_event_payload_reply___block_invoke;
    block[3] = &unk_24BFD3658;
    v22 = v15;
    dispatch_async(queue, block);
    v19 = 0;
    v17 = v22;
  }

LABEL_9:
  return v19;
}

void __76__SDRDiagnosticReporter_snapshotWithSignature_duration_event_payload_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 reply:(id)a7
{
  return -[SDRDiagnosticReporter snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:](self, "snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:", a3, a5, a6, 0, 0, a7, a4);
}

- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 wantsRemoteCase:(BOOL)a7 reply:(id)a8
{
  return -[SDRDiagnosticReporter snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:](self, "snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:", a3, a5, a6, 0, a7, a8, a4);
}

- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 reply:(id)a8
{
  return -[SDRDiagnosticReporter snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:](self, "snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:", a3, a5, a6, a7, 0, a8, a4);
}

- (BOOL)snapshotWithSignature:(id)a3 delay:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 wantsRemoteCase:(BOOL)a8 reply:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  double v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 1;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke;
  v26[3] = &unk_24BFD3748;
  v26[4] = self;
  v31 = &v34;
  v21 = v20;
  v30 = v21;
  v22 = v16;
  v27 = v22;
  v32 = a4;
  v23 = v17;
  v28 = v23;
  v24 = v19;
  v29 = v24;
  v33 = a8;
  -[SDRDiagnosticReporter commonPreflightChecksForSignature:payload:callback:](self, "commonPreflightChecksForSignature:payload:callback:", v22, v18, v26);
  LOBYTE(self) = *((_BYTE *)v35 + 24);

  _Block_object_dispose(&v34, 8);
  return (char)self;
}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _QWORD block[4];
  id v25;
  int v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;

  v5 = a3;
  if (!a2)
  {
    v6 = logHandle;
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
      __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_3(a1, v6, v7, v8, v9, v10, v11, v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    {
      __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_2();
      if (v13)
        goto LABEL_6;
    }
    else if (v13)
    {
LABEL_6:
      v14 = (unint64_t)*(double *)(a1 + 80);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      v17 = *(unsigned __int8 *)(a1 + 88);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_2;
      v27[3] = &unk_24BFD36D0;
      v18 = *(_QWORD *)(a1 + 56);
      v19 = *(id *)(a1 + 64);
      v27[4] = *(_QWORD *)(a1 + 32);
      v28 = v19;
      objc_msgSend(v13, "snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:", v15, v14, v16, v5, v18, v17, v27);

LABEL_14:
      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_ERROR))
      __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_1();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    v22 = *(void **)(a1 + 64);
    if (v22)
    {
      v23 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_154;
      v29[3] = &unk_24BFD3658;
      v30 = v22;
      dispatch_async(v23, v29);
      v13 = v30;
    }
    goto LABEL_14;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  v20 = *(void **)(a1 + 64);
  if (v20)
  {
    v21 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_4;
    block[3] = &unk_24BFD36F8;
    v25 = v20;
    v26 = a2;
    dispatch_async(v21, block);
    v13 = v25;
    goto LABEL_14;
  }
LABEL_15:

}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_154(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 10, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_3;
    v9 = &unk_24BFD36A8;
    v11 = v4;
    v10 = v3;
    dispatch_async(v5, &v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "parseCaseTriggerResponse:", v3, v6, v7, v8, v9);

}

uint64_t __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, *(int *)(a1 + 40), 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)snapshotWithSignature:(id)a3 withIDSDestinations:(id)a4 validFor:(double)a5 delay:(double)a6 events:(id)a7 payload:(id)a8 actions:(id)a9 reply:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *queue;
  BOOL v28;
  void *v29;
  _QWORD block[4];
  id v32;

  v18 = a3;
  v19 = a4;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = v23;
  if (isEnabled)
  {
    v25 = objc_msgSend(v19, "count");
    if (v25)
    {
      -[SDRDiagnosticReporter actionsDictionary:withIDSDestinations:validFor:](self, "actionsDictionary:withIDSDestinations:validFor:", v22, v19, a5);
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = v22;
    }
    v29 = v26;
    v28 = -[SDRDiagnosticReporter snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:](self, "snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:", v18, v20, v21, v26, v25 != 0, v24, a6);

  }
  else
  {
    if (v23)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __111__SDRDiagnosticReporter_snapshotWithSignature_withIDSDestinations_validFor_delay_events_payload_actions_reply___block_invoke;
      block[3] = &unk_24BFD3658;
      v32 = v23;
      dispatch_async(queue, block);

    }
    v28 = 0;
  }

  return v28;
}

void __111__SDRDiagnosticReporter_snapshotWithSignature_withIDSDestinations_validFor_delay_events_payload_actions_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 payload:(id)a5 reply:(id)a6
{
  return -[SDRDiagnosticReporter snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:](self, "snapshotWithSignature:delay:events:payload:actions:wantsRemoteCase:reply:", a3, 0, a5, 0, 0, a6, a4);
}

- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 event:(id)a5 payload:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *queue;
  BOOL v19;
  _QWORD block[4];
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (isEnabled)
  {
    if (v13)
    {
      v23[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    v19 = -[SDRDiagnosticReporter startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:](self, "startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:", v12, v17, v14, 0, 0, v16, a4);
  }
  else
  {
    if (!v15)
    {
      v19 = 0;
      goto LABEL_9;
    }
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__SDRDiagnosticReporter_startSessionWithSignature_duration_event_payload_reply___block_invoke;
    block[3] = &unk_24BFD3658;
    v22 = v15;
    dispatch_async(queue, block);
    v19 = 0;
    v17 = v22;
  }

LABEL_9:
  return v19;
}

void __80__SDRDiagnosticReporter_startSessionWithSignature_duration_event_payload_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 reply:(id)a7
{
  return -[SDRDiagnosticReporter startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:](self, "startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:", a3, a5, a6, 0, 0, a7, a4);
}

- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 wantsRemoteCase:(BOOL)a7 reply:(id)a8
{
  return -[SDRDiagnosticReporter startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:](self, "startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:", a3, a5, a6, 0, a7, a8, a4);
}

- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 reply:(id)a8
{
  return -[SDRDiagnosticReporter startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:](self, "startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:", a3, a5, a6, a7, 0, a8, a4);
}

- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 wantsRemoteCase:(BOOL)a8 reply:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  double v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 1;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke;
  v26[3] = &unk_24BFD3770;
  v26[4] = self;
  v21 = v20;
  v30 = v21;
  v31 = &v34;
  v22 = v16;
  v27 = v22;
  v32 = a4;
  v23 = v17;
  v28 = v23;
  v24 = v19;
  v29 = v24;
  v33 = a8;
  -[SDRDiagnosticReporter commonPreflightChecksForSignature:payload:callback:](self, "commonPreflightChecksForSignature:payload:callback:", v22, v18, v26);
  LOBYTE(self) = *((_BYTE *)v35 + 24);

  _Block_object_dispose(&v34, 8);
  return (char)self;
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  int v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;

  v5 = a3;
  if (!a2)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v7 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_2;
    v28[3] = &unk_24BFD3680;
    v8 = &v29;
    v9 = *(id *)(a1 + 64);
    v28[4] = *(_QWORD *)(a1 + 32);
    v29 = v9;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (unint64_t)*(double *)(a1 + 80);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v14 = *(unsigned __int8 *)(a1 + 88);
      v24[0] = v7;
      v24[1] = 3221225472;
      v24[2] = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_2_158;
      v24[3] = &unk_24BFD36D0;
      v15 = *(_QWORD *)(a1 + 56);
      v16 = *(id *)(a1 + 64);
      v24[4] = *(_QWORD *)(a1 + 32);
      v25 = v16;
      objc_msgSend(v10, "startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:", v12, v11, v13, v5, v15, v14, v24);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_ERROR))
        __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_1();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      v19 = *(void **)(a1 + 64);
      if (v19)
      {
        v20 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
        v26[0] = v7;
        v26[1] = 3221225472;
        v26[2] = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_157;
        v26[3] = &unk_24BFD3658;
        v27 = v19;
        dispatch_async(v20, v26);

        goto LABEL_11;
      }
    }

LABEL_11:
    goto LABEL_12;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  v17 = *(void **)(a1 + 64);
  if (v17)
  {
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_4;
    block[3] = &unk_24BFD36F8;
    v8 = &v22;
    v22 = v17;
    v23 = a2;
    dispatch_async(v18, block);
    goto LABEL_11;
  }
LABEL_12:

}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_ERROR))
    __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_156;
    block[3] = &unk_24BFD3658;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_156(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 11, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_157(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 10, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_2_158(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_3;
    v9 = &unk_24BFD36A8;
    v11 = v4;
    v10 = v3;
    dispatch_async(v5, &v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "parseCaseTriggerResponse:", v3, v6, v7, v8, v9);

}

uint64_t __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, *(int *)(a1 + 40), 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)startSessionWithSignature:(id)a3 withIDSDestinations:(id)a4 validFor:(double)a5 duration:(double)a6 events:(id)a7 payload:(id)a8 actions:(id)a9 reply:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *queue;
  BOOL v28;
  void *v29;
  _QWORD block[4];
  id v32;

  v18 = a3;
  v19 = a4;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = v23;
  if (isEnabled)
  {
    v25 = objc_msgSend(v19, "count");
    if (v25)
    {
      -[SDRDiagnosticReporter actionsDictionary:withIDSDestinations:validFor:](self, "actionsDictionary:withIDSDestinations:validFor:", v22, v19, a5);
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = v22;
    }
    v29 = v26;
    v28 = -[SDRDiagnosticReporter startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:](self, "startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:", v18, v20, v21, v26, v25 != 0, v24, a6);

  }
  else
  {
    if (v23)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __118__SDRDiagnosticReporter_startSessionWithSignature_withIDSDestinations_validFor_duration_events_payload_actions_reply___block_invoke;
      block[3] = &unk_24BFD3658;
      v32 = v23;
      dispatch_async(queue, block);

    }
    v28 = 0;
  }

  return v28;
}

void __118__SDRDiagnosticReporter_startSessionWithSignature_withIDSDestinations_validFor_duration_events_payload_actions_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 payload:(id)a5 reply:(id)a6
{
  return -[SDRDiagnosticReporter startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:](self, "startSessionWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:", a3, 0, a5, 0, 0, a6, a4);
}

- (BOOL)endSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (isEnabled && objc_msgSend(v4, "length"))
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_159);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v6 != 0;
    if (v6)
      objc_msgSend(v6, "endSession:", v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __36__SDRDiagnosticReporter_endSession___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    __36__SDRDiagnosticReporter_endSession___block_invoke_cold_1();

}

- (BOOL)cancelSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (isEnabled && objc_msgSend(v4, "length"))
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_160);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v6 != 0;
    if (v6)
      objc_msgSend(v6, "cancelSession:", v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __39__SDRDiagnosticReporter_cancelSession___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    __39__SDRDiagnosticReporter_cancelSession___block_invoke_cold_1();

}

- (BOOL)addToSession:(id)a3 event:(id)a4 payload:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4)
  {
    v17 = a4;
    v13 = (void *)MEMORY[0x24BDBCE30];
    v14 = a4;
    objc_msgSend(v13, "arrayWithObjects:count:", &v17, 1);
    a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = -[SDRDiagnosticReporter addToSession:events:payload:reply:](self, "addToSession:events:payload:reply:", v10, a4, v11, v12, v17, v18);

  return v15;
}

- (BOOL)addToSession:(id)a3 events:(id)a4 payload:(id)a5 reply:(id)a6
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  NSXPCConnection *connection;
  uint64_t v16;
  id *v17;
  id v18;
  void *v19;
  BOOL v20;
  NSObject *queue;
  _QWORD *v22;
  _QWORD block[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;

  v10 = a3;
  v11 = (unint64_t)a4;
  v12 = (unint64_t)a5;
  v13 = a6;
  v14 = v13;
  if (!isEnabled)
  {
    if (v13)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_5;
      block[3] = &unk_24BFD3658;
      v17 = &v25;
      v25 = v13;
      v22 = block;
      goto LABEL_11;
    }
LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  if (v11 | v12 && objc_msgSend(v10, "length"))
  {
    connection = self->_connection;
    v16 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke;
    v30[3] = &unk_24BFD3680;
    v17 = &v31;
    v18 = v14;
    v30[4] = self;
    v31 = v18;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 != 0;
    if (v19)
    {
      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_2;
      v28[3] = &unk_24BFD36D0;
      v28[4] = self;
      v29 = v18;
      objc_msgSend(v19, "addToSession:events:payload:reply:", v10, v11, v12, v28);

    }
    goto LABEL_12;
  }
  if (!v14)
    goto LABEL_13;
  queue = self->_queue;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_4;
  v26[3] = &unk_24BFD3658;
  v17 = &v27;
  v27 = v14;
  v22 = v26;
LABEL_11:
  dispatch_async(queue, v22);
  v20 = 0;
LABEL_12:

LABEL_14:
  return v20;
}

void __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_cold_1();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_161;
    block[3] = &unk_24BFD3658;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

void __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_161(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 11, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_3;
    v6[3] = &unk_24BFD36A8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 20, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)addSignatureContentForSession:(id)a3 key:(id)a4 content:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSXPCConnection *connection;
  uint64_t v16;
  id *v17;
  id v18;
  void *v19;
  BOOL v20;
  NSObject *queue;
  _QWORD *v22;
  _QWORD block[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!isEnabled)
  {
    if (v13)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_5;
      block[3] = &unk_24BFD3658;
      v17 = &v25;
      v25 = v13;
      v22 = block;
      goto LABEL_12;
    }
LABEL_14:
    v20 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v11, "length") && objc_msgSend(v12, "length") && objc_msgSend(v10, "length"))
  {
    connection = self->_connection;
    v16 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke;
    v30[3] = &unk_24BFD3680;
    v17 = &v31;
    v18 = v14;
    v30[4] = self;
    v31 = v18;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 != 0;
    if (v19)
    {
      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_2;
      v28[3] = &unk_24BFD36D0;
      v28[4] = self;
      v29 = v18;
      objc_msgSend(v19, "addSignatureContentForSession:key:content:reply:", v10, v11, v12, v28);

    }
    goto LABEL_13;
  }
  if (!v14)
    goto LABEL_14;
  queue = self->_queue;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_4;
  v26[3] = &unk_24BFD3658;
  v17 = &v27;
  v27 = v14;
  v22 = v26;
LABEL_12:
  dispatch_async(queue, v22);
  v20 = 0;
LABEL_13:

LABEL_15:
  return v20;
}

void __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_cold_1();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_162;
    block[3] = &unk_24BFD3658;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

void __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_162(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 11, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_3;
    v6[3] = &unk_24BFD36A8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 20, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)getDiagnosticPayloadsForSignatures:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  id *v11;
  id v12;
  void *v13;
  BOOL v14;
  id *v15;
  NSObject *v16;
  NSObject *queue;
  _QWORD v19[4];
  id v20;
  _QWORD block[4];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (isEnabled)
  {
    connection = self->_connection;
    v10 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke;
    v25[3] = &unk_24BFD3680;
    v11 = &v26;
    v12 = v7;
    v25[4] = self;
    v26 = v12;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;
    if (v13)
    {
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_2;
      v23[3] = &unk_24BFD3820;
      v15 = &v24;
      v23[4] = self;
      v24 = v12;
      objc_msgSend(v13, "getDiagnosticPayloadsForSignatures:reply:", v6, v23);
    }
    else
    {
      if (!v12)
      {
LABEL_9:

        goto LABEL_10;
      }
      queue = self->_queue;
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_4;
      block[3] = &unk_24BFD3658;
      v15 = &v22;
      v22 = v12;
      dispatch_async(queue, block);
    }

    goto LABEL_9;
  }
  if (!v7)
  {
    v14 = 0;
    goto LABEL_11;
  }
  v16 = self->_queue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_5;
  v19[3] = &unk_24BFD3658;
  v11 = &v20;
  v20 = v7;
  dispatch_async(v16, v19);
  v14 = 0;
LABEL_10:

LABEL_11:
  return v14;
}

void __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_cold_1();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_163;
    block[3] = &unk_24BFD3658;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

void __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_163(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 32, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_3;
    block[3] = &unk_24BFD37F8;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 19, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (BOOL)triggerRemoteSessionForSignature:(id)a3 caseGroupID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  NSXPCConnection *connection;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  BOOL v16;
  NSObject *queue;
  void *v18;
  _QWORD block[4];
  id v21;
  _QWORD v22[5];
  void (**v23)(_QWORD, _QWORD);
  _QWORD v24[5];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (!isEnabled)
  {
    if (v10)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_4;
      block[3] = &unk_24BFD3658;
      v21 = v10;
      dispatch_async(queue, block);

    }
    goto LABEL_11;
  }
  if (!objc_msgSend(v8, "count") || !objc_msgSend(v9, "length"))
  {
    if (v11)
    {
      responseDict(0, 20, 0, 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v11)[2](v11, v18);

    }
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  connection = self->_connection;
  v13 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke;
  v24[3] = &unk_24BFD3680;
  v14 = v11;
  v24[4] = self;
  v25 = v14;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;
  if (v15)
  {
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_2;
    v22[3] = &unk_24BFD36D0;
    v22[4] = self;
    v23 = v14;
    objc_msgSend(v15, "triggerRemoteSessionForSignature:groupIdentifier:reply:", v8, v9, v22);

  }
LABEL_12:

  return v16;
}

void __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_cold_1();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_166;
    block[3] = &unk_24BFD3658;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

void __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_166(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 11, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_3;
    v6[3] = &unk_24BFD36A8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)casesListCallbackWithResult:(id)a3 service:(id)a4 identifier:(id)a5 count:(unint64_t)a6 container:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *queue;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v17, "addObjectsFromArray:", v14);
    objc_msgSend(v17, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("case_identifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __94__SDRDiagnosticReporter_casesListCallbackWithResult_service_identifier_count_container_reply___block_invoke;
    v25[3] = &unk_24BFD3848;
    v25[4] = self;
    v26 = v15;
    v27 = v16;
    v30 = a6;
    v28 = v17;
    v29 = v18;
    objc_msgSend(v26, "getCasesListFromIdentifier:count:reply:", v20, a6, v25);

LABEL_5:
    goto LABEL_6;
  }
  if (v18)
  {
    queue = self->_queue;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __94__SDRDiagnosticReporter_casesListCallbackWithResult_service_identifier_count_container_reply___block_invoke_2;
    v22[3] = &unk_24BFD36A8;
    v24 = v18;
    v23 = v17;
    dispatch_async(queue, v22);

    v19 = v24;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __94__SDRDiagnosticReporter_casesListCallbackWithResult_service_identifier_count_container_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "casesListCallbackWithResult:service:identifier:count:container:reply:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __94__SDRDiagnosticReporter_casesListCallbackWithResult_service_identifier_count_container_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)getAllDiagnosticCasesWithReply:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *connection;
  uint64_t v7;
  id *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *queue;
  _QWORD block[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = v4;
  if (isEnabled)
  {
    connection = self->_connection;
    v7 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke;
    v24[3] = &unk_24BFD3680;
    v8 = &v25;
    v9 = v4;
    v24[4] = self;
    v25 = v9;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v19[0] = v7;
      v19[1] = 3221225472;
      v19[2] = __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_2;
      v19[3] = &unk_24BFD3870;
      v19[4] = self;
      v23 = 10;
      v20 = v10;
      v21 = v11;
      v22 = v9;
      v12 = v11;
      objc_msgSend(v20, "getCasesListFromIdentifier:count:reply:", 0, 10, v19);

    }
    else
    {
      if (!v9)
      {
LABEL_9:

        goto LABEL_10;
      }
      queue = self->_queue;
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_3;
      v17[3] = &unk_24BFD3658;
      v18 = v9;
      dispatch_async(queue, v17);
      v12 = v18;
    }

    goto LABEL_9;
  }
  if (v4)
  {
    v13 = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_4;
    block[3] = &unk_24BFD3658;
    v8 = &v16;
    v16 = v4;
    dispatch_async(v13, block);
LABEL_10:

  }
}

void __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_cold_1();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_168;
    block[3] = &unk_24BFD3658;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

void __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_168(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 53, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "casesListCallbackWithResult:service:identifier:count:container:reply:", a2, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 19, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)caseSummariesListCallbackWithResult:(id)a3 service:(id)a4 caseSummaryType:(id)a5 count:(unint64_t)a6 container:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *queue;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v17, "addObjectsFromArray:", v14);
    objc_msgSend(v14, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("caseID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __107__SDRDiagnosticReporter_caseSummariesListCallbackWithResult_service_caseSummaryType_count_container_reply___block_invoke;
    v25[3] = &unk_24BFD3848;
    v25[4] = self;
    v26 = v15;
    v27 = v16;
    v30 = a6;
    v28 = v17;
    v29 = v18;
    objc_msgSend(v26, "listCaseSummariesOfType:fromIdentifier:count:reply:", v27, v20, a6, v25);

LABEL_5:
    goto LABEL_6;
  }
  if (v18)
  {
    queue = self->_queue;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __107__SDRDiagnosticReporter_caseSummariesListCallbackWithResult_service_caseSummaryType_count_container_reply___block_invoke_2;
    v22[3] = &unk_24BFD36A8;
    v24 = v18;
    v23 = v17;
    dispatch_async(queue, v22);

    v19 = v24;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __107__SDRDiagnosticReporter_caseSummariesListCallbackWithResult_service_caseSummaryType_count_container_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "caseSummariesListCallbackWithResult:service:caseSummaryType:count:container:reply:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __107__SDRDiagnosticReporter_caseSummariesListCallbackWithResult_service_caseSummaryType_count_container_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)getDiagnosticCaseSummariesOfType:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSXPCConnection *connection;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id *v15;
  NSObject *queue;
  _QWORD v17[4];
  id v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (isEnabled)
  {
    v9 = MEMORY[0x24BDAC760];
    connection = self->_connection;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke;
    v29[3] = &unk_24BFD3680;
    v11 = v7;
    v29[4] = self;
    v30 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = __Block_byref_object_copy_;
      v27[4] = __Block_byref_object_dispose_;
      v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_2;
      v21[3] = &unk_24BFD3898;
      v21[4] = self;
      v22 = v12;
      v25 = v27;
      v26 = 10;
      v23 = v6;
      v24 = v11;
      objc_msgSend(v22, "listCaseSummariesOfType:fromIdentifier:count:reply:", v23, 0, 10, v21);

      _Block_object_dispose(v27, 8);
      v13 = v28;
    }
    else
    {
      if (!v11)
      {
LABEL_9:
        v15 = &v30;

        goto LABEL_10;
      }
      queue = self->_queue;
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_3;
      block[3] = &unk_24BFD3658;
      v20 = v11;
      dispatch_async(queue, block);
      v13 = v20;
    }

    goto LABEL_9;
  }
  if (v7)
  {
    v14 = self->_queue;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_4;
    v17[3] = &unk_24BFD3658;
    v15 = &v18;
    v18 = v7;
    dispatch_async(v14, v17);
LABEL_10:

  }
}

void __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_cold_1();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_172;
    block[3] = &unk_24BFD3658;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

void __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_172(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 53, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "caseSummariesListCallbackWithResult:service:caseSummaryType:count:container:reply:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 56));
}

void __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 19, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)getDiagnosticCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  id *v11;
  id v12;
  void *v13;
  id *v14;
  NSObject *v15;
  NSObject *queue;
  _QWORD v17[4];
  id v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (isEnabled)
  {
    connection = self->_connection;
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke;
    v23[3] = &unk_24BFD3680;
    v11 = &v24;
    v12 = v7;
    v23[4] = self;
    v24 = v12;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v21[0] = v10;
      v21[1] = 3221225472;
      v21[2] = __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_2;
      v21[3] = &unk_24BFD38C0;
      v14 = &v22;
      v21[4] = self;
      v22 = v12;
      objc_msgSend(v13, "listCaseSummariesWithIdentifiers:reply:", v6, v21);
    }
    else
    {
      if (!v12)
      {
LABEL_9:

        goto LABEL_10;
      }
      queue = self->_queue;
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_4;
      block[3] = &unk_24BFD3658;
      v14 = &v20;
      v20 = v12;
      dispatch_async(queue, block);
    }

    goto LABEL_9;
  }
  if (v7)
  {
    v15 = self->_queue;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_5;
    v17[3] = &unk_24BFD3658;
    v11 = &v18;
    v18 = v7;
    dispatch_async(v15, v17);
LABEL_10:

  }
}

void __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_cold_1();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_173;
    block[3] = &unk_24BFD3658;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

void __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_173(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 53, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_3;
    v6[3] = &unk_24BFD36A8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 19, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)purgeAutoBugCaptureFilesWithSubPaths:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (isEnabled)
  {
    connection = self->_connection;
    v10 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68__SDRDiagnosticReporter_purgeAutoBugCaptureFilesWithSubPaths_reply___block_invoke;
    v15[3] = &unk_24BFD38E8;
    v11 = v7;
    v16 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13[0] = v10;
      v13[1] = 3221225472;
      v13[2] = __68__SDRDiagnosticReporter_purgeAutoBugCaptureFilesWithSubPaths_reply___block_invoke_174;
      v13[3] = &unk_24BFD3910;
      v14 = v11;
      objc_msgSend(v12, "purgeAutoBugCaptureFilesWithSubPaths:reply:", v6, v13);

LABEL_9:
      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    {
      -[SDRDiagnosticReporter purgeAutoBugCaptureFilesWithSubPaths:reply:].cold.1();
      if (!v11)
        goto LABEL_9;
    }
    else if (!v11)
    {
      goto LABEL_9;
    }
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    goto LABEL_9;
  }
  if (v7)
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_10:

}

void __68__SDRDiagnosticReporter_purgeAutoBugCaptureFilesWithSubPaths_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    __68__SDRDiagnosticReporter_purgeAutoBugCaptureFilesWithSubPaths_reply___block_invoke_cold_1();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

}

uint64_t __68__SDRDiagnosticReporter_purgeAutoBugCaptureFilesWithSubPaths_reply___block_invoke_174(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getAutoBugCaptureConfiguration:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *connection;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = v4;
  if (isEnabled)
  {
    connection = self->_connection;
    v7 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __56__SDRDiagnosticReporter_getAutoBugCaptureConfiguration___block_invoke;
    v12[3] = &unk_24BFD38E8;
    v8 = v4;
    v13 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v10[0] = v7;
        v10[1] = 3221225472;
        v10[2] = __56__SDRDiagnosticReporter_getAutoBugCaptureConfiguration___block_invoke_177;
        v10[3] = &unk_24BFD3938;
        v11 = v8;
        objc_msgSend(v9, "getAutoBugCaptureConfiguration:", v10);

      }
      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    {
      -[SDRDiagnosticReporter getAutoBugCaptureConfiguration:].cold.1();
      if (!v8)
        goto LABEL_10;
    }
    else if (!v8)
    {
LABEL_10:

      goto LABEL_11;
    }
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    goto LABEL_10;
  }
  if (v4)
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_11:

}

void __56__SDRDiagnosticReporter_getAutoBugCaptureConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    __56__SDRDiagnosticReporter_getAutoBugCaptureConfiguration___block_invoke_cold_1();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

}

uint64_t __56__SDRDiagnosticReporter_getAutoBugCaptureConfiguration___block_invoke_177(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (SDRDiagnosticReporterDelegate)delegate
{
  return (SDRDiagnosticReporterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (void)isABCEnabled
{
  _DWORD v1[2];
  __int16 v2;
  int v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109632;
  v1[1] = _MergedGlobals;
  v2 = 1024;
  v3 = 0;
  v4 = 1024;
  v5 = byte_253CFCCD9;
  _os_log_debug_impl(&dword_20675A000, log, OS_LOG_TYPE_DEBUG, "SDRDiagnosticReporter - internal: %d seed: %d vendor: %d", (uint8_t *)v1, 0x14u);
  OUTLINED_FUNCTION_2();
}

void __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: Connection invalidated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: Connection interrupted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (groupCaseIdentifierForSignature:) remote object proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_payloadAugmentedWithSandboxExtensionTokensDict:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = 134218240;
  v7 = objc_msgSend(a2, "count");
  v8 = 2048;
  v9 = objc_msgSend(a3, "count");
  _os_log_error_impl(&dword_20675A000, v5, OS_LOG_TYPE_ERROR, "SDRDiagnosticReporter: Failed to grant sandbox extensions for all payloads (%ld required, %ld granted)", (uint8_t *)&v6, 0x16u);

}

- (void)commonPreflightChecksForSignature:payload:callback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: Submitting CA event for daily rate limit throttled case", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)commonPreflightChecksForSignature:payload:callback:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: Submitting CA event for API rate limit throttled case", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)buildDiagnosticIncidentEventForCaseSignature:handledResult:dampeningResult:closureType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: CA event for DiagnosticIncident: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (snapshotWithSignature:) Unable to get remote object proxy", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (snapshotWithSignature:) service %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20675A000, a2, a3, "SDRDiagnosticReporter: (snapshotWithSignature:) _connection %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (startSessionWithSignature:) Unable to get remote object proxy", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_20675A000, v0, OS_LOG_TYPE_ERROR, "SDRDiagnosticReporter: (startSessionWithSignature:) Remote XPC error %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __36__SDRDiagnosticReporter_endSession___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (endSession:) remote object proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __39__SDRDiagnosticReporter_cancelSession___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (cancelSession:) remote object proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (sessionIdentifier:) remote object proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (addSignatureContentForSession:) remote object proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (getDiagnosticPayloadsForSignatures:) remote object proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (triggerRemoteSessionForSignature:) remote object proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (getAllDiagnosticCasesWithReply:) remote object proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (getDiagnosticCaseSummariesOfType:reply:) remote object proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (getCaseSummariesWithIdentifiers:reply:) remote object proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)purgeAutoBugCaptureFilesWithSubPaths:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (purgeAutoBugCaptureFilesWithSubPaths:) remote service not initialized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __68__SDRDiagnosticReporter_purgeAutoBugCaptureFilesWithSubPaths_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (purgeAutoBugCaptureFilesWithSubPaths:) remote object proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getAutoBugCaptureConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (getAutoBugCaptureConfiguration:) remote service not initialized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __56__SDRDiagnosticReporter_getAutoBugCaptureConfiguration___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter: (getAutoBugCaptureConfiguration:) remote object proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end

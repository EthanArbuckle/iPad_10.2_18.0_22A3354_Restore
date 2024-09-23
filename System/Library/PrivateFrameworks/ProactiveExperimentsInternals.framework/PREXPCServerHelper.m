@implementation PREXPCServerHelper

+ (BOOL)shouldAcceptConnection:(id)a3 serviceName:(id)a4 whitelistedServerInterface:(id)a5 requestHandler:(id)a6 validateConnection:(id)a7 setupClientProxy:(id)a8 interruptionHandler:(id)a9 invalidationHandler:(id)a10
{
  id v15;
  id v16;
  uint64_t (**v17)(id, id, void *);
  void *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  int v22;
  _BOOL4 v23;
  int v24;
  char *v25;
  NSObject *v26;
  uint32_t v27;
  int v28;
  uint64_t v29;
  id v30;
  id v31;
  int v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  int v49;
  _BYTE buf[12];
  __int16 v51;
  void *v52;
  __int16 v53;
  char *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v35 = a5;
  v36 = a6;
  v17 = (uint64_t (**)(id, id, void *))a7;
  v34 = a8;
  v38 = a9;
  v37 = a10;
  v49 = 0;
  procNameForPid(objc_msgSend(v15, "processIdentifier"), &v49);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    pre_sv_xpc_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v20 = objc_msgSend(v15, "processIdentifier", v34);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v16;
    v51 = 2112;
    v52 = v18;
    v53 = 2048;
    v54 = (char *)v20;
    v21 = "New connection to %@ from %@ (%lu).";
LABEL_7:
    v26 = v19;
    v27 = 32;
LABEL_8:
    _os_log_impl(&dword_227234000, v26, OS_LOG_TYPE_DEFAULT, v21, buf, v27);
    goto LABEL_9;
  }
  v22 = v49;
  pre_sv_xpc_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (!v23)
      goto LABEL_9;
    v24 = objc_msgSend(v15, "processIdentifier", v34);
    v25 = strerror(v49);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v16;
    v51 = 2048;
    v52 = (void *)v24;
    v53 = 2080;
    v54 = v25;
    v21 = "New connection to %@ from unknown process (%lu) (proc_name error: %s).";
    goto LABEL_7;
  }
  if (v23)
  {
    v33 = objc_msgSend(v15, "processIdentifier", v34);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v16;
    v51 = 2048;
    v52 = (void *)v33;
    v21 = "New connection to %@ from unknown process (%lu).";
    v26 = v19;
    v27 = 22;
    goto LABEL_8;
  }
LABEL_9:

  v28 = v17[2](v17, v15, v18);
  if (v28)
  {
    objc_msgSend(v15, "setExportedInterface:", v35);
    objc_msgSend(v15, "setExportedObject:", v36);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v15);
    v29 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __175__PREXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke;
    v44[3] = &unk_24EF87360;
    objc_copyWeak(&v48, (id *)buf);
    v30 = v16;
    v45 = v30;
    v31 = v18;
    v46 = v31;
    v47 = v38;
    objc_msgSend(v15, "setInterruptionHandler:", v44);
    v39[0] = v29;
    v39[1] = 3221225472;
    v39[2] = __175__PREXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke_4;
    v39[3] = &unk_24EF87360;
    objc_copyWeak(&v43, (id *)buf);
    v40 = v30;
    v41 = v31;
    v42 = v37;
    objc_msgSend(v15, "setInvalidationHandler:", v39);
    objc_msgSend(v15, "resume");

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v48);
    objc_destroyWeak((id *)buf);
  }

  return v28;
}

+ (BOOL)hasTrueBooleanEntitlement:(id)a3 connection:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a4, "valueForEntitlement:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v16;
  _BOOL4 v17;
  int v18;
  char *v19;
  int v20;
  int __errnum;
  uint8_t buf[4];
  _BYTE v24[28];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = +[PREXPCServerHelper hasTrueBooleanEntitlement:connection:](PREXPCServerHelper, "hasTrueBooleanEntitlement:connection:", v7, v8);
  if (!v10)
  {
    __errnum = 0;
    procNameForPid(objc_msgSend(v8, "processIdentifier"), &__errnum);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      pre_sv_xpc_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v24 = v11;
        *(_WORD *)&v24[8] = 2112;
        *(_QWORD *)&v24[10] = v9;
        *(_WORD *)&v24[18] = 2112;
        *(_QWORD *)&v24[20] = v7;
        v13 = "Connection from %@ to %@ is missing entitlement: %@";
        v14 = v12;
        v15 = 32;
LABEL_10:
        _os_log_error_impl(&dword_227234000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      }
    }
    else
    {
      v16 = __errnum;
      pre_sv_xpc_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (v16)
      {
        if (v17)
        {
          v18 = objc_msgSend(v8, "processIdentifier");
          v19 = strerror(__errnum);
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v24 = v18;
          *(_WORD *)&v24[4] = 2112;
          *(_QWORD *)&v24[6] = v9;
          *(_WORD *)&v24[14] = 2080;
          *(_QWORD *)&v24[16] = v19;
          v13 = "Connection from %d to %@ failed entitlement check (proc_name error: %s).";
          v14 = v12;
          v15 = 28;
          goto LABEL_10;
        }
      }
      else if (v17)
      {
        v20 = objc_msgSend(v8, "processIdentifier");
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v24 = v20;
        *(_WORD *)&v24[4] = 2112;
        *(_QWORD *)&v24[6] = v9;
        v13 = "Connection from %d to %@ failed entitlement check.";
        v14 = v12;
        v15 = 18;
        goto LABEL_10;
      }
    }

  }
  return v10;
}

void __175__PREXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    pre_sv_xpc_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 138412802;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      v11 = 2048;
      v12 = (int)objc_msgSend(WeakRetained, "processIdentifier");
      _os_log_impl(&dword_227234000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was interrupted.", (uint8_t *)&v7, 0x20u);
    }

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void __175__PREXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    pre_sv_xpc_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 138412802;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      v11 = 2048;
      v12 = (int)objc_msgSend(WeakRetained, "processIdentifier");
      _os_log_impl(&dword_227234000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was invalidated.", (uint8_t *)&v7, 0x20u);
    }

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

@end

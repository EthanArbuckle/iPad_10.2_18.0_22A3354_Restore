@implementation PPXPCServerHelper

+ (BOOL)shouldAcceptConnection:(id)a3 serviceName:(id)a4 allowedServerInterface:(id)a5 allowedClientInterface:(id)a6 requestHandler:(id)a7 validateConnection:(id)a8 setupClientProxy:(id)a9 interruptionHandler:(id)a10 invalidationHandler:(id)a11
{
  id v16;
  uint64_t (**v17)(id, id, void *);
  void (**v18)(id, void *);
  void *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  BOOL v23;
  _BOOL4 v24;
  int v25;
  char *v26;
  NSObject *v27;
  uint32_t v28;
  int v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  int v35;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  int v54;
  _BYTE buf[12];
  __int16 v56;
  void *v57;
  __int16 v58;
  char *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v43 = a4;
  v39 = a5;
  v38 = a6;
  v40 = a7;
  v17 = (uint64_t (**)(id, id, void *))a8;
  v18 = (void (**)(id, void *))a9;
  v42 = a10;
  v41 = a11;
  v54 = 0;
  procNameForPid(objc_msgSend(v16, "processIdentifier"), &v54);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length"))
  {
    pp_xpc_server_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v21 = objc_msgSend(v16, "processIdentifier");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v43;
    v56 = 2112;
    v57 = v19;
    v58 = 2048;
    v59 = (char *)v21;
    v22 = "New connection to %@ from %@ (%lu).";
LABEL_7:
    v27 = v20;
    v28 = 32;
LABEL_8:
    _os_log_impl(&dword_1C392E000, v27, OS_LOG_TYPE_DEFAULT, v22, buf, v28);
    goto LABEL_9;
  }
  v23 = v54 == 0;
  pp_xpc_server_log_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (!v23)
  {
    if (!v24)
      goto LABEL_9;
    v25 = objc_msgSend(v16, "processIdentifier");
    v26 = strerror(v54);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v43;
    v56 = 2048;
    v57 = (void *)v25;
    v58 = 2080;
    v59 = v26;
    v22 = "New connection to %@ from unknown process (%lu) (proc_name error: %s).";
    goto LABEL_7;
  }
  if (v24)
  {
    v35 = objc_msgSend(v16, "processIdentifier");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v43;
    v56 = 2048;
    v57 = (void *)v35;
    v22 = "New connection to %@ from unknown process (%lu).";
    v27 = v20;
    v28 = 22;
    goto LABEL_8;
  }
LABEL_9:

  v29 = v17[2](v17, v16, v19);
  if (v29)
  {
    objc_msgSend(v16, "setExportedInterface:", v39);
    objc_msgSend(v16, "setExportedObject:", v40);
    if (v38)
    {
      objc_msgSend(v16, "setRemoteObjectInterface:");
      if (!v18)
      {
LABEL_15:
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, v16);
        v31 = MEMORY[0x1E0C809B0];
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __193__PPXPCServerHelper_shouldAcceptConnection_serviceName_allowedServerInterface_allowedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke;
        v49[3] = &unk_1E7E1A578;
        objc_copyWeak(&v53, (id *)buf);
        v32 = v43;
        v50 = v32;
        v33 = v19;
        v51 = v33;
        v52 = v42;
        objc_msgSend(v16, "setInterruptionHandler:", v49);
        v44[0] = v31;
        v44[1] = 3221225472;
        v44[2] = __193__PPXPCServerHelper_shouldAcceptConnection_serviceName_allowedServerInterface_allowedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke_8;
        v44[3] = &unk_1E7E1A578;
        objc_copyWeak(&v48, (id *)buf);
        v45 = v32;
        v46 = v33;
        v47 = v41;
        objc_msgSend(v16, "setInvalidationHandler:", v44);
        objc_msgSend(v16, "resume");

        objc_destroyWeak(&v48);
        objc_destroyWeak(&v53);
        objc_destroyWeak((id *)buf);
        goto LABEL_16;
      }
      objc_msgSend(v16, "remoteObjectProxy");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, v30);
    }
    else
    {
      if (!v18)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPXPCServerSupport.m"), 74, CFSTR("setupClientProxy shall be nil if allowedClientInterface is nil"));
    }

    goto LABEL_15;
  }
LABEL_16:

  return v29;
}

+ (BOOL)hasTrueBooleanEntitlement:(id)a3 connection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  _OWORD v10[2];

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D815A8];
  if (a4)
    objc_msgSend(a4, "auditToken");
  else
    memset(v10, 0, sizeof(v10));
  pp_xpc_server_log_handle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", v10, v5, v7);

  return v8;
}

+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  char *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  int v21;
  int __errnum;
  uint8_t buf[4];
  _BYTE v24[28];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = +[PPXPCServerHelper hasTrueBooleanEntitlement:connection:](PPXPCServerHelper, "hasTrueBooleanEntitlement:connection:", v7, v8);
  if (!v10)
  {
    __errnum = 0;
    procNameForPid(objc_msgSend(v8, "processIdentifier"), &__errnum);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length") && (objc_msgSend(v11, "isEqualToString:", CFSTR("xctest")) & 1) == 0)
    {
      pp_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v24 = v11;
        *(_WORD *)&v24[8] = 2112;
        *(_QWORD *)&v24[10] = v9;
        *(_WORD *)&v24[18] = 2112;
        *(_QWORD *)&v24[20] = v7;
        _os_log_fault_impl(&dword_1C392E000, v13, OS_LOG_TYPE_FAULT, "Connection from %@ to %@ is missing entitlement: %@", buf, 0x20u);
      }
      goto LABEL_10;
    }
    v12 = __errnum;
    pp_xpc_server_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v14)
      {
        v15 = objc_msgSend(v8, "processIdentifier");
        v16 = strerror(__errnum);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v24 = v15;
        *(_WORD *)&v24[4] = 2112;
        *(_QWORD *)&v24[6] = v9;
        *(_WORD *)&v24[14] = 2080;
        *(_QWORD *)&v24[16] = v16;
        v17 = "Connection from %d to %@ failed entitlement check (proc_name error: %s).";
        v18 = v13;
        v19 = 28;
LABEL_13:
        _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
      }
    }
    else if (v14)
    {
      v21 = objc_msgSend(v8, "processIdentifier");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v24 = v21;
      *(_WORD *)&v24[4] = 2112;
      *(_QWORD *)&v24[6] = v9;
      v17 = "Connection from %d to %@ failed entitlement check.";
      v18 = v13;
      v19 = 18;
      goto LABEL_13;
    }
LABEL_10:

  }
  return v10;
}

void __193__PPXPCServerHelper_shouldAcceptConnection_serviceName_allowedServerInterface_allowedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    pp_xpc_server_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412802;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      v10 = 2048;
      v11 = (int)objc_msgSend(WeakRetained, "processIdentifier");
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was interrupted.", (uint8_t *)&v6, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __193__PPXPCServerHelper_shouldAcceptConnection_serviceName_allowedServerInterface_allowedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    pp_xpc_server_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412802;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      v10 = 2048;
      v11 = (int)objc_msgSend(WeakRetained, "processIdentifier");
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was invalidated.", (uint8_t *)&v6, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end

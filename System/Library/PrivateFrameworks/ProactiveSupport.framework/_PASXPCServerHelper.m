@implementation _PASXPCServerHelper

+ (BOOL)shouldAcceptConnection:(id)a3 serviceName:(id)a4 whitelistedServerInterface:(id)a5 whitelistedClientInterface:(id)a6 requestHandler:(id)a7 validateConnection:(id)a8 setupClientProxy:(id)a9 interruptionHandler:(id)a10 invalidationHandler:(id)a11 logHandle:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, void *);
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  int v30;
  NSObject *v31;
  char *v32;
  int v33;
  BOOL v34;
  os_log_t v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  BOOL v43;
  id v44;
  id v45;
  int v48;
  void *v49;
  id v50;
  os_log_t oslog;
  _QWORD v52[4];
  NSObject *v53;
  id v54;
  id v55;
  id v56;
  int v57;
  _QWORD v58[4];
  NSObject *v59;
  id v60;
  id v61;
  id v62;
  int v63;
  int v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  _QWORD v70[5];

  v70[2] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v50 = a7;
  v21 = a8;
  v22 = (void (**)(id, void *))a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v64 = 0;
  v48 = objc_msgSend(v17, "processIdentifier");
  procNameForPid(v48, &v64);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  oslog = v25;
  v49 = v21;
  if (objc_msgSend(v26, "length"))
  {
    if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v66 = v18;
      v67 = 2112;
      v68 = v26;
      v69 = 2048;
      v70[0] = v48;
      v27 = "New connection to %@ from %@ (%lu).";
      v28 = v25;
      v29 = 32;
LABEL_5:
      _os_log_impl(&dword_1A0957000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
    }
  }
  else
  {
    v30 = v64;
    if (v64)
    {
      if (oslog)
      {
        v31 = oslog;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = strerror(v30);
          *(_DWORD *)buf = 138413058;
          v66 = v18;
          v67 = 2048;
          v68 = (void *)v48;
          v69 = 1024;
          LODWORD(v70[0]) = v30;
          WORD2(v70[0]) = 2080;
          *(_QWORD *)((char *)v70 + 6) = v32;
          _os_log_impl(&dword_1A0957000, v31, OS_LOG_TYPE_DEFAULT, "New connection to %@ from unknown process (%lu) (proc_name error: [%i] %s).", buf, 0x26u);
        }

        v21 = v49;
      }
    }
    else if (oslog && os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v66 = v18;
      v67 = 2048;
      v68 = (void *)v48;
      v27 = "New connection to %@ from unknown process (%lu).";
      v28 = oslog;
      v29 = 22;
      goto LABEL_5;
    }
  }
  v33 = (*((uint64_t (**)(id, id, void *))v21 + 2))(v21, v17, v26);
  v34 = v33;
  if (v33)
  {
    v43 = v33;
    objc_msgSend(v17, "setExportedInterface:", v19);
    objc_msgSend(v17, "setExportedObject:", v50);
    v35 = oslog;
    v44 = v20;
    v45 = v19;
    if (v20)
    {
      v36 = v20;
      v37 = v18;
      objc_msgSend(v17, "setRemoteObjectInterface:", v36);
      if (!v22)
      {
LABEL_20:
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __213___PASXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_whitelistedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler_logHandle___block_invoke;
        v58[3] = &unk_1E442F9D0;
        v39 = v35;
        v59 = v39;
        v40 = v37;
        v60 = v40;
        v41 = v26;
        v61 = v41;
        v63 = v48;
        v62 = v23;
        objc_msgSend(v17, "setInterruptionHandler:", v58);
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __213___PASXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_whitelistedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler_logHandle___block_invoke_4;
        v52[3] = &unk_1E442F9D0;
        v18 = v37;
        v53 = v39;
        v54 = v40;
        v55 = v41;
        v57 = v48;
        v56 = v24;
        objc_msgSend(v17, "setInvalidationHandler:", v52);
        objc_msgSend(v17, "resume");

        v20 = v44;
        v19 = v45;
        v34 = v43;
        goto LABEL_21;
      }
      objc_msgSend(v17, "remoteObjectProxy");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2](v22, v38);
    }
    else
    {
      v37 = v18;
      if (!v22)
        goto LABEL_20;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASXPCServerHelper.m"), 87, CFSTR("setupClientProxy shall be nil if whitelistedClientInterface is nil"));
    }

    v35 = oslog;
    goto LABEL_20;
  }
LABEL_21:

  return v34;
}

+ (BOOL)hasTrueBooleanEntitlement:(id)a3 connection:(id)a4 logHandle:(id)a5
{
  id v7;
  id v8;
  BOOL v9;
  _OWORD v11[2];

  v7 = a3;
  v8 = a5;
  if (a4)
    objc_msgSend(a4, "auditToken");
  else
    memset(v11, 0, sizeof(v11));
  v9 = +[_PASEntitlement taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:](_PASEntitlement, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", v11, v7, v8);

  return v9;
}

+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5 logHandle:(id)a6
{
  return objc_msgSend(a1, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:logHandle:shouldGenerateCrashReport:", a3, a4, a5, a6, 1);
}

+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5 logHandle:(id)a6 shouldGenerateCrashReport:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  int v18;
  int v19;
  char *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  int v25;
  int __errnum;
  uint8_t buf[4];
  _BYTE v28[30];
  __int16 v29;
  char *v30;
  uint64_t v31;

  v7 = a7;
  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = +[_PASXPCServerHelper hasTrueBooleanEntitlement:connection:logHandle:](_PASXPCServerHelper, "hasTrueBooleanEntitlement:connection:logHandle:", v11, v12, v14);
  if (!v15)
  {
    __errnum = 0;
    procNameForPid(objc_msgSend(v12, "processIdentifier"), &__errnum);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length") && (objc_msgSend(v16, "isEqualToString:", CFSTR("xctest")) & 1) == 0)
    {
      if (v7)
      {
        if (v14)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v28 = v16;
            *(_WORD *)&v28[8] = 2112;
            *(_QWORD *)&v28[10] = v13;
            *(_WORD *)&v28[18] = 2112;
            *(_QWORD *)&v28[20] = v11;
            _os_log_fault_impl(&dword_1A0957000, v14, OS_LOG_TYPE_FAULT, "Connection from %@ to %@ is missing entitlement: %@", buf, 0x20u);
          }
          if (_PASEvaluateLogFaultAndProbCrashCriteria())
            abort();
        }
      }
      else if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v28 = v16;
        *(_WORD *)&v28[8] = 2112;
        *(_QWORD *)&v28[10] = v13;
        *(_WORD *)&v28[18] = 2112;
        *(_QWORD *)&v28[20] = v11;
        _os_log_error_impl(&dword_1A0957000, v14, OS_LOG_TYPE_ERROR, "Connection from %@ to %@ is missing entitlement: %@", buf, 0x20u);
      }
      goto LABEL_17;
    }
    if (__errnum)
    {
      if (v14)
      {
        v17 = v14;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = objc_msgSend(v12, "processIdentifier");
          v19 = __errnum;
          v20 = strerror(__errnum);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v28 = v18;
          *(_WORD *)&v28[4] = 2112;
          *(_QWORD *)&v28[6] = v13;
          *(_WORD *)&v28[14] = 2112;
          *(_QWORD *)&v28[16] = v11;
          *(_WORD *)&v28[24] = 1024;
          *(_DWORD *)&v28[26] = v19;
          v29 = 2080;
          v30 = v20;
          v21 = "Connection from %d to %@ is missing entitlement: %@ (proc_name error: [%i] %s).";
          v22 = v17;
          v23 = 44;
LABEL_23:
          _os_log_error_impl(&dword_1A0957000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else if (v14)
    {
      v17 = v14;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_msgSend(v12, "processIdentifier");
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v28 = v25;
        *(_WORD *)&v28[4] = 2112;
        *(_QWORD *)&v28[6] = v13;
        *(_WORD *)&v28[14] = 2112;
        *(_QWORD *)&v28[16] = v11;
        v21 = "Connection from %d to %@ is missing entitlement: %@";
        v22 = v17;
        v23 = 28;
        goto LABEL_23;
      }
LABEL_16:

    }
LABEL_17:

  }
  return v15;
}

@end

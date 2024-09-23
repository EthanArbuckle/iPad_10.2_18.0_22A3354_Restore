@implementation TRIXPCNamespaceManagementRequestHandler

- (TRIXPCNamespaceManagementRequestHandler)initWithServerContextPromise:(id)a3 auditToken:(id *)a4
{
  id v8;
  TRIXPCNamespaceManagementRequestHandler *v9;
  TRIXPCNamespaceManagementRequestHandler *v10;
  __int128 v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCNamespaceManagementService.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContextPromise"));

  }
  v14.receiver = self;
  v14.super_class = (Class)TRIXPCNamespaceManagementRequestHandler;
  v9 = -[TRIXPCNamespaceManagementRequestHandler init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serverContextPromise, a3);
    v11 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v10->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v10->_auditToken.val[4] = v11;
  }

  return v10;
}

- (void)runBlockWhenServerAvailable:(id)a3
{
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_serverContextPromise, "addBlockToExecuteAfterPromiseFullfillment:", a3);
}

- (void)registerNamespaceWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 applicationGroup:(id)a6 cloudKitContainerId:(int)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD);
  void (**v23)(_QWORD);
  id v24;
  id v25;
  uint64_t v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  __int128 v28;
  $0B20F48E2CD2D778BD1F216BA81B71CE *p_auditToken;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  __int128 v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v62;
  void *v63;
  unsigned int v64;
  int v65;
  void *v66;
  void (**v67)(_QWORD, _QWORD);
  _QWORD v68[5];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  void (**v74)(_QWORD, _QWORD);
  id v75;
  uint64_t v76;
  unsigned int v77;
  int v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  char v90;
  _QWORD v91[5];
  id v92;
  id v93;
  id v94;
  unsigned int v95;
  int v96;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = MEMORY[0x1E0C809B0];
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke;
  v91[3] = &unk_1E9334978;
  v91[4] = self;
  v19 = v14;
  v92 = v19;
  v64 = a4;
  v95 = a4;
  v20 = v15;
  v93 = v20;
  v21 = v16;
  v94 = v21;
  v65 = a7;
  v96 = a7;
  v22 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v91);
  v22[2](v22, 0);
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  v90 = 0;
  v84[0] = v18;
  v84[1] = 3221225472;
  v84[2] = __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_62;
  v84[3] = &unk_1E93349A0;
  v86 = &v87;
  v67 = v22;
  v85 = v67;
  v23 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v84);
  v81[0] = v18;
  v81[1] = 3221225472;
  v81[2] = __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_2;
  v81[3] = &unk_1E93309B8;
  v24 = v17;
  v83 = v24;
  v25 = v19;
  v82 = v25;
  v26 = MEMORY[0x1D8232C48](v81);
  v27 = (void (**)(_QWORD, _QWORD, _QWORD))v26;
  if (!v25)
  {
    (*(void (**)(uint64_t, uint64_t, const __CFString *))(v26 + 16))(v26, 2, CFSTR("Namespace name must not be nil."));
    goto LABEL_34;
  }
  v28 = *(_OWORD *)&self->_auditToken.val[4];
  v79 = *(_OWORD *)self->_auditToken.val;
  v80 = v28;
  objc_msgSend(MEMORY[0x1E0DC0A18], "applicationBundleIdentifierWithAuditToken:", &v79);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    p_auditToken = &self->_auditToken;
    if (v21)
    {
      v30 = *(_OWORD *)&self->_auditToken.val[4];
      v79 = *(_OWORD *)p_auditToken->val;
      v80 = v30;
      if ((objc_msgSend(MEMORY[0x1E0DC0A18], "isEntitledToApplicationGroup:withAuditToken:", v21, &v79) & 1) != 0)
      {
        v60 = v21;
        v31 = 3;
LABEL_10:
        v59 = v31;
        if (!v20 || !objc_msgSend(v20, "isFileURL"))
          goto LABEL_28;
        v33 = *(_OWORD *)&self->_auditToken.val[4];
        v79 = *(_OWORD *)p_auditToken->val;
        v80 = v33;
        objc_msgSend(MEMORY[0x1E0DC0A18], "codeSignIdentifierWithAuditToken:", &v79);
        v34 = objc_claimAutoreleasedReturnValue();
        v56 = (void *)v34;
        if (v34)
        {
          objc_msgSend(MEMORY[0x1E0DC0990], "containerWithIdentifier:type:", v34, 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "containerURL");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v57 = 0;
          v58 = 0;
        }
        objc_msgSend(v20, "relativePath");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isAbsolutePath");

        if (v36)
        {
          objc_msgSend(v57, "relativePath");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v37)
            goto LABEL_27;
          objc_msgSend(v20, "relativePath");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "relativePath");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v62, "hasPrefix:", v38);

          if (!v54)
            goto LABEL_27;
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "relativePath");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "relativePath");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "triPath:relativeToParentPath:", v39, v40);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v58, "identifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "triContainerURLWithPath:containerId:containerType:", v63, v42, objc_msgSend(v58, "type"));
          v43 = objc_claimAutoreleasedReturnValue();

          if (v43)
          {

LABEL_26:
            v20 = (id)v43;
LABEL_27:

LABEL_28:
            v46 = *(_OWORD *)&self->_auditToken.val[4];
            v79 = *(_OWORD *)p_auditToken->val;
            v80 = v46;
            objc_msgSend(MEMORY[0x1E0DC0A18], "teamIdWithAuditToken:", &v79);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v47)
            {
              ((void (**)(_QWORD, uint64_t, const __CFString *))v27)[2](v27, 3, CFSTR("Unable to determine teamId for calling process."));
              v48 = 0;
              goto LABEL_32;
            }
            v68[0] = MEMORY[0x1E0C809B0];
            v68[1] = 3221225472;
            v68[2] = __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_90;
            v68[3] = &unk_1E93349C8;
            v74 = v67;
            v75 = v24;
            v68[4] = self;
            v69 = v25;
            v77 = v64;
            v20 = v20;
            v70 = v20;
            v48 = v47;
            v71 = v48;
            v72 = v60;
            v76 = v59;
            v78 = v65;
            v73 = v66;
            v49 = (void *)MEMORY[0x1D8232C48](v68);
            -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v49);
            *((_BYTE *)v88 + 24) = 1;

            v50 = v74;
LABEL_30:

LABEL_32:
            goto LABEL_33;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to process defaults with path %@"), v63);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, void *))v27)[2](v27, 2, v52);

          v51 = v63;
        }
        else
        {
          if (!v58)
          {
            ((void (**)(_QWORD, uint64_t, const __CFString *))v27)[2](v27, 1, CFSTR("Unable to determine app container for calling process."));
LABEL_41:

            v48 = v56;
            v50 = v58;
            goto LABEL_30;
          }
          objc_msgSend(v20, "relativePath");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v55)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCNamespaceManagementService.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relativePath"));

          }
          v44 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v58, "identifier");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "triContainerURLWithPath:containerId:containerType:", v55, v45, objc_msgSend(v58, "type"));
          v43 = objc_claimAutoreleasedReturnValue();

          if (v43)
            goto LABEL_26;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to process defaults with URL %@"), 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, void *))v27)[2](v27, 2, v51);
        }

        v20 = 0;
        goto LABEL_41;
      }
      ((void (**)(_QWORD, uint64_t, const __CFString *))v27)[2](v27, 3, CFSTR("Calling process not entitled to specified application group."));
    }
    else
    {
      v32 = *(_OWORD *)&self->_auditToken.val[4];
      v79 = *(_OWORD *)p_auditToken->val;
      v80 = v32;
      objc_msgSend(MEMORY[0x1E0DC0A18], "codeSignIdentifierWithAuditToken:", &v79);
      v60 = (id)objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        v31 = 2;
        goto LABEL_10;
      }
      ((void (**)(_QWORD, uint64_t, const __CFString *))v27)[2](v27, 3, CFSTR("Unable to determine code sign identifier for calling process."));
    }
  }
  else
  {
    ((void (**)(_QWORD, uint64_t, const __CFString *))v27)[2](v27, 2, CFSTR("Invalid application bundle identifier provided"));
  }
LABEL_33:

LABEL_34:
  if (v23)
    v23[2](v23);

  _Block_object_dispose(&v87, 8);
}

void __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = "end";
    else
      v7 = "begin";
    v8 = *(_QWORD *)(a1 + 32);
    TRILoggedNamespaceName(*(void **)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_DWORD *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    TRICloudKitSupport_Container_EnumDescriptor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enumNameForValue:", *(unsigned int *)(a1 + 68));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67111170;
    v17 = v15;
    v18 = 2114;
    v19 = v6;
    v20 = 2048;
    v21 = v8;
    v22 = 2080;
    v23 = v7;
    v24 = 2114;
    v25 = v9;
    v26 = 1024;
    v27 = v10;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v11;
    v32 = 2112;
    v33 = v14;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s registerNamespaceWithNamespaceName:%{public}@ compatibilityVersion:%u defaultsFileURL:%@ applicationGroup:%@ cloudKitContainerId:%@ completion:", buf, 0x54u);

  }
}

uint64_t __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_62(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      TRILoggedNamespaceName(*(void **)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "failed to register namespace %{public}@: %{public}@", buf, 0x16u);

    }
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0CB2D50];
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_2_91;
  v12[3] = &unk_1E9330760;
  v13 = *(id *)(a1 + 80);
  v7 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v12);
  if (v5 && v6)
  {
    v8 = (void *)objc_opt_class();
    LODWORD(v11) = *(_DWORD *)(a1 + 108);
    objc_msgSend(v8, "usingServerContext:registerNamespaceWithNamespaceName:compatibilityVersion:defaultsFileURL:teamId:appContainerId:appContainerType:cloudKitContainerId:bundleId:completion:", v5, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 96), v11, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88));
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 88);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
  }
  if (v7)
    v7[2](v7);

}

uint64_t __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_2_91(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deregisterNamespaceWithNamespaceName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void (**v11)(_QWORD, _QWORD);
  void (**v12)(_QWORD);
  id v13;
  id v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  __int128 v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD);
  id v24;
  _OWORD v25[2];
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[5];
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke;
  v36[3] = &unk_1E9330940;
  v36[4] = self;
  v9 = v6;
  v37 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v36);
  v10[2](v10, 0);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v29[0] = v8;
  v29[1] = 3221225472;
  v29[2] = __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_93;
  v29[3] = &unk_1E93349A0;
  v31 = &v32;
  v11 = v10;
  v30 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v29);
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_2;
  v26[3] = &unk_1E93349F0;
  v13 = v9;
  v27 = v13;
  v14 = v7;
  v28 = v14;
  v15 = MEMORY[0x1D8232C48](v26);
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))v15;
  if (v13)
  {
    v17 = *(_OWORD *)&self->_auditToken.val[4];
    v25[0] = *(_OWORD *)self->_auditToken.val;
    v25[1] = v17;
    objc_msgSend(MEMORY[0x1E0DC0A18], "teamIdWithAuditToken:", v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_94;
      v20[3] = &unk_1E9330A30;
      v23 = v11;
      v24 = v14;
      v20[4] = self;
      v21 = v13;
      v22 = v18;
      v19 = (void *)MEMORY[0x1D8232C48](v20);
      -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v19);
      *((_BYTE *)v33 + 24) = 1;

    }
    else
    {
      ((void (**)(_QWORD, uint64_t, const __CFString *))v16)[2](v16, 3, CFSTR("Unable to determine teamId for calling process."));
    }

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, const __CFString *))(v15 + 16))(v15, 2, CFSTR("Namespace name must not be nil."));
  }

  if (v12)
    v12[2](v12);

  _Block_object_dispose(&v32, 8);
}

void __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = "end";
    else
      v8 = "begin";
    v9 = *(_QWORD *)(a1 + 32);
    TRILoggedNamespaceName(*(void **)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = 67110146;
    v11[1] = v5;
    v12 = 2114;
    v13 = v7;
    v14 = 2048;
    v15 = v9;
    v16 = 2080;
    v17 = v8;
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s deregisterNamespaceWithNamespaceName:%{public}@ completion:", (uint8_t *)v11, 0x30u);

  }
}

uint64_t __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_93(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    TRILoggedNamespaceName(*(void **)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v5;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "failed to deregister namespace %{public}@: %{public}@", buf, 0x16u);

  }
  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v9);

}

void __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_2_95;
  v10[3] = &unk_1E9330760;
  v11 = *(id *)(a1 + 56);
  v7 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v10);
  if (v5 && v6)
  {
    objc_msgSend((id)objc_opt_class(), "usingServerContext:deregisterNamespaceWithName:teamId:taskQueue:completion:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6, *(_QWORD *)(a1 + 64));
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 64);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    }
  }
  if (v7)
    v7[2](v7);

}

uint64_t __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_2_95(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startDownloadNamespaceWithName:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void (**v15)(_QWORD, _QWORD);
  void (**v16)(_QWORD);
  id v17;
  id v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  __int128 v21;
  void *v22;
  __int128 v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  TRIXPCNamespaceManagementRequestHandler *v32;
  void (**v33)(_QWORD, _QWORD);
  id v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _QWORD v48[5];
  id v49;
  id v50;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke;
  v48[3] = &unk_1E9330878;
  v48[4] = self;
  v12 = v8;
  v49 = v12;
  v13 = v9;
  v50 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v48);
  v14[2](v14, 0);
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_96;
  v41[3] = &unk_1E93349A0;
  v43 = &v44;
  v15 = v14;
  v42 = v15;
  v16 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v41);
  v38[0] = v11;
  v38[1] = 3221225472;
  v38[2] = __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_2;
  v38[3] = &unk_1E93349F0;
  v17 = v12;
  v39 = v17;
  v18 = v10;
  v40 = v18;
  v19 = MEMORY[0x1D8232C48](v38);
  v20 = (void (**)(_QWORD, _QWORD, _QWORD))v19;
  if (v17)
  {
    if ((objc_msgSend(MEMORY[0x1E0DC0BB8], "validateSafeASCIISubsetIdentifier:", v17) & 1) != 0)
    {
      v21 = *(_OWORD *)&self->_auditToken.val[4];
      v36 = *(_OWORD *)self->_auditToken.val;
      v37 = v21;
      objc_msgSend(MEMORY[0x1E0DC0A18], "applicationBundleIdentifierWithAuditToken:", &v36);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        if ((objc_msgSend(MEMORY[0x1E0DC0BB8], "validateSafeASCIISubsetIdentifier:", v22) & 1) != 0)
        {
          v23 = *(_OWORD *)&self->_auditToken.val[4];
          v36 = *(_OWORD *)self->_auditToken.val;
          v37 = v23;
          objc_msgSend(MEMORY[0x1E0DC0A18], "teamIdWithAuditToken:", &v36);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v27[0] = v11;
            v27[1] = 3221225472;
            v27[2] = __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_106;
            v27[3] = &unk_1E9334A80;
            v33 = v15;
            v34 = v18;
            v28 = v17;
            v35 = v20;
            v25 = v24;
            v29 = v25;
            v30 = v22;
            v31 = v13;
            v32 = self;
            v26 = (void *)MEMORY[0x1D8232C48](v27);
            -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v26);
            *((_BYTE *)v45 + 24) = 1;

          }
          else
          {
            ((void (**)(_QWORD, uint64_t, const __CFString *))v20)[2](v20, 3, CFSTR("Unable to determine teamId for calling process."));
            v25 = 0;
          }
        }
        else
        {
          v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("appContainerId(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)"), v22);
          ((void (**)(_QWORD, uint64_t, id))v20)[2](v20, 2, v25);
        }

      }
      else
      {
        ((void (**)(_QWORD, uint64_t, const __CFString *))v20)[2](v20, 3, CFSTR("Unable to determine applicationBundleId for calling process."));
        v22 = 0;
      }
    }
    else
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("namespaceName(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)"), v17);
      ((void (**)(_QWORD, uint64_t, void *))v20)[2](v20, 2, v22);
    }

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, const __CFString *))(v19 + 16))(v19, 2, CFSTR("Namespace name must be non-nil."));
  }

  if (v16)
    v16[2](v16);

  _Block_object_dispose(&v44, 8);
}

void __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1[4] + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = "end";
    v10 = a1[4];
    v11 = a1[5];
    v12 = a1[6];
    if (!a2)
      v9 = "begin";
    v13[0] = 67110402;
    v13[1] = v5;
    v14 = 2114;
    v15 = v7;
    v16 = 2048;
    v17 = v10;
    v18 = 2080;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s startDownloadNamespaceWithName:%{public}@ options:%{public}@ completion:", (uint8_t *)v13, 0x3Au);

  }
}

uint64_t __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_96(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v5;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "failed to start download of namespace %{public}@: %{public}@", buf, 0x16u);
  }

  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v9);

}

void __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  TRITaskAttributionInternalInsecure *v15;
  uint64_t v16;
  TRITaskAttributionInternalInsecure *v17;
  _QWORD v18[4];
  id v19;

  v5 = a2;
  v6 = a3;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_2_107;
  v18[3] = &unk_1E9330760;
  v19 = *(id *)(a1 + 72);
  v7 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v18);
  if (v5 && v6)
  {
    objc_msgSend(v5, "namespaceDatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dynamicNamespaceRecordWithNamespaceName:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v17 = [TRITaskAttributionInternalInsecure alloc];
      v10 = *(_QWORD *)(a1 + 40);
      v11 = objc_msgSend(v9, "cloudKitContainer");
      v13 = *(_QWORD *)(a1 + 48);
      v12 = *(void **)(a1 + 56);
      v14 = v12;
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0DC0A10], "inexpensiveOptions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = -[TRITaskAttributionInternalInsecure initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:](v17, "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", v10, v11, v13, v14);
      if (!v12)

      objc_msgSend((id)objc_opt_class(), "usingServerContext:taskQueue:startDownloadNamespaceWithName:attribution:completion:", v5, v6, *(_QWORD *)(a1 + 32), v15, *(_QWORD *)(a1 + 80));
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
      v9 = 0;
    }
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 80);
    if (!v16)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v9);
  }

LABEL_13:
  if (v7)
    v7[2](v7);

}

uint64_t __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_2_107(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_notificationKeyWithNamespace:(id)a3 assetIndexesByTreatment:(id)a4 assetIdsByFactorPack:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  id v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *context;
  id v43;
  id obj;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v7 = a4;
  v46 = a5;
  context = (void *)MEMORY[0x1D8232A5C]();
  v8 = (void *)objc_opt_new();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v45 = v7;
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v58;
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v58 != v13)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v8, "addObject:", v16);
        objc_msgSend(v45, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v14;
        v55[1] = 3221225472;
        v55[2] = __118__TRIXPCNamespaceManagementRequestHandler__notificationKeyWithNamespace_assetIndexesByTreatment_assetIdsByFactorPack___block_invoke;
        v55[3] = &unk_1E93329D0;
        v56 = v8;
        objc_msgSend(v17, "enumerateIndexesUsingBlock:", v55);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v12);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v46, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedArrayUsingSelector:", sel_compare_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v19;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v52 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
        v25 = (void *)MEMORY[0x1D8232A5C](objc_msgSend(v8, "addObject:", v24));
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v46, "objectForKeyedSubscript:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "allObjects");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sortedArrayUsingComparator:", &__block_literal_global_22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v48;
          do
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(_QWORD *)v48 != v31)
                objc_enumerationMutation(v28);
              objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "assetId");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v33);

            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
          }
          while (v30);
        }

        objc_autoreleasePoolPop(v25);
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "triHashStrings:withDataSalt:", v8, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_alloc(MEMORY[0x1E0CB3940]);
  v36 = objc_msgSend(v34, "length");
  if (v36 >= 8)
    v37 = 8;
  else
    v37 = v36;
  objc_msgSend(v34, "subdataWithRange:", 0, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "triHexlify");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("%@.%@"), v43, v39);

  objc_autoreleasePoolPop(context);
  return v40;
}

void __118__TRIXPCNamespaceManagementRequestHandler__notificationKeyWithNamespace_assetIndexesByTreatment_assetIdsByFactorPack___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu"), a2);
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __118__TRIXPCNamespaceManagementRequestHandler__notificationKeyWithNamespace_assetIndexesByTreatment_assetIdsByFactorPack___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)startDownloadLevelsForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  void (**v20)(_QWORD, _QWORD);
  void (**v21)(_QWORD);
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  NSObject *v33;
  unsigned int v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  TRIXPCNamespaceManagementRequestHandler *v42;
  id v43;
  NSObject *v44;
  id v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  _BYTE buf[32];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke;
  v56[3] = &unk_1E9334A58;
  v56[4] = self;
  v35 = v12;
  v57 = v35;
  v36 = v13;
  v58 = v36;
  v37 = v14;
  v59 = v37;
  v18 = v15;
  v60 = v18;
  v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v56);
  v19[2](v19, 0);
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v49[0] = v17;
  v49[1] = 3221225472;
  v49[2] = __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_121;
  v49[3] = &unk_1E93349A0;
  v51 = &v52;
  v20 = v19;
  v50 = v20;
  v21 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v49);
  v47[0] = v17;
  v47[1] = 3221225472;
  v47[2] = __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_2;
  v47[3] = &unk_1E93307D8;
  v22 = v16;
  v48 = v22;
  v23 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v47);
  v24 = (void *)MEMORY[0x1E0D815A8];
  TRILogCategory_Server();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0DC0E60];
  v27 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v27;
  if (objc_msgSend(v24, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", buf, v26, v25))
  {

LABEL_4:
    v38[0] = v17;
    v38[1] = 3221225472;
    v38[2] = __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_125;
    v38[3] = &unk_1E9334A80;
    v44 = v20;
    v45 = v22;
    v39 = v35;
    v40 = v36;
    v41 = v37;
    v42 = self;
    v46 = v23;
    v43 = v18;
    v32 = (void *)MEMORY[0x1D8232C48](v38);
    -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v32);
    *((_BYTE *)v53 + 24) = 1;

    v33 = v44;
    goto LABEL_5;
  }
  v28 = *MEMORY[0x1E0DC0E70];
  v29 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v29;
  objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v28, buf);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30 == 0;

  if (!v31)
    goto LABEL_4;
  ((void (**)(_QWORD, uint64_t, const __CFString *))v23)[2](v23, 3, CFSTR("Calling process is not entitled to request on-demand factors."));
  TRILogCategory_Server();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v34 = self->_auditToken.val[5];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v34;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v28;
    _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required for on-demand factor download: %@", buf, 0x12u);
  }
LABEL_5:

  if (v21)
    v21[2](v21);

  _Block_object_dispose(&v52, 8);
}

void __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD v15[2];
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1[4] + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = "end";
    v10 = a1[4];
    v11 = a1[5];
    if (!a2)
      v9 = "begin";
    v12 = a1[6];
    v13 = a1[7];
    v14 = a1[8];
    v15[0] = 67110914;
    v15[1] = v5;
    v16 = 2114;
    v17 = v7;
    v18 = 2048;
    v19 = v10;
    v20 = 2080;
    v21 = v9;
    v22 = 2114;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    v26 = 2114;
    v27 = v13;
    v28 = 2114;
    v29 = v14;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s startDownloadLevelsForFactors:%{public}@ withNamespace:%{public}@ fstate:%{public}@ options:%{public}@ completion:", (uint8_t *)v15, 0x4Eu);

  }
}

uint64_t __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_121(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (objc_class *)MEMORY[0x1E0CB35C8];
    v6 = a3;
    v7 = [v5 alloc];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_125(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  TRITaskAttributionInternalInsecure *v23;
  TRITaskAttributionInternalInsecure *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  unsigned int v54;
  id v55;
  _QWORD v56[4];
  id v57;
  _BYTE buf[32];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_2_126;
  v56[3] = &unk_1E9330760;
  v57 = *(id *)(a1 + 72);
  v7 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v56);
  if (v5 && v6)
  {
    v55 = 0;
    v54 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v49 = 0;
    v8 = (void *)MEMORY[0x1E0DC0A88];
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "paths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "validateDownloadForFactors:withNamespace:paths:container:factorsState:assetIndexesByTreatment:experimentIds:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployments:error:", v9, v10, v11, &v54, *(_QWORD *)(a1 + 48), &v53, &v52, &v51, &v50, &v49, &v55);

    objc_msgSend((id)objc_opt_class(), "_notificationKeyWithNamespace:assetIndexesByTreatment:assetIdsByFactorPack:", *(_QWORD *)(a1 + 40), v53, v51);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v53;
      _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_INFO, "Notification key is %{public}@, asset index: %@", buf, 0x16u);
    }

    if (!v12)
    {
      v31 = *(_QWORD *)(a1 + 80);
      if (v31)
        (*(void (**)(uint64_t, _QWORD, id))(v31 + 16))(v31, 0, v55);
      goto LABEL_37;
    }
    if (objc_msgSend(v53, "count") || objc_msgSend(v51, "count"))
    {
      v46 = (id)objc_opt_new();
      v15 = *(_QWORD *)(a1 + 56);
      v16 = *(_OWORD *)(v15 + 32);
      *(_OWORD *)buf = *(_OWORD *)(v15 + 16);
      *(_OWORD *)&buf[16] = v16;
      objc_msgSend(MEMORY[0x1E0DC0A18], "applicationBundleIdentifierWithAuditToken:", buf);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v32 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(MEMORY[0x1E0DC0A18], "entitlementKeyForApplicationBundleIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (TRITaskAttributionInternalInsecure *)objc_msgSend(v32, "initWithFormat:", CFSTR("Process is missing entitlement \"%@\"; you must declare the application bundle identifier explicitly in entitlements."),
                                                      v33);

        (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
        TRILogCategory_Server();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v34 = *(_DWORD *)(*(_QWORD *)(a1 + 56) + 36);
          objc_msgSend(MEMORY[0x1E0DC0A18], "entitlementKeyForApplicationBundleIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v34;
          *(_WORD *)&buf[8] = 2114;
          *(_QWORD *)&buf[10] = v35;
          _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement \"%{public}@\".", buf, 0x12u);

        }
LABEL_35:

        goto LABEL_36;
      }
      if ((objc_msgSend(MEMORY[0x1E0DC0BB8], "validateSafeASCIISubsetIdentifier:", v17) & 1) != 0)
      {
        objc_msgSend(v5, "keyValueStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:](TRINamespaceFactorSubscriptionSettings, "settingsWithKeyValueStore:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        -[NSObject subscribedFactorsForNamespaceName:](v19, "subscribedFactorsForNamespaceName:", *(_QWORD *)(a1 + 40));
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend((id)v20, "mutableCopy");

        objc_msgSend(v21, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
        v22 = *(_QWORD *)(a1 + 40);
        v47 = 0;
        LOBYTE(v20) = -[NSObject setSubscriptionWithFactorNames:inNamespaceName:error:](v19, "setSubscriptionWithFactorNames:inNamespaceName:error:", v21, v22, &v47);
        v23 = (TRITaskAttributionInternalInsecure *)v47;
        if ((v20 & 1) != 0)
        {

          v24 = [TRITaskAttributionInternalInsecure alloc];
          v25 = v54;
          v26 = *(void **)(a1 + 64);
          v27 = v26;
          if (!v26)
          {
            objc_msgSend(MEMORY[0x1E0DC0A10], "inexpensiveOptions");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v23 = -[TRITaskAttributionInternalInsecure initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:](v24, "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", 0, v25, v17, v27);
          if (!v26)

          objc_msgSend((id)objc_opt_class(), "_startDownloadAssetIndexesByTreatment:usingEntitlementWitness:serverContext:taskQueue:experimentIds:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployments:namespace:taskAttribution:factorsState:notificationKey:", v53, v46, v5, v6, v52, v51, v50, v49, *(_QWORD *)(a1 + 40), v23, *(_QWORD *)(a1 + 48), v13);
          v28 = *(_QWORD *)(a1 + 80);
          if (v28)
            (*(void (**)(uint64_t, void *, _QWORD))(v28 + 16))(v28, v13, 0);
          goto LABEL_36;
        }
        TRILogCategory_Server();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v23;
          _os_log_error_impl(&dword_1D207F000, v42, OS_LOG_TYPE_ERROR, "Unable to update on-demand asset subscription, error: %{public}@", buf, 0xCu);
        }

        v43 = *(_QWORD *)(a1 + 80);
        if (v43)
          (*(void (**)(uint64_t, _QWORD, TRITaskAttributionInternalInsecure *))(v43 + 16))(v43, 0, v23);

        goto LABEL_35;
      }
      v23 = (TRITaskAttributionInternalInsecure *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("appContainerId(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)"), v17);
      (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    }
    else
    {
      TRILogCategory_Server();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v37;
        _os_log_impl(&dword_1D207F000, v36, OS_LOG_TYPE_INFO, "Completing on-demand factor request for namespace \"%{public}@\" without actually downloading assets.", buf, 0xCu);
      }

      objc_msgSend(v5, "keyValueStore");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:](TRINamespaceFactorSubscriptionSettings, "settingsWithKeyValueStore:", v38);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "subscribedFactorsForNamespaceName:", *(_QWORD *)(a1 + 40));
      v39 = objc_claimAutoreleasedReturnValue();
      v23 = (TRITaskAttributionInternalInsecure *)objc_msgSend((id)v39, "mutableCopy");

      -[TRITaskAttributionInternalInsecure addObjectsFromArray:](v23, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
      v40 = *(_QWORD *)(a1 + 40);
      v48 = 0;
      LOBYTE(v39) = objc_msgSend(v17, "setSubscriptionWithFactorNames:inNamespaceName:error:", v23, v40, &v48);
      v46 = v48;
      if ((v39 & 1) != 0)
      {

        v41 = *(_QWORD *)(a1 + 80);
        if (v41)
          (*(void (**)(uint64_t, _QWORD, _QWORD))(v41 + 16))(v41, 0, 0);
        objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadCompletedForKey:", v13);
        goto LABEL_37;
      }
      TRILogCategory_Server();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v46;
        _os_log_error_impl(&dword_1D207F000, v44, OS_LOG_TYPE_ERROR, "Unable to update on-demand asset subscription, error: %@", buf, 0xCu);
      }

      v45 = *(_QWORD *)(a1 + 80);
      if (v45)
        (*(void (**)(uint64_t, _QWORD, id))(v45 + 16))(v45, 0, v46);
    }
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  v29 = *(_QWORD *)(a1 + 80);
  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v29 + 16))(v29, 0, v30);

  }
LABEL_38:
  if (v7)
    v7[2](v7);

}

uint64_t __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_2_126(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)immediateDownloadForNamespaceNames:(id)a3 allowExpensiveNetworking:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void (**v13)(_QWORD);
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  void *v18;
  _BOOL4 v19;
  __int128 v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  unsigned int v29;
  id v30;
  void *v31;
  unsigned int v32;
  void *v33;
  TRITaskAttributionInternalInsecure *v34;
  NSObject *v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  void (**v37)(_QWORD, _QWORD);
  _QWORD v38[5];
  id v39;
  NSObject *v40;
  NSObject *v41;
  void (**v42)(_QWORD, _QWORD);
  id v43;
  BOOL v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  _QWORD v55[5];
  id v56;
  BOOL v57;
  _BYTE buf[32];
  uint64_t v59;

  v6 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke;
  v55[3] = &unk_1E9334AA8;
  v55[4] = self;
  v11 = v8;
  v56 = v11;
  v57 = v6;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v55);
  v12[2](v12, 0);
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v48[0] = v10;
  v48[1] = 3221225472;
  v48[2] = __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_134;
  v48[3] = &unk_1E93349A0;
  v50 = &v51;
  v37 = v12;
  v49 = v37;
  v13 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v48);
  if (objc_msgSend(MEMORY[0x1E0DC0AD0], "unsafeFirstAuthenticationState"))
  {
    v45[0] = v10;
    v45[1] = 3221225472;
    v45[2] = __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_136;
    v45[3] = &unk_1E93349F0;
    v14 = v11;
    v46 = v14;
    v15 = v9;
    v47 = v15;
    v36 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v45);
    if (!v14 || !objc_msgSend(v14, "count"))
    {
      TRILogCategory_Server();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D207F000, v26, OS_LOG_TYPE_DEFAULT, "Immediate download is not needed, namespace names are either nil or empty", buf, 2u);
      }

      if (v15)
        (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
      goto LABEL_24;
    }
    v16 = *MEMORY[0x1E0DC0E70];
    v17 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v17;
    objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v16, buf);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (v19)
    {
      ((void (**)(_QWORD, uint64_t, const __CFString *))v36)[2](v36, 3, CFSTR("Calling process is not entitled to immediate download"));
      TRILogCategory_Server();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v29 = self->_auditToken.val[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v29;
        *(_WORD *)&buf[8] = 2112;
        *(_QWORD *)&buf[10] = v16;
        _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required for immediate download: %@", buf, 0x12u);
      }
      goto LABEL_23;
    }
    v35 = objc_opt_new();
    v20 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v20;
    objc_msgSend(MEMORY[0x1E0DC0A18], "applicationBundleIdentifierWithAuditToken:", buf);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if ((objc_msgSend(MEMORY[0x1E0DC0BB8], "validateSafeASCIISubsetIdentifier:", v21) & 1) == 0)
      {
        v23 = v35;
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("applicationBundleIdentifier (%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)"), v21);
        ((void (**)(_QWORD, uint64_t, void *))v36)[2](v36, 2, v22);
        goto LABEL_22;
      }
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A10]), "initWithAllowsCellular:discretionaryBehavior:", v6, 0);
      v34 = -[TRITaskAttributionInternalInsecure initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:]([TRITaskAttributionInternalInsecure alloc], "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", 0, 1, v21, v22);
      v38[0] = v10;
      v38[1] = 3221225472;
      v38[2] = __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_141;
      v38[3] = &unk_1E9334AD0;
      v42 = v37;
      v43 = v15;
      v38[4] = self;
      v39 = v14;
      v23 = v35;
      v40 = v35;
      v44 = v6;
      v24 = v34;
      v41 = v24;
      v25 = (void *)MEMORY[0x1D8232C48](v38);
      -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v25);
      *((_BYTE *)v52 + 24) = 1;

    }
    else
    {
      v23 = v35;
      v30 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0DC0A18], "entitlementKeyForApplicationBundleIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("Process is missing entitlement \"%@\"; you must declare the application bundle identifier explicitly in entitlements."),
                      v31);

      ((void (**)(_QWORD, uint64_t, void *))v36)[2](v36, 3, v22);
      TRILogCategory_Server();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v32 = self->_auditToken.val[5];
        objc_msgSend(MEMORY[0x1E0DC0A18], "entitlementKeyForApplicationBundleIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v32;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v33;
        _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement \"%{public}@\".", buf, 0x12u);

        v23 = v35;
      }
    }

LABEL_22:
LABEL_23:

LABEL_24:
    v28 = v46;
    goto LABEL_25;
  }
  TRILogCategory_Server();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_1D207F000, v27, OS_LOG_TYPE_DEFAULT, "Failing request for immediateDownloadForNamespaceNames:%{public}@ since device is still class C locked", buf, 0xCu);
  }

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v28);
LABEL_25:

  }
  if (v13)
    v13[2](v13);

  _Block_object_dispose(&v51, 8);
}

void __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  qos_class_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = "end";
    else
      v8 = "begin";
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 48))
      v11 = "YES";
    else
      v11 = "NO";
    v12[0] = 67110658;
    v12[1] = v5;
    v13 = 2114;
    v14 = v7;
    v15 = 2048;
    v16 = v9;
    v17 = 2080;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    v21 = 2080;
    v22 = v11;
    v23 = 1026;
    v24 = qos_class_self();
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s immediateDownloadForNamespaceNames:%{public}@ allowExpensiveNetworking:%s qos:%{public}u completion:", (uint8_t *)v12, 0x40u);

  }
}

uint64_t __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_134(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_136(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v5;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "failed to start immediateDownloadForNamespaceNames %{public}@: %{public}@", buf, 0x16u);
  }

  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);

}

void __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_2;
  v13 = &unk_1E9330760;
  v14 = *(id *)(a1 + 64);
  v7 = (void (**)(_QWORD))MEMORY[0x1D8232C48](&v10);
  if (v5 && v6)
  {
    objc_msgSend((id)objc_opt_class(), "_immediateDownloadForNamespaceNames:usingEntitlementWitness:serverContext:taskQueue:allowExpensiveNetworking:taskAttribution:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, v6, *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), v10, v11, v12, v13);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 72);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    }
  }
  if (v7)
    v7[2](v7);

}

uint64_t __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeLevelsForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 removeImmediately:(BOOL)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void (**v17)(_QWORD, _QWORD);
  void (**v18)(_QWORD, _QWORD);
  void (**v19)(_QWORD);
  id v20;
  id v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  NSObject *v33;
  void *v34;
  unsigned int v35;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  void (**v44)(_QWORD, _QWORD);
  id v45;
  BOOL v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  _QWORD v57[5];
  id v58;
  id v59;
  id v60;
  _BYTE buf[32];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke;
  v57[3] = &unk_1E9330A08;
  v57[4] = self;
  v37 = v11;
  v58 = v37;
  v16 = v12;
  v59 = v16;
  v38 = v13;
  v60 = v38;
  v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v57);
  v17[2](v17, 0);
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v50[0] = v15;
  v50[1] = 3221225472;
  v50[2] = __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_142;
  v50[3] = &unk_1E93349A0;
  v52 = &v53;
  v18 = v17;
  v51 = v18;
  v19 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v50);
  v47[0] = v15;
  v47[1] = 3221225472;
  v47[2] = __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_2;
  v47[3] = &unk_1E93349F0;
  v20 = v16;
  v48 = v20;
  v21 = v14;
  v49 = v21;
  v22 = MEMORY[0x1D8232C48](v47);
  v23 = (void (**)(_QWORD, _QWORD, _QWORD))v22;
  if (!v20)
  {
    (*(void (**)(uint64_t, uint64_t, const __CFString *))(v22 + 16))(v22, 2, CFSTR("Namespace name must not be nil."));
    goto LABEL_8;
  }
  v24 = (void *)MEMORY[0x1E0D815A8];
  TRILogCategory_Server();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0DC0E60];
  v27 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v27;
  if (objc_msgSend(v24, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", buf, v26, v25))
  {

  }
  else
  {
    v28 = *MEMORY[0x1E0DC0E70];
    v29 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v29;
    objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v28, buf);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30 == 0;

    if (v31)
    {
      ((void (**)(_QWORD, uint64_t, const __CFString *))v23)[2](v23, 3, CFSTR("Calling process is not entitled to remove on-demand factors."));
      TRILogCategory_Server();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v35 = self->_auditToken.val[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v35;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v28;
        _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required for on-demand factor removal: %{public}@", buf, 0x12u);
      }
      goto LABEL_7;
    }
  }
  v32 = (void *)objc_opt_new();
  v39[0] = v15;
  v39[1] = 3221225472;
  v39[2] = __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_145;
  v39[3] = &unk_1E9334AF8;
  v44 = v18;
  v45 = v21;
  v39[4] = self;
  v40 = v37;
  v33 = v32;
  v41 = v33;
  v42 = v20;
  v43 = v38;
  v46 = a6;
  v34 = (void *)MEMORY[0x1D8232C48](v39);
  -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v34);
  *((_BYTE *)v54 + 24) = 1;

LABEL_7:
LABEL_8:

  if (v19)
    v19[2](v19);

  _Block_object_dispose(&v53, 8);
}

void __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD v14[2];
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1[4] + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = "end";
    v10 = a1[4];
    v11 = a1[5];
    if (!a2)
      v9 = "begin";
    v12 = a1[6];
    v13 = a1[7];
    v14[0] = 67110658;
    v14[1] = v5;
    v15 = 2114;
    v16 = v7;
    v17 = 2048;
    v18 = v10;
    v19 = 2080;
    v20 = v9;
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v12;
    v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s removeLevelsForFactors:%{public}@ namespace:%{public}@ fstate:%{public}@ completion:", (uint8_t *)v14, 0x44u);

  }
}

uint64_t __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_142(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v5;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "failed to removeLevelsForFactors %{public}@: %{public}@", buf, 0x16u);
  }

  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);

}

void __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_2_146;
  v12[3] = &unk_1E9330760;
  v13 = *(id *)(a1 + 72);
  v7 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v12);
  if (v5 && v6)
  {
    v8 = (void *)objc_opt_class();
    LOBYTE(v11) = *(_BYTE *)(a1 + 88);
    objc_msgSend(v8, "_removeAssetFactors:usingEntitlementWitness:serverContext:taskQueue:namespace:factorsState:removeImmediately:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v11, *(_QWORD *)(a1 + 80));
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 80);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    }
  }
  if (v7)
    v7[2](v7);

}

uint64_t __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_2_146(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setPurgeabilityLevelsForFactors:(id)a3 forNamespaceName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void (**v15)(_QWORD, _QWORD);
  void (**v16)(_QWORD);
  void (**v17)(_QWORD, _QWORD);
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  TRIXPCNamespaceManagementRequestHandler *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _QWORD v38[5];
  id v39;
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke;
  v38[3] = &unk_1E9330878;
  v38[4] = self;
  v12 = v8;
  v39 = v12;
  v13 = v9;
  v40 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v38);
  v14[2](v14, 0);
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v31[0] = v11;
  v31[1] = 3221225472;
  v31[2] = __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_147;
  v31[3] = &unk_1E93349A0;
  v33 = &v34;
  v15 = v14;
  v32 = v15;
  v16 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v31);
  v22 = v11;
  v23 = 3221225472;
  v24 = __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_2;
  v25 = &unk_1E9330A30;
  v17 = v15;
  v29 = v17;
  v18 = v10;
  v30 = v18;
  v26 = self;
  v19 = v13;
  v27 = v19;
  v20 = v12;
  v28 = v20;
  v21 = (void *)MEMORY[0x1D8232C48](&v22);
  -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v21, v22, v23, v24, v25, v26);
  *((_BYTE *)v35 + 24) = 1;

  if (v16)
    v16[2](v16);

  _Block_object_dispose(&v34, 8);
}

void __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1[4] + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = "end";
    v10 = a1[4];
    v11 = a1[5];
    v12 = a1[6];
    if (!a2)
      v9 = "begin";
    v13[0] = 67110402;
    v13[1] = v5;
    v14 = 2114;
    v15 = v7;
    v16 = 2048;
    v17 = v10;
    v18 = 2080;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s setPurgeabilityLevelsForFactors:%{public}@ forNamespace:%{public}@ completion:", (uint8_t *)v13, 0x3Au);

  }
}

uint64_t __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_147(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _BYTE buf[32];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_3;
  v32[3] = &unk_1E9330760;
  v33 = *(id *)(a1 + 56);
  v8 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v32);
  if (v5 && v6)
  {
    v30[0] = v7;
    v30[1] = 3221225472;
    v30[2] = __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_4;
    v30[3] = &unk_1E93307D8;
    v31 = *(id *)(a1 + 64);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v30);
    v29 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_validateNamespaceName:error:", *(_QWORD *)(a1 + 40), &v29);
    if (v29)
    {
      v10 = *(_QWORD *)(a1 + 64);
      if (v10)
        (*(void (**)(void))(v10 + 16))();
      goto LABEL_13;
    }
    v13 = (void *)MEMORY[0x1E0D815A8];
    v14 = *(_QWORD *)(a1 + 32);
    TRILogCategory_Server();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0DC0E60];
    v17 = *(_OWORD *)(v14 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v14 + 16);
    *(_OWORD *)&buf[16] = v17;
    if (objc_msgSend(v13, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", buf, v16, v15))
    {

    }
    else
    {
      v18 = *MEMORY[0x1E0DC0E70];
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(_OWORD *)(v19 + 32);
      *(_OWORD *)buf = *(_OWORD *)(v19 + 16);
      *(_OWORD *)&buf[16] = v20;
      objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v18, buf);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 == 0;

      if (v22)
      {
        ((void (**)(_QWORD, uint64_t, const __CFString *))v9)[2](v9, 3, CFSTR("Calling process is not entitled to set purgeability factor levels."));
        TRILogCategory_Server();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v28 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v28;
          *(_WORD *)&buf[8] = 2114;
          *(_QWORD *)&buf[10] = v18;
          _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required to set purgeability factor levels: %{public}@", buf, 0x12u);
        }
        goto LABEL_12;
      }
    }
    v23 = objc_opt_new();
    v24 = *(_QWORD *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 48);
    v26 = *(void **)(a1 + 32);
    objc_msgSend(v5, "paths");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_setPurgeabilityLevelsForFactors:usingEntitlementWitness:namespace:paths:completion:", v25, v23, v24, v27, *(_QWORD *)(a1 + 64));

LABEL_12:
LABEL_13:

    v12 = v31;
    goto LABEL_14;
  }
  v11 = *(_QWORD *)(a1 + 64);
  if (!v11)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
LABEL_14:

LABEL_15:
  if (v8)
    v8[2](v8);

}

uint64_t __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (objc_class *)MEMORY[0x1E0CB35C8];
    v6 = a3;
    v7 = [v5 alloc];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)loadNamespaceMetadataForNamespaceName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void (**v11)(_QWORD, _QWORD);
  void (**v12)(_QWORD);
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  NSObject *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  TRIXPCNamespaceManagementRequestHandler *v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD *v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[5];
  id v43;
  _BYTE buf[32];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke;
  v42[3] = &unk_1E9330940;
  v42[4] = self;
  v9 = v6;
  v43 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v42);
  v10[2](v10, 0);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v37[0] = v8;
  v37[1] = 3221225472;
  v37[2] = __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_150;
  v37[3] = &unk_1E93349A0;
  v39 = v40;
  v11 = v10;
  v38 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v37);
  v35[0] = v8;
  v35[1] = 3221225472;
  v35[2] = __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_2;
  v35[3] = &unk_1E93307D8;
  v13 = v7;
  v36 = v13;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v35);
  v34 = 0;
  -[TRIXPCNamespaceManagementRequestHandler _validateNamespaceName:error:](self, "_validateNamespaceName:error:", v9, &v34);
  if (!v34)
  {
    v15 = (void *)MEMORY[0x1E0D815A8];
    TRILogCategory_Server();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0DC0E60];
    v18 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v18;
    if (objc_msgSend(v15, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", buf, v17, v16))
    {

    }
    else
    {
      v19 = *MEMORY[0x1E0DC0E70];
      v20 = *(_OWORD *)&self->_auditToken.val[4];
      *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
      *(_OWORD *)&buf[16] = v20;
      objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v19, buf);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 == 0;

      if (v22)
      {
        ((void (**)(_QWORD, uint64_t, const __CFString *))v14)[2](v14, 3, CFSTR("Calling process is not entitled to load purgeability factor levels."));
        TRILogCategory_Server();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = self->_auditToken.val[5];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v25;
          *(_WORD *)&buf[8] = 2114;
          *(_QWORD *)&buf[10] = v19;
          _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required to load purgeability factor levels: %{public}@", buf, 0x12u);
        }
        goto LABEL_8;
      }
    }
    v26 = v8;
    v27 = 3221225472;
    v28 = __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_153;
    v29 = &unk_1E93308A0;
    v32 = v11;
    v33 = v13;
    v30 = self;
    v31 = v9;
    v23 = (void *)MEMORY[0x1D8232C48](&v26);
    -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v23, v26, v27, v28, v29, v30);

    v24 = v32;
LABEL_8:

    goto LABEL_9;
  }
  if (v13)
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
LABEL_9:

  if (v12)
    v12[2](v12);

  _Block_object_dispose(v40, 8);
}

void __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = "end";
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12[0] = 67110146;
    if (!a2)
      v9 = "begin";
    v12[1] = v5;
    v13 = 2114;
    v14 = v7;
    v15 = 2048;
    v16 = v10;
    v17 = 2080;
    v18 = v9;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s loadNamespaceMetadataForNamespaceName:%{public}@ completion:", (uint8_t *)v12, 0x30u);

  }
}

uint64_t __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_150(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (objc_class *)MEMORY[0x1E0CB35C8];
    v6 = a3;
    v7 = [v5 alloc];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_2_154;
  v13[3] = &unk_1E9330760;
  v14 = *(id *)(a1 + 48);
  v7 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v13);
  if (v5 && v6)
  {
    v8 = (void *)objc_opt_new();
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "paths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_loadNamespaceMetadataForNamespace:usingEntitlementWitness:withPaths:completion:", v10, v8, v11, *(_QWORD *)(a1 + 56));

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 56);
    if (!v12)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v8);
  }

LABEL_7:
  if (v7)
    v7[2](v7);

}

uint64_t __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_2_154(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setProvisionalFactorPackId:(id)a3 forNamespaceName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  void (**v14)(_QWORD, _QWORD);
  void (**v15)(_QWORD);
  id v16;
  id v17;
  uint64_t v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  NSObject *v29;
  unsigned int v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  NSObject *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _BYTE buf[32];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke;
  v47[3] = &unk_1E9330878;
  v47[4] = self;
  v31 = v8;
  v48 = v31;
  v12 = v9;
  v49 = v12;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v47);
  v13[2](v13, 0);
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v40[0] = v11;
  v40[1] = 3221225472;
  v40[2] = __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_155;
  v40[3] = &unk_1E93349A0;
  v42 = &v43;
  v14 = v13;
  v41 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v40);
  v37[0] = v11;
  v37[1] = 3221225472;
  v37[2] = __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_2;
  v37[3] = &unk_1E93349F0;
  v16 = v12;
  v38 = v16;
  v17 = v10;
  v39 = v17;
  v18 = MEMORY[0x1D8232C48](v37);
  v19 = (void (**)(_QWORD, _QWORD, _QWORD))v18;
  if (!v16)
  {
    (*(void (**)(uint64_t, uint64_t, const __CFString *))(v18 + 16))(v18, 2, CFSTR("Namespace name must not be nil."));
    goto LABEL_8;
  }
  v20 = (void *)MEMORY[0x1E0D815A8];
  TRILogCategory_Server();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0DC0E60];
  v23 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v23;
  if (objc_msgSend(v20, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", buf, v22, v21))
  {

  }
  else
  {
    v24 = *MEMORY[0x1E0DC0E70];
    v25 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v25;
    objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v24, buf);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 == 0;

    if (v27)
    {
      ((void (**)(_QWORD, uint64_t, const __CFString *))v19)[2](v19, 3, CFSTR("Calling process is not entitled to set factor pack id provisional."));
      TRILogCategory_Server();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = self->_auditToken.val[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v30;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v24;
        _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required set factor pack id provisional: %{public}@", buf, 0x12u);
      }
      goto LABEL_7;
    }
  }
  v32[0] = v11;
  v32[1] = 3221225472;
  v32[2] = __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_158;
  v32[3] = &unk_1E9330A30;
  v35 = v14;
  v36 = v17;
  v32[4] = self;
  v33 = v31;
  v34 = v16;
  v28 = (void *)MEMORY[0x1D8232C48](v32);
  -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v28);
  *((_BYTE *)v44 + 24) = 1;

  v29 = v35;
LABEL_7:

LABEL_8:
  if (v15)
    v15[2](v15);

  _Block_object_dispose(&v43, 8);
}

void __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  qos_class_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1[4] + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = "end";
    else
      v8 = "begin";
    v9 = a1[4];
    v10 = a1[5];
    v11 = a1[6];
    v12[0] = 67110658;
    v12[1] = v5;
    v13 = 2114;
    v14 = v7;
    v15 = 2048;
    v16 = v9;
    v17 = 2080;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    v23 = 1024;
    v24 = qos_class_self();
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s setProvisionalFactorPackId:%{public}@ forNamespaceName:%{public}@ completion: qos:%u", (uint8_t *)v12, 0x40u);

  }
}

uint64_t __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_155(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v5;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "failed to setProvisionalFactorPackId %{public}@: %{public}@", buf, 0x16u);
  }

  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v9);

}

void __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_2_159;
  v10[3] = &unk_1E9330760;
  v11 = *(id *)(a1 + 56);
  v7 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v10);
  if (v5 && v6)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend((id)objc_opt_class(), "_setProvisionalFactorPackId:usingEntitlementWitness:serverContext:forNamespaceName:completion:", *(_QWORD *)(a1 + 40), v8, v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 64);
    if (!v9)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v8);
  }

LABEL_7:
  if (v7)
    v7[2](v7);

}

uint64_t __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_2_159(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rejectFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void (**v16)(_QWORD, _QWORD);
  void (**v17)(_QWORD);
  id v18;
  id v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  NSObject *v31;
  void *v32;
  unsigned int v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  void (**v41)(_QWORD, _QWORD);
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _QWORD v53[5];
  id v54;
  id v55;
  _BYTE buf[32];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v35 = a5;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke;
  v53[3] = &unk_1E9330878;
  v53[4] = self;
  v34 = v10;
  v54 = v34;
  v14 = v11;
  v55 = v14;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v53);
  v15[2](v15, 0);
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v46[0] = v13;
  v46[1] = 3221225472;
  v46[2] = __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_160;
  v46[3] = &unk_1E93349A0;
  v48 = &v49;
  v16 = v15;
  v47 = v16;
  v17 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v46);
  v43[0] = v13;
  v43[1] = 3221225472;
  v43[2] = __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2;
  v43[3] = &unk_1E93349F0;
  v18 = v14;
  v44 = v18;
  v19 = v12;
  v45 = v19;
  v20 = MEMORY[0x1D8232C48](v43);
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))v20;
  if (!v18)
  {
    (*(void (**)(uint64_t, uint64_t, const __CFString *))(v20 + 16))(v20, 2, CFSTR("Namespace name must not be nil."));
    goto LABEL_8;
  }
  v22 = (void *)MEMORY[0x1E0D815A8];
  TRILogCategory_Server();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0DC0E60];
  v25 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v25;
  if (objc_msgSend(v22, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", buf, v24, v23))
  {

  }
  else
  {
    v26 = *MEMORY[0x1E0DC0E70];
    v27 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v27;
    objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v26, buf, v34, v35);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (v29)
    {
      ((void (**)(_QWORD, uint64_t, const __CFString *))v21)[2](v21, 3, CFSTR("Calling process is not entitled to reject factor pack id."));
      TRILogCategory_Server();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v33 = self->_auditToken.val[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v33;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v26;
        _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required reject factor pack id: %{public}@", buf, 0x12u);
      }
      goto LABEL_7;
    }
  }
  v30 = (void *)objc_opt_new();
  v36[0] = v13;
  v36[1] = 3221225472;
  v36[2] = __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_163;
  v36[3] = &unk_1E9334B20;
  v41 = v16;
  v42 = v19;
  v36[4] = self;
  v37 = v34;
  v31 = v30;
  v38 = v31;
  v39 = v18;
  v40 = v35;
  v32 = (void *)MEMORY[0x1D8232C48](v36);
  -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v32);
  *((_BYTE *)v50 + 24) = 1;

LABEL_7:
LABEL_8:

  if (v17)
    v17[2](v17);

  _Block_object_dispose(&v49, 8);
}

void __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1[4] + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = "end";
    v10 = a1[4];
    v11 = a1[5];
    v12 = a1[6];
    if (!a2)
      v9 = "begin";
    v13[0] = 67110402;
    v13[1] = v5;
    v14 = 2114;
    v15 = v7;
    v16 = 2048;
    v17 = v10;
    v18 = 2080;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s rejectFactorPackId:%{public}@ forNamespaceName:%{public}@ completion:", (uint8_t *)v13, 0x3Au);

  }
}

uint64_t __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_160(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v5;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "failed to rejectFactorPackId %{public}@: %{public}@", buf, 0x16u);
  }

  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v9);

}

void __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2_164;
  v10[3] = &unk_1E9330760;
  v11 = *(id *)(a1 + 72);
  v7 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v10);
  if (v5 && v6)
  {
    objc_msgSend((id)objc_opt_class(), "_rejectFactorPackId:usingEntitlementWitness:serverContext:forNamespaceName:rolloutDeployment:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 80);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    }
  }
  if (v7)
    v7[2](v7);

}

uint64_t __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2_164(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)promoteFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void (**v16)(_QWORD, _QWORD);
  void (**v17)(_QWORD);
  id v18;
  id v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  NSObject *v31;
  void *v32;
  unsigned int v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  void (**v41)(_QWORD, _QWORD);
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _QWORD v53[5];
  id v54;
  id v55;
  _BYTE buf[32];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v35 = a5;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke;
  v53[3] = &unk_1E9330878;
  v53[4] = self;
  v34 = v10;
  v54 = v34;
  v14 = v11;
  v55 = v14;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v53);
  v15[2](v15, 0);
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v46[0] = v13;
  v46[1] = 3221225472;
  v46[2] = __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_165;
  v46[3] = &unk_1E93349A0;
  v48 = &v49;
  v16 = v15;
  v47 = v16;
  v17 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v46);
  v43[0] = v13;
  v43[1] = 3221225472;
  v43[2] = __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2;
  v43[3] = &unk_1E93349F0;
  v18 = v14;
  v44 = v18;
  v19 = v12;
  v45 = v19;
  v20 = MEMORY[0x1D8232C48](v43);
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))v20;
  if (!v18)
  {
    (*(void (**)(uint64_t, uint64_t, const __CFString *))(v20 + 16))(v20, 2, CFSTR("Namespace name must not be nil."));
    goto LABEL_8;
  }
  v22 = (void *)MEMORY[0x1E0D815A8];
  TRILogCategory_Server();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0DC0E60];
  v25 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v25;
  if (objc_msgSend(v22, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", buf, v24, v23))
  {

  }
  else
  {
    v26 = *MEMORY[0x1E0DC0E70];
    v27 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v27;
    objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v26, buf, v34, v35);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (v29)
    {
      ((void (**)(_QWORD, uint64_t, const __CFString *))v21)[2](v21, 3, CFSTR("Calling process is not entitled to remove on-demand factors."));
      TRILogCategory_Server();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v33 = self->_auditToken.val[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v33;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v26;
        _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required for on-demand factor removal: %{public}@", buf, 0x12u);
      }
      goto LABEL_7;
    }
  }
  v30 = (void *)objc_opt_new();
  v36[0] = v13;
  v36[1] = 3221225472;
  v36[2] = __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_166;
  v36[3] = &unk_1E9334B20;
  v41 = v16;
  v42 = v19;
  v36[4] = self;
  v37 = v34;
  v31 = v30;
  v38 = v31;
  v39 = v18;
  v40 = v35;
  v32 = (void *)MEMORY[0x1D8232C48](v36);
  -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v32);
  *((_BYTE *)v50 + 24) = 1;

LABEL_7:
LABEL_8:

  if (v17)
    v17[2](v17);

  _Block_object_dispose(&v49, 8);
}

void __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1[4] + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = "end";
    v10 = a1[4];
    v11 = a1[5];
    v12 = a1[6];
    if (!a2)
      v9 = "begin";
    v13[0] = 67110402;
    v13[1] = v5;
    v14 = 2114;
    v15 = v7;
    v16 = 2048;
    v17 = v10;
    v18 = 2080;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s promoteFactorPackId:%{public}@ forNamespaceName:%{public}@ completion:", (uint8_t *)v13, 0x3Au);

  }
}

uint64_t __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_165(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v5;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "failed to promoteFactorPackId for %{public}@: %{public}@", buf, 0x16u);
  }

  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v9);

}

void __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_166(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2_167;
  v10[3] = &unk_1E9330760;
  v11 = *(id *)(a1 + 72);
  v7 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v10);
  if (v5 && v6)
  {
    objc_msgSend((id)objc_opt_class(), "_promoteFactorPackId:usingEntitlementWitness:serverContext:forNamespaceName:rolloutDeployment:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 80);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    }
  }
  if (v7)
    v7[2](v7);

}

uint64_t __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2_167(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)statusOfDownloadForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  void (**v19)(_QWORD, _QWORD);
  void (**v20)(_QWORD);
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  TRIXPCNamespaceManagementRequestHandler *v31;
  id v32;
  id v33;
  id v34;
  void (**v35)(_QWORD, _QWORD);
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke;
  v47[3] = &unk_1E9330A08;
  v47[4] = self;
  v15 = v10;
  v48 = v15;
  v16 = v11;
  v49 = v16;
  v17 = v12;
  v50 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v47);
  v18[2](v18, 0);
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v40[0] = v14;
  v40[1] = 3221225472;
  v40[2] = __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_168;
  v40[3] = &unk_1E93349A0;
  v42 = &v43;
  v19 = v18;
  v41 = v19;
  v20 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v40);
  if (objc_msgSend(MEMORY[0x1E0DC0AD0], "unsafeFirstAuthenticationState"))
  {
    v38[0] = v14;
    v38[1] = 3221225472;
    v38[2] = __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_169;
    v38[3] = &unk_1E93307D8;
    v21 = v13;
    v39 = v21;
    v22 = (void *)MEMORY[0x1D8232C48](v38);
    v27 = v14;
    v28 = 3221225472;
    v29 = __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_2;
    v30 = &unk_1E9334B70;
    v35 = v19;
    v36 = v21;
    v31 = self;
    v23 = v22;
    v37 = v23;
    v32 = v15;
    v33 = v16;
    v34 = v17;
    v24 = (void *)MEMORY[0x1D8232C48](&v27);
    -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v24, v27, v28, v29, v30, v31);
    *((_BYTE *)v44 + 24) = 1;

    v25 = v39;
LABEL_7:

    goto LABEL_8;
  }
  TRILogCategory_Server();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v16;
    _os_log_impl(&dword_1D207F000, v26, OS_LOG_TYPE_DEFAULT, "cannot determine download status of factors for %@", buf, 0xCu);
  }

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v25);
    goto LABEL_7;
  }
LABEL_8:
  if (v20)
    v20[2](v20);

  _Block_object_dispose(&v43, 8);
}

void __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  qos_class_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1[4] + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = "end";
    else
      v8 = "begin";
    v9 = a1[4];
    v10 = a1[5];
    v12 = a1[6];
    v11 = a1[7];
    v13[0] = 67110914;
    v13[1] = v5;
    v14 = 2114;
    v15 = v7;
    v16 = 2048;
    v17 = v9;
    v18 = 2080;
    v19 = v8;
    v20 = 2114;
    v21 = v10;
    v22 = 2114;
    v23 = v12;
    v24 = 2114;
    v25 = v11;
    v26 = 1026;
    v27 = qos_class_self();
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s statusOfDownloadForFactors:%{public}@ withNamespace:%{public}@ fstate:%{public}@ qos:%{public}u completion:", (uint8_t *)v13, 0x4Au);

  }
}

uint64_t __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_168(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_169(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (objc_class *)MEMORY[0x1E0CB35C8];
    v6 = a3;
    v7 = [v5 alloc];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  _QWORD v37[5];
  id v38;
  id v39;
  int v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _BYTE buf[32];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_3;
  v42[3] = &unk_1E9330760;
  v43 = *(id *)(a1 + 64);
  v8 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v42);
  if (v5 && v6)
  {
    v9 = (void *)MEMORY[0x1E0D815A8];
    v10 = *(_QWORD *)(a1 + 32);
    TRILogCategory_Server();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0DC0E60];
    v13 = *(_OWORD *)(v10 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v10 + 16);
    *(_OWORD *)&buf[16] = v13;
    if (objc_msgSend(v9, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", buf, v12, v11))
    {

LABEL_8:
      v41 = 0;
      v40 = 0;
      v38 = 0;
      v39 = 0;
      v21 = (void *)MEMORY[0x1E0DC0A88];
      v22 = *(_QWORD *)(a1 + 40);
      v23 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "paths");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v21, "validateDownloadForFactors:withNamespace:paths:container:factorsState:assetIndexesByTreatment:experimentIds:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployments:error:", v22, v23, v24, &v40, *(_QWORD *)(a1 + 56), &v39, 0, &v38, 0, 0, &v41);

      objc_msgSend((id)objc_opt_class(), "_notificationKeyWithNamespace:assetIndexesByTreatment:assetIdsByFactorPack:", *(_QWORD *)(a1 + 48), v39, v38);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      TRILogCategory_Server();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v39;
        _os_log_impl(&dword_1D207F000, v27, OS_LOG_TYPE_INFO, "Notification key is %@, asset index: %@", buf, 0x16u);
      }

      if ((v25 & 1) != 0)
      {
        if (objc_msgSend(v39, "count") || objc_msgSend(v38, "count"))
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          *(_QWORD *)&buf[24] = 1;
          v28 = (void *)MEMORY[0x1D8232A5C]();
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v26, 0);
          objc_autoreleasePoolPop(v28);
          v37[0] = v7;
          v37[1] = 3221225472;
          v37[2] = __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_173;
          v37[3] = &unk_1E9334B48;
          v37[4] = buf;
          objc_msgSend(v6, "enumerateTasksWithTagsIntersectingTagSet:block:", v29, v37);

          v30 = *(_QWORD *)(a1 + 72);
          if (v30)
            (*(void (**)(void))(v30 + 16))();
          _Block_object_dispose(buf, 8);
        }
        else
        {
          TRILogCategory_Server();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v34;
            _os_log_impl(&dword_1D207F000, v33, OS_LOG_TYPE_INFO, "Got on-demand factor status for namespace \"%@\" with all assets already downloaded.", buf, 0xCu);
          }

          v35 = *(_QWORD *)(a1 + 72);
          if (v35)
            (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v35 + 16))(v35, 4, 0, 0);
          objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadCompletedForKey:", v26);
        }
      }
      else
      {
        v31 = *(_QWORD *)(a1 + 72);
        if (v31)
          (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v31 + 16))(v31, 0, 0, v41);
      }

      goto LABEL_19;
    }
    v16 = *MEMORY[0x1E0DC0E70];
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(_OWORD *)(v17 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v17 + 16);
    *(_OWORD *)&buf[16] = v18;
    objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v16, buf);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (!v20)
      goto LABEL_8;
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    TRILogCategory_Server();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v36 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v36;
      *(_WORD *)&buf[8] = 2114;
      *(_QWORD *)&buf[10] = v16;
      _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required for seeing download status of on-demand factors: %{public}@", buf, 0x12u);
    }

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 72);
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v14 + 16))(v14, 0, 0, v15);

    }
  }
LABEL_19:
  if (v8)
    v8[2](v8);

}

uint64_t __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_173(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  char isKindOfClass;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "task");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "task");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCurrentlyExecuting");
    v9 = 2;
    if (!v8)
      v9 = 3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;

  }
  *a3 = 1;

}

- (void)getSandboxExtensionTokensForIdentifierQueryWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void (**v7)(_QWORD, _QWORD);
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[8];
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[5];

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __101__TRIXPCNamespaceManagementRequestHandler_getSandboxExtensionTokensForIdentifierQueryWithCompletion___block_invoke;
  v26[3] = &unk_1E9330738;
  v26[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v26);
  v6[2](v6, 0);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __101__TRIXPCNamespaceManagementRequestHandler_getSandboxExtensionTokensForIdentifierQueryWithCompletion___block_invoke_176;
  v19[3] = &unk_1E93349A0;
  v21 = &v22;
  v7 = v6;
  v20 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v19);
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "treatmentsDir");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRISandboxExtensionFactory extensionTokenForPath:extensionClass:](TRISandboxExtensionFactory, "extensionTokenForPath:extensionClass:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v9, "addObject:", v12);
  objc_msgSend(v10, "namespaceDescriptorsDir");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRISandboxExtensionFactory extensionTokenForPath:extensionClass:](TRISandboxExtensionFactory, "extensionTokenForPath:extensionClass:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v9, "addObject:", v14);
  if (objc_msgSend(v9, "count") == 2)
  {
    v15 = (void *)objc_msgSend(v9, "copy");
    v4[2](v4, v15, 0);
  }
  else
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Could not obtain sandbox extension tokens", v18, 2u);
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 16, 0);
    v17 = (void *)objc_opt_new();
    ((void (**)(id, void *, void *))v4)[2](v4, v17, v15);

  }
  *((_BYTE *)v23 + 24) = 1;

  if (v8)
    v8[2](v8);

  _Block_object_dispose(&v22, 8);
}

void __101__TRIXPCNamespaceManagementRequestHandler_getSandboxExtensionTokensForIdentifierQueryWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2)
      v10 = "begin";
    v12 = 2114;
    v13 = v7;
    v14 = 2048;
    v15 = v9;
    v16 = 2080;
    v17 = v10;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s getSandboxExtensionTokensForIdentifierQueryWithCompletioncompletion:", (uint8_t *)v11, 0x26u);

  }
}

uint64_t __101__TRIXPCNamespaceManagementRequestHandler_getSandboxExtensionTokensForIdentifierQueryWithCompletion___block_invoke_176(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)_setPurgeabilityLevelsForFactors:(id)a3 usingEntitlementWitness:(id)a4 namespace:(id)a5 paths:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    if (v13)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCNamespaceManagementService.m"), 1237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("purgeabilityLevelsForFactors"));

    if (v15)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCNamespaceManagementService.m"), 1238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCNamespaceManagementService.m"), 1236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entitlementWitness"));

  if (!v13)
    goto LABEL_6;
LABEL_3:
  if (!v15)
    goto LABEL_7;
LABEL_4:
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __127__TRIXPCNamespaceManagementRequestHandler__setPurgeabilityLevelsForFactors_usingEntitlementWitness_namespace_paths_completion___block_invoke;
  v26[3] = &unk_1E9334B98;
  v29 = v13;
  v30 = v17;
  v26[4] = self;
  v27 = v15;
  v28 = v16;
  v18 = v13;
  v19 = v16;
  v20 = v15;
  v21 = v17;
  v22 = (void *)MEMORY[0x1D8232C48](v26);
  -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v22);

}

void __127__TRIXPCNamespaceManagementRequestHandler__setPurgeabilityLevelsForFactors_usingEntitlementWitness_namespace_paths_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "paths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_factorProviderChainForNamespace:paths:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "_validateSetPurgeabilityLevelRequestUsingFactorProviderChain:paths:purgeabilityLevelsForFactors:error:", v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &v36) & 1) != 0)
    {
      v31 = v7;
      v12 = (void *)objc_opt_new();
      v30 = v11;
      objc_msgSend(v12, "setCompatibilityVersion:", objc_msgSend(v11, "namespaceCompatibilityVersion"));
      v13 = objc_alloc_init(MEMORY[0x1E0DC0F48]);
      objc_msgSend(v12, "setFactorNamePurgeabilityLevels:", v13);

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v14 = *(id *)(a1 + 56);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v33 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "intValue");

            objc_msgSend(v12, "factorNamePurgeabilityLevels");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setEnum:forKey:", v21, v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v16);
      }

      v23 = objc_alloc(MEMORY[0x1E0DC09F0]);
      objc_msgSend(v5, "paths");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithPaths:", v24);

      objc_msgSend(v25, "mergeNamespaceMetadata:forNamespaceName:", v12, *(_QWORD *)(a1 + 40));
      v26 = *(_QWORD *)(a1 + 64);
      if (v26)
        (*(void (**)(uint64_t, _QWORD))(v26 + 16))(v26, 0);

      v11 = v30;
      v7 = v31;
    }
    else
    {
      v29 = *(_QWORD *)(a1 + 64);
      if (v29)
        (*(void (**)(uint64_t, id))(v29 + 16))(v29, v36);
    }

  }
  else
  {
    v27 = *(_QWORD *)(a1 + 64);
    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);

    }
  }

}

- (BOOL)_validateSetPurgeabilityLevelRequestUsingFactorProviderChain:(id)a3 paths:(id)a4 purgeabilityLevelsForFactors:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int IsValidValue;
  BOOL v19;
  const __CFString *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  id *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  uint8_t buf[16];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = a5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v10)
  {
    v19 = 1;
    goto LABEL_17;
  }
  v11 = v10;
  v28 = a6;
  v12 = *(_QWORD *)v30;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v30 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
      objc_msgSend(v8, "levelForFactor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fileOrDirectoryLevelWithIsDir:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v20 = CFSTR("Found invalid factor name %@");
LABEL_14:
        v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v20, v14);
        TRILogCategory_Server();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v21;
          _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v34, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v24);

        v26 = *v28;
        *v28 = (id)v25;

        v19 = 0;
        goto LABEL_17;
      }
      objc_msgSend(v9, "objectForKeyedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "intValue");
      IsValidValue = TRIPurgeabilityLevel_IsValidValue();

      if (!IsValidValue)
      {
        v20 = CFSTR("Found invalid purgeability level for factorName %@");
        goto LABEL_14;
      }

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v19 = 1;
    if (v11)
      continue;
    break;
  }
LABEL_17:

  return v19;
}

- (int)_namespacePurgeabilityLevelForNamespaceName:(id)a3 paths:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "namespaceDescriptorsDefaultDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC0AD8], "loadWithNamespaceName:fromDirectory:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v7, "purgeabilityLevel");
  return (int)v5;
}

- (void)_loadNamespaceMetadataForNamespace:(id)a3 usingEntitlementWitness:(id)a4 withPaths:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, id, _QWORD);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, id, _QWORD))a6;
  if (v12)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCNamespaceManagementService.m"), 1312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entitlementWitness"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCNamespaceManagementService.m"), 1313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_3:
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC09F0]), "initWithPaths:", v13);
  v23 = 0;
  objc_msgSend(v15, "loadNamespaceMetadataForNamespaceName:error:", v11, &v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v23;
  if (!v17)
  {
    -[TRIXPCNamespaceManagementRequestHandler _factorProviderChainForNamespace:paths:](self, "_factorProviderChainForNamespace:paths:", v11, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "compatibilityVersion");
    if (v19 == objc_msgSend(v18, "namespaceCompatibilityVersion"))
    {
      v20 = v16;
      if (!v14)
        goto LABEL_11;
    }
    else
    {
      v20 = 0;
      if (!v14)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    v14[2](v14, v20, 0);
    goto LABEL_11;
  }
  if (v14)
    ((void (**)(id, id, id))v14)[2](v14, 0, v17);
LABEL_12:

}

- (id)_factorProviderChainForNamespace:(id)a3 paths:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B08]), "initWithPaths:", v6);
  v13 = 0;
  objc_msgSend(v7, "resolveFactorProviderChainForNamespaceName:faultOnMissingInstalledFactors:installedFactorsAccessible:", v5, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v13)
  {
    objc_msgSend(v8, "_pas_filteredArrayWithTest:", &__block_literal_global_198);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0AE8]), "initWithNamespaceName:typedProviderChain:paths:", v5, v9, v6);

  return v11;
}

BOOL __82__TRIXPCNamespaceManagementRequestHandler__factorProviderChainForNamespace_paths___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") != 1;
}

- (BOOL)_validateNamespaceName:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a3;
  if (!v5)
  {
    __72__TRIXPCNamespaceManagementRequestHandler__validateNamespaceName_error___block_invoke(CFSTR("namespaceName must be non-nil."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *a4;
    *a4 = v7;
LABEL_6:

    v6 = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend(MEMORY[0x1E0DC0BB8], "validateSafeASCIISubsetIdentifier:", v5) & 1) == 0)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("namespaceName(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)"), v5);
    __72__TRIXPCNamespaceManagementRequestHandler__validateNamespaceName_error___block_invoke(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *a4;
    *a4 = v9;

    goto LABEL_6;
  }
  v6 = 1;
LABEL_7:

  return v6;
}

id __72__TRIXPCNamespaceManagementRequestHandler__validateNamespaceName_error___block_invoke(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (objc_class *)MEMORY[0x1E0CB35C8];
  v2 = a1;
  v3 = [v1 alloc];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v4);
  return v5;
}

+ (void)_purgeMismatchedDataForDynamicNamespaceName:(id)a3 appContainer:(id)a4 serverContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(a1, "_deploymentsWithUnexpectedExperimentDataInContainer:dynamicNamespaceName:serverContext:", v9, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_204);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      TRILoggedNamespaceName(v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v15;
      v40 = 2114;
      v41 = v16;
      _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Mismatch in experiments for dynamic namespace %{public}@: %{public}@", buf, 0x16u);

    }
    v31 = v13;
    v32 = v11;

    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Purging data for these deployments...", buf, 2u);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v34;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v34 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v22);
          objc_msgSend(v10, "experimentDatabase", v31, v32, (_QWORD)v33);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeExperimentRecordWithExperimentDeployment:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v20);
    }

    objc_msgSend(v10, "paths");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pathsForContainer:asClientProcess:", v9, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "trialRootDir");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject triForceRemoveItemAtPath:error:](v27, "triForceRemoveItemAtPath:error:", v28, 0);

      v29 = v31;
      v11 = v32;
    }
    else
    {
      TRILogCategory_Server();
      v27 = objc_claimAutoreleasedReturnValue();
      v29 = v31;
      v11 = v32;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v30;
        _os_log_impl(&dword_1D207F000, v27, OS_LOG_TYPE_DEFAULT, "Skipping purge of Trial data in missing container: %{public}@", buf, 0xCu);

      }
    }

  }
  objc_autoreleasePoolPop(v11);

}

uint64_t __114__TRIXPCNamespaceManagementRequestHandler__purgeMismatchedDataForDynamicNamespaceName_appContainer_serverContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortDesc");
}

+ (id)_deploymentsWithUnexpectedExperimentDataInContainer:(id)a3 dynamicNamespaceName:(id)a4 serverContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "experimentDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1D8232A5C]();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E9363ED0, 0);
  objc_autoreleasePoolPop(v12);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __130__TRIXPCNamespaceManagementRequestHandler__deploymentsWithUnexpectedExperimentDataInContainer_dynamicNamespaceName_serverContext___block_invoke;
  v19[3] = &unk_1E9330B50;
  v20 = v8;
  v14 = v10;
  v21 = v14;
  v15 = v8;
  objc_msgSend(v11, "enumerateExperimentRecordsMatchingStatuses:block:", v13, v19);

  v16 = v21;
  v17 = v14;

  return v17;
}

void __130__TRIXPCNamespaceManagementRequestHandler__deploymentsWithUnexpectedExperimentDataInContainer_dynamicNamespaceName_serverContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "namespaces", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
        {
          objc_msgSend(v9, "treatmentURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v9, "treatmentURL");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", 0);

            if ((v13 & 1) == 0)
            {
              v14 = *(void **)(a1 + 40);
              objc_msgSend(v3, "experimentDeployment");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v15);

              goto LABEL_13;
            }
          }
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
LABEL_13:

}

+ (void)usingServerContext:(id)a3 registerNamespaceWithNamespaceName:(id)a4 compatibilityVersion:(unsigned int)a5 defaultsFileURL:(id)a6 teamId:(id)a7 appContainerId:(id)a8 appContainerType:(int64_t)a9 cloudKitContainerId:(int)a10 bundleId:(id)a11 completion:(id)a12
{
  uint64_t v15;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  uint64_t v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v15 = *(_QWORD *)&a5;
  v58 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a4;
  v51 = a6;
  v21 = a7;
  v22 = a8;
  v50 = a11;
  v23 = a12;
  if (v19)
  {
    if (v20)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1450, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

    if (v20)
    {
LABEL_3:
      if (v21)
        goto LABEL_4;
LABEL_34:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1452, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("teamId"));

      if (v22)
        goto LABEL_5;
      goto LABEL_35;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1451, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  if (!v21)
    goto LABEL_34;
LABEL_4:
  if (v22)
    goto LABEL_5;
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1453, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appContainerId"));

LABEL_5:
  v48 = a1;
  TRILogCategory_Server();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    TRILoggedNamespaceName(v20);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v57 = v40;
    _os_log_debug_impl(&dword_1D207F000, v24, OS_LOG_TYPE_DEBUG, "registering namespace %{public}@", buf, 0xCu);

  }
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __213__TRIXPCNamespaceManagementRequestHandler_usingServerContext_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_bundleId_completion___block_invoke;
  v53[3] = &unk_1E93309B8;
  v25 = v23;
  v55 = v25;
  v26 = v20;
  v54 = v26;
  v27 = MEMORY[0x1D8232C48](v53);
  v28 = (void (**)(_QWORD, _QWORD, _QWORD))v27;
  if ((_DWORD)v15)
  {
    objc_msgSend(v19, "namespaceDatabase");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v46) = a10;
    v49 = v21;
    v30 = objc_msgSend(v29, "addOrUpdateDynamicNamespaceWithName:compatibilityVersion:defaultsFileURL:teamId:appContainerId:appContainerType:cloudKitContainer:", v26, v15, v51, v21, v22, a9, v46);

    if ((v30 & 1) != 0)
    {
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0DC0990], "containerWithIdentifier:type:", v22, a9);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }
      v21 = v49;
      v32 = (void *)objc_opt_new();
      objc_msgSend(v32, "setFactorsURL:", v51);
      objc_msgSend(v32, "setAppContainer:", v31);
      objc_msgSend(v32, "setCloudKitContainerId:", a10);
      objc_msgSend(v32, "setResourceAttributionIdentifier:", v50);
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0AD8]), "initWithNamespaceName:downloadNCV:optionalParams:", v26, v15, v32);
      objc_msgSend(v19, "paths");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v31)
      {
        objc_msgSend(v33, "pathsForContainer:asClientProcess:", v31, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v35)
        {
          ((void (**)(_QWORD, uint64_t, const __CFString *))v28)[2](v28, 1, CFSTR("Unable to resolve app container."));
LABEL_30:

          goto LABEL_31;
        }
        v52 = 0;
        if ((objc_msgSend(v35, "validateWithError:", &v52) & 1) != 0)
        {
          objc_msgSend(v48, "_purgeMismatchedDataForDynamicNamespaceName:appContainer:serverContext:", v26, v31, v19);
          v34 = v35;
LABEL_19:
          objc_msgSend(v34, "namespaceDescriptorsDefaultDir");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v47, "saveToDirectory:", v36);

          if ((v37 & 1) != 0)
          {
            if (v25)
            {
              TRILogCategory_Server();
              v38 = objc_claimAutoreleasedReturnValue();
              v21 = v49;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                TRILoggedNamespaceName(v26);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v57 = v41;
                _os_log_debug_impl(&dword_1D207F000, v38, OS_LOG_TYPE_DEBUG, "registered namespace %{public}@", buf, 0xCu);

                v21 = v49;
              }

              (*((void (**)(id, uint64_t, _QWORD))v25 + 2))(v25, 1, 0);
              goto LABEL_29;
            }
          }
          else
          {
            ((void (**)(_QWORD, uint64_t, const __CFString *))v28)[2](v28, 1, CFSTR("Unable to write namespace descriptor."));
          }
          v21 = v49;
LABEL_29:

          goto LABEL_30;
        }
        v34 = v35;
      }
      else
      {
        v52 = 0;
        if ((objc_msgSend(v33, "validateWithError:", &v52) & 1) != 0)
          goto LABEL_19;
      }
      objc_msgSend(v52, "description");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *))v28)[2](v28, 1, v39);

      goto LABEL_29;
    }
    ((void (**)(_QWORD, uint64_t, const __CFString *))v28)[2](v28, 1, CFSTR("Unable to register namespace."));
    v21 = v49;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, const __CFString *))(v27 + 16))(v27, 2, CFSTR("namespace compatibility version must be greater than zero"));
  }
LABEL_31:

}

void __213__TRIXPCNamespaceManagementRequestHandler_usingServerContext_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_bundleId_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      TRILoggedNamespaceName(*(void **)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "failed to register namespace %{public}@: %{public}@", buf, 0x16u);

    }
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0CB2D50];
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (void)usingServerContext:(id)a3 deregisterNamespaceWithName:(id)a4 teamId:(id)a5 taskQueue:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  TRIClientTreatmentStorage *v52;
  void *v53;
  TRIFBClientTreatmentStorage *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  TRIClientTreatmentStorage *v70;
  NSObject *v71;
  TRIFBClientTreatmentStorage *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  char v78;
  NSObject *v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  void *v83;
  __CFString *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  void (**v94)(_QWORD, uint64_t, const __CFString *);
  id v95;
  uint64_t v96;
  id v97;
  id v98;
  uint64_t v99;
  id obj;
  void *v101;
  uint64_t v102;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  void *v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[4];
  id v118;
  id v119;
  _QWORD v120[4];
  id v121;
  id v122;
  uint8_t buf[4];
  void *v124;
  __int16 v125;
  void *v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v95 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1532, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_3:
  v17 = MEMORY[0x1E0C809B0];
  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = __118__TRIXPCNamespaceManagementRequestHandler_usingServerContext_deregisterNamespaceWithName_teamId_taskQueue_completion___block_invoke;
  v120[3] = &unk_1E93349F0;
  v18 = v14;
  v121 = v18;
  v19 = v16;
  v122 = v19;
  v20 = MEMORY[0x1D8232C48](v120);
  objc_msgSend(v13, "namespaceDatabase");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dynamicNamespaceRecordWithNamespaceName:", v18);
  v22 = objc_claimAutoreleasedReturnValue();

  v103 = (void *)v22;
  if (v22)
  {
    v94 = (void (**)(_QWORD, uint64_t, const __CFString *))v20;
    v92 = v19;
    v23 = objc_opt_new();
    objc_msgSend(v13, "experimentDatabase");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v117[0] = v17;
    v117[1] = 3221225472;
    v117[2] = __118__TRIXPCNamespaceManagementRequestHandler_usingServerContext_deregisterNamespaceWithName_teamId_taskQueue_completion___block_invoke_226;
    v117[3] = &unk_1E9330B50;
    v93 = v18;
    v104 = v18;
    v118 = v104;
    v25 = (id)v23;
    v119 = v25;
    LOBYTE(v23) = objc_msgSend(v24, "enumerateExperimentRecordsWithBlock:", v117);

    if ((v23 & 1) == 0)
    {
      v83 = v94;
      v94[2](v94, 1, CFSTR("Unable to check for pending updates"));
      v19 = v92;
LABEL_74:

      v18 = v93;
      goto LABEL_75;
    }
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    obj = v25;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v128, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v114;
      v97 = v25;
      v98 = v15;
      v96 = *(_QWORD *)v114;
      do
      {
        v29 = 0;
        v99 = v27;
        do
        {
          if (*(_QWORD *)v114 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v29);
          v31 = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(v30, "experimentDeployment");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "taskTag");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "cancelTasksWithTag:", v33);

          v34 = v30;
          v107 = v30;
          if (objc_msgSend(v30, "type") == 1)
          {
            v101 = v31;
            v102 = v29;
            v111 = 0u;
            v112 = 0u;
            v109 = 0u;
            v110 = 0u;
            objc_msgSend(v30, "namespaces");
            v105 = (id)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
            v36 = v103;
            if (v35)
            {
              v37 = v35;
              v106 = *(_QWORD *)v110;
              do
              {
                for (i = 0; i != v37; ++i)
                {
                  if (*(_QWORD *)v110 != v106)
                    objc_enumerationMutation(v105);
                  objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * i), "name");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "name");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v39, "isEqualToString:", v40))
                  {
                    v41 = v36;
                  }
                  else
                  {
                    objc_msgSend(v13, "namespaceDatabase");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "dynamicNamespaceRecordWithNamespaceName:", v104);
                    v41 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  objc_msgSend(v13, "paths");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v41)
                  {
                    objc_msgSend(v41, "appContainer");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "pathsForContainer:asClientProcess:", v44, 0);
                    v45 = objc_claimAutoreleasedReturnValue();

                    v43 = (void *)v45;
                  }
                  if (v43)
                  {
                    v46 = (void *)MEMORY[0x1E0DC0AD8];
                    objc_msgSend(v36, "name");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "namespaceDescriptorsExperimentDir");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "loadWithNamespaceName:fromDirectory:", v47, v48);
                    v49 = objc_claimAutoreleasedReturnValue();

                    if (v49)
                    {
                      objc_msgSend(v43, "namespaceDescriptorsExperimentDir");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSObject removeFromDirectory:](v49, "removeFromDirectory:", v50);

                    }
                    v34 = v107;
                    objc_msgSend(v107, "treatmentId");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v51)
                    {
                      v52 = -[TRIClientTreatmentStorage initWithPaths:]([TRIClientTreatmentStorage alloc], "initWithPaths:", v43);
                      objc_msgSend(v107, "treatmentId");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      -[TRIClientTreatmentStorage removeTreatmentWithTreatmentId:](v52, "removeTreatmentWithTreatmentId:", v53);

                      if (_os_feature_enabled_impl())
                      {
                        v54 = -[TRIFBClientTreatmentStorage initWithPaths:]([TRIFBClientTreatmentStorage alloc], "initWithPaths:", v43);
                        objc_msgSend(v107, "treatmentId");
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        -[TRIFBClientTreatmentStorage removeTreatmentWithTreatmentId:](v54, "removeTreatmentWithTreatmentId:", v55);

                        v34 = v107;
                      }

                    }
                  }
                  else
                  {
                    TRILogCategory_Server();
                    v49 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v41, "appContainer");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v56, "identifier");
                      v57 = v13;
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v103, "name");
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      TRILoggedNamespaceName(v59);
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v124 = v58;
                      v125 = 2114;
                      v126 = v60;
                      _os_log_impl(&dword_1D207F000, v49, OS_LOG_TYPE_DEFAULT, "Missing container %{public}@ for namespace %{public}@.", buf, 0x16u);

                      v13 = v57;
                      v36 = v103;

                      v34 = v107;
                    }
                  }

                }
                v37 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
              }
              while (v37);
            }

            v25 = v97;
            v15 = v98;
            v28 = v96;
            v27 = v99;
            v31 = v101;
            v29 = v102;
          }
          objc_msgSend(v13, "experimentDatabase");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "experimentDeployment");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v61, "removeExperimentRecordWithExperimentDeployment:", v62);

          if (!v63)
          {
            TRILogCategory_Server();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v107, "experimentDeployment");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "shortDesc");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v124 = v66;
              _os_log_error_impl(&dword_1D207F000, v64, OS_LOG_TYPE_ERROR, "failed to remove experiment %{public}@ from database", buf, 0xCu);

            }
          }
          objc_autoreleasePoolPop(v31);
          ++v29;
        }
        while (v29 != v27);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v128, 16);
      }
      while (v27);
    }

    objc_msgSend(v13, "paths");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "appContainer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "pathsForContainer:asClientProcess:", v68, 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v69)
    {
      v83 = v94;
      v94[2](v94, 1, CFSTR("Unable to resolve app container."));
      v19 = v92;
LABEL_73:

      goto LABEL_74;
    }
    v108 = 0;
    if ((objc_msgSend(v69, "validateWithError:", &v108) & 1) != 0)
    {
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        v70 = -[TRIClientTreatmentStorage initWithPaths:]([TRIClientTreatmentStorage alloc], "initWithPaths:", v69);
        if (!-[TRIClientTreatmentStorage removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:](v70, "removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:", 2, v104, 0))
        {
          TRILogCategory_Server();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            TRILoggedNamespaceName(v104);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v124 = v88;
            _os_log_error_impl(&dword_1D207F000, v71, OS_LOG_TYPE_ERROR, "failed to remove descriptor from rollout layer for namespace %{public}@", buf, 0xCu);

          }
        }

      }
      if (_os_feature_enabled_impl())
      {
        v72 = -[TRIFBClientTreatmentStorage initWithPaths:]([TRIFBClientTreatmentStorage alloc], "initWithPaths:", v69);
        if (!-[TRIFBClientTreatmentStorage removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:](v72, "removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:", 2, v104, 0))
        {
          TRILogCategory_Server();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            TRILoggedNamespaceName(v104);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v124 = v89;
            _os_log_error_impl(&dword_1D207F000, v73, OS_LOG_TYPE_ERROR, "Flatbuffers: failed to remove descriptor from rollout layer for namespace %{public}@", buf, 0xCu);

          }
        }

      }
      v74 = (void *)MEMORY[0x1E0DC0AD8];
      objc_msgSend(v69, "namespaceDescriptorsDefaultDir");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v74) = objc_msgSend(v74, "removeDescriptorWithNamespaceName:fromDirectory:", v104, v75);

      if ((v74 & 1) == 0)
      {
        TRILogCategory_Server();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          TRILoggedNamespaceName(v104);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v124 = v86;
          _os_log_error_impl(&dword_1D207F000, v76, OS_LOG_TYPE_ERROR, "failed to remove descriptor from default layer for namespace %{public}@", buf, 0xCu);

        }
      }
      v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B18]), "initWithPaths:", v69);
      v78 = objc_msgSend(v77, "deleteStatusForNamespaceWithName:", v104);

      if ((v78 & 1) == 0)
      {
        TRILogCategory_Server();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          TRILoggedNamespaceName(v104);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v124 = v87;
          _os_log_error_impl(&dword_1D207F000, v79, OS_LOG_TYPE_ERROR, "failed to remove status file for namespace %{public}@", buf, 0xCu);

        }
      }
      objc_msgSend(v13, "namespaceDatabase");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v80, "removeDynamicNamespaceRecordWithNamespaceName:", v104);

      if (v81)
      {
        TRILogCategory_Server();
        v82 = objc_claimAutoreleasedReturnValue();
        v83 = v94;
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
        {
          TRILoggedNamespaceName(v104);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v124 = v85;
          _os_log_debug_impl(&dword_1D207F000, v82, OS_LOG_TYPE_DEBUG, "deregistered namespace %{public}@", buf, 0xCu);

          v83 = v94;
        }

        v19 = v92;
        if (v92)
          (*((void (**)(id, uint64_t, _QWORD))v92 + 2))(v92, 1, 0);
        goto LABEL_72;
      }
      v83 = v94;
      v94[2](v94, 1, CFSTR("Unable to deregister namespace."));
    }
    else
    {
      objc_msgSend(v108, "description");
      v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v94[2](v94, 1, v84);

      v83 = v94;
    }
    v19 = v92;
LABEL_72:

    goto LABEL_73;
  }
  (*(void (**)(uint64_t, uint64_t, const __CFString *))(v20 + 16))(v20, 2, CFSTR("namespace is not registered"));
  v83 = (void *)v20;
LABEL_75:

}

void __118__TRIXPCNamespaceManagementRequestHandler_usingServerContext_deregisterNamespaceWithName_teamId_taskQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    TRILoggedNamespaceName(*(void **)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v5;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "failed to deregister namespace %{public}@: %{public}@", buf, 0x16u);

  }
  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v9);

}

void __118__TRIXPCNamespaceManagementRequestHandler_usingServerContext_deregisterNamespaceWithName_teamId_taskQueue_completion___block_invoke_226(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a2;
  objc_msgSend(v6, "namespaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __118__TRIXPCNamespaceManagementRequestHandler_usingServerContext_deregisterNamespaceWithName_teamId_taskQueue_completion___block_invoke_2;
  v7[3] = &unk_1E9334C20;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "_pas_filteredArrayWithTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

uint64_t __118__TRIXPCNamespaceManagementRequestHandler_usingServerContext_deregisterNamespaceWithName_teamId_taskQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (void)usingServerContext:(id)a3 taskQueue:(id)a4 startDownloadNamespaceWithName:(id)a5 attribution:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, uint64_t, _QWORD);
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, uint64_t, _QWORD))a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1676, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_19:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1678, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

      if (v16)
        goto LABEL_5;
      goto LABEL_20;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1677, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskQueue"));

  if (!v15)
    goto LABEL_19;
LABEL_4:
  if (v16)
    goto LABEL_5;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1679, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributing"));

LABEL_5:
  if (+[TRIUserAdjustableSettings getExperimentOptOut:](TRIUserAdjustableSettings, "getExperimentOptOut:", v13))
  {
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v15;
      _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, "Skipping download for namespace: %{public}@ due to user opt-out of experiments", buf, 0xCu);
    }

    v19 = (void *)objc_opt_class();
    objc_msgSend(v16, "networkOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resumeTaskQueue:forNetworkOptions:", v14, v20);

    if (v17)
      v17[2](v17, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v15, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIFetchMultipleExperimentNotificationsTask taskWithStartingFetchDateOverride:namespaceNames:taskAttributing:rollbacksOnly:limitedCarryOnly:](TRIFetchMultipleExperimentNotificationsTask, "taskWithStartingFetchDateOverride:namespaceNames:taskAttributing:rollbacksOnly:limitedCarryOnly:", v21, v22, v16, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v14, "addTask:options:", v23, v24);

    if (v25 == 2)
    {
      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v35 = *MEMORY[0x1E0CB2D50];
      v36 = CFSTR("Unable to download namespace.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 13, v27);

    }
    else
    {
      v29 = (void *)objc_opt_class();
      objc_msgSend(v16, "networkOptions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "resumeTaskQueue:forNetworkOptions:", v14, v30);

      v28 = 0;
    }
    if (v17)
      ((void (**)(id, uint64_t, void *))v17)[2](v17, v25 != 2, v28);

  }
}

+ (void)_startDownloadAssetIndexesByTreatment:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 taskQueue:(id)a6 experimentIds:(id)a7 assetIdsByFactorPack:(id)a8 rolloutFactorNames:(id)a9 rolloutDeployments:(id)a10 namespace:(id)a11 taskAttribution:(id)a12 factorsState:(id)a13 notificationKey:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  TRITaskCapabilityModifier *v46;
  void *v47;
  int v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v62;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  uint8_t *v78;
  uint8_t buf[8];
  uint8_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[5];
  _QWORD v88[5];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint8_t v93[4];
  id v94;
  __int16 v95;
  id v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v73 = a3;
  v19 = a4;
  v20 = a5;
  v72 = a6;
  v69 = a7;
  v74 = a8;
  v67 = a9;
  v68 = a10;
  v71 = a11;
  v21 = a12;
  v66 = a13;
  v22 = a14;
  v65 = v19;
  v70 = v22;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1722, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entitlementWitness"));

    v22 = v70;
  }
  v23 = v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1723, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

    v22 = v70;
  }
  if (!v72)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1724, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskQueue"));

    v22 = v70;
  }
  if (!v73)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1725, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIndexesByTreatment"));

    v22 = v70;
  }
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1726, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIdsByFactorPack"));

    v22 = v70;
  }
  if (v71)
  {
    if (v22)
      goto LABEL_13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1727, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

    if (v70)
      goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1728, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationKey"));

LABEL_13:
  v24 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1729, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskAttribution"));

  }
  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v25 = MEMORY[0x1E0C809B0];
  v92 = 0;
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke;
  v88[3] = &unk_1E9334C48;
  v88[4] = &v89;
  objc_msgSend(v73, "enumerateKeysAndObjectsUsingBlock:", v88);
  v87[0] = v25;
  v87[1] = 3221225472;
  v87[2] = __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke_2;
  v87[3] = &unk_1E9334C70;
  v87[4] = &v89;
  objc_msgSend(v74, "enumerateKeysAndObjectsUsingBlock:", v87);
  if (v90[3])
  {
    v85[0] = v25;
    v85[1] = 3221225472;
    v85[2] = __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke_258;
    v85[3] = &unk_1E9334C98;
    v26 = v24;
    v86 = v26;
    v27 = (void *)MEMORY[0x1D8232C48](v85);
    *(_QWORD *)buf = 0;
    v80 = buf;
    v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__35;
    v83 = __Block_byref_object_dispose__35;
    +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
    v84 = (id)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1D8232A5C]();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v70, 0);
    objc_autoreleasePoolPop(v28);
    v76[0] = v25;
    v76[1] = 3221225472;
    v76[2] = __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke_260;
    v76[3] = &unk_1E9334CC0;
    v62 = v27;
    v77 = v62;
    v78 = buf;
    objc_msgSend(v72, "enumerateTasksWithTagsIntersectingTagSet:block:", v29, v76);

    if (v69)
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v69);
      if (objc_msgSend(v30, "count") == 1)
      {
        objc_msgSend(v30, "anyObject");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        TRILogCategory_Server();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v93 = 138412290;
          v94 = v30;
          _os_log_impl(&dword_1D207F000, v33, OS_LOG_TYPE_DEFAULT, "Received != 1 experiment id for TRIFetchOnDemandFactorsTask, so none will be logged. Received %@", v93, 0xCu);
        }

        v64 = 0;
      }

    }
    else
    {
      v64 = 0;
    }
    if (v68)
    {
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v68);
      if (objc_msgSend(v34, "count") == 1)
      {
        objc_msgSend(v34, "anyObject");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        TRILogCategory_Server();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v93 = 138412290;
          v94 = v34;
          _os_log_impl(&dword_1D207F000, v36, OS_LOG_TYPE_DEFAULT, "Received != 1 deployment for TRIFetchOnDemandFactorsTask, so none will be logged. Received %@", v93, 0xCu);
        }

        v35 = 0;
      }

    }
    else
    {
      v35 = 0;
    }
    v37 = (void *)objc_opt_new();
    objc_msgSend(v26, "networkOptions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "allowsCellularAccess");

    if (v39)
    {
      v40 = (void *)MEMORY[0x1D8232A5C]();
      v41 = (void *)MEMORY[0x1E0DC0AD8];
      objc_msgSend(v23, "paths");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "namespaceDescriptorsDefaultDir");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "loadWithNamespaceName:fromDirectory:", v71, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v44, "expensiveNetworkingAllowed") & 1) == 0)
      {
        TRILogCategory_Server();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v93 = 138412290;
          v94 = v71;
          _os_log_impl(&dword_1D207F000, v45, OS_LOG_TYPE_DEFAULT, "Changing TRIFetchOnDemandFactorsTask to require inexpensive networking since %@ does not support expensive networking", v93, 0xCu);
        }

        v46 = -[TRITaskCapabilityModifier initWithAdd:remove:]([TRITaskCapabilityModifier alloc], "initWithAdd:remove:", 1, 2);
        v37 = v46;
      }

      objc_autoreleasePoolPop(v40);
    }
    +[TRIFetchOnDemandFactorsTask taskWithAssetIndexesByTreatment:experimentId:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployment:namespaceName:taskAttributing:notificationKey:capabilityModifier:](TRIFetchOnDemandFactorsTask, "taskWithAssetIndexesByTreatment:experimentId:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployment:namespaceName:taskAttributing:notificationKey:capabilityModifier:", v73, v64, v74, v67, v35, v71, v26, v70, v37);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0;
    v48 = objc_msgSend(v72, "addTask:options:taskId:", v47, *((_QWORD *)v80 + 5), &v75);
    if (v48)
    {
      if (v48 != 1)
      {
        if (v48 == 2)
        {
          TRILogCategory_Server();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v93 = 0;
            _os_log_error_impl(&dword_1D207F000, v49, OS_LOG_TYPE_ERROR, "Enqueue TRIFetchOnDemandFactorsTask failed; completing request.",
              v93,
              2u);
          }

          objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withError:", v70, 0);
        }
        goto LABEL_53;
      }
      TRILogCategory_Server();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v93 = 138543618;
        v94 = v70;
        v95 = 2112;
        v96 = v75;
        _os_log_impl(&dword_1D207F000, v52, OS_LOG_TYPE_DEFAULT, "Ignored duplicate TRIFetchOnDemandFactorsTask with notification key: %{public}@, duplicate of task [tid:%@]", v93, 0x16u);
      }
    }
    else
    {
      TRILogCategory_Server();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v93 = 138412546;
        v94 = v75;
        v95 = 2114;
        v96 = v70;
        _os_log_impl(&dword_1D207F000, v50, OS_LOG_TYPE_DEFAULT, "Enqueued TRIFetchOnDemandFactorsTask [tid:%@] with notification key: %{public}@", v93, 0x16u);
      }

      v51 = (void *)objc_opt_class();
      objc_msgSend(v26, "networkOptions");
      v52 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "resumeTaskQueue:forNetworkOptions:", v72, v52);
    }

LABEL_53:
    _Block_object_dispose(buf, 8);

    v32 = v70;
    goto LABEL_54;
  }
  TRILogCategory_Server();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v31, OS_LOG_TYPE_INFO, "Nothing to download, no factor names provided", buf, 2u);
  }

  v32 = v70;
  objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadProgressForKey:withProgress:", v70, 100);
  objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadCompletedForKey:", v70);
LABEL_54:
  _Block_object_dispose(&v89, 8);

}

uint64_t __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke_258(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;

  v5 = a2;
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0DC0E48];
  objc_msgSend(*(id *)(a1 + 32), "applicationBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v10 = (void *)*MEMORY[0x1E0DC0E58];
    objc_msgSend(*(id *)(a1 + 32), "applicationBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v10, "isEqual:", v11);

    if ((v10 & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 32), "networkOptions"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "discretionaryBehavior"),
          v12,
          !v13)
      && (objc_msgSend(v5, "discretionaryBehavior") == 2
       || (objc_msgSend(v6, "startDate"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, v15)))
    {
      v9 = 1;
      goto LABEL_9;
    }
    if ((objc_msgSend(v5, "allowsCellularAccess") & 1) != 0)
    {
      v9 = 0;
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "networkOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "allowsCellularAccess");
  }

LABEL_9:
  return v9;
}

void __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke_260(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "task");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "taskAttribution");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "networkOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = (*(uint64_t (**)(uint64_t, void *, id))(v9 + 16))(v9, v11, v5);

    if ((_DWORD)v9)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "taskId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v13;
        _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Found a preexisting TRIFetchOnDemandFactorsTask %@ with lower priority; attempting to replace with higher priority task.",
          (uint8_t *)&v17,
          0xCu);

      }
      v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyWithReplacementDuplicateTaskResolution:", 1);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      *a3 = 1;
    }

  }
}

+ (void)_immediateDownloadForNamespaceNames:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 taskQueue:(id)a6 allowExpensiveNetworking:(BOOL)a7 taskAttribution:(id)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD);
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  objc_class *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  _QWORD handler[4];
  id v52;
  id v53;
  void (**v54)(id, _QWORD);
  uint64_t *v55;
  id v56;
  _QWORD v57[5];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[4];
  id v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = (void (**)(id, _QWORD))a9;
  v50 = v15;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1860, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entitlementWitness"));

    if (v16)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1861, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

  if (v17)
  {
LABEL_4:
    if (v14)
      goto LABEL_5;
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1863, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceNames"));

    if (v18)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1862, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskQueue"));

  if (!v14)
    goto LABEL_24;
LABEL_5:
  if (v18)
    goto LABEL_6;
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 1864, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskAttribution"));

LABEL_6:
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__35;
  v62 = __Block_byref_object_dispose__35;
  v63 = 0;
  v20 = (void *)MEMORY[0x1E0DC0A00];
  objc_msgSend(v14, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "immediateDownloadNotificationKeyForNamespaceNames:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __179__TRIXPCNamespaceManagementRequestHandler__immediateDownloadForNamespaceNames_usingEntitlementWitness_serverContext_taskQueue_allowExpensiveNetworking_taskAttribution_completion___block_invoke;
    v57[3] = &unk_1E9334CE8;
    v57[4] = &v58;
    v49 = (void *)MEMORY[0x1D8232C48](v57);
    v23 = (id)objc_msgSend(MEMORY[0x1E0DC0A00], "registerDownloadNotificationForKey:queue:usingBlock:", v22, 0, v49);
    +[TRITaskQueuingOptions optionsWithDuplicateTaskResolution:](TRITaskQueuingOptions, "optionsWithDuplicateTaskResolution:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRISetupAssistantFetchUtils registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext:](TRISetupAssistantFetchUtils, "registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext:", v16);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRISelectRolloutNotificationListTask taskWithNamespaceNames:taskAttribution:](TRISelectRolloutNotificationListTask, "taskWithNamespaceNames:taskAttribution:", v14, v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    if (objc_msgSend(v17, "addTask:options:taskId:", v25, v24, &v56) == 2)
    {
      TRILogCategory_Server();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "Enqueue TRISelectRolloutNotificationListTask failed", buf, 2u);
      }

      v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v66 = *MEMORY[0x1E0CB2D50];
      v67 = CFSTR("Unable to enqueue TRISelectRolloutNotificationListTask");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 13, v28);
      v30 = (void *)v59[5];
      v59[5] = v29;

      if (v19)
        v19[2](v19, v59[5]);
    }
    else
    {
      TRILogCategory_Server();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v56;
        _os_log_impl(&dword_1D207F000, v36, OS_LOG_TYPE_DEFAULT, "Enqueued TRISelectRolloutNotificationListTask with [tid:%@]", buf, 0xCu);
      }

      v37 = (void *)objc_opt_class();
      objc_msgSend(v18, "networkOptions");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "resumeTaskQueue:forNetworkOptions:", v17, v38);

      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v41 = dispatch_queue_create((const char *)objc_msgSend(v40, "UTF8String"), 0);

      *(_DWORD *)buf = 0;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __179__TRIXPCNamespaceManagementRequestHandler__immediateDownloadForNamespaceNames_usingEntitlementWitness_serverContext_taskQueue_allowExpensiveNetworking_taskAttribution_completion___block_invoke_272;
      handler[3] = &unk_1E9334D10;
      v52 = v47;
      v53 = v16;
      v54 = v19;
      v55 = &v58;
      notify_register_dispatch("com.apple.trial.TaskQueueComplete", (int *)buf, v41, handler);

    }
  }
  else
  {
    TRILogCategory_Server();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "immediateDownloadForNamespaceNames called for unexpected use case, please reach out to trial-device-dev@group.apple.com before using this.", buf, 2u);
    }

    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v68 = *MEMORY[0x1E0CB2D50];
    v69[0] = CFSTR("immediateDownloadForNamespaceNames called for unexpected use case, please reach out to trial-device-dev@group.apple.com");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 3, v33);
    v35 = (void *)v59[5];
    v59[5] = v34;

    if (v19)
      v19[2](v19, v59[5]);
  }

  _Block_object_dispose(&v58, 8);
}

void __179__TRIXPCNamespaceManagementRequestHandler__immediateDownloadForNamespaceNames_usingEntitlementWitness_serverContext_taskQueue_allowExpensiveNetworking_taskAttribution_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v5, "type");
    objc_msgSend(v5, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218242;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Received download notification with type: %lu, error: %{public}@", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0DC0A00], "deregisterNotificationWithToken:", v6);

  if (objc_msgSend(v5, "type") == 2)
  {
    v10 = (void *)MEMORY[0x1E0DC0A00];
    objc_msgSend(v5, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "generalErrorFromDownloadNotificationError:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

void __179__TRIXPCNamespaceManagementRequestHandler__immediateDownloadForNamespaceNames_usingEntitlementWitness_serverContext_taskQueue_allowExpensiveNetworking_taskAttribution_completion___block_invoke_272(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "builtTelemetry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "client");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logger");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "client");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "trackingId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v12, 0, 0, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  notify_cancel(a2);

}

+ (void)resumeTaskQueue:(id)a3 forNetworkOptions:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "discretionaryBehavior"))
  {
    if (objc_msgSend(v6, "allowsCellularAccess"))
      objc_msgSend(a1, "_resumeTaskQueueForDiscretionaryCellularWithQueue:", v8);
    else
      objc_msgSend(a1, "_resumeTaskQueueForDiscretionaryWifiWithQueue:", v8);
  }
  else
  {
    v7 = -[TRIRunningXPCActivityDescriptor initForImmediateWorkWithCapabilities:]([TRIRunningXPCActivityDescriptor alloc], "initForImmediateWorkWithCapabilities:", 11);
    objc_msgSend(v8, "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v7, 0);

  }
}

+ (void)_reregisterOneShotXPCActivityWithDescriptor:(id)a3 resumingTaskQueue:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v8;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Re-registering one-shot XPC activity in hope of prompt execution: %{public}@", buf, 0xCu);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __105__TRIXPCNamespaceManagementRequestHandler__reregisterOneShotXPCActivityWithDescriptor_resumingTaskQueue___block_invoke_2;
  v10[3] = &unk_1E932F820;
  v11 = v6;
  v9 = v6;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v5, &__block_literal_global_277, v10);

}

void __105__TRIXPCNamespaceManagementRequestHandler__reregisterOneShotXPCActivityWithDescriptor_resumingTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v2;
  xpc_object_t v3;
  xpc_object_t xdict;

  v2 = a2;
  v3 = xpc_activity_copy_criteria(v2);
  if (!v3)
    v3 = xpc_dictionary_create(0, 0, 0);
  xdict = v3;
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C80760], 0);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C80790], 0);
  xpc_activity_set_criteria(v2, xdict);

}

uint64_t __105__TRIXPCNamespaceManagementRequestHandler__reregisterOneShotXPCActivityWithDescriptor_resumingTaskQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeWithXPCActivityDescriptor:executeWhenSuspended:", a2, 0);
}

+ (void)_resumeTaskQueueForDiscretionaryWifiWithQueue:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryWifiWithQueue___block_invoke;
  block[3] = &unk_1E932F918;
  v10 = v3;
  v4 = qword_1EFC742F8;
  v5 = v3;
  v8 = v5;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    dispatch_once(&qword_1EFC742F8, block);
    v6 = v10;
  }
  v7 = (id)_MergedGlobals_41;

  objc_msgSend(v7, "runAfterDelaySeconds:coalescingBehavior:", 1, 10.0);
}

void __89__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryWifiWithQueue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = (void *)MEMORY[0x1D8232A5C]();
  v3 = objc_alloc(MEMORY[0x1E0D81618]);
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.trial.discretionary-wifi-coalesce", 17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryWifiWithQueue___block_invoke_2;
  v7[3] = &unk_1E932F918;
  v8 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v3, "initWithQueue:operation:", v4, v7);

  v6 = (void *)_MergedGlobals_41;
  _MergedGlobals_41 = v5;

  objc_autoreleasePoolPop(v2);
}

void __89__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryWifiWithQueue___block_invoke_2(uint64_t a1)
{
  id v2;

  +[TRILaunchDaemonActivityDescriptor clientTriggeredWifiDescriptor](TRILaunchDaemonActivityDescriptor, "clientTriggeredWifiDescriptor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[TRIXPCNamespaceManagementRequestHandler _reregisterOneShotXPCActivityWithDescriptor:resumingTaskQueue:](TRIXPCNamespaceManagementRequestHandler, "_reregisterOneShotXPCActivityWithDescriptor:resumingTaskQueue:", v2, *(_QWORD *)(a1 + 32));

}

+ (void)_resumeTaskQueueForDiscretionaryCellularWithQueue:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryCellularWithQueue___block_invoke;
  block[3] = &unk_1E932F918;
  v10 = v3;
  v4 = qword_1EFC74308;
  v5 = v3;
  v8 = v5;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    dispatch_once(&qword_1EFC74308, block);
    v6 = v10;
  }
  v7 = (id)qword_1EFC74300;

  objc_msgSend(v7, "runAfterDelaySeconds:coalescingBehavior:", 1, 10.0);
}

void __93__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryCellularWithQueue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = (void *)MEMORY[0x1D8232A5C]();
  v3 = objc_alloc(MEMORY[0x1E0D81618]);
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.trial.discretionary-cellular-coalesce", 17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryCellularWithQueue___block_invoke_2;
  v7[3] = &unk_1E932F918;
  v8 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v3, "initWithQueue:operation:", v4, v7);

  v6 = (void *)qword_1EFC74300;
  qword_1EFC74300 = v5;

  objc_autoreleasePoolPop(v2);
}

void __93__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryCellularWithQueue___block_invoke_2(uint64_t a1)
{
  id v2;

  +[TRILaunchDaemonActivityDescriptor clientTriggeredCellularDescriptor](TRILaunchDaemonActivityDescriptor, "clientTriggeredCellularDescriptor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[TRIXPCNamespaceManagementRequestHandler _reregisterOneShotXPCActivityWithDescriptor:resumingTaskQueue:](TRIXPCNamespaceManagementRequestHandler, "_reregisterOneShotXPCActivityWithDescriptor:resumingTaskQueue:", v2, *(_QWORD *)(a1 + 32));

}

+ (void)_removeAssetFactors:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 taskQueue:(id)a6 namespace:(id)a7 factorsState:(id)a8 removeImmediately:(BOOL)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  TRIClientTreatmentStorage *v40;
  void *v41;
  TRIClientTreatmentStorage *v42;
  TRIFactorPackStorage *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  char v52;
  TRIAssetStore *v53;
  void *v54;
  TRIAssetStore *v55;
  id v56;
  id v57;
  id v58;
  TRIAssetStore *v59;
  id v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  TRIFactorPackStorage *v69;
  TRIClientTreatmentStorage *v70;
  TRIFactorPackStorage *v71;
  id v72;
  void *v73;
  void *v74;
  void *v76;
  void *v77;
  id v78;
  id v79;
  void (**v80)(id, _QWORD);
  uint8_t v81[16];
  _QWORD v82[4];
  TRIFactorPackStorage *v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  TRIAssetStore *v89;
  id *v90;
  _BYTE *v91;
  char v92;
  BOOL v93;
  _QWORD v94[4];
  id v95;
  id v96;
  TRIClientTreatmentStorage *v97;
  id v98;
  id *v99;
  _BYTE *v100;
  id v101;
  id *v102;
  uint64_t v103;
  char v104;
  _QWORD v105[4];
  id v106;
  id v107;
  id v108;
  id v109;
  _BYTE buf[24];
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint64_t v114;
  _QWORD v115[4];

  v115[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v79 = a6;
  v19 = a7;
  v78 = a8;
  v80 = (void (**)(id, _QWORD))a10;
  v77 = v17;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2020, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entitlementWitness"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2021, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

LABEL_3:
  if (v79)
  {
    if (v16)
      goto LABEL_5;
LABEL_42:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2023, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorNames"));

    if (v19)
      goto LABEL_6;
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2022, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskQueue"));

  if (!v16)
    goto LABEL_42;
LABEL_5:
  if (v19)
    goto LABEL_6;
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2024, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_6:
  v20 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v18, "keyValueStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:](TRINamespaceFactorSubscriptionSettings, "settingsWithKeyValueStore:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "subscribedFactorsForNamespaceName:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "minusSet:", v26);

  TRILogCategory_Server();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v19;
    _os_log_impl(&dword_1D207F000, v27, OS_LOG_TYPE_DEFAULT, "Unsubscribe factor %{public}@ in namespace '%{public}@'", buf, 0x16u);
  }

  objc_msgSend(v25, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = 0;
  v29 = objc_msgSend(v22, "setSubscriptionWithFactorNames:inNamespaceName:error:", v28, v19, &v109);
  v30 = v109;
  if ((v29 & 1) != 0)
  {

    objc_autoreleasePoolPop(v20);
    *(_QWORD *)buf = 0;
    v101 = 0;
    v31 = (void *)MEMORY[0x1E0DC0A88];
    objc_msgSend(v18, "paths");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = objc_msgSend(v31, "validateDownloadForFactors:withNamespace:paths:container:factorsState:assetIndexesByTreatment:experimentIds:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployments:error:", v16, v19, v32, 0, v78, buf, 0, &v101, 0, 0, 0);

    if ((_DWORD)v31)
    {
      objc_msgSend((id)objc_opt_class(), "_notificationKeyWithNamespace:assetIndexesByTreatment:assetIdsByFactorPack:", v19, *(_QWORD *)buf, v101);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = 0;
    }

    if (v76 && (objc_msgSend(v79, "cancelTasksWithTag:", v76) & 1) == 0)
    {
      TRILogCategory_Server();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v76;
        _os_log_error_impl(&dword_1D207F000, v34, OS_LOG_TYPE_ERROR, "Unable to cancel downloading task with notification key: '%{public}@'", buf, 0xCu);
      }

    }
    v35 = objc_alloc(MEMORY[0x1E0DC0B08]);
    objc_msgSend(v18, "paths");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)objc_msgSend(v35, "initWithPaths:factorsState:", v36, v78);

    if (v74)
    {
      v37 = (void *)MEMORY[0x1E0DC0AE8];
      objc_msgSend(v18, "paths");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "factorProviderWithPaths:namespaceName:resolver:", v38, v19, v74);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      v107 = 0;
      v108 = 0;
      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke;
      v105[3] = &unk_1E9334D78;
      v39 = v19;
      v106 = v39;
      objc_msgSend(v73, "computeTreatmentAssetIndexes:withAssociatedExperimentIds:andFactorPackAssetIds:withAssociatedRolloutDeployments:withExperimentFactorNames:andRolloutFactorNames:forFactors:usingFilter:", &v108, 0, &v107, 0, 0, 0, v16, v105);
      v40 = [TRIClientTreatmentStorage alloc];
      objc_msgSend(v18, "paths");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[TRIClientTreatmentStorage initWithPaths:](v40, "initWithPaths:", v41);

      v43 = [TRIFactorPackStorage alloc];
      objc_msgSend(v18, "paths");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = -[TRIFactorPackStorage initWithPaths:](v43, "initWithPaths:", v44);

      v45 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v73, "factorNamesWithObfuscation:", v16);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v45, "initWithArray:", v46);

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v111 = __Block_byref_object_copy__35;
      v112 = __Block_byref_object_dispose__35;
      v113 = 0;
      v101 = 0;
      v102 = &v101;
      v103 = 0x2020000000;
      v104 = 0;
      v48 = v108;
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke_292;
      v94[3] = &unk_1E9334DA0;
      v99 = &v101;
      v49 = v39;
      v95 = v49;
      v50 = v18;
      v96 = v50;
      v70 = v42;
      v97 = v70;
      v51 = v47;
      v98 = v51;
      v100 = buf;
      objc_msgSend(v48, "enumerateKeysAndObjectsUsingBlock:", v94);
      if (a9)
        v52 = 3;
      else
        v52 = 1;
      v53 = [TRIAssetStore alloc];
      objc_msgSend(v50, "paths");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[TRIAssetStore initWithPaths:](v53, "initWithPaths:", v54);

      v56 = v107;
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke_296;
      v82[3] = &unk_1E9334DC8;
      v90 = &v101;
      v69 = v71;
      v83 = v69;
      v57 = v49;
      v84 = v57;
      v92 = v52;
      v72 = v51;
      v85 = v72;
      v91 = buf;
      v86 = v50;
      v58 = v73;
      v87 = v58;
      v88 = v16;
      v93 = a9;
      v59 = v55;
      v89 = v59;
      objc_msgSend(v56, "enumerateKeysAndObjectsUsingBlock:", v82);
      if (*((_BYTE *)v102 + 24))
      {
        objc_msgSend(MEMORY[0x1E0DC0B20], "notifyUpdateForNamespaceName:", v57);
      }
      else
      {
        TRILogCategory_Server();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v81 = 0;
          _os_log_impl(&dword_1D207F000, v63, OS_LOG_TYPE_INFO, "Nothing to remove. No local asset found.", v81, 2u);
        }

      }
      if (v80)
        v80[2](v80, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

      _Block_object_dispose(&v101, 8);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to resolve namespaces for stale factorsState: %@"), v78);
      v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v114 = *MEMORY[0x1E0CB2D50];
      v115[0] = v58;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, &v114, 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)objc_msgSend(v60, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v61);

      if (v80)
        ((void (**)(id, void *))v80)[2](v80, v62);

    }
  }
  else
  {
    TRILogCategory_Server();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "Unable to update on-demand asset subscription, error: %{public}@", buf, 0xCu);
    }

    if (v80)
      ((void (**)(id, id))v80)[2](v80, v30);

    objc_autoreleasePoolPop(v20);
  }

}

uint64_t __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  int v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v11;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Error removing on-demand asset, %{public}@", (uint8_t *)&v21, 0xCu);

    }
    goto LABEL_13;
  }
  if ((objc_msgSend(v8, "isOnDemand") & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v21 = 138543618;
      v22 = v7;
      v23 = 2114;
      v24 = v15;
      v16 = "Ignore removal of asset of factor \"%{public}@\" in namespace \"%{public}@\" which is not on-demand";
      v17 = v10;
      v18 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
      _os_log_impl(&dword_1D207F000, v17, v18, v16, (uint8_t *)&v21, 0x16u);
    }
LABEL_13:

    v14 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend(v8, "hasPath")
    || (objc_msgSend(v8, "path"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "length"),
        v12,
        !v13))
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v21 = 138543618;
      v22 = v7;
      v23 = 2114;
      v24 = v19;
      v16 = "Ignore removal of asset of factor \"%{public}@\" in namespace \"%{public}@\" which does not have local path";
      v17 = v10;
      v18 = OS_LOG_TYPE_INFO;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v14 = 1;
LABEL_14:

  return v14;
}

void __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke_292(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _BOOL8 v19;
  TRIFBClientTreatmentStorage *v20;
  void *v21;
  TRIFBClientTreatmentStorage *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  v7 = (void *)MEMORY[0x1E0DC0AD8];
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "paths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "namespaceDescriptorsRolloutDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadWithNamespaceName:fromDirectory:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "updateSavedTreatmentWithTreatmentId:deletingAssetsWithFactorNames:forNamespaceName:forRollouts:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), v11 != 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v5;
      v29 = 2112;
      v30 = v6;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Unable to update treatment %@ with asset removal of %@", buf, 0x16u);
    }

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v26 = CFSTR("Unable to update treatment with one or more asset removal");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
  }
  if (_os_feature_enabled_impl())
  {
    v19 = v11 != 0;
    v20 = [TRIFBClientTreatmentStorage alloc];
    objc_msgSend(*(id *)(a1 + 40), "paths");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[TRIFBClientTreatmentStorage initWithPaths:](v20, "initWithPaths:", v21);

    -[TRIFBClientTreatmentStorage updateSavedTreatmentWithTreatmentId:deletingAssetsWithFactorNames:forNamespaceName:forRollouts:](v22, "updateSavedTreatmentWithTreatmentId:deletingAssetsWithFactorNames:forNamespaceName:forRollouts:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqual:", v23) & 1) == 0)
    {
      TRILogCategory_Server();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v23;
        v29 = 2112;
        v30 = v12;
        _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "Updated treatment from fb storage: %@ does not match treatment from pb storage: %@", buf, 0x16u);
      }

    }
  }

}

void __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke_296(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  TRIFBFactorPackStorage *v16;
  void *v17;
  TRIFBFactorPackStorage *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  if ((objc_msgSend(*(id *)(a1 + 32), "updateSavedFactorPackWithId:namespaceName:deletingAssetsWithFactorNames:inUseAssetBehavior:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 104)) & 1) == 0&& !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("Unable to update treatment with one or more asset removal");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  objc_msgSend(*(id *)(a1 + 32), "pathForFactorPackWithId:namespaceName:", v5, *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fileExistsAtPath:", v13);

  if (v15 && _os_feature_enabled_impl())
  {
    v16 = [TRIFBFactorPackStorage alloc];
    objc_msgSend(*(id *)(a1 + 56), "paths");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TRIFBFactorPackStorage initWithPaths:](v16, "initWithPaths:", v17);

    v19 = *(_QWORD *)(a1 + 40);
    v20 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(*(id *)(a1 + 64), "factorNamesWithObfuscation:", *(_QWORD *)(a1 + 72));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithArray:", v21);
    LOBYTE(v19) = -[TRIFBFactorPackStorage updateSavedFactorLevelsWithFactorPackId:namespaceName:deletingAssetsWithFactorNames:inUseAssetBehavior:](v18, "updateSavedFactorLevelsWithFactorPackId:namespaceName:deletingAssetsWithFactorNames:inUseAssetBehavior:", v5, v19, v22, *(unsigned __int8 *)(a1 + 104));

    if ((v19 & 1) == 0)
    {
      TRILogCategory_Server();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v5;
        _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "Could not update saved factor levels for remove asset for factor pack id: %@", buf, 0xCu);
      }

    }
  }
  if (*(_BYTE *)(a1 + 105))
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke_301;
    v24[3] = &unk_1E9332A20;
    v25 = *(id *)(a1 + 80);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v24);

  }
}

void __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke_301(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "assetId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Immediately removing %{public}@", (uint8_t *)&v8, 0xCu);

  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v3, "assetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAssetWithIdentifier:", v7);

}

+ (void)_setProvisionalFactorPackId:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 forNamespaceName:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, uint64_t, id);
  TRINamespaceResolverStorage *v18;
  void *v19;
  TRINamespaceResolverStorage *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, uint64_t, id))a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entitlementWitness"));

    if (v15)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackId"));

      if (v16)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

  if (!v13)
    goto LABEL_10;
LABEL_4:
  if (v16)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_5:
  v18 = [TRINamespaceResolverStorage alloc];
  objc_msgSend(v15, "paths");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[TRINamespaceResolverStorage initWithPaths:](v18, "initWithPaths:", v19);

  v26 = 0;
  v21 = -[TRINamespaceResolverStorage setProvisionalFactorPackId:forNamespaceName:error:](v20, "setProvisionalFactorPackId:forNamespaceName:error:", v13, v16, &v26);
  if (v17)
    v17[2](v17, v21, v26);

}

+ (void)_rejectFactorPackId:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 forNamespaceName:(id)a6 rolloutDeployment:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, uint64_t, id);
  TRINamespaceResolverStorage *v21;
  void *v22;
  TRINamespaceResolverStorage *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = (void (**)(id, uint64_t, id))a8;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entitlementWitness"));

    if (v17)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackId"));

      if (v18)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

  if (!v15)
    goto LABEL_10;
LABEL_4:
  if (v18)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_5:
  v21 = [TRINamespaceResolverStorage alloc];
  objc_msgSend(v17, "paths");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[TRINamespaceResolverStorage initWithPaths:](v21, "initWithPaths:", v22);

  v29 = 0;
  v24 = -[TRINamespaceResolverStorage rejectFactorPackId:forNamespaceName:rolloutDeployment:error:](v23, "rejectFactorPackId:forNamespaceName:rolloutDeployment:error:", v15, v18, v19, &v29);
  if (v20)
    v20[2](v20, v24, v29);

}

+ (void)_promoteFactorPackId:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 forNamespaceName:(id)a6 rolloutDeployment:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, uint64_t, id);
  TRINamespaceResolverStorage *v21;
  void *v22;
  TRINamespaceResolverStorage *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = (void (**)(id, uint64_t, id))a8;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entitlementWitness"));

    if (v17)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackId"));

      if (v18)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

  if (!v15)
    goto LABEL_10;
LABEL_4:
  if (v18)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCNamespaceManagementService.m"), 2255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_5:
  v21 = [TRINamespaceResolverStorage alloc];
  objc_msgSend(v17, "paths");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[TRINamespaceResolverStorage initWithPaths:](v21, "initWithPaths:", v22);

  v29 = 0;
  v24 = -[TRINamespaceResolverStorage promoteFactorPackId:forNamespaceName:rolloutDeployment:error:](v23, "promoteFactorPackId:forNamespaceName:rolloutDeployment:error:", v15, v18, v19, &v29);
  if (v20)
    v20[2](v20, v24, v29);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverContextPromise, 0);
}

@end

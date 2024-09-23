@implementation TRIXPCNamespaceManagementClient

void __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSystemHelper, 0);
  objc_storeStrong((id *)&self->_internalHelper, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

- (TRIXPCNamespaceManagementClient)init
{
  TRIXPCNamespaceManagementClient *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  _PASXPCClientHelper *helper;
  id v16;
  void *v17;
  uint64_t v18;
  _PASXPCClientHelper *internalHelper;
  id v20;
  void *v21;
  uint64_t v22;
  _PASXPCClientHelper *internalSystemHelper;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)TRIXPCNamespaceManagementClient;
  v2 = -[TRIXPCNamespaceManagementClient init](&v25, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE415FA8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE416008);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE416068);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1A1AC6B8C]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_activeRolloutInformationWithPrivacyFilterPolicy_completion_, 0, 1);

    v12 = objc_alloc(MEMORY[0x1E0D81640]);
    TRILogCategory_ClientFramework();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:allowSystemToUserConnection:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.triald.namespace-management"), v3, 0, 0, 1, &__block_literal_global, &__block_literal_global_126, v13);
    helper = v2->_helper;
    v2->_helper = (_PASXPCClientHelper *)v14;

    v16 = objc_alloc(MEMORY[0x1E0D81640]);
    TRILogCategory_ClientFramework();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:allowSystemToUserConnection:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.triald.internal"), v4, 0, 0, 1, &__block_literal_global_127, &__block_literal_global_128, v17);
    internalHelper = v2->_internalHelper;
    v2->_internalHelper = (_PASXPCClientHelper *)v18;

    v20 = objc_alloc(MEMORY[0x1E0D81640]);
    TRILogCategory_ClientFramework();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.triald.system.internal"), v5, 0, 0, &__block_literal_global_129, &__block_literal_global_130, v21);
    internalSystemHelper = v2->_internalSystemHelper;
    v2->_internalSystemHelper = (_PASXPCClientHelper *)v22;

  }
  return v2;
}

- (BOOL)immediateDownloadForNamespaceNames:(id)a3 allowExpensiveNetworking:(BOOL)a4 error:(id *)a5
{
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  TRIXPCNamespaceManagementClient *v30;
  _BYTE *v31;
  uint64_t *v32;
  int v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceNames"));

  }
  v10 = qos_class_self();
  v11 = +[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState");
  v12 = v11;
  v13 = v11 == 1;
  v14 = &stru_1E3C00710;
  if (v11 == 2)
    v14 = CFSTR("(unknown class C status) ");
  if (!v11)
    v14 = CFSTR("(before class C unlock) ");
  v15 = v14;
  TRILogCategory_ClientFramework();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = 2 * v13;
  if (os_log_type_enabled(v16, v17))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 1026;
    LODWORD(v40) = v10;
    _os_log_impl(&dword_19B89C000, v16, v17, "%@enqueuing immediateDownloadForNamespaceNames for: %@ at qos:%{public}u", buf, 0x1Cu);
  }
  v18 = v12 == 2;

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v19 = dispatch_group_create();
  dispatch_group_enter(v19);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke;
  v27[3] = &unk_1E3BFE850;
  v20 = v19;
  v28 = v20;
  v21 = v9;
  v33 = v10;
  v29 = v21;
  v30 = self;
  v34 = a4;
  v31 = buf;
  v32 = &v35;
  v22 = MEMORY[0x1A1AC6D30](v27);
  v23 = (void *)v22;
  if (v18)
    (*(void (**)(uint64_t))(v22 + 16))(v22);
  else
    objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlockedWithQoS:block:", v10, v22);
  dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v24 = *((_BYTE *)v36 + 24) != 0;

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

  return v24;
}

void __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[4];
  id v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v2 = MEMORY[0x1E0C809B0];
  v30 = *MEMORY[0x1E0C80C00];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke_2;
  v24[3] = &unk_1E3BFE828;
  v25 = *(id *)(a1 + 32);
  v3 = (void (**)(_QWORD))MEMORY[0x1A1AC6D30](v24);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v17[0] = v2;
  v17[1] = 3221225472;
  v17[2] = __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke_3;
  v17[3] = &unk_1E3BFE738;
  v17[4] = &v18;
  v4 = (void *)MEMORY[0x1A1AC6D30](v17);
  TRILogCategory_ClientFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_DWORD *)(a1 + 72);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = v7;
    _os_log_impl(&dword_19B89C000, v5, OS_LOG_TYPE_DEFAULT, "(after class C unlock) enqueuing immediateDownloadForNamespaceNames for: %@ at qos:%{public}u", buf, 0x12u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(unsigned __int8 *)(a1 + 76);
  v16[0] = v2;
  v16[1] = 3221225472;
  v16[2] = __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke_158;
  v16[3] = &unk_1E3BFE738;
  v16[4] = buf;
  objc_msgSend(v8, "immediateDownloadForNamespaceNames:allowExpensiveNetworking:completion:", v9, v10, v16);
  v11 = (void *)v19[5];
  if (v11 || (v11 = *(void **)(*(_QWORD *)&buf[8] + 40)) != 0)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = v11;
    v14 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;

    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v15;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v18, 8);

  if (v3)
    v3[2](v3);

}

void __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)registerNamespaceWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 applicationGroup:(id)a6 cloudKitContainerId:(int)a7 error:(id *)a8
{
  uint64_t v9;
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
  void *v29;
  id *v30;
  id v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  _QWORD v43[5];
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v9 = *(_QWORD *)&a7;
  v12 = *(_QWORD *)&a4;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v31 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    v18 = v9;
    v30 = a8;
    *(_QWORD *)buf = 0;
    v45 = buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy_;
    v48 = __Block_byref_object_dispose_;
    v19 = MEMORY[0x1E0C809B0];
    v49 = 0;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __150__TRIXPCNamespaceManagementClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_error___block_invoke;
    v43[3] = &unk_1E3BFE738;
    v43[4] = buf;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy_;
    v37 = __Block_byref_object_dispose_;
    v38 = 0;
    v20 = MEMORY[0x1A1AC6D30](v43);
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:");
    v21 = v31;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __150__TRIXPCNamespaceManagementClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_error___block_invoke_2;
    v32[3] = &unk_1E3BFE760;
    v32[4] = &v39;
    v32[5] = &v33;
    objc_msgSend(v22, "registerNamespaceWithNamespaceName:compatibilityVersion:defaultsFileURL:applicationGroup:cloudKitContainerId:completion:", v31, v12, v16, v17, v18, v32);
    v23 = (void *)*((_QWORD *)v45 + 5);
    if (v23)
    {
      v24 = v30;
      v25 = (void *)v20;
      if (v30)
      {
LABEL_6:
        v26 = 0;
        *v24 = objc_retainAutorelease(v23);
LABEL_17:

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v39, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_18;
      }
    }
    else
    {
      v23 = (void *)v34[5];
      v24 = v30;
      v25 = (void *)v20;
      if (!v23)
      {
        v26 = *((_BYTE *)v40 + 24) != 0;
        goto LABEL_17;
      }
      if (v30)
        goto LABEL_6;
    }
    v26 = 0;
    goto LABEL_17;
  }
  TRILogCategory_ClientFramework();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B89C000, v27, OS_LOG_TYPE_ERROR, "unable to register namespace while device is class C locked", buf, 2u);
  }

  if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v26 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  v21 = v15;
LABEL_18:

  return v26;
}

void __150__TRIXPCNamespaceManagementClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __150__TRIXPCNamespaceManagementClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)startNamespaceDownloadWithName:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _QWORD v30[5];
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v32 = buf;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy_;
    v35 = __Block_byref_object_dispose_;
    v11 = MEMORY[0x1E0C809B0];
    v36 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __80__TRIXPCNamespaceManagementClient_startNamespaceDownloadWithName_options_error___block_invoke;
    v30[3] = &unk_1E3BFE738;
    v30[4] = buf;
    v12 = (void *)MEMORY[0x1A1AC6D30](v30);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = 0;
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __80__TRIXPCNamespaceManagementClient_startNamespaceDownloadWithName_options_error___block_invoke_2;
    v19[3] = &unk_1E3BFE760;
    v19[4] = &v26;
    v19[5] = &v20;
    objc_msgSend(v13, "startDownloadNamespaceWithName:options:completion:", v9, v10, v19);
    v14 = (void *)*((_QWORD *)v32 + 5);
    if (v14)
    {
      if (a5)
      {
LABEL_6:
        v15 = 0;
        *a5 = objc_retainAutorelease(v14);
LABEL_16:

        _Block_object_dispose(&v20, 8);
        _Block_object_dispose(&v26, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      v14 = (void *)v21[5];
      if (!v14)
      {
        v15 = *((_BYTE *)v27 + 24) != 0;
        goto LABEL_16;
      }
      if (a5)
        goto LABEL_6;
    }
    v15 = 0;
    goto LABEL_16;
  }
  TRILogCategory_ClientFramework();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B89C000, v16, OS_LOG_TYPE_ERROR, "unable to start namespace download while device is class C locked", buf, 2u);
  }

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_17:

  return v15;
}

void __80__TRIXPCNamespaceManagementClient_startNamespaceDownloadWithName_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __80__TRIXPCNamespaceManagementClient_startNamespaceDownloadWithName_options_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)downloadLevelsForFactors:(id)a3 withNamespace:(id)a4 queue:(id)a5 factorsState:(id)a6 options:(id)a7 progress:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  __CFString *v22;
  __CFString *v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  __CFString *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  __CFString *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v46[4];
  __CFString *v47;
  id v48;
  TRIXPCNamespaceManagementClient *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD *v56;
  int v57;
  char v58;
  _QWORD v59[5];
  _QWORD v60[5];
  id v61;
  uint8_t buf[4];
  __CFString *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  int v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v44 = a5;
  v42 = a6;
  v43 = a7;
  v17 = a8;
  v41 = a9;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factors"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_3:
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy_;
  v60[4] = __Block_byref_object_dispose_;
  v18 = MEMORY[0x1E0C809B0];
  v61 = 0;
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke;
  v59[3] = &unk_1E3BFE738;
  v59[4] = v60;
  v19 = (void *)MEMORY[0x1A1AC6D30](v59);
  v20 = +[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState");
  v21 = qos_class_self();
  v22 = &stru_1E3C00710;
  if (v20 == 2)
    v22 = CFSTR("(unknown class C status) ");
  if (!v20)
    v22 = CFSTR("(before class C unlock) ");
  v23 = v22;
  TRILogCategory_ClientFramework();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = 2 * (v20 == 1);
  if (os_log_type_enabled(v24, v25))
  {
    *(_DWORD *)buf = 138413058;
    v63 = v23;
    v64 = 2112;
    v65 = v16;
    v66 = 2112;
    v67 = v15;
    v68 = 1024;
    v69 = v21;
    _os_log_impl(&dword_19B89C000, v24, v25, "%@enqueuing downloadLevelsForFactors message for:%@ factors:%@ at qos:%u", buf, 0x26u);
  }
  v40 = v23;
  v26 = v20 == 2;

  v46[0] = v18;
  v46[1] = 3221225472;
  v46[2] = __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_150;
  v46[3] = &unk_1E3BFE800;
  v58 = 2 * (v20 == 1);
  v27 = (__CFString *)v16;
  v47 = v27;
  v57 = v21;
  v39 = v15;
  v48 = v39;
  v49 = self;
  v28 = v19;
  v53 = v28;
  v29 = v42;
  v50 = v29;
  v30 = v43;
  v51 = v30;
  v56 = v60;
  v31 = v41;
  v54 = v31;
  v32 = v17;
  v55 = v32;
  v33 = v44;
  v52 = v33;
  v34 = MEMORY[0x1A1AC6D30](v46);
  v35 = (void *)v34;
  if (v26)
    (*(void (**)(uint64_t))(v34 + 16))(v34);
  else
    objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlockedWithQoS:block:", v21, v34);
  TRILogCategory_ClientFramework();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v27;
    _os_log_debug_impl(&dword_19B89C000, v36, OS_LOG_TYPE_DEBUG, "finished enqueuing post-unlock downloadLevelsForFactors for: %@", buf, 0xCu);
  }

  _Block_object_dispose(v60, 8);
}

void __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_150(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id *v16;
  void (**v17)(_QWORD, _QWORD);
  NSObject *v18;
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  TRILogCategory_ClientFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(a1 + 116);
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_DWORD *)(a1 + 112);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v32) = v6;
    _os_log_impl(&dword_19B89C000, v2, v3, "(after class C unlock) enqueuing downloadLevelsForFactors message for:%@ factors:%@ at qos:%u", buf, 0x1Cu);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "synchronousRemoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 80));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_151;
  v24[3] = &unk_1E3BFE788;
  v24[4] = buf;
  v24[5] = &v25;
  objc_msgSend(v7, "startDownloadLevelsForFactors:withNamespace:factorsState:options:completion:", v8, v9, v10, v11, v24);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
  {
    v13 = *(_QWORD *)(a1 + 88);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v21[0] = v12;
      v21[1] = 3221225472;
      v21[2] = __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_2;
      v21[3] = &unk_1E3BFE7B0;
      v22 = *(id *)(a1 + 96);
      v23 = *(id *)(a1 + 88);
      v14 = (void *)MEMORY[0x1A1AC6D30](v21);
      v15 = +[TRIDownloadNotification registerDownloadNotificationForKey:queue:usingBlock:](TRIDownloadNotification, "registerDownloadNotificationForKey:queue:usingBlock:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), *(_QWORD *)(a1 + 72), v14);

      v16 = &v22;
    }
    else
    {
      v17 = *(void (***)(_QWORD, _QWORD))(a1 + 88);
      if (!v17)
        goto LABEL_9;
      v18 = *(NSObject **)(a1 + 72);
      if (!v18)
      {
        ((void (**)(_QWORD, BOOL))v17)[2](v17, v26[5] == 0);
        goto LABEL_9;
      }
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_3;
      v19[3] = &unk_1E3BFE7D8;
      v16 = (id *)v20;
      v20[0] = v17;
      v20[1] = &v25;
      dispatch_async(v18, v19);
    }

  }
LABEL_9:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(buf, 8);

}

void __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_151(uint64_t a1, void *a2, void *a3)
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

void __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  switch(objc_msgSend(v5, "type"))
  {
    case 0:
    case 3:
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, objc_msgSend(v5, "progress"));
      break;
    case 1:
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 100);
      v8 = *(_QWORD *)(a1 + 40);
      if (v8)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, 1, 0);
      goto LABEL_11;
    case 2:
      v9 = *(_QWORD *)(a1 + 40);
      if (v9)
      {
        objc_msgSend(v5, "error");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRIDownloadNotification generalErrorFromDownloadNotificationError:](TRIDownloadNotification, "generalErrorFromDownloadNotificationError:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v11);

      }
LABEL_11:
      +[TRIDownloadNotification deregisterNotificationWithToken:](TRIDownloadNotification, "deregisterNotificationWithToken:", v12);
      break;
    default:
      break;
  }

}

uint64_t __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == 0);
}

void __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke_158(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)removeLevelsForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 removeImmediately:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[5];
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  _QWORD v42[3];

  v7 = a6;
  v42[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorNames"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 343, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_3:
  if (!+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    TRILogCategory_ClientFramework();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_19B89C000, v19, OS_LOG_TYPE_ERROR, "unable to remove levels while device is class C locked", (uint8_t *)&buf, 2u);
    }

    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
      v18 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_19:
    v18 = 0;
    goto LABEL_23;
  }
  if (qword_1ECED7D60 != -1)
    dispatch_once(&qword_1ECED7D60, &__block_literal_global_161);
  if (!_MergedGlobals_3)
  {
    TRILogCategory_ClientFramework();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = CFSTR("com.apple.trial.client");
      _os_log_error_impl(&dword_19B89C000, v20, OS_LOG_TYPE_ERROR, "Process is missing entitlement required for on-demand factor removal: <key>%@</key><array>...</array>", (uint8_t *)&buf, 0xCu);
    }

    if (a7)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = *MEMORY[0x1E0CB2D50];
      v42[0] = CFSTR("Process is not entitled for on-demand factor removal.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *a7 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 3, v22);

    }
    goto LABEL_19;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v15 = MEMORY[0x1E0C809B0];
  v40 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __109__TRIXPCNamespaceManagementClient_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_error___block_invoke_166;
  v35[3] = &unk_1E3BFE738;
  v35[4] = &buf;
  v26 = (void *)MEMORY[0x1A1AC6D30](v35);
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __109__TRIXPCNamespaceManagementClient_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_error___block_invoke_2;
  v28[3] = &unk_1E3BFE738;
  v28[4] = &v29;
  objc_msgSend(v16, "removeLevelsForFactors:withNamespace:factorsState:removeImmediately:completion:", v12, v13, v14, v7, v28);
  v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v17 || (v17 = (void *)v30[5]) != 0)
  {
    v18 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v17);
  }
  else
  {
    v18 = 1;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&buf, 8);

LABEL_23:
  return v18;
}

void __109__TRIXPCNamespaceManagementClient_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  v1 = (void *)MEMORY[0x1E0D815A8];
  TRILogCategory_ClientFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.private.security.storage.triald"), v2))
  {
    _MergedGlobals_3 = 1;
  }
  else
  {
    +[TRIEntitlement objectForCurrentProcessEntitlement:](TRIEntitlement, "objectForCurrentProcessEntitlement:", CFSTR("com.apple.trial.client"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_3 = v3 != 0;

  }
  objc_autoreleasePoolPop(v0);
}

void __109__TRIXPCNamespaceManagementClient_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_error___block_invoke_166(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __109__TRIXPCNamespaceManagementClient_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)deregisterNamespaceWithNamespaceName:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[5];
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 405, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v8 = MEMORY[0x1E0C809B0];
    v33 = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __78__TRIXPCNamespaceManagementClient_deregisterNamespaceWithNamespaceName_error___block_invoke;
    v27[3] = &unk_1E3BFE738;
    v27[4] = buf;
    v9 = (void *)MEMORY[0x1A1AC6D30](v27);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __78__TRIXPCNamespaceManagementClient_deregisterNamespaceWithNamespaceName_error___block_invoke_2;
    v16[3] = &unk_1E3BFE760;
    v16[4] = &v23;
    v16[5] = &v17;
    objc_msgSend(v10, "deregisterNamespaceWithNamespaceName:completion:", v7, v16);
    v11 = (void *)*((_QWORD *)v29 + 5);
    if (v11)
    {
      if (a4)
      {
LABEL_6:
        v12 = 0;
        *a4 = objc_retainAutorelease(v11);
LABEL_16:

        _Block_object_dispose(&v17, 8);
        _Block_object_dispose(&v23, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      v11 = (void *)v18[5];
      if (!v11)
      {
        v12 = *((_BYTE *)v24 + 24) != 0;
        goto LABEL_16;
      }
      if (a4)
        goto LABEL_6;
    }
    v12 = 0;
    goto LABEL_16;
  }
  TRILogCategory_ClientFramework();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B89C000, v13, OS_LOG_TYPE_ERROR, "unable to de-register namespace while device is class C locked", buf, 2u);
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_17:

  return v12;
}

void __78__TRIXPCNamespaceManagementClient_deregisterNamespaceWithNamespaceName_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __78__TRIXPCNamespaceManagementClient_deregisterNamespaceWithNamespaceName_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)setPurgeabilityLevelsForFactors:(id)a3 forNamespaceName:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[5];
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 451, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorsWithPurgeabilityLevels"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 452, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_3:
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy_;
    v33 = __Block_byref_object_dispose_;
    v12 = MEMORY[0x1E0C809B0];
    v34 = 0;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __90__TRIXPCNamespaceManagementClient_setPurgeabilityLevelsForFactors_forNamespaceName_error___block_invoke;
    v28[3] = &unk_1E3BFE738;
    v28[4] = buf;
    v13 = (void *)MEMORY[0x1A1AC6D30](v28);
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    v27 = 0;
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __90__TRIXPCNamespaceManagementClient_setPurgeabilityLevelsForFactors_forNamespaceName_error___block_invoke_2;
    v21[3] = &unk_1E3BFE738;
    v21[4] = &v22;
    objc_msgSend(v14, "setPurgeabilityLevelsForFactors:forNamespaceName:completion:", v9, v11, v21);
    v15 = (void *)*((_QWORD *)v30 + 5);
    if (v15)
    {
      if (a5)
      {
LABEL_6:
        v16 = 0;
        *a5 = objc_retainAutorelease(v15);
LABEL_16:

        _Block_object_dispose(&v22, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_17;
      }
    }
    else
    {
      v15 = (void *)v23[5];
      if (!v15)
      {
        v16 = 1;
        goto LABEL_16;
      }
      if (a5)
        goto LABEL_6;
    }
    v16 = 0;
    goto LABEL_16;
  }
  TRILogCategory_ClientFramework();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B89C000, v17, OS_LOG_TYPE_ERROR, "unable to set purgeability levels while device is class C locked", buf, 2u);
  }

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_17:

  return v16;
}

void __90__TRIXPCNamespaceManagementClient_setPurgeabilityLevelsForFactors_forNamespaceName_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __90__TRIXPCNamespaceManagementClient_setPurgeabilityLevelsForFactors_forNamespaceName_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)loadNamespaceMetadataForNamespaceName:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[5];
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 495, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v31 = buf;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy_;
    v34 = __Block_byref_object_dispose_;
    v8 = MEMORY[0x1E0C809B0];
    v35 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __79__TRIXPCNamespaceManagementClient_loadNamespaceMetadataForNamespaceName_error___block_invoke;
    v29[3] = &unk_1E3BFE738;
    v29[4] = buf;
    v9 = (void *)MEMORY[0x1A1AC6D30](v29);
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __79__TRIXPCNamespaceManagementClient_loadNamespaceMetadataForNamespaceName_error___block_invoke_2;
    v16[3] = &unk_1E3BFE898;
    v16[4] = &v17;
    v16[5] = &v23;
    objc_msgSend(v10, "loadNamespaceMetadataForNamespaceName:completion:", v7, v16);
    v11 = (void *)*((_QWORD *)v31 + 5);
    if (v11)
    {
      if (a4)
      {
LABEL_6:
        v12 = 0;
        *a4 = objc_retainAutorelease(v11);
LABEL_16:

        _Block_object_dispose(&v17, 8);
        _Block_object_dispose(&v23, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      v11 = (void *)v24[5];
      if (!v11)
      {
        v12 = (id)v18[5];
        goto LABEL_16;
      }
      if (a4)
        goto LABEL_6;
    }
    v12 = 0;
    goto LABEL_16;
  }
  TRILogCategory_ClientFramework();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B89C000, v13, OS_LOG_TYPE_ERROR, "unable to load namespace metadata while device is class C locked", buf, 2u);
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_17:

  return v12;
}

void __79__TRIXPCNamespaceManagementClient_loadNamespaceMetadataForNamespaceName_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __79__TRIXPCNamespaceManagementClient_loadNamespaceMetadataForNamespaceName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (BOOL)setProvisionalFactorPackId:(id)a3 forNamespaceName:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v19;
  void *v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[5];
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 540, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackId"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 541, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_3:
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v34 = buf;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy_;
    v37 = __Block_byref_object_dispose_;
    v12 = MEMORY[0x1E0C809B0];
    v38 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __85__TRIXPCNamespaceManagementClient_setProvisionalFactorPackId_forNamespaceName_error___block_invoke;
    v32[3] = &unk_1E3BFE738;
    v32[4] = buf;
    v13 = (void *)MEMORY[0x1A1AC6D30](v32);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    v27 = 0;
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __85__TRIXPCNamespaceManagementClient_setProvisionalFactorPackId_forNamespaceName_error___block_invoke_2;
    v21[3] = &unk_1E3BFE760;
    v21[4] = &v28;
    v21[5] = &v22;
    objc_msgSend(v14, "setProvisionalFactorPackId:forNamespaceName:completion:", v9, v11, v21);
    v15 = (void *)*((_QWORD *)v34 + 5);
    if (v15)
    {
      if (a5)
      {
LABEL_6:
        v16 = 0;
        *a5 = objc_retainAutorelease(v15);
LABEL_16:

        _Block_object_dispose(&v22, 8);
        _Block_object_dispose(&v28, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      v15 = (void *)v23[5];
      if (!v15)
      {
        v16 = *((_BYTE *)v29 + 24) != 0;
        goto LABEL_16;
      }
      if (a5)
        goto LABEL_6;
    }
    v16 = 0;
    goto LABEL_16;
  }
  TRILogCategory_ClientFramework();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B89C000, v17, OS_LOG_TYPE_ERROR, "unable to set factor pack provisional while device is class C locked", buf, 2u);
  }

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_17:

  return v16;
}

void __85__TRIXPCNamespaceManagementClient_setProvisionalFactorPackId_forNamespaceName_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __85__TRIXPCNamespaceManagementClient_setProvisionalFactorPackId_forNamespaceName_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)rejectFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  BOOL v19;
  NSObject *v20;
  void *v22;
  void *v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[5];
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 588, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackId"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 589, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_3:
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v37 = buf;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy_;
    v40 = __Block_byref_object_dispose_;
    v14 = MEMORY[0x1E0C809B0];
    v41 = 0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __95__TRIXPCNamespaceManagementClient_rejectFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke;
    v35[3] = &unk_1E3BFE738;
    v35[4] = buf;
    v15 = (void *)MEMORY[0x1A1AC6D30](v35);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    v30 = 0;
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v14;
    v24[1] = 3221225472;
    v24[2] = __95__TRIXPCNamespaceManagementClient_rejectFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke_2;
    v24[3] = &unk_1E3BFE760;
    v24[4] = &v31;
    v24[5] = &v25;
    objc_msgSend(v16, "rejectFactorPackId:forNamespaceName:rolloutDeployment:completion:", v11, v12, v13, v24);
    v17 = (void *)*((_QWORD *)v37 + 5);
    if (v17)
    {
      v18 = a6;
      if (a6)
      {
LABEL_6:
        v19 = 0;
        *v18 = objc_retainAutorelease(v17);
LABEL_16:

        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(&v31, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      v17 = (void *)v26[5];
      v18 = a6;
      if (!v17)
      {
        v19 = *((_BYTE *)v32 + 24) != 0;
        goto LABEL_16;
      }
      if (a6)
        goto LABEL_6;
    }
    v19 = 0;
    goto LABEL_16;
  }
  TRILogCategory_ClientFramework();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B89C000, v20, OS_LOG_TYPE_ERROR, "unable to reject factor pack provisional while device is class C locked", buf, 2u);
  }

  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
LABEL_17:

  return v19;
}

void __95__TRIXPCNamespaceManagementClient_rejectFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __95__TRIXPCNamespaceManagementClient_rejectFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)promoteFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  BOOL v19;
  NSObject *v20;
  void *v22;
  void *v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[5];
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 637, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackId"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 638, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_3:
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v37 = buf;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy_;
    v40 = __Block_byref_object_dispose_;
    v14 = MEMORY[0x1E0C809B0];
    v41 = 0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __96__TRIXPCNamespaceManagementClient_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke;
    v35[3] = &unk_1E3BFE738;
    v35[4] = buf;
    v15 = (void *)MEMORY[0x1A1AC6D30](v35);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    v30 = 0;
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v14;
    v24[1] = 3221225472;
    v24[2] = __96__TRIXPCNamespaceManagementClient_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke_2;
    v24[3] = &unk_1E3BFE760;
    v24[4] = &v31;
    v24[5] = &v25;
    objc_msgSend(v16, "promoteFactorPackId:forNamespaceName:rolloutDeployment:completion:", v11, v12, v13, v24);
    v17 = (void *)*((_QWORD *)v37 + 5);
    if (v17)
    {
      v18 = a6;
      if (a6)
      {
LABEL_6:
        v19 = 0;
        *v18 = objc_retainAutorelease(v17);
LABEL_16:

        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(&v31, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      v17 = (void *)v26[5];
      v18 = a6;
      if (!v17)
      {
        v19 = *((_BYTE *)v32 + 24) != 0;
        goto LABEL_16;
      }
      if (a6)
        goto LABEL_6;
    }
    v19 = 0;
    goto LABEL_16;
  }
  TRILogCategory_ClientFramework();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B89C000, v20, OS_LOG_TYPE_ERROR, "unable to promote factor pack while device is class C locked", buf, 2u);
  }

  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
LABEL_17:

  return v19;
}

void __96__TRIXPCNamespaceManagementClient_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __96__TRIXPCNamespaceManagementClient_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (unint64_t)statusOfDownloadForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 notificationKey:(id *)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  _QWORD v27[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[5];
  uint8_t buf[8];
  uint8_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 687, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorNames"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCClient.m"), 688, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_3:
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v46 = buf;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy_;
    v49 = __Block_byref_object_dispose_;
    v16 = MEMORY[0x1E0C809B0];
    v50 = 0;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __111__TRIXPCNamespaceManagementClient_statusOfDownloadForFactors_withNamespace_factorsState_notificationKey_error___block_invoke;
    v44[3] = &unk_1E3BFE738;
    v44[4] = buf;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy_;
    v38 = __Block_byref_object_dispose_;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    v17 = (void *)MEMORY[0x1A1AC6D30](v44);
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __111__TRIXPCNamespaceManagementClient_statusOfDownloadForFactors_withNamespace_factorsState_notificationKey_error___block_invoke_2;
    v27[3] = &unk_1E3BFE8C0;
    v27[4] = &v40;
    v27[5] = &v34;
    v27[6] = &v28;
    objc_msgSend(v18, "statusOfDownloadForFactors:withNamespace:factorsState:completion:", v13, v14, v15, v27);
    v19 = (void *)*((_QWORD *)v46 + 5);
    if (v19)
    {
      v20 = a7;
      if (a7)
LABEL_6:
        objc_storeStrong(v20, v19);
    }
    else
    {
      v19 = (void *)v29[5];
      v20 = a7;
      if (!v19)
      {
        if (a6)
          objc_storeStrong(a6, (id)v35[5]);
        a7 = (id *)v41[3];
        goto LABEL_8;
      }
      if (a7)
        goto LABEL_6;
    }
    a7 = 0;
LABEL_8:

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_13;
  }
  TRILogCategory_ClientFramework();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B89C000, v21, OS_LOG_TYPE_DEFAULT, "device is class C locked - download status cannot be determined", buf, 2u);
  }

  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *a7;
    *a7 = v22;

    a7 = 0;
  }
LABEL_13:

  return (unint64_t)a7;
}

void __111__TRIXPCNamespaceManagementClient_statusOfDownloadForFactors_withNamespace_factorsState_notificationKey_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __111__TRIXPCNamespaceManagementClient_statusOfDownloadForFactors_withNamespace_factorsState_notificationKey_error___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v13 = v7;

  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;

}

- (id)activeRolloutInformation:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[5];
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v27 = buf;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v5 = MEMORY[0x1E0C809B0];
    v31 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __60__TRIXPCNamespaceManagementClient_activeRolloutInformation___block_invoke;
    v25[3] = &unk_1E3BFE738;
    v25[4] = buf;
    v6 = (void *)MEMORY[0x1A1AC6D30](v25);
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = 0;
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __60__TRIXPCNamespaceManagementClient_activeRolloutInformation___block_invoke_2;
    v12[3] = &unk_1E3BFE8E8;
    v12[4] = &v19;
    v12[5] = &v13;
    objc_msgSend(v7, "activeRolloutInformationWithPrivacyFilterPolicy:completion:", 1, v12);
    v8 = (void *)*((_QWORD *)v27 + 5);
    if (v8)
    {
      if (a3)
      {
LABEL_4:
        v9 = 0;
        *a3 = objc_retainAutorelease(v8);
LABEL_14:

        _Block_object_dispose(&v13, 8);
        _Block_object_dispose(&v19, 8);

        _Block_object_dispose(buf, 8);
        return v9;
      }
    }
    else
    {
      v8 = (void *)v14[5];
      if (!v8)
      {
        v9 = (id)v20[5];
        goto LABEL_14;
      }
      if (a3)
        goto LABEL_4;
    }
    v9 = 0;
    goto LABEL_14;
  }
  TRILogCategory_ClientFramework();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "device is class C locked - cannot fetch rollout information", buf, 2u);
  }

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

void __60__TRIXPCNamespaceManagementClient_activeRolloutInformation___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__TRIXPCNamespaceManagementClient_activeRolloutInformation___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (BOOL)logSystemCovariatesWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__TRIXPCNamespaceManagementClient_logSystemCovariatesWithError___block_invoke;
  v9[3] = &unk_1E3BFE738;
  v9[4] = &v10;
  v5 = (void *)MEMORY[0x1A1AC6D30](v9, a2);
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logSystemCovariates");
  if (a3)
  {
    v7 = (void *)v11[5];
    if (v7)
      objc_storeStrong(a3, v7);
  }

  _Block_object_dispose(&v10, 8);
  return a3 == 0;
}

void __64__TRIXPCNamespaceManagementClient_logSystemCovariatesWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getSandboxExtensionTokensForIdentifierQueryWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v5 = MEMORY[0x1E0C809B0];
  v31 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __88__TRIXPCNamespaceManagementClient_getSandboxExtensionTokensForIdentifierQueryWithError___block_invoke;
  v25[3] = &unk_1E3BFE738;
  v25[4] = &v26;
  v6 = (void *)MEMORY[0x1A1AC6D30](v25, a2);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __88__TRIXPCNamespaceManagementClient_getSandboxExtensionTokensForIdentifierQueryWithError___block_invoke_2;
  v12[3] = &unk_1E3BFE8E8;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v7, "getSandboxExtensionTokensForIdentifierQueryWithCompletion:", v12);
  v8 = (void *)v27[5];
  if (v8 || (v8 = (void *)v14[5]) != 0)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v8);
    v9 = (id)objc_opt_new();
  }
  else
  {
    v9 = (id)v20[5];
  }
  v10 = v9;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v26, 8);
  return v10;
}

void __88__TRIXPCNamespaceManagementClient_getSandboxExtensionTokensForIdentifierQueryWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __88__TRIXPCNamespaceManagementClient_getSandboxExtensionTokensForIdentifierQueryWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)getOnDemandReferenceCountsPerUserAtGlobalPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("On-demand reference counts are not available on non-macOS platforms.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 17, v6);

  }
  return 0;
}

@end

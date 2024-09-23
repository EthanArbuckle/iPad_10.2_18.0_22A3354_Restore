@implementation PPInternalClient

- (PPInternalClient)init
{
  PPInternalClient *v2;
  void *v3;
  PPXPCClientHelper *v4;
  PPXPCClientHelper *clientHelper;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PPInternalClient;
  v2 = -[PPInternalClient init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01B888);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PPXPCClientHelper initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([PPXPCClientHelper alloc], "initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.PersonalizationPortrait.Internal"), v3, 0, 0, &__block_literal_global_338, &__block_literal_global_69);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v4;

  }
  return v2;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PPXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (BOOL)trialOverridePath:(id)a3 namespaceName:(id)a4 factorName:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPInternalClient.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPInternalClient.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorName"));

LABEL_3:
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v15 = MEMORY[0x1E0C809B0];
  v28 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __69__PPInternalClient_trialOverridePath_namespaceName_factorName_error___block_invoke;
  v24[3] = &unk_1E226BEA8;
  v24[4] = &v29;
  v16 = (void *)MEMORY[0x18D780768](v24);
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __69__PPInternalClient_trialOverridePath_namespaceName_factorName_error___block_invoke_2;
  v23[3] = &unk_1E226BED0;
  v23[4] = &v25;
  v23[5] = &v29;
  v17 = (void *)MEMORY[0x18D780768](v23);
  -[PPInternalClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trialOverridePath:namespaceName:factorName:completion:", v11, v12, v14, v17);

  if (a6)
    *a6 = objc_retainAutorelease((id)v30[5]);
  v19 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v19;
}

- (BOOL)setTrialUseDefaultFiles:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__PPInternalClient_setTrialUseDefaultFiles_error___block_invoke;
  v14[3] = &unk_1E226BEA8;
  v14[4] = &v19;
  v8 = (void *)MEMORY[0x18D780768](v14, a2);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __50__PPInternalClient_setTrialUseDefaultFiles_error___block_invoke_2;
  v13[3] = &unk_1E226BED0;
  v13[4] = &v15;
  v13[5] = &v19;
  v9 = (void *)MEMORY[0x18D780768](v13);
  -[PPInternalClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTrialUseDefaultFiles:completion:", v5, v9);

  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v11 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (id)sysdiagnoseInformationWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
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
  v5 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__PPInternalClient_sysdiagnoseInformationWithError___block_invoke;
  v12[3] = &unk_1E226BEA8;
  v12[4] = &v19;
  v6 = (void *)MEMORY[0x18D780768](v12, a2);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __52__PPInternalClient_sysdiagnoseInformationWithError___block_invoke_2;
  v11[3] = &unk_1E226AB40;
  v11[4] = &v13;
  v11[5] = &v19;
  v7 = (void *)MEMORY[0x18D780768](v11);
  -[PPInternalClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sysdiagnoseInformationWithCompletion:", v7);

  if (a3)
    *a3 = objc_retainAutorelease((id)v20[5]);
  v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __52__PPInternalClient_sysdiagnoseInformationWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__PPInternalClient_sysdiagnoseInformationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __50__PPInternalClient_setTrialUseDefaultFiles_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__PPInternalClient_setTrialUseDefaultFiles_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __69__PPInternalClient_trialOverridePath_namespaceName_factorName_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __69__PPInternalClient_trialOverridePath_namespaceName_factorName_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PPInternalClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, block);
  return (id)sharedInstance__pasExprOnceResult_360;
}

void __34__PPInternalClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_360;
  sharedInstance__pasExprOnceResult_360 = v1;

  objc_autoreleasePoolPop(v0);
}

@end

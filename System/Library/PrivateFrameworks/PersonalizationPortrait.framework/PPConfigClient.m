@implementation PPConfigClient

- (PPConfigClient)init
{
  PPConfigClient *v2;
  PPXPCClientHelper *v3;
  void *v4;
  uint64_t v5;
  PPXPCClientHelper *clientHelper;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPConfigClient;
  v2 = -[PPConfigClient init](&v8, sel_init);
  if (v2)
  {
    v3 = [PPXPCClientHelper alloc];
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01BA08);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPXPCClientHelper initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:](v3, "initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.PersonalizationPortrait.Config"), v4, 0, 0, &__block_literal_global_3257, &__block_literal_global_45);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = (PPXPCClientHelper *)v5;

  }
  return v2;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PPXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (unint64_t)assetVersionWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[6];
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
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3248;
  v17 = __Block_byref_object_dispose__3249;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__PPConfigClient_assetVersionWithError___block_invoke;
  v12[3] = &unk_1E226A848;
  v12[4] = &v19;
  v12[5] = &v13;
  v6 = (void *)MEMORY[0x18D780768](v12, a2);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __40__PPConfigClient_assetVersionWithError___block_invoke_2;
  v11[3] = &unk_1E226A870;
  v11[4] = &v19;
  v11[5] = &v13;
  v7 = (void *)MEMORY[0x18D780768](v11);
  -[PPConfigClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetVersionWithCompletion:", v7);

  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v9 = v20[3];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

- (id)variantNameWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
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

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3248;
  v23 = __Block_byref_object_dispose__3249;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3248;
  v17 = __Block_byref_object_dispose__3249;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__PPConfigClient_variantNameWithError___block_invoke;
  v12[3] = &unk_1E226A848;
  v12[4] = &v19;
  v12[5] = &v13;
  v6 = (void *)MEMORY[0x18D780768](v12, a2);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __39__PPConfigClient_variantNameWithError___block_invoke_2;
  v11[3] = &unk_1E226AB40;
  v11[4] = &v19;
  v11[5] = &v13;
  v7 = (void *)MEMORY[0x18D780768](v11);
  -[PPConfigClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "variantNameWithCompletion:", v7);

  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (id)readableTrialTreatmentsMappingWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
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

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3248;
  v23 = __Block_byref_object_dispose__3249;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3248;
  v17 = __Block_byref_object_dispose__3249;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__PPConfigClient_readableTrialTreatmentsMappingWithError___block_invoke;
  v12[3] = &unk_1E226A848;
  v12[4] = &v19;
  v12[5] = &v13;
  v6 = (void *)MEMORY[0x18D780768](v12, a2);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __58__PPConfigClient_readableTrialTreatmentsMappingWithError___block_invoke_2;
  v11[3] = &unk_1E226A898;
  v11[4] = &v19;
  v11[5] = &v13;
  v7 = (void *)MEMORY[0x18D780768](v11);
  -[PPConfigClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "readableTrialTreatmentsMappingWithCompletion:", v7);

  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __58__PPConfigClient_readableTrialTreatmentsMappingWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __58__PPConfigClient_readableTrialTreatmentsMappingWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __39__PPConfigClient_variantNameWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __39__PPConfigClient_variantNameWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __40__PPConfigClient_assetVersionWithError___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void __40__PPConfigClient_assetVersionWithError___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PPConfigClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_3268 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_3268, block);
  return (id)sharedInstance__pasExprOnceResult_3269;
}

void __32__PPConfigClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_3269;
  sharedInstance__pasExprOnceResult_3269 = v1;

  objc_autoreleasePoolPop(v0);
}

@end

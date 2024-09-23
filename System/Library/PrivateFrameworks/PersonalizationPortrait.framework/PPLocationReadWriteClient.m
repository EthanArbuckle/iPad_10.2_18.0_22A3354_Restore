@implementation PPLocationReadWriteClient

- (PPLocationReadWriteClient)init
{
  PPLocationReadWriteClient *v2;
  PPXPCClientHelper *v3;
  void *v4;
  uint64_t v5;
  PPXPCClientHelper *clientHelper;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPLocationReadWriteClient;
  v2 = -[PPLocationReadWriteClient init](&v8, sel_init);
  if (v2)
  {
    v3 = [PPXPCClientHelper alloc];
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01BD68);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPXPCClientHelper initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:](v3, "initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.PersonalizationPortrait.Location.readWrite"), v4, 0, 0, &__block_literal_global_6851, &__block_literal_global_46_6852);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = (PPXPCClientHelper *)v5;

  }
  return v2;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PPXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (BOOL)_doSyncCallWithError:(id *)a3 syncCall:(id)a4
{
  void (**v6)(id, void *, void *);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = (void (**)(id, void *, void *))a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6844;
  v30 = __Block_byref_object_dispose__6845;
  v7 = MEMORY[0x1E0C809B0];
  v31 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __59__PPLocationReadWriteClient__doSyncCallWithError_syncCall___block_invoke;
  v25[3] = &unk_1E226BEA8;
  v25[4] = &v26;
  v8 = (void *)MEMORY[0x18D780768](v25);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6844;
  v19 = __Block_byref_object_dispose__6845;
  v20 = 0;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __59__PPLocationReadWriteClient__doSyncCallWithError_syncCall___block_invoke_2;
  v14[3] = &unk_1E226BED0;
  v14[4] = &v21;
  v14[5] = &v15;
  v9 = (void *)MEMORY[0x18D780768](v14);
  -[PPLocationReadWriteClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v10, v9);

  v11 = (void *)v27[5];
  if (v11)
  {
    v12 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v11);
  }
  else
  {
    if (a3)
      *a3 = objc_retainAutorelease((id)v16[5]);
    v12 = *((_BYTE *)v22 + 24) != 0;
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

- (BOOL)_doDeletionSyncCallWithError:(id *)a3 deletedCount:(unint64_t *)a4 syncCall:(id)a5
{
  void (**v8)(id, void *, void *);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v8 = (void (**)(id, void *, void *))a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__6844;
  v36 = __Block_byref_object_dispose__6845;
  v9 = MEMORY[0x1E0C809B0];
  v37 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __80__PPLocationReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke;
  v31[3] = &unk_1E226BEA8;
  v31[4] = &v32;
  v10 = (void *)MEMORY[0x18D780768](v31);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6844;
  v25 = __Block_byref_object_dispose__6845;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __80__PPLocationReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke_2;
  v16[3] = &unk_1E226BEF8;
  v16[4] = &v27;
  v16[5] = &v21;
  v16[6] = &v17;
  v11 = (void *)MEMORY[0x18D780768](v16);
  -[PPLocationReadWriteClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v12, v11);

  if (a4)
    *a4 = v18[3];
  v13 = (void *)v33[5];
  if (v13)
  {
    v14 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v13);
  }
  else
  {
    if (a3)
      *a3 = objc_retainAutorelease((id)v22[5]);
    v14 = *((_BYTE *)v28 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v32, 8);

  return v14;
}

- (BOOL)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 decayRate:(double)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  double v27;
  unsigned __int16 v28;
  BOOL v29;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __112__PPLocationReadWriteClient_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_decayRate_error___block_invoke;
  v23[3] = &unk_1E226BF20;
  v24 = v16;
  v25 = v17;
  v26 = v18;
  v28 = a6;
  v29 = a7;
  v27 = a8;
  v19 = v18;
  v20 = v17;
  v21 = v16;
  LOBYTE(a9) = -[PPLocationReadWriteClient _doSyncCallWithError:syncCall:](self, "_doSyncCallWithError:syncCall:", a9, v23);

  return (char)a9;
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  return -[PPLocationReadWriteClient _doSyncCallWithError:syncCall:](self, "_doSyncCallWithError:syncCall:", a3, &__block_literal_global_52);
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  return -[PPLocationReadWriteClient _doDeletionSyncCallWithError:deletedCount:syncCall:](self, "_doDeletionSyncCallWithError:deletedCount:syncCall:", a3, a4, &__block_literal_global_54);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

uint64_t __57__PPLocationReadWriteClient_clearWithError_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearWithCompletion:");
}

uint64_t __48__PPLocationReadWriteClient_cloudSyncWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cloudSyncWithCompletion:");
}

uint64_t __112__PPLocationReadWriteClient_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_decayRate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "donateLocations:source:contextualNamedEntities:algorithm:cloudSync:decayRate:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int16 *)(a1 + 64), *(unsigned __int8 *)(a1 + 66), a3, *(double *)(a1 + 56));
}

void __80__PPLocationReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __80__PPLocationReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke_2(_QWORD *a1, char a2, uint64_t a3, id obj)
{
  id v7;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
  v7 = obj;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;

}

void __59__PPLocationReadWriteClient__doSyncCallWithError_syncCall___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __59__PPLocationReadWriteClient__doSyncCallWithError_syncCall___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PPLocationReadWriteClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_6864 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_6864, block);
  return (id)sharedInstance__pasExprOnceResult_6865;
}

void __43__PPLocationReadWriteClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_6865;
  sharedInstance__pasExprOnceResult_6865 = v1;

  objc_autoreleasePoolPop(v0);
}

@end

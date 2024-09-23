@implementation LZHbEqKhcixce9PA

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_reference;
}

void __34__LZHbEqKhcixce9PA_sharedInstance__block_invoke()
{
  LZHbEqKhcixce9PA *v0;
  void *v1;

  v0 = -[LZHbEqKhcixce9PA initWithServiceName:]([LZHbEqKhcixce9PA alloc], "initWithServiceName:", CFSTR("com.apple.asd.scoring"));
  v1 = (void *)sharedInstance_reference;
  sharedInstance_reference = (uint64_t)v0;

}

- (LZHbEqKhcixce9PA)initWithServiceName:(id)a3
{
  id v4;
  LZHbEqKhcixce9PA *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *disconnectionCallbacks;
  dispatch_queue_t v8;
  OS_dispatch_queue *syncQueue;
  uint64_t v10;
  NSXPCConnection *connection;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LZHbEqKhcixce9PA;
  v5 = -[LZHbEqKhcixce9PA init](&v20, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    disconnectionCallbacks = v5->_disconnectionCallbacks;
    v5->_disconnectionCallbacks = v6;

    v8 = dispatch_queue_create("com.apple.asd.interrupt", 0);
    syncQueue = v5->_syncQueue;
    v5->_syncQueue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v4, 4096);
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v10;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE296568);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v12);

    objc_initWeak(&location, v5);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __40__LZHbEqKhcixce9PA_initWithServiceName___block_invoke;
    v17 = &unk_1E2AB87C8;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInterruptionHandler:](v5->_connection, "setInterruptionHandler:", &v14);
    -[NSXPCConnection resume](v5->_connection, "resume", v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __40__LZHbEqKhcixce9PA_initWithServiceName___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "uTtwJoGUgL3N0GVz");

}

- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;
  _QWORD aBlock[4];
  id v23;

  v6 = a3;
  v7 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_41);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__LZHbEqKhcixce9PA_JI0A3nkqsab9cUj8_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AB8810;
  v10 = v7;
  v23 = v10;
  v11 = _Block_copy(aBlock);
  -[LZHbEqKhcixce9PA BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __48__LZHbEqKhcixce9PA_JI0A3nkqsab9cUj8_completion___block_invoke_3;
  v17[3] = &unk_1E2AB8838;
  objc_copyWeak(&v20, &location);
  v13 = v12;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  v15 = _Block_copy(v17);
  objc_msgSend(v6, "toDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "k0p7Rchr49btq6wB:HY6FXG20397zwmVg:", v16, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

uint64_t __48__LZHbEqKhcixce9PA_JI0A3nkqsab9cUj8_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__LZHbEqKhcixce9PA_JI0A3nkqsab9cUj8_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id location;
  _QWORD aBlock[4];
  id v34;

  v14 = a3;
  v27 = a4;
  v15 = a5;
  v26 = a6;
  v16 = a7;
  v17 = a8;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_43);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__LZHbEqKhcixce9PA_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AB8810;
  v20 = v17;
  v34 = v20;
  v21 = _Block_copy(aBlock);
  -[LZHbEqKhcixce9PA BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __91__LZHbEqKhcixce9PA_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_3;
  v28[3] = &unk_1E2AB8860;
  objc_copyWeak(&v31, &location);
  v23 = v22;
  v29 = v23;
  v24 = v20;
  v30 = v24;
  v25 = _Block_copy(v28);
  objc_msgSend(v18, "VE7BAlWGDSKrO5xc:hostChallenge:challengeResponse:seid:nonce:HY6FXG20397zwmVg:", v14, v27, v15, v26, v16, v25);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

uint64_t __91__LZHbEqKhcixce9PA_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__LZHbEqKhcixce9PA_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;
  _QWORD aBlock[4];
  id v22;

  v6 = a3;
  v7 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_45);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__LZHbEqKhcixce9PA_ZfE6lVphNUVrZcKx_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AB8810;
  v10 = v7;
  v22 = v10;
  v11 = _Block_copy(aBlock);
  -[LZHbEqKhcixce9PA BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __48__LZHbEqKhcixce9PA_ZfE6lVphNUVrZcKx_completion___block_invoke_3;
  v16[3] = &unk_1E2AB8888;
  objc_copyWeak(&v19, &location);
  v13 = v12;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  v15 = _Block_copy(v16);
  objc_msgSend(v8, "f9MGfLOgnHPuKTrU:HY6FXG20397zwmVg:", v6, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

uint64_t __48__LZHbEqKhcixce9PA_ZfE6lVphNUVrZcKx_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__LZHbEqKhcixce9PA_ZfE6lVphNUVrZcKx_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)vffg4lwI2HftPvpO:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  _QWORD aBlock[4];
  id v19;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__LZHbEqKhcixce9PA_vffg4lwI2HftPvpO___block_invoke_2;
  aBlock[3] = &unk_1E2AB8810;
  v7 = v4;
  v19 = v7;
  v8 = _Block_copy(aBlock);
  -[LZHbEqKhcixce9PA BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __37__LZHbEqKhcixce9PA_vffg4lwI2HftPvpO___block_invoke_3;
  v13[3] = &unk_1E2AB8860;
  objc_copyWeak(&v16, &location);
  v10 = v9;
  v14 = v10;
  v11 = v7;
  v15 = v11;
  v12 = _Block_copy(v13);
  objc_msgSend(v5, "xs00laTiKIpDUzDP:", v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

uint64_t __37__LZHbEqKhcixce9PA_vffg4lwI2HftPvpO___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37__LZHbEqKhcixce9PA_vffg4lwI2HftPvpO___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id location;
  _QWORD aBlock[4];
  id v44;

  v37 = a3;
  v20 = a4;
  v36 = a5;
  v35 = a6;
  v34 = a7;
  v33 = a8;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_48);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __218__LZHbEqKhcixce9PA_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AB8810;
  v27 = v24;
  v44 = v27;
  v28 = _Block_copy(aBlock);
  -[LZHbEqKhcixce9PA BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v38[0] = v26;
  v38[1] = 3221225472;
  v38[2] = __218__LZHbEqKhcixce9PA_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_3;
  v38[3] = &unk_1E2AB88B0;
  objc_copyWeak(&v41, &location);
  v30 = v29;
  v39 = v30;
  v31 = v27;
  v40 = v31;
  v32 = _Block_copy(v38);
  objc_msgSend(v25, "SOUWv5VjPwXYslMm:noUfOiGjp1iQmKZX:pPGyXmlDbN3mzzHm:iSOZt67ioKsVcqQZ:hjCrdFOLMJN0Cc5Q:lE40aye8U2u533Ka:JRuZv6Feh9qwrGmN:Wn0aIR2B54NCtGQc:B3l3lS18BITy5E4L:UywAszL6AB8Y6LTJ:uNao9X8A82jVmQkK:completion:", v37, v20, v36, a9, a10, v21, v22, v23, v32);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

}

uint64_t __218__LZHbEqKhcixce9PA_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __218__LZHbEqKhcixce9PA_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  id v14;

  v14 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)updateRavioliWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD aBlock[4];
  id v17;
  id location;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__LZHbEqKhcixce9PA_updateRavioliWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E2AB8810;
  v7 = v4;
  v17 = v7;
  v8 = _Block_copy(aBlock);
  -[LZHbEqKhcixce9PA BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __48__LZHbEqKhcixce9PA_updateRavioliWithCompletion___block_invoke_3;
  v12[3] = &unk_1E2AB88D8;
  objc_copyWeak(&v15, &location);
  v10 = v9;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v5, "k4eQYhyzyebbQqys:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

uint64_t __48__LZHbEqKhcixce9PA_updateRavioliWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__LZHbEqKhcixce9PA_updateRavioliWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 workflowID:(id)a5 completion:(id)a6
{
  void *v7;
  void *v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = kCoreASErrorDomainCA;
  v10 = a6;
  objc_msgSend(v8, "stringWithUTF8String:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0CB2D50];
  v15[0] = CFSTR("Not implemented");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v11, -27006, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a6 + 2))(v10, v13);

}

- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = kCoreASErrorDomainCA;
  v8 = a4;
  objc_msgSend(v6, "stringWithUTF8String:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CB2D50];
  v13[0] = CFSTR("Not implemented");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v9, -27006, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a4 + 2))(v8, 0, v11);

}

- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  char *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = kCoreASErrorDomainCA;
  v9 = a5;
  objc_msgSend(v7, "stringWithUTF8String:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CB2D50];
  v14[0] = CFSTR("Not implemented");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v10, -27006, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a5 + 2))(v9, 0, v12);

}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7
{
  void *v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = kCoreASErrorDomainCA;
  v11 = a7;
  objc_msgSend(v9, "stringWithUTF8String:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0CB2D50];
  v16[0] = CFSTR("Not implemented");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v12, -27006, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a7 + 2))(v11, v14);

}

- (id)BFzukpKGO3cStNGp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *syncQueue;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__LZHbEqKhcixce9PA_BFzukpKGO3cStNGp___block_invoke;
  block[3] = &unk_1E2AB8900;
  block[4] = self;
  v15 = v4;
  v8 = v6;
  v14 = v8;
  v9 = v4;
  dispatch_sync(syncQueue, block);
  v10 = v14;
  v11 = v8;

  return v11;
}

void __37__LZHbEqKhcixce9PA_BFzukpKGO3cStNGp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

}

- (BOOL)l7UrdRfCzeduYqtA:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__LZHbEqKhcixce9PA_l7UrdRfCzeduYqtA___block_invoke;
  block[3] = &unk_1E2AB8928;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

uint64_t __37__LZHbEqKhcixce9PA_l7UrdRfCzeduYqtA___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 != 0;

  return objc_msgSend(*(id *)(a1[4] + 16), "removeObjectForKey:", a1[5]);
}

- (void)uTtwJoGUgL3N0GVz
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__LZHbEqKhcixce9PA_uTtwJoGUgL3N0GVz__block_invoke;
  block[3] = &unk_1E2AB8950;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

void __36__LZHbEqKhcixce9PA_uTtwJoGUgL3N0GVz__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kCoreASErrorDomainCA);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -31, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_disconnectionCallbacks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end

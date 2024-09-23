@implementation SPPairingManager

- (SPPairingManager)init
{
  SPPairingManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  id v6;
  void *v7;
  uint64_t v8;
  FMXPCServiceDescription *serviceDescription;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SPPairingManager;
  v2 = -[SPPairingManager init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.pairingmanager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc(MEMORY[0x1E0D20238]);
    -[SPPairingManager remoteInterface](v2, "remoteInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.pairingmanager"), 0, v7, 0, 0);
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v8;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SPPairingManager session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SPPairingManager setSession:](self, "setSession:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SPPairingManager;
  -[SPPairingManager dealloc](&v4, sel_dealloc);
}

- (SPPairingManagerXPCProtocol)proxy
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SPPairingManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPPairingManager session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPPairingManager serviceDescription](self, "serviceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPPairingManager setSession:](self, "setSession:", v7);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      -[SPPairingManager serviceDescription](self, "serviceDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "machService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: Establishing XPC connection to %@", (uint8_t *)&v14, 0xCu);

    }
    -[SPPairingManager session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume");

  }
  -[SPPairingManager session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "proxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPPairingManagerXPCProtocol *)v12;
}

- (id)remoteInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27A98);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_allPairingErrorsWithCompletion_, 0, 1);

  return v2;
}

- (void)initiatePairingSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SPPairingManager initiatePairingSessionWithCompletion:]";
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  -[SPPairingManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SPPairingManager_initiatePairingSessionWithCompletion___block_invoke;
  v7[3] = &unk_1E5E17510;
  objc_copyWeak(&v9, (id *)buf);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __57__SPPairingManager_initiatePairingSessionWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__SPPairingManager_initiatePairingSessionWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5E174E8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "initiatePairingSessionWithCompletion:", v4);

}

void __57__SPPairingManager_initiatePairingSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: Got pairing session with id - %{public}@", (uint8_t *)&v8, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)invalidatePairingSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v16 = "-[SPPairingManager invalidatePairingSession:completion:]";
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  -[SPPairingManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SPPairingManager_invalidatePairingSession_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v14, (id *)buf);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __56__SPPairingManager_invalidatePairingSession_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__SPPairingManager_invalidatePairingSession_completion___block_invoke_2;
  v5[3] = &unk_1E5E166F8;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "invalidatePairingSession:completion:", v4, v5);

}

void __56__SPPairingManager_invalidatePairingSession_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: Error invalidating pairing session - %{public}@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)verifyPairingWithPairingSession:(id)a3 signature:(id)a4 attestation:(id)a5 systemPublicKey:(id)a6 refKeyPublicKey:(id)a7 systemVersion:(id)a8 vendorId:(int64_t)a9 productId:(int64_t)a10 ecid:(id)a11 chipId:(id)a12 serialNumber:(id)a13 collaborativeKey:(id)a14 completion:(id)a15
{
  id v21;
  id v22;
  SPPairingManager *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v36 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v32 = a8;
  v22 = a11;
  v23 = self;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  v27 = a15;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v21, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v42 = "-[SPPairingManager verifyPairingWithPairingSession:signature:attestation:systemPublicKey:refKeyPublicKey:syste"
          "mVersion:vendorId:productId:ecid:chipId:serialNumber:collaborativeKey:completion:]";
    v43 = 2114;
    v44 = v28;
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s, with session - %{public}@", buf, 0x16u);

  }
  objc_msgSend(v21, "setPayloadSignature:", v36, a14);
  objc_msgSend(v21, "setAttestation:", v35);
  objc_msgSend(v21, "setSystemPublicKey:", v34);
  objc_msgSend(v21, "setRefKeyPublicKey:", v33);
  objc_msgSend(v21, "setCollaborativeKeyC1:", v26);
  objc_msgSend(v21, "setSystemVersion:", v32);
  objc_msgSend(v21, "setVendorId:", a9);
  objc_msgSend(v21, "setProductId:", a10);
  objc_msgSend(v21, "setEcid:", v22);
  objc_msgSend(v21, "setChipId:", v24);
  objc_msgSend(v21, "setSerialNumber:", v25);
  objc_initWeak((id *)buf, v23);
  -[SPPairingManager queue](v23, "queue");
  v29 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __192__SPPairingManager_verifyPairingWithPairingSession_signature_attestation_systemPublicKey_refKeyPublicKey_systemVersion_vendorId_productId_ecid_chipId_serialNumber_collaborativeKey_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v40, (id *)buf);
  v38 = v21;
  v39 = v27;
  v30 = v27;
  v31 = v21;
  dispatch_async(v29, block);

  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);

}

void __192__SPPairingManager_verifyPairingWithPairingSession_signature_attestation_systemPublicKey_refKeyPublicKey_systemVersion_vendorId_productId_ecid_chipId_serialNumber_collaborativeKey_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __192__SPPairingManager_verifyPairingWithPairingSession_signature_attestation_systemPublicKey_refKeyPublicKey_systemVersion_vendorId_productId_ecid_chipId_serialNumber_collaborativeKey_completion___block_invoke_2;
  v5[3] = &unk_1E5E174E8;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "verifyPairingInfoUsing:completion:", v4, v5);

}

uint64_t __192__SPPairingManager_verifyPairingWithPairingSession_signature_attestation_systemPublicKey_refKeyPublicKey_systemVersion_vendorId_productId_ecid_chipId_serialNumber_collaborativeKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)finalizePairingWithSession:(id)a3 name:(id)a4 roleId:(int64_t)a5 roleEmoji:(id)a6 keyStatus:(id)a7 collaborativeKey:(id)a8 signature:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v16, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v32 = "-[SPPairingManager finalizePairingWithSession:name:roleId:roleEmoji:keyStatus:collaborativeKey:signature:completion:]";
    v33 = 2114;
    v34 = v23;
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "@DEPRECATED SPPairingManager: %{public}s, with session - %{public}@", buf, 0x16u);

  }
  objc_msgSend(v16, "setKeyGenerationStatus:", v19);
  objc_msgSend(v16, "setCollaborativeKeyC3:", v20);
  objc_msgSend(v16, "setConfirmSignature:", v21);
  objc_msgSend(v16, "updateName:roleId:roleEmoji:", v17, a5, v18);
  objc_initWeak((id *)buf, self);
  -[SPPairingManager queue](self, "queue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__SPPairingManager_finalizePairingWithSession_name_roleId_roleEmoji_keyStatus_collaborativeKey_signature_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v30, (id *)buf);
  v28 = v16;
  v29 = v22;
  v25 = v22;
  v26 = v16;
  dispatch_async(v24, block);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

}

void __117__SPPairingManager_finalizePairingWithSession_name_roleId_roleEmoji_keyStatus_collaborativeKey_signature_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __117__SPPairingManager_finalizePairingWithSession_name_roleId_roleEmoji_keyStatus_collaborativeKey_signature_completion___block_invoke_2;
  v5[3] = &unk_1E5E174E8;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "finalizePairingUsing:completion:", v4, v5);

}

uint64_t __117__SPPairingManager_finalizePairingWithSession_name_roleId_roleEmoji_keyStatus_collaborativeKey_signature_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)finalizePairingWithSession:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v20 = "-[SPPairingManager finalizePairingWithSession:configuration:completion:]";
    v21 = 2114;
    v22 = v11;
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s, with session - %{public}@", buf, 0x16u);

  }
  objc_msgSend(v8, "updateWithConfiguration:", v9);
  objc_initWeak((id *)buf, self);
  -[SPPairingManager queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SPPairingManager_finalizePairingWithSession_configuration_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v18, (id *)buf);
  v16 = v8;
  v17 = v10;
  v13 = v10;
  v14 = v8;
  dispatch_async(v12, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __72__SPPairingManager_finalizePairingWithSession_configuration_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__SPPairingManager_finalizePairingWithSession_configuration_completion___block_invoke_2;
  v5[3] = &unk_1E5E174E8;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "finalizePairingUsing:completion:", v4, v5);

}

uint64_t __72__SPPairingManager_finalizePairingWithSession_configuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unpairUUID:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v19 = "-[SPPairingManager unpairUUID:force:completion:]";
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  -[SPPairingManager queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__SPPairingManager_unpairUUID_force_completion___block_invoke;
  v13[3] = &unk_1E5E17538;
  objc_copyWeak(&v16, (id *)buf);
  v17 = a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __48__SPPairingManager_unpairUUID_force_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SPPairingManager_unpairUUID_force_completion___block_invoke_2;
  v6[3] = &unk_1E5E166F8;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "unpairUUID:force:completion:", v5, v4, v6);

}

void __48__SPPairingManager_unpairUUID_force_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: unpair completed. Error - %@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getLocalPairingDataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SPPairingManager getLocalPairingDataWithCompletion:]";
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  -[SPPairingManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SPPairingManager_getLocalPairingDataWithCompletion___block_invoke;
  v7[3] = &unk_1E5E17510;
  objc_copyWeak(&v9, (id *)buf);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __54__SPPairingManager_getLocalPairingDataWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getLocalPairingDataWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)currentBeaconingKeyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SPPairingManager currentBeaconingKeyWithCompletion:]";
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  -[SPPairingManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SPPairingManager_currentBeaconingKeyWithCompletion___block_invoke;
  v7[3] = &unk_1E5E17510;
  objc_copyWeak(&v9, (id *)buf);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __54__SPPairingManager_currentBeaconingKeyWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SPPairingManager_currentBeaconingKeyWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5E17560;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "currentBeaconingKeyWithCompletion:", v4);

}

uint64_t __54__SPPairingManager_currentBeaconingKeyWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allPairingErrorsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SPPairingManager allPairingErrorsWithCompletion:]";
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  -[SPPairingManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SPPairingManager_allPairingErrorsWithCompletion___block_invoke;
  v7[3] = &unk_1E5E17510;
  objc_copyWeak(&v9, (id *)buf);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __51__SPPairingManager_allPairingErrorsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allPairingErrorsWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)setAlwaysBeaconWildState:(BOOL)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  BOOL v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v13 = "-[SPPairingManager setAlwaysBeaconWildState:completion:]";
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__SPPairingManager_setAlwaysBeaconWildState_completion___block_invoke;
  v8[3] = &unk_1E5E175B0;
  v8[4] = self;
  objc_copyWeak(&v10, (id *)buf);
  v11 = a3;
  v9 = v6;
  v7 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPPairingManager setAlwaysBeaconWildState:completion:", OS_ACTIVITY_FLAG_DEFAULT, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __56__SPPairingManager_setAlwaysBeaconWildState_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SPPairingManager_setAlwaysBeaconWildState_completion___block_invoke_2;
  block[3] = &unk_1E5E17588;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v6 = *(_BYTE *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

  objc_destroyWeak(&v5);
}

void __56__SPPairingManager_setAlwaysBeaconWildState_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlwaysBeaconWildState:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)alwaysBeaconWildStateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v10 = "-[SPPairingManager alwaysBeaconWildStateWithCompletion:]";
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __56__SPPairingManager_alwaysBeaconWildStateWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E175D8;
  activity_block[4] = self;
  objc_copyWeak(&v8, (id *)buf);
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPPairingManager alwaysBeaconWildStateWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __56__SPPairingManager_alwaysBeaconWildStateWithCompletion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__SPPairingManager_alwaysBeaconWildStateWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5E17510;
  objc_copyWeak(&v5, a1 + 6);
  v4 = a1[5];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __56__SPPairingManager_alwaysBeaconWildStateWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alwaysBeaconWildStateWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)getOfflineFindingInfoWithCurrentData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v16 = "-[SPPairingManager getOfflineFindingInfoWithCurrentData:completion:]";
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  -[SPPairingManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SPPairingManager_getOfflineFindingInfoWithCurrentData_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v14, (id *)buf);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __68__SPPairingManager_getOfflineFindingInfoWithCurrentData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getOfflineFindingInfoWithCurrentData:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
}

@end

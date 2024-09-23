@implementation SPFirmwareUpdateSession

- (SPFirmwareUpdateSession)init
{
  SPFirmwareUpdateSession *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPFirmwareUpdateSession;
  v2 = -[SPFirmwareUpdateSession init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.icloud.searchparty.firmwareupdatesession", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)candidateBeaconsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke;
  v6[3] = &unk_1E5E175D8;
  v6[4] = self;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPFirmwareUpdateSession: Calling firmwareUpdateCandidateBeaconsWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_2;
  block[3] = &unk_1E5E18038;
  objc_copyWeak(&v6, a1 + 6);
  v3 = a1[5];
  block[4] = a1[4];
  v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_3;
  v15[3] = &unk_1E5E17C68;
  v16 = a1[5];
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v15);
  objc_msgSend(a1[4], "sessionInvalidationFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_4;
  v13[3] = &unk_1E5E17FE8;
  v8 = v4;
  v14 = v8;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v13);

  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_5;
  v11[3] = &unk_1E5E18010;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v3, "firmwareUpdateCandidateBeaconsWithCompletion:", v11);

}

void __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPFirmwareUpdate.ErrorDomain"), 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

uint64_t __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

- (void)connectionTokensForBeaconUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke;
  v14[3] = &unk_1E5E180B0;
  v14[4] = self;
  objc_copyWeak(&v18, &location);
  v16 = v9;
  v17 = v10;
  v15 = v8;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  _os_activity_initiate(&dword_1AEA79000, "SPFirmwareUpdateSession: Calling commandKeysForUUIDs", OS_ACTIVITY_FLAG_DEFAULT, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_2;
  block[3] = &unk_1E5E18088;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v9 = v3;
  block[4] = v4;
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

  objc_destroyWeak(&v10);
}

void __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_3;
  v17[3] = &unk_1E5E17C68;
  v18 = *(id *)(a1 + 56);
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v17);
  objc_msgSend(*(id *)(a1 + 32), "sessionInvalidationFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_4;
  v15[3] = &unk_1E5E17FE8;
  v8 = v4;
  v16 = v8;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v15);

  v19[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 48);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_5;
  v13[3] = &unk_1E5E18060;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v3, "commandKeysForUUIDs:dateInterval:completion:", v10, v11, v13);

}

void __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPFirmwareUpdate.ErrorDomain"), 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

void __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_6;
  v6[3] = &unk_1E5E17D80;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);
}

void __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);

}

- (void)updateBeaconUUID:(id)a3 firmwareUpdateState:(int64_t)a4 systemVersion:(id)a5 error:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25[2];
  id location;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke;
  v20[3] = &unk_1E5E18150;
  v20[4] = self;
  objc_copyWeak(v25, &location);
  v25[1] = (id)a4;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v24 = v15;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v15;
  _os_activity_initiate(&dword_1AEA79000, "SPFirmwareUpdateSession: Calling updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:", OS_ACTIVITY_FLAG_DEFAULT, v20);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13[2];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_2;
  block[3] = &unk_1E5E18128;
  objc_copyWeak(v13, (id *)(a1 + 72));
  v3 = *(id *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v12 = v3;
  block[4] = v4;
  v6 = v5;
  v7 = *(void **)(a1 + 80);
  v9 = v6;
  v13[1] = v7;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  dispatch_async(v2, block);

  objc_destroyWeak(v13);
}

void __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_3;
  v19[3] = &unk_1E5E180D8;
  v20 = *(id *)(a1 + 64);
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v19);
  objc_msgSend(*(id *)(a1 + 32), "sessionInvalidationFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_4;
  v17[3] = &unk_1E5E17FE8;
  v8 = v4;
  v18 = v8;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v17);

  v10 = *(_QWORD *)(a1 + 80);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_5;
  v15[3] = &unk_1E5E18100;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v3, "updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:", v11, v10, v12, v13, v15);

}

uint64_t __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
    objc_msgSend(a2, "BOOLValue");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPFirmwareUpdate.ErrorDomain"), 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

void __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

- (void)beaconsInFirmwareUpdateState:(int64_t)a3 dateInterval:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15[2];
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke;
  v12[3] = &unk_1E5E181A0;
  v12[4] = self;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a3;
  v13 = v8;
  v14 = v9;
  v10 = v8;
  v11 = v9;
  _os_activity_initiate(&dword_1AEA79000, "SPFirmwareUpdateSession: Calling beaconsInFirmwareUpdateState:since:completion:", OS_ACTIVITY_FLAG_DEFAULT, v12);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9[2];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_2;
  block[3] = &unk_1E5E18178;
  objc_copyWeak(v9, (id *)(a1 + 56));
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  block[4] = v4;
  v9[1] = *(id *)(a1 + 64);
  v7 = v5;
  dispatch_async(v2, block);

  objc_destroyWeak(v9);
}

void __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_3;
  v17[3] = &unk_1E5E17C68;
  v18 = *(id *)(a1 + 48);
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v17);
  objc_msgSend(*(id *)(a1 + 32), "sessionInvalidationFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_4;
  v15[3] = &unk_1E5E17FE8;
  v8 = v4;
  v16 = v8;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v15);

  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 40);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_5;
  v13[3] = &unk_1E5E18010;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v3, "beaconsInFirmwareUpdateState:dateInterval:completion:", v10, v11, v13);

}

void __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPFirmwareUpdate.ErrorDomain"), 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

uint64_t __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

- (void)initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke;
  v6[3] = &unk_1E5E175D8;
  v6[4] = self;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPFirmwareUpdateSession: Calling initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_2;
  block[3] = &unk_1E5E18038;
  objc_copyWeak(&v6, a1 + 6);
  v3 = a1[5];
  block[4] = a1[4];
  v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_3;
  v15[3] = &unk_1E5E180D8;
  v16 = a1[5];
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v15);
  objc_msgSend(a1[4], "sessionInvalidationFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_4;
  v13[3] = &unk_1E5E17FE8;
  v8 = v4;
  v14 = v8;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v13);

  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_5;
  v11[3] = &unk_1E5E18100;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v3, "initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion:", v11);

}

uint64_t __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
    objc_msgSend(a2, "BOOLValue");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPFirmwareUpdate.ErrorDomain"), 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

void __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

- (void)firmwareUpdateStateForBeaconUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke;
  activity_block[3] = &unk_1E5E18240;
  activity_block[4] = self;
  objc_copyWeak(&v13, &location);
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  _os_activity_initiate(&dword_1AEA79000, "SPFirmwareUpdateSession: Calling firmwareUpdateStateForBeaconUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_2;
  v6[3] = &unk_1E5E18218;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v6[4] = v4;
  v7 = v5;
  dispatch_async(v2, v6);

  objc_destroyWeak(&v9);
}

void __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_3;
  v16[3] = &unk_1E5E181C8;
  v17 = *(id *)(a1 + 48);
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v16);
  objc_msgSend(*(id *)(a1 + 32), "sessionInvalidationFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_4;
  v14[3] = &unk_1E5E17FE8;
  v8 = v4;
  v15 = v8;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v14);

  v10 = *(_QWORD *)(a1 + 40);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_5;
  v12[3] = &unk_1E5E181F0;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v3, "firmwareUpdateStateForBeaconUUID:completion:", v10, v12);

}

void __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a2;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setState:", -1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPFirmwareUpdate.ErrorDomain"), 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

uint64_t __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

- (id)proxy
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SPFirmwareUpdateSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPFirmwareUpdateSession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SPFirmwareUpdateSession serviceDescription](self, "serviceDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20240]), "initWithServiceDescription:", v5);
    -[SPFirmwareUpdateSession setSession:](self, "setSession:", v6);

    LogCategory_FirmwareUpdate();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "machService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "SPFirmwareUpdateSession: Establishing XPC connection to %@", (uint8_t *)&v13, 0xCu);

    }
    -[SPFirmwareUpdateSession session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resume");

  }
  -[SPFirmwareUpdateSession session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "proxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)serviceDescription
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = (void *)objc_opt_new();
  objc_storeStrong((id *)&self->_sessionInvalidationFuture, v3);
  v4 = objc_alloc(MEMORY[0x1E0D20238]);
  -[SPFirmwareUpdateSession remoteInterface](self, "remoteInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__SPFirmwareUpdateSession_serviceDescription__block_invoke;
  v12[3] = &unk_1E5E167C8;
  v13 = v3;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __45__SPFirmwareUpdateSession_serviceDescription__block_invoke_2;
  v10[3] = &unk_1E5E167C8;
  v11 = v13;
  v7 = v13;
  v8 = (void *)objc_msgSend(v4, "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.beaconmanager"), 0, v5, v12, v10);

  return v8;
}

void __45__SPFirmwareUpdateSession_serviceDescription__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  FMEmptyResult();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithResult:", v2);

}

void __45__SPFirmwareUpdateSession_serviceDescription__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  FMEmptyResult();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithResult:", v2);

}

- (id)remoteInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27978);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  v19[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_commandKeysForUUIDs_dateInterval_completion_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_firmwareUpdateCandidateBeaconsWithCompletion_, 0, 1);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_beaconsInFirmwareUpdateState_dateInterval_completion_, 0, 1);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_firmwareUpdateStateForBeaconUUID_completion_, 0, 1);

  return v2;
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (FMFuture)sessionInvalidationFuture
{
  return self->_sessionInvalidationFuture;
}

- (void)setSessionInvalidationFuture:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInvalidationFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInvalidationFuture, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end

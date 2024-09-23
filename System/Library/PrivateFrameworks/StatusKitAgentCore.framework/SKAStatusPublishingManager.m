@implementation SKAStatusPublishingManager

- (SKAStatusPublishingManager)initWithDatabaseManager:(id)a3 channelManager:(id)a4 accountProvider:(id)a5 encryptionManager:(id)a6 invitationManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SKAStatusPublishingManager *v17;
  SKAStatusPublishingManager *v18;
  NSObject *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *internalWorkQueue;
  id v24;
  objc_super v25;

  v24 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)SKAStatusPublishingManager;
  v17 = -[SKAStatusPublishingManager init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    *(_WORD *)&v17->_pendingRequestScheduled = 0;
    objc_storeStrong((id *)&v17->_databaseManager, a3);
    objc_storeStrong((id *)&v18->_channelManager, a4);
    objc_storeStrong((id *)&v18->_encryptionManager, a6);
    objc_storeStrong((id *)&v18->_accountProvider, a5);
    objc_storeStrong((id *)&v18->_invitationManager, a7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_DEFAULT, 0);
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = dispatch_queue_create("com.apple.StatusKitAgent.PublishingManager", v20);
    internalWorkQueue = v18->_internalWorkQueue;
    v18->_internalWorkQueue = (OS_dispatch_queue *)v21;

  }
  return v18;
}

- (void)publishStatusRequest:(id)a3 statusTypeIdentifier:(id)a4 afterTime:(double)a5 isPendingPublish:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, _QWORD, void *))a7;
  if (-[SKAStatusPublishingManager clientIsRateLimited](self, "clientIsRateLimited"))
  {
    +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingManager publishStatusRequest:statusTypeIdentifier:afterTime:isPendingPublish:completion:].cold.1();

    -[SKAStatusPublishingManager databaseManager](self, "databaseManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "newBackgroundContext");

    -[SKAStatusPublishingManager ensurePendingPublishRequestExistsWithPublishRequest:forStatusTypeIdentifier:databaseContext:](self, "ensurePendingPublishRequestExistsWithPublishRequest:forStatusTypeIdentifier:databaseContext:", v12, v13, v17);
    -[SKAStatusPublishingManager _rateLimitDelayTime](self, "_rateLimitDelayTime");
    -[SKAStatusPublishingManager publishPendingRequestsWithDelay:](self, "publishPendingRequestsWithDelay:");
    +[SKAStatusPublishingManager _errorForRateLimit](SKAStatusPublishingManager, "_errorForRateLimit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v18);

  }
  else
  {
    -[SKAStatusPublishingManager _publishStatusRequest:statusTypeIdentifier:afterTime:isPendingPublish:retryCount:completion:](self, "_publishStatusRequest:statusTypeIdentifier:afterTime:isPendingPublish:retryCount:completion:", v12, v13, v8, 0, v14, a5);
  }

}

- (void)removePendingPublishRequestsForStatusTypeIdentifier:(id)a3 olderThanRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SKAStatusPublishingManager databaseManager](self, "databaseManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "newBackgroundContext");

  -[SKAStatusPublishingManager _removePendingPublishRequestsForStatusTypeIdentifier:olderThanRequest:databaseContext:](self, "_removePendingPublishRequestsForStatusTypeIdentifier:olderThanRequest:databaseContext:", v7, v6, v9);
}

- (void)provisionPayloads:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  SKAStatusPublishingManager *v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)os_transaction_create();
  -[SKAStatusPublishingManager databaseManager](self, "databaseManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newBackgroundContext");

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke;
  v18[3] = &unk_24D976518;
  v19 = v8;
  v20 = self;
  v22 = v9;
  v23 = v10;
  v21 = v11;
  v14 = v9;
  v15 = v11;
  v16 = v10;
  v17 = v8;
  -[SKAStatusPublishingManager findOrCreatePersonalChannelForStatusTypeIdentifier:databaseContext:completion:](self, "findOrCreatePersonalChannelForStatusTypeIdentifier:databaseContext:completion:", v14, v13, v18);

}

void __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  id obj;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v28 = v6;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = *(id *)(a1 + 32);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    v9 = v5;
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v35;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
          objc_msgSend(*(id *)(a1 + 40), "channelManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "serverTime");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 40), "encryptionManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "now");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v13;
          v5 = v9;
          objc_msgSend(v16, "encodeStatusPayloadForProvisioning:statusUniqueIdentifier:dateCreated:currentServerTime:channel:", v19, v17, v18, v15, v9);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 40), "channelManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "channelToken");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke_2;
    v30[3] = &unk_24D9764F0;
    v33 = *(id *)(a1 + 64);
    v31 = *(id *)(a1 + 32);
    v32 = *(id *)(a1 + 48);
    objc_msgSend(v20, "publishProvisionPayloads:onChannel:withChannelToken:publishInitiateTime:retryCount:completion:", v21, v22, v23, v24, 0, v30);

    v5 = v9;
    v25 = v33;
    v7 = v28;
  }
  else
  {
    +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke_cold_1(a1);

    +[SKAStatusPublishingManager _noPersonalChannelErrorForStatusTypeIdentifier:](SKAStatusPublishingManager, "_noPersonalChannelErrorForStatusTypeIdentifier:", *(_QWORD *)(a1 + 56));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v27 = (id)objc_opt_self();
  }

}

void __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  id v7;
  uint8_t v8[16];

  v3 = a2;
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke_2_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully provisioned status payloads with the channel manager", v8, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();
  v7 = (id)objc_opt_self();

}

- (void)_publishStatusRequest:(id)a3 statusTypeIdentifier:(id)a4 afterTime:(double)a5 isPendingPublish:(BOOL)a6 retryCount:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  dispatch_time_t v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  BOOL v30;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  v17 = (void *)os_transaction_create();
  v18 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  -[SKAStatusPublishingManager internalWorkQueue](self, "internalWorkQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke;
  block[3] = &unk_24D9765E0;
  block[4] = self;
  v25 = v14;
  v30 = a6;
  v28 = v16;
  v29 = a7;
  v26 = v15;
  v27 = v17;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  v23 = v14;
  dispatch_after(v18, v19, block);

}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15[2];
  char v16;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "databaseManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newBackgroundContext");

  objc_msgSend(*(id *)(a1 + 32), "ensurePendingPublishRequestExistsWithPublishRequest:forStatusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldClientRateLimit"))
  {
    +[SKAStatusPublishingManager _errorForRateLimit](SKAStatusPublishingManager, "_errorForRateLimit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setClientIsRateLimited:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setClientIsRateLimited:", 0);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_2;
    v9[3] = &unk_24D9765B8;
    objc_copyWeak(v15, &location);
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    v16 = *(_BYTE *)(a1 + 80);
    v15[1] = *(id *)(a1 + 72);
    v12 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 64);
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v5, "findOrCreatePersonalChannelForStatusTypeIdentifier:databaseContext:completion:", v6, v3, v9);

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }

}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int8x16_t v35;
  unsigned int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  int8x16_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  char v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8 = WeakRetained;
  if (v5)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v51 = 0;
    v10 = objc_msgSend(WeakRetained, "_shouldAllowPublishForPublishRequest:onChannel:error:", v9, v5, &v51);
    v11 = v51;
    v12 = v11;
    if (v10)
    {
      v41 = v11;
      v42 = v6;
      objc_msgSend(*(id *)(a1 + 40), "_markPublishAttempt");
      objc_msgSend(*(id *)(a1 + 32), "statusUniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v53 = v13;
        v54 = 2112;
        v55 = v15;
        _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Publishing status unique identifier: %@ to channel: %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "statusPayload");
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "channelManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "serverTime");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "encryptionManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dateCreated");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "encodeStatusPayload:statusUniqueIdentifier:dateCreated:currentServerTime:channel:", v39, v13, v18, v40, v5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "channelToken");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(*(id *)(a1 + 32), "isScheduledRequest");
      v20 = objc_msgSend(*(id *)(a1 + 32), "isSecondaryDeviceRepublish");
      objc_msgSend(v8, "channelManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dateCreated");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(unsigned __int8 *)(a1 + 88);
      v24 = *(_QWORD *)(a1 + 80);
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11;
      v43[3] = &unk_24D976590;
      v35 = *(int8x16_t *)(a1 + 32);
      v25 = (id)v35.i64[0];
      v44 = vextq_s8(v35, v35, 8uLL);
      v50 = v20;
      v45 = *(id *)(a1 + 48);
      v49 = *(id *)(a1 + 64);
      v46 = v13;
      v47 = v19;
      v48 = *(id *)(a1 + 56);
      v26 = v19;
      v27 = v13;
      v34 = v24;
      v28 = (void *)v39;
      objc_msgSend(v21, "publishData:onChannel:withChannelToken:publishInitiateTime:isPendingPublish:isScheduledPublish:retryCount:completion:", v38, v26, v37, v22, v23, v36, v34, v43);

      v12 = v41;
      v6 = v42;
    }
    else
    {
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_2_cold_2((id *)(a1 + 32), (uint64_t)v12, v30);

      objc_msgSend(*(id *)(a1 + 40), "databaseManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v31, "newBackgroundContext");

      v32 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "statusUniqueIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_removePendingPublishRequestWithUniqueIdentifier:databaseContext:", v33, v28);

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
  else
  {
    +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_2_cold_1(a1);

    +[SKAStatusPublishingManager _noPersonalChannelErrorForStatusTypeIdentifier:](SKAStatusPublishingManager, "_noPersonalChannelErrorForStatusTypeIdentifier:", *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  _QWORD v33[6];
  _QWORD v34[6];
  uint8_t buf[4];
  double v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11_cold_6();

    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", SKAChannelManagerErrorRetryIntervalKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", SKAChannelManagerErrorRetryIntervalKey);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

    }
    else
    {
      v11 = 0.0;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldReauthForError:", v3))
    {
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Attempting reauth to resolve error", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "accountProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_12;
      v34[3] = &unk_24D976540;
      v34[4] = *(_QWORD *)(a1 + 32);
      *(double *)&v34[5] = v11;
      objc_msgSend(v19, "refreshCredentialForPrimaryAccountWithCompletion:", v34);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldAbandonRequestForError:", v3))
    {
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11_cold_5();

      objc_msgSend(*(id *)(a1 + 32), "databaseManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "newBackgroundContext");

      v23 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "statusUniqueIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_removePendingPublishRequestWithUniqueIdentifier:databaseContext:", v24, v22);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldRollChannelForError:", v3))
    {
      v25 = *(unsigned __int8 *)(a1 + 88);
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      if (v25)
      {
        if (v27)
          __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11_cold_4();
      }
      else
      {
        if (v27)
          __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11_cold_3();

        objc_msgSend(*(id *)(a1 + 32), "invitationManager");
        v26 = objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(a1 + 48);
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_14;
        v33[3] = &unk_24D976568;
        v33[4] = *(_QWORD *)(a1 + 32);
        *(double *)&v33[5] = v11;
        -[NSObject rollPersonalChannelWithStatusTypeIdentifier:completion:](v26, "rollPersonalChannelWithStatusTypeIdentifier:completion:", v28, v33);
      }

    }
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldRetryWithDelayForError:", v3))
    {
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11_cold_2();

      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v11 <= 0.0)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11_cold_1();

      }
      else
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v36 = v11;
          _os_log_impl(&dword_2188DF000, v31, OS_LOG_TYPE_DEFAULT, "Retrying after %f sec delay", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "setClientIsRateLimited:", 1);
        objc_msgSend(*(id *)(a1 + 32), "publishPendingRequestsWithDelay:", v11);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setClientIsRateLimited:", 0);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(double *)(a1 + 56);
      v13 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138412546;
      v36 = v12;
      v37 = 2112;
      v38 = v13;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully published status %@ to channel %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setClientIsRateLimited:", 0);
    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "newBackgroundContext");

    v16 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "statusUniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_removePendingPublishRequestWithUniqueIdentifier:databaseContext:", v17, v15);

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  v32 = (id)objc_opt_self();

}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_12(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Account refresh succeeded, publishing pending publish requests", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "publishPendingRequestsWithDelay:", *(double *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_69_cold_1();

  }
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_14(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Channel was rolled succesfully.", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "publishPendingRequestsWithDelay:", *(double *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_14_cold_1();

  }
}

- (void)publishPendingRequestsWithDelay:(double)a3
{
  SKAStatusPublishingManager *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  float v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[4];
  uint64_t v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  if (-[SKAStatusPublishingManager pendingRequestScheduled](v4, "pendingRequestScheduled"))
  {
    +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Pending publish request has already been scheduled.  Not enqueing again", buf, 2u);
    }
  }
  else
  {
    -[SKAStatusPublishingManager databaseManager](v4, "databaseManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "newBackgroundContext");

    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    -[SKADatabaseManaging existingPendingPublishRequestsWithDatabaseContext:](v4->_databaseManager, "existingPendingPublishRequestsWithDatabaseContext:", v5);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*((id *)v18 + 5), "count"))
    {
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend(*((id *)v18 + 5), "count");
        v9 = a3;
        *(_DWORD *)v23 = 134218240;
        v24 = v8;
        v25 = 2048;
        v26 = v9;
        _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Will attempt to process %ld pending publish requests after a %.2f second delay", v23, 0x16u);
      }

      v10 = (void *)os_transaction_create();
      -[SKAStatusPublishingManager setPendingRequestScheduled:](v4, "setPendingRequestScheduled:", 1);
      v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      -[SKAStatusPublishingManager internalWorkQueue](v4, "internalWorkQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __62__SKAStatusPublishingManager_publishPendingRequestsWithDelay___block_invoke;
      block[3] = &unk_24D976630;
      v15 = v10;
      v16 = buf;
      block[4] = v4;
      v13 = v10;
      dispatch_after(v11, v12, block);

    }
    else
    {
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "No pending publish requests", v23, 2u);
      }
    }

    _Block_object_dispose(buf, 8);
  }

  objc_sync_exit(v4);
}

void __62__SKAStatusPublishingManager_publishPendingRequestsWithDelay___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  uint8_t v48;
  char v49[15];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v1 = a1;
  v59 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setPendingRequestScheduled:", 0);
  objc_msgSend(*(id *)(v1 + 32), "databaseManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "newBackgroundContext");

  objc_msgSend(*(id *)(v1 + 32), "databaseManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "existingPendingPublishRequestsWithDatabaseContext:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = (void *)v3;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v51;
    v45 = *(_QWORD *)v51;
    v42 = v9;
    v43 = (void *)v3;
    do
    {
      v13 = 0;
      v44 = v11;
      do
      {
        if (*(_QWORD *)v51 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v13);
        objc_msgSend(v14, "statusUniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "dateCreated");
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "now");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "timeIntervalSinceDate:", v16);
          v19 = v18;

          if (v19 <= 604800.0)
          {
            v24 = objc_msgSend(v14, "retryCount");
            v25 = objc_msgSend(*(id *)(v1 + 32), "_maxRetryCount");
            if (v24 >= v25)
            {
              v38 = v25;
              +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v14, "statusUniqueIdentifier");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v55 = v40;
                v56 = 2048;
                v57 = v38;
                _os_log_impl(&dword_2188DF000, v39, OS_LOG_TYPE_DEFAULT, "Deleting pending status with ID %@ as it has passed the max retry count of %lu", buf, 0x16u);

              }
              v41 = *(void **)(v1 + 32);
              objc_msgSend(v14, "statusUniqueIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "_removePendingPublishRequestWithUniqueIdentifier:databaseContext:", v23, v8);
            }
            else
            {
              v26 = objc_alloc(MEMORY[0x24BEB1090]);
              objc_msgSend(v14, "payloadData");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)objc_msgSend(v26, "initWithData:", v27);

              v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1098]), "initWithStatusPayload:", v23);
              objc_msgSend(v14, "dateCreated");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setDateCreated:", v29);

              objc_msgSend(v14, "statusUniqueIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setStatusUniqueIdentifier:", v30);

              objc_msgSend(v14, "statusTypeIdentifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v1;
              objc_msgSend(*(id *)(v1 + 32), "databaseManager");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "statusUniqueIdentifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "incrementPendingPublishRequestRetryCountWithUniqueIdentifier:databaseContext:", v34, v8);

              +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v28, "statusUniqueIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v55 = v36;
                _os_log_impl(&dword_2188DF000, v35, OS_LOG_TYPE_DEFAULT, "Attempting to publish pending request with ID: %@", buf, 0xCu);

              }
              v46[0] = MEMORY[0x24BDAC760];
              v46[1] = 3221225472;
              v46[2] = __62__SKAStatusPublishingManager_publishPendingRequestsWithDelay___block_invoke_19;
              v46[3] = &unk_24D976608;
              v1 = v32;
              v37 = *(void **)(v32 + 32);
              v47 = *(id *)(v32 + 40);
              objc_msgSend(v37, "_publishStatusRequest:statusTypeIdentifier:afterTime:isPendingPublish:retryCount:completion:", v28, v31, 1, v24 + 1, v46, 0.0);

              v9 = v42;
              v8 = v43;
            }
            v11 = v44;
            v12 = v45;
          }
          else
          {
            +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "statusUniqueIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v55 = v21;
              _os_log_impl(&dword_2188DF000, v20, OS_LOG_TYPE_DEFAULT, "Deleting pending status with ID %@ as it has expired", buf, 0xCu);

              v12 = v45;
            }

            v22 = *(void **)(v1 + 32);
            objc_msgSend(v14, "statusUniqueIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "_removePendingPublishRequestWithUniqueIdentifier:databaseContext:", v23, v8);
          }

        }
        else
        {
          +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            __62__SKAStatusPublishingManager_publishPendingRequestsWithDelay___block_invoke_cold_1(&v48, v49, v16);
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v11);
  }

}

void __62__SKAStatusPublishingManager_publishPendingRequestsWithDelay___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Publish of pending status request with ID:%@ finished with error:%@", (uint8_t *)&v8, 0x16u);
  }

  v7 = (id)objc_opt_self();
}

- (void)publishPendingRequestForReason:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Publish requested for reason: %lu", (uint8_t *)&v6, 0xCu);
  }

  -[SKAStatusPublishingManager _pendingDelayTime](self, "_pendingDelayTime");
  -[SKAStatusPublishingManager publishPendingRequestsWithDelay:](self, "publishPendingRequestsWithDelay:");
}

- (BOOL)_shouldAllowPublishForPublishRequest:(id)a3 onChannel:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[SKAStatusPublishingManager databaseManager](self, "databaseManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "newBackgroundContext");

  -[SKAStatusPublishingManager databaseManager](self, "databaseManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "existingStatusForChannel:databaseContext:", v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusUniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", v15))
  {
    +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingManager _shouldAllowPublishForPublishRequest:onChannel:error:].cold.1((uint64_t)v14);

    if (a5)
    {
      +[SKAStatusPublishingManager _errorForDuplicateStatusPublishRequestWithIdentifier:](SKAStatusPublishingManager, "_errorForDuplicateStatusPublishRequestWithIdentifier:", v14);
      v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    objc_msgSend(v13, "dateCreated");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateCreated");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v17 = 1;
    if (v18 && v19 && objc_msgSend(v18, "compare:", v19) != -1)
    {
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = 138413058;
        v24 = v14;
        v25 = 2112;
        v26 = v18;
        v27 = 2112;
        v28 = v15;
        v29 = 2112;
        v30 = v20;
        _os_log_error_impl(&dword_2188DF000, v21, OS_LOG_TYPE_ERROR, "Dropping status publish request, existing status %@ was created at %@, publish request %@ from %@ is not newer.", (uint8_t *)&v23, 0x2Au);
      }

      if (a5)
      {
        +[SKAStatusPublishingManager _errorForStatusPublishRequestWithIdentifier:requestedStatusCreationDate:isOlderThanExistingStatus:existingStatusCreationDate:](SKAStatusPublishingManager, "_errorForStatusPublishRequestWithIdentifier:requestedStatusCreationDate:isOlderThanExistingStatus:existingStatusCreationDate:", v15, v20, v14, v18);
        v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
    }

  }
  return v17;
}

- (BOOL)_shouldClientRateLimit
{
  void *v3;
  CFPropertyListRef v4;
  void *v5;
  int64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  uint8_t v16[16];

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFPreferencesCopyAppValue(CFSTR("rapidPublishCount"), CFSTR("com.apple.StatusKitAgent"));
  if (v4)
    v5 = (void *)v4;
  else
    v5 = &unk_24D98DDC8;
  v6 = -[SKAStatusPublishingManager _maxRapidPublishes](self, "_maxRapidPublishes");
  if (v6 < (int)objc_msgSend(v5, "intValue"))
  {
    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("lastPublishTime"), CFSTR("com.apple.StatusKitAgent"));
    if (v7)
    {
      -[SKAStatusPublishingManager _rateLimitDelayTime](self, "_rateLimitDelayTime");
      v9 = v8;
      objc_msgSend(v3, "timeIntervalSinceDate:", v7);
      if (v10 < v9)
      {
        objc_msgSend(v7, "dateByAddingTimeInterval:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[SKAStatusPublishingManager _shouldClientRateLimit].cold.1();

        v13 = 1;
        goto LABEL_15;
      }
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "We've left the rate-limit backoff window.", v16, 2u);
      }

      CFPreferencesSetAppValue(CFSTR("rapidPublishCount"), &unk_24D98DDC8, CFSTR("com.apple.StatusKitAgent"));
    }
    v13 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (void)_markPublishAttempt
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Incrementing rapid publish counter.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_removePendingPublishRequestsForStatusTypeIdentifier:(id)a3 olderThanRequest:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  SKAStatusPublishingManager *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = self;
  v26 = v9;
  -[SKADatabaseManaging existingPendingPublishRequestsForStatusTypeIdentifier:withDatabaseContext:](self->_databaseManager, "existingPendingPublishRequestsForStatusTypeIdentifier:withDatabaseContext:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v28;
    *(_QWORD *)&v13 = 138412546;
    v25 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v17, "dateCreated", v25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dateCreated");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "compare:", v19);

        if (v20 == -1)
        {
          +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v17, "statusUniqueIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "statusUniqueIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v25;
            v32 = v22;
            v33 = 2112;
            v34 = v23;
            _os_log_impl(&dword_2188DF000, v21, OS_LOG_TYPE_DEFAULT, "Deleting pending publish request with ID: %@ because it is older than newly received publish request with ID %@", buf, 0x16u);

          }
          objc_msgSend(v17, "statusUniqueIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKAStatusPublishingManager _removePendingPublishRequestWithUniqueIdentifier:databaseContext:](v10, "_removePendingPublishRequestWithUniqueIdentifier:databaseContext:", v24, v26);

        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v14);
  }

}

- (void)ensurePendingPublishRequestExistsWithPublishRequest:(id)a3 forStatusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  SKADatabaseManaging *databaseManager;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "statusUniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseManaging existingPendingPublishRequestForUniqueIdentifier:withDatabaseContext:](self->_databaseManager, "existingPendingPublishRequestForUniqueIdentifier:withDatabaseContext:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v20 = 138412290;
      v21 = v11;
      _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Pending status publish request already exists for status unique identifier: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    if (v14)
    {
      v20 = 138412290;
      v21 = v11;
      _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Creating new pending status publish request for status unique identifier: %@", (uint8_t *)&v20, 0xCu);
    }

    databaseManager = self->_databaseManager;
    objc_msgSend(v8, "statusUniqueIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateCreated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "statusPayload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "payloadData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)-[SKADatabaseManaging createPendingPublishRequestWithUniqueIdentifier:dateCreated:payloadData:statusTypeIdentifier:databaseContext:](databaseManager, "createPendingPublishRequestWithUniqueIdentifier:dateCreated:payloadData:statusTypeIdentifier:databaseContext:", v13, v16, v18, v9, v10);

  }
}

- (void)findOrCreatePersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(id, void *, _QWORD);
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  -[SKADatabaseManaging existingPersonalChannelForStatusTypeIdentifier:databaseContext:](self->_databaseManager, "existingPersonalChannelForStatusTypeIdentifier:databaseContext:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      objc_msgSend(v11, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "StatusTypeIdentifier %@ corresponds to personal channel %@", buf, 0x16u);

    }
    v10[2](v10, v11, 0);
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Could not find an existing personal status channel for statusTypeIdentifier %@, attempting to create a new one.", buf, 0xCu);
    }

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __108__SKAStatusPublishingManager_findOrCreatePersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke;
    v15[3] = &unk_24D976338;
    v16 = v10;
    -[SKAStatusPublishingManager createPersonalChannelForStatusTypeIdentifier:databaseContext:completion:](self, "createPersonalChannelForStatusTypeIdentifier:databaseContext:completion:", v8, v9, v15);

  }
}

uint64_t __108__SKAStatusPublishingManager_findOrCreatePersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createPersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKAChannelManaging *channelManager;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  channelManager = self->_channelManager;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __102__SKAStatusPublishingManager_createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke;
  v15[3] = &unk_24D9763B0;
  objc_copyWeak(&v19, &location);
  v15[4] = self;
  v12 = v10;
  v18 = v12;
  v13 = v8;
  v16 = v13;
  v14 = v9;
  v17 = v14;
  -[SKAChannelManaging createChannelWithCompletion:](channelManager, "createChannelWithCompletion:", v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __102__SKAStatusPublishingManager_createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __102__SKAStatusPublishingManager_createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_cold_1();

    if (objc_msgSend(*(id *)(a1 + 32), "_shouldReauthForError:", v9))
    {
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Attempting reauth to resolve error", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "accountProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __102__SKAStatusPublishingManager_createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_23;
      v18[3] = &unk_24D976658;
      v18[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v14, "refreshCredentialForPrimaryAccountWithCompletion:", v18);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v20 = v15;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Channel creation request succeeded, new personal channel for statusTypeIdentifier %@ has channel identifier %@", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "databaseManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createPersonalChannelForStatusTypeIdentifier:channelIdentifier:channelToken:databaseContext:", *(_QWORD *)(a1 + 40), v7, v8, *(_QWORD *)(a1 + 48));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __102__SKAStatusPublishingManager_createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_23(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Account refresh succeeded, publishing pending publish requests", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "publishPendingRequestsWithDelay:", 0.0);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_69_cold_1();

  }
}

- (void)_removePendingPublishRequestWithUniqueIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Deleting pending status publish request with identifier: %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = -[SKADatabaseManaging deletePendingPublishRequestWithWithUniqueIdentifier:databaseContext:](self->_databaseManager, "deletePendingPublishRequestWithWithUniqueIdentifier:databaseContext:", v6, v7);
  if ((v9 & 1) == 0)
  {
    +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingManager _removePendingPublishRequestWithUniqueIdentifier:databaseContext:].cold.1();

  }
}

- (BOOL)_shouldReauthForError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint8_t v13[16];

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SKPushManagerErrorDomain")))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == 1)
    {
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SKAStatusPublishingManager _shouldReauthForError:].cold.1();
LABEL_15:
      v11 = 1;
      goto LABEL_20;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SKPushManagerErrorDomain")))
  {
    v8 = objc_msgSend(v3, "code");

    if (v8 == 2)
    {
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SKAStatusPublishingManager _shouldReauthForError:].cold.2();
      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("SKAChannelManagerErrorDomain")))
  {
    v10 = objc_msgSend(v3, "code");

    if (v10 == -1000)
    {
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SKAStatusPublishingManager _shouldReauthForError:].cold.3();
      goto LABEL_15;
    }
  }
  else
  {

  }
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Error does not appear to be auth related, we should not attempt reauth", v13, 2u);
  }
  v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)_shouldAbandonRequestForError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("SKPushManagerErrorDomain")))
  {

LABEL_6:
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("SKPushManagerErrorDomain")))
    {
      v8 = objc_msgSend(v3, "code");

      if (v8 == 3)
      {
        +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[SKAStatusPublishingManager _shouldAbandonRequestForError:].cold.2();
        goto LABEL_10;
      }
    }
    else
    {

    }
    v9 = 0;
    goto LABEL_13;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != 6)
    goto LABEL_6;
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SKAStatusPublishingManager _shouldAbandonRequestForError:].cold.1();
LABEL_10:

  v9 = 1;
LABEL_13:

  return v9;
}

- (BOOL)_shouldRollChannelForError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("SKPushManagerErrorDomain")))
  {

    goto LABEL_7;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != 4)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SKAStatusPublishingManager _shouldRollChannelForError:].cold.1();

  v7 = 1;
LABEL_8:

  return v7;
}

- (BOOL)_shouldRetryWithDelayForError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("SKPushManagerErrorDomain")))
  {

    goto LABEL_7;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != 7)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SKAStatusPublishingManager _shouldRetryWithDelayForError:].cold.1();

  v7 = 1;
LABEL_8:

  return v7;
}

- (double)_pendingDelayTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  float v7;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-stale-publish-wait-time-seconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 30.0;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "doubleValue");
      v4 = v5;
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v4;
        v9 = 134217984;
        v10 = v7;
        _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Server bag indicates our pending publish request delay time should be %.2f", (uint8_t *)&v9, 0xCu);
      }

    }
  }

  return v4;
}

- (double)_rateLimitDelayTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  float v7;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-rate-limit-wait-time-seconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 300.0;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "doubleValue");
      v4 = v5;
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v4;
        v9 = 134217984;
        v10 = v7;
        _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Server bag indicates our rate limit delay time should be %.2f", (uint8_t *)&v9, 0xCu);
      }

    }
  }

  return v4;
}

- (int64_t)_maxRetryCount
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v5;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-request-retry-count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_msgSend(v3, "integerValue");
    +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our max retry count should be %lu", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v4 = 5;
  }

  return v4;
}

- (int64_t)_maxRapidPublishes
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v5;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-client-rate-limit-max-rapid-publishes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_msgSend(v3, "integerValue");
    +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our max rapid publishes should be %lu", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v4 = 50;
  }

  return v4;
}

- (double)_rapidPublishesTimescale
{
  void *v2;
  void *v3;
  double v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-client-rate-limit-rapid-publish-time-seconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 10.0;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (double)objc_msgSend(v3, "integerValue");
      +[SKAStatusPublishingManager logger](SKAStatusPublishingManager, "logger");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = (uint64_t)v4;
        _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our rapid publish timescale should be %lu", (uint8_t *)&v7, 0xCu);
      }

    }
  }

  return v4;
}

+ (id)logger
{
  if (logger_onceToken_4 != -1)
    dispatch_once(&logger_onceToken_4, &__block_literal_global_4);
  return (id)logger__logger_4;
}

void __36__SKAStatusPublishingManager_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAStatusPublishingManager");
  v1 = (void *)logger__logger_4;
  logger__logger_4 = (uint64_t)v0;

}

+ (id)_noPersonalChannelErrorForStatusTypeIdentifier:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find or create a channel to publish status of type \"%@\"."), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEB10D0];
  v9 = *MEMORY[0x24BDD0BA0];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -3000, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_errorForStatusPublishRequestWithIdentifier:(id)a3 requestedStatusCreationDate:(id)a4 isOlderThanExistingStatus:(id)a5 existingStatusCreationDate:(id)a6
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Status Publish Request %@ created at %@ is not newer than existing status %@ at %@"), a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1540];
  v8 = *MEMORY[0x24BEB10D0];
  v12 = *MEMORY[0x24BDD0BA0];
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, -9002, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_errorForDuplicateStatusPublishRequestWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Status Publish Request has the same status unique identifier as existing status: %@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEB10D0];
  v9 = *MEMORY[0x24BDD0BA0];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -9001, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_errorForRateLimit
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Status Publish Request has been rate-limtited"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BEB10D0];
  v8 = *MEMORY[0x24BDD0BA0];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -9004, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManager, a3);
}

- (SKAChannelManaging)channelManager
{
  return self->_channelManager;
}

- (void)setChannelManager:(id)a3
{
  objc_storeStrong((id *)&self->_channelManager, a3);
}

- (SKAStatusEncryptionManaging)encryptionManager
{
  return self->_encryptionManager;
}

- (void)setEncryptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionManager, a3);
}

- (SKAAccountProviding)accountProvider
{
  return self->_accountProvider;
}

- (void)setAccountProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountProvider, a3);
}

- (SKAInvitationManaging)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
  objc_storeStrong((id *)&self->_invitationManager, a3);
}

- (OS_dispatch_queue)internalWorkQueue
{
  return self->_internalWorkQueue;
}

- (void)setInternalWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalWorkQueue, a3);
}

- (BOOL)pendingRequestScheduled
{
  return self->_pendingRequestScheduled;
}

- (void)setPendingRequestScheduled:(BOOL)a3
{
  self->_pendingRequestScheduled = a3;
}

- (BOOL)clientIsRateLimited
{
  return self->_clientIsRateLimited;
}

- (void)setClientIsRateLimited:(BOOL)a3
{
  self->_clientIsRateLimited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalWorkQueue, 0);
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

- (void)publishStatusRequest:statusTypeIdentifier:afterTime:isPendingPublish:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Client is currently rate-limited.  Enqueing requests as pending publish.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 56);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v1, v2, "Could not find or create a personal channel for statusTypeIdentifier %@ error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

void __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error provisioning status payloads with the channel manager: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 48);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v1, v2, "Could not find or create a personal channel for statusTypeIdentifier %@ error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_2_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "statusUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_2188DF000, a3, OS_LOG_TYPE_ERROR, "Dropping and removing status publish request with unique identifier %@. Error: %@", (uint8_t *)&v6, 0x16u);

}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Retry interval is 0--not retrying", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Attempting retry with delay.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Rolling channel.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Not rolling channel because this is a secondary device publish.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Removing pending publish based on error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_11_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error publishing status with the channel manager: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Channel roll failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __62__SKAStatusPublishingManager_publishPendingRequestsWithDelay___block_invoke_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2188DF000, log, OS_LOG_TYPE_ERROR, "Skipping publish of pending request that lacks an status identifier", buf, 2u);
}

- (void)_shouldAllowPublishForPublishRequest:(uint64_t)a1 onChannel:error:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v1, v2, "Dropping status publish request, a status with unique identifier %@ has already been published. PublishRequest: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)_shouldClientRateLimit
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "In window for rate limit backoff.  We'll be free again at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __102__SKAStatusPublishingManager_createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Channel creation request failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_removePendingPublishRequestWithUniqueIdentifier:databaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Delete failed for pending status publish request with identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_shouldReauthForError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Error is an auth expired error, we should attempt reauth", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_shouldReauthForError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Error is an auth failed error, we should attempt reauth", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_shouldReauthForError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Error is an auth missing auth token error, we should attempt reauth", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_shouldAbandonRequestForError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Publish was rejected for being stale. Abandoning.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_shouldAbandonRequestForError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Publish was rejected for being malformed. Abandoning.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_shouldRollChannelForError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Channel identity validation failed. We should roll this channel.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_shouldRetryWithDelayForError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Publish was rejected because we've hit a rate limit.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end

@implementation SKAPresenceManager

- (SKAPresenceManager)initWithDatabaseManager:(id)a3 channelManager:(id)a4 subscriptionManager:(id)a5 accountProvider:(id)a6 messagingProvider:(id)a7 delegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  SKAPresenceManager *v18;
  uint64_t v19;
  NSMapTable *activePresenceAssertionsByClient;
  uint64_t v21;
  NSMapTable *activeParticipantsByChannel;
  NSObject *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *internalWorkQueue;
  NSObject *v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *channelFetchQueue;
  NSObject *v31;
  NSObject *v32;
  dispatch_queue_t v33;
  OS_dispatch_queue *payloadUpdateProcessingQueue;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v37 = a4;
  v36 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v39.receiver = self;
  v39.super_class = (Class)SKAPresenceManager;
  v18 = -[SKAPresenceManager init](&v39, sel_init);
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    activePresenceAssertionsByClient = v18->_activePresenceAssertionsByClient;
    v18->_activePresenceAssertionsByClient = (NSMapTable *)v19;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    activeParticipantsByChannel = v18->_activeParticipantsByChannel;
    v18->_activeParticipantsByChannel = (NSMapTable *)v21;

    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v18->_channelManager, a4);
    objc_storeStrong((id *)&v18->_accountProvider, a6);
    objc_storeStrong((id *)&v18->_messagingProvider, a7);
    objc_storeWeak((id *)&v18->_delegate, v17);
    objc_storeStrong((id *)&v18->_subscriptionManager, a5);
    v18->_presenceEnabledByServer = +[SKAServerBag presenceEnabledByServer](SKAServerBag, "presenceEnabledByServer");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_DEFAULT, 0);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = dispatch_queue_create("com.apple.StatusKitAgent.PresenceManager", v24);
    internalWorkQueue = v18->_internalWorkQueue;
    v18->_internalWorkQueue = (OS_dispatch_queue *)v25;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v27, QOS_CLASS_DEFAULT, 0);
    v28 = objc_claimAutoreleasedReturnValue();

    v29 = dispatch_queue_create("com.apple.StatusKitAgent.ChannelFetchQueue", v28);
    channelFetchQueue = v18->_channelFetchQueue;
    v18->_channelFetchQueue = (OS_dispatch_queue *)v29;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v31, QOS_CLASS_DEFAULT, 0);
    v32 = objc_claimAutoreleasedReturnValue();

    v33 = dispatch_queue_create("com.apple.StatusKitAgent.PayloadUpdateProcessing", v32);
    payloadUpdateProcessingQueue = v18->_payloadUpdateProcessingQueue;
    v18->_payloadUpdateProcessingQueue = (OS_dispatch_queue *)v33;

  }
  return v18;
}

- (void)retainPresenceAssertionForPresenceIdentifier:(id)a3 withPresencePayload:(id)a4 options:(id)a5 client:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *internalWorkQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  SKAPresenceManager *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke;
  v23[3] = &unk_24D976AE0;
  objc_copyWeak(&v30, &location);
  v24 = v14;
  v25 = self;
  v26 = v13;
  v27 = v12;
  v28 = v15;
  v29 = v16;
  v18 = v15;
  v19 = v12;
  v20 = v13;
  v21 = v14;
  v22 = v16;
  dispatch_async(internalWorkQueue, v23);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v2 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if ((objc_msgSend(WeakRetained, "presenceEnabledByServer") & 1) == 0)
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();

    v21 = *(_QWORD *)(a1 + 72);
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[SKAServerBag presenceEnabledByServerForServiceIdentifier:](SKAServerBag, "presenceEnabledByServerForServiceIdentifier:", v6);

    if (!v7)
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_cold_2(a1 + 32, v23);

      v21 = *(_QWORD *)(a1 + 72);
LABEL_15:
      +[SKAPresenceManager _presenceDisabledError](SKAPresenceManager, "_presenceDisabledError");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v21 + 16))(v21, v11);
      goto LABEL_16;
    }
  }
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v33 = 0;
  v10 = objc_msgSend(v8, "_clientPayload:isValidWithError:", v9, &v33);
  v11 = v33;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "databaseManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "newBackgroundContext");

    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_12;
    v24[3] = &unk_24D976AB8;
    objc_copyWeak(&v32, v2);
    v25 = *(id *)(a1 + 64);
    v26 = *(id *)(a1 + 56);
    v27 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 40);
    v28 = v17;
    v29 = v18;
    v19 = *(id *)(a1 + 72);
    v30 = WeakRetained;
    v31 = v19;
    objc_msgSend(v16, "_findOrCreatePresenceChannelForPresenceIdentifier:options:databaseContext:completion:", v14, v15, v13, v24);

    objc_destroyWeak(&v32);
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_cold_1();

    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v11);
  }
LABEL_16:

}

void __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v8 = WeakRetained;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    if ((objc_msgSend(WeakRetained, "_addPresenceAssertionForClient:presenceIdentifier:options:payload:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)) & 1) == 0)
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Presence assertion already existed, but still sending presence assertion to ensure apsd is in sync.", buf, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 64), "_recalculateActivityTracking");
    v11 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_13;
    v14[3] = &unk_24D976A90;
    v17 = *(id *)(a1 + 80);
    v12 = v5;
    v13 = *(_QWORD *)(a1 + 72);
    v15 = v12;
    v16 = v13;
    objc_msgSend(v8, "_sendPresenceAssertionMessageForChannel:withPayload:options:isRefresh:completion:", v12, v10, v11, 0, v14);

  }
}

void __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void (*v6)(void);
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Updating active particpants for channel %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_handleBulkUpdateParticipantPayloads:forChannel:", v5, *(_QWORD *)(a1 + 32));
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();

}

- (BOOL)_clientPayload:(id)a3 isValidWithError:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  BOOL v11;

  v6 = a3;
  if (v6
    && (v7 = -[SKAPresenceManager _maxPayloadSizeBytes](self, "_maxPayloadSizeBytes"),
        objc_msgSend(v6, "payloadData"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v9 > v7))
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SKAPresenceManager _clientPayload:isValidWithError:].cold.1();

    if (a4)
    {
      +[SKAPresenceManager _payloadOversizeError](SKAPresenceManager, "_payloadOversizeError");
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)_sendPresenceAssertionMessageForChannel:(id)a3 withPayload:(id)a4 options:(id)a5 isRefresh:(BOOL)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  SKAPresenceMembershipKey *v16;
  void *v17;
  SKAPresenceMembershipKey *v18;
  SKAPresenceEncryptionKey *v19;
  void *v20;
  SKAPresenceEncryptionKey *v21;
  SKAPresenceManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  SKAPresenceManager *v32;
  SKAPresenceEncryptionKey *v33;
  _QWORD v35[5];
  id v36;
  id v37;
  SKAPresenceMembershipKey *v38;
  SKAPresenceEncryptionKey *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  BOOL v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  objc_msgSend(v11, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [SKAPresenceMembershipKey alloc];
  objc_msgSend(v11, "presenceMembershipKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SKAPresenceMembershipKey initWithPrivateKeyMaterial:](v16, "initWithPrivateKeyMaterial:", v17);

  v19 = [SKAPresenceEncryptionKey alloc];
  objc_msgSend(v11, "presenceServerKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SKAPresenceEncryptionKey initWithKeyMaterial:](v19, "initWithKeyMaterial:", v20);

  if (v18 && v21)
  {
    v33 = v21;
    v22 = self;
    +[SKAPresenceManager oversizeLogger](SKAPresenceManager, "oversizeLogger");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presenceIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v46 = v24;
      v47 = 2112;
      v48 = v25;
      v49 = 2112;
      v50 = v12;
      _os_log_impl(&dword_2188DF000, v23, OS_LOG_TYPE_DEFAULT, "Attempting to assert on channel %@ for presence identifier %@ with payload %@", buf, 0x20u);

    }
    objc_msgSend(v11, "channelToken");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v22;
    -[SKAPresenceManager channelManager](v22, "channelManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "serverTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke;
    v35[3] = &unk_24D976BD0;
    v43 = v14;
    v35[4] = v22;
    v36 = v11;
    v37 = v15;
    v38 = v18;
    v21 = v33;
    v39 = v33;
    v40 = v28;
    v41 = v26;
    v42 = v13;
    v44 = a6;
    v29 = v26;
    v30 = v28;
    -[SKAPresenceManager _presencePayloadForChannel:clientPayload:options:timestamp:completion:](v32, "_presencePayloadForChannel:clientPayload:options:timestamp:completion:", v36, v12, v42, v30, v35);

  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[SKAPresenceManager _sendPresenceAssertionMessageForChannel:withPayload:options:isRefresh:completion:].cold.1((uint64_t)v18);

    +[SKAPresenceManager _keyGenerationError](SKAPresenceManager, "_keyGenerationError");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    -[SKAPresenceManager _rollChannelForCryptoFailureIfAllowed:](self, "_rollChannelForCryptoFailureIfAllowed:", v11);
    (*((void (**)(id, id, _QWORD, double))v14 + 2))(v14, v30, MEMORY[0x24BDBD1A8], 1.79769313e308);
  }

}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  char v34;
  id location;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v21 = a2;
  if (v21)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "payloadUpdateProcessingQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v3);

    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "presenceIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v37 = v5;
      v38 = 2112;
      v39 = v6;
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "payloadUpdateProcessingQueue suspended. Sending presence assertion message for presence identifier %@ on channel %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "channelManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 72);
    v12 = *(_QWORD *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 88), "serviceIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_BYTE *)(a1 + 104) != 0;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_19;
    v22[3] = &unk_24D976BA8;
    objc_copyWeak(&v33, &location);
    v23 = v21;
    v24 = *(id *)(a1 + 48);
    v25 = *(id *)(a1 + 56);
    v26 = *(id *)(a1 + 64);
    v27 = *(id *)(a1 + 72);
    v28 = *(id *)(a1 + 80);
    v29 = *(id *)(a1 + 88);
    v34 = *(_BYTE *)(a1 + 104);
    v15 = *(id *)(a1 + 96);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v32 = v15;
    v30 = v16;
    v31 = v17;
    LOBYTE(v20) = v14;
    objc_msgSend(v7, "assertPresence:onChannel:membershipKey:serverKey:timestamp:withChannelToken:serviceIdentifier:isRefresh:completion:", v23, v8, v9, v10, v11, v12, v13, v20, v22);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_cold_1();

    +[SKAPresenceManager _payloadGenerationError](SKAPresenceManager, "_payloadGenerationError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(double))(*(_QWORD *)(a1 + 96) + 16))(1.79769313e308);

  }
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_19(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9;
  id v10;
  id WeakRetained;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  double v32;
  uint64_t v33;
  char v34;

  v9 = a2;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(WeakRetained, "internalWorkQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2;
  v18[3] = &unk_24D976B80;
  v19 = v9;
  v20 = WeakRetained;
  v21 = *(id *)(a1 + 32);
  v22 = *(id *)(a1 + 40);
  v23 = *(id *)(a1 + 48);
  v24 = *(id *)(a1 + 56);
  v25 = *(id *)(a1 + 64);
  v26 = *(id *)(a1 + 72);
  v27 = *(id *)(a1 + 80);
  v34 = *(_BYTE *)(a1 + 120);
  v13 = *(id *)(a1 + 104);
  v14 = *(_QWORD *)(a1 + 88);
  v15 = *(void **)(a1 + 96);
  v31 = v13;
  v28 = v14;
  v32 = a5;
  v29 = v15;
  v30 = v10;
  v33 = a3;
  v16 = v10;
  v17 = v9;
  dispatch_async(v12, v18);

}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  char v27;

  if (!*(_QWORD *)(a1 + 32))
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Presence assertion completed with success.", v13, 2u);
    }

    objc_msgSend(*(id *)(a1 + 104), "_setCheckpointForChannel:checkpoint:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 144));
    (*(void (**)(double))(*(_QWORD *)(a1 + 128) + 16))(*(double *)(a1 + 136));
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)v13 = 0;
    goto LABEL_14;
  }
  v2 = objc_msgSend(*(id *)(a1 + 40), "_shouldReauthForError:");
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (!v2)
  {
    if (v4)
      __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_2();

    (*(void (**)(double))(*(_QWORD *)(a1 + 128) + 16))(*(double *)(a1 + 136));
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)v13 = 0;
LABEL_14:
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "payloadUpdateProcessingQueue resumed", v13, 2u);
LABEL_15:

    objc_msgSend(*(id *)(a1 + 40), "payloadUpdateProcessingQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v12);

    return;
  }
  if (v4)
    __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "accountProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_20;
  v14[3] = &unk_24D976B58;
  v6 = *(void **)(a1 + 48);
  v14[4] = *(_QWORD *)(a1 + 40);
  v15 = v6;
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 80);
  v20 = *(id *)(a1 + 88);
  v21 = *(id *)(a1 + 96);
  v27 = *(_BYTE *)(a1 + 152);
  v7 = *(id *)(a1 + 128);
  v8 = *(_QWORD *)(a1 + 104);
  v9 = *(void **)(a1 + 112);
  v25 = v7;
  v22 = v8;
  v23 = v9;
  v26 = *(_QWORD *)(a1 + 136);
  v24 = *(id *)(a1 + 120);
  objc_msgSend(v5, "refreshCredentialForPrimaryAccountWithCompletion:", v14);

}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_20(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[6];
  id v25;
  id v26;
  uint8_t buf[16];

  v5 = a3;
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    v23 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Account refresh succeeded, reattempting presence assertion", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "channelManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 72);
    v14 = *(_QWORD *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 88), "serviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_BYTE *)(a1 + 136);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_21;
    v24[3] = &unk_24D976B30;
    v24[4] = *(_QWORD *)(a1 + 32);
    v17 = *(id *)(a1 + 120);
    v18 = *(_QWORD *)(a1 + 96);
    v19 = *(void **)(a1 + 104);
    v26 = v17;
    v24[5] = v18;
    v25 = v19;
    LOBYTE(v22) = v16;
    objc_msgSend(v8, "assertPresence:onChannel:membershipKey:serverKey:timestamp:withChannelToken:serviceIdentifier:isRefresh:completion:", v9, v10, v11, v12, v13, v14, v15, v22, v24);

    v5 = v23;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_69_cold_1();

    (*(void (**)(double))(*(_QWORD *)(a1 + 120) + 16))(*(double *)(a1 + 128));
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v20, OS_LOG_TYPE_DEFAULT, "payloadUpdateProcessingQueue resumed", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "payloadUpdateProcessingQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v21);

  }
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_21(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  double v25;
  uint64_t v26;

  v9 = a2;
  v10 = a4;
  objc_msgSend(*(id *)(a1 + 32), "internalWorkQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_22;
  v18[3] = &unk_24D976B08;
  v19 = v9;
  v24 = *(id *)(a1 + 56);
  v25 = a5;
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(void **)(a1 + 48);
  v20 = v10;
  v21 = v12;
  v14 = v13;
  v26 = a3;
  v15 = *(_QWORD *)(a1 + 32);
  v22 = v14;
  v23 = v15;
  v16 = v10;
  v17 = v9;
  dispatch_async(v11, v18);

}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_22(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 32);
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_22_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Presence assertion completed with success.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "_setCheckpointForChannel:checkpoint:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88));
  }
  (*(void (**)(double))(*(_QWORD *)(a1 + 72) + 16))(*(double *)(a1 + 80));
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "payloadUpdateProcessingQueue resumed", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 64), "payloadUpdateProcessingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v6);

}

- (void)sendPollingMessageForChannel:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SKAPresenceManager *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Polling for channel: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SKAPresenceManager_sendPollingMessageForChannel___block_invoke;
  v7[3] = &unk_24D976BF8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[SKAPresenceManager _sendPollingMessageForChannel:completion:](self, "_sendPollingMessageForChannel:completion:", v6, v7);

}

void __51__SKAPresenceManager_sendPollingMessageForChannel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __51__SKAPresenceManager_sendPollingMessageForChannel___block_invoke_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Updating active particpants for channel %@  based on polling response", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_handleBulkUpdateParticipantPayloads:forChannel:", v5, *(_QWORD *)(a1 + 32));
  }

}

- (void)_sendPollingMessageForChannel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  SKAPresenceMembershipKey *v10;
  void *v11;
  SKAPresenceMembershipKey *v12;
  SKAPresenceEncryptionKey *v13;
  void *v14;
  SKAPresenceEncryptionKey *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  SKAPresenceMembershipKey *v24;
  SKAPresenceEncryptionKey *v25;
  id v26;
  id v27;
  SKAPresenceManager *v28;
  id v29;
  id v30;
  id buf[2];

  v6 = a3;
  v7 = a4;
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Sending polling request for channel: ", (uint8_t *)buf, 2u);
  }

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [SKAPresenceMembershipKey alloc];
  objc_msgSend(v6, "presenceMembershipKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SKAPresenceMembershipKey initWithPrivateKeyMaterial:](v10, "initWithPrivateKeyMaterial:", v11);

  v13 = [SKAPresenceEncryptionKey alloc];
  objc_msgSend(v6, "presenceServerKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SKAPresenceEncryptionKey initWithKeyMaterial:](v13, "initWithKeyMaterial:", v14);

  if (v12 && v15)
  {
    v21 = v7;
    objc_msgSend(v6, "channelToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(buf, self);
    -[SKAPresenceManager channelManager](self, "channelManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke;
    v22[3] = &unk_24D976CC0;
    objc_copyWeak(&v30, buf);
    v29 = v21;
    v23 = v9;
    v24 = v12;
    v25 = v15;
    v19 = v16;
    v26 = v19;
    v27 = v6;
    v28 = self;
    objc_msgSend(v17, "pollActiveParticipantsForChannel:membershipKey:serverKey:withChannelToken:serviceIdentifier:completion:", v23, v24, v25, v19, v18, v22);

    objc_destroyWeak(&v30);
    objc_destroyWeak(buf);
    v7 = v21;
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SKAPresenceManager _sendPollingMessageForChannel:completion:].cold.1((uint64_t)v12);

    +[SKAPresenceManager _keyGenerationError](SKAPresenceManager, "_keyGenerationError");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[SKAPresenceManager _rollChannelForCryptoFailureIfAllowed:](self, "_rollChannelForCryptoFailureIfAllowed:", v6);
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v19, MEMORY[0x24BDBD1A8]);
  }

}

void __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "internalWorkQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_2;
  block[3] = &unk_24D976C98;
  v16 = v7;
  v17 = WeakRetained;
  v25 = *(id *)(a1 + 80);
  v18 = v8;
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  v23 = v11;
  v24 = v12;
  v26 = a3;
  v13 = v8;
  v14 = v7;
  dispatch_async(v10, block);

}

void __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[8];
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;

  if (!*(_QWORD *)(a1 + 32))
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Polling completed with success.", v11, 2u);
    }

    objc_msgSend(*(id *)(a1 + 96), "_setCheckpointForChannel:checkpoint:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 112));
    goto LABEL_12;
  }
  v2 = objc_msgSend(*(id *)(a1 + 40), "_shouldReauthForError:");
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (!v2)
  {
    if (v4)
      __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_2();

LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
    return;
  }
  if (v4)
    __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "accountProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_27;
  v12[3] = &unk_24D976C70;
  v21 = *(id *)(a1 + 104);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 72);
  v18 = *(id *)(a1 + 80);
  v8 = *(id *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 96);
  v19 = v8;
  v20 = v9;
  objc_msgSend(v5, "refreshCredentialForPrimaryAccountWithCompletion:", v12);

}

void __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_27(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  int8x16_t v14;
  _QWORD v15[5];
  int8x16_t v16;
  id v17;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "channelManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 80), "serviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_28;
    v15[3] = &unk_24D976C48;
    v15[4] = *(_QWORD *)(a1 + 40);
    v14 = *(int8x16_t *)(a1 + 80);
    v12 = (id)v14.i64[0];
    v16 = vextq_s8(v14, v14, 8uLL);
    v17 = *(id *)(a1 + 96);
    objc_msgSend(v6, "pollActiveParticipantsForChannel:membershipKey:serverKey:withChannelToken:serviceIdentifier:completion:", v7, v8, v9, v10, v11, v15);

  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_69_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }

}

void __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_28(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "internalWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_2_29;
  v15[3] = &unk_24D976C20;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  v16 = v7;
  v17 = v10;
  v18 = v11;
  v21 = a3;
  v12 = *(id *)(a1 + 56);
  v19 = v8;
  v20 = v12;
  v13 = v8;
  v14 = v7;
  dispatch_async(v9, v15);

}

uint64_t __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_2_29(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = *(_QWORD *)(a1 + 32);
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_22_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "_setCheckpointForChannel:checkpoint:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Polling completed with success.", v6, 2u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_handleBulkUpdateParticipantPayloads:(id)a3 forChannel:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Updating present devices for channel: %@", buf, 0xCu);

  }
  -[SKAPresenceManager _clearPresentDevicesForChannel:](self, "_clearPresentDevicesForChannel:", v7);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:](self, "_presentDeviceFromPayload:onChannel:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), v7, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[SKAPresenceManager _addPresentDeviceForChannel:presentDevice:](self, "_addPresentDeviceForChannel:presentDevice:", v7, v15);
        }
        else
        {
          +[SKAPresenceManager logger](SKAPresenceManager, "logger");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[SKAPresenceManager _handleBulkUpdateParticipantPayloads:forChannel:].cold.1(buf, &buf[1], v16);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  -[SKAPresenceManager _presentDevicesChangedForChannel:](self, "_presentDevicesChangedForChannel:", v7);
}

- (void)releasePresenceAssertionForPresenceIdentifier:(id)a3 options:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *internalWorkQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  SKAPresenceManager *v23;
  id v24;
  id v25;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke;
  block[3] = &unk_24D976D38;
  objc_copyWeak(&v25, &location);
  v23 = self;
  v24 = v13;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if ((objc_msgSend(WeakRetained, "presenceEnabledByServer") & 1) != 0)
  {
    objc_msgSend(WeakRetained, "databaseManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "newBackgroundContext");

    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_msgSend(*(id *)(a1 + 40), "isPersonal");
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_31;
    v12[3] = &unk_24D976220;
    objc_copyWeak(&v18, v2);
    v17 = *(id *)(a1 + 64);
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 56);
    v15 = v8;
    v16 = v9;
    objc_msgSend(WeakRetained, "findPresenceChannelForPresenceIdentifier:isPersonal:databaseContext:completion:", v6, v7, v5, v12);

    objc_destroyWeak(&v18);
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();

    v11 = *(_QWORD *)(a1 + 64);
    +[SKAPresenceManager _presenceDisabledError](SKAPresenceManager, "_presenceDisabledError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v5);
  }

}

void __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8 = WeakRetained;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "internalWorkQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_2;
    block[3] = &unk_24D976D10;
    block[4] = v8;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    v16 = v5;
    v17 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 64);
    v18 = *(_QWORD *)(a1 + 56);
    v19 = v10;
    dispatch_async(v9, block);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 64);
    +[SKAPresenceManager _unexpectedInternalError](SKAPresenceManager, "_unexpectedInternalError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
}

void __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 48);
  v3 = objc_msgSend(*(id *)(a1 + 32), "_removePresenceAssertionForClient:presenceIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *v2;
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully removed presence assertion from in memory model for subscription identifier: %@", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_32;
    v13[3] = &unk_24D976CE8;
    v14 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 80);
    v15 = *(_QWORD *)(a1 + 72);
    v16 = v10;
    objc_msgSend(v7, "_sendPresenceDeactivationMessageForChannel:options:completion:", v9, v8, v13);

    v11 = v14;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_2_cold_1();

    v12 = *(_QWORD *)(a1 + 80);
    +[SKAPresenceManager _noExistingAssertionError](SKAPresenceManager, "_noExistingAssertionError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v11);
  }

}

void __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_32_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Deactivation message succeeded for %@", (uint8_t *)&v8, 0xCu);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();
  objc_msgSend(*(id *)(a1 + 40), "_recalculateActivityTracking");

}

- (void)_sendPresenceDeactivationMessageForChannel:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SKAPresenceMembershipKey *v12;
  void *v13;
  SKAPresenceMembershipKey *v14;
  SKAPresenceEncryptionKey *v15;
  void *v16;
  SKAPresenceEncryptionKey *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  SKAPresenceMembershipKey *v26;
  _QWORD v27[4];
  id v28;
  SKAPresenceMembershipKey *v29;
  SKAPresenceEncryptionKey *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [SKAPresenceMembershipKey alloc];
  objc_msgSend(v8, "presenceMembershipKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SKAPresenceMembershipKey initWithPrivateKeyMaterial:](v12, "initWithPrivateKeyMaterial:", v13);

  v15 = [SKAPresenceEncryptionKey alloc];
  objc_msgSend(v8, "presenceServerKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SKAPresenceEncryptionKey initWithKeyMaterial:](v15, "initWithKeyMaterial:", v16);

  if (v14 && v17)
  {
    v26 = v14;
    objc_msgSend(v8, "channelToken");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAPresenceManager channelManager](self, "channelManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serverTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(location, self);
    -[SKAPresenceManager channelManager](self, "channelManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke;
    v27[3] = &unk_24D976DD8;
    objc_copyWeak(&v35, location);
    v34 = v10;
    v28 = v11;
    v29 = v26;
    v30 = v17;
    v23 = v20;
    v31 = v23;
    v24 = v18;
    v32 = v24;
    v33 = v9;
    objc_msgSend(v21, "releasePresenceOnChannel:membershipKey:serverKey:timestamp:withChannelToken:serviceIdentifier:completion:", v28, v29, v30, v23, v24, v22, v27);

    objc_destroyWeak(&v35);
    objc_destroyWeak(location);

    v14 = v26;
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SKAPresenceManager _sendPresenceDeactivationMessageForChannel:options:completion:].cold.1((uint64_t)v14);

    +[SKAPresenceManager _keyGenerationError](SKAPresenceManager, "_keyGenerationError");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    -[SKAPresenceManager _rollChannelForCryptoFailureIfAllowed:](self, "_rollChannelForCryptoFailureIfAllowed:", v8);
    (*((void (**)(id, id))v10 + 2))(v10, v24);
  }

}

void __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 11);
  objc_msgSend(WeakRetained, "internalWorkQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_2;
  block[3] = &unk_24D976DB0;
  v8 = v3;
  v9 = WeakRetained;
  v16 = a1[10];
  v10 = a1[4];
  v11 = a1[5];
  v12 = a1[6];
  v13 = a1[7];
  v14 = a1[8];
  v15 = a1[9];
  v6 = v3;
  dispatch_async(v5, block);

}

void __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  if (!*(_QWORD *)(a1 + 32))
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Presence release completed with success.", v10, 2u);
    }

    goto LABEL_12;
  }
  v2 = objc_msgSend(*(id *)(a1 + 40), "_shouldReauthForError:");
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (!v2)
  {
    if (v4)
      __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_2_cold_2();

LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
    return;
  }
  if (v4)
    __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "accountProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_34;
  v11[3] = &unk_24D976D88;
  v6 = *(id *)(a1 + 96);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v18 = v6;
  v11[4] = v7;
  v12 = v8;
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 72);
  v16 = *(id *)(a1 + 80);
  v17 = *(id *)(a1 + 88);
  objc_msgSend(v5, "refreshCredentialForPrimaryAccountWithCompletion:", v11);

}

void __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_34(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "channelManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 80), "serviceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_35;
    v14[3] = &unk_24D976888;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = *(id *)(a1 + 88);
    objc_msgSend(v6, "releasePresenceOnChannel:membershipKey:serverKey:timestamp:withChannelToken:serviceIdentifier:completion:", v7, v8, v9, v10, v11, v12, v14);

  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_69_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }

}

void __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "internalWorkQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_2_36;
  v6[3] = &unk_24D976D60;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_2_36(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = *(_QWORD *)(a1 + 32);
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_22_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Release completed with success.", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)releaseAllPresenceAssertionsAssociatedWithClient:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalWorkQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SKAPresenceManager *v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke;
  v15[3] = &unk_24D976E50;
  objc_copyWeak(&v20, &location);
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(internalWorkQueue, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  id WeakRetained;
  id obj;
  id *from;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  _BYTE *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  from = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ((objc_msgSend(WeakRetained, "presenceEnabledByServer") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2
      && (objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = +[SKAServerBag presenceEnabledByServerForServiceIdentifier:](SKAServerBag, "presenceEnabledByServerForServiceIdentifier:", v3), v3, v2, !v4))
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_cold_1(a1 + 32, v23);

      v24 = *(_QWORD *)(a1 + 56);
      +[SKAPresenceManager _presenceDisabledError](SKAPresenceManager, "_presenceDisabledError");
      obj = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v24 + 16))(v24, obj);
    }
    else
    {
      objc_msgSend(WeakRetained, "_activePresenceAssertionsForClient:", *(_QWORD *)(a1 + 40));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(obj, "count") == 0;
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting client had no active presence assertions, not updating registered subscriptions", buf, 2u);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      else
      {
        if (v7)
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = objc_msgSend(obj, "count");
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = obj;
          _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting client had %ld presence assertion, removing presence assertions and updating registrations for channels: %@", buf, 0x16u);
        }

        objc_msgSend(WeakRetained, "activePresenceAssertionsByClient");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

        objc_msgSend(WeakRetained, "databaseManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "newBackgroundContext");

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v40 = __Block_byref_object_copy__0;
        v41 = __Block_byref_object_dispose__0;
        v42 = 0;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        obj = obj;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v35 != v12)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_msgSend(v14, "presenceIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "options");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isPersonal");

              v18 = *(void **)(a1 + 48);
              v28[0] = MEMORY[0x24BDAC760];
              v28[1] = 3221225472;
              v28[2] = __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_37;
              v28[3] = &unk_24D976E28;
              objc_copyWeak(&v33, from);
              v29 = *(id *)(a1 + 32);
              v32 = buf;
              v19 = v15;
              v20 = *(_QWORD *)(a1 + 48);
              v30 = v19;
              v31 = v20;
              objc_msgSend(v18, "findPresenceChannelForPresenceIdentifier:isPersonal:databaseContext:completion:", v19, v17, v10, v28);

              objc_destroyWeak(&v33);
            }
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v11);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        _Block_object_dispose(buf, 8);

      }
    }
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();

    v22 = *(_QWORD *)(a1 + 56);
    +[SKAPresenceManager _presenceDisabledError](SKAPresenceManager, "_presenceDisabledError");
    obj = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, obj);
  }

}

void __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_37(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (a3)
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_37_cold_1();

    +[SKAPresenceManager _noExistingAssertionError](SKAPresenceManager, "_noExistingAssertionError");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_2;
    v14[3] = &unk_24D976E00;
    v17 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v15 = v12;
    v16 = v13;
    objc_msgSend(WeakRetained, "_sendPresenceDeactivationMessageForChannel:options:completion:", v5, v11, v14);
    v10 = v15;
  }

}

void __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Completed sending deactivation message for presence identifier: %@ because of a disconnected client", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "_recalculateActivityTracking");

}

- (void)presentDevicesForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *internalWorkQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__SKAPresenceManager_presentDevicesForPresenceIdentifier_isPersonal_completion___block_invoke;
  v13[3] = &unk_24D976EC8;
  objc_copyWeak(&v16, &location);
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v17 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(internalWorkQueue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __80__SKAPresenceManager_presentDevicesForPresenceIdentifier_isPersonal_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ((objc_msgSend(WeakRetained, "presenceEnabledByServer") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "newBackgroundContext");

    objc_initWeak(&location, WeakRetained);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(unsigned __int8 *)(a1 + 64);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __80__SKAPresenceManager_presentDevicesForPresenceIdentifier_isPersonal_completion___block_invoke_39;
    v10[3] = &unk_24D976EA0;
    objc_copyWeak(&v12, &location);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(WeakRetained, "findPresenceChannelForPresenceIdentifier:isPersonal:databaseContext:completion:", v5, v6, v4, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();

    v8 = *(_QWORD *)(a1 + 48);
    v4 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    +[SKAPresenceManager _presenceDisabledError](SKAPresenceManager, "_presenceDisabledError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v4, v9);

  }
}

void __80__SKAPresenceManager_presentDevicesForPresenceIdentifier_isPersonal_completion___block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  NSObject **v9;
  id v10;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[10];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__SKAPresenceManager_presentDevicesForPresenceIdentifier_isPersonal_completion___block_invoke_2;
    block[3] = &unk_24D976E78;
    v8 = v3;
    v9 = v5;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

  }
}

void __80__SKAPresenceManager_presentDevicesForPresenceIdentifier_isPersonal_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_activePresentDevicesForChannel:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "presentDevicesForPresenceIdentifier returning %lu devices", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "No channel currently exists, so returning empty set of present devices", (uint8_t *)&v7, 2u);
    }

    v6 = *(_QWORD *)(a1 + 48);
    v2 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v2, 0);
  }

}

- (void)channelReceivedIncomingPayloadUpdate:(id)a3 channel:(id)a4 withIdentifier:(unint64_t)a5
{
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  ChannelActivityUpdate *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  ChannelActivityUpdate *v16;
  id v17;
  unint64_t v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = -[SKAPresenceManager presenceEnabledByServer](self, "presenceEnabledByServer");
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (ChannelActivityUpdate *)v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_2188DF000, &v12->super.super, OS_LOG_TYPE_DEFAULT, "Received incoming payload on channel %@", buf, 0xCu);
    }

    v12 = -[ChannelActivityUpdate initWithData:]([ChannelActivityUpdate alloc], "initWithData:", v8);
    if (v12)
    {
      -[SKAPresenceManager payloadUpdateProcessingQueue](self, "payloadUpdateProcessingQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __82__SKAPresenceManager_channelReceivedIncomingPayloadUpdate_channel_withIdentifier___block_invoke;
      v15[3] = &unk_24D976EF0;
      v15[4] = self;
      v12 = v12;
      v16 = v12;
      v17 = v9;
      v18 = a5;
      dispatch_async(v13, v15);

    }
    else
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SKAPresenceManager channelReceivedIncomingPayloadUpdate:channel:withIdentifier:].cold.1();

    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
  }

}

void __82__SKAPresenceManager_channelReceivedIncomingPayloadUpdate_channel_withIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "internalWorkQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__SKAPresenceManager_channelReceivedIncomingPayloadUpdate_channel_withIdentifier___block_invoke_2;
  v6[3] = &unk_24D976EF0;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8 = v4;
  v9 = v5;
  dispatch_async(v2, v6);

}

uint64_t __82__SKAPresenceManager_channelReceivedIncomingPayloadUpdate_channel_withIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleIncomingPayloadUpdate:onChannel:withIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_handleIncomingPayloadUpdate:(id)a3 onChannel:(id)a4 withIdentifier:(unint64_t)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  SKAPresenceEncryptionKey *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  ChannelActivityUpdatePayload *v20;
  NSObject *p_super;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  unint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  char v44;
  _BOOL4 v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  unint64_t v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  id v61;
  NSObject *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  SKAPresenceManager *v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint8_t v80[128];
  uint8_t buf[4];
  unint64_t v82;
  __int16 v83;
  unint64_t v84;
  __int16 v85;
  unint64_t v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = -[SKAPresenceManager _currentCheckpointForChannel:](self, "_currentCheckpointForChannel:", v9);
  v11 = objc_msgSend(v8, "prevVersion");
  v12 = objc_msgSend(v8, "currentVersion");
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v82 = a5;
    v83 = 2048;
    v84 = v11;
    v85 = 2048;
    v86 = v12;
    _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Handling payload update %lu with lastCheckpoint %lld and previous checkpoint %lld", buf, 0x20u);
  }

  if (v10 == v11)
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v15 = "Last checkpoint matches current checkpoint -- not polling";
    goto LABEL_6;
  }
  if (!v11)
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12 <= v10)
    {
      if (v45)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Payload last checkpoint is 0 with older updates -- dropping", buf, 2u);
      }
      goto LABEL_80;
    }
    if (!v45)
    {
LABEL_7:

      -[SKAPresenceManager _setCheckpointForChannel:checkpoint:](self, "_setCheckpointForChannel:checkpoint:", v9, v12);
      objc_msgSend(v8, "encryptedUpdatePayload");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[SKAPresenceManager logger](SKAPresenceManager, "logger");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:].cold.1();
        goto LABEL_79;
      }
      v16 = [SKAPresenceEncryptionKey alloc];
      objc_msgSend(v9, "presenceServerKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[SKAPresenceEncryptionKey initWithKeyMaterial:](v16, "initWithKeyMaterial:", v17);

      if (!v18)
      {
        +[SKAPresenceManager logger](SKAPresenceManager, "logger");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:].cold.2();
        goto LABEL_78;
      }
      -[NSObject decryptPayload:](v18, "decryptPayload:", v14);
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[SKAPresenceManager logger](SKAPresenceManager, "logger");
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:].cold.3();
        goto LABEL_77;
      }
      v20 = -[ChannelActivityUpdatePayload initWithData:]([ChannelActivityUpdatePayload alloc], "initWithData:", v19);
      p_super = &v20->super.super;
      if (!v20)
      {
        +[SKAPresenceManager logger](SKAPresenceManager, "logger");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:].cold.4();
        goto LABEL_76;
      }
      -[ChannelActivityUpdatePayload participantPayloads](v20, "participantPayloads");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = p_super;
      v24 = v22;
      if (!v22)
      {
        v49 = v23;
        +[SKAPresenceManager logger](SKAPresenceManager, "logger");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:].cold.5();
        v47 = 0;
        p_super = v49;
        goto LABEL_75;
      }
      v61 = v8;
      v62 = v23;
      v58 = v19;
      v59 = v18;
      v60 = v14;
      v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v57 = v24;
      v26 = v24;
      v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v72;
        while (2)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v72 != v29)
              objc_enumerationMutation(v26);
            -[SKAPresenceManager _presentDeviceFromPayload:onChannel:](self, "_presentDeviceFromPayload:onChannel:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i), v9, v57);
            v31 = objc_claimAutoreleasedReturnValue();
            if (!v31)
            {
              +[SKAPresenceManager logger](SKAPresenceManager, "logger");
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:].cold.7();

              goto LABEL_73;
            }
            v32 = (void *)v31;
            -[NSObject addObject:](v25, "addObject:", v31);

          }
          v28 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
          if (v28)
            continue;
          break;
        }
      }

      p_super = v62;
      v33 = -[NSObject updateType](v62, "updateType");
      if (v10 != v11)
      {
        +[SKAPresenceManager logger](SKAPresenceManager, "logger");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2188DF000, v34, OS_LOG_TYPE_DEFAULT, "The last checkpoint was 0, so we're clearing any previously present devices before adding the new one", buf, 2u);
        }

        -[SKAPresenceManager _clearPresentDevicesForChannel:](self, "_clearPresentDevicesForChannel:", v9);
        p_super = v62;
      }
      if (v33 == 1)
      {
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v25 = v25;
        v50 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v64;
          do
          {
            for (j = 0; j != v51; ++j)
            {
              if (*(_QWORD *)v64 != v52)
                objc_enumerationMutation(v25);
              v54 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
              +[SKAPresenceManager logger](SKAPresenceManager, "logger", v57);
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v82 = v54;
                v83 = 2112;
                v84 = (unint64_t)v9;
                _os_log_impl(&dword_2188DF000, v55, OS_LOG_TYPE_DEFAULT, "Removing device %@ from channel %@", buf, 0x16u);
              }

              -[SKAPresenceManager _removePresentDeviceForChannel:presentDevice:](self, "_removePresentDeviceForChannel:presentDevice:", v9, v54);
            }
            v51 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
          }
          while (v51);
        }
      }
      else
      {
        if (v33)
        {
          +[SKAPresenceManager logger](SKAPresenceManager, "logger");
          v56 = objc_claimAutoreleasedReturnValue();
          v14 = v60;
          v8 = v61;
          v18 = v59;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:].cold.6();

          v19 = v58;
LABEL_74:
          v47 = v57;
LABEL_75:

LABEL_76:
LABEL_77:

LABEL_78:
LABEL_79:

LABEL_80:
          goto LABEL_81;
        }
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v25 = v25;
        v35 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v68;
          do
          {
            for (k = 0; k != v36; ++k)
            {
              if (*(_QWORD *)v68 != v37)
                objc_enumerationMutation(v25);
              v39 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k);
              +[SKAPresenceManager logger](SKAPresenceManager, "logger", v57);
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v82 = v39;
                v83 = 2112;
                v84 = (unint64_t)v9;
                _os_log_impl(&dword_2188DF000, v40, OS_LOG_TYPE_DEFAULT, "Adding device %@ to channel %@", buf, 0x16u);
              }

              -[SKAPresenceManager _addPresentDeviceForChannel:presentDevice:](self, "_addPresentDeviceForChannel:presentDevice:", v9, v39);
            }
            v36 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
          }
          while (v36);
        }
      }

      -[SKAPresenceManager _presentDevicesChangedForChannel:](self, "_presentDevicesChangedForChannel:", v9);
LABEL_73:
      v14 = v60;
      v8 = v61;
      v19 = v58;
      v18 = v59;
      p_super = v62;
      goto LABEL_74;
    }
    *(_WORD *)buf = 0;
    v15 = "Payload last checkpoint is 0 with newer updates -- not polling";
LABEL_6:
    _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    goto LABEL_7;
  }
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v82 = v11;
    v83 = 2048;
    v84 = v10;
    _os_log_impl(&dword_2188DF000, v41, OS_LOG_TYPE_DEFAULT, "Last checkpoint does not match current checkpoint -- polling because we missed something. Payload last checkpoint: %lld ; Current saved checkpoint: %lld ",
      buf,
      0x16u);
  }

  -[SKAPresenceManager subscriptionManager](self, "subscriptionManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v42, "activePresenceSubscriptionAssertionsExistForChannelIdentifier:", v43);

  if ((v44 & 1) != 0)
  {
    -[SKAPresenceManager _setCheckpointForChannel:checkpoint:](self, "_setCheckpointForChannel:checkpoint:", v9, v12);
    v75[0] = MEMORY[0x24BDAC760];
    v75[1] = 3221225472;
    v75[2] = __76__SKAPresenceManager__handleIncomingPayloadUpdate_onChannel_withIdentifier___block_invoke;
    v75[3] = &unk_24D976BF8;
    v76 = v9;
    v77 = self;
    -[SKAPresenceManager _sendPollingMessageForChannel:completion:](self, "_sendPollingMessageForChannel:completion:", v76, v75);

  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v46, OS_LOG_TYPE_DEFAULT, "We want to poll but we currently have no connected clients with an active subscription.  Resetting state and dropping payload", buf, 2u);
    }

    -[SKAPresenceManager _clearPresentDevicesForChannel:](self, "_clearPresentDevicesForChannel:", v9);
  }
LABEL_81:

}

void __76__SKAPresenceManager__handleIncomingPayloadUpdate_onChannel_withIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __51__SKAPresenceManager_sendPollingMessageForChannel___block_invoke_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Updating active particpants for channel %@  based on polling response", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_handleBulkUpdateParticipantPayloads:forChannel:", v5, *(_QWORD *)(a1 + 32));
  }

}

- (void)findOrCreatePresenceChannelForPresenceIdentifier:(id)a3 options:(id)a4 databaseContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *internalWorkQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke;
  v19[3] = &unk_24D976E50;
  objc_copyWeak(&v24, &location);
  v20 = v11;
  v21 = v10;
  v22 = v12;
  v23 = v13;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  v18 = v13;
  dispatch_async(internalWorkQueue, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ((objc_msgSend(WeakRetained, "presenceEnabledByServer") & 1) == 0)
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();

    v14 = *(_QWORD *)(a1 + 56);
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[SKAServerBag presenceEnabledByServerForServiceIdentifier:](SKAServerBag, "presenceEnabledByServerForServiceIdentifier:", v5);

    if (!v6)
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_cold_1(a1 + 32, v15);

      v14 = *(_QWORD *)(a1 + 56);
LABEL_13:
      +[SKAPresenceManager _presenceDisabledError](SKAPresenceManager, "_presenceDisabledError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v12);
      goto LABEL_14;
    }
  }
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Finding channel for presence identifier %@", buf, 0xCu);
  }

  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_43;
  v16[3] = &unk_24D976338;
  v11 = *(_QWORD *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  objc_msgSend(WeakRetained, "_findOrCreatePresenceChannelForPresenceIdentifier:options:databaseContext:completion:", v9, v10, v11, v16);
  v12 = v17;
LABEL_14:

}

uint64_t __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)findPresenceChannelForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *channelFetchQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  channelFetchQueue = self->_channelFetchQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __101__SKAPresenceManager_findPresenceChannelForPresenceIdentifier_isPersonal_databaseContext_completion___block_invoke;
  v17[3] = &unk_24D976EC8;
  objc_copyWeak(&v21, &location);
  v19 = v11;
  v20 = v12;
  v22 = a4;
  v18 = v10;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(channelFetchQueue, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __101__SKAPresenceManager_findPresenceChannelForPresenceIdentifier_isPersonal_databaseContext_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ((objc_msgSend(WeakRetained, "presenceEnabledByServer") & 1) != 0)
  {
    v3 = *(unsigned __int8 *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __101__SKAPresenceManager_findPresenceChannelForPresenceIdentifier_isPersonal_databaseContext_completion___block_invoke_44;
    v9[3] = &unk_24D976338;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(WeakRetained, "_findPresenceChannelForPresenceIdentifier:isPersonal:databaseContext:completion:", v4, v3, v5, v9);
    v6 = v10;
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();

    v8 = *(_QWORD *)(a1 + 48);
    +[SKAPresenceManager _presenceDisabledError](SKAPresenceManager, "_presenceDisabledError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v6);
  }

}

uint64_t __101__SKAPresenceManager_findPresenceChannelForPresenceIdentifier_isPersonal_databaseContext_completion___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createPresenceChannelForPresenceIdentifier:(id)a3 options:(id)a4 databaseContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *internalWorkQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  SKAPresenceManager *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke;
  block[3] = &unk_24D976D38;
  objc_copyWeak(&v25, &location);
  v23 = v12;
  v24 = v13;
  v20 = v11;
  v21 = self;
  v22 = v10;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  v18 = v13;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke(id *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained(a1 + 9);
  if ((objc_msgSend(WeakRetained, "presenceEnabledByServer") & 1) == 0)
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();

    v10 = (void (**)(id, _QWORD, void *))a1[8];
    goto LABEL_13;
  }
  objc_msgSend(a1[4], "serviceIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(a1[4], "serviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[SKAServerBag presenceEnabledByServerForServiceIdentifier:](SKAServerBag, "presenceEnabledByServerForServiceIdentifier:", v5);

    if (!v6)
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_cold_1((uint64_t)(a1 + 4), v11);

      v10 = (void (**)(id, _QWORD, void *))a1[8];
LABEL_13:
      +[SKAPresenceManager _presenceDisabledError](SKAPresenceManager, "_presenceDisabledError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v12);

      goto LABEL_14;
    }
  }
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "CreateChannel: Creating a presence channel", buf, 2u);
  }

  objc_msgSend(a1[5], "channelFetchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_45;
  block[3] = &unk_24D976F40;
  block[4] = WeakRetained;
  v14 = a1[6];
  v15 = a1[4];
  v16 = a1[7];
  v17 = a1[8];
  dispatch_async(v8, block);

LABEL_14:
}

void __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_45(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  NSObject *v16;
  id v17;

  v2 = dispatch_semaphore_create(0);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_2;
  v15 = &unk_24D976F18;
  v7 = v2;
  v16 = v7;
  v17 = *(id *)(a1 + 64);
  objc_msgSend(v4, "_createPresenceChannelForPresenceIdentifier:options:databaseContext:completion:", v3, v5, v6, &v12);
  v8 = dispatch_time(0, 20000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger", v12, v13, v14, v15, v16);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_45_cold_1();

    v10 = *(_QWORD *)(a1 + 64);
    +[SKAPresenceManager _channelCreationTimeoutError](SKAPresenceManager, "_channelCreationTimeoutError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

  }
}

void __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a2;
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "CreateChannel: Presence channel created", v8, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_presentDevicesChangedForChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  id WeakRetained;
  void *v23;
  SKAPresenceManager *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  SKAPresenceManager *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "presenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPresenceManager _activePresenceAssertionForPresenceIdentifier:](self, "_activePresenceAssertionForPresenceIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v24 = self;
    -[SKAPresenceManager _activePresentDevicesForChannel:](self, "_activePresentDevicesForChannel:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v4;
      _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Looking for self device in channel: %@", buf, 0xCu);
    }
    v25 = v4;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v7;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          +[SKAPresenceManager logger](SKAPresenceManager, "logger");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v14;
            _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Present device: %@", buf, 0xCu);
          }

          if ((objc_msgSend(v14, "isSelfDevice") & 1) != 0)
          {
            v18 = v9;
            self = v24;
            v4 = v25;
            goto LABEL_23;
          }
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v11)
          continue;
        break;
      }
    }

    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    v4 = v25;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SKAPresenceManager _presentDevicesChangedForChannel:].cold.3();

    self = v24;
    v17 = -[SKAPresenceManager _shouldReassert](v24, "_shouldReassert");
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
        -[SKAPresenceManager _presentDevicesChangedForChannel:].cold.1();

      -[SKAPresenceManager _markReassert](v24, "_markReassert");
      objc_msgSend(v25, "presenceIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKAPresenceManager _currentPayloadForPresenceIdentifier:](v24, "_currentPayloadForPresenceIdentifier:", v20);
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "options");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __55__SKAPresenceManager__presentDevicesChangedForChannel___block_invoke;
      v26[3] = &unk_24D976F68;
      v27 = v25;
      v28 = v24;
      -[SKAPresenceManager _sendPresenceAssertionMessageForChannel:withPayload:options:isRefresh:completion:](v24, "_sendPresenceAssertionMessageForChannel:withPayload:options:isRefresh:completion:", v27, v18, v21, 1, v26);

    }
    else if (v19)
    {
      -[SKAPresenceManager _presentDevicesChangedForChannel:].cold.2();
    }
LABEL_23:

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "presenceIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "presenceManager:didReceivePresentDevicesUpdateForPresenceIdentifier:", self, v23);

}

void __55__SKAPresenceManager__presentDevicesChangedForChannel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __55__SKAPresenceManager__presentDevicesChangedForChannel___block_invoke_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Updating active particpants for channel %@ following reassert", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_handleBulkUpdateParticipantPayloads:forChannel:", v5, *(_QWORD *)(a1 + 32));
  }

}

- (unint64_t)_currentCheckpointForChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  -[SKAPresenceManager databaseManager](self, "databaseManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newBackgroundContext");

  -[SKAPresenceManager databaseManager](self, "databaseManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "currentCheckpointForChannel:databaseContext:", v4, v6);

  return v8;
}

- (void)_setCheckpointForChannel:(id)a3 checkpoint:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SKAPresenceManager databaseManager](self, "databaseManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newBackgroundContext");

  -[SKAPresenceManager databaseManager](self, "databaseManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "setCurrentCheckpointForChannel:checkpoint:databaseContext:", v6, a4, v8);

  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218498;
    v13 = a4;
    v14 = 2112;
    v15 = v6;
    v16 = 1024;
    v17 = v10;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Updated checkpoint to %lld on channel %@ with result %d", (uint8_t *)&v12, 0x1Cu);
  }

}

- (BOOL)_addPresenceAssertionForClient:(id)a3 presenceIdentifier:(id)a4 options:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  SKAPresenceAssertion *v24;
  BOOL v25;
  NSObject *v26;
  __int128 v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v31 = a5;
  v30 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalWorkQueue);
  v29 = v10;
  -[SKAPresenceManager _activePresenceAssertionsForClient:](self, "_activePresenceAssertionsForClient:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (!v13)
    goto LABEL_18;
  v15 = v13;
  v16 = 0;
  v17 = *(_QWORD *)v33;
  *(_QWORD *)&v14 = 138412802;
  v28 = v14;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v33 != v17)
        objc_enumerationMutation(v12);
      v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      objc_msgSend(v19, "presenceIdentifier", v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isEqualToString:", v11) & 1) != 0)
      {
        objc_msgSend(v19, "options");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqual:", v31);

        if (v22)
        {
          +[SKAPresenceManager logger](SKAPresenceManager, "logger");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v28;
            v37 = v11;
            v38 = 2112;
            v39 = v29;
            v40 = 2112;
            v41 = v19;
            _os_log_impl(&dword_2188DF000, v23, OS_LOG_TYPE_DEFAULT, "Found an existing presence assertion for \"%@\" and client: %@. ExistingAssertion: %@", buf, 0x20u);
          }

          objc_msgSend(v19, "setPayload:", v30);
          v16 = 1;
        }
      }
      else
      {

      }
    }
    v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  }
  while (v15);
  if ((v16 & 1) != 0)
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v24 = (SKAPresenceAssertion *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, &v24->super, OS_LOG_TYPE_DEFAULT, "Not creating a new presence assertion, one already exists.", buf, 2u);
    }
    v25 = 0;
  }
  else
  {
LABEL_18:
    v24 = -[SKAPresenceAssertion initWithPresenceIdentifier:options:payload:]([SKAPresenceAssertion alloc], "initWithPresenceIdentifier:options:payload:", v11, v31, v30);
    objc_msgSend(v12, "addObject:", v24);
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v11;
      v38 = 2112;
      v39 = v31;
      _os_log_impl(&dword_2188DF000, v26, OS_LOG_TYPE_DEFAULT, "Successfully added presence assertion to in memory model for presennce identifier: %@ options: %@", buf, 0x16u);
    }

    v25 = 1;
  }

  return v25;
}

- (BOOL)_removePresenceAssertionForClient:(id)a3 presenceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalWorkQueue);
  -[SKAPresenceManager _activePresenceAssertionsForClient:](self, "_activePresenceAssertionsForClient:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __75__SKAPresenceManager__removePresenceAssertionForClient_presenceIdentifier___block_invoke;
  v20 = &unk_24D976F90;
  v10 = v7;
  v21 = v10;
  v11 = v9;
  v22 = v11;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v17);
  v12 = objc_msgSend(v11, "count", v17, v18, v19, v20);
  if (v12)
  {
    v13 = objc_msgSend(v8, "count");
    objc_msgSend(v8, "removeObjectsAtIndexes:", v11);
    v14 = objc_msgSend(v8, "count");
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v24 = v10;
      v25 = 2048;
      v26 = v13;
      v27 = 2048;
      v28 = v14;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Succesfully removed presence assertion for identifier: %@. Client had %ld presence assertions, now has %ld. Client: %@", buf, 0x2Au);
    }
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v10;
      v25 = 2112;
      v26 = (uint64_t)v8;
      v27 = 2112;
      v28 = (uint64_t)v6;
      _os_log_error_impl(&dword_2188DF000, v15, OS_LOG_TYPE_ERROR, "Could not find presence assertion for subscription identifier: \"%@\". Active presence assertions: %@ for client: %@", buf, 0x20u);
    }
  }

  return v12 != 0;
}

void __75__SKAPresenceManager__removePresenceAssertionForClient_presenceIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "presenceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
}

- (id)_activePresenceAssertionsForClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalWorkQueue);
  -[NSMapTable objectForKey:](self->_activePresenceAssertionsByClient, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    -[NSMapTable setObject:forKey:](self->_activePresenceAssertionsByClient, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (BOOL)_addPresentDeviceForChannel:(id)a3 presentDevice:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  void *v26;
  SKAPresenceManager *v27;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKAPresenceManager _activePresentDevicesForChannel:](self, "_activePresentDevicesForChannel:", v6);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (!v8)
  {
    v10 = 0;
LABEL_19:
    objc_msgSend(obj, "addObject:", v7);
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
LABEL_22:
      v23 = 1;
      goto LABEL_23;
    }
    objc_msgSend(v6, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v24;
    _os_log_impl(&dword_2188DF000, v22, OS_LOG_TYPE_DEFAULT, "Successfully added present device to in memory model for channel identifier: %@", buf, 0xCu);
LABEL_21:

    goto LABEL_22;
  }
  v9 = v8;
  v27 = self;
  v28 = v6;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      objc_msgSend(v14, "deviceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if (v17)
      {
        +[SKAPresenceManager logger](SKAPresenceManager, "logger");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v28, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "deviceIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v35 = v19;
          v36 = 2112;
          v37 = v20;
          _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Found an existing present device for channel: %@ and device:%@", buf, 0x16u);

        }
        v21 = v14;

        v11 = 1;
        v10 = v21;
      }
    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  }
  while (v9);
  if ((v11 & 1) == 0)
  {
    v6 = v28;
    goto LABEL_19;
  }
  if ((objc_msgSend(v10, "isEqual:", v7) & 1) == 0)
  {
    v6 = v28;
    -[SKAPresenceManager _removePresentDeviceForChannel:presentDevice:](v27, "_removePresentDeviceForChannel:presentDevice:", v28, v10);
    objc_msgSend(obj, "addObject:", v7);
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    objc_msgSend(v28, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v35 = v24;
    v36 = 2112;
    v37 = v26;
    _os_log_impl(&dword_2188DF000, v22, OS_LOG_TYPE_DEFAULT, "Updated existing present device for channel: %@ and device:%@", buf, 0x16u);

    goto LABEL_21;
  }
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v22 = objc_claimAutoreleasedReturnValue();
  v6 = v28;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v22, OS_LOG_TYPE_DEFAULT, "Not creating a new present device, one already exists.", buf, 2u);
  }
  v23 = 0;
LABEL_23:

  return v23;
}

- (BOOL)_removePresentDeviceForChannel:(id)a3 presentDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKAPresenceManager _activePresentDevicesForChannel:](self, "_activePresentDevicesForChannel:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __67__SKAPresenceManager__removePresentDeviceForChannel_presentDevice___block_invoke;
  v21 = &unk_24D976FB8;
  v10 = v7;
  v22 = v10;
  v11 = v9;
  v23 = v11;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v18);
  v12 = objc_msgSend(v11, "count", v18, v19, v20, v21);
  if (v12)
  {
    v13 = objc_msgSend(v8, "count");
    objc_msgSend(v8, "removeObjectsAtIndexes:", v11);
    v14 = objc_msgSend(v8, "count");
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v16;
      v26 = 2048;
      v27 = v13;
      v28 = 2048;
      v29 = v14;
      _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Succesfully removed present devices for identifier: %@. Channel had %ld presence assertions, now has %ld", buf, 0x20u);

    }
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SKAPresenceManager _removePresentDeviceForChannel:presentDevice:].cold.1(v6, (uint64_t)v8, v15);
  }

  return v12 != 0;
}

void __67__SKAPresenceManager__removePresentDeviceForChannel_presentDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v7, "isEqualToString:", v8);
  if ((_DWORD)v6)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
}

- (id)_activePresentDevicesForChannel:(id)a3
{
  id v4;
  NSMapTable *activeParticipantsByChannel;
  void *v6;
  id v7;
  NSMapTable *v8;
  void *v9;

  v4 = a3;
  activeParticipantsByChannel = self->_activeParticipantsByChannel;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](activeParticipantsByChannel, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v8 = self->_activeParticipantsByChannel;
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v8, "setObject:forKey:", v7, v9);

  }
  return v7;
}

- (void)_clearPresentDevicesForChannel:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSMapTable *activeParticipantsByChannel;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Clearing present devices for channel: %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  activeParticipantsByChannel = self->_activeParticipantsByChannel;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](activeParticipantsByChannel, "setObject:forKey:", v6, v8);

}

- (id)_sortAndDedupePresenceIdentifiers:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithArray:", v4);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", 0, 1, sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_recalculateActivityTracking
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = -[SKAPresenceManager _activePresenceAssertionsExist](self, "_activePresenceAssertionsExist");
  -[SKAPresenceManager channelManager](self, "channelManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "enableActivityTracking");
  else
    objc_msgSend(v4, "disableActivityTracking");

}

- (BOOL)_activePresenceAssertionsExist
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_activePresenceAssertionsByClient, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "count"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_activePresenceAssertionForPresenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSMapTable objectEnumerator](self->_activePresenceAssertionsByClient, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v6 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v14, "presenceIdentifier", v19);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v4);

              if ((v16 & 1) != 0)
              {
                v17 = v14;

                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v19;
      }
      v17 = 0;
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)_currentPayloadForPresenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSMapTable objectEnumerator](self->_activePresenceAssertionsByClient, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v6 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v14, "presenceIdentifier", v19);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v4);

              if ((v16 & 1) != 0)
              {
                objc_msgSend(v14, "payload");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_18;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v19;
      }
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1070]), "initWithData:", 0);
LABEL_18:

  return v17;
}

- (void)_findOrCreatePresenceChannelForPresenceIdentifier:(id)a3 options:(id)a4 databaseContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *channelFetchQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  channelFetchQueue = self->_channelFetchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke;
  block[3] = &unk_24D976F40;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(channelFetchQueue, block);

}

void __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_semaphore_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[16];

  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v2, OS_LOG_TYPE_DEFAULT, "CreateChannel: Proceeding to find/create a presence channel", buf, 2u);
  }

  v3 = dispatch_semaphore_create(0);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(*(id *)(a1 + 48), "isPersonal");
  v7 = *(_QWORD *)(a1 + 56);
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_56;
  v17[3] = &unk_24D977058;
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 32);
  v18 = v9;
  v19 = v10;
  v23 = *(id *)(a1 + 64);
  v20 = *(id *)(a1 + 40);
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_findPresenceChannelForPresenceIdentifier:isPersonal:databaseContext:completion:", v5, v6, v7, v17);
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "CreateChannel: Waiting for channel creation completion", buf, 2u);
  }

  v12 = dispatch_time(0, 20000000000);
  if (dispatch_semaphore_wait(v9, v12))
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_cold_1();

    v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_60;
    block[3] = &unk_24D977080;
    v16 = *(id *)(a1 + 64);
    dispatch_async(v14, block);

  }
}

void __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  id *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint8_t buf[16];

  v3 = a2;
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "CreateChannel: Found an existing presence channel", buf, 2u);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_57;
    block[3] = &unk_24D976FE0;
    v7 = &v22;
    v22 = *(id *)(a1 + 72);
    v8 = &v21;
    v21 = v3;
    dispatch_async(v6, block);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "CreateChannel: Could not find an existing presence channel, attempting to create a new one.", buf, 2u);
    }

    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v11 = *(void **)(a1 + 64);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_58;
    v16[3] = &unk_24D977030;
    v7 = &v17;
    v13 = v11;
    v17 = v13;
    v8 = (id *)v18;
    v14 = *(id *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v18[0] = v14;
    v18[1] = v15;
    v19 = *(id *)(a1 + 72);
    objc_msgSend(v9, "_createPresenceChannelForPresenceIdentifier:options:databaseContext:completion:", v10, v12, v13, v16);

  }
}

uint64_t __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[8];
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v7 = *(void **)(a1 + 32);
    v18 = 0;
    objc_msgSend(v7, "save:", &v18);
  }
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "CreateChannel: Finished creating a presence channel", buf, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  v9 = *(void **)(a1 + 56);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 80);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_59;
  block[3] = &unk_24D977008;
  v15 = v6;
  v16 = v9;
  v14 = v5;
  v11 = v6;
  v12 = v5;
  dispatch_async(v10, block);

}

uint64_t __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_59(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_60(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[SKAPresenceManager _channelCreationTimeoutError](SKAPresenceManager, "_channelCreationTimeoutError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)_findPresenceChannelForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(id, void *, _QWORD);

  v7 = a4;
  v16 = (void (**)(id, void *, _QWORD))a6;
  v10 = a5;
  v11 = a3;
  -[SKAPresenceManager channelFetchQueue](self, "channelFetchQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SKAPresenceManager databaseManager](self, "databaseManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "existingChannelForPresenceIdentifier:isPersonal:databaseContext:", v11, v7, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v16[2](v16, v14, 0);
  }
  else
  {
    +[SKAPresenceManager _noExistingChannelError](SKAPresenceManager, "_noExistingChannelError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v16)[2](v16, 0, v15);

  }
}

- (void)_createPresenceChannelForPresenceIdentifier:(id)a3 options:(id)a4 databaseContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SKAPresenceMembershipKey *v14;
  SKAPresenceEncryptionKey *v15;
  SKAPresenceEncryptionKey *v16;
  SKAPresenceEncryptionKey *v17;
  void *v18;
  SKAPresenceEncryptionKey *v19;
  void *v20;
  SKAPresenceEncryptionKey *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  SKAPresenceMembershipKey *v31;
  SKAPresenceEncryptionKey *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  SKAPresenceManager *v39;
  id v40;
  id v41;
  _BYTE location[12];
  __int16 v43;
  SKAPresenceEncryptionKey *v44;
  __int16 v45;
  SKAPresenceEncryptionKey *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_channelFetchQueue);
  v14 = -[SKAPresenceMembershipKey initWithNewKeyMaterial]([SKAPresenceMembershipKey alloc], "initWithNewKeyMaterial");
  v15 = -[SKAPresenceEncryptionKey initWithNewKeyMaterial]([SKAPresenceEncryptionKey alloc], "initWithNewKeyMaterial");
  v16 = -[SKAPresenceEncryptionKey initWithNewKeyMaterial]([SKAPresenceEncryptionKey alloc], "initWithNewKeyMaterial");
  v17 = v16;
  if (v14 && v15 && v16)
  {
    -[SKAPresenceMembershipKey privateKeyMaterial](v14, "privateKeyMaterial");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAPresenceEncryptionKey keyMaterial](v15, "keyMaterial");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAPresenceEncryptionKey keyMaterial](v17, "keyMaterial");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && v29 && v28)
    {
      objc_initWeak((id *)location, self);
      -[SKAPresenceManager channelManager](self, "channelManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serviceIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke;
      v30[3] = &unk_24D977148;
      objc_copyWeak(&v41, (id *)location);
      v31 = v14;
      v19 = v15;
      v20 = v11;
      v21 = v19;
      v32 = v19;
      v25 = v20;
      v33 = v20;
      v40 = v13;
      v34 = v10;
      v35 = v28;
      v36 = v29;
      v37 = v18;
      v38 = v12;
      v39 = self;
      objc_msgSend(v27, "createPresenceChannelWithMembershipKey:serverKey:serviceIdentifier:completion:", v31, v21, v26, v30);

      v11 = v25;
      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)location);
    }
    else
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[SKAPresenceManager _createPresenceChannelForPresenceIdentifier:options:databaseContext:completion:].cold.1();

      +[SKAPresenceManager _keyGenerationError](SKAPresenceManager, "_keyGenerationError");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v24);

    }
  }
  else
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = v14;
      v43 = 2112;
      v44 = v15;
      v45 = 2112;
      v46 = v17;
      _os_log_error_impl(&dword_2188DF000, v22, OS_LOG_TYPE_ERROR, "_sendPresenceDeactivationMessageForChannel - Failed to create one or more required crypto keys. membershipKey %@ serverKey %@ peerKey %@", location, 0x20u);
    }

    +[SKAPresenceManager _keyGenerationError](SKAPresenceManager, "_keyGenerationError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v18);
  }

}

void __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(WeakRetained, "internalWorkQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_2;
  v17[3] = &unk_24D977120;
  v18 = v9;
  v19 = WeakRetained;
  v20 = *(id *)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v22 = *(id *)(a1 + 48);
  v31 = *(id *)(a1 + 104);
  v23 = *(id *)(a1 + 56);
  v24 = *(id *)(a1 + 64);
  v25 = *(id *)(a1 + 72);
  v26 = *(id *)(a1 + 80);
  v12 = *(id *)(a1 + 88);
  v13 = *(_QWORD *)(a1 + 96);
  v27 = v12;
  v28 = v13;
  v29 = v7;
  v30 = v8;
  v14 = v8;
  v15 = v7;
  v16 = v9;
  dispatch_async(v11, v17);

}

void __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    if (objc_msgSend(v2, "_shouldReauthForError:"))
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_1();

      objc_msgSend(*(id *)(a1 + 40), "accountProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_61;
      v14[3] = &unk_24D9770F8;
      v6 = *(void **)(a1 + 48);
      v14[4] = *(_QWORD *)(a1 + 40);
      v15 = v6;
      v16 = *(id *)(a1 + 56);
      v17 = *(id *)(a1 + 64);
      v25 = *(id *)(a1 + 136);
      v18 = *(id *)(a1 + 32);
      v19 = *(id *)(a1 + 72);
      v20 = *(id *)(a1 + 80);
      v21 = *(id *)(a1 + 88);
      v22 = *(id *)(a1 + 96);
      v7 = *(id *)(a1 + 104);
      v8 = *(_QWORD *)(a1 + 112);
      v23 = v7;
      v24 = v8;
      objc_msgSend(v5, "refreshCredentialForPrimaryAccountWithCompletion:", v14);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 136) + 16))();
    }
  }
  else
  {
    objc_msgSend(v2, "channelManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serverTime");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "databaseManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createPresenceChannelForPresenceIdentifier:channelIdentifier:channelToken:peerKey:serverKey:membershipKey:creationDate:options:databaseContext:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), v13, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 104));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presenceManager:didCreateChannel:", *(_QWORD *)(a1 + 112), v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 136) + 16))();
  }
}

void __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_61(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id buf[2];

  v5 = a3;
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Account refresh succeeded, reattempting channel creation", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "channelManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "serviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_62;
    v14[3] = &unk_24D9770D0;
    objc_copyWeak(&v24, buf);
    v23 = *(id *)(a1 + 120);
    v15 = *(id *)(a1 + 64);
    v16 = *(id *)(a1 + 72);
    v17 = *(id *)(a1 + 80);
    v18 = *(id *)(a1 + 88);
    v19 = *(id *)(a1 + 96);
    v20 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 104);
    v13 = *(_QWORD *)(a1 + 112);
    v21 = v12;
    v22 = v13;
    objc_msgSend(v8, "createPresenceChannelWithMembershipKey:serverKey:serviceIdentifier:completion:", v9, v10, v11, v14);

    objc_destroyWeak(&v24);
    objc_destroyWeak(buf);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_69_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 120) + 16))();
  }

}

void __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_62(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  objc_msgSend(WeakRetained, "internalWorkQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_2_63;
  block[3] = &unk_24D9770A8;
  v18 = v9;
  v30 = *(id *)(a1 + 96);
  v19 = *(id *)(a1 + 32);
  v20 = WeakRetained;
  v21 = *(id *)(a1 + 40);
  v22 = v7;
  v23 = v8;
  v24 = *(id *)(a1 + 48);
  v25 = *(id *)(a1 + 56);
  v26 = *(id *)(a1 + 64);
  v27 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 88);
  v28 = v12;
  v29 = v13;
  v14 = v8;
  v15 = v7;
  v16 = v9;
  dispatch_async(v11, block);

}

void __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_2_63(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 128) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "channelManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "serverTime");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "databaseManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createPresenceChannelForPresenceIdentifier:channelIdentifier:channelToken:peerKey:serverKey:membershipKey:creationDate:options:databaseContext:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), v6, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presenceManager:didCreateChannel:", *(_QWORD *)(a1 + 120), v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 128) + 16))();
  }
}

- (void)_presencePayloadForChannel:(id)a3 clientPayload:(id)a4 options:(id)a5 timestamp:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  SKAMessagingProviding *messagingProvider;
  void *v19;
  SKAMessagingProviding *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  DecryptedParticipantPayload *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  DecryptedParticipantPayload *v33;
  NSObject *v34;
  _QWORD v35[4];
  DecryptedParticipantPayload *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v14, "clientSpecifiedURI");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    messagingProvider = self->_messagingProvider;
    objc_msgSend(v14, "clientSpecifiedURI");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(messagingProvider) = -[SKAMessagingProviding isValidURI:](messagingProvider, "isValidURI:", v19);

    if (!(_DWORD)messagingProvider)
    {
      v23 = 0;
      goto LABEL_11;
    }
    v20 = self->_messagingProvider;
    objc_msgSend(v14, "clientSpecifiedURI");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAMessagingProviding selfAddressedURIForURI:](v20, "selfAddressedURIForURI:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKAPresenceManager messagingProvider](self, "messagingProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tokenURI");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v22;

  if (v23 && !objc_msgSend(v23, "isEqualToString:", &stru_24D9798C8))
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v23;
      _os_log_impl(&dword_2188DF000, v24, OS_LOG_TYPE_DEFAULT, "SenderTokenURI: %@", buf, 0xCu);
    }

    v25 = objc_alloc_init(DecryptedParticipantPayload);
    -[DecryptedParticipantPayload setTokenUri:](v25, "setTokenUri:", v23);
    objc_msgSend(v12, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[DecryptedParticipantPayload setChannelIdentifier:](v25, "setChannelIdentifier:", v26);

    objc_msgSend(v12, "presenceIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[DecryptedParticipantPayload setPresenceIdentifier:](v25, "setPresenceIdentifier:", v27);

    objc_msgSend(v13, "payloadData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    -[DecryptedParticipantPayload setClientPayload:](v25, "setClientPayload:", v29);

    objc_msgSend(v15, "timeIntervalSince1970");
    -[DecryptedParticipantPayload setTimestamp:](v25, "setTimestamp:", (unint64_t)v30);
    -[SKAPresenceManager messagingProvider](self, "messagingProvider");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[DecryptedParticipantPayload data](v25, "data");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __92__SKAPresenceManager__presencePayloadForChannel_clientPayload_options_timestamp_completion___block_invoke;
    v35[3] = &unk_24D977170;
    v38 = v16;
    v36 = v25;
    v37 = v12;
    v33 = v25;
    objc_msgSend(v31, "signPayload:completion:", v32, v35);

    goto LABEL_14;
  }
LABEL_11:
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    -[SKAPresenceManager _presencePayloadForChannel:clientPayload:options:timestamp:completion:].cold.1((uint64_t)v23, v14, v34);

  (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
LABEL_14:

}

void __92__SKAPresenceManager__presencePayloadForChannel_clientPayload_options_timestamp_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  SignedParticipantPayload *v8;
  SKAPresenceEncryptionKey *v9;
  void *v10;
  SKAPresenceEncryptionKey *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __92__SKAPresenceManager__presencePayloadForChannel_clientPayload_options_timestamp_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = objc_alloc_init(SignedParticipantPayload);
    -[SignedParticipantPayload setPayload:](v8, "setPayload:", *(_QWORD *)(a1 + 32));
    -[SignedParticipantPayload setSignature:](v8, "setSignature:", v7);
    v9 = [SKAPresenceEncryptionKey alloc];
    objc_msgSend(*(id *)(a1 + 40), "presencePeerKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SKAPresenceEncryptionKey initWithKeyMaterial:](v9, "initWithKeyMaterial:", v10);

    if (v11)
    {
      -[SignedParticipantPayload data](v8, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKAPresenceEncryptionKey encryptPayload:](v11, "encryptPayload:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 134217984;
        v18 = objc_msgSend(v13, "length");
        _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Payload size: %ld", (uint8_t *)&v17, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __92__SKAPresenceManager__presencePayloadForChannel_clientPayload_options_timestamp_completion___block_invoke_cold_2();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

- (id)_presentDeviceFromPayload:(id)a3 onChannel:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  SKAPresenceEncryptionKey *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  SignedParticipantPayload *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  dispatch_time_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  BOOL v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  dispatch_semaphore_t dsemaa;
  dispatch_semaphore_t dsema;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  uint64_t v77;
  void *v78;
  NSObject *v79;
  SignedParticipantPayload *v80;
  id v81;
  _QWORD v82[4];
  NSObject *v83;
  dispatch_semaphore_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  char v89;
  uint8_t buf[4];
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "serverUpdateTimestampSeconds");
  objc_msgSend(v6, "encryptedParticipantPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = [SKAPresenceEncryptionKey alloc];
    objc_msgSend(v7, "presencePeerKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SKAPresenceEncryptionKey initWithKeyMaterial:](v10, "initWithKeyMaterial:", v11);

    if (!v12)
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.2();
      v23 = 0;
      goto LABEL_65;
    }
    -[NSObject decryptPayload:](v12, "decryptPayload:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (SignedParticipantPayload *)v24;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.3();
        v23 = 0;
        v25 = (SignedParticipantPayload *)v24;
      }
      else
      {
        v23 = 0;
      }
      goto LABEL_64;
    }
    v80 = -[SignedParticipantPayload initWithData:]([SignedParticipantPayload alloc], "initWithData:", v13);
    -[SignedParticipantPayload signature](v80, "signature");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.4();
        v23 = 0;
        v27 = v26;
      }
      else
      {
        v23 = 0;
      }
      goto LABEL_63;
    }
    -[SignedParticipantPayload payload](v80, "payload");
    v79 = objc_claimAutoreleasedReturnValue();
    -[NSObject channelIdentifier](v79, "channelIdentifier");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    v17 = objc_msgSend(v15, "isEqualToString:", v78);

    if ((v17 & 1) == 0)
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v28 = objc_claimAutoreleasedReturnValue();
      v14 = v16;
      v29 = v28;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.12();
        v23 = 0;
        v29 = v28;
      }
      else
      {
        v23 = 0;
      }
      goto LABEL_62;
    }
    -[NSObject presenceIdentifier](v79, "presenceIdentifier");
    v77 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presenceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", v77);

    if ((v19 & 1) == 0)
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v30 = objc_claimAutoreleasedReturnValue();
      v14 = v16;
      v21 = v30;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.11();
        v23 = 0;
        v21 = v30;
LABEL_61:

        v29 = (void *)v77;
LABEL_62:

        v27 = v79;
LABEL_63:

        v25 = v80;
LABEL_64:

LABEL_65:
        goto LABEL_66;
      }
LABEL_29:
      v23 = 0;
      goto LABEL_61;
    }
    -[NSObject tokenUri](v79, "tokenUri");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v14 = v16;
    if (!v20 || -[NSObject isEqualToString:](v20, "isEqualToString:", &stru_24D9798C8))
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.5();

      goto LABEL_29;
    }
    v86 = 0;
    v87 = &v86;
    v88 = 0x2020000000;
    v89 = 0;
    dsemaa = dispatch_semaphore_create(0);
    -[SKAPresenceManager messagingProvider](self, "messagingProvider");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignedParticipantPayload signature](v80, "signature");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignedParticipantPayload payload](v80, "payload");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "data");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __58__SKAPresenceManager__presentDeviceFromPayload_onChannel___block_invoke;
    v82[3] = &unk_24D977198;
    v83 = v21;
    v85 = &v86;
    v66 = v83;
    dsema = dsemaa;
    v84 = dsema;
    objc_msgSend(v73, "verifySignedPayload:matchesPayload:fromTokenURI:completion:", v71, v69, v83, v82);

    v31 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(dsema, v31);
    if (!*((_BYTE *)v87 + 24))
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.6();
      v23 = 0;
      goto LABEL_60;
    }
    v32 = -[NSObject timestamp](v79, "timestamp");
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v32);
    v76 = objc_claimAutoreleasedReturnValue();
    -[SKAPresenceManager channelManager](self, "channelManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "serverTime");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKAPresenceManager _mostRecentAssertionTimeForTokenURI:onChannel:](self, "_mostRecentAssertionTimeForTokenURI:onChannel:", v66, v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "timeIntervalSince1970");
    v36 = v35;
    -[NSObject timeIntervalSince1970](v76, "timeIntervalSince1970");
    if (v36 > v37)
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v34;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v40 = v38;
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.7();
LABEL_44:
        v23 = 0;
        v38 = v40;
LABEL_59:

        v41 = v76;
LABEL_60:

        _Block_object_dispose(&v86, 8);
        v21 = v66;
        goto LABEL_61;
      }
      goto LABEL_45;
    }
    -[NSObject timeIntervalSince1970](v76, "timeIntervalSince1970");
    if (vabdd_f64(v42, (double)v8) > 600.0)
    {
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v34;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v40 = v38;
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.8();
        goto LABEL_44;
      }
LABEL_45:
      v23 = 0;
      goto LABEL_59;
    }
    -[NSObject timeIntervalSince1970](v76, "timeIntervalSince1970");
    v44 = v43;
    objc_msgSend(v74, "timeIntervalSince1970");
    if (v44 - v45 > 86400.0)
    {
      v39 = v34;
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v40 = v38;
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.9();
        goto LABEL_44;
      }
      goto LABEL_45;
    }
    -[NSObject clientPayload](v79, "clientPayload");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      v46 = objc_msgSend(objc_alloc(MEMORY[0x24BEB1070]), "initWithData:", v72);
      v39 = v34;
      v81 = 0;
      v47 = -[SKAPresenceManager _clientPayload:isValidWithError:](self, "_clientPayload:isValidWithError:", v46, &v81);
      v70 = v81;
      v63 = v46;
      if (!v47)
      {
        +[SKAPresenceManager logger](SKAPresenceManager, "logger");
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.10();
        v23 = 0;
        goto LABEL_58;
      }
      v48 = v70;
    }
    else
    {
      v49 = objc_msgSend(objc_alloc(MEMORY[0x24BEB1070]), "initWithData:", 0);
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v48 = objc_claimAutoreleasedReturnValue();
      v63 = v49;
      v39 = v34;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v48, OS_LOG_TYPE_DEFAULT, "Incoming present device has no client-specified payload", buf, 2u);
      }
    }

    -[SKAPresenceManager messagingProvider](self, "messagingProvider");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "deviceTokenForTokenURI:", v66);
    v70 = objc_claimAutoreleasedReturnValue();

    -[SKAPresenceManager messagingProvider](self, "messagingProvider");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "deviceToken");
    v61 = objc_claimAutoreleasedReturnValue();

    -[SKAPresenceManager _deviceIdentifierForToken:](self, "_deviceIdentifierForToken:", v70);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAPresenceManager _deviceIdentifierForToken:](self, "_deviceIdentifierForToken:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAPresenceManager messagingProvider](self, "messagingProvider");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleForTokenURI:", v66);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKAPresenceManager messagingProvider](self, "messagingProvider");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "isHandleAvailableToMessageFrom:", v64);

    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v91 = v62;
      _os_log_impl(&dword_2188DF000, v55, OS_LOG_TYPE_DEFAULT, "Self device identifier: %@", buf, 0xCu);
    }

    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v91 = v65;
      _os_log_impl(&dword_2188DF000, v56, OS_LOG_TYPE_DEFAULT, "Other device identifier: %@", buf, 0xCu);
    }

    LOBYTE(v60) = objc_msgSend(v65, "isEqualToString:", v62);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1080]), "initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:", v64, v65, v66, v63, v76, v54, v60);
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v91 = v23;
      _os_log_impl(&dword_2188DF000, v57, OS_LOG_TYPE_DEFAULT, "Constructed SKPresentDevice from payload: %@", buf, 0xCu);
    }

    v58 = v61;
LABEL_58:

    v38 = v63;
    goto LABEL_59;
  }
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.1();
  v23 = 0;
LABEL_66:

  return v23;
}

void __58__SKAPresenceManager__presentDeviceFromPayload_onChannel___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  NSObject *v6;

  v5 = a2;
  if (v5 || (a3 & 1) == 0)
  {
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __58__SKAPresenceManager__presentDeviceFromPayload_onChannel___block_invoke_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (id)_mostRecentAssertionTimeForTokenURI:(id)a3 onChannel:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SKAPresenceManager _activePresentDevicesForChannel:](self, "_activePresentDevicesForChannel:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPresenceManager messagingProvider](self, "messagingProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceTokenForTokenURI:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKAPresenceManager _deviceIdentifierForToken:](self, "_deviceIdentifierForToken:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v16, "deviceIdentifier", (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqualToString:", v10) & 1) != 0)
        {
          objc_msgSend(v16, "assertionTime");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v18;
}

- (id)_deviceIdentifierForToken:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a3)
  {
    objc_msgSend(a3, "ska_hexString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ska_sha256Hash");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_retainAutorelease(v4);
    v6 = objc_msgSend(v5, "cStringUsingEncoding:", 1);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v6);
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
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
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
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
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
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
      +[SKAPresenceManager logger](SKAPresenceManager, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SKAStatusPublishingManager _shouldReauthForError:].cold.3();
      goto LABEL_15;
    }
  }
  else
  {

  }
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
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

- (void)_rollChannelForCryptoFailureIfAllowed:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;

  v4 = a3;
  v5 = -[SKAPresenceManager _shouldCryptoRoll](self, "_shouldCryptoRoll");
  +[SKAPresenceManager logger](SKAPresenceManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7)
      -[SKAPresenceManager _rollChannelForCryptoFailureIfAllowed:].cold.1();

    -[SKAPresenceManager _markCryptoRoll](self, "_markCryptoRoll");
    -[SKAPresenceManager delegate](self, "delegate");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject presenceManager:didRequestToRollChannel:](v6, "presenceManager:didRequestToRollChannel:", self, v4);
  }
  else if (v7)
  {
    -[SKAPresenceManager _rollChannelForCryptoFailureIfAllowed:].cold.2();
  }

}

+ (id)_noExistingAssertionError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10C8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("No existing assertion exists");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7001, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_noExistingChannelError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10C8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("No channel exists for presence identifier");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7002, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_keyGenerationError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10C8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("Failed to generate cryptographic keys for channel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7005, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_payloadGenerationError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10C8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("Failed to generate payload for presence message");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7006, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_payloadOversizeError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10C8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("Payload is too large");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7008, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_presenceDisabledError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10C8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("Presence has been disabled by the server");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7010, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_channelCreationTimeoutError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10C8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("Timed out creating presence channel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7012, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_unexpectedInternalError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10C8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("An unexpected internal error occurred, please file a radar.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7013, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_shouldReassert
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  double v7;
  BOOL v8;

  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("lastReassertTime"), CFSTR("com.apple.StatusKitAgent"));
  v4 = -[SKAPresenceManager _reassertResetTimeSeconds](self, "_reassertResetTimeSeconds");
  if (v3)
  {
    v5 = (double)v4;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v3);
    v8 = v7 > v5;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_markReassert
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("lastReassertTime"), v2, CFSTR("com.apple.StatusKitAgent"));

}

- (BOOL)_shouldCryptoRoll
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  double v7;
  BOOL v8;

  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("lastCryptoRollTime"), CFSTR("com.apple.StatusKitAgent"));
  v4 = -[SKAPresenceManager _cryptoRollResetTimeSeconds](self, "_cryptoRollResetTimeSeconds");
  if (v3)
  {
    v5 = (double)v4;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v3);
    v8 = v7 > v5;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_markCryptoRoll
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("lastCryptoRollTime"), v2, CFSTR("com.apple.StatusKitAgent"));

}

- (int64_t)_reassertResetTimeSeconds
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
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-reassert-reset-time-seconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (int)objc_msgSend(v3, "intValue");
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our reset time for reasserting presence should be %lu", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v4 = 60;
  }

  return v4;
}

- (int64_t)_cryptoRollResetTimeSeconds
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
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-crypto-roll-reset-time-seconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (int)objc_msgSend(v3, "intValue");
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our reset time for resetting crypto roll rate limits presence should be %lu", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v4 = 18000;
  }

  return v4;
}

- (int64_t)_maxPayloadSizeBytes
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
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-max-presence-payload-size-bytes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (int)objc_msgSend(v3, "intValue");
    +[SKAPresenceManager logger](SKAPresenceManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our maxPayload size should be %lu", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v4 = 2048;
  }

  return v4;
}

+ (id)logger
{
  if (logger_onceToken_10 != -1)
    dispatch_once(&logger_onceToken_10, &__block_literal_global_10);
  return (id)logger__logger_10;
}

void __28__SKAPresenceManager_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAPresenceManager");
  v1 = (void *)logger__logger_10;
  logger__logger_10 = (uint64_t)v0;

}

+ (id)oversizeLogger
{
  if (oversizeLogger_onceToken != -1)
    dispatch_once(&oversizeLogger_onceToken, &__block_literal_global_102);
  return (id)oversizeLogger__logger;
}

void __36__SKAPresenceManager_oversizeLogger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "StatusKit-oversized");
  v1 = (void *)oversizeLogger__logger;
  oversizeLogger__logger = (uint64_t)v0;

}

- (NSMapTable)activePresenceAssertionsByClient
{
  return self->_activePresenceAssertionsByClient;
}

- (void)setActivePresenceAssertionsByClient:(id)a3
{
  objc_storeStrong((id *)&self->_activePresenceAssertionsByClient, a3);
}

- (NSMapTable)activeParticipantsByChannel
{
  return self->_activeParticipantsByChannel;
}

- (void)setActiveParticipantsByChannel:(id)a3
{
  objc_storeStrong((id *)&self->_activeParticipantsByChannel, a3);
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

- (SKAAccountProviding)accountProvider
{
  return self->_accountProvider;
}

- (void)setAccountProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountProvider, a3);
}

- (SKAMessagingProviding)messagingProvider
{
  return self->_messagingProvider;
}

- (void)setMessagingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_messagingProvider, a3);
}

- (SKAStatusSubscriptionManaging)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionManager, a3);
}

- (SKAPresenceManagingDelegate)delegate
{
  return (SKAPresenceManagingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)internalWorkQueue
{
  return self->_internalWorkQueue;
}

- (void)setInternalWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalWorkQueue, a3);
}

- (OS_dispatch_queue)payloadUpdateProcessingQueue
{
  return self->_payloadUpdateProcessingQueue;
}

- (void)setPayloadUpdateProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_payloadUpdateProcessingQueue, a3);
}

- (BOOL)presenceEnabledByServer
{
  return self->_presenceEnabledByServer;
}

- (void)setPresenceEnabledByServer:(BOOL)a3
{
  self->_presenceEnabledByServer = a3;
}

- (OS_dispatch_queue)channelFetchQueue
{
  return self->_channelFetchQueue;
}

- (void)setChannelFetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_channelFetchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelFetchQueue, 0);
  objc_storeStrong((id *)&self->_payloadUpdateProcessingQueue, 0);
  objc_storeStrong((id *)&self->_internalWorkQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_messagingProvider, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_activeParticipantsByChannel, 0);
  objc_storeStrong((id *)&self->_activePresenceAssertionsByClient, 0);
}

void __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Payload is invalid! Aborting presence assertion. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_15_0(a1), "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_2188DF000, a2, v4, "Presence has been disabled by the server for identifier %@.", v5);

  OUTLINED_FUNCTION_12_0();
}

- (void)_clientPayload:isValidWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_2();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Payload is oversized! Payload size:%lu Max size:%lu", v2, v3);
  OUTLINED_FUNCTION_3();
}

- (void)_sendPresenceAssertionMessageForChannel:(uint64_t)a1 withPayload:options:isRefresh:completion:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v1, v2, "_sendPresenceAssertionMessageForChannel - Failed to retrieve one or more required crypto keys. membershipKey %@ serverKey %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Presence payload is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Account refresh required for error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Should not reauth for error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_22_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Account refresh did not fix secondary attempt %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__SKAPresenceManager_sendPollingMessageForChannel___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error updating active particpants for channel %@  based on polling response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_sendPollingMessageForChannel:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v1, v2, "_sendPollingMessageForChannel - Failed to retrieve one or more required crypto keys. membershipKey %@ serverKey %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)_handleBulkUpdateParticipantPayloads:(os_log_t)log forChannel:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2188DF000, log, OS_LOG_TYPE_ERROR, "Participant payload failed to be processed", buf, 2u);
}

void __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not find presence assertion to remove from in memory model for subscription identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_32_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v1, v2, "Deactivation message failed for %@ with error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)_sendPresenceDeactivationMessageForChannel:(uint64_t)a1 options:completion:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v1, v2, "_sendPresenceDeactivationMessageForChannel - Failed to retrieve one or more required crypto keys. membershipKey %@ serverKey %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

void __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Should not reauth for error releasing presence: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_15_0(a1), "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_2188DF000, a2, v4, "Presence has been disabled by the server for identifier %@.", v5);

  OUTLINED_FUNCTION_12_0();
}

void __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_37_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not find presence assertion to remove from in memory model for presence identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)channelReceivedIncomingPayloadUpdate:channel:withIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to deserialize data on channel %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Encrypted update data missing on channel %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to instantiate server key for channel %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to decrypt payload for channel %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to deserialize update on channel %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Missing participant payloads for update on channel %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Unkown update type on channel %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to validate device on channel %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_15_0(a1), "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_2188DF000, a2, v4, "Presence has been disabled by the server for identifier %@.", v5);

  OUTLINED_FUNCTION_12_0();
}

void __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_45_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "CreateChannel: Timed out waiting for presence channel %@ to create", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_presentDevicesChangedForChannel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Attempting to reassert to fix state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDevicesChangedForChannel:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Not reasserting because of rate limit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDevicesChangedForChannel:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Active assertion exists but we're missing or have expired from this channel: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55__SKAPresenceManager__presentDevicesChangedForChannel___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error reasserting presence for channel %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_removePresentDeviceForChannel:(NSObject *)a3 presentDevice:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, a3, v6, "Could not find present device for subscription identifier: \"%@\". Present devices: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_12();
}

void __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "CreateChannel: Timed out waiting for channel creation to complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_createPresenceChannelForPresenceIdentifier:options:databaseContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Failed to obtain material for one or more required crypto keys", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presencePayloadForChannel:(NSObject *)a3 clientPayload:options:timestamp:completion:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "clientSpecifiedURI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, a3, v6, "Failed to get senderTokenURI: %@ clientSpecifiedURI %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_12();
}

void __92__SKAPresenceManager__presencePayloadForChannel_clientPayload_options_timestamp_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to get signature: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __92__SKAPresenceManager__presencePayloadForChannel_clientPayload_options_timestamp_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Failed to get peer key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDeviceFromPayload:onChannel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Payload data empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDeviceFromPayload:onChannel:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Failed to instantiate peer key for decryption", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDeviceFromPayload:onChannel:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Payload data failed to decrypt", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDeviceFromPayload:onChannel:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Payload data missing signature", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDeviceFromPayload:onChannel:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Missing token URI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDeviceFromPayload:onChannel:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Payload data signature failed to verify", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDeviceFromPayload:onChannel:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Assertion time is older than existing presence, dropping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDeviceFromPayload:onChannel:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Assertion time deviated too much from server received time! Asserting device clock out of sync or replay attack", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDeviceFromPayload:onChannel:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Assertion time is more than a day in the future, dropping. Our clock might be out of sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDeviceFromPayload:onChannel:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Incoming payload failed validation. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_presentDeviceFromPayload:onChannel:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Payload presence ID does not match the identifier of the channel it was published on", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_presentDeviceFromPayload:onChannel:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Payload channel ID does not match the channel it was published on", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __58__SKAPresenceManager__presentDeviceFromPayload_onChannel___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v1, v2, "Signature verification for %@ failed with error %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)_rollChannelForCryptoFailureIfAllowed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Rolling channel to attempt to solve crypto error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_rollChannelForCryptoFailureIfAllowed:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "It's been too recent since our last crypto roll. Not rolling", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end

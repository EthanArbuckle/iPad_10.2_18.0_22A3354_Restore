@implementation SKAInvitationManager

- (SKAInvitationManager)initWithMessagingProvider:(id)a3 databaseManager:(id)a4 accountProvider:(id)a5 channelManager:(id)a6 presenceManager:(id)a7 trafficMode:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  SKAInvitationManager *v18;
  SKAInvitationManager *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *backgroundCleanupQueue;
  NSMutableDictionary *v24;
  NSMutableDictionary *outgoingInvitationMapping;
  NSObject *v26;
  id v28;
  id v29;
  uint8_t buf[16];
  objc_super v31;

  v29 = a3;
  v28 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v31.receiver = self;
  v31.super_class = (Class)SKAInvitationManager;
  v18 = -[SKAInvitationManager init](&v31, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_messagingProvider, a3);
    objc_storeStrong((id *)&v19->_databaseManager, a4);
    objc_storeStrong((id *)&v19->_channelManager, a6);
    objc_storeStrong((id *)&v19->_accountProvider, a5);
    objc_storeStrong((id *)&v19->_presenceManager, a7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_DEFAULT, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = dispatch_queue_create("com.apple.StatusKit.InvitationManager.cleanup", v21);
    backgroundCleanupQueue = v19->_backgroundCleanupQueue;
    v19->_backgroundCleanupQueue = (OS_dispatch_queue *)v22;

    v19->_trafficModeEnabled = a8;
    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    outgoingInvitationMapping = v19->_outgoingInvitationMapping;
    v19->_outgoingInvitationMapping = v24;

    v19->_presenceEnabledByServer = +[SKAServerBag presenceEnabledByServer](SKAServerBag, "presenceEnabledByServer", v28, v29);
    if (v19->_trafficModeEnabled)
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v26, OS_LOG_TYPE_DEFAULT, "In Traffic Mode--will drop incoming status invitations", buf, 2u);
      }

    }
  }

  return v19;
}

- (void)sendInvitationForPersonalChannelWithStatusTypeIdentifier:(id)a3 toHandles:(id)a4 fromSenderHandle:(id)a5 withInvitationPayload:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[SKAInvitationManager _validateInvitedHandles:](self, "_validateInvitedHandles:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    -[SKAInvitationManager resolveSenderHandleWithPreferredSenderHandle:](self, "resolveSenderHandleWithPreferredSenderHandle:", v14);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_initWeak(&location, self);
      v19 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke;
      v24[3] = &unk_24D9761F8;
      objc_copyWeak(&v31, &location);
      v30 = v16;
      v25 = v12;
      v26 = v17;
      v18 = v18;
      v27 = v18;
      v28 = v15;
      v20 = v19;
      v29 = v20;
      -[SKAInvitationManager _findOrCreatePersonalChannelForStatusTypeIdentifier:databaseContext:completion:](self, "_findOrCreatePersonalChannelForStatusTypeIdentifier:databaseContext:completion:", v25, v20, v24);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:].cold.2();

      +[SKAInvitationManager _invalidSenderHandleError](SKAInvitationManager, "_invalidSenderHandleError");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v23);

    }
  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:].cold.1();

    +[SKAInvitationManager _invalidInvitedHandlesError](SKAInvitationManager, "_invalidInvitedHandlesError");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v16 + 2))(v16, 0, v18);
  }

}

void __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void (*v22)(void);
  NSObject *v23;
  id v24;
  id v25;
  char v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (v6)
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_4();

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v9 = v5;
    goto LABEL_20;
  }
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v28 = v12;
      v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Adding invited handles %@ to database for channel: %@", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "_addInvitedHandles:senderHandle:toDatabaseForPersonalChannel:withInvitationPayload:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v14 = *(_QWORD *)(a1 + 64);
    v25 = 0;
    objc_msgSend(WeakRetained, "_ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:databaseContext:invitationWasSentViaKeyRoll:error:", v5, v14, &v26, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v25;

    if (v15)
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_3((_QWORD *)(a1 + 40));
    }
    else
    {
      if (!v26)
      {
        objc_msgSend(v9, "currentOutgoingRatchet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "currentSubscriptionKeys");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0;
        v20 = objc_msgSend(WeakRetained, "_sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:", v9, v13, v19, &v24);
        v21 = v24;
        if ((v20 & 1) != 0)
        {
          v22 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
        }
        else
        {
          +[SKAInvitationManager logger](SKAInvitationManager, "logger");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_2();

          v22 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
        }
        v22();

        goto LABEL_19;
      }
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v28 = v17;
        _os_log_impl(&dword_2188DF000, v16, OS_LOG_TYPE_DEFAULT, "Invitations for newly invited handles %@ was already sent during key roll, skipping individual message send.", buf, 0xCu);
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_19:

    goto LABEL_20;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_1();

  +[SKAInvitationManager _noPersonalChannelErrorForStatusTypeIdentifier:](SKAInvitationManager, "_noPersonalChannelErrorForStatusTypeIdentifier:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_20:

}

- (void)sendInvitationForPresenceChannelWithPresenceIdentifier:(id)a3 toHandles:(id)a4 fromSenderHandle:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  void (**v35)(id, _QWORD, void *);
  id v36;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a7;
  if (!-[SKAInvitationManager presenceEnabledByServer](self, "presenceEnabledByServer"))
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
    goto LABEL_11;
  }
  objc_msgSend(v15, "serviceIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(v15, "serviceIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[SKAServerBag presenceEnabledByServerForServiceIdentifier:](SKAServerBag, "presenceEnabledByServerForServiceIdentifier:", v19);

    if (!v20)
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.3(v15, v26);
LABEL_11:

      +[SKAInvitationManager _presenceDisabledError](SKAInvitationManager, "_presenceDisabledError");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, 0, v21);
      goto LABEL_19;
    }
  }
  -[SKAInvitationManager _validateInvitedHandles:](self, "_validateInvitedHandles:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
  {
    -[SKAInvitationManager resolveSenderHandleWithPreferredSenderHandle:](self, "resolveSenderHandleWithPreferredSenderHandle:", v14);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_initWeak(&location, self);
      v23 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
      -[SKAInvitationManager presenceManager](self, "presenceManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = 3221225472;
      v30[2] = __125__SKAInvitationManager_sendInvitationForPresenceChannelWithPresenceIdentifier_toHandles_fromSenderHandle_options_completion___block_invoke;
      v30[3] = &unk_24D976220;
      v30[0] = MEMORY[0x24BDAC760];
      objc_copyWeak(&v36, &location);
      v35 = v16;
      v31 = v12;
      v32 = v21;
      v22 = v22;
      v33 = v22;
      v25 = v23;
      v34 = v25;
      objc_msgSend(v24, "findOrCreatePresenceChannelForPresenceIdentifier:options:databaseContext:completion:", v31, v15, v25, v30);

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
    else
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:].cold.2();

      +[SKAInvitationManager _invalidSenderHandleError](SKAInvitationManager, "_invalidSenderHandleError");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, 0, v29);

    }
  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:].cold.1();

    +[SKAInvitationManager _invalidInvitedHandlesError](SKAInvitationManager, "_invalidInvitedHandlesError");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v22);
  }

LABEL_19:
}

void __125__SKAInvitationManager_sendInvitationForPresenceChannelWithPresenceIdentifier_toHandles_fromSenderHandle_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  void (*v15)(void);
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (v6)
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __125__SKAInvitationManager_sendInvitationForPresenceChannelWithPresenceIdentifier_toHandles_fromSenderHandle_options_completion___block_invoke_cold_3();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v19 = v11;
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Adding invited handles %@ to database for channel: %@", buf, 0x16u);
      }

      objc_msgSend(WeakRetained, "_addInvitedHandles:senderHandle:toDatabaseForPresenceChannel:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 56));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v13 = objc_msgSend(WeakRetained, "_sendInvitationMessageForPresenceChannel:toInvitedUsers:error:", v5, v12, &v17);
      v14 = v17;
      if ((v13 & 1) != 0)
      {
        v15 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
      }
      else
      {
        +[SKAInvitationManager logger](SKAInvitationManager, "logger");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_2();

        v15 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
      }
      v15();

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __125__SKAInvitationManager_sendInvitationForPresenceChannelWithPresenceIdentifier_toHandles_fromSenderHandle_options_completion___block_invoke_cold_1();

      +[SKAInvitationManager _noPresenceChannelForIdentifier:](SKAInvitationManager, "_noPresenceChannelForIdentifier:", *(_QWORD *)(a1 + 32));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
}

- (void)sendSelfInvitationForPresenceChannelWithPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  SKAInvitationManager *v15;
  id v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (-[SKAInvitationManager presenceEnabledByServer](self, "presenceEnabledByServer"))
  {
    v10 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
    -[SKAInvitationManager presenceManager](self, "presenceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __105__SKAInvitationManager_sendSelfInvitationForPresenceChannelWithPresenceIdentifier_isPersonal_completion___block_invoke;
    v13[3] = &unk_24D976248;
    v14 = v8;
    v15 = self;
    v16 = v9;
    objc_msgSend(v11, "findPresenceChannelForPresenceIdentifier:isPersonal:databaseContext:completion:", v14, v6, v10, v13);

  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();

    +[SKAInvitationManager _presenceDisabledError](SKAInvitationManager, "_presenceDisabledError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v10);
  }

}

void __105__SKAInvitationManager_sendSelfInvitationForPresenceChannelWithPresenceIdentifier_isPersonal_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_invitationMessageForPresenceChannel:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "messagingProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "copy");
    v21 = 0;
    v22 = 0;
    v9 = objc_msgSend(v7, "sendMessageToSelfDevices:limitToPresenceCapable:identifier:error:", v8, 1, &v22, &v21);
    v10 = v22;
    v11 = v21;

    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Presence invitation sent successfully to self-account devices. ID:%@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v11;
      v25 = 2112;
      v26 = v6;
      v27 = 2112;
      v28 = v10;
      _os_log_error_impl(&dword_2188DF000, v13, OS_LOG_TYPE_ERROR, "Self presence invitation send failed with error: %@ message: %@, ID:%@.  Maybe no other device on account?", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __105__SKAInvitationManager_sendSelfInvitationForPresenceChannelWithPresenceIdentifier_isPersonal_completion___block_invoke_cold_1(a1, v14, v15, v16, v17, v18, v19, v20);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  -[SKADatabaseManaging existingPersonalChannelForStatusTypeIdentifier:databaseContext:](self->_databaseManager, "existingPersonalChannelForStatusTypeIdentifier:databaseContext:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:].cold.1();

    +[SKAInvitationManager _noPersonalChannelErrorForStatusTypeIdentifier:](SKAInvitationManager, "_noPersonalChannelErrorForStatusTypeIdentifier:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v10 = -[SKADatabaseManaging deleteAllInvitedUsersForPersonalChannel:databaseContext:](self->_databaseManager, "deleteAllInvitedUsersForPersonalChannel:databaseContext:", v9, v8);
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:].cold.2();

    +[SKAInvitationManager _unableToFindAnyExistingInvitationToDeleteError](SKAInvitationManager, "_unableToFindAnyExistingInvitationToDeleteError");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v14 = (id)v16;
    v7[2](v7, v16);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Finished deleting all invited user database records for channel %@, initiating key roll", buf, 0xCu);
  }

  v18 = 0;
  v13 = -[SKAInvitationManager _rollEncryptionKeyForChannel:databaseContext:error:](self, "_rollEncryptionKeyForChannel:databaseContext:error:", v9, v8, &v18);
  v14 = v18;
  if (v14 || !v13)
  {
    +[SKAInvitationManager _keyRollFailedErrorWithUnderlyingError:](SKAInvitationManager, "_keyRollFailedErrorWithUnderlyingError:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, (uint64_t)v17);

  }
  else
  {
    v7[2](v7, 0);
  }
LABEL_15:

}

- (void)revokeInvitationFromPersonalChannelWithStatusTypeIdentifier:(id)a3 forHandles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  id v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  int v20;
  void **v21;
  NSObject *v22;
  NSObject *v23;
  SKADatabaseManaging *databaseManager;
  id v25;
  NSObject *v26;
  BOOL v27;
  id v28;
  id WeakRetained;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  void (**v35)(id, uint64_t);
  id v36;
  id obj;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  -[SKADatabaseManaging existingPersonalChannelForStatusTypeIdentifier:databaseContext:](self->_databaseManager, "existingPersonalChannelForStatusTypeIdentifier:databaseContext:", v8, v11);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager revokeInvitationFromPersonalChannelWithStatusTypeIdentifier:forHandles:completion:].cold.1();

    +[SKAInvitationManager _noPersonalChannelErrorForStatusTypeIdentifier:](SKAInvitationManager, "_noPersonalChannelErrorForStatusTypeIdentifier:", v8);
    v31 = objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v35 = v10;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  v14 = (void **)&off_24D975000;
  if (!v13)
  {

LABEL_25:
    objc_msgSend(v14[306], "logger");
    v32 = objc_claimAutoreleasedReturnValue();
    v10 = v35;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:].cold.2();

    objc_msgSend(v14[306], "_unableToFindExistingInvitationForHandlesError:", v12);
    v31 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    v28 = (id)v31;
    v10[2](v10, v31);
    goto LABEL_29;
  }
  v15 = v13;
  v36 = v8;
  obj = v12;
  v34 = v9;
  v16 = 0;
  v17 = *(_QWORD *)v41;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v41 != v17)
        objc_enumerationMutation(obj);
      v19 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
      v20 = -[SKADatabaseManaging deleteInvitedUserForHandle:personalChannel:databaseContext:](self->_databaseManager, "deleteInvitedUserForHandle:personalChannel:databaseContext:", v19, v38, v11, v34);
      v21 = v14;
      objc_msgSend(v14[306], "logger");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v20)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v19;
          _os_log_impl(&dword_2188DF000, v23, OS_LOG_TYPE_DEFAULT, "Successfully deleted database record for invited user: %@.  Adding to removed users", buf, 0xCu);
        }

        databaseManager = self->_databaseManager;
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v23 = objc_claimAutoreleasedReturnValue();
        v25 = (id)-[SKADatabaseManaging createRemovedUserWithHandle:dateRemoved:statusTypeIdentifier:databaseContext:](databaseManager, "createRemovedUserWithHandle:dateRemoved:statusTypeIdentifier:databaseContext:", v19, v23, v36, v11);
        v16 = 1;
      }
      else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v19;
        _os_log_error_impl(&dword_2188DF000, v23, OS_LOG_TYPE_ERROR, "Unable to find database record for invited user attempted to delete: %@", buf, 0xCu);
      }

      v14 = v21;
    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  }
  while (v15);
  v12 = obj;

  v8 = v36;
  v9 = v34;
  if ((v16 & 1) == 0)
    goto LABEL_25;
  objc_msgSend(v21[306], "logger");
  v26 = objc_claimAutoreleasedReturnValue();
  v10 = v35;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v26, OS_LOG_TYPE_DEFAULT, "Finished deleting database records for uninvited users, initiating key roll", buf, 2u);
  }

  v39 = 0;
  v27 = -[SKAInvitationManager _rollEncryptionKeyForChannel:databaseContext:error:](self, "_rollEncryptionKeyForChannel:databaseContext:error:", v38, v11, &v39);
  v28 = v39;
  if (v28 || !v27)
  {
    objc_msgSend(v21[306], "_keyRollFailedErrorWithUnderlyingError:", v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2](v35, (uint64_t)v33);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "invitationManager:didRevokeInvitationOnChannel:", self, v38);

    v35[2](v35, 0);
  }
LABEL_29:

}

- (void)revokeInvitationFromPresenceChannelWithPresenceIdentifier:(id)a3 forHandles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  SKADatabaseManaging *databaseManager;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[SKAInvitationManager presenceEnabledByServer](self, "presenceEnabledByServer"))
  {
    v11 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
    -[SKADatabaseManaging existingChannelForPresenceIdentifier:isPersonal:databaseContext:](self->_databaseManager, "existingChannelForPresenceIdentifier:isPersonal:databaseContext:", v8, 0, v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v30 = v10;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v12 = v9;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v13)
      {
        v14 = v13;
        v29 = v9;
        v31 = v8;
        v15 = 0;
        v16 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v36 != v16)
              objc_enumerationMutation(v12);
            v18 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            v19 = -[SKADatabaseManaging deleteInvitedUserForHandle:personalChannel:databaseContext:](self->_databaseManager, "deleteInvitedUserForHandle:personalChannel:databaseContext:", v18, v32, v11, v29);
            +[SKAInvitationManager logger](SKAInvitationManager, "logger");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v19)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v40 = v18;
                _os_log_impl(&dword_2188DF000, v21, OS_LOG_TYPE_DEFAULT, "Successfully deleted database record for invited user: %@.  Adding to removed users", buf, 0xCu);
              }

              databaseManager = self->_databaseManager;
              objc_msgSend(MEMORY[0x24BDBCE60], "now");
              v21 = objc_claimAutoreleasedReturnValue();
              v23 = (id)-[SKADatabaseManaging createRemovedUserWithHandle:dateRemoved:presenceIdentifier:databaseContext:](databaseManager, "createRemovedUserWithHandle:dateRemoved:presenceIdentifier:databaseContext:", v18, v21, v31, v11);
              v15 = 1;
            }
            else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v40 = v18;
              _os_log_error_impl(&dword_2188DF000, v21, OS_LOG_TYPE_ERROR, "Unable to find database record for invited user attempted to delete: %@", buf, 0xCu);
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v14);

        v8 = v31;
        v9 = v29;
        if ((v15 & 1) != 0)
        {
          +[SKAInvitationManager logger](SKAInvitationManager, "logger");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2188DF000, v24, OS_LOG_TYPE_DEFAULT, "Finished deleting database records for uninvited users, initiating key roll", buf, 2u);
          }

          v33[0] = MEMORY[0x24BDAC760];
          v33[1] = 3221225472;
          v33[2] = __104__SKAInvitationManager_revokeInvitationFromPresenceChannelWithPresenceIdentifier_forHandles_completion___block_invoke;
          v33[3] = &unk_24D976270;
          v10 = v30;
          v34 = v30;
          -[SKAInvitationManager rollPresenceChannelWithPresenceIdentifier:isPersonal:completion:](self, "rollPresenceChannelWithPresenceIdentifier:isPersonal:completion:", v31, 0, v33);
          v25 = v34;
          goto LABEL_31;
        }
      }
      else
      {

      }
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:].cold.2();

      +[SKAInvitationManager _unableToFindExistingInvitationForHandlesError:](SKAInvitationManager, "_unableToFindExistingInvitationForHandlesError:", v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v30;
    }
    else
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager revokeInvitationFromPersonalChannelWithStatusTypeIdentifier:forHandles:completion:].cold.1();

      +[SKAInvitationManager _noPresenceChannelForIdentifier:](SKAInvitationManager, "_noPresenceChannelForIdentifier:", v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*((void (**)(id, void *))v10 + 2))(v10, v25);
LABEL_31:

    goto LABEL_32;
  }
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();

  +[SKAInvitationManager _presenceDisabledError](SKAInvitationManager, "_presenceDisabledError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v11);
LABEL_32:

}

void __104__SKAInvitationManager_revokeInvitationFromPresenceChannelWithPresenceIdentifier_forHandles_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Finished rolling presence channel", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Error rolling presence channel", v7, 2u);
    }

    +[SKAInvitationManager _keyRollFailedErrorWithUnderlyingError:](SKAInvitationManager, "_keyRollFailedErrorWithUnderlyingError:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (id)resolveSenderHandleWithPreferredSenderHandle:(id)a3
{
  return (id)-[SKAMessagingProviding resolveSenderHandleWithPreferredSenderHandle:](self->_messagingProvider, "resolveSenderHandleWithPreferredSenderHandle:", a3);
}

- (BOOL)rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Received request to roll encryption key for personal channel with statusTypeIdentifier: %@", buf, 0xCu);
  }

  v8 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  -[SKADatabaseManaging existingPersonalChannelForStatusTypeIdentifier:databaseContext:](self->_databaseManager, "existingPersonalChannelForStatusTypeIdentifier:databaseContext:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14 = 0;
    v10 = -[SKAInvitationManager _rollEncryptionKeyForChannel:databaseContext:error:](self, "_rollEncryptionKeyForChannel:databaseContext:error:", v9, v8, &v14);
    v11 = v14;
    if (!v10)
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:error:].cold.2((uint64_t)v6);

      if (a4)
      {
        v11 = objc_retainAutorelease(v11);
        *a4 = v11;
      }
    }
  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:error:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (void)outgoingMessageWithIdentifier:(id)a3 fromHandle:(id)a4 toHandle:(id)a5 didSendWithSuccess:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v6 = a6;
  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = v9;
    v24 = 1024;
    v25 = v6;
    _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Received callback for message with identifier: %@ did send with success: %d", (uint8_t *)&v22, 0x12u);
  }

  if (!v6)
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:].cold.3();

    -[SKAInvitationManager outgoingInvitationMapping](self, "outgoingInvitationMapping");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "channelIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "toHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[NSObject length](v14, "length");
      if (a5 && v16)
      {
        v17 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
        -[SKAInvitationManager databaseManager](self, "databaseManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "existingChannelForSubscriptionIdentifier:databaseContext:", v14, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[SKAInvitationManager databaseManager](self, "databaseManager");
          v20 = objc_claimAutoreleasedReturnValue();
          -[NSObject deleteInvitedUserForHandle:presenceChannel:databaseContext:](v20, "deleteInvitedUserForHandle:presenceChannel:databaseContext:", v15, v19, v17);
        }
        else
        {
          +[SKAInvitationManager logger](SKAInvitationManager, "logger");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[SKAInvitationManager outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:].cold.2();
        }

      }
    }
    else
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:].cold.1();
    }

  }
  -[SKAInvitationManager outgoingInvitationMapping](self, "outgoingInvitationMapping");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeObjectForKey:", v9);

}

- (void)rollPersonalChannelWithStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Received request to roll personal channel with statusTypeIdentifier: %@", buf, 0xCu);
  }

  v9 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  -[SKADatabaseManaging existingPersonalChannelForStatusTypeIdentifier:databaseContext:](self->_databaseManager, "existingPersonalChannelForStatusTypeIdentifier:databaseContext:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke;
    v12[3] = &unk_24D976298;
    v16 = v7;
    v12[4] = self;
    v13 = v10;
    v14 = v9;
    v15 = v6;
    -[SKAInvitationManager _createPersonalChannelForStatusTypeIdentifier:databaseContext:completion:](self, "_createPersonalChannelForStatusTypeIdentifier:databaseContext:completion:", v15, v14, v12);

  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager rollPersonalChannelWithStatusTypeIdentifier:completion:].cold.1();

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void (*v15)(void);
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_1();
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "databaseManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copyInvitedUsersFromChannel:toChannel:databaseContext:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));

  if (!v9)
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_2();
LABEL_12:

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_17;
  }
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 48);
  v20 = 0;
  objc_msgSend(v10, "_rollEncryptionKeyForChannel:databaseContext:error:", v5, v11, &v20);
  v12 = v20;
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_2();

    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Succesfully rolled personal channel with statusTypeIdentifier: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "decomissionChannelWithIdentifier:databaseContext:", v19, *(_QWORD *)(a1 + 48));

    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  v15();

LABEL_17:
}

- (void)rollPresenceChannelWithPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Received request to roll presence channel with presence identifier: %@", buf, 0xCu);
  }

  v11 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  -[SKADatabaseManaging existingChannelForPresenceIdentifier:isPersonal:databaseContext:](self->_databaseManager, "existingChannelForPresenceIdentifier:isPersonal:databaseContext:", v8, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x24BEB1068]);
    objc_msgSend(v12, "serviceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithServiceIdentifier:", v14);

    objc_msgSend(v15, "setIsPersonal:", v6);
    -[SKAInvitationManager presenceManager](self, "presenceManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __88__SKAInvitationManager_rollPresenceChannelWithPresenceIdentifier_isPersonal_completion___block_invoke;
    v18[3] = &unk_24D976298;
    v22 = v9;
    v18[4] = self;
    v19 = v12;
    v20 = v11;
    v21 = v8;
    objc_msgSend(v16, "createPresenceChannelForPresenceIdentifier:options:databaseContext:completion:", v21, v15, v20, v18);

  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager rollPresenceChannelWithPresenceIdentifier:isPersonal:completion:].cold.1();

    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __88__SKAInvitationManager_rollPresenceChannelWithPresenceIdentifier_isPersonal_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void (*v23)(void);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copyInvitedUsersFromChannel:toChannel:databaseContext:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));

    if (v9)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "invitedUsers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v12 = objc_msgSend(v10, "_sendInvitationMessageForPresenceChannel:toInvitedUsers:error:", v5, v11, &v24);
      v13 = v24;

      if (v13 || (v12 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "invitedUsers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        +[SKAInvitationManager logger](SKAInvitationManager, "logger");
        v19 = objc_claimAutoreleasedReturnValue();
        v14 = v19;
        if (v13 || v18)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_2();

          v23 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
          goto LABEL_22;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138412290;
          v26 = v20;
          goto LABEL_17;
        }
      }
      else
      {
        +[SKAInvitationManager logger](SKAInvitationManager, "logger");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138412290;
          v26 = v15;
LABEL_17:
          _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Succesfully rolled presence channel with presenceIdentifier: %@", buf, 0xCu);
        }
      }

      objc_msgSend(*(id *)(a1 + 32), "databaseManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "decomissionChannelWithIdentifier:databaseContext:", v22, *(_QWORD *)(a1 + 48));

      v23 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_22:
      v23();

      goto LABEL_23;
    }
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_2();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_23:

}

- (BOOL)_rollEncryptionKeyForChannel:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  BOOL v20;
  id v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Generating new outgoing ratchet", buf, 2u);
  }

  v11 = objc_alloc_init(MEMORY[0x24BE66650]);
  objc_msgSend(v11, "serializedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Storing newly generated outgoing ratchet", buf, 2u);
  }

  v14 = (id)-[SKADatabaseManaging createGeneratedEncryptionKeyWithOriginalOutgoingRatchetState:personalChannel:databaseContext:](self->_databaseManager, "createGeneratedEncryptionKeyWithOriginalOutgoingRatchetState:personalChannel:databaseContext:", v12, v8, v9);
  -[SKADatabaseManaging existingInvitedUsersForPersonalChannel:databaseContext:](self->_databaseManager, "existingInvitedUsersForPersonalChannel:databaseContext:", v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "count");
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (!v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      v28 = (uint64_t)v8;
      _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "Not sending any invitations following key roll as there are no invited users for channel %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (v18)
  {
    v19 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 134217984;
    v28 = v19;
    _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "Messaging %ld existing invited users with the newly generated subscription keys", buf, 0xCu);
  }

  objc_msgSend(v11, "currentSubscriptionKeys");
  v17 = objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v20 = -[SKAInvitationManager _sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:](self, "_sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:", v8, v15, v17, &v26);
  v21 = v26;
  v22 = v21;
  if (v20)
  {

LABEL_12:
    v23 = 1;
    goto LABEL_18;
  }
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[SKAInvitationManager _rollEncryptionKeyForChannel:databaseContext:error:].cold.1();

  if (a5)
    *a5 = objc_retainAutorelease(v22);

  v23 = 0;
LABEL_18:

  return v23;
}

- (BOOL)_sendInvitationMessageForChannel:(id)a3 toInvitedUsers:(id)a4 subscriptionKeys:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  SKAMessagingProviding *messagingProvider;
  void *v36;
  int v37;
  id v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  char v42;
  NSObject *v43;
  void *v45;
  NSObject *v46;
  id v47;
  id *v48;
  char v49;
  void *v50;
  NSObject *obj;
  void *v52;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  uint8_t buf[4];
  unint64_t v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v11 = objc_alloc(MEMORY[0x24BE66648]);
    v12 = objc_msgSend(v10, "index");
    objc_msgSend(v10, "chainKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signingKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v15 = (void *)objc_msgSend(v11, "initWithIndex:chainKey:signingKey:error:", v12, v13, v14, &v63);
    v16 = v63;

    if (!v15)
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager _sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:].cold.2();

      v42 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v16);
      goto LABEL_39;
    }
    objc_msgSend(v15, "serializedData");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "length"))
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v9;
      v56 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      if (v56)
      {
        v48 = a6;
        v45 = v15;
        v46 = v16;
        v50 = v10;
        v47 = v9;
        v49 = 0;
        v55 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v56; ++i)
          {
            if (*(_QWORD *)v60 != v55)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            objc_msgSend(v18, "invitedSKHandle");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_msgSend(v18, "senderSKHandle");
              v20 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "invitationPayload");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              +[SKAInvitationManager logger](SKAInvitationManager, "logger");
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                v23 = objc_msgSend(v50, "index");
                -[NSObject handleString](v20, "handleString");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218498;
                v65 = v23;
                v66 = 2112;
                v67 = v24;
                v68 = 2112;
                v69 = v21;
                _os_log_impl(&dword_2188DF000, v22, OS_LOG_TYPE_DEFAULT, "Sending invitation message with new encryption key ratchet index %ld to handle \"%@\" with invitation payload %@", buf, 0x20u);

              }
              v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              objc_msgSend(v54, "statusType");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("s"));

              objc_msgSend(v54, "identifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("c"));

              objc_msgSend(v52, "base64EncodedStringWithOptions:", 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("r"));

              v29 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(MEMORY[0x24BDBCE60], "date");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "timeIntervalSince1970");
              objc_msgSend(v29, "numberWithDouble:");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v31, CFSTR("d"));

              objc_msgSend(v21, "payloadData");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v32;
              if (v32)
              {
                objc_msgSend(v32, "base64EncodedStringWithOptions:", 0);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "setObject:forKeyedSubscript:", v34, CFSTR("p"));

              }
              messagingProvider = self->_messagingProvider;
              v36 = (void *)objc_msgSend(v25, "copy");
              v57 = 0;
              v58 = 0;
              v37 = -[SKAMessagingProviding sendMessage:toHandle:fromHandle:limitToPresenceCapable:identifier:error:](messagingProvider, "sendMessage:toHandle:fromHandle:limitToPresenceCapable:identifier:error:", v36, v19, v20, 0, &v58, &v57);
              v38 = v58;
              v39 = v57;

              +[SKAInvitationManager logger](SKAInvitationManager, "logger");
              v40 = objc_claimAutoreleasedReturnValue();
              v41 = v40;
              if (v37)
              {
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v65 = (unint64_t)v38;
                  _os_log_impl(&dword_2188DF000, v41, OS_LOG_TYPE_DEFAULT, "Invitation sent successfully. ID: %@", buf, 0xCu);
                }

                v49 = 1;
              }
              else
              {
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  v65 = (unint64_t)v39;
                  v66 = 2112;
                  v67 = v25;
                  v68 = 2112;
                  v69 = v38;
                  _os_log_error_impl(&dword_2188DF000, v41, OS_LOG_TYPE_ERROR, "Invitation send failed with error: %@ message: %@ ID: %@", buf, 0x20u);
                }

                if (v48)
                  *v48 = objc_retainAutorelease(v39);
              }

            }
            else
            {
              +[SKAInvitationManager logger](SKAInvitationManager, "logger");
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v65 = (unint64_t)v18;
                _os_log_error_impl(&dword_2188DF000, v20, OS_LOG_TYPE_ERROR, "Database InvitedUser does not have an invited SKHandle: %@", buf, 0xCu);
              }
            }

          }
          v56 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
        }
        while (v56);
        v16 = v46;
        v9 = v47;
        v10 = v50;
        v15 = v45;
        v42 = v49;
        goto LABEL_38;
      }
    }
    else
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager _sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:].cold.3();
    }
    v42 = 0;
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[SKAInvitationManager _sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:].cold.1();
  v42 = 0;
LABEL_40:

  return v42 & 1;
}

- (BOOL)_sendInvitationMessageForPresenceChannel:(id)a3 toInvitedUsers:(id)a4 error:(id *)a5
{
  id v7;
  char v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  SKAMessagingProviding *messagingProvider;
  void *v17;
  int v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  SKAOutgoingInvitationState *v23;
  void *v24;
  id v25;
  void *v26;
  SKAOutgoingInvitationState *v27;
  id v29;
  id *v30;
  NSObject *obj;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager _sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:].cold.1();
    goto LABEL_26;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v7;
  v35 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (!v35)
  {
LABEL_26:
    v8 = 0;
    goto LABEL_27;
  }
  v30 = a5;
  v29 = v7;
  v8 = 0;
  v34 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v35; ++i)
    {
      if (*(_QWORD *)v39 != v34)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(v10, "invitedSKHandle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v10, "senderSKHandle");
        v12 = objc_claimAutoreleasedReturnValue();
        +[SKAInvitationManager logger](SKAInvitationManager, "logger");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "handleString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v43 = v14;
          _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Sending presence invitation message to handle \"%@\", buf, 0xCu);

        }
        -[SKAInvitationManager _invitationMessageForPresenceChannel:](self, "_invitationMessageForPresenceChannel:", v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        messagingProvider = self->_messagingProvider;
        v17 = (void *)objc_msgSend(v15, "copy");
        v36 = 0;
        v37 = 0;
        v18 = -[SKAMessagingProviding sendMessage:toHandle:fromHandle:limitToPresenceCapable:identifier:error:](messagingProvider, "sendMessage:toHandle:fromHandle:limitToPresenceCapable:identifier:error:", v17, v11, v12, 1, &v37, &v36);
        v19 = v37;
        v20 = v36;

        +[SKAInvitationManager logger](SKAInvitationManager, "logger");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v18)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v43 = v19;
            _os_log_impl(&dword_2188DF000, v22, OS_LOG_TYPE_DEFAULT, "Presence invitation sent successfully. ID:%@", buf, 0xCu);
          }

          v23 = [SKAOutgoingInvitationState alloc];
          v24 = (void *)objc_msgSend(v11, "copy");
          v25 = -[NSObject copy](v12, "copy");
          objc_msgSend(v33, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[SKAOutgoingInvitationState initWithToHandle:fromHandle:channelIdentifier:](v23, "initWithToHandle:fromHandle:channelIdentifier:", v24, v25, v26);

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outgoingInvitationMapping, "setObject:forKeyedSubscript:", v27, v19);
          v8 = 1;
        }
        else
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v43 = v20;
            v44 = 2112;
            v45 = v15;
            v46 = 2112;
            v47 = v19;
            _os_log_error_impl(&dword_2188DF000, v22, OS_LOG_TYPE_ERROR, "Presence invitation send failed with error: %@ message: %@, ID:%@", buf, 0x20u);
          }

          if (v30)
            *v30 = objc_retainAutorelease(v20);
        }

      }
      else
      {
        +[SKAInvitationManager logger](SKAInvitationManager, "logger");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v10;
          _os_log_error_impl(&dword_2188DF000, v12, OS_LOG_TYPE_ERROR, "Database InvitedUser does not have an invited SKHandle: %@", buf, 0xCu);
        }
      }

    }
    v35 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  }
  while (v35);
  v7 = v29;
LABEL_27:

  return v8 & 1;
}

- (id)_invitationMessageForPresenceChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  objc_msgSend(v4, "presenceServerKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presencePeerKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presenceMembershipKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "presenceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("pr"));

  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("c"));

  objc_msgSend(v4, "channelToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("ct"));

  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("sk"));

  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("pk"));

  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("mk"));

  v16 = (void *)MEMORY[0x24BDD16E0];
  -[SKAInvitationManager channelManager](self, "channelManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "serverTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSince1970");
  objc_msgSend(v16, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("d"));

  v20 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "dateChannelCreated");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSince1970");
  objc_msgSend(v20, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("cd"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isPersonal"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("ip"));

  objc_msgSend(v4, "serviceIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, CFSTR("si"));
  return v8;
}

- (id)_validateInvitedHandles:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v20;
    *(_QWORD *)&v8 = 138412290;
    v18 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (-[SKAInvitationManager _validateInvitedHandle:](self, "_validateInvitedHandle:", v12, v18, (_QWORD)v19))
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        else
        {
          +[SKAInvitationManager logger](SKAInvitationManager, "logger");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v24 = v12;
            _os_log_error_impl(&dword_2188DF000, v13, OS_LOG_TYPE_ERROR, "Invited handle failed validation, ignoring: %@", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  if (v15 != objc_msgSend(v6, "count"))
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager _validateInvitedHandles:].cold.1((uint64_t)v14);

  }
  return v14;
}

- (BOOL)_validateInvitedHandle:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(v3, "handleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager _validateInvitedHandle:].cold.1();

  }
  return v5 != 0;
}

- (void)handleIncomingInvitationMessage:(id)a3 fromHandle:(id)a4 fromID:(id)a5 toHandle:(id)a6 messageGuid:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id WeakRetained;
  void *v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  dispatch_queue_t queue;
  NSObject *queuea;
  void *v46;
  char v47;
  void *v48;
  NSObject *v49;
  unsigned int v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  _QWORD block[4];
  id v60;
  NSObject *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint8_t buf[4];
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v57 = a5;
  v58 = a6;
  v14 = a7;
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v13;
    _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Incoming invitation from handle: %@", buf, 0xCu);
  }

  objc_msgSend(v12, "ska_stringForKey:", CFSTR("c"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {
    objc_msgSend(v12, "ska_dateFromUnixTimestampForKey:", CFSTR("d"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.2();
      goto LABEL_85;
    }
    objc_msgSend(v12, "ska_stringForKey:", CFSTR("s"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ska_stringForKey:", CFSTR("pr"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
    -[SKADatabaseManaging existingChannelForSubscriptionIdentifier:databaseContext:](self->_databaseManager, "existingChannelForSubscriptionIdentifier:databaseContext:", v16, v56);
    v54 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v18, "length") && objc_msgSend(v55, "length"))
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.17();
      goto LABEL_84;
    }
    if (-[NSObject length](v18, "length"))
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v20, OS_LOG_TYPE_DEFAULT, "Treating invite as a status invite", buf, 2u);
      }

      if (self->_trafficModeEnabled)
      {
        +[SKAInvitationManager logger](SKAInvitationManager, "logger");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.16();
        goto LABEL_84;
      }
      if (-[NSObject isEqualToString:](v18, "isEqualToString:", CFSTR("com.apple.availability")))
      {
        +[SKAInvitationManager logger](SKAInvitationManager, "logger");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.12();
        goto LABEL_84;
      }
      if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v18))
      {
        +[SKAInvitationManager logger](SKAInvitationManager, "logger");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.15();
        goto LABEL_84;
      }
      objc_msgSend(v12, "ska_dataFrombase64EncodedStringForKey:", CFSTR("r"));
      v51 = objc_claimAutoreleasedReturnValue();
      if (!-[NSObject length](v51, "length"))
      {
        +[SKAInvitationManager logger](SKAInvitationManager, "logger");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.13();

        v19 = v54;
        goto LABEL_66;
      }
      objc_msgSend(v12, "ska_dataFrombase64EncodedStringForKey:", CFSTR("p"));
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v54)
      {
        +[SKAInvitationManager logger](SKAInvitationManager, "logger");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2188DF000, v29, OS_LOG_TYPE_DEFAULT, "No existing channel matches incoming invitation, creating new channel", buf, 2u);
        }

        -[SKADatabaseManaging createChannelForStatusTypeIdentifier:channelIdentifier:databaseContext:](self->_databaseManager, "createChannelForStatusTypeIdentifier:channelIdentifier:databaseContext:", v18, v16, v56);
        v54 = objc_claimAutoreleasedReturnValue();
        if (!v54)
        {
          +[SKAInvitationManager logger](SKAInvitationManager, "logger");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.8();

          goto LABEL_66;
        }
      }
      v46 = 0;
      v49 = 0;
      v52 = 0;
      v53 = 0;
LABEL_50:
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v30, OS_LOG_TYPE_DEFAULT, "Storing received invitation", buf, 2u);
      }

      -[SKADatabaseManaging createReceivedInvitationForChannel:senderHandle:invitedHandle:invitationIdentifier:dateInvitationCreated:incomingRatchetState:presenceIdentifier:channelToken:serverKey:peerKey:invitationPayload:databaseContext:](self->_databaseManager, "createReceivedInvitationForChannel:senderHandle:invitedHandle:invitationIdentifier:dateInvitationCreated:incomingRatchetState:presenceIdentifier:channelToken:serverKey:peerKey:invitationPayload:databaseContext:", v54, v13, v58, v14, v17, v51, v55, v53, v52, v49, v19, v56);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "invitationManager:didReceiveInvitation:forChannel:", self, v31, v54);

      objc_initWeak((id *)buf, self);
      v33 = (void *)os_transaction_create();
      queuea = self->_backgroundCleanupQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __95__SKAInvitationManager_handleIncomingInvitationMessage_fromHandle_fromID_toHandle_messageGuid___block_invoke;
      block[3] = &unk_24D9762C0;
      objc_copyWeak(&v65, (id *)buf);
      v60 = v13;
      v61 = v18;
      v62 = v56;
      v63 = v31;
      v64 = v33;
      v43 = v33;
      v34 = v31;
      dispatch_async(queuea, block);

      objc_destroyWeak(&v65);
      objc_destroyWeak((id *)buf);

LABEL_66:
      v38 = v51;
LABEL_83:
      v54 = v38;
LABEL_84:

LABEL_85:
      goto LABEL_86;
    }
    v21 = objc_msgSend(v55, "length") == 0;
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    v19 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.3();
      goto LABEL_84;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v19, OS_LOG_TYPE_DEFAULT, "Treating invite as a presence invite", buf, 2u);
    }

    if (!-[SKAInvitationManager presenceEnabledByServer](self, "presenceEnabledByServer"))
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
      goto LABEL_84;
    }
    objc_msgSend(v12, "ska_dataFrombase64EncodedStringForKey:", CFSTR("ct"));
    v53 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject length](v53, "length"))
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.4();

      v19 = v54;
      goto LABEL_82;
    }
    objc_msgSend(v12, "ska_dataFrombase64EncodedStringForKey:", CFSTR("pk"));
    v19 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject length](v19, "length"))
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.5();

      goto LABEL_82;
    }
    objc_msgSend(v12, "ska_dataFrombase64EncodedStringForKey:", CFSTR("sk"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "length"))
    {
      objc_msgSend(v12, "ska_numberForKey:", CFSTR("ip"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v23, "BOOLValue");

      if (!v50
        || (-[SKAInvitationManager messagingProvider](self, "messagingProvider"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v47 = objc_msgSend(v24, "isFromIDFromSelfAccount:", v57),
            v24,
            (v47 & 1) != 0))
      {
        objc_msgSend(v12, "ska_dataFrombase64EncodedStringForKey:", CFSTR("mk"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "length"))
        {
          objc_msgSend(v12, "ska_dateFromUnixTimestampForKey:", CFSTR("cd"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v48)
          {
            +[SKAInvitationManager logger](SKAInvitationManager, "logger");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.9();

            -[SKAInvitationManager channelManager](self, "channelManager");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "serverTime");
            v48 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (v54)
            goto LABEL_37;
          +[SKAInvitationManager logger](SKAInvitationManager, "logger");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2188DF000, v27, OS_LOG_TYPE_DEFAULT, "No existing channel matches incoming invitation, creating new channel", buf, 2u);
          }

          objc_msgSend(v12, "ska_stringForKey:", CFSTR("si"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          queue = (dispatch_queue_t)objc_msgSend(objc_alloc(MEMORY[0x24BEB1068]), "initWithServiceIdentifier:", v28);
          -[NSObject setIsPersonal:](queue, "setIsPersonal:", v50);
          -[SKADatabaseManaging createPresenceChannelForPresenceIdentifier:channelIdentifier:channelToken:peerKey:serverKey:membershipKey:creationDate:options:databaseContext:](self->_databaseManager, "createPresenceChannelForPresenceIdentifier:channelIdentifier:channelToken:peerKey:serverKey:membershipKey:creationDate:options:databaseContext:", v55, v16, v53, v19, v52, v46, v48, queue, v56);
          v54 = objc_claimAutoreleasedReturnValue();

          if (v54)
          {
LABEL_37:

            v49 = v19;
            v51 = 0;
            v19 = 0;
            goto LABEL_50;
          }
          +[SKAInvitationManager logger](SKAInvitationManager, "logger");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.8();

        }
        else
        {
          +[SKAInvitationManager logger](SKAInvitationManager, "logger");
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.7();

        }
LABEL_82:
        v38 = v53;
        goto LABEL_83;
      }
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.10();
    }
    else
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.6();
    }

    goto LABEL_82;
  }
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.1();
LABEL_86:

}

void __95__SKAInvitationManager_handleIncomingInvitationMessage_fromHandle_fromID_toHandle_messageGuid___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "databaseManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newBackgroundContext");

  objc_msgSend(WeakRetained, "databaseManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allExistingChannelsForHandle:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Cleaning up ReceivedInvitations from handle: %@", buf, 0xCu);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        objc_msgSend(WeakRetained, "databaseManager", (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cleanupOldReceivedInvitationsForChannelIdentifier:excludingInvitation:databaseContext:", v16, *(_QWORD *)(a1 + 56), v4);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v27 = v18;
    _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "Removing old channels for handle: %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "databaseManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cleanupOldChannelsForHandle:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);

  v20 = (id)objc_opt_self();
}

- (void)isHandleInviteable:(id)a3 fromHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, _QWORD, void *);
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (v9
    && (-[SKAInvitationManager messagingProvider](self, "messagingProvider"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isHandleAvailableToMessageFrom:", v9),
        v11,
        (v12 & 1) == 0))
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager isHandleInviteable:fromHandle:completion:].cold.1();

    +[SKAInvitationManager _invalidSenderHandleError](SKAInvitationManager, "_invalidSenderHandleError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v14);
  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "fromHandle \"%@\" is a valid sender handle for active iCloud account", buf, 0xCu);
    }

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __65__SKAInvitationManager_isHandleInviteable_fromHandle_completion___block_invoke;
    v16[3] = &unk_24D9762E8;
    v17 = v8;
    v18 = v10;
    -[SKAInvitationManager _isHandleInviteable:completion:](self, "_isHandleInviteable:completion:", v17, v16);

    v14 = v17;
  }

}

uint64_t __65__SKAInvitationManager_isHandleInviteable_fromHandle_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "toHandle \"%@\" inviteability check completed with result: %d", (uint8_t *)&v7, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_isHandleInviteable:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[SKAInvitationManager _validateInvitedHandle:](self, "_validateInvitedHandle:", v6))
  {
    -[SKAInvitationManager messagingProvider](self, "messagingProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__SKAInvitationManager__isHandleInviteable_completion___block_invoke;
    v10[3] = &unk_24D976270;
    v11 = v7;
    objc_msgSend(v8, "isHandleMessageable:completion:", v6, v10);

  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager _isHandleInviteable:completion:].cold.1();

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __55__SKAInvitationManager__isHandleInviteable_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)isPresenceHandleInviteable:(id)a3 fromHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, _QWORD, void *);
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (v9
    && (-[SKAInvitationManager messagingProvider](self, "messagingProvider"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isHandleAvailableToMessageFrom:", v9),
        v11,
        (v12 & 1) == 0))
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager isPresenceHandleInviteable:fromHandle:completion:].cold.1();

    +[SKAInvitationManager _invalidSenderHandleError](SKAInvitationManager, "_invalidSenderHandleError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v14);
  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "fromHandle \"%@\" is a valid sender handle for active iCloud account", buf, 0xCu);
    }

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __73__SKAInvitationManager_isPresenceHandleInviteable_fromHandle_completion___block_invoke;
    v16[3] = &unk_24D9762E8;
    v17 = v8;
    v18 = v10;
    -[SKAInvitationManager _isPresenceHandleInviteable:completion:](self, "_isPresenceHandleInviteable:completion:", v17, v16);

    v14 = v17;
  }

}

uint64_t __73__SKAInvitationManager_isPresenceHandleInviteable_fromHandle_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "toHandle \"%@\" inviteability check completed with result: %d", (uint8_t *)&v7, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_isPresenceHandleInviteable:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[SKAInvitationManager _validateInvitedHandle:](self, "_validateInvitedHandle:", v6))
  {
    -[SKAInvitationManager messagingProvider](self, "messagingProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __63__SKAInvitationManager__isPresenceHandleInviteable_completion___block_invoke;
    v10[3] = &unk_24D976270;
    v11 = v7;
    objc_msgSend(v8, "isHandleMessageableForPresence:completion:", v6, v10);

  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager _isHandleInviteable:completion:].cold.1();

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __63__SKAInvitationManager__isPresenceHandleInviteable_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchHandleInvitability:(id)a3 fromHandle:(id)a4 forStatusTypeIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  SKADatabaseManaging *databaseManager;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  BOOL v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  databaseManager = self->_databaseManager;
  v14 = a5;
  v15 = (void *)-[SKADatabaseManaging newBackgroundContext](databaseManager, "newBackgroundContext");
  -[SKAInvitationManager databaseManager](self, "databaseManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "existingRemovedUserWithHandle:statusTypeIdentifier:withDatabaseContext:", v10, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "handle \"%@\" is present as a removed user", buf, 0xCu);
    }

  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __94__SKAInvitationManager_fetchHandleInvitability_fromHandle_forStatusTypeIdentifier_completion___block_invoke;
  v20[3] = &unk_24D976310;
  v22 = v17 != 0;
  v21 = v12;
  v19 = v12;
  -[SKAInvitationManager isHandleInviteable:fromHandle:completion:](self, "isHandleInviteable:fromHandle:completion:", v10, v11, v20);

}

void __94__SKAInvitationManager_fetchHandleInvitability_fromHandle_forStatusTypeIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;

  v5 = (objc_class *)MEMORY[0x24BEB1038];
  v6 = a3;
  v7 = (id)objc_msgSend([v5 alloc], "initWithIsInvitable:wasRemoved:", a2, *(unsigned __int8 *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchHandleInvitability:(id)a3 fromHandle:(id)a4 forPresenceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  SKADatabaseManaging *databaseManager;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  BOOL v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  databaseManager = self->_databaseManager;
  v14 = a5;
  v15 = (void *)-[SKADatabaseManaging newBackgroundContext](databaseManager, "newBackgroundContext");
  -[SKAInvitationManager databaseManager](self, "databaseManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "existingRemovedUserWithHandle:presenceIdentifier:withDatabaseContext:", v10, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "handle \"%@\" is present as a removed user", buf, 0xCu);
    }

  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __92__SKAInvitationManager_fetchHandleInvitability_fromHandle_forPresenceIdentifier_completion___block_invoke;
  v20[3] = &unk_24D976310;
  v22 = v17 != 0;
  v21 = v12;
  v19 = v12;
  -[SKAInvitationManager isPresenceHandleInviteable:fromHandle:completion:](self, "isPresenceHandleInviteable:fromHandle:completion:", v10, v11, v20);

}

void __92__SKAInvitationManager_fetchHandleInvitability_fromHandle_forPresenceIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;

  v5 = (objc_class *)MEMORY[0x24BEB1038];
  v6 = a3;
  v7 = (id)objc_msgSend([v5 alloc], "initWithIsInvitable:wasRemoved:", a2, *(unsigned __int8 *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:(id)a3 databaseContext:(id)a4 invitationWasSentViaKeyRoll:(BOOL *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  BOOL v24;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "currentOutgoingRatchet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      objc_msgSend(v12, "currentSubscriptionKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v29 = objc_msgSend(v15, "index");
      _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Found existing encryption keys, attempting to ratchet forward from current ratchet index: %ld", buf, 0xCu);

    }
    if ((objc_msgSend(v12, "ratchetForward") & 1) != 0)
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "currentSubscriptionKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "index");
        *(_DWORD *)buf = 134217984;
        v29 = v18;
        _os_log_impl(&dword_2188DF000, v16, OS_LOG_TYPE_DEFAULT, "Ratchet forward succeeded. New ratchet index: %ld. Persisting this state.", buf, 0xCu);

      }
      objc_msgSend(v12, "serializedData");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[SKAInvitationManager databaseManager](self, "databaseManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updatePersonalChannel:withCurrentOutgoingRatchetState:databaseContext:", v10, v19, v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      *a5 = 0;
      if (!a6)
        goto LABEL_22;
LABEL_16:
      *a6 = 0;
      goto LABEL_22;
    }
    v26 = 0;
    v24 = -[SKAInvitationManager _rollEncryptionKeyForChannel:databaseContext:error:](self, "_rollEncryptionKeyForChannel:databaseContext:error:", v10, v11, &v26);
    v19 = v26;
    if (v24)
    {
LABEL_15:
      *a5 = 1;
      v21 = 0;
      if (!a6)
        goto LABEL_22;
      goto LABEL_16;
    }
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager _ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:databaseContext:invitationWasSentViaKeyRoll:error:].cold.2();
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Channel has no existing encryption key data, initiating key roll to generate first key", buf, 2u);
    }

    v27 = 0;
    v22 = -[SKAInvitationManager _rollEncryptionKeyForChannel:databaseContext:error:](self, "_rollEncryptionKeyForChannel:databaseContext:error:", v10, v11, &v27);
    v19 = v27;
    if (v22)
      goto LABEL_15;
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[SKAInvitationManager _ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:databaseContext:invitationWasSentViaKeyRoll:error:].cold.1();
  }

  if (a6)
    *a6 = objc_retainAutorelease(v19);
  v21 = 0;
  *a5 = 0;
LABEL_22:

  return v21;
}

- (id)_addInvitedHandles:(id)a3 senderHandle:(id)a4 toDatabaseForPersonalChannel:(id)a5 withInvitationPayload:(id)a6 databaseContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  SKADatabaseManaging *databaseManager;
  void *v25;
  void *v26;
  NSObject *v27;
  SKADatabaseManaging *v28;
  NSObject *v29;
  void *v30;
  __int128 v32;
  id v33;
  id obj;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v36 = a4;
  v13 = a5;
  v35 = a6;
  v14 = a7;
  v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v12;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v38;
    *(_QWORD *)&v16 = 138412290;
    v32 = v16;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v20, "handleString", v32);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length");

        if (v22)
        {
          -[SKAInvitationManager _updateOrCreateInvitedUserWithHandle:senderHandle:onChannel:withInvitationPayload:databaseContext:](self, "_updateOrCreateInvitedUserWithHandle:senderHandle:onChannel:withInvitationPayload:databaseContext:", v20, v36, v13, v35, v14);
          v23 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject count](v23, "count"))
          {
            objc_msgSend(v33, "addObjectsFromArray:", v23);
            databaseManager = self->_databaseManager;
            objc_msgSend(v13, "statusType");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKADatabaseManaging existingRemovedUserWithHandle:statusTypeIdentifier:withDatabaseContext:](databaseManager, "existingRemovedUserWithHandle:statusTypeIdentifier:withDatabaseContext:", v20, v25, v14);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26)
              goto LABEL_17;
            +[SKAInvitationManager logger](SKAInvitationManager, "logger");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v32;
              v42 = v20;
              _os_log_impl(&dword_2188DF000, v27, OS_LOG_TYPE_DEFAULT, "Removing handle %@ from removed users because of invite", buf, 0xCu);
            }

            v28 = self->_databaseManager;
            objc_msgSend(v13, "statusType");
            v29 = objc_claimAutoreleasedReturnValue();
            -[SKADatabaseManaging deleteRemovedUserWithHandle:statusTypeIdentifier:databaseContext:](v28, "deleteRemovedUserWithHandle:statusTypeIdentifier:databaseContext:", v20, v29, v14);
          }
          else
          {
            +[SKAInvitationManager logger](SKAInvitationManager, "logger");
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v32;
              v42 = v20;
              _os_log_error_impl(&dword_2188DF000, v29, OS_LOG_TYPE_ERROR, "Error fetching or update invited user for handle: %@", buf, 0xCu);
            }
          }

        }
        else
        {
          +[SKAInvitationManager logger](SKAInvitationManager, "logger");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v32;
            v42 = v20;
            _os_log_error_impl(&dword_2188DF000, v23, OS_LOG_TYPE_ERROR, "Invited handle has a nil handle string: %@", buf, 0xCu);
          }
        }
LABEL_17:

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v17);
  }

  v30 = (void *)objc_msgSend(v33, "copy");
  return v30;
}

- (id)_addInvitedHandles:(id)a3 senderHandle:(id)a4 toDatabaseForPresenceChannel:(id)a5 databaseContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  SKADatabaseManaging *databaseManager;
  void *v23;
  void *v24;
  NSObject *v25;
  SKADatabaseManaging *v26;
  NSObject *v27;
  void *v28;
  __int128 v30;
  id v31;
  id obj;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v33 = a4;
  v11 = a5;
  v12 = a6;
  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v35;
    *(_QWORD *)&v14 = 138412290;
    v30 = v14;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v18, "handleString", v30);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (v20)
        {
          -[SKAInvitationManager _updateOrCreateInvitedUserWithHandle:senderHandle:onChannel:withInvitationPayload:databaseContext:](self, "_updateOrCreateInvitedUserWithHandle:senderHandle:onChannel:withInvitationPayload:databaseContext:", v18, v33, v11, 0, v12);
          v21 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject count](v21, "count"))
          {
            objc_msgSend(v31, "addObjectsFromArray:", v21);
            databaseManager = self->_databaseManager;
            objc_msgSend(v11, "presenceIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKADatabaseManaging existingRemovedUserWithHandle:presenceIdentifier:withDatabaseContext:](databaseManager, "existingRemovedUserWithHandle:presenceIdentifier:withDatabaseContext:", v18, v23, v12);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v24)
              goto LABEL_17;
            +[SKAInvitationManager logger](SKAInvitationManager, "logger");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v30;
              v39 = v18;
              _os_log_impl(&dword_2188DF000, v25, OS_LOG_TYPE_DEFAULT, "Removing handle %@ from removed users because of invite", buf, 0xCu);
            }

            v26 = self->_databaseManager;
            objc_msgSend(v11, "presenceIdentifier");
            v27 = objc_claimAutoreleasedReturnValue();
            -[SKADatabaseManaging deleteRemovedUserWithHandle:presenceIdentifier:databaseContext:](v26, "deleteRemovedUserWithHandle:presenceIdentifier:databaseContext:", v18, v27, v12);
          }
          else
          {
            +[SKAInvitationManager logger](SKAInvitationManager, "logger");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v30;
              v39 = v18;
              _os_log_error_impl(&dword_2188DF000, v27, OS_LOG_TYPE_ERROR, "Error fetching or update invited user for handle: %@", buf, 0xCu);
            }
          }

        }
        else
        {
          +[SKAInvitationManager logger](SKAInvitationManager, "logger");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v30;
            v39 = v18;
            _os_log_error_impl(&dword_2188DF000, v21, OS_LOG_TYPE_ERROR, "Invited handle has a nil handle string: %@", buf, 0xCu);
          }
        }
LABEL_17:

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v15);
  }

  v28 = (void *)objc_msgSend(v31, "copy");
  return v28;
}

- (id)_updateOrCreateInvitedUserWithHandle:(id)a3 senderHandle:(id)a4 onChannel:(id)a5 withInvitationPayload:(id)a6 databaseContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void **v17;
  NSObject *v18;
  id v19;
  id v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  void **v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  _BOOL4 v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v43;
  id v44;
  id v45;
  id v46;
  char v47;
  id obj;
  SKAInvitationManager *v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t v52;
  char v53[15];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v45 = a7;
  v46 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v49 = self;
  -[SKADatabaseManaging existingInvitedUsersForInvitedHandle:onChannel:databaseContext:](self->_databaseManager, "existingInvitedUsersForInvitedHandle:onChannel:databaseContext:", v12, v14, v45);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void **)&off_24D975000;
  if (!objc_msgSend(v16, "count"))
    goto LABEL_30;
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v60 = objc_msgSend(v16, "count");
    v61 = 2112;
    v62 = v12;
    _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Found %ld existing invited user for invitedHandle %@ (ignoring sender handle).", buf, 0x16u);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v19 = v16;
  v51 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (!v51)
  {

LABEL_30:
    objc_msgSend(v17[306], "logger");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v60 = (uint64_t)v12;
      v61 = 2112;
      v62 = v13;
      _os_log_impl(&dword_2188DF000, v38, OS_LOG_TYPE_DEFAULT, "Could not find an existing invited user matching handle: %@ and senderHandle %@, attempting to create a new one.", buf, 0x16u);
    }

    -[SKADatabaseManaging createInvitedUserWithHandle:senderHandle:invitationPayload:channel:databaseContext:](v49->_databaseManager, "createInvitedUserWithHandle:senderHandle:invitationPayload:channel:databaseContext:", v12, v13, v15, v14, v45);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v46, "addObject:", v39);
    }
    else
    {
      objc_msgSend(v17[306], "logger");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager _updateOrCreateInvitedUserWithHandle:senderHandle:onChannel:withInvitationPayload:databaseContext:].cold.1();

    }
    goto LABEL_38;
  }
  v43 = v16;
  v44 = v12;
  v47 = 0;
  v50 = *(_QWORD *)v55;
  v20 = v45;
  obj = v19;
  do
  {
    for (i = 0; i != v51; ++i)
    {
      if (*(_QWORD *)v55 != v50)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
      objc_msgSend(v22, "senderSKHandle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isNormalizedEqualToHandle:", v13);
      v25 = v17;
      objc_msgSend(v17[306], "logger");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v24)
      {
        if (v27)
        {
          objc_msgSend(v13, "handleString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v60 = (uint64_t)v28;
          _os_log_impl(&dword_2188DF000, v26, OS_LOG_TYPE_DEFAULT, "Existing invited user was invited from the same handle: %@. Updating payload, and not creating a new InvitedUser record.", buf, 0xCu);

        }
        v47 = 1;
      }
      else if (v27)
      {
        objc_msgSend(v23, "handleString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleString");
        v30 = v15;
        v31 = v13;
        v32 = v14;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v60 = (uint64_t)v29;
        v61 = 2112;
        v62 = v33;
        _os_log_impl(&dword_2188DF000, v26, OS_LOG_TYPE_DEFAULT, "Existing invited user was invited from %@, but we are attempting to invite from %@. Will update this users payload, but may still need to create a new InvitedUser record", buf, 0x16u);

        v14 = v32;
        v13 = v31;
        v15 = v30;
        v20 = v45;

      }
      objc_msgSend(v22, "invitationPayload");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25[306], "logger");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      if (v34 == v15)
      {
        if (v36)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2188DF000, v35, OS_LOG_TYPE_DEFAULT, "Invitation payload is already up to date", buf, 2u);
        }
      }
      else
      {
        if (v36)
        {
          *(_DWORD *)buf = 138412290;
          v60 = (uint64_t)v22;
          _os_log_impl(&dword_2188DF000, v35, OS_LOG_TYPE_DEFAULT, "Updating invitation payload on invitedUser: %@", buf, 0xCu);
        }

        -[SKADatabaseManaging updateInvitationPayload:onExistingInvitedUser:channel:databaseContext:](v49->_databaseManager, "updateInvitationPayload:onExistingInvitedUser:channel:databaseContext:", v15, v22, v14, v20);
        v35 = objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          objc_msgSend(v46, "addObject:", v35);
        }
        else
        {
          objc_msgSend(v25[306], "logger");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[SKAInvitationManager _updateOrCreateInvitedUserWithHandle:senderHandle:onChannel:withInvitationPayload:databaseContext:].cold.2(&v52, v53, v37);

        }
      }

      v17 = v25;
    }
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  }
  while (v51);

  v16 = v43;
  v12 = v44;
  if ((v47 & 1) == 0)
    goto LABEL_30;
LABEL_38:
  v41 = (void *)objc_msgSend(v46, "copy");

  return v41;
}

- (void)_findOrCreatePersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  void (**v14)(id, void *, _QWORD);
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  -[SKADatabaseManaging existingPersonalChannelForStatusTypeIdentifier:databaseContext:](self->_databaseManager, "existingPersonalChannelForStatusTypeIdentifier:databaseContext:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v10[2](v10, v11, 0);
  }
  else
  {
    +[SKAInvitationManager logger](SKAInvitationManager, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Could not find an existing personal status channel, attempting to create a new one.", buf, 2u);
    }

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __103__SKAInvitationManager__findOrCreatePersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke;
    v13[3] = &unk_24D976338;
    v14 = v10;
    -[SKAInvitationManager _createPersonalChannelForStatusTypeIdentifier:databaseContext:completion:](self, "_createPersonalChannelForStatusTypeIdentifier:databaseContext:completion:", v8, v9, v13);

  }
}

uint64_t __103__SKAInvitationManager__findOrCreatePersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_createPersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4 completion:(id)a5
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
  v15[2] = __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke;
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

void __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  v11 = WeakRetained;
  if (v9)
  {
    if (objc_msgSend(WeakRetained, "_shouldReauthForError:", v9))
    {
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_cold_1();

      objc_msgSend(a1[4], "accountProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_69;
      v16[3] = &unk_24D976388;
      v16[4] = v11;
      objc_copyWeak(&v20, a1 + 8);
      v19 = a1[7];
      v17 = a1[5];
      v18 = a1[6];
      objc_msgSend(v13, "refreshCredentialForPrimaryAccountWithCompletion:", v16);

      objc_destroyWeak(&v20);
    }
    else
    {
      (*((void (**)(void))a1[7] + 2))();
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "databaseManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createPersonalChannelForStatusTypeIdentifier:channelIdentifier:channelToken:databaseContext:", a1[5], v7, v8, a1[6]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void))a1[7] + 2))();
  }

}

void __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_69(id *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[16];

  v5 = a3;
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Account refresh succeeded, reattempting channel creation", buf, 2u);
    }

    objc_msgSend(a1[4], "channelManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_70;
    v9[3] = &unk_24D976360;
    objc_copyWeak(&v13, a1 + 8);
    v12 = a1[7];
    v10 = a1[5];
    v11 = a1[6];
    objc_msgSend(v8, "createChannelWithCompletion:", v9);

    objc_destroyWeak(&v13);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_69_cold_1();

    (*((void (**)(void))a1[7] + 2))();
  }

}

void __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_70(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v10 = WeakRetained;
  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(WeakRetained, "databaseManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createPersonalChannelForStatusTypeIdentifier:channelIdentifier:channelToken:databaseContext:", *(_QWORD *)(a1 + 32), v13, v7, *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
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
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager _shouldReauthForError:].cold.1();
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
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager _shouldReauthForError:].cold.2();
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
      +[SKAInvitationManager logger](SKAInvitationManager, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SKAInvitationManager _shouldReauthForError:].cold.3();
      goto LABEL_15;
    }
  }
  else
  {

  }
  +[SKAInvitationManager logger](SKAInvitationManager, "logger");
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

+ (id)_invalidSenderHandleError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sender handle is invalid, or could not determine a valid default sender handle."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BEB10D0];
  v8 = *MEMORY[0x24BDD0BA0];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -8000, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_invalidInvitedHandlesError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invited handles are invalid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BEB10D0];
  v8 = *MEMORY[0x24BDD0BA0];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -4001, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find or create a channel to send invitation for status of type \"%@\"."), a3);
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

+ (id)_noPresenceChannelForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find or create a channel to send invitation for presence \"%@\"."), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEB10D0];
  v9 = *MEMORY[0x24BDD0BA0];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -3100, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_keyRollFailedErrorWithUnderlyingError:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Key roll failed"), *MEMORY[0x24BDD0BA0]);
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BDD1398]);
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BEB10D0];
  v7 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, -6000, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_unableToFindExistingInvitationForHandlesError:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "handleString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not uninvite handle(s) \"%@\" because we could not find an existing invitation for those handle(s)"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD1540];
  v14 = *MEMORY[0x24BEB10D0];
  v22 = *MEMORY[0x24BDD0BA0];
  v23 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, -5000, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_unableToFindAnyExistingInvitationToDeleteError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10D0];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("Could not any existing invitations to delete");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -5000, v4);
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

+ (id)logger
{
  if (logger_onceToken_0 != -1)
    dispatch_once(&logger_onceToken_0, &__block_literal_global_0);
  return (id)logger__logger_0;
}

void __30__SKAInvitationManager_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAInvitationManager");
  v1 = (void *)logger__logger_0;
  logger__logger_0 = (uint64_t)v0;

}

- (SKAInvitationManagingDelegate)delegate
{
  return (SKAInvitationManagingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManager, a3);
}

- (SKAMessagingProviding)messagingProvider
{
  return self->_messagingProvider;
}

- (void)setMessagingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_messagingProvider, a3);
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

- (SKAPresenceManaging)presenceManager
{
  return self->_presenceManager;
}

- (void)setPresenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_presenceManager, a3);
}

- (OS_dispatch_queue)backgroundCleanupQueue
{
  return self->_backgroundCleanupQueue;
}

- (void)setBackgroundCleanupQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundCleanupQueue, a3);
}

- (NSMutableDictionary)outgoingInvitationMapping
{
  return self->_outgoingInvitationMapping;
}

- (void)setOutgoingInvitationMapping:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingInvitationMapping, a3);
}

- (BOOL)trafficModeEnabled
{
  return self->_trafficModeEnabled;
}

- (void)setTrafficModeEnabled:(BOOL)a3
{
  self->_trafficModeEnabled = a3;
}

- (BOOL)presenceEnabledByServer
{
  return self->_presenceEnabledByServer;
}

- (void)setPresenceEnabledByServer:(BOOL)a3
{
  self->_presenceEnabledByServer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingInvitationMapping, 0);
  objc_storeStrong((id *)&self->_backgroundCleanupQueue, 0);
  objc_storeStrong((id *)&self->_presenceManager, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_messagingProvider, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Request to invite handles contains no valid handles to invite. InvitedHandles: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error resolving sender handle. UnresolvedSenderHandle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not find or create personal channel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_3(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v1, v2, "Inivtation was not sent for handles %@ due to key roll error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

void __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error fetching or creating personal channel: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendInvitationForPresenceChannelWithPresenceIdentifier:(void *)a1 toHandles:(NSObject *)a2 fromSenderHandle:options:completion:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_2188DF000, a2, OS_LOG_TYPE_ERROR, "Presence has been disabled by the server for identifier %@.", v4, 0xCu);

}

- (void)sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Presence has been disabled by the server.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __125__SKAInvitationManager_sendInvitationForPresenceChannelWithPresenceIdentifier_toHandles_fromSenderHandle_options_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not find or create presence channel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __125__SKAInvitationManager_sendInvitationForPresenceChannelWithPresenceIdentifier_toHandles_fromSenderHandle_options_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error fetching or creating presence channel: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __105__SKAInvitationManager_sendSelfInvitationForPresenceChannelWithPresenceIdentifier_isPersonal_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2188DF000, a2, a3, "Could not find channel for presence identifier %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not find existing personal channel to revoke all invitations for", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Unable to find any invitations to revoke, taking no action, returning error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)revokeInvitationFromPersonalChannelWithStatusTypeIdentifier:forHandles:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not find existing personal channel to revoke invitations for", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Not rolling encryption key because a personal channel does not exist for statusTypeIdentifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:(uint64_t)a1 error:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v1, v2, "Error encounted during key roll for statusTypeIdentifier: %@ error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not find channel ID matching message ID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not find channel matching channel ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Invitation message failed to send! Removing record of invitation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)rollPersonalChannelWithStatusTypeIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Asked to roll personal channel for %@, but no channel exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Channel creation failed! Aborting channel roll.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Failed to copy invited users! Aborting channel roll.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)rollPresenceChannelWithPresenceIdentifier:isPersonal:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Asked to roll presence channel for %@, but no channel exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_rollEncryptionKeyForChannel:databaseContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Outgoing IDS messages for encryption key roll failed to send: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Failing to send invitation to zero invited users", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error generating incoming ratchet: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Error serializing incoming ratchet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_validateInvitedHandles:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v1, v2, "Validated invited handle set does not match unvalidated handles. Unvalidated set may have contained duplicate or invalid handles. Validated: %@ Unvalidated: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)_validateInvitedHandle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invited handle has a nil handle string: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation message missing channel identifier, dropping invitation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation message missing date invitation created, dropping invitation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation missing presence and status identifiers, dropping invitation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation message missing channel token, dropping invitation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation message missing peer key data, dropping invitation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation message missing server key data, dropping invitation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation message missing membership key data, dropping invitation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not find or create channel for incoming invitation, dropping invitation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Invitation message missing date channel created. Using current server time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation message is for a personal presence channel but does not come from a device on our account: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation message uses legacy status type identifier, dropping invitation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation message missing incoming ratchet state, dropping invitation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Status type %@ disabled by server. Dropping incoming status update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "We're in traffic mode--dropping incoming invitation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation message has both status and presence, dropping invitation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isHandleInviteable:fromHandle:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "fromHandle \"%@\" is NOT a valid sender handle for active iCloud account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_isHandleInviteable:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Handle is invalid, and not inviteable: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isPresenceHandleInviteable:fromHandle:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "fromHandle \"%@\" is NOT a valid sender handle for active iCloud account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:databaseContext:invitationWasSentViaKeyRoll:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Generating first encryption key for personal channel failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:databaseContext:invitationWasSentViaKeyRoll:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Rolling encryption key for personal channel failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_updateOrCreateInvitedUserWithHandle:senderHandle:onChannel:withInvitationPayload:databaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Received a nil created user from createInvitedUserWithHandle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateOrCreateInvitedUserWithHandle:(os_log_t)log senderHandle:onChannel:withInvitationPayload:databaseContext:.cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2188DF000, log, OS_LOG_TYPE_ERROR, "Received a nil updated user from call to updateInvitationPayload", buf, 2u);
}

void __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Account refresh required for error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_69_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Account refresh failed with error: %@", v2, v3, v4, v5, v6);
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

@end

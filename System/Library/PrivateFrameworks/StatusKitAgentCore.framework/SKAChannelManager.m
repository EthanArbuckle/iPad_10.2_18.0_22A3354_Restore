@implementation SKAChannelManager

- (SKAChannelManager)initWithPushManager:(id)a3 accountProvider:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  SKAChannelManager *v12;
  SKAChannelManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SKAChannelManager;
  v12 = -[SKAChannelManager init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pushManager, a3);
    -[SKAPushManaging setDelegate:](v13->_pushManager, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_accountProvider, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (void)createChannelWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  AuthCredential *v6;
  void *v7;
  SharedChannelCreateRequest *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Received request to create a personal channel", buf, 2u);
  }

  v6 = objc_alloc_init(AuthCredential);
  -[SKAChannelManager _getStatusJWTToken](self, "_getStatusJWTToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[AuthCredential setSimpleJwt:](v6, "setSimpleJwt:", v7);
    v8 = objc_alloc_init(SharedChannelCreateRequest);
    -[SharedChannelCreateRequest setAuthCredential:](v8, "setAuthCredential:", v6);
    -[SharedChannelCreateRequest setChannelOwnershipType:](v8, "setChannelOwnershipType:", 0);
    -[SharedChannelCreateRequest setChannelTopic:](v8, "setChannelTopic:", CFSTR("com.apple.icloud.presence.mode.status"));
    -[SharedChannelCreateRequest data](v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Asking push manager to execute create channel request", buf, 2u);
    }

    -[SKAChannelManager pushManager](self, "pushManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __49__SKAChannelManager_createChannelWithCompletion___block_invoke;
    v13[3] = &unk_24D9766E8;
    v14 = v4;
    objc_msgSend(v11, "createChannelWithProtoData:completion:", v9, v13);

  }
  else
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SKAChannelManager createChannelWithCompletion:].cold.1();

    +[SKAChannelManager _jwtTokenNotFoundError](SKAChannelManager, "_jwtTokenNotFoundError");
    v8 = (SharedChannelCreateRequest *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, SharedChannelCreateRequest *))v4 + 2))(v4, 0, 0, v8);
  }

}

void __49__SKAChannelManager_createChannelWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  SharedChannelCreateResponse *v9;
  uint64_t v10;
  __CFString *v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  void (*v17)(void);
  __CFString *v18;
  NSObject *v19;
  NSObject *v20;
  unsigned int v21;
  void *v22;
  uint8_t buf[4];
  SharedChannelCreateResponse *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __49__SKAChannelManager_createChannelWithCompletion___block_invoke_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Channel create response received", buf, 2u);
    }

    v9 = -[SharedChannelCreateResponse initWithData:]([SharedChannelCreateResponse alloc], "initWithData:", v5);
    v10 = -[SharedChannelCreateResponse status](v9, "status");
    v11 = CFSTR("AUTH_EXPIRED");
    switch((int)v10)
    {
      case 0:
        +[SKAChannelManager logger](SKAChannelManager, "logger");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v9;
          _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Channel create success response received: %@", buf, 0xCu);
        }

        -[SharedChannelCreateResponse channelIdentity](v9, "channelIdentity");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString channelId](v13, "channelId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        -[__CFString channelToken](v13, "channelToken");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
        goto LABEL_29;
      case 1:
        goto LABEL_19;
      case 2:
        v11 = CFSTR("AUTH_FAILED");
        goto LABEL_19;
      case 3:
        v11 = CFSTR("BAD_REQUEST");
        goto LABEL_19;
      case 4:
        v11 = CFSTR("CHANNEL_IDENTITY_VALIDATION_FAILED");
        goto LABEL_19;
      case 5:
        v11 = CFSTR("INTERNAL_ERROR");
        goto LABEL_19;
      case 6:
        v11 = CFSTR("STALE_PUBLISH_REJECTED");
        goto LABEL_19;
      case 7:
        v11 = CFSTR("RATE_LIMITED");
        goto LABEL_19;
      case 8:
        v11 = CFSTR("INVALID_NONCE");
        goto LABEL_19;
      default:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v18 = CFSTR("Generic non-success response status");
        if (v11)
          v18 = v11;
        v13 = v18;

        +[SKAChannelManager logger](SKAChannelManager, "logger");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __49__SKAChannelManager_createChannelWithCompletion___block_invoke_cold_1();

        v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD0FC8]);
        if (-[SharedChannelCreateResponse hasRetryIntervalSeconds](v9, "hasRetryIntervalSeconds")
          && -[SharedChannelCreateResponse retryIntervalSeconds](v9, "retryIntervalSeconds"))
        {
          +[SKAChannelManager logger](SKAChannelManager, "logger");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = -[SharedChannelCreateResponse retryIntervalSeconds](v9, "retryIntervalSeconds");
            *(_DWORD *)buf = 134217984;
            v24 = (SharedChannelCreateResponse *)v21;
            _os_log_impl(&dword_2188DF000, v20, OS_LOG_TYPE_DEFAULT, "Retry interval specified: %ld", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[SharedChannelCreateResponse retryIntervalSeconds](v9, "retryIntervalSeconds"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, SKAChannelManagerErrorRetryIntervalKey);

        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKPushManagerErrorDomain"), (int)v10, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_29:
        v17();

        break;
    }
  }

}

- (void)createPresenceChannelWithMembershipKey:(id)a3 serverKey:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  AuthCredential *v14;
  SharedOwnershipAuth *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SharedChannelCreateRequest *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v27 = a5;
  v12 = a6;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Received request to create a presence channel", buf, 2u);
  }

  v14 = objc_alloc_init(AuthCredential);
  v15 = objc_alloc_init(SharedOwnershipAuth);
  -[SKAChannelManager _getPresenceJWTToken](self, "_getPresenceJWTToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[SharedOwnershipAuth setSimpleJwt:](v15, "setSimpleJwt:", v16);
    objc_msgSend(v10, "publicKeyMaterial");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setChannelPublicKey:](v15, "setChannelPublicKey:", v17);

    v26 = v11;
    objc_msgSend(v11, "keyMaterial");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setServerEncryptionKey:](v15, "setServerEncryptionKey:", v18);

    -[SKAChannelManager _getNonce](self, "_getNonce");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setNonce:](v15, "setNonce:", v19);
    objc_msgSend(v10, "signPayload:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setSignNonce:](v15, "setSignNonce:", v20);

    -[AuthCredential setSharedOwnershipAuth:](v14, "setSharedOwnershipAuth:", v15);
    v21 = objc_alloc_init(SharedChannelCreateRequest);
    -[SharedChannelCreateRequest setAuthCredential:](v21, "setAuthCredential:", v14);
    -[SharedChannelCreateRequest setChannelOwnershipType:](v21, "setChannelOwnershipType:", 1);
    -[SharedChannelCreateRequest setChannelTopic:](v21, "setChannelTopic:", CFSTR("com.apple.icloud.presence.shared.experience"));
    -[SharedChannelCreateRequest setAdopter:](v21, "setAdopter:", v27);
    -[SharedChannelCreateRequest data](v21, "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v23, OS_LOG_TYPE_DEFAULT, "Asking push manager to execute create presence channel request", buf, 2u);
    }

    -[SKAChannelManager pushManager](self, "pushManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __99__SKAChannelManager_createPresenceChannelWithMembershipKey_serverKey_serviceIdentifier_completion___block_invoke;
    v28[3] = &unk_24D9766E8;
    v29 = v12;
    objc_msgSend(v24, "createChannelWithProtoData:completion:", v22, v28);

    v11 = v26;
  }
  else
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SKAChannelManager createChannelWithCompletion:].cold.1();

    +[SKAChannelManager _jwtTokenNotFoundError](SKAChannelManager, "_jwtTokenNotFoundError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v19);
  }

}

void __99__SKAChannelManager_createPresenceChannelWithMembershipKey_serverKey_serviceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  SharedChannelCreateResponse *v9;
  uint64_t v10;
  __CFString *v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  void (*v17)(void);
  __CFString *v18;
  NSObject *v19;
  NSObject *v20;
  unsigned int v21;
  void *v22;
  uint8_t buf[4];
  SharedChannelCreateResponse *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __99__SKAChannelManager_createPresenceChannelWithMembershipKey_serverKey_serviceIdentifier_completion___block_invoke_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Presence channel create response received", buf, 2u);
    }

    v9 = -[SharedChannelCreateResponse initWithData:]([SharedChannelCreateResponse alloc], "initWithData:", v5);
    v10 = -[SharedChannelCreateResponse status](v9, "status");
    v11 = CFSTR("AUTH_EXPIRED");
    switch((int)v10)
    {
      case 0:
        +[SKAChannelManager logger](SKAChannelManager, "logger");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v9;
          _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Presence channel create success response received: %@", buf, 0xCu);
        }

        -[SharedChannelCreateResponse channelIdentity](v9, "channelIdentity");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString channelId](v13, "channelId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        -[__CFString channelToken](v13, "channelToken");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
        goto LABEL_29;
      case 1:
        goto LABEL_19;
      case 2:
        v11 = CFSTR("AUTH_FAILED");
        goto LABEL_19;
      case 3:
        v11 = CFSTR("BAD_REQUEST");
        goto LABEL_19;
      case 4:
        v11 = CFSTR("CHANNEL_IDENTITY_VALIDATION_FAILED");
        goto LABEL_19;
      case 5:
        v11 = CFSTR("INTERNAL_ERROR");
        goto LABEL_19;
      case 6:
        v11 = CFSTR("STALE_PUBLISH_REJECTED");
        goto LABEL_19;
      case 7:
        v11 = CFSTR("RATE_LIMITED");
        goto LABEL_19;
      case 8:
        v11 = CFSTR("INVALID_NONCE");
        goto LABEL_19;
      default:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v18 = CFSTR("Generic non-success response status");
        if (v11)
          v18 = v11;
        v13 = v18;

        +[SKAChannelManager logger](SKAChannelManager, "logger");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __99__SKAChannelManager_createPresenceChannelWithMembershipKey_serverKey_serviceIdentifier_completion___block_invoke_cold_1();

        v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD0FC8]);
        if (-[SharedChannelCreateResponse hasRetryIntervalSeconds](v9, "hasRetryIntervalSeconds")
          && -[SharedChannelCreateResponse retryIntervalSeconds](v9, "retryIntervalSeconds"))
        {
          +[SKAChannelManager logger](SKAChannelManager, "logger");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = -[SharedChannelCreateResponse retryIntervalSeconds](v9, "retryIntervalSeconds");
            *(_DWORD *)buf = 134217984;
            v24 = (SharedChannelCreateResponse *)v21;
            _os_log_impl(&dword_2188DF000, v20, OS_LOG_TYPE_DEFAULT, "Retry interval specified: %ld", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[SharedChannelCreateResponse retryIntervalSeconds](v9, "retryIntervalSeconds"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, SKAChannelManagerErrorRetryIntervalKey);

        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKPushManagerErrorDomain"), (int)v10, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_29:
        v17();

        break;
    }
  }

}

- (void)publishProvisionPayloads:(id)a3 onChannel:(id)a4 withChannelToken:(id)a5 publishInitiateTime:(id)a6 retryCount:(unint64_t)a7 completion:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  SKAChannelManager *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a8;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v13;
    _os_log_impl(&dword_2188DF000, v16, OS_LOG_TYPE_DEFAULT, "Received request to provision payloads on channel %@", buf, 0xCu);
  }

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke;
  v21[3] = &unk_24D977250;
  v25 = self;
  v26 = v15;
  v22 = v14;
  v23 = v13;
  v24 = v12;
  v17 = v12;
  v18 = v13;
  v19 = v14;
  v20 = v15;
  -[SKAChannelManager _getStatusJWTTokenWithCompletion:](self, "_getStatusJWTTokenWithCompletion:", v21);

}

void __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ChannelIdentity *v4;
  void *v5;
  ChannelDeferredPublishInfo *v6;
  uint64_t i;
  void *v8;
  SharedChannelProvisionOffGridPacketInfo *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  SharedChannelProvisionOffGridPayloadRequest *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  ChannelIdentity *v31;
  uint64_t v32;
  AuthCredential *v33;
  id v34;
  id obj;
  uint64_t v36;
  ChannelDeferredPublishInfo *v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v33 = objc_alloc_init(AuthCredential);
    v34 = v3;
    -[AuthCredential setSimpleJwt:](v33, "setSimpleJwt:", v3);
    v4 = objc_alloc_init(ChannelIdentity);
    -[ChannelIdentity setChannelToken:](v4, "setChannelToken:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", *(_QWORD *)(a1 + 40), 0);
    -[ChannelIdentity setChannelId:](v4, "setChannelId:", v5);

    -[ChannelIdentity setChannelOwnershipType:](v4, "setChannelOwnershipType:", 0);
    -[ChannelIdentity setChannelTopic:](v4, "setChannelTopic:", CFSTR("com.apple.icloud.presence.mode.status"));
    v6 = objc_alloc_init(ChannelDeferredPublishInfo);
    v31 = v4;
    -[ChannelDeferredPublishInfo setChannelIdentity:](v6, "setChannelIdentity:", v4);
    -[ChannelDeferredPublishInfo setPushPriority:](v6, "setPushPriority:", 1);
    -[ChannelDeferredPublishInfo setRetryCount:](v6, "setRetryCount:", 0);
    v37 = v6;
    -[ChannelDeferredPublishInfo setAdopter:](v6, "setAdopter:", CFSTR("CarrierPigeon"));
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v32 = a1;
    obj = *(id *)(a1 + 48);
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v38)
    {
      v36 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v43 != v36)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v9 = objc_alloc_init(SharedChannelProvisionOffGridPacketInfo);
          v10 = (void *)MEMORY[0x24BDBCE50];
          objc_msgSend(v8, "decryptionKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "SHA256Data");
          v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v13 = objc_msgSend(v12, "bytes");
          objc_msgSend(v8, "decryptionKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "SHA256Data");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "length");

          if (v16 >= 8)
            v17 = 8;
          else
            v17 = v16;
          objc_msgSend(v10, "dataWithBytes:length:", v13, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SharedChannelProvisionOffGridPacketInfo setPacketId:](v9, "setPacketId:", v18);

          objc_msgSend(v8, "encryptedStatusPayload");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SharedChannelProvisionOffGridPacketInfo setEncryptedPacket:](v9, "setEncryptedPacket:", v19);

          objc_msgSend(v8, "validUntil");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timeIntervalSince1970");
          -[SharedChannelProvisionOffGridPacketInfo setPacketExpirationTimestampMillis:](v9, "setPacketExpirationTimestampMillis:", (unint64_t)(v21 * 1000.0));

          objc_msgSend(v8, "commitmentSalt");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SharedChannelProvisionOffGridPacketInfo setCommitmentSalt:](v9, "setCommitmentSalt:", v22);

          objc_msgSend(v8, "initializationVector");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SharedChannelProvisionOffGridPacketInfo setInitializationVector:](v9, "setInitializationVector:", v23);

          -[ChannelDeferredPublishInfo addChannelProvisionOffGridPacketInfo:](v37, "addChannelProvisionOffGridPacketInfo:", v9);
        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v38);
    }

    v24 = objc_alloc_init(SharedChannelProvisionOffGridPayloadRequest);
    v25 = v33;
    -[SharedChannelProvisionOffGridPayloadRequest setAuthCredential:](v24, "setAuthCredential:", v33);
    -[SharedChannelProvisionOffGridPayloadRequest setChannelDeferredPublishInfo:](v24, "setChannelDeferredPublishInfo:", v37);
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v26, OS_LOG_TYPE_DEFAULT, "Sending provision request to push manager", buf, 2u);
    }

    objc_msgSend(*(id *)(v32 + 56), "pushManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedChannelProvisionOffGridPayloadRequest data](v24, "data");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_26;
    v39[3] = &unk_24D9766E8;
    v40 = *(id *)(v32 + 64);
    objc_msgSend(v27, "provisionPayload:completion:", v28, v39);

    v3 = v34;
  }
  else
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_cold_1();

    v30 = *(_QWORD *)(a1 + 64);
    +[SKAChannelManager _jwtTokenNotFoundError](SKAChannelManager, "_jwtTokenNotFoundError");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v25);
  }

}

void __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  SharedChannelProvisionOffGridPayloadResponse *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  __CFString *v16;
  void (*v17)(void);
  NSObject *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Handling protobuf response data for completed provision request", buf, 2u);
      }

      v10 = -[SharedChannelProvisionOffGridPayloadResponse initWithData:]([SharedChannelProvisionOffGridPayloadResponse alloc], "initWithData:", v5);
      v11 = -[SharedChannelProvisionOffGridPayloadResponse status](v10, "status");
      +[SKAChannelManager logger](SKAChannelManager, "logger");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_26_cold_2(v10, v13);

        v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v15 = -[SharedChannelProvisionOffGridPayloadResponse status](v10, "status");
        if (v15 >= 9)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_24D9772E0[(int)v15];
        }
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDD0FC8]);

        if (-[SharedChannelProvisionOffGridPayloadResponse hasRetryIntervalSeconds](v10, "hasRetryIntervalSeconds")
          && -[SharedChannelProvisionOffGridPayloadResponse retryIntervalSeconds](v10, "retryIntervalSeconds"))
        {
          +[SKAChannelManager logger](SKAChannelManager, "logger");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = -[SharedChannelProvisionOffGridPayloadResponse retryIntervalSeconds](v10, "retryIntervalSeconds");
            *(_DWORD *)buf = 134217984;
            v23 = v19;
            _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Retry interval specified: %ld", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[SharedChannelProvisionOffGridPayloadResponse retryIntervalSeconds](v10, "retryIntervalSeconds"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, SKAChannelManagerErrorRetryIntervalKey);

        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKPushManagerErrorDomain"), -[SharedChannelProvisionOffGridPayloadResponse status](v10, "status"), v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        goto LABEL_27;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Provision request completed with success", buf, 2u);
      }

      v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_26_cold_1();

      +[SKAChannelManager _serverResponseError](SKAChannelManager, "_serverResponseError");
      v10 = (SharedChannelProvisionOffGridPayloadResponse *)objc_claimAutoreleasedReturnValue();
      v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v17();
LABEL_27:

    goto LABEL_28;
  }
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_26_cold_3();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_28:

}

- (void)publishData:(id)a3 onChannel:(id)a4 withChannelToken:(id)a5 publishInitiateTime:(id)a6 isPendingPublish:(BOOL)a7 isScheduledPublish:(BOOL)a8 retryCount:(unint64_t)a9 completion:(id)a10
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  ChannelIdentity *v20;
  void *v21;
  ChannelPublishPayload *v22;
  double v23;
  double v24;
  void *v25;
  AuthCredential *v26;
  void *v27;
  SharedChannelPublishRequest *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v34 = a8;
  v10 = a7;
  v41 = *MEMORY[0x24BDAC8D0];
  v15 = a4;
  v35 = a10;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v15;
    _os_log_impl(&dword_2188DF000, v19, OS_LOG_TYPE_DEFAULT, "Received request to publish data on channel %@", buf, 0xCu);
  }

  v20 = objc_alloc_init(ChannelIdentity);
  -[ChannelIdentity setChannelToken:](v20, "setChannelToken:", v17);

  v36 = v15;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v15, 0);
  -[ChannelIdentity setChannelId:](v20, "setChannelId:", v21);

  -[ChannelIdentity setChannelOwnershipType:](v20, "setChannelOwnershipType:", 0);
  -[ChannelIdentity setChannelTopic:](v20, "setChannelTopic:", CFSTR("com.apple.icloud.presence.mode.status"));
  v22 = objc_alloc_init(ChannelPublishPayload);
  objc_msgSend(v16, "timeIntervalSince1970");
  v24 = v23;

  -[ChannelPublishPayload setPublishInitiateTimestampMillis:](v22, "setPublishInitiateTimestampMillis:", (unint64_t)(v24 * 1000.0));
  -[ChannelPublishPayload setPendingPublishHint:](v22, "setPendingPublishHint:", v10);
  -[ChannelPublishPayload setScheduledPublishHint:](v22, "setScheduledPublishHint:", v34);
  -[ChannelPublishPayload setRetryCount:](v22, "setRetryCount:", a9);
  -[ChannelPublishPayload setChannelIdentity:](v22, "setChannelIdentity:", v20);
  -[ChannelPublishPayload setPublishPayloadExpiryTtlMillis:](v22, "setPublishPayloadExpiryTtlMillis:", 604800000);
  -[SKAChannelManager _createPayloadDataFromData:](self, "_createPayloadDataFromData:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[ChannelPublishPayload setPublishPayload:](v22, "setPublishPayload:", v25);
  -[ChannelPublishPayload setPushPriority:](v22, "setPushPriority:", 1);
  v26 = objc_alloc_init(AuthCredential);
  -[SKAChannelManager _getStatusJWTToken](self, "_getStatusJWTToken");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[AuthCredential setSimpleJwt:](v26, "setSimpleJwt:", v27);
    v28 = objc_alloc_init(SharedChannelPublishRequest);
    -[SharedChannelPublishRequest setAuthCredential:](v28, "setAuthCredential:", v26);
    -[SharedChannelPublishRequest setChannelPublishPayload:](v28, "setChannelPublishPayload:", v22);
    -[SharedChannelPublishRequest data](v28, "data");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v30, OS_LOG_TYPE_DEFAULT, "Sending publish request to push manager", buf, 2u);
    }

    -[SKAChannelManager pushManager](self, "pushManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke;
    v37[3] = &unk_24D9766E8;
    v32 = v35;
    v38 = v35;
    objc_msgSend(v31, "publishStatus:completion:", v29, v37);

  }
  else
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_cold_1();

    +[SKAChannelManager _jwtTokenNotFoundError](SKAChannelManager, "_jwtTokenNotFoundError");
    v28 = (SharedChannelPublishRequest *)objc_claimAutoreleasedReturnValue();
    v32 = v35;
    (*((void (**)(id, SharedChannelPublishRequest *))v35 + 2))(v35, v28);
  }

}

void __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  SharedChannelPublishResponse *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  __CFString *v16;
  void (*v17)(void);
  NSObject *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Handling protobuf response data for completed status publish request", buf, 2u);
      }

      v10 = -[SharedChannelPublishResponse initWithData:]([SharedChannelPublishResponse alloc], "initWithData:", v5);
      v11 = -[SharedChannelPublishResponse status](v10, "status");
      +[SKAChannelManager logger](SKAChannelManager, "logger");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke_cold_2(v10, v13);

        v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v15 = -[SharedChannelPublishResponse status](v10, "status");
        if (v15 >= 9)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_24D9772E0[(int)v15];
        }
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDD0FC8]);

        if (-[SharedChannelPublishResponse hasRetryIntervalSeconds](v10, "hasRetryIntervalSeconds")
          && -[SharedChannelPublishResponse retryIntervalSeconds](v10, "retryIntervalSeconds"))
        {
          +[SKAChannelManager logger](SKAChannelManager, "logger");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = -[SharedChannelPublishResponse retryIntervalSeconds](v10, "retryIntervalSeconds");
            *(_DWORD *)buf = 134217984;
            v23 = v19;
            _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Retry interval specified: %ld", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[SharedChannelPublishResponse retryIntervalSeconds](v10, "retryIntervalSeconds"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, SKAChannelManagerErrorRetryIntervalKey);

        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKPushManagerErrorDomain"), -[SharedChannelPublishResponse status](v10, "status"), v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        goto LABEL_27;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Publish status request completed with success", buf, 2u);
      }

      v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke_cold_1();

      +[SKAChannelManager _serverResponseError](SKAChannelManager, "_serverResponseError");
      v10 = (SharedChannelPublishResponse *)objc_claimAutoreleasedReturnValue();
      v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v17();
LABEL_27:

    goto LABEL_28;
  }
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke_cold_3();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_28:

}

- (void)assertPresence:(id)a3 onChannel:(id)a4 membershipKey:(id)a5 serverKey:(id)a6 timestamp:(id)a7 withChannelToken:(id)a8 serviceIdentifier:(id)a9 isRefresh:(BOOL)a10 completion:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  ChannelIdentity *v22;
  void *v23;
  AuthCredential *v24;
  SharedOwnershipAuth *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  ChannelActivityActivationRequest *v32;
  void *v33;
  void *v34;
  double v35;
  SharedChannelActivityRequest *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  NSObject *v41;
  AuthCredential *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  uint8_t v53[4];
  void *v54;
  __int128 buf;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  v17 = a4;
  v48 = a5;
  v18 = a6;
  v47 = a7;
  v46 = a9;
  v19 = a11;
  v20 = a8;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_2188DF000, v21, OS_LOG_TYPE_DEFAULT, "Received request to assert presence on channel %@", (uint8_t *)&buf, 0xCu);
  }

  v22 = objc_alloc_init(ChannelIdentity);
  -[ChannelIdentity setChannelToken:](v22, "setChannelToken:", v20);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v17, 0);
  -[ChannelIdentity setChannelId:](v22, "setChannelId:", v23);

  -[ChannelIdentity setChannelOwnershipType:](v22, "setChannelOwnershipType:", 1);
  -[ChannelIdentity setChannelTopic:](v22, "setChannelTopic:", CFSTR("com.apple.icloud.presence.shared.experience"));
  v24 = objc_alloc_init(AuthCredential);
  v25 = objc_alloc_init(SharedOwnershipAuth);
  -[SKAChannelManager _getPresenceJWTToken](self, "_getPresenceJWTToken");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v17;
  if (v26)
  {
    v43 = v19;
    -[SharedOwnershipAuth setSimpleJwt:](v25, "setSimpleJwt:", v26);
    objc_msgSend(v48, "publicKeyMaterial");
    v27 = v18;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setChannelPublicKey:](v25, "setChannelPublicKey:", v28);

    v44 = v27;
    objc_msgSend(v27, "keyMaterial");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setServerEncryptionKey:](v25, "setServerEncryptionKey:", v29);

    -[SKAChannelManager _getNonce](self, "_getNonce");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setNonce:](v25, "setNonce:", v30);
    objc_msgSend(v48, "signPayload:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setSignNonce:](v25, "setSignNonce:", v31);

    -[AuthCredential setSharedOwnershipAuth:](v24, "setSharedOwnershipAuth:", v25);
    v32 = objc_alloc_init(ChannelActivityActivationRequest);
    v42 = v24;
    -[ChannelActivityActivationRequest setAuthCredential:](v32, "setAuthCredential:", v24);
    -[ChannelActivityActivationRequest setChannelIdentity:](v32, "setChannelIdentity:", v22);
    -[ChannelActivityActivationRequest setRequestFlag:](v32, "setRequestFlag:", a10);
    buf = 0uLL;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "getUUIDBytes:", &buf);

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &buf, 16);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChannelActivityActivationRequest setUuid:](v32, "setUuid:", v34);
    objc_msgSend(v47, "timeIntervalSince1970");
    -[ChannelActivityActivationRequest setClientTimestampSeconds:](v32, "setClientTimestampSeconds:", (unint64_t)v35);
    -[ChannelActivityActivationRequest setEncryptedParticipantPayload:](v32, "setEncryptedParticipantPayload:", v49);
    -[ChannelActivityActivationRequest setAdopter:](v32, "setAdopter:", v46);
    v36 = objc_alloc_init(SharedChannelActivityRequest);
    -[SharedChannelActivityRequest setActivationRequest:](v36, "setActivationRequest:", v32);
    -[SharedChannelActivityRequest setRequest:](v36, "setRequest:", 1);
    -[SharedChannelActivityRequest data](v36, "data");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v53 = 138412290;
      v54 = v34;
      _os_log_impl(&dword_2188DF000, v38, OS_LOG_TYPE_DEFAULT, "Sending presence activation request %@ to push manager", v53, 0xCu);
    }

    -[SKAChannelManager pushManager](self, "pushManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke;
    v50[3] = &unk_24D977278;
    v51 = v34;
    v52 = v43;
    v40 = v34;
    objc_msgSend(v39, "sendPresenceMessage:completion:", v37, v50);

    v19 = v43;
    v18 = v44;
    v24 = v42;
  }
  else
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[SKAChannelManager createChannelWithCompletion:].cold.1();

    +[SKAChannelManager _jwtTokenNotFoundError](SKAChannelManager, "_jwtTokenNotFoundError");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD, double))v19 + 2))(v19, v30, 0, MEMORY[0x24BDBD1A8], 1.79769313e308);
  }

}

void __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  SharedChannelActivityResponse *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke_cold_3();

    (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(1.79769313e308);
  }
  else
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v19 = 138412290;
        v20 = v10;
        _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Handling protobuf response data for completed presence assertion request %@", (uint8_t *)&v19, 0xCu);
      }

      v11 = -[SharedChannelActivityResponse initWithData:]([SharedChannelActivityResponse alloc], "initWithData:", v5);
      -[SharedChannelActivityResponse activationResponse](v11, "activationResponse");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "status");
      +[SKAChannelManager logger](SKAChannelManager, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke_cold_2(a1, v12, v15);

        v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKPushManagerErrorDomain"), (int)objc_msgSend(v12, "status"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(1.79769313e308);

      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v19 = 138412290;
          v20 = v18;
          _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Presence assertion request %@ completed with success", (uint8_t *)&v19, 0xCu);
        }

        objc_msgSend(v12, "participantPayloads");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(_QWORD, _QWORD, uint64_t, id, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, objc_msgSend(v12, "version"), v16, (double)(unint64_t)objc_msgSend(v12, "activationExpirySeconds"));
      }

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke_cold_1();

      +[SKAChannelManager _serverResponseError](SKAChannelManager, "_serverResponseError");
      v11 = (SharedChannelActivityResponse *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(1.79769313e308);
    }

  }
}

- (void)releasePresenceOnChannel:(id)a3 membershipKey:(id)a4 serverKey:(id)a5 timestamp:(id)a6 withChannelToken:(id)a7 serviceIdentifier:(id)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  ChannelIdentity *v20;
  void *v21;
  AuthCredential *v22;
  SharedOwnershipAuth *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  ChannelActivityDeactivationRequest *v29;
  void *v30;
  void *v31;
  double v32;
  SharedChannelActivityRequest *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  NSObject *v38;
  AuthCredential *v39;
  id v40;
  void *v41;
  void *v42;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint8_t v49[4];
  void *v50;
  __int128 buf;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v45 = a6;
  v44 = a8;
  v17 = a9;
  v18 = a7;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_2188DF000, v19, OS_LOG_TYPE_DEFAULT, "Received request to release presence on channel %@", (uint8_t *)&buf, 0xCu);
  }

  v20 = objc_alloc_init(ChannelIdentity);
  -[ChannelIdentity setChannelToken:](v20, "setChannelToken:", v18);

  v42 = v14;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v14, 0);
  -[ChannelIdentity setChannelId:](v20, "setChannelId:", v21);

  -[ChannelIdentity setChannelOwnershipType:](v20, "setChannelOwnershipType:", 1);
  -[ChannelIdentity setChannelTopic:](v20, "setChannelTopic:", CFSTR("com.apple.icloud.presence.shared.experience"));
  v22 = objc_alloc_init(AuthCredential);
  v23 = objc_alloc_init(SharedOwnershipAuth);
  -[SKAChannelManager _getPresenceJWTToken](self, "_getPresenceJWTToken");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v16;
  if (v24)
  {
    -[SharedOwnershipAuth setSimpleJwt:](v23, "setSimpleJwt:", v24);
    objc_msgSend(v15, "publicKeyMaterial");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setChannelPublicKey:](v23, "setChannelPublicKey:", v25);

    objc_msgSend(v16, "keyMaterial");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setServerEncryptionKey:](v23, "setServerEncryptionKey:", v26);

    -[SKAChannelManager _getNonce](self, "_getNonce");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setNonce:](v23, "setNonce:", v27);
    v40 = v15;
    objc_msgSend(v15, "signPayload:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setSignNonce:](v23, "setSignNonce:", v28);

    -[AuthCredential setSharedOwnershipAuth:](v22, "setSharedOwnershipAuth:", v23);
    v29 = objc_alloc_init(ChannelActivityDeactivationRequest);
    v39 = v22;
    -[ChannelActivityDeactivationRequest setAuthCredential:](v29, "setAuthCredential:", v22);
    -[ChannelActivityDeactivationRequest setChannelIdentity:](v29, "setChannelIdentity:", v20);
    buf = 0uLL;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "getUUIDBytes:", &buf);

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &buf, 16);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChannelActivityDeactivationRequest setUuid:](v29, "setUuid:", v31);
    objc_msgSend(v45, "timeIntervalSince1970");
    -[ChannelActivityDeactivationRequest setClientTimestampSeconds:](v29, "setClientTimestampSeconds:", (unint64_t)v32);
    -[ChannelActivityDeactivationRequest setAdopter:](v29, "setAdopter:", v44);
    v33 = objc_alloc_init(SharedChannelActivityRequest);
    -[SharedChannelActivityRequest setDeactivationRequest:](v33, "setDeactivationRequest:", v29);
    -[SharedChannelActivityRequest setRequest:](v33, "setRequest:", 2);
    -[SharedChannelActivityRequest data](v33, "data");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v49 = 138412290;
      v50 = v31;
      _os_log_impl(&dword_2188DF000, v35, OS_LOG_TYPE_DEFAULT, "Sending presence deactivation request %@ to push manager", v49, 0xCu);
    }

    -[SKAChannelManager pushManager](self, "pushManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke;
    v46[3] = &unk_24D977278;
    v47 = v31;
    v48 = v17;
    v37 = v31;
    objc_msgSend(v36, "sendPresenceMessage:completion:", v34, v46);

    v15 = v40;
    v22 = v39;
  }
  else
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[SKAChannelManager createChannelWithCompletion:].cold.1();

    +[SKAChannelManager _jwtTokenNotFoundError](SKAChannelManager, "_jwtTokenNotFoundError");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v17 + 2))(v17, v27);
  }

}

void __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  SharedChannelActivityResponse *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke_cold_3();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v19 = 138412290;
        v20 = v10;
        _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Handling protobuf response data for completed presence assertion release request %@", (uint8_t *)&v19, 0xCu);
      }

      v11 = -[SharedChannelActivityResponse initWithData:]([SharedChannelActivityResponse alloc], "initWithData:", v5);
      -[SharedChannelActivityResponse deactivationResponse](v11, "deactivationResponse");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "status");
      +[SKAChannelManager logger](SKAChannelManager, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke_cold_2(a1, v12, v15);

        v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKPushManagerErrorDomain"), (int)objc_msgSend(v12, "status"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v19 = 138412290;
          v20 = v18;
          _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Presence assertion release request %@ completed with success", (uint8_t *)&v19, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke_cold_1();

      +[SKAChannelManager _serverResponseError](SKAChannelManager, "_serverResponseError");
      v11 = (SharedChannelActivityResponse *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

- (void)pollActiveParticipantsForChannel:(id)a3 membershipKey:(id)a4 serverKey:(id)a5 withChannelToken:(id)a6 serviceIdentifier:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  ChannelIdentity *v19;
  void *v20;
  AuthCredential *v21;
  SharedOwnershipAuth *v22;
  SKAChannelManager *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  ChannelActivityPollingRequest *v29;
  void *v30;
  void *v31;
  SharedChannelActivityRequest *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  AuthCredential *v39;
  SKAChannelManager *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint8_t v49[4];
  void *v50;
  __int128 buf;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v45 = a7;
  v43 = a8;
  v17 = a6;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Received request to poll presence on channel %@", (uint8_t *)&buf, 0xCu);
  }

  v19 = objc_alloc_init(ChannelIdentity);
  -[ChannelIdentity setChannelToken:](v19, "setChannelToken:", v17);

  v44 = v14;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v14, 0);
  -[ChannelIdentity setChannelId:](v19, "setChannelId:", v20);

  -[ChannelIdentity setChannelOwnershipType:](v19, "setChannelOwnershipType:", 1);
  -[ChannelIdentity setChannelTopic:](v19, "setChannelTopic:", CFSTR("com.apple.icloud.presence.shared.experience"));
  v21 = objc_alloc_init(AuthCredential);
  v22 = objc_alloc_init(SharedOwnershipAuth);
  -[SKAChannelManager _getPresenceJWTToken](self, "_getPresenceJWTToken");
  v23 = self;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[SharedOwnershipAuth setSimpleJwt:](v22, "setSimpleJwt:", v24);
    objc_msgSend(v15, "publicKeyMaterial");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setChannelPublicKey:](v22, "setChannelPublicKey:", v25);

    v41 = v16;
    objc_msgSend(v16, "keyMaterial");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setServerEncryptionKey:](v22, "setServerEncryptionKey:", v26);

    v40 = v23;
    -[SKAChannelManager _getNonce](v23, "_getNonce");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setNonce:](v22, "setNonce:", v27);
    v42 = v15;
    objc_msgSend(v15, "signPayload:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SharedOwnershipAuth setSignNonce:](v22, "setSignNonce:", v28);

    -[AuthCredential setSharedOwnershipAuth:](v21, "setSharedOwnershipAuth:", v22);
    v29 = objc_alloc_init(ChannelActivityPollingRequest);
    v39 = v21;
    -[ChannelActivityPollingRequest setAuthCredential:](v29, "setAuthCredential:", v21);
    -[ChannelActivityPollingRequest setChannelIdentity:](v29, "setChannelIdentity:", v19);
    -[ChannelActivityPollingRequest setRequestFlag:](v29, "setRequestFlag:", 2);
    buf = 0uLL;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "getUUIDBytes:", &buf);

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &buf, 16);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChannelActivityPollingRequest setUuid:](v29, "setUuid:", v31);
    -[ChannelActivityPollingRequest setAdopter:](v29, "setAdopter:", v45);
    v32 = objc_alloc_init(SharedChannelActivityRequest);
    -[SharedChannelActivityRequest setPollingRequest:](v32, "setPollingRequest:", v29);
    -[SharedChannelActivityRequest setRequest:](v32, "setRequest:", 3);
    -[SharedChannelActivityRequest data](v32, "data");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v49 = 138412290;
      v50 = v31;
      _os_log_impl(&dword_2188DF000, v34, OS_LOG_TYPE_DEFAULT, "Sending polling request %@ to push manager", v49, 0xCu);
    }

    -[SKAChannelManager pushManager](v40, "pushManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke;
    v46[3] = &unk_24D977278;
    v47 = v31;
    v36 = v43;
    v48 = v43;
    v37 = v31;
    objc_msgSend(v35, "sendPresenceMessage:completion:", v33, v46);

    v16 = v41;
    v15 = v42;
    v21 = v39;
  }
  else
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[SKAChannelManager createChannelWithCompletion:].cold.1();

    +[SKAChannelManager _jwtTokenNotFoundError](SKAChannelManager, "_jwtTokenNotFoundError");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v43;
    (*((void (**)(id, void *, _QWORD, _QWORD))v43 + 2))(v43, v27, 0, MEMORY[0x24BDBD1A8]);
  }

}

void __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  SharedChannelActivityResponse *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke_cold_3();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v19 = 138412290;
        v20 = v10;
        _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Handling protobuf response data for completed polling request %@", (uint8_t *)&v19, 0xCu);
      }

      v11 = -[SharedChannelActivityResponse initWithData:]([SharedChannelActivityResponse alloc], "initWithData:", v5);
      -[SharedChannelActivityResponse pollingResponse](v11, "pollingResponse");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "status");
      +[SKAChannelManager logger](SKAChannelManager, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke_cold_2(a1, v12, v15);

        v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKPushManagerErrorDomain"), (int)objc_msgSend(v12, "status"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v19 = 138412290;
          v20 = v18;
          _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Polling request %@ completed with success", (uint8_t *)&v19, 0xCu);
        }

        objc_msgSend(v12, "participantPayloads");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(_QWORD, _QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, objc_msgSend(v12, "version"), v16);
      }

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke_cold_1();

      +[SKAChannelManager _serverResponseError](SKAChannelManager, "_serverResponseError");
      v11 = (SharedChannelActivityResponse *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

- (void)activeStatusChannelSubscriptionsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SKAPushManaging *pushManager;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Fetching subscribed Status channels", buf, 2u);
  }

  pushManager = self->_pushManager;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__SKAChannelManager_activeStatusChannelSubscriptionsWithCompletion___block_invoke;
  v8[3] = &unk_24D9772A0;
  v9 = v4;
  v7 = v4;
  -[SKAPushManaging subscribedStatusChannelsWithCompletion:](pushManager, "subscribedStatusChannelsWithCompletion:", v8);

}

void __68__SKAChannelManager_activeStatusChannelSubscriptionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134218242;
    v6 = objc_msgSend(v3, "count");
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Received %ld subscribed Status channels: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)subscribeToStatusChannels:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Subscribing to Status channels: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SKAPushManaging subscribeToStatusChannels:](self->_pushManager, "subscribeToStatusChannels:", v4);
}

- (void)unsubscribeFromStatusChannels:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Unsubscribing from Status channels: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SKAPushManaging unsubscribeFromStatusChannels:](self->_pushManager, "unsubscribeFromStatusChannels:", v4);
}

- (void)activePresenceChannelSubscriptionsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SKAPushManaging *pushManager;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Fetching subscribed Presence channels", buf, 2u);
  }

  pushManager = self->_pushManager;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__SKAChannelManager_activePresenceChannelSubscriptionsWithCompletion___block_invoke;
  v8[3] = &unk_24D9772A0;
  v9 = v4;
  v7 = v4;
  -[SKAPushManaging subscribedPresenceChannelsWithCompletion:](pushManager, "subscribedPresenceChannelsWithCompletion:", v8);

}

void __70__SKAChannelManager_activePresenceChannelSubscriptionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134218242;
    v6 = objc_msgSend(v3, "count");
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Received %ld subscribed Presence channels: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)subscribeToPresenceChannels:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Subscribing to Presence channels: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SKAPushManaging subscribeToPresenceChannels:](self->_pushManager, "subscribeToPresenceChannels:", v4);
}

- (void)unsubscribeFromPresenceChannels:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Unsubscribing from Presence channels: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SKAPushManaging unsubscribeFromPresenceChannels:](self->_pushManager, "unsubscribeFromPresenceChannels:", v4);
}

- (void)enableActivityTracking
{
  NSObject *v3;
  uint8_t v4[16];

  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Enabling activity tracking", v4, 2u);
  }

  -[SKAPushManaging enableActivityTracking](self->_pushManager, "enableActivityTracking");
}

- (void)disableActivityTracking
{
  NSObject *v3;
  uint8_t v4[16];

  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Disabling activity tracking", v4, 2u);
  }

  -[SKAPushManaging disableActivityTracking](self->_pushManager, "disableActivityTracking");
}

- (id)_createPayloadDataFromData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("StatusKitDataKey");
  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)serverTime
{
  void *v2;
  void *v3;

  -[SKAChannelManager pushManager](self, "pushManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_getPresenceJWTToken
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[16];

  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Retrieving JWT token from account provider", buf, 2u);
  }

  -[SKAChannelManager accountProvider](self, "accountProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "presenceJwtTokenForPrimaryAccountWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (!v5)
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SKAChannelManager _getPresenceJWTToken].cold.1();

  }
  return v5;
}

- (id)_getStatusJWTToken
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[16];

  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Retrieving JWT token from account provider", buf, 2u);
  }

  -[SKAChannelManager accountProvider](self, "accountProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "statusJwtTokenForPrimaryAccountWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (!v5)
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SKAChannelManager _getPresenceJWTToken].cold.1();

  }
  return v5;
}

- (void)_getStatusJWTTokenWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[16];

  v4 = (void (**)(id, void *, id))a3;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving JWT token from account provider", buf, 2u);
  }

  -[SKAChannelManager accountProvider](self, "accountProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v6, "statusJwtTokenForPrimaryAccountWithError:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (v7)
  {
    v4[2](v4, v7, v8);
  }
  else
  {
    +[SKAChannelManager logger](SKAChannelManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SKAChannelManager _getStatusJWTTokenWithCompletion:].cold.1();

    -[SKAChannelManager accountProvider](self, "accountProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "refreshedStatusJwtTokenForPrimaryAccountWithCompletion:", v4);

  }
}

- (id)_getNonce
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  char v8;
  unint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[SKAChannelManager pushManager](self, "pushManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  v6 = 1000 * (unint64_t)v5;
  v8 = 0;
  v9 = (0xE800000000000000 * (unint64_t)v5) | HIBYTE(v6) | (256000 * (unint64_t)v5) & 0xFF00000000 | (0x3E8000000 * (unint64_t)v5) & 0xFF0000000000 | (0x3E80000000000 * (unint64_t)v5) & 0xFF000000000000 | (v6 >> 40) & 0xFF00 | (v6 >> 24) & 0xFF0000 | (v6 >> 8) & 0xFF000000;
  arc4random_buf(v10, 8uLL);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v8, 17);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)pushManager:(id)a3 didReceiveData:(id)a4 onChannel:(id)a5 identifier:(unint64_t)a6 dateReceived:(id)a7 dateExpired:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id WeakRetained;
  int v19;
  id v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v13 = a5;
  v14 = a8;
  v15 = a7;
  v16 = a4;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = v13;
    v21 = 2048;
    v22 = a6;
    _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "Received data on channel: %@ with identifier %lu", (uint8_t *)&v19, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:", self, v16, v13, a6, v15, v14);

}

- (void)pushManager:(id)a3 failedToSubscribeToChannel:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;

  v7 = a4;
  v8 = a5;
  +[SKAChannelManager logger](SKAChannelManager, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[SKAChannelManager pushManager:failedToSubscribeToChannel:withError:].cold.1();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "channelManager:failedToSubscribeToChannel:withError:", self, v7, v8);

}

+ (id)logger
{
  if (logger_onceToken_12 != -1)
    dispatch_once(&logger_onceToken_12, &__block_literal_global_12);
  return (id)logger__logger_12;
}

void __27__SKAChannelManager_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAChannelManager");
  v1 = (void *)logger__logger_12;
  logger__logger_12 = (uint64_t)v0;

}

+ (id)_jwtTokenNotFoundError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not fetch JWT token for authenticating request"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("SKAChannelManagerErrorDomain"), -1000, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_serverResponseError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error in server response"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("SKAChannelManagerErrorDomain"), -1001, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SKAPushManaging)pushManager
{
  return self->_pushManager;
}

- (void)setPushManager:(id)a3
{
  objc_storeStrong((id *)&self->_pushManager, a3);
}

- (SKAAccountProviding)accountProvider
{
  return self->_accountProvider;
}

- (void)setAccountProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountProvider, a3);
}

- (SKAChannelManagingDelegate)delegate
{
  return (SKAChannelManagingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_pushManager, 0);
}

- (void)createChannelWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Unable to fetch JWT token for icloud account.  Failing request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __49__SKAChannelManager_createChannelWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Create channle response contains non success status: %ld - %@");
  OUTLINED_FUNCTION_3();
}

void __49__SKAChannelManager_createChannelWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Channel create request failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __99__SKAChannelManager_createPresenceChannelWithMembershipKey_serverKey_serviceIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Create presence channel response contains non success status: %ld - %@");
  OUTLINED_FUNCTION_3();
}

void __99__SKAChannelManager_createPresenceChannelWithMembershipKey_serverKey_serviceIdentifier_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Presence channel create request failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Unable to fetch JWT auth token.  Failing request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Provision request contains neither error nor proto response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_26_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "status");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_2188DF000, a2, v3, "Provision request completed with nonsuccess response status: %ld", v4);
  OUTLINED_FUNCTION_12_0();
}

void __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_26_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Provision request contains error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Publish status request contains neither error nor proto response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "status");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_2188DF000, a2, v3, "Publish status request completed with nonsuccess response status: %ld", v4);
  OUTLINED_FUNCTION_12_0();
}

void __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Publish status request contains error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Presence assertion request %@ received response with neither error nor proto response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_11_0(a1, a2);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, a3, v4, "Presence assertion request %@ completed with nonsuccess response status: %ld", v5);
  OUTLINED_FUNCTION_12_0();
}

void __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Presence assertion request %@ received response with error: %@");
  OUTLINED_FUNCTION_3();
}

void __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Presence assertion release %@ received response contains neither error nor proto response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_11_0(a1, a2);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, a3, v4, "Presence assertion release request %@ completed with nonsuccess response status: %ld", v5);
  OUTLINED_FUNCTION_12_0();
}

void __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Presence assertion release %@ received response with error: %@");
  OUTLINED_FUNCTION_3();
}

void __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Polling request %@ response contains neither error nor proto response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_11_0(a1, a2);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, a3, v4, "Polling request %@ completed with nonsuccess response status: %ld", v5);
  OUTLINED_FUNCTION_12_0();
}

void __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Polling request %@ response contains error: %@");
  OUTLINED_FUNCTION_3();
}

- (void)_getPresenceJWTToken
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not fetch JWT token!: Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_getStatusJWTTokenWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not fetch JWT token! Attempting to refresh: Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)pushManager:failedToSubscribeToChannel:withError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Failed to subscribe to channel: %@ Error: %@");
  OUTLINED_FUNCTION_3();
}

@end

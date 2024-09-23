@implementation SKAAccountProvider

- (SKAAccountProvider)init
{
  SKAAccountProvider *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *tokenFetchQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *cachedJwtTokenMap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKAAccountProvider;
  v2 = -[SKAAccountProvider init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.StatusKit.InvitationManager.cleanup", v4);
    tokenFetchQueue = v2->_tokenFetchQueue;
    v2->_tokenFetchQueue = (OS_dispatch_queue *)v5;

    v2->_cachedTimestamp = 0.0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cachedJwtTokenMap = v2->_cachedJwtTokenMap;
    v2->_cachedJwtTokenMap = v7;

  }
  return v2;
}

- (id)statusJwtTokenForPrimaryAccountWithError:(id *)a3
{
  return -[SKAAccountProvider _jwtTokenForPrimaryAccountForIdentifier:withError:](self, "_jwtTokenForPrimaryAccountForIdentifier:withError:", CFSTR("com.apple.gs.sharedchannels.auth"), a3);
}

- (id)presenceJwtTokenForPrimaryAccountWithError:(id *)a3
{
  return -[SKAAccountProvider _jwtTokenForPrimaryAccountForIdentifier:withError:](self, "_jwtTokenForPrimaryAccountForIdentifier:withError:", CFSTR("com.apple.gs.sharedexperiences.auth"), a3);
}

- (id)_jwtTokenForPrimaryAccountForIdentifier:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *tokenFetchQueue;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  SKAAccountProvider *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  v28 = 0;
  tokenFetchQueue = self->_tokenFetchQueue;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __72__SKAAccountProvider__jwtTokenForPrimaryAccountForIdentifier_withError___block_invoke;
  v18 = &unk_24D9773F8;
  v19 = self;
  v21 = &v23;
  v22 = &v29;
  v8 = v6;
  v20 = v8;
  dispatch_sync(tokenFetchQueue, &v15);
  if (a4)
  {
    v9 = (void *)v24[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  objc_msgSend((id)v30[5], "ska_sha256Hash", v15, v16, v17, v18, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "substringToIndex:", 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKAAccountProvider logger](SKAAccountProvider, "logger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v11;
    v37 = 2112;
    v38 = v8;
    _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Fetched token hash:%@ for %@", buf, 0x16u);
  }

  v13 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v13;
}

void __72__SKAAccountProvider__jwtTokenForPrimaryAccountForIdentifier_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v2 = (void *)MEMORY[0x219A1D444]();
  v3 = *(void **)(a1 + 32);
  v19 = 0;
  objc_msgSend(v3, "_primarySystemiCloudAccountWithError:", &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;
  v6 = v19;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
  if (!v4)
  {
    +[SKAAccountProvider logger](SKAAccountProvider, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __72__SKAAccountProvider__jwtTokenForPrimaryAccountForIdentifier_withError___block_invoke_cold_1();
    goto LABEL_11;
  }
  objc_msgSend(v4, "aida_tokenWithExpiryCheckForService:", *(_QWORD *)(a1 + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    +[SKAAccountProvider logger](SKAAccountProvider, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __72__SKAAccountProvider__jwtTokenForPrimaryAccountForIdentifier_withError___block_invoke_cold_2();

    v11 = *(double *)(*(_QWORD *)(a1 + 32) + 16) + 300.0;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v14 = v13;

    if (v11 > v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "cachedJwtTokenMap");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

LABEL_11:
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)refreshCredentialForPrimaryAccountWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *tokenFetchQueue;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  SKAAccountProvider *v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  uint8_t buf[16];
  uint64_t v32;
  _QWORD v33[3];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[SKAAccountProvider _shouldAttemptReauth](self, "_shouldAttemptReauth"))
  {
    -[SKAAccountProvider _markReauthAttempt](self, "_markReauthAttempt");
    v5 = objc_alloc_init(MEMORY[0x24BDB4398]);
    if (!v5)
    {
      +[SKAAccountProvider logger](SKAAccountProvider, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:].cold.3();

    }
    v7 = (void *)MEMORY[0x219A1D444]();
    v27 = 0;
    -[SKAAccountProvider _primarySystemiCloudAccountWithError:](self, "_primarySystemiCloudAccountWithError:", &v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v27;
    if (v8)
    {
      v10 = objc_alloc_init(MEMORY[0x24BE0ACB8]);
      objc_msgSend(v10, "setAuthenticationType:", 1);
      objc_msgSend(v10, "setIsUsernameEditable:", 0);
      objc_msgSend(v10, "setServiceType:", 1);
      objc_msgSend(v8, "aida_alternateDSID");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && -[NSObject length](v11, "length"))
      {
        objc_msgSend(v10, "setAltDSID:", v12);
      }
      else
      {
        +[SKAAccountProvider logger](SKAAccountProvider, "logger");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:].cold.2();

      }
      v18 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
      tokenFetchQueue = self->_tokenFetchQueue;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_28;
      v22[3] = &unk_24D977448;
      v23 = v18;
      v24 = v10;
      v25 = self;
      v26 = v4;
      v20 = v10;
      v21 = v18;
      dispatch_async(tokenFetchQueue, v22);

    }
    else
    {
      +[SKAAccountProvider logger](SKAAccountProvider, "logger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:].cold.1();
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    +[SKAAccountProvider logger](SKAAccountProvider, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Reauth has hit rate limit.  Not attempting.", buf, 2u);
    }

    v14 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0BA0];
    v33[0] = CFSTR("Reauth has hit rate limit");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("SKAAccountProviderErrorDomain"), -1000, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke;
    block[3] = &unk_24D976FE0;
    v29 = v16;
    v30 = v4;
    v5 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v9 = v30;
  }

}

uint64_t __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_28(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_2;
  v4[3] = &unk_24D977420;
  v3 = (void *)a1[7];
  v4[4] = a1[6];
  v5 = v3;
  objc_msgSend(v1, "authenticateWithContext:completion:", v2, v4);

}

void __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  +[SKAAccountProvider logger](SKAAccountProvider, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_2_cold_1();

    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_30;
    v17[3] = &unk_24D976FE0;
    v19 = *(id *)(a1 + 40);
    v18 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v17);

    v10 = v19;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Auth refresh suceeded.", buf, 2u);
    }

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE0AB98]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("com.apple.gs.sharedchannels.auth"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("com.apple.gs.sharedexperiences.auth"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "cachedJwtTokenMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("com.apple.gs.sharedchannels.auth"));

      }
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "cachedJwtTokenMap");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("com.apple.gs.sharedexperiences.auth"));

      }
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSince1970");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v16;

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_29;
    block[3] = &unk_24D977080;
    v21 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)refreshedStatusJwtTokenForPrimaryAccountWithCompletion:(id)a3
{
  -[SKAAccountProvider _refreshedJwtTokenForIdentifier:withCompletion:](self, "_refreshedJwtTokenForIdentifier:withCompletion:", CFSTR("com.apple.gs.sharedchannels.auth"), a3);
}

- (void)refreshedPresenceJwtTokenForPrimaryAccountWithCompletion:(id)a3
{
  -[SKAAccountProvider _refreshedJwtTokenForIdentifier:withCompletion:](self, "_refreshedJwtTokenForIdentifier:withCompletion:", CFSTR("com.apple.gs.sharedexperiences.auth"), a3);
}

- (void)_refreshedJwtTokenForIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *tokenFetchQueue;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  SKAAccountProvider *v29;
  id v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  uint8_t buf[16];
  uint64_t v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[SKAAccountProvider _shouldAttemptReauth](self, "_shouldAttemptReauth"))
  {
    -[SKAAccountProvider _markReauthAttempt](self, "_markReauthAttempt");
    v8 = objc_alloc_init(MEMORY[0x24BDB4398]);
    if (!v8)
    {
      +[SKAAccountProvider logger](SKAAccountProvider, "logger");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:].cold.3();

    }
    v10 = (void *)MEMORY[0x219A1D444]();
    v32 = 0;
    -[SKAAccountProvider _primarySystemiCloudAccountWithError:](self, "_primarySystemiCloudAccountWithError:", &v32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v32;
    if (v11)
    {
      v13 = objc_alloc_init(MEMORY[0x24BE0ACB8]);
      objc_msgSend(v13, "setAuthenticationType:", 1);
      objc_msgSend(v13, "setIsUsernameEditable:", 0);
      objc_msgSend(v13, "setServiceType:", 1);
      objc_msgSend(v11, "aida_alternateDSID");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v25 = v10;
      if (v14 && -[NSObject length](v14, "length"))
      {
        objc_msgSend(v13, "setAltDSID:", v15);
      }
      else
      {
        +[SKAAccountProvider logger](SKAAccountProvider, "logger");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:].cold.2();

      }
      v21 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
      tokenFetchQueue = self->_tokenFetchQueue;
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_32;
      v26[3] = &unk_24D976F40;
      v27 = v21;
      v28 = v13;
      v29 = self;
      v30 = v6;
      v31 = v7;
      v23 = v13;
      v24 = v21;
      dispatch_async(tokenFetchQueue, v26);

      v10 = v25;
    }
    else
    {
      +[SKAAccountProvider logger](SKAAccountProvider, "logger");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:].cold.1();
    }

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    +[SKAAccountProvider logger](SKAAccountProvider, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v16, OS_LOG_TYPE_DEFAULT, "Reauth has hit rate limit.  Not attempting.", buf, 2u);
    }

    v17 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0BA0];
    v38[0] = CFSTR("Reauth has hit rate limit");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("SKAAccountProviderErrorDomain"), -1000, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke;
    block[3] = &unk_24D976FE0;
    v34 = v19;
    v35 = v7;
    v8 = v19;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v12 = v35;
  }

}

uint64_t __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_2;
  v5[3] = &unk_24D977470;
  v2 = *(void **)(a1 + 56);
  v5[4] = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[1] = 3221225472;
  v6 = v2;
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v3, "authenticateWithContext:completion:", v4, v5);

}

void __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKAAccountProvider logger](SKAAccountProvider, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_2_cold_1();

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_38;
    v23[3] = &unk_24D976FE0;
    v25 = *(id *)(a1 + 48);
    v24 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v23);

    v10 = v25;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Auth refresh suceeded.", buf, 2u);
    }

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE0AB98]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("com.apple.gs.sharedchannels.auth"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("com.apple.gs.sharedexperiences.auth"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "cachedJwtTokenMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("com.apple.gs.sharedchannels.auth"));

      }
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "cachedJwtTokenMap");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("com.apple.gs.sharedexperiences.auth"));

      }
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSince1970");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v16;

      objc_msgSend(v10, "objectForKey:", *(_QWORD *)(a1 + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    +[SKAAccountProvider logger](SKAAccountProvider, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = CFSTR("NO");
      v20 = *(_QWORD *)(a1 + 40);
      if (!v17)
        v19 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v30 = v19;
      v31 = 2112;
      v32 = v20;
      _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Did fetch token post refresh:%@ for %@", buf, 0x16u);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_37;
    block[3] = &unk_24D976FE0;
    v21 = *(id *)(a1 + 48);
    v27 = v17;
    v28 = v21;
    v22 = v17;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)_primarySystemiCloudAccountWithError:(id *)a3
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x219A1D444](self, a2, a3);
  +[SKAAccountProvider logger](SKAAccountProvider, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Fetching primary iCloud account", (uint8_t *)&v11, 2u);
  }

  v5 = objc_alloc_init(MEMORY[0x24BDB4398]);
  if (v5)
  {
    v6 = v5;
    -[NSObject aida_accountForPrimaryiCloudAccount](v5, "aida_accountForPrimaryiCloudAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAAccountProvider logger](SKAAccountProvider, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v7;
        _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Primary iCloud account determined: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[SKAAccountProvider _primarySystemiCloudAccountWithError:].cold.2();
    }

  }
  else
  {
    +[SKAAccountProvider logger](SKAAccountProvider, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:].cold.3();
    v7 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (BOOL)_shouldAttemptReauth
{
  CFPropertyListRef v3;
  void *v4;
  int64_t v5;
  BOOL v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;

  v3 = CFPreferencesCopyAppValue(CFSTR("reauthCount"), CFSTR("com.apple.StatusKitAgent"));
  if (v3)
    v4 = (void *)v3;
  else
    v4 = &unk_24D98DDF8;
  v5 = -[SKAAccountProvider _maxReauthCount](self, "_maxReauthCount");
  if (v5 <= (int)objc_msgSend(v4, "intValue"))
  {
    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("lastReauthTime"), CFSTR("com.apple.StatusKitAgent"));
    v8 = -[SKAAccountProvider _authResetTime](self, "_authResetTime");
    if (v7
      && (v9 = v8,
          objc_msgSend(MEMORY[0x24BDBCE60], "now"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "timeIntervalSinceDate:", v7),
          v12 = v11,
          v10,
          v12 <= (double)v9))
    {
      v6 = 0;
    }
    else
    {
      CFPreferencesSetAppValue(CFSTR("reauthCount"), &unk_24D98DDF8, CFSTR("com.apple.StatusKitAgent"));
      v6 = 1;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)_markReauthAttempt
{
  CFPropertyListRef v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("lastReauthTime"), v5, CFSTR("com.apple.StatusKitAgent"));
  v2 = CFPreferencesCopyAppValue(CFSTR("reauthCount"), CFSTR("com.apple.StatusKitAgent"));
  if (v2)
    v3 = (void *)v2;
  else
    v3 = &unk_24D98DDF8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v3, "intValue") + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("reauthCount"), v4, CFSTR("com.apple.StatusKitAgent"));

}

- (int64_t)_maxReauthCount
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
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-reauth-max-count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_msgSend(v3, "integerValue");
    +[SKAAccountProvider logger](SKAAccountProvider, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our max reauth count should be %lu", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v4 = 5;
  }

  return v4;
}

- (int64_t)_authResetTime
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
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-reauth-backoff-time-seconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_msgSend(v3, "integerValue");
    +[SKAAccountProvider logger](SKAAccountProvider, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our reauth backoff time should be %lu", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v4 = 43200;
  }

  return v4;
}

+ (id)logger
{
  if (logger_onceToken_16 != -1)
    dispatch_once(&logger_onceToken_16, &__block_literal_global_16);
  return (id)logger__logger_16;
}

void __28__SKAAccountProvider_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAAccountProvider");
  v1 = (void *)logger__logger_16;
  logger__logger_16 = (uint64_t)v0;

}

- (OS_dispatch_queue)tokenFetchQueue
{
  return self->_tokenFetchQueue;
}

- (void)setTokenFetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_tokenFetchQueue, a3);
}

- (double)cachedTimestamp
{
  return self->_cachedTimestamp;
}

- (void)setCachedTimestamp:(double)a3
{
  self->_cachedTimestamp = a3;
}

- (NSMutableDictionary)cachedJwtTokenMap
{
  return self->_cachedJwtTokenMap;
}

- (void)setCachedJwtTokenMap:(id)a3
{
  objc_storeStrong((id *)&self->_cachedJwtTokenMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedJwtTokenMap, 0);
  objc_storeStrong((id *)&self->_tokenFetchQueue, 0);
}

void __72__SKAAccountProvider__jwtTokenForPrimaryAccountForIdentifier_withError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Unable to fetch system account! Likely no iCloud account signed in.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__SKAAccountProvider__jwtTokenForPrimaryAccountForIdentifier_withError___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Unable to fetch JWT token! Will use cached token if not expired", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)refreshCredentialForPrimaryAccountWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Unable to fetch system account! Likely no iCloud account signed in. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)refreshCredentialForPrimaryAccountWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "altDSID not available for account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)refreshCredentialForPrimaryAccountWithCompletion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Unable to fetch account store!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Auth refresh failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_primarySystemiCloudAccountWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Failed to find primary iCloud account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end

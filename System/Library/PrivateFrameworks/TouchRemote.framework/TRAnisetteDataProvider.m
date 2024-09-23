@implementation TRAnisetteDataProvider

- (TRAnisetteDataProvider)initWithSession:(id)a3
{
  id v5;
  TRAnisetteDataProvider *v6;
  TRAnisetteDataProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRAnisetteDataProvider;
  v6 = -[TRAnisetteDataProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_session, a3);

  return v7;
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  TRProvisionAnisetteDataRequest *v6;
  TRSession *session;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[TRAnisetteDataProvider provisionAnisetteWithCompletion:]";
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

  }
  v6 = objc_alloc_init(TRProvisionAnisetteDataRequest);
  session = self->_session;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__TRAnisetteDataProvider_provisionAnisetteWithCompletion___block_invoke;
  v9[3] = &unk_24C2E5648;
  v10 = v4;
  v8 = v4;
  -[TRSession sendRequest:withResponseHandler:](session, "sendRequest:withResponseHandler:", v6, v9);

}

void __58__TRAnisetteDataProvider_provisionAnisetteWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "-[TRAnisetteDataProvider provisionAnisetteWithCompletion:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "%s: response %@, error %@", (uint8_t *)&v8, 0x20u);
    }

  }
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "didSucceed"), v5);

}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  TRSyncAnisetteDataRequest *v9;
  TRSession *session;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[TRAnisetteDataProvider syncAnisetteWithSIMData:completion:]";
      _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

  }
  v9 = objc_alloc_init(TRSyncAnisetteDataRequest);
  -[TRSyncAnisetteDataRequest setSimData:](v9, "setSimData:", v6);
  session = self->_session;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__TRAnisetteDataProvider_syncAnisetteWithSIMData_completion___block_invoke;
  v12[3] = &unk_24C2E5648;
  v13 = v7;
  v11 = v7;
  -[TRSession sendRequest:withResponseHandler:](session, "sendRequest:withResponseHandler:", v9, v12);

}

void __61__TRAnisetteDataProvider_syncAnisetteWithSIMData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "-[TRAnisetteDataProvider syncAnisetteWithSIMData:completion:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "%s: response %@, error %@", (uint8_t *)&v8, 0x20u);
    }

  }
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "didSucceed"), v5);

}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  TREraseAnisetteDataRequest *v6;
  TRSession *session;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[TRAnisetteDataProvider eraseAnisetteWithCompletion:]";
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

  }
  v6 = objc_alloc_init(TREraseAnisetteDataRequest);
  session = self->_session;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__TRAnisetteDataProvider_eraseAnisetteWithCompletion___block_invoke;
  v9[3] = &unk_24C2E5648;
  v10 = v4;
  v8 = v4;
  -[TRSession sendRequest:withResponseHandler:](session, "sendRequest:withResponseHandler:", v6, v9);

}

void __54__TRAnisetteDataProvider_eraseAnisetteWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "-[TRAnisetteDataProvider eraseAnisetteWithCompletion:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "%s: response %@, error %@", (uint8_t *)&v8, 0x20u);
    }

  }
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "didSucceed"), v5);

}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  TRFetchAnisetteDataRequest *v8;
  uint64_t v9;
  TRSession *session;
  id v11;
  int64_t v12;
  dispatch_time_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[TRAnisetteDataProvider fetchAnisetteDataAndProvisionIfNecessary:withCompletion:]";
      _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

  }
  v8 = objc_alloc_init(TRFetchAnisetteDataRequest);
  -[TRFetchAnisetteDataRequest setShouldProvision:](v8, "setShouldProvision:", v4);
  self->_fetchAnisetteInProgress = 1;
  v9 = MEMORY[0x24BDAC760];
  session = self->_session;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __82__TRAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke;
  v17[3] = &unk_24C2E5698;
  v17[4] = self;
  v11 = v6;
  v18 = v11;
  -[TRSession sendRequest:withResponseHandler:](session, "sendRequest:withResponseHandler:", v8, v17);
  if (+[TRDefaults anisetteFetchTimeout](TRDefaults, "anisetteFetchTimeout"))
    v12 = 1000000000 * +[TRDefaults anisetteFetchTimeout](TRDefaults, "anisetteFetchTimeout");
  else
    v12 = 20000000000;
  v13 = dispatch_time(0, v12);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __82__TRAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_7;
  v15[3] = &unk_24C2E56C0;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  dispatch_after(v13, MEMORY[0x24BDAC9B8], v15);

}

void __82__TRAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[TRAnisetteDataProvider fetchAnisetteDataAndProvisionIfNecessary:withCompletion:]_block_invoke";
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "%s: response %@, error %@", buf, 0x20u);
    }

  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__TRAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_4;
  v11[3] = &unk_24C2E5670;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v8;
  v12 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __82__TRAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315138;
        v7 = "-[TRAnisetteDataProvider fetchAnisetteDataAndProvisionIfNecessary:withCompletion:]_block_invoke";
        _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s: Completing without timeout", (uint8_t *)&v6, 0xCu);
      }

      v1 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v1 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "anisetteData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, *(_QWORD *)(a1 + 48));

  }
}

void __82__TRAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 0;
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[TRAnisetteDataProvider fetchAnisetteDataAndProvisionIfNecessary:withCompletion:]_block_invoke";
        _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s: Timed out", (uint8_t *)&v5, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -12003, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  TRLegacyAnisetteDataRequest *v9;
  TRSession *session;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[TRAnisetteDataProvider legacyAnisetteDataForDSID:withCompletion:]";
      _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

  }
  v9 = objc_alloc_init(TRLegacyAnisetteDataRequest);
  -[TRLegacyAnisetteDataRequest setDsid:](v9, "setDsid:", v6);
  session = self->_session;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__TRAnisetteDataProvider_legacyAnisetteDataForDSID_withCompletion___block_invoke;
  v12[3] = &unk_24C2E5648;
  v13 = v7;
  v11 = v7;
  -[TRSession sendRequest:withResponseHandler:](session, "sendRequest:withResponseHandler:", v9, v12);

}

void __67__TRAnisetteDataProvider_legacyAnisetteDataForDSID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = "-[TRAnisetteDataProvider legacyAnisetteDataForDSID:withCompletion:]_block_invoke";
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "%s: response %@, error %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "anisetteData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);

}

- (TRSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end

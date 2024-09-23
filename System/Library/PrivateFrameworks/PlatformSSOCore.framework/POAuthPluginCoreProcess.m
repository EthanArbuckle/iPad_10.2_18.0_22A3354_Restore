@implementation POAuthPluginCoreProcess

- (POAuthPluginCoreProcess)initWithUid:(unsigned int)a3 forLogin:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v7;
  POAuthPluginCoreProcess *v8;
  POServiceCoreConnection *v9;
  POServiceCoreConnection *serviceConnection;
  objc_super v12;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  PO_LOG_POAuthPluginCoreProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POAuthPluginCoreProcess initWithUid:forLogin:].cold.1((uint64_t)self, v7);

  v12.receiver = self;
  v12.super_class = (Class)POAuthPluginCoreProcess;
  v8 = -[POAuthPluginCoreProcess init](&v12, sel_init);
  if (v8)
  {
    v9 = -[POServiceCoreConnection initWithUid:forLogin:]([POServiceCoreConnection alloc], "initWithUid:forLogin:", v5, v4);
    serviceConnection = v8->_serviceConnection;
    v8->_serviceConnection = v9;

    v8->_uid = v5;
  }
  return v8;
}

- (unint64_t)getLoginTypeForUser:(id)a3
{
  id v4;
  NSObject *v5;
  POServiceCoreConnection *serviceConnection;
  unint64_t v7;
  _QWORD v9[5];
  _BYTE buf[24];
  POAuthPluginCoreProcess *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POAuthPluginCoreProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[POAuthPluginCoreProcess getLoginTypeForUser:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    v11 = self;
    _os_log_impl(&dword_24440D000, v5, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@ on %@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v11 = 0;
  serviceConnection = self->_serviceConnection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__POAuthPluginCoreProcess_getLoginTypeForUser___block_invoke;
  v9[3] = &unk_251500758;
  v9[4] = buf;
  -[POServiceCoreConnection getLoginTypeForUser:completion:](serviceConnection, "getLoginTypeForUser:completion:", v4, v9);
  v7 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);

  return v7;
}

void __47__POAuthPluginCoreProcess_getLoginTypeForUser___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  PO_LOG_POAuthPluginCoreProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_24440D000, v6, OS_LOG_TYPE_DEFAULT, "loginType = %{public}@, error = %{public}@", (uint8_t *)&v8, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (unint64_t)verifyPasswordLogin:(id)a3 passwordContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  _QWORD v14[5];
  id v15;
  id v16;
  _BYTE *v17;
  _BYTE buf[24];
  id v19;
  __int16 v20;
  POAuthPluginCoreProcess *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PO_LOG_POAuthPluginCoreProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    +[POCredentialUtil maskName:](POCredentialUtil, "maskName:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[POAuthPluginCoreProcess verifyPasswordLogin:passwordContext:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2114;
    v19 = v7;
    v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v19 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__POAuthPluginCoreProcess_verifyPasswordLogin_passwordContext___block_invoke;
  v14[3] = &unk_251500710;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v17 = buf;
  v10 = v7;
  v11 = v6;
  _os_activity_initiate(&dword_24440D000, "PSSOPasswordVerify", OS_ACTIVITY_FLAG_DEFAULT, v14);

  v12 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v12;
}

uint64_t __63__POAuthPluginCoreProcess_verifyPasswordLogin_passwordContext___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__POAuthPluginCoreProcess_verifyPasswordLogin_passwordContext___block_invoke_2;
  v5[3] = &unk_251500758;
  v3 = a1[6];
  v5[4] = a1[7];
  return objc_msgSend(v2, "verifyPasswordLogin:passwordContext:completion:", v1, v3, v5);
}

void __63__POAuthPluginCoreProcess_verifyPasswordLogin_passwordContext___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  PO_LOG_POAuthPluginCoreProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    +[POConstantCoreUtil stringForLoginResult:](POConstantCoreUtil, "stringForLoginResult:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_24440D000, v6, OS_LOG_TYPE_DEFAULT, "loginResult = %{public}@, error = %{public}@", (uint8_t *)&v8, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (unint64_t)verifyPasswordUser:(id)a3 passwordContext:(id)a4 tokens:(id *)a5
{
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  unint64_t v14;
  _QWORD activity_block[5];
  id v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  PO_LOG_POAuthPluginCoreProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    +[POCredentialUtil maskName:](POCredentialUtil, "maskName:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[POAuthPluginCoreProcess verifyPasswordUser:passwordContext:tokens:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2114;
    v26 = v9;
    LOWORD(v27) = 2112;
    *(_QWORD *)((char *)&v27 + 2) = self;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  *(_QWORD *)&v27 = __Block_byref_object_dispose__2;
  *((_QWORD *)&v27 + 1) = 0;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __69__POAuthPluginCoreProcess_verifyPasswordUser_passwordContext_tokens___block_invoke;
  activity_block[3] = &unk_2515007A8;
  activity_block[4] = self;
  v12 = v8;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v19 = &v21;
  v20 = buf;
  _os_activity_initiate(&dword_24440D000, "PSSOPasswordVerify", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v14 = v22[3];
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __69__POAuthPluginCoreProcess_verifyPasswordUser_passwordContext_tokens___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__POAuthPluginCoreProcess_verifyPasswordUser_passwordContext_tokens___block_invoke_2;
  v5[3] = &unk_251500780;
  v6 = *(_OWORD *)(a1 + 56);
  return objc_msgSend(v2, "verifyPasswordUser:passwordContext:completion:", v1, v3, v5);
}

void __69__POAuthPluginCoreProcess_verifyPasswordUser_passwordContext_tokens___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a7;
  PO_LOG_POAuthPluginCoreProcess();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    +[POConstantCoreUtil stringForLoginResult:](POConstantCoreUtil, "stringForLoginResult:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v13;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_24440D000, v12, OS_LOG_TYPE_DEFAULT, "loginResult = %{public}@, error = %{public}@", (uint8_t *)&v16, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v10;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

- (void)initWithUid:(uint64_t)a1 forLogin:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[POAuthPluginCoreProcess initWithUid:forLogin:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_24440D000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

@end

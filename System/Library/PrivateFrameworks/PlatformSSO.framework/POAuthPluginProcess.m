@implementation POAuthPluginProcess

- (POAuthPluginProcess)initWithUid:(unsigned int)a3 forLogin:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v7;
  POAuthPluginProcess *v8;
  POServiceConnection *v9;
  POServiceConnection *serviceConnection;
  objc_super v12;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  PO_LOG_POAuthPluginProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POAuthPluginProcess initWithUid:forLogin:].cold.1((uint64_t)self, v7);

  v12.receiver = self;
  v12.super_class = (Class)POAuthPluginProcess;
  v8 = -[POAuthPluginCoreProcess initWithUid:forLogin:](&v12, sel_initWithUid_forLogin_, v5, v4);
  if (v8)
  {
    v9 = -[POServiceConnection initWithUid:forLogin:]([POServiceConnection alloc], "initWithUid:forLogin:", v5, v4);
    serviceConnection = v8->_serviceConnection;
    v8->_serviceConnection = v9;

    v8->_uid = v5;
  }
  return v8;
}

- (unint64_t)performPasswordLogin:(id)a3 passwordContext:(id)a4 updateLocalAccountPassword:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  _QWORD activity_block[5];
  id v17;
  id v18;
  _BYTE *v19;
  BOOL v20;
  _BYTE buf[24];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  POAuthPluginProcess *v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  PO_LOG_POAuthPluginProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[POAuthPluginProcess performPasswordLogin:passwordContext:updateLocalAccountPassword:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    v22 = v9;
    v23 = 2114;
    v24 = v11;
    v25 = 2112;
    v26 = self;
    _os_log_impl(&dword_22307D000, v10, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, passwordContext = %{public}@, updateLocalAccountPassword = %{public}@ on %@", buf, 0x34u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v22 = 0;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __87__POAuthPluginProcess_performPasswordLogin_passwordContext_updateLocalAccountPassword___block_invoke;
  activity_block[3] = &unk_24EC02710;
  activity_block[4] = self;
  v17 = v8;
  v20 = v5;
  v18 = v9;
  v19 = buf;
  v12 = v9;
  v13 = v8;
  _os_activity_initiate(&dword_22307D000, "PSSOPasswordLogin", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  v14 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v14;
}

uint64_t __87__POAuthPluginProcess_performPasswordLogin_passwordContext_updateLocalAccountPassword___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __87__POAuthPluginProcess_performPasswordLogin_passwordContext_updateLocalAccountPassword___block_invoke_2;
  v6[3] = &unk_24EC026E8;
  v4 = *(_QWORD *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v2, "performPasswordLogin:passwordContext:updateLocalAccountPassword:completion:", v1, v4, v3, v6);
}

void __87__POAuthPluginProcess_performPasswordLogin_passwordContext_updateLocalAccountPassword___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
  PO_LOG_POAuthPluginProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BE72E90], "stringForLoginResult:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_22307D000, v6, OS_LOG_TYPE_DEFAULT, "loginResult = %{public}@, error = %{public}@", (uint8_t *)&v8, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (BOOL)saveCredentialForUserName:(id)a3 passwordContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  char v11;
  _QWORD v13[5];
  id v14;
  id v15;
  _BYTE *v16;
  _BYTE buf[24];
  id v18;
  __int16 v19;
  POAuthPluginProcess *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PO_LOG_POAuthPluginProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[POAuthPluginProcess saveCredentialForUserName:passwordContext:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v18 = v7;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v18) = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__POAuthPluginProcess_saveCredentialForUserName_passwordContext___block_invoke;
  v13[3] = &unk_24EC02738;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = buf;
  v9 = v7;
  v10 = v6;
  _os_activity_initiate(&dword_22307D000, "PSSOSaveCredential", OS_ACTIVITY_FLAG_DEFAULT, v13);

  v11 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v11;
}

uint64_t __65__POAuthPluginProcess_saveCredentialForUserName_passwordContext___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__POAuthPluginProcess_saveCredentialForUserName_passwordContext___block_invoke_2;
  v5[3] = &unk_24EC02550;
  v3 = a1[6];
  v5[4] = a1[7];
  return objc_msgSend(v2, "saveCredentialForUserName:passwordContext:completion:", v1, v3, v5);
}

uint64_t __65__POAuthPluginProcess_saveCredentialForUserName_passwordContext___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)screenDidUnlockWithCredentialContext:(id)a3 smartCardContext:(id)a4 biometricContext:(id)a5 tokenId:(id)a6 atLogin:(BOOL)a7 tokenUnlock:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  BOOL v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  POAuthPluginProcess *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  PO_LOG_POAuthPluginProcess();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v31 = "-[POAuthPluginProcess screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:]";
    v32 = 2114;
    v33 = v14;
    v34 = 2114;
    v35 = v15;
    v36 = 2114;
    v37 = v16;
    v38 = 2112;
    v39 = self;
    _os_log_impl(&dword_22307D000, v18, OS_LOG_TYPE_DEFAULT, "%s context = %{public}@, sccontext = %{public}@, bcontext = %{public}@ on %@", buf, 0x34u);
  }

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __122__POAuthPluginProcess_screenDidUnlockWithCredentialContext_smartCardContext_biometricContext_tokenId_atLogin_tokenUnlock___block_invoke;
  v23[3] = &unk_24EC027A0;
  v23[4] = self;
  v24 = v14;
  v25 = v15;
  v26 = v16;
  v27 = v17;
  v28 = a7;
  v29 = a8;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  _os_activity_initiate(&dword_22307D000, "PSSOScreenUnlock", OS_ACTIVITY_FLAG_DEFAULT, v23);

}

uint64_t __122__POAuthPluginProcess_screenDidUnlockWithCredentialContext_smartCardContext_biometricContext_tokenId_atLogin_tokenUnlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), &__block_literal_global_4);
}

void __122__POAuthPluginProcess_screenDidUnlockWithCredentialContext_smartCardContext_biometricContext_tokenId_atLogin_tokenUnlock___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  PO_LOG_POAuthPluginProcess();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22307D000, v0, OS_LOG_TYPE_DEFAULT, "screenDidUnlock completed", v1, 2u);
  }

}

- (void)retainContextForUserName:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  POAuthPluginProcess *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  PO_LOG_POAuthPluginProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[POAuthPluginProcess retainContextForUserName:context:]";
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v9, 0x16u);
  }

  -[POServiceConnection retainContextForUserName:context:completion:](self->_serviceConnection, "retainContextForUserName:context:completion:", v7, v6, &__block_literal_global_6);
}

- (void)updateLocalAccountPassword:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  POServiceConnection *serviceConnection;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  POAuthPluginProcess *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  PO_LOG_POAuthPluginProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[POAuthPluginProcess updateLocalAccountPassword:passwordContext:completion:]";
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_22307D000, v11, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v14, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  objc_msgSend(v9, "externalizedContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[POServiceConnection updateLocalAccountPassword:passwordContextData:completion:](serviceConnection, "updateLocalAccountPassword:passwordContextData:completion:", v10, v13, v8);
}

- (void)configurationDidChangeAndRemovedExtension:(id)a3 removed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  POAuthPluginProcess *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PO_LOG_POAuthPluginProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[POAuthPluginProcess configurationDidChangeAndRemovedExtension:removed:]";
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_22307D000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v8, 0x16u);
  }

  -[POServiceConnection configurationDidChangeAndRemovedExtension:removed:completion:](self->_serviceConnection, "configurationDidChangeAndRemovedExtension:removed:completion:", v6, v4, &__block_literal_global_7);
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
  v3 = "-[POAuthPluginProcess initWithUid:forLogin:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_22307D000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

@end

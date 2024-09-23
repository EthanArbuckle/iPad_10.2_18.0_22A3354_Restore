@implementation PRPersonaStore

- (PRPersonaStore)init
{
  return -[PRPersonaStore initWithServiceListenerEndpoint:](self, "initWithServiceListenerEndpoint:", 0);
}

- (PRPersonaStore)initWithServiceListenerEndpoint:(id)a3
{
  id v5;
  PRPersonaStore *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *replyHandlingQueue;
  NSLock *v9;
  NSLock *connectionLock;
  NSLock *v11;
  NSLock *dataVendingFlagLock;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PRPersonaStore;
  v6 = -[PRPersonaStore init](&v14, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.personakit.xpc.reply", MEMORY[0x24BDAC9C0]);
    replyHandlingQueue = v6->_replyHandlingQueue;
    v6->_replyHandlingQueue = (OS_dispatch_queue *)v7;

    v9 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    connectionLock = v6->_connectionLock;
    v6->_connectionLock = v9;

    -[NSLock setName:](v6->_connectionLock, "setName:", CFSTR("PRPersonaStoreXPCLock"));
    v11 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    dataVendingFlagLock = v6->_dataVendingFlagLock;
    v6->_dataVendingFlagLock = v11;

    -[NSLock setName:](v6->_dataVendingFlagLock, "setName:", CFSTR("PRPersonaStoreDataVendFlagLock"));
    objc_storeStrong((id *)&v6->_serviceListenerEndpoint, a3);
    -[PRPersonaStore _startListeningForCacheChangeNotifications](v6, "_startListeningForCacheChangeNotifications");
  }

  return v6;
}

- (void)dealloc
{
  NSXPCConnection *personaServiceConnection;
  NSXPCConnection *v4;
  objc_super v5;

  -[NSLock lock](self->_connectionLock, "lock");
  personaServiceConnection = self->_personaServiceConnection;
  if (personaServiceConnection)
  {
    -[NSXPCConnection invalidate](personaServiceConnection, "invalidate");
    v4 = self->_personaServiceConnection;
    self->_personaServiceConnection = 0;

  }
  -[NSLock unlock](self->_connectionLock, "unlock");
  -[PRPersonaStore _stopListeningForCacheChangeNotifications](self, "_stopListeningForCacheChangeNotifications");
  v5.receiver = self;
  v5.super_class = (Class)PRPersonaStore;
  -[PRPersonaStore dealloc](&v5, sel_dealloc);
}

- (BOOL)hasVendedData
{
  BOOL hasVendedData;

  -[NSLock lock](self->_dataVendingFlagLock, "lock");
  hasVendedData = self->_hasVendedData;
  -[NSLock unlock](self->_dataVendingFlagLock, "unlock");
  return hasVendedData;
}

- (void)_setHasVendedData:(BOOL)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _PRGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[PRPersonaStore _setHasVendedData:]";
    v8 = 1024;
    v9 = 104;
    _os_log_impl(&dword_209583000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\", (uint8_t *)&v6, 0x12u);
  }

  -[NSLock lock](self->_dataVendingFlagLock, "lock");
  self->_hasVendedData = a3;
  -[NSLock unlock](self->_dataVendingFlagLock, "unlock");
}

- (void)currentLikenessForPrimaryiCloudAccountWithCompletion:(id)a3
{
  -[PRPersonaStore currentLikenessForPrimaryiCloudAccountWithDesiredFreshness:completion:](self, "currentLikenessForPrimaryiCloudAccountWithDesiredFreshness:completion:", 0, a3);
}

- (void)currentLikenessForPrimaryiCloudAccountWithDesiredFreshness:(unint64_t)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _PRGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[PRPersonaStore currentLikenessForPrimaryiCloudAccountWithDesiredFreshness:completion:]";
    v13 = 1024;
    v14 = 119;
    _os_log_impl(&dword_209583000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up current likeness for primary iCloud account...\", buf, 0x12u);
  }

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __88__PRPersonaStore_currentLikenessForPrimaryiCloudAccountWithDesiredFreshness_completion___block_invoke;
  v9[3] = &unk_24C1C1650;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v9);
  v8[2](v8, 0, 0);

}

void __88__PRPersonaStore_currentLikenessForPrimaryiCloudAccountWithDesiredFreshness_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _PRGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    v17 = "-[PRPersonaStore currentLikenessForPrimaryiCloudAccountWithDesiredFreshness:completion:]_block_invoke";
    v18 = 1024;
    v19 = 123;
    v20 = 2112;
    v21 = v6;
    v9 = "%s (%d) \"Likeness lookup for primary iCloud account came back with an error: %@\";
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    v17 = "-[PRPersonaStore currentLikenessForPrimaryiCloudAccountWithDesiredFreshness:completion:]_block_invoke";
    v18 = 1024;
    v19 = 125;
    v20 = 2112;
    v21 = v5;
    v9 = "%s (%d) \"Likeness lookup for primary iCloud account succeeded: %@\";
  }
  _os_log_impl(&dword_209583000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0x1Cu);
LABEL_7:

  objc_msgSend(*(id *)(a1 + 32), "_setHasVendedData:", 1);
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__PRPersonaStore_currentLikenessForPrimaryiCloudAccountWithDesiredFreshness_completion___block_invoke_10;
    block[3] = &unk_24C1C1628;
    v15 = v10;
    v13 = v5;
    v14 = v6;
    dispatch_async(v11, block);

  }
}

uint64_t __88__PRPersonaStore_currentLikenessForPrimaryiCloudAccountWithDesiredFreshness_completion___block_invoke_10(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)allLikenessesForPrimaryiCloudAccountWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _PRGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[PRPersonaStore allLikenessesForPrimaryiCloudAccountWithCompletion:]";
    v12 = 1024;
    v13 = 151;
    _os_log_impl(&dword_209583000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up all likenesses for primary iCloud account...\", buf, 0x12u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__PRPersonaStore_allLikenessesForPrimaryiCloudAccountWithCompletion___block_invoke;
  v8[3] = &unk_24C1C1678;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v8);
  v7[2](v7, 0, 0);

}

void __69__PRPersonaStore_allLikenessesForPrimaryiCloudAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _PRGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    v17 = "-[PRPersonaStore allLikenessesForPrimaryiCloudAccountWithCompletion:]_block_invoke";
    v18 = 1024;
    v19 = 155;
    v20 = 2112;
    v21 = v6;
    v9 = "%s (%d) \"Likenesses lookup for primary iCloud account came back with an error: %@\";
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    v17 = "-[PRPersonaStore allLikenessesForPrimaryiCloudAccountWithCompletion:]_block_invoke";
    v18 = 1024;
    v19 = 157;
    v20 = 2112;
    v21 = v5;
    v9 = "%s (%d) \"Likenesses lookup for primary iCloud account succeeded: %@\";
  }
  _os_log_impl(&dword_209583000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0x1Cu);
LABEL_7:

  objc_msgSend(*(id *)(a1 + 32), "_setHasVendedData:", 1);
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__PRPersonaStore_allLikenessesForPrimaryiCloudAccountWithCompletion___block_invoke_13;
    block[3] = &unk_24C1C1628;
    v15 = v10;
    v13 = v5;
    v14 = v6;
    dispatch_async(v11, block);

  }
}

uint64_t __69__PRPersonaStore_allLikenessesForPrimaryiCloudAccountWithCompletion___block_invoke_13(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)likenessForPhoneNumber:(id)a3 completion:(id)a4
{
  -[PRPersonaStore likenessForPhoneNumber:desiredFreshness:completion:](self, "likenessForPhoneNumber:desiredFreshness:completion:", a3, 0, a4);
}

- (void)likenessForPhoneNumber:(id)a3 desiredFreshness:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  _QWORD v13[4];
  id v14;
  PRPersonaStore *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  _PRGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore likenessForPhoneNumber:desiredFreshness:completion:]";
    v19 = 1024;
    v20 = 189;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_209583000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up likeness for phone number %@...\", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__PRPersonaStore_likenessForPhoneNumber_desiredFreshness_completion___block_invoke;
  v13[3] = &unk_24C1C16A0;
  v14 = v7;
  v15 = self;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v13);
  v12[2](v12, 0, 0);

}

void __69__PRPersonaStore_likenessForPhoneNumber_desiredFreshness_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _PRGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    v19 = "-[PRPersonaStore likenessForPhoneNumber:desiredFreshness:completion:]_block_invoke";
    v20 = 1024;
    v21 = 193;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v6;
    v10 = "%s (%d) \"Likeness lookup for phone number %@ came back with an error: %@\";
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    v19 = "-[PRPersonaStore likenessForPhoneNumber:desiredFreshness:completion:]_block_invoke";
    v20 = 1024;
    v21 = 195;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v5;
    v10 = "%s (%d) \"Likeness lookup for phone number %@ succeeded: %@\";
  }
  _os_log_impl(&dword_209583000, v7, OS_LOG_TYPE_DEFAULT, v10, buf, 0x26u);
LABEL_7:

  objc_msgSend(*(id *)(a1 + 40), "_setHasVendedData:", 1);
  v12 = *(void **)(a1 + 48);
  if (v12)
  {
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__PRPersonaStore_likenessForPhoneNumber_desiredFreshness_completion___block_invoke_15;
    block[3] = &unk_24C1C1628;
    v17 = v12;
    v15 = v5;
    v16 = v6;
    dispatch_async(v13, block);

  }
}

uint64_t __69__PRPersonaStore_likenessForPhoneNumber_desiredFreshness_completion___block_invoke_15(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)likenessForEmailAddress:(id)a3 completion:(id)a4
{
  -[PRPersonaStore likenessForEmailAddress:desiredFreshness:completion:](self, "likenessForEmailAddress:desiredFreshness:completion:", a3, 0, a4);
}

- (void)likenessForEmailAddress:(id)a3 desiredFreshness:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  _QWORD v13[4];
  id v14;
  PRPersonaStore *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  _PRGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore likenessForEmailAddress:desiredFreshness:completion:]";
    v19 = 1024;
    v20 = 227;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_209583000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up likeness for email %@...\", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __70__PRPersonaStore_likenessForEmailAddress_desiredFreshness_completion___block_invoke;
  v13[3] = &unk_24C1C16A0;
  v14 = v7;
  v15 = self;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v13);
  v12[2](v12, 0, 0);

}

void __70__PRPersonaStore_likenessForEmailAddress_desiredFreshness_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _PRGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    v19 = "-[PRPersonaStore likenessForEmailAddress:desiredFreshness:completion:]_block_invoke";
    v20 = 1024;
    v21 = 231;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v6;
    v10 = "%s (%d) \"Likeness lookup for emailAddress %@ came back with an error: %@\";
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    v19 = "-[PRPersonaStore likenessForEmailAddress:desiredFreshness:completion:]_block_invoke";
    v20 = 1024;
    v21 = 233;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v5;
    v10 = "%s (%d) \"Likeness lookup for emailAddress %@ succeeded: %@\";
  }
  _os_log_impl(&dword_209583000, v7, OS_LOG_TYPE_DEFAULT, v10, buf, 0x26u);
LABEL_7:

  objc_msgSend(*(id *)(a1 + 40), "_setHasVendedData:", 1);
  v12 = *(void **)(a1 + 48);
  if (v12)
  {
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__PRPersonaStore_likenessForEmailAddress_desiredFreshness_completion___block_invoke_16;
    block[3] = &unk_24C1C1628;
    v17 = v12;
    v15 = v5;
    v16 = v6;
    dispatch_async(v13, block);

  }
}

uint64_t __70__PRPersonaStore_likenessForEmailAddress_desiredFreshness_completion___block_invoke_16(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)saveLikeness:(id)a3 forPrimayiCloudAccountWithCompletion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _PRGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[PRPersonaStore saveLikeness:forPrimayiCloudAccountWithCompletion:]";
    v13 = 1024;
    v14 = 265;
    _os_log_impl(&dword_209583000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Saving likeness for primary iCloud account...\", buf, 0x12u);
  }

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__PRPersonaStore_saveLikeness_forPrimayiCloudAccountWithCompletion___block_invoke;
  v9[3] = &unk_24C1C16F0;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v9);
  v8[2](v8, 1, 0);

}

void __68__PRPersonaStore_saveLikeness_forPrimayiCloudAccountWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _PRGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore saveLikeness:forPrimayiCloudAccountWithCompletion:]_block_invoke";
    v19 = 1024;
    v20 = 269;
    v21 = 2112;
    v22 = v5;
    v8 = "%s (%d) \"Likeness write came back with an error: %@\";
    v9 = v6;
    v10 = 28;
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    v18 = "-[PRPersonaStore saveLikeness:forPrimayiCloudAccountWithCompletion:]_block_invoke";
    v19 = 1024;
    v20 = 271;
    v8 = "%s (%d) \"Likeness write succeeded.\";
    v9 = v6;
    v10 = 18;
  }
  _os_log_impl(&dword_209583000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__PRPersonaStore_saveLikeness_forPrimayiCloudAccountWithCompletion___block_invoke_17;
    block[3] = &unk_24C1C16C8;
    v15 = v11;
    v16 = a2;
    v14 = v5;
    dispatch_async(v12, block);

  }
}

uint64_t __68__PRPersonaStore_saveLikeness_forPrimayiCloudAccountWithCompletion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)changeCurrentSelfLikenessToLikenessWithUniqueID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _PRGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[PRPersonaStore changeCurrentSelfLikenessToLikenessWithUniqueID:completion:]";
    v15 = 1024;
    v16 = 295;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_209583000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Changing current self likeness to the one with ID: %@...\", buf, 0x1Cu);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__PRPersonaStore_changeCurrentSelfLikenessToLikenessWithUniqueID_completion___block_invoke;
  v11[3] = &unk_24C1C16F0;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v11);
  v10[2](v10, 1, 0);

}

void __77__PRPersonaStore_changeCurrentSelfLikenessToLikenessWithUniqueID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _PRGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore changeCurrentSelfLikenessToLikenessWithUniqueID:completion:]_block_invoke";
    v19 = 1024;
    v20 = 299;
    v21 = 2112;
    v22 = v5;
    v8 = "%s (%d) \"Error: %@\";
    v9 = v6;
    v10 = 28;
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    v18 = "-[PRPersonaStore changeCurrentSelfLikenessToLikenessWithUniqueID:completion:]_block_invoke";
    v19 = 1024;
    v20 = 301;
    v8 = "%s (%d) \"Success.\";
    v9 = v6;
    v10 = 18;
  }
  _os_log_impl(&dword_209583000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__PRPersonaStore_changeCurrentSelfLikenessToLikenessWithUniqueID_completion___block_invoke_19;
    block[3] = &unk_24C1C16C8;
    v15 = v11;
    v16 = a2;
    v14 = v5;
    dispatch_async(v12, block);

  }
}

uint64_t __77__PRPersonaStore_changeCurrentSelfLikenessToLikenessWithUniqueID_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)removeLikeness:(id)a3 forPrimayiCloudAccountWithCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _PRGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[PRPersonaStore removeLikeness:forPrimayiCloudAccountWithCompletion:]";
    v15 = 1024;
    v16 = 325;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_209583000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Removing likeness self likeness %@...\", buf, 0x1Cu);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__PRPersonaStore_removeLikeness_forPrimayiCloudAccountWithCompletion___block_invoke;
  v11[3] = &unk_24C1C16F0;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v11);
  v10[2](v10, 1, 0);

}

void __70__PRPersonaStore_removeLikeness_forPrimayiCloudAccountWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _PRGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore removeLikeness:forPrimayiCloudAccountWithCompletion:]_block_invoke";
    v19 = 1024;
    v20 = 329;
    v21 = 2112;
    v22 = v5;
    v8 = "%s (%d) \"Likeness removal came back with an error: %@\";
    v9 = v6;
    v10 = 28;
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    v18 = "-[PRPersonaStore removeLikeness:forPrimayiCloudAccountWithCompletion:]_block_invoke";
    v19 = 1024;
    v20 = 331;
    v8 = "%s (%d) \"Likeness removal succeeded.\";
    v9 = v6;
    v10 = 18;
  }
  _os_log_impl(&dword_209583000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__PRPersonaStore_removeLikeness_forPrimayiCloudAccountWithCompletion___block_invoke_20;
    block[3] = &unk_24C1C16C8;
    v15 = v11;
    v16 = a2;
    v14 = v5;
    dispatch_async(v12, block);

  }
}

uint64_t __70__PRPersonaStore_removeLikeness_forPrimayiCloudAccountWithCompletion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)removeAllLikenessForPrimaryiCloudAccountWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _PRGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[PRPersonaStore removeAllLikenessForPrimaryiCloudAccountWithCompletion:]";
    v12 = 1024;
    v13 = 355;
    _os_log_impl(&dword_209583000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Removing all likenesses for primary iCloud account...\", buf, 0x12u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__PRPersonaStore_removeAllLikenessForPrimaryiCloudAccountWithCompletion___block_invoke;
  v8[3] = &unk_24C1C16F0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v8);
  v7[2](v7, 1, 0);

}

void __73__PRPersonaStore_removeAllLikenessForPrimaryiCloudAccountWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _PRGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore removeAllLikenessForPrimaryiCloudAccountWithCompletion:]_block_invoke";
    v19 = 1024;
    v20 = 359;
    v21 = 2112;
    v22 = v5;
    v8 = "%s (%d) \"Removing likenesses came back with an error: %@\";
    v9 = v6;
    v10 = 28;
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    v18 = "-[PRPersonaStore removeAllLikenessForPrimaryiCloudAccountWithCompletion:]_block_invoke";
    v19 = 1024;
    v20 = 361;
    v8 = "%s (%d) \"Removing likenesses succeeded.\";
    v9 = v6;
    v10 = 18;
  }
  _os_log_impl(&dword_209583000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__PRPersonaStore_removeAllLikenessForPrimaryiCloudAccountWithCompletion___block_invoke_21;
    block[3] = &unk_24C1C16C8;
    v15 = v11;
    v16 = a2;
    v14 = v5;
    dispatch_async(v12, block);

  }
}

uint64_t __73__PRPersonaStore_removeAllLikenessForPrimaryiCloudAccountWithCompletion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (unsigned)likenessVersionDigestForEmail:(id)a3
{
  -[PRPersonaStore _setHasVendedData:](self, "_setHasVendedData:", 1);
  return 0;
}

- (unsigned)likenessVersionDigestForPhoneNumber:(id)a3
{
  -[PRPersonaStore _setHasVendedData:](self, "_setHasVendedData:", 1);
  return 0;
}

- (id)likenessDataForPropagationToRecipient:(id)a3 lastContactDate:(id)a4
{
  -[PRPersonaStore _setHasVendedData:](self, "_setHasVendedData:", 1, a4);
  return (id)objc_msgSend(0, "dataForPropagation");
}

- (void)handleAppleIDEvent:(unint64_t)a3 account:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  _PRGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v17 = "-[PRPersonaStore handleAppleIDEvent:account:completion:]";
    v18 = 1024;
    v19 = 523;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_209583000, v10, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Handling event %@ for account: %@\", buf, 0x26u);

  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__PRPersonaStore_handleAppleIDEvent_account_completion___block_invoke;
  v14[3] = &unk_24C1C16F0;
  v14[4] = self;
  v15 = v9;
  v12 = v9;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v14);
  v13[2](v13, 1, 0);

}

void __56__PRPersonaStore_handleAppleIDEvent_account_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _PRGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore handleAppleIDEvent:account:completion:]_block_invoke";
    v19 = 1024;
    v20 = 527;
    v21 = 2112;
    v22 = v5;
    v8 = "%s (%d) \"Error: %@\";
    v9 = v6;
    v10 = 28;
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    v18 = "-[PRPersonaStore handleAppleIDEvent:account:completion:]_block_invoke";
    v19 = 1024;
    v20 = 529;
    v8 = "%s (%d) \"Success.\";
    v9 = v6;
    v10 = 18;
  }
  _os_log_impl(&dword_209583000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__PRPersonaStore_handleAppleIDEvent_account_completion___block_invoke_23;
    block[3] = &unk_24C1C16C8;
    v15 = v11;
    v16 = a2;
    v14 = v5;
    dispatch_async(v12, block);

  }
}

uint64_t __56__PRPersonaStore_handleAppleIDEvent_account_completion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)donateLikeness:(id)a3 forEmailAddress:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  _QWORD v13[4];
  id v14;
  PRPersonaStore *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  _PRGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore donateLikeness:forEmailAddress:completion:]";
    v19 = 1024;
    v20 = 553;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_209583000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Donation for email %@...\", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__PRPersonaStore_donateLikeness_forEmailAddress_completion___block_invoke;
  v13[3] = &unk_24C1C1718;
  v15 = self;
  v16 = v8;
  v14 = v7;
  v10 = v8;
  v11 = v7;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v13);
  v12[2](v12, 1, 0);

}

void __60__PRPersonaStore_donateLikeness_forEmailAddress_completion___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _PRGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_7;
    v8 = a1[4];
    *(_DWORD *)buf = 136315906;
    v20 = "-[PRPersonaStore donateLikeness:forEmailAddress:completion:]_block_invoke";
    v21 = 1024;
    v22 = 557;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v5;
    v9 = "%s (%d) \"Donation failed for email %@. Error: %@\";
    v10 = v6;
    v11 = 38;
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    v12 = a1[4];
    *(_DWORD *)buf = 136315650;
    v20 = "-[PRPersonaStore donateLikeness:forEmailAddress:completion:]_block_invoke";
    v21 = 1024;
    v22 = 559;
    v23 = 2112;
    v24 = v12;
    v9 = "%s (%d) \"Donation succeeded for email %@.\";
    v10 = v6;
    v11 = 28;
  }
  _os_log_impl(&dword_209583000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  v13 = (void *)a1[6];
  if (v13)
  {
    v14 = *(NSObject **)(a1[5] + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__PRPersonaStore_donateLikeness_forEmailAddress_completion___block_invoke_24;
    block[3] = &unk_24C1C16C8;
    v17 = v13;
    v18 = a2;
    v16 = v5;
    dispatch_async(v14, block);

  }
}

uint64_t __60__PRPersonaStore_donateLikeness_forEmailAddress_completion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)donateLikeness:(id)a3 forPhoneNumber:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  _QWORD v13[4];
  id v14;
  PRPersonaStore *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  _PRGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore donateLikeness:forPhoneNumber:completion:]";
    v19 = 1024;
    v20 = 583;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_209583000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Donation for phone number %@...\", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__PRPersonaStore_donateLikeness_forPhoneNumber_completion___block_invoke;
  v13[3] = &unk_24C1C1718;
  v15 = self;
  v16 = v8;
  v14 = v7;
  v10 = v8;
  v11 = v7;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v13);
  v12[2](v12, 1, 0);

}

void __59__PRPersonaStore_donateLikeness_forPhoneNumber_completion___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _PRGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_7;
    v8 = a1[4];
    *(_DWORD *)buf = 136315906;
    v20 = "-[PRPersonaStore donateLikeness:forPhoneNumber:completion:]_block_invoke";
    v21 = 1024;
    v22 = 587;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v5;
    v9 = "%s (%d) \"Donation failed for phone number %@. Error: %@\";
    v10 = v6;
    v11 = 38;
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    v12 = a1[4];
    *(_DWORD *)buf = 136315650;
    v20 = "-[PRPersonaStore donateLikeness:forPhoneNumber:completion:]_block_invoke";
    v21 = 1024;
    v22 = 589;
    v23 = 2112;
    v24 = v12;
    v9 = "%s (%d) \"Donation succeeded for phone number %@.\";
    v10 = v6;
    v11 = 28;
  }
  _os_log_impl(&dword_209583000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  v13 = (void *)a1[6];
  if (v13)
  {
    v14 = *(NSObject **)(a1[5] + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__PRPersonaStore_donateLikeness_forPhoneNumber_completion___block_invoke_25;
    block[3] = &unk_24C1C16C8;
    v17 = v13;
    v18 = a2;
    v16 = v5;
    dispatch_async(v14, block);

  }
}

uint64_t __59__PRPersonaStore_donateLikeness_forPhoneNumber_completion___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)likenessesWithExternalIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _QWORD v12[4];
  id v13;
  PRPersonaStore *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _PRGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[PRPersonaStore likenessesWithExternalIdentifier:completion:]";
    v18 = 1024;
    v19 = 613;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_209583000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up for external ID: %@\", buf, 0x1Cu);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__PRPersonaStore_likenessesWithExternalIdentifier_completion___block_invoke;
  v12[3] = &unk_24C1C1740;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v12);
  v11[2](v11, 0, 0);

}

void __62__PRPersonaStore_likenessesWithExternalIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _PRGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    v21 = "-[PRPersonaStore likenessesWithExternalIdentifier:completion:]_block_invoke";
    v22 = 1024;
    v23 = 617;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v6;
    v10 = "%s (%d) \"Lookup for external ID %@ failed. Error: %@\";
    v11 = v7;
    v12 = 38;
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v21 = "-[PRPersonaStore likenessesWithExternalIdentifier:completion:]_block_invoke";
    v22 = 1024;
    v23 = 619;
    v24 = 2112;
    v25 = v13;
    v10 = "%s (%d) \"Lookup for external ID %@ succeeded.\";
    v11 = v7;
    v12 = 28;
  }
  _os_log_impl(&dword_209583000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  objc_msgSend(*(id *)(a1 + 40), "_setHasVendedData:", 1);
  v14 = *(void **)(a1 + 48);
  if (v14)
  {
    v15 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__PRPersonaStore_likenessesWithExternalIdentifier_completion___block_invoke_26;
    block[3] = &unk_24C1C1628;
    v19 = v14;
    v17 = v5;
    v18 = v6;
    dispatch_async(v15, block);

  }
}

uint64_t __62__PRPersonaStore_likenessesWithExternalIdentifier_completion___block_invoke_26(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)likenessWithUniqueID:(id)a3
{
  -[PRPersonaStore _setHasVendedData:](self, "_setHasVendedData:", 1);
  return 0;
}

- (void)screenNameForEmailAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  _QWORD v13[4];
  id v14;
  PRPersonaStore *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _PRGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore screenNameForEmailAddress:completion:]";
    v19 = 1024;
    v20 = 667;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_209583000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up with email: %@\", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__PRPersonaStore_screenNameForEmailAddress_completion___block_invoke;
  v13[3] = &unk_24C1C1768;
  v15 = self;
  v16 = v7;
  v14 = v6;
  v9 = v7;
  v10 = v6;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v13);
  objc_msgSend(MEMORY[0x24BDD1540], "pr_errorWithCode:", -9019);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v12);

}

void __55__PRPersonaStore_screenNameForEmailAddress_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _PRGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    v9 = a1[4];
    *(_DWORD *)buf = 136315906;
    v21 = "-[PRPersonaStore screenNameForEmailAddress:completion:]_block_invoke";
    v22 = 1024;
    v23 = 671;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v6;
    v10 = "%s (%d) \"Lookup for %@ failed. Error: %@\";
    v11 = v7;
    v12 = 38;
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    v13 = a1[4];
    *(_DWORD *)buf = 136315650;
    v21 = "-[PRPersonaStore screenNameForEmailAddress:completion:]_block_invoke";
    v22 = 1024;
    v23 = 673;
    v24 = 2112;
    v25 = v13;
    v10 = "%s (%d) \"Lookup for %@ succeeded.\";
    v11 = v7;
    v12 = 28;
  }
  _os_log_impl(&dword_209583000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  v14 = (void *)a1[6];
  if (v14)
  {
    v15 = *(NSObject **)(a1[5] + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__PRPersonaStore_screenNameForEmailAddress_completion___block_invoke_27;
    block[3] = &unk_24C1C1628;
    v19 = v14;
    v17 = v5;
    v18 = v6;
    dispatch_async(v15, block);

  }
}

uint64_t __55__PRPersonaStore_screenNameForEmailAddress_completion___block_invoke_27(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)screenNameForPhoneNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  _QWORD v13[4];
  id v14;
  PRPersonaStore *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _PRGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore screenNameForPhoneNumber:completion:]";
    v19 = 1024;
    v20 = 698;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_209583000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up with phone number: %@\", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__PRPersonaStore_screenNameForPhoneNumber_completion___block_invoke;
  v13[3] = &unk_24C1C1768;
  v15 = self;
  v16 = v7;
  v14 = v6;
  v9 = v7;
  v10 = v6;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v13);
  objc_msgSend(MEMORY[0x24BDD1540], "pr_errorWithCode:", -9019);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v12);

}

void __54__PRPersonaStore_screenNameForPhoneNumber_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _PRGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    v9 = a1[4];
    *(_DWORD *)buf = 136315906;
    v21 = "-[PRPersonaStore screenNameForPhoneNumber:completion:]_block_invoke";
    v22 = 1024;
    v23 = 702;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v6;
    v10 = "%s (%d) \"Lookup for %@ failed. Error: %@\";
    v11 = v7;
    v12 = 38;
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    v13 = a1[4];
    *(_DWORD *)buf = 136315650;
    v21 = "-[PRPersonaStore screenNameForPhoneNumber:completion:]_block_invoke";
    v22 = 1024;
    v23 = 704;
    v24 = 2112;
    v25 = v13;
    v10 = "%s (%d) \"Lookup for %@ succeeded.\";
    v11 = v7;
    v12 = 28;
  }
  _os_log_impl(&dword_209583000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  v14 = (void *)a1[6];
  if (v14)
  {
    v15 = *(NSObject **)(a1[5] + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__PRPersonaStore_screenNameForPhoneNumber_completion___block_invoke_30;
    block[3] = &unk_24C1C1628;
    v19 = v14;
    v17 = v5;
    v18 = v6;
    dispatch_async(v15, block);

  }
}

uint64_t __54__PRPersonaStore_screenNameForPhoneNumber_completion___block_invoke_30(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)screenNameForPrimaryiCloudAccountWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  PRPersonaStore *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _PRGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[PRPersonaStore screenNameForPrimaryiCloudAccountWithCompletion:]";
    v17 = 1024;
    v18 = 729;
    _os_log_impl(&dword_209583000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\", buf, 0x12u);
  }

  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __66__PRPersonaStore_screenNameForPrimaryiCloudAccountWithCompletion___block_invoke;
  v12 = &unk_24C1C1790;
  v13 = self;
  v14 = v4;
  v6 = v4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](&v9);
  objc_msgSend(MEMORY[0x24BDD1540], "pr_errorWithCode:", -9019, v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);

}

void __66__PRPersonaStore_screenNameForPrimaryiCloudAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _PRGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    v19 = "-[PRPersonaStore screenNameForPrimaryiCloudAccountWithCompletion:]_block_invoke";
    v20 = 1024;
    v21 = 733;
    v22 = 2112;
    v23 = v6;
    v9 = "%s (%d) \"Lookup failed. Error: %@\";
    v10 = v7;
    v11 = 28;
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    v19 = "-[PRPersonaStore screenNameForPrimaryiCloudAccountWithCompletion:]_block_invoke";
    v20 = 1024;
    v21 = 735;
    v9 = "%s (%d) \"Lookup succeeded.\";
    v10 = v7;
    v11 = 18;
  }
  _os_log_impl(&dword_209583000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  v12 = *(void **)(a1 + 40);
  if (v12)
  {
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__PRPersonaStore_screenNameForPrimaryiCloudAccountWithCompletion___block_invoke_31;
    block[3] = &unk_24C1C1628;
    v17 = v12;
    v15 = v5;
    v16 = v6;
    dispatch_async(v13, block);

  }
}

uint64_t __66__PRPersonaStore_screenNameForPrimaryiCloudAccountWithCompletion___block_invoke_31(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)screenNameForAppleIDWithAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  _QWORD v13[4];
  id v14;
  PRPersonaStore *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _PRGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore screenNameForAppleIDWithAltDSID:completion:]";
    v19 = 1024;
    v20 = 760;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_209583000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up with altDSID: %@\", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__PRPersonaStore_screenNameForAppleIDWithAltDSID_completion___block_invoke;
  v13[3] = &unk_24C1C1768;
  v15 = self;
  v16 = v7;
  v14 = v6;
  v9 = v7;
  v10 = v6;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v13);
  objc_msgSend(MEMORY[0x24BDD1540], "pr_errorWithCode:", -9019);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v12);

}

void __61__PRPersonaStore_screenNameForAppleIDWithAltDSID_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _PRGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    v9 = a1[4];
    *(_DWORD *)buf = 136315906;
    v21 = "-[PRPersonaStore screenNameForAppleIDWithAltDSID:completion:]_block_invoke";
    v22 = 1024;
    v23 = 764;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v6;
    v10 = "%s (%d) \"Lookup for %@ failed. Error: %@\";
    v11 = v7;
    v12 = 38;
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    v13 = a1[4];
    *(_DWORD *)buf = 136315650;
    v21 = "-[PRPersonaStore screenNameForAppleIDWithAltDSID:completion:]_block_invoke";
    v22 = 1024;
    v23 = 766;
    v24 = 2112;
    v25 = v13;
    v10 = "%s (%d) \"Lookup for %@ succeeded.\";
    v11 = v7;
    v12 = 28;
  }
  _os_log_impl(&dword_209583000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  v14 = (void *)a1[6];
  if (v14)
  {
    v15 = *(NSObject **)(a1[5] + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__PRPersonaStore_screenNameForAppleIDWithAltDSID_completion___block_invoke_32;
    block[3] = &unk_24C1C1628;
    v19 = v14;
    v17 = v5;
    v18 = v6;
    dispatch_async(v15, block);

  }
}

uint64_t __61__PRPersonaStore_screenNameForAppleIDWithAltDSID_completion___block_invoke_32(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setScreenName:(id)a3 forPrimaryiCloudAccountWithCompletion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, char, void *);
  void *v13;
  PRPersonaStore *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _PRGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[PRPersonaStore setScreenName:forPrimaryiCloudAccountWithCompletion:]";
    v18 = 1024;
    v19 = 791;
    _os_log_impl(&dword_209583000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\", buf, 0x12u);
  }

  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __70__PRPersonaStore_setScreenName_forPrimaryiCloudAccountWithCompletion___block_invoke;
  v13 = &unk_24C1C16F0;
  v14 = self;
  v15 = v5;
  v7 = v5;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](&v10);
  objc_msgSend(MEMORY[0x24BDD1540], "pr_errorWithCode:", -9019, v10, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v9);

}

void __70__PRPersonaStore_setScreenName_forPrimaryiCloudAccountWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _PRGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    v18 = "-[PRPersonaStore setScreenName:forPrimaryiCloudAccountWithCompletion:]_block_invoke";
    v19 = 1024;
    v20 = 795;
    v21 = 2112;
    v22 = v5;
    v8 = "%s (%d) \"Update failed. Error: %@\";
    v9 = v6;
    v10 = 28;
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    v18 = "-[PRPersonaStore setScreenName:forPrimaryiCloudAccountWithCompletion:]_block_invoke";
    v19 = 1024;
    v20 = 797;
    v8 = "%s (%d) \"Update succeeded.\";
    v9 = v6;
    v10 = 18;
  }
  _os_log_impl(&dword_209583000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__PRPersonaStore_setScreenName_forPrimaryiCloudAccountWithCompletion___block_invoke_33;
    block[3] = &unk_24C1C16C8;
    v15 = v11;
    v16 = a2;
    v14 = v5;
    dispatch_async(v12, block);

  }
}

uint64_t __70__PRPersonaStore_setScreenName_forPrimaryiCloudAccountWithCompletion___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)setScreenName:(id)a3 forAppleIDWithAltDSID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  _QWORD v14[4];
  id v15;
  PRPersonaStore *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  _PRGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[PRPersonaStore setScreenName:forAppleIDWithAltDSID:completion:]";
    v20 = 1024;
    v21 = 823;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_209583000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Setting for altDSID: %@\", buf, 0x1Cu);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__PRPersonaStore_setScreenName_forAppleIDWithAltDSID_completion___block_invoke;
  v14[3] = &unk_24C1C1718;
  v16 = self;
  v17 = v8;
  v15 = v7;
  v10 = v8;
  v11 = v7;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0FDB8](v14);
  objc_msgSend(MEMORY[0x24BDD1540], "pr_errorWithCode:", -9019);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v13);

}

void __65__PRPersonaStore_setScreenName_forAppleIDWithAltDSID_completion___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _PRGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_7;
    v8 = a1[4];
    *(_DWORD *)buf = 136315906;
    v20 = "-[PRPersonaStore setScreenName:forAppleIDWithAltDSID:completion:]_block_invoke";
    v21 = 1024;
    v22 = 827;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v5;
    v9 = "%s (%d) \"Setting for %@ failed. Error: %@\";
    v10 = v6;
    v11 = 38;
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    v12 = a1[4];
    *(_DWORD *)buf = 136315650;
    v20 = "-[PRPersonaStore setScreenName:forAppleIDWithAltDSID:completion:]_block_invoke";
    v21 = 1024;
    v22 = 829;
    v23 = 2112;
    v24 = v12;
    v9 = "%s (%d) \"Setting for %@ succeeded.\";
    v10 = v6;
    v11 = 28;
  }
  _os_log_impl(&dword_209583000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  v13 = (void *)a1[6];
  if (v13)
  {
    v14 = *(NSObject **)(a1[5] + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__PRPersonaStore_setScreenName_forAppleIDWithAltDSID_completion___block_invoke_34;
    block[3] = &unk_24C1C16C8;
    v17 = v13;
    v18 = a2;
    v16 = v5;
    dispatch_async(v14, block);

  }
}

uint64_t __65__PRPersonaStore_setScreenName_forAppleIDWithAltDSID_completion___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_startListeningForCacheChangeNotifications
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _PRGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[PRPersonaStore _startListeningForCacheChangeNotifications]";
    v8 = 1024;
    v9 = 854;
    _os_log_impl(&dword_209583000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\", (uint8_t *)&v6, 0x12u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_PRHandleSelfCacheDidChange, CFSTR("PRCachedSelfValuesDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_PRHandleOtherCacheDidChange, CFSTR("PRCachedOtherValuesDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopListeningForCacheChangeNotifications
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _PRGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[PRPersonaStore _stopListeningForCacheChangeNotifications]";
    v8 = 1024;
    v9 = 862;
    _os_log_impl(&dword_209583000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\", (uint8_t *)&v6, 0x12u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("PRCachedSelfValuesDidChangeNotification"), 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, CFSTR("PRCachedOtherValuesDidChangeNotification"), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyHandlingQueue, 0);
  objc_storeStrong((id *)&self->_serviceListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_dataVendingFlagLock, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_personaServiceConnection, 0);
}

@end

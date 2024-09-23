@implementation SCArchivingService

- (void)setObject:(id)a3 atKey:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[SCSharingReminderArchiver sharedInstance](SCSharingReminderArchiver, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:atKey:withCompletion:", v9, v8, v7);

}

- (void)getObjectOfClass:(Class)a3 atKey:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  +[SCSharingReminderArchiver sharedInstance](SCSharingReminderArchiver, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getObjectOfClass:atKey:completion:", a3, v8, v7);

}

- (void)setValue:(id)a3 atKey:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  storeKeyToString(a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SCArchivingService setObject:atKey:completion:](self, "setObject:atKey:completion:", v9, v10, v8);

}

- (void)getValueAtKey:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  storeKeyToString(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__SCArchivingService_getValueAtKey_completion___block_invoke;
  v11[3] = &unk_251662910;
  objc_copyWeak(v14, &location);
  v9 = v7;
  v12 = v9;
  v14[1] = (id)a3;
  v10 = v6;
  v13 = v10;
  -[SCArchivingService getObjectOfClass:atKey:completion:](self, "getObjectOfClass:atKey:completion:", v8, v9, v11);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __47__SCArchivingService_getValueAtKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      SCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_impl(&dword_2454C0000, v8, OS_LOG_TYPE_INFO, "\"Couldn't find value for %@, using and setting default instead\", buf, 0xCu);
      }

      +[SCSharingReminderKVStoreValue defaultForKey:](SCSharingReminderKVStoreValue, "defaultForKey:", *(_QWORD *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 56);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __47__SCArchivingService_getValueAtKey_completion___block_invoke_2;
      v13[3] = &unk_2516628E8;
      v16 = *(id *)(a1 + 40);
      v14 = v10;
      v15 = v6;
      v12 = v10;
      objc_msgSend(WeakRetained, "setValue:atKey:completion:", v12, v11, v13);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

void __47__SCArchivingService_getValueAtKey_completion___block_invoke_2(_QWORD *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    SCLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __47__SCArchivingService_getValueAtKey_completion___block_invoke_2_cold_1(v6);

    v7 = a1[6];
    v8 = a1[4];
    v9 = objc_msgSend(v5, "code");
    v12[0] = a1[5];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCDaemonError errorWithCode:underlyingErrors:](SCDaemonError, "errorWithCode:underlyingErrors:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, v8, v11);

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)getIntAtKey:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__SCArchivingService_getIntAtKey_completion___block_invoke;
  v8[3] = &unk_251662938;
  v9 = v6;
  v7 = v6;
  -[SCArchivingService getValueAtKey:completion:](self, "getValueAtKey:completion:", a3, v8);

}

void __45__SCArchivingService_getIntAtKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "integerValue"), v5);

}

- (void)getBoolAtKey:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__SCArchivingService_getBoolAtKey_completion___block_invoke;
  v8[3] = &unk_251662938;
  v9 = v6;
  v7 = v6;
  -[SCArchivingService getValueAtKey:completion:](self, "getValueAtKey:completion:", a3, v8);

}

void __46__SCArchivingService_getBoolAtKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "BOOLValue"), v5);

}

void __47__SCArchivingService_getValueAtKey_completion___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2454C0000, log, OS_LOG_TYPE_ERROR, "\"Error: couldn't set default value for SCSharingReminderStoreKey\", v1, 2u);
}

@end

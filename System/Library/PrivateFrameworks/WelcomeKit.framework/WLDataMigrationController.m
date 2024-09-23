@implementation WLDataMigrationController

- (WLDataMigrationController)initWithDelegate:(id)a3
{
  id v4;
  WLDataMigrationController *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  v5 = -[WLDaemonConnection init](self, "init");
  if (v5)
  {
    objc_initWeak(&location, v5);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __46__WLDataMigrationController_initWithDelegate___block_invoke;
    v7[3] = &unk_24EFCA8A8;
    objc_copyWeak(&v8, &location);
    -[WLDaemonConnection setInterruptionHandler:](v5, "setInterruptionHandler:", v7);
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __46__WLDataMigrationController_initWithDelegate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 5;
    v5 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 5);

    WeakRetained = v5;
    if (v3)
    {
      v4 = objc_loadWeakRetained(v2);
      objc_msgSend(v4, "dataMigratorDidGetInterrupted");

      WeakRetained = v5;
    }
  }

}

- (void)startMigrationUsingRetryPolicies:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  _QWORD v14[5];
  _QWORD v15[5];

  v4 = a3;
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__WLDataMigrationController_startMigrationUsingRetryPolicies___block_invoke;
  v15[3] = &unk_24EFCA8D0;
  v15[4] = self;
  -[WLDaemonConnection daemonWithErrorHandler:](self, "daemonWithErrorHandler:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog(v3, 1, CFSTR("%@: startMigration will call daemon"), v8, v9, v10, v11, v12, (uint64_t)self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __62__WLDataMigrationController_startMigrationUsingRetryPolicies___block_invoke_2;
  v14[3] = &unk_24EFCA8F8;
  v14[4] = self;
  objc_msgSend(v7, "startMigrationUsingRetryPolicies:delegate:useMigrationKit:replyBlock:", v4, WeakRetained, 0, v14);

}

void __62__WLDataMigrationController_startMigrationUsingRetryPolicies___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id WeakRetained;

  v4 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  _WLLog(v2, 0, CFSTR("%@: XPC Error when starting migration - %@"), v5, v6, v7, v8, v9, v4);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "dataMigrator:didFailWithError:", 0, v10);

}

void __62__WLDataMigrationController_startMigrationUsingRetryPolicies___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id WeakRetained;
  id v20;

  v20 = a2;
  v6 = a3;
  _WLLog(v3, 1, CFSTR("%@: startMigration did call daemon with migrator %@ error %@"), v7, v8, v9, v10, v11, *(_QWORD *)(a1 + 32));
  v17 = *(_QWORD *)(a1 + 32);
  if (v20)
  {
    v18 = v20;
    WeakRetained = *(id *)(v17 + 32);
    *(_QWORD *)(v17 + 32) = v18;
  }
  else
  {
    _WLLog(v3, 0, CFSTR("%@: Failed to start migration (nil migrator in reply) - %@"), v12, v13, v14, v15, v16, v17);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(WeakRetained, "dataMigrator:didFailWithError:", 0, v6);
  }

}

- (void)deleteMessages
{
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__WLDataMigrationController_deleteMessages__block_invoke;
  v3[3] = &unk_24EFCA8D0;
  v3[4] = self;
  -[WLDaemonConnection daemonWithErrorHandler:](self, "daemonWithErrorHandler:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteMessages");

}

void __43__WLDataMigrationController_deleteMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id WeakRetained;

  v4 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  _WLLog(v2, 0, CFSTR("%@: XPC Error when starting migration - %@"), v5, v6, v7, v8, v9, v4);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "dataMigrator:didFailWithError:", 0, v10);

}

- (void)lookupAppDataContainer:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__WLDataMigrationController_lookupAppDataContainer___block_invoke;
  v6[3] = &unk_24EFCA8D0;
  v6[4] = self;
  v4 = a3;
  -[WLDaemonConnection daemonWithErrorHandler:](self, "daemonWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lookupAppDataContainer:", v4);

}

void __52__WLDataMigrationController_lookupAppDataContainer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id WeakRetained;

  v4 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  _WLLog(v2, 0, CFSTR("%@: XPC Error when starting migration - %@"), v5, v6, v7, v8, v9, v4);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "dataMigrator:didFailWithError:", 0, v10);

}

- (WLDataMigrationDelegate)delegate
{
  return (WLDataMigrationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_migrator, 0);
}

@end

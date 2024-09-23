@implementation WLMigrationKitController

- (void)run:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v4 = a3;
  -[WLMigrationKitController setDelegate:](self, "setDelegate:", v4);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __32__WLMigrationKitController_run___block_invoke;
  v9 = &unk_24EFCA8A8;
  objc_copyWeak(&v10, &location);
  -[WLDaemonConnection setInterruptionHandler:](self, "setInterruptionHandler:", &v6);
  -[WLDaemonConnection daemonWithErrorHandler:](self, "daemonWithErrorHandler:", &__block_literal_global_1, v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startMigrationUsingRetryPolicies:delegate:useMigrationKit:replyBlock:", 0, v4, 1, &__block_literal_global_4);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __32__WLMigrationKitController_run___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "daemonDidGetInterrupted");

}

void __32__WLMigrationKitController_run___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  _WLLog(v8, 0, CFSTR("WLMigrationKitController could not start MigrationKit because NSXPC error occurred. error=%@"), a4, a5, a6, a7, a8, a2);
}

void __32__WLMigrationKitController_run___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  _WLLog(v9, 2, CFSTR("WLMigrationKitController successfully started MigrationKit."), a4, a5, a6, a7, a8, a9);
}

- (void)cancel
{
  id v2;

  -[WLDaemonConnection daemonWithErrorHandler:](self, "daemonWithErrorHandler:", &__block_literal_global_7);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

void __34__WLMigrationKitController_cancel__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  _WLLog(v8, 0, CFSTR("WLMigrationKitController could not start MigrationKit because NSXPC error occurred. error=%@"), a4, a5, a6, a7, a8, a2);
}

- (void)daemonDidGetInterrupted
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dataMigratorDidGetInterrupted");

}

- (WLDataMigrationDelegate)delegate
{
  return (WLDataMigrationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

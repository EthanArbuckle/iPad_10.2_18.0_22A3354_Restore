@implementation WLDataMigrationControllerSurrogate

- (WLDataMigrationControllerSurrogate)initWithDelegate:(id)a3 forceDownloadError:(BOOL)a4
{
  WLDataMigrationControllerSurrogate *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WLDataMigrationControllerSurrogate;
  result = -[WLDataMigrationController initWithDelegate:](&v6, sel_initWithDelegate_, a3);
  if (result)
    result->_forceDownloadError = a4;
  return result;
}

- (WLDataMigrationControllerSurrogate)initWithDelegate:(id)a3
{
  return -[WLDataMigrationControllerSurrogate initWithDelegate:forceDownloadError:](self, "initWithDelegate:forceDownloadError:", a3, 0);
}

- (void)startMigrationUsingRetryPolicies:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  BOOL v7;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(33, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__WLDataMigrationControllerSurrogate_startMigrationUsingRetryPolicies___block_invoke;
  block[3] = &unk_24EFCAA20;
  objc_copyWeak(&v6, &location);
  v7 = a3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __71__WLDataMigrationControllerSurrogate_startMigrationUsingRetryPolicies___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startMigrationUsingRetryPolicies:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_startMigrationUsingRetryPolicies:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  float v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    -[WLDataMigrationController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataMigrator:didUpdateMigrationState:", 0, 1);

    sleep(1u);
    -[WLDataMigrationController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataMigrator:didUpdateMigrationState:", 0, 2);

    sleep(2u);
  }
  v6 = 0;
  v7 = 0.0;
  v8 = 0.0;
  do
  {
    if (v7 == 0.0)
    {
      -[WLDataMigrationController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataMigrator:didUpdateMigrationState:", 0, 3);

    }
    -[WLDataMigrationController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v11 = v7;
    objc_msgSend(v10, "dataMigrator:didUpdateProgressPercentage:", 0, v11);

    if (v8 < 0.8)
    {
      -[WLDataMigrationController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dataMigrator:didUpdateRemainingDownloadTime:", 0, (double)pow(20.0, (0.8 - v8) * 10.0 * 0.5 / 0.8));

    }
    if (!(v6 & 1 | (v8 < 0.8)))
    {
      -[WLDataMigrationController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dataMigrator:didUpdateMigrationState:", 0, 4);

      -[WLDataMigrationController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dataMigratorDidBecomeRestartable:", 0);

      v6 = 1;
    }
    sleep(1u);
    if (v7 < 0.25 && v8 > 0.15 && self->_forceDownloadError)
      goto LABEL_15;
    v7 = v8 + 0.1;
    v8 = v7;
  }
  while (v7 < 1.0);
  if (self->_forceDownloadError)
  {
LABEL_15:
    v15 = (void *)MEMORY[0x24BDD1540];
    v22 = CFSTR("com.apple.welcomekit.error.offerRetry");
    v23[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.welcomekit"), 2, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[WLDataMigrationController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dataMigrator:didFailWithError:", 0, v17);

    return;
  }
  -[WLDataMigrationController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 1.0;
  objc_msgSend(v19, "dataMigrator:didUpdateProgressPercentage:", 0, v20);

  -[WLDataMigrationController delegate](self, "delegate");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dataMigratorDidFinish:withImportErrors:context:", 0, 0, 0);

}

@end

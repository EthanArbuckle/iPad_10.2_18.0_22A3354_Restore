@implementation VSWLKAppInstallationOperation

- (void)setInstallable:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_installable, a3);
  objc_msgSend(v9, "appAdamIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [[installable appAdamIDs] firstObject] parameter must not be nil."));
  objc_msgSend(v9, "appAdamIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSWLKAppInstallationOperation setAppAdamID:](self, "setAppAdamID:", v8);
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BEC1E98], "defaultAppInstaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSWLKAppInstallationOperation installable](self, "installable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__VSWLKAppInstallationOperation_executionDidBegin__block_invoke;
  v8[3] = &unk_24FE1AE70;
  objc_copyWeak(&v9, &location);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __50__VSWLKAppInstallationOperation_executionDidBegin__block_invoke_12;
  v6[3] = &unk_24FE199F8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "installAppForInstallable:progressHandler:completion:", v4, v8, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__VSWLKAppInstallationOperation_executionDidBegin__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  uint8_t buf[4];
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = a2;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "VSWLKAppInstallationOperation - Install Progress %f", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "appAdamID", CFSTR("VSWLKAppInstallationOperationNotificationUserInfoAppAdamIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("VSWLKAppInstallationOperationNotificationUserInfoInstallProgressKey");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("VSWLKAppInstallationOperationProgressDidChange"), 0, v8);

}

void __50__VSWLKAppInstallationOperation_executionDidBegin__block_invoke_12(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)MEMORY[0x24BDF8C38];
  v5 = (void *)MEMORY[0x24BDF8BF0];
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "optionalWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setResult:", v7);
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BEDCDF0]);
    objc_msgSend(v5, "failableWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "optionalWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setResult:", v8);

  }
  objc_msgSend(WeakRetained, "finishExecutionIfPossible");

}

- (WLKInstallable)installable
{
  return self->_installable;
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSString)appAdamID
{
  return self->_appAdamID;
}

- (void)setAppAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_appAdamID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_installable, 0);
}

@end

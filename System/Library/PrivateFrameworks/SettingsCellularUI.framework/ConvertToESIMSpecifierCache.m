@implementation ConvertToESIMSpecifierCache

- (ConvertToESIMSpecifierCache)initWithDelegate:(id)a3 isViewControllerPopNeeded:(BOOL)a4 odcFlow:(id)a5 delegate:(id)a6 iccid:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  ConvertToESIMSpecifierCache *v17;
  ConvertToESIMSpecifierCache *v18;
  objc_super v20;
  uint8_t buf[16];

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[ConvertToESIMSpecifierCache getLogger](self, "getLogger");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v16, OS_LOG_TYPE_DEFAULT, "in initWithSpecifer for ConvertToESIMSpecifierCache\n", buf, 2u);
  }

  v20.receiver = self;
  v20.super_class = (Class)ConvertToESIMSpecifierCache;
  v17 = -[ConvertToESIMSpecifierCache init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_navigationController, v12);
    objc_storeStrong((id *)&v18->_flow, a5);
    v18->_isViewControllerPopNeeded = a4;
    objc_storeStrong((id *)&v18->_iccid, a7);
    objc_storeStrong((id *)&v18->_delegate, a6);
    -[TSSIMSetupFlow setDelegate:](v18->_flow, "setDelegate:", v18);
  }

  return v18;
}

- (void)dealloc
{
  NSObject *v3;
  TSSIMSetupFlow *flow;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  TSSIMSetupFlow *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[ConvertToESIMSpecifierCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    flow = self->_flow;
    *(_DWORD *)buf = 138412290;
    v8 = flow;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "ODC complete releasing SS flow: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)ConvertToESIMSpecifierCache;
  -[ConvertToESIMSpecifierCache dealloc](&v6, sel_dealloc);
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  NSObject *v5;
  _QWORD block[5];
  id v7[2];
  _BYTE buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[ConvertToESIMSpecifierCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = a3;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "ConvertToESIMSpecifierCache simSetupFlowCompleted with completionType:%ld", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__ConvertToESIMSpecifierCache_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_24D5019D0;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = (id)a3;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __53__ConvertToESIMSpecifierCache_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  __int16 v10[8];
  uint8_t v11[16];
  uint8_t buf[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(WeakRetained + 4);
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    v5 = *(_QWORD *)(a1 + 48);
    if (v5 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "getLogger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "ConvertToESIMSpecifierCache The odc flow was canceled", buf, 2u);
      }

      objc_msgSend(v3[2], "odcCanceled:", v3[5]);
      v5 = *(_QWORD *)(a1 + 48);
    }
    if (v5 == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "getLogger");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "ConvertToESIMSpecifierCache The odc flow failed", v11, 2u);
      }

      objc_msgSend(v3[2], "odcFailed:", v3[5]);
      v5 = *(_QWORD *)(a1 + 48);
    }
    if (v5 == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "getLogger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 0;
        _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "ConvertToESIMSpecifierCache The odc flow succeeded", (uint8_t *)v10, 2u);
      }

      objc_msgSend(v3[2], "odcSuccess:isViewControllerPopNeeded:", v3[5], *((unsigned __int8 *)v3 + 8));
    }
    v9 = v3[3];
    v3[3] = 0;

    objc_storeWeak(v3 + 4, 0);
    *((_BYTE *)v3 + 8) = 0;
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("odc.cache"));
}

- (PSUILocalConvertModelDelegate)delegate
{
  return (PSUILocalConvertModelDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (BOOL)isViewControllerPopNeeded
{
  return self->_isViewControllerPopNeeded;
}

- (void)setIsViewControllerPopNeeded:(BOOL)a3
{
  self->_isViewControllerPopNeeded = a3;
}

- (NSString)iccid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIccid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end

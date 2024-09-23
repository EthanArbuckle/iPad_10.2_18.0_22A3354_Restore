@implementation WBSHistoryServiceDatabaseDelegateWeakProxy

- (WBSHistoryServiceDatabaseDelegateWeakProxy)initWithDelegate:(id)a3
{
  id v4;
  WBSHistoryServiceDatabaseDelegateWeakProxy *v5;
  WBSHistoryServiceDatabaseDelegateWeakProxy *v6;
  WBSHistoryServiceDatabaseDelegateWeakProxy *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSHistoryServiceDatabaseDelegateWeakProxy;
  v5 = -[WBSHistoryServiceDatabaseDelegateWeakProxy init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (WBSHistoryServiceDatabaseDelegateWeakProxy)init
{

  return 0;
}

- (void)reportPermanentIDsForItems:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "reportPermanentIDsForItems:completionHandler:", v9, v6);
  else
    v6[2](v6, 0);

}

- (void)reportPermanentIDsForVisits:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "reportPermanentIDsForVisits:completionHandler:", v9, v6);
  else
    v6[2](v6, 0);

}

- (void)reportSevereError:(id)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "reportSevereError:completionHandler:", v9, v6);
  else
    v6[2](v6);

}

- (void)handleEvent:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "handleEvent:completionHandler:", v10, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 14, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v9);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

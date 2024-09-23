@implementation GetAccountsIntentHandler

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002174;
  block[3] = &unk_10000C3A0;
  block[4] = a1;
  if (qword_100012308 != -1)
    dispatch_once(&qword_100012308, block);
  return (OS_os_log *)(id)qword_100012300;
}

- (void)provideAccountsOptionsCollectionForMFGetAccounts:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GetAccountsIntentHandler scheduler](GetAccountsIntentHandler, "scheduler"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000022A8;
  v8[3] = &unk_10000C408;
  v8[4] = self;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)handleMFGetAccounts:(id)a3 completion:(id)a4
{
  void (**v5)(id, MFGetAccountsIntentResponse *);
  MFGetAccountsIntentResponse *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, MFGetAccountsIntentResponse *))a4;
  v6 = -[MFGetAccountsIntentResponse initWithCode:userActivity:]([MFGetAccountsIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accounts"));
  -[MFGetAccountsIntentResponse setAccounts:](v6, "setAccounts:", v7);

  v5[2](v5, v6);
}

+ (EFScheduler)scheduler
{
  if (qword_100012318 != -1)
    dispatch_once(&qword_100012318, &stru_10000C448);
  return (EFScheduler *)(id)qword_100012310;
}

- (EMDaemonInterface)daemonInterface
{
  EMDaemonInterface *daemonInterface;
  EMDaemonInterface *v4;
  EMDaemonInterface *v5;

  daemonInterface = self->_daemonInterface;
  if (!daemonInterface)
  {
    v4 = (EMDaemonInterface *)objc_alloc_init((Class)EMDaemonInterface);
    v5 = self->_daemonInterface;
    self->_daemonInterface = v4;

    daemonInterface = self->_daemonInterface;
  }
  return daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonInterface, 0);
}

@end

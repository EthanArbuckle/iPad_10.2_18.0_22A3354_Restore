@implementation _NFControllerManager

- (void)log:(unsigned __int8)a3 msg:(id)a4
{
  id v4;
  void (*Logger)(uint64_t, const char *, ...);
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;

  v4 = a4;
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(0);
  if (Logger)
    Logger(5, "%s:%i %s", "-[_NFControllerManager log:msg:]", 66, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v6 = NFSharedLogGetLogger(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v9 = "-[_NFControllerManager log:msg:]";
    v10 = 1024;
    v11 = 66;
    v12 = 2080;
    v13 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s", buf, 0x1Cu);
  }

}

- (void)notifyTransactionEvent:(id)a3
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD block[4];
  id v9;
  _NFControllerManager *v10;
  SEL v11;

  v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CDC10;
  block[3] = &unk_1002E5C80;
  v9 = v5;
  v10 = self;
  v11 = a2;
  v7 = v5;
  dispatch_async(workQueue, block);

}

- (_NFControllerManager)initWithQueue:(id)a3 driverWrapper:(id)a4
{
  id v7;
  id v8;
  _NFControllerManager *v9;
  _NFControllerManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_NFControllerManager;
  v9 = -[_NFControllerManager init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_driverWrapper, a4);
    +[AppletTranslator initLibraryWithDelegate:](AppletTranslator, "initLibraryWithDelegate:", v10);
  }

  return v10;
}

- (void)initSETransactionsStates
{
  NFDriverWrapper *driverWrapper;

  driverWrapper = self->_driverWrapper;
  if (driverWrapper)
    driverWrapper->_seDelegate = (NFDriverWrapperTransactionDelegate *)self;
}

- (BOOL)isUnifiedAccess:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269CF6, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NF_asHexString"));

  v6 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269CFD, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_asHexString"));

  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269D04, 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_asHexString"));

  if ((objc_msgSend(v3, "hasPrefix:", v5) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", v7) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v10 = objc_msgSend(v3, "hasPrefix:", v9);
  }

  return v10;
}

- (void)decodeSecureElementTransaction:(id)a3 event:(id)a4
{
  id v7;
  id v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  workQueue = self->_workQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D0BB0;
  v12[3] = &unk_1002E5CD0;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(workQueue, v12);

}

- (void)driverRSSIStatsWithTotalSamples:(unsigned int)a3 avgRSSI:(unsigned int)a4 maxRSSI:(unsigned int)a5 minRSSI:(unsigned int)a6
{
  NSObject *workQueue;
  _QWORD block[5];
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D38FC;
  block[3] = &unk_1002E7DD8;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  dispatch_async(workQueue, block);
}

- (NFCControllerDelegate)delegate
{
  return (NFCControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end

@implementation GKIDSConnectionManager

+ (id)sharedManager
{
  if (qword_100317F08 != -1)
    dispatch_once(&qword_100317F08, &stru_1002C1968);
  return (id)qword_100317F10;
}

- (GKIDSConnectionManager)init
{
  GKIDSConnectionManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *idsDelegateQueue;
  IDSAccountController *v5;
  IDSAccountController *gcArcadeAccountController;
  IDSAccountController *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKIDSConnectionManager;
  v2 = -[GKIDSConnectionManager init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.gamed.idsConnectionManager.idsDelegateQueue", 0);
    idsDelegateQueue = v2->_idsDelegateQueue;
    v2->_idsDelegateQueue = (OS_dispatch_queue *)v3;

    v5 = (IDSAccountController *)objc_msgSend(objc_alloc((Class)IDSAccountController), "initWithService:", CFSTR("com.apple.private.alloy.arcade"));
    gcArcadeAccountController = v2->_gcArcadeAccountController;
    v2->_gcArcadeAccountController = v5;

    v7 = v2->_gcArcadeAccountController;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnectionManager idsDelegateQueue](v2, "idsDelegateQueue"));
    -[IDSAccountController addDelegate:queue:](v7, "addDelegate:queue:", v2, v8);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[IDSAccountController removeDelegate:](self->_gcArcadeAccountController, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)GKIDSConnectionManager;
  -[GKIDSConnectionManager dealloc](&v3, "dealloc");
}

- (BOOL)isReady
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnectionManager gcArcadeAccountController](self, "gcArcadeAccountController"));
  v3 = objc_msgSend(v2, "_gkIsReadyForService:", CFSTR("com.apple.private.alloy.arcade"));

  return v3;
}

- (void)fetchIDSDataForHandles:(id)a3 service:(id)a4 infoTypes:(unint64_t)a5 performingBlockPerBatch:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  GKIDSConnectionManager *v20;
  id v21;
  unint64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_claimAutoreleasedReturnValue(-[GKIDSConnectionManager idsDelegateQueue](self, "idsDelegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C950C;
  block[3] = &unk_1002BE6A0;
  v18 = v10;
  v19 = v11;
  v21 = v12;
  v22 = a5;
  v20 = self;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[GKIDSConnectionManager idsDelegateQueue](self, "idsDelegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C96A0;
  block[3] = &unk_1002BB658;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceName"));
    v14 = 138412290;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Account added: %@", (uint8_t *)&v14, 0xCu);

  }
  if (-[GKIDSConnectionManager isReady](self, "isReady"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnectionManager delegate](self, "delegate"));
    objc_msgSend(v13, "connectionManagerReady:", self);

  }
}

- (GKIDSConnectionManagerDelegate)delegate
{
  return (GKIDSConnectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)idsDelegateQueue
{
  return self->_idsDelegateQueue;
}

- (void)setIdsDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_idsDelegateQueue, a3);
}

- (IDSAccountController)gcArcadeAccountController
{
  return self->_gcArcadeAccountController;
}

- (void)setGcArcadeAccountController:(id)a3
{
  objc_storeStrong((id *)&self->_gcArcadeAccountController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gcArcadeAccountController, 0);
  objc_storeStrong((id *)&self->_idsDelegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

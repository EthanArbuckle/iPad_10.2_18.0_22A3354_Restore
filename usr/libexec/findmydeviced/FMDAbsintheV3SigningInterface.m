@implementation FMDAbsintheV3SigningInterface

+ (id)sharedInterface
{
  if (qword_1003063C8 != -1)
    dispatch_once(&qword_1003063C8, &stru_1002C1480);
  return (id)qword_1003063C0;
}

- (FMDAbsintheV3SigningInterface)init
{
  FMDAbsintheV3SigningInterface *v2;
  id v3;
  void *v4;
  FMDDirectServerChannel *v5;
  FMDCadmiumServerChannel *v6;
  void *v7;
  FMDServerInteractionController *v8;
  id v9;
  void *v10;
  objc_super v12;
  _QWORD v13[2];

  v12.receiver = self;
  v12.super_class = (Class)FMDAbsintheV3SigningInterface;
  v2 = -[FMDAbsintheV3SigningInterface init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSOperationQueue);
    -[FMDAbsintheV3SigningInterface setOperationQueue:](v2, "setOperationQueue:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAbsintheV3SigningInterface operationQueue](v2, "operationQueue"));
    objc_msgSend(v4, "setMaxConcurrentOperationCount:", 1);

    v5 = objc_alloc_init(FMDDirectServerChannel);
    v13[0] = v5;
    v6 = objc_alloc_init(FMDCadmiumServerChannel);
    v13[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));

    v8 = -[FMDServerInteractionController initWithChannels:delegate:]([FMDServerInteractionController alloc], "initWithChannels:delegate:", v7, v2);
    -[FMDAbsintheV3SigningInterface setServerInteractionController:](v2, "setServerInteractionController:", v8);

    v9 = objc_alloc_init((Class)FMStateCapture);
    -[FMDAbsintheV3SigningInterface setStateCapture:](v2, "setStateCapture:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAbsintheV3SigningInterface stateCapture](v2, "stateCapture"));
    objc_msgSend(v10, "setStateCaptureBlock:", &stru_1002C14C0);

  }
  return v2;
}

- (id)signatureForData:(id)a3 requestUUID:(id)a4 mode:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10000EF38;
  v29 = sub_10000EF48;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10000EF38;
  v23 = sub_10000EF48;
  v24 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000EF50;
  v15[3] = &unk_1002C14E8;
  v17 = &v25;
  v18 = &v19;
  v12 = objc_msgSend(objc_alloc((Class)FMSynchronizer), "initWithDescription:andTimeout:", CFSTR("absintheSynchronizer"), -1.0);
  v16 = v12;
  -[FMDAbsintheV3SigningInterface signatureForData:requestUUID:mode:cause:completion:](self, "signatureForData:requestUUID:mode:cause:completion:", v10, v11, a5, 0, v15);
  objc_msgSend(v12, "wait");
  if (a6)
    *a6 = objc_retainAutorelease((id)v20[5]);
  v13 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

- (void)signatureForData:(id)a3 requestUUID:(id)a4 mode:(unint64_t)a5 cause:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  FMDAbsintheV3SigningInterface *v25;
  id v26;
  id v27;
  unint64_t v28;

  v12 = a3;
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_10000F108;
  v22 = &unk_1002C1510;
  v23 = a4;
  v24 = a6;
  v25 = self;
  v26 = v12;
  v27 = a7;
  v28 = a5;
  v13 = v27;
  v14 = v12;
  v15 = v24;
  v16 = v23;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v19));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAbsintheV3SigningInterface operationQueue](self, "operationQueue", v19, v20, v21, v22));
  objc_msgSend(v18, "addOperation:", v17);

}

- (id)inFieldCollectionReceipt:(id *)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;

  v10 = 0;
  v4 = MAECopyPCRTToken(&v10, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v10;
  if (v6)
  {

    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_1002259FC((uint64_t)v6, v8);

    v5 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }

  return v5;
}

- (void)didReceiveAuthFailureForRequest:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Auth failure received in identityV3Session.", v5, 2u);
  }

}

- (void)didReceiveServerAlertForRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alertFromServerResponse"));

  if (v4)
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100225A70(v3, v6);

  }
}

- (id)accountForServerInteractionController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "account"));

  return v4;
}

+ (id)pscSUIURL
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;

  v2 = container_system_group_path_for_identifier(0, "systemgroup.com.apple.pisco.suinfo", 0);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = sub_1000031B8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "System group container path is %s", (uint8_t *)&v9, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v3, 1, 0));
    free(v3);
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/ProvenanceV2/psc.sui"), 0));

  return v7;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (FMDServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_serverInteractionController, a3);
}

- (FMStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
  objc_storeStrong((id *)&self->_stateCapture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_serverInteractionController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end

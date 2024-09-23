@implementation SKEraseOperation

- (SKEraseOperation)initWithEraser:(id)a3 withCompletionBlock:(id)a4
{
  id v7;
  id v8;
  SKEraseOperation *v9;
  SKEraseOperation *v10;
  id v11;
  id callbackBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SKEraseOperation;
  v9 = -[SKManagerOperation init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eraser, a3);
    v11 = objc_msgSend(v8, "copy");
    callbackBlock = v10->_callbackBlock;
    v10->_callbackBlock = v11;

  }
  return v10;
}

- (BOOL)run
{
  SKEraserProtocol *eraser;
  SKStateMachine *v4;
  SKStateMachine *fsm;
  void ***v6;
  id eraseBlock;
  void *v8;
  BOOL v9;
  NSError *v10;
  NSError *operationError;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  id v18;
  id location;
  id obj;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  eraser = self->_eraser;
  if (eraser)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_1000173E4;
    v25 = sub_1000173F4;
    v26 = 0;
    obj = 0;
    v4 = (SKStateMachine *)objc_claimAutoreleasedReturnValue(-[SKEraserProtocol createStateMachineWithError:](eraser, "createStateMachineWithError:", &obj));
    objc_storeStrong(&v26, obj);
    fsm = self->_fsm;
    self->_fsm = v4;

    if (self->_fsm)
    {
      objc_initWeak(&location, self);
      v13 = _NSConcreteStackBlock;
      v14 = 3221225472;
      v15 = sub_1000173FC;
      v16 = &unk_1000452C8;
      objc_copyWeak(&v18, &location);
      v17 = &v21;
      v6 = objc_retainBlock(&v13);
      eraseBlock = self->eraseBlock;
      self->eraseBlock = v6;

      objc_storeWeak(&self->weakEraseBlock, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager", v13, v14, v15, v16));
      objc_msgSend(v8, "syncAllDisksWithCompletionBlock:", self->eraseBlock);

      v9 = self->_operationError == 0;
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_storeStrong((id *)&self->_operationError, (id)v22[5]);
      -[SKEraseOperation finished](self, "finished");
      v9 = 0;
    }
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    v10 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    operationError = self->_operationError;
    self->_operationError = v10;

    -[SKEraseOperation finished](self, "finished");
    return 0;
  }
  return v9;
}

- (float)progress
{
  return self->_lastProgress;
}

- (BOOL)done
{
  return self->_hasFinished;
}

- (id)error
{
  return self->_operationError;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Erase disk operation, with eraser: %@"), self->_eraser);
}

- (void)finished
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  SKDisk *v7;
  SKDisk *resultingDisk;
  NSError *v9;
  NSError *operationError;
  id v11;
  NSObject *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;

  self->_hasFinished = 1;
  v3 = sub_10000BA9C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self->_resultingDisk, "mountPoint"));
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Erase Complete, Mount Point: %@", buf, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v7 = (SKDisk *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_recacheSyncDisk:", self->_resultingDisk));
  resultingDisk = self->_resultingDisk;
  self->_resultingDisk = v7;

  v9 = (NSError *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation validateWithRecachedDisk:error:](self, "validateWithRecachedDisk:error:", self->_resultingDisk, self->_operationError));
  operationError = self->_operationError;
  self->_operationError = v9;

  v11 = sub_10000BA9C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self->_resultingDisk, "mountPoint"));
    *(_DWORD *)buf = 138412290;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Recache Complete, Mount Point: %@", buf, 0xCu);

  }
  (*((void (**)(void))self->_callbackBlock + 2))();
  v14.receiver = self;
  v14.super_class = (Class)SKEraseOperation;
  -[SKManagerOperation finished](&v14, "finished");
}

- (id)resultingDisk
{
  return self->_resultingDisk;
}

- (NSString)passwordHandle
{
  return self->_passwordHandle;
}

- (void)setPasswordHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSMutableArray)physicalStoresToErase
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPhysicalStoresToErase:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (int64_t)physicalStoreErasing
{
  return self->_physicalStoreErasing;
}

- (void)setPhysicalStoreErasing:(int64_t)a3
{
  self->_physicalStoreErasing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalStoresToErase, 0);
  objc_storeStrong((id *)&self->_passwordHandle, 0);
  objc_destroyWeak(&self->weakEraseBlock);
  objc_storeStrong(&self->eraseBlock, 0);
  objc_storeStrong((id *)&self->_fsm, 0);
  objc_storeStrong((id *)&self->_eraser, 0);
  objc_storeStrong(&self->_callbackBlock, 0);
  objc_storeStrong((id *)&self->_resultingDisk, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
}

@end

@implementation KTForceSyncKVSOperation

- (KTForceSyncKVSOperation)initWithDependencies:(id)a3 timeout:(unint64_t)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11;
  id v12;
  id v13;
  KTForceSyncKVSOperation *v14;
  KTForceSyncKVSOperation *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)KTForceSyncKVSOperation;
  v14 = -[KTGroupOperation init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_deps, a3);
    v15->_timeout = a4;
    objc_storeStrong((id *)&v15->_intendedState, a5);
    objc_storeStrong((id *)&v15->_nextState, a6);
  }

  return v15;
}

- (void)groupStart
{
  id v3;
  NSObject *v4;
  KTResultOperation *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[8];

  v3 = objc_alloc_init((Class)NSOperation);
  -[KTForceSyncKVSOperation setFinishedOp:](self, "setFinishedOp:", v3);

  if (qword_1002A7480 != -1)
    dispatch_once(&qword_1002A7480, &stru_100245968);
  v4 = qword_1002A7488;
  if (os_log_type_enabled((os_log_t)qword_1002A7488, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "ForceSyncKVS start", buf, 2u);
  }
  v5 = objc_alloc_init(KTResultOperation);
  v6 = -[KTResultOperation timeout:](v5, "timeout:", -[KTForceSyncKVSOperation timeout](self, "timeout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTForceSyncKVSOperation finishedOp](self, "finishedOp"));
  -[KTResultOperation addDependency:](v5, "addDependency:", v7);

  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v8, "addOperation:", v5);

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTForceSyncKVSOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "kvs"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10010BF64;
  v11[3] = &unk_1002459D0;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v10, "forceSync:", v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 120, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end

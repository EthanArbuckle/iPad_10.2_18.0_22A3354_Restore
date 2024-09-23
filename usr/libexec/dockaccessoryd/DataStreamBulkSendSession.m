@implementation DataStreamBulkSendSession

- (DataStreamBulkSendSession)initWithProtocol:(id)a3 sessionIdentifier:(id)a4 queue:(id)a5 logIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DataStreamBulkSendSession *v14;
  DataStreamBulkSendSession *v15;
  uint64_t v16;
  NSMutableArray *pendingReads;
  uint64_t v18;
  NSString *logIdentifier;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)DataStreamBulkSendSession;
  v14 = -[DataStreamBulkSendSession init](&v21, "init");
  v15 = v14;
  if (v14)
  {
    *(_WORD *)&v14->_isClosed = 0;
    objc_storeWeak((id *)&v14->_bulkSendProtocol, v10);
    objc_storeStrong((id *)&v15->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v15->_queue, a5);
    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingReads = v15->_pendingReads;
    v15->_pendingReads = (NSMutableArray *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v13, v11));
    logIdentifier = v15->_logIdentifier;
    v15->_logIdentifier = (NSString *)v18;

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (!self->_isClosed)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession bulkSendProtocol](self, "bulkSendProtocol"));
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession sessionIdentifier](self, "sessionIdentifier"));
      objc_msgSend(v3, "asyncBulkSendSessionDidCancelSessionWithIdentifier:reason:hadReceivedEof:completion:", v4, 5, self->_hasReceivedEof, &stru_100236D98);

    }
  }
  v5.receiver = self;
  v5.super_class = (Class)DataStreamBulkSendSession;
  -[DataStreamBulkSendSession dealloc](&v5, "dealloc");
}

- (BOOL)isActive
{
  void *v4;
  void *v5;

  if (self->_isClosed)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession pendingReads](self, "pendingReads"));
  if (objc_msgSend(v4, "count"))
  {

    return 1;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession pendingError](self, "pendingError"));

  if (v5)
    return 1;
  return !self->_hasReceivedEof;
}

- (void)cancelWithReason:(unsigned __int16)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  DataStreamBulkSendSession *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v4 = a3;
  v6 = a4;
  -[DataStreamBulkSendSession _closeSession](self, "_closeSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession bulkSendProtocol](self, "bulkSendProtocol"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession sessionIdentifier](self, "sessionIdentifier"));
    objc_msgSend(v7, "asyncBulkSendSessionDidCancelSessionWithIdentifier:reason:hadReceivedEof:completion:", v8, v4, self->_hasReceivedEof, v6);

  }
  else
  {
    v9 = self;
    v11 = sub_10007CCE4((uint64_t)v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = sub_10007CD2C(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v16 = 138543362;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@No Bulk send protocol found", (uint8_t *)&v16, 0xCu);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 1, 0));
    (*((void (**)(id, void *))v6 + 2))(v6, v15);

  }
}

- (void)read:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (self->_isClosed)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100029FA8;
    block[3] = &unk_100236DC0;
    v9 = v4;
    dispatch_async(v6, block);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession activeReadHandler](self, "activeReadHandler"));

    if (v7)
    {
      -[DataStreamBulkSendSession cancelWithReason:completion:](self, "cancelWithReason:completion:", 5, &stru_100236DE0);
    }
    else
    {
      -[DataStreamBulkSendSession setActiveReadHandler:](self, "setActiveReadHandler:", v4);
      -[DataStreamBulkSendSession _pumpReadDataIfPossible](self, "_pumpReadDataIfPossible");
    }
  }

}

- (void)asyncHandleIncomingPackets:(id)a3 isEof:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A060;
  block[3] = &unk_100236BE0;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)asyncHandleRemoteCloseWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A204;
  v7[3] = &unk_100236AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_closeSession
{
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  if (!self->_isClosed)
  {
    self->_isClosed = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession activeReadHandler](self, "activeReadHandler"));
    -[DataStreamBulkSendSession setActiveReadHandler:](self, "setActiveReadHandler:", 0);
    if (v3)
    {
      v4 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002A3AC;
      block[3] = &unk_100236DC0;
      v6 = v3;
      dispatch_async(v4, block);

    }
  }
}

- (void)_pumpReadDataIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession activeReadHandler](self, "activeReadHandler"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession pendingReads](self, "pendingReads"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_maybeDequeue"));

    if (!v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession pendingError](self, "pendingError"));
      -[DataStreamBulkSendSession setPendingError:](self, "setPendingError:", 0);
      if (v6)
        goto LABEL_5;
      if (!self->_hasReceivedEof)
        goto LABEL_6;
    }
    v6 = 0;
LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession activeReadHandler](self, "activeReadHandler"));
    -[DataStreamBulkSendSession setActiveReadHandler:](self, "setActiveReadHandler:", 0);
    v8 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendSession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002A500;
    block[3] = &unk_100236E08;
    v14 = v7;
    v12 = v5;
    v13 = v6;
    v9 = v6;
    v10 = v7;
    dispatch_async(v8, block);

LABEL_6:
  }
}

- (DataStreamBulkSendProtocol)bulkSendProtocol
{
  return (DataStreamBulkSendProtocol *)objc_loadWeakRetained((id *)&self->_bulkSendProtocol);
}

- (NSNumber)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)activeReadHandler
{
  return self->_activeReadHandler;
}

- (void)setActiveReadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableArray)pendingReads
{
  return self->_pendingReads;
}

- (void)setPendingReads:(id)a3
{
  objc_storeStrong((id *)&self->_pendingReads, a3);
}

- (NSError)pendingError
{
  return self->_pendingError;
}

- (void)setPendingError:(id)a3
{
  objc_storeStrong((id *)&self->_pendingError, a3);
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingError, 0);
  objc_storeStrong((id *)&self->_pendingReads, 0);
  objc_storeStrong(&self->_activeReadHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_bulkSendProtocol);
}

@end

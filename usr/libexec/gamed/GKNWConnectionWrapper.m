@implementation GKNWConnectionWrapper

- (GKNWConnectionWrapper)initWithConnection:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKNWConnectionWrapper *v11;
  GKNWConnectionWrapper *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GKNWConnectionWrapper;
  v11 = -[GKNWConnectionWrapper init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[GKNWConnectionWrapper setConnection:](v11, "setConnection:", v8);
    -[GKNWConnectionWrapper setDelegate:](v12, "setDelegate:", v9);
    -[GKNWConnectionWrapper setDelegateQueue:](v12, "setDelegateQueue:", v10);
    -[NWConnection addObserver:forKeyPath:options:context:](v12->_connection, "addObserver:forKeyPath:options:context:", v12, CFSTR("connectionState"), 5, 0);
  }

  return v12;
}

- (void)dealloc
{
  NWConnection *connection;
  OS_dispatch_queue *writeQueue;
  objc_super v5;

  -[NWConnection removeObserver:forKeyPath:](self->_connection, "removeObserver:forKeyPath:", self, CFSTR("connectionState"));
  if (-[NWConnection connectionState](self->_connection, "connectionState") != (id)5)
    -[NWConnection cancel](self->_connection, "cancel");
  connection = self->_connection;
  self->_connection = 0;

  writeQueue = self->_writeQueue;
  self->_writeQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)GKNWConnectionWrapper;
  -[GKNWConnectionWrapper dealloc](&v5, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD *v16;
  objc_super v17;
  _QWORD block[5];
  _QWORD v19[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("connectionState")))
  {
    v13 = -[NWConnection connectionState](self->_connection, "connectionState");
    if (v13 == (id)4)
    {
      v14 = objc_claimAutoreleasedReturnValue(-[GKNWConnectionWrapper delegateQueue](self, "delegateQueue"));
      v15 = v14;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10010F038;
      block[3] = &unk_1002BBBD8;
      block[4] = self;
      v16 = block;
      goto LABEL_7;
    }
    if (v13 == (id)3)
    {
      v14 = objc_claimAutoreleasedReturnValue(-[GKNWConnectionWrapper delegateQueue](self, "delegateQueue"));
      v15 = v14;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10010F030;
      v19[3] = &unk_1002BBBD8;
      v19[4] = self;
      v16 = v19;
LABEL_7:
      dispatch_async(v14, v16);

    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)GKNWConnectionWrapper;
    -[GKNWConnectionWrapper observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (BOOL)sendData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[NWConnection connectionState](self->_connection, "connectionState");
  if (v5 == (id)3)
    -[GKNWConnectionWrapper _sendData:](self, "_sendData:", v4);

  return v5 == (id)3;
}

- (void)cancelConnection
{
  -[NWConnection cancel](self->_connection, "cancel");
}

- (GKNWConnectionWrapperDelegate)delegate
{
  return (GKNWConnectionWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NWConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_delegateQueue);
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeWeak((id *)&self->_delegateQueue, a3);
}

- (OS_dispatch_queue)writeQueue
{
  return self->_writeQueue;
}

- (void)setWriteQueue:(id)a3
{
  objc_storeStrong((id *)&self->_writeQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_destroyWeak((id *)&self->_delegateQueue);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

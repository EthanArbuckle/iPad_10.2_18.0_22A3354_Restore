@implementation DataStreamSocket

- (DataStreamSocket)initWithStreamProtocol:(id)a3 applicationProtocolName:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  DataStreamSocket *v11;
  DataStreamSocket *v12;
  uint64_t v13;
  NSMutableArray *pendingReads;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DataStreamSocket;
  v11 = -[DataStreamSocket init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_streamProtocol, v8);
    objc_storeStrong((id *)&v12->_applicationProtocolName, a4);
    objc_storeStrong((id *)&v12->_workQueue, a5);
    *(_WORD *)&v12->_closing = 0;
    v12->_trafficClass = 0;
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingReads = v12->_pendingReads;
    v12->_pendingReads = (NSMutableArray *)v13;

  }
  return v12;
}

- (DataStreamSocketDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (DataStreamSocketDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options(p_lock, 0);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isClosed
{
  DataStreamSocket *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  LOBYTE(v2) = v2->_closed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)trafficClass
{
  os_unfair_lock_s *p_lock;
  unint64_t trafficClass;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  trafficClass = self->_trafficClass;
  os_unfair_lock_unlock(p_lock);
  return trafficClass;
}

- (void)setTrafficClass:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t trafficClass;
  NSObject *v7;
  _QWORD block[7];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  trafficClass = self->_trafficClass;
  self->_trafficClass = a3;
  os_unfair_lock_unlock(p_lock);
  if (trafficClass != a3)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[DataStreamSocket workQueue](self, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C770;
    block[3] = &unk_100236B70;
    block[4] = self;
    block[5] = trafficClass;
    block[6] = a3;
    dispatch_async(v7, block);

  }
}

- (void)close
{
  -[DataStreamSocket closeWithError:](self, "closeWithError:", 0);
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;

  v6 = a3;
  v7 = -[DataStreamSocket isClosed](self, "isClosed");
  if (v7)
  {
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 39, 0));
  }
  else
  {
    -[DataStreamSocket _writeData:completion:](self, "_writeData:completion:", v6, 0);
  }

  return v7 ^ 1;
}

- (void)writeData:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, void *))a4;
  if (-[DataStreamSocket isClosed](self, "isClosed"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 39, 0));
    v6[2](v6, v7);

  }
  else
  {
    -[DataStreamSocket _writeData:completion:](self, "_writeData:completion:", v8, v6);
  }

}

- (void)_writeData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[DataStreamSocket workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CA60;
  block[3] = &unk_100236B98;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)readData
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray hmf_maybeDequeue](self->_pendingReads, "hmf_maybeDequeue"));
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)closeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  if (self->_closed)
  {
    self->_closing = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    *(_WORD *)&self->_closing = 256;
    os_unfair_lock_unlock(&self->_lock);
    v5 = objc_claimAutoreleasedReturnValue(-[DataStreamSocket workQueue](self, "workQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001CBD0;
    v6[3] = &unk_100236AD0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)handleIncomingData:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  -[NSMutableArray hmf_enqueue:](self->_pendingReads, "hmf_enqueue:", v4);
  os_unfair_lock_unlock(&self->_lock);
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamSocket workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CCF4;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)closeInitiated
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_closing = 1;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)applicationProtocolName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (DataStreamStreamProtocol)streamProtocol
{
  return (DataStreamStreamProtocol *)objc_loadWeakRetained((id *)&self->_streamProtocol);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isClosing
{
  return self->_closing;
}

- (void)setClosing:(BOOL)a3
{
  self->_closing = a3;
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (NSMutableArray)pendingReads
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReads, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_streamProtocol);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationProtocolName, 0);
}

@end

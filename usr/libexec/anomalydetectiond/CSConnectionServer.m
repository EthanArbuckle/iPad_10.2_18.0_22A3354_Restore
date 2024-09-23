@implementation CSConnectionServer

- (CSConnectionServer)initWithDispatchSilo:(id)a3 andDelegate:(id)a4
{
  id v7;
  id v8;
  CSConnectionServer *v9;
  CSConnectionServer *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableSet *mutableConnections;
  char *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  void *v19[2];
  id location;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CSConnectionServer;
  v9 = -[CSConnectionServer init](&v21, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchSilo, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v12 = objc_opt_new(NSMutableSet, v11);
    mutableConnections = v10->_mutableConnections;
    v10->_mutableConnections = (NSMutableSet *)v12;

    objc_initWeak(&location, v10);
    v14 = (char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CSConnectionServer serviceName](v10, "serviceName"))), "UTF8String");
    sub_100007088(v19, v14);
    v15 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(-[CSConnectionServer dispatchSilo](v10, "dispatchSilo")), "queue");
    objc_claimAutoreleasedReturnValue(v15);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1002CCD54;
    v17[3] = &unk_100365880;
    objc_copyWeak(&v18, &location);
    objc_retainBlock(v17);
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  void *v3;
  NSMutableSet *mutableConnections;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSConnectionServer mutableConnections](self, "mutableConnections"));
  objc_msgSend(v3, "removeAllObjects");

  mutableConnections = self->_mutableConnections;
  self->_mutableConnections = 0;

  sub_1002CD0CC(&self->_server.__ptr_.__value_, 0);
  v5.receiver = self;
  v5.super_class = (Class)CSConnectionServer;
  -[CSConnectionServer dealloc](&v5, "dealloc");
}

- (NSString)serviceName
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSConnectionServer.mm"), 58, CFSTR("Children must provide a serviceName."));

  return 0;
}

- (void)connection:(id)a3 handleMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_1003658A8);
  v8 = (id)qword_100387398;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloadObject"));
    v12[0] = 68289794;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2114;
    v16 = v6;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"handleMessage\", \"connection\":%{public, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"value\":%{public, location:escape_only}@}", (uint8_t *)v12, 0x30u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSConnectionServer delegate](self, "delegate"));
  objc_msgSend(v11, "messageReceived:fromConnection:", v7, v6);

}

- (void)connectionHandleDisconnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_1003658A8);
  v5 = qword_100387398;
  if (os_log_type_enabled((os_log_t)qword_100387398, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2114;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"handleDisconnection\", \"connection\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSConnectionServer delegate](self, "delegate"));
  objc_msgSend(v6, "connectionDisconnected:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSConnectionServer mutableConnections](self, "mutableConnections"));
  objc_msgSend(v7, "removeObject:", v4);

}

- (void)connectionHandleInterruption:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_1003658A8);
  v5 = qword_100387398;
  if (os_log_type_enabled((os_log_t)qword_100387398, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2114;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"handleInterruption\", \"connection\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSConnectionServer delegate](self, "delegate"));
  objc_msgSend(v6, "connectionInterrupted:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSConnectionServer mutableConnections](self, "mutableConnections"));
  objc_msgSend(v7, "removeObject:", v4);

}

- (NSMutableSet)mutableConnections
{
  return self->_mutableConnections;
}

- (CSConnectionServerDelegateProtocol)delegate
{
  return (CSConnectionServerDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CLDispatchSilo)dispatchSilo
{
  return self->_dispatchSilo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSilo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mutableConnections, 0);
  sub_1002CD0CC(&self->_server.__ptr_.__value_, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end

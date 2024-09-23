@implementation CSConnection

- (CSConnection)initWithConnection:(shared_ptr<CLConnection>)a3 message:(shared_ptr<CLConnectionMessage>)a4 delegate:(id)a5
{
  CLConnection **ptr;
  CLConnectionMessage *v8;
  CSConnection *v9;
  NSObject *v10;
  int RemotePid;
  void *p_p;
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  void *__p;
  std::__shared_weak_count *v34;
  char v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int v40;

  ptr = (CLConnection **)a3.__ptr_;
  v8 = a4.__ptr_;
  v36.receiver = self;
  v36.super_class = (Class)CSConnection;
  v9 = -[CSConnection init](&v36, "init");
  if (v9)
  {
    if (!*ptr)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("CSConnection.mm"), 26, CFSTR("connection cannot be null"));

    }
    if (qword_100387390 != -1)
      dispatch_once(&qword_100387390, &stru_100365B20);
    v10 = (id)qword_100387398;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      CLConnection::getName(*ptr);
      RemotePid = CLConnection::getRemotePid(*ptr);
      p_p = &__p;
      if (v35 < 0)
        p_p = __p;
      *(_DWORD *)buf = 136315394;
      v38 = p_p;
      v39 = 1024;
      v40 = RemotePid;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Creating Connection, name: %s, pid: %d", buf, 0x12u);
      if (v35 < 0)
        operator delete(__p);
    }

    objc_storeWeak((id *)&v9->_delegate, v8);
    sub_1000081AC((uint64_t)&v9->_connection, (__int128 *)ptr);
    objc_initWeak((id *)buf, v9);
    -[CSConnection connection](v9, "connection");
    v13 = __p;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1002D23C4;
    v31[3] = &unk_10035C840;
    objc_copyWeak(&v32, (id *)buf);
    CLConnection::setDisconnectionHandler(v13, v31);
    v14 = v34;
    if (v34)
    {
      p_shared_owners = (unint64_t *)&v34->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    -[CSConnection connection](v9, "connection");
    v17 = __p;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1002D242C;
    v29[3] = &unk_10035C840;
    objc_copyWeak(&v30, (id *)buf);
    CLConnection::setInterruptionHandler(v17, v29);
    v18 = v34;
    if (v34)
    {
      v19 = (unint64_t *)&v34->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    -[CSConnection connection](v9, "connection");
    v21 = __p;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1002D2494;
    v27[3] = &unk_10035C818;
    objc_copyWeak(&v28, (id *)buf);
    CLConnection::setDefaultMessageHandler(v21, v27);
    v22 = v34;
    if (v34)
    {
      v23 = (unint64_t *)&v34->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }

  return v9;
}

- (void)dealloc
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  objc_super v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  -[CSConnection connection](self, "connection");
  v3 = v10;
  v9 = 0;
  v10 = 0;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)CSConnection;
  -[CSConnection dealloc](&v8, "dealloc");
}

- (void)start
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  CLConnection *v5;
  std::__shared_weak_count *v6;

  -[CSConnection connection](self, "connection");
  CLConnection::start(v5);
  v2 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
}

- (NSString)name
{
  uint64_t *p_shared_owners;
  unint64_t v4;
  void *p_p;
  void *v6;
  unint64_t *v7;
  unint64_t v8;
  CLConnection *v10;
  std::__shared_weak_count *v11;
  void *__p;
  std::__shared_weak_count *v13;
  char v14;

  -[CSConnection connection](self, "connection");
  if (v13)
  {
    p_shared_owners = &v13->__shared_owners_;
    do
      v4 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v4 - 1, (unint64_t *)p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
      if (__p)
        goto LABEL_6;
LABEL_17:
      v6 = 0;
      return (NSString *)v6;
    }
  }
  if (!__p)
    goto LABEL_17;
LABEL_6:
  -[CSConnection connection](self, "connection");
  CLConnection::getName(v10);
  if (v14 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p));
  if (v14 < 0)
    operator delete(__p);
  if (v11)
  {
    v7 = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return (NSString *)v6;
}

- (int)remotePid
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  int RemotePid;
  unint64_t *v6;
  unint64_t v7;
  CLConnection *v9;
  std::__shared_weak_count *v10;

  -[CSConnection connection](self, "connection");
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
      if (v9)
        goto LABEL_6;
      return -1;
    }
  }
  if (!v9)
    return -1;
LABEL_6:
  -[CSConnection connection](self, "connection");
  RemotePid = CLConnection::getRemotePid(v9);
  if (v10)
  {
    v6 = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return RemotePid;
}

- (void)sendMessage:(id)a3 withName:(id)a4
{
  id v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  void *__p;
  std::__shared_weak_count *v22;
  char v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  id v26;

  v26 = a3;
  v6 = objc_retainAutorelease(a4);
  sub_100007088(&__p, (char *)objc_msgSend(v6, "UTF8String"));
  sub_1002D2F84((uint64_t)&__p, &v26, &v24);
  if (v23 < 0)
    operator delete(__p);
  -[CSConnection connection](self, "connection");
  v7 = __p;
  v19 = v24;
  v20 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  CLConnection::sendMessage(v7, &v19);
  v10 = v20;
  if (v20)
  {
    v11 = (unint64_t *)&v20->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = v22;
  if (v22)
  {
    v14 = (unint64_t *)&v22->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = v25;
  if (v25)
  {
    v17 = (unint64_t *)&v25->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

}

- (void)sendMessage:(id)a3 withName:(id)a4 andReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  id v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  void *__p;
  std::__shared_weak_count *v29;
  char v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  id v33;

  v33 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_retainAutorelease(v8);
  sub_100007088(&__p, (char *)objc_msgSend(v10, "UTF8String"));
  sub_1002D2F84((uint64_t)&__p, &v33, &v31);
  if (v30 < 0)
    operator delete(__p);
  -[CSConnection connection](self, "connection");
  v11 = __p;
  v26 = v31;
  v27 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1002D2D3C;
  v24[3] = &unk_100365B00;
  v14 = v9;
  v25 = v14;
  CLConnection::sendMessage(v11, &v26, v24);
  v15 = v27;
  if (v27)
  {
    v16 = (unint64_t *)&v27->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = v29;
  if (v29)
  {
    v19 = (unint64_t *)&v29->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  v21 = v32;
  if (v32)
  {
    v22 = (unint64_t *)&v32->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

}

- (id)description
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  std::__shared_weak_count *v9;

  -[CSConnection connection](self, "connection");
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v9->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (!v8)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connection uninitialized.")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSConnection name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connection, name: %@, pid: %d"), v5, -[CSConnection remotePid](self, "remotePid")));

  return v6;
}

- (CSConnectionDelegateProtocol)delegate
{
  return (CSConnectionDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (shared_ptr<CLConnection>)connection
{
  CLConnection **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<CLConnection> result;

  cntrl = self->_connection.__cntrl_;
  *v2 = self->_connection.__ptr_;
  v2[1] = (CLConnection *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CLConnection *)self;
  return result;
}

- (void).cxx_destruct
{
  sub_10000A718((uint64_t)&self->_connection);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end

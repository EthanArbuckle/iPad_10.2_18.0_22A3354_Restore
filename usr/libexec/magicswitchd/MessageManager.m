@implementation MessageManager

- (MessageManager)initWithDelegate:(id)a3 pipe:(id)a4
{
  id v6;
  id v7;
  MessageManager *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  MessageManager *v13;
  __int16 v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MessageManager;
  v8 = -[MessageManager init](&v11, "init");
  if (v8)
  {
    v9 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v13 = v8;
      v14 = 2112;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MessageManager --- Initializing (%p); pipe: (%@)",
        buf,
        0x16u);
    }
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_pipe, a4);
    v8->_socket = sub_10000D874(v8->_pipe);
    -[MessageManager setupReadWriteSources](v8, "setupReadWriteSources");
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[MessageManager invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MessageManager;
  -[MessageManager dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *readSource;
  OS_dispatch_source *v5;
  NSObject *writeSource;
  OS_dispatch_source *v7;
  CBScalablePipe *pipe;
  int v9;
  MessageManager *v10;

  if (!self->_invalidated)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MessageManager --- Invalidating (%p)", (uint8_t *)&v9, 0xCu);
    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    readSource = self->_readSource;
    if (readSource)
    {
      dispatch_source_cancel(readSource);
      dispatch_source_set_event_handler((dispatch_source_t)self->_readSource, 0);
      v5 = self->_readSource;
      self->_readSource = 0;

    }
    writeSource = self->_writeSource;
    if (writeSource)
    {
      dispatch_source_cancel(writeSource);
      dispatch_source_set_event_handler((dispatch_source_t)self->_writeSource, 0);
      if (self->_writeSourceIsSuspended)
      {
        dispatch_resume((dispatch_object_t)self->_writeSource);
        self->_writeSourceIsSuspended = 0;
      }
      v7 = self->_writeSource;
      self->_writeSource = 0;

    }
    pipe = self->_pipe;
    self->_pipe = 0;

  }
}

- (void)setupReadWriteSources
{
  uintptr_t socket;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uintptr_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD handler[5];
  uint8_t buf[16];

  socket = self->_socket;
  if ((_DWORD)socket == -1)
  {
    v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MessageManager --- Socket is invalid", buf, 2u);
    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workQueue"));
    v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, socket, 0, v5);

    if (v6)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000DF90;
      handler[3] = &unk_100018538;
      handler[4] = self;
      dispatch_source_set_event_handler(v6, handler);
      dispatch_activate(v6);
      objc_storeStrong((id *)&self->_readSource, v6);
      v7 = self->_socket;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workQueue"));
      v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_write, v7, 0, v9);

      if (v10)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10000DFA4;
        v14[3] = &unk_100018538;
        v14[4] = self;
        dispatch_source_set_event_handler(v10, v14);
        dispatch_suspend(v10);
        self->_writeSourceIsSuspended = 1;
        dispatch_activate(v10);
        objc_storeStrong((id *)&self->_writeSource, v10);
      }
      else
      {
        v13 = qword_100021A50;
        if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MessageManager --- Failed to create socket write source", buf, 2u);
        }
        -[MessageManager invalidate](self, "invalidate");
      }

    }
    else
    {
      v12 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MessageManager --- Failed to create socket read source", buf, 2u);
      }
      -[MessageManager invalidate](self, "invalidate");
    }

  }
}

- (void)readIncomingMessages
{
  __int128 v2;
  NSObject *v4;
  ssize_t v5;
  NSObject *v6;
  int socket;
  id WeakRetained;
  NSObject *v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  int v14;
  __int128 v15;
  unsigned __int8 v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  ssize_t v20;

  if (self->_invalidated)
  {
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidated", buf, 2u);
    }
  }
  *(_QWORD *)&v2 = 67109376;
  v15 = v2;
  while (1)
  {
    v16 = 0;
    v5 = read(self->_socket, &v16, 1uLL);
    v6 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      socket = self->_socket;
      *(_DWORD *)buf = v15;
      v18 = socket;
      v19 = 2048;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MessageManager --- Read from socket (%d) returned: (%zd)", buf, 0x12u);
    }
    if (v5 <= 0)
      break;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "watchDidChangeWristState:", v16);

  }
  if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_socket;
      *(_DWORD *)buf = 67109120;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MessageManager --- Read EOF from socket: (%d)", buf, 8u);
    }
LABEL_12:
    -[MessageManager invalidate](self, "invalidate", v15);
    return;
  }
  if (*__error() && *__error() != 35)
  {
    v11 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_socket;
      v13 = v11;
      v14 = *__error();
      *(_DWORD *)buf = v15;
      v18 = v12;
      v19 = 1024;
      LODWORD(v20) = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MessageManager --- Error occured while reading from socket (%d): (%d)", buf, 0xEu);

    }
    goto LABEL_12;
  }
}

- (void)writeMessage:(unsigned __int8)a3
{
  NSObject *v4;
  ssize_t v5;
  NSObject *v6;
  int socket;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  unsigned __int8 __buf;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  ssize_t v16;

  __buf = a3;
  if (self->_invalidated)
  {
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidated", buf, 2u);
    }
  }
  v5 = write(self->_socket, &__buf, 1uLL);
  v6 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    socket = self->_socket;
    *(_DWORD *)buf = 67109376;
    v14 = socket;
    v15 = 2048;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MessageManager --- Write to socket (%d) returned: (%zd)", buf, 0x12u);
  }
  if (v5 < 1)
  {
    if (v5 == -1)
    {
      v8 = (void *)qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_socket;
        v10 = v8;
        v11 = *__error();
        *(_DWORD *)buf = 67109376;
        v14 = v9;
        v15 = 1024;
        LODWORD(v16) = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MessageManager --- Write to socket (%d) failed: (%d)", buf, 0xEu);

      }
      if (*__error() == 35)
      {
        self->_pendingOutgoingWristState = __buf;
        self->_hasPendingOutgoingMessage = 1;
        if (self->_writeSourceIsSuspended)
        {
          dispatch_resume((dispatch_object_t)self->_writeSource);
          self->_writeSourceIsSuspended = 0;
        }
      }
      else
      {
        -[MessageManager invalidate](self, "invalidate");
      }
    }
  }
  else
  {
    self->_hasPendingOutgoingMessage = 0;
  }
}

- (void)writePendingMessages
{
  if (!self->_hasPendingOutgoingMessage && !self->_writeSourceIsSuspended)
  {
    dispatch_suspend((dispatch_object_t)self->_writeSource);
    self->_writeSourceIsSuspended = 1;
  }
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (MessageManagerDelegate)delegate
{
  return (MessageManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CBScalablePipe)pipe
{
  return self->_pipe;
}

- (void)setPipe:(id)a3
{
  objc_storeStrong((id *)&self->_pipe, a3);
}

- (int)socket
{
  return self->_socket;
}

- (void)setSocket:(int)a3
{
  self->_socket = a3;
}

- (OS_dispatch_source)readSource
{
  return self->_readSource;
}

- (void)setReadSource:(id)a3
{
  objc_storeStrong((id *)&self->_readSource, a3);
}

- (OS_dispatch_source)writeSource
{
  return self->_writeSource;
}

- (void)setWriteSource:(id)a3
{
  objc_storeStrong((id *)&self->_writeSource, a3);
}

- (BOOL)writeSourceIsSuspended
{
  return self->_writeSourceIsSuspended;
}

- (void)setWriteSourceIsSuspended:(BOOL)a3
{
  self->_writeSourceIsSuspended = a3;
}

- (BOOL)hasPendingOutgoingMessage
{
  return self->_hasPendingOutgoingMessage;
}

- (void)setHasPendingOutgoingMessage:(BOOL)a3
{
  self->_hasPendingOutgoingMessage = a3;
}

- (unsigned)pendingOutgoingWristState
{
  return self->_pendingOutgoingWristState;
}

- (void)setPendingOutgoingWristState:(unsigned __int8)a3
{
  self->_pendingOutgoingWristState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

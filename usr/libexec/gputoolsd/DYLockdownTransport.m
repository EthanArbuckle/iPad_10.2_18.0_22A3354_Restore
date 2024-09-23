@implementation DYLockdownTransport

- (DYLockdownTransport)init
{
  DYLockdownTransport *v2;
  DYLockdownTransport *v3;
  NSString *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *sslQueue;
  DYLockdownTransport *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DYLockdownTransport;
  v2 = -[DYLockdownTransport init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_socket = -1;
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", object_getClassName(v2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), v5, v3, CFSTR("ssl"))));
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    sslQueue = v3->_sslQueue;
    v3->_sslQueue = (OS_dispatch_queue *)v7;

    v9 = v3;
  }

  return v3;
}

- (void)dealloc
{
  __CFDictionary *connectionInfo;
  objc_super v4;

  connectionInfo = self->_connectionInfo;
  if (connectionInfo)
    CFRelease(connectionInfo);
  v4.receiver = self;
  v4.super_class = (Class)DYLockdownTransport;
  -[DYLockdownTransport dealloc](&v4, "dealloc");
}

- (int)_ssl_st_read:(void *)a3 size:(unint64_t *)a4
{
  size_t v4;
  char *v8;
  ssize_t v9;
  unint64_t v10;

  v4 = *a4;
  *a4 = 0;
  if (!v4)
    return 0;
  v8 = (char *)a3;
  while (1)
  {
    v9 = recv(self->_socket, v8, v4, 0);
    if (v9 != -1)
    {
      if (!v9)
        return -9805;
      v4 -= v9;
      v10 = *a4 + v9;
      *a4 = v10;
      v8 = (char *)a3 + v10;
      goto LABEL_9;
    }
    if (*__error() == 35)
      return -9803;
    if (*__error() == 54)
      return -9806;
    if (*__error() != 4)
      return -36;
LABEL_9:
    if (!v4)
      return 0;
  }
}

- (int)_ssl_st_write:(const void *)a3 size:(unint64_t *)a4
{
  size_t v4;
  char *v8;
  ssize_t v9;
  unint64_t v10;

  v4 = *a4;
  *a4 = 0;
  if (!v4)
    return 0;
  v8 = (char *)a3;
  while (1)
  {
    v9 = send(self->_socket, v8, v4, 0);
    if (v9 != -1)
    {
      v4 -= v9;
      v10 = *a4 + v9;
      *a4 = v10;
      v8 = (char *)a3 + v10;
      goto LABEL_8;
    }
    if (*__error() == 35)
    {
      self->_needWrite = 1;
      return -9803;
    }
    if (*__error() == 32)
      return -9806;
    if (*__error() != 4)
      return -36;
LABEL_8:
    if (!v4)
      return 0;
  }
}

- (void)_waitEAGAIN
{
  usleep(0x64u);
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  OS_dispatch_queue *sslQueue;
  int v6;
  id v7;
  int *v8;
  int v9;
  objc_super v11;
  _QWORD block[9];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (a4)
  {
    if (self->_ssl)
    {
      self->_needWrite = 0;
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v16 = 0;
      sslQueue = self->_sslQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006C34;
      block[3] = &unk_10000C818;
      block[4] = self;
      block[5] = &v13;
      block[7] = a3;
      block[8] = a4;
      block[6] = &v17;
      dispatch_sync((dispatch_queue_t)sslQueue, block);
      v6 = *((_DWORD *)v14 + 6);
      if (!v6)
      {
LABEL_18:
        _Block_object_dispose(&v13, 8);
        v7 = (id)v18[3];
        goto LABEL_19;
      }
      if (v6 == -9803)
      {
        *__error() = 35;
        if (self->_needWrite)
        {
          -[DYLockdownTransport scheduleReadOnWritableSocket](self, "scheduleReadOnWritableSocket");
          self->_needWrite = 0;
        }
        if (!v18[3])
          v18[3] = -1;
        goto LABEL_18;
      }
      v18[3] = -1;
      if (v6 != -9816)
      {
        if (v6 == -9800)
        {
          v8 = __error();
          v9 = 100;
          goto LABEL_17;
        }
        if (v6 != -9806)
        {
          v8 = __error();
          v9 = 5;
          goto LABEL_17;
        }
      }
      v8 = __error();
      v9 = 54;
LABEL_17:
      *v8 = v9;
      goto LABEL_18;
    }
    v11.receiver = self;
    v11.super_class = (Class)DYLockdownTransport;
    v7 = -[DYLockdownTransport _read:size:](&v11, "_read:size:", a3);
    v18[3] = (uint64_t)v7;
  }
  else
  {
    v7 = 0;
  }
LABEL_19:
  _Block_object_dispose(&v17, 8);
  return (int64_t)v7;
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  OS_dispatch_queue *sslQueue;
  int v5;
  id v6;
  int *v7;
  int v8;
  objc_super v10;
  _QWORD block[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (a4)
  {
    if (self->_ssl)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      sslQueue = self->_sslQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006E44;
      block[3] = &unk_10000C818;
      block[4] = self;
      block[5] = &v12;
      block[7] = a3;
      block[8] = a4;
      block[6] = &v16;
      dispatch_sync((dispatch_queue_t)sslQueue, block);
      v5 = *((_DWORD *)v13 + 6);
      if (!v5)
      {
LABEL_16:
        _Block_object_dispose(&v12, 8);
        v6 = (id)v17[3];
        goto LABEL_17;
      }
      if (v5 == -9803)
      {
        *__error() = 35;
        if (!v17[3])
          v17[3] = -1;
        goto LABEL_16;
      }
      v17[3] = -1;
      if (v5 != -9816)
      {
        if (v5 == -9800)
        {
          v7 = __error();
          v8 = 100;
          goto LABEL_15;
        }
        if (v5 != -9806)
        {
          v7 = __error();
          v8 = 5;
          goto LABEL_15;
        }
      }
      v7 = __error();
      v8 = 32;
LABEL_15:
      *v7 = v8;
      goto LABEL_16;
    }
    v10.receiver = self;
    v10.super_class = (Class)DYLockdownTransport;
    v6 = -[DYLockdownTransport _write:size:](&v10, "_write:size:", a3);
    v17[3] = (uint64_t)v6;
  }
  else
  {
    v6 = 0;
  }
LABEL_17:
  _Block_object_dispose(&v16, 8);
  return (int64_t)v6;
}

- (void)closeSocketDescriptor
{
  int socket;
  int v4;

  if (self->_connection)
  {
    socket = self->_socket;
    v4 = fcntl(socket, 3);
    fcntl(socket, 4, v4 & 0xFFFFFFFB);
    lockdown_disconnect(self->_connection);
    self->_connection = 0;
    self->_socket = -1;
    self->_ssl = 0;
  }
}

- (id)connect
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DYFuture future](DYFuture, "future"));
  v4 = *(NSObject **)&self->DYBaseSocketTransport_opaque[OBJC_IVAR___DYTransport__queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006FC0;
  v9[3] = &unk_10000C840;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_async(v4, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sslQueue, 0);
}

@end

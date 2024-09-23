@implementation WLServerConnection

- (WLServerConnection)init
{
  WLServerConnection *v2;
  WLServerConnection *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableSet *v6;
  NSMutableSet *connections;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WLServerConnection;
  v2 = -[WLServerConnection init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_sockfd = -1;
    v4 = dispatch_queue_create("WLServerConnection Connection Pool Queue", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    connections = v3->_connections;
    v3->_connections = v6;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[WLServerConnection close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)WLServerConnection;
  -[WLServerConnection dealloc](&v3, sel_dealloc);
}

- (void)listen:(int)a3
{
  int v4;
  int v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;
  int v9;
  id location;

  if (self->_sockfd == -1)
  {
    v4 = -[WLServerConnection _listen:](self, "_listen:", *(_QWORD *)&a3);
    if (v4 != -1)
    {
      v5 = v4;
      self->_sockfd = v4;
      objc_initWeak(&location, self);
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __29__WLServerConnection_listen___block_invoke;
      block[3] = &unk_24E376040;
      objc_copyWeak(&v8, &location);
      v9 = v5;
      dispatch_async(queue, block);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __29__WLServerConnection_listen___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accept:", *(unsigned int *)(a1 + 40));

}

- (void)close
{
  NSMutableSet *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int sockfd;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = self->_connections;
  objc_sync_enter(v3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_connections;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        close(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "intValue", (_QWORD)v9));
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_connections, "removeAllObjects");
  objc_sync_exit(v3);

  sockfd = self->_sockfd;
  if (sockfd != -1)
    close(sockfd);
}

- (int)_listen:(int)a3
{
  int v4;
  int v6;
  sockaddr v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = socket(2, 1, 0);
  if (v4 == -1)
  {
    _WLLog();
  }
  else
  {
    _WLLog();
    *(_QWORD *)&v7.sa_len = 512;
    *(_QWORD *)&v7.sa_data[6] = 0;
    *(_DWORD *)v7.sa_data = bswap32(a3) >> 16;
    v6 = 1;
    if (setsockopt(v4, 0xFFFF, 4, &v6, 4u) || bind(v4, &v7, 0x10u) || (_WLLog(), listen(v4, 5)))
    {
      _WLLog();
      return -1;
    }
  }
  return v4;
}

- (void)_accept:(int)a3
{
  uint64_t i;
  NSObject *v6;
  NSMutableSet *v7;
  NSMutableSet *connections;
  void *v9;
  _QWORD block[4];
  id v11;
  int v12;
  id location;
  socklen_t v14;
  sockaddr v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  _WLLog();
  if (a3 != -1)
  {
    *(_QWORD *)&v15.sa_len = 0;
    *(_QWORD *)&v15.sa_data[6] = 0;
    v14 = 16;
    for (i = accept(a3, &v15, &v14); (i & 0x80000000) == 0; i = accept(a3, &v15, &v14))
    {
      _WLLog();
      v6 = dispatch_queue_create("WLServerConnection Connection Read Queue", 0);
      v7 = self->_connections;
      objc_sync_enter(v7);
      connections = self->_connections;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](connections, "addObject:", v9);

      objc_sync_exit(v7);
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __30__WLServerConnection__accept___block_invoke;
      block[3] = &unk_24E376040;
      objc_copyWeak(&v11, &location);
      v12 = i;
      dispatch_async(v6, block);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);

      *(_QWORD *)&v15.sa_len = 0;
      *(_QWORD *)&v15.sa_data[6] = 0;
      v14 = 16;
    }
    _WLLog();
  }
  _WLLog();
}

void __30__WLServerConnection__accept___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_read:", *(unsigned int *)(a1 + 40));

}

- (BOOL)_isTerminated:(const char *)a3 length:(int64_t)a4
{
  int v4;

  v4 = a3[a4 - 1];
  if (a3[a4 - 1])
  {
    if (a4 < 4)
    {
      if (a4 < 2)
        return 0;
    }
    else if (a3[a4 - 4] == 13 && a3[a4 - 3] == 10 && v4 == 10 && a3[a4 - 2] == 13)
    {
      return 1;
    }
    if (v4 != 10 || a3[a4 - 2] != 13)
      return 0;
  }
  return 1;
}

- (void)_read:(int)a3
{
  uint64_t v3;
  ssize_t v5;
  char *v6;
  size_t v7;
  void *v8;
  id WeakRetained;
  id v10;
  size_t v11;
  char *v12;
  char *v13;
  char v14;
  id v15;
  id v16;
  NSMutableSet *v17;
  void *v18;
  _QWORD v19[130];

  v3 = *(_QWORD *)&a3;
  v19[128] = *MEMORY[0x24BDAC8D0];
  _WLLog();
  v5 = read(v3, v19, 0x400uLL);
  if (v5 <= 0)
    goto LABEL_20;
  v6 = 0;
  v7 = 0;
  do
  {
    if (!v6 && -[WLServerConnection _isTerminated:length:](self, "_isTerminated:length:", v19, v5))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v19);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained)
      {
        v10 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v10, "connection:didReceiveText:", self, v8);

      }
LABEL_15:

      v6 = 0;
      goto LABEL_17;
    }
    v11 = v5 + v7;
    v12 = (char *)malloc_type_malloc(v5 + v7 + 1, 0xEDEE1FE6uLL);
    strncpy(v12, v6, v7);
    v13 = (char *)v19;
    do
    {
      v14 = *v13++;
      v12[v7++] = v14;
      --v5;
    }
    while (v5);
    v12[v11] = 0;
    if (v6)
      free(v6);
    if (-[WLServerConnection _isTerminated:length:](self, "_isTerminated:length:", v12, v11))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v12);
      v15 = objc_loadWeakRetained((id *)&self->_delegate);

      if (v15)
      {
        v16 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v16, "connection:didReceiveText:", self, v8);

      }
      free(v12);
      v7 = 0;
      goto LABEL_15;
    }
    v7 = v11;
    v6 = v12;
LABEL_17:
    _WLLog();
    v5 = read(v3, v19, 0x400uLL);
  }
  while (v5 > 0);
  if (v6)
    free(v6);
LABEL_20:
  _WLLog();
  close(v3);
  v17 = self->_connections;
  objc_sync_enter(v17);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v18);

  objc_sync_exit(v17);
}

- (WLServerConnectionDelegate)delegate
{
  return (WLServerConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

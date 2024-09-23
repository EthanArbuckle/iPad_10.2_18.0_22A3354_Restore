@implementation WLSocketHandler

- (WLSocketHandler)init
{
  WLSocketHandler *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *readQueue;
  NSMutableArray *v5;
  NSMutableArray *dataCache;
  dispatch_semaphore_t v7;
  OS_dispatch_semaphore *dataCacheSema;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WLSocketHandler;
  v2 = -[WLSocketHandler init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("Socket Read Serialization Queue", 0);
    readQueue = v2->_readQueue;
    v2->_readQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    dataCache = v2->_dataCache;
    v2->_dataCache = v5;

    v7 = dispatch_semaphore_create(0);
    dataCacheSema = v2->_dataCacheSema;
    v2->_dataCacheSema = (OS_dispatch_semaphore *)v7;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v4;

  _WLLog();
  -[WLSocketHandler endReadingIntoCache](self, "endReadingIntoCache", self);
  v4.receiver = self;
  v4.super_class = (Class)WLSocketHandler;
  -[WLSocketHandler dealloc](&v4, sel_dealloc);
}

- (id)observeSocket:(int)a3 forSourceEventType:(dispatch_source_type_s *)a4 handler:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  int v13;

  v7 = a5;
  v8 = dispatch_source_create(a4, a3, 0, MEMORY[0x24BDAC9B8]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__WLSocketHandler_observeSocket_forSourceEventType_handler___block_invoke;
  v11[3] = &unk_24E376480;
  v12 = v7;
  v13 = a3;
  v9 = v7;
  dispatch_source_set_event_handler(v8, v11);
  dispatch_resume(v8);

  return v8;
}

uint64_t __60__WLSocketHandler_observeSocket_forSourceEventType_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 40));
  return result;
}

+ (void)performDNSLookupForHost:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, BOOL, hostent *);
  hostent *v7;
  id v8;

  v5 = a3;
  v6 = (void (**)(id, BOOL, hostent *))a4;
  v8 = objc_retainAutorelease(v5);
  v7 = gethostbyname((const char *)objc_msgSend(v8, "UTF8String"));
  if (!v7)
  {
    _WLLog();
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
LABEL_3:
    v6[2](v6, v7 != 0, v7);
LABEL_4:

}

+ (int)connectToHost:(id)a3 address:(hostent *)a4 port:(unsigned __int16)a5
{
  unsigned int v5;
  id v6;
  int v7;
  int v8;
  int *v9;
  int v11;
  sockaddr v12;
  uint64_t v13;

  v5 = a5;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  *(_QWORD *)&v12.sa_len = 512;
  *(_QWORD *)&v12.sa_data[6] = 0;
  __memmove_chk();
  *(_WORD *)v12.sa_data = __rev16(v5);
  v7 = socket(2, 1, 0);
  v8 = v7;
  if (v7 == -1)
  {
    _WLLog();
  }
  else
  {
    v11 = 1;
    setsockopt(v7, 0xFFFF, 4130, &v11, 4u);
    if (connect(v8, &v12, 0x10u) == -1)
    {
      v9 = __error();
      strerror(*v9);
      _WLLog();
      v8 = -1;
    }
  }

  return v8;
}

+ (void)lookupAndConnectToHost:(id)a3 port:(unsigned __int16)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  unsigned __int16 v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__WLSocketHandler_lookupAndConnectToHost_port_completion___block_invoke;
  v12[3] = &unk_24E3764A8;
  v14 = v9;
  v15 = a1;
  v16 = a4;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  +[WLSocketHandler performDNSLookupForHost:completion:](WLSocketHandler, "performDNSLookupForHost:completion:", v11, v12);

}

void __58__WLSocketHandler_lookupAndConnectToHost_port_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString **v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  if (!a2)
  {
    v21 = *(_QWORD *)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 32);
    _WLLog();
    v13 = *(_QWORD *)(a1 + 40);
    if (!v13)
      return;
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BEC2878];
    v25 = *MEMORY[0x24BDD0FC8];
    v26 = CFSTR("couldn't resolve host");
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = &v26;
    v18 = &v25;
LABEL_9:
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1, v21, v22, v23, v25, v26, v27, v28[0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, 0xFFFFFFFFLL, v20);

    return;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 56));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v7 = +[WLSocketHandler connectToHost:address:port:](WLSocketHandler, "connectToHost:address:port:", *(_QWORD *)(a1 + 32), a3, *(unsigned __int16 *)(a1 + 56), v4, v5, v24);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 56));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if ((_DWORD)v7 == -1)
  {
    v22 = v9;
    v23 = v10;
    v21 = v8;
    _WLLog();

    v13 = *(_QWORD *)(a1 + 40);
    if (!v13)
      return;
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BEC2878];
    v27 = *MEMORY[0x24BDD0FC8];
    v28[0] = CFSTR("couldn't connect to host");
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = (const __CFString **)v28;
    v18 = &v27;
    goto LABEL_9;
  }
  _WLLog();

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v12 + 16))(v12, v7, 0);
}

- (char)readBytesFromSocket:(int)a3 maximumSize:(unint64_t)a4 bytesRead:(int64_t *)a5
{
  NSObject *readQueue;
  char *v7;
  _QWORD v9[7];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  readQueue = self->_readQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__WLSocketHandler_readBytesFromSocket_maximumSize_bytesRead___block_invoke;
  v9[3] = &unk_24E3764D0;
  v9[5] = &v11;
  v9[6] = a4;
  v10 = a3;
  v9[4] = &v15;
  dispatch_sync(readQueue, v9);
  if (a5)
    *a5 = v16[3];
  v7 = (char *)v12[3];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v7;
}

int64_t __61__WLSocketHandler_readBytesFromSocket_maximumSize_bytesRead___block_invoke(uint64_t a1)
{
  size_t v2;
  char *v3;
  int64_t result;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = read(*(_DWORD *)(a1 + 56), v3, v2);
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result >= 1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = malloc_type_calloc(result, 1uLL, 0x440BB7D9uLL);
    return (int64_t)memcpy(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  }
  return result;
}

- (void)beginReadingIntoCacheFromSocket:(int)a3
{
  uint64_t v3;
  NSMutableArray *v5;
  NSObject *dataCacheReadSource;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  _QWORD v9[5];

  v3 = *(_QWORD *)&a3;
  v5 = self->_dataCache;
  objc_sync_enter(v5);
  dataCacheReadSource = self->_dataCacheReadSource;
  if (dataCacheReadSource)
  {
    dispatch_source_cancel(dataCacheReadSource);
    -[NSMutableArray removeAllObjects](self->_dataCache, "removeAllObjects");
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__WLSocketHandler_beginReadingIntoCacheFromSocket___block_invoke;
  v9[3] = &unk_24E3764F8;
  v9[4] = self;
  -[WLSocketHandler observeSocket:forSourceEventType:handler:](self, "observeSocket:forSourceEventType:handler:", v3, MEMORY[0x24BDACA00], v9);
  v7 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
  v8 = self->_dataCacheReadSource;
  self->_dataCacheReadSource = v7;

  objc_sync_exit(v5);
}

uint64_t __51__WLSocketHandler_beginReadingIntoCacheFromSocket___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readIntoCacheFromSocket:", a2);
}

- (void)_readIntoCacheFromSocket:(int)a3
{
  uint64_t v3;
  NSMutableArray *v5;
  char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v3 = *(_QWORD *)&a3;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = self->_dataCache;
  objc_sync_enter(v5);
  v11 = 0;
  v6 = -[WLSocketHandler readBytesFromSocket:maximumSize:bytesRead:](self, "readBytesFromSocket:maximumSize:bytesRead:", v3, 0x10000, &v11);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCE50]);
    v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:freeWhenDone:", v6, v11, 1);
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0FC8];
    v13[0] = CFSTR("socket read got no bytes");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NSMutableArray addObject:](self->_dataCache, "addObject:", v8);

  objc_sync_exit(v5);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataCacheSema);
}

- (void)endReadingIntoCache
{
  NSObject *dataCacheReadSource;
  OS_dispatch_source *v4;
  NSMutableArray *obj;

  obj = self->_dataCache;
  objc_sync_enter(obj);
  dataCacheReadSource = self->_dataCacheReadSource;
  if (dataCacheReadSource)
  {
    dispatch_source_cancel(dataCacheReadSource);
    v4 = self->_dataCacheReadSource;
    self->_dataCacheReadSource = 0;

  }
  -[NSMutableArray removeAllObjects](self->_dataCache, "removeAllObjects");
  objc_sync_exit(obj);

}

- (id)waitForDataFromReadCacheReturningError:(id *)a3
{
  NSMutableArray *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataCacheSema, 0xFFFFFFFFFFFFFFFFLL);
  v5 = self->_dataCache;
  objc_sync_enter(v5);
  -[NSMutableArray firstObject](self->_dataCache, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (a3)
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD0FC8];
      v12[0] = CFSTR("read queue empty");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_8;
  }
  -[NSMutableArray removeObjectAtIndex:](self->_dataCache, "removeObjectAtIndex:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a3)
    {
      v7 = 0;
      *a3 = objc_retainAutorelease(v6);
      goto LABEL_9;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v7 = v6;
LABEL_9:

  objc_sync_exit(v5);
  return v7;
}

- (id)waitForBlobDataFromReadCacheReturningError:(id *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  WLSocketHandler *v13;
  WLSocketHandler *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;

  v4 = 0;
  while (1)
  {
    v19 = 0;
    -[WLSocketHandler waitForDataFromReadCacheReturningError:](self, "waitForDataFromReadCacheReturningError:", &v19, v13, v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v19;
    v7 = v6;
    if (!v4)
      break;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    if (v7)
      goto LABEL_9;
    v8 = (void *)objc_msgSend(v4, "mutableCopy", self, v17);
    objc_msgSend(v8, "appendData:", v5);
    v9 = v8;

    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = objc_msgSend(v9, "length");

    objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
    v14 = self;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    v4 = v9;
LABEL_7:
    if ((objc_msgSend(v4, "wl_blobIsComplete", v14, v16) & 1) != 0)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    v13 = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

  }
  if (!v6)
  {
    v4 = v5;
    goto LABEL_7;
  }
LABEL_9:
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  v4 = 0;
LABEL_12:

  return v4;
}

- (BOOL)waitForCommand:(id)a3 fromReadCacheReturningError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WLSocketHandler waitForMessageFromReadCacheReturningError:](self, "waitForMessageFromReadCacheReturningError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 && *a4 || !v7)
    goto LABEL_9;
  if (objc_msgSend(v7, "type") != 1)
  {
    objc_msgSend(v8, "type");
LABEL_9:
    _WLLog();
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v8, "command");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v6);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v8, "command");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected '%@' but got '%@' instead"), v6, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BEC2878];
      v18 = *MEMORY[0x24BDD0FC8];
      v19[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 1, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    _WLLog();

    goto LABEL_10;
  }
  v11 = 1;
  _WLLog();
LABEL_11:

  return v11;
}

- (id)waitForMessageFromReadCacheReturningError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[WLSocketHandler waitForDataFromReadCacheReturningError:](self, "waitForDataFromReadCacheReturningError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    +[WLSocketMessage messageWithData:error:](WLSocketMessage, "messageWithData:error:", v4, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 && !*a3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected data but got no data instead"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = *MEMORY[0x24BEC2878];
      v11 = *MEMORY[0x24BDD0FC8];
      v12[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 1, v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    _WLLog();
    v5 = 0;
  }

  return v5;
}

+ (id)_commandStringWithData:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  v9 = (void *)objc_msgSend(v5, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, v8, 4, 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\r\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "hasSuffix:", v10);

  if ((_DWORD)v7)
  {
    objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v9, "length") - 2, 2, &stru_24E376E00);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  return v9;
}

- (void)writeBytes:(const void *)a3 length:(unint64_t)a4 toSocket:(int)a5 completion:(id)a6
{
  -[WLSocketHandler _writeBytes:offset:length:toSocket:completion:](self, "_writeBytes:offset:length:toSocket:completion:", a3, 0, a4, *(_QWORD *)&a5, a6);
}

- (void)_writeBytes:(const void *)a3 offset:(unint64_t)a4 length:(unint64_t)a5 toSocket:(int)a6 completion:(id)a7
{
  void (**v12)(id, uint64_t, _QWORD);
  ssize_t v13;
  unint64_t v14;
  dispatch_source_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  dispatch_source_t v22;
  WLSocketHandler *v23;
  void (**v24)(id, uint64_t, _QWORD);
  const void *v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v12 = (void (**)(id, uint64_t, _QWORD))a7;
  v13 = write(a6, a3, a5);
  if (v13 == a5)
  {
    if (v12)
      v12[2](v12, 1, 0);
  }
  else if (v13 < 0)
  {
    if (v12)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = *MEMORY[0x24BEC2878];
      v29 = *MEMORY[0x24BDD0FC8];
      v30[0] = CFSTR("Socket write failed");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 1, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v12)[2](v12, 0, v20);

    }
  }
  else
  {
    v14 = v13 + a4;
    v15 = dispatch_source_create(MEMORY[0x24BDACA30], a6, 0, MEMORY[0x24BDAC9B8]);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __65__WLSocketHandler__writeBytes_offset_length_toSocket_completion___block_invoke;
    v21[3] = &unk_24E376520;
    v22 = v15;
    v23 = self;
    v25 = a3;
    v26 = v14;
    v27 = a5;
    v28 = a6;
    v24 = v12;
    v16 = v15;
    dispatch_source_set_event_handler(v16, v21);
    dispatch_resume(v16);

  }
}

uint64_t __65__WLSocketHandler__writeBytes_offset_length_toSocket_completion___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_writeBytes:offset:length:toSocket:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 48));
}

- (void)sendCommand:(id)a3 toSocket:(int)a4 completion:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\r\n"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51__WLSocketHandler_sendCommand_toSocket_completion___block_invoke;
  v14[3] = &unk_24E375C80;
  v15 = v8;
  v13 = v8;
  -[WLSocketHandler writeBytes:length:toSocket:completion:](self, "writeBytes:length:toSocket:completion:", v11, v12, v5, v14);

}

uint64_t __51__WLSocketHandler_sendCommand_toSocket_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)sendData:(id)a3 toSocket:(int)a4 completion:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = objc_retainAutorelease(a3);
  v10 = objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__WLSocketHandler_sendData_toSocket_completion___block_invoke;
  v13[3] = &unk_24E376548;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  -[WLSocketHandler writeBytes:length:toSocket:completion:](self, "writeBytes:length:toSocket:completion:", v10, v11, v5, v13);

}

void __48__WLSocketHandler_sendData_toSocket_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    v5 = v7;
  }
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "endReadingIntoCache", v5);
    v5 = v7;
  }

}

- (void)cancel
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = self->_dataCache;
  objc_sync_enter(v3);
  -[NSMutableArray removeAllObjects](self->_dataCache, "removeAllObjects");
  v4 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0FC8];
  v8[0] = CFSTR("SocketHandler is canceled.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_dataCache, "addObject:", v6);
  objc_sync_exit(v3);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataCacheSema);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataCacheSema, 0);
  objc_storeStrong((id *)&self->_dataCacheReadSource, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
}

@end

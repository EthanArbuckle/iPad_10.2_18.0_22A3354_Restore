@implementation IMXMLStreamOperation

+ (id)operationWithURL:(id)a3 parseDelegate:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:parseDelegate:", a3, a4);
}

- (IMXMLStreamOperation)initWithURL:(id)a3 parseDelegate:(id)a4
{
  IMXMLStreamOperation *v6;

  v6 = -[IMXMLStreamOperation init](self, "init");
  if (v6)
  {
    v6->_url = (NSURL *)objc_msgSend(a3, "copy");
    v6->_delegate = (NSXMLParserDelegate *)a4;
    v6->_dataBuffer = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    CFStreamCreateBoundPair(0, (CFReadStreamRef *)&v6->_readStream, (CFWriteStreamRef *)&v6->_writeStream, 4096);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMXMLStreamOperation;
  -[IMXMLStreamOperation dealloc](&v3, sel_dealloc);
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)_startRunLoop
{
  void *v3;
  NSInputStream *readStream;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *global_queue;
  void *v9;
  void *v10;
  _QWORD block[5];

  v3 = (void *)objc_opt_new();
  readStream = self->_readStream;
  v5 = objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v6 = *MEMORY[0x1E0C99748];
  -[NSInputStream scheduleInRunLoop:forMode:](readStream, "scheduleInRunLoop:forMode:", v5, *MEMORY[0x1E0C99748]);
  -[NSOutputStream scheduleInRunLoop:forMode:](self->_writeStream, "scheduleInRunLoop:forMode:", objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop"), v6);
  -[NSOutputStream setDelegate:](self->_writeStream, "setDelegate:", self);
  -[NSInputStream open](self->_readStream, "open");
  -[NSOutputStream open](self->_writeStream, "open");
  v7 = objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", self->_url);
  self->_urlConnection = (NSURLConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39A0]), "initWithRequest:delegate:", v7, self);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__IMXMLStreamOperation__startRunLoop__block_invoke;
  block[3] = &unk_1E54D0FA0;
  block[4] = self;
  dispatch_async(global_queue, block);
  if (self->_isExecuting)
  {
    do
    {
      v9 = (void *)objc_opt_new();
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      LODWORD(v10) = objc_msgSend(v10, "runMode:beforeDate:", v6, objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 2.0));
      objc_msgSend(v9, "drain");
    }
    while ((_DWORD)v10 && self->_isExecuting);
  }
  objc_msgSend(v3, "drain");
}

uint64_t __37__IMXMLStreamOperation__startRunLoop__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithStream:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));
  objc_msgSend(v2, "setShouldResolveExternalEntities:", 0);
  objc_msgSend(v2, "setShouldProcessNamespaces:", 1);
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312));
  objc_msgSend(v2, "parse");

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isExecuting"));
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isFinished"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 248) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 249) = 1;
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isExecuting"));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)start
{
  NSThread *v3;

  if (!-[IMXMLStreamOperation isCancelled](self, "isCancelled"))
  {
    -[IMXMLStreamOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_isExecuting = 1;
    -[IMXMLStreamOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    v3 = (NSThread *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", self, sel__startRunLoop, 0);
    self->_runloopThread = v3;
    -[NSThread start](v3, "start");
  }
}

- (void)writeToStream
{
  NSInteger v3;

  if (-[NSMutableData length](self->_dataBuffer, "length"))
  {
    v3 = -[NSOutputStream write:maxLength:](self->_writeStream, "write:maxLength:", -[NSMutableData bytes](self->_dataBuffer, "bytes"), -[NSMutableData length](self->_dataBuffer, "length"));
    if (v3 == -1)
      return;
    -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataBuffer, "replaceBytesInRange:withBytes:length:", 0, v3, 0, 0);
  }
  if (self->_finishedDownloadingData && !-[NSMutableData length](self->_dataBuffer, "length"))
    -[NSInputStream close](self->_readStream, "close");
}

- (id)connection:(id)a3 willCacheResponse:(id)a4
{
  return 0;
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  self->_finishedDownloadingData = 1;
  -[IMXMLStreamOperation writeToStream](self, "writeToStream", a3, a4);
}

- (void)connectionDidFinishLoading:(id)a3
{
  self->_finishedDownloadingData = 1;
  -[IMXMLStreamOperation writeToStream](self, "writeToStream", a3);
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  -[NSMutableData appendData:](self->_dataBuffer, "appendData:", a4);
  -[IMXMLStreamOperation writeToStream](self, "writeToStream");
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  if (a4 == 4)
  {
    if (self->_finishedDownloadingData && !-[NSMutableData length](self->_dataBuffer, "length", a3))
      -[NSInputStream close](self->_readStream, "close");
    else
      -[IMXMLStreamOperation writeToStream](self, "writeToStream", a3);
  }
}

- (NSXMLParserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NSXMLParserDelegate *)a3;
}

@end

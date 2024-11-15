@implementation UploadDataStream

- (UploadDataStream)initWithLength:(unint64_t)a3 andThroughputDelegate:(id)a4
{
  id v7;
  UploadDataStream *v8;
  UploadDataStream *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *callBackQueue;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UploadDataStream;
  v8 = -[UploadDataStream init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->remainingLength = a3;
    v8->status = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.networkQuality.uploadDataStreamCallBackQueue", v10);
    callBackQueue = v9->callBackQueue;
    v9->callBackQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_tputDelegate, a4);
    v9->stalling = 0;
  }

  return v9;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  unint64_t remainingLength;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  UploadDataStream *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->remainingLength >= a4)
    remainingLength = a4;
  else
    remainingLength = self->remainingLength;
  -[ThroughputDelegate lastUpdate](self->_tputDelegate, "lastUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memset(a3, 114, remainingLength);
  self->remainingLength -= remainingLength;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v7);
  v10 = v9;

  if (v10 > 0.4)
  {
    if (!self->stalling)
    {
      netqual_log_init();
      v11 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315650;
        v14 = "-[UploadDataStream read:maxLength:]";
        v15 = 1024;
        v16 = 67;
        v17 = 2112;
        v18 = self;
        _os_log_impl(&dword_20E622000, v11, OS_LOG_TYPE_DEFAULT, "%s:%u - Stalling upload stream %@", (uint8_t *)&v13, 0x1Cu);
      }
    }
    self->stalling = 1;
  }

  return remainingLength;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return self->remainingLength && !self->stalling;
}

- (void)signalProgress
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  UploadDataStream *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->stalling)
  {
    -[UploadDataStream delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      netqual_log_init();
      v4 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = "-[UploadDataStream signalProgress]";
        v8 = 1024;
        v9 = 88;
        v10 = 2112;
        v11 = self;
        _os_log_impl(&dword_20E622000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Signaling HasBytesAvailable on %@", (uint8_t *)&v6, 0x1Cu);
      }
      -[UploadDataStream delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stream:handleEvent:", self, 2);

      self->stalling = 0;
    }
  }
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (id)delegate
{
  return self->_delegate;
}

- (void)open
{
  NSObject *callBackQueue;
  _QWORD block[5];

  self->status = 2;
  callBackQueue = self->callBackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__UploadDataStream_open__block_invoke;
  block[3] = &unk_24C9764D0;
  block[4] = self;
  dispatch_async(callBackQueue, block);
}

void __24__UploadDataStream_open__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stream:handleEvent:", *(_QWORD *)(a1 + 32), 1);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stream:handleEvent:", *(_QWORD *)(a1 + 32), 2);

  }
}

- (void)close
{
  self->status = 6;
}

- (id)streamError
{
  return 0;
}

- (unint64_t)streamStatus
{
  return self->status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tputDelegate, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->callBackQueue, 0);
}

@end

@implementation AppleTypeCRetimerIICFifo

+ (id)getDeviceNames
{
  return IICGetDeviceNamesWithPrefix(CFSTR("atcrtu"));
}

- (AppleTypeCRetimerIICFifo)initWithDeviceHandle:(id)a3 queueLabelSuffix:(id)a4
{
  id v6;
  id v7;
  AppleTypeCRetimerIICFifo *v8;
  os_log_t v9;
  OS_os_log *log;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  AppleTypeCRetimerFifoQueue *v17;
  AppleTypeCRetimerFifoQueue *txQueue;
  void *v19;
  uint64_t v20;
  NSString *name;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AppleTypeCRetimerIICFifo;
  v8 = -[AppleTypeCRetimerIICBase initWithDeviceHandle:](&v23, sel_initWithDeviceHandle_, v6);
  if (v8)
  {
    v9 = os_log_create("com.apple.accessoryupdater.atcrt", "uarp");
    log = v8->_log;
    v8->_log = (OS_os_log *)v9;

    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("com.apple.%@.fifo.%@"), v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_retainAutorelease(v13);
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v15;

    v17 = objc_alloc_init(AppleTypeCRetimerFifoQueue);
    txQueue = v8->_txQueue;
    v8->_txQueue = v17;

    objc_msgSend(v6, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v20;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[AppleTypeCRetimerIICFifo stopPollingforReceiveData](self, "stopPollingforReceiveData");
  v3.receiver = self;
  v3.super_class = (Class)AppleTypeCRetimerIICFifo;
  -[AppleTypeCRetimerIICFifo dealloc](&v3, sel_dealloc);
}

- (void)updateTransmitFifoSpace
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v3 = -[AppleTypeCRetimerIICFifo readRegister:buffer:length:](self, "readRegister:buffer:length:", 22, &v8, 4);
  if (v3)
  {
    v4 = v3;
    self->_txFifoSpace = 0;
    v9 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: Error reading from register %s(%x)"), "-[AppleTypeCRetimerIICFifo updateTransmitFifoSpace]", "ATCRT_REG_FIFO_STATUS", 22);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerIICFifo transferError:](self, "transferError:", v7);

  }
  else
  {
    self->_txFifoSpace = HIWORD(v8);
  }
}

- (void)drainTransmitQueue
{
  unint64_t v3;
  unint64_t txFifoSpace;
  uint64_t v5;
  id v6;
  int v7;
  unint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (self->_started)
  {
    if (-[AppleTypeCRetimerFifoQueue length](self->_txQueue, "length"))
    {
      if (self->_txFifoSpace
        || (-[AppleTypeCRetimerIICFifo updateTransmitFifoSpace](self, "updateTransmitFifoSpace"), self->_txFifoSpace))
      {
        while (-[AppleTypeCRetimerFifoQueue length](self->_txQueue, "length"))
        {
          v3 = -[AppleTypeCRetimerFifoQueue length](self->_txQueue, "length");
          txFifoSpace = self->_txFifoSpace;
          if (v3 < txFifoSpace)
            txFifoSpace = -[AppleTypeCRetimerFifoQueue length](self->_txQueue, "length");
          if (txFifoSpace >= 0x7D)
            v5 = 125;
          else
            v5 = txFifoSpace;
          -[AppleTypeCRetimerFifoQueue dequeueDataOfLength:](self->_txQueue, "dequeueDataOfLength:", v5);
          v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v7 = -[AppleTypeCRetimerIICFifo writeRegister:buffer:length:](self, "writeRegister:buffer:length:", 20, objc_msgSend(v6, "bytes"), v5);
          if (v7)
          {
            v9 = v7;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: Error writing to register %s(%x)"), "-[AppleTypeCRetimerIICFifo drainTransmitQueue]", "ATCRT_REG_FIFO_TX", 20, *MEMORY[0x24BDD0FC8]);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v15[0] = v10;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], v9, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(WeakRetained, "appleTypeCRetimerIICFifoTransferError:error:", self, v12);

            return;
          }
          v8 = self->_txFifoSpace - v5;
          self->_txFifoSpace = v8;
          if (!v8)
            -[AppleTypeCRetimerIICFifo updateTransmitFifoSpace](self, "updateTransmitFifoSpace");

          if (!self->_txFifoSpace)
            return;
        }
      }
    }
  }
}

- (void)writeData:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__AppleTypeCRetimerIICFifo_writeData___block_invoke;
  block[3] = &unk_251CE3B18;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __38__AppleTypeCRetimerIICFifo_writeData___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "enqueueData:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "drainTransmitQueue");
}

- (unsigned)getAvailableReceiveDataLength
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  int v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v3 = -[AppleTypeCRetimerIICFifo readRegister:buffer:length:](self, "readRegister:buffer:length:", 22, &v11, 4);
  if (!v3)
    return v11;
  v4 = v3;
  v12 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: Error reading from register %s(%x)"), "-[AppleTypeCRetimerIICFifo getAvailableReceiveDataLength]", "ATCRT_REG_FIFO_STATUS", 22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "appleTypeCRetimerIICFifoTransferError:error:", self, v7);

  return 0;
}

- (void)pollForReceiveData
{
  int v3;
  unsigned __int16 v4;
  void *v5;
  size_t v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[AppleTypeCRetimerIICFifo getAvailableReceiveDataLength](self, "getAvailableReceiveDataLength");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      v6 = v4 >= 0x7Eu ? 126 : v4;
      v7 = malloc_type_calloc(v6, 1uLL, 0xF4E90DB1uLL);
      v8 = -[AppleTypeCRetimerIICFifo readRegister:buffer:length:](self, "readRegister:buffer:length:", 21, v7, v6);
      if (v8)
        break;
      objc_msgSend(v5, "appendBytes:length:", v7, v6);
      free(v7);
      v9 = -[AppleTypeCRetimerIICFifo getAvailableReceiveDataLength](self, "getAvailableReceiveDataLength");
      v4 = v9;
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AppleTypeCRetimerIICFifo receivedData:](self, "receivedData:", v10);

        goto LABEL_10;
      }
    }
    v11 = v8;
    free(v7);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: Error reading from register %s(%x)"), "-[AppleTypeCRetimerIICFifo pollForReceiveData]", "ATCRT_REG_FIFO_RX", 21, *MEMORY[0x24BDD0FC8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerIICFifo transferError:](self, "transferError:", v14);

LABEL_10:
  }
}

- (void)startPollingForReceiveData
{
  OS_dispatch_source *v3;
  OS_dispatch_source *pollingTimerSource;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_pollingTimerSource)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
    pollingTimerSource = self->_pollingTimerSource;
    self->_pollingTimerSource = v3;

    objc_initWeak(&location, self);
    v5 = self->_pollingTimerSource;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__AppleTypeCRetimerIICFifo_startPollingForReceiveData__block_invoke;
    v7[3] = &unk_251CE3B68;
    objc_copyWeak(&v8, &location);
    dispatch_source_set_event_handler(v5, v7);
    v6 = dispatch_time(0, 5000000);
    dispatch_source_set_timer((dispatch_source_t)self->_pollingTimerSource, v6, 0x4C4B40uLL, 0xF4240uLL);
    dispatch_resume((dispatch_object_t)self->_pollingTimerSource);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __54__AppleTypeCRetimerIICFifo_startPollingForReceiveData__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pollForReceiveData");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "drainTransmitQueue");

}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__AppleTypeCRetimerIICFifo_start__block_invoke;
  block[3] = &unk_251CE3B90;
  block[4] = self;
  dispatch_sync(queue, block);
}

_BYTE *__33__AppleTypeCRetimerIICFifo_start__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[72])
  {
    result = (_BYTE *)objc_msgSend(result, "startPollingForReceiveData");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  }
  return result;
}

- (void)stopPollingforReceiveData
{
  NSObject *pollingTimerSource;
  OS_dispatch_source *v4;

  pollingTimerSource = self->_pollingTimerSource;
  if (pollingTimerSource)
  {
    dispatch_source_cancel(pollingTimerSource);
    v4 = self->_pollingTimerSource;
    self->_pollingTimerSource = 0;

  }
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__AppleTypeCRetimerIICFifo_stop__block_invoke;
  block[3] = &unk_251CE3B90;
  block[4] = self;
  dispatch_sync(queue, block);
}

_BYTE *__32__AppleTypeCRetimerIICFifo_stop__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[72])
  {
    result = (_BYTE *)objc_msgSend(result, "stopPollingforReceiveData");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  }
  return result;
}

- (id)getDelegateQueue
{
  OS_dispatch_queue *delegateQueue;

  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    return delegateQueue;
  dispatch_get_global_queue(0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)transferError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AppleTypeCRetimerIICFifo stopPollingforReceiveData](self, "stopPollingforReceiveData");
  -[AppleTypeCRetimerIICFifo getDelegateQueue](self, "getDelegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__AppleTypeCRetimerIICFifo_transferError___block_invoke;
  v7[3] = &unk_251CE3B18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __42__AppleTypeCRetimerIICFifo_transferError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(WeakRetained, "appleTypeCRetimerIICFifoTransferError:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)receivedData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AppleTypeCRetimerIICFifo getDelegateQueue](self, "getDelegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__AppleTypeCRetimerIICFifo_receivedData___block_invoke;
  v7[3] = &unk_251CE3B18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __41__AppleTypeCRetimerIICFifo_receivedData___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(WeakRetained, "appleTypeCRetimerIICFifo:receivedData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)startPacketDumperWithBloodhoundDumper:(id)a3
{
  id v4;
  AppleTypeCRetimerFifoDumper *v5;
  AppleTypeCRetimerFifoDumper *dumper;

  v4 = a3;
  v5 = -[AppleTypeCRetimerFifoDumper initWithBloodhoundDumper:]([AppleTypeCRetimerFifoDumper alloc], "initWithBloodhoundDumper:", v4);

  dumper = self->_dumper;
  self->_dumper = v5;

}

- (BOOL)checkReady
{
  int v3;
  int v4;
  NSObject *log;
  char v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;

  v23 = 0;
  v3 = -[AppleTypeCRetimerIICFifo readRegister:buffer:length:](self, "readRegister:buffer:length:", 23, &v23, 1);
  if (v3)
  {
    v4 = v3;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerIICFifo checkReady].cold.3((uint64_t)self, v4, log);
    return 0;
  }
  v6 = v23;
  v7 = (v23 & 1) == 0;
  if ((v23 & 1) != 0)
  {
    v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerIICFifo checkReady].cold.2((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
    v6 = v23;
  }
  if ((v6 & 2) != 0)
  {
    v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerIICFifo checkReady].cold.1((uint64_t)self, v15, v16, v17, v18, v19, v20, v21);
    return 0;
  }
  return v7;
}

- (int)readRegister:(unsigned __int8)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  uint64_t v7;
  id v9;
  AppleTypeCRetimerFifoDumper *dumper;
  void *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleTypeCRetimerIICFifo;
  v9 = (id)-[AppleTypeCRetimerIICBase readRegister:buffer:length:](&v13, sel_readRegister_buffer_length_);
  dumper = self->_dumper;
  if (dumper)
  {
    if ((_DWORD)v9)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      dumper = self->_dumper;
    }
    -[AppleTypeCRetimerFifoDumper dumpAccessForRegisterAddress:ioReturn:data:](dumper, "dumpAccessForRegisterAddress:ioReturn:data:", v7, v9, v11);

  }
  return (int)v9;
}

- (int)writeRegister:(unsigned __int8)a3 buffer:(const void *)a4 length:(unsigned int)a5
{
  uint64_t v7;
  id v9;
  void *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AppleTypeCRetimerIICFifo;
  v9 = (id)-[AppleTypeCRetimerIICBase writeRegister:buffer:length:](&v12, sel_writeRegister_buffer_length_);
  if (self->_dumper)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerFifoDumper dumpAccessForRegisterAddress:ioReturn:data:](self->_dumper, "dumpAccessForRegisterAddress:ioReturn:data:", v7, v9, v10);

  }
  return (int)v9;
}

- (AppleTypeCRetimerIICFifoDelegate)delegate
{
  return (AppleTypeCRetimerIICFifoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_dumper, 0);
  objc_storeStrong((id *)&self->_pollingTimerSource, 0);
  objc_storeStrong((id *)&self->_txQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)checkReady
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 80);
  v4 = 138412546;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  _os_log_error_impl(&dword_24BC99000, log, OS_LOG_TYPE_ERROR, "%@: Failed to read FIFO error register (0x%08x)", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_3();
}

@end

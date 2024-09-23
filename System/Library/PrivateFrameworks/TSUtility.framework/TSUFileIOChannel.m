@implementation TSUFileIOChannel

- (TSUFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6
{
  unsigned int v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_fd_t v14;
  dispatch_fd_t v15;
  NSObject *v16;
  OS_dispatch_io *v17;
  OS_dispatch_io *channel;
  TSUFileIOChannel *v19;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD cleanup_handler[4];
  dispatch_fd_t v27;
  objc_super v28;

  v6 = a6;
  v10 = a4;
  v11 = v10;
  if (v10
    && objc_msgSend(v10, "isFileURL")
    && (v28.receiver = self,
        v28.super_class = (Class)TSUFileIOChannel,
        (self = -[TSUFileIOChannel init](&v28, sel_init)) != 0))
  {
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if ((a5 & 0x400) != 0)
        unlink((const char *)objc_msgSend(objc_retainAutorelease(v12), "fileSystemRepresentation"));
      v14 = TSUOpen(v13, a5, v6);
      if (v14 < 0)
      {
        v21 = __error();
        strerror(*v21);
        TSULogErrorInFunction((uint64_t)"-[TSUFileIOChannel initWithType:URL:oflag:mode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m", 58, (uint64_t)CFSTR("Error opening file at path %@: %s"), v22, v23, v24, v25, (uint64_t)v13);
      }
      else
      {
        v15 = v14;
        dispatch_get_global_queue(0, 0);
        v16 = objc_claimAutoreleasedReturnValue();
        cleanup_handler[0] = MEMORY[0x24BDAC760];
        cleanup_handler[1] = 3221225472;
        cleanup_handler[2] = __48__TSUFileIOChannel_initWithType_URL_oflag_mode___block_invoke;
        cleanup_handler[3] = &__block_descriptor_36_e8_v12__0i8l;
        v27 = v15;
        v17 = (OS_dispatch_io *)dispatch_io_create(a3, v15, v16, cleanup_handler);
        channel = self->_channel;
        self->_channel = v17;

      }
    }
    if (!self->_channel)
    {

      self = 0;
    }
    self = self;

    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __48__TSUFileIOChannel_initWithType_URL_oflag_mode___block_invoke(uint64_t a1, int a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  close(*(_DWORD *)(a1 + 32));
  if (a2)
  {
    v3 = strerror(a2);
    TSULogErrorInFunction((uint64_t)"-[TSUFileIOChannel initWithType:URL:oflag:mode:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m", 52, (uint64_t)CFSTR("Error creating dispatch channel: %s"), v4, v5, v6, v7, (uint64_t)v3);
  }
}

- (id)initForReadingURL:(id)a3
{
  return -[TSUFileIOChannel initWithType:URL:oflag:mode:](self, "initWithType:URL:oflag:mode:", 1, a3, 0, 0);
}

- (id)initForStreamWritingURL:(id)a3
{
  return -[TSUFileIOChannel initWithType:URL:oflag:mode:](self, "initWithType:URL:oflag:mode:", 0, a3, 1537, 420);
}

- (id)initForRandomWritingURL:(id)a3
{
  return -[TSUFileIOChannel initWithType:URL:oflag:mode:](self, "initWithType:URL:oflag:mode:", 1, a3, 1537, 420);
}

- (TSUFileIOChannel)initWithType:(unint64_t)a3 channel:(id)a4
{
  NSObject *v6;
  TSUFileIOChannel *v7;
  NSObject *v8;
  dispatch_io_t v9;
  OS_dispatch_io *channel;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TSUFileIOChannel;
  v7 = -[TSUFileIOChannel init](&v12, sel_init);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_io_create_with_io(a3, v6, v8, &__block_literal_global_8);
    channel = v7->_channel;
    v7->_channel = (OS_dispatch_io *)v9;

    if (!v7->_channel)
    {

      v7 = 0;
    }
  }

  return v7;
}

void __41__TSUFileIOChannel_initWithType_channel___block_invoke(int a1, int __errnum)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (__errnum)
  {
    v2 = strerror(__errnum);
    TSULogErrorInFunction((uint64_t)"-[TSUFileIOChannel initWithType:channel:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m", 102, (uint64_t)CFSTR("Error creating dispatch channel: %s"), v3, v4, v5, v6, (uint64_t)v2);
  }
}

- (id)createRandomAccessChannel
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_isClosed)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel createRandomAccessChannel]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 121, CFSTR("Channel is closed"));

  }
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:channel:", 1, self->_channel);
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *channel;
  id v16;
  _QWORD io_handler[4];
  id v18;

  v10 = a5;
  v11 = a6;
  if (self->_isClosed)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel readFromOffset:length:queue:handler:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 128, CFSTR("Channel is closed"));

  }
  channel = self->_channel;
  io_handler[0] = MEMORY[0x24BDAC760];
  io_handler[1] = 3221225472;
  io_handler[2] = __56__TSUFileIOChannel_readFromOffset_length_queue_handler___block_invoke;
  io_handler[3] = &unk_24D61BAC8;
  v18 = v11;
  v16 = v11;
  dispatch_io_read(channel, a3, a4, v10, io_handler);

}

void __56__TSUFileIOChannel_readFromOffset_length_queue_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  id v7;

  v7 = a3;
  if ((_DWORD)a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_IOReadErrorWithErrno:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  -[TSUFileIOChannel readFromOffset:length:queue:handler:](self, "readFromOffset:length:queue:handler:", 0, -1, a3, a4);
}

- (void)writeData:(id)a3 queue:(id)a4 handler:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *channel;
  id v15;
  _QWORD io_handler[4];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_isClosed)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel writeData:queue:handler:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 143, CFSTR("Channel is closed"));

  }
  channel = self->_channel;
  io_handler[0] = MEMORY[0x24BDAC760];
  io_handler[1] = 3221225472;
  io_handler[2] = __44__TSUFileIOChannel_writeData_queue_handler___block_invoke;
  io_handler[3] = &unk_24D61BAC8;
  v17 = v10;
  v15 = v10;
  dispatch_io_write(channel, 0, v8, v9, io_handler);

}

void __44__TSUFileIOChannel_writeData_queue_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  id v7;

  v7 = a3;
  if ((_DWORD)a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_IOWriteErrorWithErrno:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)writeData:(id)a3 offset:(int64_t)a4 queue:(id)a5 handler:(id)a6
{
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *channel;
  id v17;
  _QWORD io_handler[4];
  id v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (self->_isClosed)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel writeData:offset:queue:handler:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 154, CFSTR("Channel is closed"));

  }
  channel = self->_channel;
  io_handler[0] = MEMORY[0x24BDAC760];
  io_handler[1] = 3221225472;
  io_handler[2] = __51__TSUFileIOChannel_writeData_offset_queue_handler___block_invoke;
  io_handler[3] = &unk_24D61BAC8;
  v19 = v12;
  v17 = v12;
  dispatch_io_write(channel, a4, v10, v11, io_handler);

}

void __51__TSUFileIOChannel_writeData_offset_queue_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  id v7;

  v7 = a3;
  if ((_DWORD)a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_IOWriteErrorWithErrno:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)close
{
  dispatch_io_close((dispatch_io_t)self->_channel, 0);
  self->_isClosed = 1;
}

- (void)setLowWater:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (self->_isClosed)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel setLowWater:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 171, CFSTR("Channel is closed"));

  }
  dispatch_io_set_low_water((dispatch_io_t)self->_channel, a3);
}

- (void)addBarrier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  dispatch_block_t barrier;

  barrier = a3;
  if (self->_isClosed)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel addBarrier:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 178, CFSTR("Channel is closed"));

  }
  dispatch_io_barrier((dispatch_io_t)self->_channel, barrier);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
}

@end

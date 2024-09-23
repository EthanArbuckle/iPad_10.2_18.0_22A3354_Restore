@implementation TSUFileIOChannel

- (TSUFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6 error:(id *)a7 cleanupHandler:(id)a8
{
  unsigned int v10;
  id v14;
  void (**v15)(id, uint64_t);
  TSUFileIOChannel *v16;
  TSUFileIOChannel *v17;
  void (**v18)(id, uint64_t);
  id v19;
  const char *v20;
  dispatch_fd_t v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *ioQueue;
  NSObject *v24;
  dispatch_io_t v25;
  OS_dispatch_io *channel;
  void *v27;
  TSUFileIOChannel *v28;
  int *v30;
  id v31;
  void (**v32)(void *, _QWORD);
  _QWORD cleanup_handler[4];
  void (**v34)(id, uint64_t);
  dispatch_fd_t v35;
  _QWORD aBlock[4];
  void (**v37)(id, uint64_t);
  _QWORD *v38;
  _QWORD v39[3];
  char v40;
  objc_super v41;

  v10 = a6;
  v14 = a4;
  v15 = (void (**)(id, uint64_t))a8;
  if (!v14 || (objc_msgSend(v14, "isFileURL") & 1) == 0)
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", 2, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v15)
      v15[2](v15, 2);
    goto LABEL_19;
  }
  v41.receiver = self;
  v41.super_class = (Class)TSUFileIOChannel;
  v16 = -[TSUFileIOChannel init](&v41, sel_init);
  if (!v16)
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", 12, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v15)
      v15[2](v15, 12);
    self = 0;
LABEL_19:
    v28 = 0;
    goto LABEL_20;
  }
  v17 = v16;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__TSUFileIOChannel_initWithType_URL_oflag_mode_error_cleanupHandler___block_invoke;
  aBlock[3] = &unk_24F39BCA8;
  v38 = v39;
  v18 = v15;
  v37 = v18;
  v32 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(v14, "path");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = (const char *)objc_msgSend(v19, "fileSystemRepresentation");

  if (v20)
  {
    if ((a5 & 0x400) != 0)
      unlink(v20);
    v21 = open(v20, a5, v10);
    if (v21 < 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (TSUDefaultCat_init_token != -1)
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_5_0);
      v30 = __error();
      v32[2](v32, *v30);
      goto LABEL_24;
    }
    v22 = dispatch_queue_create("TSUFileIOChannel.IO", 0);
    ioQueue = v17->_ioQueue;
    v17->_ioQueue = (OS_dispatch_queue *)v22;

    v24 = v17->_ioQueue;
    cleanup_handler[0] = MEMORY[0x24BDAC760];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __69__TSUFileIOChannel_initWithType_URL_oflag_mode_error_cleanupHandler___block_invoke_2;
    cleanup_handler[3] = &unk_24F39BCF0;
    v35 = v21;
    v34 = v18;
    v25 = dispatch_io_create(a3, v21, v24, cleanup_handler);
    channel = v17->_channel;
    v17->_channel = (OS_dispatch_io *)v25;

  }
  v27 = 0;
LABEL_24:
  if (!v17->_channel)
  {
    if (a7)
    {
      if (v27)
      {
        *a7 = objc_retainAutorelease(v27);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", 2, 0);
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a7 = v31;

      }
    }
    v32[2](v32, 2);

    v17 = 0;
  }
  self = v17;

  _Block_object_dispose(v39, 8);
  v28 = self;
LABEL_20:

  return v28;
}

uint64_t __69__TSUFileIOChannel_initWithType_URL_oflag_mode_error_cleanupHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    result = *(_QWORD *)(result + 32);
    if (result)
    {
      result = (*(uint64_t (**)(void))(result + 16))();
      v1 = *(_QWORD *)(*(_QWORD *)(v2 + 40) + 8);
    }
    *(_BYTE *)(v1 + 24) = 1;
  }
  return result;
}

uint64_t __69__TSUFileIOChannel_initWithType_URL_oflag_mode_error_cleanupHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  close(*(_DWORD *)(a1 + 40));
  if ((_DWORD)a2 && TSUDefaultCat_init_token != -1)
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_25);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __69__TSUFileIOChannel_initWithType_URL_oflag_mode_error_cleanupHandler___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __69__TSUFileIOChannel_initWithType_URL_oflag_mode_error_cleanupHandler___block_invoke_4()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (id)initForReadingURL:(id)a3 error:(id *)a4
{
  return -[TSUFileIOChannel initForReadingURL:error:cleanupHandler:](self, "initForReadingURL:error:cleanupHandler:", a3, a4, 0);
}

- (id)initForReadingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return -[TSUFileIOChannel initWithType:URL:oflag:mode:error:cleanupHandler:](self, "initWithType:URL:oflag:mode:error:cleanupHandler:", 1, a3, 0, 0, a4, a5);
}

- (id)initForReadingDescriptor:(int)a3 queue:(id)a4 cleanupHandler:(id)a5
{
  return -[TSUFileIOChannel initWithType:descriptor:queue:cleanupHandler:](self, "initWithType:descriptor:queue:cleanupHandler:", 1, *(_QWORD *)&a3, a4, a5);
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4
{
  return -[TSUFileIOChannel initForStreamWritingURL:error:cleanupHandler:](self, "initForStreamWritingURL:error:cleanupHandler:", a3, a4, 0);
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return -[TSUFileIOChannel initWithType:URL:oflag:mode:error:cleanupHandler:](self, "initWithType:URL:oflag:mode:error:cleanupHandler:", 0, a3, 1537, 420, a4, a5);
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4
{
  return -[TSUFileIOChannel initForRandomWritingURL:error:cleanupHandler:](self, "initForRandomWritingURL:error:cleanupHandler:", a3, a4, 0);
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return -[TSUFileIOChannel initWithType:URL:oflag:mode:error:cleanupHandler:](self, "initWithType:URL:oflag:mode:error:cleanupHandler:", 1, a3, 1537, 420, a4, a5);
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4
{
  return -[TSUFileIOChannel initForRandomReadingWritingURL:error:cleanupHandler:](self, "initForRandomReadingWritingURL:error:cleanupHandler:", a3, a4, 0);
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return -[TSUFileIOChannel initWithType:URL:oflag:mode:error:cleanupHandler:](self, "initWithType:URL:oflag:mode:error:cleanupHandler:", 1, a3, 514, 420, a4, a5);
}

- (TSUFileIOChannel)initWithType:(unint64_t)a3 descriptor:(int)a4 queue:(id)a5 cleanupHandler:(id)a6
{
  NSObject *v10;
  id v11;
  TSUFileIOChannel *v12;
  TSUFileIOChannel *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *ioQueue;
  NSObject *v16;
  dispatch_io_t v17;
  OS_dispatch_io *channel;
  TSUFileIOChannel *v19;
  _QWORD cleanup_handler[4];
  NSObject *v22;
  id v23;
  _QWORD block[4];
  id v25;
  objc_super v26;

  v10 = a5;
  v11 = a6;
  v26.receiver = self;
  v26.super_class = (Class)TSUFileIOChannel;
  v12 = -[TSUFileIOChannel init](&v26, sel_init);
  if (v12)
  {
    v13 = v12;
    v14 = dispatch_queue_create("TSUFileIOChannel.IO", 0);
    ioQueue = v13->_ioQueue;
    v13->_ioQueue = (OS_dispatch_queue *)v14;

    v16 = v13->_ioQueue;
    cleanup_handler[0] = MEMORY[0x24BDAC760];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke_2;
    cleanup_handler[3] = &unk_24F39BD80;
    v23 = v11;
    v22 = v10;
    v17 = dispatch_io_create(a3, a4, v16, cleanup_handler);
    channel = v13->_channel;
    v13->_channel = (OS_dispatch_io *)v17;

    if (!v13->_channel)
    {

      v13 = 0;
    }
    v19 = v13;

  }
  else
  {
    if (v11)
    {
      if (v10)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke;
        block[3] = &unk_24F39B6C0;
        v25 = v11;
        dispatch_async(v10, block);

      }
      else
      {
        (*((void (**)(id, uint64_t))v11 + 2))(v11, 12);
      }
    }
    v19 = 0;
  }

  return v19;
}

uint64_t __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void (**v4)(_QWORD, _QWORD);
  NSObject *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD, _QWORD);
  int v8;

  if ((_DWORD)a2 && TSUDefaultCat_init_token != -1)
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_6_1);
  v4 = *(void (***)(_QWORD, _QWORD))(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    if (v5)
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke_4;
      v6[3] = &unk_24F39BD58;
      v7 = v4;
      v8 = a2;
      dispatch_async(v5, v6);

    }
    else
    {
      v4[2](v4, a2);
    }
  }
}

void __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

uint64_t __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)dealloc
{
  NSObject *channel;
  objc_super v4;

  if (!self->_isClosed)
  {
    channel = self->_channel;
    if (channel)
      dispatch_io_close(channel, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUFileIOChannel;
  -[TSUFileIOChannel dealloc](&v4, sel_dealloc);
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *ioQueue;
  NSObject *v12;
  OS_dispatch_queue **p_ioQueue;
  id v14;
  _QWORD io_handler[4];
  id v16;

  v8 = a5;
  if (self->_isClosed)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel readFromOffset:length:handler:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 199, 0, "Channel is closed");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  p_ioQueue = &self->_ioQueue;
  ioQueue = self->_ioQueue;
  v12 = p_ioQueue[1];
  io_handler[0] = MEMORY[0x24BDAC760];
  io_handler[1] = 3221225472;
  io_handler[2] = __50__TSUFileIOChannel_readFromOffset_length_handler___block_invoke;
  io_handler[3] = &unk_24F39BDA8;
  v16 = v8;
  v14 = v8;
  dispatch_io_read(v12, a3, a4, ioQueue, io_handler);

}

void __50__TSUFileIOChannel_readFromOffset_length_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  id v7;

  v7 = a3;
  if ((_DWORD)a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", a4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)readWithHandler:(id)a3
{
  -[TSUFileIOChannel readFromOffset:length:handler:](self, "readFromOffset:length:handler:", 0, -1, a3);
}

- (void)writeData:(id)a3 handler:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *ioQueue;
  NSObject *v11;
  OS_dispatch_queue **p_ioQueue;
  id v13;
  _QWORD io_handler[4];
  id v15;

  v6 = a3;
  v7 = a4;
  if (self->_isClosed)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel writeData:handler:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 212, 0, "Channel is closed");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  p_ioQueue = &self->_ioQueue;
  ioQueue = self->_ioQueue;
  v11 = p_ioQueue[1];
  io_handler[0] = MEMORY[0x24BDAC760];
  io_handler[1] = 3221225472;
  io_handler[2] = __38__TSUFileIOChannel_writeData_handler___block_invoke;
  io_handler[3] = &unk_24F39BDA8;
  v15 = v7;
  v13 = v7;
  dispatch_io_write(v11, 0, v6, ioQueue, io_handler);

}

void __38__TSUFileIOChannel_writeData_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  void *v6;
  id v7;

  v7 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], a4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)writeData:(id)a3 offset:(int64_t)a4 handler:(id)a5
{
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *ioQueue;
  NSObject *v13;
  OS_dispatch_queue **p_ioQueue;
  id v15;
  _QWORD io_handler[4];
  id v17;

  v8 = a3;
  v9 = a5;
  if (self->_isClosed)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel writeData:offset:handler:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 222, 0, "Channel is closed");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  p_ioQueue = &self->_ioQueue;
  ioQueue = self->_ioQueue;
  v13 = p_ioQueue[1];
  io_handler[0] = MEMORY[0x24BDAC760];
  io_handler[1] = 3221225472;
  io_handler[2] = __45__TSUFileIOChannel_writeData_offset_handler___block_invoke;
  io_handler[3] = &unk_24F39BDA8;
  v17 = v9;
  v15 = v9;
  dispatch_io_write(v13, a4, v8, ioQueue, io_handler);

}

void __45__TSUFileIOChannel_writeData_offset_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  void *v6;
  id v7;

  v7 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], a4, 0);
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
  if (!self->_isClosed)
    dispatch_io_close((dispatch_io_t)self->_channel, 0);
  self->_isClosed = 1;
}

- (void)setLowWater:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (self->_isClosed)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel setLowWater:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 239, 0, "Channel is closed");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  dispatch_io_set_low_water((dispatch_io_t)self->_channel, a3);
}

- (void)addBarrier:(id)a3
{
  void *v4;
  void *v5;
  dispatch_block_t barrier;

  barrier = a3;
  if (self->_isClosed)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel addBarrier:]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 245, 0, "Channel is closed");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  dispatch_io_barrier((dispatch_io_t)self->_channel, barrier);

}

- (void)flushWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *channel;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (self->_isClosed)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel flushWithCompletion:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 251, 0, "Channel is closed");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  channel = self->_channel;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__TSUFileIOChannel_flushWithCompletion___block_invoke;
  v9[3] = &unk_24F39BDD0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_io_barrier(channel, v9);

}

void __40__TSUFileIOChannel_flushWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_fd_t descriptor;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  descriptor = dispatch_io_get_descriptor(*(dispatch_io_t *)(*(_QWORD *)(a1 + 32) + 16));
  if (descriptor == -1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel flushWithCompletion:]_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 261, 0, "Channel is closed");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  else if (fsync(descriptor) == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v3 = 0;
LABEL_6:
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v7 = v3;
    (*(void (**)(void))(v6 + 16))();
    v3 = v7;
  }

}

- (void)truncateToLength:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *channel;
  id v10;
  _QWORD barrier[5];
  id v12;
  int64_t v13;

  v6 = a4;
  if (self->_isClosed)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel truncateToLength:completion:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 269, 0, "Channel is closed");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  channel = self->_channel;
  barrier[0] = MEMORY[0x24BDAC760];
  barrier[1] = 3221225472;
  barrier[2] = __48__TSUFileIOChannel_truncateToLength_completion___block_invoke;
  barrier[3] = &unk_24F39BDF8;
  v12 = v6;
  v13 = a3;
  barrier[4] = self;
  v10 = v6;
  dispatch_io_barrier(channel, barrier);

}

void __48__TSUFileIOChannel_truncateToLength_completion___block_invoke(_QWORD *a1)
{
  dispatch_fd_t descriptor;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  descriptor = dispatch_io_get_descriptor(*(dispatch_io_t *)(a1[4] + 16));
  if (descriptor == -1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileIOChannel truncateToLength:completion:]_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 279, 0, "Channel is closed");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  else if (ftruncate(descriptor, a1[6]) == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v3 = 0;
LABEL_6:
  v6 = a1[5];
  if (v6)
  {
    v7 = v3;
    (*(void (**)(void))(v6 + 16))();
    v3 = v7;
  }

}

- (BOOL)isValid
{
  dispatch_fd_t descriptor;
  char v4;

  if (self->_isClosed)
    return 0;
  descriptor = dispatch_io_get_descriptor((dispatch_io_t)self->_channel);
  v4 = 0;
  return read(descriptor, &v4, 0) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
}

@end

@implementation CRLFileIOChannel

- (CRLFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6 error:(id *)a7 cleanupHandler:(id)a8
{
  unsigned int v10;
  id v14;
  void (**v15)(id, uint64_t);
  CRLFileIOChannel *v16;
  void (**v17)(id, uint64_t);
  id v18;
  const char *v19;
  dispatch_fd_t v20;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *ioQueue;
  NSObject *v25;
  dispatch_io_t v26;
  OS_dispatch_io *channel;
  void *v28;
  CRLFileIOChannel *v29;
  id v31;
  void *v32;
  int *v33;
  char *v34;
  int *v35;
  id v36;
  _QWORD *v37;
  _QWORD cleanup_handler[4];
  void (**v39)(id, uint64_t);
  dispatch_fd_t v40;
  _QWORD v41[4];
  void (**v42)(id, uint64_t);
  _QWORD *v43;
  _QWORD v44[3];
  char v45;
  objc_super v46;
  uint8_t buf[32];

  v10 = a6;
  v14 = a4;
  v15 = (void (**)(id, uint64_t))a8;
  if (!v14 || (objc_msgSend(v14, "isFileURL") & 1) == 0)
  {
    if (a7)
      *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadPOSIXErrorWithNumber:userInfo:](NSError, "crl_fileReadPOSIXErrorWithNumber:userInfo:", 2, 0));
    if (v15)
      v15[2](v15, 2);
    goto LABEL_19;
  }
  v46.receiver = self;
  v46.super_class = (Class)CRLFileIOChannel;
  v16 = -[CRLFileIOChannel init](&v46, "init");
  if (!v16)
  {
    if (a7)
      *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadPOSIXErrorWithNumber:userInfo:](NSError, "crl_fileReadPOSIXErrorWithNumber:userInfo:", 12, 0));
    if (v15)
      v15[2](v15, 12);
    self = 0;
LABEL_19:
    v29 = 0;
    goto LABEL_20;
  }
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = 0;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100098C40;
  v41[3] = &unk_101232AF8;
  v43 = v44;
  v17 = v15;
  v42 = v17;
  v37 = objc_retainBlock(v41);
  v16->_oflag = a5;
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path")));
  v19 = (const char *)objc_msgSend(v18, "fileSystemRepresentation");

  if (v19)
  {
    if ((a5 & 0x400) != 0)
      unlink(v19);
    v20 = open(v19, a5, v10);
    if (v20 < 0)
    {
      v31 = +[NSError crl_fileReadPOSIXErrorWithNumber:userInfo:](NSError, "crl_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v31);
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_101232B60);
      v32 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
      {
        v33 = __error();
        v34 = strerror(*v33);
        sub_100DF1F34((uint64_t)v34, buf, (uint64_t)v19, (os_log_t)v32);
      }

      v35 = __error();
      ((void (*)(_QWORD *, _QWORD))v37[2])(v37, *v35);
      goto LABEL_26;
    }
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = dispatch_queue_create("CRLFileIOChannel.IO", v22);
    ioQueue = v16->_ioQueue;
    v16->_ioQueue = (OS_dispatch_queue *)v23;

    v25 = v16->_ioQueue;
    cleanup_handler[0] = _NSConcreteStackBlock;
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = sub_100098C8C;
    cleanup_handler[3] = &unk_101232B40;
    v40 = v20;
    v39 = v17;
    v26 = dispatch_io_create(a3, v20, v25, cleanup_handler);
    channel = v16->_channel;
    v16->_channel = (OS_dispatch_io *)v26;

  }
  v28 = 0;
LABEL_26:
  if (!v16->_channel)
  {
    if (a7)
    {
      if (v28)
      {
        *a7 = objc_retainAutorelease(v28);
      }
      else
      {
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadPOSIXErrorWithNumber:userInfo:](NSError, "crl_fileReadPOSIXErrorWithNumber:userInfo:", 2, 0)));
        *a7 = v36;

      }
    }
    ((void (*)(_QWORD *, uint64_t))v37[2])(v37, 2);

    v16 = 0;
  }
  self = v16;

  _Block_object_dispose(v44, 8);
  v29 = self;
LABEL_20:

  return v29;
}

- (id)initForReadingURL:(id)a3 error:(id *)a4
{
  return -[CRLFileIOChannel initForReadingURL:error:cleanupHandler:](self, "initForReadingURL:error:cleanupHandler:", a3, a4, 0);
}

- (id)initForReadingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return -[CRLFileIOChannel initWithType:URL:oflag:mode:error:cleanupHandler:](self, "initWithType:URL:oflag:mode:error:cleanupHandler:", 1, a3, 0, 0, a4, a5);
}

- (id)initForReadingDescriptor:(int)a3 cleanupHandler:(id)a4
{
  return -[CRLFileIOChannel initWithType:descriptor:cleanupHandler:](self, "initWithType:descriptor:cleanupHandler:", 1, *(_QWORD *)&a3, a4);
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4
{
  return -[CRLFileIOChannel initForStreamWritingURL:error:cleanupHandler:](self, "initForStreamWritingURL:error:cleanupHandler:", a3, a4, 0);
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return -[CRLFileIOChannel initWithType:URL:oflag:mode:error:cleanupHandler:](self, "initWithType:URL:oflag:mode:error:cleanupHandler:", 0, a3, 1537, 420, a4, a5);
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4
{
  return -[CRLFileIOChannel initForRandomWritingURL:error:cleanupHandler:](self, "initForRandomWritingURL:error:cleanupHandler:", a3, a4, 0);
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return -[CRLFileIOChannel initWithType:URL:oflag:mode:error:cleanupHandler:](self, "initWithType:URL:oflag:mode:error:cleanupHandler:", 1, a3, 1537, 420, a4, a5);
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4
{
  return -[CRLFileIOChannel initForRandomReadingWritingURL:error:cleanupHandler:](self, "initForRandomReadingWritingURL:error:cleanupHandler:", a3, a4, 0);
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return -[CRLFileIOChannel initWithType:URL:oflag:mode:error:cleanupHandler:](self, "initWithType:URL:oflag:mode:error:cleanupHandler:", 1, a3, 514, 420, a4, a5);
}

- (CRLFileIOChannel)initWithType:(unint64_t)a3 descriptor:(int)a4 cleanupHandler:(id)a5
{
  id v8;
  CRLFileIOChannel *v9;
  CRLFileIOChannel *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *ioQueue;
  NSObject *v15;
  dispatch_io_t v16;
  OS_dispatch_io *channel;
  CRLFileIOChannel *v18;
  _QWORD cleanup_handler[4];
  id v21;
  objc_super v22;

  v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CRLFileIOChannel;
  v9 = -[CRLFileIOChannel init](&v22, "init");
  if (v9)
  {
    v10 = v9;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("CRLFileIOChannel.IO", v12);
    ioQueue = v10->_ioQueue;
    v10->_ioQueue = (OS_dispatch_queue *)v13;

    v15 = v10->_ioQueue;
    cleanup_handler[0] = _NSConcreteStackBlock;
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = sub_100098F68;
    cleanup_handler[3] = &unk_101232BA8;
    v21 = v8;
    v16 = dispatch_io_create(a3, a4, v15, cleanup_handler);
    channel = v10->_channel;
    v10->_channel = (OS_dispatch_io *)v16;

    if (!v10->_channel)
    {

      v10 = 0;
    }
    v18 = v10;

  }
  else
  {
    if (v8)
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 12);
    v18 = 0;
  }

  return v18;
}

- (void)dealloc
{
  unsigned __int8 v3;
  NSObject *channel;
  objc_super v5;

  v3 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if ((v3 & 1) == 0)
  {
    channel = self->_channel;
    if (channel)
      dispatch_io_close(channel, 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLFileIOChannel;
  -[CRLFileIOChannel dealloc](&v5, "dealloc");
}

+ (BOOL)shouldFullFsyncOnClose
{
  unsigned __int8 v2;

  v2 = atomic_load(byte_101414CD5);
  return v2 & 1;
}

+ (void)setShouldFullFsyncOnClose:(BOOL)a3
{
  atomic_store(a3, byte_101414CD5);
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *ioQueue;
  NSObject *v14;
  OS_dispatch_queue **p_ioQueue;
  id v16;
  _QWORD io_handler[4];
  id v18;

  v8 = a5;
  v9 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if ((v9 & 1) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232BC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF2004();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232BE8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel readFromOffset:length:handler:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 213, 0, "Channel is closed");

  }
  p_ioQueue = &self->_ioQueue;
  ioQueue = self->_ioQueue;
  v14 = p_ioQueue[1];
  io_handler[0] = _NSConcreteStackBlock;
  io_handler[1] = 3221225472;
  io_handler[2] = sub_1000992E0;
  io_handler[3] = &unk_101232C10;
  v18 = v8;
  v16 = v8;
  dispatch_io_read(v14, a3, a4, ioQueue, io_handler);

}

- (void)readFromOffsetAndWait:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  +[CRLIOUtils readFromOffsetAndWait:offset:length:handler:](CRLIOUtils, "readFromOffsetAndWait:offset:length:handler:", self, a3, a4, a5);
}

- (void)readWithHandler:(id)a3
{
  -[CRLFileIOChannel readFromOffset:length:handler:](self, "readFromOffset:length:handler:", 0, -1, a3);
}

- (void)writeData:(id)a3 handler:(id)a4
{
  -[CRLFileIOChannel writeData:offset:handler:](self, "writeData:offset:handler:", a3, 0, a4);
}

- (void)writeData:(id)a3 offset:(int64_t)a4 handler:(id)a5
{
  NSObject *v8;
  id v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  size_t size;
  NSObject *ioQueue;
  NSObject *v17;
  OS_dispatch_queue **p_ioQueue;
  id v19;
  _QWORD io_handler[4];
  id v21;
  _QWORD *v22;
  size_t v23;
  _QWORD v24[4];

  v8 = a3;
  v9 = a5;
  v10 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if ((v10 & 1) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232C30);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF2084();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232C50);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel writeData:offset:handler:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 235, 0, "Channel is closed");

  }
  if (!v8)
  {
    v8 = &_dispatch_data_empty;
    v14 = &_dispatch_data_empty;
  }
  size = dispatch_data_get_size(v8);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  p_ioQueue = &self->_ioQueue;
  ioQueue = self->_ioQueue;
  v17 = p_ioQueue[1];
  io_handler[0] = _NSConcreteStackBlock;
  io_handler[1] = 3221225472;
  io_handler[2] = sub_100099618;
  io_handler[3] = &unk_101232C78;
  v22 = v24;
  v23 = size;
  v21 = v9;
  v19 = v9;
  dispatch_io_write(v17, a4, v8, ioQueue, io_handler);

  _Block_object_dispose(v24, 8);
}

- (void)close
{
  BOOL *p_isClosed;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *channel;
  NSObject *v10;
  _QWORD barrier[5];
  dispatch_semaphore_t v12;

  p_isClosed = &self->_isClosed;
  do
    v4 = __ldaxr((unsigned __int8 *)p_isClosed);
  while (__stlxr(1u, (unsigned __int8 *)p_isClosed));
  if ((v4 & 1) == 0)
  {
    if (self->_channel)
      goto LABEL_20;
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232C98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF2104();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232CB8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel close]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 259, 0, "invalid nil value for '%{public}s'", "_channel");

    if (self->_channel)
    {
LABEL_20:
      if (+[CRLFileIOChannel shouldFullFsyncOnClose](CRLFileIOChannel, "shouldFullFsyncOnClose"))
      {
        if ((self->_oflag & 3) != 0)
        {
          v8 = dispatch_semaphore_create(0);
          channel = self->_channel;
          barrier[0] = _NSConcreteStackBlock;
          barrier[1] = 3221225472;
          barrier[2] = sub_10009994C;
          barrier[3] = &unk_10122D3D8;
          barrier[4] = self;
          v12 = v8;
          v10 = v8;
          dispatch_io_barrier(channel, barrier);
          dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

        }
      }
      dispatch_io_close((dispatch_io_t)self->_channel, 0);
    }
  }
}

- (void)readWithHandlerAndWait:(id)a3
{
  +[CRLIOUtils readWithHandlerAndWait:handler:](CRLIOUtils, "readWithHandlerAndWait:handler:", self, a3);
}

- (void)setLowWater:(unint64_t)a3
{
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if ((v5 & 1) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232D38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF231C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232D58);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel setLowWater:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 291, 0, "Channel is closed");

  }
  dispatch_io_set_low_water((dispatch_io_t)self->_channel, a3);
}

- (void)addBarrier:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if ((v5 & 1) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232D78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF239C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232D98);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel addBarrier:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 297, 0, "Channel is closed");

  }
  dispatch_io_barrier((dispatch_io_t)self->_channel, v4);

}

- (void)flushWithCompletion:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *channel;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if ((v5 & 1) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232DB8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF241C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232DD8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel flushWithCompletion:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 303, 0, "Channel is closed");

  }
  channel = self->_channel;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009A17C;
  v11[3] = &unk_101231F00;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_io_barrier(channel, v11);

}

- (void)truncateToLength:(int64_t)a3 completion:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *channel;
  id v12;
  _QWORD barrier[5];
  id v14;
  int64_t v15;

  v6 = a4;
  v7 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if ((v7 & 1) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232E38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF251C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232E58);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel truncateToLength:completion:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 321, 0, "Channel is closed");

  }
  channel = self->_channel;
  barrier[0] = _NSConcreteStackBlock;
  barrier[1] = 3221225472;
  barrier[2] = sub_10009A598;
  barrier[3] = &unk_1012313C0;
  v14 = v6;
  v15 = a3;
  barrier[4] = self;
  v12 = v6;
  dispatch_io_barrier(channel, barrier);

}

- (BOOL)isValid
{
  unsigned __int8 v2;
  dispatch_fd_t descriptor;
  char v5;

  v2 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if ((v2 & 1) != 0)
    return 0;
  descriptor = dispatch_io_get_descriptor((dispatch_io_t)self->_channel);
  v5 = 0;
  return read(descriptor, &v5, 0) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
}

@end

@implementation PFDUrlHandler

+ (void)_accessHostMap:(id)a3
{
  id v3;
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_543320);
  if (!qword_543328)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (void *)qword_543328;
    qword_543328 = (uint64_t)v3;

  }
  v5[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_543320);

}

+ (unint64_t)registerHost:(id)a3 bookRootURL:(id)a4 withDRMContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1BF054;
  v16[3] = &unk_42B2C0;
  v11 = v8;
  v17 = v11;
  v12 = v10;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(a1, "_accessHostMap:", v16);
  v14 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v14;
}

+ (unint64_t)unregisterHost:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1BF194;
  v7[3] = &unk_42B2E8;
  v4 = a3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(a1, "_accessHostMap:", v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (id)_assetInfoForHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1BF2DC;
  v16 = sub_1BF2EC;
  v17 = 0;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1BF2F4;
    v9[3] = &unk_42B310;
    v11 = &v12;
    v10 = v4;
    objc_msgSend(a1, "_accessHostMap:", v9);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

+ (id)_mimeTypeForURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pathExtension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithFilenameExtension:](UTType, "typeWithFilenameExtension:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredMIMEType"));

  return v5;
}

+ (id)_assetInfoForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  off_t st_size;
  stat v23;
  char v24[4096];

  v4 = a3;
  v5 = (void *)objc_opt_class(PFDUrlHandler);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_assetInfoForHost:", v6));

  objc_msgSend(v7, "setRequestedURL:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookRootURL"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookRootURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByStandardizingPath"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookRootURL"));
    v16 = objc_msgSend(v14, "bc_doesFolderAtURL:containFileAtURL:", v15, v11);

    if (objc_msgSend(v13, "hasSuffix:", CFSTR("AppleClasses/AppleWidget.js")))
    {
      v17 = THBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pathForResource:ofType:", CFSTR("AppleWidgetController"), CFSTR("js")));

      v16 = &dword_0 + 1;
      v13 = (void *)v19;
    }
    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(v7, "setAssetIsInsideBookRootPath:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_mimeTypeForURL:", v4));
      objc_msgSend(v7, "setMimeType:", v20);

      if (objc_msgSend(v13, "getFileSystemRepresentation:maxLength:", v24, 4094))
      {
        memset(&v23, 0, sizeof(v23));
        if (lstat(v24, &v23))
          st_size = 0;
        else
          st_size = v23.st_size;
      }
      else
      {
        st_size = 0;
      }
      objc_msgSend(v7, "setFileSize:", st_size);
      objc_msgSend(v7, "setPath:", v13);
    }

  }
  return v7;
}

- (PFDUrlHandler)initWithQueueMode:(unint64_t)a3 requestScope:(id)a4
{
  id v7;
  PFDUrlHandler *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *readQueue;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PFDUrlHandler;
  v8 = -[PFDUrlHandler init](&v14, "init");
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("PFDUrlHandler.readQueue", v10);
    readQueue = v8->_readQueue;
    v8->_readQueue = (OS_dispatch_queue *)v11;

    v8->_mode = a3;
    objc_storeStrong((id *)&v8->_requestScope, a4);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[PFDUrlHandler _cleanupDispatchIO](self, "_cleanupDispatchIO");
  v3.receiver = self;
  v3.super_class = (Class)PFDUrlHandler;
  -[PFDUrlHandler dealloc](&v3, "dealloc");
}

+ (NSArray)supportedSchemes
{
  const __CFString *v3;

  v3 = CFSTR("x-ibooks-th");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (void)loadRequest:(id)a3
{
  id v3;
  _QWORD v4[4];
  PFDUrlHandler *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1BF808;
  v4[3] = &unk_426D80;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PFDUrlHandler _runBlockOnAppropriateQueue:](v5, "_runBlockOnAppropriateQueue:", v4);

}

- (void)stopLoading
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1BF9B0;
  v2[3] = &unk_426D30;
  v2[4] = self;
  -[PFDUrlHandler _runBlockOnAppropriateQueue:](self, "_runBlockOnAppropriateQueue:", v2);
}

- (void)_runBlockOnAppropriateQueue:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void (**v6)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_mode == 1)
  {
    v6 = v4;
    dispatch_async((dispatch_queue_t)self->_readQueue, v4);
LABEL_5:
    v5 = v6;
    goto LABEL_6;
  }
  if (v4)
  {
    v6 = v4;
    v4[2](v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_cleanupDispatchIO
{
  NSObject *readDispatchIO;
  OS_dispatch_io *v4;

  readDispatchIO = self->_readDispatchIO;
  if (readDispatchIO)
  {
    dispatch_io_close(readDispatchIO, 1uLL);
    v4 = self->_readDispatchIO;
    self->_readDispatchIO = 0;

  }
}

- (void)_resetForNewLoad
{
  -[PFDUrlHandler _cleanupDispatchIO](self, "_cleanupDispatchIO");
  self->_delegateMessageFlags = 0;
}

- (void)_maybeSendDidReceiveResponse:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  if ((*(_BYTE *)&self->_delegateMessageFlags & 1) == 0)
  {
    v4 = a3;
    v5 = objc_alloc((Class)NSURLResponse);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestedURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mimeType"));
    v8 = objc_msgSend(v4, "fileSize");

    v9 = objc_msgSend(v5, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v6, v7, v8, 0);
    -[PFDUrlHandler _sendDidReceiveResponse:](self, "_sendDidReceiveResponse:", v9);

  }
}

- (void)_sendErrorForErrorCode:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, a3, 0));
  -[PFDUrlHandler _sendDidFailWithError:](self, "_sendDidFailWithError:", v4);

}

- (void)_sendSingleDataResponse:(id)a3 mimeType:(id)a4 requestedURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)NSURLResponse), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v8, v9, objc_msgSend(v10, "length"), 0);

  -[PFDUrlHandler _sendDidReceiveResponse:](self, "_sendDidReceiveResponse:", v11);
  -[PFDUrlHandler _sendDidReceiveData:](self, "_sendDidReceiveData:", v10);

  -[PFDUrlHandler _sendDidFinish](self, "_sendDidFinish");
}

- (void)_sendSmallFileForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
    v15 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataWithContentsOfURL:error:", v7, &v15));
    v11 = v15;

    v12 = v11 == 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v7));
    v12 = 1;
  }

  if (v12 && v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mimeType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestedURL"));
    -[PFDUrlHandler _sendSingleDataResponse:mimeType:requestedURL:](self, "_sendSingleDataResponse:mimeType:requestedURL:", v10, v13, v14);

  }
  else
  {
    -[PFDUrlHandler _sendErrorForErrorCode:](self, "_sendErrorForErrorCode:", -1008);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)_sendLargeFileForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  OS_dispatch_io *v11;
  OS_dispatch_io *readDispatchIO;
  NSObject *v13;
  id v14;
  NSObject *readQueue;
  _QWORD io_handler[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v4 = a3;
  -[PFDUrlHandler _cleanupDispatchIO](self, "_cleanupDispatchIO");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v20 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "agSuxzs6g5UyvRU64xGP:error:", v6, &v20));
  v8 = v20;

  if (v8)
  {
    -[PFDUrlHandler _sendErrorForErrorCode:](self, "_sendErrorForErrorCode:", -1008);
  }
  else
  {
    v9 = +[ft9cupR7u6OrU4m1pyhB dataChunkSize](ft9cupR7u6OrU4m1pyhB, "dataChunkSize");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path")));
    v11 = (OS_dispatch_io *)dispatch_io_create_with_path(0, (const char *)objc_msgSend(v10, "UTF8String"), 0, 0, (dispatch_queue_t)self->_readQueue, &stru_42B350);
    readDispatchIO = self->_readDispatchIO;
    self->_readDispatchIO = v11;

    dispatch_io_set_high_water((dispatch_io_t)self->_readDispatchIO, (size_t)v9);
    dispatch_io_set_low_water((dispatch_io_t)self->_readDispatchIO, (size_t)v9);
    v13 = self->_readDispatchIO;
    v14 = objc_msgSend(v4, "fileSize");
    readQueue = self->_readQueue;
    io_handler[0] = _NSConcreteStackBlock;
    io_handler[1] = 3221225472;
    io_handler[2] = sub_1BFF90;
    io_handler[3] = &unk_42B3A0;
    io_handler[4] = self;
    v17 = v4;
    v18 = v7;
    v19 = v9;
    dispatch_io_read(v13, 0, (size_t)v14, readQueue, io_handler);

  }
}

- (void)_sendDidReceiveResponse:(id)a3
{
  id v4;
  id v5;

  if ((*(_BYTE *)&self->_delegateMessageFlags & 1) == 0)
  {
    *(_BYTE *)&self->_delegateMessageFlags |= 1u;
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PFDUrlHandler delegate](self, "delegate"));
    objc_msgSend(v5, "urlHandler:didReceiveResponse:", self, v4);

  }
}

- (void)_sendDidReceiveData:(id)a3
{
  id v4;
  id v5;

  if ((*(_BYTE *)&self->_delegateMessageFlags & 6) == 0)
  {
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PFDUrlHandler delegate](self, "delegate"));
    objc_msgSend(v5, "urlHandler:didReceiveData:", self, v4);

  }
}

- (void)_sendDidFinish
{
  id v3;

  if ((*(_BYTE *)&self->_delegateMessageFlags & 6) == 0)
  {
    *(_BYTE *)&self->_delegateMessageFlags |= 4u;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[PFDUrlHandler delegate](self, "delegate"));
    objc_msgSend(v3, "urlHandlerDidFinish:", self);

  }
}

- (void)_sendDidFailWithError:(id)a3
{
  id v4;
  id v5;

  if ((*(_BYTE *)&self->_delegateMessageFlags & 6) == 0)
  {
    *(_BYTE *)&self->_delegateMessageFlags |= 2u;
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PFDUrlHandler delegate](self, "delegate"));
    objc_msgSend(v5, "urlHandler:didFailWithError:", self, v4);

  }
}

- (PFDUrlHandlerDelegate)delegate
{
  return (PFDUrlHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (OS_dispatch_io)readDispatchIO
{
  return self->_readDispatchIO;
}

- (void)setReadDispatchIO:(id)a3
{
  objc_storeStrong((id *)&self->_readDispatchIO, a3);
}

- (OS_dispatch_queue)readQueue
{
  return self->_readQueue;
}

- (void)setReadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_readQueue, a3);
}

- (PFDURLRequestScope)requestScope
{
  return self->_requestScope;
}

- (void)setRequestScope:(id)a3
{
  objc_storeStrong((id *)&self->_requestScope, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestScope, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_readDispatchIO, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

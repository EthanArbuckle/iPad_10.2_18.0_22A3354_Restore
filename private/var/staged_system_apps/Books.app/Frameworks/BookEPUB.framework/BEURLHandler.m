@implementation BEURLHandler

- (BEURLHandler)initWithQueueMode:(unint64_t)a3 cacheItem:(id)a4
{
  id v7;
  BEURLHandler *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *readQueue;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *imageFilterQueue;
  objc_super v20;

  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BEURLHandler;
  v8 = -[BEURLHandler init](&v20, "init");
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("BEURLHandler.readQueue", v10);
    readQueue = v8->_readQueue;
    v8->_readQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_create("BEURLHandler.ImageFilterQueue", v16);
    imageFilterQueue = v8->_imageFilterQueue;
    v8->_imageFilterQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v8->_cacheItem, a4);
    v8->_mode = a3;
  }

  return v8;
}

- (void)dealloc
{
  NSObject *readDispatchIO;
  BEURLHandler *v4;
  OS_dispatch_io *v5;
  objc_super v6;

  readDispatchIO = self->_readDispatchIO;
  if (readDispatchIO)
  {
    v4 = self;
    dispatch_io_close(readDispatchIO, 1uLL);
    v5 = self->_readDispatchIO;
    self->_readDispatchIO = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)BEURLHandler;
  -[BEURLHandler dealloc](&v6, "dealloc");
}

+ (id)testingDelegate
{
  id WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_3C1B10);
  WeakRetained = objc_loadWeakRetained(&qword_3C1B08);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_3C1B10);
  return WeakRetained;
}

+ (void)setTestingDelegate:(id)a3
{
  id v3;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_3C1B10);
  objc_storeWeak(&qword_3C1B08, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_3C1B10);
}

+ (NSArray)supportedSchemes
{
  _QWORD v3[2];

  v3[0] = CFSTR("ibooks");
  v3[1] = CFSTR("ibooksimg");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
}

- (void)loadRequest:(id)a3
{
  id v4;
  unint64_t mode;
  NSObject *readQueue;
  id v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  mode = self->_mode;
  readQueue = self->_readQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_24DD4;
  v10[3] = &unk_378390;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  if (mode == 1)
  {
    dispatch_async(readQueue, v10);
  }
  else
  {
    v8 = objc_retainBlock(v10);
    v9 = v8;
    if (v8)
      ((void (*)(_QWORD *))v8[2])(v8);

  }
}

- (void)stopLoading
{
  unint64_t mode;
  NSObject *readQueue;
  _QWORD *v5;
  void *v6;
  _QWORD block[5];

  mode = self->_mode;
  readQueue = self->_readQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_266B0;
  block[3] = &unk_3783B8;
  block[4] = self;
  if (mode == 1)
  {
    dispatch_async(readQueue, block);
  }
  else
  {
    v5 = objc_retainBlock(block);
    v6 = v5;
    if (v5)
      ((void (*)(_QWORD *))v5[2])(v5);

  }
}

- (BOOL)_shouldSendSVGForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestedURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
  if (objc_msgSend(CFSTR("ibooks"), "compare:options:", v5, 1))
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mimeType"));
    if (objc_msgSend(v7, "length"))
    {
      v8 = v7;
      v9 = BESupportedImageMimeTypes();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v6 = objc_msgSend(v10, "containsObject:", v8);

    }
    else
    {
      v6 = BEDoesURLPointToAnImageFile(v4);
    }

  }
  return v6;
}

- (BOOL)_shouldSendUpdatediBooksJSForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v28;
  id v29;
  id v30;

  v3 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestedURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));

  if (!objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("ibooks.js"))
    || !objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("ibook.js")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sinfData"));

    if (v8)
    {
      LOBYTE(v29) = 0;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sinfData"));
      v30 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[ft9cupR7u6OrU4m1pyhB pK0gFZ9QOdm17E9p9cpP:sinfData:refetch:error:](ft9cupR7u6OrU4m1pyhB, "pK0gFZ9QOdm17E9p9cpP:sinfData:refetch:error:", v9, v10, &v29, &v30));
      v12 = v30;

      if ((_BYTE)v29)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
        +[ft9cupR7u6OrU4m1pyhB _8g0aKpBRl5gIBvODdOy7:completion:](ft9cupR7u6OrU4m1pyhB, "_8g0aKpBRl5gIBvODdOy7:completion:", v13, 0);

      }
      if (v12)
      {
        v7 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v14));

    }
    v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v11, 4);
    if (objc_msgSend(v15, "length"))
    {
      v29 = 0;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("iBooks?.VERSION[ ]*=[ ]*'([0-9]+)\\.([0-9]+)';"),
                        0,
                        &v29));
      v12 = v29;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "matchesInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
      v18 = v17;
      if (v17
        && (v19 = objc_msgSend(v17, "rangeAtIndex:", 1),
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringWithRange:", v19, v20)),
            v22 = objc_msgSend(v21, "integerValue"),
            v21,
            (uint64_t)v22 <= 1))
      {
        v23 = objc_msgSend(v18, "rangeAtIndex:", 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringWithRange:", v23, v24));
        v26 = objc_msgSend(v25, "integerValue");

        v7 = (uint64_t)v26 <= 4;
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v12 = 0;
      v7 = 0;
    }

    goto LABEL_18;
  }
  v7 = 0;
LABEL_19:

  objc_autoreleasePoolPop(v4);
  return v7;
}

- (BEURLHandlerDelegate)delegate
{
  return (BEURLHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (BEProtocolCacheItem)cacheItem
{
  return self->_cacheItem;
}

- (void)setCacheItem:(id)a3
{
  objc_storeStrong((id *)&self->_cacheItem, a3);
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

- (OS_dispatch_queue)imageFilterQueue
{
  return self->_imageFilterQueue;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSMutableData)pendingRangeRequestedData
{
  return self->_pendingRangeRequestedData;
}

- (void)setPendingRangeRequestedData:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRangeRequestedData, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingRangeRequestedData, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_imageFilterQueue, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_readDispatchIO, 0);
  objc_storeStrong((id *)&self->_cacheItem, 0);
}

@end

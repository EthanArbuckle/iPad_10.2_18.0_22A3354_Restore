@implementation ASKLoadImageResourceOperation

+ (NSURLSession)URLSession
{
  if (URLSession_onceToken != -1)
    dispatch_once(&URLSession_onceToken, &__block_literal_global);
  return (NSURLSession *)(id)URLSession_URLSession;
}

void __43__ASKLoadImageResourceOperation_URLSession__block_invoke(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
  v7 = CFSTR("User-Agent");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSUserAgent userAgentForProcessInfo:](AMSUserAgent, "userAgentForProcessInfo:", v2));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v1, "setHTTPAdditionalHeaders:", v4);

  v5 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v1));
  v6 = (void *)URLSession_URLSession;
  URLSession_URLSession = v5;

}

+ (OS_dispatch_queue)dataConsumerQueue
{
  if (dataConsumerQueue_onceToken != -1)
    dispatch_once(&dataConsumerQueue_onceToken, &__block_literal_global_10);
  return (OS_dispatch_queue *)(id)dataConsumerQueue_dataConsumerQueue;
}

void __50__ASKLoadImageResourceOperation_dataConsumerQueue__block_invoke(id a1)
{
  dispatch_queue_attr_t v1;
  NSObject *v2;
  dispatch_queue_attr_t v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *attr;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_UNSPECIFIED, 0);
  attr = objc_claimAutoreleasedReturnValue(v3);

  v4 = dispatch_queue_create("ShelfKit.LoadImageResourceOperation.dataConsumerQueue", attr);
  v5 = (void *)dataConsumerQueue_dataConsumerQueue;
  dataConsumerQueue_dataConsumerQueue = (uint64_t)v4;

}

- (ASKLoadImageResourceOperation)initWithURLRequest:(id)a3 URLSession:(id)a4 dataConsumer:(id)a5 dataConsumerQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ASKLoadImageResourceOperation *v14;
  void *v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSURLSessionDataTask *task;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint8_t v25[8];
  _QWORD v26[4];
  id v27[2];
  id location;
  objc_super v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)ASKLoadImageResourceOperation;
  v14 = -[ASKLoadImageResourceOperation init](&v29, "init");
  if (v14)
  {
    objc_initWeak(&location, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
    v16 = (char *)objc_msgSend(v15, "hash");

    if (!v16)
    {
      v17 = _MTLogCategoryArtworkDownload();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v16 = (char *)os_signpost_id_generate(v18);

    }
    v14->_signpostID = (unint64_t)v16;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __94__ASKLoadImageResourceOperation_initWithURLRequest_URLSession_dataConsumer_dataConsumerQueue___block_invoke;
    v26[3] = &unk_372680;
    v27[1] = v16;
    objc_copyWeak(v27, &location);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v10, v26));
    task = v14->_task;
    v14->_task = (NSURLSessionDataTask *)v19;

    v21 = _MTLogCategoryArtworkDownload();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = v22;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v23, OS_SIGNPOST_EVENT, (os_signpost_id_t)v16, "ASKLoadImageResourceOperation task created", ", v25, 2u);
    }

    objc_storeStrong((id *)&v14->_dataConsumer, a5);
    objc_storeStrong((id *)&v14->_dataConsumerQueue, a6);
    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __94__ASKLoadImageResourceOperation_initWithURLRequest_URLSession_dataConsumer_dataConsumerQueue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  id WeakRetained;
  uint8_t v15[16];

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = _MTLogCategoryArtworkDownload();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 40);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_END, v13, "ASKLoadImageResourceOperation", ", v15, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didFinishTaskWithData:response:error:", v9, v8, v7);

}

- (ASKLoadImageResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  ASKLoadImageResourceOperation *v14;

  v6 = a4;
  v7 = a3;
  v9 = objc_msgSend((id)objc_opt_class(self, v8), "URLSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12 = objc_msgSend((id)objc_opt_class(self, v11), "dataConsumerQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = -[ASKLoadImageResourceOperation initWithURLRequest:URLSession:dataConsumer:dataConsumerQueue:](self, "initWithURLRequest:URLSession:dataConsumer:dataConsumerQueue:", v7, v10, v6, v13);

  return v14;
}

- (void)didFinishTaskWithData:(id)a3 response:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  ASKLoadImageResourceOperation *v14;
  id v15;

  v7 = a3;
  v8 = a5;
  -[ASKLoadImageResourceOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  v9 = objc_claimAutoreleasedReturnValue(-[ASKLoadImageResourceOperation dataConsumerQueue](self, "dataConsumerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __70__ASKLoadImageResourceOperation_didFinishTaskWithData_response_error___block_invoke;
  block[3] = &unk_3726A8;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

  -[ASKLoadImageResourceOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

void __70__ASKLoadImageResourceOperation_didFinishTaskWithData_response_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataConsumer"));
    v5 = *(_QWORD *)(a1 + 32);
    v10 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForData:error:", v5, &v10));
    v7 = v10;

    if (v7)
    {
      v8 = 0;
      v9 = v7;
    }
    else
    {
      v8 = v6;
      v9 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "didCompleteWithResource:error:", v8, v9);

  }
  else
  {
    objc_msgSend(v2, "didCompleteWithResource:error:", 0, *(_QWORD *)(a1 + 48));
  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("isCancelled"), 0);
}

- (BOOL)isExecuting
{
  BOOL v3;
  void *v4;

  if ((-[ASKLoadImageResourceOperation isCancelled](self, "isCancelled") & 1) != 0)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadImageResourceOperation task](self, "task"));
  v3 = objc_msgSend(v4, "state") == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("isCancelled"), CFSTR("isExecuting"), 0);
}

- (BOOL)isFinished
{
  BOOL v3;
  void *v4;

  if ((-[ASKLoadImageResourceOperation isCancelled](self, "isCancelled") & 1) != 0)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadImageResourceOperation task](self, "task"));
  v3 = objc_msgSend(v4, "state") == (char *)&dword_0 + 3;

  return v3;
}

- (void)setQueuePriority:(int64_t)a3
{
  __int128 v5;
  unint64_t v6;
  int v7;
  void *v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASKLoadImageResourceOperation;
  -[ASKLoadImageResourceOperation setQueuePriority:](&v10, "setQueuePriority:");
  *((_QWORD *)&v5 + 1) = a3;
  *(_QWORD *)&v5 = a3 + 8;
  v6 = (v5 >> 2) - 1;
  if (v6 > 3)
    v7 = 1045220557;
  else
    v7 = dword_2E89C0[v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadImageResourceOperation task](self, "task"));
  LODWORD(v9) = v7;
  objc_msgSend(v8, "setPriority:", v9);

}

- (void)start
{
  void *v3;
  char *v4;
  __int128 v5;
  unint64_t v6;
  int v7;
  void *v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t signpostID;
  void *v14;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadImageResourceOperation task](self, "task"));
  v4 = (char *)objc_msgSend(v3, "state");

  if ((-[ASKLoadImageResourceOperation isCancelled](self, "isCancelled") & 1) == 0
    && v4 != (_BYTE *)&dword_0 + 2)
  {
    if (v4 == (_BYTE *)&dword_0 + 1)
    {
      -[ASKLoadImageResourceOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
      *((_QWORD *)&v5 + 1) = -[ASKLoadImageResourceOperation queuePriority](self, "queuePriority");
      *(_QWORD *)&v5 = *((_QWORD *)&v5 + 1) + 8;
      v6 = (v5 >> 2) - 1;
      if (v6 > 3)
        v7 = 1045220557;
      else
        v7 = dword_2E89C0[v6];
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadImageResourceOperation task](self, "task"));
      LODWORD(v9) = v7;
      objc_msgSend(v8, "setPriority:", v9);

      v10 = _MTLogCategoryArtworkDownload();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = v11;
      signpostID = self->_signpostID;
      if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "ASKLoadImageResourceOperation", ", buf, 2u);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadImageResourceOperation task](self, "task"));
      objc_msgSend(v14, "resume");

      -[ASKLoadImageResourceOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    }
    else
    {
      NSLog(CFSTR("*** Warning, %s called multiple times on %@"), "-[ASKLoadImageResourceOperation start]", self);
    }
  }
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadImageResourceOperation task](self, "task"));
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)ASKLoadImageResourceOperation;
  -[ASKLoadImageResourceOperation cancel](&v4, "cancel");
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (ASKResourceDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (OS_dispatch_queue)dataConsumerQueue
{
  return self->_dataConsumerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataConsumerQueue, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end

@implementation CLQueuedNSURLSession

- (CLQueuedNSURLSession)init
{
  -[CLQueuedNSURLSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLQueuedNSURLSession)initWithMaxTasks:(unint64_t)a3 usingDelegate:(id)a4 withSessionConfiguration:(id)a5 andProxiedSessionDelegate:(id)a6 andSessionDelegateQueue:(id)a7
{
  unsigned int v10;
  id v12;
  id v13;
  id v14;
  CLQueuedNSURLSession *v15;
  CLQueuedNSURLSession *v16;
  NSMutableArray *v17;
  NSMutableArray *requestQueue;
  id v19;
  uint64_t v20;
  NSURLSession *session;
  CLQueuedNSURLSession *v22;
  objc_super v24;
  id location;

  v10 = a3;
  v12 = a4;
  v13 = a5;
  objc_initWeak(&location, a6);
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CLQueuedNSURLSession;
  v15 = -[CLQueuedNSURLSession init](&v24, "init");
  v16 = v15;
  if (v15)
  {
    v15->_maxOutstandingTasks = v10;
    v15->_outstandingTasks = 0;
    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    requestQueue = v16->_requestQueue;
    v16->_requestQueue = v17;

    objc_storeWeak((id *)&v16->_delegate, v12);
    v19 = objc_loadWeakRetained(&location);
    objc_storeWeak(&v16->_proxiedDelegate, v19);

    v20 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v13, v16, v14));
    session = v16->_session;
    v16->_session = (NSURLSession *)v20;

    v22 = v16;
  }

  objc_destroyWeak(&location);
  return v16;
}

- (void)resumeRequestIfAllowedOrEnqueue:(id)a3
{
  CLQueuedNSURLSession *v4;
  unsigned int outstandingTasks;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  outstandingTasks = v4->_outstandingTasks;
  if (outstandingTasks >= v4->_maxOutstandingTasks)
  {
    -[NSMutableArray addObject:](v4->_requestQueue, "addObject:", v9);
  }
  else
  {
    v4->_outstandingTasks = outstandingTasks + 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLQueuedNSURLSession session](v4, "session"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "downloadTaskWithSession:", v6));

    objc_msgSend(v7, "resume");
    WeakRetained = objc_loadWeakRetained((id *)&v4->_delegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "session:didResumeRequest:withRemainingRequests:") & 1) != 0)
      objc_msgSend(WeakRetained, "session:didResumeRequest:withRemainingRequests:", v4, v9, -[NSMutableArray count](v4->_requestQueue, "count"));

  }
  objc_sync_exit(v4);

}

- (void)removeAllTasks
{
  CLQueuedNSURLSession *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](obj->_requestQueue, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)invalidateAndCancel
{
  id v3;

  -[CLQueuedNSURLSession removeAllTasks](self, "removeAllTasks");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CLQueuedNSURLSession session](self, "session"));
  objc_msgSend(v3, "invalidateAndCancel");

}

- (void)resetWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CLQueuedNSURLSession removeAllTasks](self, "removeAllTasks");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CLQueuedNSURLSession session](self, "session"));
  objc_msgSend(v4, "resetWithCompletionHandler:", v5);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return objc_loadWeakRetained(&self->_proxiedDelegate);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id WeakRetained;
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLQueuedNSURLSession;
  if (-[CLQueuedNSURLSession respondsToSelector:](&v8, "respondsToSelector:"))
    return 1;
  WeakRetained = objc_loadWeakRetained(&self->_proxiedDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, a3);

  return v7 & 1;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  CLQueuedNSURLSession *v11;
  unsigned int outstandingTasks;
  NSObject *v13;
  void *v14;
  id WeakRetained;
  uint8_t v16[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  outstandingTasks = v11->_outstandingTasks;
  if (!outstandingTasks)
  {
    v11->_outstandingTasks = 0;
    if (qword_100417EF8 == -1)
    {
      v13 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      {
LABEL_5:
        outstandingTasks = v11->_outstandingTasks;
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100406DA8);
      v13 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
    }
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "CLQueuedNSURLSession:Too few outstanding tasks: ", v16, 2u);
    goto LABEL_5;
  }
LABEL_6:
  v11->_outstandingTasks = outstandingTasks - 1;
  if (-[NSMutableArray count](v11->_requestQueue, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v11->_requestQueue, "lastObject"));
    -[NSMutableArray removeLastObject](v11->_requestQueue, "removeLastObject");
    -[CLQueuedNSURLSession resumeRequestIfAllowedOrEnqueue:](v11, "resumeRequestIfAllowedOrEnqueue:", v14);

  }
  objc_sync_exit(v11);

  WeakRetained = objc_loadWeakRetained(&v11->_proxiedDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "URLSession:task:didCompleteWithError:") & 1) != 0)
    objc_msgSend(WeakRetained, "URLSession:task:didCompleteWithError:", v8, v9, v10);

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained(&self->_proxiedDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "URLSession:downloadTask:didFinishDownloadingToURL:") & 1) != 0)
    objc_msgSend(WeakRetained, "URLSession:downloadTask:didFinishDownloadingToURL:", v11, v8, v9);

}

- (NSURLSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_destroyWeak(&self->_proxiedDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

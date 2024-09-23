@implementation MessageContentRequestRetryMiddleware

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100107A6C;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9F20 != -1)
    dispatch_once(&qword_1005A9F20, block);
  return (id)qword_1005A9F18;
}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelationToken cancel](self->_cancellationToken, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MessageContentRequestRetryMiddleware;
  -[MessageContentRequestRetryMiddleware dealloc](&v3, "dealloc");
}

- (MessageContentRequestRetryMiddleware)initWithMessageContentRequest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MessageContentRequestRetryMiddleware *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_MFMessageContentRequestRetryRegistry sharedRegistry](_MFMessageContentRequestRetryRegistry, "sharedRegistry"));
  v9 = -[MessageContentRequestRetryMiddleware initWithMessageContentRequest:registry:handler:](self, "initWithMessageContentRequest:registry:handler:", v6, v8, v7);

  return v9;
}

- (MessageContentRequestRetryMiddleware)initWithMessageContentRequest:(id)a3 registry:(id)a4 handler:(id)a5
{
  id v10;
  id v11;
  id v12;
  MessageContentRequestRetryMiddleware *v13;
  MessageContentRequestRetryMiddleware *v14;
  id v15;
  id handler;
  EFCancelationToken *v17;
  EFCancelationToken *cancellationToken;
  uint64_t v19;
  EFScheduler *retryScheduler;
  MessageContentRepresentationRequest *contentRequest;
  EFCancelationToken *v22;
  EFScheduler *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  EFCancelationToken *v29;
  void *v30;
  void *v31;
  EFCancelationToken *v32;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id location;
  objc_super v48;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageContentRequestRetryMiddleware.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentRequest"));

    if (v11)
      goto LABEL_3;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageContentRequestRetryMiddleware.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registry"));

LABEL_3:
  v48.receiver = self;
  v48.super_class = (Class)MessageContentRequestRetryMiddleware;
  v13 = -[MessageContentRequestRetryMiddleware init](&v48, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_contentRequest, a3);
    objc_storeStrong((id *)&v14->_registry, a4);
    v15 = objc_retainBlock(v12);
    handler = v14->_handler;
    v14->_handler = v15;

    v17 = (EFCancelationToken *)objc_alloc_init((Class)EFCancelationToken);
    cancellationToken = v14->_cancellationToken;
    v14->_cancellationToken = v17;

    v14->_shouldRetryOnNetworkChange = 0;
    v19 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:qualityOfService:](EFScheduler, "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.MessageContentRequestRetryScheduler"), 25));
    retryScheduler = v14->_retryScheduler;
    v14->_retryScheduler = (EFScheduler *)v19;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v14);
    contentRequest = v14->_contentRequest;
    v22 = v14->_cancellationToken;
    v23 = v14->_retryScheduler;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100108074;
    v45[3] = &unk_10051EF08;
    objc_copyWeak(&v46, &location);
    v36 = v12;
    v37 = v10;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageContentRepresentationRequest onScheduler:addLoadObserver:](contentRequest, "onScheduler:addLoadObserver:", v23, v45));
    -[EFCancelationToken addCancelable:](v22, "addCancelable:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "networkObservable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "observeOn:", v14->_retryScheduler));

    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1001080F4;
    v43[3] = &unk_10051EF30;
    objc_copyWeak(&v44, &location);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "filter:", v43));
    v29 = v14->_cancellationToken;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10010816C;
    v41[3] = &unk_10051DEC8;
    objc_copyWeak(&v42, &location);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[EFObserver observerWithResultBlock:](EFObserver, "observerWithResultBlock:", v41));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "subscribe:", v30));
    -[EFCancelationToken addCancelable:](v29, "addCancelable:", v31);

    v32 = v14->_cancellationToken;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100108288;
    v38[3] = &unk_10051A910;
    v39 = v11;
    v10 = v37;
    v40 = v37;
    -[EFCancelationToken addCancelationBlock:](v32, "addCancelationBlock:", v38);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
    v12 = v36;
  }

  return v14;
}

- (void)contentRequestDidReceiveContentRepresentation:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_match"));
    if ((v8[2](v8, MFMIMEErrorDomain, 2000000) & 1) != 0
      || (v9 = EMErrorDomain, (v8[2](v8, EMErrorDomain, 2048) & 1) != 0)
      || (v8[2](v8, v9, 2050) & 1) != 0
      || (v8[2](v8, v9, 2049) & 1) != 0
      || v8[2](v8, v9, 1024))
    {
      -[MessageContentRequestRetryMiddleware setShouldRetryOnNetworkChange:](self, "setShouldRetryOnNetworkChange:", 1);
      -[MessageContentRequestRetryMiddleware _retry](self, "_retry");
    }
    goto LABEL_8;
  }
  if (v15)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageContentRequestRetryMiddleware registry](self, "registry"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageContentRequestRetryMiddleware contentRequest](self, "contentRequest"));
    v12 = objc_msgSend(v10, "numberOfRetryForContentRepresentation:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageContentRequestRetryMiddleware cancellationToken](self, "cancellationToken"));
    objc_msgSend(v13, "cancel");

    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageContentRequestRetryMiddleware handler](self, "handler"));

      if (v14)
      {
        v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MessageContentRequestRetryMiddleware handler](self, "handler"));
        ((void (*)(void))v8[2])();
LABEL_8:

      }
    }
  }

}

- (void)_retry
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  if (-[MessageContentRequestRetryMiddleware _shouldRetry](self, "_shouldRetry"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MessageContentRequestRetryMiddleware log](MessageContentRequestRetryMiddleware, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageContentRequestRetryMiddleware contentRequest](self, "contentRequest"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
      v9 = 138543362;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Retrying load of content request for message: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageContentRequestRetryMiddleware registry](self, "registry"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageContentRequestRetryMiddleware contentRequest](self, "contentRequest"));
    objc_msgSend(v6, "logRetryForContentRequest:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageContentRequestRetryMiddleware contentRequest](self, "contentRequest"));
    objc_msgSend(v8, "retry");

  }
}

- (BOOL)_shouldRetry
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageContentRequestRetryMiddleware registry](self, "registry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageContentRequestRetryMiddleware contentRequest](self, "contentRequest"));
  v5 = objc_msgSend(v3, "numberOfRetryForContentRepresentation:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance"));
  v7 = objc_msgSend(v6, "isNetworkUp");

  if ((unint64_t)v5 < 3)
    return v7;
  else
    return 0;
}

- (MessageContentRepresentationRequest)contentRequest
{
  return self->_contentRequest;
}

- (void)setContentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_contentRequest, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_MFMessageContentRequestRetryRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_registry, a3);
}

- (EFCancelationToken)cancellationToken
{
  return self->_cancellationToken;
}

- (void)setCancellationToken:(id)a3
{
  objc_storeStrong((id *)&self->_cancellationToken, a3);
}

- (EFScheduler)retryScheduler
{
  return self->_retryScheduler;
}

- (void)setRetryScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_retryScheduler, a3);
}

- (BOOL)shouldRetryOnNetworkChange
{
  return self->_shouldRetryOnNetworkChange;
}

- (void)setShouldRetryOnNetworkChange:(BOOL)a3
{
  self->_shouldRetryOnNetworkChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryScheduler, 0);
  objc_storeStrong((id *)&self->_cancellationToken, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_contentRequest, 0);
}

@end

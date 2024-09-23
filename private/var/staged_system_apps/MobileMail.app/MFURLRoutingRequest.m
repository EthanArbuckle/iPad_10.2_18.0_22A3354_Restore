@implementation MFURLRoutingRequest

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C0510;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA478 != -1)
    dispatch_once(&qword_1005AA478, block);
  return (OS_os_log *)(id)qword_1005AA470;
}

+ (id)requestWithURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);

  return v5;
}

+ (id)requestWithURL:(id)a3 builderBlock:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v6);
  v7[2](v7, v8);

  return v8;
}

+ (id)externalRequestWithOpenURLContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v7 = objc_msgSend(v5, "initWithURL:", v6);

  objc_msgSend(v7, "setExternal:", 1);
  return v7;
}

- (MFURLRoutingRequest)initWithURL:(id)a3
{
  id v4;
  MFURLRoutingRequest *v5;
  NSURL *v6;
  NSURL *URL;
  uint64_t v8;
  EFPromise *promise;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFURLRoutingRequest;
  v5 = -[MFURLRoutingRequest init](&v11, "init");
  if (v5)
  {
    v6 = (NSURL *)objc_msgSend(v4, "copy");
    URL = v5->_URL;
    v5->_URL = v6;

    v8 = objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
    promise = v5->_promise;
    v5->_promise = (EFPromise *)v8;

  }
  return v5;
}

- (EFFuture)future
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFURLRoutingRequest promise](self, "promise"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "future"));

  return (EFFuture *)v3;
}

- (void)completeWithResultOfFuture:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001C09B8;
  v16[3] = &unk_100523258;
  objc_copyWeak(&v17, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "map:", v16));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001C09D0;
  v14[3] = &unk_100523280;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MFURLRoutingRequest ef_publicDescription](self, "ef_publicDescription"));
  v15 = v6;
  objc_msgSend(v5, "addSuccessBlock:", v14);
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_1001C0A80;
  v12 = &unk_10051B140;
  v7 = v6;
  v13 = v7;
  objc_msgSend(v5, "addFailureBlock:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFURLRoutingRequest promise](self, "promise", v9, v10, v11, v12));
  objc_msgSend(v8, "finishWithFuture:", v5);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (NSString)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFURLRoutingRequest sourceMessageListItem](self, "sourceMessageListItem"));

  v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFURLRoutingRequest URL](self, "URL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> scheme=%@ isExternal=%d hasSourceItem=%d"), v4, self, v6, -[MFURLRoutingRequest isExternal](self, "isExternal"), v3 != 0));

  return (NSString *)v7;
}

- (BOOL)isExternal
{
  return self->external;
}

- (void)setExternal:(BOOL)a3
{
  self->external = a3;
}

- (BOOL)isPossibleStoreURL
{
  return self->possibleStoreURL;
}

- (void)setPossibleStoreURL:(BOOL)a3
{
  self->possibleStoreURL = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (EMMessageListItem)sourceMessageListItem
{
  return self->_sourceMessageListItem;
}

- (void)setSourceMessageListItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceMessageListItem, a3);
}

- (EFPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
  objc_storeStrong((id *)&self->_promise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_sourceMessageListItem, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end

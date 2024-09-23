@implementation MFStoreURLRoute

- (MFStoreURLRoute)initWithPresenterProvider:(id)a3
{
  id v4;
  MFStoreURLRoute *v5;

  v4 = a3;
  v5 = -[MFStoreURLRoute initWithPresenterProvider:storeControllerClass:](self, "initWithPresenterProvider:storeControllerClass:", v4, objc_opt_class(MFStoreController));

  return v5;
}

- (MFStoreURLRoute)initWithPresenterProvider:(id)a3 storeControllerClass:(Class)a4
{
  id v6;
  MFStoreURLRoute *v7;
  id v8;
  id presenterProvider;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFStoreURLRoute;
  v7 = -[MFStoreURLRoute init](&v11, "init");
  if (v7)
  {
    v8 = objc_retainBlock(v6);
    presenterProvider = v7->_presenterProvider;
    v7->_presenterProvider = v8;

    v7->_storeClass = a4;
    v7->_priority = 1;
  }

  return v7;
}

- (BOOL)canRouteRequest:(id)a3
{
  return _objc_msgSend(a3, "isPossibleStoreURL");
}

- (id)routeRequest:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A9860;
  v10[3] = &unk_10051A960;
  v10[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v11 = v5;
  v6 = v4;
  v12 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v7, "performBlock:", v10);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "future"));
  return v8;
}

- (NSString)ef_publicDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(self), self);
}

- (int64_t)priority
{
  return self->_priority;
}

- (id)presenterProvider
{
  return self->_presenterProvider;
}

- (void)setPresenterProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (Class)storeClass
{
  return self->_storeClass;
}

- (void)setStoreClass:(Class)a3
{
  self->_storeClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presenterProvider, 0);
}

@end

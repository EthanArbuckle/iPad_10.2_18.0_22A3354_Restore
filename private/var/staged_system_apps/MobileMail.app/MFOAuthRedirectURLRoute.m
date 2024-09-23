@implementation MFOAuthRedirectURLRoute

- (MFOAuthRedirectURLRoute)init
{
  void *v3;
  MFOAuthRedirectURLRoute *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PSOAuthAccountRedirectURLController sharedInstance](PSOAuthAccountRedirectURLController, "sharedInstance"));
  v4 = -[MFOAuthRedirectURLRoute initWithRedirectController:](self, "initWithRedirectController:", v3);

  return v4;
}

- (MFOAuthRedirectURLRoute)initWithRedirectController:(id)a3
{
  id v5;
  MFOAuthRedirectURLRoute *v6;
  MFOAuthRedirectURLRoute *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFOAuthRedirectURLRoute;
  v6 = -[MFOAuthRedirectURLRoute init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_priority = 1;
    objc_storeStrong((id *)&v6->_redirectController, a3);
  }

  return v7;
}

- (BOOL)canRouteRequest:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URL"));
  v4 = objc_msgSend(v3, "mf_isOAuthRedirectURL");

  return v4;
}

- (id)routeRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100198050;
  v11[3] = &unk_10051A960;
  v11[4] = self;
  v6 = v4;
  v12 = v6;
  v7 = v5;
  v13 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v8, "performBlock:", v11);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "future"));
  return v9;
}

- (NSString)ef_publicDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(self), self);
}

- (int64_t)priority
{
  return self->_priority;
}

- (PSOAuthAccountRedirectURLController)redirectController
{
  return self->_redirectController;
}

- (void)setRedirectController:(id)a3
{
  objc_storeStrong((id *)&self->_redirectController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectController, 0);
}

@end

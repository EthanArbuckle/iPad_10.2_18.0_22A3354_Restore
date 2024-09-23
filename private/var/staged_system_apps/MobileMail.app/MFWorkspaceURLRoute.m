@implementation MFWorkspaceURLRoute

- (MFWorkspaceURLRoute)init
{
  void *v3;
  MFWorkspaceURLRoute *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v4 = -[MFWorkspaceURLRoute initWithWorkspace:](self, "initWithWorkspace:", v3);

  return v4;
}

- (MFWorkspaceURLRoute)initWithWorkspace:(id)a3
{
  id v5;
  MFWorkspaceURLRoute *v6;
  MFWorkspaceURLRoute *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFWorkspaceURLRoute;
  v6 = -[MFWorkspaceURLRoute init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_priority = -1;
    objc_storeStrong((id *)&v6->_workspace, a3);
  }

  return v7;
}

- (BOOL)canRouteRequest:(id)a3
{
  return objc_msgSend(a3, "isExternal") ^ 1;
}

- (id)routeRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFWorkspaceURLRoute workspace](self, "workspace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v12 = 0;
  v7 = objc_msgSend(v5, "openSensitiveURL:withOptions:error:", v6, 0, &v12);
  v8 = v12;

  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture nullFuture](EFFuture, "nullFuture"));
  }
  else
  {
    if (!v8)
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError ef_notSupportedError](NSError, "ef_notSupportedError"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_routingErrorWithUnderlyingError:request:allowFallbackRouting:](NSError, "mf_routingErrorWithUnderlyingError:request:allowFallbackRouting:", v8, v4, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v10));

  }
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

- (LSApplicationWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_workspace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
}

@end

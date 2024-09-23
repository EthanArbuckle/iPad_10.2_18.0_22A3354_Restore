@implementation DMDConfigurationSourceAssetResolveOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  id v2;
  _QWORD v3[4];
  DMDConfigurationSourceAssetResolveOperation *v4;
  id v5;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100030AE4;
  v3[3] = &unk_1000BAB10;
  v4 = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceAssetResolveOperation context](self, "context"));
  v2 = v5;
  -[DMDConfigurationSourceTaskOperation fetchRemoteProxy:](v4, "fetchRemoteProxy:", v3);

}

- (DMDRemoteAssetResolutionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end

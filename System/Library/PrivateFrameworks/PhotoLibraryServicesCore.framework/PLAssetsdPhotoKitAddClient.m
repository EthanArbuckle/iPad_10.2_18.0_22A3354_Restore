@implementation PLAssetsdPhotoKitAddClient

- (id)clientName
{
  return CFSTR("PhotoKitAdd client");
}

- (void)sendChangesRequest:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PLAssetsdPhotoKitClient sendChangesRequest:usingProxyFactory:reply:](PLAssetsdPhotoKitClient, "sendChangesRequest:usingProxyFactory:reply:", v7, v8, v6);

}

- (BOOL)sendChangesRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PLAssetsdPhotoKitClient sendChangesRequest:usingProxyFactory:error:](PLAssetsdPhotoKitClient, "sendChangesRequest:usingProxyFactory:error:", v6, v7, a4);

  return (char)a4;
}

@end

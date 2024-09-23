@implementation PLAssetsdBaseClient

- (PLXPCProxyCreating)proxyFactory
{
  return (PLXPCProxyCreating *)objc_getProperty(self, a2, 8, 1);
}

- (PLAssetsdBaseClient)initWithQueue:(id)a3 proxyCreating:(id)a4 proxyGetter:(SEL)a5
{
  id v8;
  id v9;
  PLAssetsdBaseClient *v10;
  PLAssetsdServiceProxyFactory *v11;
  PLXPCProxyCreating *proxyFactory;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLAssetsdBaseClient;
  v10 = -[PLAssetsdBaseClient init](&v14, sel_init);
  if (v10)
  {
    v11 = -[PLAssetsdServiceProxyFactory initWithQueue:proxyCreating:proxyGetter:]([PLAssetsdServiceProxyFactory alloc], "initWithQueue:proxyCreating:proxyGetter:", v8, v9, a5);
    proxyFactory = v10->_proxyFactory;
    v10->_proxyFactory = (PLXPCProxyCreating *)v11;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyFactory, 0);
}

@end

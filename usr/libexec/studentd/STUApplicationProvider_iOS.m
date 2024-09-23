@implementation STUApplicationProvider_iOS

- (STUApplicationProvider_iOS)init
{
  STUApplicationProvider_iOS *v2;
  CRKApplicationInfoServiceProxy *v3;
  CRKApplicationInfoServiceProxy *serviceProxy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUApplicationProvider_iOS;
  v2 = -[STUApplicationProvider_iOS init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(CRKApplicationInfoServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v3;

  }
  return v2;
}

- (void)fetchApplicationWithDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[STUApplicationProvider_iOS serviceProxy](self, "serviceProxy"));
  objc_msgSend(v8, "fetchApplicationWithDescriptor:completion:", v7, v6);

}

- (CRKApplicationInfoServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end

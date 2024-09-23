@implementation NFSecureElementProxyListener

- (NFSecureElementProxyListener)initWithDriverWrapper:(id)a3
{
  id v5;
  NFSecureElementProxyListener *v6;
  NFSecureElementProxyListener *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureElementProxyListener;
  v6 = -[NFSecureElementProxyListener init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_driverWrapper, a3);

  return v7;
}

- (id)transceiveWithData:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementProxyListener driverWrapper](self, "driverWrapper"));
  v8 = sub_100027C88(v7, 1, v6, 1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (NFDriverWrapper)driverWrapper
{
  return self->_driverWrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverWrapper, 0);
}

@end

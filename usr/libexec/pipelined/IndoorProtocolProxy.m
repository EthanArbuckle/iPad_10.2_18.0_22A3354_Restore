@implementation IndoorProtocolProxy

- (IndoorProtocolProxy)initWithDelegate:(id)a3
{
  id v4;
  IndoorProtocolProxy *v5;
  IndoorProtocolProxy *v6;
  IndoorProtocolProxy *v7;
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IndoorProtocolProxy;
  v5 = -[IndoorProtocolProxy init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("no delegate"), 0));
      objc_exception_throw(v9);
    }
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (void)indoorDidUpdateToLocation:(id)a3 fromLocation:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IndoorProtocolProxy delegate](self, "delegate"));
  objc_msgSend(v7, "indoorDidUpdateToLocation:fromLocation:", v8, v6);

}

- (void)indoorIsUncertainWithLocation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IndoorProtocolProxy delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "indoorIsUncertainWithLocation:") & 1) != 0)
    objc_msgSend(v4, "indoorIsUncertainWithLocation:", v5);

}

- (void)indoorGivesUpWithLocation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IndoorProtocolProxy delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "indoorGivesUpWithLocation:") & 1) != 0)
    objc_msgSend(v4, "indoorGivesUpWithLocation:", v5);

}

- (void)indoorAssetDownloadProgress:(float)a3
{
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[IndoorProtocolProxy delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "indoorAssetDownloadProgress:") & 1) != 0)
  {
    *(float *)&v4 = a3;
    objc_msgSend(v5, "indoorAssetDownloadProgress:", v4);
  }

}

- (void)indoorDidFailWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IndoorProtocolProxy delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "indoorDidFailWithError:") & 1) != 0)
    objc_msgSend(v4, "indoorDidFailWithError:", v5);

}

- (void)indoorDidShutdown:(id)a3
{
  NSError *v4;
  NSError *shutdownReason;

  v4 = (NSError *)a3;
  if (!v4)
  {
    NSLog(CFSTR("ERROR - didn't get a reason for shutting down"));
    v4 = (NSError *)objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.pipelined"), -1, &off_10040B000);
  }
  shutdownReason = self->_shutdownReason;
  self->_shutdownReason = v4;

}

- (CLIndoorDelegateProtocol)delegate
{
  return (CLIndoorDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSError)shutdownReason
{
  return self->_shutdownReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutdownReason, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

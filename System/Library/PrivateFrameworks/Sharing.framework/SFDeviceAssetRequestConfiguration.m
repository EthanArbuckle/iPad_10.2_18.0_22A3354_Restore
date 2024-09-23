@implementation SFDeviceAssetRequestConfiguration

- (SFDeviceAssetRequestConfiguration)initWithQueryResultHandler:(id)a3
{
  id v4;
  SFDeviceAssetRequestConfiguration *v5;
  uint64_t v6;
  id queryResultHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFDeviceAssetRequestConfiguration;
  v5 = -[SFDeviceAssetRequestConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    queryResultHandler = v5->_queryResultHandler;
    v5->_queryResultHandler = (id)v6;

  }
  return v5;
}

- (id)description
{
  id v3;
  double v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;

  v12 = objc_opt_class();
  NSAppendPrintF();
  v3 = 0;
  -[SFDeviceAssetRequestConfiguration timeout](self, "timeout", v12, self);
  if (fabs(v4) >= 0.00000011920929)
  {
    -[SFDeviceAssetRequestConfiguration timeout](self, "timeout");
    v13 = v5;
    NSAppendPrintF();
    v6 = v3;

    v3 = v6;
  }
  -[SFDeviceAssetRequestConfiguration downloadCompletionHandler](self, "downloadCompletionHandler", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SFDeviceAssetRequestConfiguration downloadCompletionHandler](self, "downloadCompletionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v9 = v3;

    v3 = v9;
  }
  NSAppendPrintF();
  v10 = v3;

  return v10;
}

- (id)queryResultHandler
{
  return self->_queryResultHandler;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)downloadCompletionHandler
{
  return self->_downloadCompletionHandler;
}

- (void)setDownloadCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_downloadCompletionHandler, 0);
  objc_storeStrong(&self->_queryResultHandler, 0);
}

@end

@implementation FREmbedConfigurationOperation

- (void)performOperation
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FREmbedConfigurationOperation appConfigurationManager](self, "appConfigurationManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A288;
  v4[3] = &unk_1000D9870;
  v4[4] = self;
  objc_msgSend(v3, "fetchAppConfigurationIfNeededWithCompletion:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_embedConfigurationData, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong(&self->_embedFetchCompletionBlock, 0);
}

- (FREmbedConfigurationOperation)initWithAppConfigManager:(id)a3 andResourceManager:(id)a4
{
  id v7;
  id v8;
  FREmbedConfigurationOperation *v9;
  FREmbedConfigurationOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FREmbedConfigurationOperation;
  v9 = -[FREmbedConfigurationOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v10->_resourceManager, a4);
  }

  return v10;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *, void *, id);

  v4 = a3;
  v7 = (void (**)(id, void *, void *, id))objc_claimAutoreleasedReturnValue(-[FREmbedConfigurationOperation embedFetchCompletionBlock](self, "embedFetchCompletionBlock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FREmbedConfigurationOperation embedConfigurationData](self, "embedConfigurationData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FREmbedConfigurationOperation embedConfigurationIdentifier](self, "embedConfigurationIdentifier"));
  v7[2](v7, v5, v6, v4);

}

- (void)setEmbedFetchCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setEmbedConfigurationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_embedConfigurationIdentifier, a3);
}

- (void)setEmbedConfigurationData:(id)a3
{
  objc_storeStrong((id *)&self->_embedConfigurationData, a3);
}

- (FCFlintResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (id)embedFetchCompletionBlock
{
  return self->_embedFetchCompletionBlock;
}

- (NSString)embedConfigurationIdentifier
{
  return self->_embedConfigurationIdentifier;
}

- (NSData)embedConfigurationData
{
  return self->_embedConfigurationData;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void)setAppConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_appConfigurationManager, a3);
}

- (void)setResourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_resourceManager, a3);
}

@end

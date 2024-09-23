@implementation FRFlintDataProviderFactory

- (FRFlintDataProviderFactory)initWithCloudContext:(id)a3 resourceManager:(id)a4 embedConfigurationManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  FRFlintDataProviderFactory *v12;
  FRFlintDataProviderFactory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FRFlintDataProviderFactory;
  v12 = -[FRFlintDataProviderFactory init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cloudContext, a3);
    objc_storeStrong((id *)&v13->_resourceManager, a4);
    objc_storeStrong((id *)&v13->_embedConfigurationManager, a5);
  }

  return v13;
}

- (id)flintDataProviderForANFContent:(id)a3 headline:(id)a4
{
  id v6;
  id v7;
  FRFlintDataProvider *v8;
  void *v9;
  void *v10;
  void *v11;
  FRFlintDataProvider *v12;

  v6 = a4;
  v7 = a3;
  v8 = [FRFlintDataProvider alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProviderFactory resourceManager](self, "resourceManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProviderFactory cloudContext](self, "cloudContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintDataProviderFactory embedConfigurationManager](self, "embedConfigurationManager"));
  v12 = -[FRFlintDataProvider initWithANFContent:headline:resourceManager:cloudContext:embedConfigurationManager:](v8, "initWithANFContent:headline:resourceManager:cloudContext:embedConfigurationManager:", v7, v6, v9, v10, v11);

  return v12;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (FCFlintResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (FRFlintEmbedConfigurationManager)embedConfigurationManager
{
  return self->_embedConfigurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedConfigurationManager, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end

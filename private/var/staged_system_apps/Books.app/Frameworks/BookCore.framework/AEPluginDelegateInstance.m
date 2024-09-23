@implementation AEPluginDelegateInstance

- (AEPluginDelegateInstance)initWithDelegate:(id)a3 forURL:(id)a4
{
  id v7;
  id v8;
  AEPluginDelegateInstance *v9;
  AEPluginDelegateInstance *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[AEPluginDelegateInstance init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a4);
    objc_storeStrong((id *)&v10->_delegate, a3);
  }

  return v10;
}

- (void)dealloc
{
  AEInstanceDelegate *delegate;
  NSURL *url;
  objc_super v5;

  delegate = self->_delegate;
  self->_delegate = 0;

  url = self->_url;
  self->_url = 0;

  v5.receiver = self;
  v5.super_class = (Class)AEPluginDelegateInstance;
  -[AEPluginDelegateInstance dealloc](&v5, "dealloc");
}

- (id)url
{
  return self->_url;
}

- (id)helperCoverImageOfSize:(CGSize)a3
{
  return -[AEInstanceDelegate helper:coverImageForURL:size:](self->_delegate, "helper:coverImageForURL:size:", a3.width, a3.height);
}

- (id)helperCoverImage
{
  return -[AEInstanceDelegate helper:coverImageForURL:](self->_delegate, "helper:coverImageForURL:");
}

- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4
{
  return -[AEInstanceDelegate helper:metadataForKey:forURL:needsCoordination:](self->_delegate, "helper:metadataForKey:forURL:needsCoordination:");
}

- (void)setMetadata:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector(self->_delegate, "helper:setMetadata:forKey:forURL:") & 1) != 0)
    -[AEInstanceDelegate helper:setMetadata:forKey:forURL:](self->_delegate, "helper:setMetadata:forKey:forURL:", self, v7, v6, self->_url);

}

- (void)helperDeletePersistentCache
{
  -[AEInstanceDelegate helper:deletePersistentCacheForURL:](self->_delegate, "helper:deletePersistentCacheForURL:");
}

- (void)helperUpdateCachedURLTo:(id)a3
{
  -[AEInstanceDelegate helper:updateCachedURLFrom:to:](self->_delegate, "helper:updateCachedURLFrom:to:");
}

- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4
{
  -[AEInstanceDelegate helper:viewControllerWithOptions:completion:](self->_delegate, "helper:viewControllerWithOptions:completion:", self, a3, a4);
}

- (id)annotationProviderWithCoordination:(BOOL)a3 forAssetID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector(self->_delegate, "helper:annotationProviderForURL:needsCoordination:forAssetID:") & 1) != 0)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEInstanceDelegate helper:annotationProviderForURL:needsCoordination:forAssetID:](self->_delegate, "helper:annotationProviderForURL:needsCoordination:forAssetID:", self, self->_url, v4, v6));
  else
    v7 = 0;

  return v7;
}

- (BOOL)helperValidateBookAuthorizationWithError:(id *)a3 needsCoordination:(BOOL)a4
{
  return -[AEInstanceDelegate helper:validateBookAuthorizationWithError:needsCoordination:](self->_delegate, "helper:validateBookAuthorizationWithError:needsCoordination:", self, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end

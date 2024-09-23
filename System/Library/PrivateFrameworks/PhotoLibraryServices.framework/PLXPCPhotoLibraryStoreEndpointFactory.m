@implementation PLXPCPhotoLibraryStoreEndpointFactory

- (PLXPCPhotoLibraryStoreEndpointFactory)initWithAssetsdClient:(id)a3
{
  id v5;
  PLXPCPhotoLibraryStoreEndpointFactory *v6;
  PLXPCPhotoLibraryStoreEndpointFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLXPCPhotoLibraryStoreEndpointFactory;
  v6 = -[PLXPCPhotoLibraryStoreEndpointFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetsdClient, a3);

  return v7;
}

- (id)newEndpoint
{
  void *v2;
  void *v3;

  -[PLAssetsdClient libraryClient](self->_assetsdClient, "libraryClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPhotoLibraryStoreXPCListenerEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsdClient, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
}

@end

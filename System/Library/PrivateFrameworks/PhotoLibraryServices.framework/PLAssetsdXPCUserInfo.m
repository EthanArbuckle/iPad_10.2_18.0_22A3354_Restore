@implementation PLAssetsdXPCUserInfo

- (PLAssetsdXPCUserInfo)initWithLibraryServicesManager:(id)a3
{
  id v5;
  PLAssetsdXPCUserInfo *v6;
  PLAssetsdXPCUserInfo *v7;
  PLAssetsdXPCUserInfo *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLAssetsdXPCUserInfo;
  v6 = -[PLAssetsdXPCUserInfo init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryServicesManager, a3);
    v8 = v7;
  }

  return v7;
}

- (id)libraryServicesManager
{
  return self->_libraryServicesManager;
}

- (id)persistentStoreCoordinator
{
  return -[PLLibraryServicesManager persistentStoreCoordinator](self->_libraryServicesManager, "persistentStoreCoordinator");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
}

@end

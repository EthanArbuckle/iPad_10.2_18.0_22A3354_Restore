@implementation PLGatekeeperClient

+ (id)sharedInstance
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__PLGatekeeperClient_sharedInstance__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  pl_dispatch_once(&sharedInstance_didCreate, v3);
  return (id)sharedInstance_client;
}

void __36__PLGatekeeperClient_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_client;
  sharedInstance_client = (uint64_t)v1;

}

- (void)getLibrarySizes:(id)a3
{
  id v3;
  PLAssetsdClient *v4;
  void *v5;
  PLAssetsdClient *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = [PLAssetsdClient alloc];
  +[PLPhotoLibraryPathManager systemLibraryURL](PLPhotoLibraryPathManager, "systemLibraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLAssetsdClient initWithPhotoLibraryURL:](v4, "initWithPhotoLibraryURL:", v5);

  -[PLAssetsdClient libraryInternalClient](v6, "libraryInternalClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__PLGatekeeperClient_getLibrarySizes___block_invoke;
  v9[3] = &unk_1E376A6B8;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "getLibrarySizesFromDB:completionHandler:", 0, v9);

}

- (void)getLibrarySizesFromDB:(BOOL)a3 handler:(id)a4
{
  _BOOL8 v4;
  id v5;
  PLAssetsdClient *v6;
  void *v7;
  PLAssetsdClient *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = a4;
  v6 = [PLAssetsdClient alloc];
  +[PLPhotoLibraryPathManager systemLibraryURL](PLPhotoLibraryPathManager, "systemLibraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLAssetsdClient initWithPhotoLibraryURL:](v6, "initWithPhotoLibraryURL:", v7);

  -[PLAssetsdClient libraryInternalClient](v8, "libraryInternalClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PLGatekeeperClient_getLibrarySizesFromDB_handler___block_invoke;
  v11[3] = &unk_1E376A6B8;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v9, "getLibrarySizesFromDB:completionHandler:", v4, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsdClient, 0);
}

uint64_t __52__PLGatekeeperClient_getLibrarySizesFromDB_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __38__PLGatekeeperClient_getLibrarySizes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

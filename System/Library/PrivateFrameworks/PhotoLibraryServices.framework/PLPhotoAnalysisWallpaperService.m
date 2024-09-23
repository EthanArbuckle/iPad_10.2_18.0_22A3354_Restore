@implementation PLPhotoAnalysisWallpaperService

- (PLPhotoAnalysisWallpaperService)initWithServiceProvider:(id)a3
{
  id v5;
  PLPhotoAnalysisWallpaperService *v6;
  PLPhotoAnalysisWallpaperService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoAnalysisWallpaperService;
  v6 = -[PLPhotoAnalysisWallpaperService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serviceProvider, a3);

  return v7;
}

- (void)upgradePosterConfigurationWithAssetDirectory:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a5;
  serviceProvider = self->_serviceProvider;
  v10 = a4;
  v11 = a3;
  -[PLPhotoAnalysisServiceProvider wallpaperService](serviceProvider, "wallpaperService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __94__PLPhotoAnalysisWallpaperService_upgradePosterConfigurationWithAssetDirectory_options_reply___block_invoke;
  v19[3] = &unk_1E3676858;
  v14 = v8;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __94__PLPhotoAnalysisWallpaperService_upgradePosterConfigurationWithAssetDirectory_options_reply___block_invoke_2;
  v17[3] = &unk_1E36768D0;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "upgradePosterConfigurationWithAssetDirectory:options:reply:", v11, v10, v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

uint64_t __94__PLPhotoAnalysisWallpaperService_upgradePosterConfigurationWithAssetDirectory_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__PLPhotoAnalysisWallpaperService_upgradePosterConfigurationWithAssetDirectory_options_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

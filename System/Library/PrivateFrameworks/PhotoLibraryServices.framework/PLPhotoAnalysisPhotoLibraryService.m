@implementation PLPhotoAnalysisPhotoLibraryService

- (PLPhotoAnalysisPhotoLibraryService)initWithServiceProvider:(id)a3
{
  id v5;
  PLPhotoAnalysisPhotoLibraryService *v6;
  PLPhotoAnalysisPhotoLibraryService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoAnalysisPhotoLibraryService;
  v6 = -[PLPhotoAnalysisPhotoLibraryService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serviceProvider, a3);

  return v7;
}

- (void)updateKeyAssetOfSocialGroupsWithUUIDs:(id)a3 reply:(id)a4
{
  id v6;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  serviceProvider = self->_serviceProvider;
  v8 = a3;
  -[PLPhotoAnalysisServiceProvider photoLibraryService](serviceProvider, "photoLibraryService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__PLPhotoAnalysisPhotoLibraryService_updateKeyAssetOfSocialGroupsWithUUIDs_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __82__PLPhotoAnalysisPhotoLibraryService_updateKeyAssetOfSocialGroupsWithUUIDs_reply___block_invoke_2;
  v14[3] = &unk_1E3676858;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "updateKeyAssetOfSocialGroupsWithUUIDs:reply:", v8, v14);

}

- (void)keyAssetFromAssetUUIDs:(id)a3 inAllAssets:(id)a4 reply:(id)a5
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
  -[PLPhotoAnalysisServiceProvider photoLibraryService](serviceProvider, "photoLibraryService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__PLPhotoAnalysisPhotoLibraryService_keyAssetFromAssetUUIDs_inAllAssets_reply___block_invoke;
  v19[3] = &unk_1E3676858;
  v14 = v8;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __79__PLPhotoAnalysisPhotoLibraryService_keyAssetFromAssetUUIDs_inAllAssets_reply___block_invoke_2;
  v17[3] = &unk_1E365F9E0;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "keyAssetFromAssetUUIDs:inAllAssets:reply:", v11, v10, v17);

}

- (void)curatedAssetsFromAssetUUIDs:(id)a3 options:(id)a4 reply:(id)a5
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
  -[PLPhotoAnalysisServiceProvider photoLibraryService](serviceProvider, "photoLibraryService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__PLPhotoAnalysisPhotoLibraryService_curatedAssetsFromAssetUUIDs_options_reply___block_invoke;
  v19[3] = &unk_1E3676858;
  v14 = v8;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __80__PLPhotoAnalysisPhotoLibraryService_curatedAssetsFromAssetUUIDs_options_reply___block_invoke_2;
  v17[3] = &unk_1E36687E8;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "curatedAssetsFromAssetUUIDs:options:reply:", v11, v10, v17);

}

- (void)extendedCuratedAssetsFromAssetUUIDs:(id)a3 options:(id)a4 reply:(id)a5
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
  -[PLPhotoAnalysisServiceProvider photoLibraryService](serviceProvider, "photoLibraryService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__PLPhotoAnalysisPhotoLibraryService_extendedCuratedAssetsFromAssetUUIDs_options_reply___block_invoke;
  v19[3] = &unk_1E3676858;
  v14 = v8;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __88__PLPhotoAnalysisPhotoLibraryService_extendedCuratedAssetsFromAssetUUIDs_options_reply___block_invoke_2;
  v17[3] = &unk_1E36687E8;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "extendedCuratedAssetsFromAssetUUIDs:options:reply:", v11, v10, v17);

}

- (void)computeCacheDidLoad:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PLPhotoAnalysisServiceProvider photoLibraryService](self->_serviceProvider, "photoLibraryService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__PLPhotoAnalysisPhotoLibraryService_computeCacheDidLoad___block_invoke;
  v12[3] = &unk_1E3676858;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __58__PLPhotoAnalysisPhotoLibraryService_computeCacheDidLoad___block_invoke_2;
  v10[3] = &unk_1E3676858;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "computeCacheDidLoad:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

uint64_t __58__PLPhotoAnalysisPhotoLibraryService_computeCacheDidLoad___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__PLPhotoAnalysisPhotoLibraryService_computeCacheDidLoad___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PLPhotoAnalysisPhotoLibraryService_extendedCuratedAssetsFromAssetUUIDs_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PLPhotoAnalysisPhotoLibraryService_extendedCuratedAssetsFromAssetUUIDs_options_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PLPhotoAnalysisPhotoLibraryService_curatedAssetsFromAssetUUIDs_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PLPhotoAnalysisPhotoLibraryService_curatedAssetsFromAssetUUIDs_options_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__PLPhotoAnalysisPhotoLibraryService_keyAssetFromAssetUUIDs_inAllAssets_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__PLPhotoAnalysisPhotoLibraryService_keyAssetFromAssetUUIDs_inAllAssets_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__PLPhotoAnalysisPhotoLibraryService_updateKeyAssetOfSocialGroupsWithUUIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__PLPhotoAnalysisPhotoLibraryService_updateKeyAssetOfSocialGroupsWithUUIDs_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)notifyComputeCacheDidLoadForLibrary:(id)a3 reply:(id)a4
{
  id v5;
  void *v6;
  PLPhotoAnalysisPhotoLibraryService *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  objc_msgSend(a3, "photoAnalysisClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLPhotoAnalysisPhotoLibraryService initWithServiceProvider:]([PLPhotoAnalysisPhotoLibraryService alloc], "initWithServiceProvider:", v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__PLPhotoAnalysisPhotoLibraryService_notifyComputeCacheDidLoadForLibrary_reply___block_invoke;
  v9[3] = &unk_1E3676858;
  v10 = v5;
  v8 = v5;
  -[PLPhotoAnalysisPhotoLibraryService computeCacheDidLoad:](v7, "computeCacheDidLoad:", v9);

}

uint64_t __80__PLPhotoAnalysisPhotoLibraryService_notifyComputeCacheDidLoadForLibrary_reply___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

@end

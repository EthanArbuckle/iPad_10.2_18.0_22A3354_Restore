@implementation PUPhotoEditNavigateToOneUpForAssetUUID

void __PUPhotoEditNavigateToOneUpForAssetUUID_block_invoke_154(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "lastAssetCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __PUPhotoEditNavigateToOneUpForAssetUUID_block_invoke_2;
    v14[3] = &unk_1E589C5B8;
    v15 = v5;
    v16 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = v10;
    v11 = v5;
    objc_msgSend(v4, "ppt_navigateToAsset:inAssetContainer:revealInOneUp:completionHandler:", v6, v9, 1, v14);

  }
  else
  {
    v12 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "Could not find the All Photos Album", v13, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __PUPhotoEditNavigateToOneUpForAssetUUID_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      objc_msgSend(v4, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Could not navigate to asset. %@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __PUPhotoEditNavigateToOneUpForAssetUUID_block_invoke_3;
    v9[3] = &unk_1E589C590;
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v9);

  }
}

void __PUPhotoEditNavigateToOneUpForAssetUUID_block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "selectedNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;

    v2 = v4;
  }
  objc_msgSend(v2, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PUPhotoEditAutomationLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Expected PUOneUpViewController. Current Top ViewController: %@", (uint8_t *)&v7, 0xCu);
    }

    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end

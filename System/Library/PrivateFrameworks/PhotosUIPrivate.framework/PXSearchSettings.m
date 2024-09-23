@implementation PXSearchSettings

void __48__PXSearchSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;

  v3 = (void *)MEMORY[0x1E0DC3450];
  v4 = a2;
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Search Indexing Status"), CFSTR("Requesting progress..."), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = (void *)MEMORY[0x1E0C99E88];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_2;
  v20[3] = &unk_1E58A7C70;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v22 = v5;
  v23 = v9;
  v21 = v8;
  v10 = v5;
  objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 1, v20, 2.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  v15 = v6;
  v16 = 3221225472;
  v17 = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_5;
  v18 = &unk_1E58A8DE8;
  v19 = v11;
  v13 = v11;
  objc_msgSend(v12, "actionWithTitle:style:handler:", CFSTR("OK"), 0, &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v14, v15, v16, v17, v18);

  objc_msgSend(v4, "presentViewController:animated:completion:", v10, 1, 0);
}

uint64_t __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Rebuild Search Index"), CFSTR("Are you sure you want to rebuild your search index?"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_7;
  v12[3] = &unk_1E58A7C98;
  v13 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v14 = v4;
  v15 = v7;
  v8 = v4;
  objc_msgSend(v6, "actionWithTitle:style:handler:", CFSTR("Rebuild"), 2, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v10);

  objc_msgSend(v8, "presentViewController:animated:completion:", v5, 1, 0);
  return 1;
}

uint64_t __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_76(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

void __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_7(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "debugClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "rebuildSearchIndexWithError:", &v5);
  v3 = v5;

  if (v3)
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_ERROR, "Unable to rebuild search index with error: %@", buf, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "libraryInternalClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_3;
  v8[3] = &unk_1E58A7C48;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  objc_msgSend(v4, "getSearchIndexProgress:", v8);

}

uint64_t __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, uint64_t a2, char a3, double a4)
{
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  char v11;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_4;
  v5[3] = &unk_1E58A7C20;
  v8 = *(_QWORD *)(a1 + 48);
  v9 = a2;
  v11 = a3;
  v10 = a4;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 48), "_formatIndexingStatusAlertMessageForRemainingCount:isPaused:elapsedTimeSincePause:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (id)v2;
  if (!*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    v2 = (uint64_t)v3;
  }
  objc_msgSend(*(id *)(a1 + 40), "setMessage:", v2);

}

@end

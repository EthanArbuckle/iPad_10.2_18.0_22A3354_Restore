@implementation PXCMMPhotoKitCleanupActionPerformer

- (void)performBackgroundTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[8];
  _QWORD v14[4];
  NSObject *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD block[4];
  id v19;
  NSObject *v20;
  _QWORD *v21;
  uint8_t *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[3];
  char v32;
  _QWORD v33[3];
  char v34;

  -[PXCMMActionPerformer session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shareURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performChanges:", &__block_literal_global_19925);

    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v34 = 1;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v32 = 1;
    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__19926;
    v29 = __Block_byref_object_dispose__19927;
    v30 = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__19926;
    v23[4] = __Block_byref_object_dispose__19927;
    v24 = 0;
    v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    dispatch_get_global_queue(21, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_128;
    block[3] = &unk_1E5129A88;
    v19 = v5;
    v21 = v33;
    v22 = buf;
    v10 = v7;
    v20 = v10;
    dispatch_async(v8, block);

    objc_msgSend(v3, "suggestion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      dispatch_group_enter(v10);
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_3;
      v14[3] = &unk_1E51468C8;
      v16 = v31;
      v17 = v23;
      v15 = v10;
      -[PXCMMPhotoKitCleanupActionPerformer _activateSuggestion:completionHandler:](self, "_activateSuggestion:completionHandler:", v11, v14);

    }
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_4;
    v13[3] = &unk_1E513CD68;
    v13[6] = v23;
    v13[7] = buf;
    v13[4] = self;
    v13[5] = v33;
    dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v13);

    _Block_object_dispose(v23, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
  }
  else
  {
    PLSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Cleanup CMM phase without a share URL. Nothing to clean up", buf, 2u);
    }

    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
  }

}

- (void)_activateSuggestion:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PLSharingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Will mark suggestion as active: %@", buf, 0xCu);
  }

  objc_msgSend(v5, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__PXCMMPhotoKitCleanupActionPerformer__activateSuggestion_completionHandler___block_invoke;
  v15[3] = &unk_1E5149198;
  v16 = v5;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __77__PXCMMPhotoKitCleanupActionPerformer__activateSuggestion_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5148348;
  v13 = v16;
  v14 = v6;
  v10 = v6;
  v11 = v16;
  objc_msgSend(v8, "performChanges:completionHandler:", v15, v12);

}

void __77__PXCMMPhotoKitCleanupActionPerformer__activateSuggestion_completionHandler___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "markActive");

}

void __77__PXCMMPhotoKitCleanupActionPerformer__activateSuggestion_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v15 = 138412290;
      v16 = v8;
      v9 = "Did mark suggestion as active: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v5;
    v9 = "Failed to mark suggestion as active: %@, error: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, v5, v14);
}

void __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_128(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_2;
  v4[3] = &unk_1E51468C8;
  v6 = *(_QWORD *)(a1 + 56);
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  _PXDeleteMomentShareForURL(v1, 1, v4);

}

void __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_4(uint64_t a1)
{
  _BOOL8 v1;
  uint64_t v2;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  else
    v1 = 0;
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v2)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", v1, v2);
}

void __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShareURL:", 0);
}

@end

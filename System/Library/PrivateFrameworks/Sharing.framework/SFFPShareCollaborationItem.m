@implementation SFFPShareCollaborationItem

uint64_t __52___SFFPShareCollaborationItem__loadMetadataIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52___SFFPShareCollaborationItem__loadMetadataIfNeeded__block_invoke_2;
  v3[3] = &unk_1E482FE38;
  v1 = *(_QWORD *)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return +[SFCollaborationUtilities loadMetadataForFileURL:completionHandler:](SFCollaborationUtilities, "loadMetadataForFileURL:completionHandler:", v1, v3);
}

void __52___SFFPShareCollaborationItem__loadMetadataIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setMetadataLoadError:", a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52___SFFPShareCollaborationItem__loadMetadataIfNeeded__block_invoke_3;
  v7[3] = &unk_1E482D3A0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __52___SFFPShareCollaborationItem__loadMetadataIfNeeded__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didLoadMetadata:", *(_QWORD *)(a1 + 40));
}

void __78___SFFPShareCollaborationItem_loadCopyRepresentationURLWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5)
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __78___SFFPShareCollaborationItem_loadCopyRepresentationURLWithCompletionHandler___block_invoke_cold_1(WeakRetained, (uint64_t)v6, v8);

    objc_msgSend(WeakRetained, "fileURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(WeakRetained, "setSendCopyRepresentationURL:", v5);
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setSendCopyActivityItems:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78___SFFPShareCollaborationItem_loadCopyRepresentationURLWithCompletionHandler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1A2830000, a3, OS_LOG_TYPE_ERROR, "Could not load copy representation URL, falling back to the original URL %@. Error: %@", (uint8_t *)&v6, 0x16u);

}

@end

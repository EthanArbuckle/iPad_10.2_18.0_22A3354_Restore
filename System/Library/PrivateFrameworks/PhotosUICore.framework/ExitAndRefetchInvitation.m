@implementation ExitAndRefetchInvitation

void ___ExitAndRefetchInvitation_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "shareURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharedLibraryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Will re-fetch Shared Library invitation for URL: %@", buf, 0xCu);
    }

    v8 = *(void **)(a1 + 40);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = ___ExitAndRefetchInvitation_block_invoke_409;
    v17[3] = &unk_1E5117C58;
    v21 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 32);
    v19 = v6;
    v20 = *(id *)(a1 + 48);
    v9 = v6;
    objc_msgSend(v8, "fetchSharedLibraryForURL:completionHandler:", v9, v17);

    v10 = v21;
  }
  else
  {
    PLSharedLibraryGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Failed to exit current Shared Library invitation preview: %{public}@, error: %@", buf, 0x16u);

    }
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryPreviewInvitationFailureAlertTitle"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ___ExitAndRefetchInvitation_block_invoke_415;
    v14[3] = &unk_1E5148CE0;
    v13 = *(void **)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v15 = v5;
    PXPresentFailureWithLocalizedTitle(v9, v10, 0, v15, v13, v14);

  }
}

void ___ExitAndRefetchInvitation_block_invoke_409(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  char v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "sourceLibraryInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSharedLibraryNotFoundError:", v5);
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v27 = v10;
      v11 = "Re-fetch returned NO Shared Library invitation for URL: %@";
      v12 = v8;
      v13 = 12;
LABEL_8:
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    }
  }
  else if (v9)
  {
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v27 = v14;
    v28 = 2112;
    v29 = v5;
    v11 = "Failed to re-fetch Shared Library invitation for URL: %@, error: %@";
    v12 = v8;
    v13 = 22;
    goto LABEL_8;
  }

  v24 = 0;
  v25 = 0;
  v15 = objc_msgSend(v6, "presentCustomInformationForError:customTitle:customMessage:", v5, &v25, &v24);
  v16 = v25;
  v17 = v24;
  if ((v15 & 1) == 0)
  {
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryFetchInvitationFailureAlertTitle_Transient"));
    v18 = objc_claimAutoreleasedReturnValue();

    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v18;
    v17 = (id)v19;
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = ___ExitAndRefetchInvitation_block_invoke_412;
  v21[3] = &unk_1E5148CE0;
  v20 = *(void **)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v22 = v5;
  PXPresentFailureWithLocalizedTitle(v16, v17, 0, v22, v20, v21);

LABEL_12:
}

uint64_t ___ExitAndRefetchInvitation_block_invoke_415(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t ___ExitAndRefetchInvitation_block_invoke_412(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

@end

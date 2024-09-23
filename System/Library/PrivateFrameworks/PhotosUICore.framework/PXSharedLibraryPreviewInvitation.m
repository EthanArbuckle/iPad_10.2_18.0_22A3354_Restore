@implementation PXSharedLibraryPreviewInvitation

void __PXSharedLibraryPreviewInvitation_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    _PXSharedLibraryPreviewInvitation(*(void **)(a1 + 32), v7, *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 72), *(void **)(a1 + 56), *(void **)(a1 + 64));
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 64);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
  }

}

void ___PXSharedLibraryPreviewInvitation_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharedLibraryGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Did preview Shared Library invitation: %{public}@", buf, 0xCu);

    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v9 + 16))(v9, 1, 0);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Failed to preview Shared Library invitation: %{public}@, error: %@", buf, 0x16u);

    }
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryPreviewInvitationFailureAlertTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ___PXSharedLibraryPreviewInvitation_block_invoke_519;
    v14[3] = &unk_1E5148CE0;
    v13 = *(void **)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v15 = v5;
    PXPresentFailureWithLocalizedTitle(v11, v12, 0, v15, v13, v14);

  }
}

uint64_t ___PXSharedLibraryPreviewInvitation_block_invoke_519(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

@end

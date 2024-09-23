@implementation PXSharedLibraryAcceptInvitation

void __PXSharedLibraryAcceptInvitation_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    _PXSharedLibraryAcceptInvitation(v7, *(void **)(a1 + 32), *(_QWORD *)(a1 + 64), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
  }

}

void ___PXSharedLibraryAcceptInvitation_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
      v24 = v8;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Did accept Shared Library invitation: %{public}@", buf, 0xCu);

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
      v24 = v10;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Failed to accept Shared Library invitation: %{public}@, error: %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "sourceLibraryInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = 0;
    v12 = objc_msgSend(v11, "presentCustomInformationForError:customTitle:customMessage:", v5, &v22, &v21);
    v13 = v22;
    v14 = v21;
    if ((v12 & 1) == 0)
    {
      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAcceptInvitationFailureAlertTitle_Transient"));
      v15 = objc_claimAutoreleasedReturnValue();

      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v15;
      v14 = (id)v16;
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = ___PXSharedLibraryAcceptInvitation_block_invoke_522;
    v18[3] = &unk_1E5148CE0;
    v17 = *(void **)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    v19 = v5;
    PXPresentFailureWithLocalizedTitle(v13, v14, 0, v19, v17, v18);

  }
}

uint64_t ___PXSharedLibraryAcceptInvitation_block_invoke_522(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

@end

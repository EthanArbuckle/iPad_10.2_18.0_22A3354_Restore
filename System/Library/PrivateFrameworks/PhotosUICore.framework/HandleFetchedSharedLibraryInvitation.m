@implementation HandleFetchedSharedLibraryInvitation

uint64_t ___HandleFetchedSharedLibraryInvitation_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void ___HandleFetchedSharedLibraryInvitation_block_invoke_482(id *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharedLibraryGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = a1[4];
      v9 = a1[5];
      *(_DWORD *)buf = 138543618;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Will restore declined Shared Library invitation: %@", buf, 0x16u);
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ___HandleFetchedSharedLibraryInvitation_block_invoke_483;
    v14[3] = &unk_1E5117BB8;
    v10 = a1[5];
    v15 = a1[4];
    v16 = a1[6];
    v17 = a1[7];
    v18 = a1[8];
    v20 = a1[9];
    v19 = a1[5];
    objc_msgSend(v10, "restoreDeclinedInvitationWithCompletion:", v14);

  }
  else
  {
    if (v7)
    {
      v11 = a1[4];
      v12 = a1[5];
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: User canceled restore of declined Shared Library invitation: %@", buf, 0x16u);
    }

    v13 = (void (**)(id, uint64_t, _QWORD))a1[9];
    if (v13)
      v13[2](v13, 1, 0);
  }

}

void ___HandleFetchedSharedLibraryInvitation_block_invoke_483(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  PLSharedLibraryGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v19 = v9;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Did restore declined Shared Library invitation: %@", buf, 0x16u);
    }

    _ViewInvitation(*(void **)(a1 + 40), v5, *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 32), *(void **)(a1 + 72));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to restore declined Shared Library invitation: %@, error: %@", buf, 0x20u);
    }

    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryFetchInvitationFailureAlertTitle_Transient"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 56);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = ___HandleFetchedSharedLibraryInvitation_block_invoke_484;
    v15[3] = &unk_1E5148CE0;
    v17 = *(id *)(a1 + 72);
    v16 = v6;
    PXPresentFailureWithLocalizedTitle(v12, v13, 0, v16, v14, v15);

  }
}

uint64_t ___HandleFetchedSharedLibraryInvitation_block_invoke_484(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

@end

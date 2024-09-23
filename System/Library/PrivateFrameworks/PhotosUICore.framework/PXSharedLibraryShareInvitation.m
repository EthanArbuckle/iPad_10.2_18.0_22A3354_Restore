@implementation PXSharedLibraryShareInvitation

void __PXSharedLibraryShareInvitation_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  int IsUserCanceledError;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    PLSharedLibraryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Invitation shared successfully", buf, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_11:
      v10();
    }
  }
  else
  {
    IsUserCanceledError = PXSharedLibraryIsUserCanceledError(v5);
    PLSharedLibraryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (IsUserCanceledError)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v24 = v14;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: User canceled sharing invitation", buf, 0xCu);
      }

      v15 = *(_QWORD *)(a1 + 48);
      if (v15)
      {
        v10 = *(void (**)(void))(v15 + 16);
        goto LABEL_11;
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v24 = v16;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to share invitation: %@", buf, 0x16u);
      }

      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryShareInvitationFailureAlertTitle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __PXSharedLibraryShareInvitation_block_invoke_370;
      v20[3] = &unk_1E5148CE0;
      v19 = *(void **)(a1 + 40);
      v22 = *(id *)(a1 + 48);
      v21 = v6;
      PXPresentFailureWithLocalizedTitle(v17, v18, 0, v21, v19, v20);

    }
  }

}

uint64_t __PXSharedLibraryShareInvitation_block_invoke_370(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

@end

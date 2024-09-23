@implementation PXSharedLibraryRestoreDeclinedLibraryScopeInvitation

uint64_t __PXSharedLibraryRestoreDeclinedLibraryScopeInvitation_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __PXSharedLibraryRestoreDeclinedLibraryScopeInvitation_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
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
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    objc_msgSend(v5, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    v10 = "Did restore previously declined library scope with identifier: %{public}@";
    v11 = v8;
    v12 = OS_LOG_TYPE_DEFAULT;
    v13 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v9;
    v22 = 2112;
    v23 = v6;
    v10 = "Failed to restore previously declined library scope with identifier: %{public}@, error: %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 22;
  }
  _os_log_impl(&dword_1A6789000, v11, v12, v10, buf, v13);

LABEL_7:
  v14 = *(void **)(a1 + 40);
  if (v14)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __PXSharedLibraryRestoreDeclinedLibraryScopeInvitation_block_invoke_233;
    block[3] = &unk_1E5145688;
    v19 = v14;
    v17 = v5;
    v18 = v6;
    v15 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __PXSharedLibraryRestoreDeclinedLibraryScopeInvitation_block_invoke_233(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end

@implementation PXSharedLibraryDeclineLibraryScopeInvitation

uint64_t __PXSharedLibraryDeclineLibraryScopeInvitation_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __PXSharedLibraryDeclineLibraryScopeInvitation_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  PLSharedLibraryGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    v9 = "Did decline library scope with identifier: %{public}@";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v5;
    v9 = "Failed to decline library scope with identifier: %{public}@, error: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
  }
  _os_log_impl(&dword_1A6789000, v10, v11, v9, buf, v12);

LABEL_7:
  v13 = *(void **)(a1 + 40);
  if (v13)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __PXSharedLibraryDeclineLibraryScopeInvitation_block_invoke_230;
    block[3] = &unk_1E5146308;
    v17 = v13;
    v18 = a2;
    v16 = v5;
    v14 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __PXSharedLibraryDeclineLibraryScopeInvitation_block_invoke_230(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end

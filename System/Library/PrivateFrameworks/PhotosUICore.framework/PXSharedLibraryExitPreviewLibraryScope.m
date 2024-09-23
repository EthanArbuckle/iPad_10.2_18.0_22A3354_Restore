@implementation PXSharedLibraryExitPreviewLibraryScope

void __PXSharedLibraryExitPreviewLibraryScope_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Exit Shared Library Preview", v5, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Exit Shared Library Preview"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

void __PXSharedLibraryExitPreviewLibraryScope_block_invoke_240(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    PLSharedLibraryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Exit from Preview Failed", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Exit from Preview Failed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __PXSharedLibraryExitPreviewLibraryScope_block_invoke_243;
    v8[3] = &unk_1E5148CE0;
    v5 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v9 = v3;
    v10 = v6;
    v7 = v3;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v4, v5, v8);

  }
}

void __PXSharedLibraryExitPreviewLibraryScope_block_invoke_244(uint64_t a1, int a2, void *a3)
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
  _QWORD v15[4];
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
    v9 = "Did exit preview library scope with identifier: %{public}@";
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
    v9 = "Failed to exit preview library scope with identifier: %{public}@, error: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
  }
  _os_log_impl(&dword_1A6789000, v10, v11, v9, buf, v12);

LABEL_7:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __PXSharedLibraryExitPreviewLibraryScope_block_invoke_245;
    v15[3] = &unk_1E5146308;
    v14 = *(void **)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    v18 = a2;
    v16 = v5;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v13, v14, v15);

  }
}

uint64_t __PXSharedLibraryExitPreviewLibraryScope_block_invoke_245(uint64_t a1)
{
  uint64_t result;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __PXSharedLibraryExitPreviewLibraryScope_block_invoke_243(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

@end

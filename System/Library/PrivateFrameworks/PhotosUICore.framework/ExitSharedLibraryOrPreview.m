@implementation ExitSharedLibraryOrPreview

void ___ExitSharedLibraryOrPreview_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  int IsUserCanceledError;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((_DWORD)a2)
  {
    PLSharedLibraryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    v9 = "%{public}@: Did exit Shared Library or preview: %{public}@";
LABEL_7:
    v13 = v6;
    v14 = OS_LOG_TYPE_DEFAULT;
    v15 = 22;
    goto LABEL_10;
  }
  IsUserCanceledError = PXSharedLibraryIsUserCanceledError(v5);
  PLSharedLibraryGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (IsUserCanceledError)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v12;
    v20 = 2114;
    v21 = v8;
    v9 = "%{public}@: User canceled exit Shared Library or preview: %{public}@";
    goto LABEL_7;
  }
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    goto LABEL_11;
  v16 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 138543874;
  v19 = v16;
  v20 = 2114;
  v21 = v8;
  v22 = 2112;
  v23 = v5;
  v9 = "%{public}@: Failed to exit Shared Library or preview: %{public}@, error: %@";
  v13 = v6;
  v14 = OS_LOG_TYPE_ERROR;
  v15 = 32;
LABEL_10:
  _os_log_impl(&dword_1A6789000, v13, v14, v9, (uint8_t *)&v18, v15);

LABEL_11:
  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
    (*(void (**)(uint64_t, uint64_t, id))(v17 + 16))(v17, a2, v5);

}

@end

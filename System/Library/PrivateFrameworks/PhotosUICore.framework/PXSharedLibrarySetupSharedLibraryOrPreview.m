@implementation PXSharedLibrarySetupSharedLibraryOrPreview

void __PXSharedLibrarySetupSharedLibraryOrPreview_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  int IsUserCanceledError;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((_DWORD)a2)
  {
    PLSharedLibraryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v7 = *(_QWORD *)(a1 + 32);
    v17 = 138543362;
    v18 = v7;
    v8 = "%{public}@: Did setup Shared Library or preview";
LABEL_7:
    v12 = v6;
    v13 = OS_LOG_TYPE_DEFAULT;
    v14 = 12;
    goto LABEL_10;
  }
  IsUserCanceledError = PXSharedLibraryIsUserCanceledError(v5);
  PLSharedLibraryGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (IsUserCanceledError)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v11 = *(_QWORD *)(a1 + 32);
    v17 = 138543362;
    v18 = v11;
    v8 = "%{public}@: User canceled setup Shared Library or preview";
    goto LABEL_7;
  }
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    goto LABEL_11;
  v15 = *(_QWORD *)(a1 + 32);
  v17 = 138543618;
  v18 = v15;
  v19 = 2112;
  v20 = v5;
  v8 = "%{public}@: Failed to setup Shared Library or preview: %@";
  v12 = v6;
  v13 = OS_LOG_TYPE_ERROR;
  v14 = 22;
LABEL_10:
  _os_log_impl(&dword_1A6789000, v12, v13, v8, (uint8_t *)&v17, v14);
LABEL_11:

  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

@end

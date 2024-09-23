@implementation PXMomentShareRequestNotificationOnUploadCompletion

void __PXMomentShareRequestNotificationOnUploadCompletion_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD1688], "changeRequestForMomentShare:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setShouldNotifyOnUploadCompletion:", 1);

}

void __PXMomentShareRequestNotificationOnUploadCompletion_block_invoke_2(uint64_t a1, int a2, void *a3)
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
  _QWORD block[4];
  id v15;
  id v16;
  char v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v8;
    v9 = "Requested notification on upload completion for moment share: %{public}@";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v5;
    v9 = "Failed request notification on upload completion for moment share: %{public}@, error: %@";
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
    block[2] = __PXMomentShareRequestNotificationOnUploadCompletion_block_invoke_196;
    block[3] = &unk_1E5146308;
    v16 = v13;
    v17 = a2;
    v15 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __PXMomentShareRequestNotificationOnUploadCompletion_block_invoke_196(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end

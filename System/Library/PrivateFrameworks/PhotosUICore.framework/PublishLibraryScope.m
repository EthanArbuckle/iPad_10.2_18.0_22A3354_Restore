@implementation PublishLibraryScope

void ___PublishLibraryScope_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PublishLibraryScope", ", buf, 2u);
  }

  PLSharedLibraryGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v12;
    v23 = 2112;
    v24 = v5;
    v13 = "Did publish library scope with identifier: %{public}@, URL: %@";
    v14 = v11;
    v15 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v12;
    v23 = 2112;
    v24 = v6;
    v13 = "Failed to publish library scope with identifier: %{public}@, error: %@";
    v14 = v11;
    v15 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1A6789000, v14, v15, v13, buf, 0x16u);

LABEL_10:
  v16 = *(void **)(a1 + 48);
  if (v16)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___PublishLibraryScope_block_invoke_469;
    block[3] = &unk_1E5145688;
    v20 = v16;
    v18 = v5;
    v19 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t ___PublishLibraryScope_block_invoke_469(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end

@implementation ExpungeLibraryScope

void ___ExpungeLibraryScope_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CD15E8];
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "expungeLibraryScopes:", v2);

}

void ___ExpungeLibraryScope_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v8, "ExpungeLibraryScope", ", buf, 2u);
  }

  PLSharedLibraryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v11;
    v12 = "Did expunge library scope with identifier: %{public}@";
    v13 = v10;
    v14 = OS_LOG_TYPE_DEFAULT;
    v15 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v5;
    v12 = "Failed to expunge library scope with identifier: %{public}@, error: %@";
    v13 = v10;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 22;
  }
  _os_log_impl(&dword_1A6789000, v13, v14, v12, buf, v15);

LABEL_10:
  v16 = *(void **)(a1 + 48);
  if (v16)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ExpungeLibraryScope_block_invoke_448;
    block[3] = &unk_1E5146308;
    v19 = v16;
    v20 = a2;
    v18 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t ___ExpungeLibraryScope_block_invoke_448(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end

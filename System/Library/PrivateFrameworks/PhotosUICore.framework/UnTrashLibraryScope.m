@implementation UnTrashLibraryScope

void ___UnTrashLibraryScope_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CD15E8];
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "untrashLibraryScopes:", v2);

}

void ___UnTrashLibraryScope_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v8, "UnTrashLibraryScope", ", buf, 2u);
  }

  PLSharedLibraryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Did un-trash library scope with identifier: %{public}@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 48), "librarySpecificFetchOptions");
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CD15E0];
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchLibraryScopesWithLocalIdentifiers:options:", v14, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Failed to un-trash library scope with identifier: %{public}@, error: %@", buf, 0x16u);

    }
    v16 = 0;
  }

  v18 = *(void **)(a1 + 56);
  if (v18)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___UnTrashLibraryScope_block_invoke_480;
    block[3] = &unk_1E5145688;
    v22 = v18;
    v20 = v16;
    v21 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t ___UnTrashLibraryScope_block_invoke_480(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end

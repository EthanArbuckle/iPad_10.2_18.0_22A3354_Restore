@implementation PXSharedLibraryFetchLibraryScopeForURL

void __PXSharedLibraryFetchLibraryScopeForURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, v9, "FetchLibraryScopeForURL", ", buf, 2u);
  }

  if (!v5)
  {
    objc_msgSend(v6, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CD1D80]))
    {
      v14 = objc_msgSend(v6, "code");

      if (v14 == 6003)
      {
        PLSharedLibraryGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        v15 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v29 = v15;
        v16 = "Fetch returned NO library scope for URL: %@";
        v17 = v10;
        v18 = OS_LOG_TYPE_DEFAULT;
        v19 = 12;
LABEL_14:
        _os_log_impl(&dword_1A6789000, v17, v18, v16, buf, v19);
        goto LABEL_15;
      }
    }
    else
    {

    }
    PLSharedLibraryGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v20 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v29 = v20;
    v30 = 2112;
    v31 = v6;
    v16 = "Failed to fetch library scope for URL: %@, error: %@";
    v17 = v10;
    v18 = OS_LOG_TYPE_ERROR;
    v19 = 22;
    goto LABEL_14;
  }
  PLSharedLibraryGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Did fetch library scope: %{public}@ for URL: %@", buf, 0x16u);

  }
LABEL_15:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PXSharedLibraryFetchLibraryScopeForURL_block_invoke_215;
  block[3] = &unk_1E5145688;
  v21 = *(id *)(a1 + 48);
  v26 = v6;
  v27 = v21;
  v25 = v5;
  v22 = v6;
  v23 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __PXSharedLibraryFetchLibraryScopeForURL_block_invoke_215(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end

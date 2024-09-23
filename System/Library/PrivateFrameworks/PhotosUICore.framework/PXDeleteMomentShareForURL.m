@implementation PXDeleteMomentShareForURL

void ___PXDeleteMomentShareForURL_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "pl_redactedShareURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v10 = "Did %@ moment share for URL: %{public}@";
    v11 = v7;
    v12 = OS_LOG_TYPE_DEFAULT;
    v13 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "pl_redactedShareURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v14;
    v18 = 2114;
    v19 = v9;
    v20 = 2112;
    v21 = v5;
    v10 = "Failed to %@ moment share for URL: %{public}@, error: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 32;
  }
  _os_log_impl(&dword_1A6789000, v11, v12, v10, (uint8_t *)&v16, v13);

LABEL_7:
  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
    (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, a2, v5);

}

@end

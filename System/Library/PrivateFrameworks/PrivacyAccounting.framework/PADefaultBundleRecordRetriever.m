@implementation PADefaultBundleRecordRetriever

void __PADefaultBundleRecordRetriever_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_83, "copy");
  v1 = (void *)PADefaultBundleRecordRetriever_result;
  PADefaultBundleRecordRetriever_result = v0;

}

id __PADefaultBundleRecordRetriever_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v11;
  _OWORD v12[2];

  v2 = a2;
  v3 = objc_msgSend(v2, "identifierType");
  if (v3 == 2)
  {
    v8 = (void *)MEMORY[0x1E0CA5898];
    if (v2)
      objc_msgSend(v2, "auditToken");
    else
      memset(v12, 0, sizeof(v12));
    v11 = 0;
    objc_msgSend(v8, "bundleRecordForAuditToken:error:", v12, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (!v6)
      goto LABEL_11;
  }
  else
  {
    if (v3)
    {
      logger_2();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __PADefaultBundleRecordRetriever_block_invoke_2_cold_1((uint64_t)v2, v7);
      goto LABEL_14;
    }
    v4 = (void *)MEMORY[0x1E0CA5898];
    objc_msgSend(v2, "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v12[0] = 0;
    objc_msgSend(v4, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v5, 0, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(id *)&v12[0];

    if (!v6)
    {
LABEL_11:
      logger_2();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __PADefaultBundleRecordRetriever_block_invoke_2_cold_2((uint64_t)v2, (uint64_t)v7, v9);

LABEL_14:
      v6 = 0;
    }
  }

  return v6;
}

void __PADefaultBundleRecordRetriever_block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1A5DE1000, a2, OS_LOG_TYPE_DEBUG, "Skipping LS lookup for application=%{public}@", (uint8_t *)&v2, 0xCu);
}

void __PADefaultBundleRecordRetriever_block_invoke_2_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1A5DE1000, log, OS_LOG_TYPE_ERROR, "Failed to fetch LS record for application=%{public}@ with error=%{public}@", (uint8_t *)&v3, 0x16u);
}

@end

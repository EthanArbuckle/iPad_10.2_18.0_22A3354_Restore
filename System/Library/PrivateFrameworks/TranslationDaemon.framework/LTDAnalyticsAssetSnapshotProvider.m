@implementation LTDAnalyticsAssetSnapshotProvider

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v5 = a3;
  +[_LTDAssetService filterConfigAssetFromAssets:](_LTDAssetService, "filterConfigAssetFromAssets:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5 && v6)
    goto LABEL_5;
  v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_cold_3((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
    if (v7)
      goto LABEL_5;
  }
  else if (v7)
  {
LABEL_5:
    v15 = objc_msgSend(v7, "assetVersion");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%zd"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    goto LABEL_6;
  }
  v31 = _LTOSLogAssets();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_cold_2(v31, v32, v33, v34, v35, v36, v37, v38);
LABEL_6:
  objc_msgSend(v7, "assetBuild");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v20 = _LTOSLogAssets();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
  }
  objc_msgSend(v7, "assetBuild");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v30 = *(void **)(v29 + 40);
  *(_QWORD *)(v29 + 40) = v28;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  +[_LTDAssetService filterConfigAssetFromAssets:](_LTDAssetService, "filterConfigAssetFromAssets:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 || !v6)
  {
    v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_3_cold_1((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);
  }
  else
  {
    v8 = objc_msgSend(v6, "assetVersion");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%zd"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_4(_QWORD *a1)
{
  _LTDAnalyticsAssetSnapshot *v2;

  v2 = -[_LTDAnalyticsAssetSnapshot initWithAssetBuild:expectedAssetVersion:installedAssetVersion:]([_LTDAnalyticsAssetSnapshot alloc], "initWithAssetBuild:expectedAssetVersion:installedAssetVersion:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  (*(void (**)(void))(a1[4] + 16))();

}

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2491B9000, a1, a3, "Failed to lookup version of MobileAsset config file", a5, a6, a7, a8, 0);
}

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2491B9000, a1, a3, "Failed to lookup catalog asset, so can't get the expected version", a5, a6, a7, a8, 0);
}

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Failed to lookup catalog asset: %@", a5, a6, a7, a8, 2u);
}

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Failed to lookup installed catalog asset: %@", a5, a6, a7, a8, 2u);
}

@end

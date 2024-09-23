@implementation LTSpeechTranslationAssetInfo

void __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke_cold_1();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke_22(_QWORD *a1)
{
  _QWORD *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 5;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke_22_cold_1();
  }
  else
  {
    +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:](_LTSpeechTranslationAssetInfo, "_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), 0);
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "All asset downloads for language pair %{public}@ completed successfully", (uint8_t *)&v7, 0xCu);
    }
  }
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*v2 + 8) + 40));
  return result;
}

void __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke_cold_1(a1);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v6 + 40);
  v7 = (id *)(v6 + 40);
  v8 = v9;
  if (v9)
    v10 = v8;
  else
    v10 = v4;
  objc_storeStrong(v7, v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke_25(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v4 = _LTOSLogAssets();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke_25_cold_1();
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)WeakRetained[2];
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "All assets purged for language pair %{public}@ finished", (uint8_t *)&v12, 0xCu);
    }
    v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)WeakRetained[1];
      v9 = v7;
      objc_msgSend(v8, "assetIdentifierReferenceCountDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "Reference counts after purge %@", (uint8_t *)&v12, 0xCu);

    }
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }

}

void __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed asset downloads for language pair %{public}@ with error: %@");
  OUTLINED_FUNCTION_1_2();
}

void __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke_22_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Finished downloads; some assets downloads for language pair %{public}@ failed: %@");
  OUTLINED_FUNCTION_1_2();
}

void __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v1, v2, "error purging asset %{public}@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_2();
}

void __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke_25_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to finish purging assets for language pair %{public}@: %@");
  OUTLINED_FUNCTION_1_2();
}

@end

@implementation TRIClient

void __90__TRIClient_UAFTrialClient___cachedLevelForFactorAnyLanguage_withNamespaceName_withCache___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v7, "hasPrefix:", *(_QWORD *)(a1 + 32)))
  {
    UAFGetLogCategory((id *)&UAFLogContextTrialCategory);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 136315650;
      v12 = "+[TRIClient(UAFTrialClient) _cachedLevelForFactorAnyLanguage:withNamespaceName:withCache:]_block_invoke";
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v7;
      _os_log_debug_impl(&dword_229282000, v9, OS_LOG_TYPE_DEBUG, "%s No level found for %@(nil), but found %@", (uint8_t *)&v11, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

@end

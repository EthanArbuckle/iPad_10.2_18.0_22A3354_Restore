@implementation PSAppUsageUtilities

uint64_t __74___PSAppUsageUtilities_mostUsedAppBundleIdsUsingPredicate_knowledgeStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __74___PSAppUsageUtilities_mostUsedAppBundleIdsUsingPredicate_knowledgeStore___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __123___PSAppUsageUtilities_shareExtensionsUsedAndInstalledDaysAgo_appBundleIdsToShareExtensionBundleIdsMapping_knowledgeStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __123___PSAppUsageUtilities_shareExtensionsUsedAndInstalledDaysAgo_appBundleIdsToShareExtensionBundleIdsMapping_knowledgeStore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __123___PSAppUsageUtilities_shareExtensionsUsedAndInstalledDaysAgo_appBundleIdsToShareExtensionBundleIdsMapping_knowledgeStore___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __163___PSAppUsageUtilities_mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping_sourceBundleId_sharesFromSourceToTargetBundle_appUsageDurations___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __163___PSAppUsageUtilities_mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping_sourceBundleId_sharesFromSourceToTargetBundle_appUsageDurations___block_invoke_39(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __98___PSAppUsageUtilities_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo_knowledgeStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __47___PSAppUsageUtilities_cacheAppUsageDurations___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (objc_msgSend(v2, "state"))
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_cold_1(v2);

  }
}

void __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_58(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v3 = a2;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "eventBody"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "addBiomeDataToCache:event:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_58_cold_1(v4);

  }
}

void __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_64()
{
  NSObject *v0;
  uint8_t v1[16];

  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A07F4000, v0, OS_LOG_TYPE_INFO, "Event donation from Sharesheet.Feedback biome stream was cancelled", v1, 2u);
  }

}

void __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C80], "keyPathWithKey:", CFSTR("/appShares/value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    if (v3 && (objc_msgSend(v3, "eventBody"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      objc_msgSend(*(id *)(a1 + 32), "addBiomeDataToCache:event:", v7, v3);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v5);
      v7 = (void *)v9;
    }
    else
    {
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_58_cold_1(v3);

    }
  }

}

void __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1A07F4000, v2, v3, "Error: Feedback Biome stream read did not complete successfully: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9_0();
}

void __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_58_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "eventBody");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1A07F4000, v2, v3, "Event donation from Sharesheet.Feedback biome stream was empty for event: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9_0();
}

@end

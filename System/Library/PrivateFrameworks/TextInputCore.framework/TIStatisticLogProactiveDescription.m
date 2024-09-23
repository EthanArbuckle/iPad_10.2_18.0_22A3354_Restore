@implementation TIStatisticLogProactiveDescription

void __TIStatisticLogProactiveDescription_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  char v9;
  unsigned int v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = (void *)MEMORY[0x1DF0A2708]();
  objc_msgSend(*(id *)(a1 + 32), "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D43428]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D432C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(__CFString **)(a1 + 40);
  if (!v6)
    v6 = CFSTR("NA");
  v7 = v6;
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D433B8])
    || v5
    && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v5, "isEqual:", v8),
        v8,
        (v9 & 1) == 0))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "triggerSourceType");
    if (v10 > 2)
      v11 = 0;
    else
      v11 = off_1EA0FBC68[v10];
    TIStatisticsCategoriesForProactiveTrigger(*(void **)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticLogProactiveInfo(*(void **)(a1 + 48), v11, v12, *(void **)(a1 + 56));
    +[_TIStatisticsProactiveTracker sharedInstance](_TIStatisticsProactiveTracker, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 64), "isEqualToString:", CFSTR("suggestion")))
    {
      TIStatisticsDescriptionToLegacyDescriptionDictionary();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "containsObject:", *(_QWORD *)(a1 + 56)))
        objc_msgSend(v13, "trackFailureWithDescription:description:categories:locale:fieldType:", objc_msgSend(*(id *)(a1 + 32), "triggerSourceType"), *(_QWORD *)(a1 + 56), v12, *(_QWORD *)(a1 + 48), v7);
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 64), "isEqualToString:", CFSTR("engagement")))
      {
LABEL_16:

        goto LABEL_17;
      }
      TIStatisticsEngagementDescriptionToLegacyDescriptionDictionary();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "containsObject:", *(_QWORD *)(a1 + 56)))
        objc_msgSend(v13, "trackEngagementFailureWithDescription:description:categories:locale:fieldType:", objc_msgSend(*(id *)(a1 + 32), "triggerSourceType"), *(_QWORD *)(a1 + 56), v12, *(_QWORD *)(a1 + 48), v7);
    }

    goto LABEL_16;
  }
LABEL_17:

  objc_autoreleasePoolPop(v2);
}

@end

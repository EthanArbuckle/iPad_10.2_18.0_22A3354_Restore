@implementation UIActivityHelper

void __53___UIActivityHelper_activityTypeForBundleIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.MobileSMS");
  v2[1] = CFSTR("com.apple.mobilemail");
  v3[0] = CFSTR("com.apple.UIKit.activity.Message");
  v3[1] = CFSTR("com.apple.UIKit.activity.Mail");
  v2[2] = CFSTR("com.apple.telephonyutilities.callservicesd");
  v3[2] = CFSTR("com.apple.UIKit.activity.SharePlay");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)activityTypeForBundleIdentifier__activityTypesForIdentifiers;
  activityTypeForBundleIdentifier__activityTypesForIdentifiers = v0;

}

void __55___UIActivityHelper_transportImageForBundleIdentifier___block_invoke()
{
  UISharePlayActivity *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v0 = objc_alloc_init(UISharePlayActivity);
  -[UISharePlayActivity activityImage](v0, "activityImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
    objc_msgSend(v4, "setObject:forKey:", v1, CFSTR("com.apple.telephonyutilities.callservicesd"));
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)transportImageForBundleIdentifier__transportImagesForIdentifiers;
  transportImageForBundleIdentifier__transportImagesForIdentifiers = v2;

}

void __66___UIActivityHelper_preheatAvailableActivitiesForMatchingContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "_backgroundPreheatBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    dispatch_async(*(dispatch_queue_t *)(a1 + 32), v3);
    v3 = v4;
  }

}

uint64_t __66___UIActivityHelper_orderedAvailableActivitiesForMatchingContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "orderedAvailableActivitiesForMatchingContext:");
}

void __66___UIActivityHelper_orderedAvailableActivitiesForMatchingContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  +[_UIActivityHelper builtinActivityClasses](_UIActivityHelper, "builtinActivityClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v5);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LODWORD(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  v9 = 48;
  if (v4 | v6)
    v9 = 40;
  v10 = *(id *)(a1 + v9);
  objc_msgSend(*(id *)(a1 + 56), "collaborationItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (_canPerformActivityWithItems(v3, v10, *(void **)(a1 + 64), v12))
  {
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v3);
    objc_msgSend(v3, "activityType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Print"));

    if (v14)
    {
      _UIActivityGetPrintingBasedActivities();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
            _setIsContentManagedIfResctrictableActivity(v20, *(unsigned __int8 *)(a1 + 80));
            if ((objc_msgSend(*(id *)(a1 + 56), "shouldExcludeActivity:", v20) & 1) == 0
              && _canPerformActivityWithItems(v20, v10, *(void **)(a1 + 64), v12))
            {
              objc_msgSend(*(id *)(a1 + 72), "addObject:", v20);
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v17);
      }

    }
  }

}

uint64_t __58___UIActivityHelper__activitiesByApplyingDefaultOrdering___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_defaultOrderingDescriptorForActivity:", a2);
}

uint64_t __58___UIActivityHelper__activitiesByApplyingDefaultOrdering___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activity");
}

@end

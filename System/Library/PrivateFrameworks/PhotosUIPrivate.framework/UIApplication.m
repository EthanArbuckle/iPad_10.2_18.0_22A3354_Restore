@implementation UIApplication

uint64_t __48__UIApplication_PhotosUI__pu_prepareCPAnalytics__block_invoke()
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x1E0D09910];
  objc_msgSend(MEMORY[0x1E0CB34D0], "pu_PhotosUIFrameworkBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateWithConfigurationFilename:inBundle:", CFSTR("CPAnalyticsConfig-PhotosUI"), v1);

  return PXAnalyticsPrepare();
}

void __62__UIApplication_PhotosUI__pu_startedAnimationSubTest_forTest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "stringByAppendingString:", CFSTR("-Latency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishedSubTest:forTest:", v3, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "startedSubTest:forTest:withMetrics:", CFSTR("Animation"), *(_QWORD *)(a1 + 48), &unk_1E59BAB58);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "stringByAppendingString:", CFSTR("-Animation"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedSubTest:forTest:withMetrics:", v5, *(_QWORD *)(a1 + 48), &unk_1E59BAB70);

}

void __46__UIApplication_PhotosUI__ppt_testDefinitions__block_invoke()
{
  void *v0;
  __CFString *v1;
  __CFString *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "userInterfaceIdiom") == 1)
    v1 = CFSTR("~ipad");
  else
    v1 = CFSTR("~iphone");
  v2 = v1;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = v2;
  v23[0] = v2;
  v23[1] = CFSTR("~iphone");
  v23[2] = CFSTR("~ipad");
  v23[3] = &stru_1E58AD278;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
LABEL_6:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundlePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("testDefinitions%@.plist"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "propertyListWithData:options:format:error:", v14, 0, 0, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)ppt_testDefinitions_testDefinitions;
      ppt_testDefinitions_testDefinitions = v15;

      v17 = ppt_testDefinitions_testDefinitions;
      if (v17)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v5)
          goto LABEL_6;
        break;
      }
    }
  }

}

id __62__UIApplication_Debugging__pu_firstViewControllerPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

uint64_t __60__UIApplication_Debugging__pu_debugCurrentPrivacyController__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_debugCurrentPrivacyController");
}

uint64_t __52__UIApplication_Debugging__pu_debugCurrentViewModel__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_debugCurrentViewModel");
}

uint64_t __59__UIApplication_Debugging__pu_debugCurrentlySelectedAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_debugCurrentlySelectedAssets");
}

uint64_t __63__UIApplication_Debugging__pu_debugCurrentPhotosViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __48__UIApplication_Debugging__pu_debugCurrentAsset__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_debugCurrentAsset");
}

@end

@implementation UIApplication(Debugging)

+ (uint64_t)pu_debugCurrentAsset
{
  return objc_msgSend(a1, "_pu_debugSearchViewControllerHierarchyUsingBlock:", &__block_literal_global_106123);
}

+ (uint64_t)pu_debugCurrentPhotosViewController
{
  return objc_msgSend(a1, "pu_firstViewControllerPassingTest:", &__block_literal_global_12);
}

+ (uint64_t)pu_debugCurrentlySelectedAssets
{
  return objc_msgSend(a1, "_pu_debugSearchViewControllerHierarchyUsingBlock:", &__block_literal_global_13_106122);
}

+ (uint64_t)pu_debugCurrentViewModel
{
  return objc_msgSend(a1, "_pu_debugSearchViewControllerHierarchyUsingBlock:", &__block_literal_global_14_106121);
}

+ (uint64_t)pu_debugCurrentPrivacyController
{
  return objc_msgSend(a1, "_pu_debugSearchViewControllerHierarchyUsingBlock:", &__block_literal_global_15);
}

+ (id)pu_firstViewControllerPassingTest:()Debugging
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__UIApplication_Debugging__pu_firstViewControllerPassingTest___block_invoke;
  v8[3] = &unk_1E58ABBF8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "_pu_debugSearchViewControllerHierarchyUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_pu_debugSearchViewControllerHierarchyUsingBlock:()Debugging
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "rootViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_pu_debugSearchViewController:usingBlock:", v11, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return v12;
}

+ (id)_pu_debugSearchViewController:()Debugging usingBlock:
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_msgSend(a1, "_pu_debugSearchViewController:usingBlock:", v8, v7),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "topViewController");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "selectedViewController");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v7[2](v7, v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            goto LABEL_13;
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          objc_msgSend(v6, "childViewControllers", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (!v14)
          {
LABEL_23:
            v9 = 0;
            goto LABEL_12;
          }
          v15 = v14;
          v16 = *(_QWORD *)v19;
LABEL_17:
          v17 = 0;
          while (1)
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v11);
            objc_msgSend(a1, "_pu_debugSearchViewController:usingBlock:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17), v7);
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
              break;
            if (v15 == ++v17)
            {
              v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
              if (v15)
                goto LABEL_17;
              goto LABEL_23;
            }
          }
LABEL_11:
          v9 = (void *)v12;
LABEL_12:

          goto LABEL_13;
        }
        objc_msgSend(v6, "viewControllerForColumn:", 2);
        v10 = objc_claimAutoreleasedReturnValue();
      }
    }
    v11 = (void *)v10;
    objc_msgSend(a1, "_pu_debugSearchViewController:usingBlock:", v10, v7);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_13:

  return v9;
}

@end

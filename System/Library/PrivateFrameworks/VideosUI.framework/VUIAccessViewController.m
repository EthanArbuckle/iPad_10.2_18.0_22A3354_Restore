@implementation VUIAccessViewController

void __35___VUIAccessViewController__allow___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _BOOL4 v3;
  void *v4;
  __CFString **v5;
  void *v6;
  void *v7;
  _QWORD block[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  _QWORD *v11;
  BOOL v12;
  const __CFString *v13;
  __CFString *v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = +[VUIAccessViewController _grantAccessToChannelIDs:isReconsent:](VUIAccessViewController, "_grantAccessToChannelIDs:isReconsent:", WeakRetained[129], *(unsigned __int8 *)(a1 + 40));
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = CFSTR("targetId");
    v15[1] = CFSTR("targetType");
    v16[0] = CFSTR("allow");
    v16[1] = CFSTR("button");
    v16[2] = CFSTR("allow");
    v15[2] = CFSTR("actionType");
    v15[3] = CFSTR("actionDetails");
    v13 = CFSTR("result");
    v5 = VUIMetricsActionDetailsResultSuccess;
    if (!v3)
      v5 = VUIMetricsActionDetailsResultFail;
    v14 = *v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordClick:", v7);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v9 = __35___VUIAccessViewController__allow___block_invoke_2;
    v10 = &unk_1E9F9A5F8;
    v11 = WeakRetained;
    v12 = v3;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v9((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __35___VUIAccessViewController__allow___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_completeWithStatus:", 1);
  NSLog(CFSTR("VUIAccessViewController: failed to sync settings after user gave consent. Prompt alert."));
  v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35___VUIAccessViewController__allow___block_invoke_3;
  v6[3] = &unk_1E9F98DF0;
  v6[4] = v5;
  return objc_msgSend(v5, "_presentGenericErrorWithCompletion:", v6);
}

uint64_t __35___VUIAccessViewController__allow___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_toggleLoadingScreen");
}

void __38___VUIAccessViewController__disallow___block_invoke(uint64_t a1)
{
  id *v1;
  _BYTE *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[1040])
  {
    objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __38___VUIAccessViewController__disallow___block_invoke_2;
    v11 = &unk_1E9F9D178;
    v5 = v4;
    v12 = v5;
    v13 = v3;
    objc_copyWeak(&v14, v1);
    objc_msgSend(v5, "refreshWithCompletion:", &v8);
    objc_destroyWeak(&v14);

  }
  else
  {
    objc_msgSend(WeakRetained, "_completeWithStatus:", 3);
  }
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("targetId");
  v15[1] = CFSTR("targetType");
  v16[0] = CFSTR("disallow");
  v16[1] = CFSTR("button");
  v15[2] = CFSTR("actionType");
  v16[2] = CFSTR("disallow");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordClick:", v7);

}

void __38___VUIAccessViewController__disallow___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD block[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "beginIgnoringChanges");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 40) + 992);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        NSLog(CFSTR("VUIAccessViewController: deny access for %@"), v7);
        objc_msgSend(MEMORY[0x1E0DC8780], "sharedInstanceFiltered");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "channelIDForBundleID:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        WLKSubscriptionIdentifierForBundleID();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setStatus:forChannelID:externalID:", 2, v9, v10);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "endIgnoringChanges");
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "synchronize:", 0);

  if ((v12 & 1) == 0)
    NSLog(CFSTR("VUIAccessViewController: failed to sync settings after user declined consent. Failing silently"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___VUIAccessViewController__disallow___block_invoke_3;
  block[3] = &unk_1E9F99C98;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v14);
}

void __38___VUIAccessViewController__disallow___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[121], "showNackScreen");
    objc_msgSend(v2, "_toggleLoadingScreen");
    WeakRetained = v2;
  }

}

void __48___VUIAccessViewController__completeWithStatus___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[132];
    if (v4)
    {
      v6 = v3;
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 40), v3[124]);
      v5 = (void *)v6[132];
      v6[132] = 0;

      v3 = v6;
    }
  }

}

void __47___VUIAccessViewController__fetchRemoteAppInfo__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  id *from;
  id obj;
  _QWORD block[5];
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  from = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__39;
    v36 = __Block_byref_object_dispose__39;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = WeakRetained[128];
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v2)
    {
      v3 = *(_QWORD *)v29;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v29 != v3)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v4);
          v22 = 0;
          v23 = &v22;
          v24 = 0x3032000000;
          v25 = __Block_byref_object_copy__39;
          v26 = __Block_byref_object_dispose__39;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", from);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "name");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v23[5], "setObject:forKeyedSubscript:", v6, CFSTR("appName"));

          objc_msgSend(WeakRetained, "_iconSize");
          v8 = v7;
          v10 = v9;
          v11 = dispatch_semaphore_create(0);
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __47___VUIAccessViewController__fetchRemoteAppInfo__block_invoke_122;
          v17[3] = &unk_1E9FA5B10;
          v20 = v8;
          v21 = v10;
          v19 = &v22;
          v12 = v11;
          v18 = v12;
          +[VUIAppIconImageService fetchIconForInstallable:size:completion:](VUIAppIconImageService, "fetchIconForInstallable:size:completion:", v5, v17, v8, v10);
          dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
          objc_msgSend((id)v33[5], "addObject:", v23[5]);

          _Block_object_dispose(&v22, 8);
          ++v4;
        }
        while (v2 != v4);
        v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v2);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47___VUIAccessViewController__fetchRemoteAppInfo__block_invoke_2;
    block[3] = &unk_1E9FA5B38;
    objc_copyWeak(&v16, from);
    block[4] = &v32;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v16);
    _Block_object_dispose(&v32, 8);

  }
}

intptr_t __47___VUIAccessViewController__fetchRemoteAppInfo__block_invoke_122(uint64_t a1, void *a2)
{
  void *v3;

  if (a2)
  {
    objc_msgSend(a2, "vui_iconImageOfSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v3, CFSTR("appIcon"));

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __47___VUIAccessViewController__fetchRemoteAppInfo__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObjectsFromArray:", WeakRetained[127]);
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "copy");
    v4 = (void *)v5[127];
    v5[127] = v3;

    objc_msgSend(v5, "_setupAccessViews");
    objc_msgSend(v5, "_toggleLoadingScreen");
    WeakRetained = v5;
  }

}

void __49___VUIAccessViewController_cappedTraitCollection__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DC48C8];
  v4[0] = *MEMORY[0x1E0DC48D0];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0DC48B8];
  v4[2] = *MEMORY[0x1E0DC48C0];
  v4[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)cappedTraitCollection_cappedSizes;
  cappedTraitCollection_cappedSizes = v2;

}

- (VUIAccessViewController)initWithBundleIDs:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  VUIAccessViewController *v11;
  _VUIAccessViewController *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VUIAccessViewController;
  v11 = -[VUIAccessViewController init](&v16, sel_init);
  if (v11)
  {
    v12 = -[_VUIAccessViewController initWithBundleIDs:channels:consentCancelButtonType:options:completionHandler:]([_VUIAccessViewController alloc], "initWithBundleIDs:channels:consentCancelButtonType:options:completionHandler:", v8, 0, 0, v9, v10);
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessViewController setViewControllers:](v11, "setViewControllers:", v13);

    -[VUIAccessViewController navigationBar](v11, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setHidesShadow:", 1);
    objc_msgSend(v14, "_setDisableBlurTinting:", 1);

  }
  return v11;
}

- (VUIAccessViewController)initWithChannels:(id)a3 options:(id)a4 consentCancelButtonType:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  VUIAccessViewController *v13;
  _VUIAccessViewController *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VUIAccessViewController;
  v13 = -[VUIAccessViewController init](&v18, sel_init);
  if (v13)
  {
    v14 = -[_VUIAccessViewController initWithBundleIDs:channels:consentCancelButtonType:options:completionHandler:]([_VUIAccessViewController alloc], "initWithBundleIDs:channels:consentCancelButtonType:options:completionHandler:", 0, v10, a5, v11, v12);
    v19[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessViewController setViewControllers:](v13, "setViewControllers:", v15);

    -[VUIAccessViewController navigationBar](v13, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setHidesShadow:", 1);
    objc_msgSend(v16, "_setDisableBlurTinting:", 1);

  }
  return v13;
}

+ (BOOL)grantAccessToBundleIDs:(id)a3
{
  return +[VUIAccessViewController _grantAccessToBundleIDs:](VUIAccessViewController, "_grantAccessToBundleIDs:", a3);
}

+ (BOOL)_grantAccessToBundleIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0DC8838], "synchronizeSettingsFromCloudIfNeeded:", 0) & 1) != 0)
  {
    objc_msgSend(v5, "beginIgnoringChanges");
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          NSLog(CFSTR("VUIAccessViewController: grant access for %@"), v11);
          objc_msgSend(MEMORY[0x1E0DC8780], "sharedInstanceFiltered");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "channelIDForBundleID:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          WLKSubscriptionIdentifierForBundleID();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setStatus:forChannelID:externalID:", 1, v13, v14);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    objc_msgSend(a1, "optInUser");
    objc_msgSend(v5, "endIgnoringChanges");
    objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "synchronize:", 0);

    v4 = v18;
  }
  else
  {
    NSLog(CFSTR("VUIAccessViewController: failed to sync settings from cloud"));
    v16 = 0;
  }

  return v16;
}

+ (BOOL)_grantAccessToChannelIDs:(id)a3 isReconsent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0DC8838], "synchronizeSettingsFromCloudIfNeeded:", 0) & 1) != 0)
  {
    objc_msgSend(v7, "beginIgnoringChanges");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          NSLog(CFSTR("VUIAccessViewController: grant access for %@"), v12);
          objc_msgSend(v7, "setStatus:forChannelID:externalID:", 1, v12, 0);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    objc_msgSend(a1, "optInUser");
    objc_msgSend(v7, "endIgnoringChanges");
    objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(a1) = objc_msgSend(v13, "synchronize:", 0);

    if ((a1 & v4) == 1)
    {
      NSLog(CFSTR("VUIAccessViewController: reconsent flag set, sending force update"));
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      v14 = dispatch_semaphore_create(0);
      objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
      a1 = (id)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __64__VUIAccessViewController__grantAccessToChannelIDs_isReconsent___block_invoke;
      v17[3] = &unk_1E9FA5B80;
      v19 = &v20;
      v15 = v14;
      v18 = v15;
      objc_msgSend(a1, "forceUpdateWithCompletion:", v17);

      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      LOBYTE(a1) = *((_BYTE *)v21 + 24) != 0;

      _Block_object_dispose(&v20, 8);
    }
  }
  else
  {
    NSLog(CFSTR("VUIAccessViewController: failed to sync settings from cloud"));
    LOBYTE(a1) = 0;
  }

  return (char)a1;
}

intptr_t __64__VUIAccessViewController__grantAccessToChannelIDs_isReconsent___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)optInUser
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "optedIn") & 1) == 0)
  {
    NSLog(CFSTR("VUIAccessViewController: Opting user in."));
    objc_msgSend(v3, "setOptedIn:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLastSyncDate:", v2);

  }
}

+ (id)eligibleBundleIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC8750], "defaultAppLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscribedAppBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC8780], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedChannels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v12, "isWatchListEnabled") && (objc_msgSend(v12, "isFirstParty") & 1) == 0)
        {
          objc_msgSend(v12, "appBundleIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v3, "containsObject:", v14))
          {
            WLKSubscriptionIdentifierForBundleID();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "channelID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "settingsForChannelID:externalID:", v16, v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17 || !objc_msgSend(v17, "accessStatus"))
              objc_msgSend(v19, "addObject:", v14);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v19;
}

+ (void)resolveBundleIDs:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  NSLog(CFSTR("VUIAccessViewController - resolveBundleIDs: proposed IDs: %@"), v5);
  objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__VUIAccessViewController_resolveBundleIDs_completionHandler___block_invoke;
  v10[3] = &unk_1E9F9C600;
  v11 = v5;
  v12 = v6;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "fetchConfigurationWithCompletionHandler:", v10);

}

void __62__VUIAccessViewController_resolveBundleIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD aBlock[4];
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__VUIAccessViewController_resolveBundleIDs_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E9F9E5B8;
  v17 = *(id *)(a1 + 40);
  v8 = _Block_copy(aBlock);
  v9 = v8;
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __62__VUIAccessViewController_resolveBundleIDs_completionHandler___block_invoke_3;
    block[3] = &unk_1E9FA5BA8;
    v12 = v5;
    v14 = *(id *)(a1 + 40);
    v15 = v9;
    v13 = *(id *)(a1 + 32);
    dispatch_async(v10, block);

  }
  else
  {
    (*((void (**)(void *, id))v8 + 2))(v8, v6);
  }

}

void __62__VUIAccessViewController_resolveBundleIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    if (!v3)
    {
      NSLog(CFSTR("VUIAccessViewController - handling error: %@"), 0);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VUIAccessErrorDomain"), -1, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
    }
    v5 = v3;
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, MEMORY[0x1E0C9AA60], v3);
    v3 = v5;
  }

}

void __62__VUIAccessViewController_resolveBundleIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void (*v25)(void);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v1 = a1;
  v43 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "vppaStatus") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v1 + 48) + 16))(*(_QWORD *)(v1 + 48), MEMORY[0x1E0C9AA60], 0);
    return;
  }
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ams_DSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v40 = 0;
    v6 = objc_msgSend(MEMORY[0x1E0DC8838], "synchronizeSettingsFromCloudIfNeeded:", &v40);
    v7 = v40;
    v8 = v7;
    if ((v6 & 1) == 0)
    {
      NSLog(CFSTR("VUIAccessViewController - resolveBundleIDs: Error, failed to sync settings"));
      v25 = *(void (**)(void))(*(_QWORD *)(v1 + 56) + 16);
      goto LABEL_34;
    }

  }
  objc_msgSend(MEMORY[0x1E0DC8780], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orderedChannels");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v26 = v5;
    v27 = v3;
    objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = v8;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v37;
      v30 = v8;
      v31 = v1;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v37 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v14, "appBundleIDs");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isWatchListEnabled") && objc_msgSend(*(id *)(v1 + 40), "count"))
          {
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            v16 = *(id *)(v1 + 40);
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v33;
              while (2)
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v33 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
                  if (objc_msgSend(v15, "containsObject:", v21))
                  {
                    WLKSubscriptionIdentifierForBundleID();
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v14, "channelID");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "settingsForChannelID:externalID:", v23, v22);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    if ((!v24 || !objc_msgSend(v24, "accessStatus"))
                      && (objc_msgSend(v28, "containsObject:", v21) & 1) == 0)
                    {
                      objc_msgSend(v28, "addObject:", v21);
                    }

                    goto LABEL_28;
                  }
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
                if (v18)
                  continue;
                break;
              }
            }
LABEL_28:

            v8 = v30;
            v1 = v31;
          }

        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v11);
    }

    NSLog(CFSTR("VUIAccessViewController - resolved bundles: %@"), v28);
    (*(void (**)(void))(*(_QWORD *)(v1 + 48) + 16))();

    v5 = v26;
    v3 = v27;
    goto LABEL_35;
  }
  NSLog(CFSTR("VUIAccessViewController - resolveBundleIDs: Error, no channels"));
  v25 = *(void (**)(void))(*(_QWORD *)(v1 + 56) + 16);
LABEL_34:
  v25();
LABEL_35:

}

+ (BOOL)isHostedInRemoteViewService
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.TVAccessViewService"));
  return (char)v2;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (!v4)
    return 2;
  v6.receiver = self;
  v6.super_class = (Class)VUIAccessViewController;
  return -[VUIAccessViewController supportedInterfaceOrientations](&v6, sel_supportedInterfaceOrientations);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end

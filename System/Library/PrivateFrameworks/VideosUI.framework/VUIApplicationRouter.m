@implementation VUIApplicationRouter

id __52__VUIApplicationRouter_topMostVisibleViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "vuiPresentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      objc_msgSend(v2, "vuiPresentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "vuiPresentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "visibleViewController");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

+ (id)topPresentedViewController
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "currentNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vuiPresentedViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    while (1)
    {
      objc_msgSend(v2, "vuiPresentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      objc_msgSend(v2, "vuiPresentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "vuiPresentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v7;
      if (!v4)
        return v7;
    }
  }
  v7 = v2;
  return v7;
}

+ (id)topMostVisibleViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled"))
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "rootPresentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __52__VUIApplicationRouter_topMostVisibleViewController__block_invoke((uint64_t)v3, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "topPresentedViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    __52__VUIApplicationRouter_topMostVisibleViewController__block_invoke((uint64_t)v2, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "vuiSelectedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __52__VUIApplicationRouter_topMostVisibleViewController__block_invoke((uint64_t)v5, v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

+ (id)currentNavigationController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[VUICurrentSiriNavControllerContainer sharedInstance](VUICurrentSiriNavControllerContainer, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentSiriNavController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[VUICurrentSiriNavControllerContainer sharedInstance](VUICurrentSiriNavControllerContainer, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentSiriNavController");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rootViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v8, "conformsToProtocol:", &unk_1F0283FC8))
      {
        v5 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v8, "currentNavigationController");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v9;
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v3, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v5;
}

+ (id)eventDataSourceForEvent:(id)a3 routerDataSource:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (!v6)
    goto LABEL_10;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("play")) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", CFSTR("autoPlay")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("select")))
    {
      objc_msgSend(v6, "selectEventDataSource");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("contextmenu")))
    {
      objc_msgSend(v6, "contextMenuEventDataSource");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "playEventDataSource");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v8 = (void *)v7;
LABEL_11:

  return v8;
}

+ (BOOL)handleAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled"))
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "controllerPresenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "handleAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:", v7, v8, v5);
  }
  else
  {
    +[VUIApplicationRouter _handleAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:isModalPresentation:originalNavigationController:](VUIApplicationRouter, "_handleAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:isModalPresentation:originalNavigationController:", v7, v8, v5, 1, 0);
  }

  return 0;
}

+ (void)pushAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5 fromNavigationController:(id)a6
{
  +[VUIApplicationRouter _handleAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:isModalPresentation:originalNavigationController:](VUIApplicationRouter, "_handleAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:isModalPresentation:originalNavigationController:", a3, a4, a5, 0, a6);
}

+ (BOOL)_handleEvent:(id)a3 targetResponder:(id)a4 appContext:(id)a5 eventDataSource:(id)a6 documentOptions:(id)a7 extraInfo:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSince1970");
  v18 = v17;

  if (v14)
  {
    objc_msgSend((id)objc_opt_class(), "_performForType:targetResponder:appContext:eventDataSource:documentOptions:", 0, v12, v13, v14, v15);
    if (a8)
    {
      if (*a8)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isHandled"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (uint64_t)(v18 * 1000.0));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("eventTimeStamp"));

        *a8 = (id)objc_msgSend(v19, "copy");
      }
      else
      {
        v23[0] = CFSTR("isHandled");
        v23[1] = CFSTR("eventTimeStamp");
        v24[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (uint64_t)(v18 * 1000.0));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return 0;
}

+ (void)_performForType:(int64_t)a3 targetResponder:(id)a4 appContext:(id)a5 eventDataSource:(id)a6 documentOptions:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  switch(a3)
  {
    case 0:
      objc_msgSend(v14, "preActionDocumentDataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "preAction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 1;
      if (v16)
        goto LABEL_6;
      goto LABEL_8;
    case 1:
      objc_msgSend(v14, "documentDataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "action");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 2;
      if (v16)
        goto LABEL_6;
      goto LABEL_8;
    case 2:
      objc_msgSend(v14, "postActionDocumentDataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postAction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 3;
      if (v16)
      {
LABEL_6:
        v19 = (void *)objc_opt_class();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke;
        v31[3] = &unk_1E9F99B50;
        v36 = a1;
        v37 = v18;
        v32 = v12;
        v33 = v13;
        v34 = v14;
        v35 = v15;
        objc_msgSend(v19, "_handleDocumentDataSource:targetResponder:appContext:documentOptions:completion:", v16, v32, v33, v35, v31);

      }
      else
      {
LABEL_8:
        if (v17)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("playlistCollectionViewModel"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setCollectionViewModel:", v20);

          }
          objc_msgSend(v14, "action");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if (v21)
            v23 = (void *)v21;
          else
            v23 = v17;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke_3;
          v24[3] = &unk_1E9F99B78;
          v29 = a1;
          v30 = v18;
          v25 = v12;
          v26 = v13;
          v27 = v14;
          v28 = v15;
          +[VUIApplicationRouter invokeAction:primaryAction:targetResponder:completion:](VUIApplicationRouter, "invokeAction:primaryAction:targetResponder:completion:", v17, v23, v25, v24);

        }
        else
        {
LABEL_15:
          objc_msgSend((id)objc_opt_class(), "_performForType:targetResponder:appContext:eventDataSource:documentOptions:", v18, v12, v13, v14, v15);
        }
      }
LABEL_16:

      return;
    case 3:
      goto LABEL_16;
    default:
      v18 = 3;
      goto LABEL_15;
  }
}

void __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke_2;
  v3[3] = &unk_1E9F99B50;
  v2 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = v2;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend((id)objc_opt_class(), "_performForType:targetResponder:appContext:eventDataSource:documentOptions:", a1[9], a1[4], a1[5], a1[6], a1[7]);
}

void __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke_4;
    v4[3] = &unk_1E9F99B50;
    v3 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = v3;
    v5 = *(id *)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke_4(_QWORD *a1)
{
  return objc_msgSend((id)objc_opt_class(), "_performForType:targetResponder:appContext:eventDataSource:documentOptions:", a1[9], a1[4], a1[5], a1[6], a1[7]);
}

+ (void)invokeAction:(id)a3 targetResponder:(id)a4 completion:(id)a5
{
  +[VUIApplicationRouter invokeAction:primaryAction:targetResponder:completion:](VUIApplicationRouter, "invokeAction:primaryAction:targetResponder:completion:", a3, a3, a4, a5);
}

+ (void)invokeAction:(id)a3 primaryAction:(id)a4 targetResponder:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "isAccountRequired")
    && !+[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount")
    && +[VUIAuthenticationManager allowsAccountModification](VUIAuthenticationManager, "allowsAccountModification"))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__VUIApplicationRouter_invokeAction_primaryAction_targetResponder_completion___block_invoke_2;
    v18[3] = &unk_1E9F99BA0;
    v13 = &v19;
    v19 = v9;
    v20 = v11;
    v22 = v12;
    v14 = v10;
    v21 = v14;
    v15 = v12;
    +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:withCompletionHandler:](VUIAuthenticationManager, "requestAuthenticationAlwaysPrompt:withCompletionHandler:", 1, v18);
    VUIDefaultLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "VUIApplicationRouter - VUIApplicationRouter::Authentication requested for action: %@", buf, 0xCu);
    }

  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __78__VUIApplicationRouter_invokeAction_primaryAction_targetResponder_completion___block_invoke;
    v23[3] = &unk_1E9F98E18;
    v13 = &v24;
    v24 = v12;
    v17 = v12;
    objc_msgSend(v9, "performWithTargetResponder:completionHandler:", v11, v23);
  }

}

uint64_t __78__VUIApplicationRouter_invokeAction_primaryAction_targetResponder_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__VUIApplicationRouter_invokeAction_primaryAction_targetResponder_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__VUIApplicationRouter_invokeAction_primaryAction_targetResponder_completion___block_invoke_3;
    v10[3] = &unk_1E9F98E18;
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v6, "performWithTargetResponder:completionHandler:", v7, v10);

  }
  else
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIApplicationRouter - VUIApplicationRouter::Authentication request failed for action: %@, error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __78__VUIApplicationRouter_invokeAction_primaryAction_targetResponder_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_navigateAccountSettingsWithDestinationViewController:(id)a3 shouldEmbedInNavController:(BOOL)a4 isModalPresentation:(BOOL)a5 originalNavigationController:(id)a6
{
  _BOOL4 v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a4;
  v13 = a3;
  if (!a6 || a5)
  {
    objc_msgSend(a1, "currentNavigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v13);
      objc_msgSend(v12, "setModalPresentationStyle:", 2);
      objc_msgSend(v11, "presentViewController:animated:completion:", v12, 1, 0);

    }
    else
    {
      objc_msgSend(v10, "setModalPresentationStyle:", 2);
      objc_msgSend(v11, "presentViewController:animated:completion:", v13, 1, 0);
    }

  }
  else
  {
    objc_msgSend(a6, "pushViewController:animated:", v13, 1);
  }

}

+ (void)_amsBagURLForKey:(id)a3 withCompletion:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a4;
  v5 = (void *)MEMORY[0x1E0DB1840];
  v6 = a3;
  objc_msgSend(v5, "app");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v9[2](v9, v8);

}

+ (void)_handleAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5 isModalPresentation:(BOOL)a6 originalNavigationController:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  BOOL v34;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (v12)
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ams_activeiTunesAccount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDED8]), "initWithBag:account:clientInfo:", v15, v17, 0);
      +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "getMetricsOverlayForWebContainer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setMetricsOverlay:", v20);
      v21 = (id)objc_msgSend(v18, "loadURL:", v12);
      objc_msgSend(a1, "_navigateAccountSettingsWithDestinationViewController:shouldEmbedInNavController:isModalPresentation:originalNavigationController:", v18, 1, v8, v14);

    }
    else
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD8000]), "initWithAccountURL:", v12);
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "openURLHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isRedeemURL:", v12);

      if (v29)
      {
        +[SKAccountPageHandler sharedInstance](SKAccountPageHandler, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setDelegate:", v30);

      }
      objc_msgSend(a1, "_navigateAccountSettingsWithDestinationViewController:shouldEmbedInNavController:isModalPresentation:originalNavigationController:", v15, 0, v8, v14);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (objc_msgSend(v13, "length"))
  {
    if (!v9)
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __132__VUIApplicationRouter__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView_isModalPresentation_originalNavigationController___block_invoke;
      v31[3] = &unk_1E9F99BF0;
      v33 = a1;
      v34 = v8;
      v32 = v14;
      objc_msgSend(a1, "_amsBagURLForKey:withCompletion:", v13, v31);

      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ams_activeiTunesAccount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDED8]), "initWithBag:account:clientInfo:", v15, v23, 0);
    objc_msgSend(v15, "URLForKey:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v24, "loadBagValue:", v25);

    objc_msgSend(a1, "_navigateAccountSettingsWithDestinationViewController:shouldEmbedInNavController:isModalPresentation:originalNavigationController:", v24, 1, v8, v14);
    goto LABEL_10;
  }
LABEL_11:

}

void __132__VUIApplicationRouter__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView_isModalPresentation_originalNavigationController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  __int128 v9;
  char v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __132__VUIApplicationRouter__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView_isModalPresentation_originalNavigationController___block_invoke_2;
  block[3] = &unk_1E9F99BC8;
  v8 = v3;
  v10 = *(_BYTE *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v9 = v6;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __132__VUIApplicationRouter__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView_isModalPresentation_originalNavigationController___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD8000]), "initWithAccountURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "_navigateAccountSettingsWithDestinationViewController:shouldEmbedInNavController:isModalPresentation:originalNavigationController:", v2, 0, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

+ (BOOL)_handleDocumentDataSource:(id)a3 targetResponder:(id)a4 appContext:(id)a5 documentOptions:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void (**v20)(_QWORD);
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char isKindOfClass;
  uint64_t v45;
  id v46;
  void *v47;
  BOOL v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  void (**v80)(_QWORD);
  _QWORD v81[4];
  id v82;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend((id)objc_opt_class(), "topPresentedViewController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, 0);
    objc_msgSend((id)objc_opt_class(), "topPresentedViewController");
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v17;
  }
  objc_msgSend(v11, "uiConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v14)
    {
      v19 = objc_msgSend(v14, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v35 = (void *)v19;
    v72 = v14;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v35, "setObject:forKey:", v12, CFSTR("sourceView"));
    }
    v36 = v12;
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v35, "copy");
    v39 = v13;
    objc_msgSend(v37, "viewControllerWithDocumentDataSource:appContext:documentOptions:", v11, v13, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v68 = v15;
      objc_msgSend(v16, "vuiPresentedViewController");
      v41 = objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        v42 = (void *)v41;
        objc_msgSend(v16, "vuiPresentedViewController");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v16, "vuiPresentedViewController");
          v45 = objc_claimAutoreleasedReturnValue();

          v16 = (id)v45;
        }
      }
      v46 = v18;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v47 = v36;
      else
        v47 = 0;
      objc_msgSend(v46, "setSourceView:", v47);

      v15 = v68;
    }
    if (v40)
    {
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __104__VUIApplicationRouter__handleDocumentDataSource_targetResponder_appContext_documentOptions_completion___block_invoke;
      v81[3] = &unk_1E9F98E18;
      v82 = v15;
      +[VUIPresenterController presentViewController:fromViewController:WithConfiguration:completion:](VUIPresenterController, "presentViewController:fromViewController:WithConfiguration:completion:", v40, v16, v18, v81);

    }
    v48 = 1;
    v34 = v39;
    v14 = v72;
    goto LABEL_48;
  }
  if (objc_msgSend(v18, "type") == 6
    || objc_msgSend(v18, "type") == 8
    || objc_msgSend(v18, "type") == 7
    || objc_msgSend(v18, "type") == 10
    || objc_msgSend(v18, "type") == 16
    || objc_msgSend(v18, "type") == 12)
  {
    v20 = (void (**)(_QWORD))v15;
    v71 = v12;
    v21 = v13;
    objc_msgSend(v16, "vuiPresentedViewController");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      objc_msgSend(v16, "vuiPresentedViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v25 = objc_opt_isKindOfClass();

      if ((v25 & 1) != 0)
      {
        objc_msgSend(v16, "vuiPresentedViewController");
        v26 = objc_claimAutoreleasedReturnValue();

        v16 = (id)v26;
      }
    }
    objc_msgSend(v18, "viewControllerIdentifier");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      objc_msgSend(v18, "viewControllerIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "length");

      if (v30)
      {
        v31 = (void *)objc_opt_class();
        objc_msgSend(v18, "viewControllerIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_viewControllerWithIdentifier:", v32);
        v33 = objc_claimAutoreleasedReturnValue();

        v16 = (id)v33;
      }
    }
    v34 = v21;
    v15 = v20;
    if (v16)
    {
      if (objc_msgSend(v18, "type") == 8)
      {
        +[VUIPresenterController popOrDismissViewController:completion:](VUIPresenterController, "popOrDismissViewController:completion:", v16, v20);
LABEL_39:
        v48 = 1;
LABEL_47:
        v36 = v71;
        goto LABEL_48;
      }
      if (objc_msgSend(v18, "type") == 12 || objc_msgSend(v18, "type") == 16)
      {
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __104__VUIApplicationRouter__handleDocumentDataSource_targetResponder_appContext_documentOptions_completion___block_invoke_2;
        v74[3] = &unk_1E9F99C18;
        v75 = v18;
        v76 = v11;
        v77 = v21;
        v78 = v14;
        v16 = v16;
        v79 = v16;
        v80 = v20;
        +[VUIPresenterController popOrDismissViewController:completion:](VUIPresenterController, "popOrDismissViewController:completion:", v16, v74);

        goto LABEL_39;
      }
      if (objc_msgSend(v18, "type") == 6)
      {
        +[VUIPresenterController popViewController:completion:](VUIPresenterController, "popViewController:completion:", v16, v20);
        goto LABEL_39;
      }
      if (objc_msgSend(v18, "type") == 7)
      {
        +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "isShowingExtras");

        if (!v50)
          goto LABEL_45;
        +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "extrasNavigationController");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v69, "topViewController");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "presentedViewController");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "presentedViewController");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "presentedViewController");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = v21;
        if (!v55)
        {
          v15 = v20;
          v20[2](v20);
        }
        else
        {
LABEL_45:
          v15 = v20;
          +[VUIPresenterController dismissViewController:completion:](VUIPresenterController, "dismissViewController:completion:", v16, v20);
        }
        goto LABEL_39;
      }
    }
    v48 = 0;
    goto LABEL_47;
  }
  v70 = v15;
  v57 = objc_msgSend(v18, "type");
  if (v57 == 15)
    objc_msgSend(v11, "setShouldUseZoomTransition:", 1);
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "viewControllerWithDocumentDataSource:appContext:documentOptions:", v11, v13, v14);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v59 = v16;
  else
    v59 = 0;
  v60 = v59;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v61 = v12;
  else
    v61 = 0;
  v62 = v61;
  objc_msgSend(v11, "contextData");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "contextDataDict");
  v73 = v14;
  v67 = v13;
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("presentationSourceID"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v70;
  +[VUIPresenterController pushViewController:fromViewController:withZoomTransition:sourceView:presentationSourceID:isAnimated:completion:](VUIPresenterController, "pushViewController:fromViewController:withZoomTransition:sourceView:presentationSourceID:isAnimated:completion:", v66, v60, v57 == 15, v62, v65, objc_msgSend(v18, "isAnimated"), v70);

  v36 = v12;
  v34 = v67;
  v14 = v73;

  v48 = 1;
LABEL_48:

  return v48;
}

uint64_t __104__VUIApplicationRouter__handleDocumentDataSource_targetResponder_appContext_documentOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __104__VUIApplicationRouter__handleDocumentDataSource_targetResponder_appContext_documentOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v2 == 16)
    objc_msgSend(*(id *)(a1 + 40), "setShouldUseZoomTransition:", 1);
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerWithDocumentDataSource:appContext:documentOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = *(void **)(a1 + 64);
  else
    v4 = 0;
  v5 = v4;
  if (v7)
  {
    +[VUIPresenterController pushViewController:fromViewController:withZoomTransition:sourceView:presentationSourceID:isAnimated:completion:](VUIPresenterController, "pushViewController:fromViewController:withZoomTransition:sourceView:presentationSourceID:isAnimated:completion:", v7, v5, v2 == 16, 0, 0, objc_msgSend(*(id *)(a1 + 32), "isAnimated"), *(_QWORD *)(a1 + 72));
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 72);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }

}

+ (void)dismissPresentedViewController
{
  objc_msgSend(a1, "_dismissPresentedViewControllerWithCompletion:", 0);
}

+ (void)dismissOrPopViewControllerWithId:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t (**v10)(_QWORD);
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD aBlock[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__VUIApplicationRouter_dismissOrPopViewControllerWithId_completion___block_invoke;
  aBlock[3] = &unk_1E9F99C40;
  v8 = v5;
  v15 = v8;
  v9 = (void (**)(_QWORD))v6;
  v16 = v9;
  v10 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
  if (!+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled") || (v10[2](v10) & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "_viewControllerWithIdentifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __68__VUIApplicationRouter_dismissOrPopViewControllerWithId_completion___block_invoke_2;
      v12[3] = &unk_1E9F98E68;
      v13 = v9;
      +[VUIPresenterController popOrDismissViewController:completion:](VUIPresenterController, "popOrDismissViewController:completion:", v11, v12);

    }
    else if (v9)
    {
      v9[2](v9);
    }

  }
}

uint64_t __68__VUIApplicationRouter_dismissOrPopViewControllerWithId_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllerPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && objc_msgSend(*(id *)(a1 + 32), "length"))
    v4 = objc_msgSend(v3, "dismissViewControllerWithID:animated:completion:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));
  else
    v4 = 0;

  return v4;
}

uint64_t __68__VUIApplicationRouter_dismissOrPopViewControllerWithId_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)dismissOrPopLastViewControllerWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "topPresentedViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[VUIPresenterController popOrDismissViewController:completion:](VUIPresenterController, "popOrDismissViewController:completion:", v4, v3);

}

+ (void)_dismissPresentedViewControllerWithCompletion:(id)a3
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD v17[4];
  void (**v18)(_QWORD);

  v3 = (void (**)(_QWORD))a3;
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vuiPresentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "vuiPresentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v6, "vuiPresentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v10, "topViewController");
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DC6A30], "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __70__VUIApplicationRouter__dismissPresentedViewControllerWithCompletion___block_invoke;
        v17[3] = &unk_1E9F99C68;
        v14 = (id *)&v18;
        v18 = v3;
        objc_msgSend(v13, "dismissViewController:animated:completion:", v11, 1, v17);

      }
      else
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __70__VUIApplicationRouter__dismissPresentedViewControllerWithCompletion___block_invoke_2;
        v15[3] = &unk_1E9F98E68;
        v14 = (id *)&v16;
        v16 = v3;
        objc_msgSend(v6, "vui_dismissViewControllerAnimated:completion:", 1, v15);
      }

    }
  }
  else if (v3)
  {
    v3[2](v3);
  }

}

uint64_t __70__VUIApplicationRouter__dismissPresentedViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __70__VUIApplicationRouter__dismissPresentedViewControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)_viewControllerWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "currentNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    while (1)
    {
      objc_msgSend(v4, "vuiChildViewControllers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
        break;
LABEL_10:
      objc_msgSend(v4, "vuiPresentedViewController");
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
      if (!v9)
      {
        v10 = 0;
        v4 = 0;
        goto LABEL_17;
      }
    }
    v6 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "vuiViewControllerIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      if (objc_msgSend(v8, "length") && objc_msgSend(v8, "isEqualToString:", v3))
        break;

      if (++v6 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_10;
    }
    if (objc_msgSend(v5, "indexOfObject:", v7)
      || (objc_msgSend(v4, "vuiPresentingViewController"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11 = v4,
          !v12))
    {
      v11 = v7;
    }
    v10 = v11;

  }
  else
  {
    v10 = 0;
  }
LABEL_17:

  return v10;
}

+ (BOOL)handleEvent:(id)a3 targetResponder:(id)a4 appContext:(id)a5 routerDataSource:(id)a6 supplementaryData:(id)a7 extraInfo:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend((id)objc_opt_class(), "eventDataSourceForEvent:routerDataSource:", v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a8) = objc_msgSend((id)objc_opt_class(), "_handleEvent:targetResponder:appContext:eventDataSource:documentOptions:extraInfo:", v17, v16, v15, v18, v13, a8);
  return (char)a8;
}

@end

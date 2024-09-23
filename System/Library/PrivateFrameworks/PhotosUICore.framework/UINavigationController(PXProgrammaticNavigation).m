@implementation UINavigationController(PXProgrammaticNavigation)

- (id)px_navigationDestination
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "viewControllers", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reverseObjectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "px_navigationDestination");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)px_navigateToStateAllowingTabSwitchingWithOptions:()PXProgrammaticNavigation completionHandler:
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  objc_msgSend(a1, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "px_navigateToStateAllowingTabSwitchingWithOptions:completionHandler:", a3, v6);
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)UINavigationController_0;
    objc_msgSendSuper2(&v9, sel_px_navigateToStateAllowingTabSwitchingWithOptions_completionHandler_, a3, v6);
  }

}

- (BOOL)routingOptionsForDestination:()PXProgrammaticNavigation
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "routingOptionsForDestination:", v4);
  return v7 != 0;
}

- (id)nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "routingOptionsForDestination:", v4);
  if (v7)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (void)_px_prepareNavigationFromViewController:()PXProgrammaticNavigation routingOptions:options:completionHandler:
{
  id v10;
  id v11;
  objc_super v12;
  _QWORD v13[4];
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v13[1] = 3221225472;
  v13[2] = __133__UINavigationController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke;
  v13[3] = &unk_1E5138DA8;
  v14 = a1;
  v15 = a3;
  v16 = a6;
  v17 = a2;
  v18 = a5;
  v19 = a4;
  v12.receiver = v14;
  v12.super_class = (Class)UINavigationController_0;
  v13[0] = MEMORY[0x1E0C809B0];
  v10 = v15;
  v11 = v16;
  objc_msgSendSuper2(&v12, sel__px_prepareNavigationFromViewController_routingOptions_options_completionHandler_, v14, a4, a5, v13);

}

- (void)navigateToDestination:()PXProgrammaticNavigation options:completionHandler:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v9 = a3;
  v10 = a5;
  v11 = a1;
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v11, "childViewControllers");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = v13;
  else
    v15 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v12, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_nextExistingViewControllerOnRouteToDestination:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = v11;
    while (objc_msgSend(v16, "containsObject:", v17))
    {
      v19 = v17;

      objc_msgSend(v19, "_nextExistingViewControllerOnRouteToDestination:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v19;
      if (!v17)
        goto LABEL_11;
    }
    v19 = v18;
  }
  else
  {
    v19 = v11;
  }
LABEL_11:
  v20 = objc_msgSend(v19, "routingOptionsForDestination:", v9);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __100__UINavigationController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke;
  v24[3] = &unk_1E5138DF8;
  v28 = a2;
  v29 = v20;
  v24[4] = v11;
  v25 = v19;
  v30 = a4;
  v26 = v9;
  v27 = v10;
  v21 = v10;
  v22 = v9;
  v23 = v19;
  objc_msgSend(v11, "_px_prepareNavigationFromViewController:routingOptions:options:completionHandler:", v23, v20, a4, v24);

}

@end

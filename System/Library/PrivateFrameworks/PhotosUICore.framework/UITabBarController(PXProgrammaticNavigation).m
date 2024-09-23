@implementation UITabBarController(PXProgrammaticNavigation)

- (id)px_navigationDestination
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "selectedViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "px_navigationDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)routingOptionsForDestination:()PXProgrammaticNavigation
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v6 = v4;
  PXFind();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (id)nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "selectedViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)v5, "routingOptionsForDestination:", v4);

  v7 = (id)((v6 << 63 >> 63) & v5);
  return v7;
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

  v13[1] = 3221225472;
  v13[2] = __129__UITabBarController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke;
  v13[3] = &unk_1E5148F88;
  v14 = a1;
  v15 = a3;
  v16 = a6;
  v17 = a2;
  v18 = a5;
  v12.receiver = v14;
  v12.super_class = (Class)&off_1EEB8BA28;
  v13[0] = MEMORY[0x1E0C809B0];
  v10 = v15;
  v11 = v16;
  objc_msgSendSuper2(&v12, sel__px_prepareNavigationFromViewController_routingOptions_options_completionHandler_, v14, a4, a5, v13);

}

- (void)navigateToDestination:()PXProgrammaticNavigation options:completionHandler:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v9 = a3;
  v10 = a5;
  objc_msgSend(a1, "_nextExistingViewControllerOnRouteToDestination:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "selectedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
      v13 = v11;
    else
      v13 = a1;
    v14 = v13;

  }
  else
  {
    v14 = a1;
  }
  v15 = objc_msgSend(v14, "routingOptionsForDestination:", v9);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__UITabBarController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke;
  v18[3] = &unk_1E5148F88;
  v18[4] = a1;
  v19 = v9;
  v21 = a2;
  v22 = a4;
  v20 = v10;
  v16 = v10;
  v17 = v9;
  objc_msgSend(a1, "_px_prepareNavigationFromViewController:routingOptions:options:completionHandler:", v14, v15, a4, v18);

}

- (void)px_switchToTabAndNavigateToDestination:()PXProgrammaticNavigation options:completionHandler:
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  PXFind();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "setSelectedViewController:", v12);
    objc_msgSend(v12, "navigateToDestination:options:completionHandler:", v11, a4, v9);
  }
  else
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = a1;
      v16 = 2112;
      v17 = v11;
      _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "couldn't switch to tab for destination (%@, destination: %@)", buf, 0x16u);
    }

    v9[2](v9, 2, 0);
  }

}

@end

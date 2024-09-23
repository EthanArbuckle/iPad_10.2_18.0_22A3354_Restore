@implementation UIViewController(PXProgrammaticNavigation)

- (uint64_t)px_forwardingNavigationParticipantForDestination:()PXProgrammaticNavigation
{
  return 0;
}

- (void)px_dismissPresentedViewControllerWithOptions:()PXProgrammaticNavigation completionHandler:
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  objc_msgSend(a1, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0 || (v8 = objc_msgSend(v7, "isReadyForDismissal"), (a3 & 1) != 0) || v8)
    {
      v9 = v7;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "prepareForDismissal");

      objc_msgSend(v9, "presentingViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __109__UIViewController_PXProgrammaticNavigation__px_dismissPresentedViewControllerWithOptions_completionHandler___block_invoke;
      v11[3] = &unk_1E5148A40;
      v12 = v6;
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 0, v11);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 3, 0);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 1, 0);
  }

}

- (void)px_navigateToStateAllowingTabSwitchingWithOptions:()PXProgrammaticNavigation completionHandler:
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  int v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, uint64_t, _QWORD);
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!objc_msgSend(a1, "px_allowsTabSwitching"))
  {
    objc_msgSend(a1, "px_previousViewControllerInNavigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(a1, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "px_preparePopToViewController:forced:", v7, a3 & 1))
      {
        v9 = (void *)MEMORY[0x1E0DC3F20];
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __114__UIViewController_PXProgrammaticNavigation__px_navigateToStateAllowingTabSwitchingWithOptions_completionHandler___block_invoke;
        v20[3] = &unk_1E5148D08;
        v21 = v8;
        v10 = v7;
        v22 = v10;
        objc_msgSend(v9, "_performWithoutDeferringTransitions:", v20);
        objc_msgSend(v10, "px_navigateToStateAllowingTabSwitchingWithOptions:completionHandler:", a3, v6);

        v11 = v21;
LABEL_18:

        goto LABEL_19;
      }
LABEL_10:
      v6[2](v6, 3, 0);
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(a1, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      PXAssertGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = a1;
        _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "couldn't navigate to state allowing tab switching %@", buf, 0xCu);
      }

      v6[2](v6, 2, 0);
      goto LABEL_19;
    }
    v12 = a1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "isReadyForDismissal");

      if ((a3 & 1) == 0 && !v13)
        goto LABEL_10;
    }
    else
    {

    }
    v15 = v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "prepareForDismissal");

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __114__UIViewController_PXProgrammaticNavigation__px_navigateToStateAllowingTabSwitchingWithOptions_completionHandler___block_invoke_2;
    v16[3] = &unk_1E5148F60;
    v17 = v8;
    v19 = a3;
    v18 = v6;
    objc_msgSend(v17, "dismissViewControllerAnimated:completion:", 0, v16);

    v11 = v17;
    goto LABEL_18;
  }
  v6[2](v6, 1, 0);
LABEL_20:

}

- (uint64_t)routingOptionsForDestination:()PXProgrammaticNavigation
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "px_forwardingNavigationParticipantForDestination:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "routingOptionsForDestination:", v4);
  else
    v7 = 0;

  return v7;
}

- (id)nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "px_forwardingNavigationParticipantForDestination:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "nextExistingParticipantOnRouteToDestination:", v4);
  else
    objc_msgSend(a1, "_nextExistingParticipantOnRouteToDestination:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)navigateToDestination:()PXProgrammaticNavigation options:completionHandler:
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "px_forwardingNavigationParticipantForDestination:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "navigateToDestination:options:completionHandler:", v9, a4, v8);
  else
    objc_msgSend(a1, "_navigateToDestination:options:completionHandler:", v9, a4, v8);

}

- (id)_nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation
{
  id v4;
  id v5;
  void (**v6)(void *, void *);
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__225186;
  v21 = __Block_byref_object_dispose__225187;
  v22 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __91__UIViewController_PXProgrammaticNavigation___nextExistingParticipantOnRouteToDestination___block_invoke;
  v14 = &unk_1E5138D08;
  v16 = &v17;
  v5 = v4;
  v15 = v5;
  v6 = (void (**)(void *, void *))_Block_copy(&v11);
  objc_msgSend(a1, "px_nextViewControllerInNavigationController", v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

  objc_msgSend(a1, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8);

  v9 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v9;
}

- (id)_nextExistingViewControllerOnRouteToDestination:()PXProgrammaticNavigation
{
  id v4;
  void *v5;
  id v6;

  v4 = a1;
  while (1)
  {
    v5 = v4;
    objc_msgSend(v4, "nextExistingParticipantOnRouteToDestination:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:

  return v6;
}

- (void)_navigateToDestination:()PXProgrammaticNavigation options:completionHandler:
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
  v24[2] = __95__UIViewController_PXProgrammaticNavigation___navigateToDestination_options_completionHandler___block_invoke;
  v24[3] = &unk_1E5138D30;
  v24[4] = v11;
  v25 = v19;
  v28 = a2;
  v29 = a4;
  v26 = v9;
  v27 = v10;
  v21 = v10;
  v22 = v9;
  v23 = v19;
  objc_msgSend(v11, "_px_prepareNavigationFromViewController:routingOptions:options:completionHandler:", v23, v20, a4, v24);

}

- (uint64_t)provideViewControllersForDestination:()PXProgrammaticNavigation options:completionHandler:
{
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))(a5 + 16))(a5, MEMORY[0x1E0C9AA60], 2, 0);
}

- (void)_px_prepareNavigationFromViewController:()PXProgrammaticNavigation routingOptions:options:completionHandler:
{
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  if (v9 != a1)
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = a1;
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "unexpected view controller to prepare navigation from: %@ isn't %@", (uint8_t *)&v12, 0x16u);
    }

  }
  objc_msgSend(a1, "px_dismissPresentedViewControllerWithOptions:completionHandler:", a5, v10);

}

- (uint64_t)px_navigationDestination
{
  return 0;
}

@end

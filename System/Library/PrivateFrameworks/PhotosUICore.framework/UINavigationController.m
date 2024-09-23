@implementation UINavigationController

uint64_t __79__UINavigationController_PXImageModulationManager__px_imageModulationIntensity__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0DC3A40], "instancesRespondToSelector:", sel_px_imageModulationIntensityWithProposedValue_);
  px_imageModulationIntensity_hookExists = result;
  return result;
}

void __100__UINavigationController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((unint64_t)(a2 - 2) >= 4)
  {
    if (a2 == 1)
    {
      v7 = *(_QWORD *)(a1 + 72);
      if ((v7 & 2) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "viewControllers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "indexOfObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v11, "subarrayWithRange:", 0, v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v13;
        }
        v15 = *(void **)(a1 + 40);
        v14 = *(void **)(a1 + 48);
        v16 = *(_QWORD *)(a1 + 80);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __100__UINavigationController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke_2;
        v21[3] = &unk_1E5138DD0;
        v17 = *(_QWORD *)(a1 + 32);
        v22 = v11;
        v23 = v17;
        v26 = v16;
        v24 = v14;
        v25 = *(id *)(a1 + 56);
        v18 = v11;
        objc_msgSend(v15, "provideViewControllersForDestination:options:completionHandler:", v24, v16, v21);

      }
      else if ((v7 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "navigateToDestination:options:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));
      }
      else
      {
        PXAssertGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v20 = *(_QWORD *)(a1 + 32);
          v19 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v28 = v19;
          v29 = 2112;
          v30 = v20;
          _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Unsupported routing options for VC %@ of navigating VC %@", buf, 0x16u);
        }

        v9 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("last route VC returned unsupported routing options"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, 5, v10);

      }
    }
    else if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("UIViewController+PXProgrammaticNavigation.m"), 404, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __100__UINavigationController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setViewControllers:animated:", v8, (*(_QWORD *)(a1 + 64) >> 1) & 1);
  objc_msgSend(v7, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "routingOptionsForDestination:", *(_QWORD *)(a1 + 48)) & 3) == 1)
    objc_msgSend(v9, "navigateToDestination:options:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __133__UINavigationController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2 != 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v3;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "unexpected view controller to prepare navigation from: %@ isn't one of %@", buf, 0x16u);
    }

  }
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v3, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "px_preparePopToViewController:forced:", *(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 64) & 1))
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 3, 0, v7, v8);
      goto LABEL_13;
    }
    if (*(_QWORD *)(a1 + 72) == 1)
    {
      v9 = (void *)MEMORY[0x1E0DC3F20];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __133__UINavigationController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke_83;
      v12[3] = &unk_1E5148D08;
      v10 = *(void **)(a1 + 40);
      v12[4] = *(_QWORD *)(a1 + 32);
      v13 = v10;
      objc_msgSend(v9, "_performWithoutDeferringTransitions:", v12);

    }
  }
  (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 1, 0, v7, v8);
LABEL_13:

}

id __133__UINavigationController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke_83(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "popToViewController:animated:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __92__UINavigationController_PhotosUICore_PPT__ppt_installTransitionAnimationCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__UINavigationController_PhotosUICore__px_preparePopToViewController_forced___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  char v7;
  char v8;
  void *v9;

  v5 = a2;
  v6 = v5;
  if (*(id *)(a1 + 32) == v5)
    goto LABEL_5;
  v9 = v5;
  v7 = objc_opt_respondsToSelector();
  v6 = v9;
  if ((v7 & 1) != 0)
  {
    v8 = objc_msgSend(v9, "isReadyForDismissal");
    v6 = v9;
    if ((v8 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
LABEL_5:
      *a3 = 1;
    }
  }

}

void __77__UINavigationController_PhotosUICore__px_preparePopToViewController_forced___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;

  v5 = a2;
  v6 = v5;
  if (*(id *)(a1 + 32) == v5)
  {
    *a3 = 1;
  }
  else
  {
    v8 = v5;
    v7 = objc_opt_respondsToSelector();
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "prepareForDismissal");
      v6 = v8;
    }
  }

}

@end

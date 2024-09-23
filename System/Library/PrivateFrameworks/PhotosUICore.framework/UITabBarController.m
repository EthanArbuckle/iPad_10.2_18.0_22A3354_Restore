@implementation UITabBarController

void __70__UITabBarController_PhotosUICore__px_defaultKeyCommandsWithDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3930];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v5, 0, sel__px_selectTabForKeyCommand_, v6, 0x40000, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(void **)(a1 + 32);
    if (v11)
    {
      objc_msgSend(v11, "localizedDiscoverabilityTitleForTabBarItem:atIndex:", v13, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDiscoverabilityTitle:", v12);

      if (v10 == a3 || (objc_msgSend(*(id *)(a1 + 32), "shouldExposeShortcutForTabBarItem:atIndex:", v13, a3) & 1) == 0)
        goto LABEL_6;
    }
    else if (v10 == a3)
    {
      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
LABEL_6:

  }
}

void __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeFromSuperview");

  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "removeFromSuperview");

}

uint64_t __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke_2(uint64_t result)
{
  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void *__81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke_3(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return _Block_copy(*(const void **)(a1 + 32));
}

uint64_t __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke_4(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  PXRectGetCenter();
  return objc_msgSend(v1, "setCenter:");
}

uint64_t __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke_5(uint64_t a1)
{
  uint64_t AspectRatioWithDefault;
  double v3;
  double v4;

  AspectRatioWithDefault = PXSizeGetAspectRatioWithDefault();
  v3 = MEMORY[0x1A85CD654](AspectRatioWithDefault);
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, v3, v4);
}

uint64_t __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke_6(uint64_t a1)
{
  void *v2;
  CGFloat v3;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "addToTabEndRotation");
  PXDegreesToRadians();
  v2 = *(void **)(a1 + 40);
  CGAffineTransformMakeRotation(&v5, v3);
  return objc_msgSend(v2, "setTransform:", &v5);
}

uint64_t __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

void __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = a2;
  objc_msgSend(a1[4], "count");
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[4];
  v4 = v3;
  PXIterateAsynchronously();

}

void __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_8;
  v4[3] = &unk_1E5145688;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_switchToBarBarItem:completionHandler:", v3, v4);

}

uint64_t __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  BOOL v13;

  v3 = a2;
  v4 = objc_msgSend(v3, "index");
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "startedSubTest:forTest:", CFSTR("SwitchTab"), *(_QWORD *)(a1 + 40));
  v5 = v4 != 0;
  v6 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_4;
  v9[3] = &unk_1E513CB38;
  v13 = v5;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v3;
  v8 = v3;
  objc_msgSend(v6, "_switchToBarBarItem:completionHandler:", v7, v9);

}

uint64_t __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "next");
}

void __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("SwitchTab"), *(_QWORD *)(a1 + 40));
  v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_5;
  block[3] = &unk_1E5149198;
  v4 = *(id *)(a1 + 48);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "next");
}

uint64_t __113__UITabBarController_PXProgrammaticNavigation__px_switchToTabAndNavigateToDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "routingOptionsForDestination:", *(_QWORD *)(a1 + 32)) & 1;
}

void __96__UITabBarController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if ((unint64_t)(a2 - 2) < 4)
  {
    v8 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_7:
    v6 = v8;
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "px_switchToTabAndNavigateToDestination:options:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
    goto LABEL_7;
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("UIViewController+PXProgrammaticNavigation.m"), 289, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
LABEL_8:

}

void __129__UITabBarController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _QWORD v13[5];
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedViewController");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = *(_QWORD *)(a1 + 40);
    if (v5 != *(_QWORD *)(a1 + 32) && v5 != v3)
    {
      PXAssertGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v4;
        _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "unexpected view controller to prepare navigation from: %@ is neither %@ nor %@", buf, 0x20u);
      }

    }
    if (!v4 || *(void **)(a1 + 40) == v4)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 64);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __129__UITabBarController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke_78;
      v13[3] = &unk_1E5138D80;
      v13[4] = *(_QWORD *)(a1 + 32);
      v12 = *(_OWORD *)(a1 + 48);
      v9 = (id)v12;
      v14 = v12;
      objc_msgSend(v4, "px_navigateToStateAllowingTabSwitchingWithOptions:completionHandler:", v8, v13);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __129__UITabBarController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke_78(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  id v8;

  v5 = a3;
  if ((unint64_t)(a2 - 2) < 4)
  {
    v6 = *(void (**)(void))(a1[5] + 16);
    v8 = v5;
LABEL_7:
    v6();
    v5 = v8;
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    v6 = *(void (**)(void))(a1[5] + 16);
    v8 = v5;
    goto LABEL_7;
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("UIViewController+PXProgrammaticNavigation.m"), 256, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
LABEL_8:

}

uint64_t __77__UITabBarController_PXProgrammaticNavigation__routingOptionsForDestination___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "routingOptionsForDestination:", *(_QWORD *)(a1 + 32)) & 1;
}

@end

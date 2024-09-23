@implementation UIViewController

void __77__UIViewController_PXOneUpPresentation___px_prepareClassForOneUpPresentation__block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v2)(void *, char *, char *);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__UIViewController_PXOneUpPresentation___px_prepareClassForOneUpPresentation__block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e11_v24__0_8_16lu32l8;
  aBlock[4] = a2;
  v2 = (void (**)(void *, char *, char *))_Block_copy(aBlock);
  v2[2](v2, sel_viewWillAppear_, sel__pxswizzled_oneUpPresentation_viewWillAppear_);
  v2[2](v2, sel_viewIsAppearing_, sel__pxswizzled_oneUpPresentation_viewIsAppearing_);
  v2[2](v2, sel_viewDidAppear_, sel__pxswizzled_oneUpPresentation_viewDidAppear_);
  v2[2](v2, sel_viewWillDisappear_, sel__pxswizzled_oneUpPresentation_viewWillDisappear_);
  v2[2](v2, sel_viewDidDisappear_, sel__pxswizzled_oneUpPresentation_viewDidDisappear_);

}

uint64_t __77__UIViewController_PXOneUpPresentation___px_prepareClassForOneUpPresentation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_swizzleMethod:withMethod:", a2, a3);
}

void __69__UIViewController_PXBarAppearance___px_prepareClassForBarAppearance__block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v2)(void *, char *, char *);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__UIViewController_PXBarAppearance___px_prepareClassForBarAppearance__block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e11_v24__0_8_16lu32l8;
  aBlock[4] = a2;
  v2 = (void (**)(void *, char *, char *))_Block_copy(aBlock);
  v2[2](v2, sel_viewWillAppear_, sel__pxswizzled_barAppearance_viewWillAppear_);
  v2[2](v2, sel_viewIsAppearing_, sel__pxswizzled_barAppearance_viewIsAppearing_);
  v2[2](v2, sel_viewDidDisappear_, sel__pxswizzled_barAppearance_viewDidDisappear_);
  v2[2](v2, sel_preferredStatusBarStyle, sel__pxswizzled_barAppearance_preferredStatusBarStyle);
  v2[2](v2, sel_prefersStatusBarHidden, sel__pxswizzled_barAppearance_prefersStatusBarHidden);
  v2[2](v2, sel_preferredStatusBarUpdateAnimation, sel__pxswizzled_barAppearance_preferredStatusBarUpdateAnimation);

}

uint64_t __69__UIViewController_PXBarAppearance___px_prepareClassForBarAppearance__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_swizzleMethod:withMethod:", a2, a3);
}

void __89__UIViewController_PXExtendedTraitCollection___px_prepareClassForExtendedTraitCollection__block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v2)(void *, char *, char *);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__UIViewController_PXExtendedTraitCollection___px_prepareClassForExtendedTraitCollection__block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e11_v24__0_8_16lu32l8;
  aBlock[4] = a2;
  v2 = (void (**)(void *, char *, char *))_Block_copy(aBlock);
  v2[2](v2, sel_viewDidLoad, sel__pxswizzled_viewControllerTraitCollection_viewDidLoad);
  v2[2](v2, sel_viewWillAppear_, sel__pxswizzled_viewControllerTraitCollection_viewWillAppear_);
  v2[2](v2, sel_viewIsAppearing_, sel__pxswizzled_viewControllerTraitCollection_viewIsAppearing_);
  v2[2](v2, sel_viewDidAppear_, sel__pxswizzled_viewControllerTraitCollection_viewDidAppear_);
  v2[2](v2, sel_viewWillLayoutSubviews, sel__pxswizzled_viewControllerTraitCollection_viewWillLayoutSubviews);
  v2[2](v2, sel_viewWillTransitionToSize_withTransitionCoordinator_, sel__pxswizzled_viewControllerTraitCollection_viewWillTransitionToSize_withTransitionCoordinator_);
  v2[2](v2, sel_traitCollectionDidChange_, sel__pxswizzled_viewControllerTraitCollection_traitCollectionDidChange_);
  v2[2](v2, sel_viewSafeAreaInsetsDidChange, sel__pxswizzled_viewControllerTraitCollection_viewSafeAreaInsetsDidChange);
  v2[2](v2, sel_viewLayoutMarginsDidChange, sel__pxswizzled_viewControllerTraitCollection_viewLayoutMarginsDidChange);
  v2[2](v2, sel_didMoveToParentViewController_, sel__pxswizzled_viewControllerTraitCollection_didMoveToParentViewController_);

}

uint64_t __89__UIViewController_PXExtendedTraitCollection___px_prepareClassForExtendedTraitCollection__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_swizzleMethod:withMethod:", a2, a3);
}

void __95__UIViewController_PrototypeTools_PhotosUICore__px_viewControllerWithContinuousOutputProducer___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "appendOutput:", v3);

}

BOOL __95__UIViewController_PrototypeTools_PhotosUICore__px_viewControllerWithContinuousOutputProducer___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  if (!WeakRetained)
    return 0;
  if (v3 <= 0.0)
    return v3 > -120.0;
  return 0;
}

uint64_t __97__UIViewController_PrototypeTools_PhotosUICore__px_viewControllerWithAsynchronousOutputProducer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__UIViewController_PrototypeTools_PhotosUICore__px_viewControllerWithOutput___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  void (**v4)(id, id);
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  v4 = a2;
  v3(v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

}

void __140__UIViewController_PXExtendedTraitCollection___pxswizzled_viewControllerTraitCollection_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "viewControllerTraitCollectionDidChange");

}

uint64_t __89__UIViewController_PXExtendedTraitCollection___px_prepareClassForExtendedTraitCollection__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__UIViewController_PXExtendedTraitCollection__px_preloadExtendedTraitCollection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_px_prepareClassForExtendedTraitCollection");
}

double __117__UIViewController_PhotosUICore__px_adjustAdditionalSafeAreaInsetsToKeepContentStableRegardlessOfStatusBarVisibility__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarHeightForOrientation:ignoreHidden:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"), 1);
  v4 = v3;

  return v4;
}

uint64_t __78__UIViewController_PhotosUICore__px_containsViewControllerModalInPresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_containsViewControllerModalInPresentation");
}

void __71__UIViewController_PhotosUICore__px_descendantViewControllerWithClass___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __94__UIViewController_PhotosUICore__px_enumerateDescendantViewControllersWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  if (*(void **)(a1 + 32) == a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __94__UIViewController_PhotosUICore__px_enumerateDescendantViewControllersWithOptions_usingBlock___block_invoke_2;
    v7[3] = &unk_1E512DA70;
    v6 = *(_QWORD *)(a1 + 48);
    v8 = *(id *)(a1 + 40);
    v9 = a4;
    objc_msgSend(a2, "px_enumerateDescendantViewControllersWithOptions:usingBlock:", v6, v7);

  }
}

uint64_t __94__UIViewController_PhotosUICore__px_enumerateDescendantViewControllersWithOptions_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*a3)
    **(_BYTE **)(a1 + 40) = 1;
  return result;
}

uint64_t __66__UIViewController_PhotosUICore__px_freezeViewController_timeout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unfreezeAnimated:", 0);
}

uint64_t __90__UIViewController_PXImageModulationManager_Private__px_effectiveImageModulationIntensity__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_imageModulationIntensity");
}

uint64_t __90__UIViewController_PXImageModulationManager_Private__px_effectiveImageModulationIntensity__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_imageModulationIntensity");
}

uint64_t __90__UIViewController_PXImageModulationManager_Private__px_effectiveImageModulationIntensity__block_invoke_3()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0DC3F20], "instancesRespondToSelector:", sel_px_effectiveImageModulationIntensityWithProposedValue_);
  px_effectiveImageModulationIntensity_hookExists = result;
  return result;
}

uint64_t __74__UIViewController_PXImageModulationManager_Private__px_effectiveHDRFocus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_HDRFocus");
}

uint64_t __74__UIViewController_PXImageModulationManager_Private__px_effectiveHDRFocus__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_effectiveHDRFocus");
}

uint64_t __73__UIViewController_PXImageModulationManager___px_viewAppearanceDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsHDRFocusUpdate");
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsImageModulationIntensityUpdate");
}

uint64_t __70__UIViewController_PXImageModulationManager__px_enableImageModulation__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "px_swizzleMethod:withMethod:", sel_viewWillAppear_, sel__pxswizzled_imageModulation_viewWillAppear_);
  objc_msgSend(a2, "px_swizzleMethod:withMethod:", sel_viewWillDisappear_, sel__pxswizzled_imageModulation_viewWillDisappear_);
  return objc_msgSend(a2, "px_swizzleMethod:withMethod:", sel_viewDidDisappear_, sel__pxswizzled_imageModulation_viewDidDisappear_);
}

void __95__UIViewController_PXProgrammaticNavigation___navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_7:
    v6 = v8;
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 40), "navigateToDestination:options:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
    goto LABEL_7;
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("UIViewController+PXProgrammaticNavigation.m"), 167, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
LABEL_8:

}

void __91__UIViewController_PXProgrammaticNavigation___nextExistingParticipantOnRouteToDestination___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a2;
  v5 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "routingOptionsForDestination:", *(_QWORD *)(a1 + 32));
    v5 = v7;
    if (v6)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      v5 = v7;
    }
  }

}

id __114__UIViewController_PXProgrammaticNavigation__px_navigateToStateAllowingTabSwitchingWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "popToViewController:animated:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __114__UIViewController_PXProgrammaticNavigation__px_navigateToStateAllowingTabSwitchingWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_navigateToStateAllowingTabSwitchingWithOptions:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __109__UIViewController_PXProgrammaticNavigation__px_dismissPresentedViewControllerWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

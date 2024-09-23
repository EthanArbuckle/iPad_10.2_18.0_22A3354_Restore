@implementation UIPreviewInteractionPresentationAssistant

void __67___UIPreviewInteractionPresentationAssistant_dismissViewController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "presentationSourcePortalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removePropertyAnimationsForLayerKeyPath:", CFSTR("transform"));

  objc_msgSend(*(id *)(a1 + 32), "presentationSourcePortalView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v5);

}

void __90___UIPreviewInteractionPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "stashedParentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStashedParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "stashedSuperView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStashedSuperView:", 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90___UIPreviewInteractionPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_2;
  v6[3] = &unk_1E16B47A8;
  v7 = *(id *)(a1 + 40);
  v8 = v2;
  v9 = v3;
  v4 = v3;
  v5 = v2;
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v6);

}

uint64_t __90___UIPreviewInteractionPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  return objc_msgSend(*(id *)(a1 + 40), "addChildViewController:", *(_QWORD *)(a1 + 32));
}

uint64_t __90___UIPreviewInteractionPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __141___UIPreviewInteractionPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __141___UIPreviewInteractionPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id *)(a1 + 40);
  v4 = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBeingPresented");

  if (v6)
  {
    objc_msgSend(WeakRetained, "presentationSourcePortalView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_loadWeakRetained(v3);
    objc_msgSend(v8, "presentedView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id __141___UIPreviewInteractionPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id *)(a1 + 40);
  v4 = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBeingPresented");

  if (v6)
  {
    v7 = objc_loadWeakRetained(v3);
    objc_msgSend(v7, "presentedView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(WeakRetained, "presentationSourcePortalView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  __int128 v24;
  void *v25;
  _OWORD v26[3];
  _OWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;

  objc_msgSend(*(id *)(a1 + 32), "sourcePreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "highlighter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "highlighter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "customBackgroundEffectView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "bounds");
      objc_msgSend(v6, "setFrame:");
      objc_msgSend(v6, "setAutoresizingMask:", 18);
      objc_msgSend(*(id *)(a1 + 40), "insertSubview:atIndex:", v6, 0);

    }
    objc_msgSend(v3, "bounds");
    v7 = (_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 48), "setBounds:");
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v3, "center");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v3, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:fromView:", v13, v10, v12);
    objc_msgSend(*(id *)(a1 + 48), "setCenter:");

    objc_msgSend(*(id *)(a1 + 32), "sourcePreview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "target");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "transform");
    }
    else
    {
      v29 = 0u;
      v30 = 0u;
      v28 = 0u;
    }
    v25 = (void *)*v7;
    v27[0] = v28;
    v27[1] = v29;
    v27[2] = v30;
    objc_msgSend(v25, "setTransform:", v27);

  }
  else
  {
    objc_msgSend(v3, "bounds");
    v7 = (_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 56), "setBounds:");
    v17 = *(void **)(a1 + 40);
    objc_msgSend(v3, "center");
    v19 = v18;
    v21 = v20;
    objc_msgSend(v3, "superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertPoint:fromView:", v22, v19, v21);
    objc_msgSend(*(id *)(a1 + 56), "setCenter:");

    v23 = *(void **)(a1 + 56);
    v24 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v26[0] = *MEMORY[0x1E0C9BAA8];
    v26[1] = v24;
    v26[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v23, "setTransform:", v26);
  }
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *v7);
  objc_msgSend(*(id *)(a1 + 64), "prepareTransitionFromView:toView:containerView:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

void __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, double);
  _OWORD v12[3];

  objc_msgSend(*(id *)(a1 + 32), "performTransitionFromView:toView:containerView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "presentationSourcePortalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v12[0] = *MEMORY[0x1E0C9BAA8];
  v12[1] = v3;
  v12[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v12);

  objc_msgSend(*(id *)(a1 + 64), "highlighter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 64), "highlighter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customBackgroundEffectView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 64), "highlighter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundEffectApplyBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (*(_BYTE *)(a1 + 72))
        v9 = 1.0;
      else
        v9 = 0.0;
      objc_msgSend(*(id *)(a1 + 64), "highlighter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "backgroundEffectApplyBlock");
      v11 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, double))v11)[2](v11, v6, v9);

    }
  }
}

void __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  int has_internal_diagnostics;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v14 = 138412290;
        v15 = objc_opt_class();
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "%@: animator completion called while _currentContext is nil", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_14;
    }
  }
  else if (!v5)
  {
    v12 = _UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_4;
    if (!_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_4)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_4);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v11 = v13;
      v14 = 138412290;
      v15 = objc_opt_class();
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "%@: animator completion called while _currentContext is nil", (uint8_t *)&v14, 0xCu);
LABEL_14:

    }
  }
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = 0;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = 0;

  objc_msgSend(*(id *)(a1 + 40), "transitionDidEnd:", a2 == 0);
  objc_msgSend(v6, "completeTransition:", a2 == 0);
  if (a2 || !*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_postInteractionCleanup");

}

void __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_16(uint64_t a1)
{
  void *v1;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPrivatePresentationCompletionBlock:", 0);

  if (objc_msgSend(WeakRetained, "isAppearing")
    && objc_msgSend(WeakRetained[3], "isRunning"))
  {
    objc_msgSend(WeakRetained, "dismissViewController");
  }

}

uint64_t __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_2_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

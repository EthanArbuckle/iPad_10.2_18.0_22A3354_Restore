@implementation UIRapidClickPresentationAssistant

void __83___UIRapidClickPresentationAssistant_presentFromSourcePreview_lifecycleCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;
  char v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83___UIRapidClickPresentationAssistant_presentFromSourcePreview_lifecycleCompletion___block_invoke_2;
  v3[3] = &unk_1E16B4008;
  v5 = *(_BYTE *)(a1 + 56);
  v3[4] = *(_QWORD *)(a1 + 48);
  v4 = v1;
  objc_msgSend(v4, "presentViewController:animated:completion:", v2, 0, v3);

}

uint64_t __83___UIRapidClickPresentationAssistant_presentFromSourcePreview_lifecycleCompletion___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 48))
    return objc_msgSend(*(id *)(result + 32), "_performPresentationAnimationsFromViewController:", *(_QWORD *)(result + 40));
  return result;
}

uint64_t __87___UIRapidClickPresentationAssistant__performPresentationAnimationsFromViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareToPresent");
}

uint64_t __87___UIRapidClickPresentationAssistant__performPresentationAnimationsFromViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "present");
}

uint64_t __87___UIRapidClickPresentationAssistant__performPresentationAnimationsFromViewController___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "transitionDidEnd:", 1);
  return result;
}

uint64_t __84___UIRapidClickPresentationAssistant_dismissWithReason_alongsideActions_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84___UIRapidClickPresentationAssistant_dismissWithReason_alongsideActions_completion___block_invoke_2;
  v3[3] = &unk_1E16B1B28;
  v3[4] = *(_QWORD *)(a1 + 32);
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v3);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __84___UIRapidClickPresentationAssistant_dismissWithReason_alongsideActions_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "presentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, 0);

}

uint64_t __85___UIRapidClickPresentationAssistant__animateDismissalWithReason_actions_completion___block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareToDismiss");
}

uint64_t __85___UIRapidClickPresentationAssistant__animateDismissalWithReason_actions_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

void __85___UIRapidClickPresentationAssistant__animateDismissalWithReason_actions_completion___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v5 = WeakRetained;
  if (a2)
  {
    v10 = WeakRetained;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(WeakRetained, "animationWatchdogTimer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidate");

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "_unlockEnvironment:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "_unlockEnvironment:", *(_QWORD *)(a1 + 40));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = 0;

    }
    objc_msgSend(*(id *)(a1 + 48), "transitionDidEnd:", 1);
    v9 = *(_QWORD *)(a1 + 56);
    v5 = v10;
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
      v5 = v10;
    }
  }

}

uint64_t __89___UIRapidClickPresentationAssistant__nonAnimatedDismissalWithReason_actions_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareToDismiss");
}

void __56___UIRapidClickPresentationAssistant_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56___UIRapidClickPresentationAssistant_animateTransition___block_invoke_2;
  v5[3] = &unk_1E16B1B50;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "_animateDismissalWithReason:actions:completion:", 9, v5, 0);

}

void __56___UIRapidClickPresentationAssistant_animateTransition___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
  objc_msgSend(*(id *)(a1 + 40), "lifecycleCompletion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLifecycleCompletion:", 0);
  v2 = v3;
  if (v3)
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
    v2 = v3;
  }

}

uint64_t __93___UIRapidClickPresentationAssistant__animateUsingFluidSpringWithType_animations_completion___block_invoke(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __93___UIRapidClickPresentationAssistant__animateUsingFluidSpringWithType_animations_completion___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  --*(_DWORD *)(a1[4] + 8);
  v6 = _UIRapidClickPresentationAssistantKeyboardSuppressionAssertionReason_block_invoke_2___s_category;
  if (!_UIRapidClickPresentationAssistantKeyboardSuppressionAssertionReason_block_invoke_2___s_category)
  {
    v6 = __UILogCategoryGetNode("UICMILifecycle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&_UIRapidClickPresentationAssistantKeyboardSuppressionAssertionReason_block_invoke_2___s_category);
  }
  v7 = *(NSObject **)(v6 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = a1[6];
    v10 = v7;
    objc_msgSend(v8, "numberWithUnsignedInteger:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_DWORD *)(a1[4] + 8);
    v18 = 138413058;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v24 = 1024;
    v25 = v14;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "_animateUsingFluidSpringWithType %@ completion: finished %@, retargeted %@, count: %d", (uint8_t *)&v18, 0x26u);

  }
  if (*(_DWORD *)(a1[4] + 8))
  {
    v15 = a2;
    v16 = a3;
  }
  else
  {
    v15 = 1;
    v16 = 0;
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v15, v16);
}

@end

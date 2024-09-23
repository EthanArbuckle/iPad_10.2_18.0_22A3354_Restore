@implementation UIAlertControllerPhoneTVMacView

void __46___UIAlertControllerPhoneTVMacView_initialize__block_invoke(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "setPresentationContextPrefersCancelActionShown:", 0);
  objc_msgSend(v1, "setPresentedAsPopover:", 1);
  objc_msgSend(v1, "setHasDimmingView:", 0);
  objc_msgSend(v1, "setShouldHaveBackdropView:", 0);
  objc_msgSend(v1, "setAlignsToKeyboard:", 0);

}

void __46___UIAlertControllerPhoneTVMacView_initialize__block_invoke_2(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "setPresentationContextPrefersCancelActionShown:", 1);
  objc_msgSend(v1, "setShouldHaveBackdropView:", 1);
  objc_msgSend(v1, "setPresentedAsPopover:", 0);

}

uint64_t __83___UIAlertControllerPhoneTVMacView_interfaceAction_invokeActionHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __96___UIAlertControllerPhoneTVMacView__unlocalizedOrderedPresentableAlertActionViewRepresentations__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 656), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", a2));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);

}

uint64_t __78___UIAlertControllerPhoneTVMacView__unlocalizedOrderedPresentableAlertActions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", a2, 0);
}

uint64_t __86___UIAlertControllerPhoneTVMacView__shouldAllowPassthroughToLayersBehindUsForTouches___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  objc_msgSend(a2, "locationInView:", *(_QWORD *)(a1 + 32));
  result = objc_msgSend(*(id *)(a1 + 32), "pointInside:withEvent:", 0);
  *a3 = result;
  return result;
}

uint64_t __65___UIAlertControllerPhoneTVMacView__updateActionViewVisualStyle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVisualStyle:", *(_QWORD *)(a1 + 32));
}

uint64_t __59___UIAlertControllerPhoneTVMacView__updateActionViewHeight__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateSizeUsingAXEnforcedWidth:", *(double *)(a1 + 32));
}

uint64_t __59___UIAlertControllerPhoneTVMacView__updateActionViewHeight__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateSizeUsingAXEnforcedWidth:", *(double *)(a1 + 32));
}

void __62___UIAlertControllerPhoneTVMacView__updateConstraintConstants__block_invoke(uint64_t a1, void *a2, double a3)
{
  double v5;
  id v6;

  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0.0)
  {
    objc_msgSend(a2, "font");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "capHeight");
    UIRoundToViewScale(*(void **)(a1 + 32));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 - v5;

  }
}

uint64_t __77___UIAlertControllerPhoneTVMacView__sizeOfHeaderContentViewControllerChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_actionLayoutDirectionChanged");
}

uint64_t __71___UIAlertControllerPhoneTVMacView__sizeOfContentViewControllerChanged__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "contentViewControllerContainerViewWidthConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", *(double *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "contentViewControllerContainerViewHeightConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", *(double *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 32), "_actionLayoutDirectionChanged");
}

void __104___UIAlertControllerPhoneTVMacView__disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
  {
    v1 = *(unsigned __int8 *)(a1 + 41);
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAllowsGroupOpacity:", v1);

  }
}

uint64_t __86___UIAlertControllerPhoneTVMacView_configureForPresentAlongsideTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollInitialActionToVisibleForPresentation");
}

@end

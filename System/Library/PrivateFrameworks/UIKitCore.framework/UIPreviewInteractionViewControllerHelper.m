@implementation UIPreviewInteractionViewControllerHelper

void __140___UIPreviewInteractionViewControllerHelper_presentViewControllerFromViewController_highlighter_presentationCompletion_dismissalCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performPresentViewControllerFromViewController:", *(_QWORD *)(a1 + 32));

}

id __140___UIPreviewInteractionViewControllerHelper_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "interactiveHighlightEffect");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __140___UIPreviewInteractionViewControllerHelper_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((_QWORD *)WeakRetained + 9))
    {
      v5 = WeakRetained;
      objc_msgSend(*(id *)(a1 + 32), "_animateAlongsideViewControllerPresentationDismiss");
      objc_msgSend(*(id *)(a1 + 32), "_viewControllerPresentationDidEnd");
      objc_msgSend(v5, "_finalizeAfterViewControllerPresentation");
      objc_msgSend(v5, "_performDismissalCompletionIfNeeded");
      v3 = v5;
      v4 = *(void **)(a1 + 32);
      if (v4)
      {
        objc_msgSend(v4, "_delayedViewControllerPresentationDidCancel");
        v3 = v5;
      }
    }
  }

}

uint64_t __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareTransitionFromView:toView:containerView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke_2(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_animateAlongsideViewControllerPresentationDismiss");
  return objc_msgSend(*(id *)(a1 + 40), "performTransitionFromView:toView:containerView:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained[9];
    if (v3 == *(id *)(a1 + 32))
    {
      v5 = WeakRetained;
      objc_msgSend(v3, "completeTransition:", objc_msgSend(v3, "transitionWasCancelled") ^ 1);
      objc_msgSend(*(id *)(a1 + 40), "transitionDidEnd:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
      if (!*(_BYTE *)(a1 + 56))
      {
        objc_msgSend(v5[1], "_viewControllerPresentationDidEnd");
        objc_msgSend(v5, "_finalizeAfterViewControllerPresentation");
        objc_msgSend(v5, "_performDismissalCompletionIfNeeded");
      }
      v4 = v5[9];
      v5[9] = 0;

      WeakRetained = v5;
    }
  }

}

uint64_t __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93___UIPreviewInteractionViewControllerHelper__performPresentViewControllerFromViewController___block_invoke(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_finalizeAfterViewControllerPresentation");
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id __147___UIPreviewInteractionViewControllerHelper_defaultPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBeingPresented");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "effectView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "contentPlatterView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id __147___UIPreviewInteractionViewControllerHelper_defaultPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  int v5;
  id v6;
  void *v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBeingPresented");

  if (v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "contentPlatterView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "effectView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

id __146___UIPreviewInteractionViewControllerHelper_customPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  int v5;
  id v6;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "portalView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setHidesSourceView:", 0);
    objc_msgSend(v2, "setHidden:", 1);

    if (*(_BYTE *)(a1 + 56))
      goto LABEL_7;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isBeingPresented"))
  {
    v5 = *(unsigned __int8 *)(a1 + 57);

    if (v5)
      goto LABEL_6;
LABEL_7:
    v6 = *(id *)(a1 + 40);
    return v6;
  }

LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  return v6;
}

id __146___UIPreviewInteractionViewControllerHelper_customPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  id v5;

  if (!*(_BYTE *)(a1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isBeingPresented"))
    {

    }
    else
    {
      v4 = *(unsigned __int8 *)(a1 + 57);

      if (!v4)
      {
        objc_msgSend(*(id *)(a1 + 40), "effectView");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        return v5;
      }
    }
  }
  v5 = *(id *)(a1 + 32);
  return v5;
}

@end

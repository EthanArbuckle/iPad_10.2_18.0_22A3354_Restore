@implementation UISearchControllerOffscreenSearchBarAnimator

void *__67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *result;

  objc_msgSend(*(id *)(a1 + 32), "_resultsControllerViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "becomeFirstResponder");
  objc_msgSend(*(id *)(a1 + 40), "scopeButtonTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "_scopeBarIsVisible");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_setShowsScopeBar:animateOpacity:", 1, 1);
      objc_msgSend(*(id *)(a1 + 40), "_setScopeBarHidden:", 0);
      objc_msgSend(*(id *)(a1 + 40), "sizeToFit");
      objc_msgSend(*(id *)(a1 + 40), "layoutBelowIfNeeded");
    }
  }
  else
  {

  }
  result = *(void **)(a1 + 48);
  if (result)
  {
    result = (void *)objc_msgSend(result, "automaticallyAdjustsScrollViewInsets");
    if ((_DWORD)result)
      return (void *)objc_msgSend(*(id *)(a1 + 56), "setContentOffset:", *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
  return result;
}

uint64_t __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

void __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_resultsControllerViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (objc_msgSend(*(id *)(a1 + 40), "isFirstResponder"))
    objc_msgSend(*(id *)(a1 + 40), "resignFirstResponder");
  objc_msgSend(*(id *)(a1 + 40), "scopeButtonTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "_scopeBarIsVisible");

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "_setShowsScopeBar:animateOpacity:", 0, 1);
      objc_msgSend(*(id *)(a1 + 40), "sizeToFit");
      objc_msgSend(*(id *)(a1 + 40), "layoutBelowIfNeeded");
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "_resultsContentScrollViewPresentationOffset");
  if (fabs(v5) >= 2.22044605e-16)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchResultsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_contentOrObservableScrollViewForEdge:", 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "contentOffset");
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "_resultsContentScrollViewPresentationOffset");
    objc_msgSend(v12, "setContentOffset:", v8, v10 + v11);

  }
}

uint64_t __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setScopeBarHidden:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
}

@end

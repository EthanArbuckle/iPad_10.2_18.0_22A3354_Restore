@implementation UISearchControllerTransplantSearchBarAnimator

void __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_resultsControllerViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 40), "_driveTransitionToSearchLayoutState:", 3);
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "automaticallyShowsCancelButton"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setShowsCancelButton:animated:", 1, *(unsigned __int8 *)(a1 + 73));
  }
  v3 = *(void **)(a1 + 48);
  if (v3 && objc_msgSend(v3, "automaticallyAdjustsScrollViewInsets") && *(_BYTE *)(a1 + 74))
  {
    objc_msgSend(*(id *)(a1 + 32), "_resultsContentScrollViewPresentationOffset");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v4
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 40);
    objc_msgSend(*(id *)(a1 + 56), "setContentOffset:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
  if (!*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 40), "scopeButtonTitles");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "_scopeBarIsVisible");

      if ((v5 & 1) == 0)
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
  }
}

uint64_t __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setMaskActive:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
}

void __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_resultsControllerViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "_driveTransitionToSearchLayoutState:", 2);
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "automaticallyShowsCancelButton"))
  {
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShowsCancelButton:animated:", 0, *(unsigned __int8 *)(a1 + 49));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "isFirstResponder"))
    objc_msgSend(*(id *)(a1 + 40), "resignFirstResponder");
  objc_msgSend(*(id *)(a1 + 32), "_resultsContentScrollViewPresentationOffset");
  if (fabs(v4) >= 2.22044605e-16)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchResultsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_contentOrObservableScrollViewForEdge:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "contentOffset");
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "_resultsContentScrollViewPresentationOffset");
    objc_msgSend(v6, "setContentOffset:", v8, v10 - v11);

  }
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "scopeButtonTitles");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v12 = objc_msgSend(*(id *)(a1 + 40), "_scopeBarIsVisible");

      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 40), "_setShowsScopeBar:animateOpacity:", 0, 1);
        objc_msgSend(*(id *)(a1 + 40), "sizeToFit");
        objc_msgSend(*(id *)(a1 + 40), "layoutBelowIfNeeded");
      }
    }
    else
    {

    }
  }
}

uint64_t __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke_4(id *a1)
{
  id v2;
  _BOOL8 v3;

  if (objc_msgSend(a1[4], "_previousSearchBarPosition") != -1)
  {
    objc_msgSend(a1[5], "_setBarPosition:", objc_msgSend(a1[4], "_previousSearchBarPosition"));
    v2 = a1[5];
    v3 = objc_msgSend(v2, "barPosition") == 3 && objc_msgSend(a1[4], "_previousSearchBarPosition") != 3;
    objc_msgSend(v2, "_setMaskActive:", v3);
    objc_msgSend(a1[4], "set_previousSearchBarPosition:", -1);
  }
  objc_msgSend(a1[5], "_setScopeBarHidden:", 1);
  return objc_msgSend(a1[6], "completeTransition:", objc_msgSend(a1[6], "transitionWasCancelled") ^ 1);
}

@end

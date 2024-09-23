@implementation UISearchControllerInPlaceSearchBarAnimator

uint64_t __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
}

void __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  CGRect v17;

  objc_msgSend(*(id *)(a1 + 32), "_resultsControllerViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  if (objc_msgSend(*(id *)(a1 + 32), "_previousSearchBarPosition") != -1)
    objc_msgSend(*(id *)(a1 + 40), "_setBarPosition:", 3);
  if (!*(_BYTE *)(a1 + 64))
    goto LABEL_22;
  if ((objc_msgSend(*(id *)(a1 + 40), "_isHostedByNavigationBar") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_driveTransitionToSearchLayoutState:", 3);
    goto LABEL_9;
  }
  if (!*(_BYTE *)(a1 + 64))
  {
LABEL_22:
    if (objc_msgSend(*(id *)(a1 + 32), "automaticallyShowsCancelButton"))
      objc_msgSend(*(id *)(a1 + 40), "setShowsCancelButton:animated:", 1, *(unsigned __int8 *)(a1 + 65));
  }
LABEL_9:
  v3 = *(void **)(a1 + 48);
  if (v3 && objc_msgSend(v3, "_compatibleContentInsetAdjustmentBehavior") == 101 && *(_BYTE *)(a1 + 66))
  {
    objc_msgSend(*(id *)(a1 + 32), "_resultsContentScrollViewPresentationOffset");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v4
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 40);
    objc_msgSend(*(id *)(a1 + 48), "setContentOffset:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "_managedPalette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v16 = v5;
    objc_msgSend(*(id *)(a1 + 40), "scopeButtonTitles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = objc_msgSend(*(id *)(a1 + 40), "_scopeBarIsVisible");

      if ((v7 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "_setShowsScopeBar:animateOpacity:", 1, *(unsigned __int8 *)(a1 + 65));
        objc_msgSend(*(id *)(a1 + 40), "_setScopeBarHidden:", 0);
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 40), "sizeToFit");
    objc_msgSend(*(id *)(a1 + 40), "frame");
    v9 = v8;
    objc_msgSend(v16, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v16, "setFrame:isAnimating:", *(unsigned __int8 *)(a1 + 65));
    v17.origin.x = v11;
    v17.origin.y = v13;
    v17.size.width = v15;
    v17.size.height = v9;
    objc_msgSend(v16, "_setTopConstraintConstant:", CGRectGetMinY(v17));
    objc_msgSend(*(id *)(a1 + 40), "layoutBelowIfNeeded");
    v5 = v16;
  }

}

uint64_t __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

void __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_resultsControllerViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  if (objc_msgSend(*(id *)(a1 + 40), "barPosition") == 3
    && objc_msgSend(*(id *)(a1 + 32), "_previousSearchBarPosition") != -1)
  {
    objc_msgSend(*(id *)(a1 + 40), "_setBarPosition:", objc_msgSend(*(id *)(a1 + 32), "_previousSearchBarPosition"));
    objc_msgSend(*(id *)(a1 + 32), "set_previousSearchBarPosition:", -1);
  }
  if (*(_BYTE *)(a1 + 48))
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "_isHostedByNavigationBar") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_driveTransitionToSearchLayoutState:", 2);
      goto LABEL_10;
    }
    if (*(_BYTE *)(a1 + 48))
      goto LABEL_10;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyShowsCancelButton"))
  {
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShowsCancelButton:animated:", 0, *(unsigned __int8 *)(a1 + 49));

  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

  }
  objc_msgSend(*(id *)(a1 + 32), "_resultsContentScrollViewPresentationOffset");
  if (fabs(v7) >= 2.22044605e-16)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchResultsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_contentOrObservableScrollViewForEdge:", 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (objc_msgSend(v14, "_compatibleContentInsetAdjustmentBehavior") == 101)
      {
        objc_msgSend(v14, "contentOffset");
        v10 = v9;
        v12 = v11;
        objc_msgSend(*(id *)(a1 + 32), "_resultsContentScrollViewPresentationOffset");
        objc_msgSend(v14, "setContentOffset:", v10, v12 - v13);
      }
    }

  }
}

uint64_t __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

@end

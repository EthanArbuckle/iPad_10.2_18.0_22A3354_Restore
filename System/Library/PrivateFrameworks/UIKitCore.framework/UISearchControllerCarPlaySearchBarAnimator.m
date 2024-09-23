@implementation UISearchControllerCarPlaySearchBarAnimator

void __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_resultsControllerViewContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsFocusUpdate");
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
}

void __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setDisableFocus:", 0);

  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyShowsCancelButton"))
  {
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShowsCancelButton:animated:", 0, objc_msgSend(*(id *)(a1 + 40), "isAnimated"));

  }
  objc_msgSend(*(id *)(a1 + 32), "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

  }
}

uint64_t __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

void __78___UISearchControllerCarPlaySearchBarAnimator_didFocusSearchBarForController___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __80___UISearchControllerCarPlaySearchBarAnimator_didUnfocusSearchBarForController___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

@end

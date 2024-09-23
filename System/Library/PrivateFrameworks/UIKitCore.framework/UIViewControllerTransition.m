@implementation UIViewControllerTransition

+ (id)zoomWithOptions:(id)a3 sourceViewProvider:(id)a4
{
  return +[_UIZoomViewControllerTransition zoomWithOptions:sourceViewProvider:](_UIZoomViewControllerTransition, "zoomWithOptions:sourceViewProvider:", a3, a4);
}

+ (id)coverVerticalTransition
{
  return +[_UILegacyModalViewControllerTransition transitionWithStyle:](_UILegacyModalViewControllerTransition, "transitionWithStyle:", 0);
}

+ (id)flipHorizontalTransition
{
  return +[_UILegacyModalViewControllerTransition transitionWithStyle:](_UILegacyModalViewControllerTransition, "transitionWithStyle:", 1);
}

+ (id)crossDissolveTransition
{
  return +[_UILegacyModalViewControllerTransition transitionWithStyle:](_UILegacyModalViewControllerTransition, "transitionWithStyle:", 2);
}

+ (id)partialCurlTransition
{
  return +[_UILegacyModalViewControllerTransition transitionWithStyle:](_UILegacyModalViewControllerTransition, "transitionWithStyle:", 3);
}

- (id)_transitionControllerForViewController:(id)a3 inContainer:(id)a4 isAppearing:(BOOL)a5
{
  return 0;
}

- (BOOL)_hasOwnInteractiveExitGestureForTraits:(id)a3
{
  return 0;
}

- (BOOL)_isSupportedGivenTraits:(id)a3
{
  return 0;
}

- (int64_t)_preferredModalPresentationStyle
{
  return -2;
}

uint64_t __45___UIViewControllerTransition__apiTransition__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t (**v5)(_QWORD, _QWORD);
  void *v6;
  uint64_t v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_interactiveDismissShouldBeginHandler");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v3, "location");
    objc_msgSend(v6, "setLocation:");
    objc_msgSend(v3, "velocity");
    objc_msgSend(v6, "setVelocity:");
    objc_msgSend(v6, "setProposedBeginState:", objc_msgSend(v3, "willBegin"));
    v7 = ((uint64_t (**)(_QWORD, void *))v5)[2](v5, v6);

  }
  else
  {
    v7 = objc_msgSend(v3, "willBegin");
  }

  return v7;
}

double __45___UIViewControllerTransition__apiTransition__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameOfSourceInDestination");
  v4 = v3;

  return v4;
}

id __45___UIViewControllerTransition__apiTransition__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_viewProvider");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *))v5)[2](v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

@implementation UIViewControllerTransitionConductor

void __63___UIViewControllerTransitionConductor__startCustomTransition___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "transitionConductor:didEndCustomTransitionWithContext:didComplete:", *(_QWORD *)(a1 + 32), v6, a3);

}

void __63___UIViewControllerTransitionConductor__startCustomTransition___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  id WeakRetained;
  id v10;

  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "transitionConductor:interactiveTransitionDidUpdateProgress:finish:transitionCompleted:transitionContext:", *(_QWORD *)(a1 + 32), a2, a3, v10, a5);

  if ((_DWORD)a2 && (objc_msgSend(v10, "isInterruptible") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCustomNavigationTransitionDuration:", 0.0);
    objc_msgSend(*(id *)(a1 + 32), "setInteractiveTransition:", 0);
  }

}

void __63___UIViewControllerTransitionConductor__startCustomTransition___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "transitionConductor:beginPinningInputViewsForTransitionFromViewController:toViewController:forTransitionType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));

}

@end

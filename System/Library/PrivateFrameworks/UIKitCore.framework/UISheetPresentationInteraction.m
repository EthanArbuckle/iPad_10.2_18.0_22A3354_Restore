@implementation UISheetPresentationInteraction

void __46___UISheetPresentationInteraction__handlePan___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "_sheetPresentationInteractionDidStartPresentationTransition:", WeakRetained);

}

uint64_t __46___UISheetPresentationInteraction__handlePan___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_sheetInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterPanGestureRecognizer:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "addTarget:action:", *(_QWORD *)(a1 + 48), sel__handlePan_);
  objc_msgSend(*(id *)(a1 + 40), "setEnabled:", 1);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 56), "_sheetPresentationInteractionDidFinishPresentationTransition:", *(_QWORD *)(a1 + 48));
  return result;
}

@end

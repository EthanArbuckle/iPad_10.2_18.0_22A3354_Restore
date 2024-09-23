@implementation UIAlertControllerAnimatedTransitioning

void __61___UIAlertControllerAnimatedTransitioning_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  if ((objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "_didEndSystemProvidedPresentationOfAlertController:wasSuccessful:", *(_QWORD *)(a1 + 48), 0);
    objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 0);
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_tapticEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actuateFeedback:", 1);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "_didBeginSystemProvidedPresentationOfAlertController:", *(_QWORD *)(a1 + 48));
    v4 = *(void **)(a1 + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61___UIAlertControllerAnimatedTransitioning_animateTransition___block_invoke_2;
    v6[3] = &unk_1E16B2B40;
    v5 = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v4, "_animateTransition:completionBlock:", v5, v6);

  }
}

uint64_t __61___UIAlertControllerAnimatedTransitioning_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_didEndSystemProvidedPresentationOfAlertController:wasSuccessful:", *(_QWORD *)(a1 + 40), a2);
  return objc_msgSend(*(id *)(a1 + 48), "completeTransition:", a2);
}

uint64_t __61___UIAlertControllerAnimatedTransitioning_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 56) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_didEndSystemProvidedPresentationOfAlertController:wasSuccessful:", *(_QWORD *)(a1 + 40), a2);
  return objc_msgSend(*(id *)(a1 + 48), "completeTransition:", a2);
}

@end

@implementation UIEditMenuOverlayUIClientPresentation

void __87___UIEditMenuOverlayUIClientPresentation_preparedMenuWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "menuManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayedMenu:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __63___UIEditMenuOverlayUIClientPresentation_didTransitionFrom_to___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentAnimator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "runAnimations");

}

void __63___UIEditMenuOverlayUIClientPresentation_didTransitionFrom_to___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "dismissAnimator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "runAnimations");

}

@end

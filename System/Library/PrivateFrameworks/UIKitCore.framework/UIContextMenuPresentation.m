@implementation UIContextMenuPresentation

void __66___UIContextMenuPresentation_setAlongsideAnimatorForPresentation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uiController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platterContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v1 + 16))(v1, 1, v2);

}

uint64_t __46___UIContextMenuPresentation_prepareToPresent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentationTransitionDidEnd");
}

void __63___UIContextMenuPresentation_setAlongsideAnimatorForDismissal___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uiController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platterContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v2);

}

uint64_t __46___UIContextMenuPresentation_prepareToDismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissalTransitionDidEnd");
}

@end

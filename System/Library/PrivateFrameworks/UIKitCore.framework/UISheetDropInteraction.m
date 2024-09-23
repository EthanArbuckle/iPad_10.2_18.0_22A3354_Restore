@implementation UISheetDropInteraction

void __58___UISheetDropInteraction__activityForSession_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __55___UISheetDropInteraction_dropInteraction_performDrop___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

void __55___UISheetDropInteraction_dropInteraction_performDrop___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sheetDropInteraction:handleUserActivity:forPresentedViewController:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));

  }
}

void __76___UISheetDropInteraction_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentationController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentedView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 1.0);

  }
}

@end

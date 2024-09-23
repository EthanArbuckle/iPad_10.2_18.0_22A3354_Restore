@implementation UIPreviewInteractionPresentationTransition

uint64_t __65___UIPreviewInteractionPresentationTransition_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2 == 0);
}

uint64_t __74___UIPreviewInteractionPresentationTransition_startInteractiveTransition___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t result;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[34])
    result = objc_msgSend(v2, "_performCancelTransition");
  else
    result = objc_msgSend(v2, "_performFinishTransition");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = 0;
  return result;
}

void __68___UIPreviewInteractionPresentationTransition__newPushDecayAnimator__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_previewPresentationControllerForTransitionContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationContainerEffectView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_applyPushDecayEffectTransformToView:", v3);
}

@end

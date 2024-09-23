@implementation UIPreviewInteractionCommitTransition

void __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  char v21;

  v2 = *(unsigned __int8 *)(a1 + 72);
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "_preferredTransitionAnimatorForReducedMotion");
  else
    objc_msgSend(v3, "_preferredTransitionAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_2;
  v17[3] = &unk_1E16B4030;
  v21 = *(_BYTE *)(a1 + 72);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v18 = v6;
  v19 = v7;
  v20 = *(id *)(a1 + 48);
  objc_msgSend(v4, "addAnimations:", v17);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_3;
  v13[3] = &unk_1E16DAA00;
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v16 = *(id *)(a1 + 64);
  objc_msgSend(v4, "addCompletion:", v13);
  objc_msgSend(v4, "startAnimation");
  if (!*(_BYTE *)(a1 + 72))
  {
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_4;
    v11[3] = &unk_1E16B1B28;
    v12 = *(id *)(a1 + 40);
    v10 = +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:delay:options:animations:completion:](UIViewPropertyAnimator, "runningPropertyAnimatorWithDuration:delay:options:animations:completion:", 0x10000, v11, 0, 0.15, 0.0);

  }
}

uint64_t __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "_applyCommitEffectTransformToView:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_applyCommitEffectTransformToView:", *(_QWORD *)(a1 + 48));
}

uint64_t __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setCurrentCommitEffectWindow:", 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setBlurRadius:", 96.0);
}

void __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_6;
  v5[3] = &unk_1E16B2F48;
  v7 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v5);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v2, v3, v4);

}

uint64_t __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_endDisablingAnimations");
}

@end

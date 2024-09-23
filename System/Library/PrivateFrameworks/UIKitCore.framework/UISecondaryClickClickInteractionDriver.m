@implementation UISecondaryClickClickInteractionDriver

uint64_t __65___UISecondaryClickClickInteractionDriver__attemptSecondaryClick__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  v2 = result;
  if (a2 == 2)
    return objc_msgSend(*(id *)(result + 32), "cancelInteraction");
  if (!a2)
  {
    handleEvent(stateMachineSpec_7, *(_QWORD *)(*(_QWORD *)(result + 32) + 8), 0, *(_QWORD *)(result + 32), (uint64_t *)(*(_QWORD *)(result + 32) + 8));
    objc_msgSend(*(id *)(v2 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(v2 + 32), "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(v2 + 32);
      objc_msgSend(v6, "maximumEffectProgress");
      objc_msgSend(v5, "clickDriver:didUpdateHighlightProgress:", v6);

    }
    result = handleEvent(stateMachineSpec_7, *(_QWORD *)(*(_QWORD *)(v2 + 32) + 8), 1, *(_QWORD *)(v2 + 32), (uint64_t *)(*(_QWORD *)(v2 + 32) + 8));
    v7 = *(_QWORD *)(v2 + 32);
    v9 = *(_QWORD *)(v7 + 8);
    v8 = (uint64_t *)(v7 + 8);
    if (v9 == 3)
      return handleEvent(stateMachineSpec_7, 3, 2, *(_QWORD *)(v2 + 32), v8);
  }
  return result;
}

@end

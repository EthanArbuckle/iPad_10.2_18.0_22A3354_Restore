@implementation TVRMAlertControllerTransitioning

uint64_t __55___TVRMAlertControllerTransitioning_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setTransform:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAlpha:", *(double *)(a1 + 88));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", *(double *)(a1 + 88));
}

uint64_t __55___TVRMAlertControllerTransitioning_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(*(id *)(a1 + 40), "viewForKey:", *MEMORY[0x24BEBE9A8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", a2);
}

@end

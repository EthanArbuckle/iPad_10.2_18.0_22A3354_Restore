@implementation UIFocusEffectsController

void __51___UIFocusEffectsController_startRollbackAnimation__block_invoke(uint64_t a1, double a2, double a3)
{
  double v3;
  double v4;
  void *v5;
  id v6;

  v3 = *(double *)(a1 + 40) * a3;
  v4 = *(double *)(a1 + 48) * a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *(double *)(a1 + 56) * a3, *(double *)(a1 + 64) * a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCurrentOffset:overrideDisplayOffset:", v6, v3, v4);

}

void __51___UIFocusEffectsController_startRollbackAnimation__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 8);
    *(_QWORD *)(v2 + 8) = 0;

  }
}

@end

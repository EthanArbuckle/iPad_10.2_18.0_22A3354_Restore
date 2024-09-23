@implementation UIView

void __58__UIView_NCTextSupportingAdditions___interactionForClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __49__UIView_NCHighFrameRate__nc_applyHighFrameRate___block_invoke(uint64_t a1)
{
  void *v2;
  CAFrameRateRange v4;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2621442, *(_QWORD *)(a1 + 32), *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

@end

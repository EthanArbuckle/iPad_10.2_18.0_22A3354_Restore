@implementation UIOldConstraintsSupportUpdateDependentViewsForConstraint

uint64_t ___UIOldConstraintsSupportUpdateDependentViewsForConstraint_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(a2, "_didAddDependentConstraint:", v2);
  else
    return objc_msgSend(a2, "_didRemoveDependentConstraint:", v2);
}

@end

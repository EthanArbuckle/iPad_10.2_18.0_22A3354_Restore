@implementation UIView

uint64_t __84__UIView_SBUISystemAperturePrivate__SBUISA_systemApertureLayoutGuideWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __93__UIView_SBUISystemApertureAnimationParameters__SBUISA_performWithoutAnimationOrRetargeting___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", *(_QWORD *)(a1 + 32));
}

@end

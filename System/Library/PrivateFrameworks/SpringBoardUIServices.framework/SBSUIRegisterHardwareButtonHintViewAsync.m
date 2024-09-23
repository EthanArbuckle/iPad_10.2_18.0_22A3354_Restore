@implementation SBSUIRegisterHardwareButtonHintViewAsync

void __SBSUIRegisterHardwareButtonHintViewAsync_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  SBSUIRegisterHardwareButtonHintView(*(void **)(a1 + 32), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

@end

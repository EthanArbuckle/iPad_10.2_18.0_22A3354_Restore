@implementation SBSUIHardwareButtonGetHintViewsSupportedAsync

uint64_t __SBSUIHardwareButtonGetHintViewsSupportedAsync_block_invoke(uint64_t a1)
{
  uint64_t result;

  if (SBSUIHardwareButtonHintViewsSupported_onceToken != -1)
    dispatch_once(&SBSUIHardwareButtonHintViewsSupported_onceToken, &__block_literal_global_37);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, SBSUIHardwareButtonHintViewsSupported_hintViewsSupported);
  return result;
}

@end

@implementation SBPPTEventActionsToFiveFingerScrunchToHomeScreen

void __SBPPTEventActionsToFiveFingerScrunchToHomeScreen_block_invoke(uint64_t a1, void *a2)
{
  SBPPTBeginFiveFingerScrunch(a2, &__block_literal_global_25_2, 0.4);
}

uint64_t __SBPPTEventActionsToFiveFingerScrunchToHomeScreen_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "liftUpAtAllActivePoints");
}

@end

@implementation SBSUIHardwareButtonHintViewsSupported

void __SBSUIHardwareButtonHintViewsSupported_block_invoke()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0DAAE70]);
  SBSUIHardwareButtonHintViewsSupported_hintViewsSupported = objc_msgSend(v0, "getAssociatedHintViewsSupported");
  objc_msgSend(v0, "invalidate");

}

@end

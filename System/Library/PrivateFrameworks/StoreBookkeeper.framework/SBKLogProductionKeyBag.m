@implementation SBKLogProductionKeyBag

void __SBKLogProductionKeyBag_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_storeStrong((id *)&SBKLogProductionKeyBag_keybag, a2);
  v3 = a2;
  NSLog(CFSTR("key bag contents = \n%@\n\n"), SBKLogProductionKeyBag_keybag);

}

@end

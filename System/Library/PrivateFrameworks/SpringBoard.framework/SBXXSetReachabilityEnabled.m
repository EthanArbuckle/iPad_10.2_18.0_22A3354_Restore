@implementation SBXXSetReachabilityEnabled

void ___SBXXSetReachabilityEnabled_block_invoke(uint64_t a1)
{
  id v2;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReachabilityEnabled:", *(_BYTE *)(a1 + 32) != 0);

}

@end

@implementation SBXXIsReachabilityEnabled

void ___SBXXIsReachabilityEnabled_block_invoke(uint64_t a1)
{
  id v2;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  **(_BYTE **)(a1 + 32) = objc_msgSend(v2, "reachabilityEnabled");

}

@end

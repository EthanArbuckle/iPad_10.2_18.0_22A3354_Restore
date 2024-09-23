@implementation SBXXDimScreen

void ___SBXXDimScreen_block_invoke(uint64_t a1)
{
  id v2;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestUserAttentionScreenWakeFromSource:reason:", 19, *(_QWORD *)(a1 + 32));

}

@end

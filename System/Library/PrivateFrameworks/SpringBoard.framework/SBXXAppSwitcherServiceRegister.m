@implementation SBXXAppSwitcherServiceRegister

void ___SBXXAppSwitcherServiceRegister_block_invoke(uint64_t a1)
{
  id v2;

  +[SBAppSwitcherServiceManager sharedInstance](SBAppSwitcherServiceManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerService:", *(_QWORD *)(a1 + 32));

}

void ___SBXXAppSwitcherServiceRegister_block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___SBXXAppSwitcherServiceRegister_block_invoke_3;
  block[3] = &unk_1E8E9DED8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void ___SBXXAppSwitcherServiceRegister_block_invoke_3(uint64_t a1)
{
  id v2;

  +[SBAppSwitcherServiceManager sharedInstance](SBAppSwitcherServiceManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterService:", *(_QWORD *)(a1 + 32));

}

@end

@implementation SBUICurrentPasscodeStyleForUser

uint64_t __SBUICurrentPasscodeStyleForUser_block_invoke()
{
  void *v0;
  const char *v1;
  int out_token;

  SBUICurrentPasscodeStyleForUser___simplePasscodeType = -1;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  SBUICurrentPasscodeStyleForUser___unlockScreenType = objc_msgSend(v0, "unlockScreenTypeWithOutSimplePasscodeType:", &SBUICurrentPasscodeStyleForUser___simplePasscodeType);

  out_token = 0;
  v1 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D47200], "UTF8String");
  return notify_register_dispatch(v1, &out_token, MEMORY[0x1E0C80D38], &__block_literal_global_2);
}

void __SBUICurrentPasscodeStyleForUser_block_invoke_2()
{
  id v0;

  SBUICurrentPasscodeStyleForUser___simplePasscodeType = -1;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  SBUICurrentPasscodeStyleForUser___unlockScreenType = objc_msgSend(v0, "unlockScreenTypeWithOutSimplePasscodeType:", &SBUICurrentPasscodeStyleForUser___simplePasscodeType);

}

@end

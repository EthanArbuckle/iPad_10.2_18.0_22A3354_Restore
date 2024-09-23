@implementation AMSBag

void __25__AMSBag_Quota__quotaBag__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("iCloudQuota"), CFSTR("1"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)quotaBag_quotaBag;
  quotaBag_quotaBag = v0;

}

@end

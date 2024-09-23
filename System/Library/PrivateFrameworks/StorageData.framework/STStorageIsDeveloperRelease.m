@implementation STStorageIsDeveloperRelease

void __STStorageIsDeveloperRelease_block_invoke()
{
  id v0;

  MGGetStringAnswer();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  STStorageIsDeveloperRelease_isDeveloperRelease = objc_msgSend(v0, "isEqualToString:", CFSTR("Beta"));

}

@end

@implementation SKUIAccountsUIFramework

void *__SKUIAccountsUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AccountsUI.framework/AccountsUI", 1);
  SKUIAccountsUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end

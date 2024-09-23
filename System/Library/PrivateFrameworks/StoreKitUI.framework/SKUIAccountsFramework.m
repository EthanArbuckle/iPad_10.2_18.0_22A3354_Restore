@implementation SKUIAccountsFramework

void *__SKUIAccountsFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/Accounts.framework/Accounts", 1);
  SKUIAccountsFramework_sHandle = (uint64_t)result;
  return result;
}

@end

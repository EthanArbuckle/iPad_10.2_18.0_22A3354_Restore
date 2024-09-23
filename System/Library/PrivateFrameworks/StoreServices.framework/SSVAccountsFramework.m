@implementation SSVAccountsFramework

void *__SSVAccountsFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/Accounts.framework/Accounts", 1);
  SSVAccountsFramework_sHandle = (uint64_t)result;
  return result;
}

@end

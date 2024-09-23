@implementation SKUIContactsUIFramework

void *__SKUIContactsUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/ContactsUI.framework/ContactsUI", 1);
  SKUIContactsUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end

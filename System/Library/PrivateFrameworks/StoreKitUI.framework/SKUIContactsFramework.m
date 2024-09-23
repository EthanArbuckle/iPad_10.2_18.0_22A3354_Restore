@implementation SKUIContactsFramework

void *__SKUIContactsFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/Contacts.framework/Contacts", 1);
  SKUIContactsFramework_sHandle = (uint64_t)result;
  return result;
}

@end

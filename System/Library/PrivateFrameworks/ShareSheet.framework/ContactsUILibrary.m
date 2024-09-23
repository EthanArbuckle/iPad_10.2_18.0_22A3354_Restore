@implementation ContactsUILibrary

void *__ContactsUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/ContactsUI.framework/ContactsUI", 2);
  ContactsUILibrary_sLib = (uint64_t)result;
  return result;
}

@end

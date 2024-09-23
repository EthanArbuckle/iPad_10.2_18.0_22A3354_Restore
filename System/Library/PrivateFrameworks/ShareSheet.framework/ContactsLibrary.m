@implementation ContactsLibrary

void *__ContactsLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/Contacts.framework/Contacts", 2);
  ContactsLibrary_sLib = (uint64_t)result;
  return result;
}

@end

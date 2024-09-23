@implementation LoadContactsUI

void *__LoadContactsUI_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/ContactsUI.framework/ContactsUI", 2);
  LoadContactsUI_frameworkLibrary = (uint64_t)result;
  return result;
}

@end

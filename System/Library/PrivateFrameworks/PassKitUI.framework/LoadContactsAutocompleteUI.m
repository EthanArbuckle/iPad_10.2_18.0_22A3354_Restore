@implementation LoadContactsAutocompleteUI

void *__LoadContactsAutocompleteUI_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/ContactsAutocompleteUI.framework/ContactsAutocompleteUI", 2);
  LoadContactsAutocompleteUI_frameworkLibrary = (uint64_t)result;
  return result;
}

@end

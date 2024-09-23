@implementation SKUIContactsAutocompleteUIFramework

void *__SKUIContactsAutocompleteUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ContactsAutocompleteUI.framework/ContactsAutocompleteUI", 1);
  SKUIContactsAutocompleteUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end

@implementation VUIMediaEntityFetchRequestAllPropertiesSet

void __VUIMediaEntityFetchRequestAllPropertiesSet_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("__All__"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VUIMediaEntityFetchRequestAllPropertiesSet___fetchAllPropertiesSet;
  VUIMediaEntityFetchRequestAllPropertiesSet___fetchAllPropertiesSet = v0;

}

@end

@implementation ICSystemApplicationTypeForBundleIdentifier

void __ICSystemApplicationTypeForBundleIdentifier_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", &unk_1E43E6DA0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ICSystemApplicationTypeForBundleIdentifier___bundleIdentifierToSystemTypeMap;
  ICSystemApplicationTypeForBundleIdentifier___bundleIdentifierToSystemTypeMap = v0;

}

@end

@implementation SSSectionIsSyndicatedPhotos

void __SSSectionIsSyndicatedPhotos_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0C99E60];
  SSBundleIdentifiersForSyndicatedPhotos();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)SSSectionIsSyndicatedPhotos_photosBundleIdentifiers;
  SSSectionIsSyndicatedPhotos_photosBundleIdentifiers = v1;

}

@end

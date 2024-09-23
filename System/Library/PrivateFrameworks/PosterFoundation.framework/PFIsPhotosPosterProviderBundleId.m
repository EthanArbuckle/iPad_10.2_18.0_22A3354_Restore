@implementation PFIsPhotosPosterProviderBundleId

void __PFIsPhotosPosterProviderBundleId_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"), CFSTR("com.apple.mobileslideshow.PhotosPosterProvider"), CFSTR("com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PFIsPhotosPosterProviderBundleId_photosBundleIdentifiers;
  PFIsPhotosPosterProviderBundleId_photosBundleIdentifiers = v0;

}

@end

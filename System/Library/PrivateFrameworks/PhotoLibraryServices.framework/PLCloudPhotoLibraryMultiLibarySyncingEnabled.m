@implementation PLCloudPhotoLibraryMultiLibarySyncingEnabled

void __PLCloudPhotoLibraryMultiLibarySyncingEnabled_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  PLCloudPhotoLibraryMultiLibarySyncingEnabled_multiLibrarySyncingEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLCloudPhotoLibraryMultiLibrarySyncingEnabled"));

}

@end

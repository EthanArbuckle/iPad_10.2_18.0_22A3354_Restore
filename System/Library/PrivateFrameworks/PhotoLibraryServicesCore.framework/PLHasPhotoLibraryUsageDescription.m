@implementation PLHasPhotoLibraryUsageDescription

void __PLHasPhotoLibraryUsageDescription_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NSPhotoLibraryUsageDescription"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PLHasPhotoLibraryUsageDescription_hasUsageDescription = v1 != 0;

}

@end

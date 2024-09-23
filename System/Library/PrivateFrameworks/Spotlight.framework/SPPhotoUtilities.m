@implementation SPPhotoUtilities

+ (id)bundlesIndexingPhotos
{
  if (bundlesIndexingPhotos_onceToken != -1)
    dispatch_once(&bundlesIndexingPhotos_onceToken, &__block_literal_global_3);
  return (id)bundlesIndexingPhotos_bundlesIndexingPhotos;
}

void __41__SPPhotoUtilities_bundlesIndexingPhotos__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BEB0408];
  v4[0] = *MEMORY[0x24BEB0478];
  v4[1] = v0;
  v1 = *MEMORY[0x24BEB03C0];
  v4[2] = *MEMORY[0x24BEB05D0];
  v4[3] = v1;
  v4[4] = *MEMORY[0x24BEB03D8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)bundlesIndexingPhotos_bundlesIndexingPhotos;
  bundlesIndexingPhotos_bundlesIndexingPhotos = v2;

}

+ (id)allPhotoBundles
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SPPhotoUtilities_allPhotoBundles__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allPhotoBundles_onceToken != -1)
    dispatch_once(&allPhotoBundles_onceToken, block);
  return (id)allPhotoBundles_allPhotoBundles;
}

void __35__SPPhotoUtilities_allPhotoBundles__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  SSBundleIdentifiersForSyndicatedPhotos();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundlesIndexingPhotos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)allPhotoBundles_allPhotoBundles;
  allPhotoBundles_allPhotoBundles = v3;

}

+ (BOOL)isImageOrVideoIdentifier:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if ((objc_msgSend(v4, "conformsToType:", *MEMORY[0x24BDF84B8]) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x24BDF8410]);

  return v5;
}

@end

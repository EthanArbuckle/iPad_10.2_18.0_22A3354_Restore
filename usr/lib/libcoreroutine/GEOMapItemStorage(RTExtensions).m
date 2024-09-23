@implementation GEOMapItemStorage(RTExtensions)

+ (id)mapItemStorageForPlace:()RTExtensions locationOfInterestType:
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0D271B0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithLOIType:event:", a4, 0);
  objc_msgSend(a1, "mapItemStorageForPlace:clientAttributes:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)mapItemStorageForGEOMapItem:()RTExtensions locationOfInterestType:
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0D271B0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithLOIType:event:", a4, 0);
  objc_msgSend(a1, "mapItemStorageForGEOMapItem:clientAttributes:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end

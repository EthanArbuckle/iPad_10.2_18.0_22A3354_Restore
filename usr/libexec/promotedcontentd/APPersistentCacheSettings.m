@implementation APPersistentCacheSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)APSettingsStorageKeychain), "initWithDefaultValues:", v3);

  return v4;
}

@end

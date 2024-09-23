@implementation UIApplication(IMCompatibility)

+ (id)applicationDocumentsDirectory
{
  void *v0;
  void *v1;

  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)applicationCacheDirectory
{
  void *v0;
  void *v1;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end

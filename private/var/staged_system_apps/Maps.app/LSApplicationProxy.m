@implementation LSApplicationProxy

- (id)coverageFilePath
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationProxy bundleContainerURL](self, "bundleContainerURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("GeoJSON")));
  return v4;
}

@end

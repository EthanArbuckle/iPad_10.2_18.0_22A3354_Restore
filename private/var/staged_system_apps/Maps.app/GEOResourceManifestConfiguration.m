@implementation GEOResourceManifestConfiguration

- (BOOL)supportsTransit
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestConfiguration os](self, "os"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("watchos"));

  return v3;
}

@end

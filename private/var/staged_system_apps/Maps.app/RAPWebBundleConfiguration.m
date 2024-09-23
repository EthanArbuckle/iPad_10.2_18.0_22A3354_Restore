@implementation RAPWebBundleConfiguration

- (id)bundleName
{
  return CFSTR("RAPWebBundle");
}

- (id)urlScheme
{
  return CFSTR("rap");
}

- (id)entryPointUrl
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration entryPointUrlBase](self, "entryPointUrlBase"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("index.html")));

  return v3;
}

- (id)serverURL
{
  return (id)GEOGetURL(58, a2);
}

- (id)debugOverrideServerURL
{
  uint64_t String;
  void *v3;
  void *v4;

  String = GEOConfigGetString(MapsConfig_RAPWebBundleURL, off_1014B41B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(String);
  if (objc_msgSend(v3, "length"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  else
    v4 = 0;

  return v4;
}

- (id)rootDirectory
{
  return CFSTR("RAPWebBundle");
}

- (id)onDeviceDirectory
{
  return CFSTR("RAPWebBundle");
}

- (id)onDeviceDirectoryWritable
{
  return CFSTR("RAPWebBundleWritable");
}

- (id)messageHandlerName
{
  return CFSTR("rapBundle");
}

- (id)manifestSignedResourceName
{
  return CFSTR("manifest.cms-rap");
}

- (id)manifestKey
{
  return CFSTR("RAPWebBundleManifestKey");
}

@end

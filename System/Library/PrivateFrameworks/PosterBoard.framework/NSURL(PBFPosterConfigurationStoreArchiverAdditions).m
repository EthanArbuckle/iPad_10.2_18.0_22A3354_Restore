@implementation NSURL(PBFPosterConfigurationStoreArchiverAdditions)

+ (id)pbf_manifestURLInContainerURL:()PBFPosterConfigurationStoreArchiverAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("manifest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end

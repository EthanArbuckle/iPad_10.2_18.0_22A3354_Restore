@implementation PFPosterExtension(PBFUtilities)

- (uint64_t)pbf_supportsGalleryOrUserDefaultsHasItOverriddenToSupportGallery:()PBFUtilities
{
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "posterExtensionInfoPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pbf_supportsGallery");

  if ((v6 & 1) != 0)
    return 1;
  objc_msgSend(a1, "posterExtensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringArrayForKey:", CFSTR("ShowSamplePoster"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v10, "containsObject:", v8);

  if (a3)
    *a3 = v7;

  return v7;
}

@end

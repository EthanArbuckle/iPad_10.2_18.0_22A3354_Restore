@implementation PHImportSource(PhotosUICore)

- (uint64_t)px_shouldShowCPLOptimizedMessage
{
  void *v1;
  int v2;
  void *v3;
  int v4;

  v1 = a1;
  v2 = objc_msgSend(a1, "isAppleDevice");
  LODWORD(v1) = objc_msgSend(v1, "isOptimizedCPLStorage");
  +[PXImportSettings sharedInstance](PXImportSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alwaysShowCPLOptimizedMessage");

  return v2 & (v1 | v4);
}

- (uint64_t)_cplOptimizedLearnMoreURL
{
  const __CFString *v0;

  if (PLPhysicalDeviceIsIPad())
    v0 = CFSTR("https://support.apple.com/ht213272?cid=mc-ols-photos-article_ht213272-ipados_ui-06232022");
  else
    v0 = CFSTR("https://support.apple.com/ht213272?cid=mc-ols-photos-article_ht213272-ios_ui-06232022");
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
}

@end

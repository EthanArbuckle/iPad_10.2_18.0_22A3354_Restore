@implementation NSURL(RemoteUIAdditions)

- (uint64_t)rui_isSupportedNativeURL
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (rui_isSupportedNativeURL_onceToken != -1)
    dispatch_once(&rui_isSupportedNativeURL_onceToken, &__block_literal_global_9);
  v2 = (void *)rui_isSupportedNativeURL_supportedSchemes;
  objc_msgSend(a1, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (uint64_t)rui_isSupportedSafariURL
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (rui_isSupportedSafariURL_onceToken != -1)
    dispatch_once(&rui_isSupportedSafariURL_onceToken, &__block_literal_global_10);
  v2 = (void *)rui_isSupportedSafariURL_supportedSafariSchemes;
  objc_msgSend(a1, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

@end

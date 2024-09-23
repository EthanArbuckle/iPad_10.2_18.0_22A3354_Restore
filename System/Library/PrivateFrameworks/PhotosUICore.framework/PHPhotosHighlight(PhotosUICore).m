@implementation PHPhotosHighlight(PhotosUICore)

- (const)px_navigationURLHost
{
  if ((objc_msgSend(a1, "px_isEvent") & 1) != 0)
    return CFSTR("events");
  if (objc_msgSend(a1, "px_isTrip"))
    return CFSTR("trips");
  return CFSTR("highlights");
}

- (uint64_t)px_curationType
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v2 = objc_msgSend(a1, "preferredCurationType");
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useCustomDaysCurationType");

  if (!v4)
    return v2;
  v5 = objc_msgSend(a1, "assetCollectionSubtype");
  if (v5 != 1000000304 && v5 != 1000000301)
    return v2;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "daysCurationType");

  return v7;
}

@end

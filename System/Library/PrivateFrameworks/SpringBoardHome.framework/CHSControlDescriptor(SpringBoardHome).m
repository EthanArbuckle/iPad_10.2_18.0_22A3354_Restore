@implementation CHSControlDescriptor(SpringBoardHome)

- (id)sbh_appName
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a1, "extensionIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "extensionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  SBHContainingBundleRecordForWidgetWithBundleIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "localizedShortName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (uint64_t)sbh_supportedSizeClasses
{
  return 0;
}

- (uint64_t)sbh_favoredSizeClassesForAddWidgetSheetLocation:()SpringBoardHome
{
  return 0;
}

- (uint64_t)sbh_disfavoredSizeClassesForAddWidgetSheetLocation:()SpringBoardHome
{
  return 0;
}

- (uint64_t)_widgetLocationStyleForAddWidgetSheetLocation:()SpringBoardHome
{
  return 0;
}

- (uint64_t)sbh_canBeAddedToStack
{
  return 0;
}

- (uint64_t)sbh_supportsRemovableBackground
{
  return 0;
}

- (uint64_t)sbh_supportsRemovableBackgroundOrAccessoryFamilies
{
  return 0;
}

- (id)sbh_galleryItemIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  objc_getAssociatedObject(a1, &SBHControlDescriptorGalleryItemIdentifierKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "extensionIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "extensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "kind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1, "preferredControlSize");
    objc_msgSend(a1, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "widgetDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "intentType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("CONTROL_DESCRIPTOR:%@-%@-%@-%lu-%@-%@-%@"), v5, v6, v7, v8, v9, v10, v11);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_setAssociatedObject(a1, &SBHControlDescriptorGalleryItemIdentifierKey, v2, (void *)1);
  }
  return v2;
}

- (uint64_t)sbh_isLinkedOnOrAfter:()SpringBoardHome
{
  return 1;
}

- (uint64_t)backgroundColor
{
  return 0;
}

- (uint64_t)accentColor
{
  return 0;
}

- (uint64_t)mostInterestingColor
{
  return 0;
}

@end

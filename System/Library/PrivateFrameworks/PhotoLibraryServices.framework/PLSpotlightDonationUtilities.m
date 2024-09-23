@implementation PLSpotlightDonationUtilities

+ (id)photosBundleIdentifier
{
  return CFSTR("com.apple.mobileslideshow");
}

+ (int64_t)wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;

  v3 = a3;
  objc_msgSend(v3, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier");
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D73280];
    objc_msgSend(v3, "pathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "wellKnownPhotoLibraryIdentifierForURL:", v9);

    if (!v6)
    {
      objc_msgSend(v3, "pathManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isSystemPhotoLibraryPathManager");

      v6 = v11;
    }
  }

  return v6;
}

+ (id)bundleIdentifierForAsset:(id)a3 wellKnownLibraryIdentifier:(int64_t)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if ((unint64_t)a4 < 2)
  {
    v7 = CFSTR("com.apple.mobileslideshow");
    goto LABEL_10;
  }
  if (a4 == 2)
  {
    PLSearchBackendDonationsGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = CFSTR("messages photolibrary");
      v11 = 138412290;
      v12 = CFSTR("messages photolibrary");
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Unsupported library identifier: %@", (uint8_t *)&v11, 0xCu);

    }
    goto LABEL_9;
  }
  if (a4 != 3)
  {
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "importedByBundleIdentifier");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v7;
}

+ (id)bundleIdentifierForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "bundleIdentifierForAsset:wellKnownLibraryIdentifier:", v4, objc_msgSend(a1, "wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:", v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLSearchBackendDonationsGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "No PhotoLibrary for asset %{public}@", (uint8_t *)&v10, 0xCu);

    }
    v6 = 0;
  }

  return v6;
}

+ (id)domainIdentifierForPhotoLibraryIdentifier:(int64_t)a3
{
  NSObject *v4;
  __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      return CFSTR("com.apple.mobileslideshow.search");
    case 2:
      PLSearchBackendDonationsGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = CFSTR("messages photolibrary");
        v6 = 138543362;
        v7 = CFSTR("messages photolibrary");
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Unsupported PhotoLibrary: %{public}@", (uint8_t *)&v6, 0xCu);

      }
      return 0;
    case 1:
      return CFSTR("com.apple.mobileslideshow.search");
    default:
      return 0;
  }
}

+ (id)spotlightUniqueIdentifierForAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:", v5);

  if (v6 == 3)
  {
    objc_msgSend(v4, "additionalAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "syndicationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
  }
  else
  {
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (BOOL)spotlightPrivateIndexEnabled
{
  return 0;
}

+ (BOOL)shouldUseSpotlightPrivateIndexForLibraryIdentifier:(int64_t)a3
{
  if ((unint64_t)a3 > 1)
    return 0;
  else
    return objc_msgSend(a1, "spotlightPrivateIndexEnabled");
}

+ (BOOL)isUniversalSearchEnabledForPhotoLibrary:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wellKnownPhotoLibraryIdentifier");

  return ((v4 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

+ (unint64_t)universalSearchIneligibilityReasonsForPhotoLibraryWithURL:(id)a3
{
  return 0;
}

+ (BOOL)shouldDisablePhotosLegacySearchDonation
{
  return _os_feature_enabled_impl();
}

@end

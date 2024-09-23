@implementation PUCopyLinkActivity

+ (BOOL)wantsMomentShareLinkForAssetCount:(int64_t)a3
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PXCMMHasSendAndReceiveCapabilities();

  return v4;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BCC0];
}

- (id)activityTitle
{
  return PULocalizedString(CFSTR("SHARING_COPY_LINK_ACTIVITY_TITLE"));
}

- (id)_systemImageName
{
  return CFSTR("link.icloud");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXActivity itemSourceController](self, "itemSourceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "shouldExcludeLivenessInAllItemSources") & 1) != 0
    || (objc_msgSend(v5, "shouldExcludeCaptionInAllItemSources") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(v5, "shouldExcludeAccessibilityDescriptionInAllItemSources") ^ 1;
  }
  objc_msgSend(v5, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = PXCMMHasSendAndReceiveCapabilities();
    LOBYTE(v11) = 0;
    if (objc_msgSend(v4, "count") && v10)
    {
      -[PXActivity itemSourceController](self, "itemSourceController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "itemSourcesSupportMomentShareLinkCreation") & v6;

    }
  }
  else
  {
    PLSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "Copy Link: Photo library was nil, so returning NO for canPerform. Item source controller: %@", (uint8_t *)&v15, 0xCu);
    }

    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)performActivity
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PXActivity itemSourceController](self, "itemSourceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publishedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "pl_redactedShareURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Copy Link: Got moment share URL: %{public}@", (uint8_t *)&v8, 0xCu);

    }
    PXCopyURL();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Copy Link: Missing URL to copy", (uint8_t *)&v8, 2u);
    }

  }
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", v4 != 0);

}

@end

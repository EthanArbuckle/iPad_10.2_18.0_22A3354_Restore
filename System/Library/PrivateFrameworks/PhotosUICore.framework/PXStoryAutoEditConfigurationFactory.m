@implementation PXStoryAutoEditConfigurationFactory

+ (id)autoEditConfiguration
{
  uint64_t *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = &OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsEXIFWidgetViewModel_assetDidChange;
  if ((autoEditConfiguration_shouldCheckDefaultConfigurationFile & 1) != 0 || !PFOSVariantHasInternalUI())
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0D73208], "defaultSystemPhotoDataDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("PFStoryAutoEditDefaultConfig.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isReadableFileAtPath:", v9))
  {
    v2 = (uint64_t *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752A0]), "initWithConfigurationFileAtURL:", v7);
    PLStoryGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v11)
      {
        v14 = 138412290;
        v15 = v7;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_INFO, "PXStoryAutoEditConfigurationFactory loaded from on-device file at %@", (uint8_t *)&v14, 0xCu);
      }

      v12 = 0;
    }
    else
    {
      if (v11)
      {
        v14 = 138412290;
        v15 = v7;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_INFO, "PXStoryAutoEditConfigurationFactory failed to load from on-device file at %@", (uint8_t *)&v14, 0xCu);
      }

      v2 = 0;
      v12 = 1;
    }
  }
  else
  {
    v12 = 1;
    autoEditConfiguration_shouldCheckDefaultConfigurationFile = 1;
  }

  if (v12)
  {
LABEL_13:
    if (autoEditConfiguration_onceToken != -1)
      dispatch_once(&autoEditConfiguration_onceToken, &__block_literal_global_101970);
    v2 = (uint64_t *)(id)autoEditConfiguration_sharedConfiguration;
  }
  return v2;
}

void __60__PXStoryAutoEditConfigurationFactory_autoEditConfiguration__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "fileURLForFactorName:", CFSTR("com.apple.photos.autoedit.configuration"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
    goto LABEL_6;
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D752A0]), "initWithConfigurationFileAtURL:", v1);
  v3 = (void *)autoEditConfiguration_sharedConfiguration;
  autoEditConfiguration_sharedConfiguration = v2;

  if (autoEditConfiguration_sharedConfiguration)
  {
    PLStoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v1;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_INFO, "PXStoryAutoEditConfigurationFactory loaded from Turi at %@", (uint8_t *)&v8, 0xCu);
    }

LABEL_6:
    if (autoEditConfiguration_sharedConfiguration)
      goto LABEL_10;
  }
  PLStoryGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "PXStoryAutoEditConfigurationFactory standardConfiguration", (uint8_t *)&v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D752A0], "standardConfiguration");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)autoEditConfiguration_sharedConfiguration;
  autoEditConfiguration_sharedConfiguration = v6;

LABEL_10:
}

@end

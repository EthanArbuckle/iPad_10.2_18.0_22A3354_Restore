@implementation PXShouldLimitImagesTo3MP

void ___PXShouldLimitImagesTo3MP_block_invoke()
{
  void *v0;
  double v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "nativeBounds");
  PXSizeGetArea();
  if (v1 > 3617587.2 || (PFProcessIsLaunchedToExecuteTests() & 1) != 0)
  {
    _PXShouldLimitImagesTo3MP_shouldLimitImagesTo3MP = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isCloudPhotoLibraryEnabled"))
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      _PXShouldLimitImagesTo3MP_shouldLimitImagesTo3MP = objc_msgSend(v3, "allowLimitingImagesTo3MP");

    }
    else
    {
      _PXShouldLimitImagesTo3MP_shouldLimitImagesTo3MP = 0;
    }

  }
  if (_PXShouldLimitImagesTo3MP_shouldLimitImagesTo3MP)
  {
    PLStoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_INFO, "Limiting images to 3MP", v5, 2u);
    }

  }
}

@end

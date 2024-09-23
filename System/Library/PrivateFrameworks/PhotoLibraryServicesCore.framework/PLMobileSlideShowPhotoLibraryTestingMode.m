@implementation PLMobileSlideShowPhotoLibraryTestingMode

void __PLMobileSlideShowPhotoLibraryTestingMode_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  if (PFOSVariantHasInternalUI())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode = objc_msgSend(v3, "integerForKey:", CFSTR("PLMobileSlideShowPhotoLibraryTestingMode"));
    if (!PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v0 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "environment");
      v1 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("PLMobileSlideShowPhotoLibraryTestingMode"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode = objc_msgSend(v2, "integerValue");

    }
  }
}

@end

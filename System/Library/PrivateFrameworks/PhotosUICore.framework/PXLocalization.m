@implementation PXLocalization

+ (NSString)currentDeviceCanonicalModel
{
  void *v2;
  void *v3;
  const __CFString *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = CFSTR("iPhone");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone Simulator")) & 1) == 0)
  {
    v4 = CFSTR("iPad");
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPad")) & 1) == 0
      && (objc_msgSend(v3, "isEqualToString:", CFSTR("iPad Simulator")) & 1) == 0)
    {
      v4 = CFSTR("iPod touch");
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPod touch")) & 1) == 0)
      {
        PXAssertGetLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v7 = 138412290;
          v8 = v3;
          _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "unknown device model %@", (uint8_t *)&v7, 0xCu);
        }

        v4 = CFSTR("iPhone");
      }
    }
  }

  return &v4->isa;
}

+ (NSString)titleForEmptyPhotoLibrary
{
  return (NSString *)PXLocalizedStringFromTable(CFSTR("PXLibraryEmptyTitle"), CFSTR("PhotosUICore"));
}

+ (NSString)messageForEmptyPhotoLibrary
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = MGGetBoolAnswer();
  if ((PLIsCPLDataclassEnabled() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    +[PXLocalization currentDeviceCanonicalModel](PXLocalization, "currentDeviceCanonicalModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v5 = CFSTR("EMPTY_ALBUM_LIST_MESSAGE_%@");
    else
      v5 = CFSTR("EMPTY_ALBUM_LIST_NO_CAMERA_MESSAGE_%@");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v6, CFSTR("PhotosUICore"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

+ (NSString)openCameraButtonTitleForEmptyPhotoLibrary
{
  void *v2;

  if (MGGetBoolAnswer())
  {
    PXLocalizedStringFromTable(CFSTR("EMPTY_PHOTO_LIBRARY_OPEN_CAMERA"), CFSTR("PhotosUICore"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

@end

@implementation PLNavigationControllerInterfacePhotoLibrary

void __PLNavigationControllerInterfacePhotoLibrary_block_invoke(uint64_t a1)
{
  NSObject *Log;
  uint64_t v2;
  uint8_t buf[4];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  PLNavigationControllerInterfacePhotoLibrary_sPhotoLibraryURL = *(_QWORD *)(a1 + 32);
  PLNavigationControllerInterfacePhotoLibrary_sPhotoLibrary = objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F8]), "initWithPhotoLibraryURL:", *(_QWORD *)(a1 + 32));
  v2 = 0;
  if ((objc_msgSend((id)PLNavigationControllerInterfacePhotoLibrary_sPhotoLibrary, "openAndWaitWithUpgrade:error:", 0, &v2) & 1) == 0)
  {
    Log = PLPhotoPickerGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v4 = v2;
      _os_log_error_impl(&dword_1B9897000, Log, OS_LOG_TYPE_ERROR, "PLNavigationControllerInterface unable to open system photo library: %@", buf, 0xCu);
    }

  }
}

@end

@implementation _SBScreenshotPersistenceCoordinator

- (void)saveScreenshot:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBScreenshotPersistenceCoordinator.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  }
  -[_SBScreenshotPersistenceCoordinator _incrementWriteCount](self, "_incrementWriteCount");
  v8 = __PhotoLibrarySaveImageFunction_saveImageFunction;
  if (!__PhotoLibrarySaveImageFunction_saveImageFunction)
  {
    v9 = (void *)__PhotoLibraryHandle_photoLibraryHandle;
    if (!__PhotoLibraryHandle_photoLibraryHandle)
    {
      MEMORY[0x1D17E4668]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/PhotoLibrary.framework/PhotoLibrary"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_retainAutorelease(v11);
      __PhotoLibraryHandle_photoLibraryHandle = (uint64_t)dlopen((const char *)objc_msgSend(v12, "fileSystemRepresentation"), 1);

      v9 = (void *)__PhotoLibraryHandle_photoLibraryHandle;
      if (!__PhotoLibraryHandle_photoLibraryHandle)
      {
        ((void (*)(id, const __CFString *, const __CFString *, _SBScreenshotPersistenceCoordinator *, char *, _QWORD))__PhotoLibrarySaveImageFunction_saveImageFunction)(v14, CFSTR("public.png"), CFSTR("PNG"), self, sel__finishedWritingScreenshot_didFinishSavingWithError_context_, 0);
        goto LABEL_8;
      }
    }
    v8 = dlsym(v9, "PLSaveImageToCameraRollWithTypeAndExtension");
    __PhotoLibrarySaveImageFunction_saveImageFunction = v8;
  }
  ((void (*)(id, const __CFString *, const __CFString *, _SBScreenshotPersistenceCoordinator *, char *, _QWORD))v8)(v14, CFSTR("public.png"), CFSTR("PNG"), self, sel__finishedWritingScreenshot_didFinishSavingWithError_context_, 0);
LABEL_8:

}

- (BOOL)_isWritingSnapshot
{
  _SBScreenshotPersistenceCoordinator *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_screenshotWriteCount != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)_incrementWriteCount
{
  _SBScreenshotPersistenceCoordinator *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_screenshotWriteCount;
  objc_sync_exit(obj);

}

- (void)_decrementWriteCount
{
  unint64_t screenshotWriteCount;
  _SBScreenshotPersistenceCoordinator *obj;

  obj = self;
  objc_sync_enter(obj);
  screenshotWriteCount = obj->_screenshotWriteCount;
  if (screenshotWriteCount)
    obj->_screenshotWriteCount = screenshotWriteCount - 1;
  objc_sync_exit(obj);

}

@end

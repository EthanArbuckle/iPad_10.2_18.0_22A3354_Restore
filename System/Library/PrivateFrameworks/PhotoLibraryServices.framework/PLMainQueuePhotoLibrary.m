@implementation PLMainQueuePhotoLibrary

- (PLMainQueuePhotoLibrary)initWithName:(const char *)a3 libraryBundle:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  PLMainQueuePhotoLibrary *v11;
  const char *v12;
  NSObject *v13;
  void *v15;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMainQueuePhotoLibrary.m"), 30, CFSTR("Must not be used in assetsd"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PLMainQueuePhotoLibrary;
  v11 = -[PLPhotoLibrary initWithName:libraryBundle:options:](&v16, sel_initWithName_libraryBundle_options_, a3, v9, v10);
  if (v11)
  {
    v12 = (const char *)*MEMORY[0x1E0D74888];
    dispatch_get_global_queue(25, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch(v12, &v11->_splChangedToken, v13, &__block_literal_global_22911);

  }
  return v11;
}

+ (id)systemMainQueuePhotoLibrary
{
  id v2;
  void *v3;
  PLPhotoLibraryOptions *v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  objc_sync_enter(v2);
  if (!sharedInstance)
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(PLPhotoLibraryOptions);
    -[PLPhotoLibraryOptions setAutomaticallyMergesContext:](v4, "setAutomaticallyMergesContext:", 1);
    -[PLPhotoLibraryOptions setAutomaticallyPinToFirstFetch:](v4, "setAutomaticallyPinToFirstFetch:", 0);
    v14 = 0;
    v5 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLMainQueuePhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "+[PLMainQueuePhotoLibrary systemMainQueuePhotoLibrary]", v3, v4, &v14);
    v6 = v14;
    v7 = (void *)sharedInstance;
    sharedInstance = (uint64_t)v5;

    if (sharedInstance)
    {
      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v3;
        v9 = "successfully loaded photo library systemMainQueuePhotoLibrary with url %@";
        v10 = v8;
        v11 = OS_LOG_TYPE_DEFAULT;
        v12 = 12;
LABEL_7:
        _os_log_impl(&dword_199541000, v10, v11, v9, buf, v12);
      }
    }
    else
    {
      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v3;
        v17 = 2112;
        v18 = v6;
        v9 = "failed to load photo library systemMainQueuePhotoLibrary with url %@, %@";
        v10 = v8;
        v11 = OS_LOG_TYPE_ERROR;
        v12 = 22;
        goto LABEL_7;
      }
    }

  }
  objc_sync_exit(v2);

  return (id)sharedInstance;
}

- (void)dealloc
{
  int splChangedToken;
  objc_super v4;

  splChangedToken = self->_splChangedToken;
  if (splChangedToken)
    notify_cancel(splChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)PLMainQueuePhotoLibrary;
  -[PLPhotoLibrary dealloc](&v4, sel_dealloc);
}

uint64_t __62__PLMainQueuePhotoLibrary_initWithName_libraryBundle_options___block_invoke()
{
  return +[PLMainQueuePhotoLibrary _resetSharedInstance](PLMainQueuePhotoLibrary, "_resetSharedInstance");
}

+ (void)_resetSharedInstance
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)sharedInstance;
  sharedInstance = 0;

  objc_sync_exit(obj);
}

@end

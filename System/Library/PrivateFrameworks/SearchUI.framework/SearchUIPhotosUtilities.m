@implementation SearchUIPhotosUtilities

+ (id)sharedPhotoLibraryIsSyndicated:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t *v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[16];

  v3 = a3;
  if (sharedPhotoLibraryIsSyndicated__enableMultiLibraryModeOnceToken != -1)
    dispatch_once(&sharedPhotoLibraryIsSyndicated__enableMultiLibraryModeOnceToken, &__block_literal_global_21);
  SearchUIGeneralLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAD39000, v4, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: attempting to grab a lock for opening a photo library", buf, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&sPhotoLibraryLock);
  SearchUIGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAD39000, v5, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: opening photo library", buf, 2u);
  }

  v6 = &systemPhotoLibrary;
  if (v3)
    v7 = &syndicatedPhotoLibrary;
  else
    v7 = &systemPhotoLibrary;
  v8 = (id)*v7;
  if (!v8)
  {
    if (v3)
      v9 = 3;
    else
      v9 = 1;
    v16 = 0;
    if (v3)
      v6 = &syndicatedPhotoLibrary;
    objc_msgSend(MEMORY[0x1E0CD16F8], "openPhotoLibraryWithWellKnownIdentifier:error:", v9, &v16);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    objc_storeStrong((id *)v6, v8);
    if (v10)
    {
      SearchUIGeneralLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[SearchUIPhotosUtilities sharedPhotoLibraryIsSyndicated:].cold.2((uint64_t)v10, v3, v11);

    }
    if (!v8)
    {
      SearchUIGeneralLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[SearchUIPhotosUtilities sharedPhotoLibraryIsSyndicated:].cold.1(v12);

    }
  }
  SearchUIGeneralLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAD39000, v13, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: returning lock", buf, 2u);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sPhotoLibraryLock);
  SearchUIGeneralLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAD39000, v14, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: lock returned", buf, 2u);
  }

  return v8;
}

uint64_t __58__SearchUIPhotosUtilities_sharedPhotoLibraryIsSyndicated___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CD16F8], "enableMultiLibraryMode");
}

+ (void)shutdownPhotoLibraries
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  SearchUIGeneralLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAD39000, v2, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: attempting to grab a lock for clearing a photo library", buf, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&sPhotoLibraryLock);
  SearchUIGeneralLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1DAD39000, v3, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: clearing photo library", v16, 2u);
  }

  if (systemPhotoLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "unsafeShutdownLibraryWithPhotoLibraryURL:", v4);
      v5 = (void *)systemPhotoLibrary;
      systemPhotoLibrary = 0;

      SearchUIGeneralLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1DAD39000, v6, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: cleared systemPhotoLibrary", v15, 2u);
      }

    }
  }
  if (syndicatedPhotoLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "wellKnownPhotoLibraryURLForIdentifier:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "unsafeShutdownLibraryWithPhotoLibraryURL:", v7);
      v8 = (void *)syndicatedPhotoLibrary;
      syndicatedPhotoLibrary = 0;

      SearchUIGeneralLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1DAD39000, v9, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: cleared syndicatedPhotoLibrary", v14, 2u);
      }

    }
  }
  SearchUIGeneralLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1DAD39000, v10, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: returning lock", v13, 2u);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sPhotoLibraryLock);
  SearchUIGeneralLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1DAD39000, v11, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: lock returned", v12, 2u);
  }

}

+ (id)fetchResultForPhotoIdentifiers:(id)a3 isSyndicated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "sharedPhotoLibraryIsSyndicated:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "fetchOptionsForLibrary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithSyndicationIdentifiers:options:includeRejected:", v6, v8, 1);
    else
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      SearchUIGeneralLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412802;
        v14 = v6;
        v15 = 2112;
        v16 = v8;
        v17 = 2112;
        v18 = v12;
        _os_log_error_impl(&dword_1DAD39000, v10, OS_LOG_TYPE_ERROR, "SearchUIPhotoUtilities: fetchResult failed for photoIdentifier: %@, fetchOptions %@, isSyndicated %@", (uint8_t *)&v13, 0x20u);

      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)fetchResultForPersonIdentifiers:(id)a3 isSyndicated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  +[SearchUIPhotosUtilities sharedPhotoLibraryIsSyndicated:](SearchUIPhotosUtilities, "sharedPhotoLibraryIsSyndicated:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIPhotosUtilities fetchOptionsForLibrary:](SearchUIPhotosUtilities, "fetchOptionsForLibrary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fetchOptionsForLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CD1978];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addFetchPropertySets:", v5);

  objc_msgSend(v4, "setIncludeGuestAssets:", 1);
  v6 = objc_msgSend(v3, "wellKnownPhotoLibraryIdentifier");

  if (v6 == 1)
    objc_msgSend(v4, "setIncludeAssetSourceTypes:", 7);
  return v4;
}

+ (void)sharedPhotoLibraryIsSyndicated:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "SearchUIPhotoUtilities: missing photo library after opening", v1, 2u);
}

+ (void)sharedPhotoLibraryIsSyndicated:(NSObject *)a3 .cold.2(uint64_t a1, char a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2 & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DAD39000, a3, OS_LOG_TYPE_ERROR, "SearchUIPhotoUtilities: Error opening photo library: %@, %@", (uint8_t *)&v6, 0x16u);

}

@end

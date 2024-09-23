@implementation _ICQPhotosInfo

+ (id)_photosShutdownQueue
{
  if (_photosShutdownQueue_onceToken != -1)
    dispatch_once(&_photosShutdownQueue_onceToken, &__block_literal_global_11);
  return (id)_photosShutdownQueue_photosShutdownQueue;
}

+ (id)mockCount:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.cloud.quota"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

+ (void)getInfoWithCompletion:(id)a3
{
  void (**v3)(id, _ICQPhotosInfo *, _QWORD);
  uint64_t v4;
  uint64_t v5;
  _ICQPhotosInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void (**v13)(id, _ICQPhotosInfo *, _QWORD);
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _ICQPhotosInfo *, _QWORD))a3;
  +[_ICQPhotosInfo mockCount:](_ICQPhotosInfo, "mockCount:", CFSTR("_ICQMockPhotoCount"));
  v4 = objc_claimAutoreleasedReturnValue();
  +[_ICQPhotosInfo mockCount:](_ICQPhotosInfo, "mockCount:", CFSTR("_ICQMockVideoCount"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 | v5)
  {
    v6 = objc_alloc_init(_ICQPhotosInfo);
    -[_ICQPhotosInfo setPhotoCount:](v6, "setPhotoCount:", objc_msgSend((id)v4, "longLongValue"));
    -[_ICQPhotosInfo setVideoCount:](v6, "setVideoCount:", objc_msgSend((id)v5, "longLongValue"));
    v3[2](v3, v6, 0);

  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BB6D8]();
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0D719A8], "newPhotoLibraryWithName:loadedFromURL:options:error:", "+[_ICQPhotosInfo getInfoWithCompletion:]", v8, 0, &v14);
    v10 = v14;
    if (v10)
    {
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v10;
        _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "Error loading PLPhotoLibrary: (%@)", buf, 0xCu);
      }

      ((void (**)(id, _ICQPhotosInfo *, id))v3)[2](v3, 0, v10);
    }
    else if (v9)
    {
      v13 = v3;
      PLRequestCloudPhotoLibraryTransferProgressForLibrary();

    }
    else
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "System Photo Library is nil, avoiding calling PLRequest on a nil PLPhotoLibrary", buf, 2u);
      }

      v3[2](v3, 0, 0);
    }

    objc_autoreleasePoolPop(v7);
  }

}

+ (BOOL)hasPhotoBulkCreation
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  NSObject *v25;
  NSObject *v26;
  BOOL v27;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "Checking for photo bulk creation", buf, 2u);
  }

  v4 = (void *)MEMORY[0x1D17BB6D8]();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -172800.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CD16F8]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithPhotoLibraryURL:", v7);

  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate >= %@"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v12);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    +[_ICQPhotosInfo hasPhotoBulkCreation].cold.1(v13, v14);

  if ((unint64_t)objc_msgSend(v13, "count") < 0x1E)
  {
    v27 = 0;
  }
  else
  {
    v29 = v4;
    v15 = a1;
    v16 = 29;
    while (1)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v16 - 29);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "creationDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSince1970");
      v21 = v20;
      objc_msgSend(v18, "creationDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSince1970");
      v24 = v21 - v23;

      _ICQGetLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v24 <= 86400.0)
        break;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v17;
        v32 = 2112;
        v33 = v18;
        _os_log_debug_impl(&dword_1CDEBD000, v26, OS_LOG_TYPE_DEBUG, "No bulk creation found for assets %@ and %@", buf, 0x16u);
      }

      ++v16;
      if (objc_msgSend(v13, "count") <= v16)
      {
        v27 = 0;
        a1 = v15;
        goto LABEL_16;
      }
    }
    a1 = v15;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v26, OS_LOG_TYPE_DEFAULT, "Found bulk creation!", buf, 2u);
    }

    v27 = 1;
LABEL_16:
    v4 = v29;
  }
  objc_msgSend(a1, "_shutDownPhotoLibrary");

  objc_autoreleasePoolPop(v4);
  return v27;
}

+ (void)_shutDownPhotoLibrary
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ind"));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)os_transaction_create();
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Shutting down photos library.", buf, 2u);
    }

    objc_msgSend(a1, "_photosShutdownQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39___ICQPhotosInfo__shutDownPhotoLibrary__block_invoke;
    v12[3] = &unk_1E8B38C50;
    v13 = v6;
    v14 = v7;
    v10 = v7;
    v11 = v6;
    dispatch_async(v9, v12);

  }
  else
  {
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "Process is not ind daemon, not shutting down another app's Photo Library", buf, 2u);
    }
  }

}

- (unint64_t)photoCount
{
  return self->_photoCount;
}

- (void)setPhotoCount:(unint64_t)a3
{
  self->_photoCount = a3;
}

- (unint64_t)videoCount
{
  return self->_videoCount;
}

- (void)setVideoCount:(unint64_t)a3
{
  self->_videoCount = a3;
}

+ (void)hasPhotoBulkCreation
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_DEBUG, "Checking for photo bulk creation with %lu assets", (uint8_t *)&v3, 0xCu);
}

@end

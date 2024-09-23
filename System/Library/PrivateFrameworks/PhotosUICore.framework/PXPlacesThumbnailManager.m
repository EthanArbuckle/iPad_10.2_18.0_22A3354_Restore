@implementation PXPlacesThumbnailManager

- (PXPlacesThumbnailManager)init
{
  PXPlacesThumbnailManager *v2;
  uint64_t v3;
  PXPlacesSearchProvider *placesProvider;
  NSCache *v5;
  NSCache *cache;
  dispatch_queue_t v7;
  OS_dispatch_queue *metadataQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXPlacesThumbnailManager;
  v2 = -[PXPlacesThumbnailManager init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    placesProvider = v2->_placesProvider;
    v2->_placesProvider = (PXPlacesSearchProvider *)v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v2->_cache;
    v2->_cache = v5;

    -[PXPlacesThumbnailManager _createThumbnailDirectoryIfNeeded](v2, "_createThumbnailDirectoryIfNeeded");
    v7 = dispatch_queue_create("PXPlacesThumbnailManager metadata queue", 0);
    metadataQueue = v2->_metadataQueue;
    v2->_metadataQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (NSMutableDictionary)metadataPlist
{
  PXPlacesThumbnailManager *v2;
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *metadataPlist;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_metadataPlist)
  {
    +[PXPlacesThumbnailManager _filePathForMetadataPlist](PXPlacesThumbnailManager, "_filePathForMetadataPlist");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    metadataPlist = v2->_metadataPlist;
    v2->_metadataPlist = v6;

  }
  objc_sync_exit(v2);

  return v2->_metadataPlist;
}

- (void)fetchPlacesThumbnailForPlaceName:(id)a3 placeIsHome:(BOOL)a4 traitCollection:(id)a5 withSize:(CGSize)a6 completion:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  double v28;
  double v29;
  BOOL v30;

  height = a6.height;
  width = a6.width;
  v13 = a3;
  v14 = a5;
  v15 = a7;
  v16 = objc_msgSend(v14, "userInterfaceStyle");
  objc_msgSend(v14, "displayScale");
  -[PXPlacesThumbnailManager _hashStringForKey:size:interfaceStyle:displayScale:](self, "_hashStringForKey:size:interfaceStyle:displayScale:", v13, v16, width, height, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __109__PXPlacesThumbnailManager_fetchPlacesThumbnailForPlaceName_placeIsHome_traitCollection_withSize_completion___block_invoke;
  v23[3] = &unk_1E511A958;
  v26 = v18;
  v27 = v15;
  v23[4] = self;
  v24 = v13;
  v28 = width;
  v29 = height;
  v25 = v14;
  v30 = a4;
  v19 = v18;
  v20 = v14;
  v21 = v13;
  v22 = v15;
  -[PXPlacesThumbnailManager _fetchDiskOrMemoryPlacesThumbnailForHashString:completion:](self, "_fetchDiskOrMemoryPlacesThumbnailForHashString:completion:", v19, v23);

}

- (void)fetchPlacesThumbnailForBoundingRegion:(id *)a3 placeIsHome:(BOOL)a4 traitCollection:(id)a5 withSize:(CGSize)a6 completion:(id)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  char v14;
  double v15;
  double v16;
  double height;
  double width;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  char v40;
  uint8_t buf[16];

  v12 = v10;
  v13 = v9;
  v14 = (char)a3;
  v15 = v8;
  v16 = v7;
  height = a6.height;
  width = a6.width;
  v20 = (id)a4;
  v21 = a5;
  if (height < -180.0
    || height > 180.0
    || width < -90.0
    || width > 90.0
    || v16 < 0.0
    || v16 > 180.0
    || v15 < 0.0
    || v15 > 360.0)
  {
    PXAssertGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "Invalid bounding region", buf, 2u);
    }

  }
  v23 = (void *)objc_opt_class();
  v24 = objc_msgSend(v20, "userInterfaceStyle");
  objc_msgSend(v20, "displayScale");
  objc_msgSend(v23, "hashStringForBoundingRegion:size:interfaceStyle:displayScale:", v24, width, height, v16, v15, v13, v12, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __114__PXPlacesThumbnailManager_fetchPlacesThumbnailForBoundingRegion_placeIsHome_traitCollection_withSize_completion___block_invoke;
  v30[3] = &unk_1E511A9A8;
  v34 = width;
  v35 = height;
  v36 = v16;
  v37 = v15;
  v38 = v13;
  v39 = v12;
  v30[4] = self;
  v31 = v20;
  v32 = v26;
  v33 = v21;
  v40 = v14;
  v27 = v26;
  v28 = v20;
  v29 = v21;
  -[PXPlacesThumbnailManager _fetchDiskOrMemoryPlacesThumbnailForHashString:completion:](self, "_fetchDiskOrMemoryPlacesThumbnailForHashString:completion:", v27, v30);

}

- (void)cachePlacesThumbnailForBoundingRegion:(id *)a3 size:(CGSize)a4 snapshot:(id)a5 interfaceStyle:(int64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double height;
  double width;
  $FF1229205817863B52D17A627F035FCE *v18;
  NSObject *v19;
  void *v20;
  uint8_t v21[16];

  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  height = a4.height;
  width = a4.width;
  v18 = a3;
  if (height < -180.0
    || height > 180.0
    || width < -90.0
    || width > 90.0
    || v14 < 0.0
    || v14 > 180.0
    || v13 < 0.0
    || v13 > 360.0)
  {
    PXAssertGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "Invalid bounding region", v21, 2u);
    }

  }
  objc_msgSend((id)objc_opt_class(), "_hashStringForBoundingRegion:size:interfaceStyle:", a5, width, height, v14, v13, v12, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesThumbnailManager _setInMemoryAndPersistToDiskThumbnail:forHashString:](self, "_setInMemoryAndPersistToDiskThumbnail:forHashString:", v18, v20);

}

- (id)fetchPlacesThumbnailForBoundingRegion:(id *)a3 size:(CGSize)a4 interfaceStyle:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double height;
  double width;
  NSObject *v18;
  void *v19;
  id v20;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  height = a4.height;
  width = a4.width;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3, a5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesThumbnailManager.m"), 130, CFSTR("This should not be called on main"));

  }
  if (height < -180.0
    || height > 180.0
    || width < -90.0
    || width > 90.0
    || v13 < 0.0
    || v13 > 180.0
    || v12 < 0.0
    || v12 > 360.0)
  {
    PXAssertGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "Invalid bounding region", buf, 2u);
    }

  }
  objc_msgSend((id)objc_opt_class(), "_hashStringForBoundingRegion:size:interfaceStyle:", a3, width, height, v13, v12, v11, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v25 = buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__27587;
  v28 = __Block_byref_object_dispose__27588;
  v29 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __86__PXPlacesThumbnailManager_fetchPlacesThumbnailForBoundingRegion_size_interfaceStyle___block_invoke;
  v23[3] = &unk_1E511A9D0;
  v23[4] = buf;
  -[PXPlacesThumbnailManager _fetchDiskOrMemoryPlacesThumbnailForHashString:synchronous:completion:](self, "_fetchDiskOrMemoryPlacesThumbnailForHashString:synchronous:completion:", v19, 1, v23);
  v20 = *((id *)v25 + 5);
  _Block_object_dispose(buf, 8);

  return v20;
}

- (id)_processFetchedSnapshot:(id)a3 withHashString:(id)a4 placeIsHome:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    if (v5)
    {
      -[PXPlacesThumbnailManager _imageForHomeZeroKeywordWithMapImage:](self, "_imageForHomeZeroKeywordWithMapImage:", v8);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v10;
    }
    -[PXPlacesThumbnailManager _setInMemoryAndPersistToDiskThumbnail:forHashString:](self, "_setInMemoryAndPersistToDiskThumbnail:forHashString:", v8, v9);
  }

  return v8;
}

- (void)_fetchDiskOrMemoryPlacesThumbnailForHashString:(id)a3 completion:(id)a4
{
  -[PXPlacesThumbnailManager _fetchDiskOrMemoryPlacesThumbnailForHashString:synchronous:completion:](self, "_fetchDiskOrMemoryPlacesThumbnailForHashString:synchronous:completion:", a3, 0, a4);
}

- (void)_fetchDiskOrMemoryPlacesThumbnailForHashString:(id)a3 synchronous:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  _QWORD aBlock[4];
  id v19;
  PXPlacesThumbnailManager *v20;
  void (**v21)(_QWORD);
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  -[PXPlacesThumbnailManager cache](self, "cache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__27587;
  v27 = __Block_byref_object_dispose__27588;
  objc_msgSend(v11, "objectForKey:", v8);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v24[5])
  {
    if (v9)
      v9[2](v9);
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__PXPlacesThumbnailManager__fetchDiskOrMemoryPlacesThumbnailForHashString_synchronous_completion___block_invoke;
    aBlock[3] = &unk_1E51396A0;
    v22 = &v23;
    v19 = v8;
    v20 = self;
    v21 = v9;
    v13 = _Block_copy(aBlock);
    v14 = v13;
    if (v6)
    {
      (*((void (**)(void *))v13 + 2))(v13);
    }
    else
    {
      dispatch_get_global_queue(25, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = v12;
      block[1] = 3221225472;
      block[2] = __98__PXPlacesThumbnailManager__fetchDiskOrMemoryPlacesThumbnailForHashString_synchronous_completion___block_invoke_2;
      block[3] = &unk_1E5148A40;
      v17 = v14;
      dispatch_async(v15, block);

    }
  }
  _Block_object_dispose(&v23, 8);

}

- (void)_setInMemoryThumbnail:(id)a3 forHashString:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesThumbnailManager cache](self, "cache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_pixelSize");
  PXSizeGetArea();
  objc_msgSend(v10, "setObject:forKey:cost:", v9, v7, (unint64_t)v11);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPlacesThumbnailManager _setMetadataDate:forKey:](self, "_setMetadataDate:forKey:", v12, v7);
}

- (void)_setInMemoryAndPersistToDiskThumbnail:(id)a3 forHashString:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  -[PXPlacesThumbnailManager _setInMemoryThumbnail:forHashString:](self, "_setInMemoryThumbnail:forHashString:", v6, v7);
  objc_initWeak(&location, self);
  -[PXPlacesThumbnailManager metadataQueue](self, "metadataQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PXPlacesThumbnailManager__setInMemoryAndPersistToDiskThumbnail_forHashString___block_invoke;
  v11[3] = &unk_1E5147B18;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_createThumbnailDirectoryIfNeeded
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPlacesThumbnailManager _thumbnailFilePath](PXPlacesThumbnailManager, "_thumbnailFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v8);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Unable to create search home thumbnail directory with error: %@", buf, 0xCu);

    }
  }

}

- (id)_hashStringForKey:(id)a3 size:(CGSize)a4 interfaceStyle:(int64_t)a5 displayScale:(double)a6
{
  CGFloat height;
  CGFloat width;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGSize v17;

  height = a4.height;
  width = a4.width;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = a3;
  v17.width = width;
  v17.height = height;
  NSStringFromCGSize(v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@%ld%f"), v11, v12, a5, *(_QWORD *)&a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "hash"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_setMetadataDate:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[PXPlacesThumbnailManager metadataQueue](self, "metadataQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PXPlacesThumbnailManager__setMetadataDate_forKey___block_invoke;
  v11[3] = &unk_1E5147B18;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_writeMetadataPlistToDisk
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __objc2_class **v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t j;
  void *v28;
  id v29;
  void *v30;
  char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  const char *v54;
  _BYTE v55[128];
  _QWORD v56[4];

  v56[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXPlacesThumbnailManager metadataPlist](self, "metadataPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __53__PXPlacesThumbnailManager__writeMetadataPlistToDisk__block_invoke;
  v49[3] = &unk_1E511AA60;
  v37 = v3;
  v50 = v37;
  v6 = v4;
  v51 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v49);
  +[PXPlacesThumbnailManager _thumbnailFilePath](PXPlacesThumbnailManager, "_thumbnailFilePath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v7;
  objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v9, 4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v5;
  objc_msgSend(v5, "allKeys");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = v10;
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v46 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pathExtension");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("jpg"));

        if (v18)
        {
          objc_msgSend(v16, "stringByDeletingPathExtension");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v39, "containsObject:", v19) & 1) == 0)
            objc_msgSend(v38, "setObject:forKey:", v37, v19);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v13);
  }
  objc_msgSend(v36, "removeObjectsForKeys:", v6);
  objc_msgSend(v36, "addEntriesFromDictionary:", v38);
  v20 = off_1E50B4000;
  +[PXPlacesThumbnailManager _filePathForMetadataPlist](PXPlacesThumbnailManager, "_filePathForMetadataPlist");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v36, "writeToFile:atomically:") & 1) == 0)
  {
    PXAssertGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[PXPlacesThumbnailManager _writeMetadataPlistToDisk]";
      _os_log_error_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "Could not write to search thumbnail metadata file path, %s", buf, 0xCu);
    }

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v22 = v6;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v42;
    v26 = MEMORY[0x1E0C81028];
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v42 != v25)
          objc_enumerationMutation(v22);
        -[__objc2_class _filePathForHash:](v20[174], "_filePathForHash:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        objc_msgSend(v8, "removeItemAtPath:error:", v28, &v40);
        v29 = v40;
        if (v29)
        {
          v30 = v29;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v30, "localizedDescription");
            v31 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v54 = v31;
            _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEFAULT, "Could not delete thumbnail with error: %@", buf, 0xCu);

            v20 = off_1E50B4000;
          }

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    }
    while (v24);
  }

}

- (id)_imageForHomeZeroKeywordWithMapImage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  CGSize v20;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0DC3870];
    v4 = a3;
    objc_msgSend(v3, "px_imageNamed:", CFSTR("PXSearchZeroKeywordHomeIcon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v7 = v6;
    v9 = v8;
    PXRectGetCenter();
    objc_msgSend(v5, "size");
    PXRectWithCenterAndSize();
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v20.width = v7;
    v20.height = v9;
    UIGraphicsBeginImageContextWithOptions(v20, 1, 0.0);
    objc_msgSend(v4, "drawInRect:", 0.0, 0.0, v7, v9);

    objc_msgSend(v5, "drawInRect:", v11, v13, v15, v17);
    UIGraphicsGetImageFromCurrentImageContext();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void)setMetadataPlist:(id)a3
{
  objc_storeStrong((id *)&self->_metadataPlist, a3);
}

- (OS_dispatch_queue)metadataQueue
{
  return self->_metadataQueue;
}

- (void)setMetadataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metadataQueue, a3);
}

- (PXPlacesSearchProvider)placesProvider
{
  return self->_placesProvider;
}

- (void)setPlacesProvider:(id)a3
{
  objc_storeStrong((id *)&self->_placesProvider, a3);
}

- (NSTimer)diskTimer
{
  return self->_diskTimer;
}

- (void)setDiskTimer:(id)a3
{
  objc_storeStrong((id *)&self->_diskTimer, a3);
}

- (NSMutableDictionary)thumbnailsToWrite
{
  return self->_thumbnailsToWrite;
}

- (void)setThumbnailsToWrite:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailsToWrite, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailsToWrite, 0);
  objc_storeStrong((id *)&self->_diskTimer, 0);
  objc_storeStrong((id *)&self->_placesProvider, 0);
  objc_storeStrong((id *)&self->_metadataQueue, 0);
  objc_storeStrong((id *)&self->_metadataPlist, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

void __53__PXPlacesThumbnailManager__writeMetadataPlistToDisk__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", a3);
  if (v5 > 604800.0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __52__PXPlacesThumbnailManager__setMetadataDate_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "metadataPlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __80__PXPlacesThumbnailManager__setInMemoryAndPersistToDiskThumbnail_forHashString___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "thumbnailsToWrite");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(WeakRetained, "setThumbnailsToWrite:", v3);
  }
  objc_msgSend(v3, "setValue:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "diskTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E88];
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __80__PXPlacesThumbnailManager__setInMemoryAndPersistToDiskThumbnail_forHashString___block_invoke_2;
    v9 = &unk_1E511AA38;
    v10 = v3;
    v11 = WeakRetained;
    objc_msgSend(v5, "timerWithTimeInterval:repeats:block:", 0, &v6, 3.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setDiskTimer:", v4, v6, v7, v8, v9);
    objc_msgSend(v4, "fire");

  }
}

void __80__PXPlacesThumbnailManager__setInMemoryAndPersistToDiskThumbnail_forHashString___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_27583);
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 40), "_writeMetadataPlistToDisk");
  objc_msgSend(*(id *)(a1 + 40), "setDiskTimer:", 0);
  objc_msgSend(v4, "invalidate");

}

void __80__PXPlacesThumbnailManager__setInMemoryAndPersistToDiskThumbnail_forHashString___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImage *image;

  image = a3;
  +[PXPlacesThumbnailManager _filePathForHash:](PXPlacesThumbnailManager, "_filePathForHash:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    UIImageJPEGRepresentation(image, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithData:", v5);
    objc_msgSend(v6, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CBCB50]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageWriteEXIFJPEGToPath();

  }
}

void __98__PXPlacesThumbnailManager__fetchDiskOrMemoryPlacesThumbnailForHashString_synchronous_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  +[PXPlacesThumbnailManager _filePathForHash:](PXPlacesThumbnailManager, "_filePathForHash:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scale");
      objc_msgSend(v5, "imageWithData:scale:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "imageByPreparingForDisplay");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (v13)
        objc_msgSend(*(id *)(a1 + 40), "_setInMemoryThumbnail:forHashString:", v13, *(_QWORD *)(a1 + 32));

    }
    v2 = v15;
  }
  v14 = *(_QWORD *)(a1 + 48);
  if (v14)
  {
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v2);
    v2 = v15;
  }

}

uint64_t __98__PXPlacesThumbnailManager__fetchDiskOrMemoryPlacesThumbnailForHashString_synchronous_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__PXPlacesThumbnailManager_fetchPlacesThumbnailForBoundingRegion_size_interfaceStyle___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __114__PXPlacesThumbnailManager_fetchPlacesThumbnailForBoundingRegion_placeIsHome_traitCollection_withSize_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;

  v3 = a2;
  if (v3 && (v4 = *(_QWORD *)(a1 + 56)) != 0)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "placesProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __114__PXPlacesThumbnailManager_fetchPlacesThumbnailForBoundingRegion_placeIsHome_traitCollection_withSize_completion___block_invoke_2;
    v8[3] = &unk_1E511A980;
    v6 = *(_QWORD *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    v15 = *(_BYTE *)(a1 + 112);
    v7 = *(_OWORD *)(a1 + 80);
    v12 = *(_OWORD *)(a1 + 64);
    v13 = v7;
    v10 = *(id *)(a1 + 40);
    v14 = *(_OWORD *)(a1 + 96);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v5, "requestMapSnapshotOfRegion:size:traitCollectionForSnapshot:completion:", v6, v8, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));

  }
}

void __114__PXPlacesThumbnailManager_fetchPlacesThumbnailForBoundingRegion_placeIsHome_traitCollection_withSize_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_processFetchedSnapshot:withHashString:placeIsHome:", v5, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 112));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "_descriptionForBoundingRegion:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      PLSearchHomeItemTypeName();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGSize(*(CGSize *)(a1 + 96));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138413570;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 2080;
      v26 = "-[PXPlacesThumbnailManager fetchPlacesThumbnailForBoundingRegion:placeIsHome:traitCollection:withSize:comple"
            "tion:]_block_invoke_2";
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Map snapshot didn't exist. BoundingRegion: %@ TraitCollection: %@ Hash String: %@ Type: %@ Size: %@ Function: %s", (uint8_t *)&v15, 0x3Eu);

    }
    v7 = 0;
  }
  v14 = *(_QWORD *)(a1 + 56);
  if (v14)
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v7);

}

void __109__PXPlacesThumbnailManager_fetchPlacesThumbnailForPlaceName_placeIsHome_traitCollection_withSize_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  char v14;

  v3 = a2;
  if (v3 && (v4 = *(_QWORD *)(a1 + 64)) != 0)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "placesProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __109__PXPlacesThumbnailManager_fetchPlacesThumbnailForPlaceName_placeIsHome_traitCollection_withSize_completion___block_invoke_2;
    v8[3] = &unk_1E511A958;
    v6 = *(_QWORD *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    v14 = *(_BYTE *)(a1 + 88);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v13 = *(_OWORD *)(a1 + 72);
    v12 = *(id *)(a1 + 64);
    objc_msgSend(v5, "requestMapSnapshotForQuery:size:traitCollectionForSnapshot:completion:", v6, v7, v8, *(double *)(a1 + 72), *(double *)(a1 + 80));

  }
}

void __109__PXPlacesThumbnailManager_fetchPlacesThumbnailForPlaceName_placeIsHome_traitCollection_withSize_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_processFetchedSnapshot:withHashString:placeIsHome:", v3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 88));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 56);
      v9 = *(_QWORD *)(a1 + 40);
      PLSearchHomeItemTypeName();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGSize(*(CGSize *)(a1 + 72));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138413570;
      v14 = v8;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      v23 = 2080;
      v24 = "-[PXPlacesThumbnailManager fetchPlacesThumbnailForPlaceName:placeIsHome:traitCollection:withSize:completion:"
            "]_block_invoke_2";
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Map snapshot didn't exist. Key: %@ TraitCollection: %@ Hash String: %@ Type: %@ Size: %@ Function: %s", (uint8_t *)&v13, 0x3Eu);

    }
    v5 = 0;
  }
  v12 = *(_QWORD *)(a1 + 64);
  if (v12)
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v5);

}

+ (id)_thumbnailFilePath
{
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("com.apple.mobileslideshow/search/thumbnails"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_filePathForHash:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.jpg"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_thumbnailFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_filePathForMetadataPlist
{
  void *v2;
  void *v3;

  +[PXPlacesThumbnailManager _thumbnailFilePath](PXPlacesThumbnailManager, "_thumbnailFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("thumbnailMetadata.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hashStringForBoundingRegion:(id *)a3 size:(CGSize)a4 interfaceStyle:(int64_t)a5 displayScale:(double)a6
{
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CGSize v20;

  v9 = v8;
  v11 = v7;
  v12 = v6;
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_descriptionForBoundingRegion:", a3, a5, a4.width, a4.height, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20.width = v12;
  v20.height = v11;
  NSStringFromCGSize(v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@_%@_%ld_%f"), v14, v15, a3, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "hash"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_hashStringForBoundingRegion:(id *)a3 size:(CGSize)a4 interfaceStyle:(int64_t)a5
{
  double v5;
  double v6;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGSize v17;

  v8 = v6;
  v9 = v5;
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_descriptionForBoundingRegion:", a3, a5, a4.width, a4.height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17.width = v9;
  v17.height = v8;
  NSStringFromCGSize(v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_%@_%ld"), v11, v12, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "hash"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_descriptionForBoundingRegion:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f,%f,%f,%f"), v3, v4, v5, v6);
}

@end

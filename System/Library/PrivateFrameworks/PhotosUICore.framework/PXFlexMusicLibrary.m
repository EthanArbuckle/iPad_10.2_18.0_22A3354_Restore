@implementation PXFlexMusicLibrary

- (PXFlexMusicLibrary)init
{
  PXFlexMusicLibrary *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  FMSongLibrary *v9;
  FMSongLibrary *queue_library;
  FMSongLibrary *v11;
  NSCountedSet *v12;
  NSCountedSet *queue_downloadingAssetsRequestCount;
  void *v14;
  objc_super v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PXFlexMusicLibrary;
  v2 = -[PXFlexMusicLibrary init](&v16, sel_init);
  if (v2)
  {
    px_dispatch_queue_create_serial();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc(MEMORY[0x1E0D22280]);
    v6 = *MEMORY[0x1E0D22208];
    v17[0] = *MEMORY[0x1E0D22210];
    v17[1] = v6;
    v18[0] = CFSTR("Ph");
    v18[1] = CFSTR("com.apple.MobileAsset.VideoAppsMusicAssets3");
    v7 = *MEMORY[0x1E0D22200];
    v17[2] = *MEMORY[0x1E0D22218];
    v17[3] = v7;
    v18[2] = MEMORY[0x1E0C9AAB0];
    v18[3] = CFSTR("/System/Library/Photos/Resources/FlexAudio/");
    v17[4] = CFSTR("EnableFetchCache");
    v18[4] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (FMSongLibrary *)objc_msgSend(v5, "initWithOptions:", v8);

    queue_library = v2->_queue_library;
    v2->_queue_library = v9;
    v11 = v9;

    v12 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    queue_downloadingAssetsRequestCount = v2->_queue_downloadingAssetsRequestCount;
    v2->_queue_downloadingAssetsRequestCount = v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__handleDownloadProgressChangedNotification_, *MEMORY[0x1E0D221E8], 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__handleSongAssetsChangedNotification_, *MEMORY[0x1E0D221F0], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXFlexMusicLibrary;
  -[PXFlexMusicLibrary dealloc](&v4, sel_dealloc);
}

- (id)fetchAllAssets
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  uint8_t v13[16];
  uint8_t buf[16];

  PLAudioPlaybackGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXFlexMusicLibrary - fetchAllAssets", " enableTelemetry=YES ", buf, 2u);
    }
  }

  +[PXAudioSettings sharedInstance](PXAudioSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "flexSimulateAssetFetchFailure");

  if (v7)
    PXAudioAssetFetchResultWithArray(MEMORY[0x1E0C9AA60]);
  else
    -[PXFlexMusicLibrary _fetchAssetsWithOptions:](self, "_fetchAssetsWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLAudioPlaybackGetLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PXFlexMusicLibrary - fetchAllAssets", " enableTelemetry=YES ", v13, 2u);
    }
  }

  return v8;
}

- (id)fetchAssetsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  os_signpost_id_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, void *);
  void *v24;
  id v25;
  uint8_t buf[16];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLAudioPlaybackGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXFlexMusicLibrary - fetchAssetsWithIdentifiers", " enableTelemetry=YES ", buf, 2u);
    }
  }

  +[PXAudioSettings sharedInstance](PXAudioSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "flexSimulateAssetFetchFailure");

  if (v9)
  {
    PXAudioAssetFetchResultWithArray(MEMORY[0x1E0C9AA60]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D22258]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uid in %@"), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v11);

    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      v12 = (void *)MEMORY[0x1E0CB3928];
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __49__PXFlexMusicLibrary_fetchAssetsWithIdentifiers___block_invoke;
      v24 = &unk_1E513E828;
      v25 = v4;
      objc_msgSend(v12, "sortDescriptorWithKey:ascending:comparator:", CFSTR("uid"), 1, &v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSortDescriptors:", v14);

    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uid in %@"), v4, v21, v22, v23, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v15);

    -[PXFlexMusicLibrary _fetchAssetsWithOptions:](self, "_fetchAssetsWithOptions:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  PLAudioPlaybackGetLog();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_make_with_pointer(v17, self);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v19 = v18;
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v17, OS_SIGNPOST_INTERVAL_END, v19, "PXFlexMusicLibrary - fetchAssetsWithIdentifiers", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v16;
}

- (id)requestAssetsWithIdentifiers:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  PXFlexMusicLibrary *v21;
  id v22;
  id v23;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLAudioPlaybackGetLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PXFlexMusicLibrary - requestAssetsWithIdentifiers", " enableTelemetry=YES ", buf, 2u);
    }
  }

  queue = self->_queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__PXFlexMusicLibrary_requestAssetsWithIdentifiers_resultHandler___block_invoke;
  v19[3] = &unk_1E5148370;
  v20 = v6;
  v21 = self;
  v13 = v8;
  v22 = v13;
  v23 = v7;
  v14 = v7;
  v15 = v6;
  dispatch_async(queue, v19);
  v16 = v23;
  v17 = v13;

  return v17;
}

- (id)fetchLocalAssetForMood:(unint64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  os_signpost_id_t v22;
  void *v24;
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  PLAudioPlaybackGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXFlexMusicLibrary - fetchLocalAssetForMood", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v8 = 0;
  if ((uint64_t)a3 > 31)
  {
    if ((uint64_t)a3 > 255)
    {
      switch(a3)
      {
        case 0x100uLL:
          v8 = CFSTR("Party");
          break;
        case 0x200uLL:
          v8 = CFSTR("Action");
          break;
        case 0x3FFuLL:
LABEL_17:
          v8 = CFSTR("Neutral");
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x20uLL:
          v8 = CFSTR("Happy");
          break;
        case 0x40uLL:
          v8 = CFSTR("Uplifting");
          break;
        case 0x80uLL:
          v8 = CFSTR("Epic");
          break;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        goto LABEL_17;
      case 1uLL:
        v8 = CFSTR("Ethereal");
        break;
      case 2uLL:
        v8 = CFSTR("Sentimental");
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
        v8 = CFSTR("Gentle");
        break;
      case 8uLL:
        v8 = CFSTR("Chill");
        break;
      default:
        if (a3 == 16)
          goto LABEL_17;
        break;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *MEMORY[0x1E0D22228], v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLStoryGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) Looking for bestLocallyAvailableAudioAsset with mood tag: %@", buf, 0xCu);
  }

  v11 = objc_alloc_init(MEMORY[0x1E0D22258]);
  v12 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("canPlay == YES"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("tagIDs CONTAINS %@"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v16);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uid"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v18);

  -[PXFlexMusicLibrary _fetchAssetsWithOptions:](self, "_fetchAssetsWithOptions:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PLAudioPlaybackGetLog();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = os_signpost_id_make_with_pointer(v20, self);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v20, OS_SIGNPOST_INTERVAL_END, v22, "PXFlexMusicLibrary - fetchLocalAssetForMood", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v19;
}

- (id)fetchSortedAssetsGroupedByMood
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  NSObject *queue;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  id v10;
  uint8_t v12[16];
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  PLAudioPlaybackGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXFlexMusicLibrary - fetchSortedAssetsGroupedByMood", " enableTelemetry=YES ", buf, 2u);
    }
  }

  *(_QWORD *)buf = 0;
  v15 = buf;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__249909;
  v18 = __Block_byref_object_dispose__249910;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PXFlexMusicLibrary_fetchSortedAssetsGroupedByMood__block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(queue, block);
  PLAudioPlaybackGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v9, "PXFlexMusicLibrary - fetchSortedAssetsGroupedByMood", " enableTelemetry=YES ", v12, 2u);
    }
  }

  v10 = *((id *)v15 + 5);
  _Block_object_dispose(buf, 8);

  return v10;
}

- (id)cuesForAsset:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  NSObject *queue;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  id v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint8_t buf[16];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__249909;
  v23 = __Block_byref_object_dispose__249910;
  v24 = 0;
  PLAudioPlaybackGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXFlexMusicLibrary - cuesForAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PXFlexMusicLibrary_cuesForAsset___block_invoke;
  block[3] = &unk_1E513FD98;
  block[4] = self;
  v9 = v4;
  v16 = v9;
  v17 = &v19;
  dispatch_sync(queue, block);
  PLAudioPlaybackGetLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, self);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PXFlexMusicLibrary - cuesForAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (BOOL)hasLocalResourceForAsset:(id)a3 resourceType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  NSObject *queue;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint8_t v15;
  uint8_t v17[16];
  _QWORD block[5];
  id v19;
  uint8_t *v20;
  int64_t v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  PLAudioPlaybackGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PXFlexMusicLibrary - hasLocalResourceForAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x2020000000;
  queue = self->_queue;
  v25 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PXFlexMusicLibrary_hasLocalResourceForAsset_resourceType___block_invoke;
  block[3] = &unk_1E51402E0;
  block[4] = self;
  v11 = v6;
  v20 = buf;
  v21 = a4;
  v19 = v11;
  dispatch_sync(queue, block);
  PLAudioPlaybackGetLog();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PXFlexMusicLibrary - hasLocalResourceForAsset", " enableTelemetry=YES ", v17, 2u);
    }
  }

  v15 = v23[24];
  _Block_object_dispose(buf, 8);

  return v15;
}

- (void)requestDownloadForAsset:(id)a3 resourceType:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PXFlexMusicLibrary_requestDownloadForAsset_resourceType___block_invoke;
  block[3] = &unk_1E5145560;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)cancelDownloadForAsset:(id)a3 resourceType:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PXFlexMusicLibrary_cancelDownloadForAsset_resourceType___block_invoke;
  block[3] = &unk_1E5145560;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (double)downloadProgressForAsset:(id)a3 resourceType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  NSObject *queue;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  double v15;
  uint8_t v17[16];
  _QWORD block[5];
  id v19;
  uint8_t *v20;
  int64_t v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  PLAudioPlaybackGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PXFlexMusicLibrary - downloadProgressForAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x2020000000;
  queue = self->_queue;
  v25 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PXFlexMusicLibrary_downloadProgressForAsset_resourceType___block_invoke;
  block[3] = &unk_1E51402E0;
  block[4] = self;
  v11 = v6;
  v20 = buf;
  v21 = a4;
  v19 = v11;
  dispatch_sync(queue, block);
  PLAudioPlaybackGetLog();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PXFlexMusicLibrary - downloadProgressForAsset", " enableTelemetry=YES ", v17, 2u);
    }
  }

  v15 = *((double *)v23 + 3);
  _Block_object_dispose(buf, 8);

  return v15;
}

- (id)localURLForAsset:(id)a3 resourceType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  NSObject *queue;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  id v15;
  uint8_t v17[16];
  _QWORD block[5];
  id v19;
  uint8_t *v20;
  int64_t v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  PLAudioPlaybackGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PXFlexMusicLibrary - localURLForAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__249909;
  v26 = __Block_byref_object_dispose__249910;
  queue = self->_queue;
  v27 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PXFlexMusicLibrary_localURLForAsset_resourceType___block_invoke;
  block[3] = &unk_1E51402E0;
  block[4] = self;
  v11 = v6;
  v20 = buf;
  v21 = a4;
  v19 = v11;
  dispatch_sync(queue, block);
  PLAudioPlaybackGetLog();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PXFlexMusicLibrary - localURLForAsset", " enableTelemetry=YES ", v17, 2u);
    }
  }

  v15 = *((id *)v23 + 5);
  _Block_object_dispose(buf, 8);

  return v15;
}

- (id)playableAssetForAsset:(id)a3 preferredDuration:(id *)a4 audioMix:(id *)a5 peakValue:(double *)a6 loudness:(double *)a7
{
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  NSObject *queue;
  id v16;
  NSObject *v17;
  os_signpost_id_t v18;
  os_signpost_id_t v19;
  id v20;
  uint8_t v23[8];
  _QWORD block[5];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint8_t *v28;
  uint64_t *v29;
  __int128 v30;
  int64_t var3;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[8];
  uint8_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v11 = a3;
  PLAudioPlaybackGetLog();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXFlexMusicLibrary - playableAssetForAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  *(_QWORD *)buf = 0;
  v47 = buf;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__249909;
  v50 = __Block_byref_object_dispose__249910;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__249909;
  v44 = __Block_byref_object_dispose__249910;
  v45 = 0;
  v36 = 0;
  v37 = (double *)&v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = (double *)&v32;
  v34 = 0x2020000000;
  queue = self->_queue;
  v35 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PXFlexMusicLibrary_playableAssetForAsset_preferredDuration_audioMix_peakValue_loudness___block_invoke;
  block[3] = &unk_1E513E850;
  block[4] = self;
  v16 = v11;
  v30 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v25 = v16;
  v26 = &v36;
  v27 = &v32;
  v28 = buf;
  v29 = &v40;
  dispatch_sync(queue, block);
  if (a5)
    *a5 = objc_retainAutorelease((id)v41[5]);
  if (a6)
    *a6 = v37[3];
  if (a7)
    *a7 = v33[3];
  PLAudioPlaybackGetLog();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_make_with_pointer(v17, self);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v19 = v18;
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v17, OS_SIGNPOST_INTERVAL_END, v19, "PXFlexMusicLibrary - playableAssetForAsset", " enableTelemetry=YES ", v23, 2u);
    }
  }

  v20 = *((id *)v47 + 5);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(buf, 8);
  return v20;
}

- (id)_queue_cueSourceFromRendition:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PXConcreteAudioCueSource *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  PXConcreteAudioCueSource *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v3 = *MEMORY[0x1E0D22240];
  v4 = a3;
  objc_msgSend(v4, "timedMetadataItemsWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timedMetadataItemsWithIdentifier:", *MEMORY[0x1E0D22238]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timedMetadataItemsWithIdentifier:", *MEMORY[0x1E0D22250]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timedMetadataItemsWithIdentifier:", *MEMORY[0x1E0D22248]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "count");
  v10 = [PXConcreteAudioCueSource alloc];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__PXFlexMusicLibrary__queue_cueSourceFromRendition___block_invoke;
  v17[3] = &unk_1E513E8A0;
  v18 = v5;
  v19 = v6;
  v20 = v7;
  v21 = v8;
  v11 = v8;
  v12 = v7;
  v13 = v6;
  v14 = v5;
  v15 = -[PXConcreteAudioCueSource initWithNumberOfCues:configuration:](v10, "initWithNumberOfCues:configuration:", v9, v17);

  return v15;
}

- (id)_fetchAssetsWithOptions:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__249909;
  v16 = __Block_byref_object_dispose__249910;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PXFlexMusicLibrary__fetchAssetsWithOptions___block_invoke;
  block[3] = &unk_1E513FD98;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_queue_fetchAssetsWithOptions:(id)a3
{
  id v4;
  FMSongLibrary *queue_library;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  queue_library = self->_queue_library;
  if (v4)
  {
    -[FMSongLibrary fetchSongsWithOptions:](self->_queue_library, "fetchSongsWithOptions:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D22258]);
    -[FMSongLibrary fetchSongsWithOptions:](queue_library, "fetchSongsWithOptions:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "sortDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  PXMap();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXAudioAssetFetchResultWithArray(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_queue_downloadableAssetForAsset:(id)a3 resourceType:(int64_t)a4
{
  id v6;
  FMSongLibrary *queue_library;
  void *v8;
  void *v9;
  id *v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  queue_library = self->_queue_library;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMSongLibrary fetchSongWithUID:](queue_library, "fetchSongWithUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (a4 == 2)
    {
      v10 = (id *)MEMORY[0x1E0D221F8];
    }
    else
    {
      if (a4 != 1)
      {
        v13 = 0;
        goto LABEL_11;
      }
      v10 = (id *)MEMORY[0x1E0D221E0];
    }
    v13 = *v10;
LABEL_11:
    objc_msgSend(v9, "assetWithID:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  PLAudioPlaybackGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v15 = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Unable to find resource for asset %@ because FlexMusic song cannot be fetched.", (uint8_t *)&v15, 0xCu);
  }

  v12 = 0;
LABEL_12:

  return v12;
}

- (void)_handleDownloadProgressChangedNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__PXFlexMusicLibrary__handleDownloadProgressChangedNotification___block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXFlexMusicLibrary performChanges:](self, "performChanges:", v3);
}

- (void)_handleSongAssetsChangedNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PXFlexMusicLibrary__handleSongAssetsChangedNotification___block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXFlexMusicLibrary performChanges:](self, "performChanges:", v3);
}

- (id)_queue_flexMusicAssetWithSong:(id)a3
{
  id v3;
  PXFlexMusicAsset *v4;
  id v5;
  PXFlexMusicAsset *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = [PXFlexMusicAsset alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PXFlexMusicLibrary__queue_flexMusicAssetWithSong___block_invoke;
  v8[3] = &unk_1E513E8F0;
  v9 = v3;
  v5 = v3;
  v6 = -[PXFlexMusicAsset initWithConfiguration:](v4, "initWithConfiguration:", v8);

  return v6;
}

- (id)_queue_renditionForSongID:(id)a3 preferredDuration:(id *)a4
{
  void *v5;
  void *v6;
  unsigned int var2;
  int64_t var3;
  void *v9;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t var0;
  int var1;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[FMSongLibrary fetchSongWithUID:](self->_queue_library, "fetchSongWithUID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  var0 = a4->var0;
  var2 = a4->var2;
  var1 = a4->var1;
  if ((var2 & 1) != 0)
  {
    var3 = a4->var3;
  }
  else
  {
    if (v5)
    {
      objc_msgSend(v5, "naturalDuration");
      var2 = HIDWORD(v12);
      var3 = v13;
    }
    else
    {
      var3 = 0;
      var2 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
    }
    var0 = v11;
    var1 = v12;
  }
  v11 = var0;
  v12 = __PAIR64__(var2, var1);
  v13 = var3;
  objc_msgSend(v6, "renditionForDuration:withOptions:", &v11, MEMORY[0x1E0C9AA70]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_downloadingAssetsRequestCount, 0);
  objc_storeStrong((id *)&self->_queue_library, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __52__PXFlexMusicLibrary__queue_flexMusicAssetWithSong___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "songName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  objc_msgSend(*(id *)(a1 + 32), "artistName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArtistName:", v5);

  objc_msgSend(v3, "artistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubtitle:", v6);

  objc_msgSend(*(id *)(a1 + 32), "uid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v7);

  DictionaryFromFMSongTags(*(void **)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  VisualTempoFromTagsDictionary(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Valence"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11
    || (v12 = (void *)v11,
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Arousal")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        !v13))
  {
    objc_msgSend(v10, "appendString:", CFSTR("(⚠️ Check VPN) "));
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Valence"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("--");
  objc_msgSend(v10, "appendFormat:", CFSTR("valence=%@"), v16);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Arousal"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("--");
  objc_msgSend(v10, "appendFormat:", CFSTR(",arousal=%@"), v19);

  if (v9)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%0.2f"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR(",visualTempo=%@"), v22);

  }
  else
  {
    objc_msgSend(v10, "appendFormat:", CFSTR(",visualTempo=%@"), CFSTR("--"));
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Genre"));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = CFSTR("Unknown");
  if (v23)
    v25 = (const __CFString *)v23;
  objc_msgSend(v10, "appendFormat:", CFSTR(",genre=%@"), v25);

  objc_msgSend(v3, "setAssetTagsDescription:", v10);
  v26 = v8;
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Arousal"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Valence"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v27 && v28)
  {
    objc_msgSend(v28, "doubleValue");
    objc_msgSend(v27, "doubleValue");
    PFStoryColorGradeCategoryFromValenceArousal();
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PHMemoryMoodFromTagsDictionary(v26);
    PFStoryColorGradeCategoryNamed();
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v30;

  objc_msgSend(v3, "setColorGradeCategory:", v31);
  v32 = v26;
  VisualTempoFromTagsDictionary(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_msgSend(MEMORY[0x1E0D752A0], "standardConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v35 = PFStoryRecipeSongPaceFromVisualTempo();
  }
  else
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("SongPace"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "isEqualToString:", CFSTR("Slow")) & 1) != 0)
    {
      v35 = 1;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("Medium")) & 1) != 0)
    {
      v35 = 2;
    }
    else if (objc_msgSend(v34, "isEqualToString:", CFSTR("Fast")))
    {
      v35 = 3;
    }
    else
    {
      v35 = 2;
    }
  }

  objc_msgSend(v3, "setPace:", v35);
  objc_msgSend(v3, "setFlags:", 0);
  v36 = *MEMORY[0x1E0CA2E18];
  v37 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  objc_msgSend(v3, "setTargetDuration:", &v36);

}

uint64_t __59__PXFlexMusicLibrary__handleSongAssetsChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2);
}

uint64_t __65__PXFlexMusicLibrary__handleDownloadProgressChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

id __52__PXFlexMusicLibrary__queue_fetchAssetsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a2;
  +[PXAudioSettings sharedInstance](PXAudioSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "flexReturnOnlyLocalSongs") & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v3, "assetWithID:", *MEMORY[0x1E0D221F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "localURLExists");

  if (v6)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "_queue_flexMusicAssetWithSong:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

void __46__PXFlexMusicLibrary__fetchAssetsWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAssetsWithOptions:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __52__PXFlexMusicLibrary__queue_cueSourceFromRendition___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[4];

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PXFlexMusicLibrary__queue_cueSourceFromRendition___block_invoke_2;
  v5[3] = &unk_1E513E878;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v15;
  v7 = *(id *)(a1 + 48);
  v10 = v14;
  v8 = *(id *)(a1 + 56);
  v11 = v13;
  v12 = a2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
}

double __52__PXFlexMusicLibrary__queue_cueSourceFromRendition___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  unint64_t *v6;
  void *v7;
  unint64_t *v8;
  void *v9;
  unint64_t *v10;
  double result;
  CMTime v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTime v17;

  if (a2)
  {
    objc_msgSend(a2, "timeRange");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
  }
  *(_OWORD *)&v17.value = v14;
  v17.epoch = v15;
  v12.epoch = v15;
  v13 = 1;
  v5 = (void *)a1[4];
  v6 = (unint64_t *)(*(_QWORD *)(a1[7] + 8) + 24);
  *(_OWORD *)&v12.value = v14;
  _PXTestBeatTimeMembership(&v12, v5, 2, v6, &v13);
  v7 = (void *)a1[5];
  v8 = (unint64_t *)(*(_QWORD *)(a1[8] + 8) + 24);
  v12 = v17;
  _PXTestBeatTimeMembership(&v12, v7, 4, v8, &v13);
  v9 = (void *)a1[6];
  v10 = (unint64_t *)(*(_QWORD *)(a1[9] + 8) + 24);
  v12 = v17;
  _PXTestBeatTimeMembership(&v12, v9, 3, v10, &v13);
  result = *(double *)&v17.value;
  *(CMTime *)(a1[10] + 32 * a3) = v17;
  *(_QWORD *)(a1[10] + 32 * a3 + 24) = v13;
  return result;
}

void __90__PXFlexMusicLibrary_playableAssetForAsset_preferredDuration_audioMix_peakValue_loudness___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;
  int v11;
  __int128 v12;
  uint64_t v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 96);
  objc_msgSend(v2, "_queue_renditionForSongID:preferredDuration:", v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  LODWORD(v12) = 0;
  objc_msgSend(v4, "_maxPeakAndLoudness:missingPeakValueCount:missingLoudnessCount:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, &v12, &v11);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v4, "avCompositionWithAudioMix:includeShortenedOutroFadeOut:", &obj, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __52__PXFlexMusicLibrary_localURLForAsset_resourceType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_downloadableAssetForAsset:resourceType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localURL");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __60__PXFlexMusicLibrary_downloadProgressForAsset_resourceType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_queue_downloadableAssetForAsset:resourceType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadProgress");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;

}

void __58__PXFlexMusicLibrary_cancelDownloadForAsset_resourceType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_queue_downloadableAssetForAsset:resourceType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeObject:", v2);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "countForObject:", v2))
    objc_msgSend(v2, "cancelDownload");

}

void __59__PXFlexMusicLibrary_requestDownloadForAsset_resourceType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_queue_downloadableAssetForAsset:resourceType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v6 = v2;
    v4 = objc_msgSend(v2, "localURLExists");
    v3 = v6;
    if (!v4 || (v5 = objc_msgSend(v6, "contentUpdateAvailable"), v3 = v6, v5))
    {
      objc_msgSend(v3, "requestDownload");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addObject:", v6);
      v3 = v6;
    }
  }

}

void __60__PXFlexMusicLibrary_hasLocalResourceForAsset_resourceType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_queue_downloadableAssetForAsset:resourceType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "localURLExists");

}

void __35__PXFlexMusicLibrary_cuesForAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchSongWithUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0uLL;
  v13 = 0;
  v5 = *(void **)(a1 + 40);
  if (!v5 || (objc_msgSend(v5, "targetDuration"), (BYTE12(v12) & 1) == 0))
  {
    if (v4)
    {
      objc_msgSend(v4, "naturalDuration");
    }
    else
    {
      v10 = 0uLL;
      v11 = 0;
    }
    v12 = v10;
    v13 = v11;
  }
  v10 = v12;
  v11 = v13;
  objc_msgSend(v4, "renditionForDuration:withOptions:", &v10, MEMORY[0x1E0C9AA70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_cueSourceFromRendition:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __52__PXFlexMusicLibrary_fetchSortedAssetsGroupedByMood__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D22258]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("hidden == NO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  v23 = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "fetchSongsWithOptions:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("songName"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v4;
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "keywords");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", CFSTR("_MSpecial"));

        v16 = CFSTR("Special");
        if ((v15 & 1) == 0)
        {
          DictionaryFromFMSongTags(v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          PHMemoryMoodFromTagsDictionary(v17);
          PHStringForMemoryMood();
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (!v16)
            continue;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v19, v16);

        }
        objc_msgSend(*(id *)(a1 + 32), "_queue_flexMusicAssetWithSong:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v20);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

}

void __65__PXFlexMusicLibrary_requestAssetsWithIdentifiers_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint8_t buf[16];

  +[PXAudioSettings sharedInstance](PXAudioSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "flexSimulateAssetFetchFailure");

  if (v3)
  {
    PXAudioAssetFetchResultWithArray(MEMORY[0x1E0C9AA60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D22258]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uid in %@"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v5);

    objc_msgSend(*(id *)(a1 + 40), "_queue_fetchAssetsWithOptions:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  PLAudioPlaybackGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 40));
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v9, "PXFlexMusicLibrary - requestAssetsWithIdentifiers", " enableTelemetry=YES ", buf, 2u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __49__PXFlexMusicLibrary_fetchAssetsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "indexOfObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v6);

  if (v7 < v8)
    return -1;
  else
    return v7 > v8;
}

+ (PXFlexMusicLibrary)sharedLibrary
{
  if (sharedLibrary_onceToken_250036 != -1)
    dispatch_once(&sharedLibrary_onceToken_250036, &__block_literal_global_250037);
  return (PXFlexMusicLibrary *)(id)sharedLibrary_library;
}

+ (void)purgeLocalFlexDataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  v4 = a3;
  PLAudioPlaybackGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "Purging local flex data…", buf, 2u);
  }

  dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PXFlexMusicLibrary_purgeLocalFlexDataWithCompletion___block_invoke;
  v8[3] = &unk_1E51423E0;
  v9 = v4;
  v10 = a1;
  v7 = v4;
  dispatch_async(v6, v8);

}

+ (id)coalesceAudioMixInputParametersA:(id)a3 withAudioMixInputParametersB:(id)a4 audioTrack:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v8, "naturalTimeScale");
  objc_msgSend(a1, "_mixParametersForAudioMixInputParameters:sampleRate:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_mixParametersForAudioMixInputParameters:sampleRate:", v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D22288], "coalesceMixParamsA:withMixParamsB:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_audioMixInputParametersForMixParameters:audioTrack:sampleRate:", v14, v8, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_mixParametersForAudioMixInputParameters:(id)a3 sampleRate:(int)a4
{
  id v5;
  id v6;
  __int128 v7;
  char v8;
  id v9;
  double v10;
  void *v11;
  id v12;
  double v13;
  void *v14;
  CMTime v16;
  CMTime time;
  CMTime v18;
  float v19;
  float v20;
  __int128 v21;
  _BYTE v22[32];
  CMTime v23;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0D22268]);
  v23 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v7 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  v21 = *MEMORY[0x1E0CA2E50];
  *(_OWORD *)v22 = v7;
  *(_OWORD *)&v22[16] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
  v19 = -1.0;
  v20 = -1.0;
  while (1)
  {
    while (1)
    {
      v18 = v23;
      v8 = objc_msgSend(v5, "getVolumeRampForTime:startVolume:endVolume:timeRange:", &v18, &v20, &v19, &v21);
      memset(&v18, 0, sizeof(v18));
      time = v23;
      CMTimeConvertScale(&v18, &time, a4, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      time = v23;
      *(_OWORD *)&v16.value = v21;
      v16.epoch = *(_QWORD *)v22;
      if (CMTimeCompare(&time, &v16))
        break;
      if (v20 > -1.0)
      {
        v9 = objc_alloc(MEMORY[0x1E0D22260]);
        *(float *)&v10 = v20;
        v11 = (void *)objc_msgSend(v9, "initWithValue:atTime:", v18.value, v10);
        objc_msgSend(v6, "appendVolumeKeyframe:", v11);

      }
      time = v23;
      v16 = *(CMTime *)&v22[8];
      CMTimeAdd(&v23, &time, &v16);
      if ((v8 & 1) == 0)
        goto LABEL_11;
    }
    if ((v8 & 1) == 0)
      break;
    *(_OWORD *)&v23.value = v21;
    v23.epoch = *(_QWORD *)v22;
  }
  if (v19 > -1.0)
  {
    v12 = objc_alloc(MEMORY[0x1E0D22260]);
    *(float *)&v13 = v19;
    v14 = (void *)objc_msgSend(v12, "initWithValue:atTime:", v18.value, v13);
    objc_msgSend(v6, "appendVolumeKeyframe:", v14);

  }
LABEL_11:

  return v6;
}

+ (id)_audioMixInputParametersForMixParameters:(id)a3 audioTrack:(id)a4 sampleRate:(int)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  double v21;
  int v22;
  int v23;
  double v24;
  CMTime v26;
  CMTimeRange v27;
  CMTime duration;
  CMTime start;
  CMTimeRange v30;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C8B260], "audioMixInputParametersWithTrack:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "volumeKeyFrames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = v10 - 1;
  if (v10 >= 1)
  {
    v12 = v10;
    v13 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13 + 1;
      if (v13 < v11
        && (objc_msgSend(v9, "objectAtIndexedSubscript:", v13 + 1), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v17 = (void *)v16;
        memset(&v30, 0, sizeof(v30));
        CMTimeMake(&start, objc_msgSend(v14, "sampleTime"), a5);
        CMTimeMake(&duration, objc_msgSend(v17, "sampleTime") - objc_msgSend(v14, "sampleTime"), a5);
        CMTimeRangeMake(&v30, &start, &duration);
        objc_msgSend(v14, "value");
        v19 = v18;
        objc_msgSend(v17, "value");
        LODWORD(v21) = v20;
        v27 = v30;
        objc_msgSend(v8, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v27, COERCE_DOUBLE(__PAIR64__(HIDWORD(v30.start.value), v19)), v21);

      }
      else
      {
        objc_msgSend(v14, "value");
        v23 = v22;
        CMTimeMake(&v26, objc_msgSend(v14, "sampleTime"), a5);
        LODWORD(v24) = v23;
        objc_msgSend(v8, "setVolume:atTime:", &v26, v24);
      }

      v13 = v15;
    }
    while (v12 != v15);
  }

  return v8;
}

void __55__PXFlexMusicLibrary_purgeLocalFlexDataWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(*(Class *)(a1 + 40));
  v3 = (void *)v2[13];
  v4 = *MEMORY[0x1E0D221E0];
  v9[0] = *MEMORY[0x1E0D221F8];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purgeAllLocalCachedAssetsWithIDs:", v5);

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(id *)(a1 + 32);
  MAPurgeCatalogsWithPurpose();

}

void __55__PXFlexMusicLibrary_purgeLocalFlexDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLAudioPlaybackGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "Finished purging local flex data with error %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __35__PXFlexMusicLibrary_sharedLibrary__block_invoke()
{
  PXFlexMusicLibrary *v0;
  void *v1;

  v0 = objc_alloc_init(PXFlexMusicLibrary);
  v1 = (void *)sharedLibrary_library;
  sharedLibrary_library = (uint64_t)v0;

}

@end

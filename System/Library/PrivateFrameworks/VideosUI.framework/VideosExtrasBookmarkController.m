@implementation VideosExtrasBookmarkController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_15);
  return (id)sharedInstance___sharedInstance_1;
}

void __48__VideosExtrasBookmarkController_sharedInstance__block_invoke()
{
  VideosExtrasBookmarkController *v0;
  void *v1;

  v0 = objc_alloc_init(VideosExtrasBookmarkController);
  v1 = (void *)sharedInstance___sharedInstance_1;
  sharedInstance___sharedInstance_1 = (uint64_t)v0;

}

- (VideosExtrasBookmarkController)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  dispatch_queue_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  VideosExtrasBookmarkController *v35;
  __CFString *v36;
  uint64_t v38;
  void *v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)VideosExtrasBookmarkController;
  v8 = -[VideosExtrasBookmarkController init](&v40, sel_init);
  if (!v8)
    goto LABEL_5;
  VideosExtrasLoggingToOSLogging(6, CFSTR("Initializing extras bookmarking..."), v2, v3, v4, v5, v6, v7, v38);
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("com.apple.%@.queue.%p"));

  v12 = objc_retainAutorelease(v11);
  v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
  v14 = (void *)*((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v13;

  objc_msgSend(MEMORY[0x1E0DAF440], "domainForExtrasValues");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)*((_QWORD *)v8 + 2);
  *((_QWORD *)v8 + 2) = v15;

  v22 = *((_QWORD *)v8 + 2);
  if (!v22)
  {
    v36 = CFSTR("Failed to initialize extras bookmarking. Extras playback position domain is nil!");
LABEL_8:
    VideosExtrasLoggingToOSLogging(3, v36, v22, v17, v18, v19, v20, v21, (uint64_t)v39);

    v35 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0DAF450], "serviceForValueDomain:");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)*((_QWORD *)v8 + 3);
  *((_QWORD *)v8 + 3) = v23;

  if (!*((_QWORD *)v8 + 3))
  {
    v36 = CFSTR("Failed to initialize extras bookmarking. Extras playback position value service is nil!");
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)*((_QWORD *)v8 + 4);
  *((_QWORD *)v8 + 4) = v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)*((_QWORD *)v8 + 5);
  *((_QWORD *)v8 + 5) = v27;

  *((_QWORD *)v8 + 6) = 0x4024000000000000;
  VideosExtrasLoggingToOSLogging(6, CFSTR("Done initializing extras bookmarking."), v29, v30, v31, v32, v33, v34, (uint64_t)v39);

LABEL_5:
  v35 = (VideosExtrasBookmarkController *)v8;
LABEL_9:

  return v35;
}

- (void)pullBookmarksForAssets:(id)a3 completionBlock:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__VideosExtrasBookmarkController_pullBookmarksForAssets_completionBlock___block_invoke;
  v11[3] = &unk_1E9F9A3E0;
  v12 = v9;
  v10 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  -[VideosExtrasBookmarkController pullBookmarksForIdentifiers:completionBlock:](self, "pullBookmarksForIdentifiers:completionBlock:", v10, v7);
}

void __73__VideosExtrasBookmarkController_pullBookmarksForAssets_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  const __CFString *v4;
  __CFString *v5;

  objc_msgSend(a2, "bookmarkID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = &stru_1E9FF3598;
  v5 = (__CFString *)v4;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");

}

- (void)pullBookmarksForIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    VideosExtrasLoggingToOSLogging(6, CFSTR("Pulling bookmark times for identifiers: %@ ..."), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    v14 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __78__VideosExtrasBookmarkController_pullBookmarksForIdentifiers_completionBlock___block_invoke;
    v17[3] = &unk_1E9F99778;
    v18 = v6;
    v19 = v15;
    v20 = v7;
    v16 = v15;
    -[VideosExtrasBookmarkController _loadAllBookmarksWithRemainingIdentifiers:bookmarkTimes:completionBlock:](self, "_loadAllBookmarksWithRemainingIdentifiers:bookmarkTimes:completionBlock:", v14, v16, v17);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

uint64_t __78__VideosExtrasBookmarkController_pullBookmarksForIdentifiers_completionBlock___block_invoke(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  VideosExtrasLoggingToOSLogging(6, CFSTR("Done pulling bookmark times for identifiers: %@, times: %@"), a3, a4, a5, a6, a7, a8, a1[4]);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, a1[5]);
  return result;
}

- (BOOL)pushBookmarkForAsset:(id)a3 bookmarkTime:(double)a4 playedToNominalLength:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;

  v5 = a5;
  objc_msgSend(a3, "bookmarkID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[VideosExtrasBookmarkController pushBookmarkForIdentifier:bookmarkTime:playedToNominalLength:](self, "pushBookmarkForIdentifier:bookmarkTime:playedToNominalLength:", v8, v5, a4);

  return v5;
}

- (BOOL)pushBookmarkForIdentifier:(id)a3 bookmarkTime:(double)a4 playedToNominalLength:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *queue;
  id v18;
  void *v19;
  double v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  SBCPlaybackPositionValueService *extrasService;
  _QWORD v31[4];
  id v32;
  VideosExtrasBookmarkController *v33;
  _QWORD block[5];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v5 = a5;
  v8 = a3;
  v15 = v8;
  if (v8 && objc_msgSend(v8, "length"))
  {
    VideosExtrasLoggingToOSLogging(6, CFSTR("Bookmark update requested for identifier: %@, bookmark time: %.1f, played to nominal length: %d"), v9, v10, v11, v12, v13, v14, (uint64_t)v15);
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 1;
    v16 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__VideosExtrasBookmarkController_pushBookmarkForIdentifier_bookmarkTime_playedToNominalLength___block_invoke;
    block[3] = &unk_1E9F9A408;
    block[4] = self;
    v18 = v15;
    v35 = v18;
    v36 = &v37;
    dispatch_sync(queue, block);
    if (*((_BYTE *)v38 + 24))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_entities, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF448]), "initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:", self->_domain, v18, 0);
      objc_msgSend(v19, "setBookmarkTimestamp:", CFAbsoluteTimeGetCurrent());
      v20 = 0.0;
      if (!v5)
        v20 = a4;
      objc_msgSend(v19, "setBookmarkTime:", v20);
      if (v5)
        v21 = objc_msgSend(v19, "userPlayCount") + 1;
      else
        v21 = objc_msgSend(v19, "userPlayCount");
      objc_msgSend(v19, "setUserPlayCount:", v21);
      objc_msgSend(v19, "setHasBeenPlayed:", v5);
      VideosExtrasLoggingToOSLogging(6, CFSTR("Pushing bookmark for identifier: %@, bookmark time: %.1f, played to nominal length: %@"), v23, v24, v25, v26, v27, v28, (uint64_t)v18);
      extrasService = self->_extrasService;
      v31[0] = v16;
      v31[1] = 3221225472;
      v31[2] = __95__VideosExtrasBookmarkController_pushBookmarkForIdentifier_bookmarkTime_playedToNominalLength___block_invoke_2;
      v31[3] = &unk_1E9F9A430;
      v32 = v18;
      v33 = self;
      -[SBCPlaybackPositionValueService pushPlaybackPositionEntity:completionBlock:](extrasService, "pushPlaybackPositionEntity:completionBlock:", v19, v31);

    }
    _Block_object_dispose(&v37, 8);
    v22 = 1;
  }
  else
  {
    VideosExtrasLoggingToOSLogging(6, CFSTR("Skipping bookmark push for identifier: %@.  No bookmark ID found."), v9, v10, v11, v12, v13, v14, (uint64_t)v15);
    v22 = 0;
  }

  return v22;
}

void __95__VideosExtrasBookmarkController_pushBookmarkForIdentifier_bookmarkTime_playedToNominalLength___block_invoke(_QWORD *a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v10 = CFAbsoluteTimeGetCurrent() - v3;
    if (v10 >= *(double *)(a1[4] + 48))
    {
      VideosExtrasLoggingToOSLogging(6, CFSTR("Proceeding with bookmark update since it has been %.0f seconds since the last update for identifier: %@"), v4, v5, v6, v7, v8, v9, *(uint64_t *)&v10);
    }
    else
    {
      VideosExtrasLoggingToOSLogging(6, CFSTR("Skipping bookmark update since its only been %.0f seconds since the last update for identifier: %@"), v4, v5, v6, v7, v8, v9, *(uint64_t *)&v10);
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 40), "setObject:forKeyedSubscript:", v11, a1[5]);

    VideosExtrasLoggingToOSLogging(6, CFSTR("Proceeding with bookmark update since the identifier hasn't been updated in the recent past. identifier: %@"), v12, v13, v14, v15, v16, v17, a1[5]);
  }

}

void __95__VideosExtrasBookmarkController_pushBookmarkForIdentifier_bookmarkTime_playedToNominalLength___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;

  v17 = a4;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  objc_msgSend(v17, "bookmarkTime");
  VideosExtrasLoggingToOSLogging(6, CFSTR("Completed bookmark push for identifier: %@, success: %@, error: %@, bookmark time: %.1f"), v8, v9, v10, v11, v12, v13, v6);

  if (v17)
  {
    v15 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v16 = *(NSObject **)(v14 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__VideosExtrasBookmarkController_pushBookmarkForIdentifier_bookmarkTime_playedToNominalLength___block_invoke_3;
    block[3] = &unk_1E9F99840;
    block[4] = v14;
    v19 = v15;
    v20 = v17;
    dispatch_sync(v16, block);

  }
}

uint64_t __95__VideosExtrasBookmarkController_pushBookmarkForIdentifier_bookmarkTime_playedToNominalLength___block_invoke_3(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (void)_loadAllBookmarksWithRemainingIdentifiers:(id)a3 bookmarkTimes:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  SBCPlaybackPositionValueService *extrasService;
  _QWORD v27[4];
  id v28;
  VideosExtrasBookmarkController *v29;
  id v30;
  id v31;
  void (**v32)(_QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "removeObjectAtIndex:", 0);
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_updateTimeForEntities, "setObject:forKeyedSubscript:", v18, v11);

      VideosExtrasLoggingToOSLogging(6, CFSTR("Pulling bookmark for identifier: %@"), v19, v20, v21, v22, v23, v24, (uint64_t)v11);
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF448]), "initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:", self->_domain, v11, 0);
      extrasService = self->_extrasService;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __106__VideosExtrasBookmarkController__loadAllBookmarksWithRemainingIdentifiers_bookmarkTimes_completionBlock___block_invoke;
      v27[3] = &unk_1E9F9A458;
      v28 = v11;
      v29 = self;
      v30 = v9;
      v31 = v8;
      v32 = v10;
      -[SBCPlaybackPositionValueService pullPlaybackPositionEntity:completionBlock:](extrasService, "pullPlaybackPositionEntity:completionBlock:", v25, v27);

    }
    else
    {
      VideosExtrasLoggingToOSLogging(6, CFSTR("Skipping bookmark pull for identifier: %@. No bookmark id found."), v12, v13, v14, v15, v16, v17, (uint64_t)v11);
      objc_msgSend(v9, "addObject:", &unk_1EA0B9148);
      -[VideosExtrasBookmarkController _loadAllBookmarksWithRemainingIdentifiers:bookmarkTimes:completionBlock:](self, "_loadAllBookmarksWithRemainingIdentifiers:bookmarkTimes:completionBlock:", v8, v9, v10);
    }
  }
  else if (v10)
  {
    v10[2](v10);
  }

}

void __106__VideosExtrasBookmarkController__loadAllBookmarksWithRemainingIdentifiers_bookmarkTimes_completionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;

  v23 = a4;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = a3;
  objc_msgSend(v23, "bookmarkTime");
  VideosExtrasLoggingToOSLogging(6, CFSTR("Completed bookmark pull for identifier: %@, success: %@, error: %@, bookmark time: %.1f"), v9, v10, v11, v12, v13, v14, v7);

  v15 = 0.0;
  if (v23)
  {
    v17 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v18 = *(NSObject **)(v16 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__VideosExtrasBookmarkController__loadAllBookmarksWithRemainingIdentifiers_bookmarkTimes_completionBlock___block_invoke_2;
    block[3] = &unk_1E9F99840;
    block[4] = v16;
    v25 = v17;
    v19 = v23;
    v26 = v19;
    dispatch_sync(v18, block);

    if (a2)
    {
      objc_msgSend(v19, "bookmarkTime");
      v15 = v20;
    }
  }
  v21 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v22);

  objc_msgSend(*(id *)(a1 + 40), "_loadAllBookmarksWithRemainingIdentifiers:bookmarkTimes:completionBlock:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
}

uint64_t __106__VideosExtrasBookmarkController__loadAllBookmarksWithRemainingIdentifiers_bookmarkTimes_completionBlock___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (double)minimumBookmarkUpdateInterval
{
  return self->_minimumBookmarkUpdateInterval;
}

- (void)setMinimumBookmarkUpdateInterval:(double)a3
{
  self->_minimumBookmarkUpdateInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimeForEntities, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_extrasService, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

@implementation PTCinematographyScript

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultMinimumUserFocusDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 2, 1);
}

- (PTCinematographyScript)init
{
  PTCinematographyScript *v2;
  PTCinematographyScript *v3;
  NSArray *frames;
  NSArray *v5;
  NSArray *baseDecisions;
  uint64_t v7;
  NSMutableArray *userDecisions;
  uint64_t v9;
  NSMutableArray *effectiveDecisions;
  uint64_t v11;
  NSMutableArray *mutableTracks;
  uint64_t v13;
  NSMutableDictionary *trackForNumber;
  uint64_t v15;
  NSMutableDictionary *trackNumberForFocusIdentifier;
  uint64_t v17;
  NSMutableArray *mutableGroupTracks;
  uint64_t v19;
  NSMutableDictionary *trackForGroupNumber;
  PTCinematographyTrackAllocator *v21;
  PTCinematographyTrackAllocator *trackAllocator;
  PTCinematographyTrackAllocator *v23;
  PTCinematographyTrackAllocator *trackAllocatorForFocusIdentifier;
  PTCinematographyFocusPuller *focusPuller;
  PTCinematographyFocusFramesOptions *v26;
  PTCinematographyFocusFramesOptions *focusFramesOptions;
  __int128 v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *serialQueue;
  CMTime v32;
  CMTime start;
  CMTimeRange v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)PTCinematographyScript;
  v2 = -[PTCinematographyScript init](&v35, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_userAperture = 4.0;
    v2->_loadedUserAperture = 4.0;
    frames = v2->_frames;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_frames = (NSArray *)MEMORY[0x1E0C9AA60];

    baseDecisions = v3->_baseDecisions;
    v3->_baseDecisions = v5;

    v7 = objc_opt_new();
    userDecisions = v3->_userDecisions;
    v3->_userDecisions = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    effectiveDecisions = v3->_effectiveDecisions;
    v3->_effectiveDecisions = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    mutableTracks = v3->_mutableTracks;
    v3->_mutableTracks = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    trackForNumber = v3->_trackForNumber;
    v3->_trackForNumber = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    trackNumberForFocusIdentifier = v3->_trackNumberForFocusIdentifier;
    v3->_trackNumberForFocusIdentifier = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    mutableGroupTracks = v3->_mutableGroupTracks;
    v3->_mutableGroupTracks = (NSMutableArray *)v17;

    v19 = objc_opt_new();
    trackForGroupNumber = v3->_trackForGroupNumber;
    v3->_trackForGroupNumber = (NSMutableDictionary *)v19;

    v21 = -[PTCinematographyTrackAllocator initWithTrackIdentifier:]([PTCinematographyTrackAllocator alloc], "initWithTrackIdentifier:", 0x1200000000);
    trackAllocator = v3->_trackAllocator;
    v3->_trackAllocator = v21;

    v3->_loadedTrackAllocatorState = -[PTCinematographyTrackAllocator trackIdentifier](v3->_trackAllocator, "trackIdentifier");
    v23 = -[PTCinematographyTrackAllocator initWithTrackIdentifier:]([PTCinematographyTrackAllocator alloc], "initWithTrackIdentifier:", 0x1300000000);
    trackAllocatorForFocusIdentifier = v3->_trackAllocatorForFocusIdentifier;
    v3->_trackAllocatorForFocusIdentifier = v23;

    focusPuller = v3->_focusPuller;
    v3->_focusPuller = 0;

    v26 = objc_alloc_init(PTCinematographyFocusFramesOptions);
    focusFramesOptions = v3->_focusFramesOptions;
    v3->_focusFramesOptions = v26;

    -[PTCinematographyScript _addZeroDisparityTrack](v3, "_addZeroDisparityTrack");
    start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    v32 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
    CMTimeRangeMake(&v34, &start, &v32);
    v28 = *(_OWORD *)&v34.start.epoch;
    *(_OWORD *)&v3->_timeRange.start.value = *(_OWORD *)&v34.start.value;
    *(_OWORD *)&v3->_timeRange.start.epoch = v28;
    *(_OWORD *)&v3->_timeRange.duration.timescale = *(_OWORD *)&v34.duration.timescale;
    v29 = dispatch_queue_create("com.apple.Portrait.CinematographyScript.serialQueue", 0);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v29;

  }
  return v3;
}

- (id)loadWithAsset:(id)a3 changesDictionary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PTAssetReader *v11;
  PTAssetReader *v12;
  uint64_t v13;
  NSObject *serialQueue;
  id v15;
  id v16;
  __int128 v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  CMTimeRange *v27;
  _QWORD v28[4];
  PTAssetReader *v29;
  PTCinematographyScript *v30;
  id v31;
  NSObject *v32;
  _QWORD *v33;
  CMTimeRange *v34;
  CMTime *p_start;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  CMTime start;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[3];
  char v48;
  CMTime duration;
  CMTimeRange v50;
  _QWORD block[4];
  id v52;
  id v53;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PTAssetReader initWithAsset:]([PTAssetReader alloc], "initWithAsset:", v8);
  v12 = v11;
  if (v11)
  {
    v13 = -[PTAssetReader estimatedFrameCount](v11, "estimatedFrameCount");
    if (v8)
      objc_msgSend(v8, "duration");
    else
      memset(&duration, 0, sizeof(duration));
    start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    CMTimeRangeMake(&v50, &start, &duration);
    v17 = *(_OWORD *)&v50.start.epoch;
    *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&v50.start.value;
    *(_OWORD *)&self->_timeRange.start.epoch = v17;
    *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&v50.duration.timescale;
    v50.start.value = 0;
    *(_QWORD *)&v50.start.timescale = &v50;
    v50.start.epoch = 0x3032000000;
    v50.duration.value = (CMTimeValue)__Block_byref_object_copy__0;
    *(_QWORD *)&v50.duration.timescale = __Block_byref_object_dispose__0;
    v50.duration.epoch = 0;
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    v48 = 0;
    start.value = 0;
    *(_QWORD *)&start.timescale = &start;
    start.epoch = 0x3032000000;
    v44 = __Block_byref_object_copy__0;
    v45 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v13);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__0;
    v41[4] = __Block_byref_object_dispose__0;
    v42 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__0;
    v39[4] = __Block_byref_object_dispose__0;
    v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
    v18 = dispatch_group_create();
    dispatch_group_enter(v18);
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_19;
    v28[3] = &unk_1E822A748;
    v33 = v41;
    v34 = &v50;
    p_start = &start;
    v29 = v12;
    v30 = self;
    v36 = v39;
    v38 = v13;
    v37 = v47;
    v31 = v9;
    v32 = v18;
    v21 = v18;
    dispatch_async(v19, v28);

    v24[0] = v20;
    v24[1] = 3221225472;
    v24[2] = __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_2;
    v24[3] = &unk_1E822A798;
    v24[4] = self;
    v25 = v10;
    v26 = v47;
    v27 = &v50;
    v22 = v10;
    dispatch_group_notify(v21, v19, v24);

    v16 = *(id *)(*(_QWORD *)&start.timescale + 40);
    _Block_object_dispose(v39, 8);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(&start, 8);

    _Block_object_dispose(v47, 8);
    _Block_object_dispose(&v50, 8);

  }
  else
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke;
    block[3] = &unk_1E822A6F8;
    v53 = v10;
    v52 = v8;
    v15 = v10;
    dispatch_async(serialQueue, block);

    v16 = 0;
  }

  return v16;
}

void __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to read AVAsset: %@"), *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB2D50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Portrait.CinematographyScript"), 3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v5);

}

void __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_19(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PTCinematographyFrame *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD block[5];
  id v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[24];
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  id obj;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  _QWORD v66[4];

  v66[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "globalCinematographyMetadata");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v5, "startReadingFrames:error:", 1, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
  {
    v8 = 0;
    goto LABEL_25;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "isCancelled") & 1) != 0)
  {
    v8 = 0;
    goto LABEL_24;
  }
  v9 = 0;
  v46 = *MEMORY[0x1E0CB2D50];
  while (1)
  {
    v10 = (void *)MEMORY[0x1CAA3ACDC]();
    v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "nextFrame");
    if (!v11)
      break;
    v12 = v11;
    objc_msgSend(v11, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("com.apple.quicktime.cinematic-video.cinematography"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("com.apple.quicktime.cinematic-video.cinematography"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v65 = v46;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Value for %@ key is of unexpected type: %@ for frame index %lu"), CFSTR("com.apple.quicktime.cinematic-video.cinematography"), v17, objc_msgSend(v12, "index"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Portrait.CinematographyScript"), 5, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = v26;

LABEL_22:
        break;
      }
      objc_msgSend(v12, "metadataTime");
      v52 = v54;
      v53 = v55;
      objc_msgSend(v17, "setTime:", &v52);
      if (!v9)
        goto LABEL_10;
    }
    else
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("com.apple.quicktime.cinematography-dictionary"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18
        || (objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CinematographyDictionary")),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v19,
            v19)
        && (objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CinematographyDictionary")),
            v20 = objc_claimAutoreleasedReturnValue(),
            v18,
            (v18 = (void *)v20) == 0))
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v63 = v46;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No %@ key in metadata for frame index %lu"), CFSTR("com.apple.quicktime.cinematography-dictionary"), objc_msgSend(v12, "index"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Portrait.CinematographyScript"), 5, v24);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v25 = *(void **)(v31 + 40);
        *(_QWORD *)(v31 + 40) = v30;
        goto LABEL_22;
      }
      v21 = [PTCinematographyFrame alloc];
      objc_msgSend(v12, "metadataTime");
      v22 = -[PTCinematographyFrame _initWithCinematographyDictionary:time:](v21, "_initWithCinematographyDictionary:time:", v18, v51);
      if (!v22)
      {
        v32 = (void *)MEMORY[0x1E0CB35C8];
        v61 = v46;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to parse cinematography metadata for frame %lu. Dictionary: %@"), objc_msgSend(v12, "index"), v18);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Portrait.CinematographyScript"), 5, v25);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v35 = *(void **)(v34 + 40);
        *(_QWORD *)(v34 + 40) = v33;

        v17 = v18;
        goto LABEL_22;
      }
      v17 = (void *)v22;

      if (!v9)
      {
LABEL_10:
        objc_msgSend(v17, "aperture");
        objc_msgSend(*(id *)(a1 + 40), "setUserAperture:");
        objc_msgSend(*(id *)(a1 + 40), "userAperture");
        objc_msgSend(*(id *)(a1 + 40), "setLoadedUserAperture:");
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setObject:atIndexedSubscript:", v17, v9);
    v8 = v9 + 1;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setCompletedUnitCount:", v9);

    objc_autoreleasePoolPop(v10);
    ++v9;
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "isCancelled") & 1) != 0)
      goto LABEL_24;
  }
  objc_autoreleasePoolPop(v10);
  v8 = v9;
LABEL_24:
  objc_msgSend(*(id *)(a1 + 32), "stopReadingFrames");
LABEL_25:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Portrait.CinematographyScript"), 2, 0);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v38 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v36;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    if (*(_QWORD *)(a1 + 104) == v8)
      goto LABEL_33;
    _PTLogSystem();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = *(_QWORD *)(a1 + 104);
      *(_DWORD *)buf = 134218240;
      v58 = v40;
      v59 = 2048;
      v60 = v8;
      _os_log_impl(&dword_1C9281000, v39, OS_LOG_TYPE_INFO, "WARNING: frameCount estimate was off. %lu frames expected, but only %lu were read", buf, 0x16u);
    }

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
LABEL_33:
      v41 = *(_QWORD *)(a1 + 40);
      v42 = *(void **)(a1 + 48);
      v43 = *(NSObject **)(v41 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_29;
      block[3] = &unk_1E822A720;
      v44 = *(_QWORD *)(a1 + 64);
      block[4] = v41;
      v45 = *(_QWORD *)(a1 + 88);
      v49 = v44;
      v50 = v45;
      v48 = v42;
      dispatch_sync(v43, block);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_29(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_storeStrong((id *)(a1[4] + 56), *(id *)(*(_QWORD *)(a1[6] + 8) + 40));
  v2 = (void *)a1[4];
  v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "copy");
  objc_msgSend(v2, "_internalizeLoadedFrames:changesDictionary:reloading:", v3, a1[5], 0);

}

void __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  __int128 v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_3;
  block[3] = &unk_1E822A770;
  v5 = v2;
  v6 = *(_OWORD *)(a1 + 48);
  dispatch_async(v3, block);

}

uint64_t __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (BOOL)_loadWithAsset:(id)a3 changesDictionary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  char v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v8 = a3;
  v9 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__PTCinematographyScript__loadWithAsset_changesDictionary_error___block_invoke;
  v15[3] = &unk_1E822A7C0;
  v17 = &v25;
  v18 = &v19;
  v11 = v10;
  v16 = v11;
  v12 = -[PTCinematographyScript loadWithAsset:changesDictionary:completion:](self, "loadWithAsset:changesDictionary:completion:", v8, v9, v15);
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
    *a5 = objc_retainAutorelease((id)v20[5]);
  v13 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __65__PTCinematographyScript__loadWithAsset_changesDictionary_error___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)reloadWithChangesDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BYTE v8[48];

  v4 = a3;
  -[PTCinematographyScript changesDelegate](self, "changesDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyScript setChangesDelegate:](self, "setChangesDelegate:", 0);
  -[PTCinematographyScript removeAllUserDecisions](self, "removeAllUserDecisions");
  -[PTCinematographyScript _removeAllUserTracksForReloading](self, "_removeAllUserTracksForReloading");
  -[PTCinematographyScript loadedUserAperture](self, "loadedUserAperture");
  -[PTCinematographyScript setUserAperture:](self, "setUserAperture:");
  -[PTCinematographyScript frames](self, "frames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyScript _internalizeLoadedFrames:changesDictionary:reloading:](self, "_internalizeLoadedFrames:changesDictionary:reloading:", v6, v4, 1);

  -[PTCinematographyScript setChangesDelegate:](self, "setChangesDelegate:", v5);
  -[PTCinematographyScript timeRange](self, "timeRange");
  -[PTCinematographyScript _notifyDelegateOfChangesToDecisionsInTimeRange:](self, "_notifyDelegateOfChangesToDecisionsInTimeRange:", v8);
  -[PTCinematographyScript timeRange](self, "timeRange");
  -[PTCinematographyScript _notifyDelegateOfChangesToFramesInTimeRange:](self, "_notifyDelegateOfChangesToFramesInTimeRange:", &v7);

}

- (void)_internalizeLoadedFrames:(id)a3 changesDictionary:(id)a4 reloading:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PTCinematographyFocusFramesOptions *v10;
  PTCinematographyFocusFramesOptions *focusFramesOptions;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  _BYTE v16[48];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[PTCinematographyScript setFrames:](self, "setFrames:", v8);
  -[PTCinematographyScript _internalizeUserApertureFromChangesDictionary:](self, "_internalizeUserApertureFromChangesDictionary:", v9);
  -[PTCinematographyScript _internalizeFocusPullerFromFrames:](self, "_internalizeFocusPullerFromFrames:", v8);
  v10 = -[PTCinematographyFocusFramesOptions initWithGlobalMetadata:]([PTCinematographyFocusFramesOptions alloc], "initWithGlobalMetadata:", self->_globals);
  focusFramesOptions = self->_focusFramesOptions;
  self->_focusFramesOptions = v10;

  if (v5)
  {
    -[PTCinematographyScript _reloadTrackAllocator](self, "_reloadTrackAllocator");
    -[PTCinematographyScript _internalizeTracksFromChangesDictionary:](self, "_internalizeTracksFromChangesDictionary:", v9);
  }
  else
  {
    -[PTCinematographyScript _internalizeTracksFromFrames:](self, "_internalizeTracksFromFrames:", v8);
    -[PTCinematographyScript _internalizeTracksFromChangesDictionary:](self, "_internalizeTracksFromChangesDictionary:", v9);
    -[PTCinematographyScript _internalizeBaseDecisionsFromFrames:](self, "_internalizeBaseDecisionsFromFrames:", v8);
  }
  if (v9)
    -[PTCinematographyScript _internalizeUserDecisionsFromChangesDictionary:](self, "_internalizeUserDecisionsFromChangesDictionary:", v9);
  else
    -[PTCinematographyScript _internalizeUserDecisionsFromFrames:](self, "_internalizeUserDecisionsFromFrames:", v8);
  -[PTCinematographyScript timeRange](self, "timeRange");
  -[PTCinematographyScript _updateEffectiveDecisionsInTimeRange:](self, "_updateEffectiveDecisionsInTimeRange:", v16);
  _PTLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[PTCinematographyScript _internalizeLoadedFrames:changesDictionary:reloading:].cold.2(self);

  _PTLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PTCinematographyScript _internalizeLoadedFrames:changesDictionary:reloading:].cold.1(self);

  -[PTCinematographyScript trackDecisions](self, "trackDecisions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyScript timeRange](self, "timeRange");
  -[PTCinematographyScript _updateFramesForDecisions:timeRange:](self, "_updateFramesForDecisions:timeRange:", v14, &v15);

}

- (void)_internalizeFocusPullerFromFrames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  int v13;
  int v14;
  PTCinematographyFocusPuller *v15;
  double v16;
  double v17;
  PTCinematographyFocusPuller *v18;
  void *v19;
  void *v20;
  void *v21;
  PTCinematographyFocusPuller *v22;
  PTCinematographyFocusPuller *v23;
  NSObject *v24;
  PTCinematographyFocusPuller *v25;
  double v26;
  PTCinematographyFocusPuller *focusPuller;
  PTCinematographyFocusPuller *v28;

  v4 = a3;
  -[PTCinematographyScript globals](self, "globals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PTCinematographyScript globals](self, "globals");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "majorVersion");

    if (v7 == 1)
    {
      -[PTCinematographyScript globals](self, "globals");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "focusPullerAlpha");
      v10 = v9;
      objc_msgSend(v8, "focusPullerMaxV");
      v12 = v11;
      objc_msgSend(v8, "focusPullerResistance");
      v14 = v13;

      if (v12 > 0.0)
      {
        v15 = [PTCinematographyFocusPuller alloc];
        *(float *)&v16 = v12;
        LODWORD(v17) = v14;
        v18 = -[PTCinematographyFocusPuller initWithMaximumVelocity:resistance:](v15, "initWithMaximumVelocity:resistance:", v16, v17);
LABEL_13:
        focusPuller = self->_focusPuller;
        self->_focusPuller = v18;
LABEL_15:

        goto LABEL_18;
      }
      if (v10 > 0.0)
      {
        v25 = [PTCinematographyFocusPuller alloc];
        *(float *)&v26 = v10;
        v18 = -[PTCinematographyFocusPuller initWithExponentialMovingAverageAlpha:](v25, "initWithExponentialMovingAverageAlpha:", v26);
        goto LABEL_13;
      }
    }
    else
    {
      _PTLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[PTCinematographyScript _internalizeFocusPullerFromFrames:].cold.1(self, v24);

    }
    focusPuller = self->_focusPuller;
    self->_focusPuller = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_snapshot");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("focus_puller"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = [PTCinematographyFocusPuller alloc];
    if (v21)
      v23 = -[PTCinematographyFocusPuller _initWithCinematographyDictionary:](v22, "_initWithCinematographyDictionary:", v21);
    else
      v23 = -[PTCinematographyFocusPuller initWithExponentialMovingAverageSampleCount:](v22, "initWithExponentialMovingAverageSampleCount:", 1);
    v28 = self->_focusPuller;
    self->_focusPuller = v23;

  }
LABEL_18:

}

- (void)_internalizeUserApertureFromChangesDictionary:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("user_aperture"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "floatValue");
    -[PTCinematographyScript setUserAperture:](self, "setUserAperture:");
    v4 = v5;
  }

}

- (void)_internalizeUserDecisionsFromChangesDictionary:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *userDecisions;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("user_decisions"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PTCinematographyDecision _mutableDecisionsWithCinematographyDictionaries:](PTCinematographyDecision, "_mutableDecisionsWithCinematographyDictionaries:", v6);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  userDecisions = self->_userDecisions;
  self->_userDecisions = v4;

}

- (void)_internalizeUserDecisionsFromFrames:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v28;
  char v29;
  void *v30;
  id obj;
  CMTime v32;
  CMTime time1;
  CMTime time2;
  CMTime v35;
  CMTime v36;
  _QWORD v37[3];
  uint8_t v38;
  _BYTE v39[7];
  CMTime v40;
  CMTime v41;
  CMTime rhs;
  CMTime lhs;
  CMTime v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CMTime buf;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v30 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (!v4)
  {
    v9 = 0;
    goto LABEL_62;
  }
  v6 = v4;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v46;
  v28 = -1;
  v29 = 1;
  *(_QWORD *)&v5 = 138412290;
  v26 = v5;
  do
  {
    v11 = 0;
    v12 = v7;
    v13 = v8;
    v14 = v9;
    do
    {
      if (*(_QWORD *)v46 != v10)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v11);
      objc_msgSend(v15, "baseFocusTrackNumber", v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v7 = v12;
        v8 = v13;
        v9 = v14;
        goto LABEL_46;
      }
      objc_msgSend(v15, "userFocusTrackNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v15, "isUserFocusStrong");
      v8 = objc_msgSend(v15, "isUserFocusGroup");
      if (objc_msgSend(v15, "isUserFocusEnd"))
      {
        objc_msgSend(v30, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          if (v15)
            objc_msgSend(v15, "time");
          else
            memset(&lhs, 0, sizeof(lhs));
          objc_msgSend(v17, "time");
          CMTimeSubtract(&v44, &lhs, &rhs);
          v41 = v44;
          objc_msgSend(v17, "setMaximumDuration:", &v41);
          _PTLogSystem();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            if (v15)
              objc_msgSend(v15, "time");
            else
              memset(&v40, 0, sizeof(v40));
            NSStringFromCMTime(&v40);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf.value) = 138412546;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v17;
            LOWORD(buf.flags) = 2112;
            *(_QWORD *)((char *)&buf.flags + 2) = v23;
            _os_log_debug_impl(&dword_1C9281000, v19, OS_LOG_TYPE_DEBUG, "internalizing user decision %@ end at %@", (uint8_t *)&buf, 0x16u);

          }
        }
        else
        {
          _PTLogSystem();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            -[PTCinematographyScript _internalizeUserDecisionsFromFrames:].cold.1(&v38, v39, v19);
        }
        goto LABEL_43;
      }
      if (v9
        && (!v14
         || !objc_msgSend(v9, "isEqualToNumber:", v14)
         || ((v12 ^ v7) & 1) != 0
         || ((v13 ^ v8) & 1) != 0))
      {
        objc_msgSend(v15, "detectionForTrackNumber:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v18;
        if (v18)
        {
          if ((v8 & v13) != 1 || objc_msgSend(v18, "groupIdentifier") != v28)
          {
            if (v15)
              objc_msgSend(v15, "time");
            else
              memset(v37, 0, sizeof(v37));
            -[PTCinematographyScript _userDecisionToFocusOnDetection:time:strong:group:](self, "_userDecisionToFocusOnDetection:time:strong:group:", v17, v37, v7, v8);
            v19 = objc_claimAutoreleasedReturnValue();
            _PTLogSystem();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf.value) = v26;
              *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v19;
              _os_log_debug_impl(&dword_1C9281000, v22, OS_LOG_TYPE_DEBUG, "internalizing user decision %@", (uint8_t *)&buf, 0xCu);
            }

            objc_msgSend(v30, "addObject:", v19);
            v28 = objc_msgSend(v17, "groupIdentifier");
            goto LABEL_43;
          }
        }
        else
        {
          _PTLogSystem();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf.value) = 138412546;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v9;
            LOWORD(buf.flags) = 2112;
            *(_QWORD *)((char *)&buf.flags + 2) = v15;
            _os_log_error_impl(&dword_1C9281000, v19, OS_LOG_TYPE_ERROR, "userFocusTrackNumber %@ has no corresponding detection on frame %@. No user decision was added.", (uint8_t *)&buf, 0x16u);
          }
LABEL_43:

        }
LABEL_44:

        goto LABEL_45;
      }
      if ((v29 & 1) != 0 && (unint64_t)objc_msgSend(v30, "count") <= 1)
      {
        v20 = objc_msgSend(v30, "count");
        if (v9 || v20 != 1)
        {
          v29 = 1;
          goto LABEL_45;
        }
        objc_msgSend(v30, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "detectionForTrackIdentifier:", objc_msgSend(v17, "trackIdentifier"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          memset(&buf, 0, sizeof(buf));
          if (v15)
          {
            objc_msgSend(v15, "time");
            if (v17)
              goto LABEL_38;
LABEL_52:
            memset(&v35, 0, sizeof(v35));
          }
          else
          {
            memset(&v36, 0, sizeof(v36));
            if (!v17)
              goto LABEL_52;
LABEL_38:
            objc_msgSend(v17, "time");
          }
          CMTimeSubtract(&buf, &v36, &v35);
          v24 = (void *)objc_opt_class();
          if (v24)
            objc_msgSend(v24, "defaultMinimumUserFocusDuration");
          else
            memset(&time2, 0, sizeof(time2));
          time1 = buf;
          if (CMTimeCompare(&time1, &time2) < 0)
          {
            v32 = buf;
            objc_msgSend(v17, "setMinimumDuration:", &v32);
          }
        }
        v29 = 0;
        goto LABEL_44;
      }
      v29 = 0;
LABEL_45:

      v12 = v7;
      v13 = v8;
      v14 = v9;
LABEL_46:
      ++v11;
    }
    while (v6 != v11);
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    v6 = v25;
  }
  while (v25);
LABEL_62:

  -[PTCinematographyScript setUserDecisions:](self, "setUserDecisions:", v30);
}

- (id)_userDecisionToFocusOnDetection:(id)a3 time:(id *)a4 strong:(BOOL)a5 group:(BOOL)a6
{
  uint64_t v7;
  id v8;
  PTCinematographyDecision *v9;
  uint64_t v10;
  PTCinematographyDecision *v11;
  uint64_t v12;
  __int128 v14;
  int64_t var3;

  if (a6)
    v7 = a5 | 2;
  else
    v7 = a5;
  v8 = a3;
  v9 = [PTCinematographyDecision alloc];
  v10 = objc_msgSend(v8, "trackIdentifier");
  v14 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v11 = -[PTCinematographyDecision initWithTime:trackIdentifier:options:](v9, "initWithTime:trackIdentifier:options:", &v14, v10, v7);
  v12 = objc_msgSend(v8, "groupIdentifier");

  -[PTCinematographyDecision setGroupIdentifier:](v11, "setGroupIdentifier:", v12);
  -[PTCinematographyDecision setType:](v11, "setType:", 1);
  return v11;
}

- (float)userAperture
{
  PTCinematographyScript *v2;
  float userAperture;

  v2 = self;
  objc_sync_enter(v2);
  userAperture = v2->_userAperture;
  objc_sync_exit(v2);

  return userAperture;
}

- (void)setUserAperture:(float)a3
{
  PTCinematographyScript *v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.0)
  {
    _PTLogSystem();
    v4 = (PTCinematographyScript *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
      -[PTCinematographyScript setUserAperture:].cold.1(&v4->super, v10, v11);
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    if (v4->_userAperture != a3)
    {
      v4->_userAperture = a3;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      -[PTCinematographyScript frames](v4, "frames", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            *(float *)&v7 = a3;
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "setAperture:", v7);
          }
          while (v6 != v9);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v6);
      }

    }
    objc_sync_exit(v4);
  }

}

- (id)frameNearestTime:(id *)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  -[PTCinematographyScript frames](self, "frames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *a3;
  v6 = objc_msgSend(v5, "_indexNearestTime:", &v12);

  -[PTCinematographyScript frames](self, "frames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
    return 0;
  -[PTCinematographyScript frames](self, "frames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)frameAtTime:(id *)a3 tolerance:(id *)a4
{
  void *v6;
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  CMTime v13;

  v13 = *(CMTime *)a3;
  -[PTCinematographyScript frameNearestTime:](self, "frameNearestTime:", &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    memset(&v13, 0, sizeof(v13));
    objc_msgSend(v6, "time");
    rhs = (CMTime)*a3;
    CMTimeSubtract(&v13, &lhs, &rhs);
    memset(&rhs, 0, sizeof(rhs));
    time = v13;
    CMTimeAbsoluteValue(&rhs, &time);
    time = rhs;
    v9 = *a4;
    if (CMTimeCompare(&time, (CMTime *)&v9) >= 1)
    {

      v7 = 0;
    }
  }
  return v7;
}

- (id)framesInTimeRange:(id *)a3
{
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _OWORD v13[3];

  -[PTCinematographyScript frames](self, "frames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  v7 = objc_msgSend(v5, "_indexRangeOfTimeRange:", v13);
  v9 = v8;

  if (!v9)
    return MEMORY[0x1E0C9AA60];
  -[PTCinematographyScript frames](self, "frames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subarrayWithRange:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_detectionWithTrackIdentifier:(int64_t)a3 atOrBeforeTime:(id *)a4
{
  void *v7;
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  -[PTCinematographyScript frames](self, "frames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *a4;
  v8 = objc_msgSend(v7, "_indexAtOrBeforeTime:", &v10);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v10 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  -[PTCinematographyScript _latestDetectionOfTrackIdentifier:atOrBeforeFrameIndex:timeLimit:](self, "_latestDetectionOfTrackIdentifier:atOrBeforeFrameIndex:timeLimit:", a3, v8, &v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_detectionWithGroupIdentifier:(int64_t)a3 atOrBeforeTime:(id *)a4
{
  void *v7;
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  -[PTCinematographyScript frames](self, "frames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *a4;
  v8 = objc_msgSend(v7, "_indexAtOrBeforeTime:", &v10);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v10 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  -[PTCinematographyScript _latestDetectionOfGroupIdentifier:atOrBeforeFrameIndex:timeLimit:](self, "_latestDetectionOfGroupIdentifier:atOrBeforeFrameIndex:timeLimit:", a3, v8, &v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateFramesForDecisions:(id)a3 timeRange:(id *)a4
{
  __int128 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = *(_OWORD *)&a4->var0.var3;
  v9 = *(_OWORD *)&a4->var0.var0;
  v10 = v5;
  v11 = *(_OWORD *)&a4->var1.var1;
  v6 = a3;
  v7 = objc_msgSend(v6, "_indexRangeOfTimeRange:", &v9);
  -[PTCinematographyScript _updateFramesForDecisions:indexRange:](self, "_updateFramesForDecisions:indexRange:", v6, v7, v8, v9, v10, v11);

}

- (void)_updateFramesForDecisions:(id)a3 indexRange:(_NSRange)a4
{
  NSUInteger length;
  unint64_t location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSUInteger v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSRange v18;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = v7;
  if (location && location < objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", location - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", location);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyScript _updateFramesForTransitionFromDecision:toDecision:](self, "_updateFramesForTransitionFromDecision:toDecision:", v9, v10);

  }
  if (location < location + length)
  {
    v11 = length;
    v12 = location;
    do
    {
      v13 = v12++;
      v14 = objc_msgSend(v8, "count");
      objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 >= v14)
      {
        -[PTCinematographyScript _updateFramesForFinalDecision:](self, "_updateFramesForFinalDecision:", v15);
      }
      else
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTCinematographyScript _updateFramesFromDecision:toDecision:](self, "_updateFramesFromDecision:toDecision:", v15, v16);

      }
      --v11;
    }
    while (v11);
  }
  _PTLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18.location = location;
    v18.length = length;
    -[PTCinematographyScript _updateFramesForDecisions:indexRange:].cold.1(v18);
  }

}

- (void)_updateFramesFromDecision:(id)a3 toDecision:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _QWORD v18[3];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "trackIdentifier");
  if (v8 == objc_msgSend(v7, "trackIdentifier"))
  {
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyScript _updateFramesFromDecision:toDecision:].cold.1();

    if (v7)
      objc_msgSend(v7, "time");
    else
      memset(v18, 0, sizeof(v18));
    -[PTCinematographyScript _updateFramesForDecision:upToTime:](self, "_updateFramesForDecision:upToTime:", v6, v18);
  }
  else
  {
    v17 = 0;
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
    -[PTCinematographyScript _timeRangeOfTransitionfromDecision:toDecision:didShortenTransition:](self, "_timeRangeOfTransitionfromDecision:toDecision:didShortenTransition:", v6, v7, &v17);
    if (v17)
    {
      _PTLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PTCinematographyScript _updateFramesFromDecision:toDecision:].cold.2(v6, v7, v10);

    }
    v11 = v14;
    *(_QWORD *)&v12 = v15;
    -[PTCinematographyScript _updateFramesForDecision:upToTime:](self, "_updateFramesForDecision:upToTime:", v6, &v11);
    v11 = v14;
    v12 = v15;
    v13 = v16;
    -[PTCinematographyScript _updateFramesForTransitionFromDecision:toDecision:timeRange:](self, "_updateFramesForTransitionFromDecision:toDecision:timeRange:", v6, v7, &v11);
  }

}

- (void)_updateFramesForFinalDecision:(id)a3
{
  id v4;
  CMTimeRange range;
  CMTime v6;

  v4 = a3;
  -[PTCinematographyScript timeRange](self, "timeRange");
  CMTimeRangeGetEnd(&v6, &range);
  -[PTCinematographyScript _updateFramesForDecision:upToTime:](self, "_updateFramesForDecision:upToTime:", v4, &v6);

}

- (void)_updateFramesForDecision:(id)a3 upToTime:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  CMTimeRange v9;
  CMTime start;
  CMTimeRange v11;

  v6 = a3;
  v7 = v6;
  memset(&v11, 0, sizeof(v11));
  if (v6)
    objc_msgSend(v6, "time");
  else
    memset(&start, 0, sizeof(start));
  *(_OWORD *)&v9.start.value = *(_OWORD *)&a4->var0;
  v9.start.epoch = a4->var3;
  CMTimeRangeFromTimeToTime(&v11, &start, &v9.start);
  v8 = objc_msgSend(v7, "trackIdentifier");
  v9 = v11;
  -[PTCinematographyScript _updateFramesInTimeRange:toFocusOnTrackIdentifier:](self, "_updateFramesInTimeRange:toFocusOnTrackIdentifier:", &v9, v8);

}

- (void)_updateFramesForTransitionFromDecision:(id)a3 toDecision:(id)a4
{
  id v6;
  id v7;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  v6 = a4;
  v7 = a3;
  -[PTCinematographyScript _timeRangeOfTransitionfromDecision:toDecision:](self, "_timeRangeOfTransitionfromDecision:toDecision:", v7, v6);
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  -[PTCinematographyScript _updateFramesForTransitionFromDecision:toDecision:timeRange:](self, "_updateFramesForTransitionFromDecision:toDecision:timeRange:", v7, v6, v8);

}

- (void)_updateFramesForTransitionFromDecision:(id)a3 toDecision:(id)a4 timeRange:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CMTimeRange v40;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTimeRange range;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "trackIdentifier");
  v11 = objc_msgSend(v9, "trackIdentifier");
  -[PTCinematographyScript frames](self, "frames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
  v14 = *(_OWORD *)&a5->var1.var1;
  *(_OWORD *)&range.start.epoch = v13;
  *(_OWORD *)&range.duration.timescale = v14;
  v15 = objc_msgSend(v12, "_indexRangeOfTimeRange:", &range);
  v17 = v16;

  if (v17)
  {
    *(_OWORD *)&range.start.value = *MEMORY[0x1E0CA2E30];
    range.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
    -[PTCinematographyScript _latestDetectionOfTrackIdentifier:atOrBeforeFrameIndex:timeLimit:](self, "_latestDetectionOfTrackIdentifier:atOrBeforeFrameIndex:timeLimit:", v10, v15, &range);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = v15 + v17;
      -[PTCinematographyScript frames](self, "frames");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v19 >= v21)
      {
        _PTLogSystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v32 = *(_OWORD *)&a5->var0.var3;
          *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
          v33 = *(_OWORD *)&a5->var1.var1;
          *(_OWORD *)&range.start.epoch = v32;
          *(_OWORD *)&range.duration.timescale = v33;
          CMTimeRangeGetEnd(&v42, &range);
          NSStringFromCMTime(&v42);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[PTCinematographyScript timeRange](self, "timeRange");
          CMTimeRangeGetEnd(&v41, &v40);
          NSStringFromCMTime(&v41);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)MEMORY[0x1E0CB37E8];
          -[PTCinematographyScript frames](self, "frames");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "numberWithUnsignedInteger:", objc_msgSend(v38, "count"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(range.start.value) = 138413058;
          *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)v34;
          LOWORD(range.start.flags) = 2112;
          *(_QWORD *)((char *)&range.start.flags + 2) = v35;
          HIWORD(range.start.epoch) = 2112;
          range.duration.value = (CMTimeValue)v36;
          LOWORD(range.duration.timescale) = 2112;
          *(_QWORD *)((char *)&range.duration.timescale + 2) = v39;
          _os_log_error_impl(&dword_1C9281000, v24, OS_LOG_TYPE_ERROR, "error: endingDecision at %@ (%@) past end of frames at %@ (%@)", (uint8_t *)&range, 0x2Au);

        }
      }
      else
      {
        -[PTCinematographyScript frames](self, "frames");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "detectionForTrackIdentifier:", v11);
        v24 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "transition");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(_OWORD *)&a5->var0.var3;
        *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
        v27 = *(_OWORD *)&a5->var1.var1;
        *(_OWORD *)&range.start.epoch = v26;
        *(_OWORD *)&range.duration.timescale = v27;
        -[PTCinematographyScript _updateFramesInTimeRange:forTransition:fromDetection:toDetection:](self, "_updateFramesInTimeRange:forTransition:fromDetection:toDetection:", &range, v25, v18, v24);

      }
    }
    else
    {
      _PTLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[PTCinematographyScript _updateFramesForTransitionFromDecision:toDecision:timeRange:].cold.1();
    }

  }
  else
  {
    _PTLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
      range.start.epoch = a5->var0.var3;
      NSStringFromCMTime(&range.start);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
      v30 = *(_OWORD *)&a5->var1.var1;
      *(_OWORD *)&range.start.epoch = v29;
      *(_OWORD *)&range.duration.timescale = v30;
      CMTimeRangeGetEnd(&v43, &range);
      NSStringFromCMTime(&v43);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(range.start.value) = 138413058;
      *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)v8;
      LOWORD(range.start.flags) = 2112;
      *(_QWORD *)((char *)&range.start.flags + 2) = v9;
      HIWORD(range.start.epoch) = 2112;
      range.duration.value = (CMTimeValue)v28;
      LOWORD(range.duration.timescale) = 2112;
      *(_QWORD *)((char *)&range.duration.timescale + 2) = v31;
      _os_log_error_impl(&dword_1C9281000, v18, OS_LOG_TYPE_ERROR, "error: no frames in transition from %@ to %@ time range %@ to %@", (uint8_t *)&range, 0x2Au);

    }
  }

}

- (id)_latestDetectionOfTrackIdentifier:(int64_t)a3 atOrBeforeFrameIndex:(unint64_t)a4 timeLimit:(id *)a5
{
  CMTime *v5;
  unsigned int var2;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  int v25;
  CMTime lhs;
  CMTime v27;
  CMTime rhs;
  __CFString *v29;
  uint64_t v30;

  v5 = (CMTime *)a5;
  v30 = *MEMORY[0x1E0C80C00];
  var2 = a5->var2;
  -[PTCinematographyScript frames](self, "frames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "detectionForTrackIdentifier:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v25 = var2 & 0x1D;
    if (v25 == 1)
    {
      -[PTCinematographyScript frames](self, "frames");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v11, "time");
      else
        memset(&lhs, 0, sizeof(lhs));
      rhs = *v5;
      CMTimeSubtract(&v27, &lhs, &rhs);
      v14 = objc_msgSend(v13, "_firstIndexAtOrAfterTime:", &v27);

    }
    else
    {
      v14 = 0;
    }
    v15 = a4 - 1;
    while (v15 >= v14)
    {
      -[PTCinematographyScript frames](self, "frames");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "detectionForTrackIdentifier:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      --v15;
      if (v12)
        goto LABEL_14;
    }
    _PTLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25 == 1)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        rhs = *v5;
        NSStringFromCMTime(&rhs);
        v5 = (CMTime *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR(" within %@"), v5);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = &stru_1E822B200;
      }
      LODWORD(rhs.value) = 138412802;
      *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)v21;
      LOWORD(rhs.flags) = 2112;
      *(_QWORD *)((char *)&rhs.flags + 2) = v22;
      HIWORD(rhs.epoch) = 2112;
      v29 = v24;
      _os_log_error_impl(&dword_1C9281000, v18, OS_LOG_TYPE_ERROR, "cannot find detections of track %@ at or before index %@%@", (uint8_t *)&rhs, 0x20u);
      if (v25 == 1)
      {

      }
    }

    v12 = 0;
  }
LABEL_14:
  v19 = v12;

  return v19;
}

- (id)_latestDetectionOfGroupIdentifier:(int64_t)a3 atOrBeforeFrameIndex:(unint64_t)a4 timeLimit:(id *)a5
{
  CMTime *v5;
  unsigned int var2;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  int v25;
  CMTime lhs;
  CMTime v27;
  CMTime rhs;
  __CFString *v29;
  uint64_t v30;

  v5 = (CMTime *)a5;
  v30 = *MEMORY[0x1E0C80C00];
  var2 = a5->var2;
  -[PTCinematographyScript frames](self, "frames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "bestDetectionForGroupIdentifier:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v25 = var2 & 0x1D;
    if (v25 == 1)
    {
      -[PTCinematographyScript frames](self, "frames");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v11, "time");
      else
        memset(&lhs, 0, sizeof(lhs));
      rhs = *v5;
      CMTimeSubtract(&v27, &lhs, &rhs);
      v14 = objc_msgSend(v13, "_firstIndexAtOrAfterTime:", &v27);

    }
    else
    {
      v14 = 0;
    }
    v15 = a4 - 1;
    while (v15 >= v14)
    {
      -[PTCinematographyScript frames](self, "frames");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bestDetectionForGroupIdentifier:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      --v15;
      if (v12)
        goto LABEL_14;
    }
    _PTLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25 == 1)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        rhs = *v5;
        NSStringFromCMTime(&rhs);
        v5 = (CMTime *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR(" within %@"), v5);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = &stru_1E822B200;
      }
      LODWORD(rhs.value) = 138412802;
      *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)v21;
      LOWORD(rhs.flags) = 2112;
      *(_QWORD *)((char *)&rhs.flags + 2) = v22;
      HIWORD(rhs.epoch) = 2112;
      v29 = v24;
      _os_log_error_impl(&dword_1C9281000, v18, OS_LOG_TYPE_ERROR, "cannot find detections of group %@ at or before index %@%@", (uint8_t *)&rhs, 0x20u);
      if (v25 == 1)
      {

      }
    }

    v12 = 0;
  }
LABEL_14:
  v19 = v12;

  return v19;
}

- (void)_updateFramesInTimeRange:(id *)a3 toFocusOnTrackIdentifier:(unint64_t)a4
{
  void *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[3];

  -[PTCinematographyScript frames](self, "frames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a3->var0.var3;
  v12[0] = *(_OWORD *)&a3->var0.var0;
  v12[1] = v8;
  v12[2] = *(_OWORD *)&a3->var1.var1;
  v9 = objc_msgSend(v7, "_indexRangeOfTimeRange:", v12);
  v11 = v10;

  -[PTCinematographyScript _updateFramesInIndexRange:toFocusOnTrackIdentifier:](self, "_updateFramesInIndexRange:toFocusOnTrackIdentifier:", v9, v11, a4);
}

- (void)_updateFramesInIndexRange:(_NSRange)a3 forTransition:(id)a4 fromDetection:(id)a5 toDetection:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  void *v14;
  CMTimeRange v15;
  CMTime end;
  CMTime start;
  CMTimeRange v18;

  length = a3.length;
  location = a3.location;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  memset(&v18, 0, sizeof(v18));
  if (!v12)
  {
    memset(&start, 0, sizeof(start));
    if (v13)
      goto LABEL_3;
LABEL_5:
    memset(&end, 0, sizeof(end));
    goto LABEL_6;
  }
  objc_msgSend(v12, "time");
  if (!v14)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v14, "time");
LABEL_6:
  CMTimeRangeFromTimeToTime(&v18, &start, &end);
  v15 = v18;
  -[PTCinematographyScript _updateFramesInIndexRange:forTransition:fromDetection:toDetection:overTimeRange:](self, "_updateFramesInIndexRange:forTransition:fromDetection:toDetection:overTimeRange:", location, length, v11, v12, v14, &v15);

}

- (void)_updateFramesInTimeRange:(id *)a3 forTransition:(id)a4 fromDetection:(id)a5 toDetection:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[PTCinematographyScript frames](self, "frames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)&a3->var0.var3;
  v19 = *(_OWORD *)&a3->var0.var0;
  v20 = v14;
  v21 = *(_OWORD *)&a3->var1.var1;
  v15 = objc_msgSend(v13, "_indexRangeOfTimeRange:", &v19);
  v17 = v16;

  v18 = *(_OWORD *)&a3->var0.var3;
  v19 = *(_OWORD *)&a3->var0.var0;
  v20 = v18;
  v21 = *(_OWORD *)&a3->var1.var1;
  -[PTCinematographyScript _updateFramesInIndexRange:forTransition:fromDetection:toDetection:overTimeRange:](self, "_updateFramesInIndexRange:forTransition:fromDetection:toDetection:overTimeRange:", v15, v17, v12, v11, v10, &v19);

}

- (void)_updateFramesInIndexRange:(_NSRange)a3 toFocusOnTrackIdentifier:(int64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  NSObject *v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  PTCinematographyTransition *v16;
  void *v17;
  id v18;
  _BYTE v19[24];
  int64_t v20;
  uint64_t v21;

  length = a3.length;
  location = a3.location;
  v21 = *MEMORY[0x1E0C80C00];
  _PTLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = location + length;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v19 = 134218496;
    *(_QWORD *)&v19[4] = location;
    *(_WORD *)&v19[12] = 2048;
    *(_QWORD *)&v19[14] = location + length;
    *(_WORD *)&v19[22] = 2048;
    v20 = a4;
    _os_log_debug_impl(&dword_1C9281000, v8, OS_LOG_TYPE_DEBUG, "updating frames %lu to %lu to focus on track %lu", v19, 0x20u);
  }

  *(_OWORD *)v19 = *MEMORY[0x1E0CA2E30];
  *(_QWORD *)&v19[16] = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  -[PTCinematographyScript _latestDetectionOfTrackIdentifier:atOrBeforeFrameIndex:timeLimit:](self, "_latestDetectionOfTrackIdentifier:atOrBeforeFrameIndex:timeLimit:", a4, location, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyScript focusPuller](self, "focusPuller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reset");

  if (location < v9)
  {
    v12 = location;
    do
    {
      -[PTCinematographyScript frames](self, "frames");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "detectionForTrackIdentifier:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        if (v10 && location + 1 < v12)
        {
          v16 = -[PTCinematographyTransition initWithKind:]([PTCinematographyTransition alloc], "initWithKind:", 1);
          -[PTCinematographyScript _updateFramesInIndexRange:forTransition:fromDetection:toDetection:](self, "_updateFramesInIndexRange:forTransition:fromDetection:toDetection:", location, v12 - location, v16, v10, v15);

        }
        -[PTCinematographyScript focusPuller](self, "focusPuller");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "focusOnDetection:focusPuller:", v15, v17);

        v18 = v15;
        location = v12;
        v10 = v18;
      }

      ++v12;
    }
    while (v9 != v12);
  }
  if (location < v9 - 1)
    -[PTCinematographyScript _updateFramesInIndexRange:toFocusOnDetection:](self, "_updateFramesInIndexRange:toFocusOnDetection:", location, v9 - location, v10);

}

- (void)_updateFramesInIndexRange:(_NSRange)a3 toFocusOnDetection:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  id v9;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  if (location < location + length)
  {
    do
    {
      -[PTCinematographyScript frames](self, "frames");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", location);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "focusOnDetection:", v9);
      ++location;
      --length;
    }
    while (length);
  }

}

- (void)_updateFramesInIndexRange:(_NSRange)a3 forTransition:(id)a4 fromDetection:(id)a5 toDetection:(id)a6 overTimeRange:(id *)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  float v23;
  float v24;
  float v25;
  float v26;
  __int128 v27;
  float v28;
  void *v29;
  void *v30;
  float Seconds;
  NSObject *v32;
  double v33;
  double v34;
  float v35;
  float v36;
  float v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  CMTime lhs;
  CMTime v53;
  CMTime time;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  length = a3.length;
  location = a3.location;
  v58 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_msgSend(v14, "trackIdentifier");
  v17 = objc_msgSend(v15, "trackIdentifier");
  _PTLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (v16 == v17)
  {
    if (!v19)
      goto LABEL_5;
    LODWORD(time.value) = 134218496;
    *(CMTimeValue *)((char *)&time.value + 4) = location;
    LOWORD(time.flags) = 2048;
    *(_QWORD *)((char *)&time.flags + 2) = length + location - 1;
    HIWORD(time.epoch) = 2048;
    v55 = objc_msgSend(v14, "trackIdentifier");
    v20 = "updating frames %lu thru %lu to fill in gap in track %lu";
    v21 = v18;
    v22 = 32;
  }
  else
  {
    if (!v19)
      goto LABEL_5;
    LODWORD(time.value) = 134218752;
    *(CMTimeValue *)((char *)&time.value + 4) = location;
    LOWORD(time.flags) = 2048;
    *(_QWORD *)((char *)&time.flags + 2) = length + location - 1;
    HIWORD(time.epoch) = 2048;
    v55 = objc_msgSend(v14, "trackIdentifier");
    v56 = 2048;
    v57 = objc_msgSend(v15, "trackIdentifier");
    v20 = "updating frames %lu thru %lu to rack focus from track %lu to track %lu";
    v21 = v18;
    v22 = 42;
  }
  _os_log_debug_impl(&dword_1C9281000, v21, OS_LOG_TYPE_DEBUG, v20, (uint8_t *)&time, v22);
LABEL_5:

  objc_msgSend(v14, "focusDistance");
  v24 = v23;
  objc_msgSend(v15, "focusDistance");
  v26 = v25;
  time = (CMTime)a7->var1;
  *(double *)&v27 = CMTimeGetSeconds(&time);
  if (location < location + length)
  {
    v28 = *(double *)&v27;
    *(_QWORD *)&v27 = 134218242;
    v47 = v27;
    do
    {
      -[PTCinematographyScript frames](self, "frames", v47);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", location);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        objc_msgSend(v30, "time");
      else
        memset(&lhs, 0, sizeof(lhs));
      time = (CMTime)a7->var0;
      CMTimeSubtract(&v53, &lhs, &time);
      Seconds = CMTimeGetSeconds(&v53);
      _PTLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(float *)&v33 = Seconds / v28;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time.value) = v47;
        *(CMTimeValue *)((char *)&time.value + 4) = location;
        LOWORD(time.flags) = 2112;
        *(_QWORD *)((char *)&time.flags + 2) = v46;
        _os_log_debug_impl(&dword_1C9281000, v32, OS_LOG_TYPE_DEBUG, "frame %lu: normalizedTime: %@", (uint8_t *)&time, 0x16u);

      }
      *(float *)&v34 = Seconds / v28;
      objc_msgSend(v13, "coefficientForNormalizedTime:", v34);
      v36 = v35;
      v37 = (float)(v26 * v35) + (float)((float)(1.0 - v35) * v24);
      v38 = objc_msgSend(v14, "trackIdentifier");
      if (v38 == objc_msgSend(v15, "trackIdentifier"))
      {
        v44 = (void *)objc_msgSend(v14, "copy");
        if (v30)
        {
          objc_msgSend(v30, "time");
        }
        else
        {
          v50 = 0uLL;
          v51 = 0;
        }
        v48 = v50;
        v49 = v51;
        objc_msgSend(v44, "setTime:", &v48);
        *(float *)&v45 = v37;
        objc_msgSend(v44, "setFocusDistance:", v45);
        objc_msgSend(v30, "focusOnDetection:", v44);

      }
      else
      {
        *(float *)&v39 = v37;
        *(float *)&v40 = v37;
        *(float *)&v41 = v36;
        *(float *)&v42 = Seconds;
        *(float *)&v43 = v28;
        objc_msgSend(v30, "_focusFromDetection:toDetection:rawFocusDistance:focusDistance:transitionCoefficient:elapsedTime:duration:", v14, v15, v39, v40, v41, v42, v43);
      }

      ++location;
      --length;
    }
    while (length);
  }

}

- (NSArray)trackDecisions
{
  NSArray *trackDecisions;
  NSArray *v4;
  NSArray *v5;

  trackDecisions = self->_trackDecisions;
  if (!trackDecisions)
  {
    -[PTCinematographyScript _calculateTrackDecisions](self, "_calculateTrackDecisions");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_trackDecisions;
    self->_trackDecisions = v4;

    trackDecisions = self->_trackDecisions;
  }
  return trackDecisions;
}

- (id)_trackDecisionsInTimeRange:(id *)a3
{
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _OWORD v13[3];

  -[PTCinematographyScript trackDecisions](self, "trackDecisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  v7 = objc_msgSend(v5, "_indexRangeOfTimeRange:", v13);
  v9 = v8;

  if (!v9)
    return MEMORY[0x1E0C9AA60];
  -[PTCinematographyScript trackDecisions](self, "trackDecisions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subarrayWithRange:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_invalidateTrackDecisions
{
  NSArray *trackDecisions;

  trackDecisions = self->_trackDecisions;
  self->_trackDecisions = 0;

}

- (id)_calculateTrackDecisions
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;

  v3 = (void *)objc_opt_new();
  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v8, "isGroupDecision") & 1) != 0)
      {
        -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 >= objc_msgSend(v9, "count") - 1)
        {
          v11 = 0;
        }
        else
        {
          -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", v6 + 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        -[PTCinematographyScript _addGroupDecision:toTrackDecisions:nextDecision:](self, "_addGroupDecision:toTrackDecisions:nextDecision:", v8, v3, v11);

      }
      else
      {
        -[PTCinematographyScript _addDecision:toTrackDecisions:](self, "_addDecision:toTrackDecisions:", v8, v3);
      }

      ++v6;
      -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

    }
    while (v6 < v13);
  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (void)_addGroupDecision:(id)a3 toTrackDecisions:(id)a4 nextDecision:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int32_t v15;
  void *v16;
  CMTime v17;
  CMTime time1;
  CMTimeRange start;
  CMTime end;
  CMTimeRange v21;
  CMTimeRange range;
  CMTime v23;
  __int128 v24;
  CMTimeEpoch v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PTCinematographyScript _existingGroupTrackForGroupIdentifier:](self, "_existingGroupTrackForGroupIdentifier:", objc_msgSend(v8, "groupIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0uLL;
  v25 = 0;
  if (v8)
    objc_msgSend(v8, "time");
  memset(&v23, 0, sizeof(v23));
  if (v10)
  {
    objc_msgSend(v10, "time");
  }
  else
  {
    -[PTCinematographyScript timeRange](self, "timeRange");
    CMTimeRangeGetEnd(&v23, &range);
  }
  memset(&v21, 0, sizeof(v21));
  *(_OWORD *)&start.start.value = v24;
  start.start.epoch = v25;
  end = v23;
  CMTimeRangeFromTimeToTime(&v21, &start.start, &end);
  start = v21;
  objc_msgSend(v11, "trackDecisionsInTimeRange:", &start);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "count"))
    goto LABEL_14;
  if (v8)
    objc_msgSend(v8, "time");
  else
    memset(&time1, 0, sizeof(time1));
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "time");
  else
    memset(&v17, 0, sizeof(v17));
  v15 = CMTimeCompare(&time1, &v17);

  if (v15 < 0)
  {
LABEL_14:
    objc_msgSend(v8, "_decisionByRemovingOptions:", 2, v17.value, *(_QWORD *)&v17.timescale, v17.epoch, time1.value, *(_QWORD *)&time1.timescale, time1.epoch);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyScript _addDecision:toTrackDecisions:](self, "_addDecision:toTrackDecisions:", v16, v9);

  }
  -[PTCinematographyScript _addDecisions:toTrackDecisions:](self, "_addDecisions:toTrackDecisions:", v12, v9, v17.value, *(_QWORD *)&v17.timescale, v17.epoch);

}

- (void)_addDecision:(id)a3 toTrackDecisions:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[PTCinematographyScript _shouldAddTrackDecision:afterDecision:](self, "_shouldAddTrackDecision:afterDecision:", v8, v7);

  if ((_DWORD)self)
    objc_msgSend(v6, "addObject:", v8);

}

- (void)_addDecisions:(id)a3 toTrackDecisions:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (objc_msgSend(v12, "count"))
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PTCinematographyScript _shouldAddTrackDecision:afterDecision:](self, "_shouldAddTrackDecision:afterDecision:", v8, v9);

      if (v10)
        break;
      if (++v7 >= (unint64_t)objc_msgSend(v12, "count"))
        goto LABEL_7;
    }
    objc_msgSend(v12, "subarrayWithRange:", v7, objc_msgSend(v12, "count") - v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v11);

  }
LABEL_7:

}

- (BOOL)_shouldAddTrackDecision:(id)a3 afterDecision:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  if (!a4)
    return 1;
  v5 = a4;
  v6 = objc_msgSend(a3, "trackIdentifier");
  v7 = objc_msgSend(v5, "trackIdentifier");

  return v6 != v7;
}

- (id)_existingGroupTrackForGroupIdentifier:(int64_t)a3
{
  void *v3;
  id v4;

  -[PTCinematographyScript trackForGroupIdentifier:](self, "trackForGroupIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)decisionAfterTime:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int32_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  CMTime time1;
  CMTime time2;

  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0;
  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  time2 = (CMTime)*a3;
  v8 = objc_msgSend(v7, "_indexNearestTime:", &time2);

  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "time");
  else
    memset(&time1, 0, sizeof(time1));
  time2 = (CMTime)*a3;
  v12 = CMTimeCompare(&time1, &time2);

  v13 = v12 >= 1 ? v8 : v8 + 1;
  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v13 >= v15)
    return 0;
  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)decisionBeforeTime:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int32_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CMTime time1;
  CMTime time2;

  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0;
  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  time2 = (CMTime)*a3;
  v8 = objc_msgSend(v7, "_indexNearestTime:", &time2);

  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "time");
  else
    memset(&time1, 0, sizeof(time1));
  time2 = (CMTime)*a3;
  v12 = CMTimeCompare(&time1, &time2);

  v13 = v8 - (v12 >= 0);
  if (v13 < 0)
    return 0;
  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)decisionNearestTime:(id *)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *a3;
  v6 = objc_msgSend(v5, "_indexNearestTime:", &v12);

  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
    return 0;
  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)decisionsInTimeRange:(id *)a3
{
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _OWORD v13[3];

  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  v7 = objc_msgSend(v5, "_indexRangeOfTimeRange:", v13);
  v9 = v8;

  if (!v9)
    return MEMORY[0x1E0C9AA60];
  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subarrayWithRange:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)primaryDecisionAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  -[PTCinematographyScript decisionAtOrBeforeTime:](self, "decisionAtOrBeforeTime:", &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)secondaryDecisionAtTime:(id *)a3
{
  void *v5;
  CMTime v7;
  CMTime time1;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v9 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&v10 = a3->var3;
  -[PTCinematographyScript decisionAfterTime:](self, "decisionAfterTime:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
    -[PTCinematographyScript timeRangeOfTransitionBeforeDecision:](self, "timeRangeOfTransitionBeforeDecision:", v5);
    time1 = (CMTime)*a3;
    *(_OWORD *)&v7.value = v9;
    v7.epoch = v10;
    if (CMTimeCompare(&time1, &v7) <= 0)
    {

      v5 = 0;
    }
  }
  return v5;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeOfTransitionAfterDecision:(SEL)a3
{
  id v5;
  void *v6;
  void *v7;
  $69C59A32909E13F94AB58097350E6BB9 *result;
  _QWORD v9[3];

  v5 = a4;
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "time");
  else
    memset(v9, 0, sizeof(v9));
  -[PTCinematographyScript decisionAfterTime:](self, "decisionAfterTime:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyScript _timeRangeOfTransitionfromDecision:toDecision:](self, "_timeRangeOfTransitionfromDecision:toDecision:", v6, v7);

  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeOfTransitionBeforeDecision:(SEL)a3
{
  id v5;
  void *v6;
  void *v7;
  $69C59A32909E13F94AB58097350E6BB9 *result;
  _QWORD v9[3];

  v5 = a4;
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "time");
  else
    memset(v9, 0, sizeof(v9));
  -[PTCinematographyScript decisionBeforeTime:](self, "decisionBeforeTime:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyScript _timeRangeOfTransitionfromDecision:toDecision:](self, "_timeRangeOfTransitionfromDecision:toDecision:", v7, v6);

  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)_timeRangeOfTransitionfromDecision:(SEL)a3 toDecision:(id)a4
{
  return -[PTCinematographyScript _timeRangeOfTransitionfromDecision:toDecision:didShortenTransition:](self, "_timeRangeOfTransitionfromDecision:toDecision:didShortenTransition:", a4, a5, 0);
}

- ($69C59A32909E13F94AB58097350E6BB9)_timeRangeOfTransitionfromDecision:(SEL)a3 toDecision:(id)a4 didShortenTransition:(id)a5
{
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  __int128 v15;
  PTCinematographyFocusFrames *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  __int128 v24;
  $69C59A32909E13F94AB58097350E6BB9 *result;
  CMTime v26;
  CMTime end;
  CMTimeRange time1;
  CMTime time2;
  _BYTE v30[56];

  v10 = a4;
  v11 = a5;
  v12 = v11;
  LOBYTE(v13) = 0;
  v14 = MEMORY[0x1E0CA2E50];
  v15 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E50];
  *(_OWORD *)&retstr->var0.var3 = v15;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v14 + 32);
  if (v10 && v11)
  {
    memset(&v30[24], 0, 24);
    if (-[PTCinematographyScript _useFixedTransition](self, "_useFixedTransition"))
    {
      -[PTCinematographyScript _startTimeOfFixedTransitionToDecision:](self, "_startTimeOfFixedTransitionToDecision:", v12);
    }
    else
    {
      v16 = -[PTCinematographyFocusFrames initWithFrames:options:]([PTCinematographyFocusFrames alloc], "initWithFrames:options:", self->_frames, self->_focusFramesOptions);
      -[PTCinematographyScript frames](self, "frames");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "time");
      v18 = objc_msgSend(v17, "_indexNearestTime:", v30);

      v19 = -[PTCinematographyFocusFrames startIndexForLinearRackFocusPullToFrameAtIndex:](v16, "startIndexForLinearRackFocusPullToFrameAtIndex:", v18);
      -[PTCinematographyScript frames](self, "frames");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
        objc_msgSend(v21, "time");
      else
        memset(&time1, 0, 24);
      *(CMTime *)&v30[24] = time1.start;

    }
    objc_msgSend(v10, "time");
    time1.start = *(CMTime *)&v30[24];
    v23 = CMTimeCompare(&time1.start, &time2);
    v13 = v23 >> 31;
    if ((v23 & 0x80000000) != 0)
    {
      objc_msgSend(v10, "time");
      *(CMTime *)&v30[24] = time1.start;
    }
    objc_msgSend(v12, "time");
    v26 = *(CMTime *)&v30[24];
    CMTimeRangeFromTimeToTime(&time1, &v26, &end);
    v24 = *(_OWORD *)&time1.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&time1.start.value;
    *(_OWORD *)&retstr->var0.var3 = v24;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&time1.duration.timescale;
  }
  if (a6)
    *a6 = v13;

  return result;
}

- (BOOL)_useFixedTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  CMTime v9;
  CMTime time1;

  -[PTCinematographyScript focusFramesOptions](self, "focusFramesOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "minimumRackFocusPullTime");
  else
    memset(&time1, 0, sizeof(time1));
  -[PTCinematographyScript focusFramesOptions](self, "focusFramesOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "maximumRackFocusPullTime");
  else
    memset(&v9, 0, sizeof(v9));
  v7 = CMTimeCompare(&time1, &v9) == 0;

  return v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_startTimeOfFixedTransitionToDecision:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v10;
  CMTime lhs;
  CMTime v12;

  v6 = a4;
  memset(&v12, 0, sizeof(v12));
  -[PTCinematographyScript focusFramesOptions](self, "focusFramesOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "minimumRackFocusPullTime");
  else
    memset(&v12, 0, sizeof(v12));

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  if (v6)
    objc_msgSend(v6, "time");
  else
    memset(&lhs, 0, sizeof(lhs));
  v10 = v12;
  CMTimeSubtract((CMTime *)retstr, &lhs, &v10);

  return result;
}

- (id)decisionAtOrBeforeTime:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  __int128 v12;
  int64_t var3;

  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0;
  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v8 = objc_msgSend(v7, "_indexAtOrBeforeTime:", &v12);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)userDecisionsInTimeRange:(id *)a3
{
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _OWORD v13[3];

  -[PTCinematographyScript userDecisions](self, "userDecisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  v7 = objc_msgSend(v5, "_indexRangeOfTimeRange:", v13);
  v9 = v8;

  if (!v9)
    return MEMORY[0x1E0C9AA60];
  -[PTCinematographyScript userDecisions](self, "userDecisions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subarrayWithRange:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)baseDecisionsInTimeRange:(id *)a3
{
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _OWORD v13[3];

  -[PTCinematographyScript baseDecisions](self, "baseDecisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  v7 = objc_msgSend(v5, "_indexRangeOfTimeRange:", v13);
  v9 = v8;

  if (!v9)
    return MEMORY[0x1E0C9AA60];
  -[PTCinematographyScript baseDecisions](self, "baseDecisions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subarrayWithRange:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_internalizeBaseDecisionsFromFrames:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  PTCinematographyDecision *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  PTCinematographyScript *v24;
  void *v25;
  id obj;
  _QWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  NSObject *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v5)
  {
    v6 = v5;
    v24 = self;
    v7 = 0;
    v8 = *(_QWORD *)v29;
    v9 = 1;
    v10 = -1;
    while (1)
    {
      v11 = 0;
      do
      {
        v12 = v9;
        v13 = v7;
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
        v9 = objc_msgSend(v14, "isInTransition");
        v15 = objc_msgSend(v14, "focusTrackIdentifier");
        objc_msgSend(v14, "baseFocusTrackNumber");
        v16 = objc_claimAutoreleasedReturnValue();
        v7 = v16;
        if (v16)
        {
          if (v13)
          {
            v10 = v15;
            if ((-[NSObject isEqualToNumber:](v16, "isEqualToNumber:", v13) & 1) != 0)
              goto LABEL_22;
          }
          v10 = -[NSObject integerValue](v7, "integerValue");
        }
        else
        {
          v17 = v15 != v10;
          if ((v9 & 1) != 0)
          {
            v10 = v15;
            goto LABEL_22;
          }
          v10 = v15;
          if (((v12 | v17) & 1) == 0)
            goto LABEL_22;
        }
        objc_msgSend(v14, "detectionForTrackNumber:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = [PTCinematographyDecision alloc];
          if (v14)
            objc_msgSend(v14, "time");
          else
            memset(v27, 0, sizeof(v27));
          v20 = -[PTCinematographyDecision initWithTime:trackIdentifier:](v19, "initWithTime:trackIdentifier:", v27, v10);
          -[NSObject setType:](v20, "setType:", 0);
          -[NSObject setGroupIdentifier:](v20, "setGroupIdentifier:", objc_msgSend(v18, "groupIdentifier"));
          _PTLogSystem();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v20;
            _os_log_debug_impl(&dword_1C9281000, v21, OS_LOG_TYPE_DEBUG, "internalizing base decision %@", buf, 0xCu);
          }

          objc_msgSend(v25, "addObject:", v20);
        }
        else
        {
          _PTLogSystem();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v33 = v7;
            v34 = 2112;
            v35 = v14;
            _os_log_error_impl(&dword_1C9281000, v20, OS_LOG_TYPE_ERROR, "baseFocusTrackNumber %@ has no corresponding detection on frame %@. No base decision was added.", buf, 0x16u);
          }
        }

LABEL_22:
        ++v11;
      }
      while (v6 != v11);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      v6 = v22;
      if (!v22)
      {

        self = v24;
        break;
      }
    }
  }

  v23 = (void *)objc_msgSend(v25, "copy");
  -[PTCinematographyScript setBaseDecisions:](self, "setBaseDecisions:", v23);

}

- (NSArray)tracks
{
  void *v2;
  void *v3;

  -[PTCinematographyScript mutableTracks](self, "mutableTracks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)trackForIdentifier:(int64_t)a3
{
  NSMutableDictionary *trackForNumber;
  void *v4;
  void *v5;

  trackForNumber = self->_trackForNumber;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](trackForNumber, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)trackForGroupIdentifier:(int64_t)a3
{
  NSMutableDictionary *trackForGroupNumber;
  void *v4;
  void *v5;

  trackForGroupNumber = self->_trackForGroupNumber;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](trackForGroupNumber, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)trackForDecision:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  if (objc_msgSend(v4, "isGroupDecision"))
  {
    v5 = objc_msgSend(v4, "groupIdentifier");

    -[PTCinematographyScript trackForGroupIdentifier:](self, "trackForGroupIdentifier:", v5);
  }
  else
  {
    v6 = objc_msgSend(v4, "trackIdentifier");

    -[PTCinematographyScript trackForIdentifier:](self, "trackForIdentifier:", v6);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_trackAllocatorState
{
  return -[PTCinematographyTrackAllocator trackIdentifier](self->_trackAllocator, "trackIdentifier");
}

- (id)_userCreatedTracks
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PTCinematographyScript mutableTracks](self, "mutableTracks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isUserCreated"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (void)_reloadTrackAllocator
{
  PTCinematographyTrackAllocator *v3;
  PTCinematographyTrackAllocator *trackAllocator;

  v3 = -[PTCinematographyTrackAllocator initWithTrackIdentifier:]([PTCinematographyTrackAllocator alloc], "initWithTrackIdentifier:", self->_loadedTrackAllocatorState);
  trackAllocator = self->_trackAllocator;
  self->_trackAllocator = v3;

}

- (void)_internalizeTracksFromFrames:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v9, "allDetections", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j);
              v16 = -[PTCinematographyScript _internalizeTrackForDetection:](self, "_internalizeTrackForDetection:", v15);
              v17 = -[PTCinematographyScript _internalizeGroupTrackForDetection:](self, "_internalizeGroupTrackForDetection:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }
  self->_loadedTrackAllocatorState = -[PTCinematographyTrackAllocator trackIdentifier](self->_trackAllocator, "trackIdentifier");
  self->_didInternalizeTracks = 1;

}

- (void)_internalizeTracksFromChangesDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  PTCinematographyTrackAllocator *v12;
  PTCinematographyTrackAllocator *trackAllocator;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("user_tracks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = -[PTCinematographyTrack _initWithCinematographyDictionary:]([PTCinematographyTrack alloc], "_initWithCinematographyDictionary:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        -[PTCinematographyScript _addTrack:identifier:](self, "_addTrack:identifier:", v10, objc_msgSend(v10, "trackIdentifier"));
        -[PTCinematographyScript _internalizeDetectionsFromTrack:](self, "_internalizeDetectionsFromTrack:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("track_allocator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[PTCinematographyTrackAllocator _initWithCinematographyDictionary:]([PTCinematographyTrackAllocator alloc], "_initWithCinematographyDictionary:", v11);
    trackAllocator = self->_trackAllocator;
    self->_trackAllocator = v12;

  }
}

- (void)_internalizeDetectionsFromTrack:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PTCinematographyScript _addDetectionsFromCustomTrack:](self, "_addDetectionsFromCustomTrack:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PTCinematographyScript _addDetectionsFromFixedFocusTrack:](self, "_addDetectionsFromFixedFocusTrack:", v4);
    }
    else
    {
      _PTLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "debugTrackIdentifierString");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v6;
        _os_log_impl(&dword_1C9281000, v5, OS_LOG_TYPE_DEFAULT, "warning: unable to add detections from non-custom track %@", (uint8_t *)&v7, 0xCu);

      }
    }
  }

}

- (id)_internalizeTrackForDetection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "trackNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_6:
    -[PTCinematographyScript _internalizeTrackWithNumberFromDetection:](self, "_internalizeTrackWithNumberFromDetection:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v4, "focusIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _PTLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
      -[PTCinematographyScript _internalizeTrackForDetection:].cold.2();

    -[PTCinematographyScript _internalizeTrackNumberForFocusIdentifier:](self, "_internalizeTrackNumberForFocusIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTrackNumber:", v9);

    goto LABEL_6;
  }
  if (v8)
    -[PTCinematographyScript _internalizeTrackForDetection:].cold.1();

  v10 = 0;
LABEL_7:

  return v10;
}

- (id)_internalizeGroupTrackForDetection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((PTGroupIDIsInvalid(objc_msgSend(v4, "groupIdentifier")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[PTCinematographyScript _internalizeTrackWithGroupNumberFromDetection:](self, "_internalizeTrackWithGroupNumberFromDetection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_internalizeTrackWithNumberFromDetection:(id)a3
{
  id v4;
  NSMutableDictionary *trackForNumber;
  void *v6;
  PTCinematographyFixedFocusTrack *v7;

  v4 = a3;
  trackForNumber = self->_trackForNumber;
  objc_msgSend(v4, "trackNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](trackForNumber, "objectForKeyedSubscript:", v6);
  v7 = (PTCinematographyFixedFocusTrack *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (objc_msgSend(v4, "isFixedFocusDetection"))
    {
      v7 = -[PTCinematographyFixedFocusTrack initWithDetection:]([PTCinematographyFixedFocusTrack alloc], "initWithDetection:", v4);
      -[PTCinematographyTrack setUserCreated:](v7, "setUserCreated:", 0);
    }
    else
    {
      v7 = -[PTCinematographyExistingTrack initWithDetectionType:trackIdentifier:groupIdentifier:]([PTCinematographyExistingTrack alloc], "initWithDetectionType:trackIdentifier:groupIdentifier:", objc_msgSend(v4, "detectionType"), objc_msgSend(v4, "trackIdentifier"), objc_msgSend(v4, "groupIdentifier"));
    }
    -[PTCinematographyScript _addTrack:identifier:](self, "_addTrack:identifier:", v7, objc_msgSend(v4, "trackIdentifier"));
  }

  return v7;
}

- (id)_internalizeTrackWithGroupNumberFromDetection:(id)a3
{
  id v4;
  PTCinematographyExistingGroupTrack *v5;

  v4 = a3;
  -[PTCinematographyScript trackForGroupIdentifier:](self, "trackForGroupIdentifier:", objc_msgSend(v4, "groupIdentifier"));
  v5 = (PTCinematographyExistingGroupTrack *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[PTCinematographyExistingGroupTrack initWithDetectionType:groupIdentifier:]([PTCinematographyExistingGroupTrack alloc], "initWithDetectionType:groupIdentifier:", PTDetectionTypeParent(objc_msgSend(v4, "detectionType")), objc_msgSend(v4, "groupIdentifier"));
    -[PTCinematographyScript _addGroupTrack:](self, "_addGroupTrack:", v5);
  }

  return v5;
}

- (id)_internalizeTrackNumberForFocusIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_trackNumberForFocusIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PTCinematographyScript trackAllocatorForFocusIdentifier](self, "trackAllocatorForFocusIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "nextTrackIdentifier");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackNumberForFocusIdentifier, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (void)setFramesAreMutable:(BOOL)a3
{
  NSArray *frames;
  NSArray *v6;
  NSArray *v7;

  if (self->_framesAreMutable != a3)
  {
    frames = self->_frames;
    if (a3)
      v6 = (NSArray *)-[NSArray mutableCopy](frames, "mutableCopy");
    else
      v6 = (NSArray *)-[NSArray copy](frames, "copy");
    v7 = self->_frames;
    self->_frames = v6;

    self->_framesAreMutable = a3;
  }
}

- (void)addFrame:(id)a3
{
  id v4;

  v4 = a3;
  -[PTCinematographyScript setFramesAreMutable:](self, "setFramesAreMutable:", 1);
  -[NSArray addObject:](self->_frames, "addObject:", v4);

}

- (void)setBaseDecisionsAreMutable:(BOOL)a3
{
  NSArray *baseDecisions;
  NSArray *v6;
  NSArray *v7;

  if (self->_baseDecisionsAreMutable != a3)
  {
    baseDecisions = self->_baseDecisions;
    if (a3)
      v6 = (NSArray *)-[NSArray mutableCopy](baseDecisions, "mutableCopy");
    else
      v6 = (NSArray *)-[NSArray copy](baseDecisions, "copy");
    v7 = self->_baseDecisions;
    self->_baseDecisions = v6;

    self->_baseDecisionsAreMutable = a3;
  }
}

- (void)addBaseDecision:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setType:", 0);
  -[PTCinematographyScript setBaseDecisionsAreMutable:](self, "setBaseDecisionsAreMutable:", 1);
  -[NSArray addObject:](self->_baseDecisions, "addObject:", v4);

}

- (BOOL)focusOnTrackIdentifier:(int64_t)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  _BOOL4 v6;
  void *v9;
  PTCinematographyDecision *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  int64_t var3;

  if ((a4->var2 & 0x1D) != 1)
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTCinematographyScript focusOnTrackIdentifier:atTime:strong:].cold.2((uint64_t)a4, v11);
    goto LABEL_8;
  }
  v6 = a5;
  -[PTCinematographyScript trackForIdentifier:](self, "trackForIdentifier:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTCinematographyScript focusOnTrackIdentifier:atTime:strong:].cold.1();
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v10 = [PTCinematographyDecision alloc];
  v15 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v11 = -[PTCinematographyDecision initWithTime:trackIdentifier:options:](v10, "initWithTime:trackIdentifier:options:", &v15, a3, v6);
  -[PTCinematographyScript trackForIdentifier:](self, "trackForIdentifier:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setGroupIdentifier:](v11, "setGroupIdentifier:", objc_msgSend(v12, "groupIdentifier"));

  v13 = -[PTCinematographyScript addUserDecision:](self, "addUserDecision:", v11);
LABEL_9:

  return v13;
}

- (BOOL)focusOnGroupIdentifier:(int64_t)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  uint64_t v8;
  PTCinematographyDecision *v9;
  NSObject *v10;
  BOOL v11;
  __int128 v13;
  int64_t var3;

  if ((a4->var2 & 0x1D) == 1)
  {
    v8 = a5 | 2;
    v9 = [PTCinematographyDecision alloc];
    v13 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v10 = -[PTCinematographyDecision initWithTime:groupIdentifier:options:](v9, "initWithTime:groupIdentifier:options:", &v13, a3, v8);
    v11 = -[PTCinematographyScript addUserDecision:](self, "addUserDecision:", v10);
  }
  else
  {
    _PTLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PTCinematographyScript focusOnGroupIdentifier:atTime:strong:].cold.1((uint64_t)a4, v10);
    v11 = 0;
  }

  return v11;
}

- (BOOL)focusOnDetection:(id)a3 strong:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  BOOL v8;
  _QWORD v10[3];

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "trackIdentifier");
  if (v6)
    objc_msgSend(v6, "time");
  else
    memset(v10, 0, sizeof(v10));
  v8 = -[PTCinematographyScript focusOnTrackIdentifier:atTime:strong:](self, "focusOnTrackIdentifier:atTime:strong:", v7, v10, v4);

  return v8;
}

- (BOOL)focusOnTrack:(id)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v5 = a5;
  v8 = objc_msgSend(a3, "trackIdentifier");
  v10 = *a4;
  return -[PTCinematographyScript focusOnTrackIdentifier:atTime:strong:](self, "focusOnTrackIdentifier:atTime:strong:", v8, &v10, v5);
}

- (id)_bestDetectionForGroupIdentifier:(int64_t)a3 time:(id *)a4
{
  void *v5;
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a4;
  -[PTCinematographyScript frameNearestTime:](self, "frameNearestTime:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bestDetectionForGroupIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)addUserDecision:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int32_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int32_t v19;
  void *v20;
  void *v21;
  _BYTE v23[48];
  CMTime v24;
  CMTime v25;
  _QWORD v26[3];
  CMTime time2;
  CMTime time1;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _PTLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v4;
    _os_log_impl(&dword_1C9281000, v5, OS_LOG_TYPE_INFO, "adding user decision %@", buf, 0xCu);
  }

  objc_msgSend(v4, "setType:", 1);
  v6 = -[PTCinematographyScript _resolveIfGroupDecision:](self, "_resolveIfGroupDecision:", v4);
  if (v6)
  {
    -[PTCinematographyScript userDecisions](self, "userDecisions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {

      goto LABEL_17;
    }
    -[PTCinematographyScript userDecisions](self, "userDecisions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "time");
      if (v4)
      {
LABEL_7:
        objc_msgSend(v4, "time");
        goto LABEL_14;
      }
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      if (v4)
        goto LABEL_7;
    }
    memset(&time2, 0, sizeof(time2));
LABEL_14:
    v12 = CMTimeCompare(&time1, &time2);

    if ((v12 & 0x80000000) == 0)
    {
      -[PTCinematographyScript userDecisions](self, "userDecisions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        objc_msgSend(v4, "time");
      else
        memset(v26, 0, sizeof(v26));
      v15 = objc_msgSend(v13, "_firstIndexAtOrAfterTime:", v26);

      -[PTCinematographyScript userDecisions](self, "userDecisions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "time");
        if (v4)
        {
LABEL_21:
          objc_msgSend(v4, "time");
LABEL_24:
          v19 = CMTimeCompare(&v25, &v24);

          if (!v19)
          {
            -[PTCinematographyScript userDecisions](self, "userDecisions");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", v15);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PTCinematographyScript _removeUserDecision:](self, "_removeUserDecision:", v21);

          }
          -[PTCinematographyScript userDecisions](self, "userDecisions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "insertObject:atIndex:", v4, v15);
          goto LABEL_27;
        }
      }
      else
      {
        memset(&v25, 0, sizeof(v25));
        if (v4)
          goto LABEL_21;
      }
      memset(&v24, 0, sizeof(v24));
      goto LABEL_24;
    }
LABEL_17:
    -[PTCinematographyScript userDecisions](self, "userDecisions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v4);
LABEL_27:

    -[PTCinematographyScript timeRange](self, "timeRange");
    -[PTCinematographyScript _updateDecisionsAndFramesInTimeRange:](self, "_updateDecisionsAndFramesInTimeRange:", v23);
    goto LABEL_28;
  }
  _PTLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[PTCinematographyScript addUserDecision:].cold.1();

LABEL_28:
  return v6;
}

- (BOOL)removeUserDecision:(id)a3
{
  _BOOL4 v4;
  uint64_t v6;

  v4 = -[PTCinematographyScript _removeUserDecision:](self, "_removeUserDecision:", a3);
  if (v4)
  {
    -[PTCinematographyScript timeRange](self, "timeRange");
    -[PTCinematographyScript _updateDecisionsAndFramesInTimeRange:](self, "_updateDecisionsAndFramesInTimeRange:", &v6);
  }
  return v4;
}

- (BOOL)removeAllUserDecisions
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v9;
  uint8_t buf[16];

  _PTLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  _PTLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyScript removeAllUserDecisions].cold.1(self);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9281000, v6, OS_LOG_TYPE_INFO, "removing all user decisions", buf, 2u);
  }

  -[PTCinematographyScript userDecisions](self, "userDecisions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[PTCinematographyScript timeRange](self, "timeRange");
  -[PTCinematographyScript _updateDecisionsAndFramesInTimeRange:](self, "_updateDecisionsAndFramesInTimeRange:", &v9);
  return 1;
}

- (BOOL)_removeUserDecision:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  _QWORD v15[3];
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _PTLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_1C9281000, v5, OS_LOG_TYPE_INFO, "removing user decision %@", buf, 0xCu);
  }

  if ((objc_msgSend(v4, "isUserDecision") & 1) == 0)
  {
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PTCinematographyScript _removeUserDecision:].cold.2();
    goto LABEL_15;
  }
  -[PTCinematographyScript userDecisions](self, "userDecisions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v4, "time");
  else
    memset(v15, 0, sizeof(v15));
  v8 = objc_msgSend(v6, "_indexNearestTime:", v15);

  -[PTCinematographyScript userDecisions](self, "userDecisions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 >= objc_msgSend(v9, "count"))
  {

LABEL_13:
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PTCinematographyScript _removeUserDecision:].cold.1();
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  -[PTCinematographyScript userDecisions](self, "userDecisions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v4);

  if ((v12 & 1) == 0)
    goto LABEL_13;
  -[PTCinematographyScript userDecisions](self, "userDecisions");
  v7 = objc_claimAutoreleasedReturnValue();
  -[NSObject removeObjectAtIndex:](v7, "removeObjectAtIndex:", v8);
  v13 = 1;
LABEL_16:

  return v13;
}

- (BOOL)_resolveIfGroupDecision:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v4 = a3;
  if (!objc_msgSend(v4, "isGroupDecision")
    || (objc_msgSend(v4, "trackIdentifier") & 0x8000000000000000) == 0)
  {
    goto LABEL_8;
  }
  v5 = objc_msgSend(v4, "groupIdentifier");
  if (v4)
    objc_msgSend(v4, "time");
  else
    memset(v9, 0, sizeof(v9));
  -[PTCinematographyScript _bestDetectionForGroupIdentifier:time:](self, "_bestDetectionForGroupIdentifier:time:", v5, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v4, "setTrackIdentifier:", objc_msgSend(v6, "trackIdentifier"));

LABEL_8:
    LOBYTE(v7) = 1;
  }

  return (char)v7;
}

- (void)_updateDecisionsAndFramesInTimeRange:(id *)a3
{
  __int128 v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  _BYTE v9[48];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v5 = *(_OWORD *)&a3->var0.var3;
  v10 = *(_OWORD *)&a3->var0.var0;
  v11 = v5;
  v12 = *(_OWORD *)&a3->var1.var1;
  -[PTCinematographyScript _updateEffectiveDecisionsInTimeRange:](self, "_updateEffectiveDecisionsInTimeRange:", &v10);
  -[PTCinematographyScript trackDecisions](self, "trackDecisions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a3->var0.var3;
  v10 = *(_OWORD *)&a3->var0.var0;
  v11 = v7;
  v12 = *(_OWORD *)&a3->var1.var1;
  -[PTCinematographyScript _updateFramesForDecisions:timeRange:](self, "_updateFramesForDecisions:timeRange:", v6, &v10);

  -[PTCinematographyScript timeRange](self, "timeRange");
  -[PTCinematographyScript _notifyDelegateOfChangesToDecisionsInTimeRange:](self, "_notifyDelegateOfChangesToDecisionsInTimeRange:", v9);
  -[PTCinematographyScript timeRange](self, "timeRange");
  -[PTCinematographyScript _notifyDelegateOfChangesToFramesInTimeRange:](self, "_notifyDelegateOfChangesToFramesInTimeRange:", &v8);
}

- (void)_updateEffectiveDecisionsInTimeRange:(id *)a3
{
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  void *v22;
  CMTime v23;
  CMTimeRange range;

  -[PTCinematographyScript baseDecisions](self, "baseDecisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v7 = objc_msgSend(v5, "_indexRangeOfTimeRange:", &range);
  v9 = v8;

  -[PTCinematographyScript userDecisions](self, "userDecisions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v11;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v12 = objc_msgSend(v10, "_indexRangeOfTimeRange:", &range);
  v14 = v13;

  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v16;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v17 = objc_msgSend(v15, "_indexRangeOfTimeRange:", &range);
  v19 = v18;

  v20 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v20;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v23, &range);
  -[PTCinematographyScript _effectiveDecisionsFromBaseDecisionsRange:userDecisionsRange:endTime:](self, "_effectiveDecisionsFromBaseDecisionsRange:userDecisionsRange:endTime:", v7, v9, v12, v14, &v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyScript effectiveDecisions](self, "effectiveDecisions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "replaceObjectsInRange:withObjectsFromArray:", v17, v19, v21);

  -[PTCinematographyScript _invalidateTrackDecisions](self, "_invalidateTrackDecisions");
}

- (id)_effectiveDecisionsFromBaseDecisionsRange:(_NSRange)a3 userDecisionsRange:(_NSRange)a4 endTime:(id *)a5
{
  void *v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  -[PTCinematographyScript _zipBaseDecisionsRange:userDecisionsRange:](self, "_zipBaseDecisionsRange:userDecisionsRange:", a3.location, a3.length, a4.location, a4.length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *a5;
  -[PTCinematographyScript _effectiveDecisionsFromZippedDecisions:endTime:](self, "_effectiveDecisionsFromZippedDecisions:endTime:", v7, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_zipBaseDecisionsRange:(_NSRange)a3 userDecisionsRange:(_NSRange)a4
{
  NSUInteger location;
  NSUInteger v5;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  NSUInteger v18;
  void *v19;
  void *v20;
  CMTime v22;
  CMTime time1;

  location = a4.location;
  v5 = a3.location;
  v7 = a3.location + a3.length;
  v8 = a4.location + a4.length;
  v9 = (void *)objc_opt_new();
  while (v5 < v7 && location < v8)
  {
    -[PTCinematographyScript baseDecisions](self, "baseDecisions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PTCinematographyScript userDecisions](self, "userDecisions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", location);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "time");
      if (v11)
        goto LABEL_6;
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      if (v11)
      {
LABEL_6:
        objc_msgSend(v11, "time", v22.value, *(_QWORD *)&v22.timescale, v22.epoch, time1.value, *(_QWORD *)&time1.timescale, time1.epoch);
        goto LABEL_9;
      }
    }
    memset(&v22, 0, sizeof(v22));
LABEL_9:
    if (CMTimeCompare(&time1, &v22) <= 0)
    {
      objc_msgSend(v9, "addObject:", v13);
      ++location;
    }
    else
    {
      objc_msgSend(v9, "addObject:", v11);
      ++v5;
    }

  }
  if (location < v8)
  {
    do
    {
      -[PTCinematographyScript userDecisions](self, "userDecisions", v22.value, *(_QWORD *)&v22.timescale, v22.epoch, time1.value, *(_QWORD *)&time1.timescale, time1.epoch);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = location + 1;
      objc_msgSend(v14, "objectAtIndexedSubscript:", location);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v16);

      location = v15;
    }
    while (v8 != v15);
  }
  if (v5 < v7)
  {
    do
    {
      -[PTCinematographyScript baseDecisions](self, "baseDecisions", v22.value, *(_QWORD *)&v22.timescale, v22.epoch);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v5 + 1;
      objc_msgSend(v17, "objectAtIndexedSubscript:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v19);

      v5 = v18;
    }
    while (v7 != v18);
  }
  v20 = (void *)objc_msgSend(v9, "copy", v22.value, *(_QWORD *)&v22.timescale, v22.epoch);

  return v20;
}

- (id)_effectiveDecisionsFromZippedDecisions:(id)a3 endTime:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  CMTimeEpoch v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  CMTime *v23;
  __int128 v24;
  CMTime v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  CMTime rhs;
  CMTime lhs;
  _QWORD v33[3];
  CMTime time1;
  CMTime time2;
  CMTime v36;
  CMTime v37;
  CMTime v38;

  v6 = a3;
  memset(&v38, 0, sizeof(v38));
  v7 = (void *)objc_opt_class();
  if (v7)
    objc_msgSend(v7, "defaultMinimumUserFocusDuration");
  else
    memset(&v38, 0, sizeof(v38));
  v8 = (void *)objc_opt_new();
  *(_OWORD *)&v37.value = *MEMORY[0x1E0CA2E18];
  v9 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v37.epoch = v9;
  v24 = *(_OWORD *)&v37.value;
  *(_OWORD *)&v36.value = *(_OWORD *)&v37.value;
  v36.epoch = v9;
  if (!objc_msgSend(v6, "count"))
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_46;
  }
  v23 = (CMTime *)a4;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  do
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v10 || !v11)
      goto LABEL_12;
    if (v13)
      objc_msgSend(v13, "time");
    else
      memset(&time2, 0, sizeof(time2));
    time1 = v37;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      time1 = v37;
      objc_msgSend(v10, "_decisionByChangingTime:", &time1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v18);

      *(_OWORD *)&v37.value = v24;
      v37.epoch = v9;
      *(_OWORD *)&v36.value = v24;
      v36.epoch = v9;

      v11 = 0;
      if (!objc_msgSend(v14, "isUserDecision"))
        goto LABEL_38;
    }
    else
    {
LABEL_12:
      if ((objc_msgSend(v14, "isUserDecision") & 1) == 0)
      {
        if (!v11)
          goto LABEL_38;
        if ((objc_msgSend(v11, "isStrongDecision") & 1) == 0)
        {
          if (v14)
            objc_msgSend(v14, "time");
          else
            memset(&v25, 0, sizeof(v25));
          time1 = v36;
          if ((CMTimeCompare(&v25, &time1) & 0x80000000) == 0)
          {
LABEL_38:
            objc_msgSend(v8, "addObject:", v14);

            v11 = 0;
            *(_OWORD *)&v37.value = v24;
            v37.epoch = v9;
            *(_OWORD *)&v36.value = v24;
            v36.epoch = v9;
          }
        }
        v19 = v14;

        v10 = v19;
        goto LABEL_40;
      }
    }
    v15 = v11;
    objc_msgSend(v8, "addObject:", v14);
    v11 = v14;

    -[PTCinematographyScript trackForDecision:](self, "trackForDecision:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v11)
    {
      objc_msgSend(v11, "time");
      if (v17)
        goto LABEL_15;
    }
    else
    {
      memset(v33, 0, sizeof(v33));
      if (v16)
      {
LABEL_15:
        objc_msgSend(v17, "timeRangeEndForTime:", v33);
        goto LABEL_22;
      }
    }
    memset(&time1, 0, sizeof(time1));
LABEL_22:
    v37 = time1;

    memset(&time1, 0, sizeof(time1));
    if (objc_msgSend(v11, "hasMinimumDuration"))
    {
      if (v11)
      {
        objc_msgSend(v11, "minimumDuration");
LABEL_26:
        objc_msgSend(v11, "time");
        goto LABEL_31;
      }
      memset(&time1, 0, sizeof(time1));
    }
    else
    {
      time1 = v38;
      if (v11)
        goto LABEL_26;
    }
    memset(&lhs, 0, sizeof(lhs));
LABEL_31:
    rhs = time1;
    CMTimeAdd(&v36, &lhs, &rhs);
    if (objc_msgSend(v11, "hasMaximumDuration"))
    {
      memset(&rhs, 0, sizeof(rhs));
      if (v11)
      {
        objc_msgSend(v11, "time");
        objc_msgSend(v11, "maximumDuration");
      }
      else
      {
        memset(&v30, 0, sizeof(v30));
        memset(&v29, 0, sizeof(v29));
      }
      CMTimeAdd(&rhs, &v30, &v29);
      v28 = v37;
      v27 = rhs;
      CMTimeMinimum(&v37, &v28, &v27);
      v27 = v36;
      v26 = rhs;
      CMTimeMinimum(&v28, &v27, &v26);
      v36 = v28;
    }
LABEL_40:

    ++v12;
  }
  while (v12 < objc_msgSend(v6, "count"));
  if (v10)
  {
    if (v11)
    {
      time1 = v37;
      rhs = *v23;
      if (CMTimeCompare(&time1, &rhs) < 0)
      {
        time1 = v37;
        objc_msgSend(v10, "_decisionByChangingTime:", &time1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v20);

      }
    }
  }
LABEL_46:
  v21 = (void *)objc_msgSend(v8, "copy");

  return v21;
}

- (BOOL)addTrack:(id)a3
{
  id v4;
  PTCinematographyScript *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isUserCreated"))
  {
    objc_msgSend(v4, "script");
    v5 = (PTCinematographyScript *)objc_claimAutoreleasedReturnValue();

    if (v5 == self)
    {
      _PTLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "debugTrackIdentifierString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1C9281000, v9, OS_LOG_TYPE_INFO, "track %@ already added", (uint8_t *)&v13, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v4, "script");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        _PTLogSystem();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[PTCinematographyScript addTrack:].cold.1(v4, v7);

        goto LABEL_7;
      }
      -[PTCinematographyScript trackAllocator](self, "trackAllocator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTCinematographyScript _addTrack:identifier:](self, "_addTrack:identifier:", v4, objc_msgSend(v11, "nextTrackIdentifier"));

      -[PTCinematographyScript _internalizeDetectionsFromTrack:](self, "_internalizeDetectionsFromTrack:", v4);
    }
    v8 = 1;
    goto LABEL_13;
  }
LABEL_7:
  v8 = 0;
LABEL_13:

  return v8;
}

- (BOOL)removeTrack:(id)a3
{
  id v4;
  void *v5;
  PTCinematographyScript *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isUserCreated"))
  {
    objc_msgSend(v4, "script");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "script");
      v6 = (PTCinematographyScript *)objc_claimAutoreleasedReturnValue();

      if (v6 != self)
      {
        _PTLogSystem();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[PTCinematographyScript removeTrack:].cold.1(v4, v7);

        goto LABEL_7;
      }
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[PTCinematographyScript userDecisions](self, "userDecisions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            v18 = objc_msgSend(v17, "trackIdentifier");
            if (v18 == objc_msgSend(v4, "trackIdentifier"))
              v14 |= -[PTCinematographyScript _removeUserDecision:](self, "_removeUserDecision:", v17);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v13);
      }
      else
      {
        LOBYTE(v14) = 0;
      }

      if (objc_msgSend(v4, "isUserCreated"))
        -[PTCinematographyScript _removeDetectionsWithTrackIdentifier:](self, "_removeDetectionsWithTrackIdentifier:", objc_msgSend(v4, "trackIdentifier"));
      -[PTCinematographyScript _removeTrack:](self, "_removeTrack:", v4);
      if ((v14 & 1) != 0)
      {
        -[PTCinematographyScript timeRange](self, "timeRange");
        -[PTCinematographyScript _updateDecisionsAndFramesInTimeRange:](self, "_updateDecisionsAndFramesInTimeRange:", &v20);
      }
    }
    else
    {
      _PTLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "debugTrackIdentifierString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_impl(&dword_1C9281000, v9, OS_LOG_TYPE_INFO, "track %@ already removed", buf, 0xCu);

      }
    }
    v8 = 1;
    goto LABEL_27;
  }
LABEL_7:
  v8 = 0;
LABEL_27:

  return v8;
}

- (void)_addZeroDisparityTrack
{
  PTCinematographyFixedFocusTrack *v3;
  double v4;
  PTCinematographyTrack *v5;
  PTCinematographyTrack *zeroDisparityTrack;

  if (!self->_zeroDisparityTrack)
  {
    v3 = [PTCinematographyFixedFocusTrack alloc];
    LODWORD(v4) = 0;
    v5 = -[PTCinematographyFixedFocusTrack initWithFocusDistance:](v3, "initWithFocusDistance:", v4);
    zeroDisparityTrack = self->_zeroDisparityTrack;
    self->_zeroDisparityTrack = v5;

    -[PTCinematographyTrack setUserCreated:](self->_zeroDisparityTrack, "setUserCreated:", 0);
    -[PTCinematographyScript _addTrack:identifier:](self, "_addTrack:identifier:", self->_zeroDisparityTrack, 0x1000000000);
  }
}

- (void)_addTrack:(id)a3 identifier:(int64_t)a4
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *trackForNumber;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "setTrackIdentifier:", a4);
  objc_msgSend(v6, "setScript:", self);
  _PTLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1C9281000, v7, OS_LOG_TYPE_INFO, "Adding track %@ (%@)", (uint8_t *)&v13, 0x16u);

  }
  -[PTCinematographyScript mutableTracks](self, "mutableTracks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v6);

  trackForNumber = self->_trackForNumber;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](trackForNumber, "setObject:forKeyedSubscript:", v6, v12);

}

- (void)_removeTrack:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSMutableDictionary *trackForNumber;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _PTLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1C9281000, v5, OS_LOG_TYPE_INFO, "Removing track %@ (%@)", (uint8_t *)&v11, 0x16u);

  }
  trackForNumber = self->_trackForNumber;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "trackIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](trackForNumber, "setObject:forKeyedSubscript:", 0, v9);

  -[PTCinematographyScript mutableTracks](self, "mutableTracks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v4);

  objc_msgSend(v4, "setTrackIdentifier:", 0);
  objc_msgSend(v4, "setScript:", 0);

}

- (BOOL)_isEditCreatedTrack:(id)a3
{
  return (objc_msgSend(a3, "trackIdentifier") & 0x7FFFFFFE00000000) == 0x1200000000;
}

- (void)_removeAllUserTracksForReloading
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PTCinematographyScript tracks](self, "tracks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isUserCreated")
          && -[PTCinematographyScript _isEditCreatedTrack:](self, "_isEditCreatedTrack:", v8))
        {
          -[PTCinematographyScript removeTrack:](self, "removeTrack:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_addGroupTrack:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *trackForGroupNumber;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (PTGroupIDIsInvalid(objc_msgSend(v4, "groupIdentifier")))
  {
    _PTLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PTCinematographyScript _addGroupTrack:].cold.1(v4, v5);
  }
  else
  {
    objc_msgSend(v4, "setScript:", self);
    _PTLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "groupIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v4;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1C9281000, v6, OS_LOG_TYPE_INFO, "Adding group track %@ (%@) with group identifier %@", (uint8_t *)&v12, 0x20u);

    }
    -[PTCinematographyScript mutableGroupTracks](self, "mutableGroupTracks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v4);

    trackForGroupNumber = self->_trackForGroupNumber;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "groupIdentifier"));
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](trackForGroupNumber, "setObject:forKeyedSubscript:", v4, v5);
  }

}

- (void)_addDetectionsFromCustomTrack:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  CMTime v20;
  _QWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "allDetections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    v19 = *MEMORY[0x1E0CA2E68];
    *((_QWORD *)&v9 + 1) = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 8);
    v10 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_QWORD *)&v9 = 138412290;
    v18 = v9;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        objc_msgSend(v12, "setDetectionType:", objc_msgSend(v4, "detectionType", v18));
        objc_msgSend(v12, "setTrackIdentifier:", objc_msgSend(v4, "trackIdentifier"));
        if (v12)
          objc_msgSend(v12, "time");
        else
          memset(v21, 0, sizeof(v21));
        *(_OWORD *)buf = v19;
        v27 = v10;
        -[PTCinematographyScript frameAtTime:tolerance:](self, "frameAtTime:tolerance:", v21, buf);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "_addDetection:", v12);
        }
        else
        {
          _PTLogSystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            if (v12)
              objc_msgSend(v12, "time");
            else
              memset(&v20, 0, sizeof(v20));
            NSStringFromCMTime(&v20);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v18;
            *(_QWORD *)&buf[4] = v16;
            _os_log_error_impl(&dword_1C9281000, v15, OS_LOG_TYPE_ERROR, "error: addTrack: track detection at time not present in script: %@", buf, 0xCu);

          }
        }

        ++v11;
      }
      while (v7 != v11);
      v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      v7 = v17;
    }
    while (v17);
  }

}

- (void)_addDetectionsFromFixedFocusTrack:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _QWORD v12[3];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PTCinematographyScript frames](self, "frames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v10)
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "time");
        else
          memset(v12, 0, sizeof(v12));
        objc_msgSend(v4, "_fixedFocusDetectionAtTime:", v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTrackIdentifier:", objc_msgSend(v4, "trackIdentifier"));
        objc_msgSend(v10, "_addDetection:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_removeDetectionsWithTrackIdentifier:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PTCinematographyScript frames](self, "frames", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_removeDetectionWithTrackIdentifier:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_notifyDelegateOfChangesToDecisionsInTimeRange:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  __int128 v8;
  _OWORD v9[3];

  -[PTCinematographyScript changesDelegate](self, "changesDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PTCinematographyScript changesDelegate](self, "changesDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_OWORD *)&a3->var0.var3;
    v9[0] = *(_OWORD *)&a3->var0.var0;
    v9[1] = v8;
    v9[2] = *(_OWORD *)&a3->var1.var1;
    objc_msgSend(v7, "decisionsDidChangeInScript:timeRange:", self, v9);

  }
}

- (void)_notifyDelegateOfChangesToFramesInTimeRange:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  __int128 v8;
  _OWORD v9[3];

  -[PTCinematographyScript changesDelegate](self, "changesDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PTCinematographyScript changesDelegate](self, "changesDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_OWORD *)&a3->var0.var3;
    v9[0] = *(_OWORD *)&a3->var0.var0;
    v9[1] = v8;
    v9[2] = *(_OWORD *)&a3->var1.var1;
    objc_msgSend(v7, "framesDidChangeInScript:timeRange:", self, v9);

  }
}

- (id)changesDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyScript userAperture](self, "userAperture");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("user_aperture"));

  -[PTCinematographyScript _userDecisionDictionaries](self, "_userDecisionDictionaries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("user_decisions"));

  -[PTCinematographyScript _userTrackDictionaries](self, "_userTrackDictionaries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("user_tracks"));

  -[PTCinematographyScript trackAllocator](self, "trackAllocator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_asCinematographyDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("track_allocator"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)_userDecisionDictionaries
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PTCinematographyScript userDecisions](self, "userDecisions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "_asCinematographyDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)_userTrackDictionaries
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PTCinematographyScript tracks](self, "tracks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isUserCreated"))
        {
          objc_msgSend(v9, "_asCinematographyDictionary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (id)changesDictionaryTrimmedByTimeRange:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyScript userAperture](self, "userAperture");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("user_aperture"));

  v8 = *(_OWORD *)&a3->var0.var3;
  v16 = *(_OWORD *)&a3->var0.var0;
  v17 = v8;
  v18 = *(_OWORD *)&a3->var1.var1;
  -[PTCinematographyScript _userDecisionDictionariesTrimmedByTimeRange:](self, "_userDecisionDictionariesTrimmedByTimeRange:", &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("user_decisions"));

  v10 = *(_OWORD *)&a3->var0.var3;
  v16 = *(_OWORD *)&a3->var0.var0;
  v17 = v10;
  v18 = *(_OWORD *)&a3->var1.var1;
  -[PTCinematographyScript _userTrackDictionariesTrimmedByTimeRange:](self, "_userTrackDictionariesTrimmedByTimeRange:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("user_tracks"));

  -[PTCinematographyScript trackAllocator](self, "trackAllocator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_asCinematographyDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("track_allocator"));

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (id)_userDecisionDictionariesTrimmedByTimeRange:(id *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  CMTimeEpoch v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  CMTime v35;
  CMTime v36;
  CMTime v37;
  CMTime rhs;
  CMTime time2;
  CMTime v40;
  CMTime lhs;
  CMTime v42;
  CMTime start;
  CMTime time1;
  CMTime v45;
  CMTime var0;
  CMTimeRange range;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var0.var3;
  var0 = (CMTime)a3->var0;
  memset(&v45, 0, sizeof(v45));
  v7 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = v7;
  CMTimeRangeGetEnd(&v45, &range);
  -[PTCinematographyScript userDecisions](self, "userDecisions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  range.start = var0;
  v9 = objc_msgSend(v8, "_firstIndexAtOrAfterTime:", &range);

  -[PTCinematographyScript userDecisions](self, "userDecisions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  range.start = v45;
  v11 = objc_msgSend(v10, "_firstIndexAtOrAfterTime:", &range);

  if (v9)
  {
    range.start = var0;
    -[PTCinematographyScript primaryDecisionAtTime:](self, "primaryDecisionAtTime:", &range);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isUserDecision"))
      goto LABEL_25;
    if (v12)
      objc_msgSend(v12, "time");
    else
      memset(&time1, 0, sizeof(time1));
    range.start = var0;
    if ((CMTimeCompare(&time1, &range.start) & 0x80000000) == 0)
      goto LABEL_25;
    -[PTCinematographyScript userDecisions](self, "userDecisions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v9 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)&range.start.value = *MEMORY[0x1E0CA2E68];
    v15 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    range.start.epoch = v15;
    objc_msgSend(v14, "_decisionByChangingTime:", &range);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&start, 0, sizeof(start));
    if (objc_msgSend(v14, "hasMinimumDuration"))
    {
      if (v14)
      {
        objc_msgSend(v14, "minimumDuration");
        memset(&v42, 0, sizeof(v42));
LABEL_15:
        objc_msgSend(v14, "time");
        v18 = 0;
        goto LABEL_17;
      }
      memset(&start, 0, sizeof(start));
      memset(&v42, 0, sizeof(v42));
    }
    else
    {
      v17 = (void *)objc_opt_class();
      if (v17)
        objc_msgSend(v17, "defaultMinimumUserFocusDuration");
      else
        memset(&start, 0, sizeof(start));
      memset(&v42, 0, sizeof(v42));
      if (v14)
        goto LABEL_15;
    }
    memset(&lhs, 0, sizeof(lhs));
    v18 = 1;
LABEL_17:
    range.start = start;
    CMTimeAdd(&v42, &lhs, &range.start);
    range.start = v42;
    rhs = var0;
    CMTimeSubtract(&time2, &range.start, &rhs);
    *(_OWORD *)&range.start.value = v29;
    range.start.epoch = v15;
    CMTimeMaximum(&v40, &range.start, &time2);
    v37 = v40;
    objc_msgSend(v16, "setMinimumDuration:", &v37);
    if (objc_msgSend(v14, "hasMaximumDuration"))
    {
      memset(&rhs, 0, sizeof(rhs));
      if ((v18 & 1) != 0)
      {
        memset(&v36, 0, sizeof(v36));
        memset(&v35, 0, sizeof(v35));
      }
      else
      {
        objc_msgSend(v14, "time");
        objc_msgSend(v14, "maximumDuration");
      }
      CMTimeAdd(&rhs, &v36, &v35);
      range.start = rhs;
      v34 = var0;
      if (CMTimeCompare(&range.start, &v34) < 1)
      {
        _PTLogSystem();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          if ((v18 & 1) != 0)
            memset(&v31, 0, sizeof(v31));
          else
            objc_msgSend(v14, "maximumDuration");
          NSStringFromCMTime(&v31);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          range.start = var0;
          NSStringFromCMTime(&range.start);
          v27 = objc_claimAutoreleasedReturnValue();
          LODWORD(range.start.value) = 138413058;
          *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)v12;
          LOWORD(range.start.flags) = 2112;
          *(_QWORD *)((char *)&range.start.flags + 2) = v14;
          HIWORD(range.start.epoch) = 2112;
          range.duration.value = (CMTimeValue)v26;
          LOWORD(range.duration.timescale) = 2112;
          *(_QWORD *)((char *)&range.duration.timescale + 2) = v27;
          v28 = (void *)v27;
          _os_log_error_impl(&dword_1C9281000, v19, OS_LOG_TYPE_ERROR, "Primary decision %@ is user decision, but previous user decision %@ has maximum duration %@ that ends before trim starts %@", (uint8_t *)&range, 0x2Au);

        }
        goto LABEL_24;
      }
      range.start = rhs;
      v34 = var0;
      CMTimeSubtract(&v33, &range.start, &v34);
      v32 = v33;
      objc_msgSend(v16, "setMaximumDuration:", &v32);
    }
    objc_msgSend(v16, "_asCinematographyDictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);
LABEL_24:

LABEL_25:
  }
  if (v9 < v11)
  {
    do
    {
      -[PTCinematographyScript userDecisions](self, "userDecisions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      memset(&range, 0, 24);
      if (v21)
        objc_msgSend(v21, "time");
      else
        memset(&v30, 0, sizeof(v30));
      start = var0;
      CMTimeSubtract(&range.start, &v30, &start);
      start = range.start;
      objc_msgSend(v21, "_decisionByChangingTime:", &start);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_asCinematographyDictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v23);

      ++v9;
    }
    while (v11 != v9);
  }
  v24 = (void *)objc_msgSend(v5, "copy");

  return v24;
}

- (id)_userTrackDictionariesTrimmedByTimeRange:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  int64_t var3;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PTCinematographyScript mutableTracks](self, "mutableTracks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v11, "isUserCreated"))
        {
          v12 = *(_OWORD *)&a3->var0.var3;
          v19[0] = *(_OWORD *)&a3->var0.var0;
          v19[1] = v12;
          v19[2] = *(_OWORD *)&a3->var1.var1;
          v17 = v19[0];
          var3 = a3->var0.var3;
          objc_msgSend(v11, "_trackByTrimmingToTimeRange:subtracting:", v19, &v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_asCinematographyDictionary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  return v15;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[4].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var1.var1;
  return self;
}

- (PTCinematographyScriptChanges)changesDelegate
{
  return (PTCinematographyScriptChanges *)objc_loadWeakRetained((id *)&self->_changesDelegate);
}

- (void)setChangesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_changesDelegate, a3);
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (PTGlobalCinematographyMetadata)globals
{
  return self->_globals;
}

- (void)setGlobals:(id)a3
{
  objc_storeStrong((id *)&self->_globals, a3);
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
  objc_storeStrong((id *)&self->_frames, a3);
}

- (PTCinematographyFocusFramesOptions)focusFramesOptions
{
  return self->_focusFramesOptions;
}

- (void)setFocusFramesOptions:(id)a3
{
  objc_storeStrong((id *)&self->_focusFramesOptions, a3);
}

- (NSArray)baseDecisions
{
  return self->_baseDecisions;
}

- (void)setBaseDecisions:(id)a3
{
  objc_storeStrong((id *)&self->_baseDecisions, a3);
}

- (NSMutableArray)userDecisions
{
  return self->_userDecisions;
}

- (void)setUserDecisions:(id)a3
{
  objc_storeStrong((id *)&self->_userDecisions, a3);
}

- (NSMutableArray)effectiveDecisions
{
  return self->_effectiveDecisions;
}

- (void)setEffectiveDecisions:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveDecisions, a3);
}

- (void)setTrackDecisions:(id)a3
{
  objc_storeStrong((id *)&self->_trackDecisions, a3);
}

- (NSMutableArray)mutableTracks
{
  return self->_mutableTracks;
}

- (void)setMutableTracks:(id)a3
{
  objc_storeStrong((id *)&self->_mutableTracks, a3);
}

- (NSMutableDictionary)trackForNumber
{
  return self->_trackForNumber;
}

- (void)setTrackForNumber:(id)a3
{
  objc_storeStrong((id *)&self->_trackForNumber, a3);
}

- (PTCinematographyTrack)zeroDisparityTrack
{
  return self->_zeroDisparityTrack;
}

- (void)setZeroDisparityTrack:(id)a3
{
  objc_storeStrong((id *)&self->_zeroDisparityTrack, a3);
}

- (PTCinematographyTrackAllocator)trackAllocator
{
  return self->_trackAllocator;
}

- (void)setTrackAllocator:(id)a3
{
  objc_storeStrong((id *)&self->_trackAllocator, a3);
}

- (NSMutableArray)mutableGroupTracks
{
  return self->_mutableGroupTracks;
}

- (void)setMutableGroupTracks:(id)a3
{
  objc_storeStrong((id *)&self->_mutableGroupTracks, a3);
}

- (NSMutableDictionary)trackForGroupNumber
{
  return self->_trackForGroupNumber;
}

- (void)setTrackForGroupNumber:(id)a3
{
  objc_storeStrong((id *)&self->_trackForGroupNumber, a3);
}

- (NSMutableDictionary)trackNumberForFocusIdentifier
{
  return self->_trackNumberForFocusIdentifier;
}

- (void)setTrackNumberForFocusIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_trackNumberForFocusIdentifier, a3);
}

- (PTCinematographyTrackAllocator)trackAllocatorForFocusIdentifier
{
  return self->_trackAllocatorForFocusIdentifier;
}

- (void)setTrackAllocatorForFocusIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_trackAllocatorForFocusIdentifier, a3);
}

- (BOOL)didInternalizeTracks
{
  return self->_didInternalizeTracks;
}

- (void)setDidInternalizeTracks:(BOOL)a3
{
  self->_didInternalizeTracks = a3;
}

- (PTCinematographyFocusPuller)focusPuller
{
  return self->_focusPuller;
}

- (void)setFocusPuller:(id)a3
{
  objc_storeStrong((id *)&self->_focusPuller, a3);
}

- (float)loadedUserAperture
{
  return self->_loadedUserAperture;
}

- (void)setLoadedUserAperture:(float)a3
{
  self->_loadedUserAperture = a3;
}

- (int64_t)loadedTrackAllocatorState
{
  return self->_loadedTrackAllocatorState;
}

- (void)setLoadedTrackAllocatorState:(int64_t)a3
{
  self->_loadedTrackAllocatorState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusPuller, 0);
  objc_storeStrong((id *)&self->_trackAllocatorForFocusIdentifier, 0);
  objc_storeStrong((id *)&self->_trackNumberForFocusIdentifier, 0);
  objc_storeStrong((id *)&self->_trackForGroupNumber, 0);
  objc_storeStrong((id *)&self->_mutableGroupTracks, 0);
  objc_storeStrong((id *)&self->_trackAllocator, 0);
  objc_storeStrong((id *)&self->_zeroDisparityTrack, 0);
  objc_storeStrong((id *)&self->_trackForNumber, 0);
  objc_storeStrong((id *)&self->_mutableTracks, 0);
  objc_storeStrong((id *)&self->_trackDecisions, 0);
  objc_storeStrong((id *)&self->_effectiveDecisions, 0);
  objc_storeStrong((id *)&self->_userDecisions, 0);
  objc_storeStrong((id *)&self->_baseDecisions, 0);
  objc_storeStrong((id *)&self->_focusFramesOptions, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_globals, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_changesDelegate);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)_internalizeLoadedFrames:(void *)a1 changesDictionary:reloading:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "trackDecisions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v2, v3, "Track decisions: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_internalizeLoadedFrames:(void *)a1 changesDictionary:reloading:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "effectiveDecisions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v2, v3, "Effective decisions: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_internalizeFocusPullerFromFrames:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "globals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInt:", objc_msgSend(v4, "majorVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a2, v6, "unsupported globals version %@", v7);

  OUTLINED_FUNCTION_10();
}

- (void)_internalizeUserDecisionsFromFrames:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_0(&dword_1C9281000, a3, (uint64_t)a3, "internalizing user focus end without prior user decision", a1);
}

- (void)setUserAperture:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_0(&dword_1C9281000, a1, a3, "attempt to set user aperture to non-positive value ignored", v3);
}

- (void)_updateFramesForDecisions:(NSRange)a1 indexRange:.cold.1(NSRange a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromRange(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v2, v3, "finished updating frames for decisions in index range %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_updateFramesFromDecision:toDecision:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_13(&dword_1C9281000, v1, (uint64_t)v1, "track doesn't change across adjacent decisions (%@; %@)", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_updateFramesFromDecision:(NSObject *)a3 toDecision:.cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 134218240;
  v7 = objc_msgSend(a1, "trackIdentifier");
  v8 = 2048;
  v9 = objc_msgSend(a2, "trackIdentifier");
  OUTLINED_FUNCTION_13(&dword_1C9281000, a3, v5, "did shorten transition from track %lu to track %lu", (uint8_t *)&v6);
  OUTLINED_FUNCTION_10();
}

- (void)_updateFramesForTransitionFromDecision:toDecision:timeRange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "error: cannot find current or prior detection for decision %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_internalizeTrackForDetection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "error: detection missing both trackIdentifier & focusIdentifier: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_internalizeTrackForDetection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "error: detection missing trackIdentifier: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)focusOnTrackIdentifier:atTime:strong:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "focusOnTrackIdentifier:atTime: No such %li trackIdentifier", v2);
  OUTLINED_FUNCTION_1();
}

- (void)focusOnTrackIdentifier:(uint64_t)a1 atTime:(NSObject *)a2 strong:.cold.2(uint64_t a1, NSObject *a2)
{
  CMTime *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_6_3(a1);
  NSStringFromCMTime(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a2, v5, "focusOnTrackIdentifier:atTime: time %@ is not numeric", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)focusOnGroupIdentifier:(uint64_t)a1 atTime:(NSObject *)a2 strong:.cold.1(uint64_t a1, NSObject *a2)
{
  CMTime *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_6_3(a1);
  NSStringFromCMTime(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a2, v5, "focusOnGroupIdentifier:atTime: time %@ is not numeric", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)addUserDecision:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "Adding group user decision with no corresponding detection: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)removeAllUserDecisions
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "userDecisions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v2, v3, "removing all user decisions %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_removeUserDecision:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "attempt to remove decision not found: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_removeUserDecision:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "attempt to remove non-user decision %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)addTrack:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugTrackIdentifierString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a2, v4, "error: track %@ already belongs to another script", v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)removeTrack:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugTrackIdentifierString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a2, v4, "error: attempt to remove track %@ from a different script", v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)_addGroupTrack:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "groupIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "detectionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "attempt to add track with invalid group identifier %@ (%@)", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_10();
}

@end

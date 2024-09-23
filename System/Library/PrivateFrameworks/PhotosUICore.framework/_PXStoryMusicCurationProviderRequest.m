@implementation _PXStoryMusicCurationProviderRequest

- (_PXStoryMusicCurationProviderRequest)initWithAssetContainer:(id)a3 options:(id)a4 recentlyUsedFlexSongIDs:(id)a5 recentlyUsedAppleMusicSongIDs:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _PXStoryMusicCurationProviderRequest *v18;
  _PXStoryMusicCurationProviderRequest *v19;
  uint64_t v20;
  PXStoryMusicCurationProviderOptions *options;
  uint64_t v22;
  NSProgress *progress;
  NSMutableArray *v24;
  NSMutableArray *resultHandlers;
  uint64_t v26;
  NSArray *recentlyUsedFlexSongIDs;
  uint64_t v28;
  NSArray *recentlyUsedAppleMusicSongIDs;
  uint64_t v30;
  id completionHandler;
  objc_super v33;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v33.receiver = self;
  v33.super_class = (Class)_PXStoryMusicCurationProviderRequest;
  v18 = -[_PXStoryMusicCurationProviderRequest init](&v33, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_assetContainer, a3);
    v20 = objc_msgSend(v14, "copy");
    options = v19->_options;
    v19->_options = (PXStoryMusicCurationProviderOptions *)v20;

    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v22 = objc_claimAutoreleasedReturnValue();
    progress = v19->_progress;
    v19->_progress = (NSProgress *)v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    resultHandlers = v19->_resultHandlers;
    v19->_resultHandlers = v24;

    v26 = objc_msgSend(v15, "copy");
    recentlyUsedFlexSongIDs = v19->_recentlyUsedFlexSongIDs;
    v19->_recentlyUsedFlexSongIDs = (NSArray *)v26;

    v28 = objc_msgSend(v16, "copy");
    recentlyUsedAppleMusicSongIDs = v19->_recentlyUsedAppleMusicSongIDs;
    v19->_recentlyUsedAppleMusicSongIDs = (NSArray *)v28;

    v30 = objc_msgSend(v17, "copy");
    completionHandler = v19->_completionHandler;
    v19->_completionHandler = (id)v30;

  }
  return v19;
}

- (_PXStoryMusicCurationProviderRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPhotoKitMusicCurationProvider.m"), 348, CFSTR("%s is not available as initializer"), "-[_PXStoryMusicCurationProviderRequest init]");

  abort();
}

- (void)appendResultHandler:(id)a3
{
  NSMutableArray *resultHandlers;
  void *v4;
  id v5;

  resultHandlers = self->_resultHandlers;
  v5 = (id)objc_msgSend(a3, "copy");
  v4 = _Block_copy(v5);
  -[NSMutableArray addObject:](resultHandlers, "addObject:", v4);

}

- (void)start
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  dispatch_time_t v25;
  intptr_t v26;
  intptr_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  PXMusicCurationConcreteResult *v38;
  PXMusicCurationConcreteResult *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  os_signpost_id_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[4];
  NSObject *v49;
  uint64_t *v50;
  uint64_t *v51;
  _QWORD v52[4];
  NSObject *v53;
  _BYTE *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint8_t v74[4];
  uint64_t v75;
  __int16 v76;
  id v77;
  _BYTE buf[24];
  _BYTE v79[30];
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (self->_hasStarted)
    return;
  self->_hasStarted = 1;
  -[_PXStoryMusicCurationProviderRequest options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = PXExists();
    v6 = PXExists();
  }
  else
  {
    v6 = 1;
    v5 = 1;
  }
  -[_PXStoryMusicCurationProviderRequest options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v7, "logContext");

  -[_PXStoryMusicCurationProviderRequest assetContainer](self, "assetContainer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  PLStoryGetLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      objc_msgSend(v47, "identifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXStoryMusicCurationProviderRequest options](self, "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "categories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXStoryMusicCurationProviderRequest recentlyUsedAppleMusicSongIDs](self, "recentlyUsedAppleMusicSongIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXStoryMusicCurationProviderRequest recentlyUsedFlexSongIDs](self, "recentlyUsedFlexSongIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      *(_QWORD *)&buf[4] = v46;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 1026;
      *(_DWORD *)v79 = v5;
      *(_WORD *)&v79[4] = 1026;
      *(_DWORD *)&v79[6] = v6;
      *(_WORD *)&v79[10] = 2114;
      *(_QWORD *)&v79[12] = v12;
      *(_WORD *)&v79[20] = 2114;
      *(_QWORD *)&v79[22] = v13;
      v80 = 2114;
      v81 = v14;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PXStoryMusicCurationProviderRequest", "Context=%{signpost.telemetry:string2}lu AssetContainer=%{signpost.description:attribute,public}@ WantsAppleMusic=%{signpost.description:attribute,public}d WantsFlexMusic=%{signpost.description:attribute,public}d Categories=%{signpost.description:attribute,public}@ RecentlyUsedAppleMusicSongIDs=%{signpost.description:attribute,public}@ RecentlyUsedFlexMusicSongIDs=%{signpost.description:attribute,public}@ ", buf, 0x40u);

    }
  }

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_group_create();
  v17 = v16;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)v79 = __Block_byref_object_copy__5573;
  *(_QWORD *)&v79[8] = __Block_byref_object_dispose__5574;
  *(_QWORD *)&v79[16] = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__5573;
  v72 = __Block_byref_object_dispose__5574;
  v73 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__5573;
  v66 = __Block_byref_object_dispose__5574;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__5573;
  v60 = __Block_byref_object_dispose__5574;
  v61 = 0;
  if (v5)
  {
    dispatch_group_enter(v16);
    -[_PXStoryMusicCurationProviderRequest recentlyUsedAppleMusicSongIDs](self, "recentlyUsedAppleMusicSongIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __45___PXStoryMusicCurationProviderRequest_start__block_invoke_219;
    v52[3] = &unk_1E5117170;
    v54 = buf;
    v55 = &v68;
    v53 = v17;
    +[PXMusicCurator requestAppleMusicCurationForAssetContainer:recentlyUsedAdamIDs:resultHandler:](PXMusicCurator, "requestAppleMusicCurationForAssetContainer:recentlyUsedAdamIDs:resultHandler:", v47, v18, v52);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "px_appendChild:withPendingUnitCount:", v19, 50);
  }
  if (v6)
  {
    +[PXMusicCurator bestLocallyAvailableAudioAssetForAssetContainer:](PXMusicCurator, "bestLocallyAvailableAudioAssetForAssetContainer:", v47);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v17);
    -[_PXStoryMusicCurationProviderRequest recentlyUsedFlexSongIDs](self, "recentlyUsedFlexSongIDs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __45___PXStoryMusicCurationProviderRequest_start__block_invoke_2_221;
    v48[3] = &unk_1E5117198;
    v50 = &v62;
    v51 = &v56;
    v49 = v17;
    +[PXMusicCurator requestFlexMusicCurationForAssetContainer:recentlyUsedFlexSongIDs:resultHandler:](PXMusicCurator, "requestFlexMusicCurationForAssetContainer:recentlyUsedFlexSongIDs:resultHandler:", v47, v21, v48);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "px_appendChild:withPendingUnitCount:", v22, 50);
  }
  else
  {
    v20 = 0;
  }
  -[_PXStoryMusicCurationProviderRequest progress](self, "progress");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryMusicCurationProviderRequest progress](self, "progress");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addChild:withPendingUnitCount:", v15, objc_msgSend(v24, "totalUnitCount"));

  v25 = dispatch_time(0, 30000000000);
  v26 = dispatch_group_wait(v17, v25);
  v27 = v26;
  v28 = (void *)v69[5];
  if (v28 || (v28 = (void *)v57[5]) != 0)
  {
    v29 = v28;
    if (v27)
    {
LABEL_16:
      PLStoryGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v47, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v74 = 138412546;
        v75 = (uint64_t)v31;
        v76 = 2112;
        v77 = v29;
        _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurationManager) Music curation for asset container (%@) timed out with error %@", v74, 0x16u);

      }
      PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(5, v29, CFSTR("Music curation timed out."), v32, v33, v34, v35, v36, v44);
      v37 = objc_claimAutoreleasedReturnValue();

      v29 = (id)v37;
    }
  }
  else
  {
    v29 = 0;
    if (v26)
      goto LABEL_16;
  }
  v38 = [PXMusicCurationConcreteResult alloc];
  v39 = -[PXMusicCurationConcreteResult initWithAppleMusicCuration:flexMusicCuration:fallbackAsset:requestedCategories:error:](v38, "initWithAppleMusicCuration:flexMusicCuration:fallbackAsset:requestedCategories:error:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v63[5], v20, v4, v29);
  PLStoryGetLog();
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v41 = os_signpost_id_make_with_pointer(v40, self);
  if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v42 = v41;
    if (os_signpost_enabled(v40))
    {
      -[PXMusicCurationConcreteResult description](v39, "description");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v74 = 134218242;
      v75 = v46;
      v76 = 2114;
      v77 = v43;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v40, OS_SIGNPOST_INTERVAL_END, v42, "PXStoryMusicCurationProviderRequest", "Context=%{signpost.telemetry:string2}lu Result=%{signpost.description:attribute,public}@", v74, 0x16u);

    }
  }

  -[_PXStoryMusicCurationProviderRequest _handleCurationResult:](self, "_handleCurationResult:", v39);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(buf, 8);
}

- (void)_handleCurationResult:(id)a3
{
  id v4;
  NSMutableArray *resultHandlers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  resultHandlers = self->_resultHandlers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62___PXStoryMusicCurationProviderRequest__handleCurationResult___block_invoke;
  v7[3] = &unk_1E51171C0;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](resultHandlers, "enumerateObjectsUsingBlock:", v7);
  (*((void (**)(void))self->_completionHandler + 2))();

}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 32, 1);
}

- (PXStoryPhotoKitAssetContainer)assetContainer
{
  return self->_assetContainer;
}

- (PXStoryMusicCurationProviderOptions)options
{
  return self->_options;
}

- (NSArray)recentlyUsedFlexSongIDs
{
  return self->_recentlyUsedFlexSongIDs;
}

- (NSArray)recentlyUsedAppleMusicSongIDs
{
  return self->_recentlyUsedAppleMusicSongIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyUsedAppleMusicSongIDs, 0);
  objc_storeStrong((id *)&self->_recentlyUsedFlexSongIDs, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetContainer, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_resultHandlers, 0);
}

@end

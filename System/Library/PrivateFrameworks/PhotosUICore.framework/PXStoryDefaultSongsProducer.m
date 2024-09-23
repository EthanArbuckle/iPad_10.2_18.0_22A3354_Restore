@implementation PXStoryDefaultSongsProducer

- (PXStoryDefaultSongsProducer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDefaultSongsProducer.m"), 46, CFSTR("%s is not available as initializer"), "-[PXStoryDefaultSongsProducer init]");

  abort();
}

- (PXStoryDefaultSongsProducer)initWithAssetContainer:(id)a3 configuration:(id)a4 curationProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXStoryDefaultSongsProducer *v12;
  PXStoryDefaultSongsProducer *v13;
  const char *v14;
  objc_class *v15;
  id v16;
  os_log_t v17;
  OS_os_log *log;
  uint64_t v19;
  OS_dispatch_queue *queue;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryDefaultSongsProducer;
  v12 = -[PXStoryDefaultSongsProducer init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetContainer, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    objc_storeStrong((id *)&v13->_curationProvider, a5);
    v14 = (const char *)*MEMORY[0x1E0D744D8];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = os_log_create(v14, (const char *)objc_msgSend(v16, "UTF8String"));
    log = v13->_log;
    v13->_log = (OS_os_log *)v17;

    px_dispatch_queue_create_serial();
    v19 = objc_claimAutoreleasedReturnValue();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v19;

  }
  return v13;
}

- (id)requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  id v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  PXStoryMusicCurationProviderOptions *v16;
  PXStoryMusicCurationProvider *curationProvider;
  NSObject *v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint8_t v27[16];
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  id v31[2];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  NSObject *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PXStoryDefaultSongsProducer log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (char *)os_signpost_id_make_with_pointer(v6, self);
  v8 = v6;
  v9 = v8;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "StoryDefaultSongsProducerResultDelivery", ", buf, 2u);
  }

  -[PXStoryDefaultSongsProducer assetContainer](self, "assetContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLStoryGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v33 = (uint64_t)v10;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "[LemMusic] requestSongsWithOptions: assetContainer=%@", buf, 0xCu);
  }

  objc_msgSend(v10, "container");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = v12;

  if (v13)
  {
    PLStoryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v25 = -[NSObject category](v13, "category");
      v24 = -[NSObject subcategory](v13, "subcategory");
      -[NSObject moodKeywords](v13, "moodKeywords");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[NSObject suggestedMood](v13, "suggestedMood");
      -[NSObject meaningLabels](v13, "meaningLabels");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v33 = v25;
      v34 = 2048;
      v35 = v24;
      v36 = 2112;
      v37 = v26;
      v38 = 2048;
      v39 = v14;
      v40 = 2112;
      v41 = v15;
      v42 = 2112;
      v43 = v13;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "[LemMusic] Is PHMemory | category=%ld, sub-cat=%ld, moodKeywords=%@, suggestedMood=%llu, meaningLabels=%@, memory=%@", buf, 0x3Eu);

    }
    goto LABEL_12;
  }
LABEL_13:
  v16 = objc_alloc_init(PXStoryMusicCurationProviderOptions);
  -[PXStoryMusicCurationProviderOptions addCategory:](v16, "addCategory:", CFSTR("FlexMusicBest"));
  if (-[PXStoryConfiguration isAllowedToPlayAppleMusic](self->_configuration, "isAllowedToPlayAppleMusic")
    && !-[PXStoryConfiguration shouldForceUsingFlexMusic](self->_configuration, "shouldForceUsingFlexMusic"))
  {
    -[PXStoryMusicCurationProviderOptions addCategory:](v16, "addCategory:", CFSTR("AppleMusicBest"));
  }
  -[PXStoryMusicCurationProviderOptions setLogContext:](v16, "setLogContext:", -[PXStoryDefaultSongsProducer logContext](self, "logContext"));
  objc_initWeak((id *)buf, self);
  curationProvider = self->_curationProvider;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __69__PXStoryDefaultSongsProducer_requestSongsWithOptions_resultHandler___block_invoke;
  v28[3] = &unk_1E5141838;
  v18 = v9;
  v29 = v18;
  v31[1] = v7;
  objc_copyWeak(v31, (id *)buf);
  v19 = v5;
  v30 = v19;
  -[PXStoryMusicCurationProvider requestMusicCurationForAssetContainer:options:resultHandler:](curationProvider, "requestMusicCurationForAssetContainer:options:resultHandler:", v10, v16, v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v18;
  v22 = v21;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v22, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v7, "StoryDefaultSongsProducerResultDelivery", ", v27, 2u);
  }

  objc_destroyWeak(v31);
  objc_destroyWeak((id *)buf);

  return v20;
}

- (void)_handleMusicCurationResult:(id)a3 signpostID:(unint64_t)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[PXStoryConfiguration appleMusicStatusProvider](self->_configuration, "appleMusicStatusProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__PXStoryDefaultSongsProducer__handleMusicCurationResult_signpostID_resultHandler___block_invoke;
  v13[3] = &unk_1E5141860;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v11 = v8;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  objc_msgSend(v10, "requestStatusForCapability:handler:", 1, v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

- (void)_handleAppleMusicCapabilityStatus:(int64_t)a3 error:(id)a4 curationResult:(id)a5 resultHandler:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  const __CFString *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  PXStorySongsConfiguration *v47;
  PXStoryProducerResult *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void (**v54)(_QWORD, _QWORD);
  uint64_t v55;
  void *v56;
  uint8_t buf[4];
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  PLStoryGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v58 = v9;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_INFO, "Received Music curation result: %@", buf, 0xCu);
  }

  objc_msgSend(v9, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "songsByCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppleMusicBest"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "songsByCategory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("FlexMusicBest"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v14;
  v18 = v17;
  if (-[PXStoryConfiguration shouldForceUsingFlexMusic](self->_configuration, "shouldForceUsingFlexMusic"))
  {
    PLStoryGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_INFO, "[LemMusic][ForceFlex] Force bestSuggestions music to Flex.", buf, 2u);
    }

    v18 = v16;
  }
  objc_msgSend(v9, "songsByCategory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("FlexMusicFallback"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v18, "count");
  v53 = v16;
  v54 = (void (**)(_QWORD, _QWORD))v10;
  v52 = v17;
  if (a3 == 1 && v22)
  {
    v23 = v16;

    if (objc_msgSend(v23, "count"))
    {
      v24 = CFSTR("com.apple.photos.memory.interactiveMemoryMusicUsedAppleMusic");
      v21 = v23;
LABEL_22:
      v26 = v18;
      goto LABEL_23;
    }
    objc_msgSend(v9, "songsByCategory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("FlexMusicFallback"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = CFSTR("com.apple.photos.memory.interactiveMemoryMusicUsedAppleMusic");
LABEL_21:

    goto LABEL_22;
  }
  if (a3 != 1)
  {
    PLStoryGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_INFO, "Declining Apple Music curated result because Apple Music is not playable for this user.", buf, 2u);
    }

  }
  v26 = v16;

  if (objc_msgSend(v26, "count"))
  {
    v24 = CFSTR("com.apple.photos.memory.interactiveMemoryMusicUsedFlexMusic");
  }
  else
  {
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(5, v12, CFSTR("No usable curation results found for Apple Music or Flex Music. Falling back to best local Flex Music track."), v27, v28, v29, v30, v31, v50);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "songsByCategory");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("FlexMusicFallback"));
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v18, "count"))
    {
      PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(5, v32, CFSTR("Full music curation failed, and no fallback track could be found."), v34, v35, v36, v37, v38, v51);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("com.apple.photos.memory.interactiveMemoryMusicFellBackToLocalFlexSong");
      goto LABEL_21;
    }
    v24 = CFSTR("com.apple.photos.memory.interactiveMemoryMusicFellBackToLocalFlexSong");
    v26 = v18;
    v12 = v32;
  }
LABEL_23:
  v39 = objc_alloc(MEMORY[0x1E0C99E08]);
  v55 = *MEMORY[0x1E0D09830];
  v40 = (objc_class *)objc_opt_class();
  NSStringFromClass(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v41;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v39, "initWithDictionary:", v42);

  -[PXStoryDefaultSongsProducer assetContainer](self, "assetContainer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "container");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v46 = v45;
  else
    v46 = 0;

  objc_msgSend(v43, "setObject:forKeyedSubscript:", v46, *MEMORY[0x1E0D09818]);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D09838]);
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v24, v43);
  v47 = -[PXStorySongsConfiguration initWithCuratedAudioAssets:fallbackCuratedAssets:currentAsset:]([PXStorySongsConfiguration alloc], "initWithCuratedAudioAssets:fallbackCuratedAssets:currentAsset:", v26, v21, 0);
  v48 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v47);
  -[PXStoryProducerResult error:](v48, "error:", v12);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v54)[2](v54, v49);

}

- (unint64_t)logContext
{
  return self->logContext;
}

- (void)setLogContext:(unint64_t)a3
{
  self->logContext = a3;
}

- (PXStoryPhotoKitAssetContainer)assetContainer
{
  return self->_assetContainer;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_assetContainer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_curationProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __83__PXStoryDefaultSongsProducer__handleMusicCurationResult_signpostID_resultHandler___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  uint8_t v11[16];

  v5 = (id *)(a1 + 6);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "log");
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = a1[7];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v9, "StoryDefaultSongsProducerEventReceivedAppleMusicStatus", ", v11, 2u);
  }

  v10 = objc_loadWeakRetained(v5);
  objc_msgSend(v10, "_handleAppleMusicCapabilityStatus:error:curationResult:resultHandler:", a2, v6, a1[4], a1[5]);

}

void __69__PXStoryDefaultSongsProducer_requestSongsWithOptions_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  id WeakRetained;
  uint8_t v8[16];

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_EVENT, v6, "StoryDefaultSongsProducerEventReceivedCuration", ", v8, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleMusicCurationResult:signpostID:resultHandler:", v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

@end

@implementation PXStoryMediaAnalysisMovieHighlightsProducer

- (PXStoryMediaAnalysisMovieHighlightsProducer)init
{
  PXStoryMediaAnalysisMovieHighlightsProducer *v2;
  PXSystemMediaAnalyzer *v3;
  PXMediaAnalyzer *mediaAnalyzer;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *results_queue;
  const char *v10;
  objc_class *v11;
  id v12;
  os_log_t v13;
  OS_os_log *log;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXStoryMediaAnalysisMovieHighlightsProducer;
  v2 = -[PXStoryMediaAnalysisMovieHighlightsProducer init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXSystemMediaAnalyzer);
    mediaAnalyzer = v2->_mediaAnalyzer;
    v2->_mediaAnalyzer = (PXMediaAnalyzer *)v3;

    v2->_batchSize = 100;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("PXStoryMediaAnalysisMovieHighlightsProducer.Work", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("PXStoryMediaAnalysisMovieHighlightsProducer.Results", 0);
    results_queue = v2->_results_queue;
    v2->_results_queue = (OS_dispatch_queue *)v8;

    v10 = (const char *)*MEMORY[0x1E0D744D8];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = os_log_create(v10, (const char *)objc_msgSend(v12, "UTF8String"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v13;

  }
  return v2;
}

- (PXStoryMediaAnalysisMovieHighlightsProducer)initWithStoryConfiguration:(id)a3
{
  id v5;
  PXStoryMediaAnalysisMovieHighlightsProducer *v6;
  PXStoryMediaAnalysisMovieHighlightsProducer *v7;
  NSDictionary *customTimeRangeByAssetUUID;

  v5 = a3;
  v6 = -[PXStoryMediaAnalysisMovieHighlightsProducer init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storyConfiguration, a3);
    v7->_didProcessConfiguration = 0;
    customTimeRangeByAssetUUID = v7->_customTimeRangeByAssetUUID;
    v7->_customTimeRangeByAssetUUID = 0;

  }
  return v7;
}

- (id)requestMovieHighlightsForAssets:(id)a3 partialCollection:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *workQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  PXStoryMediaAnalysisMovieHighlightsProducer *v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __119__PXStoryMediaAnalysisMovieHighlightsProducer_requestMovieHighlightsForAssets_partialCollection_options_resultHandler___block_invoke;
  v22[3] = &unk_1E513AC50;
  v15 = v13;
  v23 = v15;
  v24 = self;
  v25 = v10;
  v26 = v11;
  v27 = v12;
  v28 = a5;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(workQueue, v22);
  v19 = v27;
  v20 = v15;

  return v20;
}

- (void)waitUntilScheduled
{
  dispatch_sync((dispatch_queue_t)self->_workQueue, &__block_literal_global_232189);
}

- (void)_requestMovieHighlightsForAssets:(id)a3 partialCollection:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  os_signpost_id_t v12;
  OS_os_log *v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t batchSize;
  void *v17;
  id v18;
  PXStoryMovieHighlightsConcreteMutableCollection *v19;
  PXStoryMovieHighlightsConcreteMutableCollection *v20;
  void (**v21)(void *, void *);
  uint64_t i;
  void *v23;
  void *v24;
  PXStoryProducerResult *v25;
  void *v26;
  PXStoryProducerResult *v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t spid;
  unint64_t v31;
  PXStoryMediaAnalysisMovieHighlightsProducer *v32;
  id v33;
  id v34;
  uint8_t v35[16];
  _QWORD aBlock[5];
  PXStoryMovieHighlightsConcreteMutableCollection *v37;
  id v38;
  id v39;
  uint8_t *v40;
  os_signpost_id_t v41;
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v13 = self->_log;
  v14 = v13;
  v31 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PXStoryMovieHighlightsProduction", ", buf, 2u);
  }

  v15 = objc_msgSend(v9, "count");
  batchSize = self->_batchSize;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", batchSize);
  v18 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
  v19 = objc_alloc_init(PXStoryMovieHighlightsConcreteMutableCollection);
  *(_QWORD *)buf = 0;
  v43 = buf;
  v44 = 0x2020000000;
  v45 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieHighlightsForAssets_partialCollection_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E513A970;
  v32 = self;
  aBlock[4] = self;
  v20 = v19;
  v37 = v20;
  v40 = buf;
  v41 = v12;
  spid = v12;
  v34 = v11;
  v39 = v34;
  v33 = v18;
  v38 = v33;
  v21 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v15)
  {
    for (i = 0; i != v15; ++i)
    {
      objc_msgSend(v9, "objectAtIndex:", i);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v23, "playbackStyle") - 3) <= 2)
      {
        ++*((_QWORD *)v43 + 3);
        objc_msgSend(v10, "movieHighlightsForDisplayAsset:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          -[PXStoryMovieHighlightsConcreteMutableCollection setMovieHighlightCuration:forDisplayAsset:](v20, "setMovieHighlightCuration:forDisplayAsset:", v24, v23);
        }
        else
        {
          if (objc_msgSend(v17, "count") == batchSize)
          {
            v21[2](v21, v17);
            objc_msgSend(v17, "removeAllObjects");
          }
          objc_msgSend(v17, "addObject:", v23);
        }

      }
    }
  }
  if (objc_msgSend(v17, "count"))
  {
    v21[2](v21, v17);
  }
  else
  {
    v25 = [PXStoryProducerResult alloc];
    v26 = (void *)-[PXStoryMovieHighlightsConcreteMutableCollection copy](v20, "copy");
    v27 = -[PXStoryProducerResult initWithObject:](v25, "initWithObject:", v26);

    (*((void (**)(id, PXStoryProducerResult *))v34 + 2))(v34, v27);
    v28 = v32->_log;
    v29 = v28;
    if (v31 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)v35 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v29, OS_SIGNPOST_INTERVAL_END, spid, "PXStoryMovieHighlightsProduction", ", v35, 2u);
    }

  }
  _Block_object_dispose(buf, 8);

}

- (id)_requestMovieCurationForAssets:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  os_signpost_id_t v8;
  OS_os_log *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  NSDictionary *v18;
  NSDictionary *customTimeRangeByAssetUUID;
  NSDictionary *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  uint64_t i;
  NSDictionary *v27;
  void *v28;
  void *v29;
  CMTimeRange *v30;
  __int128 v31;
  CFDictionaryRef v32;
  uint64_t v33;
  PXMediaAnalyzer *mediaAnalyzer;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  int v40;
  void *v41;
  os_signpost_id_t v42;
  id v43;
  id v44;
  int v45;
  int v46;
  _QWORD v47[5];
  id v48;
  id v49;
  os_signpost_id_t v50;
  _OWORD v51[3];
  uint8_t buf[16];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v9 = self->_log;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PXStoryMovieHighlightsMediaAnalysisRequest", ", buf, 2u);
  }

  v11 = (void *)objc_msgSend(v6, "copy");
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "allowOnDemandVideoAnalysis");
  v14 = objc_msgSend(v12, "useBestHighlightTrim");
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!self->_didProcessConfiguration)
  {
    v45 = v14;
    -[PXStoryConfiguration assetCollection](self->_storyConfiguration, "assetCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;

      if (!v17)
      {
LABEL_11:
        self->_didProcessConfiguration = 1;

        v14 = v45;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0D77E38], "getCuratedAssetPlaybackTimeRangesForMemory:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (NSDictionary *)objc_msgSend(v16, "copy");
      customTimeRangeByAssetUUID = self->_customTimeRangeByAssetUUID;
      self->_customTimeRangeByAssetUUID = v18;

    }
    else
    {
      v17 = 0;
    }

    goto LABEL_11;
  }
LABEL_12:
  v20 = self->_customTimeRangeByAssetUUID;
  if (v20 && -[NSDictionary count](v20, "count"))
  {
    v46 = v14;
    v40 = v13;
    v42 = v8;
    v43 = v7;
    v44 = v6;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v41 = v11;
    v21 = v11;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v56;
      v25 = (_OWORD *)MEMORY[0x1E0CA2E40];
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v56 != v24)
            objc_enumerationMutation(v21);
          v27 = self->_customTimeRangeByAssetUUID;
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            v53 = 0u;
            v54 = 0u;
            *(_OWORD *)buf = 0u;
            objc_msgSend(v29, "CMTimeRangeValue");
            v51[0] = *(_OWORD *)buf;
            v51[1] = v53;
            v51[2] = v54;
            v30 = (CMTimeRange *)v51;
          }
          else
          {
            v31 = v25[1];
            *(_OWORD *)buf = *v25;
            v53 = v31;
            v54 = v25[2];
            v30 = (CMTimeRange *)buf;
          }
          v32 = CMTimeRangeCopyAsDictionary(v30, 0);
          objc_msgSend(v15, "addObject:", v32);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      }
      while (v23);
    }

    v7 = v43;
    v6 = v44;
    v11 = v41;
    v8 = v42;
    v13 = v40;
    v14 = v46;
  }
  v33 = 46;
  if (v13)
    v33 = 47;
  mediaAnalyzer = self->_mediaAnalyzer;
  v47[0] = MEMORY[0x1E0C809B0];
  if (v14)
    v35 = v33 | 0x10;
  else
    v35 = v33;
  v47[1] = 3221225472;
  v47[2] = __96__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieCurationForAssets_completionHandler___block_invoke;
  v47[3] = &unk_1E513A998;
  v47[4] = self;
  v48 = v11;
  v49 = v7;
  v50 = v8;
  v36 = v7;
  v37 = v11;
  -[PXMediaAnalyzer requestAnalysisForAssets:options:contexts:resultHandler:](mediaAnalyzer, "requestAnalysisForAssets:options:contexts:resultHandler:", v37, v35, v15, v47);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (PXMediaAnalyzer)mediaAnalyzer
{
  return self->_mediaAnalyzer;
}

- (void)setMediaAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAnalyzer, a3);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAnalyzer, 0);
  objc_storeStrong((id *)&self->_customTimeRangeByAssetUUID, 0);
  objc_storeStrong((id *)&self->_storyConfiguration, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_results_queue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __96__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieCurationForAssets_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryMovieHighlightsMediaAnalysisRequest", ", buf, 2u);
  }

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v3)
  {
    +[PXStoryMediaAnalysisMovieHighlightCuration movieHighlightCurationsFromMediaAnalysisResults:](PXStoryMediaAnalysisMovieHighlightCuration, "movieHighlightCurationsFromMediaAnalysisResults:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    if (objc_msgSend(v8, "count"))
    {
      v10 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "defaultHighlight");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[PXStoryFallbackMovieHighlightCuration movieHighlightCurationForDisplayAsset:](PXStoryFallbackMovieHighlightCuration, "movieHighlightCurationForDisplayAsset:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:atIndexedSubscript:", v14, v10);

          objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);

        }
        ++v10;
      }
      while (v10 < objc_msgSend(v8, "count"));
    }
    v17 = (void *)objc_msgSend(v9, "copy");

  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v18 = *(id *)(a1 + 40);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          +[PXStoryFallbackMovieHighlightCuration movieHighlightCurationForDisplayAsset:](PXStoryFallbackMovieHighlightCuration, "movieHighlightCurationForDisplayAsset:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v24);
          objc_msgSend(v23, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v25);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v20);
    }

    v17 = (void *)objc_msgSend(v9, "copy");
    v3 = 0;
  }

  if (objc_msgSend(v7, "count"))
  {
    PLStoryGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(v7, "count");
      v28 = objc_msgSend(*(id *)(a1 + 40), "count");
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v41 = v27;
      v42 = 2048;
      v43 = v28;
      v44 = 2114;
      v45 = v29;
      _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "PXStoryMediaAnalysisMovieHighlightsProducer: missing media analysis data for %lu assets out of %lu. Assets: %{public}@", buf, 0x20u);

    }
  }
  v30 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieCurationForAssets_completionHandler___block_invoke_165;
  block[3] = &unk_1E5148CE0;
  v31 = *(id *)(a1 + 48);
  v34 = v17;
  v35 = v31;
  v32 = v17;
  dispatch_async(v30, block);

}

uint64_t __96__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieCurationForAssets_completionHandler___block_invoke_165(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __120__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieHighlightsForAssets_partialCollection_options_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "copy");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __120__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieHighlightsForAssets_partialCollection_options_resultHandler___block_invoke_2;
  v13[3] = &unk_1E513A948;
  v5 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = v4;
  v6 = *(_QWORD *)(a1 + 72);
  v16 = *(_QWORD *)(a1 + 32);
  v18 = v6;
  v12 = *(_OWORD *)(a1 + 56);
  v7 = (id)v12;
  v17 = v12;
  v8 = v4;
  objc_msgSend(v5, "_requestMovieCurationForAssets:completionHandler:", v8, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setTotalUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount") + objc_msgSend(v3, "count"));
  v10 = *(void **)(a1 + 48);
  v11 = objc_msgSend(v3, "count");

  objc_msgSend(v10, "addChild:withPendingUnitCount:", v9, v11);
}

void __120__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieHighlightsForAssets_partialCollection_options_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  PXStoryProducerResult *v6;
  void *v7;
  PXStoryProducerResult *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setMovieHighlightCurations:forDisplayAssets:", a2, *(_QWORD *)(a1 + 40));
  v6 = [PXStoryProducerResult alloc];
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v8 = -[PXStoryProducerResult initWithObject:](v6, "initWithObject:", v7);

  if (objc_msgSend(*(id *)(a1 + 32), "count") != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    -[PXStoryProducerResult flags:](v8, "flags:", 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (PXStoryProducerResult *)v9;
  }
  if (v5)
  {
    -[PXStoryProducerResult error:](v8, "error:", v5);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (PXStoryProducerResult *)v10;
  }
  v11 = *(id *)(*(_QWORD *)(a1 + 48) + 24);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 72);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_EVENT, v13, "PXStoryMovieHighlightsBatchDelivery", ", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (objc_msgSend(*(id *)(a1 + 32), "count") == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v14 = *(id *)(*(_QWORD *)(a1 + 48) + 24);
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 72);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PXStoryMovieHighlightsProduction", ", v17, 2u);
    }

  }
}

uint64_t __119__PXStoryMediaAnalysisMovieHighlightsProducer_requestMovieHighlightsForAssets_partialCollection_options_resultHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_requestMovieHighlightsForAssets:partialCollection:options:resultHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "resignCurrent");
}

@end

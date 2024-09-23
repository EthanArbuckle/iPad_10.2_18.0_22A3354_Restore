@implementation PXStoryVisionDetailedSaliencyProducer

- (PXStoryVisionDetailedSaliencyProducer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryVisionDetailedSaliencyProducer.m"), 40, CFSTR("%s is not available as initializer"), "-[PXStoryVisionDetailedSaliencyProducer init]");

  abort();
}

- (PXStoryVisionDetailedSaliencyProducer)initWithMediaProvider:(id)a3
{
  id v5;
  PXStoryVisionDetailedSaliencyProducer *v6;
  PXStoryVisionDetailedSaliencyProducer *v7;
  const char *v8;
  objc_class *v9;
  id v10;
  os_log_t v11;
  OS_os_log *log;
  objc_class *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *workQueue;
  void *v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryVisionDetailedSaliencyProducer;
  v6 = -[PXStoryVisionDetailedSaliencyProducer init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaProvider, a3);
    v8 = (const char *)*MEMORY[0x1E0D744D8];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = os_log_create(v8, (const char *)objc_msgSend(v10, "UTF8String"));
    log = v7->_log;
    v7->_log = (OS_os_log *)v11;

    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(v15, v17);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v18;

    +[PXStoryMultipartPanoramaSettings sharedInstance](PXStoryMultipartPanoramaSettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_overlappingTileCount = objc_msgSend(v20, "overlappingTileCount");

  }
  return v7;
}

- (void)_requestDetailedSaliencyForDisplayAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  PXStoryConcreteMutableSaliencyDataSource *v16;
  NSObject *v17;
  PXStoryConcreteMutableSaliencyDataSource *v18;
  uint64_t v19;
  id v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (**v31)(_QWORD, float);
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  NSObject *v43;
  PXStoryVisionDetailedSaliencyProducer *v44;
  PXStoryConcreteMutableSaliencyDataSource *v45;
  id v46;
  id v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  os_signpost_id_t v52;
  PXStoryVisionDetailedSaliencyProducer *v53;
  SEL v54;
  uint64_t v55;
  _QWORD v56[3];
  uint64_t v57;
  _QWORD v58[4];
  _QWORD v59[4];
  NSObject *v60;
  PXStoryConcreteMutableSaliencyDataSource *v61;
  id v62;
  __int128 *p_buf;
  unint64_t v64;
  os_signpost_id_t v65;
  PXStoryVisionDetailedSaliencyProducer *v66;
  _QWORD aBlock[5];
  uint8_t v68[4];
  PXStoryVisionDetailedSaliencyProducer *v69;
  __int128 buf;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v39 = a5;
  v11 = a6;
  -[PXStoryVisionDetailedSaliencyProducer log](self, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PXStoryDetailedSaliency", "Context=%{signpost.telemetry:string2}lu vision-based", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__115044;
  v73 = __Block_byref_object_dispose__115045;
  v74 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke;
  aBlock[3] = &unk_1E51284D0;
  aBlock[4] = &buf;
  v37 = _Block_copy(aBlock);
  v16 = objc_alloc_init(PXStoryConcreteMutableSaliencyDataSource);
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_31;
  v59[3] = &unk_1E51284F8;
  v64 = a4;
  v17 = v15;
  v60 = v17;
  v65 = v13;
  v66 = self;
  v18 = v16;
  v61 = v18;
  p_buf = &buf;
  v36 = v11;
  v62 = v36;
  v38 = _Block_copy(v59);
  if ((objc_msgSend(v39, "isCancelled") & 1) == 0)
  {
    v19 = objc_msgSend(v10, "count");
    v20 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    if (v19 >= 1)
    {
      for (i = 0; i != v19; ++i)
      {
        v22 = (void *)MEMORY[0x1A85CE17C]();
        objc_msgSend(v10, "objectAtIndexedSubscript:", i);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "mediaType") == 1 && (objc_msgSend(v23, "mediaSubtypes") & 1) != 0)
          objc_msgSend(v20, "addIndex:", i);

        objc_autoreleasePoolPop(v22);
      }
    }
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    v58[3] = 0;
    v24 = objc_msgSend(v20, "count");
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x2020000000;
    v57 = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v57 = v25;
    +[PXStoryMultipartPanoramaSettings sharedInstance](PXStoryMultipartPanoramaSettings, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "productionSimulatedDelay");
    v28 = v27;
    objc_msgSend(v26, "productionReportsTimeInterval");
    v30 = v29;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_38;
    v40[3] = &unk_1E5128598;
    v41 = v39;
    v48 = v58;
    v49 = v56;
    v50 = v30;
    v31 = v38;
    v46 = v31;
    v51 = v24;
    v42 = v10;
    v32 = v17;
    v52 = v13;
    v53 = self;
    v43 = v32;
    v44 = self;
    v54 = a2;
    v47 = v37;
    v45 = v18;
    v55 = v28;
    objc_msgSend(v20, "enumerateIndexesUsingBlock:", v40);
    v31[2](v31, 1.0);
    v33 = v32;
    v34 = v33;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      *(_DWORD *)v68 = 134217984;
      v69 = self;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v34, OS_SIGNPOST_INTERVAL_END, v13, "PXStoryDetailedSaliency", "Context=%{signpost.telemetry:string2}lu ", v68, 0xCu);
    }

    _Block_object_dispose(v56, 8);
    _Block_object_dispose(v58, 8);

  }
  _Block_object_dispose(&buf, 8);

}

- (void)requestWorkingImageForDisplayAsset:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  +[PXStoryMultipartPanoramaSettings sharedInstance](PXStoryMultipartPanoramaSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maximumTileSide");
  v10 = v9;

  v11 = v10
      * (double)(-[PXStoryVisionDetailedSaliencyProducer overlappingTileCount](self, "overlappingTileCount") + 1)
      * 0.5;
  v13 = objc_alloc_init((Class)off_1E50B3068);
  objc_msgSend(v13, "setSynchronous:", 1);
  objc_msgSend(v13, "setDeliveryMode:", 1);
  objc_msgSend(v13, "setNetworkAccessAllowed:", 1);
  -[PXStoryVisionDetailedSaliencyProducer mediaProvider](self, "mediaProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 0, v13, v6, v11, v11);

}

- (id)requestDetailedSaliencyForDisplayAssets:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[PXStoryVisionDetailedSaliencyProducer workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __103__PXStoryVisionDetailedSaliencyProducer_requestDetailedSaliencyForDisplayAssets_options_resultHandler___block_invoke;
  v18[3] = &unk_1E513D290;
  v12 = v10;
  v19 = v12;
  objc_copyWeak(v22, &location);
  v22[1] = (id)a4;
  v20 = v8;
  v21 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v18);

  v15 = v21;
  v16 = v12;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  return v16;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (OS_os_log)log
{
  return self->_log;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (int64_t)overlappingTileCount
{
  return self->_overlappingTileCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

void __103__PXStoryVisionDetailedSaliencyProducer_requestDetailedSaliencyForDisplayAssets_options_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_requestDetailedSaliencyForDisplayAssets:options:progress:resultHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

void __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v4, "addObject:", v3);
  PLStoryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Detailed saliency error: %@", (uint8_t *)&v9, 0xCu);
  }

}

void __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_31(uint64_t a1, float a2)
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  PXStoryProducerResult *v8;
  void *v9;
  PXStoryProducerResult *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a2 >= 1.0 || (*(_BYTE *)(a1 + 64) & 6) == 0)
  {
    v4 = *(id *)(a1 + 32);
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 72);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      v7 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 134218240;
      v21 = v7;
      v22 = 2048;
      v23 = a2;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_EVENT, v6, "PXStoryDetailedSaliencyResult", "Context=%{signpost.telemetry:string2}lu completed:%0.2f", buf, 0x16u);
    }

    v8 = [PXStoryProducerResult alloc];
    v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v10 = -[PXStoryProducerResult initWithObject:](v8, "initWithObject:", v9);
    *(float *)&v11 = a2;
    -[PXStoryProducerResult fractionCompleted:](v10, "fractionCompleted:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v18 = *MEMORY[0x1E0CB2F70];
      v19 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PXStoryErrorDomain"), 25, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "error:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v17;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_38(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  double v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void (**v27)(_QWORD, double, double, double, double);
  __int128 v28;
  uint64_t v29;
  uint64_t i;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  os_signpost_id_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *context;
  _QWORD aBlock[4];
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, CGImage *, uint64_t, void *);
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  _BYTE *v62;
  uint64_t v63;
  __int128 v64;
  uint8_t v65[4];
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  uint8_t v69[16];
  __int128 v70;
  _BYTE buf[24];
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A85CE17C]();
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) >= 1)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      if (v6 - *(double *)(v7 + 24) >= *(double *)(a1 + 104))
      {
        *(double *)(v7 + 24) = v6;
        (*(void (**)(float))(*(_QWORD *)(a1 + 72) + 16))((float)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                        + 24) / (float)*(uint64_t *)(a1 + 112));
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(id *)(a1 + 48);
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 120);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v12 = *(_QWORD *)(a1 + 128);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PXStoryDetailedAssetSaliency", "Context=%{signpost.telemetry:string2}lu index:%li", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v72 = 0;
    v13 = *(id *)(a1 + 48);
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 120);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v16 = *(_QWORD *)(a1 + 128);
      *(_DWORD *)v69 = 134217984;
      *(_QWORD *)&v69[4] = v16;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PXStoryDetailedSaliencyAssetImage", "Context=%{signpost.telemetry:string2}lu ", v69, 0xCu);
    }

    v17 = MEMORY[0x1E0C809B0];
    v54 = MEMORY[0x1E0C809B0];
    v55 = 3221225472;
    v56 = __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_39;
    v57 = &unk_1E5128520;
    v18 = *(_QWORD *)(a1 + 136);
    v62 = buf;
    v63 = v18;
    v19 = *(void **)(a1 + 48);
    v58 = *(id *)(a1 + 56);
    v59 = v19;
    v64 = *(_OWORD *)(a1 + 120);
    v61 = *(id *)(a1 + 80);
    v60 = v8;
    v46 = v60;
    objc_msgSend(v58, "requestWorkingImageForDisplayAsset:resultHandler:");
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24))
    {
      v20 = objc_alloc(MEMORY[0x1E0CEDF70]);
      v21 = (void *)objc_msgSend(v20, "initWithCGImage:options:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24), MEMORY[0x1E0C9AA70]);
      objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v24 = v22;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultDevice");
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = v24;

      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      aBlock[0] = v17;
      aBlock[1] = 3221225472;
      aBlock[2] = __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_49;
      aBlock[3] = &unk_1E5128570;
      v45 = v25;
      v50 = v45;
      v44 = v21;
      v51 = v44;
      v53 = *(id *)(a1 + 80);
      v47 = v26;
      v52 = v47;
      v27 = (void (**)(_QWORD, double, double, double, double))_Block_copy(aBlock);
      v28 = *((_OWORD *)off_1E50B86D0 + 1);
      *(_OWORD *)v69 = *(_OWORD *)off_1E50B86D0;
      v70 = v28;
      v29 = objc_msgSend(*(id *)(a1 + 56), "overlappingTileCount");
      CGImageGetWidth(*(CGImageRef *)(*(_QWORD *)&buf[8] + 24));
      CGImageGetHeight(*(CGImageRef *)(*(_QWORD *)&buf[8] + 24));
      PXSizeValueForAxis();
      PXSizeSetValueForAxis();
      if (v29 >= 1)
      {
        for (i = 0; i != v29; ++i)
        {
          PXPointSetValueForAxis();
          v31 = *(id *)(a1 + 48);
          v32 = v31;
          v33 = *(_QWORD *)(a1 + 120);
          if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
          {
            v34 = *(_QWORD *)(a1 + 128);
            *(_DWORD *)v65 = 134218240;
            v66 = v34;
            v67 = 2048;
            v68 = i;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v33, "PXStoryDetailedTileSaliency", "Context=%{signpost.telemetry:string2}lu tile:%li", v65, 0x16u);
          }

          v27[2](v27, *(double *)v69, *(double *)&v69[8], *(double *)&v70, *((double *)&v70 + 1));
          v35 = *(id *)(a1 + 48);
          v36 = v35;
          v37 = *(_QWORD *)(a1 + 120);
          if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
          {
            v38 = *(_QWORD *)(a1 + 128);
            *(_DWORD *)v65 = 134217984;
            v66 = v38;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v36, OS_SIGNPOST_INTERVAL_END, v37, "PXStoryDetailedTileSaliency", "Context=%{signpost.telemetry:string2}lu ", v65, 0xCu);
          }

        }
      }
      CGImageRelease(*(CGImageRef *)(*(_QWORD *)&buf[8] + 24));
      objc_msgSend((id)objc_opt_class(), "effectiveSaliencyAreasFromTiledVisionSaliencyAreas:", v47);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setSaliencyAreas:rawSaliencyAreas:forDisplayAsset:", v39, v47, v46);
      v40 = *(id *)(a1 + 48);
      v41 = v40;
      v42 = *(_QWORD *)(a1 + 120);
      if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        v43 = *(_QWORD *)(a1 + 128);
        *(_DWORD *)v65 = 134217984;
        v66 = v43;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v41, OS_SIGNPOST_INTERVAL_END, v42, "PXStoryDetailedAssetSaliency", "Context=%{signpost.telemetry:string2}lu ", v65, 0xCu);
      }

    }
    if (*(double *)(a1 + 144) > 0.0)
      objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:");
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);

    _Block_object_dispose(buf, 8);
  }
  objc_autoreleasePoolPop(context);
}

void __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_39(uint64_t a1, CGImage *a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  size_t Width;
  __int16 v24;
  size_t Height;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("PXStoryVisionDetailedSaliencyProducer.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image == nil"));

  }
  v7 = *(id *)(a1 + 40);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 80);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_QWORD *)(a1 + 88);
    *(_DWORD *)buf = 134218496;
    v21 = v10;
    v22 = 2048;
    Width = CGImageGetWidth(a2);
    v24 = 2048;
    Height = CGImageGetHeight(a2);
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PXStoryDetailedSaliencyAssetImage", "Context=%{signpost.telemetry:string2}lu image:%lix%li", buf, 0x20u);
  }

  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = CGImageRetain(a2);
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(25, v12, CFSTR("failed to obtain image for %@"), v13, v14, v15, v16, v17, *(_QWORD *)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v18);

  }
}

void __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_49(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(void *, void *, uint64_t);
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[4];
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v10 = objc_alloc_init(MEMORY[0x1E0CEDF28]);
  objc_msgSend(v10, "setProcessingDevice:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v10, "setRegionOfInterest:", a2, a3, a4, a5);
  v11 = objc_alloc_init(MEMORY[0x1E0CEDF08]);
  objc_msgSend(v11, "setProcessingDevice:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v11, "setRegionOfInterest:", a2, a3, a4, a5);
  v12 = *(void **)(a1 + 40);
  v35[0] = v10;
  v35[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v14 = objc_msgSend(v12, "performRequests:error:", v13, &v34);
  v15 = v34;

  if ((v14 & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_2;
    aBlock[3] = &unk_1E5128548;
    v30 = a2;
    v31 = a3;
    v32 = a4;
    v33 = a5;
    v29 = *(id *)(a1 + 48);
    v21 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    objc_msgSend(v10, "results");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, v22, 1);

    objc_msgSend(v11, "results");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, v23, 2);

    v24 = v29;
  }
  else
  {
    v25 = *(_QWORD *)(a1 + 56);
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(25, v15, CFSTR("failed perform Vision saliency requests"), v16, v17, v18, v19, v20, v27);
    v26 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v25, v26);
    v24 = v15;
    v15 = (id)v26;
  }

}

void __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  PXStoryVisionSaliencyArea *v24;
  double v25;
  PXStoryVisionSaliencyArea *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "narrowedBoundingBox");
        PXRectDenormalize();
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        objc_msgSend(v10, "salientObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "confidence");
        v22 = v21;

        if (v22 > 0.0)
        {
          v23 = (void *)a1[4];
          v24 = [PXStoryVisionSaliencyArea alloc];
          *(float *)&v25 = v22;
          v26 = -[PXStoryVisionSaliencyArea initWithContentsRect:confidence:type:sourceRegionOfInterest:](v24, "initWithContentsRect:confidence:type:sourceRegionOfInterest:", a3, v12, v14, v16, v18, v25, a1[5], a1[6], a1[7], a1[8]);
          objc_msgSend(v23, "addObject:", v26);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }

}

+ (id)effectiveSaliencyAreasFromTiledVisionSaliencyAreas:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void (**v7)(_QWORD, double, double, double, double);
  id v8;
  void (**v9)(_QWORD, __n128, __n128, __n128, __n128);
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  uint64_t v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  void *v70;
  id v72;
  double v73;
  double height;
  double width;
  double y;
  double x;
  CGFloat v78;
  CGFloat v79;
  _QWORD v80[4];
  id v81;
  id v82;
  _QWORD aBlock[4];
  id v84;
  id v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__PXStoryVisionDetailedSaliencyProducer_effectiveSaliencyAreasFromTiledVisionSaliencyAreas___block_invoke_2;
  aBlock[3] = &unk_1E5128600;
  v85 = &__block_literal_global_115115;
  v72 = v4;
  v84 = v72;
  v7 = (void (**)(_QWORD, double, double, double, double))_Block_copy(aBlock);
  v80[0] = v6;
  v80[1] = 3221225472;
  v80[2] = __92__PXStoryVisionDetailedSaliencyProducer_effectiveSaliencyAreasFromTiledVisionSaliencyAreas___block_invoke_3;
  v80[3] = &unk_1E5128600;
  v82 = &__block_literal_global_115115;
  v8 = v5;
  v81 = v8;
  v9 = (void (**)(_QWORD, __n128, __n128, __n128, __n128))_Block_copy(v80);
  v10 = objc_msgSend(v3, "count");
  +[PXStoryMultipartPanoramaSettings sharedInstance](PXStoryMultipartPanoramaSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tileOverlapThreshold");
  v73 = v12;

  if (v10 >= 1)
  {
    v13 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = ++v13;
      if (v13 < v10)
      {
        do
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v14, "type");
          if (v17 == objc_msgSend(v16, "type"))
          {
            objc_msgSend(v14, "sourceRegionOfInterest");
            v19 = v18;
            v21 = v20;
            v23 = v22;
            v25 = v24;
            objc_msgSend(v16, "sourceRegionOfInterest");
            v92.origin.x = v26;
            v92.origin.y = v27;
            v92.size.width = v28;
            v92.size.height = v29;
            v86.origin.x = v19;
            v86.origin.y = v21;
            v86.size.width = v23;
            v86.size.height = v25;
            if (CGRectIntersectsRect(v86, v92))
              goto LABEL_20;
          }
          v30 = objc_msgSend(v14, "type");
          if (v30 != objc_msgSend(v16, "type"))
          {
            objc_msgSend(v14, "sourceRegionOfInterest");
            v32 = v31;
            v34 = v33;
            v36 = v35;
            v38 = v37;
            objc_msgSend(v16, "sourceRegionOfInterest");
            v93.origin.x = v39;
            v93.origin.y = v40;
            v93.size.width = v41;
            v93.size.height = v42;
            v87.origin.x = v32;
            v87.origin.y = v34;
            v87.size.width = v36;
            v87.size.height = v38;
            if (CGRectEqualToRect(v87, v93))
            {
LABEL_20:
              objc_msgSend(v14, "contentsRect");
              v44 = v43;
              v46 = v45;
              v48 = v47;
              v50 = v49;
              objc_msgSend(v16, "contentsRect");
              v52 = v51;
              v54 = v53;
              v56 = v55;
              v58 = v57;
              v88.origin.x = v44;
              v88.origin.y = v46;
              v88.size.width = v48;
              v88.size.height = v50;
              v94.origin.x = v52;
              v94.origin.y = v54;
              v94.size.width = v56;
              v94.size.height = v58;
              if (CGRectIntersectsRect(v88, v94))
              {
                v78 = v46;
                v79 = v44;
                v89.origin.x = v44;
                v89.origin.y = v46;
                v89.size.width = v48;
                v89.size.height = v50;
                v95.origin.x = v52;
                v95.origin.y = v54;
                v95.size.width = v56;
                v95.size.height = v58;
                v90 = CGRectIntersection(v89, v95);
                y = v90.origin.y;
                x = v90.origin.x;
                height = v90.size.height;
                width = v90.size.width;
                PXSizeGetArea();
                v60 = v59;
                PXSizeGetArea();
                v62 = v61;
                PXSizeGetArea();
                if (v62 < v63)
                  v63 = v62;
                if (v60 >= v73 * v63)
                  v7[2](v7, x, y, width, height);
                v64 = objc_msgSend(v14, "type");
                v65 = objc_msgSend(v16, "type");
                v67 = v78;
                v66 = v79;
                if (v64 == v65)
                {
                  v68 = v48;
                  v69 = v50;
                  v96.origin.x = v52;
                  v96.origin.y = v54;
                  v96.size.width = v56;
                  v96.size.height = v58;
                  v91 = CGRectUnion(*(CGRect *)&v66, v96);
                  v9[2](v9, (__n128)v91.origin, *(__n128 *)&v91.origin.y, (__n128)v91.size, *(__n128 *)&v91.size.height);
                }
              }
            }
          }

          ++v15;
        }
        while (v10 != v15);
      }

    }
    while (v13 != v10);
  }
  objc_msgSend(v72, "arrayByAddingObjectsFromArray:", v8);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  return v70;
}

uint64_t __92__PXStoryVisionDetailedSaliencyProducer_effectiveSaliencyAreasFromTiledVisionSaliencyAreas___block_invoke_2(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, __n128, __n128, __n128, __n128, float))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3, a4, a5, 0.9);
}

uint64_t __92__PXStoryVisionDetailedSaliencyProducer_effectiveSaliencyAreasFromTiledVisionSaliencyAreas___block_invoke_3(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, __n128, __n128, __n128, __n128, float))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3, a4, a5, 0.1);
}

void __92__PXStoryVisionDetailedSaliencyProducer_effectiveSaliencyAreasFromTiledVisionSaliencyAreas___block_invoke(double x, double y, double width, double height, float a5, uint64_t a6, void *a7)
{
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  PXStoryConcreteSaliencyArea *v23;
  double v24;
  PXStoryConcreteSaliencyArea *v25;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v27 = a7;
  v11 = objc_msgSend(v27, "count");
  if (v11 - 1 >= 0)
  {
    v12 = v11;
    v13 = v27;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", --v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contentsRect");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;

      v28.origin.x = v16;
      v28.origin.y = v18;
      v28.size.width = v20;
      v28.size.height = v22;
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      if (CGRectIntersectsRect(v28, v31))
      {
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = height;
        v32.origin.x = v16;
        v32.origin.y = v18;
        v32.size.width = v20;
        v32.size.height = v22;
        v30 = CGRectUnion(v29, v32);
        x = v30.origin.x;
        y = v30.origin.y;
        width = v30.size.width;
        height = v30.size.height;
        objc_msgSend(v27, "removeObjectAtIndex:", v12);
      }
      v13 = v27;
    }
    while (v12 > 0);
  }
  v23 = [PXStoryConcreteSaliencyArea alloc];
  *(float *)&v24 = a5;
  v25 = -[PXStoryConcreteSaliencyArea initWithContentsRect:confidence:](v23, "initWithContentsRect:confidence:", x, y, width, height, v24);
  objc_msgSend(v27, "addObject:", v25);

}

@end

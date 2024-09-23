@implementation PXStoryConcreteTimelineProducer

- (PXStoryConcreteTimelineProducer)init
{
  PXStoryConcreteTimelineProducer *v2;
  void *v3;
  double v4;
  double v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  id v9;
  os_log_t v10;
  OS_os_log *log;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXStoryConcreteTimelineProducer;
  v2 = -[PXStoryConcreteTimelineProducer init](&v13, sel_init);
  if (v2)
  {
    +[PXStoryConcreteTimelineSettings sharedInstance](PXStoryConcreteTimelineSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_initialProductionCountLimit = objc_msgSend(v3, "initialProductionCountLimit");
    objc_msgSend(v3, "initialProductionTimeLimit");
    v2->_initialProductionTimeLimit = v4;
    objc_msgSend(v3, "subsequentProductionTimeLimit");
    v2->_subsequentProductionTimeLimit = v5;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (const char *)*MEMORY[0x1E0D744D8];
    v9 = objc_retainAutorelease(v7);
    v10 = os_log_create(v8, (const char *)objc_msgSend(v9, "UTF8String"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v10;

  }
  return v2;
}

- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  PXStoryConcreteTimelineParser *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  PXStoryConcreteTimelineParser *v15;
  NSObject *v16;
  void (**v17)(_QWORD);
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  void *v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v41;
  id v42;
  _QWORD v43[4];
  NSObject *v44;
  id v45;
  PXStoryConcreteTimelineParser *v46;
  void (**v47)(_QWORD);
  os_signpost_id_t v48;
  uint64_t v49;
  _QWORD aBlock[4];
  PXStoryConcreteTimelineParser *v51;
  NSObject *v52;
  id v53;
  os_signpost_id_t v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (a4 & 5) != 4;
  if ((a4 & 5) == 5)
  {
    v10 = a4 & 1;
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      PXStoryProducerRequestOptionsDescription(a4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v41;
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "invalid timeline production options %@", buf, 0xCu);

    }
  }
  v12 = -[PXStoryConcreteTimelineParser initWithConfiguration:]([PXStoryConcreteTimelineParser alloc], "initWithConfiguration:", v8);
  -[PXStoryConcreteTimelineProducer log](self, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_make_with_pointer(v13, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PXStoryConcreteTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E513A6B0;
  v15 = v12;
  v51 = v15;
  v16 = v13;
  v52 = v16;
  v54 = v14;
  v42 = v9;
  v53 = v42;
  v17 = (void (**)(_QWORD))_Block_copy(aBlock);
  v18 = v16;
  v19 = v18;
  v20 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    PXStoryProducerRequestOptionsDescription(a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v56 = v21;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v14, "StoryTimelineTotalProduction", "Options=%{public}@", buf, 0xCu);

  }
  if (v10)
  {
    if ((a4 & 2) != 0)
    {
      v22 = objc_msgSend(v8, "rangeOfPrioritizedDisplayAssetResources");
      if (v23)
        -[PXStoryConcreteTimelineParser setPreferredInitialDisplayAssetResourceIndex:](v15, "setPreferredInitialDisplayAssetResourceIndex:", v22);
      +[PXStoryConcreteTimelineSettings sharedInstance](PXStoryConcreteTimelineSettings, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "rotationInitialProductionTimeLimit");
      -[PXStoryConcreteTimelineParser setParseTimeLimit:](v15, "setParseTimeLimit:");
      -[PXStoryConcreteTimelineParser setParseCountLimit:](v15, "setParseCountLimit:", objc_msgSend(v24, "rotationInitialProductionCountLimit"));

    }
    else
    {
      -[PXStoryConcreteTimelineProducer initialProductionTimeLimit](self, "initialProductionTimeLimit");
      -[PXStoryConcreteTimelineParser setParseTimeLimit:](v15, "setParseTimeLimit:");
      -[PXStoryConcreteTimelineParser setParseCountLimit:](v15, "setParseCountLimit:", -[PXStoryConcreteTimelineProducer initialProductionCountLimit](self, "initialProductionCountLimit"));
    }
    v25 = v19;
    v26 = v25;
    if (v20 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v17[2](v17);
      v28 = v26;
    }
    else
    {
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v14, "StoryTimelineInitialProduction", ", buf, 2u);
      }

      v17[2](v17);
      v27 = v26;
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v27, OS_SIGNPOST_INTERVAL_END, v14, "StoryTimelineInitialProduction", ", buf, 2u);
      }
    }

  }
  if (-[PXStoryConcreteTimelineParser isAtEnd](v15, "isAtEnd"))
  {
    v29 = v19;
    v30 = v29;
    if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v30, OS_SIGNPOST_INTERVAL_END, v14, "StoryTimelineTotalProduction", ", buf, 2u);
    }
    v31 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a4 & 4) != 0)
    {
      -[PXStoryConcreteTimelineParser setParseTimeLimit:](v15, "setParseTimeLimit:", 0.0);
      v33 = 0;
    }
    else
    {
      -[PXStoryConcreteTimelineProducer subsequentProductionTimeLimit](self, "subsequentProductionTimeLimit");
      -[PXStoryConcreteTimelineParser setParseTimeLimit:](v15, "setParseTimeLimit:");
      v33 = -[PXStoryConcreteTimelineProducer subsequentProductionCountLimit](self, "subsequentProductionCountLimit");
    }
    -[PXStoryConcreteTimelineParser setParseCountLimit:](v15, "setParseCountLimit:", v33);
    -[PXStoryConcreteTimelineProducer subsequentProductionSimulatedDelay](self, "subsequentProductionSimulatedDelay");
    v35 = v34;
    objc_msgSend(v8, "loadingCoordinator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      v38 = v36;
    }
    else
    {
      PXStoryFallbackLoadingCoordinator();
      v38 = objc_claimAutoreleasedReturnValue();
    }
    v30 = v38;

    objc_msgSend((id)objc_opt_class(), "workQueue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __90__PXStoryConcreteTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke_4;
    v43[3] = &unk_1E513A6D8;
    v44 = v19;
    v48 = v14;
    v31 = v32;
    v45 = v31;
    v46 = v15;
    v49 = v35;
    v47 = v17;
    -[NSObject dispatchTimelineWorkAsyncOnQueue:block:](v30, "dispatchTimelineWorkAsyncOnQueue:block:", v39, v43);

  }
  return v31;
}

- (double)initialProductionTimeLimit
{
  return self->_initialProductionTimeLimit;
}

- (void)setInitialProductionTimeLimit:(double)a3
{
  self->_initialProductionTimeLimit = a3;
}

- (int64_t)initialProductionCountLimit
{
  return self->_initialProductionCountLimit;
}

- (void)setInitialProductionCountLimit:(int64_t)a3
{
  self->_initialProductionCountLimit = a3;
}

- (double)subsequentProductionTimeLimit
{
  return self->_subsequentProductionTimeLimit;
}

- (void)setSubsequentProductionTimeLimit:(double)a3
{
  self->_subsequentProductionTimeLimit = a3;
}

- (int64_t)subsequentProductionCountLimit
{
  return self->_subsequentProductionCountLimit;
}

- (void)setSubsequentProductionCountLimit:(int64_t)a3
{
  self->_subsequentProductionCountLimit = a3;
}

- (double)subsequentProductionSimulatedDelay
{
  return self->_subsequentProductionSimulatedDelay;
}

- (void)setSubsequentProductionSimulatedDelay:(double)a3
{
  self->_subsequentProductionSimulatedDelay = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

void __90__PXStoryConcreteTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  PXStoryProducerResult *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint8_t v13[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "parseNextBestTimeline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "isAtEnd") ^ 1;
  v4 = *(id *)(a1 + 40);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StoryTimelineResultDelivery", ", buf, 2u);
  }

  v7 = *(_QWORD *)(a1 + 48);
  v8 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v2);
  -[PXStoryProducerResult flags:](v8, "flags:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  v10 = *(id *)(a1 + 40);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_END, v12, "StoryTimelineResultDelivery", ", v13, 2u);
  }

}

void __90__PXStoryConcreteTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "StoryTimelineSubsequentProduction", ", (uint8_t *)&v13, 2u);
  }

  if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) == 0)
  {
    do
    {
      if ((objc_msgSend(*(id *)(a1 + 48), "isAtEnd") & 1) != 0)
        break;
      v5 = (void *)MEMORY[0x1A85CE17C]();
      objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", *(double *)(a1 + 72));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      objc_autoreleasePoolPop(v5);
    }
    while (!objc_msgSend(*(id *)(a1 + 40), "isCancelled"));
  }
  v6 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v13 = 138412290;
    v14 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v8, "StoryTimelineSubsequentProduction", "progress:%@", (uint8_t *)&v13, 0xCu);
  }

  v10 = *(id *)(a1 + 32);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 64);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_END, v12, "StoryTimelineTotalProduction", ", (uint8_t *)&v13, 2u);
  }

}

+ (OS_dispatch_queue)workQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PXStoryConcreteTimelineProducer_workQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (workQueue_onceToken_231624 != -1)
    dispatch_once(&workQueue_onceToken_231624, block);
  return (OS_dispatch_queue *)(id)workQueue_workQueue_231625;
}

void __44__PXStoryConcreteTimelineProducer_workQueue__block_invoke(uint64_t a1)
{
  const char *v1;
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;

  NSStringFromClass(*(Class *)(a1 + 32));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = (const char *)objc_msgSend(v6, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_USER_INITIATED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create(v1, v3);
  v5 = (void *)workQueue_workQueue_231625;
  workQueue_workQueue_231625 = (uint64_t)v4;

}

@end

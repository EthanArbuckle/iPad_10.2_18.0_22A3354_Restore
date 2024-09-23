@implementation PXStoryMemoryAutoCurationProducer

- (PXStoryMemoryAutoCurationProducer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryAutoCurationProducer.m"), 31, CFSTR("%s is not available as initializer"), "-[PXStoryMemoryAutoCurationProducer init]");

  abort();
}

- (PXStoryMemoryAutoCurationProducer)initWithMemory:(id)a3
{
  id v5;
  PXStoryMemoryAutoCurationProducer *v6;
  PXStoryMemoryAutoCurationProducer *v7;
  objc_class *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *workQueue;
  NSCache *v15;
  NSCache *curationCache;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryMemoryAutoCurationProducer;
  v6 = -[PXStoryMemoryAutoCurationProducer init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_memory, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v10, v12);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v13;

    v15 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    curationCache = v7->_curationCache;
    v7->_curationCache = v15;

  }
  return v7;
}

- (id)requestCurationLengthsWithOptions:(unint64_t)a3 allAssets:(id)a4 curatedAssets:(id)a5 resultHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  void *v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  id v32;
  id v33;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[PXStoryMemoryAutoCurationProducer memory](self, "memory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__PXStoryMemoryAutoCurationProducer_requestCurationLengthsWithOptions_allAssets_curatedAssets_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5148370;
  v30 = v12;
  v31 = v9;
  v32 = v10;
  v33 = v11;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  v17 = v12;
  v18 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryMemoryAutoCurationProducer workQueue](self, "workQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __109__PXStoryMemoryAutoCurationProducer_requestCurationLengthsWithOptions_allAssets_curatedAssets_resultHandler___block_invoke_2;
  v26[3] = &unk_1E5148CE0;
  v21 = v19;
  v27 = v21;
  v28 = v18;
  v22 = v18;
  dispatch_async(v20, v26);

  v23 = v28;
  v24 = v21;

  return v24;
}

- (id)requestCuratedAssetsWithOptions:(unint64_t)a3 targetOverallDurationInfo:(id *)a4 resultHandler:(id)a5
{
  void (**v7)(id, PXStoryProducerResult *);
  void *v8;
  void *v9;
  void *v10;
  PXStoryProducerResult *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  PXStoryMemoryAutoCurationProducer *v19;
  id v20;
  void (**v21)(id, PXStoryProducerResult *);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v7 = (void (**)(id, PXStoryProducerResult *))a5;
  -[PXStoryMemoryAutoCurationProducer memory](self, "memory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a4, "{?=q{?={?=qiIq}{?=qiIq}{?=qiIq}}}");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_curationCache, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v10);
    v7[2](v7, v11);

    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __109__PXStoryMemoryAutoCurationProducer_requestCuratedAssetsWithOptions_targetOverallDurationInfo_resultHandler___block_invoke;
    v17[3] = &unk_1E51276B8;
    v13 = *(_OWORD *)&a4->var1.var1.var3;
    v24 = *(_OWORD *)&a4->var1.var1.var0;
    v25 = v13;
    v26 = *(_OWORD *)&a4->var1.var2.var1;
    v14 = *(_OWORD *)&a4->var1.var0.var1;
    v22 = *(_OWORD *)&a4->var0;
    v23 = v14;
    v18 = v8;
    v19 = self;
    v20 = v9;
    v21 = v7;
    v15 = _Block_copy(v17);
    dispatch_async((dispatch_queue_t)self->_workQueue, v15);

  }
  return v12;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_curationCache, 0);
}

void __109__PXStoryMemoryAutoCurationProducer_requestCuratedAssetsWithOptions_targetOverallDurationInfo_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  PXStoryProducerResult *v19;
  NSObject *v20;
  CMTimeValue v21;
  uint64_t v22;
  PXStoryProducerResult *v23;
  uint64_t v24;
  id v25;
  CMTime time2;
  CMTime time1;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 64) == 2)
  {
    time1 = *(CMTime *)(a1 + 96);
    time2 = *(CMTime *)(MEMORY[0x1E0D759A0] + 24);
    if (CMTimeCompare(&time1, &time2))
    {
      v29 = *MEMORY[0x1E0CD1CF0];
      time1 = *(CMTime *)(a1 + 96);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(&time1));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PXStoryErrorCreateWithCodeDebugFormat(16, CFSTR("Must specify a valid preferredDuration with PFStoryOverallDurationKindCustom"), v2, v3, v4, v5, v6, v7, v24);
      v18 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0C9AA70];
      if (v18)
      {
        v15 = (void *)v18;
        v12 = 0;
        goto LABEL_22;
      }
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }
  v10 = PHMemoryCurationLengthFromPFStoryOverallDurationKind(*(_QWORD *)(a1 + 64));
  v11 = *(void **)(a1 + 32);
  v25 = 0;
  objc_msgSend(v11, "fetchAssetsWithCurationOfLength:options:error:", v10, v9, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;
  if (v13)
    v14 = 1;
  else
    v14 = v12 == 0;
  if (v14)
  {
    v15 = v13;
    PLStoryGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v17)
      {
        LODWORD(time1.value) = 134218242;
        *(CMTimeValue *)((char *)&time1.value + 4) = v10;
        LOWORD(time1.flags) = 2112;
        *(_QWORD *)((char *)&time1.flags + 2) = v15;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Received error response when attempting to fetch assets with a curation length of: %lu. %@", (uint8_t *)&time1, 0x16u);
      }

      goto LABEL_22;
    }
    if (v17)
    {
      LODWORD(time1.value) = 134217984;
      *(CMTimeValue *)((char *)&time1.value + 4) = v10;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Received nil response when attempting to fetch assets with a curation of length of: %lu", (uint8_t *)&time1, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", v12, *(_QWORD *)(a1 + 48));
  }
  if (objc_msgSend(v12, "count"))
  {
    v19 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v12);
    v15 = 0;
    goto LABEL_25;
  }
  v15 = 0;
LABEL_22:
  PLStoryGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v22 = *(_QWORD *)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 40);
    LODWORD(time1.value) = 138412802;
    *(CMTimeValue *)((char *)&time1.value + 4) = v21;
    LOWORD(time1.flags) = 2112;
    *(_QWORD *)((char *)&time1.flags + 2) = v15;
    HIWORD(time1.epoch) = 2112;
    v28 = v22;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "%@: curationOfLength returned error: %@ memory:%@", (uint8_t *)&time1, 0x20u);
  }

  v23 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", 0);
  -[PXStoryProducerResult error:](v23, "error:", v15);
  v19 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();

LABEL_25:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __109__PXStoryMemoryAutoCurationProducer_requestCurationLengthsWithOptions_allAssets_curatedAssets_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  PXStoryProducerResult *v5;
  void *v6;
  void *v7;
  PXStoryCurationLengthInfo *v8;

  objc_msgSend(*(id *)(a1 + 32), "photosGraphVersion");
  if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() > 0x300)
  {
    +[PXStoryMemoryAutoCurationProducer _optionsForAssets:](PXStoryMemoryAutoCurationProducer, "_optionsForAssets:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXStoryMemoryAutoCurationProducer _optionsForAssets:](PXStoryMemoryAutoCurationProducer, "_optionsForAssets:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXStoryCurationLengthInfo initWithAvailableLengths:defaultLength:]([PXStoryCurationLengthInfo alloc], "initWithAvailableLengths:defaultLength:", objc_msgSend(*(id *)(a1 + 32), "availableCurationLengthsWithOptions:", v2), objc_msgSend(*(id *)(a1 + 32), "currentCurationLengthWithOptions:", v3));

  }
  else
  {
    v8 = -[PXStoryCurationLengthInfo initWithAvailableLengths:defaultLength:]([PXStoryCurationLengthInfo alloc], "initWithAvailableLengths:defaultLength:", 0, 0);
  }
  v4 = *(_QWORD *)(a1 + 56);
  v5 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v8);
  -[PXStoryProducerResult flags:](v5, "flags:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "error:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);

}

uint64_t __109__PXStoryMemoryAutoCurationProducer_requestCurationLengthsWithOptions_allAssets_curatedAssets_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

+ (id)_optionsForAssets:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "countOfAssetsWithMediaType:", 1);
  v5 = objc_msgSend(v3, "countOfAssetsWithMediaType:", 2);

  v10[0] = *MEMORY[0x1E0CD1CE0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v10[1] = *MEMORY[0x1E0CD1CE8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end

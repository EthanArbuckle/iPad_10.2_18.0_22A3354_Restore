@implementation PXStoryErrorRepository

- (PXStoryErrorRepository)init
{
  return -[PXStoryErrorRepository initWithQueue:](self, "initWithQueue:", 0);
}

- (PXStoryErrorRepository)initWithQueue:(id)a3
{
  id v4;
  PXStoryErrorRepository *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *errorsByComponent;
  NSMutableArray *v8;
  NSMutableArray *errors;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *storyQueue;
  OS_dispatch_queue *v12;
  id v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryErrorRepository;
  v5 = -[PXStoryErrorRepository init](&v15, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    errorsByComponent = v5->_errorsByComponent;
    v5->_errorsByComponent = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    errors = v5->_errors;
    v5->_errors = v8;

    if (v4)
    {
      v10 = (OS_dispatch_queue *)v4;
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v10;
    }
    else
    {
      v12 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C80D38];
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v12;
    }

  }
  return v5;
}

- (NSArray)errors
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_errors, "copy");
}

- (NSDictionary)errorsByComponent
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_errorsByComponent, "copy");
}

- (void)setError:(id)a3 forComponent:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXStoryErrorRepository log](self, "log");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 134218498;
      v18 = -[PXStoryErrorRepository logContext](self, "logContext");
      v19 = 2114;
      v20 = v7;
      v21 = 2112;
      v22 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryError", "Context=%{signpost.telemetry:string2}lu Component=%{signpost.description:attribute,public}@ Error=%{signpost.description:attribute}@ ", buf, 0x20u);
    }
  }

  -[PXStoryErrorRepository storyQueue](self, "storyQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PXStoryErrorRepository_setError_forComponent___block_invoke;
  block[3] = &unk_1E51457C8;
  block[4] = self;
  v15 = v7;
  v16 = v6;
  v12 = v6;
  v13 = v7;
  dispatch_async(v11, block);

}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_errorsByComponent, 0);
}

void __48__PXStoryErrorRepository_setError_forComponent___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 48);
  if (v3 == v2)
  {

  }
  else
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "isEqual:", v2);

    if ((v5 & 1) == 0)
    {
      PLStoryGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v26 = v7;
        v27 = 2114;
        v28 = v8;
        _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Error for component %{public}@: %{public}@", buf, 0x16u);
      }

      if (*(_QWORD *)(a1 + 48))
      {
        v9 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend((id)objc_opt_class(), "analyticsNameForComponent:", *(_QWORD *)(a1 + 40));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("com.apple.photos.memory.interactiveMemoryErrorOccurredIn%@"), v10);

        v12 = *(_QWORD *)(a1 + 48);
        v23 = *MEMORY[0x1E0D09838];
        v24 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.memory.interactiveMemoryErrorOccurred"), v13);
        objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v11, v13);

      }
      v14 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __48__PXStoryErrorRepository_setError_forComponent___block_invoke_11;
      v18[3] = &unk_1E512D718;
      v15 = v2;
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(a1 + 40);
      v19 = v15;
      v20 = v16;
      v21 = v17;
      v22 = *(id *)(a1 + 48);
      objc_msgSend(v14, "performChanges:", v18);

    }
  }

}

void __48__PXStoryErrorRepository_setError_forComponent___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "removeObject:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "addObject:");
  objc_msgSend(*(id *)(a1 + 40), "signalChange:", 1);

}

+ (id)analyticsNameForComponent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PXMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", &stru_1E5149688);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __52__PXStoryErrorRepository_analyticsNameForComponent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "capitalizedString");
}

@end

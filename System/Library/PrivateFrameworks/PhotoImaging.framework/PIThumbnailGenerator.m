@implementation PIThumbnailGenerator

- (PIThumbnailGenerator)init
{
  PIThumbnailGenerator *v2;
  NSArray *thumbnailTimes;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PIThumbnailGenerator;
  v2 = -[PIThumbnailGenerator init](&v8, sel_init);
  thumbnailTimes = v2->_thumbnailTimes;
  v2->_thumbnailTimes = (NSArray *)MEMORY[0x1E0C9AA60];

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create("PIThumbnailGenerator", v4);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  objc_storeStrong((id *)&v2->_resultQueue, MEMORY[0x1E0C80D38]);
  return v2;
}

- (void)setThumbnailTimes:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *thumbnailTimes;
  NSArray *unadjustedThumbnails;
  NSObject *v8;
  void *v9;
  const void **v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_13883();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "times != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v10 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_13883();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific(*v10);
        v17 = (void *)MEMORY[0x1E0CB3978];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v16;
        v24 = 2114;
        v25 = v20;
        _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v21 = v4;
  if (!-[NSArray isEqualToArray:](self->_thumbnailTimes, "isEqualToArray:", v4))
  {
    v5 = (NSArray *)objc_msgSend(v21, "copy");
    thumbnailTimes = self->_thumbnailTimes;
    self->_thumbnailTimes = v5;

    unadjustedThumbnails = self->_unadjustedThumbnails;
    self->_unadjustedThumbnails = 0;

  }
}

- (void)setThumbnailScalePolicy:(id)a3
{
  NSArray *unadjustedThumbnails;
  id v6;

  v6 = a3;
  if ((-[NUScalePolicy isEqual:](self->_thumbnailScalePolicy, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_thumbnailScalePolicy, a3);
    unadjustedThumbnails = self->_unadjustedThumbnails;
    self->_unadjustedThumbnails = 0;

  }
}

- (void)cancelThumbnailGeneration
{
  void *v3;
  _PIThumbnailGeneratorSnapshot *currentSnapshot;

  -[NUImageBufferRenderRequest renderContext](self->_renderRequest, "renderContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllRequests");

  currentSnapshot = self->_currentSnapshot;
  self->_currentSnapshot = 0;

}

- (void)generateThumbnailsWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  NSArray *thumbnailTimes;
  _PIThumbnailGeneratorSnapshot *v7;
  void *v8;
  void *v9;
  NUImageBufferRenderRequest *renderRequest;
  id v11;
  void *v12;
  NUImageBufferRenderRequest *v13;
  NUImageBufferRenderRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *queue;
  _PIThumbnailGeneratorSnapshot *v20;
  NSObject *v21;
  void *v22;
  const void **v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  _QWORD v43[5];
  _PIThumbnailGeneratorSnapshot *v44;
  __int128 v45;
  uint64_t v46;
  uint8_t buf[24];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_composition)
  {
    NUAssertLogger_13883();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing composition"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_13883();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v34 = dispatch_get_specific(*v23);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v23 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v37;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v31 = _NUAssertFailHandler();
    goto LABEL_27;
  }
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  thumbnailTimes = self->_thumbnailTimes;
  if (!thumbnailTimes)
  {
    NUAssertLogger_13883();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing tumbnail times"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v29;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    v30 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_13883();
    v25 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (!v30)
    {
      if (v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v33;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_29;
    }
LABEL_27:
    if (v31)
    {
      v38 = dispatch_get_specific(*v23);
      v39 = (void *)MEMORY[0x1E0CB3978];
      v40 = v38;
      objc_msgSend(v39, "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v42;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_29:

    _NUAssertFailHandler();
  }
  if (-[NSArray count](thumbnailTimes, "count"))
  {
    v7 = -[_PIThumbnailGeneratorSnapshot initWithGenerator:]([_PIThumbnailGeneratorSnapshot alloc], "initWithGenerator:", self);
    -[_PIThumbnailGeneratorSnapshot setCompletionHandler:](v7, "setCompletionHandler:", v5);
    memset(buf, 0, sizeof(buf));
    v8 = (void *)objc_opt_class();
    -[_PIThumbnailGeneratorSnapshot thumbnailTimes](v7, "thumbnailTimes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v8, "referenceTimeForTimes:", v9);
    else
      memset(buf, 0, sizeof(buf));

    v45 = *(_OWORD *)buf;
    v46 = *(_QWORD *)&buf[16];
    -[_PIThumbnailGeneratorSnapshot setReferenceTime:](v7, "setReferenceTime:", &v45);
    renderRequest = self->_renderRequest;
    if (!renderRequest)
    {
      v11 = objc_alloc(MEMORY[0x1E0D52130]);
      -[_PIThumbnailGeneratorSnapshot composition](v7, "composition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (NUImageBufferRenderRequest *)objc_msgSend(v11, "initWithComposition:", v12);
      v14 = self->_renderRequest;
      self->_renderRequest = v13;

      objc_msgSend(MEMORY[0x1E0D52068], "displayP3ColorSpace");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUImageBufferRenderRequest setColorSpace:](self->_renderRequest, "setColorSpace:", v15);

      -[NUImageBufferRenderRequest setResponseQueue:](self->_renderRequest, "setResponseQueue:", self->_queue);
      renderRequest = self->_renderRequest;
    }
    if (self->_thumbnailScalePolicy)
    {
      -[NUImageBufferRenderRequest setScalePolicy:](renderRequest, "setScalePolicy:");
      renderRequest = self->_renderRequest;
    }
    v16 = (void *)-[NUImageBufferRenderRequest copy](renderRequest, "copy");
    -[_PIThumbnailGeneratorSnapshot setRequest:](v7, "setRequest:", v16);

    -[_PIThumbnailGeneratorSnapshot composition](v7, "composition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIThumbnailGeneratorSnapshot request](v7, "request");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setComposition:", v17);

    queue = self->_queue;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __57__PIThumbnailGenerator_generateThumbnailsWithCompletion___block_invoke;
    v43[3] = &unk_1E5018F40;
    v43[4] = self;
    v44 = v7;
    v20 = v7;
    dispatch_async(queue, v43);

  }
  else
  {
    v5[2](v5, MEMORY[0x1E0C9AA60], 0);
  }

}

- (void)generateThumbnailsWithPendingSnapshot:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PIThumbnailGenerator_generateThumbnailsWithPendingSnapshot___block_invoke;
  v7[3] = &unk_1E5018F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_generateThumbnailsWithPendingSnapshot:(id)a3
{
  _PIThumbnailGeneratorSnapshot *currentSnapshot;
  void *v5;
  id v6;

  v6 = a3;
  currentSnapshot = self->_currentSnapshot;
  self->_currentSnapshot = 0;

  v5 = v6;
  if (v6)
  {
    -[PIThumbnailGenerator _generateThumbnailsWithSnapshot:](self, "_generateThumbnailsWithSnapshot:", v6);
    v5 = v6;
  }

}

- (void)_generateThumbnailsWithSnapshot:(id)a3
{
  id v5;
  NSArray *unadjustedThumbnails;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  PIThumbnailGenerator *v11;

  v5 = a3;
  if (self->_currentSnapshot)
  {
    -[_PIThumbnailGeneratorSnapshot setPendingSnapshot:](self->_currentSnapshot, "setPendingSnapshot:", v5);
  }
  else
  {
    objc_storeStrong((id *)&self->_currentSnapshot, a3);
    unadjustedThumbnails = self->_unadjustedThumbnails;
    if (unadjustedThumbnails
      && (v7 = -[NSArray count](unadjustedThumbnails, "count"), v7 == -[NSArray count](self->_thumbnailTimes, "count")))
    {
      objc_msgSend(v5, "setUnadjustedThumbnails:", self->_unadjustedThumbnails);
      objc_msgSend((id)objc_opt_class(), "_generateAdjustedThumbnailsWithSnapshot:", v5);
    }
    else
    {
      v8 = (void *)objc_opt_class();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __56__PIThumbnailGenerator__generateThumbnailsWithSnapshot___block_invoke;
      v9[3] = &unk_1E50182A8;
      v10 = v5;
      v11 = self;
      objc_msgSend(v8, "_generateUnadjustedThumbnailsWithSnapshot:completion:", v10, v9);

    }
  }

}

- (NUComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)thumbnailTimes
{
  return self->_thumbnailTimes;
}

- (NUScalePolicy)thumbnailScalePolicy
{
  return self->_thumbnailScalePolicy;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setReferenceTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_referenceTime.epoch = a3->var3;
  *(_OWORD *)&self->_referenceTime.value = v3;
}

- (OS_dispatch_queue)resultQueue
{
  return self->_resultQueue;
}

- (void)setResultQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultQueue, a3);
}

- (id)partialResultHandler
{
  return self->_partialResultHandler;
}

- (void)setPartialResultHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_partialResultHandler, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_thumbnailScalePolicy, 0);
  objc_storeStrong((id *)&self->_thumbnailTimes, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_renderRequest, 0);
  objc_storeStrong((id *)&self->_unadjustedThumbnails, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

void __56__PIThumbnailGenerator__generateThumbnailsWithSnapshot___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "unadjustedThumbnails");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v6;

    objc_msgSend((id)objc_opt_class(), "_generateAdjustedThumbnailsWithSnapshot:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Unable to generate unadjusted thumbnail"), *(_QWORD *)(a1 + 32), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 64);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__PIThumbnailGenerator__generateThumbnailsWithSnapshot___block_invoke_2;
    v12[3] = &unk_1E5018F40;
    v13 = v10;
    v5 = v9;
    v14 = v5;
    dispatch_async(v11, v12);

  }
}

void __56__PIThumbnailGenerator__generateThumbnailsWithSnapshot___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, 0, *(_QWORD *)(a1 + 40));

}

uint64_t __62__PIThumbnailGenerator_generateThumbnailsWithPendingSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateThumbnailsWithPendingSnapshot:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__PIThumbnailGenerator_generateThumbnailsWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateThumbnailsWithSnapshot:", *(_QWORD *)(a1 + 40));
}

+ (void)_generateUnadjustedThumbnailsWithSnapshot:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[3];
  char v32;
  _QWORD v33[5];
  id v34;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thumbnailTimes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "pipelineFiltersForUnadjustedThumbnail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPipelineFilters:", v10);

  objc_msgSend(v8, "setName:", CFSTR("PIThumbnailGenerator-UnadjustedThumbnail"));
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__13951;
  v33[4] = __Block_byref_object_dispose__13952;
  v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 1;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__13951;
  v29[4] = __Block_byref_object_dispose__13952;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0D52290], "begin");
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __77__PIThumbnailGenerator__generateUnadjustedThumbnailsWithSnapshot_completion___block_invoke;
  v23[3] = &unk_1E50182F8;
  v12 = v8;
  v27 = v29;
  v28 = a1;
  v24 = v12;
  v25 = v33;
  v26 = v31;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);
  v13 = (void *)MEMORY[0x1E0D52290];
  objc_msgSend(v12, "responseQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __77__PIThumbnailGenerator__generateUnadjustedThumbnailsWithSnapshot_completion___block_invoke_3;
  v17[3] = &unk_1E5018320;
  v20 = v31;
  v15 = v6;
  v18 = v15;
  v21 = v33;
  v16 = v7;
  v19 = v16;
  v22 = v29;
  objc_msgSend(v13, "commitAndNotifyOnQueue:withBlock:", v14, v17);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

}

+ (id)_sourceFromResult:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0C9DDC8];
  v4 = a3;
  objc_msgSend(v4, "buffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithCVPixelBuffer:", objc_msgSend(v5, "CVPixelBuffer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "extent");
  v7 = NUPixelSizeFromCGSize();
  v9 = v8;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52030]), "initWithCIImage:orientation:", v6, 1);
  objc_msgSend(v4, "geometry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "size");
  v14 = v13;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522C0]), "initWithSourceDefinition:sourceSize:fullSize:", v10, v7, v9, v12, v14);
  v16 = objc_alloc_init(MEMORY[0x1E0D522E0]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAssetIdentifier:", v18);

  objc_msgSend(v16, "setDefinition:", v15);
  return v16;
}

+ (void)_generateAdjustedThumbnailsWithSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 *v11;
  __int128 *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  id v37;
  uint64_t v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[3];
  char v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;

  v4 = a3;
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnailTimes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unadjustedThumbnails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0uLL;
  v52 = 0;
  if (v4)
    objc_msgSend(v4, "referenceTime");
  objc_msgSend(v4, "partialResultHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("semanticStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (__int128 *)MEMORY[0x1E0CA2E18];
  if (v10)
  {
    v49 = v51;
    v50 = v52;
    v12 = &v49;
  }
  else
  {
    v47 = *MEMORY[0x1E0CA2E18];
    v48 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v12 = &v47;
  }
  objc_msgSend(v5, "setTime:", v12);
  objc_msgSend(v5, "composition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("livePhotoKeyFrame"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v45 = *v11;
    v46 = *((_QWORD *)v11 + 2);
    objc_msgSend(v5, "setTime:", &v45);
  }
  objc_msgSend(v5, "setName:", CFSTR("PIThumbnailGenerator-AdjustedThumbnail"));
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 1;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__13951;
  v41[4] = __Block_byref_object_dispose__13952;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__13951;
  v39[4] = __Block_byref_object_dispose__13952;
  v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  objc_msgSend(MEMORY[0x1E0D52290], "begin");
  v15 = objc_msgSend(v7, "count");
  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke;
  v29[3] = &unk_1E5018398;
  v17 = v6;
  v30 = v17;
  v18 = v5;
  v37 = a1;
  v31 = v18;
  v34 = v39;
  v19 = v8;
  v33 = v19;
  v20 = v4;
  v32 = v20;
  v35 = v41;
  v36 = v43;
  v38 = v15;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v29);
  v21 = (void *)MEMORY[0x1E0D52290];
  objc_msgSend(v20, "resultQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke_4;
  v24[3] = &unk_1E50183C0;
  v23 = v20;
  v25 = v23;
  v26 = v43;
  v27 = v39;
  v28 = v41;
  objc_msgSend(v21, "commitAndNotifyOnQueue:withBlock:", v22, v24);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(v43, 8);
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceTimeForTimes:(SEL)a3
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v7;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  objc_msgSend(a4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "CMTimeValue");
    v5 = v7;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

+ (id)referenceSourceForTime:(id *)a3 thumbnailTimes:(id)a4 unadjustedSources:(id)a5
{
  id v6;
  void *v7;
  _QWORD v9[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__PIThumbnailGenerator_referenceSourceForTime_thumbnailTimes_unadjustedSources___block_invoke;
  v9[3] = &__block_descriptor_56_e24_B32__0__NSValue_8Q16_B24l;
  v10 = *a3;
  v6 = a5;
  objc_msgSend(v6, "objectAtIndex:", objc_msgSend(a4, "indexOfObjectPassingTest:", v9));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)pipelineFiltersForUnadjustedThumbnail
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_13937);
  objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("/ShowOriginalSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_122_13939);
  objc_msgSend(v4, "arrayByAddingObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)pipelineFiltersForAdjustedThumbnailRenderWithSource:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D52260]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PIThumbnailGenerator_pipelineFiltersForAdjustedThumbnailRenderWithSource___block_invoke;
  v9[3] = &unk_1E5019C50;
  v10 = v3;
  v5 = v3;
  v6 = (void *)objc_msgSend(v4, "initWithBlock:", v9);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __76__PIThumbnailGenerator_pipelineFiltersForAdjustedThumbnailRenderWithSource___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  objc_msgSend(*(id *)(a1 + 32), "definition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_163);
    v15 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      v26 = 138412290;
      v27 = v14;
      _os_log_impl(&dword_1A6382000, v15, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v26, 0xCu);
    }
  }
  objc_msgSend(v9, "renderNodeFromSource:settings:error:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA70], a5);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("semanticStyle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v9, "inputForPath:error:", CFSTR("semanticStyleLearn"), a5);
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        v24 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v20 = (void *)v19;
      objc_msgSend(MEMORY[0x1E0D52270], "styleTransferApplyNodeWithInput:thumbnail:target:settings:", v17, 0, v19, MEMORY[0x1E0C9AA70]);
      v21 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v21;
    }
    objc_msgSend(v9, "resetTag:input:", CFSTR("pre-WB"), v17);
    objc_msgSend(v9, "getTagWithPath:error:", CFSTR("pre-Mute"), a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v9, "resetTag:input:", CFSTR("pre-Trim"), v22);
      objc_msgSend(v9, "getTagWithPath:error:", CFSTR("pre-Trim"), a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resetTag:input:", CFSTR("pre-SmartTone"), v23);
      v24 = v11;

    }
    else
    {
      v24 = 0;
    }

    goto LABEL_16;
  }
  v24 = 0;
LABEL_17:

  return v24;
}

id __61__PIThumbnailGenerator_pipelineFiltersForUnadjustedThumbnail__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a2;
  v9 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("semanticStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "getTagWithPath:error:", CFSTR("pre-Adjustments"), a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v8, "resetTag:input:", CFSTR("/ShowOriginalSource"), v11);
      v12 = v9;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = v9;
  }

  return v12;
}

id __61__PIThumbnailGenerator_pipelineFiltersForUnadjustedThumbnail__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a2;
  objc_msgSend(v8, "resetTag:input:", CFSTR("/pre-Trim"), v7);
  objc_msgSend(v8, "getTagWithPath:error:", CFSTR("/Trim"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __80__PIThumbnailGenerator_referenceSourceForTime_thumbnailTimes_unadjustedSources___block_invoke(uint64_t a1, void *a2)
{
  CMTime v4;
  CMTime time2;

  if (a2)
    objc_msgSend(a2, "CMTimeValue");
  else
    memset(&time2, 0, sizeof(time2));
  v4 = *(CMTime *)(a1 + 32);
  return CMTimeCompare(&v4, &time2) == 0;
}

void __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;

  v32 = 0uLL;
  v33 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "CMTimeValue");
  }
  else
  {
    v32 = 0uLL;
    v33 = 0;
  }

  v9 = objc_alloc(MEMORY[0x1E0D520E0]);
  objc_msgSend(v6, "definition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "scale");
  v13 = (void *)objc_msgSend(v9, "initWithScale:", v11, v12);
  objc_msgSend(*(id *)(a1 + 40), "setScalePolicy:", v13);

  objc_msgSend((id)objc_opt_class(), "pipelineFiltersForAdjustedThumbnailRenderWithSource:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setPipelineFilters:", v14);
  v15 = *(void **)(a1 + 40);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke_2;
  v22[3] = &unk_1E5018370;
  v21 = *(_OWORD *)(a1 + 56);
  v16 = (id)v21;
  v25 = v21;
  v17 = *(id *)(a1 + 48);
  v28 = a3;
  v30 = v32;
  v31 = v33;
  v18 = *(_QWORD *)(a1 + 72);
  v23 = v17;
  v26 = v18;
  v19 = *(id *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 80);
  v24 = v19;
  v27 = v20;
  v29 = *(_QWORD *)(a1 + 96);
  objc_msgSend(v15, "submit:", v22);

}

void __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  else
    v3 = 0;
  v4 = (id)v2;
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

void __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  __CVBuffer *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  id v20;

  v20 = 0;
  objc_msgSend(a2, "result:", &v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v20;
  if (v3)
  {
    objc_msgSend(v3, "buffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CVBuffer *)objc_msgSend(v5, "CVPixelBuffer");

    CVPixelBufferGetIOSurface(v6);
    v7 = (void *)CGImageCreateFromIOSurface();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v7);

    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "resultQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke_3;
      block[3] = &unk_1E5018348;
      v15 = *(id *)(a1 + 48);
      v16 = v7;
      v17 = *(_QWORD *)(a1 + 80);
      v18 = *(_OWORD *)(a1 + 96);
      v19 = *(_QWORD *)(a1 + 112);
      dispatch_async(v8, block);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to render adjusted thumbnail"), *(_QWORD *)(a1 + 40), v4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }
  if (*(_QWORD *)(a1 + 88) == 1 || *(_QWORD *)(a1 + 80) == *(_QWORD *)(a1 + 88) - 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "generator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pendingSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "generateThumbnailsWithPendingSnapshot:", v13);

  }
}

uint64_t __64__PIThumbnailGenerator__generateAdjustedThumbnailsWithSnapshot___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, __int128 *);
  __int128 v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int128 *))(v2 + 16);
  v6 = *(_OWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 72);
  return v4(v2, v1, v3, &v6);
}

void __77__PIThumbnailGenerator__generateUnadjustedThumbnailsWithSnapshot_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  __int128 v6;
  id v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v3 = a2;
  v4 = v3;
  v14 = 0uLL;
  v15 = 0;
  if (v3)
    objc_msgSend(v3, "CMTimeValue");
  v12 = v14;
  v13 = v15;
  objc_msgSend(*(id *)(a1 + 32), "setTime:", &v12);
  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PIThumbnailGenerator__generateUnadjustedThumbnailsWithSnapshot_completion___block_invoke_2;
  v8[3] = &unk_1E50182D0;
  v6 = *(_OWORD *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 40);
  v11 = v6;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "submit:", v8);

}

uint64_t __77__PIThumbnailGenerator__generateUnadjustedThumbnailsWithSnapshot_completion___block_invoke_3(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "copy");
    objc_msgSend(*(id *)(a1 + 32), "setUnadjustedThumbnails:", v2);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__PIThumbnailGenerator__generateUnadjustedThumbnailsWithSnapshot_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = 0;
  objc_msgSend(a2, "result:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "_sourceFromResult:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v5);

  }
  else if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to render unadjusted image at time"), a1[4], v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[7] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }

}

@end

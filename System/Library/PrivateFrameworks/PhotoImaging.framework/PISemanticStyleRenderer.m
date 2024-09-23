@implementation PISemanticStyleRenderer

- (PISemanticStyleRenderer)init
{
  uint64_t *v3;
  os_log_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x1E0D52380];
    v5 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = v5;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_339_16199);
LABEL_7:
        v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_339_16199);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v20 = (void *)MEMORY[0x1E0CB3978];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_339_16199);
  }
}

- (PISemanticStyleRenderer)initWithMetalCommandQueue:(id)a3 processingType:(int)a4 useStyleEngine:(BOOL)a5
{
  id v9;
  void *v10;
  PISemanticStyleRenderer *v11;
  _QWORD *v12;
  id *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t sid;
  MTLCommandQueue *metalCommandQueue;
  NSObject *v20;
  PISemanticStyleRenderer *v21;
  const void **v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  PISemanticStyleRenderer *v27;
  PISemanticStyleRenderer *v28;
  void *v29;
  PISemanticStyleRenderer *v30;
  void *v31;
  MTLCommandQueue *v32;
  objc_super v33;
  uint8_t buf[4];
  PISemanticStyleRenderer *v35;
  __int16 v36;
  MTLCommandQueue *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    NUAssertLogger_16179();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "commandQueue != nil");
      v21 = (PISemanticStyleRenderer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_16179();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = (PISemanticStyleRenderer *)dispatch_get_specific(*v22);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (MTLCommandQueue *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v28;
        v36 = 2114;
        v37 = v32;
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (PISemanticStyleRenderer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v27;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  v33.receiver = self;
  v33.super_class = (Class)PISemanticStyleRenderer;
  v11 = -[PISemanticStyleRenderer init](&v33, sel_init);
  objc_storeStrong((id *)&v11->_metalCommandQueue, a3);
  v11->_processingType = a4;
  v11->_useStyleEngine = a5;
  v12 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_338);
  v13 = (id *)MEMORY[0x1E0D52398];
  v14 = (id)*MEMORY[0x1E0D52398];
  v11->_sid = os_signpost_id_make_with_pointer(v14, v11);

  if (*v12 != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_338);
  v15 = *v13;
  v16 = v15;
  sid = v11->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    metalCommandQueue = v11->_metalCommandQueue;
    *(_DWORD *)buf = 134218240;
    v35 = v11;
    v36 = 2048;
    v37 = metalCommandQueue;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v16, OS_SIGNPOST_INTERVAL_BEGIN, sid, "PISemanticStyleRenderer", "%p q=%p", buf, 0x16u);
  }

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t sid;
  MTLCommandQueue *metalCommandQueue;
  FigMetalContext *ctx;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  PISemanticStyleRenderer *v11;
  __int16 v12;
  MTLCommandQueue *v13;
  __int16 v14;
  FigMetalContext *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_338);
  v3 = (id)*MEMORY[0x1E0D52398];
  v4 = v3;
  sid = self->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    metalCommandQueue = self->_metalCommandQueue;
    ctx = self->_ctx;
    -[FigMetalContext allocator](ctx, "allocator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218752;
    v11 = self;
    v12 = 2048;
    v13 = metalCommandQueue;
    v14 = 2048;
    v15 = ctx;
    v16 = 2048;
    v17 = objc_msgSend(v8, "memSize");
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v4, OS_SIGNPOST_INTERVAL_END, sid, "PISemanticStyleRenderer", "%p q=%p ctx=%p mem=%zu", buf, 0x2Au);

  }
  v9.receiver = self;
  v9.super_class = (Class)PISemanticStyleRenderer;
  -[PISemanticStyleRenderer dealloc](&v9, sel_dealloc);
}

- (BOOL)prepareProcessor
{
  id v3;
  void *v4;
  void *v5;
  FigMetalContext *v6;
  FigMetalContext *ctx;
  id specific;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const void **v13;
  NSObject *v14;
  _BOOL4 v15;
  CMISmartStyleMetalRendererV1 *v16;
  CMISmartStyleMetalRendererV1 *processor;
  int v18;
  int v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  int v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  const void **v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  id v31;
  void *v32;
  int v34;
  const void **v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (self->_processor)
  {
    NUAssertLogger_16179();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Already prepared!"));
      v27 = (const void **)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v27;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v34, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_16179();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        specific = dispatch_get_specific(*v13);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = specific;
        objc_msgSend(v30, "callStackSymbols");
        v13 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = (const void **)specific;
        v36 = 2114;
        v37 = v32;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v34, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (const void **)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v13;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v34, 0xCu);

    }
    _NUAssertFailHandler();
    goto LABEL_31;
  }
  v3 = objc_alloc(MEMORY[0x1E0D08B28]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISemanticStyleRenderer metalCommandQueue](self, "metalCommandQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (FigMetalContext *)objc_msgSend(v3, "initWithbundle:andOptionalCommandQueue:", v4, v5);
  ctx = self->_ctx;
  self->_ctx = v6;

  if (self->_useStyleEngine)
  {
    specific = objc_alloc_init(MEMORY[0x1E0D08B20]);
    objc_msgSend(specific, "setMemSize:", 40894464);
    objc_msgSend(specific, "setWireMemory:", 1);
    -[PISemanticStyleRenderer description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(specific, "setLabel:", v9);

    v10 = objc_alloc(MEMORY[0x1E0D08B08]);
    -[FigMetalContext device](self->_ctx, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (const void **)objc_msgSend(v10, "initWithDevice:allocatorType:", v11, 2);
    -[FigMetalContext setAllocator:](self->_ctx, "setAllocator:", v13);

    -[FigMetalContext allocator](self->_ctx, "allocator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v12, "setupWithDescriptor:", specific);

    if ((_DWORD)v13)
    {
      if (*MEMORY[0x1E0D52390] == -1)
      {
LABEL_5:
        v14 = *MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
        {
          v34 = 67109120;
          LODWORD(v35) = (_DWORD)v13;
          _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Failed to setup FigMetalAllocator, err = %d", (uint8_t *)&v34, 8u);
        }

        goto LABEL_8;
      }
LABEL_31:
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_338);
      goto LABEL_5;
    }

  }
  v16 = (CMISmartStyleMetalRendererV1 *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08AC8]), "initWithMetalContext:", self->_ctx);
  processor = self->_processor;
  self->_processor = v16;

  v18 = -[CMISmartStyleMetalRendererV1 setup](self->_processor, "setup");
  if (v18)
  {
    v19 = v18;
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_338);
    v20 = *MEMORY[0x1E0D52398];
    v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR);
    if (v15)
    {
      v34 = 67109120;
      LODWORD(v35) = v19;
      v21 = "PISemanticStyleProcessor: setup failed with error %d";
      v22 = v20;
LABEL_20:
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v34, 8u);
LABEL_8:
      LOBYTE(v15) = 0;
    }
  }
  else
  {
    v23 = -[CMISmartStyleMetalRendererV1 prepareToProcess:](self->_processor, "prepareToProcess:", self->_processingType);
    if (!v23)
    {
      LOBYTE(v15) = 1;
      return v15;
    }
    v24 = v23;
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_338);
    v25 = *MEMORY[0x1E0D52398];
    v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR);
    if (v15)
    {
      v34 = 67109120;
      LODWORD(v35) = v24;
      v21 = "PISemanticStyleProcessor: prepare failed with error %d";
      v22 = v25;
      goto LABEL_20;
    }
  }
  return v15;
}

- (BOOL)matchesMetalCommandQueue:(id)a3 processingType:(int)a4 useStyleEngine:(BOOL)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[PISemanticStyleRenderer metalCommandQueue](self, "metalCommandQueue");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8 && -[PISemanticStyleRenderer processingType](self, "processingType") == a4)
    return -[PISemanticStyleRenderer useStyleEngine](self, "useStyleEngine") ^ a5 ^ 1;
  else
    return 0;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (int)processingType
{
  return self->_processingType;
}

- (BOOL)useStyleEngine
{
  return self->_useStyleEngine;
}

- (CMISmartStyleMetalRendererV1)processor
{
  return self->_processor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
}

+ (BOOL)usingSharedSemanticStyleRendererWithMetalCommandQueue:(id)a3 processingType:(int)a4 useStyleEngine:(BOOL)a5 perform:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  uint64_t (**v11)(id, void *);
  void *v12;
  void *v13;
  id v14;
  PISemanticStyleRenderer *v15;
  PISemanticStyleRenderer *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  int v27;
  BOOL v28;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = (uint64_t (**)(id, void *))a6;
  NSStringFromClass((Class)a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52288], "shared");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __119__PISemanticStyleRenderer_usingSharedSemanticStyleRendererWithMetalCommandQueue_processingType_useStyleEngine_perform___block_invoke;
  v25 = &unk_1E5018A30;
  v14 = v10;
  v26 = v14;
  v27 = v8;
  v28 = v7;
  objc_msgSend(v13, "checkOutResourceForKey:matching:", v12, &v22);
  v15 = (PISemanticStyleRenderer *)objc_claimAutoreleasedReturnValue();

  if (v15
    || (v16 = [PISemanticStyleRenderer alloc],
        v15 = -[PISemanticStyleRenderer initWithMetalCommandQueue:processingType:useStyleEngine:](v16, "initWithMetalCommandQueue:processingType:useStyleEngine:", v14, v8, v7, v22, v23, v24, v25), -[PISemanticStyleRenderer prepareProcessor](v15, "prepareProcessor")))
  {
    -[PISemanticStyleRenderer processor](v15, "processor", v22, v23, v24, v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v11[2](v11, v17);

    -[PISemanticStyleRenderer processor](v15, "processor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resetState");

    objc_msgSend(MEMORY[0x1E0D52288], "shared");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "checkInResource:forKey:", v15, v12);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __119__PISemanticStyleRenderer_usingSharedSemanticStyleRendererWithMetalCommandQueue_processingType_useStyleEngine_perform___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesMetalCommandQueue:processingType:useStyleEngine:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44));
}

@end

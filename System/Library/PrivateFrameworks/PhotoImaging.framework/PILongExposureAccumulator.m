@implementation PILongExposureAccumulator

- (PILongExposureAccumulator)initWithSize:(id)a3 renderer:(id)a4 jobNumber:(unint64_t)a5
{
  int64_t var1;
  int64_t var0;
  NURenderer *v9;
  PILongExposureAccumulator *v10;
  NURenderer *renderer;
  NURenderer *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NUSurfaceStorage *temporaryDestinationStorage;
  void *v18;
  uint64_t v19;
  NUSurfaceStorage *averageAccumulationStorage;
  void *v21;
  uint64_t v22;
  NUSurfaceStorage *minimumAccumulationStorage;
  void *v24;
  uint64_t v25;
  NUSurfaceStorage *maximumAccumulationStorage;
  uint64_t v27;
  NSMutableArray *inputFrames;
  dispatch_queue_t v29;
  OS_dispatch_queue *stateQueue;
  dispatch_queue_t v31;
  OS_dispatch_queue *accumQueue;
  dispatch_semaphore_t v33;
  OS_dispatch_semaphore *accumSemaphore;
  dispatch_semaphore_t v35;
  OS_dispatch_semaphore *readySemaphore;
  dispatch_group_t v37;
  OS_dispatch_group *doneGroup;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSDictionary *imageOptions;
  objc_super v46;
  _QWORD v47[3];
  _QWORD v48[4];

  var1 = a3.var1;
  var0 = a3.var0;
  v48[3] = *MEMORY[0x1E0C80C00];
  v9 = (NURenderer *)a4;
  v46.receiver = self;
  v46.super_class = (Class)PILongExposureAccumulator;
  v10 = -[PILongExposureAccumulator init](&v46, sel_init);
  v10->_pixelSize.width = var0;
  v10->_pixelSize.height = var1;
  renderer = v10->_renderer;
  v10->_renderer = v9;
  v12 = v9;

  v10->_jobNumber = a5;
  objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "surfaceStoragePool");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D52220], "RGBAh");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "newStorageWithSize:format:", v10->_pixelSize.width, v10->_pixelSize.height, v15);
  temporaryDestinationStorage = v10->_temporaryDestinationStorage;
  v10->_temporaryDestinationStorage = (NUSurfaceStorage *)v16;

  objc_msgSend(MEMORY[0x1E0D52220], "RGBAh");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v14, "newStorageWithSize:format:", v10->_pixelSize.width, v10->_pixelSize.height, v18);
  averageAccumulationStorage = v10->_averageAccumulationStorage;
  v10->_averageAccumulationStorage = (NUSurfaceStorage *)v19;

  objc_msgSend(MEMORY[0x1E0D52220], "RGBAh");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v14, "newStorageWithSize:format:", v10->_pixelSize.width, v10->_pixelSize.height, v21);
  minimumAccumulationStorage = v10->_minimumAccumulationStorage;
  v10->_minimumAccumulationStorage = (NUSurfaceStorage *)v22;

  objc_msgSend(MEMORY[0x1E0D52220], "RGBAh");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v14, "newStorageWithSize:format:", v10->_pixelSize.width, v10->_pixelSize.height, v24);
  maximumAccumulationStorage = v10->_maximumAccumulationStorage;
  v10->_maximumAccumulationStorage = (NUSurfaceStorage *)v25;

  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  inputFrames = v10->_inputFrames;
  v10->_inputFrames = (NSMutableArray *)v27;

  v29 = dispatch_queue_create("PILongExposureAccumulator.state", 0);
  stateQueue = v10->_stateQueue;
  v10->_stateQueue = (OS_dispatch_queue *)v29;

  v31 = dispatch_queue_create("PILongExposureAccumulator.accum", 0);
  accumQueue = v10->_accumQueue;
  v10->_accumQueue = (OS_dispatch_queue *)v31;

  v33 = dispatch_semaphore_create(0);
  accumSemaphore = v10->_accumSemaphore;
  v10->_accumSemaphore = (OS_dispatch_semaphore *)v33;

  v35 = dispatch_semaphore_create(3);
  readySemaphore = v10->_readySemaphore;
  v10->_readySemaphore = (OS_dispatch_semaphore *)v35;

  v37 = dispatch_group_create();
  doneGroup = v10->_doneGroup;
  v10->_doneGroup = (OS_dispatch_group *)v37;

  -[PILongExposureAccumulator workingColorSpace](v10, "workingColorSpace");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = *MEMORY[0x1E0C9E110];
  v40 = objc_msgSend(v39, "CGColorSpace");
  v41 = *MEMORY[0x1E0C9E0A8];
  v48[0] = v40;
  v48[1] = MEMORY[0x1E0C9AAB0];
  v42 = *MEMORY[0x1E0C9E0F8];
  v47[1] = v41;
  v47[2] = v42;
  v48[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
  v43 = objc_claimAutoreleasedReturnValue();
  imageOptions = v10->_imageOptions;
  v10->_imageOptions = (NSDictionary *)v43;

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  OS_dispatch_semaphore *accumSemaphore;
  OS_dispatch_semaphore *readySemaphore;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "surfaceStoragePool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "returnStorage:", self->_temporaryDestinationStorage);
  objc_msgSend(v4, "returnStorage:", self->_averageAccumulationStorage);
  objc_msgSend(v4, "returnStorage:", self->_minimumAccumulationStorage);
  objc_msgSend(v4, "returnStorage:", self->_maximumAccumulationStorage);
  accumSemaphore = self->_accumSemaphore;
  self->_accumSemaphore = 0;

  readySemaphore = self->_readySemaphore;
  self->_readySemaphore = 0;

  v7.receiver = self;
  v7.super_class = (Class)PILongExposureAccumulator;
  -[PILongExposureAccumulator dealloc](&v7, sel_dealloc);
}

- (id)workingColorSpace
{
  return (id)objc_msgSend(MEMORY[0x1E0D52068], "sRGBLinearColorSpace");
}

- (void)cancel
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D520A0], "canceledError:object:", CFSTR("Accumulation was cancelled"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PILongExposureAccumulator set_accumError:](self, "set_accumError:", v3);

}

- (BOOL)start:(id *)a3
{
  NSObject *doneGroup;
  NSObject *accumQueue;
  _QWORD block[5];

  doneGroup = self->_doneGroup;
  accumQueue = self->_accumQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PILongExposureAccumulator_start___block_invoke;
  block[3] = &unk_1E50195F0;
  block[4] = self;
  dispatch_group_async(doneGroup, accumQueue, block);
  return 1;
}

- (BOOL)_initializeStorage:(id)a3 image:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NURenderer *renderer;
  id v12;
  id v13;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 pixelSize;
  _QWORD v16[4];
  id v17;
  PILongExposureAccumulator *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v23;
  id *v24;
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
  -[PILongExposureAccumulator workingColorSpace](self, "workingColorSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  renderer = self->_renderer;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__PILongExposureAccumulator__initializeStorage_image_error___block_invoke;
  v16[3] = &unk_1E5017DB8;
  pixelSize = self->_pixelSize;
  v12 = v10;
  v17 = v12;
  v18 = self;
  v13 = v9;
  v21 = 0;
  v22 = 0;
  v23 = pixelSize;
  v24 = a5;
  v19 = v13;
  v20 = &v25;
  objc_msgSend(v8, "useAsCIRenderDestinationWithRenderer:block:", renderer, v16);
  LOBYTE(a5) = *((_BYTE *)v26 + 24) == 0;

  _Block_object_dispose(&v25, 8);
  return (char)a5;
}

- (BOOL)isReadyForMoreData
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PILongExposureAccumulator_isReadyForMoreData__block_invoke;
  v5[3] = &unk_1E5017DE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isReadyForMoreData
{
  return (unint64_t)-[NSMutableArray count](self->_inputFrames, "count") < 3;
}

- (void)markAsFinished
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PILongExposureAccumulator_markAsFinished__block_invoke;
  block[3] = &unk_1E50195F0;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

- (void)_markAsFinished
{
  if (!self->_finished)
  {
    self->_finished = 1;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_accumSemaphore);
  }
}

- (void)waitUntilDone
{
  -[PILongExposureAccumulator markAsFinished](self, "markAsFinished");
  dispatch_group_wait((dispatch_group_t)self->_doneGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)accumulate:(id)a3 error:(id *)a4
{
  double v4;
  double v5;
  NSObject *v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  NSObject *stateQueue;
  NSObject *v16;
  double v17;
  _BOOL4 v18;
  NSObject *v19;
  double v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD block[5];
  NSObject *v29;
  uint8_t buf[4];
  double v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    NUAssertLogger_11681();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "frame != nil");
      v17 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      v31 = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    *(double *)&self = MEMORY[0x1E0D51D48];
    v10 = COERCE_DOUBLE(dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]));
    NUAssertLogger_11681();
    v9 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v10 == 0.0)
    {
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        objc_msgSend(*(id *)&v10, "componentsJoinedByString:", CFSTR("\n"));
        *(double *)&self = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138543362;
        v31 = *(double *)&self;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
    }
    else if (v18)
    {
      v10 = COERCE_DOUBLE(dispatch_get_specific(self->super.isa));
      v22 = (void *)MEMORY[0x1E0CB3978];
      v23 = *(id *)&v10;
      objc_msgSend(v22, "callStackSymbols");
      *(double *)&self = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      -[PILongExposureAccumulator componentsJoinedByString:](self, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v10;
      v32 = 2114;
      v33 = v24;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    v21 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  if (!a4)
  {
    NUAssertLogger_11681();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    *(double *)&self = MEMORY[0x1E0D51D48];
    v10 = COERCE_DOUBLE(dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]));
    NUAssertLogger_11681();
    v9 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v10 == 0.0)
    {
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        objc_msgSend(*(id *)&v10, "componentsJoinedByString:", CFSTR("\n"));
        *(double *)&self = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138543362;
        v31 = *(double *)&self;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_25:

      _NUAssertFailHandler();
LABEL_26:
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_257);
      goto LABEL_6;
    }
LABEL_23:
    if (v21)
    {
      v10 = COERCE_DOUBLE(dispatch_get_specific(self->super.isa));
      v25 = (void *)MEMORY[0x1E0CB3978];
      v26 = *(id *)&v10;
      objc_msgSend(v25, "callStackSymbols");
      *(double *)&self = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      -[PILongExposureAccumulator componentsJoinedByString:](self, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v10;
      v32 = 2114;
      v33 = v27;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_25;
  }
  v9 = v8;
  -[PILongExposureAccumulator _accumError](self, "_accumError");
  v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  if (v10 != 0.0)
  {
    -[PILongExposureAccumulator _accumError](self, "_accumError");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  NUAbsoluteTime();
  v4 = v11;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_readySemaphore, 0xFFFFFFFFFFFFFFFFLL);
  NUAbsoluteTime();
  v5 = v12;
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_26;
LABEL_6:
  v13 = *MEMORY[0x1E0D523A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v31 = (v5 - v4) * 1000.0;
    _os_log_debug_impl(&dword_1A6382000, v13, OS_LOG_TYPE_DEBUG, "waitUntilReadyForMoreData: waited for %0.1fms", buf, 0xCu);
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PILongExposureAccumulator_accumulate_error___block_invoke;
  block[3] = &unk_1E5018F40;
  block[4] = self;
  v29 = v9;
  dispatch_sync(stateQueue, block);

LABEL_9:
  return *(_QWORD *)&v10 == 0;
}

- (void)_appendInputFrame:(id)a3
{
  -[NSMutableArray addObject:](self->_inputFrames, "addObject:", a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_accumSemaphore);
}

- (id)nextInputFrame
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11718;
  v10 = __Block_byref_object_dispose__11719;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PILongExposureAccumulator_nextInputFrame__block_invoke;
  v5[3] = &unk_1E5017DE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_nextInputFrame
{
  void *v3;

  if (self->_finished && !-[NSMutableArray count](self->_inputFrames, "count"))
  {
    v3 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_inputFrames, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_inputFrames, "removeObjectAtIndex:", 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_readySemaphore);
  }
  return v3;
}

- (void)_start
{
  intptr_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[PILongExposureAccumulator _initializeAccumulation](self, "_initializeAccumulation");
  while (1)
  {
    v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_accumSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v4 = (void *)MEMORY[0x1A85BFFB8](v3);
    -[PILongExposureAccumulator nextInputFrame](self, "nextInputFrame");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      break;
    v6 = (void *)v5;
    -[PILongExposureAccumulator _accumulate:](self, "_accumulate:", v5);

    objc_autoreleasePoolPop(v4);
  }
  objc_autoreleasePoolPop(v4);
}

- (void)_initializeAccumulation
{
  BOOL v3;
  id v4;
  void *v5;
  id v6;

  v6 = 0;
  v3 = -[PILongExposureAccumulator _initializeAccumulation:](self, "_initializeAccumulation:", &v6);
  v4 = v6;
  if (!v3)
  {
    -[PILongExposureAccumulator _accumError](self, "_accumError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[PILongExposureAccumulator set_accumError:](self, "set_accumError:", v4);
  }

}

- (BOOL)_initializeAccumulation:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  -[PILongExposureAccumulator workingColorSpace](self, "workingColorSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C9DDC8];
  objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:colorSpace:", objc_msgSend(v5, "CGColorSpace"), 0.0, 0.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C9DDC8];
  objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:colorSpace:", objc_msgSend(v5, "CGColorSpace"), 1.0, 1.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithColor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PILongExposureAccumulator _initializeStorage:image:error:](self, "_initializeStorage:image:error:", self->_averageAccumulationStorage, v8, a3)&& -[PILongExposureAccumulator _initializeStorage:image:error:](self, "_initializeStorage:image:error:", self->_minimumAccumulationStorage, v11, a3)&& -[PILongExposureAccumulator _initializeStorage:image:error:](self, "_initializeStorage:image:error:", self->_maximumAccumulationStorage, v8, a3);
  return v12;
}

- (void)_accumulate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  id v8;

  v4 = a3;
  -[PILongExposureAccumulator _accumError](self, "_accumError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

    v6 = 0;
  }
  else
  {
    v8 = 0;
    v7 = -[PILongExposureAccumulator _accumulate:error:](self, "_accumulate:error:", v4, &v8);
    v6 = v8;
    if (!v7)
      -[PILongExposureAccumulator set_accumError:](self, "set_accumError:", v6);
  }

}

- (BOOL)_accumulate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  float v14;
  NUSurfaceStorage *averageAccumulationStorage;
  NSDictionary *imageOptions;
  NURenderer *renderer;
  id v18;
  id v19;
  NUSurfaceStorage *v20;
  NUSurfaceStorage *temporaryDestinationStorage;
  void *v22;
  void *v23;
  NUSurfaceStorage *minimumAccumulationStorage;
  NSDictionary *v25;
  NURenderer *v26;
  id v27;
  id v28;
  id v29;
  NUSurfaceStorage *v30;
  NUSurfaceStorage *v31;
  NUSurfaceStorage **p_maximumAccumulationStorage;
  NUSurfaceStorage *maximumAccumulationStorage;
  NSDictionary *v34;
  NURenderer *v35;
  id v36;
  id v37;
  id v38;
  NUSurfaceStorage *v39;
  NUSurfaceStorage **p_temporaryDestinationStorage;
  NUSurfaceStorage *v41;
  NUSurfaceStorage *v42;
  NSObject *v44;
  void *v45;
  const void **v46;
  void *specific;
  NSObject *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  int64_t height;
  int64_t width;
  id *v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  PILongExposureAccumulator *v70;
  id v71;
  _BYTE *v72;
  uint64_t v73;
  uint64_t v74;
  int64_t v75;
  int64_t v76;
  id *v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  PILongExposureAccumulator *v82;
  id v83;
  _BYTE *v84;
  uint64_t v85;
  uint64_t v86;
  int64_t v87;
  int64_t v88;
  id *v89;
  _QWORD v90[4];
  id v91;
  id v92;
  PILongExposureAccumulator *v93;
  id v94;
  _BYTE *v95;
  uint64_t v96;
  uint64_t v97;
  int64_t v98;
  int64_t v99;
  id *v100;
  float v101;
  _BYTE buf[24];
  char v103;
  uint64_t v104;
  _QWORD v105[4];

  v105[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v65 = a4;
  if (!a4)
  {
    NUAssertLogger_11681();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v45;
      _os_log_error_impl(&dword_1A6382000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v46 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11681();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v49)
      {
        v52 = dispatch_get_specific(*v46);
        v53 = (void *)MEMORY[0x1E0CB3978];
        v54 = v52;
        objc_msgSend(v53, "callStackSymbols");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v52;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v56;
        _os_log_error_impl(&dword_1A6382000, v48, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v51;
      _os_log_error_impl(&dword_1A6382000, v48, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v7 = (void *)MEMORY[0x1E0C9DDC8];
  v58 = v6;
  v8 = objc_msgSend(v6, "CVPixelBuffer");
  v104 = *MEMORY[0x1E0C9E0F8];
  v105[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, &v104, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithCVPixelBuffer:options:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PILongExposureAccumulator workingColorSpace](self, "workingColorSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  height = self->_pixelSize.height;
  width = self->_pixelSize.width;
  +[PIAutoLoopKernels alphaCompositingKernel](PIAutoLoopKernels, "alphaCompositingKernel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DD70], "componentMax");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DD70], "componentMin");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v103 = 0;
  v13 = self->_frameCount + 1;
  self->_frameCount = v13;
  v14 = 1.0 / (float)v13;
  averageAccumulationStorage = self->_averageAccumulationStorage;
  imageOptions = self->_imageOptions;
  renderer = self->_renderer;
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __47__PILongExposureAccumulator__accumulate_error___block_invoke;
  v90[3] = &unk_1E5017E08;
  v57 = v12;
  v91 = v57;
  v18 = v10;
  v101 = v14;
  v92 = v18;
  v93 = self;
  v19 = v11;
  v96 = 0;
  v97 = 0;
  v98 = width;
  v99 = height;
  v100 = v65;
  v94 = v19;
  v95 = buf;
  -[NUSurfaceStorage useAsCIImageWithOptions:renderer:block:](averageAccumulationStorage, "useAsCIImageWithOptions:renderer:block:", imageOptions, renderer, v90);
  v20 = self->_averageAccumulationStorage;
  objc_storeStrong((id *)&self->_averageAccumulationStorage, self->_temporaryDestinationStorage);
  temporaryDestinationStorage = self->_temporaryDestinationStorage;
  self->_temporaryDestinationStorage = v20;

  objc_msgSend(v18, "imageByClampingToExtent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBoxBlur"), &unk_1E5059200);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  minimumAccumulationStorage = self->_minimumAccumulationStorage;
  v25 = self->_imageOptions;
  v26 = self->_renderer;
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __47__PILongExposureAccumulator__accumulate_error___block_invoke_42;
  v78[3] = &unk_1E5017E30;
  v62 = v61;
  v79 = v62;
  v27 = v18;
  v80 = v27;
  v28 = v23;
  v81 = v28;
  v82 = self;
  v29 = v19;
  v85 = 0;
  v86 = 0;
  v87 = width;
  v88 = height;
  v89 = v65;
  v83 = v29;
  v84 = buf;
  -[NUSurfaceStorage useAsCIImageWithOptions:renderer:block:](minimumAccumulationStorage, "useAsCIImageWithOptions:renderer:block:", v25, v26, v78);
  v30 = self->_minimumAccumulationStorage;
  objc_storeStrong((id *)&self->_minimumAccumulationStorage, self->_temporaryDestinationStorage);
  v31 = self->_temporaryDestinationStorage;
  self->_temporaryDestinationStorage = v30;

  p_maximumAccumulationStorage = &self->_maximumAccumulationStorage;
  maximumAccumulationStorage = self->_maximumAccumulationStorage;
  v34 = self->_imageOptions;
  v35 = self->_renderer;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __47__PILongExposureAccumulator__accumulate_error___block_invoke_3;
  v66[3] = &unk_1E5017E30;
  v36 = v59;
  v67 = v36;
  v60 = v27;
  v68 = v60;
  v37 = v28;
  v69 = v37;
  v70 = self;
  v38 = v29;
  v73 = 0;
  v74 = 0;
  v75 = width;
  v76 = height;
  v77 = v65;
  v71 = v38;
  v72 = buf;
  -[NUSurfaceStorage useAsCIImageWithOptions:renderer:block:](maximumAccumulationStorage, "useAsCIImageWithOptions:renderer:block:", v34, v35, v66);
  v39 = self->_maximumAccumulationStorage;
  v41 = self->_temporaryDestinationStorage;
  p_temporaryDestinationStorage = &self->_temporaryDestinationStorage;
  objc_storeStrong((id *)p_maximumAccumulationStorage, v41);
  v42 = *p_temporaryDestinationStorage;
  *p_temporaryDestinationStorage = v39;

  LOBYTE(p_temporaryDestinationStorage) = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) == 0;
  _Block_object_dispose(buf, 8);

  return (char)p_temporaryDestinationStorage;
}

- (BOOL)writeLongExposureImage:(id)a3 UTI:(id)a4 colorSpace:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  NUSurfaceStorage *averageAccumulationStorage;
  NSDictionary *imageOptions;
  NURenderer *renderer;
  NSObject *v20;
  void *v21;
  const void **v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  PILongExposureAccumulator *v35;
  id v36;
  id v37;
  uint64_t *v38;
  _BYTE *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    NUAssertLogger_11681();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11681();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific(*v22);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v32;
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v27;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v13 = v12;
  -[PILongExposureAccumulator waitUntilDone](self, "waitUntilDone");
  -[PILongExposureAccumulator _accumError](self, "_accumError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PILongExposureAccumulator _accumError](self, "_accumError");
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__11718;
    v46 = __Block_byref_object_dispose__11719;
    v47 = 0;
    averageAccumulationStorage = self->_averageAccumulationStorage;
    imageOptions = self->_imageOptions;
    renderer = self->_renderer;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __73__PILongExposureAccumulator_writeLongExposureImage_UTI_colorSpace_error___block_invoke;
    v33[3] = &unk_1E5017E58;
    v38 = &v40;
    v34 = v10;
    v35 = self;
    v36 = v13;
    v37 = v11;
    v39 = buf;
    -[NUSurfaceStorage useAsCIImageWithOptions:renderer:block:](averageAccumulationStorage, "useAsCIImageWithOptions:renderer:block:", imageOptions, renderer, v33);
    if (*((_BYTE *)v41 + 24))
    {
      v15 = 1;
    }
    else
    {
      *a6 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      v15 = *((_BYTE *)v41 + 24) != 0;
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v40, 8);
  }

  return v15;
}

- (BOOL)writeMaskImage:(id)a3 UTI:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  NUSurfaceStorage *minimumAccumulationStorage;
  NSDictionary *imageOptions;
  NURenderer *renderer;
  NSObject *v17;
  void *v18;
  const void **v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint64_t *v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 pixelSize;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_11681();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11681();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific(*v19);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v29;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v24;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v10 = v9;
  -[PILongExposureAccumulator waitUntilDone](self, "waitUntilDone");
  -[PILongExposureAccumulator _accumError](self, "_accumError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PILongExposureAccumulator _accumError](self, "_accumError");
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v43 = __Block_byref_object_copy__11718;
    v44 = __Block_byref_object_dispose__11719;
    v45 = 0;
    minimumAccumulationStorage = self->_minimumAccumulationStorage;
    imageOptions = self->_imageOptions;
    renderer = self->_renderer;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __54__PILongExposureAccumulator_writeMaskImage_UTI_error___block_invoke;
    v30[3] = &unk_1E5017EA8;
    v35 = 0;
    v36 = 0;
    v30[4] = self;
    pixelSize = self->_pixelSize;
    v31 = v8;
    v33 = &v38;
    v32 = v10;
    v34 = buf;
    -[NUSurfaceStorage useAsCIImageWithOptions:renderer:block:](minimumAccumulationStorage, "useAsCIImageWithOptions:renderer:block:", imageOptions, renderer, v30);
    if (*((_BYTE *)v39 + 24))
    {
      v12 = 1;
    }
    else
    {
      *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      v12 = *((_BYTE *)v39 + 24) != 0;
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v38, 8);
  }

  return v12;
}

- (id)_dynamismMapWithMinImage:(id)a3 maxImage:(id)a4 extent:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  $B5E4F2499D3E0A90C7E8AF059312C337 v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  +[PIAutoLoopKernels dynamismMapKernel](PIAutoLoopKernels, "dynamismMapKernel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageByClampingToExtent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageByClampingToExtent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *a5;
  NUPixelRectToCGRect();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v24[0] = v11;
  v24[1] = v10;
  v24[2] = &unk_1E505CE60;
  v24[3] = &unk_1E505CE70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4, *(_OWORD *)&v23.var0, *(_OWORD *)&v23.var1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_11713, v20, v13, v15, v17, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)_exportOutputImage:(id)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 toURL:(id)a6 uti:(id)a7 error:(id *)a8
{
  uint64_t v12;
  id v14;
  const __CFURL *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  CGImage *v20;
  CGImageDestinationRef v21;
  CGImageDestination *v22;
  const __CFDictionary *v23;
  BOOL v24;
  NSObject *v26;
  const void **v27;
  const void **v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  NSObject *v33;
  const void **v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  const void **v39;
  void *v40;
  int v41;
  void *v42;
  const void **v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint8_t buf[4];
  const void **v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v12 = *(_QWORD *)&a4;
  v63 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (const __CFURL *)a6;
  v16 = (__CFString *)a7;
  if (!v14)
  {
    NUAssertLogger_11681();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v27 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v27;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11681();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v44 = dispatch_get_specific(*v28);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v28 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = (const void **)v44;
        v61 = 2114;
        v62 = v47;
        _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v28;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v36 = _NUAssertFailHandler();
    goto LABEL_31;
  }
  if (!v15)
  {
    NUAssertLogger_11681();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "destinationURL != nil");
      v34 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v34;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = (const void **)MEMORY[0x1E0D51D48];
    v35 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11681();
    v30 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (!v35)
    {
      if (v36)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v28;
        _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_33:

      v41 = _NUAssertFailHandler();
      goto LABEL_34;
    }
LABEL_31:
    if (v36)
    {
      v48 = dispatch_get_specific(*v28);
      v49 = (void *)MEMORY[0x1E0CB3978];
      v50 = v48;
      objc_msgSend(v49, "callStackSymbols");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = (const void **)v48;
      v61 = 2114;
      v62 = v51;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_33;
  }
  if (!a8)
  {
    NUAssertLogger_11681();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v39 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v39;
      _os_log_error_impl(&dword_1A6382000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = (const void **)MEMORY[0x1E0D51D48];
    v40 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11681();
    v30 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (!v40)
    {
      if (v41)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v43;
        _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_36;
    }
LABEL_34:
    if (v41)
    {
      v52 = dispatch_get_specific(*v28);
      v53 = (void *)MEMORY[0x1E0CB3978];
      v54 = v52;
      objc_msgSend(v53, "callStackSymbols");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = (const void **)v52;
      v61 = 2114;
      v62 = v56;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_36:

    _NUAssertFailHandler();
  }
  v17 = v16;
  -[NURenderer context](self->_renderer, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "extent");
  v19 = objc_msgSend(v18, "createCGImage:fromRect:format:colorSpace:deferred:", v14, v12, a5, 0);
  if (v19)
  {
    v20 = (CGImage *)v19;
    v21 = CGImageDestinationCreateWithURL(v15, v17, 1uLL, 0);
    if (v21)
    {
      v22 = v21;
      v57 = *MEMORY[0x1E0CBC780];
      v58 = &unk_1E5051D88;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
      v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CGImageDestinationAddImage(v22, v20, v23);
      v24 = CGImageDestinationFinalize(v22);
      if (!v24)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to finalize image destination"), self);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      CFRelease(v22);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to create CGImageDestinationRef"), self);
      v24 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v20);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to create CGImageRef"), self);
    v24 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (NSError)_accumError
{
  return (NSError *)objc_getProperty(self, a2, 144, 1);
}

- (void)set_accumError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accumError, 0);
  objc_storeStrong((id *)&self->_imageOptions, 0);
  objc_storeStrong((id *)&self->_inputFrames, 0);
  objc_storeStrong((id *)&self->_doneGroup, 0);
  objc_storeStrong((id *)&self->_readySemaphore, 0);
  objc_storeStrong((id *)&self->_accumSemaphore, 0);
  objc_storeStrong((id *)&self->_accumQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_maximumAccumulationStorage, 0);
  objc_storeStrong((id *)&self->_minimumAccumulationStorage, 0);
  objc_storeStrong((id *)&self->_averageAccumulationStorage, 0);
  objc_storeStrong((id *)&self->_temporaryDestinationStorage, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

double __70__PILongExposureAccumulator__dynamismMapWithMinImage_maxImage_extent___block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

void __54__PILongExposureAccumulator_writeMaskImage_UTI_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = (void *)v4[7];
  v7 = v4[3];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __54__PILongExposureAccumulator_writeMaskImage_UTI_error___block_invoke_2;
  v13[3] = &unk_1E5017E80;
  v8 = v4[17];
  v13[1] = 3221225472;
  v13[4] = v4;
  v14 = v3;
  v9 = *(_OWORD *)(a1 + 88);
  v18 = *(_OWORD *)(a1 + 72);
  v19 = v9;
  v15 = v5;
  v12 = *(_OWORD *)(a1 + 48);
  v10 = (id)v12;
  v16 = v12;
  v17 = *(_QWORD *)(a1 + 64);
  v11 = v3;
  objc_msgSend(v6, "useAsCIImageWithOptions:renderer:block:", v8, v7, v13);

}

void __54__PILongExposureAccumulator_writeMaskImage_UTI_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  NSObject *v7;
  CGColorSpace *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  char v14;
  uint64_t v15;
  id obj;
  uint8_t buf[16];
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 80);
  v18 = v5;
  objc_msgSend(v3, "_dynamismMapWithMinImage:maxImage:extent:", v4, a2, buf);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_257);
  v7 = *MEMORY[0x1E0D523A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_DEBUG))
  {
    v15 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v15;
    _os_log_debug_impl(&dword_1A6382000, v7, OS_LOG_TYPE_DEBUG, "Writing long-exposure motion mask to %{public}@", buf, 0xCu);
  }
  v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
  v9 = *(void **)(a1 + 32);
  v10 = *MEMORY[0x1E0C9E018];
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  obj = 0;
  v14 = objc_msgSend(v9, "_exportOutputImage:format:colorSpace:toURL:uti:error:", v6, v10, v8, v11, v12, &obj);
  objc_storeStrong(v13, obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v14;
  CGColorSpaceRelease(v8);

}

void __73__PILongExposureAccumulator_writeLongExposureImage_UTI_colorSpace_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  id obj;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_257);
  v4 = *MEMORY[0x1E0D523A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v14 = v11;
    _os_log_debug_impl(&dword_1A6382000, v4, OS_LOG_TYPE_DEBUG, "Writing long-exposure image to %{public}@", buf, 0xCu);
  }
  v5 = *MEMORY[0x1E0C9E070];
  v6 = *(void **)(a1 + 40);
  v7 = objc_msgSend(*(id *)(a1 + 48), "CGColorSpace");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  obj = 0;
  LOBYTE(v5) = objc_msgSend(v6, "_exportOutputImage:format:colorSpace:toURL:uti:error:", v3, v5, v7, v8, v9, &obj);
  objc_storeStrong(v10, obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v5;

}

void __47__PILongExposureAccumulator__accumulate_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v34[0] = *(_QWORD *)(a1 + 40);
  v34[1] = v5;
  LODWORD(v6) = *(_DWORD *)(a1 + 112);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(_QWORD *)(a1 + 48);
  v18 = *(void **)(a1 + 56);
  v20 = *(_QWORD *)(v17 + 24);
  v19 = *(void **)(v17 + 32);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __47__PILongExposureAccumulator__accumulate_error___block_invoke_2;
  v26[3] = &unk_1E5017DB8;
  v21 = v18;
  v22 = *(_QWORD *)(a1 + 48);
  v27 = v21;
  v28 = v22;
  v23 = *(_OWORD *)(a1 + 88);
  v31 = *(_OWORD *)(a1 + 72);
  v32 = v23;
  v33 = *(_QWORD *)(a1 + 104);
  v24 = *(_QWORD *)(a1 + 64);
  v29 = v16;
  v30 = v24;
  v25 = v16;
  objc_msgSend(v19, "useAsCIRenderDestinationWithRenderer:block:", v20, v26);

}

void __47__PILongExposureAccumulator__accumulate_error___block_invoke_42(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v33[0] = *(_QWORD *)(a1 + 48);
  v33[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyWithExtent:arguments:", v14, v7, v9, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(_QWORD *)(a1 + 56);
  v17 = *(void **)(a1 + 64);
  v19 = *(_QWORD *)(v16 + 24);
  v18 = *(void **)(v16 + 32);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __47__PILongExposureAccumulator__accumulate_error___block_invoke_2_43;
  v25[3] = &unk_1E5017DB8;
  v20 = v17;
  v21 = *(_QWORD *)(a1 + 56);
  v26 = v20;
  v27 = v21;
  v22 = *(_OWORD *)(a1 + 96);
  v30 = *(_OWORD *)(a1 + 80);
  v31 = v22;
  v32 = *(_QWORD *)(a1 + 112);
  v23 = *(_QWORD *)(a1 + 72);
  v28 = v15;
  v29 = v23;
  v24 = v15;
  objc_msgSend(v18, "useAsCIRenderDestinationWithRenderer:block:", v19, v25);

}

void __47__PILongExposureAccumulator__accumulate_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v33[0] = *(_QWORD *)(a1 + 48);
  v33[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyWithExtent:arguments:", v14, v7, v9, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(_QWORD *)(a1 + 56);
  v17 = *(void **)(a1 + 64);
  v19 = *(_QWORD *)(v16 + 24);
  v18 = *(void **)(v16 + 32);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __47__PILongExposureAccumulator__accumulate_error___block_invoke_4;
  v25[3] = &unk_1E5017DB8;
  v20 = v17;
  v21 = *(_QWORD *)(a1 + 56);
  v26 = v20;
  v27 = v21;
  v22 = *(_OWORD *)(a1 + 96);
  v30 = *(_OWORD *)(a1 + 80);
  v31 = v22;
  v32 = *(_QWORD *)(a1 + 112);
  v23 = *(_QWORD *)(a1 + 72);
  v28 = v15;
  v29 = v23;
  v24 = v15;
  objc_msgSend(v18, "useAsCIRenderDestinationWithRenderer:block:", v19, v25);

}

BOOL __47__PILongExposureAccumulator__accumulate_error___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  _OWORD v12[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setColorSpace:", objc_msgSend(v3, "CGColorSpace"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PILongExposureAccumulator-maximum-j%lld"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v5);

  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_OWORD *)(a1 + 80);
  v12[0] = *(_OWORD *)(a1 + 64);
  v12[1] = v9;
  objc_msgSend(v7, "renderImage:rect:toDestination:atPoint:error:", v6, v12, v4, *MEMORY[0x1E0D51E30], *(_QWORD *)(MEMORY[0x1E0D51E30] + 8), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to render maximum image"), *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 96));
    **(_QWORD **)(a1 + 96) = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10 != 0;
}

BOOL __47__PILongExposureAccumulator__accumulate_error___block_invoke_2_43(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  _OWORD v12[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setColorSpace:", objc_msgSend(v3, "CGColorSpace"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PILongExposureAccumulator-minimum-j%lld"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v5);

  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_OWORD *)(a1 + 80);
  v12[0] = *(_OWORD *)(a1 + 64);
  v12[1] = v9;
  objc_msgSend(v7, "renderImage:rect:toDestination:atPoint:error:", v6, v12, v4, *MEMORY[0x1E0D51E30], *(_QWORD *)(MEMORY[0x1E0D51E30] + 8), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to render minimum image"), *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 96));
    **(_QWORD **)(a1 + 96) = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10 != 0;
}

BOOL __47__PILongExposureAccumulator__accumulate_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  _OWORD v12[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setColorSpace:", objc_msgSend(v3, "CGColorSpace"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PILongExposureAccumulator-average-j%lld"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v5);

  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_OWORD *)(a1 + 80);
  v12[0] = *(_OWORD *)(a1 + 64);
  v12[1] = v9;
  objc_msgSend(v7, "renderImage:rect:toDestination:atPoint:error:", v6, v12, v4, *MEMORY[0x1E0D51E30], *(_QWORD *)(MEMORY[0x1E0D51E30] + 8), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to render average image"), *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 96));
    **(_QWORD **)(a1 + 96) = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10 != 0;
}

void __43__PILongExposureAccumulator_nextInputFrame__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_nextInputFrame");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __46__PILongExposureAccumulator_accumulate_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendInputFrame:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__PILongExposureAccumulator_markAsFinished__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_markAsFinished");
}

uint64_t __47__PILongExposureAccumulator_isReadyForMoreData__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isReadyForMoreData");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

BOOL __60__PILongExposureAccumulator__initializeStorage_image_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  _OWORD v12[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setColorSpace:", objc_msgSend(v3, "CGColorSpace"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PILongExposureAccumulator-main-j%lld"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v5);

  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_OWORD *)(a1 + 80);
  v12[0] = *(_OWORD *)(a1 + 64);
  v12[1] = v9;
  objc_msgSend(v7, "renderImage:rect:toDestination:atPoint:error:", v6, v12, v4, *MEMORY[0x1E0D51E30], *(_QWORD *)(MEMORY[0x1E0D51E30] + 8), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to init accumulator"), *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 96));
    **(_QWORD **)(a1 + 96) = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10 != 0;
}

uint64_t __35__PILongExposureAccumulator_start___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

@end

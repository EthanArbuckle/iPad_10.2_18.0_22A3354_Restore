@implementation PFStateCaptureHandler

- (PFStateCaptureHandler)initWithProvider:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  PFStateCaptureHandler *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *logPrefix;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  NSObject *v16;
  const char *v17;
  id Property;
  unint64_t stateHandle;
  PFStateCaptureHandler *v20;
  id v22;
  id location;
  objc_super v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PFStateCaptureHandler;
  v8 = -[PFStateCaptureHandler init](&v24, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("State Capture: %@"), v8->_name);
    logPrefix = v8->_logPrefix;
    v8->_logPrefix = (NSString *)v11;

    objc_storeWeak((id *)&v8->_provider, v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.photos.PFStateCaptureHandler.stateHandlerQueue", v13);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v8);
    objc_copyWeak(&v22, &location);
    v8->_stateHandle = os_state_add_handler();
    PFStateCaptureGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      Property = objc_getProperty(v8, v17, 56, 1);
      stateHandle = v8->_stateHandle;
      *(_DWORD *)buf = 138543618;
      v26 = Property;
      v27 = 2048;
      v28 = stateHandle;
      _os_log_impl(&dword_1B70DA000, v16, OS_LOG_TYPE_INFO, "%{public}@: Added state handler: %llu", buf, 0x16u);
    }

    v20 = v8;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (PFStateCaptureHandler)initWithProvider:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PFStateCaptureHandler *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v5);
  v7 = -[PFStateCaptureHandler initWithProvider:name:](self, "initWithProvider:name:", v5, v6);

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  id Property;
  unint64_t stateHandle;
  objc_super v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PFStateCaptureGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    if (self)
      Property = objc_getProperty(self, v4, 56, 1);
    else
      Property = 0;
    stateHandle = self->_stateHandle;
    *(_DWORD *)buf = 138543618;
    v9 = Property;
    v10 = 2048;
    v11 = stateHandle;
    _os_log_impl(&dword_1B70DA000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: Removing state handler: %llu", buf, 0x16u);
  }

  if (self->_stateHandle)
    os_state_remove_handler();
  v7.receiver = self;
  v7.super_class = (Class)PFStateCaptureHandler;
  -[PFStateCaptureHandler dealloc](&v7, sel_dealloc);
}

- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  unsigned int v9;
  os_state_data_s *v10;
  os_state_data_s *v11;
  id v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  id v17;
  const char *v18;
  const char *v19;
  id v20;
  id v22;
  uint8_t buf[4];
  id Property;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  ++self->_callCount;
  if (a3->var2 == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    v5 = WeakRetained;
    if (!WeakRetained)
    {
      PFStateCaptureGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        Property = objc_getProperty(self, v13, 56, 1);
        _os_log_impl(&dword_1B70DA000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Unable to capture state because provider is nil", buf, 0xCu);
      }
      v11 = 0;
      goto LABEL_22;
    }
    objc_msgSend(WeakRetained, "stateCaptureDictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      PFStateCaptureGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        Property = objc_getProperty(self, v14, 56, 1);
        _os_log_impl(&dword_1B70DA000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Returned nil state dictionary", buf, 0xCu);
      }
      v11 = 0;
      goto LABEL_21;
    }
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;
    if (v7)
    {
      v9 = objc_msgSend(v7, "length");
      v10 = (os_state_data_s *)malloc_type_calloc(1uLL, v9 + 200, 0x4C7DAF7DuLL);
      if (v10)
      {
        v11 = v10;
        v10->var0 = 1;
        v10->var1.var1 = v9;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%llu, %llu)"), self->_name, self->_callCount, self->_ignoreCount);
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v12, "UTF8String");

        __strlcpy_chk();
        objc_msgSend(v7, "getBytes:length:", v11->var4, v9);
LABEL_20:

LABEL_21:
LABEL_22:

        return v11;
      }
      PFStateCaptureGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_getProperty(self, v19, 56, 1);
        *(_DWORD *)buf = 138543618;
        Property = v20;
        v25 = 2048;
        v26 = v9 + 200;
        v18 = "%{public}@: Unable to allocate state buffer with size %zu";
        goto LABEL_18;
      }
    }
    else
    {
      PFStateCaptureGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_getProperty(self, v16, 56, 1);
        *(_DWORD *)buf = 138543618;
        Property = v17;
        v25 = 2112;
        v26 = (uint64_t)v8;
        v18 = "%{public}@: Unable to serialize state dictionary: %@";
LABEL_18:
        _os_log_impl(&dword_1B70DA000, v15, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
      }
    }

    v11 = 0;
    goto LABEL_20;
  }
  v11 = 0;
  ++self->_ignoreCount;
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_provider);
}

uint64_t __47__PFStateCaptureHandler_initWithProvider_name___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = objc_msgSend(WeakRetained, "stateDataWithHints:", a2);
  else
    v5 = 0;

  return v5;
}

+ (id)stringFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = stringFromDate__sOnceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&stringFromDate__sOnceToken, &__block_literal_global_151);
  objc_msgSend((id)stringFromDate__sDateFormatter, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stringFromTimestamp:(double)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stringFromRelativeTimeInterval:(double)a3
{
  if (stringFromRelativeTimeInterval__sOnceToken != -1)
    dispatch_once(&stringFromRelativeTimeInterval__sOnceToken, &__block_literal_global_3);
  return (id)objc_msgSend((id)stringFromRelativeTimeInterval__sFormatter, "localizedStringFromTimeInterval:", a3);
}

uint64_t __56__PFStateCaptureHandler_stringFromRelativeTimeInterval___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB38F0]);
  v1 = (void *)stringFromRelativeTimeInterval__sFormatter;
  stringFromRelativeTimeInterval__sFormatter = (uint64_t)v0;

  objc_msgSend((id)stringFromRelativeTimeInterval__sFormatter, "setDateTimeStyle:", 0);
  return objc_msgSend((id)stringFromRelativeTimeInterval__sFormatter, "setUnitsStyle:", 2);
}

uint64_t __40__PFStateCaptureHandler_stringFromDate___block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)stringFromDate__sDateFormatter;
  stringFromDate__sDateFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)stringFromDate__sDateFormatter, "setTimeZone:", v2);

  return objc_msgSend((id)stringFromDate__sDateFormatter, "setFormatOptions:", 4083);
}

@end

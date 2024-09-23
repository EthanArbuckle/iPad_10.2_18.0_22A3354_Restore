@implementation PFMetadataStateHandler

- (id)className
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PFMetadataStateHandler_className__block_invoke;
  block[3] = &unk_1E45A4AC8;
  block[4] = self;
  if (className_onceToken != -1)
    dispatch_once(&className_onceToken, block);
  return (id)className_name;
}

- (PFMetadataStateHandler)initWithMetadata:(id)a3
{
  PFMetadataMovie *v4;
  PFMetadataStateHandler *v5;
  PFMetadataStateHandler *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSMutableArray *v10;
  NSMutableArray *breadcrumbs;
  NSObject *v12;
  id v13;
  void *v14;
  PFMetadataStateHandler *v15;
  void *v17;
  unint64_t stateHandle;
  void *v19;
  PFMetadataMovie *metadata;
  uint64_t v21;
  id v22;
  id location;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  PFMetadataStateHandler *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  PFMetadataMovie *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (PFMetadataMovie *)a3;
  v24.receiver = self;
  v24.super_class = (Class)PFMetadataStateHandler;
  v5 = -[PFMetadataStateHandler init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_metadata = v4;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.photos.PFMetadata.stateHandleQueue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_initWeak(&location, v6);
    v21 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v22, &location);
    v6->_stateHandle = os_state_add_handler();
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    breadcrumbs = v6->_breadcrumbs;
    v6->_breadcrumbs = v10;

    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[PFMetadataStateHandler className](v6, "className");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      stateHandle = v6->_stateHandle;
      -[PFMetadataStateHandler className](v6, "className");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      metadata = v6->_metadata;
      *(_DWORD *)buf = 138413314;
      v26 = v17;
      v27 = 2048;
      v28 = v6;
      v29 = 2048;
      v30 = stateHandle;
      v31 = 2112;
      v32 = v19;
      v33 = 2048;
      v34 = metadata;
      _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ %p: Added state handler: %llu for %@: %p", buf, 0x34u);

    }
    -[PFMetadataStateHandler className](v6, "className");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFMetadataStateHandler addBreadcrumb:](v6, "addBreadcrumb:", CFSTR("Created %@ %p"), v14, v6, v21, 3221225472, __43__PFMetadataStateHandler_initWithMetadata___block_invoke, &unk_1E45A3320);

    v15 = v6;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  unint64_t stateHandle;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  __int16 v8;
  PFMetadataStateHandler *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[PFMetadataStateHandler className](self, "className");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    stateHandle = self->_stateHandle;
    *(_DWORD *)buf = 138412802;
    v7 = v3;
    v8 = 2048;
    v9 = self;
    v10 = 2048;
    v11 = stateHandle;
    _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ %p: Removing state handler: %llu", buf, 0x20u);

  }
  if (self->_stateHandle)
    os_state_remove_handler();
  v5.receiver = self;
  v5.super_class = (Class)PFMetadataStateHandler;
  -[PFMetadataStateHandler dealloc](&v5, sel_dealloc);
}

- (id)_stateInformation
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  const __CFString *v16;
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_breadcrumbs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "breadcrumbDescription", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v6);
  }

  v16 = CFSTR("breadcrumbs");
  v17 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  size_t v10;
  os_state_data_s *v11;
  os_state_data_s *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  PFMetadataMovie *metadata;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  PFMetadataStateHandler *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  PFMetadataMovie *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3->var2 != 3)
    return 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[PFMetadataStateHandler className](self, "className");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFMetadataStateHandler className](self, "className");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    metadata = self->_metadata;
    *(_DWORD *)buf = 138413058;
    v23 = v18;
    v24 = 2048;
    v25 = self;
    v26 = 2112;
    v27 = v19;
    v28 = 2048;
    v29 = metadata;
    _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ %p: Generating state data for %@: %p", buf, 0x2Au);

  }
  v4 = (void *)MEMORY[0x1E0CB38B0];
  -[PFMetadataStateHandler _stateInformation](self, "_stateInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;

  if (v6)
  {
    v8 = objc_msgSend(v6, "length");
    v9 = v8;
    v10 = v8 + 200;
    v11 = (os_state_data_s *)malloc_type_malloc(v10, 0x4FB9849BuLL);
    v12 = v11;
    if (v11)
    {
      bzero(v11, v10);
      v12->var0 = 1;
      v12->var1.var1 = v8;
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[PFMetadataStateHandler className](self, "className");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("State for <%@: %p>"), v14, self->_metadata);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_retainAutorelease(v15);
      objc_msgSend(v16, "UTF8String");
      __strlcpy_chk();
      objc_msgSend(v6, "getBytes:length:", v12->var4, v9);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to gather process state information: %@", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

- (void)addBreadcrumb:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  PFMetadataStateHandler *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v15);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[PFMetadataStateHandler _addBreadcrumbWithTimeInterval:message:](self, "_addBreadcrumbWithTimeInterval:message:", v6);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[PFMetadataStateHandler className](self, "className");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ %p: Add breadcrumb: %@", buf, 0x20u);

  }
}

- (void)_addBreadcrumbWithTimeInterval:(double)a3 message:(id)a4
{
  id v6;
  PFMetadataStateBreadcrumb *v7;
  NSObject *queue;
  PFMetadataStateBreadcrumb *v9;
  _QWORD block[5];
  PFMetadataStateBreadcrumb *v11;

  v6 = a4;
  v7 = -[PFMetadataStateBreadcrumb initWithTimeInterval:message:]([PFMetadataStateBreadcrumb alloc], "initWithTimeInterval:message:", v6, a3);

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PFMetadataStateHandler__addBreadcrumbWithTimeInterval_message___block_invoke;
  block[3] = &unk_1E45A4B40;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_sync(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breadcrumbs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __65__PFMetadataStateHandler__addBreadcrumbWithTimeInterval_message___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__PFMetadataStateHandler_initWithMetadata___block_invoke(uint64_t a1, uint64_t a2)
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

void __35__PFMetadataStateHandler_className__block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  void *v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)className_name;
  className_name = v1;

}

+ (id)redactedDescriptionForFileURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "redactedDescriptionForPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)redactedDescriptionForPath:(id)a3
{
  id v3;
  void *v4;
  stat v6;

  v3 = objc_retainAutorelease(a3);
  if (!objc_msgSend(v3, "fileSystemRepresentation")
    || (memset(&v6, 0, sizeof(v6)),
        lstat((const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"), &v6))
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fs=%d/file=%llu"), v6.st_dev, v6.st_ino), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hash=%lu"), objc_msgSend(v3, "hash"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

@end

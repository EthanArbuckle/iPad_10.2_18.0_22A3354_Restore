@implementation TIPersistentQueue

- (TIPersistentQueue)initWithURL:(id)a3
{
  id v5;
  TIPersistentQueue *v6;
  TIPersistentQueue *v7;
  TIPersistentQueue *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIPersistentQueue;
  v6 = -[TIPersistentQueue init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentedItemURL, a3);
    v8 = v7;
  }

  return v7;
}

- (void)readObjects:(id)a3
{
  id v4;
  void *v5;
  NSURL *presentedItemURL;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
    presentedItemURL = self->_presentedItemURL;
    v12 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__TIPersistentQueue_readObjects___block_invoke;
    v10[3] = &unk_1EA106580;
    v11 = v4;
    objc_msgSend(v5, "coordinateReadingItemAtURL:options:error:byAccessor:", presentedItemURL, 0, &v12, v10);
    v7 = v12;
    if (v7)
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s failed to coordinate read of %@: %@"), "-[TIPersistentQueue readObjects:]", self->_presentedItemURL, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }

  }
}

- (void)enqueueObjects:(id)a3
{
  id v4;
  void *v5;
  NSURL *presentedItemURL;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
    presentedItemURL = self->_presentedItemURL;
    v12 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__TIPersistentQueue_enqueueObjects___block_invoke;
    v10[3] = &unk_1EA106580;
    v11 = v4;
    objc_msgSend(v5, "coordinateWritingItemAtURL:options:error:byAccessor:", presentedItemURL, 0, &v12, v10);
    v7 = v12;
    if (v7)
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s failed to coordinate write of %@: %@"), "-[TIPersistentQueue enqueueObjects:]", self->_presentedItemURL, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }

  }
}

- (void)dequeueObjects:(id)a3
{
  id v4;
  void *v5;
  NSURL *presentedItemURL;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
    presentedItemURL = self->_presentedItemURL;
    v12 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__TIPersistentQueue_dequeueObjects___block_invoke;
    v10[3] = &unk_1EA106580;
    v11 = v4;
    objc_msgSend(v5, "coordinateWritingItemAtURL:options:error:byAccessor:", presentedItemURL, 0, &v12, v10);
    v7 = v12;
    if (v7)
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s failed to coordinate write of %@: %@"), "-[TIPersistentQueue dequeueObjects:]", self->_presentedItemURL, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedItemURL, 0);
}

void __36__TIPersistentQueue_dequeueObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v5 > objc_msgSend(v4, "count"))
    v5 = objc_msgSend(v4, "count");
  objc_msgSend(v4, "subarrayWithRange:", v5, objc_msgSend(v4, "count") - v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      objc_msgSend(v9, "removeItemAtURL:error:", v3, &v11);
      v7 = v11;

      if (!v7)
      {
LABEL_16:

        goto LABEL_17;
      }
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s failed to delete %@: %@"), "-[TIPersistentQueue dequeueObjects:]_block_invoke", v3, v7);
        v10 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
LABEL_15:

      goto LABEL_16;
    }
    if ((objc_msgSend(v6, "writeToURL:atomically:", v3, 1) & 1) == 0)
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s failed to write to %@ for updated persistent queue: %@"), "-[TIPersistentQueue dequeueObjects:]_block_invoke", v3, v6);
      v8 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_debug_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_15;
    }
  }
LABEL_17:

}

void __36__TIPersistentQueue_enqueueObjects___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfURL:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v4;
  v8 = v7;

  if (objc_msgSend(v8, "count"))
    objc_msgSend(v8, "writeToURL:atomically:", v9, 1);

}

void __33__TIPersistentQueue_readObjects___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfURL:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end

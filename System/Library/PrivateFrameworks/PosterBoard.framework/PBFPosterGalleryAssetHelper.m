@implementation PBFPosterGalleryAssetHelper

- (PBFPosterGalleryAssetHelper)initWithPreviewGenerator:(id)a3 extensionInstanceProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PBFPosterGalleryAssetHelper *v10;
  PBFPosterGalleryAssetHelper *v11;
  uint64_t v12;
  NSMapTable *previewToState;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("previewGenerator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterGalleryAssetHelper initWithPreviewGenerator:extensionInstanceProvider:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA4ECF8);
  }
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extensionInstanceProvider"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterGalleryAssetHelper initWithPreviewGenerator:extensionInstanceProvider:].cold.2(a2);
    goto LABEL_11;
  }
  v16.receiver = self;
  v16.super_class = (Class)PBFPosterGalleryAssetHelper;
  v10 = -[PBFPosterGalleryAssetHelper init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_previewGenerator, v7);
    objc_storeWeak((id *)&v11->_extensionInstanceProvider, v9);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    previewToState = v11->_previewToState;
    v11->_previewToState = (NSMapTable *)v12;

    v11->_isSuspended = 1;
  }

  return v11;
}

- (void)setPosterPreviews:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSSet *v10;
  NSSet *posterPreviews;
  int v12;
  PBFPosterGalleryAssetHelper *v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = self;
      v6 = "(%p) bail setPosterPreviews; invalidated";
LABEL_7:
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (BSEqualSets())
  {
    PBFLogAssetHelper();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = self;
      v6 = "(%p) bail setPosterPreviews; same poster previews, no need to do anything";
      goto LABEL_7;
    }
  }
  else
  {
    -[PBFPosterGalleryAssetHelper _resetHydrationState](self, "_resetHydrationState");
    v5 = objc_msgSend(v4, "mutableCopy");
    -[NSObject minusSet:](v5, "minusSet:", self->_posterPreviews);
    v7 = -[NSSet mutableCopy](self->_posterPreviews, "mutableCopy");
    -[NSObject minusSet:](v7, "minusSet:", v4);
    PBFLogAssetHelper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 134218242;
      v13 = self;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_INFO, "(%p) added poster previews: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    PBFLogAssetHelper();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 134218242;
      v13 = self;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_INFO, "(%p) added poster removed: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    v10 = (NSSet *)objc_msgSend(v4, "copy");
    posterPreviews = self->_posterPreviews;
    self->_posterPreviews = v10;

    -[PBFPosterGalleryAssetHelper _teardownStateForPosterPreviews:](self, "_teardownStateForPosterPreviews:", v7);
    -[PBFPosterGalleryAssetHelper _stateWasUpdatedForPosterPreviews:](self, "_stateWasUpdatedForPosterPreviews:", v5);

  }
}

- (void)setActiveDisplayContext:(id)a3
{
  PBFDisplayContext *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  NSObject *v11;
  PBFPosterGalleryViewSpec *v12;
  PBFPosterGalleryViewSpec *activeDisplayContextSpec;
  NSObject *v14;
  PBFDisplayContext *activeDisplayContext;
  const char *v16;
  PBFPosterGalleryViewSpec *v17;
  PBFDisplayContext *v18;
  int v19;
  PBFPosterGalleryAssetHelper *v20;
  __int16 v21;
  PBFDisplayContext *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (PBFDisplayContext *)a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134217984;
      v20 = self;
      v7 = "(%p) bail setActiveDisplayContext; invalidated";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
      _os_log_impl(&dword_1CB9FA000, v8, v9, v7, (uint8_t *)&v19, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v10 = BSEqualObjects();
  PBFLogAssetHelper();
  v11 = objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218242;
      v20 = self;
      v21 = 2114;
      v22 = v5;
      _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "(%p) updating active display context: %{public}@", (uint8_t *)&v19, 0x16u);
    }

    objc_storeStrong((id *)&self->_activeDisplayContext, a3);
    if (self->_activeDisplayContext)
    {
      +[PBFPosterGalleryViewSpec specForDisplayContext:](PBFPosterGalleryViewSpec, "specForDisplayContext:");
      v12 = (PBFPosterGalleryViewSpec *)objc_claimAutoreleasedReturnValue();
      activeDisplayContextSpec = self->_activeDisplayContextSpec;
      self->_activeDisplayContextSpec = v12;

      PBFLogAssetHelper();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        activeDisplayContext = self->_activeDisplayContext;
        v19 = 134218242;
        v20 = self;
        v21 = 2114;
        v22 = activeDisplayContext;
        v16 = "(%p) updating spec for active display context: %{public}@";
LABEL_17:
        _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 0x16u);
      }
    }
    else
    {
      v17 = self->_activeDisplayContextSpec;
      self->_activeDisplayContextSpec = 0;

      PBFLogAssetHelper();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_activeDisplayContext;
        v19 = 134218242;
        v20 = self;
        v21 = 2114;
        v22 = v18;
        v16 = "(%p) clearing spec for active display context: %{public}@";
        goto LABEL_17;
      }
    }

    -[PBFPosterGalleryAssetHelper _resetHydrationState](self, "_resetHydrationState");
    -[PBFPosterGalleryAssetHelper _stateWasUpdated:](self, "_stateWasUpdated:", 1);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v19 = 134217984;
    v20 = self;
    v7 = "(%p) abort updating active display context; same as existing context";
    v8 = v6;
    v9 = OS_LOG_TYPE_INFO;
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
}

- (void)appendDisplayContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *v6;
  NSMutableSet *knownDisplayContexts;
  NSObject *v8;
  int v9;
  PBFPosterGalleryAssetHelper *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = self;
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "(%p) bail appendDisplayContext; invalidated",
        (uint8_t *)&v9,
        0xCu);
    }

  }
  else
  {
    if (!self->_knownDisplayContexts)
    {
      v6 = (NSMutableSet *)objc_opt_new();
      knownDisplayContexts = self->_knownDisplayContexts;
      self->_knownDisplayContexts = v6;

    }
    PBFLogAssetHelper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218242;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, "(%p) appending display context: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    -[NSMutableSet addObject:](self->_knownDisplayContexts, "addObject:", v4);
  }

}

- (void)resetKnownDisplayContexts
{
  _BOOL4 isInvalidated;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  int64_t assetHydrationState;
  NSObject *v10;
  int v11;
  PBFPosterGalleryAssetHelper *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  isInvalidated = self->_isInvalidated;
  PBFLogAssetHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isInvalidated)
  {
    if (v5)
    {
      v11 = 134217984;
      v12 = self;
      v6 = "(%p) bail resetKnownDisplayContexts; invalidated";
      v7 = v4;
      v8 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
      _os_log_impl(&dword_1CB9FA000, v7, v8, v6, (uint8_t *)&v11, 0xCu);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v5)
  {
    v11 = 134217984;
    v12 = self;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "(%p) resetting known display context", (uint8_t *)&v11, 0xCu);
  }

  -[NSMutableSet removeAllObjects](self->_knownDisplayContexts, "removeAllObjects");
  assetHydrationState = self->_assetHydrationState;
  PBFLogAssetHelper();
  v10 = objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (assetHydrationState < 2)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = self;
      v6 = "(%p) bail reset hydration state after resetKnownDisplayContexts";
      v7 = v4;
      v8 = OS_LOG_TYPE_INFO;
      goto LABEL_12;
    }
LABEL_13:

    return;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = self;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "(%p) known display context was reset during asset hydration state of alternate display context - resetting hydration state", (uint8_t *)&v11, 0xCu);
  }

  -[PBFPosterGalleryAssetHelper _resetHydrationState](self, "_resetHydrationState");
  -[PBFPosterGalleryAssetHelper _stateWasUpdated:](self, "_stateWasUpdated:", 1);
}

- (NSSet)knownDisplayContexts
{
  PBFDisplayContext *activeDisplayContext;
  NSMutableSet *knownDisplayContexts;
  void *v4;

  activeDisplayContext = self->_activeDisplayContext;
  knownDisplayContexts = self->_knownDisplayContexts;
  if (activeDisplayContext)
  {
    -[NSMutableSet setByAddingObject:](knownDisplayContexts, "setByAddingObject:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)-[NSMutableSet copy](knownDisplayContexts, "copy");
  }
  return (NSSet *)v4;
}

- (id)knownDisplayContextWithoutActiveDisplayContext
{
  void *v3;

  v3 = (void *)-[NSMutableSet mutableCopy](self->_knownDisplayContexts, "mutableCopy");
  objc_msgSend(v3, "removeObject:", self->_activeDisplayContext);
  return v3;
}

- (void)setSuspended:(BOOL)a3
{
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  int isSuspended;
  _BOOL4 v10;
  int v11;
  PBFPosterGalleryAssetHelper *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = self;
      v5 = "(%p) bail setSuspended; invalidated";
      v6 = v4;
      v7 = 12;
LABEL_7:
      _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, v7);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v8 = a3;
  isSuspended = self->_isSuspended;
  PBFLogAssetHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isSuspended == v8)
  {
    if (v10)
    {
      v11 = 134218240;
      v12 = self;
      v13 = 1024;
      v14 = v8;
      v5 = "(%p) bail update suspended; isSuspended is already %{BOOL}u";
      v6 = v4;
      v7 = 18;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  if (v10)
  {
    v11 = 134218240;
    v12 = self;
    v13 = 1024;
    v14 = v8;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "(%p) update suspended: %{BOOL}u", (uint8_t *)&v11, 0x12u);
  }

  self->_isSuspended = v8;
  -[PBFPosterGalleryAssetHelper _stateWasUpdated:](self, "_stateWasUpdated:", 1);
}

- (void)updatePosterPreview:(id)a3 isVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  PBFPosterGalleryAssetHelper *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = self;
      _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "(%p) bail updatePosterPreview; invalidated",
        (uint8_t *)&v11,
        0xCu);
    }
  }
  else
  {
    -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject isVisible](v7, "isVisible");
    PBFLogAssetHelper();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 == v4)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PBFPosterGalleryAssetHelper updatePosterPreview:isVisible:].cold.1();
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 134218498;
        v12 = self;
        v13 = 2114;
        v14 = v6;
        v15 = 1024;
        v16 = v4;
        _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_INFO, "(%p) updatePosterPreview for posterPreview %{public}@; marking visible as %{BOOL}u",
          (uint8_t *)&v11,
          0x1Cu);
      }

      -[NSObject setVisible:](v7, "setVisible:", v4);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
      -[PBFPosterGalleryAssetHelper _stateWasUpdatedForPosterPreviews:](self, "_stateWasUpdatedForPosterPreviews:", v10);
    }

  }
}

- (void)prefetchPosterPreviews:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  PBFPosterGalleryAssetHelper *v12;
  NSObject *v13;
  uint8_t buf[4];
  PBFPosterGalleryAssetHelper *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = self;
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "(%p) bail prefetchPosterPreviews; invalidated",
        buf,
        0xCu);
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __54__PBFPosterGalleryAssetHelper_prefetchPosterPreviews___block_invoke;
    v11 = &unk_1E86F4830;
    v12 = self;
    v5 = v6;
    v13 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);
    PBFLogAssetHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v15 = self;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_INFO, "(%p) prefetchPosterPreviews: %{public}@", buf, 0x16u);
    }

    -[PBFPosterGalleryAssetHelper _stateWasUpdatedForPosterPreviews:](self, "_stateWasUpdatedForPosterPreviews:", v5, v8, v9, v10, v11, v12);
  }

}

void __54__PBFPosterGalleryAssetHelper_prefetchPosterPreviews___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "shouldPrefetch") & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v4);
  else
    objc_msgSend(v3, "setShouldPrefetch:", 1);

}

- (void)cancelPrefetchForPosterPreviews:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  PBFPosterGalleryAssetHelper *v12;
  NSObject *v13;
  uint8_t buf[4];
  PBFPosterGalleryAssetHelper *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = self;
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "(%p) bail cancelPrefetchForPosterPreviews; invalidated",
        buf,
        0xCu);
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __63__PBFPosterGalleryAssetHelper_cancelPrefetchForPosterPreviews___block_invoke;
    v11 = &unk_1E86F4830;
    v12 = self;
    v5 = v6;
    v13 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);
    PBFLogAssetHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v15 = self;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "(%p) cancelPrefetchForPosterPreviews: %{public}@", buf, 0x16u);
    }

    -[PBFPosterGalleryAssetHelper _stateWasUpdatedForPosterPreviews:](self, "_stateWasUpdatedForPosterPreviews:", v5, v8, v9, v10, v11, v12);
  }

}

void __63__PBFPosterGalleryAssetHelper_cancelPrefetchForPosterPreviews___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldPrefetch"))
    objc_msgSend(v3, "setShouldPrefetch:", 0);
  else
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v4);

}

- (id)assetsForPosterPreview:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v30;
  PBFPosterGalleryAssetHelper *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  NSObject *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 134217984;
      v31 = self;
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "(%p) bail assetsForPosterPreview; invalidated",
        (uint8_t *)&v30,
        0xCu);
    }
    v6 = 0;
  }
  else
  {
    -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if (v7)
    {
      -[NSObject previewImageView](v7, "previewImageView");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject livePreviewViewController](v5, "livePreviewViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSObject livePreviewState](v5, "livePreviewState") == 1 && v9 != 0;
      if (-[NSObject willUseLivePreview](v5, "willUseLivePreview"))
      {
        +[PBFPosterSnapshotDefinition gallerySnapshotKeyFrameDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotKeyFrameDefinition");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject snapshotCollection](v5, "snapshotCollection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "receivedImageForDefinition:displayContext:", v12, self->_activeDisplayContext);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_previewGenerator);
          objc_msgSend(WeakRetained, "preparedSnapshotForPosterPreview:context:definition:", v4, self->_activeDisplayContext, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v14 = 0;
      }
      -[NSObject snapshotCollection](v5, "snapshotCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:](PBFPosterSnapshotDefinition, "defaultPreviewDefinitionForPreview:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "receivedImageForDefinition:displayContext:", v17, self->_activeDisplayContext);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject image](v8, "image");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 != v19)
      {
        -[PBFPosterGalleryAssetHelper _contentSizeForPreview:](self, "_contentSizeForPreview:", v4);
        if (-[NSObject updateImage:imageSize:](v8, "updateImage:imageSize:", v18))
          -[PBFPosterGalleryAssetHelper _sizeContainerView:forPreview:displayContext:](self, "_sizeContainerView:forPreview:displayContext:", v8, v4, self->_activeDisplayContext);
      }
      PBFLogAssetHelper();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

      if (v21)
      {
        PBFLogAssetHelper();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v30 = 134219010;
          v31 = self;
          v32 = 2114;
          v33 = v4;
          v34 = 2112;
          v35 = v8;
          v36 = 2112;
          v37 = v9;
          v38 = 1024;
          v39 = v11;
          _os_log_debug_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_DEBUG, "(%p) assetsForPosterPreview: %{public}@ -- imageView: %@; livePreviewViewController: %@; livePreviewIsReady: %{BOOL}u;",
            (uint8_t *)&v30,
            0x30u);
        }

      }
      -[NSObject asset](v5, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "image");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject image](v8, "image");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23 != v24)
      {
        -[NSObject image](v8, "image");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setImage:", v25);

      }
      objc_msgSend(v6, "imageView");
      v26 = objc_claimAutoreleasedReturnValue();

      if (v26 != v8)
        objc_msgSend(v6, "setImageView:", v8);
      if (v11)
      {
        objc_msgSend(v6, "liveViewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27 != v9)
          objc_msgSend(v6, "setLiveViewController:", v9);
        objc_msgSend(v6, "keyFrameImage");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28 != v14)
          objc_msgSend(v6, "setKeyFrameImage:", v14);
      }
      else
      {
        objc_msgSend(v6, "setLiveViewController:", 0);
      }

    }
    else
    {
      PBFLogAssetHelper();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 134218242;
        v31 = self;
        v32 = 2114;
        v33 = v4;
        _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, "(%p) assetsForPosterPreview: %{public}@ -- no state found; not tracking poster preview?",
          (uint8_t *)&v30,
          0x16u);
      }
      v6 = 0;
    }

  }
  return v6;
}

- (void)_stateWasUpdated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 isInvalidated;
  NSObject *v6;
  _BOOL4 v7;
  BOOL v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  PBFPosterGalleryAssetHelper *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  NSObject *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  isInvalidated = self->_isInvalidated;
  PBFLogAssetHelper();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (isInvalidated)
  {
    if (v7)
      -[PBFPosterGalleryAssetHelper _stateWasUpdated:].cold.3();
  }
  else
  {
    if (v7)
      -[PBFPosterGalleryAssetHelper _stateWasUpdated:].cold.2();

    -[PBFPosterGalleryAssetHelper posterPreviews](self, "posterPreviews");
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = -[PBFPosterGalleryAssetHelper _updateHydrationStateIfNeeded](self, "_updateHydrationStateIfNeeded");
    PBFLogAssetHelper();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8 || v3)
    {
      if (v10)
      {
        v11 = 134218498;
        v12 = self;
        v13 = 1024;
        v14 = v3;
        v15 = 2114;
        v16 = v6;
        _os_log_debug_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_DEBUG, "(%p) _stateWasUpdated:%{BOOL}u; update hydration state was needed for poster previews: %{public}@",
          (uint8_t *)&v11,
          0x1Cu);
      }

      -[PBFPosterGalleryAssetHelper _stateWasUpdatedForPosterPreviews:](self, "_stateWasUpdatedForPosterPreviews:", v6);
    }
    else
    {
      if (v10)
        -[PBFPosterGalleryAssetHelper _stateWasUpdated:].cold.1();

    }
    -[PBFPosterGalleryAssetHelper _sizeAssetsForActiveDisplayContext](self, "_sizeAssetsForActiveDisplayContext");
  }

}

- (BOOL)_updateHydrationStateIfNeeded
{
  NSObject *v3;
  BOOL v4;
  int64_t *p_assetHydrationState;
  void (**v6)(_QWORD *__return_ptr);
  int8x16_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  char v17;
  _BOOL4 v18;
  unint64_t v19;
  const __CFString *v20;
  int v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  PBFPosterGalleryAssetHelper *v26;
  uint64_t v27;
  os_signpost_id_t v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  unint64_t v36;
  const __CFString *v37;
  unint64_t v38;
  const __CFString *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  unint64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  int8x16_t v53;
  __int128 v54;
  int64x2_t v55;
  __int128 v56;
  __int128 v57;
  _QWORD aBlock[5];
  _OWORD buf[5];
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PBFPosterGalleryAssetHelper _updateHydrationStateIfNeeded].cold.3();

    return 0;
  }
  p_assetHydrationState = &self->_assetHydrationState;
  if (self->_assetHydrationState)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PBFPosterGalleryAssetHelper__updateHydrationStateIfNeeded__block_invoke;
    aBlock[3] = &unk_1E86F4858;
    aBlock[4] = self;
    v6 = (void (**)(_QWORD *__return_ptr))_Block_copy(aBlock);
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    ((void (**)(__int128 *__return_ptr))v6)[2](&v52);
    v7 = (int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vextq_s8(v53, v53, 8uLL)), (int32x4_t)vceqzq_s64(v55));
    v8 = vaddvq_s32((int32x4_t)vbicq_s8((int8x16_t)xmmword_1CBB8E2D0, v7));
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8(v7))) & 1) != 0)
    {
      v9 = 0;
      v10 = 0;
    }
    else
    {
      v47 = v8;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      -[PBFPosterGalleryAssetHelper knownDisplayContexts](self, "knownDisplayContexts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      if (v13)
      {
        v14 = v13;
        v9 = 0;
        v10 = 0;
        v15 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v49 != v15)
              objc_enumerationMutation(v12);
            if (*(PBFDisplayContext **)(*((_QWORD *)&v48 + 1) + 8 * i) != self->_activeDisplayContext)
            {
              v60 = 0u;
              memset(buf, 0, sizeof(buf));
              ((void (*)(_OWORD *__return_ptr, void (**)(_QWORD *__return_ptr)))v6[2])(buf, v6);
              v10 += v60;
              v9 += *((_QWORD *)&v60 + 1);
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
        }
        while (v14);
      }
      else
      {
        v9 = 0;
        v10 = 0;
      }

      v8 = v47;
    }
    v17 = v8;
    v18 = (v10 | v9) != 0;
    v19 = *p_assetHydrationState - 1;
    if (v19 > 2)
      v20 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
    else
      v20 = off_1E86F4978[v19];
    v21 = v17 & 0xF;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) "), v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PBFLogAssetHelper();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[PBFPosterGalleryAssetHelper _updateHydrationStateIfNeeded].cold.2();

      objc_msgSend(v22, "stringByAppendingString:", CFSTR("outstanding active display context foreground hydration; transitioning back to initial hydration state to finish those up"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = self;
      v27 = 1;
    }
    else
    {
      if (v18)
      {
        v28 = os_signpost_id_generate(v23);

        v29 = PRIsLowQualityDevice();
        PBFLogAssetHelper();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v30;
        v32 = v28 - 1;
        if (!v29)
        {
          if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v28, "HighQualityGalleryHydration", ", (uint8_t *)buf, 2u);
          }

          PBFLogAssetHelper();
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = v40;
          if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v41, OS_SIGNPOST_INTERVAL_END, v28, "HighQualityGalleryHydration", ", (uint8_t *)buf, 2u);
          }

          PBFLogAssetHelper();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v43 = *p_assetHydrationState - 1;
            if (v43 > 2)
              v44 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
            else
              v44 = off_1E86F4978[v43];
            LODWORD(buf[0]) = 134218498;
            *(_QWORD *)((char *)buf + 4) = self;
            WORD6(buf[0]) = 2114;
            *(_QWORD *)((char *)buf + 14) = v44;
            WORD3(buf[1]) = 2114;
            *((_QWORD *)&buf[1] + 1) = CFSTR("PBFPosterGalleryAssetHydrationStateAlternateDisplayContextHydration");
            _os_log_impl(&dword_1CB9FA000, v42, OS_LOG_TYPE_INFO, "(%p) _updateHydrationStateIfNeeded; executing transitioning from %{public}@ -> %{public}@",
              (uint8_t *)buf,
              0x20u);
          }

          objc_msgSend(v22, "stringByAppendingString:", CFSTR("Outstanding display context fetches are needed after initial hydration"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = self;
          v27 = 2;
          goto LABEL_63;
        }
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          LOWORD(buf[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v28, "LowQualityGalleryHydration", ", (uint8_t *)buf, 2u);
        }

        PBFLogAssetHelper();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          LOWORD(buf[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v34, OS_SIGNPOST_INTERVAL_END, v28, "LowQualityGalleryHydration", ", (uint8_t *)buf, 2u);
        }

        PBFLogAssetHelper();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = *p_assetHydrationState - 1;
          if (v36 > 2)
            v37 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
          else
            v37 = off_1E86F4978[v36];
          LODWORD(buf[0]) = 134218498;
          *(_QWORD *)((char *)buf + 4) = self;
          WORD6(buf[0]) = 2114;
          *(_QWORD *)((char *)buf + 14) = v37;
          WORD3(buf[1]) = 2114;
          *((_QWORD *)&buf[1] + 1) = CFSTR("PBFPosterGalleryAssetHydrationStateComplete");
          _os_log_impl(&dword_1CB9FA000, v35, OS_LOG_TYPE_INFO, "(%p) _updateHydrationStateIfNeeded; executing transitioning from %{public}@ -> %{public}@",
            (uint8_t *)buf,
            0x20u);
        }

        v45 = CFSTR("Low quality device; marking as complete...");
      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v38 = *p_assetHydrationState - 1;
          if (v38 > 2)
            v39 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
          else
            v39 = off_1E86F4978[v38];
          LODWORD(buf[0]) = 134218498;
          *(_QWORD *)((char *)buf + 4) = self;
          WORD6(buf[0]) = 2114;
          *(_QWORD *)((char *)buf + 14) = v39;
          WORD3(buf[1]) = 2114;
          *((_QWORD *)&buf[1] + 1) = CFSTR("PBFPosterGalleryAssetHydrationStateComplete");
          _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_INFO, "(%p) _updateHydrationStateIfNeeded; executing transitioning from %{public}@ -> %{public}@",
            (uint8_t *)buf,
            0x20u);
        }

        v45 = CFSTR("All requests for active display context as well as other display contexts are complete.");
      }
      objc_msgSend(v22, "stringByAppendingString:", v45);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = self;
      v27 = 3;
    }
LABEL_63:
    v4 = -[PBFPosterGalleryAssetHelper _updateHydrationStateTo:reason:](v26, "_updateHydrationStateTo:reason:", v27, v25);

    return v4;
  }
  PBFLogAssetHelper();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[PBFPosterGalleryAssetHelper _updateHydrationStateIfNeeded].cold.1();

  return -[PBFPosterGalleryAssetHelper _updateHydrationStateTo:reason:](self, "_updateHydrationStateTo:reason:", 1, CFSTR("Initial Default->Initial transition."));
}

void __60__PBFPosterGalleryAssetHelper__updateHydrationStateIfNeeded__block_invoke(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "posterPreviews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v22 = 0;
    v23 = 0;
    v26 = 0;
    v27 = 0;
    v20 = 0;
    v21 = 0;
    v18 = 0;
    v19 = 0;
    v24 = 0;
    v25 = 0;
    v16 = 0;
    v17 = 0;
    v7 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v9, v16);
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          *(_QWORD *)(a3 + 88) = v27 + 1;
          *(_QWORD *)(a3 + 56) = v23 + 1;
          goto LABEL_27;
        }
        v11 = (void *)v10;
        +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:](PBFPosterSnapshotDefinition, "defaultPreviewDefinitionForPreview:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isVisible") & 1) != 0)
          v13 = 1;
        else
          v13 = objc_msgSend(v11, "shouldPrefetch");
        objc_msgSend(v11, "snapshotCollection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "snapshotRequestStatusForDefinition:displayContext:outInvalidationContext:", v12, v29, 0);

        switch(v15)
        {
          case 0:
            *(_QWORD *)(a3 + 88) = ++v27;
            if (v13)
              *(_QWORD *)(a3 + 24) = ++v22;
            else
              *(_QWORD *)(a3 + 56) = ++v23;
            break;
          case 1:
            *(_QWORD *)(a3 + 80) = ++v24;
            if (v13)
              *(_QWORD *)(a3 + 16) = ++v18;
            else
              *(_QWORD *)(a3 + 48) = ++v17;
            break;
          case 2:
            *(_QWORD *)(a3 + 72) = ++v26;
            if (v13)
              *(_QWORD *)(a3 + 8) = ++v21;
            else
              *(_QWORD *)(a3 + 40) = ++v20;
            break;
          case 3:
            *(_QWORD *)(a3 + 64) = ++v25;
            if (v13)
              *(_QWORD *)a3 = ++v16;
            else
              *(_QWORD *)(a3 + 32) = ++v19;
            break;
          default:
            break;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_27:

}

- (BOOL)_updateHydrationStateTo:(int64_t)a3 reason:(id)a4
{
  __CFString *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int64_t assetHydrationState;
  _BOOL4 v12;
  const __CFString *v13;
  unint64_t v14;
  const __CFString *v15;
  BOOL v16;
  const __CFString *v18;
  int v19;
  PBFPosterGalleryAssetHelper *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v19 = 134217984;
      v20 = self;
      v8 = "(%p) bail _updateHydrationStateTo; invalidated";
      v9 = v7;
      v10 = 12;
LABEL_13:
      _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v19, v10);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  assetHydrationState = self->_assetHydrationState;
  PBFLogAssetHelper();
  v7 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (assetHydrationState == a3)
  {
    if (v12)
    {
      if ((unint64_t)(a3 - 1) > 2)
        v13 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
      else
        v13 = off_1E86F4978[a3 - 1];
      v19 = 134218498;
      v20 = self;
      v21 = 2114;
      v22 = v13;
      v23 = 2114;
      v24 = v6;
      v8 = "(%p) bail _updateHydrationStateTo; state is same '%{public}@' / reason %{public}@";
      v9 = v7;
      v10 = 32;
      goto LABEL_13;
    }
LABEL_14:

    v16 = 0;
    goto LABEL_15;
  }
  if (v12)
  {
    v14 = self->_assetHydrationState - 1;
    if (v14 > 2)
      v15 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
    else
      v15 = off_1E86F4978[v14];
    if ((unint64_t)(a3 - 1) > 2)
      v18 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
    else
      v18 = off_1E86F4978[a3 - 1];
    v19 = 134218754;
    v20 = self;
    v21 = 2114;
    v22 = v15;
    v23 = 2114;
    v24 = v18;
    v25 = 2114;
    v26 = v6;
    _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_INFO, "(%p) bail _updateHydrationStateTo; updating state from %{public}@ to '%{public}@' / reason %{public}@",
      (uint8_t *)&v19,
      0x2Au);
  }

  self->_assetHydrationState = a3;
  v16 = 1;
LABEL_15:

  return v16;
}

- (void)_sizeAssetsForActiveDisplayContext
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  PBFDisplayContext *activeDisplayContext;
  _BOOL4 v8;
  PBFDisplayContext *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  _BOOL4 v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  PBFDisplayContext *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  id WeakRetained;
  PBFDisplayContext *v41;
  NSObject *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  PBFPosterGalleryAssetHelper *v54;
  __int16 v55;
  PBFDisplayContext *v56;
  __int16 v57;
  NSObject *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v54 = self;
      v4 = "(%p) bail _sizeAssetsForActiveDisplayContext; invalidated";
      v5 = v3;
      v6 = OS_LOG_TYPE_DEFAULT;
LABEL_4:
      _os_log_impl(&dword_1CB9FA000, v5, v6, v4, buf, 0xCu);
    }
  }
  else
  {
    activeDisplayContext = self->_activeDisplayContext;
    PBFLogAssetHelper();
    v3 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (!activeDisplayContext)
    {
      if (!v8)
        goto LABEL_41;
      *(_DWORD *)buf = 134217984;
      v54 = self;
      v4 = "(%p) bail _sizeAssetsForActiveDisplayContext; null active display context";
      v5 = v3;
      v6 = OS_LOG_TYPE_INFO;
      goto LABEL_4;
    }
    if (v8)
    {
      v9 = self->_activeDisplayContext;
      *(_DWORD *)buf = 134218242;
      v54 = self;
      v55 = 2114;
      v56 = v9;
      _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_INFO, "(%p) _sizeAssetsForActiveDisplayContext for %{public}@", buf, 0x16u);
    }

    v42 = objc_opt_new();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[PBFPosterGalleryAssetHelper posterPreviews](self, "posterPreviews");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v49 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:](PBFPosterSnapshotDefinition, "defaultPreviewDefinitionForPreview:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "livePreviewViewController");
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17 && (v18 = (void *)v17, v19 = objc_msgSend(v15, "livePreviewState"), v18, v19 == 1))
          {
            objc_msgSend(v15, "livePreviewViewController");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setDisplayContext:", self->_activeDisplayContext);

            objc_msgSend(v15, "livePreviewViewController");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "view");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[PBFPosterGalleryAssetHelper _sizeContainerView:forPreview:displayContext:](self, "_sizeContainerView:forPreview:displayContext:", v22, v14, self->_activeDisplayContext);

            if (v23)
              -[NSObject addObject:](v42, "addObject:", v14);
          }
          else
          {
            objc_msgSend(v15, "previewImageView");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v15, "snapshotCollection");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "receivedImageForDefinition:displayContext:", v16, self->_activeDisplayContext);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26)
              {
                objc_msgSend(v15, "previewImageView");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[PBFPosterGalleryAssetHelper _contentSizeForPreview:](self, "_contentSizeForPreview:", v14);
                v28 = objc_msgSend(v27, "updateImage:imageSize:", v26);

                if (v28)
                {
                  objc_msgSend(v15, "previewImageView");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = -[PBFPosterGalleryAssetHelper _sizeContainerView:forPreview:displayContext:](self, "_sizeContainerView:forPreview:displayContext:", v29, v14, self->_activeDisplayContext);

                  if (v30)
                    -[NSObject addObject:](v42, "addObject:", v14);
                }

              }
            }
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
      }
      while (v11);
    }

    v3 = v42;
    v31 = -[NSObject count](v42, "count");
    PBFLogAssetHelper();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
    if (v31)
    {
      if (v33)
      {
        v34 = self->_activeDisplayContext;
        *(_DWORD *)buf = 134218498;
        v54 = self;
        v55 = 2114;
        v56 = v34;
        v57 = 2114;
        v58 = v42;
        _os_log_impl(&dword_1CB9FA000, v32, OS_LOG_TYPE_INFO, "(%p) _sizeAssetsForActiveDisplayContext for %{public}@; notify delegate of updated assets: %{public}@",
          buf,
          0x20u);
      }

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v32 = v42;
      v35 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v45 != v37)
              objc_enumerationMutation(v32);
            v39 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(WeakRetained, "assetHelper:didUpdateAssetsForPosterPreview:", self, v39);

          }
          v36 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v36);
      }
    }
    else if (v33)
    {
      v41 = self->_activeDisplayContext;
      *(_DWORD *)buf = 134218242;
      v54 = self;
      v55 = 2114;
      v56 = v41;
      _os_log_impl(&dword_1CB9FA000, v32, OS_LOG_TYPE_INFO, "(%p) bail _sizeAssetsForActiveDisplayContext for %{public}@; no updated poster previews to notify delegate of",
        buf,
        0x16u);
    }

  }
LABEL_41:

}

- (void)_stateWasUpdatedForPosterPreviews:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const __CFString *v8;
  _PBFPosterGalleryAssetState *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t assetHydrationState;
  NSObject *v22;
  unint64_t v23;
  const __CFString *v24;
  NSObject *WeakRetained;
  unint64_t v26;
  const __CFString *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  unint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  NSObject *v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  unint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  unint64_t v52;
  const __CFString *v53;
  unint64_t v54;
  const __CFString *v55;
  unint64_t v56;
  const __CFString *v57;
  unint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  id v61;
  NSObject *v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  PBFPosterGalleryAssetHelper *v82;
  __int16 v83;
  const __CFString *v84;
  __int16 v85;
  _BYTE v86[10];
  NSObject *v87;
  __int16 v88;
  _BOOL4 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v82 = self;
      v6 = "(%p) bail _stateWasUpdatedForPosterPreviews; invalidated";
LABEL_7:
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_INFO, v6, buf, 0xCu);
      goto LABEL_103;
    }
    goto LABEL_103;
  }
  if (!-[PBFPosterGalleryAssetHelper isSuspended](self, "isSuspended"))
  {
    -[PBFPosterGalleryAssetHelper activeDisplayContext](self, "activeDisplayContext");
    v5 = objc_claimAutoreleasedReturnValue();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v61 = v4;
    obj = v4;
    v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
    if (!v65)
      goto LABEL_102;
    v64 = *(_QWORD *)v77;
    v62 = v5;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v77 != v64)
          objc_enumerationMutation(obj);
        v8 = *(const __CFString **)(*((_QWORD *)&v76 + 1) + 8 * v7);
        -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", v8, v61);
        v9 = (_PBFPosterGalleryAssetState *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v9 = -[_PBFPosterGalleryAssetState initWithPreview:]([_PBFPosterGalleryAssetState alloc], "initWithPreview:", v8);
          -[NSMapTable setObject:forKey:](self->_previewToState, "setObject:forKey:", v9, v8);
          if (!v5)
            goto LABEL_81;
LABEL_17:
          +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:](PBFPosterSnapshotDefinition, "defaultPreviewDefinitionForPreview:", v8);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PBFPosterGalleryAssetState snapshotCollection](v9, "snapshotCollection");
          v66 = objc_claimAutoreleasedReturnValue();
          v10 = -[_PBFPosterGalleryAssetState isVisible](v9, "isVisible");
          v11 = -[_PBFPosterGalleryAssetState shouldPrefetch](v9, "shouldPrefetch");
          v12 = -[_PBFPosterGalleryAssetState willUseLivePreview](v9, "willUseLivePreview");
          PBFLogAssetHelper();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
          if (!v12 || !v11 && !v10)
          {
            if (v14)
            {
              *(_DWORD *)buf = 134219010;
              v82 = self;
              v83 = 2114;
              v84 = v8;
              v85 = 1024;
              *(_DWORD *)v86 = v12;
              *(_WORD *)&v86[4] = 1024;
              *(_DWORD *)&v86[6] = v11;
              LOWORD(v87) = 1024;
              *(_DWORD *)((char *)&v87 + 2) = v10;
              _os_log_debug_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEBUG, "(%p) _stateWasUpdatedForPosterPreviews; skip live preview setup for %{public}@; willUseLivePreview: %{BO"
                "OL}u shouldPrefetch: %{BOOL}u; isVisible: %{BOOL}u",
                buf,
                0x28u);
            }

            v16 = (void *)v66;
          }
          else
          {
            if (v14)
            {
              *(_DWORD *)buf = 134218242;
              v82 = self;
              v83 = 2114;
              v84 = v8;
              _os_log_debug_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEBUG, "(%p) _stateWasUpdatedForPosterPreviews; checking if live preview is viable for %{public}@",
                buf,
                0x16u);
            }

            v17 = -[_PBFPosterGalleryAssetState livePreviewState](v9, "livePreviewState");
            PBFLogAssetHelper();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = v18;
            v16 = (void *)v66;
            if (v17 == -1)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218242;
                v82 = self;
                v83 = 2114;
                v84 = v8;
                _os_log_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_INFO, "(%p) _stateWasUpdatedForPosterPreviews; setting up live preview for %{public}@",
                  buf,
                  0x16u);
              }

              -[PBFPosterGalleryAssetHelper _setupLiveDisplayStyleForPreview:](self, "_setupLiveDisplayStyleForPreview:", v8);
            }
            else
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218242;
                v82 = self;
                v83 = 2114;
                v84 = v8;
                _os_log_debug_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_DEBUG, "(%p) _stateWasUpdatedForPosterPreviews; live preview for %{public}@ is already setup",
                  buf,
                  0x16u);
              }

            }
          }
          PBFLogAssetHelper();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v52 = self->_assetHydrationState - 1;
            v53 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
            if (v52 <= 2)
              v53 = off_1E86F4978[v52];
            *(_DWORD *)buf = 134218498;
            v82 = self;
            v83 = 2114;
            v84 = v53;
            v85 = 2114;
            *(_QWORD *)v86 = v8;
            _os_log_debug_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEBUG, "(%p; %{public}@) _stateWasUpdatedForPosterPreviews for %{public}@",
              buf,
              0x20u);
          }

          assetHydrationState = self->_assetHydrationState;
          if (assetHydrationState < 2)
          {
            if (v10 || v11)
            {
              if (objc_msgSend(v16, "snapshotRequestStatusForDefinition:displayContext:outInvalidationContext:", v67, v5, 0) != 1)
              {
                if (!-[PBFPosterGalleryAssetHelper _kickoffPreviewGeneratorForPosterPreview:context:](self, "_kickoffPreviewGeneratorForPosterPreview:context:", v8, v5))goto LABEL_79;
                PBFLogAssetHelper();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                {
                  v56 = self->_assetHydrationState - 1;
                  v57 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
                  if (v56 <= 2)
                    v57 = off_1E86F4978[v56];
                  *(_DWORD *)buf = 134219010;
                  v82 = self;
                  v83 = 2114;
                  v84 = v57;
                  v85 = 2114;
                  *(_QWORD *)v86 = v8;
                  *(_WORD *)&v86[8] = 2114;
                  v87 = v5;
                  v88 = 1024;
                  v89 = v10;
                  _os_log_debug_impl(&dword_1CB9FA000, v50, OS_LOG_TYPE_DEBUG, "(%p; %{public}@)  _stateWasUpdatedForPosterPreviews kickOffPreviewGenerator for posterPreview '%{pub"
                    "lic}@' w/ activeDisplayContext: %{public}@; notifyUpdatedContent? %{BOOL}u",
                    buf,
                    0x30u);
                }

                if (!v10)
                  goto LABEL_79;
                PBFLogAssetHelper();
                v51 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                {
                  v58 = self->_assetHydrationState - 1;
                  v59 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
                  if (v58 <= 2)
                    v59 = off_1E86F4978[v58];
                  *(_DWORD *)buf = 134218498;
                  v82 = self;
                  v83 = 2114;
                  v84 = v59;
                  v85 = 2114;
                  *(_QWORD *)v86 = v8;
                  _os_log_debug_impl(&dword_1CB9FA000, v51, OS_LOG_TYPE_DEBUG, "(%p; %{public}@)  _stateWasUpdatedForPosterPreviews will notifyUpdatedContent for posterPreview '%{public}@'",
                    buf,
                    0x20u);
                }

                WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                -[NSObject assetHelper:didUpdateAssetsForPosterPreview:](WeakRetained, "assetHelper:didUpdateAssetsForPosterPreview:", self, v8);
LABEL_80:

                goto LABEL_81;
              }
              PBFLogAssetHelper();
              WeakRetained = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
                goto LABEL_80;
              v26 = self->_assetHydrationState - 1;
              v27 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
              if (v26 <= 2)
                v27 = off_1E86F4978[v26];
              *(_DWORD *)buf = 134218498;
              v82 = self;
              v83 = 2114;
              v84 = v27;
              v85 = 2114;
              *(_QWORD *)v86 = v8;
              v28 = WeakRetained;
              v29 = "(%p; %{public}@) bail _stateWasUpdatedForPosterPreviews for posterPreview '%{public}@' because request is in flight";
LABEL_94:
              _os_log_debug_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_DEBUG, v29, buf, 0x20u);
              goto LABEL_80;
            }
            objc_msgSend(v16, "invalidateAndRemoveInProgressRequestsNotMatchingContext:", v5);
            v22 = objc_claimAutoreleasedReturnValue();
            PBFLogAssetHelper();
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);

            if (!v40 || !v22)
              goto LABEL_78;
            v74 = 0u;
            v75 = 0u;
            v72 = 0u;
            v73 = 0u;
            v22 = v22;
            v41 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
            if (v41)
            {
              v42 = v41;
              v43 = *(_QWORD *)v73;
              do
              {
                v44 = 0;
                do
                {
                  if (*(_QWORD *)v73 != v43)
                    objc_enumerationMutation(v22);
                  v45 = *(NSObject **)(*((_QWORD *)&v72 + 1) + 8 * v44);
                  PBFLogAssetHelper();
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                  {
                    v47 = self->_assetHydrationState - 1;
                    v48 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
                    if (v47 <= 2)
                      v48 = off_1E86F4978[v47];
                    *(_DWORD *)buf = 134218754;
                    v82 = self;
                    v83 = 2114;
                    v84 = v48;
                    v85 = 2114;
                    *(_QWORD *)v86 = v8;
                    *(_WORD *)&v86[8] = 2114;
                    v87 = v45;
                    _os_log_debug_impl(&dword_1CB9FA000, v46, OS_LOG_TYPE_DEBUG, "(%p; %{public}@) _stateWasUpdatedForPosterPreviews invalidating request for posterPreview '%{publi"
                      "c}@' because of non-activeDisplayContext %{public}@",
                      buf,
                      0x2Au);
                  }

                  ++v44;
                }
                while (v42 != v44);
                v49 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
                v42 = v49;
              }
              while (v49);
            }

          }
          else
          {
            if (assetHydrationState != 2)
            {
              if (assetHydrationState == 3)
              {
                PBFLogAssetHelper();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  v23 = self->_assetHydrationState - 1;
                  v24 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
                  if (v23 <= 2)
                    v24 = off_1E86F4978[v23];
                  *(_DWORD *)buf = 134218498;
                  v82 = self;
                  v83 = 2114;
                  v84 = v24;
                  v85 = 2114;
                  *(_QWORD *)v86 = v8;
                  _os_log_debug_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_DEBUG, "(%p; %{public}@)  _stateWasUpdatedForPosterPreviews for posterPreview '%{public}@'",
                    buf,
                    0x20u);
                }
LABEL_78:

              }
LABEL_79:
              PBFLogAssetHelper();
              WeakRetained = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
                goto LABEL_80;
              v54 = self->_assetHydrationState - 1;
              v55 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
              if (v54 <= 2)
                v55 = off_1E86F4978[v54];
              *(_DWORD *)buf = 134218498;
              v82 = self;
              v83 = 2114;
              v84 = v55;
              v85 = 2114;
              *(_QWORD *)v86 = v8;
              v28 = WeakRetained;
              v29 = "(%p; %{public}@)  _stateWasUpdatedForPosterPreviews will *NOT* notifyUpdatedContent for posterPreview '%{public}@'";
              goto LABEL_94;
            }
            if (!v10 && !v11)
              goto LABEL_79;
            v70 = 0u;
            v71 = 0u;
            v68 = 0u;
            v69 = 0u;
            -[PBFPosterGalleryAssetHelper knownDisplayContextWithoutActiveDisplayContext](self, "knownDisplayContextWithoutActiveDisplayContext");
            v22 = objc_claimAutoreleasedReturnValue();
            v30 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
            if (!v30)
              goto LABEL_78;
            v31 = v30;
            v32 = *(_QWORD *)v69;
            do
            {
              v33 = 0;
              do
              {
                if (*(_QWORD *)v69 != v32)
                  objc_enumerationMutation(v22);
                v34 = *(NSObject **)(*((_QWORD *)&v68 + 1) + 8 * v33);
                PBFLogAssetHelper();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                {
                  v36 = self->_assetHydrationState - 1;
                  v37 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
                  if (v36 <= 2)
                    v37 = off_1E86F4978[v36];
                  *(_DWORD *)buf = 134218754;
                  v82 = self;
                  v83 = 2114;
                  v84 = v37;
                  v85 = 2114;
                  *(_QWORD *)v86 = v8;
                  *(_WORD *)&v86[8] = 2114;
                  v87 = v34;
                  _os_log_debug_impl(&dword_1CB9FA000, v35, OS_LOG_TYPE_DEBUG, "(%p; %{public}@)  _stateWasUpdatedForPosterPreviews kickOffPreviewGenerator for posterPreview '%{pub"
                    "lic}@' w/ display context: %{public}@;",
                    buf,
                    0x2Au);
                }

                -[PBFPosterGalleryAssetHelper _kickoffPreviewGeneratorForPosterPreview:context:](self, "_kickoffPreviewGeneratorForPosterPreview:context:", v8, v34);
                ++v33;
              }
              while (v31 != v33);
              v38 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
              v31 = v38;
            }
            while (v38);
          }
          v5 = v62;
          v16 = (void *)v66;
          goto LABEL_78;
        }
        if (v5)
          goto LABEL_17;
LABEL_81:

        ++v7;
      }
      while (v7 != v65);
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
      v65 = v60;
      if (!v60)
      {
LABEL_102:

        v4 = v61;
        goto LABEL_103;
      }
    }
  }
  PBFLogAssetHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v82 = self;
    v6 = "(%p) bail _stateWasUpdatedForPosterPreviews; is suspended";
    goto LABEL_7;
  }
LABEL_103:

}

- (BOOL)_kickoffPreviewGeneratorForPosterPreview:(id)a3 context:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id WeakRetained;
  NSObject *v40;
  PBFDisplayContext *activeDisplayContext;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  _BOOL4 v47;
  NSObject *v48;
  const char *v49;
  id v50;
  id v51;
  PBFDisplayContext *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  __int128 v57;
  NSObject *v58;
  void *v59;
  id *location;
  id obj;
  void *v62;
  _BOOL4 v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  id v69;
  void *v70;
  PBFPosterGalleryAssetHelper *val;
  PBFDisplayContext *v72;
  _QWORD v73[4];
  id v74;
  PBFDisplayContext *v75;
  uint64_t v76;
  id v77;
  char v78;
  id from;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  PBFPosterGalleryAssetHelper *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  PBFDisplayContext *v89;
  __int16 v90;
  _BOOL4 v91;
  _BYTE v92[128];
  void *v93;
  _QWORD v94[5];

  v94[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v72 = (PBFDisplayContext *)a4;
  BSDispatchQueueAssertMain();
  v70 = v6;
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v85 = self;
      _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_INFO, "(%p) bail _kickoffPreviewGeneratorForPosterPreview; invalidated",
        buf,
        0xCu);
    }
    LOBYTE(v63) = 0;
    goto LABEL_86;
  }
  val = self;
  -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v58 = v8;
  if (v8)
  {
    -[NSObject snapshotCollection](v8, "snapshotCollection");
    v68 = objc_claimAutoreleasedReturnValue();
    +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:](PBFPosterSnapshotDefinition, "defaultPreviewDefinitionForPreview:", v6);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterSnapshotDefinition gallerySnapshotKeyFrameDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotKeyFrameDefinition");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSObject willUseLivePreview](v58, "willUseLivePreview") & 1) != 0)
    {
      v94[0] = v66;
      v94[1] = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v93 = v66;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v9;
    -[NSObject previewImageView](v58, "previewImageView");
    v69 = (id)objc_claimAutoreleasedReturnValue();
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    obj = v11;
    v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
    if (!v67)
    {
      LOBYTE(v63) = 0;
      goto LABEL_84;
    }
    LOBYTE(v63) = 0;
    location = (id *)&self->_previewGenerator;
    v64 = *(_QWORD *)v81;
    v13 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    *(_QWORD *)&v12 = 134218242;
    v57 = v12;
    while (1)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v81 != v64)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v15);
        v17 = objc_msgSend(v65, "isEqualToDefinition:", v16, v57);
        v18 = objc_msgSend(v66, "isEqualToDefinition:", v16);
        -[NSObject receivedImageForDefinition:displayContext:](v68, "receivedImageForDefinition:displayContext:", v16, v72);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        PBFLogAssetHelper();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          v85 = val;
          v86 = 2114;
          v87 = v70;
          v88 = 1024;
          LODWORD(v89) = v19 != 0;
          _os_log_debug_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; checking state image cache for %{public}@; found? %{BOOL}u",
            buf,
            0x1Cu);
        }

        if (v19)
        {
          v21 = 0;
LABEL_21:
          v22 = val->_activeDisplayContext == v72;
          goto LABEL_22;
        }
        objc_msgSend(v70, "type");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqual:", PBFPreviewTypeHero);

        if ((v26 & v18) != 0)
        {
          PBFLogAssetHelper();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v57;
            v85 = val;
            v86 = 2114;
            v87 = v70;
            _os_log_debug_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; processing PBFPreviewTypeHero for poster preview %{public}@",
              buf,
              0x16u);
          }

          objc_msgSend(v70, "posterDescriptorLookupInfo");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "posterDescriptorPath");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "posterDescriptorExtension");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "descriptorIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3870], "pbf_galleryHeroSnapshotForExtension:descriptorIdentifier:displayContext:", v29, v30, v72);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v31 = 1;
          }
          else
          {
            PBFLogAssetHelper();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v57;
              v85 = val;
              v86 = 2114;
              v87 = v70;
              _os_log_debug_impl(&dword_1CB9FA000, v35, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; No image for PBFPreviewTypeHero for preview %{public}@; a"
                "ttempting to check galleryOptions",
                buf,
                0x16u);
            }

            -[NSObject galleryOptions](v58, "galleryOptions");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v59)
              goto LABEL_53;
            objc_msgSend(v59, "galleryAssetLookupInfo");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "posterExtensionBundle");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "pbf_imageFromBundle:displayContext:error:", v37, v72, 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              PBFLogAssetHelper();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v57;
                v85 = val;
                v86 = 2114;
                v87 = v70;
                _os_log_debug_impl(&dword_1CB9FA000, v38, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; image generated for preview type PBFPreviewTypeHero for %{public}@",
                  buf,
                  0x16u);
              }
              v31 = 1;
            }
            else
            {
LABEL_53:
              PBFLogAssetHelper();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v57;
                v85 = val;
                v86 = 2114;
                v87 = v70;
                _os_log_error_impl(&dword_1CB9FA000, v38, OS_LOG_TYPE_ERROR, "(%p) _kickoffPreviewGeneratorForPosterPreview; NO image generated for preview type PBFPreviewTypeHero for %{public}@",
                  buf,
                  0x16u);
              }
              v19 = 0;
              v31 = 0;
            }

          }
          v21 = v31 != 0;
          if (v19)
            goto LABEL_21;
        }
        WeakRetained = objc_loadWeakRetained(location);
        objc_msgSend(WeakRetained, "preparedSnapshotForPosterPreview:context:definition:", v70, v72, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v19 != 0;
        PBFLogAssetHelper();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          v85 = val;
          v86 = 2114;
          v87 = v70;
          v88 = 1024;
          LODWORD(v89) = v19 != 0;
          _os_log_debug_impl(&dword_1CB9FA000, v40, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; checking previewGenerator image cache for %{public}@; found? %{BOOL}u",
            buf,
            0x1Cu);
        }

        activeDisplayContext = val->_activeDisplayContext;
        v22 = activeDisplayContext == v72;
        if (!v19)
        {
          PBFLogAssetHelper();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v57;
            v85 = val;
            v86 = 2114;
            v87 = v70;
            _os_log_debug_impl(&dword_1CB9FA000, v42, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; no image found for %{public}@; cleaning up state",
              buf,
              0x16u);
          }

          if (v69)
          {
            v43 = activeDisplayContext == v72;
            objc_msgSend(v69, "image");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v44)
              v43 = 0;

            if ((v43 & v18) != 0)
            {
              PBFLogAssetHelper();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v57;
                v85 = val;
                v86 = 2114;
                v87 = v70;
                _os_log_debug_impl(&dword_1CB9FA000, v45, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; no image found for %{public}@; updating image view to nil",
                  buf,
                  0x16u);
              }

              objc_msgSend(v69, "updateImage:imageSize:", 0, v13, v14);
            }
          }
          if (-[NSObject shouldProceedFetchingSnapshotForDefinition:displayContext:maxNumberOfRetryAfterErrors:](v68, "shouldProceedFetchingSnapshotForDefinition:displayContext:maxNumberOfRetryAfterErrors:", v16, v72, 3))
          {
            PBFLogAssetHelper();
            v46 = objc_claimAutoreleasedReturnValue();
            v47 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
            if (v17)
            {
              if (v47)
              {
                *(_DWORD *)buf = 134218754;
                v85 = val;
                v86 = 2114;
                v87 = v70;
                v88 = 2114;
                v89 = v72;
                v90 = 1024;
                v91 = activeDisplayContext == v72;
                v48 = v46;
                v49 = "(%p) _kickoffPreviewGeneratorForPosterPreview; no image found for %{public}@ / keyframe definition"
                      "; kicking off image request for display context %{public}@, isActiveDisplayContext? %{BOOL}u";
                goto LABEL_76;
              }
            }
            else if (v47)
            {
              *(_DWORD *)buf = 134218754;
              v85 = val;
              v86 = 2114;
              v87 = v70;
              v88 = 2114;
              v89 = v72;
              v90 = 1024;
              v91 = activeDisplayContext == v72;
              v48 = v46;
              v49 = "(%p) _kickoffPreviewGeneratorForPosterPreview; no image found for %{public}@ / default definition; k"
                    "icking off image request for display context %{public}@, isActiveDisplayContext? %{BOOL}u";
LABEL_76:
              _os_log_impl(&dword_1CB9FA000, v48, OS_LOG_TYPE_INFO, v49, buf, 0x26u);
            }

            objc_initWeak(&from, val);
            v50 = objc_loadWeakRetained(location);
            v73[0] = MEMORY[0x1E0C809B0];
            v73[1] = 3221225472;
            v73[2] = __80__PBFPosterGalleryAssetHelper__kickoffPreviewGeneratorForPosterPreview_context___block_invoke;
            v73[3] = &unk_1E86F48A8;
            objc_copyWeak(&v77, &from);
            v78 = v17;
            v51 = v70;
            v74 = v51;
            v52 = v72;
            v75 = v52;
            v76 = v16;
            objc_msgSend(v50, "fetchSnapshotForPosterPreview:context:definition:completion:", v51, v52, v16, v73);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            PBFLogAssetHelper();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              v85 = val;
              v86 = 2114;
              v87 = v70;
              v88 = 2114;
              v89 = v72;
              _os_log_debug_impl(&dword_1CB9FA000, v54, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; stashing invalidation context for %{public}@ && context %{public}@;",
                buf,
                0x20u);
            }

            -[NSObject beginRequestForDefinition:displayContext:invalidationContext:](v68, "beginRequestForDefinition:displayContext:invalidationContext:", v16, v52, v53);
            objc_destroyWeak(&v77);
            objc_destroyWeak(&from);
          }
          v19 = 0;
          goto LABEL_44;
        }
LABEL_22:
        PBFLogAssetHelper();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218754;
          v85 = val;
          v86 = 2114;
          v87 = v70;
          v88 = 2114;
          v89 = v72;
          v90 = 1024;
          v91 = v22;
          _os_log_debug_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; image hydrated already for %{public}@ && context %{public}@; "
            "isActiveContext: %{BOOL}u",
            buf,
            0x26u);
        }

        if ((v22 & v18) == 1)
        {
          if (v69)
          {
            PBFLogAssetHelper();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              v85 = val;
              v86 = 2114;
              v87 = v70;
              v88 = 2114;
              v89 = v72;
              _os_log_debug_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; updating image view for %{public}@ && context %{public}@;",
                buf,
                0x20u);
            }

            -[PBFPosterGalleryAssetHelper _contentSizeForPreview:](val, "_contentSizeForPreview:", v70);
            objc_msgSend(v69, "updateImage:imageSize:", v19);
          }
          else
          {
            v69 = -[PBFPosterGalleryAssetHelper _newImageViewWithImage:posterPreview:](val, "_newImageViewWithImage:posterPreview:", v19, v70);
            -[NSObject setPreviewImageView:](v58, "setPreviewImageView:", v69);
            PBFLogAssetHelper();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              v85 = val;
              v86 = 2114;
              v87 = v70;
              v88 = 2114;
              v89 = v72;
              _os_log_debug_impl(&dword_1CB9FA000, v32, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; new image view created for %{public}@ && context %{public}@;",
                buf,
                0x20u);
            }

          }
          v63 = -[PBFPosterGalleryAssetHelper _sizeContainerView:forPreview:displayContext:](val, "_sizeContainerView:forPreview:displayContext:", v69, v70, v72);
          PBFLogAssetHelper();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218754;
            v85 = val;
            v86 = 2114;
            v87 = v70;
            v88 = 2114;
            v89 = v72;
            v90 = 1024;
            v91 = v63;
            _os_log_debug_impl(&dword_1CB9FA000, v33, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; finished updating image view for %{public}@ && context %{pu"
              "blic}@; notifyDidUpdateContent: %{BOOL}u",
              buf,
              0x26u);
          }

        }
        if (v21)
        {
          PBFLogAssetHelper();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218498;
            v85 = val;
            v86 = 2114;
            v87 = v70;
            v88 = 2114;
            v89 = v72;
            _os_log_debug_impl(&dword_1CB9FA000, v34, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; stashing generated image for %{public}@ && context %{public"
              "}@; and marking notifyDidUpdateContent",
              buf,
              0x20u);
          }

          -[NSObject completeRequestForDefinition:displayContext:receivedSnapshot:receivedError:](v68, "completeRequestForDefinition:displayContext:receivedSnapshot:receivedError:", v16, v72, v19, 0);
          LOBYTE(v63) = 1;
        }
LABEL_44:

        ++v15;
      }
      while (v67 != v15);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
      v67 = v55;
      if (!v55)
      {
LABEL_84:

        v10 = v68;
        goto LABEL_85;
      }
    }
  }
  PBFLogAssetHelper();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v85 = self;
    _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_INFO, "(%p) bail _kickoffPreviewGeneratorForPosterPreview; no state",
      buf,
      0xCu);
  }
  LOBYTE(v63) = 0;
LABEL_85:

  v7 = v58;
LABEL_86:

  return v63;
}

void __80__PBFPosterGalleryAssetHelper__kickoffPreviewGeneratorForPosterPreview_context___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v8 = v6;
    v9 = a1[4];
    v10 = a1[5];
    v11 = v5;
    BSDispatchMain();

  }
}

uint64_t __80__PBFPosterGalleryAssetHelper__kickoffPreviewGeneratorForPosterPreview_context___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    if (*(_BYTE *)(a1 + 80))
      NSLog(CFSTR("Received key frame..."));
    PBFLogAssetHelper();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __80__PBFPosterGalleryAssetHelper__kickoffPreviewGeneratorForPosterPreview_context___block_invoke_2_cold_1((_QWORD *)a1, v2, v3);
  }
  else
  {
    if (*(_BYTE *)(a1 + 80))
      NSLog(CFSTR("Received key frame..."));
    PBFLogAssetHelper();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 56);
      v7 = *(_QWORD *)(a1 + 64);
      v9 = 134218754;
      v10 = v4;
      v11 = 2114;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_INFO, "(%p) _kickoffPreviewGeneratorForPosterPreview; request finished for %{public}@ && context %{public}@; image: %{public}@",
        (uint8_t *)&v9,
        0x2Au);
    }
  }

  return objc_msgSend(*(id *)(a1 + 40), "_receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
}

- (id)_newImageViewWithImage:(id)a3 posterPreview:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _PBFImageView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v21;
  uint8_t buf[4];
  PBFPosterGalleryAssetHelper *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  CGSize v31;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v23 = self;
      _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_INFO, "(%p) bail _newImageViewWithImage; invalidated", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    -[PBFPosterGalleryAssetHelper _contentSizeForPreview:](self, "_contentSizeForPreview:", v7);
    v11 = v10;
    v13 = v12;
    v9 = -[_PBFImageView initWithFrame:]([_PBFImageView alloc], "initWithFrame:", 0.0, 0.0, v10, v12);
    -[_PBFImageView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_PBFImageView updateImage:imageSize:](v9, "updateImage:imageSize:", v6, v11, v13);
    objc_msgSend(v7, "posterDescriptorLookupInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject posterDescriptorExtension](v8, "posterDescriptorExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "posterExtensionBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject posterDescriptorPath](v8, "posterDescriptorPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "descriptorIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PBFImageView setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", v18);
    PBFLogAssetHelper();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v31.width = v11;
      v31.height = v13;
      NSStringFromCGSize(v31);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v23 = self;
      v24 = 2114;
      v25 = v7;
      v26 = 2114;
      v27 = v18;
      v28 = 2114;
      v29 = v21;
      _os_log_debug_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_DEBUG, "(%p) _newImageViewWithImage; building new image view for %{public}@/%{public}@; size: %{public}@",
        buf,
        0x2Au);

    }
  }

  return v9;
}

- (CGSize)_contentSizeForPreview:(id)a3
{
  void *v4;
  int v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", PBFPreviewTypeHero);

  if (v5)
    -[PBFPosterGalleryViewSpec posterHeroContentSize](self->_activeDisplayContextSpec, "posterHeroContentSize");
  else
    -[PBFPosterGalleryViewSpec posterContentSizeForOrientation:](self->_activeDisplayContextSpec, "posterContentSizeForOrientation:", -[PBFDisplayContext pbf_interfaceOrientation](self->_activeDisplayContext, "pbf_interfaceOrientation"));
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)_sizeContainerView:(id)a3 forPreview:(id)a4 displayContext:(id)a5
{
  id v8;
  id v9;
  PBFDisplayContext *v10;
  PBFDisplayContext *v11;
  NSObject *v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v22;
  int v24;
  PBFPosterGalleryAssetHelper *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (PBFDisplayContext *)a5;
  v11 = v10;
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134217984;
      v25 = self;
      _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_DEFAULT, "(%p) bail _sizeContainerView; invalidated",
        (uint8_t *)&v24,
        0xCu);
    }

    goto LABEL_14;
  }
  if (self->_activeDisplayContext != v10)
    goto LABEL_14;
  objc_msgSend(v9, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", PBFPreviewTypeHero);

  if (v14)
    -[PBFPosterGalleryViewSpec posterHeroContentSize](self->_activeDisplayContextSpec, "posterHeroContentSize");
  else
    -[PBFPosterGalleryViewSpec posterContentSizeForOrientation:](self->_activeDisplayContextSpec, "posterContentSizeForOrientation:", -[PBFDisplayContext pbf_interfaceOrientation](self->_activeDisplayContext, "pbf_interfaceOrientation"));
  v17 = v15;
  v18 = v16;
  objc_msgSend(v8, "frame");
  if (v20 == v17 && v19 == v18)
  {
LABEL_14:
    v22 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v8, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v17, v18);
  objc_msgSend(v8, "setNeedsLayout");
  v22 = 1;
LABEL_15:

  return v22;
}

- (void)_receiveUpdatedAssetForPosterPreview:(id)a3 definition:(id)a4 displayContext:(id)a5 image:(id)a6 fetchError:(id)a7
{
  id v12;
  NSObject *v13;
  PBFDisplayContext *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  char v36;
  NSObject *WeakRetained;
  NSObject *v38;
  PBFDisplayContext *activeDisplayContext;
  void *v40;
  void *v41;
  uint64_t v42;
  const __CFString *v43;
  uint8_t buf[4];
  PBFPosterGalleryAssetHelper *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (PBFDisplayContext *)a5;
  v15 = a6;
  v16 = a7;
  BSDispatchQueueAssertMain();
  if (!self->_isInvalidated)
  {
    -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", v12);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      PBFLogAssetHelper();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v45 = self;
        _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_INFO, "(%p) bail _receiveUpdatedAssetForPosterPreview; no state",
          buf,
          0xCu);
      }
      goto LABEL_48;
    }
    +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:](PBFPosterSnapshotDefinition, "defaultPreviewDefinitionForPreview:", v12);
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject snapshotCollection](v17, "snapshotCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "snapshotRequestStatusForDefinition:displayContext:outInvalidationContext:", v13, v14, 0) != 1)
    {
      PBFLogAssetHelper();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v45 = self;
        _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_INFO, "(%p) bail _receiveUpdatedAssetForPosterPreview; request was cancelled",
          buf,
          0xCu);
      }

      goto LABEL_47;
    }
    objc_msgSend(v19, "completeRequestForDefinition:displayContext:receivedSnapshot:receivedError:", v13, v14, v15, v16);
    v41 = v19;
    if (!v15 || v16)
    {
      v27 = objc_msgSend(v16, "pbf_isGeneralCancelledError");
      PBFLogAssetHelper();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v27)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v45 = self;
          v46 = 2114;
          v47 = v12;
          v48 = 2114;
          v49 = v16;
          _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_DEFAULT, "(%p) _receiveUpdatedAssetForPosterPreview; request was cancelled for preview %{public}@: %{public}@",
            buf,
            0x20u);
        }

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFPosterGalleryAssetHelper _stateWasUpdatedForPosterPreviews:](self, "_stateWasUpdatedForPosterPreviews:", v30);

      }
      else
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          v45 = self;
          v46 = 2114;
          v47 = v12;
          v48 = 2114;
          v49 = v16;
          _os_log_error_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_ERROR, "(%p) _receiveUpdatedAssetForPosterPreview; request failed for preview %{public}@ with error: %{public}@",
            buf,
            0x20u);
        }

        if (!v16)
        {
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v42 = *MEMORY[0x1E0CB2D68];
          v43 = CFSTR("Received no error and image as a result of a poster preview request.  Bug in implementation.");
          v21 = 1;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "pbf_generalErrorWithCode:userInfo:", 10, v40);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "failPreviewImageForDefinition:displayContext:error:", v13, v14, v32);

          goto LABEL_34;
        }
        objc_msgSend(v41, "failPreviewImageForDefinition:displayContext:error:", v13, v14, v16);
      }
    }
    else
    {
      activeDisplayContext = self->_activeDisplayContext;
      PBFLogAssetHelper();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        v45 = self;
        v46 = 2114;
        v47 = v12;
        v48 = 2114;
        v49 = v15;
        _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_INFO, "(%p) _receiveUpdatedAssetForPosterPreview; preview %{public}@ received image %{public}@",
          buf,
          0x20u);
      }

      v21 = 1;
      if (activeDisplayContext != v14 || v18 != v13)
        goto LABEL_34;
      PBFLogAssetHelper();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v45 = self;
        v46 = 2114;
        v47 = v12;
        _os_log_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_INFO, "(%p) _receiveUpdatedAssetForPosterPreview; preview %{public}@ received active display context image; updating image views",
          buf,
          0x16u);
      }

      -[NSObject previewImageView](v17, "previewImageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v33 = -[PBFPosterGalleryAssetHelper _newImageViewWithImage:posterPreview:](self, "_newImageViewWithImage:posterPreview:", v15, v12);
        -[NSObject setPreviewImageView:](v17, "setPreviewImageView:", v33);

LABEL_33:
        -[NSObject previewImageView](v17, "previewImageView", activeDisplayContext);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFPosterGalleryAssetHelper _sizeContainerView:forPreview:displayContext:](self, "_sizeContainerView:forPreview:displayContext:", v34, v12, v14);

        v21 = 0;
        goto LABEL_34;
      }
      -[NSObject previewImageView](v17, "previewImageView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterGalleryAssetHelper _contentSizeForPreview:](self, "_contentSizeForPreview:", v12);
      v25 = objc_msgSend(v24, "updateImage:imageSize:", v15);

      if (v25)
        goto LABEL_33;
    }
    v21 = 1;
LABEL_34:
    PBFLogAssetHelper();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[PBFPosterGalleryAssetHelper _receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:].cold.3();

    if (-[NSObject isVisible](v17, "isVisible")
      && (self->_activeDisplayContext != v14 ? (v36 = 1) : (v36 = v21), (v36 & 1) == 0))
    {
      PBFLogAssetHelper();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        -[PBFPosterGalleryAssetHelper _receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:].cold.2();

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject assetHelper:didUpdateAssetsForPosterPreview:](WeakRetained, "assetHelper:didUpdateAssetsForPosterPreview:", self, v12);
    }
    else
    {
      PBFLogAssetHelper();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
        -[PBFPosterGalleryAssetHelper _receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:].cold.1();
    }
    v19 = v41;

    -[PBFPosterGalleryAssetHelper _stateWasUpdated:](self, "_stateWasUpdated:", 0);
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }
  PBFLogAssetHelper();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v45 = self;
    _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "(%p) bail _receiveUpdatedAssetForPosterPreview; invalidated",
      buf,
      0xCu);
  }
LABEL_49:

}

- (void)_teardownStateForPosterPreviews:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  PBFPosterGalleryAssetHelper *v19;
  __int16 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v13 = v4;
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[PBFPosterGalleryAssetHelper _teardownState:](self, "_teardownState:", v11);
          -[NSMapTable removeObjectForKey:](self->_previewToState, "removeObjectForKey:", v10);
        }
        else
        {
          PBFLogAssetHelper();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            v19 = self;
            v20 = 2114;
            v21 = v10;
            _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_INFO, "(%p) bail _teardownStateForPosterPreviews; bail teardown for %{public}@; no state",
              buf,
              0x16u);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v7);
  }

}

- (void)_teardownState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  PBFPosterGalleryAssetHelper *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  PBFLogAssetHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "preview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134218242;
    v18 = self;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_INFO, "(%p) bail _teardownState; %{public}@", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(v4, "livePreviewViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PBFLogAssetHelper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "preview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134218242;
      v18 = self;
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_INFO, "(%p) _teardownState; %{public}@; tearing down live view controller",
        (uint8_t *)&v17,
        0x16u);

    }
    objc_msgSend(v4, "livePreviewViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterGalleryAssetHelper _teardownLiveViewController:invalidate:](self, "_teardownLiveViewController:invalidate:", v10, 1);

  }
  objc_msgSend(v4, "previewImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    PBFLogAssetHelper();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "preview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134218242;
      v18 = self;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_INFO, "(%p) _teardownState; %{public}@; tearing down previewImageView",
        (uint8_t *)&v17,
        0x16u);

    }
    objc_msgSend(v4, "previewImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateImage:imageSize:", 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

    objc_msgSend(v4, "previewImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeFromSuperview");

  }
  objc_msgSend(v4, "setPreviewImageView:", 0);
  objc_msgSend(v4, "snapshotCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cancel");

}

- (void)_resetHydrationState
{
  NSObject *v3;
  unint64_t v4;
  const __CFString *v5;
  int v6;
  PBFPosterGalleryAssetHelper *v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  PBFLogAssetHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = self->_assetHydrationState - 1;
    v5 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
    if (v4 <= 2)
      v5 = off_1E86F4978[v4];
    v6 = 134218498;
    v7 = self;
    v8 = 2114;
    v9 = v5;
    v10 = 2114;
    v11 = CFSTR("PBFPosterGalleryAssetHydrationStateDefault");
    _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "(%p) _resetHydrationState; going from %{public}@ -> %{public}@",
      (uint8_t *)&v6,
      0x20u);
  }

  self->_assetHydrationState = 0;
}

- (void)_setupLiveDisplayStyleForPreview:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  uint8_t buf[4];
  PBFPosterGalleryAssetHelper *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v31 = self;
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "(%p) bail _setupLiveDisplayStyleForPreview; invalidated",
        buf,
        0xCu);
    }
    goto LABEL_19;
  }
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", PBFPreviewTypeHero);

  if (!v7)
  {
    -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v8)
    {
      if ((-[NSObject willUseLivePreview](v8, "willUseLivePreview") & 1) != 0)
      {
        -[NSObject livePreviewViewController](v5, "livePreviewViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          PBFLogAssetHelper();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v31 = self;
            v11 = "(%p) bail _setupLiveDisplayStyleForPreview; livePreviewViewController already setup";
LABEL_16:
            v12 = v10;
            v13 = 12;
            goto LABEL_17;
          }
        }
        else
        {
          if (-[NSObject livePreviewState](v5, "livePreviewState") == -1)
          {
            v14 = v4;
            objc_msgSend(v14, "posterDescriptorLookupInfo");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "posterDescriptorExtension");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "posterExtensionBundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - LIVE POSTER PREVIEW FOR %@"), v17, v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "posterDescriptorLookupInfo");
            v10 = objc_claimAutoreleasedReturnValue();
            -[NSObject posterDescriptorExtension](v10, "posterDescriptorExtension");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "posterExtensionBundleIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSObject setLivePreviewState:](v5, "setLivePreviewState:", 0);
            PBFLogAssetHelper();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218242;
              v31 = self;
              v32 = 2114;
              v33 = v14;
              _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_INFO, "(%p) bail _setupLiveDisplayStyleForPreview: %{public}@; moving state to PBFPosterGalleryLivePreviewStateStartingUp",
                buf,
                0x16u);
            }

            objc_msgSend(CFSTR("Start Poster Process for PBFPosterGalleryPreviewViewController/"), "stringByAppendingFormat:", CFSTR("%@"), v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = __64__PBFPosterGalleryAssetHelper__setupLiveDisplayStyleForPreview___block_invoke;
            v25[3] = &unk_1E86F4638;
            v25[4] = self;
            v26 = v20;
            v27 = v18;
            v28 = v14;
            v29 = v5;
            v23 = v18;
            v24 = v20;
            PBFDispatchAsyncWithString(v22, QOS_CLASS_USER_INITIATED, v25);

            goto LABEL_18;
          }
          PBFLogAssetHelper();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v31 = self;
            v11 = "(%p) bail _setupLiveDisplayStyleForPreview; livePreviewViewController already setup and state is not n"
                  "ull... so letting it do its thing";
            goto LABEL_16;
          }
        }
      }
      else
      {
        PBFLogAssetHelper();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v31 = self;
          v11 = "(%p) bail _setupLiveDisplayStyleForPreview; state doesn't want live previews used";
          goto LABEL_16;
        }
      }
    }
    else
    {
      PBFLogAssetHelper();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v31 = self;
        v32 = 2114;
        v33 = v4;
        v11 = "(%p) bail _setupLiveDisplayStyleForPreview; state doesn't exist for preview %{public}@";
        v12 = v10;
        v13 = 22;
LABEL_17:
        _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  PBFLogAssetHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PBFPosterGalleryAssetHelper _setupLiveDisplayStyleForPreview:].cold.1();
LABEL_19:

}

void __64__PBFPosterGalleryAssetHelper__setupLiveDisplayStyleForPreview___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v31 = 0;
  objc_msgSend(WeakRetained, "acquireExtensionInstance:reason:error:", v3, v4, &v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v31;

  if (v6)
  {
    PBFLogAssetHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 48);
      v19 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134218754;
      v33 = v18;
      v34 = 2114;
      v35 = v19;
      v36 = 2114;
      v37 = v20;
      v38 = 2114;
      v39 = v6;
      _os_log_error_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_ERROR, "(%p) bail _setupLiveDisplayStyleForPreview: %{public}@; no extension instance was vended for livePosterKey %{pub"
        "lic}@: %{public}@",
        buf,
        0x2Au);
    }
    v8 = 0;
  }
  else if (v5)
  {
    v30 = 0;
    objc_msgSend(v5, "pr_assetUpdaterWithError:", &v30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v30;
    PBFLogAssetHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134218498;
      v33 = v12;
      v34 = 2114;
      v35 = v13;
      v36 = 2114;
      v37 = v14;
      _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_INFO, "(%p) bail _setupLiveDisplayStyleForPreview: %{public}@; received extension instance was vended for livePosterKey %{public}@",
        buf,
        0x20u);
    }
  }
  else
  {
    PBFLogAssetHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134218498;
      v33 = v15;
      v34 = 2114;
      v35 = v16;
      v36 = 2114;
      v37 = v17;
      _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_INFO, "(%p) bail _setupLiveDisplayStyleForPreview: %{public}@; no extension instance was vended for livePosterKey %{public}@",
        buf,
        0x20u);
    }
    v8 = 0;
    v6 = 0;
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__PBFPosterGalleryAssetHelper__setupLiveDisplayStyleForPreview___block_invoke_44;
  v21[3] = &unk_1E86F48D0;
  v22 = v6;
  v23 = v8;
  v24 = *(_QWORD *)(a1 + 32);
  v25 = v5;
  v26 = *(id *)(a1 + 56);
  v27 = *(id *)(a1 + 40);
  v28 = *(id *)(a1 + 48);
  v29 = *(id *)(a1 + 64);
  v9 = v5;
  v10 = v8;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v21);

}

void __64__PBFPosterGalleryAssetHelper__setupLiveDisplayStyleForPreview___block_invoke_44(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    PBFLogAssetHelper();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __64__PBFPosterGalleryAssetHelper__setupLiveDisplayStyleForPreview___block_invoke_44_cold_1((_QWORD *)a1, v2, v3);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 64));
    objc_msgSend(WeakRetained, "relinquishExtensionInstance:reason:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

    objc_msgSend(*(id *)(a1 + 88), "setLivePreviewState:", 2);
    PBFLogAssetHelper();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 64);
      v8 = 134218242;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_INFO, "(%p) bail _setupLiveDisplayStyleForPreview: %{public}@; moving state to PBFPosterGalleryLivePreviewStateInvalidated",
        (uint8_t *)&v8,
        0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_setupLiveViewControllerForInstance:preview:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
}

- (void)invalidate
{
  _BOOL4 isInvalidated;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  PBFPosterGalleryAssetHelper *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  isInvalidated = self->_isInvalidated;
  PBFLogAssetHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isInvalidated)
  {
    if (v5)
    {
      v6 = 134217984;
      v7 = self;
      _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "(%p) bail invalidate; invalidated", (uint8_t *)&v6, 0xCu);
    }

  }
  else
  {
    if (v5)
    {
      v6 = 134217984;
      v7 = self;
      _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "(%p) invalidate: invalidating...", (uint8_t *)&v6, 0xCu);
    }

    -[PBFPosterGalleryAssetHelper cancel](self, "cancel");
    self->_isInvalidated = 1;
  }
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  PBFPosterGalleryAssetHelper *v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  PBFLogAssetHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = self;
    _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "(%p) cancelling...", buf, 0xCu);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable keyEnumerator](self->_previewToState, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
    *(_QWORD *)&v6 = 134218242;
    v12 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PBFLogAssetHelper();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v12;
          v18 = self;
          v19 = 2114;
          v20 = v10;
          _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_DEFAULT, "(%p) cancelling... tearing down %{public}@", buf, 0x16u);
        }

        -[PBFPosterGalleryAssetHelper _teardownState:](self, "_teardownState:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v7);
  }

  -[NSMapTable removeAllObjects](self->_previewToState, "removeAllObjects");
}

- (void)galleryPosterViewController:(id)a3 stateChangedTo:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *WeakRetained;
  NSObject *v13;
  int v14;
  PBFPosterGalleryAssetHelper *v15;
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_isInvalidated)
  {
    if (!v6)
    {
      PBFLogAssetHelper();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v14 = 134217984;
      v15 = self;
      v8 = "(%p) bail galleryPosterViewController:stateChangedTo: no galleryPosterVC?";
      goto LABEL_4;
    }
    objc_msgSend(v6, "preview");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      if (a4 == 2)
      {
        PBFLogAssetHelper();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 134218242;
          v15 = self;
          v16 = 2114;
          v17 = v7;
          _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "(%p) galleryPosterViewController:stateChangedTo: state is invalidated for %{public}@", (uint8_t *)&v14, 0x16u);
        }

        -[PBFPosterGalleryAssetHelper _teardownLiveViewController:invalidate:](self, "_teardownLiveViewController:invalidate:", v6, 1);
        goto LABEL_23;
      }
      if (a4 != 1)
        goto LABEL_23;
      PBFLogAssetHelper();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134218498;
        v15 = self;
        v16 = 2114;
        v17 = v7;
        v18 = 2114;
        v19 = CFSTR("PBFGalleryPosterViewControllerStateActive");
        _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "(%p) galleryPosterViewController:stateChangedTo: updating state for %{public}@ to %{public}@", (uint8_t *)&v14, 0x20u);
      }

      objc_msgSend(v9, "setLivePreviewState:", 1);
      if (!objc_msgSend(v9, "isVisible"))
      {
LABEL_23:

        goto LABEL_24;
      }
      PBFLogAssetHelper();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134218242;
        v15 = self;
        v16 = 2114;
        v17 = v7;
        _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_DEFAULT, "(%p) galleryPosterViewController:stateChangedTo: state is visible for %{public}@; notifying delegate for updated assets",
          (uint8_t *)&v14,
          0x16u);
      }

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject assetHelper:didUpdateAssetsForPosterPreview:](WeakRetained, "assetHelper:didUpdateAssetsForPosterPreview:", self, v7);
    }
    else
    {
      PBFLogAssetHelper();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
      {
        v14 = 134218242;
        v15 = self;
        v16 = 2114;
        v17 = v7;
        _os_log_impl(&dword_1CB9FA000, WeakRetained, OS_LOG_TYPE_INFO, "(%p) galleryPosterViewController:stateChangedTo: state is not ready for %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }

    goto LABEL_23;
  }
  PBFLogAssetHelper();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = self;
    v8 = "(%p) bail galleryPosterViewController:stateChangedTo: invalidated";
LABEL_4:
    _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0xCu);
  }
LABEL_24:

}

- (void)_setupLiveViewControllerForInstance:(id)a3 preview:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PBFGalleryPosterViewController *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id WeakRetained;
  NSObject *v23;
  id v24;
  void *v25;
  uint8_t buf[4];
  PBFPosterGalleryAssetHelper *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    PBFLogAssetHelper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = self;
      _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, "(%p) bail _setupLiveViewControllerForInstance; invalidated",
        buf,
        0xCu);
    }
  }
  else
  {
    -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = [PBFGalleryPosterViewController alloc];
      +[PBFPosterSnapshotDefinition gallerySnapshotDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotDefinition");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PBFGalleryPosterViewController initWithExtensionInstance:preview:definition:](v9, "initWithExtensionInstance:preview:definition:", v6, v7, v10);

      -[NSObject setDelegate:](v11, "setDelegate:", self);
      -[NSObject setDisplayContext:](v11, "setDisplayContext:", self->_activeDisplayContext);
      -[NSObject view](v11, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterGalleryAssetHelper _sizeContainerView:forPreview:displayContext:](self, "_sizeContainerView:forPreview:displayContext:", v12, v7, self->_activeDisplayContext);

      objc_msgSend(v7, "posterDescriptorLookupInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "posterDescriptorExtension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "posterExtensionBundleIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "posterDescriptorPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "descriptorIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)v15;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@:livePoster"), v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject view](v11, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAccessibilityIdentifier:", v18);

      if (-[NSObject state](v11, "state") == 2)
      {
        PBFLogAssetHelper();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v27 = self;
          v28 = 2114;
          v29 = v7;
          _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "(%p) bail _setupLiveViewControllerForInstance; invalidated state for %{public}@",
            buf,
            0x16u);
        }

        -[PBFPosterGalleryAssetHelper _teardownLiveViewController:invalidate:](self, "_teardownLiveViewController:invalidate:", v11, 1);
      }
      else
      {
        -[NSObject setLivePreviewViewController:](v8, "setLivePreviewViewController:", v11);
        PBFLogAssetHelper();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v27 = self;
          v28 = 2114;
          v29 = v7;
          _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "(%p) _setupLiveViewControllerForInstance; live preview for %{public}@ is setup; notifying delegate",
            buf,
            0x16u);
        }

        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "assetHelper:prepareForPosterPreview:movingToLive:", self, v7, v11);

        if (-[NSObject state](v11, "state") == 1)
        {
          PBFLogAssetHelper();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v27 = self;
            v28 = 2114;
            v29 = v7;
            _os_log_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_DEFAULT, "(%p) _setupLiveViewControllerForInstance; live preview for %{public}@ is setup; state has moved to PBFGall"
              "eryPosterViewControllerStateActive; notifying delegate for updated assets",
              buf,
              0x16u);
          }

          -[NSObject setLivePreviewState:](v8, "setLivePreviewState:", 1);
          v24 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v24, "assetHelper:didUpdateAssetsForPosterPreview:", self, v7);

        }
      }

    }
    else
    {
      PBFLogAssetHelper();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v27 = self;
        v28 = 2114;
        v29 = v7;
        _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_DEFAULT, "(%p) bail _setupLiveViewControllerForInstance; no state for %{public}@",
          buf,
          0x16u);
      }
    }

  }
}

- (void)_teardownLiveViewController:(id)a3 invalidate:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  PBFPosterGalleryAssetHelper *v25;
  __int16 v26;
  NSObject *v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BSDispatchQueueAssertMain();
  PBFLogAssetHelper();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134218498;
      v25 = self;
      v26 = 2114;
      v27 = v6;
      v28 = 1024;
      v29 = v4;
      _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "(%p) _teardownLiveViewController; gallery poster vc %{public}@ shouldInvalidate? %{BOOL}u",
        buf,
        0x1Cu);
    }

    -[NSObject preview](v6, "preview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    -[NSObject posterDescriptorLookupInfo](v7, "posterDescriptorLookupInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "posterDescriptorExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "posterExtensionBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - LIVE POSTER PREVIEW FOR %@"), v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject view](v6, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeFromSuperview");

    -[NSObject removeFromParentViewController](v6, "removeFromParentViewController");
    -[NSObject invalidate](v6, "invalidate");
    objc_msgSend(v10, "setLivePreviewViewController:", 0);
    -[NSObject posterDescriptorLookupInfo](v7, "posterDescriptorLookupInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "posterDescriptorExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "posterExtensionBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_extensionInstanceProvider);
    objc_msgSend(WeakRetained, "relinquishExtensionInstance:reason:", v18, v14);

    if (v4)
    {
      objc_msgSend(v10, "setLivePreviewState:", 2);
      PBFLogAssetHelper();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v25 = self;
        v26 = 2114;
        v27 = v7;
        v21 = "(%p) _setupLiveViewControllerForInstance; state for %{public}@ moving to PBFPosterGalleryLivePreviewStateInvalidated";
LABEL_11:
        _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v10, "setLivePreviewState:", -1);
      PBFLogAssetHelper();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v25 = self;
        v26 = 2114;
        v27 = v7;
        v21 = "(%p) _setupLiveViewControllerForInstance; state for %{public}@ moving to PBFPosterGalleryLivePreviewStateNull";
        goto LABEL_11;
      }
    }

    PBFLogAssetHelper();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v25 = self;
      v26 = 2114;
      v27 = v6;
      v28 = 1024;
      v29 = v4;
      _os_log_debug_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_DEBUG, "(%p) _teardownLiveViewController; notifying delegate of teardown gallery poster vc %{public}@ shouldInvalidate? %{BOOL}u",
        buf,
        0x1Cu);
    }

    v23 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v23, "assetHelper:posterPreview:teardownLiveViewController:", self, v7, v6);

    goto LABEL_15;
  }
  if (v8)
  {
    *(_DWORD *)buf = 134217984;
    v25 = self;
    _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "(%p) bail _teardownLiveViewController; no gallery poster vc?",
      buf,
      0xCu);
  }
LABEL_15:

}

- (PBFPosterPreviewGenerator)previewGenerator
{
  return (PBFPosterPreviewGenerator *)objc_loadWeakRetained((id *)&self->_previewGenerator);
}

- (PBFExtensionInstanceProviding)extensionInstanceProvider
{
  return (PBFExtensionInstanceProviding *)objc_loadWeakRetained((id *)&self->_extensionInstanceProvider);
}

- (PBFPosterGalleryAssetHelperDelegate)delegate
{
  return (PBFPosterGalleryAssetHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (PBFDisplayContext)activeDisplayContext
{
  return self->_activeDisplayContext;
}

- (NSSet)posterPreviews
{
  return self->_posterPreviews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterPreviews, 0);
  objc_storeStrong((id *)&self->_activeDisplayContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_extensionInstanceProvider);
  objc_destroyWeak((id *)&self->_previewGenerator);
  objc_storeStrong((id *)&self->_activeDisplayContextSpec, 0);
  objc_storeStrong((id *)&self->_previewToState, 0);
  objc_storeStrong((id *)&self->_knownDisplayContexts, 0);
}

- (void)initWithPreviewGenerator:(const char *)a1 extensionInstanceProvider:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPreviewGenerator:(const char *)a1 extensionInstanceProvider:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)updatePosterPreview:isVisible:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_1(&dword_1CB9FA000, v0, v1, "(%p) bail updatePosterPreview; posterPreview %{public}@ is already marked as visible");
  OUTLINED_FUNCTION_7();
}

- (void)_stateWasUpdated:.cold.1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12_1();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

- (void)_stateWasUpdated:.cold.2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12_1();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
  OUTLINED_FUNCTION_7();
}

- (void)_stateWasUpdated:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5_2(&dword_1CB9FA000, v0, v1, "(%p) bail _stateWasUpdated; invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_updateHydrationStateIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5_2(&dword_1CB9FA000, v0, v1, "(%p) bail _updateHydrationStateIfNeeded; invalidated",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

void __80__PBFPosterGalleryAssetHelper__kickoffPreviewGeneratorForPosterPreview_context___block_invoke_2_cold_1(_QWORD *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = *a2;
  v8 = 134219010;
  v9 = v3;
  v10 = 2114;
  v11 = v4;
  v12 = 2114;
  v13 = v5;
  v14 = 2114;
  v15 = v6;
  v16 = 2114;
  v17 = v7;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "(%p) _kickoffPreviewGeneratorForPosterPreview; request failed for %{public}@ && context %{public}@; image: %{public}"
    "@ error: %{public}@",
    (uint8_t *)&v8,
    0x34u);
}

- (void)_receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_1(&dword_1CB9FA000, v0, v1, "(%p) _receiveUpdatedAssetForPosterPreview; preview %{public}@ will *NOT* notify of content update");
  OUTLINED_FUNCTION_7();
}

- (void)_receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_1(&dword_1CB9FA000, v0, v1, "(%p) _receiveUpdatedAssetForPosterPreview; preview %{public}@ notify of content update");
  OUTLINED_FUNCTION_7();
}

- (void)_receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_1(&dword_1CB9FA000, v0, v1, "(%p) _receiveUpdatedAssetForPosterPreview; finished processing received updated asset for poster preview preview %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_setupLiveDisplayStyleForPreview:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5_2(&dword_1CB9FA000, v0, v1, "(%p) bail _setupLiveDisplayStyleForPreview; hero previews don't go live",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

void __64__PBFPosterGalleryAssetHelper__setupLiveDisplayStyleForPreview___block_invoke_44_cold_1(_QWORD *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1[8];
  v4 = *a2;
  v6 = a1[5];
  v5 = a1[6];
  v7 = 134218754;
  v8 = v5;
  v9 = 2114;
  v10 = v3;
  v11 = 2114;
  v12 = v4;
  v13 = 2114;
  v14 = v6;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "(%p) bail _setupLiveDisplayStyleForPreview: %{public}@; error? %{public}@ updatingService? %{public}@",
    (uint8_t *)&v7,
    0x2Au);
}

@end

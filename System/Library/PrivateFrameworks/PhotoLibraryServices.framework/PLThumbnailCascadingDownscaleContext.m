@implementation PLThumbnailCascadingDownscaleContext

- (PLThumbnailCascadingDownscaleContext)init
{
  PLThumbnailCascadingDownscaleContext *v2;
  NSLock *v3;
  NSLock *lock;
  PLThumbnailContextCleanupTimer *v5;
  uint64_t v6;
  PLThumbnailContextCleanupTimer *idleCleanupTimer;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PLThumbnailCascadingDownscaleContext;
  v2 = -[PLThumbnailCascadingDownscaleContext init](&v15, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v2->_lock;
    v2->_lock = v3;

    objc_initWeak(&location, v2);
    v5 = [PLThumbnailContextCleanupTimer alloc];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __44__PLThumbnailCascadingDownscaleContext_init__block_invoke;
    v12 = &unk_1E3677D48;
    objc_copyWeak(&v13, &location);
    v6 = -[PLThumbnailContextCleanupTimer initWithHandler:](v5, "initWithHandler:", &v9);
    idleCleanupTimer = v2->_idleCleanupTimer;
    v2->_idleCleanupTimer = (PLThumbnailContextCleanupTimer *)v6;

    -[PLThumbnailContextCleanupTimer activate](v2->_idleCleanupTimer, "activate", v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  NSLock *lock;
  objc_super v4;

  -[PLThumbnailContextCleanupTimer invalidate](self->_idleCleanupTimer, "invalidate");
  if (self->_portraitContext)
    CMPhotoCascadingDownscaleDestroy();
  if (self->_landscapeContext)
    CMPhotoCascadingDownscaleDestroy();
  lock = self->_lock;
  self->_lock = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLThumbnailCascadingDownscaleContext;
  -[PLThumbnailCascadingDownscaleContext dealloc](&v4, sel_dealloc);
}

- (void)discardContexts
{
  NSObject *v3;
  uint8_t v4[16];

  PLBackendGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Downscale context: Destroying CMPhotoCascadeContexts", v4, 2u);
  }

  -[NSLock lock](self->_lock, "lock");
  if (self->_portraitContext)
  {
    CMPhotoCascadingDownscaleDestroy();
    self->_portraitContext = 0;
  }
  if (self->_landscapeContext)
  {
    CMPhotoCascadingDownscaleDestroy();
    self->_landscapeContext = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (BOOL)downscaleImageSurface:(__IOSurface *)a3 destinationCount:(int)a4 sizes:(id *)a5 cropModes:(int *)a6 pixelFormat:(unsigned int)a7 bytesPerRowAlignment:(int)a8 destinationData:(id)a9
{
  uint64_t v13;
  id v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  char *v20;
  size_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  char *v29;
  int v30;
  BOOL v31;
  _QWORD v33[2];
  unsigned int v34;
  $2825F4736939C4A6D3AD43837233062D *v35;
  uint64_t v36;
  int v37;
  int *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  int v46;
  uint64_t v47;

  v13 = *(_QWORD *)&a4;
  v47 = *MEMORY[0x1E0C80C00];
  v16 = a9;
  if (a3)
  {
    v37 = a8;
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v46 = v13;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "Downscale context: downscaleImageSurface with destinationCount: %d", buf, 8u);
    }

    -[PLThumbnailContextCleanupTimer startOrRestartTimer](self->_idleCleanupTimer, "startOrRestartTimer");
    IOSurfaceGetWidth(a3);
    IOSurfaceGetHeight(a3);
    v33[1] = (unint64_t)PLSizeMake() >> 32;
    -[NSLock lock](self->_lock, "lock");
    if (!self->_portraitContext)
    {
      PLBackendGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "Downscale context: Creating CMPhotoCascadeContexts", buf, 2u);
      }

      IOSurfaceGetPixelFormat(a3);
      self->_portraitContext = (_CMPhotoCascadeContext *)CMPhotoCascadingDownscaleCreate();
      IOSurfaceGetPixelFormat(a3);
      self->_landscapeContext = (_CMPhotoCascadeContext *)CMPhotoCascadingDownscaleCreate();
    }
    v34 = a7;
    v35 = a5;
    v38 = a6;
    -[NSLock unlock](self->_lock, "unlock");
    v33[0] = v33;
    v36 = v13;
    v19 = 8 * v13;
    v20 = (char *)v33 - ((v19 + 15) & 0xFFFFFFFF0);
    if (v19 >= 0x200)
      v21 = 512;
    else
      v21 = 8 * v13;
    bzero((char *)v33 - ((v19 + 15) & 0xFFFFFFFF0), v21);
    v43 = 0u;
    v42 = 0u;
    v41 = 0u;
    v40 = 0u;
    v39 = v16;
    v22 = v16;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16, v33[0]);
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v26 = *(_QWORD *)v41;
      do
      {
        v27 = 0;
        v28 = v25;
        v29 = &v20[8 * v25];
        do
        {
          if (*(_QWORD *)v41 != v26)
            objc_enumerationMutation(v22);
          *(_QWORD *)&v29[8 * v27] = objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v27)), "mutableBytes");
          ++v27;
        }
        while (v24 != v27);
        v25 = v28 + v27;
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v24);
    }

    -[NSLock lock](self->_lock, "lock");
    v30 = CMPhotoCascadingDownscale();
    -[NSLock unlock](self->_lock, "unlock");
    v31 = v30 == 0;
    v16 = v39;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleCleanupTimer, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __44__PLThumbnailCascadingDownscaleContext_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cleanupTimerFired");

}

@end

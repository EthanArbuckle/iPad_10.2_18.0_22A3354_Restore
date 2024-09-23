@implementation PUWallpaperExportProgress

- (PUWallpaperExportProgress)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperShuffleResourceManager.m"), 940, CFSTR("%s is not available as initializer"), "-[PUWallpaperExportProgress init]");

  abort();
}

- (PUWallpaperExportProgress)initWithAssetUUIDs:(id)a3 progressHandler:(id)a4
{
  id v6;
  id v7;
  PUWallpaperExportProgress *v8;
  PUWallpaperExportProgress *v9;
  uint64_t v10;
  NSArray *assetUUIDs;
  uint64_t v12;
  id progressHandler;
  unint64_t v14;
  uint64_t v15;
  NSMutableDictionary *downloadProgress;
  uint64_t v17;
  NSMutableDictionary *processingProgress;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PUWallpaperExportProgress;
  v8 = -[PUWallpaperExportProgress init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend(v6, "copy");
    assetUUIDs = v9->_assetUUIDs;
    v9->_assetUUIDs = (NSArray *)v10;

    v12 = objc_msgSend(v7, "copy");
    progressHandler = v9->_progressHandler;
    v9->_progressHandler = (id)v12;

    v14 = -[NSArray count](v9->_assetUUIDs, "count");
    v9->_totalWork = (double)v14 + (double)v14;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v14);
    downloadProgress = v9->_downloadProgress;
    v9->_downloadProgress = (NSMutableDictionary *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v14);
    processingProgress = v9->_processingProgress;
    v9->_processingProgress = (NSMutableDictionary *)v17;

  }
  return v9;
}

- (void)reportDownloadProgress:(double)a3 forAssetUUID:(id)a4
{
  -[PUWallpaperExportProgress _updateProgressValue:forAssetUUID:inDictionary:](self, "_updateProgressValue:forAssetUUID:inDictionary:", a4, self->_downloadProgress, a3);
}

- (void)reportProcessingProgress:(double)a3 forAssetUUID:(id)a4
{
  -[PUWallpaperExportProgress _updateProgressValue:forAssetUUID:inDictionary:](self, "_updateProgressValue:forAssetUUID:inDictionary:", a4, self->_processingProgress, a3);
}

- (void)begin
{
  void (**progressHandler)(double);

  progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](0.0);
}

- (void)finish
{
  void (**progressHandler)(double);

  progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](1.0);
}

- (void)_updateProgressValue:(double)a3 forAssetUUID:(id)a4 inDictionary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void (**progressHandler)(double);
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, v8);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = self->_assetUUIDs;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMutableDictionary valueForKey:](self->_downloadProgress, "valueForKey:", v17, (_QWORD)v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v20 = v15 + v19;

        -[NSMutableDictionary valueForKey:](self->_processingProgress, "valueForKey:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v15 = v20 + v22;

      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 0.0;
  }

  os_unfair_lock_unlock(&self->_lock);
  progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](v15 / self->_totalWork);

}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (double)totalWork
{
  return self->_totalWork;
}

- (NSMutableDictionary)downloadProgress
{
  return self->_downloadProgress;
}

- (NSMutableDictionary)processingProgress
{
  return self->_processingProgress;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_processingProgress, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

@end

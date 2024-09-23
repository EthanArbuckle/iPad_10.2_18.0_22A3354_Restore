@implementation VUILaunchConfig

- (BOOL)useConfigCacheIgnoreExpiry
{
  return self->_useConfigCacheIgnoreExpiry;
}

- (double)extendedCacheExpireDuration
{
  return self->_extendedCacheExpireDuration;
}

- (VUILaunchConfig)init
{
  VUILaunchConfig *v2;
  VUILaunchConfig *v3;
  char v4;
  NSString *prewarmImageUrl;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 collectionUseIdForReuseIdEnabled;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  _BOOL4 gridViewUseItemIdAsReuseId;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  _BOOL4 memoryImageCacheEnabled;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  _BOOL4 deferRichTextViewUpdate;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  int64_t imageInMemoryCacheSizeLimitInBytes;
  objc_super v31;
  uint8_t buf[4];
  int64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)VUILaunchConfig;
  v2 = -[VUILaunchConfig init](&v31, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = 1;
    v2->_useConfigCacheIgnoreExpiry = 1;
    v2->_extendedCacheExpireDuration = 84600.0;
    v2->_layoutReuseIdleTimeToLive = 64;
    *(_WORD *)&v2->_useSharedURLSession = 257;
    v2->_prewarmImageConnection = 1;
    prewarmImageUrl = v2->_prewarmImageUrl;
    v2->_prewarmImageUrl = 0;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("collectionUseIdForReuseIdEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v4 = objc_msgSend(v7, "BOOLValue");
    v3->_collectionUseIdForReuseIdEnabled = v4;
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      collectionUseIdForReuseIdEnabled = v3->_collectionUseIdForReuseIdEnabled;
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = collectionUseIdForReuseIdEnabled;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: collectionUseIdForReuseIdEnabled: %d", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("gridViewUseItemIdAsReuseId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = objc_msgSend(v11, "BOOLValue");
    else
      v12 = 1;
    v3->_gridViewUseItemIdAsReuseId = v12;
    VUIDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      gridViewUseItemIdAsReuseId = v3->_gridViewUseItemIdAsReuseId;
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = gridViewUseItemIdAsReuseId;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: gridViewUseItemIdAsReuseId: %d", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("memoryImageCacheEnabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      v17 = objc_msgSend(v16, "BOOLValue");
    else
      v17 = 0;
    v3->_memoryImageCacheEnabled = v17;
    VUIDefaultLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      memoryImageCacheEnabled = v3->_memoryImageCacheEnabled;
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = memoryImageCacheEnabled;
      _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: memoryImageCacheEnabled: %d", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("deferRichTextViewUpdate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      v22 = objc_msgSend(v21, "BOOLValue");
    else
      v22 = 0;
    v3->_deferRichTextViewUpdate = v22;
    VUIDefaultLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      deferRichTextViewUpdate = v3->_deferRichTextViewUpdate;
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = deferRichTextViewUpdate;
      _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: deferRichTextViewUpdate: %d", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("imageInMemoryCacheSizeLimitInBytes"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      v27 = objc_msgSend(v26, "integerValue");
    else
      v27 = 0;
    v3->_imageInMemoryCacheSizeLimitInBytes = v27;
    VUIDefaultLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      imageInMemoryCacheSizeLimitInBytes = v3->_imageInMemoryCacheSizeLimitInBytes;
      *(_DWORD *)buf = 134217984;
      v33 = imageInMemoryCacheSizeLimitInBytes;
      _os_log_impl(&dword_1D96EE000, v28, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: imageInMemoryCacheSizeLimitInBytes: %ld", buf, 0xCu);
    }

  }
  return v3;
}

- (void)setUseConfigCacheIgnoreExpiry:(BOOL)a3
{
  self->_useConfigCacheIgnoreExpiry = a3;
}

- (void)setExtendedCacheExpireDuration:(double)a3
{
  self->_extendedCacheExpireDuration = a3;
}

- (int64_t)layoutReuseIdleTimeToLive
{
  return self->_layoutReuseIdleTimeToLive;
}

- (void)setLayoutReuseIdleTimeToLive:(int64_t)a3
{
  self->_layoutReuseIdleTimeToLive = a3;
}

- (BOOL)collectionUseIdForReuseIdEnabled
{
  return self->_collectionUseIdForReuseIdEnabled;
}

- (void)setCollectionUseIdForReuseIdEnabled:(BOOL)a3
{
  self->_collectionUseIdForReuseIdEnabled = a3;
}

- (BOOL)gridViewUseItemIdAsReuseId
{
  return self->_gridViewUseItemIdAsReuseId;
}

- (void)setGridViewUseItemIdAsReuseId:(BOOL)a3
{
  self->_gridViewUseItemIdAsReuseId = a3;
}

- (BOOL)memoryImageCacheEnabled
{
  return self->_memoryImageCacheEnabled;
}

- (void)setMemoryImageCacheEnabled:(BOOL)a3
{
  self->_memoryImageCacheEnabled = a3;
}

- (int64_t)imageInMemoryCacheSizeLimitInBytes
{
  return self->_imageInMemoryCacheSizeLimitInBytes;
}

- (void)setImageInMemoryCacheSizeLimitInBytes:(int64_t)a3
{
  self->_imageInMemoryCacheSizeLimitInBytes = a3;
}

- (BOOL)useSharedURLSession
{
  return self->_useSharedURLSession;
}

- (void)setUseSharedURLSession:(BOOL)a3
{
  self->_useSharedURLSession = a3;
}

- (BOOL)alwaysPrefetchAppConfiguration
{
  return self->_alwaysPrefetchAppConfiguration;
}

- (void)setAlwaysPrefetchAppConfiguration:(BOOL)a3
{
  self->_alwaysPrefetchAppConfiguration = a3;
}

- (BOOL)prewarmImageConnection
{
  return self->_prewarmImageConnection;
}

- (void)setPrewarmImageConnection:(BOOL)a3
{
  self->_prewarmImageConnection = a3;
}

- (NSString)prewarmImageUrl
{
  return self->_prewarmImageUrl;
}

- (void)setPrewarmImageUrl:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmImageUrl, a3);
}

- (BOOL)deferRichTextViewUpdate
{
  return self->_deferRichTextViewUpdate;
}

- (void)setDeferRichTextViewUpdate:(BOOL)a3
{
  self->_deferRichTextViewUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmImageUrl, 0);
}

@end

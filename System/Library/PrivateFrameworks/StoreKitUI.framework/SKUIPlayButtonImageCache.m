@implementation SKUIPlayButtonImageCache

+ (id)imageCacheForStyle:(int64_t)a3
{
  void *v4;
  SKUIPlayButtonImageCache *v5;

  if (imageCacheForStyle__onceToken != -1)
    dispatch_once(&imageCacheForStyle__onceToken, &__block_literal_global_48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)imageCacheForStyle__sharedCaches, "objectForKey:", v4);
  v5 = (SKUIPlayButtonImageCache *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SKUIPlayButtonImageCache initWithStyle:]([SKUIPlayButtonImageCache alloc], "initWithStyle:", a3);
    objc_msgSend((id)imageCacheForStyle__sharedCaches, "setObject:forKey:", v5, v4);
  }

  return v5;
}

uint64_t __47__SKUIPlayButtonImageCache_imageCacheForStyle___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)imageCacheForStyle__sharedCaches;
  imageCacheForStyle__sharedCaches = (uint64_t)v0;

  return objc_msgSend((id)imageCacheForStyle__sharedCaches, "setName:", CFSTR("com.apple.StoreKitUI.SKUIPlayButtonImageCache.imageCacheForStyle"));
}

- (SKUIPlayButtonImageCache)initWithStyle:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIPlayButtonImageCache *v13;
  SKUIPlayButtonImageCache *v14;
  uint64_t v15;
  NSBundle *bundle;
  NSString *playImageName;
  const __CFString *v18;
  NSString *pauseImageName;
  const __CFString *v20;
  NSString *v21;
  NSString *stopImageName;
  uint64_t v23;
  UIImage *playImage;
  objc_super v26;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIPlayButtonImageCache initWithStyle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)SKUIPlayButtonImageCache;
  v13 = -[SKUIPlayButtonImageCache init](&v26, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_imageLock._os_unfair_lock_opaque = 0;
    SKUIBundle();
    v15 = objc_claimAutoreleasedReturnValue();
    bundle = v14->_bundle;
    v14->_bundle = (NSBundle *)v15;

    if (a3 == 2)
    {
      playImageName = v14->_playImageName;
      v18 = CFSTR("UniversalRadioButtonPlayIcon");
    }
    else
    {
      if (a3 == 1)
      {
        v21 = v14->_playImageName;
        v14->_playImageName = (NSString *)CFSTR("UniversaliPadPlayButtonPlayIcon");

        pauseImageName = v14->_pauseImageName;
        v20 = CFSTR("UniversaliPadPlayButtonPauseIcon");
        goto LABEL_13;
      }
      if (a3)
        goto LABEL_14;
      playImageName = v14->_playImageName;
      v18 = CFSTR("UniversalEncapsulatedPlayButtonPlayIcon");
    }
    v14->_playImageName = &v18->isa;

    pauseImageName = v14->_pauseImageName;
    v20 = CFSTR("UniversalPlayButtonPauseIcon");
LABEL_13:
    v14->_pauseImageName = &v20->isa;

    stopImageName = v14->_stopImageName;
    v14->_stopImageName = (NSString *)CFSTR("UniversalPlayButtonStopIcon");

LABEL_14:
    if (!v14->_playImage)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v14->_playImageName, v14->_bundle);
      v23 = objc_claimAutoreleasedReturnValue();
      playImage = v14->_playImage;
      v14->_playImage = (UIImage *)v23;

    }
  }
  return v14;
}

- (UIImage)playImage
{
  UIImage *playImage;
  UIImage *v4;
  UIImage *v5;

  playImage = self->_playImage;
  if (!playImage)
  {
    os_unfair_lock_lock(&self->_imageLock);
    if (!self->_playImage)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", self->_playImageName, self->_bundle);
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v5 = self->_playImage;
      self->_playImage = v4;

    }
    os_unfair_lock_unlock(&self->_imageLock);
    playImage = self->_playImage;
  }
  return playImage;
}

- (UIImage)pauseImage
{
  UIImage *pauseImage;
  UIImage *v4;
  UIImage *v5;

  pauseImage = self->_pauseImage;
  if (!pauseImage)
  {
    os_unfair_lock_lock(&self->_imageLock);
    if (!self->_pauseImage)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", self->_pauseImageName, self->_bundle);
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v5 = self->_pauseImage;
      self->_pauseImage = v4;

    }
    os_unfair_lock_unlock(&self->_imageLock);
    pauseImage = self->_pauseImage;
  }
  return pauseImage;
}

- (UIImage)stopImage
{
  UIImage *stopImage;
  UIImage *v4;
  UIImage *v5;

  stopImage = self->_stopImage;
  if (!stopImage)
  {
    os_unfair_lock_lock(&self->_imageLock);
    if (!self->_stopImage)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", self->_stopImageName, self->_bundle);
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v5 = self->_stopImage;
      self->_stopImage = v4;

    }
    os_unfair_lock_unlock(&self->_imageLock);
    stopImage = self->_stopImage;
  }
  return stopImage;
}

- (void)preloadImages
{
  os_unfair_lock_s *p_imageLock;
  UIImage *v4;
  UIImage *playImage;
  UIImage *v6;
  UIImage *pauseImage;
  UIImage *v8;
  UIImage *stopImage;

  p_imageLock = &self->_imageLock;
  os_unfair_lock_lock(&self->_imageLock);
  if (!self->_playImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", self->_playImageName, self->_bundle);
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    playImage = self->_playImage;
    self->_playImage = v4;

  }
  if (!self->_pauseImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", self->_pauseImageName, self->_bundle);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    pauseImage = self->_pauseImage;
    self->_pauseImage = v6;

  }
  if (!self->_stopImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", self->_stopImageName, self->_bundle);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    stopImage = self->_stopImage;
    self->_stopImage = v8;

  }
  os_unfair_lock_unlock(p_imageLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopImage, 0);
  objc_storeStrong((id *)&self->_stopImageName, 0);
  objc_storeStrong((id *)&self->_pauseImage, 0);
  objc_storeStrong((id *)&self->_pauseImageName, 0);
  objc_storeStrong((id *)&self->_playImage, 0);
  objc_storeStrong((id *)&self->_playImageName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

- (void)initWithStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end

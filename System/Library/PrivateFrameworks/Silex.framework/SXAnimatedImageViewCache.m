@implementation SXAnimatedImageViewCache

- (SXAnimatedImageViewCache)initWithImageSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  SXAnimatedImageViewCache *v5;
  NSOperationQueue *v6;
  NSOperationQueue *queue;
  NSMutableArray *v8;
  NSMutableArray *cachedImages;
  NSMutableIndexSet *v10;
  NSMutableIndexSet *indicesToCache;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)SXAnimatedImageViewCache;
  v5 = -[SXAnimatedImageViewCache init](&v13, sel_init);
  if (v5)
  {
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    queue = v5->_queue;
    v5->_queue = v6;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_queue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v5->_queue, "setQualityOfService:", 17);
    v5->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    cachedImages = v5->_cachedImages;
    v5->_cachedImages = v8;

    v10 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    indicesToCache = v5->_indicesToCache;
    v5->_indicesToCache = v10;

    v5->_numberOfCachedImages = 0;
    v5->_cachingEnabled = 1;
    v5->_size.width = width;
    v5->_size.height = height;
  }
  return v5;
}

- (void)setAnimatedImage:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_animatedImage, v5);

  os_unfair_lock_unlock(p_lock);
  if (v5)
    -[SXAnimatedImageViewCache prepareCache](self, "prepareCache");
}

- (void)prepareImageForFrameIndex:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  uint64_t v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray objectAtIndex:](self->_cachedImages, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (v6 == v7)
  {
    os_unfair_lock_lock_with_options();
    -[NSMutableIndexSet addIndex:](self->_indicesToCache, "addIndex:", a3);
    v8 = -[NSMutableIndexSet count](self->_indicesToCache, "count");
    os_unfair_lock_unlock(p_lock);
    if (v8 == 1)
      -[SXAnimatedImageViewCache cacheNextImage](self, "cacheNextImage");
  }
}

- (unint64_t)nearestCachedFrameIndexForFrameIndex:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_animatedImage);
  v7 = objc_msgSend(WeakRetained, "numberOfFrames");

  v8 = a3 + 1;
  v9 = a3 - 1;
  v10 = 1;
  if (((a3 - 1) & 0x8000000000000000) != 0)
    goto LABEL_5;
LABEL_2:
  -[NSMutableArray objectAtIndex:](self->_cachedImages, "objectAtIndex:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v12)
    goto LABEL_11;
  v13 = v8;
  if (v8 < v7)
    goto LABEL_7;
  while (1)
  {
    ++v10;
    ++v8;
    if ((--v9 & 0x8000000000000000) == 0)
      goto LABEL_2;
LABEL_5:
    if (v8 >= v7)
      break;
    v13 = v10 + a3;
LABEL_7:
    -[NSMutableArray objectAtIndex:](self->_cachedImages, "objectAtIndex:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 != v15)
      goto LABEL_11;
  }
  a3 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:
  os_unfair_lock_unlock(p_lock);
  return a3;
}

- (id)imageForFrameIndex:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;

  self->_lastRequestedIndex = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableArray count](self->_cachedImages, "count") <= a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_cachedImages, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      v8 = v6;
LABEL_8:

      os_unfair_lock_unlock(p_lock);
      return v8;
    }
    if ((-[NSMutableIndexSet containsIndex:](self->_indicesToCache, "containsIndex:", a3) & 1) != 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    -[NSMutableIndexSet addIndex:](self->_indicesToCache, "addIndex:", a3);
    v10 = -[NSMutableIndexSet count](self->_indicesToCache, "count");

    os_unfair_lock_unlock(p_lock);
    if (v10 == 1)
      -[SXAnimatedImageViewCache cacheNextImage](self, "cacheNextImage");
  }
  v8 = 0;
  return v8;
}

- (void)prune
{
  os_unfair_lock_s *p_lock;
  unint64_t numberOfCachedImages;
  id WeakRetained;
  uint64_t v6;
  uint64_t i;
  NSMutableArray *cachedImages;
  void *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  numberOfCachedImages = self->_numberOfCachedImages;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animatedImage);
  v6 = objc_msgSend(WeakRetained, "numberOfFrames");

  os_unfair_lock_unlock(p_lock);
  if (numberOfCachedImages)
  {
    os_unfair_lock_lock_with_options();
    self->_numberOfCachedImages = 0;
    os_unfair_lock_unlock(p_lock);
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        os_unfair_lock_lock_with_options();
        cachedImages = self->_cachedImages;
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray replaceObjectAtIndex:withObject:](cachedImages, "replaceObjectAtIndex:withObject:", i, v9);

        os_unfair_lock_unlock(p_lock);
      }
    }
  }
  -[SXAnimatedImageViewCache decreaseCacheSize](self, "decreaseCacheSize");
  -[SXAnimatedImageViewCache performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_restoreCacheSize, 0, 5.0);
}

- (void)setSuspendPreloading:(BOOL)a3
{
  -[NSOperationQueue setSuspended:](self->_queue, "setSuspended:", a3);
}

- (BOOL)preloadingSuspended
{
  return -[NSOperationQueue isSuspended](self->_queue, "isSuspended");
}

- (unint64_t)maxCacheSize
{
  os_unfair_lock_s *p_lock;
  unint64_t singleImageByteSize;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_cachingEnabled)
    singleImageByteSize = 41943040;
  else
    singleImageByteSize = self->_singleImageByteSize;
  os_unfair_lock_unlock(p_lock);
  return singleImageByteSize;
}

- (void)decreaseCacheSize
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_cachingEnabled = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)restoreCacheSize
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_cachingEnabled = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)prepareCache
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  uint64_t v5;
  NSMutableArray *cachedImages;
  void *v7;
  id v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_animatedImage);
  v5 = objc_msgSend(WeakRetained, "numberOfFrames");

  -[NSMutableArray removeAllObjects](self->_cachedImages, "removeAllObjects");
  -[NSMutableIndexSet removeAllIndexes](self->_indicesToCache, "removeAllIndexes");
  for (; v5; --v5)
  {
    cachedImages = self->_cachedImages;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](cachedImages, "addObject:", v7);

  }
  v8 = objc_loadWeakRetained((id *)&self->_animatedImage);
  self->_singleImageByteSize = objc_msgSend(v8, "uncompressedByteSizePerFrame");

  os_unfair_lock_unlock(p_lock);
}

- (void)cacheNextImage
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSOperationQueue *queue;
  _QWORD v9[4];
  id v10[2];
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[SXAnimatedImageViewCache animatedImage](self, "animatedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (v6 = (void *)objc_msgSend(v4, "imageSource")) != 0)
  {
    v7 = v6;
    CFRetain(v6);
    os_unfair_lock_unlock(p_lock);
    objc_initWeak(&location, self);
    queue = self->_queue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __42__SXAnimatedImageViewCache_cacheNextImage__block_invoke;
    v9[3] = &unk_24D686C48;
    objc_copyWeak(v10, &location);
    v10[1] = v7;
    -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v9);
    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

void __42__SXAnimatedImageViewCache_cacheNextImage__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  id *v11;
  id *v12;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v12 = (id *)WeakRetained;
  if (!WeakRetained)
  {
    CFRelease(*(CFTypeRef *)(a1 + 40));
LABEL_12:
    v11 = v12;
    goto LABEL_13;
  }
  v3 = WeakRetained + 3;
  os_unfair_lock_lock_with_options();
  v4 = objc_msgSend(v12[9], "firstIndex");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_unfair_lock_unlock(v3);
  }
  else
  {
    objc_msgSend(v12[9], "removeIndex:", v4);
    os_unfair_lock_unlock(v3);
    os_unfair_lock_lock_with_options();
    objc_msgSend(v12[8], "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v3);
    if (v5 == v6)
    {
      objc_msgSend(v12, "decodeImageFromSource:index:", *(_QWORD *)(a1 + 40), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        os_unfair_lock_lock_with_options();
        objc_msgSend(v12[8], "replaceObjectAtIndex:withObject:", v4, v7);
        v12[7] = (char *)v12[7] + 1;
        os_unfair_lock_unlock(v3);
        v8 = objc_loadWeakRetained(v12 + 2);
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) != 0)
        {
          v10 = objc_loadWeakRetained(v12 + 2);
          objc_msgSend(v10, "animatedImageViewCache:didCacheImageForFrameIndex:", v12, v4);

        }
      }

    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  objc_msgSend(v12, "checkCacheSize");
  v11 = v12;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v12, "cacheNextImage");
    goto LABEL_12;
  }
LABEL_13:

}

- (void)checkCacheSize
{
  os_unfair_lock_s *p_lock;
  unint64_t numberOfCachedImages;
  id WeakRetained;
  uint64_t v6;
  unint64_t v7;
  unint64_t lastRequestedIndex;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *cachedImages;
  void *v14;
  unint64_t v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  numberOfCachedImages = self->_numberOfCachedImages;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animatedImage);
  v6 = objc_msgSend(WeakRetained, "numberOfFrames");

  os_unfair_lock_unlock(p_lock);
  v7 = self->_singleImageByteSize * numberOfCachedImages;
  if (v7 > -[SXAnimatedImageViewCache maxCacheSize](self, "maxCacheSize"))
  {
    lastRequestedIndex = self->_lastRequestedIndex;
    v9 = 0xF00000uLL / self->_singleImageByteSize + 1;
    if (lastRequestedIndex)
      v10 = lastRequestedIndex - 1;
    else
      v10 = 0;
    while (1)
    {
      os_unfair_lock_lock_with_options();
      if (v10 < -[NSMutableArray count](self->_cachedImages, "count"))
      {
        -[NSMutableArray objectAtIndex:](self->_cachedImages, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 != v12)
        {
          cachedImages = self->_cachedImages;
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray replaceObjectAtIndex:withObject:](cachedImages, "replaceObjectAtIndex:withObject:", v10, v14);

          --self->_numberOfCachedImages;
          --v9;
        }
      }
      os_unfair_lock_unlock(p_lock);
      os_unfair_lock_lock_with_options();
      if (!self->_numberOfCachedImages)
        break;
      if (v10)
        v15 = v10;
      else
        v15 = v6;
      v10 = v15 - 1;
      os_unfair_lock_unlock(p_lock);
      if (!v9)
        return;
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (id)decodeImageFromSource:(CGImageSource *)a3 index:(unint64_t)a4
{
  CGImage *ImageAtIndex;
  void *v6;
  double v7;
  double v8;
  void *v9;
  CGImage *v10;
  void *v11;

  ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, a4, 0);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  +[SXImageDecodingTools sharedInstance](SXImageDecodingTools, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (CGImage *)objc_msgSend(v9, "newImageByDecodingImage:size:", ImageAtIndex, v8 * self->_size.width, v8 * self->_size.height);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v10, 0, v8);
  CGImageRelease(v10);
  CGImageRelease(ImageAtIndex);
  return v11;
}

- (SXAnimatedImageViewCacheDelegate)delegate
{
  return (SXAnimatedImageViewCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SXAnimatedImage)animatedImage
{
  return (SXAnimatedImage *)objc_loadWeakRetained((id *)&self->_animatedImage);
}

- (BOOL)cachingEnabled
{
  return self->_cachingEnabled;
}

- (void)setCachingEnabled:(BOOL)a3
{
  self->_cachingEnabled = a3;
}

- (int64_t)singleImageByteSize
{
  return self->_singleImageByteSize;
}

- (void)setSingleImageByteSize:(int64_t)a3
{
  self->_singleImageByteSize = a3;
}

- (unint64_t)lastRequestedIndex
{
  return self->_lastRequestedIndex;
}

- (void)setLastRequestedIndex:(unint64_t)a3
{
  self->_lastRequestedIndex = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (unint64_t)numberOfCachedImages
{
  return self->_numberOfCachedImages;
}

- (void)setNumberOfCachedImages:(unint64_t)a3
{
  self->_numberOfCachedImages = a3;
}

- (NSMutableArray)cachedImages
{
  return self->_cachedImages;
}

- (NSMutableIndexSet)indicesToCache
{
  return self->_indicesToCache;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicesToCache, 0);
  objc_storeStrong((id *)&self->_cachedImages, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_animatedImage);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

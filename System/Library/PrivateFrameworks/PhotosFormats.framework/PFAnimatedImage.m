@implementation PFAnimatedImage

- (PFAnimatedImage)init
{
  return -[PFAnimatedImage initWithImageSource:cachingStrategy:](self, "initWithImageSource:cachingStrategy:", 0, 2);
}

- (PFAnimatedImage)initWithURL:(id)a3
{
  return -[PFAnimatedImage initWithURL:cachingStrategy:](self, "initWithURL:cachingStrategy:", a3, 2);
}

- (PFAnimatedImage)initWithURL:(id)a3 cachingStrategy:(int64_t)a4
{
  return -[PFAnimatedImage initWithURL:cachingStrategy:useGlobalDecodeQueue:](self, "initWithURL:cachingStrategy:useGlobalDecodeQueue:", a3, a4, 0);
}

- (PFAnimatedImage)initWithURL:(id)a3 cachingStrategy:(int64_t)a4 useGlobalDecodeQueue:(BOOL)a5
{
  _BOOL8 v5;
  const __CFURL *v8;
  const __CFURL *v9;
  CGImageSourceRef v10;
  CGImageSourceRef v11;
  PFAnimatedImage *v12;
  int v14;
  const __CFURL *v15;
  uint64_t v16;

  v5 = a5;
  v16 = *MEMORY[0x1E0C80C00];
  v8 = (const __CFURL *)a3;
  v9 = v8;
  if (v8 && (v10 = CGImageSourceCreateWithURL(v8, 0)) != 0)
  {
    v11 = v10;
    v12 = -[PFAnimatedImage initWithImageSource:cachingStrategy:useGlobalDecodeQueue:](self, "initWithImageSource:cachingStrategy:useGlobalDecodeQueue:", v10, a4, v5);
    CFRelease(v11);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v9;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PFAnimatedImage: unable to load animated image at URL: %@", (uint8_t *)&v14, 0xCu);
    }
    v12 = -[PFAnimatedImage initWithImageSource:cachingStrategy:useGlobalDecodeQueue:](self, "initWithImageSource:cachingStrategy:useGlobalDecodeQueue:", 0, a4, v5);
  }

  return v12;
}

- (PFAnimatedImage)initWithData:(id)a3
{
  return -[PFAnimatedImage initWithData:cachingStrategy:](self, "initWithData:cachingStrategy:", a3, 2);
}

- (PFAnimatedImage)initWithData:(id)a3 cachingStrategy:(int64_t)a4
{
  const __CFData *v6;
  const __CFData *v7;
  CGImageSourceRef v8;
  CGImageSourceRef v9;
  PFAnimatedImage *v10;
  uint8_t v12[16];

  v6 = (const __CFData *)a3;
  v7 = v6;
  if (v6 && (v8 = CGImageSourceCreateWithData(v6, 0)) != 0)
  {
    v9 = v8;
    v10 = -[PFAnimatedImage initWithImageSource:cachingStrategy:](self, "initWithImageSource:cachingStrategy:", v8, a4);
    CFRelease(v9);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PFAnimatedImage: unable to load animated image from data", v12, 2u);
    }
    v10 = -[PFAnimatedImage initWithImageSource:cachingStrategy:](self, "initWithImageSource:cachingStrategy:", 0, a4);
  }

  return v10;
}

- (PFAnimatedImage)initWithImageSource:(CGImageSource *)a3
{
  return -[PFAnimatedImage initWithImageSource:cachingStrategy:](self, "initWithImageSource:cachingStrategy:", a3, 2);
}

- (PFAnimatedImage)initWithImageSource:(CGImageSource *)a3 cachingStrategy:(int64_t)a4
{
  return -[PFAnimatedImage initWithImageSource:cachingStrategy:useGlobalDecodeQueue:](self, "initWithImageSource:cachingStrategy:useGlobalDecodeQueue:", a3, a4, 0);
}

- (PFAnimatedImage)initWithImageSource:(CGImageSource *)a3 cachingStrategy:(int64_t)a4 useGlobalDecodeQueue:(BOOL)a5
{
  _BOOL8 v5;
  PFAnimatedImage *v8;
  PFFrameCache *v9;
  PFFrameCache *frameCache;
  const __CFDictionary *v11;
  CGImage *ImageAtIndex;
  CGFloat Width;
  size_t Height;
  PFAnimatedImage *v15;
  objc_super v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = a5;
    v17.receiver = self;
    v17.super_class = (Class)PFAnimatedImage;
    v8 = -[PFAnimatedImage init](&v17, sel_init);
    if (v8)
    {
      v8->_imageSource = (CGImageSource *)CFRetain(a3);
      v9 = -[PFFrameCache initWithImageSource:cachingStrategy:useGlobalDecodeQueue:]([PFFrameCache alloc], "initWithImageSource:cachingStrategy:useGlobalDecodeQueue:", a3, a4, v5);
      frameCache = v8->_frameCache;
      v8->_frameCache = v9;

      v8->_frameCount = CGImageSourceGetCount(a3);
      v18 = *MEMORY[0x1E0CBD240];
      v19[0] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, v11);
      Width = (double)CGImageGetWidth(ImageAtIndex);
      Height = CGImageGetHeight(ImageAtIndex);
      v8->_pixelSize.width = Width;
      v8->_pixelSize.height = (double)Height;
      CGImageRelease(ImageAtIndex);
      -[PFAnimatedImage _loadLoopCountAndFrameDelayTimes](v8, "_loadLoopCountAndFrameDelayTimes");
      -[PFAnimatedImage _preloadDelayTimes](v8, "_preloadDelayTimes");

    }
    self = v8;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  CGImageSource *imageSource;
  double *frameDelayTimes;
  objc_super v5;

  imageSource = self->_imageSource;
  if (imageSource)
    CFRelease(imageSource);
  frameDelayTimes = self->_frameDelayTimes;
  if (frameDelayTimes)
    free(frameDelayTimes);
  v5.receiver = self;
  v5.super_class = (Class)PFAnimatedImage;
  -[PFAnimatedImage dealloc](&v5, sel_dealloc);
}

- (double)frameDelayAtIndex:(unint64_t)a3
{
  return self->_frameDelayTimes[a3];
}

- (int64_t)cacheStrategy
{
  return -[PFFrameCache cacheStrategy](self->_frameCache, "cacheStrategy");
}

- (void)setCacheStrategy:(int64_t)a3
{
  -[PFFrameCache setCacheStrategy:](self->_frameCache, "setCacheStrategy:", a3);
}

- (void)_preloadDelayTimes
{
  size_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  const __CFDictionary *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  size_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  self->_duration = 0.0;
  if (self->_frameCount)
  {
    v3 = 0;
    v4 = *MEMORY[0x1E0CBCCE0];
    v21 = *MEMORY[0x1E0CBCE80];
    v5 = *MEMORY[0x1E0CBCCF8];
    v22 = *MEMORY[0x1E0CBCCD8];
    v6 = MEMORY[0x1E0C81028];
    do
    {
      v7 = CGImageSourceCopyPropertiesAtIndex(self->_imageSource, v3, 0);
      v8 = v7;
      if (v7)
      {
        v9 = v7;
        -[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          -[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v21);
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;

        objc_msgSend(v13, "objectForKeyedSubscript:", v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (!v14 || (objc_msgSend(v14, "doubleValue"), v16 == 0.0))
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v22);
          v17 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v17;
        }
        objc_msgSend(v15, "doubleValue");
        v19 = v18;

        if (v19 >= 0.00833333333)
          goto LABEL_19;
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v24 = v3;
        _os_log_impl(&dword_1A16EE000, v6, OS_LOG_TYPE_INFO, "PFAnimatedImage: Failed to fetch properties for frame at index %lu", buf, 0xCu);
      }
      v20 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      if (v3)
      {
        if (v20)
        {
          *(_DWORD *)buf = 134217984;
          v24 = v3;
          _os_log_impl(&dword_1A16EE000, v6, OS_LOG_TYPE_INFO, "PFAnimatedImage: Failed to find a delay for frame %lu. Falling back to previous frame", buf, 0xCu);
        }
        v19 = self->_frameDelayTimes[v3 - 1];
      }
      else
      {
        v19 = 0.0333333333;
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A16EE000, v6, OS_LOG_TYPE_INFO, "PFAnimatedImage: No frame delay for initial frame. Falling back to 30fps. This may impact the entire playback", buf, 2u);
          v19 = 0.0333333333;
        }
      }
LABEL_19:
      self->_frameDelayTimes[v3] = v19;
      self->_duration = v19 + self->_duration;

      ++v3;
    }
    while (v3 < self->_frameCount);
  }
}

- (void)_loadLoopCountAndFrameDelayTimes
{
  CFDictionaryRef v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint8_t v11[16];

  v3 = CGImageSourceCopyProperties(self->_imageSource, 0);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCCE0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCE80]);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCCF0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "unsignedIntegerValue");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PFAnimatedImage: no loop count found, will default to 0 (infinite)", v11, 2u);
    }
    v10 = 0;
  }
  self->_loopCount = v10;
  self->_frameDelayTimes = (double *)malloc_type_calloc(self->_frameCount, 8uLL, 0x100004000313F17uLL);

}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (unint64_t)loopCount
{
  return self->_loopCount;
}

- (double)duration
{
  return self->_duration;
}

- (CGSize)pixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pixelSize.width;
  height = self->_pixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PFFrameCache)frameCache
{
  return self->_frameCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameCache, 0);
}

@end

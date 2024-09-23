@implementation SXAnimatedImage

+ (SXAnimatedImage)animatedImageWithURL:(id)a3 type:(int64_t)a4
{
  return (SXAnimatedImage *)objc_msgSend(a1, "animatedImageWithURL:scale:type:", a3, a4, 1.0);
}

+ (SXAnimatedImage)animatedImageWithURL:(id)a3 scale:(double)a4 type:(int64_t)a5
{
  CGDataProviderRef v8;
  CGDataProvider *v9;
  id v10;
  void *v11;

  v8 = CGDataProviderCreateWithURL((CFURLRef)a3);
  if (v8)
  {
    v9 = v8;
    v10 = objc_alloc((Class)a1);
    v11 = (void *)objc_msgSend(v10, "initWithDataProvider:scale:type:size:", v9, a5, a4, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    CGDataProviderRelease(v9);
  }
  else
  {
    v11 = 0;
  }
  return (SXAnimatedImage *)v11;
}

+ (SXAnimatedImage)animatedImageWithData:(id)a3 size:(CGSize)a4
{
  return (SXAnimatedImage *)objc_msgSend(a1, "animatedImageWithData:scale:size:", a3, 1.0, a4.width, a4.height);
}

+ (SXAnimatedImage)animatedImageWithData:(id)a3 scale:(double)a4 size:(CGSize)a5
{
  double height;
  double width;
  const __CFData *v9;
  CGDataProviderRef v10;
  CGDataProvider *v11;
  void *v12;
  uint64_t v13;
  _BOOL8 v14;
  void *v15;

  height = a5.height;
  width = a5.width;
  v9 = (const __CFData *)a3;
  v10 = CGDataProviderCreateWithCFData(v9);
  if (v10)
  {
    v11 = v10;
    +[SXImageDecodingTools sharedInstance](SXImageDecodingTools, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "contentTypeForImageData:", v9);
    v14 = v13 == *MEMORY[0x24BDC1820];

    v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDataProvider:scale:type:size:", v11, v14, a4, width, height);
    CGDataProviderRelease(v11);
  }
  else
  {
    v15 = 0;
  }

  return (SXAnimatedImage *)v15;
}

- (SXAnimatedImage)initWithDataProvider:(CGDataProvider *)a3 scale:(double)a4 type:(int64_t)a5 size:(CGSize)a6
{
  double height;
  double width;
  CGImageSourceRef v11;
  SXAnimatedImage *v12;

  height = a6.height;
  width = a6.width;
  v11 = CGImageSourceCreateWithDataProvider(a3, 0);
  v12 = -[SXAnimatedImage initWithImageSource:scale:type:size:](self, "initWithImageSource:scale:type:size:", v11, a5, a4, width, height);
  CFRelease(v11);

  return v12;
}

- (SXAnimatedImage)initWithImageSource:(CGImageSource *)a3 scale:(double)a4 type:(int64_t)a5 size:(CGSize)a6
{
  double height;
  double width;
  SXAnimatedImage *v11;
  SXAnimatedImageViewCache *v12;
  SXAnimatedImageViewCache *cache;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  height = a6.height;
  width = a6.width;
  v18.receiver = self;
  v18.super_class = (Class)SXAnimatedImage;
  v11 = -[SXAnimatedImage init](&v18, sel_init);
  if (v11)
  {
    v11->_imageSource = (CGImageSource *)CFRetain(a3);
    v11->_imageType = a5;
    v11->_scale = a4;
    v12 = -[SXAnimatedImageViewCache initWithImageSize:]([SXAnimatedImageViewCache alloc], "initWithImageSize:", width, height);
    cache = v11->_cache;
    v11->_cache = v12;

    -[SXAnimatedImageViewCache setDelegate:](v11->_cache, "setDelegate:", v11);
    -[SXAnimatedImage capturePropertiesForType:](v11, "capturePropertiesForType:", v11->_imageType);
    -[SXAnimatedImage generateFrames](v11, "generateFrames");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v11, sel_didReceiveMemoryWarning, *MEMORY[0x24BDF7538], 0);

    -[SXAnimatedImage cache](v11, "cache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAnimatedImage:", v11);

    -[SXAnimatedImage cache](v11, "cache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "prepareImageForFrameIndex:", 0);

  }
  return v11;
}

- (void)capturePropertiesForType:(int64_t)a3
{
  size_t v5;
  const void *v6;
  const void *v7;
  const void **v8;
  unint64_t *p_loopCount;
  const void *v10;
  const void *v11;
  CGImage *ImageAtIndex;
  CGImage *v13;
  const void *v14;
  double Width;
  double v16;
  CGFloat v17;
  double Height;
  double v19;
  size_t BytesPerRow;
  const __CFDictionary *v21;
  const void *v22;
  uint64_t v23;
  CFNumberRef number;
  void *value;

  v5 = 0;
  v6 = (const void *)*MEMORY[0x24BDD96B0];
  v7 = (const void *)*MEMORY[0x24BDD9598];
  v8 = (const void **)MEMORY[0x24BDD9290];
  self->_loopCount = -1;
  p_loopCount = &self->_loopCount;
  v10 = *v8;
  v11 = (const void *)*MEMORY[0x24BDD95B0];
  self->_imageSize = (CGSize)*MEMORY[0x24BDBF148];
  do
    ImageAtIndex = CGImageSourceCreateImageAtIndex(-[SXAnimatedImage imageSource](self, "imageSource"), v5++, 0);
  while (!ImageAtIndex);
  v13 = ImageAtIndex;
  if (a3 == 1)
    v14 = v6;
  else
    v14 = v7;
  Width = (double)CGImageGetWidth(ImageAtIndex);
  -[SXAnimatedImage scale](self, "scale");
  v17 = Width / v16;
  Height = (double)CGImageGetHeight(v13);
  -[SXAnimatedImage scale](self, "scale");
  self->_imageSize.width = v17;
  self->_imageSize.height = Height / v19;
  BytesPerRow = CGImageGetBytesPerRow(v13);
  self->_uncompressedByteSizePerFrame = CGImageGetHeight(v13) * BytesPerRow;
  CGImageRelease(v13);
  v21 = CGImageSourceCopyProperties(-[SXAnimatedImage imageSource](self, "imageSource"), 0);
  value = 0;
  if (CFDictionaryGetValueIfPresent(v21, v14, (const void **)&value))
  {
    if (a3 == 1)
      v22 = v10;
    else
      v22 = v11;
    number = 0;
    if (!CFDictionaryGetValueIfPresent((CFDictionaryRef)value, v22, (const void **)&number))
    {
      v23 = 0;
      goto LABEL_15;
    }
    CFNumberGetValue(number, kCFNumberNSIntegerType, p_loopCount);
    if (!*p_loopCount)
    {
      v23 = -1;
LABEL_15:
      *p_loopCount = v23;
    }
  }
  else
  {
    *p_loopCount = 0;
  }
  CFRelease(v21);
  self->_duration = 0.0;
  self->_numberOfFrames = CGImageSourceGetCount(-[SXAnimatedImage imageSource](self, "imageSource"));
}

- (void)generateFrames
{
  char *v3;
  SXAnimatedImageFrame *v4;
  CGImageSource *v5;
  void *v6;
  id *v7;
  NSArray *v8;
  NSArray *frames;
  id v10;

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[SXAnimatedImage numberOfFrames](self, "numberOfFrames"));
  if (-[SXAnimatedImage numberOfFrames](self, "numberOfFrames"))
  {
    v3 = 0;
    do
    {
      v4 = [SXAnimatedImageFrame alloc];
      v5 = -[SXAnimatedImage imageSource](self, "imageSource");
      -[SXAnimatedImage cache](self, "cache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SXAnimatedImageFrame initWithImageSource:index:cache:type:]((id *)&v4->super.isa, v5, v3, v6, (void *)-[SXAnimatedImage imageType](self, "imageType"));

      objc_msgSend(v10, "addObject:", v7);
      self->_duration = -[SXAnimatedImageFrame duration]((uint64_t)v7) + self->_duration;

      ++v3;
    }
    while ((unint64_t)v3 < -[SXAnimatedImage numberOfFrames](self, "numberOfFrames"));
  }
  v8 = (NSArray *)objc_msgSend(v10, "copy");
  frames = self->_frames;
  self->_frames = v8;

}

- (id)frameAtIndex:(unint64_t)a3
{
  return -[SXAnimatedImage frameAtIndex:returnNearestPreloaded:](self, "frameAtIndex:returnNearestPreloaded:", a3, 0);
}

- (id)frameAtIndex:(unint64_t)a3 returnNearestPreloaded:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  if (a4)
  {
    -[SXAnimatedImage cache](self, "cache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v6, "nearestCachedFrameIndexForFrameIndex:", a3);

  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    if (-[SXAnimatedImage preloadType](self, "preloadType") == 1)
    {
      -[SXAnimatedImage cache](self, "cache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SXAnimatedImage numberOfFrames](self, "numberOfFrames");
      if (v9 - 1 >= a3 + 3)
        v10 = a3 + 3;
      else
        v10 = v9 - 1;
      objc_msgSend(v8, "prepareImageForFrameIndex:", v10);

    }
    -[SXAnimatedImage frames](self, "frames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)didReceiveMemoryWarning
{
  id v2;

  -[SXAnimatedImage cache](self, "cache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prune");

}

- (void)dealloc
{
  CGImageSource *imageSource;
  void *v4;
  objc_super v5;

  imageSource = self->_imageSource;
  if (imageSource)
  {
    CFRelease(imageSource);
    self->_imageSource = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SXAnimatedImage;
  -[SXAnimatedImage dealloc](&v5, sel_dealloc);
}

- (void)animatedImageViewCache:(id)a3 didCacheImageForFrameIndex:(unint64_t)a4
{
  void *v6;
  char v7;
  id v8;

  -[SXAnimatedImage delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SXAnimatedImage delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animatedImage:madeImageAvailableForFrameAtIndex:", self, a4);

  }
}

- (void)setPreloadType:(int64_t)a3 currentFrameIndex:(unint64_t)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;

  self->_preloadType = a3;
  if (-[SXAnimatedImage preloadType](self, "preloadType") == 1
    && -[SXAnimatedImage numberOfFrames](self, "numberOfFrames") > a4)
  {
    v6 = 0;
    do
    {
      v7 = a4 + v6;
      -[SXAnimatedImage cache](self, "cache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "prepareImageForFrameIndex:", a4 + v6);

      v9 = -[SXAnimatedImage numberOfFrames](self, "numberOfFrames");
      if (v6 > 1)
        break;
      ++v6;
    }
    while (v7 + 1 < v9);
  }
  if (-[SXAnimatedImage preloadType](self, "preloadType") == 2)
  {
    v10 = 0;
    v11 = (-[SXAnimatedImage numberOfFrames](self, "numberOfFrames") - 1) / 3;
    v12 = 3;
    do
    {
      -[SXAnimatedImage cache](self, "cache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "prepareImageForFrameIndex:", v10);

      v10 += v11;
      --v12;
    }
    while (v12);
  }
}

- (void)suspendPreloading
{
  id v2;

  -[SXAnimatedImage cache](self, "cache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspendPreloading:", 1);

}

- (void)resumePreloading
{
  id v2;

  -[SXAnimatedImage cache](self, "cache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspendPreloading:", 0);

}

- (SXAnimatedImageDelegate)delegate
{
  return (SXAnimatedImageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGImageSource)imageSource
{
  return self->_imageSource;
}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)numberOfFrames
{
  return self->_numberOfFrames;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)loopCount
{
  return self->_loopCount;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)uncompressedByteSizePerFrame
{
  return self->_uncompressedByteSizePerFrame;
}

- (BOOL)invalidFile
{
  return self->_invalidFile;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (int64_t)preloadType
{
  return self->_preloadType;
}

- (NSArray)frames
{
  return self->_frames;
}

- (SXAnimatedImageViewCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

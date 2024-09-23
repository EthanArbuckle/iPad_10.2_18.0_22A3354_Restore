@implementation VKCStickerVideoDecoder

- (void)setVideoData:(id *)a1
{
  id v4;
  id v5;

  v4 = a2;
  if (a1 && a1[2] != v4)
  {
    v5 = v4;
    objc_storeStrong(a1 + 2, a2);
    objc_msgSend(a1, "configureForVideoDataChange");
    v4 = v5;
  }

}

- (void)configureForVideoDataChange
{
  id v3;
  NSData *v4;
  NSData *v5;
  CGImageSource *v6;
  int64_t Count;
  CFDictionaryRef v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  NSArray *frameDelays;
  void *v15;
  double v16;
  double v17;
  VKCTimeRange *v18;
  VKCStickerVideoDecoder *v19;
  VKCStickerVideoDecoder *v20;
  void *v21;
  id WeakRetained;
  objc_super v23;

  if (self && self->_videoData)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VKCStickerVideoDecoder setFrameRanges:](self, "setFrameRanges:", v3);

    if (self && (v4 = self->_videoData) != 0)
    {
      v5 = v4;
      v6 = CGImageSourceCreateWithData((CFDataRef)self->_videoData, 0);

    }
    else
    {
      v6 = 0;
    }
    -[VKCStickerVideoDecoder setVideoCGImageSource:](self, "setVideoCGImageSource:", v6);
    if (v6)
    {
      Count = CGImageSourceGetCount(v6);
      v8 = CGImageSourceCopyProperties(v6, 0);
      -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCE80]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCE88]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "valueForKeyPath:", *MEMORY[0x1E0CBCE78]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      CFRelease(v6);
    }
    else
    {
      Count = 0;
      v8 = 0;
      v11 = 0;
    }
    -[VKCStickerVideoDecoder setVideoSourceProperties:](self, "setVideoSourceProperties:", v8);
    -[VKCStickerVideoDecoder setFrameCount:](self, "setFrameCount:", Count);
    -[VKCStickerVideoDecoder setFrameDelays:](self, "setFrameDelays:", v11);
    if (Count < 1)
    {
      v13 = 0.0;
    }
    else
    {
      v12 = 0;
      v13 = 0.0;
      do
      {
        if (self)
          frameDelays = self->_frameDelays;
        else
          frameDelays = 0;
        -[NSArray objectAtIndexedSubscript:](frameDelays, "objectAtIndexedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        v18 = [VKCTimeRange alloc];
        if (v18)
        {
          v23.receiver = v18;
          v23.super_class = (Class)VKCTimeRange;
          v19 = -[VKCStickerVideoDecoder init](&v23, sel_init);
          v20 = v19;
          if (v19)
          {
            *(double *)&v19->_delegate = v13;
            *(double *)&v19->_videoData = v17;
          }
        }
        else
        {
          v20 = 0;
        }
        -[VKCStickerVideoDecoder frameRanges](self, "frameRanges");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v20);

        v13 = v13 + v17;
        ++v12;
      }
      while (Count != v12);
    }
    -[VKCStickerVideoDecoder setDuration:](self, "setDuration:", v13);
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "initialProcessingCompleteForDecoder:", self);

  }
}

- (uint64_t)videoData
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
  return WeakRetained;
}

- (CGImage)frameAtIndex:(int64_t)a3
{
  CGImageRef ImageAtIndex;
  CGImage *v4;

  ImageAtIndex = CGImageSourceCreateImageAtIndex(-[VKCStickerVideoDecoder videoCGImageSource](self, "videoCGImageSource"), a3, 0);
  v4 = ImageAtIndex;
  if (ImageAtIndex)
    CFAutorelease(ImageAtIndex);
  return v4;
}

- (uint64_t)frameForTargetTimestamp:(void *)a1
{
  long double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double *v10;
  double v11;
  double v12;
  uint64_t v14;
  uint64_t v15;

  if (!a1 || !objc_msgSend(a1, "frameCount") || !objc_msgSend(a1, "videoCGImageSource"))
    return 0;
  objc_msgSend(a1, "duration");
  v5 = fmod(a2, v4);
  if (objc_msgSend(a1, "frameCount") < 1)
  {
    v8 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      v7 = objc_msgSend(a1, "previousFrameIndex") + v6;
      v8 = v7 % objc_msgSend(a1, "frameCount");
      objc_msgSend(a1, "frameRanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (double *)objc_claimAutoreleasedReturnValue();

      if (v10 && (v11 = v10[1], v11 <= v5))
      {
        v12 = v11 + v10[2];

        if (v12 > v5)
          break;
      }
      else
      {

      }
      ++v6;
    }
    while (v6 < objc_msgSend(a1, "frameCount"));
  }
  v14 = v8 & ~(v8 >> 63);
  v15 = objc_msgSend(a1, "frameCount");
  if (v14 >= v15 - 1)
    v14 = v15 - 1;
  objc_msgSend(a1, "setPreviousFrameIndex:", v14);
  return objc_msgSend(a1, "frameAtIndex:", v14);
}

- (id)setDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 1, a2);
  return result;
}

- (void)setFrameDelays:(id)a3
{
  objc_storeStrong((id *)&self->_frameDelays, a3);
}

- (CGImageSource)videoCGImageSource
{
  return self->_videoCGImageSource;
}

- (void)setVideoCGImageSource:(CGImageSource *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSDictionary)videoSourceProperties
{
  return self->_videoSourceProperties;
}

- (void)setVideoSourceProperties:(id)a3
{
  objc_storeStrong((id *)&self->_videoSourceProperties, a3);
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(int64_t)a3
{
  self->_frameCount = a3;
}

- (NSMutableArray)frameRanges
{
  return self->_frameRanges;
}

- (void)setFrameRanges:(id)a3
{
  objc_storeStrong((id *)&self->_frameRanges, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)previousFrameIndex
{
  return self->_previousFrameIndex;
}

- (void)setPreviousFrameIndex:(int64_t)a3
{
  self->_previousFrameIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameRanges, 0);
  objc_storeStrong((id *)&self->_videoSourceProperties, 0);
  objc_storeStrong((id *)&self->_frameDelays, 0);
  objc_storeStrong((id *)&self->_videoData, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

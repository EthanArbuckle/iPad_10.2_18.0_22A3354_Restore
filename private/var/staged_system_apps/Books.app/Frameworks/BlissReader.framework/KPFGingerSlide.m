@implementation KPFGingerSlide

- (KPFGingerSlide)initWithSlideDictionary:(id)a3 slideTag:(id)a4 baseResourcePath:(id)a5 drmContext:(id)a6
{
  KPFGingerSlide *v10;
  NSDictionary *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)KPFGingerSlide;
  v10 = -[KPFGingerSlide init](&v13, "init");
  if (v10)
  {
    v10->mSlideTag = (NSString *)a4;
    v10->mBaseResourcePath = (NSString *)a5;
    v10->mCurrentEventIndex = 0;
    v10->mCurrentEvent = 0;
    v10->mDrmContext = (PFDContext *)a6;
    v10->mTextureCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v11 = (NSDictionary *)a3;
    v10->mKPFDictionary = v11;
    if (v11)
      v10->mEventCount = (unint64_t)objc_msgSend(-[KPFGingerSlide p_eventsArray](v10, "p_eventsArray"), "count");
    v10->mMoviesDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->mHyperLinkedEvent = 0;
  self->mCurrentEvent = 0;

  self->mNextEvent = 0;
  self->mTextureCache = 0;

  self->mDrmContext = 0;
  v3.receiver = self;
  v3.super_class = (Class)KPFGingerSlide;
  -[KPFGingerSlide dealloc](&v3, "dealloc");
}

- (void)teardown
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  self->mCurrentEventIndex = 0;
  self->mEventCount = (unint64_t)objc_msgSend(-[KPFGingerSlide p_eventsArray](self, "p_eventsArray"), "count");
  -[KPFGingerEvent tearDown](self->mCurrentEvent, "tearDown");

  self->mCurrentEvent = 0;
  -[KPFGingerEvent tearDown](self->mNextEvent, "tearDown");

  self->mNextEvent = 0;
  self->mHyperLinkedEvent = 0;
  -[NSMutableDictionary removeAllObjects](self->mTextureCache, "removeAllObjects");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[NSMutableDictionary allValues](self->mMoviesDict, "allValues", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "stop");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSMutableDictionary removeAllObjects](self->mMoviesDict, "removeAllObjects");
}

- (unint64_t)eventCount
{
  return (unint64_t)objc_msgSend(-[KPFGingerSlide p_eventsArray](self, "p_eventsArray"), "count");
}

- (void)renderSlideWithSession:(id)a3
{
  self->mCurrentEventIndex = 0;
  -[KPFGingerEvent tearDown](self->mCurrentEvent, "tearDown");

  self->mCurrentEvent = 0;
  -[KPFGingerEvent tearDown](self->mNextEvent, "tearDown");

  self->mNextEvent = 0;
  self->mHyperLinkedEvent = 0;
  -[NSMutableDictionary removeAllObjects](self->mMoviesDict, "removeAllObjects");
  -[KPFGingerSlide renderCurrentEventWithSession:](self, "renderCurrentEventWithSession:", a3);
}

- (void)renderHyperLinkedSlideWithSlideTag:(id)a3 withSession:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  KPFGingerEvent *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v7 = -[KPFGingerSlide p_hyperlinksArray](self, "p_hyperlinksArray");
  if (objc_msgSend(v7, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "objectForKey:", CFSTR("events")), "objectForKey:", a3);
          if (v12)
          {
            v13 = -[KPFGingerEvent initWithDictionary:]([KPFGingerEvent alloc], "initWithDictionary:", v12);
            self->mHyperLinkedEvent = v13;
            -[KPFGingerEvent renderEventWithSession:](v13, "renderEventWithSession:", a4);
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
  }
}

- (void)animateSlideWithSession:(id)a3
{
  -[KPFGingerEvent animateWithSession:](-[KPFGingerSlide currentEvent](self, "currentEvent"), "animateWithSession:", a3);
}

- (KPFGingerEvent)currentEvent
{
  KPFGingerEvent *result;

  result = self->mCurrentEvent;
  if (!result)
  {
    result = -[KPFGingerEvent initWithDictionary:]([KPFGingerEvent alloc], "initWithDictionary:", objc_msgSend(-[KPFGingerSlide p_eventsArray](self, "p_eventsArray"), "objectAtIndex:", self->mCurrentEventIndex));
    self->mCurrentEvent = result;
  }
  return result;
}

- (KPFGingerEvent)nextEvent
{
  KPFGingerEvent *result;
  unint64_t v4;

  result = self->mNextEvent;
  if (!result)
  {
    v4 = self->mCurrentEventIndex + 1;
    if (v4 >= -[KPFGingerSlide eventCount](self, "eventCount"))
    {
      return self->mNextEvent;
    }
    else
    {
      result = -[KPFGingerEvent initWithDictionary:]([KPFGingerEvent alloc], "initWithDictionary:", objc_msgSend(-[KPFGingerSlide p_eventsArray](self, "p_eventsArray"), "objectAtIndex:", self->mCurrentEventIndex + 1));
      self->mNextEvent = result;
    }
  }
  return result;
}

- (BOOL)nextEventContainsMovie
{
  return -[KPFGingerEvent containsMovie](-[KPFGingerSlide nextEvent](self, "nextEvent"), "containsMovie");
}

- (BOOL)incrementCurrentEventIndex
{
  unint64_t v3;
  unint64_t v4;
  _BYTE *mCurrentEventIndex;
  KPFGingerEvent *mNextEvent;

  v3 = self->mCurrentEventIndex + 1;
  v4 = -[KPFGingerSlide eventCount](self, "eventCount");
  if (v3 < v4)
  {
    ++self->mCurrentEventIndex;
    -[KPFGingerEvent tearDown](self->mCurrentEvent, "tearDown");

    self->mCurrentEvent = 0;
    mCurrentEventIndex = (_BYTE *)self->mCurrentEventIndex;
    if (mCurrentEventIndex == (char *)-[KPFGingerSlide eventCount](self, "eventCount") - 1)
      -[KPFGingerSlide stopAllMovies](self, "stopAllMovies");
    mNextEvent = self->mNextEvent;
    if (mNextEvent)
    {
      -[KPFGingerEvent tearDown](mNextEvent, "tearDown");

      self->mNextEvent = 0;
    }
  }
  return v3 < v4;
}

- (BOOL)decrementCurrentEventIndex
{
  unint64_t mCurrentEventIndex;

  mCurrentEventIndex = self->mCurrentEventIndex;
  if (mCurrentEventIndex)
  {
    self->mCurrentEventIndex = mCurrentEventIndex - 1;
    -[KPFGingerEvent tearDown](self->mCurrentEvent, "tearDown");

    self->mCurrentEvent = 0;
    -[KPFGingerEvent tearDown](self->mNextEvent, "tearDown");

    self->mNextEvent = 0;
  }
  return mCurrentEventIndex != 0;
}

- (void)renderCurrentEventWithSession:(id)a3
{
  -[KPFGingerEvent renderEventWithSession:](-[KPFGingerSlide currentEvent](self, "currentEvent"), "renderEventWithSession:", a3);
}

- (CGSize)textureSizeForName:(id)a3
{
  id v3;
  float v4;
  double v5;
  float v6;
  double v7;
  double v8;
  CGSize result;

  v3 = objc_msgSend(-[KPFGingerSlide p_texturesDictionary](self, "p_texturesDictionary"), "objectForKey:", a3);
  objc_msgSend(objc_msgSend(v3, "objectForKey:", CFSTR("width")), "floatValue");
  v5 = v4;
  objc_msgSend(objc_msgSend(v3, "objectForKey:", CFSTR("height")), "floatValue");
  v7 = v6;
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (CGImage)newImageForTextureName:(id)a3
{
  CGImageSource *v3;
  CGImage *ImageAtIndex;

  v3 = CGImageSourceCreateWithURL((CFURLRef)-[KPFGingerSlide p_urlForResource:](self, "p_urlForResource:", objc_msgSend(objc_msgSend(-[KPFGingerSlide p_texturesDictionary](self, "p_texturesDictionary"), "objectForKey:", a3), "objectForKey:", CFSTR("url"))), 0);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v3, 0, 0);
  CFRelease(v3);
  return ImageAtIndex;
}

- (CGImage)CGImageForTextureName:(id)a3 session:(id)a4
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  const __CFURL *v12;
  const __CFURL *v13;
  void *v14;
  const __CFData *v15;
  CGDataProvider *v16;
  CGPDFDocument *v17;
  CGPDFPage *Page;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  CGColorSpace *DeviceRGB;
  CGContext *v24;
  CGContext *v25;
  CGImage *Image;
  CGAffineTransform transform;
  uint64_t v29;
  CGRect BoxRect;
  CGRect v31;

  -[NSMutableDictionary removeAllObjects](self->mTextureCache, "removeAllObjects");
  v7 = objc_autoreleasePoolPush();
  v8 = -[NSMutableDictionary objectForKey:](self->mTextureCache, "objectForKey:", a3);
  if (a3 && !v8)
  {
    v9 = objc_msgSend(-[KPFGingerSlide p_texturesDictionary](self, "p_texturesDictionary"), "objectForKey:", a3);
    v10 = objc_msgSend(v9, "objectForKey:", CFSTR("url"));
    v11 = objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("index")), "unsignedIntegerValue");
    v12 = -[KPFGingerSlide p_urlForResource:](self, "p_urlForResource:", v10);
    v13 = v12;
    if (self->mDrmContext)
    {
      v29 = 0;
      v14 = objc_autoreleasePoolPush();
      v15 = (const __CFData *)objc_msgSend(a4, "cachedDataForKPFFileURL:", v13);
      if (!v15)
      {
        v15 = -[PFDContext dataWithContentsOfURL:error:](self->mDrmContext, "dataWithContentsOfURL:error:", v13, &v29);
        if (v15)
          objc_msgSend(a4, "setCachedData:forKPFFileURL:", v15, v13);
      }
      v16 = CGDataProviderCreateWithCFData(v15);
      v17 = CGPDFDocumentCreateWithProvider(v16);
      CGDataProviderRelease(v16);
      objc_autoreleasePoolPop(v14);
    }
    else
    {
      v17 = CGPDFDocumentCreateWithURL(v12);
    }
    Page = CGPDFDocumentGetPage(v17, (size_t)v11 + 1);
    BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    x = BoxRect.origin.x;
    y = BoxRect.origin.y;
    width = BoxRect.size.width;
    height = BoxRect.size.height;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v24 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, 4 * (unint64_t)width, DeviceRGB, 0x2002u);
    v25 = v24;
    if (v24)
    {
      CGContextSetInterpolationQuality(v24, kCGInterpolationHigh);
      CGContextSaveGState(v25);
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      CGPDFPageGetDrawingTransform(&transform, Page, kCGPDFCropBox, v31, 0, 1);
      CGContextConcatCTM(v25, &transform);
      CGContextDrawPDFPage(v25, Page);
      CGContextRestoreGState(v25);
      Image = CGBitmapContextCreateImage(v25);
      -[NSMutableDictionary setObject:forKey:](self->mTextureCache, "setObject:forKey:", Image, a3);
      CGImageRelease(Image);
    }
    CGColorSpaceRelease(DeviceRGB);
    CGContextRelease(v25);
    CGPDFDocumentRelease(v17);
  }
  objc_autoreleasePoolPop(v7);
  return (CGImage *)-[NSMutableDictionary objectForKey:](self->mTextureCache, "objectForKey:", a3);
}

- (id)movieNameForTextureName:(id)a3
{
  return objc_msgSend(objc_msgSend(-[KPFGingerSlide p_texturesDictionary](self, "p_texturesDictionary"), "objectForKey:", a3), "objectForKey:", CFSTR("movie"));
}

- (void)newMovieForTextureName:(id)a3 movieDict:(id)a4 withObjectID:(id)a5
{
  id v8;
  id v9;
  float v10;
  KPFMovie *v11;

  v8 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("asset"));
  v9 = -[KPFGingerSlide p_urlForMovie:](self, "p_urlForMovie:", objc_msgSend(objc_msgSend(-[KPFGingerSlide p_texturesDictionary](self, "p_texturesDictionary"), "objectForKeyedSubscript:", v8), "objectForKeyedSubscript:", CFSTR("url")));
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("volume")), "floatValue");
  v11 = -[KPFMovie initWithURL:looping:volume:name:audioOnly:drmContext:]([KPFMovie alloc], "initWithURL:looping:volume:name:audioOnly:drmContext:", v9, 0, v8, objc_msgSend(objc_msgSend(a4, "objectForKey:", CFSTR("isAudioOnly")), "BOOLValue"), self->mDrmContext, v10);
  -[KPFMovie registerForMovieEndCallback:target:](v11, "registerForMovieEndCallback:target:", "p_movieEndCallback:", self);
  -[NSMutableDictionary setObject:forKey:](self->mMoviesDict, "setObject:forKey:", v11, a5);

}

- (id)movieForObjectID:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->mMoviesDict, "objectForKeyedSubscript:", a3);
}

- (void)playMovieForObjectID:(id)a3 afterDelay:(double)a4
{
  id v5;

  v5 = -[NSMutableDictionary objectForKey:](self->mMoviesDict, "objectForKey:", a3);
  if (v5)
    objc_msgSend(v5, "playAfterDelay:", a4);
}

- (void)stopMovieForObjectID:(id)a3
{
  id v5;

  v5 = -[NSMutableDictionary objectForKey:](self->mMoviesDict, "objectForKey:");
  if (v5)
  {
    objc_msgSend(v5, "stop");
    -[NSMutableDictionary removeObjectForKey:](self->mMoviesDict, "removeObjectForKey:", a3);
  }
}

- (void)stopAllMovies
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSMutableDictionary allValues](self->mMoviesDict, "allValues", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "stop");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSMutableDictionary removeAllObjects](self->mMoviesDict, "removeAllObjects");
}

- (BOOL)containsMovie
{
  return -[NSMutableDictionary count](self->mMoviesDict, "count") != 0;
}

- (void)pauseMediaPlayback
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSMutableDictionary allValues](self->mMoviesDict, "allValues", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "pause");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  self->mMediaPlaybackIsPaused = 1;
}

- (void)resumeMediaPlayback
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSMutableDictionary allValues](self->mMoviesDict, "allValues", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "resume");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  self->mMediaPlaybackIsPaused = 0;
}

- (void)p_movieEndCallback:(id)a3
{
  objc_msgSend(a3, "stop");
  -[NSMutableDictionary removeObjectForKey:](self->mMoviesDict, "removeObjectForKey:", objc_msgSend(-[NSMutableDictionary allKeysForObject:](self->mMoviesDict, "allKeysForObject:", a3), "objectAtIndexedSubscript:", 0));
}

- (NSString)slideTag
{
  return self->mSlideTag;
}

- (KPFGingerEvent)hyperLinkedEvent
{
  return self->mHyperLinkedEvent;
}

- (unint64_t)curentEventIndex
{
  return self->mCurrentEventIndex;
}

- (BOOL)mediaPlaybackIsPaused
{
  return self->mMediaPlaybackIsPaused;
}

- (id)p_urlForResource:(id)a3
{
  NSURL *v4;

  if (!a3)
    return 0;
  v4 = -[NSURL standardizedURL](-[NSURL URLByAppendingPathComponent:isDirectory:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", self->mBaseResourcePath), "URLByAppendingPathComponent:isDirectory:", a3, 0), "standardizedURL");
  if (-[NSString hasPrefix:](-[NSURL path](v4, "path"), "hasPrefix:", self->mBaseResourcePath))
    return v4;
  else
    return 0;
}

- (id)p_urlForMovie:(id)a3
{
  NSURL *v4;

  if (!a3)
    return 0;
  v4 = -[NSURL standardizedURL](-[NSURL URLByAppendingPathComponent:isDirectory:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", self->mBaseResourcePath), "URLByAppendingPathComponent:isDirectory:", -[NSString stringByAppendingPathComponent:](self->mSlideTag, "stringByAppendingPathComponent:"), 0), "standardizedURL");
  if (-[NSString hasPrefix:](-[NSURL path](v4, "path"), "hasPrefix:", self->mBaseResourcePath))
    return v4;
  else
    return 0;
}

- (id)p_texturesDictionary
{
  id result;

  result = self->mTexturesDictionary;
  if (!result)
  {
    result = -[NSDictionary objectForKey:](self->mKPFDictionary, "objectForKey:", CFSTR("assets"));
    self->mTexturesDictionary = (NSDictionary *)result;
  }
  return result;
}

- (id)p_eventsArray
{
  id result;

  result = self->mEventsArray;
  if (!result)
  {
    result = -[NSDictionary objectForKey:](self->mKPFDictionary, "objectForKey:", CFSTR("events"));
    self->mEventsArray = (NSArray *)result;
  }
  return result;
}

- (id)p_hyperlinksArray
{
  return objc_msgSend(objc_msgSend(-[KPFGingerSlide p_eventsArray](self, "p_eventsArray"), "objectAtIndex:", self->mCurrentEventIndex), "objectForKey:", CFSTR("hyperlinks"));
}

- (id)p_effectsArray
{
  id result;

  result = self->mEffectsArray;
  if (!result)
  {
    result = objc_msgSend(objc_msgSend(-[KPFGingerSlide p_eventsArray](self, "p_eventsArray"), "objectAtIndex:", 0), "objectForKey:", CFSTR("effects"));
    self->mEffectsArray = (NSArray *)result;
  }
  return result;
}

@end

@implementation KPFSession

- (KPFSession)initWithKPFDocument:(id)a3 showLayer:(id)a4
{
  KPFSession *v6;
  CALayer *v7;
  KPFGingerDocument *v8;
  NSMutableDictionary *v9;
  NSArray *v10;
  NSString *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  KPFGingerSlide *v16;
  NSCache *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];

  v23.receiver = self;
  v23.super_class = (Class)KPFSession;
  v6 = -[KPFSession init](&v23, "init");
  if (v6)
  {
    v7 = (CALayer *)a4;
    v6->_showLayer = v7;
    -[CALayer setName:](v7, "setName:", CFSTR("showLayer"));
    -[CALayer setMasksToBounds:](v6->_showLayer, "setMasksToBounds:", 1);
    v8 = (KPFGingerDocument *)a3;
    v6->mDocument = v8;
    v9 = -[KPFGingerDocument slidesDictionary](v8, "slidesDictionary");
    v10 = -[KPFGingerDocument slideList](v6->mDocument, "slideList");
    v11 = -[KPFGingerDocument documentPath](v6->mDocument, "documentPath");
    v6->mKPFSlideList = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->_animationRegistry = objc_alloc_init(KPFGingerAnimationRegistry);
    v6->_isMetalEnabled = 1;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v10);
          v16 = -[KPFGingerSlide initWithSlideDictionary:slideTag:baseResourcePath:drmContext:]([KPFGingerSlide alloc], "initWithSlideDictionary:slideTag:baseResourcePath:drmContext:", -[NSMutableDictionary objectForKey:](v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i)), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), v11, objc_msgSend(a3, "drmContext"));
          -[NSMutableArray addObject:](v6->mKPFSlideList, "addObject:", v16);

        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v13);
    }
    v6->mCurrentSlideIndex = 0;
    v6->mSoundtrack = 0;
    -[KPFSession setPlaybackState:](v6, "setPlaybackState:", 1);
    v17 = (NSCache *)objc_alloc_init((Class)NSCache);
    v6->mFileCache = v17;
    -[NSCache setTotalCostLimit:](v17, "setTotalCostLimit:", 50000000);
  }
  return v6;
}

- (void)dealloc
{
  TSDMetalLayer *sharedMetalLayer;
  objc_super v4;

  -[CALayer setSublayers:](self->_showLayer, "setSublayers:", 0);

  sharedMetalLayer = self->_sharedMetalLayer;
  if (sharedMetalLayer)
    -[TSDMetalLayer tearDown](sharedMetalLayer, "tearDown");
  v4.receiver = self;
  v4.super_class = (Class)KPFSession;
  -[KPFSession dealloc](&v4, "dealloc");
}

- (KPFGingerSlide)currentSlide
{
  KPFGingerSlide *result;
  unint64_t mCurrentSlideIndex;

  result = self->mCurrentSlide;
  if (!result)
  {
    mCurrentSlideIndex = self->mCurrentSlideIndex;
    if (mCurrentSlideIndex >= (unint64_t)-[NSMutableArray count](self->mKPFSlideList, "count"))
    {
      return self->mCurrentSlide;
    }
    else
    {
      result = (KPFGingerSlide *)-[NSMutableArray objectAtIndex:](self->mKPFSlideList, "objectAtIndex:", self->mCurrentSlideIndex);
      self->mCurrentSlide = result;
    }
  }
  return result;
}

- (KPFGingerSlide)nextSlide
{
  unint64_t v3;

  v3 = self->mCurrentSlideIndex + 1;
  if (v3 >= (unint64_t)-[NSMutableArray count](self->mKPFSlideList, "count"))
    return 0;
  else
    return (KPFGingerSlide *)-[NSMutableArray objectAtIndex:](self->mKPFSlideList, "objectAtIndex:", self->mCurrentSlideIndex + 1);
}

- (BOOL)incrementCurrentSlideIndex
{
  unint64_t v3;
  id v4;
  KPFGingerSlide *mCurrentSlide;
  unint64_t v6;

  v3 = self->mCurrentSlideIndex + 1;
  v4 = -[NSMutableArray count](self->mKPFSlideList, "count");
  if (v3 < (unint64_t)v4)
  {
    mCurrentSlide = self->mCurrentSlide;
    self->mPreviousSlideIndex = self->mCurrentSlideIndex;
    -[KPFGingerSlide teardown](mCurrentSlide, "teardown");
    v6 = self->mCurrentSlideIndex + 1;
    self->mCurrentSlide = 0;
    self->mCurrentSlideIndex = v6;
  }
  return v3 < (unint64_t)v4;
}

- (BOOL)decrementCurrentSlideIndex
{
  unint64_t mCurrentSlideIndex;
  unint64_t v4;

  mCurrentSlideIndex = self->mCurrentSlideIndex;
  if (mCurrentSlideIndex)
  {
    self->mPreviousSlideIndex = mCurrentSlideIndex;
    -[KPFGingerSlide teardown](self->mCurrentSlide, "teardown");
    v4 = self->mCurrentSlideIndex - 1;
    self->mCurrentSlide = 0;
    self->mCurrentSlideIndex = v4;
  }
  return mCurrentSlideIndex != 0;
}

- (void)setSlideIndex:(unint64_t)a3
{
  KPFGingerSlide *mCurrentSlide;
  unint64_t mCurrentSlideIndex;

  if ((unint64_t)-[NSMutableArray count](self->mKPFSlideList, "count") > a3)
  {
    mCurrentSlide = self->mCurrentSlide;
    mCurrentSlideIndex = self->mCurrentSlideIndex;
    self->mCurrentSlideIndex = a3;
    self->mPreviousSlideIndex = mCurrentSlideIndex;
    -[KPFGingerSlide teardown](mCurrentSlide, "teardown");
    self->mCurrentSlide = 0;
  }
}

- (void)setSlideWithSlideTag:(id)a3
{
  NSMutableArray *mKPFSlideList;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  KPFGingerSlide *mCurrentSlide;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mKPFSlideList = self->mKPFSlideList;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mKPFSlideList, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(mKPFSlideList);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v10, "slideTag")))
        {
          mCurrentSlide = self->mCurrentSlide;
          self->mPreviousSlideIndex = self->mCurrentSlideIndex;
          -[KPFGingerSlide teardown](mCurrentSlide, "teardown");
          self->mCurrentSlide = 0;
          self->mCurrentSlideIndex = (unint64_t)-[NSMutableArray indexOfObject:](self->mKPFSlideList, "indexOfObject:", v10);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mKPFSlideList, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
}

- (void)p_setupSoundtrack
{
  NSString *v3;
  NSString *v4;
  unint64_t v5;
  NSURL *v6;
  KPFMovie *v7;
  const __CFString *v8;

  v3 = -[KPFGingerDocument soundtrackPath](self->mDocument, "soundtrackPath");
  if (v3)
  {
    v4 = v3;

    self->mSoundtrack = 0;
    v5 = -[KPFGingerDocument soundtrackMode](self->mDocument, "soundtrackMode");
    v6 = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 0);
    v7 = [KPFMovie alloc];
    if (v5 == 1)
      v8 = CFSTR("looping");
    else
      v8 = CFSTR("none");
    -[KPFGingerDocument soundtrackVolume](self->mDocument, "soundtrackVolume");
    self->mSoundtrack = -[KPFMovie initWithURL:looping:volume:name:audioOnly:drmContext:](v7, "initWithURL:looping:volume:name:audioOnly:drmContext:", v6, v8, v4, 1, 0);
  }
}

- (void)setupAndPlaySoundtrackAfterDelay:(double)a3
{
  KPFMovie *mSoundtrack;

  if (-[KPFGingerDocument soundtrackPath](self->mDocument, "soundtrackPath"))
  {
    mSoundtrack = self->mSoundtrack;
    if (mSoundtrack)
      -[KPFMovie stop](mSoundtrack, "stop");
    else
      -[KPFSession p_setupSoundtrack](self, "p_setupSoundtrack");
    if (!-[KPFMovie isPlaying](self->mSoundtrack, "isPlaying"))
      -[KPFMovie playAfterDelay:](self->mSoundtrack, "playAfterDelay:", a3);
  }
}

- (void)pauseMediaPlayback
{
  -[KPFMovie pause](self->mSoundtrack, "pause");
  -[KPFGingerSlide pauseMediaPlayback](-[KPFSession currentSlide](self, "currentSlide"), "pauseMediaPlayback");
}

- (void)resumeMediaPlayback
{
  -[KPFMovie resume](self->mSoundtrack, "resume");
  -[KPFGingerSlide resumeMediaPlayback](-[KPFSession currentSlide](self, "currentSlide"), "resumeMediaPlayback");
}

- (BOOL)hasBackgroundSoundtrack
{
  return self->mSoundtrack != 0;
}

- (void)pauseBackgroundSoundtrack
{
  -[KPFMovie pause](self->mSoundtrack, "pause");
}

- (void)resumeBackgroundSoundtrack
{
  -[KPFMovie resume](self->mSoundtrack, "resume");
}

- (void)stopAllAnimations
{
  -[KPFMovie stop](self->mSoundtrack, "stop");

  self->mSoundtrack = 0;
  -[KPFGingerSlide teardown](-[KPFSession currentSlide](self, "currentSlide"), "teardown");
}

- (CGImage)CGImageForTextureName:(id)a3
{
  return -[KPFGingerSlide CGImageForTextureName:session:](-[KPFSession currentSlide](self, "currentSlide"), "CGImageForTextureName:session:", a3, self);
}

- (id)movieNameForTextureName:(id)a3
{
  return -[KPFGingerSlide movieNameForTextureName:](-[KPFSession currentSlide](self, "currentSlide"), "movieNameForTextureName:", a3);
}

- (CGSize)textureSizeForName:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  -[KPFGingerSlide textureSizeForName:](-[KPFSession currentSlide](self, "currentSlide"), "textureSizeForName:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)cachedDataForKPFFileURL:(id)a3
{
  return -[NSCache objectForKey:](-[KPFSession fileCache](self, "fileCache"), "objectForKey:", objc_msgSend(a3, "standardizedURL"));
}

- (void)setCachedData:(id)a3 forKPFFileURL:(id)a4
{
  -[NSCache setObject:forKey:cost:](-[KPFSession fileCache](self, "fileCache"), "setObject:forKey:cost:", a3, objc_msgSend(a4, "standardizedURL"), objc_msgSend(a3, "length"));
}

- (void)makeSharedMetalLayerVisible:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[KPFSession isMetalEnabled](self, "isMetalEnabled"))
    -[TSDMetalLayer setHidden:](-[KPFSession sharedMetalLayer](self, "sharedMetalLayer"), "setHidden:", !v3);
}

- (TSDMetalLayer)sharedMetalLayer
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  TSDMetalLayer *v8;

  objc_sync_enter(self);
  if (-[KPFSession isMetalEnabled](self, "isMetalEnabled") && !self->_sharedMetalLayer)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction activateBackground:](CATransaction, "activateBackground:", +[NSThread isMainThread](NSThread, "isMainThread") ^ 1);
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v3 = objc_alloc((Class)TSDMetalLayer);
    -[CALayer bounds](self->_showLayer, "bounds");
    v8 = (TSDMetalLayer *)objc_msgSend(v3, "initWithFrame:isOpaque:isWideGamut:delegate:metalDevice:", 1, 0, 0, -[KPFSession metalDevice](self, "metalDevice"), v4, v5, v6, v7);
    self->_sharedMetalLayer = v8;
    -[CALayer addSublayer:](self->_showLayer, "addSublayer:", v8);
    +[CATransaction commit](CATransaction, "commit");
  }
  objc_sync_exit(self);
  return self->_sharedMetalLayer;
}

- (MTLDevice)metalDevice
{
  MTLDevice *result;

  result = self->_metalDevice;
  if (!result)
  {
    result = (MTLDevice *)MTLCreateSystemDefaultDevice();
    self->_metalDevice = result;
  }
  return result;
}

- (BOOL)isMetalCapable
{
  return self->_isMetalCapable;
}

- (BOOL)isMetalEnabled
{
  return 1;
}

- (unint64_t)previousSlideIndex
{
  return self->mPreviousSlideIndex;
}

- (unint64_t)currentSlideIndex
{
  return self->mCurrentSlideIndex;
}

- (NSMutableArray)KPFSlideList
{
  return self->mKPFSlideList;
}

- (NSCache)fileCache
{
  return self->mFileCache;
}

- (void)setFileCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (KPFGingerDocument)mDocument
{
  return self->mDocument;
}

- (CALayer)showLayer
{
  return self->_showLayer;
}

- (int)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(int)a3
{
  self->_playbackState = a3;
}

- (KPFGingerAnimationRegistry)animationRegistry
{
  return self->_animationRegistry;
}

- (void)setSharedMetalLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end

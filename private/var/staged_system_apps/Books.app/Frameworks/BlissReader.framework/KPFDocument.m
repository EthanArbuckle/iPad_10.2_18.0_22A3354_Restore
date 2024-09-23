@implementation KPFDocument

- (KPFDocument)initWithKPFBundle:(id)a3 kpfDictionary:(id)a4 drmContext:(id)a5
{
  KPFDocument *v8;
  NSDictionary *v9;
  id v10;
  int v11;
  unint64_t mSlideCount;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];

  v25.receiver = self;
  v25.super_class = (Class)KPFDocument;
  v8 = -[KPFDocument init](&v25, "init");
  if (v8)
  {
    v8->mKPFBundle = (NSBundle *)a3;
    v8->mDrmContext = (PFDContext *)a5;
    v9 = (NSDictionary *)a4;
    v8->mKPFDictionary = v9;
    v10 = -[NSDictionary objectForKey:](v9, "objectForKey:", CFSTR("slideCount"));
    if (v10)
    {
      v11 = objc_msgSend(v10, "intValue");
      if (v11 >= 100000)
        LODWORD(mSlideCount) = 100000;
      else
        LODWORD(mSlideCount) = v11;
      mSlideCount = (int)mSlideCount;
      v8->mSlideCount = (int)mSlideCount;
    }
    else
    {
      mSlideCount = v8->mSlideCount;
    }
    v8->mSlidesEventMap = (unint64_t *)malloc_type_malloc(8 * mSlideCount, 0x100004000313F17uLL);
    if (-[NSDictionary objectForKey:](v8->mKPFDictionary, "objectForKey:", CFSTR("pageCount")))
      v8->mEventCount = (unint64_t)objc_msgSend(-[KPFDocument p_eventsArray](v8, "p_eventsArray"), "count");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = -[NSDictionary objectForKey:](v8->mKPFDictionary, "objectForKey:", CFSTR("navigatorEvents"), 0);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v22;
LABEL_12:
      v18 = 0;
      v19 = v16;
      while (1)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v13);
        v16 = v19 + 1;
        v8->mSlidesEventMap[v19] = (int)objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v18), "objectForKey:", CFSTR("eventIndex")), "intValue");
        if (v19 + 1 >= v8->mSlideCount)
          break;
        v18 = (char *)v18 + 1;
        ++v19;
        if (v15 == v18)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v15)
            goto LABEL_12;
          break;
        }
      }
    }
    v8->mIsLooping = objc_msgSend(-[NSDictionary objectForKey:](v8->mKPFDictionary, "objectForKey:", CFSTR("loopSlideshow")), "BOOLValue");
  }
  return v8;
}

- (void)dealloc
{
  CGImage *mThumbnailImage;
  unint64_t *mSlidesEventMap;
  objc_super v5;

  mThumbnailImage = self->mThumbnailImage;
  if (mThumbnailImage)
    CGImageRelease(mThumbnailImage);
  mSlidesEventMap = self->mSlidesEventMap;
  if (mSlidesEventMap)
    free(mSlidesEventMap);

  v5.receiver = self;
  v5.super_class = (Class)KPFDocument;
  -[KPFDocument dealloc](&v5, "dealloc");
}

- (CGSize)showSize
{
  id v3;
  id v4;
  double v5;
  BOOL v6;
  double v7;
  void *v8;
  float v9;
  float v10;
  double v11;
  CGSize result;

  v3 = -[NSDictionary objectForKey:](self->mKPFDictionary, "objectForKey:", CFSTR("slideWidth"));
  v4 = -[NSDictionary objectForKey:](self->mKPFDictionary, "objectForKey:", CFSTR("slideHeight"));
  v5 = 0.0;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = 0.0;
  if (!v6)
  {
    v8 = v4;
    objc_msgSend(v3, "floatValue");
    v5 = v9;
    objc_msgSend(v8, "floatValue");
    v7 = v10;
  }
  v11 = v5;
  result.height = v7;
  result.width = v11;
  return result;
}

- (CGImage)thumbnailImage
{
  CGImage *result;

  result = self->mThumbnailImage;
  if (!result)
  {
    result = -[KPFDocument newImageForTextureName:](self, "newImageForTextureName:", CFSTR("thumbnail"));
    self->mThumbnailImage = result;
  }
  return result;
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

  v3 = objc_msgSend(-[KPFDocument p_texturesDictionary](self, "p_texturesDictionary"), "objectForKey:", a3);
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
  CGImage *result;
  CGImage *v4;
  CGImage *ImageAtIndex;

  result = -[KPFDocument newImageSourceForTextureName:](self, "newImageSourceForTextureName:", a3);
  if (result)
  {
    v4 = result;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(result, 0, 0);
    CFRelease(v4);
    return ImageAtIndex;
  }
  return result;
}

- (CGImageSource)newImageSourceForTextureName:(id)a3
{
  const __CFURL *v4;
  PFDContext *mDrmContext;

  v4 = -[KPFDocument p_urlForResource:](self, "p_urlForResource:", objc_msgSend(objc_msgSend(-[KPFDocument p_texturesDictionary](self, "p_texturesDictionary"), "objectForKey:", a3), "objectForKey:", CFSTR("url")));
  mDrmContext = self->mDrmContext;
  if (mDrmContext)
    return CGImageSourceCreateWithData((CFDataRef)-[PFDContext dataWithContentsOfURL:error:](mDrmContext, "dataWithContentsOfURL:error:", v4, 0), 0);
  else
    return CGImageSourceCreateWithURL(v4, 0);
}

- (id)movieURLForTextureName:(id)a3
{
  return objc_msgSend(objc_msgSend(-[KPFDocument p_texturesDictionary](self, "p_texturesDictionary"), "objectForKey:", a3), "objectForKey:", CFSTR("movieUrl"));
}

- (id)newMovieForTextureName:(id)a3
{
  id v5;
  id v6;
  id v7;
  float v8;
  double v9;

  v5 = objc_msgSend(-[KPFDocument p_texturesDictionary](self, "p_texturesDictionary"), "objectForKey:", a3);
  v6 = -[KPFDocument p_urlForResource:](self, "p_urlForResource:", objc_msgSend(v5, "objectForKey:", CFSTR("movieUrl")));
  v7 = objc_msgSend(v5, "objectForKey:", CFSTR("movieVolume"));
  if (v7)
  {
    objc_msgSend(v7, "floatValue");
    v9 = fmaxf(fminf(v8, 1.0), 0.0);
  }
  else
  {
    v9 = 1.0;
  }
  return -[KPFMovie initWithURL:looping:volume:name:audioOnly:drmContext:]([KPFMovie alloc], "initWithURL:looping:volume:name:audioOnly:drmContext:", v6, objc_msgSend(v5, "objectForKey:", CFSTR("movieLooping")), a3, 0, self->mDrmContext, v9);
}

- (id)eventDictAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[KPFDocument p_eventsArray](self, "p_eventsArray"), "objectAtIndex:", a3);
}

- (id)newEventAtIndex:(unint64_t)a3
{
  return -[KPFEvent initWithDictionary:]([KPFEvent alloc], "initWithDictionary:", -[KPFDocument eventDictAtIndex:](self, "eventDictAtIndex:", a3));
}

- (unint64_t)eventIndexForSlideIndex:(unint64_t)a3
{
  if (self->mSlideCount <= a3)
    return 0;
  else
    return self->mSlidesEventMap[a3];
}

- (unint64_t)slideIndexForEventIndex:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = self->mSlideCount - 1;
  do
  {
    v4 = v3;
    if (!v3)
      break;
    v5 = self->mSlidesEventMap[v3--];
  }
  while (v5 > a3);
  return v4;
}

- (unint64_t)eventIndexForPreviousSlideGivenEventIndex:(unint64_t)a3
{
  unint64_t v3;
  unint64_t *mSlidesEventMap;
  unint64_t v5;

  v3 = self->mSlideCount - 1;
  while (v3)
  {
    mSlidesEventMap = self->mSlidesEventMap;
    v5 = mSlidesEventMap[v3--];
    if (v5 <= a3)
      return mSlidesEventMap[v3];
  }
  return a3;
}

- (id)soundtrackName
{
  id result;

  result = -[NSDictionary objectForKey:](self->mKPFDictionary, "objectForKey:", CFSTR("soundTrackMedia"));
  if (result)
    return objc_msgSend(result, "objectAtIndex:", 0);
  return result;
}

- (id)newSoundtrack
{
  id result;
  id v4;
  id v5;
  unsigned int v6;
  KPFMovie *v7;
  const __CFString *v8;

  result = -[KPFDocument soundtrackName](self, "soundtrackName");
  if (result)
  {
    v4 = result;
    v5 = -[KPFDocument p_urlForResource:](self, "p_urlForResource:", objc_msgSend(objc_msgSend(-[KPFDocument p_texturesDictionary](self, "p_texturesDictionary"), "objectForKey:", result), "objectForKey:", CFSTR("movieUrl")));
    v6 = objc_msgSend(-[NSDictionary objectForKey:](self->mKPFDictionary, "objectForKey:", CFSTR("soundTrackMode")), "intValue");
    v7 = [KPFMovie alloc];
    if (v6 == 1)
      v8 = CFSTR("looping");
    else
      v8 = CFSTR("none");
    return -[KPFMovie initWithURL:looping:volume:name:audioOnly:drmContext:](v7, "initWithURL:looping:volume:name:audioOnly:drmContext:", v5, v8, v4, 1, self->mDrmContext, 1.0);
  }
  return result;
}

- (int)showMode
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->mKPFDictionary, "objectForKey:", CFSTR("showMode")), "intValue");
}

- (BOOL)isLegacy
{
  return self->isLegacy;
}

- (void)setIsLegacy:(BOOL)a3
{
  self->isLegacy = a3;
}

- (unint64_t)eventCount
{
  return self->mEventCount;
}

- (unint64_t)slideCount
{
  return self->mSlideCount;
}

- (BOOL)isLooping
{
  return self->mIsLooping;
}

- (id)p_urlForResource:(id)a3
{
  NSURL *v4;

  if (!a3)
    return 0;
  v4 = -[NSURL standardizedURL](-[NSURL URLByAppendingPathComponent:isDirectory:](-[NSBundle bundleURL](self->mKPFBundle, "bundleURL"), "URLByAppendingPathComponent:isDirectory:", a3, 0), "standardizedURL");
  if (-[NSString hasPrefix:](-[NSURL path](v4, "path"), "hasPrefix:", -[NSBundle bundlePath](self->mKPFBundle, "bundlePath")))
  {
    return v4;
  }
  else
  {
    return 0;
  }
}

- (id)p_texturesDictionary
{
  id result;

  result = self->mTexturesDictionary;
  if (!result)
  {
    result = -[NSDictionary objectForKey:](self->mKPFDictionary, "objectForKey:", CFSTR("textures"));
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
    result = -[NSDictionary objectForKey:](self->mKPFDictionary, "objectForKey:", CFSTR("eventTimelines"));
    self->mEventsArray = (NSArray *)result;
  }
  return result;
}

@end

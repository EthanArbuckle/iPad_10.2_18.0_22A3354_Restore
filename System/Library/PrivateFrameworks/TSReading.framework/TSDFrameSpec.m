@implementation TSDFrameSpec

+ (id)frameSpecs
{
  id result;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  TSDFrameSpec *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  result = (id)frameSpecs_sFrameSpecs;
  if (!frameSpecs_sFrameSpecs)
  {
    objc_sync_enter(a1);
    if (!frameSpecs_sFrameSpecs)
    {
      v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v5 = (void *)objc_msgSend((id)TSDBundle(), "pathsForResourcesOfType:inDirectory:", CFSTR("sfrframe"), CFSTR("Frames"));
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v14;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v14 != v7)
              objc_enumerationMutation(v5);
            v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8));
            v10 = -[TSDFrameSpec initWithBundle:isVolatile:]([TSDFrameSpec alloc], "initWithBundle:isVolatile:", v9, 0);
            if (v10)
              objc_msgSend(v4, "addObject:", v10);

            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v6);
      }
      __dmb(0xBu);
      frameSpecs_sFrameSpecs = (uint64_t)v4;
      if (!v4)
      {
        v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDFrameSpec frameSpecs]");
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameSpec.m"), 66, CFSTR("Couldn't initialize lazy variable %s"), "sFrameSpecs");
      }
    }
    objc_sync_exit(a1);
    return (id)frameSpecs_sFrameSpecs;
  }
  return result;
}

+ (TSDFrameSpec)frameSpecWithName:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  TSDFrameSpec *result;
  uint64_t v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)frameSpecWithName__sReadableNameToSpecMap;
  if (!frameSpecWithName__sReadableNameToSpecMap)
  {
    obj = a1;
    objc_sync_enter(a1);
    if (!frameSpecWithName__sReadableNameToSpecMap)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v17 = a3;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = (void *)objc_msgSend(obj, "frameSpecs");
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v20 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            v12 = objc_msgSend(v11, "frameName");
            if (objc_msgSend(v6, "objectForKey:", v12))
            {
              v16 = v12;
              TSULogErrorInFunction();
            }
            objc_msgSend(v6, "setObject:forKey:", v11, v12, v16);
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v8);
      }
      __dmb(0xBu);
      frameSpecWithName__sReadableNameToSpecMap = (uint64_t)v6;
      a3 = v17;
      if (!v6)
      {
        v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDFrameSpec frameSpecWithName:]");
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameSpec.m"), 90, CFSTR("Couldn't initialize lazy variable %s"), "sReadableNameToSpecMap");
      }
    }
    objc_sync_exit(obj);
    v5 = (void *)frameSpecWithName__sReadableNameToSpecMap;
  }
  result = (TSDFrameSpec *)objc_msgSend(v5, "objectForKey:", a3);
  if (!result)
    return (TSDFrameSpec *)objc_msgSend((id)frameSpecWithName__sReadableNameToSpecMap, "objectForKey:", CFSTR("None"));
  return result;
}

- (TSDFrameSpec)initWithBundle:(id)a3 isVolatile:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  TSDFrameSpec *v8;
  id v9;
  void *v10;
  double v11;
  float v12;
  float v13;
  objc_super v15;

  if (!a3)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", 0, a4);
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameSpec initWithBundle:isVolatile:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameSpec.m"), 103, CFSTR("invalid nil value for '%s'"), "bundle");
  }
  v15.receiver = self;
  v15.super_class = (Class)TSDFrameSpec;
  v8 = -[TSDFrameSpec init](&v15, sel_init);
  if (v8)
  {
    v8->mBundle = (NSBundle *)a3;
    v9 = -[TSDFrameSpec p_infoDictionary](v8, "p_infoDictionary");
    objc_opt_class();
    objc_msgSend(v9, "objectForKey:", CFSTR("name"));
    v10 = (void *)TSUDynamicCast();
    if (!v10)
      v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "lastPathComponent"), "stringByDeletingPathExtension");
    v8->mFrameName = (NSString *)objc_msgSend(v10, "copy");
    v8->mDisplayInPicker = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("Display")), "BOOLValue");
    v8->mLeftInset = (double)(int)objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("Left Frame Inset")), "intValue");
    v8->mRightInset = (double)(int)objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("Right Frame Inset")), "intValue");
    v8->mTopInset = (double)(int)objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("Top Frame Inset")), "intValue");
    v8->mBottomInset = (double)(int)objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("Bottom Frame Inset")), "intValue");
    v8->mTilingMode = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("Stretch Tiles")), "intValue");
    if (objc_msgSend(v9, "objectForKey:", CFSTR("Minimum Asset Scale")))
    {
      objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("Minimum Asset Scale")), "floatValue");
      TSUClamp();
    }
    else
    {
      v11 = 1.0;
    }
    v8->mMinimumAssetScale = v11;
    if (objc_msgSend(v9, "objectForKey:", CFSTR("Adornment Location Relative")))
    {
      objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("Adornment Location Relative")), "floatValue");
      v8->mAdornmentPosition.x = v12;
      objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("Adornment Location Absolute")), "floatValue");
      v8->mAdornmentPosition.y = v13;
    }
    v8->mHasImages = objc_msgSend(v9, "objectForKey:", CFSTR("Top Left")) != 0;
    v8->mHasMask = objc_msgSend(v9, "objectForKey:", CFSTR("Top Left Mask")) != 0;
    v8->mHasAdornment = objc_msgSend(v9, "objectForKey:", CFSTR("Adornment")) != 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDFrameSpec;
  -[TSDFrameSpec dealloc](&v3, sel_dealloc);
}

- (id)p_infoDictionary
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", -[NSBundle pathForResource:ofType:](self->mBundle, "pathForResource:ofType:", CFSTR("index"), CFSTR("plist")));
}

+ (id)p_imageKeys
{
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  result = (id)p_imageKeys_sImageKeys;
  if (!p_imageKeys_sImageKeys)
  {
    objc_sync_enter(a1);
    if (!p_imageKeys_sImageKeys)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("Top Left"), CFSTR("Top"), CFSTR("Top Right"), CFSTR("Right"), CFSTR("Bottom Right"), CFSTR("Bottom"), CFSTR("Bottom Left"), CFSTR("Left"), CFSTR("Adornment"), 0);
      __dmb(0xBu);
      p_imageKeys_sImageKeys = v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDFrameSpec p_imageKeys]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameSpec.m"), 173, CFSTR("Couldn't initialize lazy variable %s"), "sImageKeys");
      }
    }
    objc_sync_exit(a1);
    return (id)p_imageKeys_sImageKeys;
  }
  return result;
}

- (id)p_imageDataForKey:(id)a3
{
  id result;

  result = (id)objc_msgSend(-[TSDFrameSpec p_infoDictionary](self, "p_infoDictionary"), "objectForKey:", a3);
  if (result)
    return +[TSPData readOnlyDataFromURL:context:](TSPData, "readOnlyDataFromURL:context:", -[NSURL URLByAppendingPathComponent:](-[NSBundle resourceURL](self->mBundle, "resourceURL"), "URLByAppendingPathComponent:", result), 0);
  return result;
}

- (void)p_loadImageMetrics
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  unint64_t v23;
  double v24;

  if (!self->mLoadedImageMetrics)
  {
    objc_sync_enter(self);
    if (!self->mLoadedImageMetrics)
    {
      if (-[TSDFrameSpec i_hasImages](self, "i_hasImages"))
      {
        v3 = -[TSDFrameSpec i_providerForIndex:mask:](self, "i_providerForIndex:mask:", 6, 0);
        v4 = -[TSDFrameSpec i_providerForIndex:mask:](self, "i_providerForIndex:mask:", 2, 0);
        objc_msgSend(v3, "naturalSize");
        v6 = v5;
        v8 = v7;
        objc_msgSend(v4, "naturalSize");
        v10 = v9;
        v12 = v11;
        objc_opt_class();
        v13 = (void *)TSUDynamicCast();
        if (v13)
        {
          v14 = objc_msgSend(v13, "imageDPI");
          if (v14 >= 0x49)
          {
            v15 = 72.0 / (double)v14;
            v6 = TSDMultiplySizeScalar(v6, v8, v15);
            v8 = v16;
            v10 = TSDMultiplySizeScalar(v10, v12, v15);
            v12 = v17;
          }
        }
        self->mLeftWidth = v6;
        self->mRightWidth = v10;
        self->mTopHeight = v12;
        self->mBottomHeight = v8;
      }
      if (-[TSDFrameSpec i_hasAdornment](self, "i_hasAdornment"))
      {
        objc_msgSend(-[TSDFrameSpec i_providerForIndex:mask:](self, "i_providerForIndex:mask:", 8, 0), "naturalSize");
        v19 = v18;
        v21 = v20;
        objc_opt_class();
        v22 = (void *)TSUDynamicCast();
        if (v22)
        {
          v23 = objc_msgSend(v22, "imageDPI");
          if (v23 >= 0x49)
          {
            v19 = TSDMultiplySizeScalar(v19, v21, 72.0 / (double)v23);
            v21 = v24;
          }
        }
        self->mAdornmentSize.width = v19;
        self->mAdornmentSize.height = v21;
      }
      __dmb(0xBu);
      self->mLoadedImageMetrics = 1;
    }
    objc_sync_exit(self);
  }
}

- (NSString)frameName
{
  return self->mFrameName;
}

- (BOOL)displayInPicker
{
  return self->mDisplayInPicker;
}

- (BOOL)i_hasImages
{
  return self->mHasImages;
}

- (BOOL)i_hasMask
{
  return self->mHasMask;
}

- (BOOL)i_hasAdornment
{
  return self->mHasAdornment;
}

- (void)i_addInterestInProviders
{
  int *p_mInterest;
  unsigned int v3;

  p_mInterest = &self->mInterest;
  do
    v3 = __ldaxr((unsigned int *)p_mInterest);
  while (__stlxr(v3 + 1, (unsigned int *)p_mInterest));
}

- (void)i_removeInterestInProviders
{
  int *p_mInterest;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_mInterest = &self->mInterest;
  do
    v4 = __ldaxr((unsigned int *)p_mInterest);
  while (__stlxr(v4 - 1, (unsigned int *)p_mInterest));
  if (!*p_mInterest)
  {
    objc_sync_enter(self);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)-[NSMutableDictionary allValues](self->mProvidersByKey, "allValues", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "flush");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    -[NSMutableDictionary removeAllObjects](self->mProvidersByKey, "removeAllObjects");
    objc_sync_exit(self);
  }
}

- (id)i_providerForIndex:(int)a3 mask:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSMutableDictionary *mProvidersByKey;

  v4 = a4;
  if (a3 == 8 && a4)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameSpec(Internal) i_providerForIndex:mask:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameSpec.m"), 296, CFSTR("Masks for adornments are unsupported."));
  }
  v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "p_imageKeys"), "objectAtIndex:", a3);
  v10 = (uint64_t)v9;
  if (v4)
    v10 = objc_msgSend(v9, "stringByAppendingString:", CFSTR(" Mask"));
  objc_sync_enter(self);
  v11 = (id)-[NSMutableDictionary objectForKey:](self->mProvidersByKey, "objectForKey:", v10);
  if (!v11)
  {
    v11 = -[TSDFrameSpec p_imageDataForKey:](self, "p_imageDataForKey:", v10);
    if (v11)
    {
      objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", v11, 0);
      objc_opt_class();
      v11 = (id)TSUDynamicCast();
      mProvidersByKey = self->mProvidersByKey;
      if (!mProvidersByKey)
      {
        mProvidersByKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        self->mProvidersByKey = mProvidersByKey;
      }
      -[NSMutableDictionary setObject:forKey:](mProvidersByKey, "setObject:forKey:", v11, v10);
    }
  }
  objc_sync_exit(self);
  return v11;
}

- (double)i_leftInset
{
  return self->mLeftInset;
}

- (double)i_rightInset
{
  return self->mRightInset;
}

- (double)i_topInset
{
  return self->mTopInset;
}

- (double)i_bottomInset
{
  return self->mBottomInset;
}

- (double)i_leftWidth
{
  -[TSDFrameSpec p_loadImageMetrics](self, "p_loadImageMetrics");
  return self->mLeftWidth;
}

- (double)i_rightWidth
{
  -[TSDFrameSpec p_loadImageMetrics](self, "p_loadImageMetrics");
  return self->mRightWidth;
}

- (double)i_topHeight
{
  -[TSDFrameSpec p_loadImageMetrics](self, "p_loadImageMetrics");
  return self->mTopHeight;
}

- (double)i_bottomHeight
{
  -[TSDFrameSpec p_loadImageMetrics](self, "p_loadImageMetrics");
  return self->mBottomHeight;
}

- (CGSize)i_adornmentSize
{
  double width;
  double height;
  CGSize result;

  -[TSDFrameSpec p_loadImageMetrics](self, "p_loadImageMetrics");
  width = self->mAdornmentSize.width;
  height = self->mAdornmentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)i_minimumAssetScale
{
  return self->mMinimumAssetScale;
}

- (CGPoint)i_adornmentPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->mAdornmentPosition.x;
  y = self->mAdornmentPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int)i_tilingMode
{
  return self->mTilingMode;
}

@end

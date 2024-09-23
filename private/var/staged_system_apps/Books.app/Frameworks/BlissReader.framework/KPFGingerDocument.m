@implementation KPFGingerDocument

- (KPFGingerDocument)initWithKPFBundle:(id)a3 kpfDictionary:(id)a4 drmContext:(id)a5
{
  KPFGingerDocument *v8;
  NSDictionary *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)KPFGingerDocument;
  v8 = -[KPFGingerDocument init](&v11, "init");
  if (v8)
  {
    v8->mKPFBundle = (NSBundle *)a3;
    v8->mDrmContext = (PFDContext *)a5;
    v9 = (NSDictionary *)a4;
    v8->mKPFDictionary = v9;
    v8->mSlideList = (NSArray *)-[NSDictionary objectForKey:](v9, "objectForKey:", CFSTR("slideList"));
    v8->mSoundtrackDict = (NSDictionary *)-[NSDictionary objectForKey:](v8->mKPFDictionary, "objectForKey:", CFSTR("soundtrack"));
    v8->mIsLooping = objc_msgSend(-[NSDictionary objectForKey:](v8->mKPFDictionary, "objectForKey:", CFSTR("loopSlideshow")), "BOOLValue");
    v8->mSlideHeight = (NSNumber *)-[NSDictionary objectForKey:](v8->mKPFDictionary, "objectForKey:", CFSTR("slideHeight"));
    v8->mSlideWidth = (NSNumber *)-[NSDictionary objectForKey:](v8->mKPFDictionary, "objectForKey:", CFSTR("slideWidth"));
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->mKPFBundle = 0;
  self->mSlideList = 0;

  self->mSlidesDictionary = 0;
  v3.receiver = self;
  v3.super_class = (Class)KPFGingerDocument;
  -[KPFGingerDocument dealloc](&v3, "dealloc");
}

- (NSString)soundtrackPath
{
  NSDictionary *mSoundtrackDict;
  id v4;

  mSoundtrackDict = self->mSoundtrackDict;
  if (mSoundtrackDict && (v4 = -[NSDictionary objectForKey:](mSoundtrackDict, "objectForKey:", CFSTR("tracks"))) != 0)
    return -[NSString stringByAppendingPathComponent:](-[KPFGingerDocument documentPath](self, "documentPath"), "stringByAppendingPathComponent:", objc_msgSend(v4, "objectAtIndex:", 0));
  else
    return 0;
}

- (double)soundtrackVolume
{
  NSDictionary *mSoundtrackDict;
  float v3;

  mSoundtrackDict = self->mSoundtrackDict;
  if (!mSoundtrackDict)
    return 0.0;
  objc_msgSend(-[NSDictionary objectForKey:](mSoundtrackDict, "objectForKey:", CFSTR("volume")), "floatValue");
  return v3;
}

- (unint64_t)soundtrackMode
{
  unint64_t result;

  result = (unint64_t)self->mSoundtrackDict;
  if (result)
    return (unint64_t)objc_msgSend(objc_msgSend((id)result, "objectForKey:", CFSTR("mode")), "unsignedIntegerValue");
  return result;
}

- (CGSize)showSize
{
  NSNumber *mSlideWidth;
  float v4;
  double v5;
  float v6;
  double v7;
  double v8;
  CGSize result;

  mSlideWidth = self->mSlideWidth;
  if (mSlideWidth && self->mSlideHeight)
  {
    -[NSNumber floatValue](mSlideWidth, "floatValue");
    v5 = v4;
    -[NSNumber floatValue](self->mSlideHeight, "floatValue");
    v7 = v6;
  }
  else
  {
    v5 = 0.0;
    v7 = 0.0;
  }
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (NSMutableDictionary)slidesDictionary
{
  NSMutableDictionary *result;
  NSArray *mSlideList;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  PFDContext *mDrmContext;
  NSData *v12;
  NSMutableDictionary *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (self->mSlidesDictionary)
    return self->mSlidesDictionary;
  self->mSlidesDictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  mSlideList = self->mSlideList;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](mSlideList, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v5)
    return self->mSlidesDictionary;
  v6 = v5;
  v7 = *(_QWORD *)v15;
LABEL_6:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v7)
      objc_enumerationMutation(mSlideList);
    v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
    result = -[NSBundle pathForResource:ofType:inDirectory:](self->mKPFBundle, "pathForResource:ofType:inDirectory:", &stru_43D7D8, CFSTR("json"), v9);
    if (!result)
      return result;
    v10 = result;
    mDrmContext = self->mDrmContext;
    if (mDrmContext)
      v12 = -[PFDContext dataWithContentsOfFile:error:](mDrmContext, "dataWithContentsOfFile:error:", v10, 0);
    else
      v12 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v10);
    if (!v12)
      return 0;
    result = (NSMutableDictionary *)+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v12, 0, 0);
    if (!result)
      return result;
    v13 = result;
    -[NSMutableDictionary setObject:forKey:](self->mSlidesDictionary, "setObject:forKey:", result, v9);

    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](mSlideList, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        goto LABEL_6;
      return self->mSlidesDictionary;
    }
  }
}

- (NSString)documentPath
{
  NSString *result;

  result = (NSString *)&self->mKPFBundle->super.isa;
  if (result)
    return (NSString *)-[NSString bundlePath](result, "bundlePath");
  return result;
}

- (BOOL)isLegacy
{
  return self->isLegacy;
}

- (void)setIsLegacy:(BOOL)a3
{
  self->isLegacy = a3;
}

- (BOOL)isLooping
{
  return self->mIsLooping;
}

- (NSArray)slideList
{
  return self->mSlideList;
}

- (PFDContext)drmContext
{
  return self->mDrmContext;
}

@end

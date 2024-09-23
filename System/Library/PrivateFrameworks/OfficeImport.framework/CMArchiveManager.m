@implementation CMArchiveManager

- (CMArchiveManager)init
{
  CMArchiveManager *v2;
  uint64_t v3;
  NSMutableDictionary *mDrawableCache;
  uint64_t v5;
  NSMutableSet *mPausedPaths;
  NSCache *v7;
  NSCache *mStyleObjectCache;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMArchiveManager;
  v2 = -[CMArchiveManager init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mDrawableCache = v2->mDrawableCache;
    v2->mDrawableCache = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    mPausedPaths = v2->mPausedPaths;
    v2->mPausedPaths = (NSMutableSet *)v5;

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    mStyleObjectCache = v2->mStyleObjectCache;
    v2->mStyleObjectCache = v7;

    -[NSCache setCountLimit:](v2->mStyleObjectCache, "setCountLimit:", 128);
    -[NSCache setName:](v2->mStyleObjectCache, "setName:", CFSTR("CMArchiveManager cache"));
  }
  return v2;
}

- (void)setIsOnPhone:(BOOL)a3
{
  self->mIsOnPhone = a3;
}

- (void)setPassphrase:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setAutoCommit:(BOOL)a3
{
  self->mAutoCommit = a3;
}

- (BOOL)isThumbnail
{
  return self->mIsThumbnail;
}

- (void)setPageCount:(unint64_t)a3
{
  self->mPageCount = a3;
}

- (void)setHTMLWidth:(int)a3
{
  self->mWidth = a3;
}

- (void)setHTMLHeight:(int)a3
{
  self->mHeight = a3;
}

- (BOOL)progressiveMappingIsPausedOnPath:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  char v6;

  v4 = (__CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("##main##");
  v6 = -[NSMutableSet containsObject:](self->mPausedPaths, "containsObject:", v5);

  return v6;
}

- (id)cachedPathForDrawable:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->mDrawableCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int)blipTypeToResourceType:(int)a3
{
  if (a3 > 9)
    return -1;
  else
    return dword_22A4D51F8[a3];
}

- (id)addResourceForDrawable:(id)a3 withType:(int)a4 drawable:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->mDrawableCache, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[CMArchiveManager addResource:withType:](self, "addResource:withType:", v8, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->mDrawableCache, "setObject:forKey:", v11, v10);
    }
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)addResource:(id)a3 withType:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = -[CMArchiveManager copyResourceWithType:](self, "copyResourceWithType:", v4);
  -[CMArchiveManager pushData:toPath:](self, "pushData:toPath:", v6, v7);
  -[CMArchiveManager commitDataAtPath:](self, "commitDataAtPath:", v7);
  -[CMArchiveManager closeResourceAtPath:](self, "closeResourceAtPath:", v7);

  return v7;
}

- (id)_validateData:(id)a3 withType:(int *)a4
{
  return a3;
}

- (id)copyResourceWithType:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  +[CMArchiveManager resourceTypeToExtension:](CMArchiveManager, "resourceTypeToExtension:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMFileManager uniqueFileName:](CMFileManager, "uniqueFileName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CMArchiveManager copyResourceWithName:type:](self, "copyResourceWithName:type:", v6, v3);
  return v7;
}

+ (id)resourceTypeToExtension:(int)a3
{
  if (a3 > 0xA)
    return &stru_24F3BFFF8;
  else
    return off_24F3BF4C8[a3];
}

- (BOOL)isOnPhone
{
  return self->mIsOnPhone;
}

- (void)pauseProgressiveMappingOnPath:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  __CFString *v6;

  v4 = (const __CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("##main##");
  v6 = (__CFString *)v5;
  -[NSMutableSet addObject:](self->mPausedPaths, "addObject:");

}

- (void)restartProgressiveMappingOnPath:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  __CFString *v6;

  v4 = (const __CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("##main##");
  v6 = (__CFString *)v5;
  -[NSMutableSet removeObject:](self->mPausedPaths, "removeObject:");

}

- (id)copyResourceWithName:(id)a3 type:(int)a4
{
  return 0;
}

- (void)setCommitInterval:(double)a3
{
  self->mCommitInterval = a3;
}

- (id)addResource:(id)a3 withName:(id)a4 type:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = -[CMArchiveManager copyResourceWithName:type:](self, "copyResourceWithName:type:", a4, v5);
  -[CMArchiveManager pushData:toPath:](self, "pushData:toPath:", v8, v9);
  -[CMArchiveManager commitDataAtPath:](self, "commitDataAtPath:", v9);
  -[CMArchiveManager closeResourceAtPath:](self, "closeResourceAtPath:", v9);

  return v9;
}

- (unint64_t)resourceCount
{
  return 0;
}

- (id)addStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[NSCache objectForKey:](self->mStyleObjectCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "cacheFriendlyCSSStyleString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMArchiveManager addCssStyle:](self, "addCssStyle:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[NSCache setObject:forKey:](self->mStyleObjectCache, "setObject:forKey:", v7, v4);

  }
  return v7;
}

- (id)addCssStyle:(id)a3
{
  return 0;
}

- (id)cssStylesheetString
{
  return 0;
}

- (void)setResourcePathPrefix:(id)a3
{
  objc_storeStrong((id *)&self->mResourcePathPrefix, a3);
}

- (id)resourcePathPrefix
{
  return self->mResourcePathPrefix;
}

- (id)appendResourcePathToName:(id)a3
{
  id v4;
  NSString *mResourcePathPrefix;
  id v6;
  void *v7;

  v4 = a3;
  mResourcePathPrefix = self->mResourcePathPrefix;
  if (mResourcePathPrefix)
  {
    -[NSString stringByAppendingPathComponent:](mResourcePathPrefix, "stringByAppendingPathComponent:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (void)setIsThumbnail:(BOOL)a3
{
  self->mIsThumbnail = a3;
}

- (unint64_t)pageCount
{
  return self->mPageCount;
}

- (BOOL)isProgressive
{
  return 1;
}

- (BOOL)isCancelled
{
  return 0;
}

+ (id)resourceTypeToMIME:(int)a3
{
  if ((a3 + 1) > 0xB)
    return CFSTR("text");
  else
    return (id)qword_24F3BF468[a3 + 1];
}

- (NSString)passphrase
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)noDecorations
{
  return self->_noDecorations;
}

- (void)setNoDecorations:(BOOL)a3
{
  self->_noDecorations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyleObjectCache, 0);
  objc_storeStrong((id *)&self->mPausedPaths, 0);
  objc_storeStrong((id *)&self->mResourcePathPrefix, 0);
  objc_storeStrong((id *)&self->mDrawableCache, 0);
  objc_storeStrong((id *)&self->mPassphrase, 0);
}

@end

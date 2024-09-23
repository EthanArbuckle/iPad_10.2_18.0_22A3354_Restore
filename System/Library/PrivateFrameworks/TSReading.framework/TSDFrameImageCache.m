@implementation TSDFrameImageCache

+ (id)sharedFrameImageCache
{
  id result;
  id v4;
  void *v5;
  uint64_t v6;

  result = (id)sharedFrameImageCache_instance;
  if (!sharedFrameImageCache_instance)
  {
    objc_sync_enter(a1);
    if (!sharedFrameImageCache_instance)
    {
      v4 = objc_alloc_init((Class)a1);
      __dmb(0xBu);
      sharedFrameImageCache_instance = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDFrameImageCache sharedFrameImageCache]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameImageCache.m"), 104, CFSTR("Couldn't initialize lazy variable %s"), "instance");
      }
    }
    objc_sync_exit(a1);
    return (id)sharedFrameImageCache_instance;
  }
  return result;
}

- (void)didCloseDocument
{
  -[NSMutableArray removeAllObjects](self->mEntries, "removeAllObjects");
}

- (TSDFrameImageCache)init
{
  TSDFrameImageCache *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDFrameImageCache;
  v2 = -[TSDFrameImageCache init](&v5, sel_init);
  if (v2)
  {
    v2->mEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_p_didReceiveMemoryWarning_, *MEMORY[0x24BDF7538], objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TSDFrameImageCache;
  -[TSDFrameImageCache dealloc](&v3, sel_dealloc);
}

- (CGImage)newCachedImageForFrame:(id)a3 size:(CGSize)a4 viewScale:(double)a5 forCALayer:(BOOL)a6 mask:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  double height;
  double width;
  id v14;
  void *v15;
  CGImage *v16;

  v7 = a7;
  v8 = a6;
  height = a4.height;
  width = a4.width;
  objc_sync_enter(self);
  v14 = -[TSDFrameImageCache p_newEntryForFrame:size:viewScale:createIfNeeded:](self, "p_newEntryForFrame:size:viewScale:createIfNeeded:", a3, 0, width, height, a5);
  v15 = v14;
  if (v14)
  {
    v16 = (CGImage *)objc_msgSend(v14, "newImageForCALayer:mask:", v8, v7);

  }
  else
  {
    v16 = 0;
  }
  objc_sync_exit(self);
  return v16;
}

- (CGImage)setCachedImage:(CGImage *)a3 forFrame:(id)a4 size:(CGSize)a5 viewScale:(double)a6 forCALayer:(BOOL)a7 mask:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v16;
  CGImage *v17;

  v8 = a8;
  v9 = a7;
  height = a5.height;
  width = a5.width;
  objc_sync_enter(self);
  v16 = -[TSDFrameImageCache p_newEntryForFrame:size:viewScale:createIfNeeded:](self, "p_newEntryForFrame:size:viewScale:createIfNeeded:", a4, 1, width, height, a6);
  objc_msgSend(v16, "setImage:forCALayer:mask:", a3, v9, v8);
  v17 = (CGImage *)objc_msgSend(v16, "newImageForCALayer:mask:", v9, v8);

  objc_sync_exit(self);
  return v17;
}

- (id)p_newEntryForFrame:(id)a3 size:(CGSize)a4 viewScale:(double)a5 createIfNeeded:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  TSDFrameImageCacheEntry *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  TSDFrameImageCacheEntry *v24;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v12 = -[NSMutableArray count](self->mEntries, "count");
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    while (1)
    {
      v15 = (TSDFrameImageCacheEntry *)-[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", v14);
      v16 = -[TSDFrameImageCacheEntry frameSpec](v15, "frameSpec");
      if (v16 == objc_msgSend(a3, "frameSpec"))
      {
        -[TSDFrameImageCacheEntry assetScale](v15, "assetScale");
        v18 = v17;
        objc_msgSend(a3, "assetScale");
        if (v18 == v19)
        {
          -[TSDFrameImageCacheEntry size](v15, "size");
          if (v21 == width && v20 == height)
          {
            -[TSDFrameImageCacheEntry viewScale](v15, "viewScale");
            if (v23 == a5)
              break;
          }
        }
      }
      if (v13 == ++v14)
        goto LABEL_14;
    }
    v24 = v15;
    -[NSMutableArray removeObjectAtIndex:](self->mEntries, "removeObjectAtIndex:", v14);
    -[NSMutableArray insertObject:atIndex:](self->mEntries, "insertObject:atIndex:", v15, 0);
  }
  else
  {
LABEL_14:
    v15 = 0;
  }
  if (!v15 && v6)
  {
    v15 = objc_alloc_init(TSDFrameImageCacheEntry);
    -[TSDFrameImageCacheEntry setFrameSpec:](v15, "setFrameSpec:", objc_msgSend(a3, "frameSpec"));
    objc_msgSend(a3, "assetScale");
    -[TSDFrameImageCacheEntry setAssetScale:](v15, "setAssetScale:");
    -[TSDFrameImageCacheEntry setSize:](v15, "setSize:", width, height);
    -[TSDFrameImageCacheEntry setViewScale:](v15, "setViewScale:", a5);
    if ((unint64_t)-[NSMutableArray count](self->mEntries, "count") >= 0xA)
    {
      do
        -[NSMutableArray removeLastObject](self->mEntries, "removeLastObject");
      while ((unint64_t)-[NSMutableArray count](self->mEntries, "count") > 9);
    }
    -[NSMutableArray insertObject:atIndex:](self->mEntries, "insertObject:atIndex:", v15, 0);
  }
  return v15;
}

- (void)p_didReceiveMemoryWarning:(id)a3
{
  objc_sync_enter(self);
  -[NSMutableArray removeAllObjects](self->mEntries, "removeAllObjects");
  objc_sync_exit(self);
}

@end

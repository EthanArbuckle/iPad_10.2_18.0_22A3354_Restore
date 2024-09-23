@implementation MTImageStore

+ (id)defaultStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MTImageStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore_onceToken != -1)
    dispatch_once(&defaultStore_onceToken, block);
  return (id)defaultStore_defaultStore;
}

void __28__MTImageStore_defaultStore__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultStore_defaultStore;
  defaultStore_defaultStore = (uint64_t)v1;

}

- (MTImageStore)initWithName:(id)a3 basePath:(id)a4 maxImageDimensionInPixels:(double)a5 maxConcurrentOperations:(unint64_t)a6 alternativeSizeBlock:(id)a7
{
  MTImageStore *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTImageStore;
  v7 = -[IMImageStore initWithName:basePath:maxImageDimensionInPixels:maxConcurrentOperations:alternativeSizeBlock:](&v9, sel_initWithName_basePath_maxImageDimensionInPixels_maxConcurrentOperations_alternativeSizeBlock_, a3, a4, a6, a7, a5);
  if (v7 && (objc_msgSend(MEMORY[0x1E0D7F278], "isPodcastsApp") & 1) == 0)
    -[IMImageStore setDisableMemoryCache:](v7, "setDisableMemoryCache:", 1);
  return v7;
}

+ (double)defaultMaxImageDimensionInPixels
{
  return 3000.0;
}

+ (unint64_t)defaultMaxConcurrentOperations
{
  objc_super v4;

  if (!objc_msgSend(MEMORY[0x1E0D7F278], "isPodcastsApp"))
    return 3;
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTImageStore;
  return (unint64_t)objc_msgSendSuper2(&v4, sel_defaultMaxConcurrentOperations);
}

+ (id)defaultBasePath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D7F238], "defaultImageStoreURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)requireSquareImages:(id)a3
{
  return objc_msgSend(a3, "containsString:", CFSTR("mzstatic.com")) ^ 1;
}

+ (id)defaultPodcastArtworkWithWidth:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "defaultPodcastArtworkWithWidth:", a3);
}

- (id)imageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 modifier:(id)a6
{
  uint64_t v7;
  double height;
  double width;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a6;
  if ((objc_msgSend(MEMORY[0x1E0D7F278], "supportsImageStore") & 1) != 0)
  {
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D7F340]))
    {
      objc_msgSend((id)objc_opt_class(), "defaultPodcastArtworkWithWidth:", width);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)MTImageStore;
      -[IMImageStore imageForKey:size:resizeOptions:modifier:](&v17, sel_imageForKey_size_resizeOptions_modifier_, v11, v7, v12, width, height);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Asset Caching/Legacy/MTImageStore.m", 107, CFSTR("Image store is not supported on audio accessories. Returning early."));

    v15 = 0;
  }

  return v15;
}

- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 modifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v9;
  double height;
  double width;
  id v13;
  id v14;
  void (**v15)(id, void *, id);
  void *v16;
  objc_super v17;

  v9 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a6;
  v15 = (void (**)(id, void *, id))a7;
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D7F340]))
  {
    objc_msgSend((id)objc_opt_class(), "defaultPodcastArtworkWithWidth:", width);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v15[2](v15, v16, v13);

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MTImageStore;
    -[IMImageStore asyncImageForKey:size:resizeOptions:modifier:completionHandler:](&v17, sel_asyncImageForKey_size_resizeOptions_modifier_completionHandler_, v13, v9, v14, v15, width, height);
  }

}

- (void)addImage:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D7F278], "supportsImageStore") & 1) != 0)
  {
    if (-[MTImageStore requireSquareImages:](self, "requireSquareImages:", v7))
    {
      objc_msgSend(v6, "squareImage");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v8;
    }
    v10.receiver = self;
    v10.super_class = (Class)MTImageStore;
    -[IMImageStore addImage:forKey:](&v10, sel_addImage_forKey_, v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Asset Caching/Legacy/MTImageStore.m", 138, CFSTR("Image store is not supported on audio accessories. Returning early."));

  }
}

@end

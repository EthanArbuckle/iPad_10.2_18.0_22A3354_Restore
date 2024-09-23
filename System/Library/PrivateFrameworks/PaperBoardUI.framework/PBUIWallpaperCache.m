@implementation PBUIWallpaperCache

+ (id)wallpaperCache
{
  if (wallpaperCache_once != -1)
    dispatch_once(&wallpaperCache_once, &__block_literal_global_6);
  return (id)wallpaperCache_cache;
}

void __36__PBUIWallpaperCache_wallpaperCache__block_invoke()
{
  void *v0;
  char v1;
  void *v2;
  PBUIWallpaperCache *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEphemeralMultiUser");

  if ((v1 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0D017F8], "pathProviderForSystemContainerForCurrentProcess");
  else
    objc_msgSend(MEMORY[0x1E0D017F8], "pathProviderForCurrentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01938], "optionsWithContainerPathProvider:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PBUIWallpaperCache initWithOptions:]([PBUIWallpaperCache alloc], "initWithOptions:", v2);
  v4 = (void *)wallpaperCache_cache;
  wallpaperCache_cache = (uint64_t)v3;

}

- (PBUIWallpaperCache)initWithOptions:(id)a3
{
  id v4;
  PBUIWallpaperCache *v5;
  uint64_t v6;
  BSUIMappedImageCache *imageCache;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  int v18;
  id v19;
  NSString *path;
  NSString *v21;
  uint64_t v22;
  OS_dispatch_queue *queue;
  PBUIWallpaperCache *v24;
  NSObject *v25;
  id v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PBUIWallpaperCache;
  v5 = -[PBUIWallpaperCache init](&v28, sel_init);
  if (!v5)
    goto LABEL_5;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01930]), "initWithUniqueIdentifier:options:", CFSTR("Wallpaper"), v4);
  imageCache = v5->_imageCache;
  v5->_imageCache = (BSUIMappedImageCache *)v6;

  objc_msgSend(v4, "containerPathProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachesPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("MappedImageCache"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("Wallpaper"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&v5->_imageCachePath, v11);
  objc_msgSend(v4, "containerPathProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cachesPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("com.apple.springboard"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("WallpaperColorBoxesCache"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v18 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v27);
    v19 = v27;

    if (v18)
    {
      path = v5->_path;
      v5->_path = v16;
      v21 = v16;

      v22 = BSDispatchQueueCreateWithQualityOfService();
      queue = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)v22;

LABEL_5:
      v24 = v5;
      goto LABEL_10;
    }
  }
  else
  {
    v19 = 0;
  }
  PBUILogCommon();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[PBUIWallpaperCache initWithOptions:].cold.1((uint64_t)v16, (uint64_t)v19, v25);

  v24 = 0;
LABEL_10:

  return v24;
}

- (id)imageForKey:(id)a3 generatingIfNecessaryWithBlock:(id)a4
{
  return (id)-[BSUIMappedImageCache imageForKey:generatingIfNecessaryWithBlock:](self->_imageCache, "imageForKey:generatingIfNecessaryWithBlock:", a3, a4);
}

- (id)imageForKey:(id)a3 generatingIfNecessaryWithBlock:(id)a4 completion:(id)a5
{
  return (id)-[BSUIMappedImageCache imageForKey:generatingIfNecessaryWithBlock:completion:](self->_imageCache, "imageForKey:generatingIfNecessaryWithBlock:completion:", a3, a4, a5);
}

- (id)imageURLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (!v4)
    goto LABEL_4;
  -[NSURL URLByAppendingPathComponent:](self->_imageCachePath, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("cpbitmap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) == 0)
  {

LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)colorBoxesForKey:(id)a3 generatingIfNeceesaryFromImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *queue;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "deviceClass"))
  {
    v9 = soft_PUIFeatureEnabled(0);

    v10 = 0;
    if ((v9 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1BCCA57C8]();
      objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR(".colorboxes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__1;
      v33 = __Block_byref_object_dispose__1;
      v34 = 0;
      v14 = MEMORY[0x1E0C809B0];
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__PBUIWallpaperCache_colorBoxesForKey_generatingIfNeceesaryFromImage___block_invoke;
      block[3] = &unk_1E6B94F78;
      v28 = &v29;
      v16 = v13;
      v27 = v16;
      dispatch_sync(queue, block);
      if (!v30[5]
        || (objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", getPUIColorBoxesClass(), v30[5], 0), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(getPUIColorBoxesClass(), "colorBoxesForImage:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = self->_queue;
        v23[0] = v14;
        v23[1] = 3221225472;
        v23[2] = __70__PBUIWallpaperCache_colorBoxesForKey_generatingIfNeceesaryFromImage___block_invoke_2;
        v23[3] = &unk_1E6B94BC8;
        v24 = v18;
        v25 = v16;
        v20 = v18;
        dispatch_async(v19, v23);

      }
      v21 = v27;
      v10 = v17;

      _Block_object_dispose(&v29, 8);
      objc_autoreleasePoolPop(v11);
    }
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

void __70__PBUIWallpaperCache_colorBoxesForKey_generatingIfNeceesaryFromImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", *(_QWORD *)(a1 + 32), 1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __70__PBUIWallpaperCache_colorBoxesForKey_generatingIfNeceesaryFromImage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeToFile:atomically:", *(_QWORD *)(a1 + 40), 1);
}

- (void)warmupForKey:(id)a3
{
  -[BSUIMappedImageCache _warmupImageForKey:](self->_imageCache, "_warmupImageForKey:", a3);
}

- (void)removeEverythingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  BSUIMappedImageCache *imageCache;
  NSObject *v10;
  NSString *v11;
  NSObject *queue;
  NSObject *v13;
  NSString *v14;
  _QWORD v15[4];
  NSString *v16;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD block[4];
  id v21;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  dispatch_group_enter(v5);
  dispatch_get_global_queue(9, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PBUIWallpaperCache_removeEverythingWithCompletion___block_invoke;
  block[3] = &unk_1E6B94FA0;
  v21 = v4;
  v8 = v4;
  dispatch_group_notify(v5, v6, block);

  imageCache = self->_imageCache;
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __53__PBUIWallpaperCache_removeEverythingWithCompletion___block_invoke_2;
  v18[3] = &unk_1E6B94728;
  v10 = v5;
  v19 = v10;
  -[BSUIMappedImageCache removeAllImagesWithCompletion:](imageCache, "removeAllImagesWithCompletion:", v18);
  v11 = self->_path;
  queue = self->_queue;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __53__PBUIWallpaperCache_removeEverythingWithCompletion___block_invoke_3;
  v15[3] = &unk_1E6B94BC8;
  v16 = v11;
  v17 = v10;
  v13 = v10;
  v14 = v11;
  dispatch_async(queue, v15);

}

uint64_t __53__PBUIWallpaperCache_removeEverythingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __53__PBUIWallpaperCache_removeEverythingWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__PBUIWallpaperCache_removeEverythingWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", *(_QWORD *)(a1 + 32), 1, 0, 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (BSUIMappedImageCache)imageCache
{
  return self->_imageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_imageCachePath, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithOptions:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[PBUIWallpaperCache initWithOptions:]";
  v5 = 2114;
  v6 = a1;
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_1B71C0000, log, OS_LOG_TYPE_ERROR, "Error in %s: Couldn't create directory at %{public}@ with error %{public}@", (uint8_t *)&v3, 0x20u);
}

@end

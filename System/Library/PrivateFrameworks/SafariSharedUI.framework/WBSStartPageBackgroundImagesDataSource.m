@implementation WBSStartPageBackgroundImagesDataSource

- (WBSStartPageBackgroundImagesDataSource)initWithBuiltInImageURLs:(id)a3 localCachesDirectory:(id)a4
{
  id v6;
  id v7;
  WBSStartPageBackgroundImagesDataSource *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *imageLoadingQueue;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *imageSavingQueue;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *pendingImageThumbnailRequests;
  uint64_t v18;
  NSMutableDictionary *imageCache;
  uint64_t v20;
  NSURL *thumbnailsPath;
  uint64_t v22;
  NSArray *defaultImageURLs;
  NSObject *v24;
  WBSStartPageBackgroundImagesDataSource *v25;
  id v26;
  WBSStartPageBackgroundImagesDataSource *v27;
  _QWORD v29[4];
  WBSStartPageBackgroundImagesDataSource *v30;
  id v31;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)WBSStartPageBackgroundImagesDataSource;
  v8 = -[WBSStartPageBackgroundImagesDataSource init](&v32, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.Safari.WBSStartPageBackgroundImagesDataSource.Loading", v9);
    imageLoadingQueue = v8->_imageLoadingQueue;
    v8->_imageLoadingQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.Safari.WBSStartPageBackgroundImagesDataSource.Saving", v12);
    imageSavingQueue = v8->_imageSavingQueue;
    v8->_imageSavingQueue = (OS_dispatch_queue *)v13;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    pendingImageThumbnailRequests = v8->_pendingImageThumbnailRequests;
    v8->_pendingImageThumbnailRequests = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    imageCache = v8->_imageCache;
    v8->_imageCache = (NSMutableDictionary *)v18;

    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("StartPage/BackgroundThumbnails"), 1);
    v20 = objc_claimAutoreleasedReturnValue();
    thumbnailsPath = v8->_thumbnailsPath;
    v8->_thumbnailsPath = (NSURL *)v20;

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_39);
      v22 = objc_claimAutoreleasedReturnValue();
      defaultImageURLs = v8->_defaultImageURLs;
      v8->_defaultImageURLs = (NSArray *)v22;

    }
    v24 = v8->_imageLoadingQueue;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_2;
    v29[3] = &unk_1E54413C0;
    v25 = v8;
    v30 = v25;
    v31 = v15;
    v26 = v15;
    dispatch_async(v24, v29);
    v27 = v25;

  }
  return v8;
}

uint64_t __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:options:", v6, 0);

  return v7;
}

void __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_2(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  _QWORD block[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[16];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  if (!objc_msgSend(v1, "count"))
  {
    v16 = v1;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/System/Library/Desktop Pictures/"), 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, &v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v28;

    if (v18)
    {
      v5 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v18, "safari_privacyPreservingDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_2_cold_1(v6, buf, v5);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v17;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(v2, "URLByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[WBSImageUtilities safari_CGImageTypes](WBSImageUtilities, "safari_CGImageTypes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "safari_fileType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "containsObject:", v13);

          if (v14)
            objc_msgSend(v20, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    v1 = v20;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_28;
  block[3] = &unk_1E54413C0;
  v22 = *(id *)(a1 + 32);
  v23 = v1;
  v15 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 40), "safari_mapObjectsUsingBlock:", &__block_literal_global_31);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[5];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_3;
  v10[3] = &unk_1E5446278;
  v11 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("WBSStartPageBackgroundImagesDataSourceUpdatedImages"), *(_QWORD *)(a1 + 32));

}

WBSStartPageBackgroundImageDescription *__88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_2_29(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  WBSStartPageBackgroundImageDescription *v5;
  id v6;
  WBSStartPageBackgroundImageDescription *v7;

  v2 = a2;
  objc_msgSend(v2, "URLByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [WBSStartPageBackgroundImageDescription alloc];
  v6 = objc_retainAutorelease(v4);
  v7 = -[WBSStartPageBackgroundImageDescription initWithURL:luminance:](v5, "initWithURL:luminance:", v2, strtod_l((const char *)objc_msgSend(v6, "UTF8String"), 0, 0) / 1000.0);

  return v7;
}

void __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "imageThumbnailWithItemIndex:completion:", objc_msgSend(v6, "integerValue"), v5);

}

- (WBSStartPageBackgroundImagesDataSource)initWithBundle:(id)a3 localCachesDirectory:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  WBSStartPageBackgroundImagesDataSource *v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URLsForResourcesWithExtension:subdirectory:", CFSTR("heic"), CFSTR("Background Images"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = MEMORY[0x1E0C9AA60];
  if (v8)
    v11 = (void *)v8;
  else
    v11 = (void *)MEMORY[0x1E0C9AA60];
  v12 = v11;

  objc_msgSend(v6, "URLsForResourcesWithExtension:subdirectory:", CFSTR("png"), CFSTR("Background Images"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = v13;
  else
    v15 = v10;
  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[WBSStartPageBackgroundImagesDataSource initWithBuiltInImageURLs:localCachesDirectory:](self, "initWithBuiltInImageURLs:localCachesDirectory:", v16, v7);
  return v17;
}

- (int64_t)itemCount
{
  int64_t result;

  result = -[NSArray count](self->_imageURLsWithLuminance, "count");
  if (!result)
    return -[NSArray count](self->_defaultImageURLs, "count");
  return result;
}

- (void)imageThumbnailWithItemIndex:(int64_t)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSMutableDictionary *imageCache;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *pendingImageThumbnailRequests;
  void *v13;
  void *v14;
  void *v15;
  NSObject *imageLoadingQueue;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  WBSStartPageBackgroundImagesDataSource *v21;
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  int64_t v24;

  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (self->_imageURLsWithLuminance)
  {
    imageCache = self->_imageCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](imageCache, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, v10, 1);
    }
    else
    {
      -[WBSStartPageBackgroundImagesDataSource _thumbnailURLWithItemIndex:](self, "_thumbnailURLWithItemIndex:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSStartPageBackgroundImagesDataSource imageURLAndLuminanceWithItemIndex:](self, "imageURLAndLuminanceWithItemIndex:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      imageLoadingQueue = self->_imageLoadingQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __81__WBSStartPageBackgroundImagesDataSource_imageThumbnailWithItemIndex_completion___block_invoke;
      block[3] = &unk_1E54462C8;
      v20 = v15;
      v21 = self;
      v22 = v14;
      v24 = a3;
      v23 = v7;
      v17 = v14;
      v18 = v15;
      dispatch_async(imageLoadingQueue, block);

    }
  }
  else
  {
    v10 = (void *)objc_msgSend(v6, "copy");
    v11 = (void *)MEMORY[0x1A85D45E4]();
    pendingImageThumbnailRequests = self->_pendingImageThumbnailRequests;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](pendingImageThumbnailRequests, "setObject:forKeyedSubscript:", v11, v13);

  }
}

void __81__WBSStartPageBackgroundImagesDataSource_imageThumbnailWithItemIndex_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFURL *v7;
  CGImageSource *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "URLByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("thumbnails"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("heic"));
  v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  v8 = CGImageSourceCreateWithURL(v7, 0);
  objc_msgSend(MEMORY[0x1E0D8A0C0], "imageByAdoptingCGImage:", CGImageSourceCreateImageAtIndex(v8, 0, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (v8)
      CFRelease(v8);
    v8 = CGImageSourceCreateWithURL(*(CFURLRef *)(a1 + 32), 0);
    objc_msgSend(*(id *)(a1 + 40), "_createThumbnail:imageSource:", *(_QWORD *)(a1 + 48), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  CFRelease(v8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __81__WBSStartPageBackgroundImagesDataSource_imageThumbnailWithItemIndex_completion___block_invoke_2;
  v12[3] = &unk_1E54462A0;
  v10 = *(void **)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 64);
  v12[1] = 3221225472;
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = v9;
  v14 = v10;
  v11 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __81__WBSStartPageBackgroundImagesDataSource_imageThumbnailWithItemIndex_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)imageURLAndLuminanceWithItemIndex:(int64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_imageURLsWithLuminance, "objectAtIndexedSubscript:", a3);
}

- (id)_thumbnailURLWithItemIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[NSArray objectAtIndexedSubscript:](self->_imageURLsWithLuminance, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSURL URLByAppendingPathComponent:isDirectory:](self->_thumbnailsPath, "URLByAppendingPathComponent:isDirectory:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByDeletingPathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathExtension:", CFSTR("heic"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_createThumbnail:(id)a3 imageSource:(CGImageSource *)a4
{
  const __CFURL *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFDictionary *v18;
  void *v19;
  NSObject *imageSavingQueue;
  id v21;
  void *v22;
  _QWORD block[4];
  const __CFURL *v25;
  id v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = (const __CFURL *)a3;
  v7 = CGImageSourceCreateWithURL(v6, 0);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D8A0C0], "imageByAdoptingCGImage:", CGImageSourceCreateImageAtIndex(v7, 0, 0));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    CFRelease(v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerForKey:", CFSTR("ShowBackgroundImageThumbnailSize"));

    v12 = 1024;
    if (v11 < 1024)
      v12 = v11;
    if (v12 <= 128)
      v12 = 128;
    if (v11)
      v13 = v12;
    else
      v13 = 512;
    v14 = *MEMORY[0x1E0CBD180];
    v15 = MEMORY[0x1E0C9AAB0];
    v28[0] = MEMORY[0x1E0C9AAB0];
    v16 = *MEMORY[0x1E0CBD2A0];
    v27[0] = v14;
    v27[1] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = *MEMORY[0x1E0CBD190];
    v28[1] = v17;
    v28[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D8A0C0], "imageByAdoptingCGImage:", CGImageSourceCreateThumbnailAtIndex(a4, 0, v18));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    imageSavingQueue = self->_imageSavingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__WBSStartPageBackgroundImagesDataSource__createThumbnail_imageSource___block_invoke;
    block[3] = &unk_1E54413C0;
    v25 = v6;
    v21 = v19;
    v26 = v21;
    dispatch_async(imageSavingQueue, block);
    v22 = v26;
    v9 = v21;

  }
  return v9;
}

BOOL __71__WBSStartPageBackgroundImagesDataSource__createThumbnail_imageSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "safari_ensureDirectoryExists:", v3);

  return +[WBSImageUtilities saveCGImage:toFile:options:](WBSImageUtilities, "saveCGImage:toFile:options:", objc_msgSend(*(id *)(a1 + 40), "CGImage"), *(_QWORD *)(a1 + 32), 0);
}

- (int64_t)indexOfBackgroundImageWithName:(id)a3
{
  id v4;
  NSArray *imageURLsWithLuminance;
  _QWORD *v6;
  uint64_t v7;
  int64_t v8;
  NSArray *defaultImageURLs;
  _QWORD v11[5];
  _QWORD v12[5];

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    imageURLsWithLuminance = self->_imageURLsWithLuminance;
    if (imageURLsWithLuminance)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __73__WBSStartPageBackgroundImagesDataSource_indexOfBackgroundImageWithName___block_invoke;
      v12[3] = &unk_1E54462F0;
      v6 = v12;
      v12[4] = v4;
      v7 = -[NSArray indexOfObjectPassingTest:](imageURLsWithLuminance, "indexOfObjectPassingTest:", v12);
    }
    else
    {
      defaultImageURLs = self->_defaultImageURLs;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __73__WBSStartPageBackgroundImagesDataSource_indexOfBackgroundImageWithName___block_invoke_2;
      v11[3] = &unk_1E5446318;
      v6 = v11;
      v11[4] = v4;
      v7 = -[NSArray indexOfObjectPassingTest:](defaultImageURLs, "indexOfObjectPassingTest:", v11);
    }
    v8 = v7;

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

uint64_t __73__WBSStartPageBackgroundImagesDataSource_indexOfBackgroundImageWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  return v7;
}

uint64_t __73__WBSStartPageBackgroundImagesDataSource_indexOfBackgroundImageWithName___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailsPath, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_pendingImageThumbnailRequests, 0);
  objc_storeStrong((id *)&self->_imageURLsWithLuminance, 0);
  objc_storeStrong((id *)&self->_defaultImageURLs, 0);
  objc_storeStrong((id *)&self->_imageSavingQueue, 0);
  objc_storeStrong((id *)&self->_imageLoadingQueue, 0);
}

void __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_2_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "Unable to read background images from primary or fallback path: %{public}@", buf, 0xCu);

}

@end

@implementation TIImageCacheClient

- (TIImageCacheClient)initWithLocalAccess:(BOOL)a3
{
  _BOOL4 v3;
  TIImageCacheClient *v4;
  uint64_t v5;
  NSString *path;
  uint64_t v7;
  NSString *imagePath;
  NSCache *v9;
  NSCache *cache;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  id v14;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TIImageCacheClient;
  v4 = -[TIImageCacheClient init](&v16, sel_init);
  if (v4)
  {
    TIImageCachePath();
    v5 = objc_claimAutoreleasedReturnValue();
    path = v4->_path;
    v4->_path = (NSString *)v5;

    TIImageCacheImagesPath();
    v7 = objc_claimAutoreleasedReturnValue();
    imagePath = v4->_imagePath;
    v4->_imagePath = (NSString *)v7;

    v4->_hasLocalAccess = v3;
    v4->_remoteQueryCount = 0;
    v4->_shouldIdleWhenDone = 0;
    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v4->_cache;
    v4->_cache = v9;

    -[NSCache setName:](v4->_cache, "setName:", CFSTR("com.apple.TIImageCache"));
    -[NSCache setCountLimit:](v4->_cache, "setCountLimit:", 40);
    if (v4->_hasLocalAccess)
    {
      -[NSString stringByDeletingLastPathComponent](v4->_path, "stringByDeletingLastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CheckSandboxAccess(v11);

      if (v12)
      {
        if (TIImageCacheVersion_onceToken != -1)
          dispatch_once(&TIImageCacheVersion_onceToken, &__block_literal_global_16_10840);
        v13 = TIImageCacheVersion_buildVersion;
        if (-[TIImageCacheClient _cacheVersion](v4, "_cacheVersion") != (_DWORD)v13)
          -[TIImageCacheClient purge](v4, "purge");
        if (access(-[NSString fileSystemRepresentation](v4->_path, "fileSystemRepresentation"), 4))
        {
          -[TIImageCacheClient imagePath](v4, "imagePath");
          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          mkpath_np((const char *)objc_msgSend(v14, "fileSystemRepresentation"), 0x1EDu);

          -[TIImageCacheClient _setCacheVersion:](v4, "_setCacheVersion:", v13);
        }
      }
    }
    if (v3)
      v4->_hasLocalAccess = CheckSandboxAccess(v4->_imagePath);
  }
  return v4;
}

- (int)_cacheVersion
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIImageCacheClient _versionPath](self, "_versionPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (!v5)
    return -1;
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[TIImageCacheClient _versionPath](self, "_versionPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "stringWithContentsOfFile:encoding:error:", v7, 4, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;

  if (v9)
    v10 = -1;
  else
    v10 = objc_msgSend(v8, "intValue");

  return v10;
}

- (id)_versionPath
{
  NSString *versionPath;
  NSString *v4;
  NSString *v5;

  versionPath = self->_versionPath;
  if (!versionPath)
  {
    -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", CFSTR("version"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_versionPath;
    self->_versionPath = v4;

    versionPath = self->_versionPath;
  }
  return versionPath;
}

- (CGImage)copyImageForKey:(id)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CGImage *v10;
  CGImage *v11;
  void *v12;
  void *v13;
  char *v14;
  char *v15;
  _DWORD *v16;
  CGDataProvider *v17;
  unsigned int v18;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v20;
  size_t v21;
  size_t v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  double v26;
  CGColorSpace *v27;
  CGColor *v28;
  size_t v29;
  CGBitmapInfo v30;
  size_t size[2];
  size_t bytesPerRow[2];
  uint64_t v34;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TIImageCacheClient imagePath](self, "imagePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    TIImageNameForItem(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSCache objectForKey:](self->_cache, "objectForKey:", v9);
    if (v10)
    {
      v11 = CGImageRetain(v10);
LABEL_35:

      goto LABEL_36;
    }
    v34 = 0;
    *(_OWORD *)size = 0u;
    *(_OWORD *)bytesPerRow = 0u;
    -[TIImageCacheClient imagePath](self, "imagePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[TIImageCacheClient openAndMmap:withInfo:](self, "openAndMmap:withInfo:", v13, size);
    if (!v14)
    {
      v11 = 0;
      goto LABEL_34;
    }
    v15 = v14;
    if (-[TIImageCacheClient lockOnRead](self, "lockOnRead"))
      mlock(v15 - 48, size[0]);
    size[0] -= 48;
    v16 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    *v16 = 48;
    v17 = CGDataProviderCreateWithData(v16, v15, size[0], (CGDataProviderReleaseDataCallback)release_munmap);
    v18 = v34;
    if (v34 < 3u)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
    }
    else
    {
      if (v34 - 3 >= 2)
      {
        if (v34 == 5)
        {
          v11 = CGImageMaskCreate(size[1], bytesPerRow[0], 8uLL, 8uLL, bytesPerRow[1], v17, create_image_with_memory_decode, 0);
          if (!v11)
          {
            CGDataProviderRelease(v17);
            goto LABEL_34;
          }
          if (v34 == 5)
          {
            LOBYTE(v23) = BYTE1(v34);
            v25 = (double)v23 / 255.0;
            LOBYTE(v24) = BYTE2(v34);
            v26 = (double)v24 / 255.0;
            components[0] = v25;
            components[1] = v26;
            LOBYTE(v26) = BYTE4(v34);
            LOBYTE(v25) = BYTE3(v34);
            components[2] = (double)*(unint64_t *)&v25 / 255.0;
            components[3] = (double)*(unint64_t *)&v26 / 255.0;
            v27 = CGColorSpaceCreateDeviceRGB();
            v28 = CGColorCreate(v27, components);
            CGImageSetProperty();
            CGColorSpaceRelease(v27);
            CGColorRelease(v28);
          }
          CGDataProviderRelease(v17);
          goto LABEL_33;
        }
        v20 = 0;
LABEL_14:
        if (v18 > 5)
        {
          v21 = 0;
        }
        else
        {
          if (v18 == 2)
          {
            v21 = 5;
            goto LABEL_30;
          }
          v21 = 8;
        }
        if (v18 > 5)
        {
          v22 = 0;
          v30 = 0;
          v29 = bytesPerRow[1];
LABEL_32:
          v11 = CGImageCreate(size[1], bytesPerRow[0], v21, v22, v29, v20, v30, v17, 0, 0, kCGRenderingIntentDefault);
          CGColorSpaceRelease(v20);
          CGDataProviderRelease(v17);
          if (v11)
LABEL_33:
            -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v11, v9);
LABEL_34:

          goto LABEL_35;
        }
        if (((1 << v18) & 3) != 0)
        {
          v22 = 32;
          goto LABEL_31;
        }
        if (((1 << v18) & 0xC) == 0)
        {
          v22 = 8;
LABEL_31:
          v29 = bytesPerRow[1];
          v30 = dword_18C5E7738[v18];
          goto LABEL_32;
        }
LABEL_30:
        v22 = 16;
        goto LABEL_31;
      }
      DeviceRGB = CGColorSpaceCreateDeviceGray();
    }
    v20 = DeviceRGB;
    v18 = v34;
    goto LABEL_14;
  }
  v11 = 0;
LABEL_36:

  return v11;
}

- (id)imagePath
{
  return self->_imagePath;
}

- (void)openAndMmap:(id)a3 withInfo:(_img *)a4
{
  const char *v6;
  _BOOL4 hasLocalAccess;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  unsigned int *v12;
  unsigned int *v13;
  unint64_t st_size;
  uint64_t v15;
  __int128 v16;
  void *v17;
  NSObject *v19;
  void *v20;
  uint64_t AlignedBytesPerRow;
  uint64_t v22;
  unint64_t v23;
  unsigned int v24;
  unint64_t var2;
  uint64_t v26;
  uInt v27;
  unint64_t v28;
  void *v29;
  int *v30;
  char *v31;
  uLong v32;
  uLong v33;
  uint8_t buf[4];
  void *v35;
  stat v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  hasLocalAccess = self->_hasLocalAccess;
  v8 = open(v6, 256);
  if (v8 < 0)
    return 0;
  v9 = v8;
  memset(&v36, 0, sizeof(v36));
  if (fstat(v8, &v36) < 0)
    goto LABEL_14;
  if (v36.st_nlink >= 2u)
  {
    TIImageCacheOSLogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Cannot open '%s', its been hard-linked"), "open_and_mmap", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v11;
LABEL_32:
      _os_log_debug_impl(&dword_18C56E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v12 = (unsigned int *)mmap(0, v36.st_size, 1, 1, v9, 0);
  if (v12 == (unsigned int *)-1)
  {
    TIImageCacheOSLogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      v30 = __error();
      v31 = strerror(*v30);
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%s Mapping '%s' failed: '%s' (%d)"), "open_and_mmap", v6, v31, *__error());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v11;
      goto LABEL_32;
    }
LABEL_13:

LABEL_14:
    close(v9);
    return 0;
  }
  v13 = v12;
  close(v9);
  if (v13)
  {
    st_size = v36.st_size;
    if (v36.st_size <= 0x2FuLL)
    {
      TIImageCacheOSLogFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        goto LABEL_36;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Mapping '%s' failed: file too short"), "open_and_mmap_img", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36.st_dev = 138412290;
      *(_QWORD *)&v36.st_mode = v20;
    }
    else if (*v13 == 1414089027)
    {
      if (v13[1] == 1)
      {
        a4->var0 = v13[2];
        v15 = *(_QWORD *)(v13 + 3);
        *(_QWORD *)&v16 = v15;
        *((_QWORD *)&v16 + 1) = HIDWORD(v15);
        *(_OWORD *)&a4->var1 = v16;
        a4->var3 = v13[5];
        a4->var4 = *((_BYTE *)v13 + 28);
        a4->var5[0] = *((_BYTE *)v13 + 29);
        a4->var5[1] = *((_BYTE *)v13 + 30);
        a4->var5[2] = *((_BYTE *)v13 + 31);
        a4->var5[3] = *((_BYTE *)v13 + 32);
        AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
        v22 = AlignedBytesPerRow;
        if (a4->var3 == AlignedBytesPerRow)
        {
          v23 = (*MEMORY[0x1E0C85AD8] + a4->var2 * AlignedBytesPerRow + 47) & -*MEMORY[0x1E0C85AD8];
          if (a4->var0 == v23)
          {
            if (v23 != st_size)
              goto LABEL_37;
            v24 = crc32(0, 0, 0);
            var2 = a4->var2;
            v26 = CGBitmapGetAlignedBytesPerRow();
            v27 = v26 * var2;
            v28 = v26 * var2 + 48;
            if (v28 <= st_size)
            {
              v32 = v24;
              v17 = v13 + 12;
              v33 = crc32(v32, (const Bytef *)v13 + 48, v27);
              if (v13[6] == (_DWORD)v33)
                return v17;
              TIImageCacheOSLogFacility();
              v19 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                goto LABEL_36;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CRC did not match for cached image at path: %s (%u, %u)"), "open_and_mmap_img", v6, v33, v13[6]);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v36.st_dev = 138412290;
              *(_QWORD *)&v36.st_mode = v20;
              goto LABEL_35;
            }
            TIImageCacheOSLogFacility();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Actual file size is shorter than declared for cached image at path: %s (%lu, %lu)"), "open_and_mmap_img", v6, st_size, v28);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v36.st_dev = 138412290;
              *(_QWORD *)&v36.st_mode = v20;
              goto LABEL_35;
            }
          }
          else
          {
            TIImageCacheOSLogFacility();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Mapping '%s' failed: wrong size %zu (expected %zu)"), "read_img_header", v6, a4->var0, v23);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v36.st_dev = 138412290;
              *(_QWORD *)&v36.st_mode = v20;
              goto LABEL_35;
            }
          }
        }
        else
        {
          TIImageCacheOSLogFacility();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Mapping '%s' failed: wrong bpr %zu (expected %zu)"), "read_img_header", v6, a4->var3, v22);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v36.st_dev = 138412290;
            *(_QWORD *)&v36.st_mode = v20;
            goto LABEL_35;
          }
        }
LABEL_36:

LABEL_37:
        munmap(v13, st_size);
        if (hasLocalAccess)
          unlink(v6);
        return 0;
      }
      TIImageCacheOSLogFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        goto LABEL_36;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Mapping '%s' failed: wrong version %d (expected %d)"), "read_img_header", v6, v13[1], 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36.st_dev = 138412290;
      *(_QWORD *)&v36.st_mode = v20;
    }
    else
    {
      TIImageCacheOSLogFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        goto LABEL_36;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Mapping '%s' failed: wrong magic number %#08x (expected %#08x)"), "read_img_header", v6, *v13, 1414089027);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36.st_dev = 138412290;
      *(_QWORD *)&v36.st_mode = v20;
    }
LABEL_35:
    _os_log_debug_impl(&dword_18C56E000, v19, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v36, 0xCu);

    goto LABEL_36;
  }
  return 0;
}

- (BOOL)lockOnRead
{
  return self->_lockOnRead;
}

- (void)setCacheItemLimit:(unint64_t)a3
{
  -[NSCache setCountLimit:](self->_cache, "setCountLimit:", a3);
}

- (void)idleAfter:(double)a3
{
  OS_dispatch_queue *requestQueue;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[5];

  requestQueue = self->_requestQueue;
  if (requestQueue)
  {
    self->_shouldIdleWhenDone = 1;
    if (a3 <= 0.0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __32__TIImageCacheClient_idleAfter___block_invoke_2;
      v7[3] = &unk_1E243B440;
      v7[4] = self;
      TIDispatchSync(requestQueue, v7);
    }
    else
    {
      v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      v6 = self->_requestQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __32__TIImageCacheClient_idleAfter___block_invoke;
      block[3] = &unk_1E243B440;
      block[4] = self;
      dispatch_after(v5, v6, block);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TIImageCacheClient;
  -[TIImageCacheClient dealloc](&v3, sel_dealloc);
}

- (unint64_t)cacheItemLimit
{
  return -[NSCache countLimit](self->_cache, "countLimit");
}

- (BOOL)imageExistsForKey:(id)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  -[TIImageCacheClient imagePath](self, "imagePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    TIImageNameForItem(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIImageCacheClient imagePath](self, "imagePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v11);
    v13 = access((const char *)objc_msgSend(v12, "fileSystemRepresentation"), 4) == 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (OS_dispatch_queue)storeImageQueue
{
  OS_dispatch_queue *storeImageQueue;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  storeImageQueue = self->_storeImageQueue;
  if (!storeImageQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.TextInput.local-image-cache-request", v4);
    v6 = self->_storeImageQueue;
    self->_storeImageQueue = v5;

    storeImageQueue = self->_storeImageQueue;
  }
  return storeImageQueue;
}

- (void)_localStoreImageForKey:(id)a3 inGroup:(id)a4 withItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "scale");
  if (v11 == 0.0)
    goto LABEL_4;
  -[TIImageCacheClient imagePath](self, "imagePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_4;
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  -[TIImageCacheClient _imgForItem:](self, "_imgForItem:", v10);
  objc_msgSend(v10, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length") + 48;

  if (v14)
  {
LABEL_4:
    objc_msgSend(v10, "_callDataReleaseHandler");
  }
  else
  {
    -[TIImageCacheClient storeImageQueue](self, "storeImageQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__TIImageCacheClient__localStoreImageForKey_inGroup_withItem___block_invoke;
    v16[3] = &unk_1E243B3F0;
    v16[4] = self;
    v17 = v10;
    v20 = v23;
    v21 = v24;
    v22 = v25;
    v18 = v8;
    v19 = v9;
    TIDispatchAsync(v15, v16);

  }
}

- (void)_remoteStoreImageForKey:(id)a3 inGroup:(id)a4 withItem:(id)a5
{
  id v8;
  id v9;
  double v10;
  OS_dispatch_queue *requestQueue;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "scale");
  if (v10 == 0.0)
  {
    objc_msgSend(v9, "_callDataReleaseHandler");
  }
  else
  {
    -[TIImageCacheClient _createConnectionIfNecessary](self, "_createConnectionIfNecessary");
    requestQueue = self->_requestQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__TIImageCacheClient__remoteStoreImageForKey_inGroup_withItem___block_invoke;
    v13[3] = &unk_1E243B418;
    v13[4] = self;
    v14 = v9;
    v15 = v12;
    v16 = v8;
    TIDispatchSync(requestQueue, v13);

  }
}

- (_img)_imgForItem:(SEL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  int v12;
  CGColor *v13;
  CGColor *v14;
  size_t NumberOfComponents;
  const CGFloat *Components;
  unsigned __int8 *var5;
  double v18;
  _img *result;
  id v20;

  v20 = a4;
  *(_QWORD *)&retstr->var4 = 0;
  objc_msgSend(v20, "size");
  v6 = v5;
  objc_msgSend(v20, "scale");
  retstr->var1 = vcvtpd_u64_f64(v6 * v7);
  objc_msgSend(v20, "size");
  v9 = v8;
  objc_msgSend(v20, "scale");
  v11 = vcvtpd_u64_f64(v9 * v10);
  retstr->var2 = v11;
  v12 = objc_msgSend(v20, "format");
  retstr->var4 = v12;
  retstr->var3 = CGBitmapGetAlignedBytesPerRow();
  objc_msgSend(v20, "format");
  retstr->var0 = (*MEMORY[0x1E0C85AD8] + CGBitmapGetAlignedBytesPerRow() * v11 + 47) & -*MEMORY[0x1E0C85AD8];
  v13 = (CGColor *)objc_msgSend(v20, "formatColor");
  if (v12 == 5)
  {
    v14 = v13;
    if (v13)
    {
      NumberOfComponents = CGColorGetNumberOfComponents(v13);
      Components = CGColorGetComponents(v14);
      if (NumberOfComponents)
      {
        var5 = retstr->var5;
        do
        {
          v18 = *Components++;
          *var5++ = (int)(v18 * 255.0);
          --NumberOfComponents;
        }
        while (NumberOfComponents);
      }
    }
  }

  return result;
}

- (void)storeImageDataForKey:(id)a3 inGroup:(id)a4 item:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    if (self->_hasLocalAccess)
      -[TIImageCacheClient _localStoreImageForKey:inGroup:withItem:](self, "_localStoreImageForKey:inGroup:withItem:", v10, v8, v9);
    else
      -[TIImageCacheClient _remoteStoreImageForKey:inGroup:withItem:](self, "_remoteStoreImageForKey:inGroup:withItem:", v10, v8, v9);
  }

}

- (void)_createConnectionIfNecessary
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *requestQueue;
  OS_dispatch_queue *v6;
  _QWORD v7[5];

  if (!self->_requestQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.TextInput.image-cache-request", v3);
    requestQueue = self->_requestQueue;
    self->_requestQueue = v4;

  }
  if (!self->_connection)
  {
    v6 = self->_requestQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__TIImageCacheClient__createConnectionIfNecessary__block_invoke;
    v7[3] = &unk_1E243B440;
    v7[4] = self;
    TIDispatchSync(v6, v7);
  }
}

- (void)setIdleWhenDone
{
  OS_dispatch_queue *requestQueue;
  uint64_t v4;
  _QWORD v5[5];

  requestQueue = self->_requestQueue;
  if (requestQueue)
  {
    v4 = MEMORY[0x1E0C809B0];
    self->_shouldIdleWhenDone = 1;
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __37__TIImageCacheClient_setIdleWhenDone__block_invoke;
    v5[3] = &unk_1E243B440;
    v5[4] = self;
    TIDispatchAsync(requestQueue, v5);
  }
}

- (void)_idleIfNecessary:(BOOL)a3
{
  BOOL v4;
  NSXPCConnection *connection;

  if (self->_shouldIdleWhenDone)
  {
    if (self->_remoteQueryCount)
      v4 = !a3;
    else
      v4 = 0;
    if (!v4)
    {
      -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
      -[NSXPCConnection invalidate](self->_connection, "invalidate");
      connection = self->_connection;
      self->_connection = 0;

      self->_shouldIdleWhenDone = 0;
      self->_remoteQueryCount = 0;
    }
  }
}

- (void)removeImagesInGroups:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *serialQueueRemoveImagesDefault;
  NSObject *v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *serialQueueRemoveImagesBackground;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  OS_dispatch_queue *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  TIImageCacheClient *v26;
  id v27;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (!self->_serialQueueRemoveImagesDefault)
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (OS_dispatch_queue *)dispatch_queue_create("SerialQueueRemoveImagesDefault", v8);
      serialQueueRemoveImagesDefault = self->_serialQueueRemoveImagesDefault;
      self->_serialQueueRemoveImagesDefault = v9;

    }
    if (!self->_serialQueueRemoveImagesBackground)
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (OS_dispatch_queue *)dispatch_queue_create("SerialQueueRemoveImagesBackground", v11);
      serialQueueRemoveImagesBackground = self->_serialQueueRemoveImagesBackground;
      self->_serialQueueRemoveImagesBackground = v12;

    }
    -[TIImageCacheClient imagePath](self, "imagePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentsOfDirectoryAtPath:error:", v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(v7, "copy");
    v18 = self->_serialQueueRemoveImagesBackground;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __54__TIImageCacheClient_removeImagesInGroups_completion___block_invoke;
    v22[3] = &unk_1E243B4E0;
    v23 = v6;
    v24 = v16;
    v25 = v14;
    v26 = self;
    v27 = v17;
    v19 = v17;
    v20 = v14;
    v21 = v16;
    TIDispatchAsync(v18, v22);

  }
}

- (unint64_t)imageCount
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIImageCacheClient imagePath](self, "imagePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subpathsAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (void)purge
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", self->_path, 0);

}

- (void)purgeMemoryCache
{
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
}

- (void)_setCacheVersion:(int)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIImageCacheClient _versionPath](self, "_versionPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeToFile:atomically:encoding:error:", v5, 1, 4, 0);

}

- (void)setLockOnRead:(BOOL)a3
{
  self->_lockOnRead = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_storeImageQueue, 0);
  objc_storeStrong((id *)&self->_serialQueueRemoveImagesDefault, 0);
  objc_storeStrong((id *)&self->_serialQueueRemoveImagesBackground, 0);
  objc_storeStrong((id *)&self->_versionPath, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

void __54__TIImageCacheClient_removeImagesInGroups_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  id obj;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *group;
  _QWORD block[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __54__TIImageCacheClient_removeImagesInGroups_completion___block_invoke_2;
  v41[3] = &unk_1E243B490;
  v27 = v2;
  v42 = v27;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v41);
  group = dispatch_group_create();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = *(id *)(a1 + 40);
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v38;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(obj);
        v29 = v4;
        v5 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v4);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v6 = v27;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v34 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v5, "lastPathComponent");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "hasPrefix:", v11);

              if (v13)
              {
                if (objc_msgSend(v5, "isAbsolutePath"))
                {
                  v14 = v5;
                }
                else
                {
                  objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", v5);
                  v14 = (id)objc_claimAutoreleasedReturnValue();
                }
                v15 = objc_retainAutorelease(v14);
                unlink((const char *)objc_msgSend(v15, "fileSystemRepresentation"));
                objc_msgSend(v5, "lastPathComponent");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "substringFromIndex:", objc_msgSend(v11, "length"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                v18 = (void *)MEMORY[0x1E0CB37E8];
                v19 = objc_retainAutorelease(v17);
                objc_msgSend(v18, "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(v19, "UTF8String"), 0, 10));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = *(_QWORD *)(a1 + 56);
                v22 = *(NSObject **)(v21 + 64);
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __54__TIImageCacheClient_removeImagesInGroups_completion___block_invoke_3;
                block[3] = &unk_1E243B4B8;
                block[4] = v21;
                v32 = v20;
                v23 = v20;
                dispatch_group_async(group, v22, block);

              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          }
          while (v8);
        }

        v4 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v28);
  }

  v24 = *(void **)(a1 + 64);
  if (v24)
    dispatch_group_notify(group, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 56) + 56), v24);

}

void __54__TIImageCacheClient_removeImagesInGroups_completion___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  char *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = (char *)malloc_type_malloc(0x32uLL, 0x2E3B7F1EuLL);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, snprintf(v5, 0x32uLL, "%lu", objc_msgSend(v7, "hash")), 1, 1);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    *a3 = 0;

  }
}

uint64_t __54__TIImageCacheClient_removeImagesInGroups_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

uint64_t __32__TIImageCacheClient_idleAfter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_idleIfNecessary:", 1);
}

uint64_t __32__TIImageCacheClient_idleAfter___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_idleIfNecessary:", 1);
}

uint64_t __37__TIImageCacheClient_setIdleWhenDone__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_idleIfNecessary:", 0);
}

void __50__TIImageCacheClient__createConnectionIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.TextInput.image-cache-server"), 4096);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE05A9C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setRemoteObjectInterface:", v5);

  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __50__TIImageCacheClient__createConnectionIfNecessary__block_invoke_2;
  v9 = &unk_1E243B468;
  objc_copyWeak(&v10, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setInvalidationHandler:", &v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "_setQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), v6, v7, v8, v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "resume");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __50__TIImageCacheClient__createConnectionIfNecessary__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[10];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __50__TIImageCacheClient__createConnectionIfNecessary__block_invoke_3;
    v4[3] = &unk_1E243B440;
    v5 = WeakRetained;
    TIDispatchAsync(v3, v4);

  }
}

uint64_t __50__TIImageCacheClient__createConnectionIfNecessary__block_invoke_3(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_idleIfNecessary:", 0);
}

uint64_t __63__TIImageCacheClient__remoteStoreImageForKey_inGroup_withItem___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheItem:key:group:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  return objc_msgSend(*(id *)(a1 + 40), "_callDataReleaseHandler");
}

void __62__TIImageCacheClient__localStoreImageForKey_inGroup_withItem___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  const char *v4;
  char *v5;
  std::__fs::filesystem::path *v6;
  size_t v7;
  int v8;
  int v9;
  _DWORD *v10;
  _DWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int *v18;
  char *v19;
  void *v20;
  NSObject *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  uLong v26;
  id v27;
  int v28;
  void *v29;
  id v30;
  const std::__fs::filesystem::path *v31;
  std::error_code *v32;
  int v33;
  NSObject *v34;
  void *v35;
  int *v36;
  char *v37;
  void *v38;
  void *v39;
  int *v40;
  char *v41;
  void *v42;
  void *v43;
  int *v44;
  char *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int *v51;
  char *v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "imagePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("tmp.XXXXXXXX"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");

  if (!v4)
    goto LABEL_21;
  v5 = strdup(v4);
  if (!v5)
    goto LABEL_21;
  v6 = (std::__fs::filesystem::path *)v5;
  v7 = *(_QWORD *)(a1 + 64);
  v8 = mkstemp(v5);
  if (v8 < 0)
  {
    TIImageCacheOSLogFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      v36 = __error();
      v37 = strerror(*v36);
      objc_msgSend(v35, "stringWithFormat:", CFSTR("%s Making temp file at '%s' failed: '%s' (%d)"), "mkstemp_and_mmap", v6, v37, *__error());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v55 = v38;
      _os_log_debug_impl(&dword_18C56E000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    goto LABEL_20;
  }
  v9 = v8;
  if (fchmod(v8, 0x180u) < 0)
  {
    TIImageCacheOSLogFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
LABEL_18:

LABEL_19:
      close(v9);
      unlink((const char *)v6);
      goto LABEL_20;
    }
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = __error();
    v19 = strerror(*v18);
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%s Setting '%s' mode failed: '%s' (%d)"), "mkstemp_and_mmap", v6, v19, *__error());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v55 = v20;
LABEL_33:
    _os_log_debug_impl(&dword_18C56E000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    goto LABEL_18;
  }
  if (ftruncate(v9, v7) < 0)
  {
    TIImageCacheOSLogFacility();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v39 = (void *)MEMORY[0x1E0CB3940];
      v40 = __error();
      v41 = strerror(*v40);
      objc_msgSend(v39, "stringWithFormat:", CFSTR("%s Truncating '%s' to %lu failed: '%s' (%d)"), "mkstemp_and_mmap", v6, v7, v41, *__error());
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v55 = v42;
      _os_log_debug_impl(&dword_18C56E000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    goto LABEL_19;
  }
  v10 = mmap(0, v7, 3, 1, v9, 0);
  if (v10 == (_DWORD *)-1)
  {
    TIImageCacheOSLogFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v43 = (void *)MEMORY[0x1E0CB3940];
    v44 = __error();
    v45 = strerror(*v44);
    objc_msgSend(v43, "stringWithFormat:", CFSTR("%s Mapping '%s' failed: '%s' (%d)"), "mkstemp_and_mmap", v6, v45, *__error());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v55 = v20;
    goto LABEL_33;
  }
  v11 = v10;
  close(v9);
  if (!v11)
  {
LABEL_20:
    free(v6);
LABEL_21:
    objc_msgSend(*(id *)(a1 + 40), "_callDataReleaseHandler");
    goto LABEL_22;
  }
  *(_QWORD *)v11 = 0x154494943;
  *(int32x4_t *)(v11 + 2) = vuzp1q_s32(*(int32x4_t *)(a1 + 64), *(int32x4_t *)(a1 + 80));
  *((_BYTE *)v11 + 28) = *(_BYTE *)(a1 + 96);
  *((_BYTE *)v11 + 29) = *(_BYTE *)(a1 + 97);
  *((_BYTE *)v11 + 30) = *(_BYTE *)(a1 + 98);
  *((_BYTE *)v11 + 31) = *(_BYTE *)(a1 + 99);
  *((_BYTE *)v11 + 32) = *(_BYTE *)(a1 + 100);
  objc_msgSend(*(id *)(a1 + 40), "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getBytes:length:", v11 + 12, objc_msgSend(v13, "length"));

  v14 = *(_QWORD *)(a1 + 80);
  v22 = CGBitmapGetAlignedBytesPerRow() * v14;
  objc_msgSend(*(id *)(a1 + 40), "data");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24 < v22)
  {
    TIImageCacheOSLogFacility();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v46 = (void *)MEMORY[0x1E0CB3940];
      v47 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "data");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("%s Item data length is shorter than declared: %@ (%lu, %lu)"), "-[TIImageCacheClient _localStoreImageForKey:inGroup:withItem:]_block_invoke", v47, objc_msgSend(v48, "length"), v22);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v55 = v49;
      _os_log_debug_impl(&dword_18C56E000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    free(v6);
    munmap(v11, *(_QWORD *)(a1 + 64));
    goto LABEL_21;
  }
  v26 = crc32(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "data");
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28 = crc32(v26, (const Bytef *)objc_msgSend(v27, "bytes"), v22);

  v11[6] = v28;
  munmap(v11, *(_QWORD *)(a1 + 64));
  TIImageNameForItem(*(void **)(a1 + 48), *(void **)(a1 + 56));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v29);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = (const std::__fs::filesystem::path *)objc_msgSend(v30, "fileSystemRepresentation");
  rename(v6, v31, v32);
  if (v33 < 0)
  {
    TIImageCacheOSLogFacility();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v50 = (void *)MEMORY[0x1E0CB3940];
      v51 = __error();
      v52 = strerror(*v51);
      objc_msgSend(v50, "stringWithFormat:", CFSTR("%s Rename '%s' to '%@' failed: '%s' (%d)"), "-[TIImageCacheClient _localStoreImageForKey:inGroup:withItem:]_block_invoke", v6, v30, v52, *__error());
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v55 = v53;
      _os_log_debug_impl(&dword_18C56E000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  free(v6);
  objc_msgSend(*(id *)(a1 + 40), "_callDataReleaseHandler");

LABEL_22:
}

@end

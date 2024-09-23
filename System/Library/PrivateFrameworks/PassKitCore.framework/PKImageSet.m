@implementation PKImageSet

+ (id)createXPCContainerForImageSetWithType:(int64_t)a3 displayProfile:(id)a4 screenScale:(double)a5 screenSize:(CGSize)a6 suffix:(id)a7 fileURL:(id)a8 cacheURL:(id)a9
{
  return (id)objc_msgSend(a1, "_createXPCContainerForImageSetWithType:displayProfile:screenScale:screenSize:suffix:fileURL:cacheURL:imageSetOut:", a3, a4, a7, a8, a9, 0, a5, a6.width, a6.height);
}

- (PKImageSet)initWithCoder:(id)a3
{
  id v4;
  PKImageSet *v5;
  uint64_t v6;
  NSURL *originCacheURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKImageSet;
  v5 = -[PKImageSet init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originCacheURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    originCacheURL = v5->_originCacheURL;
    v5->_originCacheURL = (NSURL *)v6;

    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originCacheURL, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *originCacheURL;
  id v5;

  originCacheURL = self->_originCacheURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originCacheURL, CFSTR("originCacheURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_version, CFSTR("version"));

}

+ (BOOL)shouldCache
{
  return 1;
}

+ (id)_createXPCContainerForImageSetWithType:(int64_t)a3 displayProfile:(id)a4 screenScale:(double)a5 screenSize:(CGSize)a6 suffix:(id)a7 fileURL:(id)a8 cacheURL:(id)a9 imageSetOut:(id *)a10
{
  double height;
  double width;
  id v19;
  id v20;
  id v21;
  id v22;
  double v24;
  PKDisplayTraitCollection *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  objc_class *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v38;
  void *v39;
  PKPassPlaceHolderImageSet *v40;
  uint64_t v41;
  void *context;
  id v43;
  _BYTE buf[24];
  uint64_t v45;

  height = a6.height;
  width = a6.width;
  v45 = *MEMORY[0x1E0C80C00];
  v19 = a4;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (a5 == 0.0)
    a5 = PKScreenScale();
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    width = PKScreenSize();
    height = v24;
  }
  v25 = objc_alloc_init(PKDisplayTraitCollection);
  -[PKDisplayTraitCollection setCanvasSize:](v25, "setCanvasSize:", width, height);
  -[PKDisplayTraitCollection setCanvasScale:](v25, "setCanvasScale:", a5);
  v26 = (void *)objc_msgSend(a1, "cachedXPCContainerForImageSetWithType:displayProfile:displayTraits:cacheURL:", a3, v19, v25, v22);
  if (!v26)
  {
    if (!v21)
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v43 = v20;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "fileExistsAtPath:", v31);

    v20 = v43;
    if (!v32)
    {
LABEL_18:
      PKLogFacilityTypeGetObject(0);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v21;
        _os_log_impl(&dword_18FC92000, v36, OS_LOG_TYPE_DEFAULT, "Attempting to create container for image set with missing pass bundle: %@", buf, 0xCu);
      }

      goto LABEL_21;
    }
    context = (void *)MEMORY[0x19400CFE8]();
    v33 = (objc_class *)objc_msgSend(a1, "classForDisplayProfile:imageSetType:", v19, a3);
    if (v22 && v33 == (objc_class *)objc_opt_class())
    {
      v38 = (void *)MEMORY[0x19400CFE8]();
      *(_QWORD *)buf = 0;

      if (!*(_QWORD *)buf)
        goto LABEL_28;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v39 = *(void **)buf;
        *(_QWORD *)buf = 0;

      }
      if (*(_QWORD *)buf)
      {
        v40 = [PKPassPlaceHolderImageSet alloc];
        v41 = -[PKPassPlaceHolderImageSet _initWithDisplayProfile:fileURL:screenScale:suffix:frontFaceImageSet:](v40, "_initWithDisplayProfile:fileURL:screenScale:suffix:frontFaceImageSet:", v19, v21, v43, *(_QWORD *)buf, a5);
      }
      else
      {
LABEL_28:
        v41 = objc_msgSend([v33 alloc], "initWithDisplayProfile:fileURL:screenScale:suffix:", v19, v21, v43, a5);
      }
      v34 = (void *)v41;

      objc_autoreleasePoolPop(v38);
    }
    else
    {
      v34 = (void *)objc_msgSend([v33 alloc], "initWithDisplayProfile:fileURL:screenScale:suffix:", v19, v21, v43, a5);
      if (!v22)
      {
        v35 = 0;
LABEL_31:
        v27 = (void *)objc_msgSend(a1, "_archiveImageSetIfAppropriate:screenScale:screenSize:archiveURL:cacheURL:", v34, v35, v22, a5, width, height);
        if (a10)
        {
          objc_storeStrong(a10, v34);

          v27 = 0;
        }

        objc_autoreleasePoolPop(context);
        v20 = v43;
        goto LABEL_22;
      }
    }
    objc_msgSend((id)objc_opt_class(), "_archiveURL:", v22);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  v27 = v26;
  if (a10)
  {
    v28 = (void *)objc_msgSend(v26, "consumeImageSet");
    v29 = *a10;
    *a10 = v28;

LABEL_21:
    v27 = 0;
  }
LABEL_22:

  return v27;
}

+ (id)cachedXPCContainerForImageSetWithType:(int64_t)a3 displayProfile:(id)a4 displayTraits:(id)a5 cacheURL:(id)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  PKImageSetXPCContainer *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  void *v23;

  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_msgSend(a1, "classForDisplayProfile:imageSetType:", a4, a3);
  v13 = objc_msgSend(v12, "shouldCache");
  v14 = 0;
  if (v11 && v13)
  {
    objc_msgSend(v10, "canvasScale");
    if (v15 == 0.0)
      v15 = PKScreenScale();
    v16 = v15;
    objc_msgSend(v10, "canvasSize");
    v19 = v18;
    v20 = v17;
    if (v18 == *MEMORY[0x1E0C9D820] && v17 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v19 = PKScreenSize();
      v20 = v22;
    }
    objc_msgSend(v12, "_archiveURL:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PKLoadXPCDataWithURL(v23, objc_msgSend(v12, "currentVersion"), v16, v19, v20);

  }
  return v14;
}

+ (BOOL)shouldCacheForDisplayProfile:(id)a3 imageSetType:(int64_t)a4
{
  return objc_msgSend((id)objc_msgSend(a1, "classForDisplayProfile:imageSetType:", a3, a4), "shouldCache");
}

+ (Class)classForDisplayProfile:(id)a3 imageSetType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "type"))
      v5 = 0;
    else
      v5 = (id)objc_opt_class();
  }
  objc_msgSend(v5, "classForImageSetType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v7;
}

+ (id)_archiveURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "archiveName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_archiveImageSetIfAppropriate:(id)a3 screenScale:(double)a4 screenSize:(CGSize)a5 archiveURL:(id)a6 cacheURL:(id)a7
{
  double height;
  double width;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  double v21;
  id v22;
  void *v23;
  PKImageSetXPCContainer *v24;
  id v25;
  xpc_object_t v26;
  void *v27;
  void *v28;
  _DWORD v30[4];
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  height = a5.height;
  width = a5.width;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (v12
    && (objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0),
        (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = (void *)v15;
    v17 = objc_msgSend((id)objc_opt_class(), "shouldCache");
    if (!v13)
      goto LABEL_6;
    if (!v17)
      goto LABEL_6;
    objc_msgSend(v16, "SHA256Hash");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend((id)objc_opt_class(), "currentVersion");
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(v16, "length") + 48);
    v32 = 0u;
    v31 = 0u;
    v30[0] = bswap32(v19);
    v30[1] = bswap32(a4);
    v21 = (double)a4;
    v30[2] = bswap32((width * v21));
    v30[3] = bswap32((height * v21));
    v22 = objc_retainAutorelease(v18);
    objc_msgSend(v22, "bytes");
    objc_msgSend(v22, "length");
    __memcpy_chk();
    objc_msgSend(v20, "appendBytes:length:", v30, 48);
    objc_msgSend(v20, "appendData:", v16);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, 0);
    objc_msgSend(v20, "writeToURL:atomically:", v13, 1);
    v24 = PKLoadXPCDataWithURL(v13, v19, a4, width, height);

    if (!v24)
    {
LABEL_6:
      v25 = objc_retainAutorelease(v16);
      v26 = xpc_data_create((const void *)objc_msgSend(v25, "bytes"), objc_msgSend(v25, "length"));
      if (v26)
      {
        v27 = v26;
        objc_msgSend(v25, "SHA256Hash");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[PKImageSetXPCContainer initWithWithXPCObject:hash:]([PKImageSetXPCContainer alloc], "initWithWithXPCObject:hash:", v27, v28);

      }
      else
      {
        v24 = 0;
      }
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (PKImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  PKImageSet *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKImageSet;
  v6 = -[PKImageSet init](&v8, sel_init, a3, a4, a6, a5);
  if (v6)
    v6->_version = objc_msgSend((id)objc_opt_class(), "currentVersion");
  return v6;
}

+ (id)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 fileURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (a4 == 0.0)
    a4 = PKScreenScale();
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "classForDisplayProfile:imageSetType:", v13, a3)), "initWithDisplayProfile:fileURL:screenScale:suffix:", v13, v14, v12, a4);

  return v15;
}

+ (id)createXPCContainerForImageSet:(id)a3 screenScale:(double)a4 screenSize:(CGSize)a5 cacheURL:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  void *v14;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a6;
  if (v12)
  {
    objc_msgSend((id)objc_opt_class(), "_archiveURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)objc_msgSend(a1, "_archiveImageSetIfAppropriate:screenScale:screenSize:archiveURL:cacheURL:", v11, v13, v12, a4, width, height);

  return v14;
}

- (BOOL)_isSetImage:(id)a3 equalToImage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    v10 = 1;
  }
  else if (v6)
  {
    objc_msgSend(v5, "imageHash");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageHash");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)imageSetType
{
  return -1;
}

+ (Class)classForImageSetType:(int64_t)a3
{
  return 0;
}

+ (id)archiveName
{
  return 0;
}

+ (unsigned)currentVersion
{
  return 0;
}

- (NSURL)originCacheURL
{
  return self->_originCacheURL;
}

- (void)setOriginCacheURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

@end

@implementation PFMetadataImage

- (id)_imageSourceProperties
{
  CGImageSource *imageSource;
  CGImageSource *v4;
  NSDictionary *v5;
  NSDictionary *cachedImageSourceProperties;
  void *v7;
  const __CFURL *v8;

  if (!self->_cachedImageSourceProperties)
  {
    imageSource = self->_imageSource;
    if (imageSource)
    {
      v4 = 0;
    }
    else
    {
      -[PFMetadata fileURL](self, "fileURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        return self->_cachedImageSourceProperties;
      -[PFMetadata fileURL](self, "fileURL");
      v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      imageSource = CGImageSourceCreateWithURL(v8, 0);

      v4 = imageSource;
      if (!imageSource)
        return self->_cachedImageSourceProperties;
    }
    v5 = (NSDictionary *)CGImageSourceCopyProperties(imageSource, 0);
    cachedImageSourceProperties = self->_cachedImageSourceProperties;
    self->_cachedImageSourceProperties = v5;

    self->_cachedImageSourcePrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(imageSource);
    if (v4)
      CFRelease(v4);
  }
  return self->_cachedImageSourceProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whiteBalance, 0);
  objc_storeStrong((id *)&self->_cameraSerialNumber, 0);
  objc_storeStrong((id *)&self->_iso, 0);
  objc_storeStrong((id *)&self->_exposureTime, 0);
  objc_storeStrong((id *)&self->_fNumber, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_cgImageProperties, 0);
  objc_storeStrong((id *)&self->_isSpatialMediaValue, 0);
  objc_storeStrong((id *)&self->_cachedImageSourceProperties, 0);
}

+ (id)defaultOptionsForCGImageSource
{
  if (defaultOptionsForCGImageSource_onceToken[0] != -1)
    dispatch_once(defaultOptionsForCGImageSource_onceToken, &__block_literal_global_5786);
  return (id)objc_msgSend((id)defaultOptionsForCGImageSource_options, "mutableCopy");
}

- (BOOL)_configureWithImageProperties:(id)a3
{
  NSDictionary **p_cgImageProperties;

  p_cgImageProperties = &self->_cgImageProperties;
  objc_storeStrong((id *)&self->_cgImageProperties, a3);
  -[PFMetadata setSourceType:](self, "setSourceType:", 4);
  return *p_cgImageProperties != 0;
}

- (void)setImageSource:(CGImageSource *)a3
{
  CGImageSource *imageSource;

  if (a3)
    CFRetain(a3);
  imageSource = self->_imageSource;
  if (imageSource)
    CFRelease(imageSource);
  self->_imageSource = a3;
}

void __49__PFMetadataImage_defaultOptionsForCGImageSource__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0CBD140];
  v2[1] = CFSTR("kCGImageSourceKeepOriginalProfile");
  v3[0] = MEMORY[0x1E0C9AAB0];
  v3[1] = MEMORY[0x1E0C9AAB0];
  v2[2] = *MEMORY[0x1E0CBD278];
  v3[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultOptionsForCGImageSource_options;
  defaultOptionsForCGImageSource_options = v0;

}

- (void)dealloc
{
  CGImageSource *imageSource;
  CGImageMetadata *cgImageMetadata;
  CGColorSpace *cgColorSpace;
  objc_super v6;

  imageSource = self->_imageSource;
  if (imageSource)
    CFRelease(imageSource);
  cgImageMetadata = self->_cgImageMetadata;
  if (cgImageMetadata)
    CFRelease(cgImageMetadata);
  cgColorSpace = self->_cgColorSpace;
  if (cgColorSpace)
    CFRelease(cgColorSpace);
  v6.receiver = self;
  v6.super_class = (Class)PFMetadataImage;
  -[PFMetadataImage dealloc](&v6, sel_dealloc);
}

- (PFMetadataImage)initWithImageURL:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7 cacheImageData:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v11;
  id v14;
  PFMetadataImage *v15;
  PFMetadataImage *v16;

  v8 = a8;
  v9 = a7;
  v11 = a5;
  v14 = a3;
  v15 = -[PFMetadata initWithContentType:options:timeZoneLookup:](self, "initWithContentType:options:timeZoneLookup:", a4, v11, a6);
  v16 = v15;
  if (v15
    && !-[PFMetadataImage _configureWithImageURL:cacheImageSource:cacheImageData:](v15, "_configureWithImageURL:cacheImageSource:cacheImageData:", v14, v9, v8))
  {

    v16 = 0;
  }

  return v16;
}

- (PFMetadataImage)initWithImageData:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7 cacheImageData:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v11;
  id v14;
  PFMetadataImage *v15;
  PFMetadataImage *v16;

  v8 = a8;
  v9 = a7;
  v11 = a5;
  v14 = a3;
  v15 = -[PFMetadata initWithContentType:options:timeZoneLookup:](self, "initWithContentType:options:timeZoneLookup:", a4, v11, a6);
  v16 = v15;
  if (v15
    && !-[PFMetadataImage _configureWithImageData:cacheImageSource:cacheImageData:](v15, "_configureWithImageData:cacheImageSource:cacheImageData:", v14, v9, v8))
  {

    v16 = 0;
  }

  return v16;
}

- (PFMetadataImage)initWithImageSource:(CGImageSource *)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7
{
  _BOOL8 v7;
  PFMetadataImage *v9;
  PFMetadataImage *v10;

  v7 = a7;
  v9 = -[PFMetadata initWithContentType:options:timeZoneLookup:](self, "initWithContentType:options:timeZoneLookup:", a4, a5, a6);
  v10 = v9;
  if (v9
    && !-[PFMetadataImage _configureWithImageSource:cacheImageSource:](v9, "_configureWithImageSource:cacheImageSource:", a3, v7))
  {

    return 0;
  }
  return v10;
}

- (PFMetadataImage)initWithEncodedImagePropertyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v8;
  PFMetadataImage *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = -[PFMetadata initWithContentType:options:timeZoneLookup:](self, "initWithContentType:options:timeZoneLookup:", a4, 12, a5);
  if (v9)
  {
    v16 = 0;
    +[PFMetadata propertyListObjectFromEncodedData:expectedClass:options:error:](PFMetadataImage, "propertyListObjectFromEncodedData:expectedClass:options:error:", v8, objc_opt_class(), 0, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    if (!-[PFMetadataImage _configureWithImageProperties:](v9, "_configureWithImageProperties:", v10))
    {
      v12 = (void *)metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        v14 = v12;
        v15 = objc_msgSend(v8, "length");
        *(_DWORD *)buf = 134218498;
        v18 = v8;
        v19 = 2048;
        v20 = v15;
        v21 = 2114;
        v22 = v11;
        _os_log_error_impl(&dword_1A16EE000, v14, OS_LOG_TYPE_ERROR, "failed to deserialize a property list object from plist data: %p, length: %lu, error: %{public}@", buf, 0x20u);

      }
      v9 = 0;
    }
    -[PFMetadata setSourceType:](v9, "setSourceType:", 5);

  }
  return v9;
}

- (PFMetadataImage)initWithImageSourceProxyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v7;
  id v8;
  PFMetadataImage *v9;
  PFMetadataImage *v10;

  v7 = a4;
  v8 = a5;
  v9 = (PFMetadataImage *)CGImageSourceCreateWithProxyData();
  if (v9)
  {
    v10 = -[PFMetadataImage initWithImageSource:contentType:options:timeZoneLookup:cacheImageSource:](self, "initWithImageSource:contentType:options:timeZoneLookup:cacheImageSource:", v9, v7, 12, v8, 1);
    CFRelease(v9);
    self = v10;
    v9 = self;
  }

  return v9;
}

- (PFMetadataImage)initWithImageSourceProxyOrEncodedImagePropertyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v8;
  id v9;
  id v10;
  PFMetadataImage *v11;
  PFMetadataImage *v12;
  PFMetadataImage *v13;
  PFMetadataImage *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PFMetadataImage initWithImageSourceProxyData:contentType:timeZoneLookup:](self, "initWithImageSourceProxyData:contentType:timeZoneLookup:", v8, v9, v10);
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = -[PFMetadataImage initWithEncodedImagePropertyData:contentType:timeZoneLookup:]([PFMetadataImage alloc], "initWithEncodedImagePropertyData:contentType:timeZoneLookup:", v8, v9, v10);
  v14 = v13;

  return v14;
}

- (PFMetadataImage)initWithImageProperties:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6
{
  uint64_t v7;
  id v10;
  PFMetadataImage *v11;
  PFMetadataImage *v12;
  objc_super v14;

  v7 = a5;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PFMetadataImage;
  v11 = -[PFMetadata initWithContentType:options:timeZoneLookup:](&v14, sel_initWithContentType_options_timeZoneLookup_, a4, v7, a6);
  v12 = v11;
  if (v11 && !-[PFMetadataImage _configureWithImageProperties:](v11, "_configureWithImageProperties:", v10))
  {

    v12 = 0;
  }

  return v12;
}

- (BOOL)configureWithMetadataPlist:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PFMetadataImage;
  if (-[PFMetadata configureWithMetadataPlist:](&v8, sel_configureWithMetadataPlist_, v4))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", PFMetadataPlistCgImageProperties);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PFMetadataImage _configureWithImageProperties:](self, "_configureWithImageProperties:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_configureWithImageURL:(id)a3 cacheImageSource:(BOOL)a4 cacheImageData:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  CGImageSourceRef v31;
  CGImageSourceRef v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  stat v43;
  uint64_t v44;

  v5 = a5;
  v6 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    -[PFMetadata setFileURL:](self, "setFileURL:", v8);
    if (-[PFMetadata noFileAccess](self, "noFileAccess"))
    {
      -[PFMetadata contentType](self, "contentType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v42 = 0;
        +[PFUniformTypeUtilities typeForURL:error:](PFUniformTypeUtilities, "typeForURL:error:", v8, &v42);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v42;
        -[PFMetadata setContentType:](self, "setContentType:", v10);

        -[PFMetadata contentType](self, "contentType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v13 = metadataLog;
          if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
          {
            v43.st_dev = 138412290;
            *(_QWORD *)&v43.st_mode = v11;
            _os_log_error_impl(&dword_1A16EE000, v13, OS_LOG_TYPE_ERROR, "Failed to get a content type (%@)", (uint8_t *)&v43, 0xCu);
          }
        }

      }
    }
    -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedLongLongValue");

    if (-[PFMetadata useJpegFastPath](self, "useJpegFastPath"))
    {
      if (v16)
      {
        -[PFMetadata contentType](self, "contentType");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          -[PFMetadata contentType](self, "contentType");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v19, "conformsToType:", *MEMORY[0x1E0CEC530]) & 1) != 0)
          {

            if (!v6 && !v5)
            {
              objc_msgSend(v8, "path");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (void *)CopyMetadataFromFileAtPath();
              v22 = (void *)objc_msgSend(v21, "mutableCopy");

              v23 = -[PFMetadataImage _configureWithImageProperties:](self, "_configureWithImageProperties:", v22);
LABEL_40:

              -[PFMetadata setSourceType:](self, "setSourceType:", 1);
              goto LABEL_41;
            }
          }
          else
          {

          }
        }
      }
    }
    +[PFMetadataImage defaultOptionsForCGImageSource](PFMetadataImage, "defaultOptionsForCGImageSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v24, "mutableCopy");

    if (-[PFMetadata shouldLookForXmpSidecar](self, "shouldLookForXmpSidecar"))
    {
      objc_msgSend(v8, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByDeletingPathExtension");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "stringByAppendingPathExtension:", CFSTR("xmp"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&v43, 0, sizeof(v43));
      v28 = objc_retainAutorelease(v27);
      if (!stat((const char *)objc_msgSend(v28, "fileSystemRepresentation"), &v43) && (__int16)v43.st_mode < 0
        || (objc_msgSend(v26, "stringByAppendingPathExtension:", CFSTR("XMP")),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            v28,
            memset(&v43, 0, sizeof(v43)),
            v28 = objc_retainAutorelease(v29),
            v30 = 0,
            !stat((const char *)objc_msgSend(v28, "fileSystemRepresentation"), &v43))
        && (__int16)v43.st_mode < 0)
      {
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v28);
        if (v30)
        {
          if (*MEMORY[0x1E0CBD2C8])
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v30);
        }
      }

    }
    if (v5 && !-[PFMetadata noFileAccess](self, "noFileAccess"))
    {
      v41 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v8, 1, &v41);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v41;
      v23 = -[PFMetadataImage _configureWithImageData:cacheImageSource:cacheImageData:](self, "_configureWithImageData:cacheImageSource:cacheImageData:", v35, v6, 1);
      if (!v23)
      {
        v37 = (void *)metadataLog;
        if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
        {
          v39 = v37;
          -[PFMetadata contentType](self, "contentType");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v43.st_dev = 134218754;
          *(_QWORD *)&v43.st_mode = v35;
          WORD2(v43.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v43.st_ino + 6) = (__darwin_ino64_t)v40;
          HIWORD(v43.st_gid) = 2112;
          *(_QWORD *)&v43.st_rdev = v8;
          LOWORD(v43.st_atimespec.tv_sec) = 2112;
          *(__darwin_time_t *)((char *)&v43.st_atimespec.tv_sec + 2) = (__darwin_time_t)v36;
          _os_log_error_impl(&dword_1A16EE000, v39, OS_LOG_TYPE_ERROR, "Asked to cache image data. Unable to configure with data (%p) and contentType (%p) from path '%@'. (%@)", (uint8_t *)&v43, 0x2Au);

        }
      }

    }
    else
    {
      v31 = CGImageSourceCreateWithURL((CFURLRef)v8, (CFDictionaryRef)v22);
      if (v31)
      {
        v32 = v31;
        v23 = -[PFMetadataImage _configureWithImageSource:cacheImageSource:](self, "_configureWithImageSource:cacheImageSource:", v31, v6);
        if (!v23)
        {
          v33 = metadataLog;
          if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
          {
            v43.st_dev = 138412290;
            *(_QWORD *)&v43.st_mode = v8;
            _os_log_error_impl(&dword_1A16EE000, v33, OS_LOG_TYPE_ERROR, "Failed to get an image source from path '%@'", (uint8_t *)&v43, 0xCu);
          }
        }
        CFRelease(v32);
      }
      else
      {
        v34 = metadataLog;
        if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
        {
          v43.st_dev = 138412290;
          *(_QWORD *)&v43.st_mode = v8;
          _os_log_error_impl(&dword_1A16EE000, v34, OS_LOG_TYPE_ERROR, "Failed to get an image source from path '%@'", (uint8_t *)&v43, 0xCu);
        }
        v23 = 0;
      }
    }
    goto LABEL_40;
  }
  v23 = 0;
LABEL_41:

  return v23;
}

- (BOOL)_configureWithImageData:(id)a3 cacheImageSource:(BOOL)a4 cacheImageData:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  const __CFData *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGImageSourceRef v15;
  CGImageSourceRef v16;
  _BOOL4 v17;

  v5 = a5;
  v6 = a4;
  v9 = (const __CFData *)a3;
  if (v9)
  {
    +[PFMetadataImage defaultOptionsForCGImageSource](PFMetadataImage, "defaultOptionsForCGImageSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    -[PFMetadata contentType](self, "contentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PFMetadata contentType](self, "contentType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CBD2A8]);

    }
    v15 = CGImageSourceCreateWithData(v9, (CFDictionaryRef)v11);
    if (v15)
    {
      v16 = v15;
      v17 = -[PFMetadataImage _configureWithImageSource:cacheImageSource:](self, "_configureWithImageSource:cacheImageSource:", v15, v6);
      if (v17 && v5)
        objc_storeStrong((id *)&self->_imageData, a3);
      CFRelease(v16);
    }
    else
    {
      LOBYTE(v17) = 0;
    }
    -[PFMetadata setSourceType:](self, "setSourceType:", 2);

  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)_configureWithImageSource:(CGImageSource *)a3 cacheImageSource:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  char v9;
  size_t PrimaryImageIndex;
  const __CFDictionary *v11;
  CFDictionaryRef v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  const void *v17;

  if (a3)
  {
    v4 = a4;
    CGImageSourceGetType(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v7),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "conformsToType:", *MEMORY[0x1E0CEC5B8]),
          v8,
          (v9 & 1) != 0))
    {
      PrimaryImageIndex = 0;
    }
    else
    {
      PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
    }
    +[PFMetadataImage defaultOptionsForCGImageSource](PFMetadataImage, "defaultOptionsForCGImageSource");
    v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = CGImageSourceCopyPropertiesAtIndex(a3, PrimaryImageIndex, v11);
    v13 = (void *)-[__CFDictionary mutableCopy](v12, "mutableCopy");

    v14 = -[PFMetadataImage _configureWithImageProperties:](self, "_configureWithImageProperties:", v13);
    if (v14)
    {
      self->_cachedImageSourcePrimaryImageIndex = PrimaryImageIndex;
      if (v4)
        -[PFMetadataImage setImageSource:](self, "setImageSource:", a3);
      if (-[PFMetadata shouldLookForXmpSidecar](self, "shouldLookForXmpSidecar"))
      {
        v15 = (void *)CGImageSourceCopyMetadataPropertiesAtIndex();
        if (v15)
        {
          v16 = CGImageMetadataCreateFromMetadataProperties();
          if (v16)
          {
            v17 = (const void *)v16;
            -[PFMetadataImage setCgImageMetadata:](self, "setCgImageMetadata:", v16);
            CFRelease(v17);
          }
        }

      }
    }
    -[PFMetadata setSourceType:](self, "setSourceType:", 3);

  }
  else
  {
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (BOOL)sourceIsImageSourceProxy
{
  if (-[PFMetadata sourceType](self, "sourceType") == 3 && -[PFMetadataImage imageSource](self, "imageSource"))
    return CGImageSourceIsProxy();
  else
    return 0;
}

- (BOOL)isImage
{
  return 1;
}

- (id)livePhotoPairingIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89C70];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)playbackVariation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89CD0];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)cameraMake
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBD0B0];
  v9[0] = *MEMORY[0x1E0CBD090];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)cameraModel
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBD0B8];
  v9[0] = *MEMORY[0x1E0CBD090];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)software
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBD0D8];
  v9[0] = *MEMORY[0x1E0CBD090];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)originatingAssetIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89CC8];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)renderOriginatingAssetIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89CD8];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)captionAbstract
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCEB8];
  v9[0] = *MEMORY[0x1E0CBCED8];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)artworkContentDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCEF0];
  v9[0] = *MEMORY[0x1E0CBCED8];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)spatialOverCaptureIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89D48];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isSpatialOverCapture
{
  return (-[PFMetadataImage photoProcessingFlags](self, "photoProcessingFlags") >> 11) & 1;
}

- (BOOL)isHDR
{
  return -[PFMetadataImage _customRenderedIsHDR](self, "_customRenderedIsHDR")
      || (-[PFMetadataImage isHDR_TS22028](self, "isHDR_TS22028") & 1) != 0
      || -[PFMetadataImage isHDR_ExtendedRange](self, "isHDR_ExtendedRange");
}

- (BOOL)_customRenderedIsHDR
{
  return (-[PFMetadataImage customRendered](self, "customRendered") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isHDR_TS22028_5
{
  CGColorSpace *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[PFMetadataImage cgColorSpace](self, "cgColorSpace");
  if (v3)
    return CGColorSpaceUsesITUR_2100TF(v3);
  -[PFMetadataImage profileName](self, "profileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (v13 = 0u,
        v14 = 0u,
        v11 = 0u,
        v12 = 0u,
        (v6 = objc_msgSend(&unk_1E45CB2E8, "countByEnumeratingWithState:objects:count:", &v11, v15, 16)) != 0))
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(&unk_1E45CB2E8);
        if ((objc_msgSend(v5, "containsString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_15;
        }
      }
      v7 = objc_msgSend(&unk_1E45CB2E8, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v10 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (BOOL)isHDR_ExtendedRange
{
  CGColorSpace *v3;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;

  v3 = -[PFMetadataImage cgColorSpace](self, "cgColorSpace");
  if (v3)
    return CGColorSpaceUsesExtendedRange(v3);
  -[PFMetadata contentType](self, "contentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (+[PFUniformTypeUtilities openEXRImageType](PFUniformTypeUtilities, "openEXRImageType"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "conformsToType:", v6),
        v6,
        (v7 & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    -[PFMetadata typeVerifier](self, "typeVerifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCF30], self->_cgImageProperties);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v10, "BOOLValue");
  }

  return v8;
}

- (BOOL)hasISOGainMap
{
  PFMetadataImage *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  char v24;
  BOOL v25;
  uint64_t v27;
  uint64_t v28;
  PFMetadataImage *v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _QWORD v42[4];

  v2 = self;
  v42[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadataImage _imageSourceProperties](self, "_imageSourceProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PFMetadata typeVerifier](v2, "typeVerifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0CBCF28];
    v42[0] = *MEMORY[0x1E0CBCCC8];
    v42[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v3;
    objc_msgSend(v4, "valueForKeyPath:fromProperties:", v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v9 = v8;
    v30 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v30)
    {
      v10 = *(_QWORD *)v37;
      v11 = *MEMORY[0x1E0CBC860];
      v12 = *MEMORY[0x1E0CBC868];
      v13 = *MEMORY[0x1E0CBC718];
      v28 = *(_QWORD *)v37;
      v29 = v2;
      v27 = *MEMORY[0x1E0CBC860];
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v14);
          -[PFMetadata typeVerifier](v2, "typeVerifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "valueForKeyPath:fromProperties:", v11, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v18 = v17;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v33;
            while (2)
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v33 != v21)
                  objc_enumerationMutation(v18);
                objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "objectForKeyedSubscript:", v12);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "isEqual:", v13);

                if ((v24 & 1) != 0)
                {

                  v25 = 1;
                  goto LABEL_21;
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              if (v20)
                continue;
              break;
            }
          }

          ++v14;
          v2 = v29;
          v11 = v27;
          v10 = v28;
        }
        while (v14 != v30);
        v25 = 0;
        v30 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v30);
    }
    else
    {
      v25 = 0;
    }
LABEL_21:

    v3 = v31;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)hdrGain
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D03D40];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasHDRGainMap
{
  void *v2;
  BOOL v3;

  -[PFMetadataImage hdrGainMapPercentageValue](self, "hdrGainMapPercentageValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)hdrGainMapPercentageValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D03D48];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)title
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCF18];
  v9[0] = *MEMORY[0x1E0CBCED8];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isSDOF
{
  return (unint64_t)(-[PFMetadataImage customRendered](self, "customRendered") - 7) < 2;
}

- (id)keywords
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCF10];
  v9[0] = *MEMORY[0x1E0CBCED8];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isFrontFacingCamera
{
  int64_t v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[PFMetadataImage cameraUsedForCapture](self, "cameraUsedForCapture");
  if ((unint64_t)(v3 - 5) >= 2)
  {
    if (v3)
      return 0;
    -[PFMetadataImage lensMake](self, "lensMake");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFMetadataImage lensModel](self, "lensModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && v7)
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("Apple"))
        && objc_msgSend(v7, "containsString:", CFSTR("front")))
      {
        v4 = objc_msgSend(v7, "containsString:", CFSTR("camera"));
LABEL_14:

        return v4;
      }
    }
    else
    {
      -[PFMetadataImage cameraMake](self, "cameraMake");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("Apple")))
      {
        v4 = -[PFMetadataImage _hasFFCDimensions](self, "_hasFFCDimensions");

        goto LABEL_14;
      }

    }
    v4 = 0;
    goto LABEL_14;
  }
  return 1;
}

- (BOOL)isPhotoBooth
{
  void *v2;
  char v3;

  -[PFMetadataImage keywords](self, "keywords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("Photo Booth"));

  return v3;
}

- (id)userComment
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCCB0];
  v9[0] = *MEMORY[0x1E0CBCB50];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)burstUuid
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89C78];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)groupingUuid
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89C90];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)deferredPhotoProcessingIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[PFMetadataImage imageCaptureRequestIdentifier](self, "imageCaptureRequestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataImage photoProcessingIdentifier](self, "photoProcessingIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("/"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)imageCaptureRequestIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D03D18];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)photoProcessingIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D03D78];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)photoProcessingFlags
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89CB8];
  v10[0] = *MEMORY[0x1E0CBCF70];
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  return v8;
}

- (unint64_t)photoCaptureFlags
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D03DC0];
  v10[0] = *MEMORY[0x1E0CBCF70];
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  return v8;
}

- (BOOL)isPanorama
{
  return (-[PFMetadataImage photoProcessingFlags](self, "photoProcessingFlags") & 0x100) != 0
      || -[PFMetadataImage customRendered](self, "customRendered") == 6;
}

- (BOOL)isPortrait
{
  return (-[PFMetadataImage photoProcessingFlags](self, "photoProcessingFlags") & 0x60) != 0
      || -[PFMetadataImage isSDOF](self, "isSDOF");
}

- (BOOL)hasDepthDataAndIsNotRenderedSDOF
{
  if ((-[PFMetadataImage photoProcessingFlags](self, "photoProcessingFlags") & 0x60) != 0)
    return !-[PFMetadataImage isSDOF](self, "isSDOF");
  else
    return 0;
}

- (BOOL)isDeferredPhotoProxy
{
  return (-[PFMetadataImage photoProcessingFlags](self, "photoProcessingFlags") >> 12) & 1;
}

- (BOOL)isDeferredPhotoProxyExpectingDepth
{
  _BOOL8 v3;

  LODWORD(v3) = -[PFMetadataImage isDeferredPhotoProxy](self, "isDeferredPhotoProxy");
  if (v3)
    return (-[PFMetadataImage photoCaptureFlags](self, "photoCaptureFlags") >> 11) & 1;
  return v3;
}

- (BOOL)isScreenshot
{
  _BOOL4 v3;
  void *v4;
  char v5;
  void *v6;
  int v7;

  v3 = -[PFMetadataImage isImage](self, "isImage");
  if (v3)
  {
    -[PFMetadataImage userComment](self, "userComment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Screenshot"));

    if ((v5 & 1) != 0)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      -[PFMetadata contentType](self, "contentType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC580]);

      if (v7)
        LOBYTE(v3) = -[PFMetadataImage _hasScreenshotDimensions](self, "_hasScreenshotDimensions");
      else
        LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (int64_t)customRendered
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCB30];
  v10[0] = *MEMORY[0x1E0CBCB50];
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (id)hdrGainMap
{
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5748;
  v16 = __Block_byref_object_dispose__5749;
  v17 = 0;
  -[PFMetadata fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PFMetadata fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __29__PFMetadataImage_hdrGainMap__block_invoke;
    v10[3] = &unk_1E45A3218;
    v10[4] = self;
    v10[5] = &v12;
    v5 = +[PFMediaUtilities enumerateImageSourceIndexesOfFileAtURL:error:block:](PFMediaUtilities, "enumerateImageSourceIndexesOfFileAtURL:error:block:", v4, &v11, v10);
    v6 = v11;

    if (!v5)
    {
      v7 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_error_impl(&dword_1A16EE000, v7, OS_LOG_TYPE_ERROR, "Failed to get HDR gain map from auxiliary image (Error: %@)", buf, 0xCu);
      }
    }

  }
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (void)setCgImageMetadata:(CGImageMetadata *)a3
{
  CGImageMetadata *cgImageMetadata;

  if (a3)
    CFRetain(a3);
  cgImageMetadata = self->_cgImageMetadata;
  if (cgImageMetadata)
    CFRelease(cgImageMetadata);
  self->_cgImageMetadata = a3;
}

- (id)ownerName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCA68];
  v9[0] = *MEMORY[0x1E0CBCA28];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)firmware
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCA30];
  v9[0] = *MEMORY[0x1E0CBCA28];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)fNumber
{
  NSNumber *fNumber;
  double v4;
  NSNumber *v5;

  fNumber = self->_fNumber;
  if (!fNumber)
  {
    -[PFMetadataImage _computeFNumberValue](self, "_computeFNumberValue");
    fNumber = self->_fNumber;
  }
  -[NSNumber doubleValue](fNumber, "doubleValue");
  if (v4 <= 0.0)
    v5 = 0;
  else
    v5 = self->_fNumber;
  return v5;
}

- (id)exposureBias
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCB60];
  v10[0] = *MEMORY[0x1E0CBCB50];
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  -[PFMetadataImage _formatValue:withPrecision:](self, "_formatValue:withPrecision:", v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)brightness
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCB00];
  v9[0] = *MEMORY[0x1E0CBCB50];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGColorSpace)cgColorSpace
{
  CGColorSpace *result;
  CGColorSpace *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t cachedImageSourcePrimaryImageIndex;
  unint64_t v10;
  int v11;
  void *v12;
  const __CFString *v13;
  __CFString *v14;

  result = self->_cgColorSpace;
  if (!result)
  {
    -[PFMetadataImage _imageSourceProperties](self, "_imageSourceProperties");
    result = (CGColorSpace *)objc_claimAutoreleasedReturnValue();
    if (result)
    {
      v4 = result;
      -[CGColorSpace objectForKeyedSubscript:](result, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCCC8]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {

        return 0;
      }
      v6 = v5;
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF28]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && objc_msgSend(v7, "count"))
      {
        cachedImageSourcePrimaryImageIndex = self->_cachedImageSourcePrimaryImageIndex;
        if (cachedImageSourcePrimaryImageIndex >= objc_msgSend(v8, "count"))
          v10 = 0;
        else
          v10 = self->_cachedImageSourcePrimaryImageIndex;
        objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFE0]);
        v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        v14 = (__CFString *)v13;
        if (v13)
        {
          v11 = 0;
          self->_cgColorSpace = CGColorSpaceCreateWithName(v13);
        }
        else
        {
          v11 = 1;
        }

      }
      else
      {
        v11 = 1;
      }

      if (v11)
        return 0;
      return self->_cgColorSpace;
    }
  }
  return result;
}

- (id)flashValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCB88];
  v9[0] = *MEMORY[0x1E0CBCB50];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)flashCompensation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCA38];
  v9[0] = *MEMORY[0x1E0CBCA28];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)flashFired
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;

  -[PFMetadataImage flashCompensation](self, "flashCompensation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PFMetadataImage flashValue](self, "flashValue");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = objc_msgSend(v6, "integerValue") & 1;
  return v7;
}

- (id)focalLength
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCBA0];
  v10[0] = *MEMORY[0x1E0CBCB50];
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  -[PFMetadataImage _formatValue:withPrecision:](self, "_formatValue:withPrecision:", v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)focalLengthIn35mm
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCB98];
  v9[0] = *MEMORY[0x1E0CBCB50];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)digitalZoomRatio
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCB58];
  v9[0] = *MEMORY[0x1E0CBCB50];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)focusPoints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CBCA28];
  v8[1] = CFSTR("AFInfo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v5, self->_cgImageProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)focusMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CBCA28];
  v8[1] = CFSTR("FocusMode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v5, self->_cgImageProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)focusDistance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CBCA28];
  v8[1] = CFSTR("FocusDistance");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v5, self->_cgImageProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)iso
{
  NSNumber *iso;

  iso = self->_iso;
  if (!iso)
  {
    -[PFMetadataImage _computeISOSetting](self, "_computeISOSetting");
    iso = self->_iso;
  }
  return iso;
}

- (id)portraitInLandscapeCamera
{
  void *v3;
  void *v4;
  const __CFString *v5;

  -[PFMetadataImage cameraModel](self, "cameraModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataImage cameraMake](self, "cameraMake");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Canon PowerShot S95")) & 1) != 0)
  {
    v5 = CFSTR("S95");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("OLYMPUS IMAGING CORP.  "))
         && (objc_msgSend(v3, "isEqualToString:", CFSTR("E-5             ")) & 1) != 0)
  {
    v5 = CFSTR("OLYMPUSE5");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Canon PowerShot G12")))
  {
    v5 = CFSTR("G12");
  }
  else
  {
    v5 = 0;
  }

  return (id)v5;
}

- (id)lensModel
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCBE0];
  v13[0] = *MEMORY[0x1E0CBCB50];
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PFMetadata typeVerifier](self, "typeVerifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = *MEMORY[0x1E0CBCA28];
    v12[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKeyPath:fromProperties:", v10, self->_cgImageProperties);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)lensMake
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCBD8];
  v9[0] = *MEMORY[0x1E0CBCB50];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)lensMinimumMM
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCA50];
  v9[0] = *MEMORY[0x1E0CBCA28];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:index:fromProperties:", v6, 0, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)lensMaximumMM
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCA50];
  v9[0] = *MEMORY[0x1E0CBCA28];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:index:fromProperties:", v6, 1, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)cameraSerialNumber
{
  NSString *cameraSerialNumber;

  cameraSerialNumber = self->_cameraSerialNumber;
  if (!cameraSerialNumber)
  {
    -[PFMetadataImage _computeCameraSerialNumber](self, "_computeCameraSerialNumber");
    cameraSerialNumber = self->_cameraSerialNumber;
  }
  return cameraSerialNumber;
}

- (id)meteringMode
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCC08];
  v9[0] = *MEMORY[0x1E0CBCB50];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)exposureTime
{
  NSNumber *exposureTime;
  double v4;
  NSNumber *v5;

  exposureTime = self->_exposureTime;
  if (!exposureTime)
  {
    -[PFMetadataImage _computeExposureTime](self, "_computeExposureTime");
    exposureTime = self->_exposureTime;
  }
  -[NSNumber doubleValue](exposureTime, "doubleValue");
  if (v4 <= 0.0)
    v5 = 0;
  else
    v5 = self->_exposureTime;
  return v5;
}

- (NSNumber)whiteBalance
{
  NSNumber *whiteBalance;

  whiteBalance = self->_whiteBalance;
  if (!whiteBalance)
  {
    -[PFMetadataImage _computeWhiteBalanceValue](self, "_computeWhiteBalanceValue");
    whiteBalance = self->_whiteBalance;
  }
  return whiteBalance;
}

- (id)whiteBalanceIndex
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBC8C0];
  v9[0] = *MEMORY[0x1E0CBC898];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)profileName
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", *MEMORY[0x1E0CBD060], self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lightSource
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCBF8];
  v9[0] = *MEMORY[0x1E0CBCB50];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)GIFDelayTime
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCCD8];
  v9[0] = *MEMORY[0x1E0CBCCE0];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)HEICSDelayTime
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCE78];
  v9[0] = *MEMORY[0x1E0CBCE80];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)altitudeRef
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCD08];
  v9[0] = *MEMORY[0x1E0CBCD68];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)gpsHPositioningError
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCD78];
  v9[0] = *MEMORY[0x1E0CBCD68];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageDirection
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCD80];
  v9[0] = *MEMORY[0x1E0CBCD68];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageDirectionRef
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCD88];
  v9[0] = *MEMORY[0x1E0CBCD68];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)speedRef
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCDD8];
  v9[0] = *MEMORY[0x1E0CBCD68];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)semanticStyleToneBias
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89CE8];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  v9[2] = *MEMORY[0x1E0C89D00];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)semanticStyleWarmthBias
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89CE8];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  v9[2] = *MEMORY[0x1E0C89D08];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)semanticStyleRenderingVersion
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89CE8];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  v9[2] = *MEMORY[0x1E0C89CF8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)semanticStylePreset
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89CE8];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  v9[2] = *MEMORY[0x1E0C89CF0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isProRAW
{
  return (-[PFMetadataImage photoProcessingFlags](self, "photoProcessingFlags") >> 16) & 1;
}

- (BOOL)hasSmartStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CBCF70];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v5, self->_cgImageProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)smartStyleRenderingVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CBCF70];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesRenderingVersion;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v5, self->_cgImageProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)smartStyleToneBias
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CBCF70];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesToneBias;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v5, self->_cgImageProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)smartStyleColorBias
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CBCF70];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesColorBias;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v5, self->_cgImageProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)smartStyleIntensity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CBCF70];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesIntensity;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v5, self->_cgImageProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (signed)smartStyleCast
{
  PFMetadataImage *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v2 = self;
  v8[3] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CBCF70];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesCast;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v5, v2->_cgImageProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v2) = objc_msgSend(v6, "intValue");

  return (__int16)v2;
}

- (id)smartStyleIsReversible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CBCF70];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesIsReversible;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v5, self->_cgImageProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)smartStyleExpectingReversibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CBCF70];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesIsExpectingReversibility;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v5, self->_cgImageProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)photosAppFeatureFlags
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89CC0];
  v10[0] = *MEMORY[0x1E0CBCF70];
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  return v8;
}

- (id)nrfSrlStatus
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D03D60];
  v9[0] = *MEMORY[0x1E0CBCF70];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)enumerateRawThumbnailInfoWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, uint64_t, _BYTE *, double, double);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  void *v20;
  float v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _QWORD v42[5];

  v42[2] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t, uint64_t, _BYTE *, double, double))a3;
  -[PFMetadataImage _imageSourceProperties](self, "_imageSourceProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PFMetadata typeVerifier](self, "typeVerifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = CFSTR("{raw}");
    v42[1] = CFSTR("Thumbnails");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v5;
    objc_msgSend(v6, "valueForKeyPath:fromProperties:", v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v10)
    {
      v11 = v10;
      v35 = *(_QWORD *)v38;
      v34 = *MEMORY[0x1E0CBD128];
      v12 = *MEMORY[0x1E0CBCEA8];
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v35)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v13);
        -[PFMetadata typeVerifier](self, "typeVerifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "valueForKeyPath:fromProperties:", v34, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        -[PFMetadata typeVerifier](self, "typeVerifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "valueForKeyPath:fromProperties:", v12, v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "floatValue");
        v22 = v21;

        -[PFMetadata typeVerifier](self, "typeVerifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "valueForKeyPath:fromProperties:", CFSTR("JPEGOffset"), v14);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "unsignedIntegerValue");

        -[PFMetadata typeVerifier](self, "typeVerifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "valueForKeyPath:fromProperties:", CFSTR("JPEGLength"), v14);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "unsignedIntegerValue");

        -[PFMetadata typeVerifier](self, "typeVerifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "valueForKeyPath:fromProperties:", CFSTR("Orientation"), v14);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "intValue");

        v36 = 0;
        v4[2](v4, v25, v28, v31, &v36, v18, v22);
        if (v36)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v11)
            goto LABEL_4;
          break;
        }
      }
    }

    v5 = v32;
  }

}

- (id)metadataForImagePropertiesAtIndex:(unint64_t)a3
{
  CGImageSource *v5;
  size_t Count;
  CFDictionaryRef v7;
  PFMetadata *v8;
  void *v9;
  PFMetadata *v10;
  size_t v11;
  NSObject *v12;
  NSObject *v14;
  int v15;
  unint64_t v16;
  __int16 v17;
  size_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = -[PFMetadataImage imageSource](self, "imageSource");
  Count = CGImageSourceGetCount(v5);
  if (Count <= a3)
  {
    v11 = Count;
    v12 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      v15 = 134218240;
      v16 = a3;
      v17 = 2048;
      v18 = v11;
      _os_log_error_impl(&dword_1A16EE000, v12, OS_LOG_TYPE_ERROR, "Invalid request for per-image-index %tu sub-metadata for image source with count %tu", (uint8_t *)&v15, 0x16u);
    }
    return 0;
  }
  else
  {
    v7 = CGImageSourceCopyPropertiesAtIndex(v5, a3, (CFDictionaryRef)+[PFMetadataImage defaultOptionsForCGImageSource](PFMetadataImage, "defaultOptionsForCGImageSource"));
    if (v7)
    {
      v8 = [PFMetadata alloc];
      -[PFMetadata timeZoneLookup](self, "timeZoneLookup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PFMetadata initWithImageProperties:contentType:timeZoneLookup:](v8, "initWithImageProperties:contentType:timeZoneLookup:", v7, 0, v9);

    }
    else
    {
      v14 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        v15 = 134217984;
        v16 = a3;
        _os_log_error_impl(&dword_1A16EE000, v14, OS_LOG_TYPE_ERROR, "Unable to get per-image-index %tu properties", (uint8_t *)&v15, 0xCu);
      }
      v10 = 0;
    }

    return v10;
  }
}

- (BOOL)isSpatialMedia
{
  NSNumber *isSpatialMediaValue;
  void *v4;
  CGImageSource *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSNumber *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSNumber *v23;
  NSNumber *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  isSpatialMediaValue = self->_isSpatialMediaValue;
  if (!isSpatialMediaValue)
  {
    -[PFMetadataImage _imageSourceProperties](self, "_imageSourceProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[PFMetadataImage imageSource](self, "imageSource");
      -[PFMetadata typeVerifier](self, "typeVerifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCE60], v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(v8);
            if (-[PFMetadataImage _isSpatialStereoGroup:inImageSource:](self, "_isSpatialStereoGroup:inImageSource:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v5, (_QWORD)v26))
            {
              v13 = self->_isSpatialMediaValue;
              self->_isSpatialMediaValue = (NSNumber *)MEMORY[0x1E0C9AAB0];

              goto LABEL_13;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_13:

      if (self->_isSpatialMediaValue)
        goto LABEL_22;
    }
    else
    {
      -[PFMetadata typeVerifier](self, "typeVerifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x1E0CBD320];
      v30[0] = *MEMORY[0x1E0CBCE98];
      v30[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("."));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "valueForKeyPath:fromProperties:", v17, self->_cgImageProperties);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD2E8]);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD2F0]);
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD2F8]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v23 = (NSNumber *)MEMORY[0x1E0C9AAB0];
LABEL_21:
            v24 = self->_isSpatialMediaValue;
            self->_isSpatialMediaValue = v23;

LABEL_22:
            isSpatialMediaValue = self->_isSpatialMediaValue;
            return -[NSNumber BOOLValue](isSpatialMediaValue, "BOOLValue", (_QWORD)v26);
          }
        }
        else
        {

        }
      }
    }
    v23 = (NSNumber *)MEMORY[0x1E0C9AAA0];
    goto LABEL_21;
  }
  return -[NSNumber BOOLValue](isSpatialMediaValue, "BOOLValue", (_QWORD)v26);
}

- (BOOL)_isSpatialStereoGroup:(id)a3 inImageSource:(CGImageSource *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  _QWORD v41[2];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    v24 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A16EE000, v24, OS_LOG_TYPE_ERROR, "Unexpected missing image source for spatial stereo group check", buf, 2u);
    }
    v23 = 0;
    goto LABEL_34;
  }
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCE38], v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || !objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CBCE48]))
  {
    v23 = 0;
    goto LABEL_33;
  }
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CBCE08];
  objc_msgSend(v9, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCE08], v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v25 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v36 = v10;
      v37 = 2114;
      v38 = v6;
      _os_log_impl(&dword_1A16EE000, v25, OS_LOG_TYPE_INFO, "Not recognizing stereo group as spatial because %{public}@ key is missing: %{public}@", buf, 0x16u);
    }
    v23 = 0;
    goto LABEL_32;
  }
  v29 = v11;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = *MEMORY[0x1E0CBCE18];
  v41[0] = *MEMORY[0x1E0CBCE10];
  v41[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
  if (!v13)
  {
    v23 = 1;
    goto LABEL_31;
  }
  v14 = v13;
  v15 = *(_QWORD *)v32;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v32 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      -[PFMetadata typeVerifier](self, "typeVerifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "valueForKey:fromProperties:", v17, v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v26 = metadataLog;
        if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v36 = (uint64_t)v17;
          v37 = 2114;
          v38 = v6;
          _os_log_error_impl(&dword_1A16EE000, v26, OS_LOG_TYPE_ERROR, "Unexpected missing image index key %{public}@ in stereo group: %{public}@", buf, 0x16u);
        }
        goto LABEL_30;
      }
      v20 = objc_msgSend(v19, "unsignedIntegerValue");
      -[PFMetadataImage metadataForImagePropertiesAtIndex:](self, "metadataForImagePropertiesAtIndex:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v27 = metadataLog;
        if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          v36 = v20;
          v37 = 2114;
          v38 = v17;
          v39 = 2114;
          v40 = v6;
          _os_log_error_impl(&dword_1A16EE000, v27, OS_LOG_TYPE_ERROR, "Unable to get image properties for image index %tu for image index key %{public}@ in stereo group: %{public}@", buf, 0x20u);
        }
        v22 = 0;
LABEL_29:

LABEL_30:
        v23 = 0;
        goto LABEL_31;
      }
      v22 = v21;
      if ((objc_msgSend(v21, "containsSpatialCameraHEIFMetadata") & 1) == 0)
        goto LABEL_29;

    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    v23 = 1;
    if (v14)
      continue;
    break;
  }
LABEL_31:

  v11 = v29;
LABEL_32:

LABEL_33:
LABEL_34:

  return v23;
}

- (BOOL)isThreeImageStereoHEIC
{
  return -[PFMetadataImage _anyImageHasProcessingFlag:](self, "_anyImageHasProcessingFlag:", 0x100000);
}

- (BOOL)isAlchemist
{
  return -[PFMetadataImage _anyImageHasProcessingFlag:](self, "_anyImageHasProcessingFlag:", 0x400000);
}

- (BOOL)_anyImageHasProcessingFlag:(unint64_t)a3
{
  BOOL v5;
  int64_t Count;
  int64_t v7;
  const __CFDictionary *v8;
  size_t v9;
  uint64_t v10;
  CFDictionaryRef v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v17;

  if ((-[PFMetadataImage photoProcessingFlags](self, "photoProcessingFlags") & a3) != 0)
    return 1;
  if (!-[PFMetadataImage imageSource](self, "imageSource"))
    return 0;
  Count = CGImageSourceGetCount(-[PFMetadataImage imageSource](self, "imageSource"));
  if (Count < 2)
    return 0;
  v7 = Count;
  +[PFMetadataImage defaultOptionsForCGImageSource](PFMetadataImage, "defaultOptionsForCGImageSource");
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = *MEMORY[0x1E0CBCF70];
  v17 = *MEMORY[0x1E0C89CB8];
  while (1)
  {
    v11 = CGImageSourceCopyPropertiesAtIndex(-[PFMetadataImage imageSource](self, "imageSource"), v9, v8);
    -[__CFDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntValue");

      if ((a3 & ~(unint64_t)v15) == 0)
        break;
    }

    if (v7 == ++v9)
    {
      v5 = 0;
      goto LABEL_12;
    }
  }

  v5 = 1;
LABEL_12:

  return v5;
}

- (BOOL)containsSpatialCameraHEIFMetadata
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCE98];
  v5 = *MEMORY[0x1E0CBD320];
  v26[0] = *MEMORY[0x1E0CBCE98];
  v26[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v7, self->_cgImageProperties);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PFMetadata typeVerifier](self, "typeVerifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:fromProperties:", *MEMORY[0x1E0CBD2F0], v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PFMetadata typeVerifier](self, "typeVerifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:fromProperties:", *MEMORY[0x1E0CBD2F8], v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v13 = v12 == 0;
    else
      v13 = 1;
    if (v13)
    {
      v14 = 0;
    }
    else
    {
      -[PFMetadata typeVerifier](self, "typeVerifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x1E0CBD328];
      v25[0] = v4;
      v25[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "valueForKeyPath:fromProperties:", v18, self->_cgImageProperties);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[PFMetadata typeVerifier](self, "typeVerifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "valueForKey:fromProperties:", *MEMORY[0x1E0CBD310], v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[PFMetadata typeVerifier](self, "typeVerifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "valueForKey:fromProperties:", *MEMORY[0x1E0CBD318], v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = 0;
        if (v21 && v23)
          v14 = (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0CBD300]) & 1) != 0
             || objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0CBD308]);

      }
      else
      {
        v14 = 0;
      }

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)generativeAIImageType
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCEF8];
  v11[0] = *MEMORY[0x1E0CBCED8];
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("trainedAlgorithmicMedia")))
    v9 = &unk_1E45CA688;
  else
    v9 = &unk_1E45CA670;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("compositeWithTrainedAlgorithmicMedia")))
    v9 = &unk_1E45CA6A0;

  return v9;
}

- (id)credit
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCEC8];
  v9[0] = *MEMORY[0x1E0CBCED8];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageSourceProxyData
{
  CGImageSourceRef v3;
  void *v4;
  const __CFURL *v5;
  void *ProxyData;

  if (self->_imageSource)
  {
    v3 = 0;
  }
  else
  {
    -[PFMetadata fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PFMetadata fileURL](self, "fileURL");
      v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v3 = CGImageSourceCreateWithURL(v5, 0);

    }
    else
    {
      v3 = 0;
    }
  }
  ProxyData = (void *)CGImageSourceCreateProxyData();
  if (v3)
    CFRelease(v3);
  return ProxyData;
}

- (int64_t)cameraUsedForCapture
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89C80];
  v10[0] = *MEMORY[0x1E0CBCF70];
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (BOOL)containsCustomStylesMetadataBlob
{
  PFMetadataImage *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  char v25;
  NSObject *v26;
  BOOL v27;
  NSObject *v28;
  uint64_t v30;
  uint64_t v31;
  PFMetadataImage *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _QWORD v47[4];

  v2 = self;
  v47[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadataImage _imageSourceProperties](self, "_imageSourceProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PFMetadata typeVerifier](v2, "typeVerifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0CBCF28];
    v47[0] = *MEMORY[0x1E0CBCCC8];
    v47[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKeyPath:fromProperties:", v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = v8;
    v35 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v35)
    {
      v33 = v3;
      v10 = 0;
      v11 = *(_QWORD *)v42;
      v12 = *MEMORY[0x1E0CBC860];
      v13 = *MEMORY[0x1E0CBC868];
      v14 = *MEMORY[0x1E0D09488];
      v31 = *(_QWORD *)v42;
      v32 = v2;
      v34 = v9;
      v30 = *MEMORY[0x1E0CBC860];
      do
      {
        v15 = 0;
        v16 = v10;
        do
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v9);
          v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v15);
          -[PFMetadata typeVerifier](v2, "typeVerifier", v30, v31, v32);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "valueForKeyPath:fromProperties:", v12, v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v19 = v10;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v38;
              while (2)
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v38 != v22)
                    objc_enumerationMutation(v19);
                  objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "objectForKeyedSubscript:", v13);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v24, "isEqual:", v14);

                  if ((v25 & 1) != 0)
                  {

                    v27 = 1;
                    v3 = v33;
                    goto LABEL_27;
                  }
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                if (v21)
                  continue;
                break;
              }
            }

            v11 = v31;
            v2 = v32;
            v9 = v34;
            v12 = v30;
          }
          ++v15;
          v16 = v10;
        }
        while (v15 != v35);
        v35 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v35);

      v3 = v33;
    }

    v26 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A16EE000, v26, OS_LOG_TYPE_ERROR, "No custom styles metadata present.", buf, 2u);
    }

  }
  else
  {
    v28 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A16EE000, v28, OS_LOG_TYPE_ERROR, "No fileURL associated with metadata to extract custom metadata.", buf, 2u);
    }
  }
  v27 = 0;
LABEL_27:

  return v27;
}

- (void)_computeFNumberValue
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  char v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CBCA20];
  v21[0] = *MEMORY[0x1E0CBCB50];
  v4 = v21[0];
  v21[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v7, self->_cgImageProperties);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CBCB80];
  v20[0] = v4;
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKeyPath:fromProperties:", v12, self->_cgImageProperties);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v14 = v13 == 0;
  else
    v14 = 0;
  if (v14)
  {
    objc_msgSend(v8, "doubleValue");
    v16 = round(exp2(v15 * 0.5) * 10.0) / 10.0;
    if (v16 == 0.0)
    {
      v13 = 0;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.8f"), *(_QWORD *)&v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  if (v13)
  {
    -[PFMetadataImage _formatValue:withPrecision:](self, "_formatValue:withPrecision:", v13, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    goto LABEL_15;
  }
LABEL_14:
  v18 = 0;
  v19 = 1;
LABEL_15:
  objc_storeStrong((id *)&self->_fNumber, v18);
  if ((v19 & 1) == 0)

}

- (void)_computeWhiteBalanceValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *whiteBalance;
  NSNumber *v9;
  NSNumber *v10;
  NSNumber *v11;
  NSNumber *v12;
  unint64_t v13;
  NSNumber *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCCC0];
  v15[0] = *MEMORY[0x1E0CBCB50];
  v15[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v6, self->_cgImageProperties);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (-[NSNumber isEqualToNumber:](v7, "isEqualToNumber:", &unk_1E45CA6B8))
  {
    whiteBalance = self->_whiteBalance;
    self->_whiteBalance = v7;
    v9 = v7;
LABEL_5:
    v11 = v9;
LABEL_6:

    goto LABEL_7;
  }
  -[PFMetadataImage lightSource](self, "lightSource");
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    whiteBalance = self->_whiteBalance;
    self->_whiteBalance = v10;
    v9 = v10;
    goto LABEL_5;
  }
  -[PFMetadataImage whiteBalanceIndex](self, "whiteBalanceIndex");
  v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  if (v12)
  {
    v13 = -[NSNumber integerValue](v12, "integerValue");
    if (v13 <= 0x15)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", _computeWhiteBalanceValue_canonWhiteBalance[v13]);
      v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      whiteBalance = self->_whiteBalance;
      self->_whiteBalance = v14;
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)_computeISOSetting
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSNumber *v8;
  NSNumber *iso;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSNumber *v18;
  NSNumber *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSNumber *v24;
  NSNumber *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSNumber *v32;
  NSNumber *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCB50];
  v5 = *MEMORY[0x1E0CBCC38];
  v37[0] = *MEMORY[0x1E0CBCB50];
  v37[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v7, self->_cgImageProperties);
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  iso = self->_iso;
  self->_iso = v8;

  if (!self->_iso)
  {
    -[PFMetadata typeVerifier](self, "typeVerifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CBCFB0];
    v36[0] = *MEMORY[0x1E0CBCF98];
    v36[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKeyPath:fromProperties:", v13, self->_cgImageProperties);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_msgSend(v14, "count");
      if (v15)
      {
        v16 = v15;
        -[PFMetadata typeVerifier](self, "typeVerifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "valueAtIndex:forKey:fromArray:", v16 - 1, v11, v14);
        v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v19 = self->_iso;
        self->_iso = v18;

      }
    }

    if (!self->_iso)
    {
      -[PFMetadata typeVerifier](self, "typeVerifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x1E0CBCBC0];
      v35[0] = v4;
      v35[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("."));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "valueForKeyPath:fromProperties:", v23, self->_cgImageProperties);
      v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v25 = self->_iso;
      self->_iso = v24;

      if (!self->_iso)
      {
        -[PFMetadata typeVerifier](self, "typeVerifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *MEMORY[0x1E0CBCBC8];
        v34[0] = v4;
        v34[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("."));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "valueForKeyPath:fromProperties:", v29, self->_cgImageProperties);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          if (objc_msgSend(v30, "count"))
          {
            -[PFMetadata typeVerifier](self, "typeVerifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "valueAtIndex:forKey:fromArray:", 0, v27, v30);
            v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v33 = self->_iso;
            self->_iso = v32;

          }
        }

      }
    }
  }
}

- (void)_computeCameraSerialNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *cameraSerialNumber;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = *MEMORY[0x1E0CBCB50];
  v14[1] = CFSTR("CameraSerialNumber");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v5, self->_cgImageProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PFMetadata typeVerifier](self, "typeVerifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0CBCAF0];
    v13[0] = *MEMORY[0x1E0CBCA28];
    v13[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKeyPath:fromProperties:", v10, self->_cgImageProperties);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "stringValue");
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  cameraSerialNumber = self->_cameraSerialNumber;
  self->_cameraSerialNumber = (NSString *)v6;

}

- (void)_computeExposureTime
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  BOOL v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBCB50];
  v5 = *MEMORY[0x1E0CBCC78];
  v29[0] = *MEMORY[0x1E0CBCB50];
  v29[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:fromProperties:", v7, self->_cgImageProperties);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_3;
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CBCB78];
  v28[0] = v4;
  v28[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR("."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKeyPath:fromProperties:", v13, self->_cgImageProperties);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_3;
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CBCC70];
  v27[0] = v4;
  v27[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("."));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForKeyPath:fromProperties:", v19, self->_cgImageProperties);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v9 = 0;
    goto LABEL_77;
  }
  objc_msgSend(v14, "doubleValue");
  v21 = v20;
  v22 = exp2(-v20);
  v23 = 1.0 / v22;
  if (v21 == floor(v21))
  {
    if (v23 > 1.0)
      v22 = v22 * 1.024;
    if (v22 == 0.016)
      v22 = 0.0166666667;
    v24 = 0.0333333333;
    if (v22 != 0.032)
      v24 = v22;
    if (v24 != 0.064)
      goto LABEL_75;
  }
  else
  {
    if (v23 > 3100.0 && v23 < 3300.0)
    {
      v24 = 0.0003125;
      goto LABEL_75;
    }
    if (v23 > 2400.0 && v23 < 2600.0)
    {
      v24 = 0.0004;
      goto LABEL_75;
    }
    if (v23 > 1500.0 && v23 < 1700.0)
    {
      v24 = 0.000625;
      goto LABEL_75;
    }
    if (v23 > 1100.0 && v23 < 1300.0)
    {
      v24 = 0.0008;
      goto LABEL_75;
    }
    if (v23 > 700.0 && v23 < 900.0)
    {
      v24 = 0.00125;
      goto LABEL_75;
    }
    if (v23 > 600.0 && v23 < 700.0)
    {
      v24 = 0.0015625;
      goto LABEL_75;
    }
    if (v23 > 350.0 && v23 < 450.0)
    {
      v24 = 0.0025;
      goto LABEL_75;
    }
    if (v23 > 300.0 && v23 < 350.0)
    {
      v24 = 0.003125;
      goto LABEL_75;
    }
    if (v23 > 175.0 && v23 < 225.0)
    {
      v24 = 0.005;
      goto LABEL_75;
    }
    if (v23 > 150.0 && v23 < 170.0)
    {
      v24 = 0.00625;
      goto LABEL_75;
    }
    if (v23 > 115.0 && v23 < 135.0)
    {
      v24 = 0.008;
      goto LABEL_75;
    }
    if (v23 > 90.0 && v23 < 110.0)
    {
      v24 = 0.01;
      goto LABEL_75;
    }
    if (v23 > 70.0 && v23 < 90.0)
    {
      v24 = 0.0125;
      goto LABEL_75;
    }
    if (v23 > 55.0 && v23 < 65.0)
    {
      v24 = 0.0166666667;
      goto LABEL_75;
    }
    if (v23 > 45.0 && v23 < 55.0)
    {
      v24 = 0.02;
      goto LABEL_75;
    }
    if (v23 > 35.0 && v23 < 45.0)
    {
      v24 = 0.025;
      goto LABEL_75;
    }
    if (v23 > 27.0 && v23 < 33.0)
    {
      v24 = 0.0333333333;
      goto LABEL_75;
    }
    if (v23 > 23.0 && v23 < 27.0)
    {
      v24 = 0.04;
      goto LABEL_75;
    }
    if (v23 > 18.0 && v23 < 22.0)
    {
      v24 = 0.05;
      goto LABEL_75;
    }
    if (v23 <= 14.0 || v23 >= 17.0)
    {
      if (v23 <= 12.0 || v23 >= 14.0)
      {
        if (v23 <= 9.0 || v23 >= 11.0)
        {
          if (v23 <= 6.0 || v23 >= 7.0)
          {
            if (v23 <= 5.0 || v23 >= 6.0)
            {
              if (v23 <= 3.0 || v23 >= 4.0)
              {
                if (v23 <= 2.3 || v23 >= 3.0)
                {
                  v25 = v23 < 1.0;
                  v24 = v22;
                  if (v25)
                  {
                    if (v22 <= 27.0 || (v24 = 30.0, v22 >= 33.0))
                    {
                      if (v22 <= 23.0 || (v24 = 25.0, v22 >= 27.0))
                      {
                        if (v22 <= 18.0 || (v24 = 20.0, v22 >= 22.0))
                        {
                          if (v22 <= 14.0 || (v24 = 15.0, v22 >= 17.0))
                          {
                            if (v22 <= 12.0 || (v24 = 13.0, v22 >= 14.0))
                            {
                              if (v22 <= 9.0 || (v24 = 10.0, v22 >= 11.0))
                              {
                                v24 = 6.0;
                                if (v22 <= 6.0 || v22 >= 7.0)
                                {
                                  v24 = 5.0;
                                  if (v22 <= 5.0 || v22 >= 6.0)
                                  {
                                    v24 = 3.0;
                                    if (v22 <= 3.0 || v22 >= 4.0)
                                    {
                                      v26 = v22 >= 3.0 || v22 <= 2.3;
                                      v24 = 2.5;
                                      if (v26)
                                        v24 = v22;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
                else
                {
                  v24 = 0.4;
                }
              }
              else
              {
                v24 = 0.333333333;
              }
            }
            else
            {
              v24 = 0.2;
            }
          }
          else
          {
            v24 = 0.166666667;
          }
        }
        else
        {
          v24 = 0.1;
        }
      }
      else
      {
        v24 = 0.0769230769;
      }
      goto LABEL_75;
    }
  }
  v24 = 0.0666666667;
LABEL_75:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_3:
    -[PFMetadataImage _formatValue:withPrecision:](self, "_formatValue:withPrecision:", v9, 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    goto LABEL_4;
  }
  v14 = 0;
LABEL_77:
  v15 = 1;
LABEL_4:
  objc_storeStrong((id *)&self->_exposureTime, v14);
  if ((v15 & 1) == 0)

}

- (id)syndicationProperties
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFMetadataImage;
  -[PFMetadata syndicationProperties](&v5, sel_syndicationProperties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (id)_makeGPSProperties
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCD68], self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_makeDateTimeProperties
{
  return self->_cgImageProperties;
}

- (id)_makeGeometryProperties
{
  return self->_cgImageProperties;
}

- (id)_formatValue:(id)a3 withPrecision:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%.*f"), a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_hasFFCDimensions
{
  double v3;
  double v4;
  double v5;
  BOOL v7;

  -[PFMetadata exifPixelSize](self, "exifPixelSize");
  v4 = v3;
  -[PFMetadata exifPixelSize](self, "exifPixelSize");
  if (v4 == 640.0 && v5 == 480.0)
    return 1;
  v7 = v5 == 640.0 && v4 == 480.0;
  if (v7 || v4 == 1280.0 && v5 == 960.0)
    return 1;
  if (v4 == 960.0)
    return v5 == 1280.0;
  return 0;
}

- (BOOL)_hasScreenshotDimensions
{
  double v3;
  double v4;
  double v5;
  BOOL v8;
  BOOL v9;
  BOOL result;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;

  -[PFMetadata exifPixelSize](self, "exifPixelSize");
  v4 = v3;
  -[PFMetadata exifPixelSize](self, "exifPixelSize");
  if (v4 == 320.0 && v5 == 480.0)
    return 1;
  if (v5 == 320.0 && v4 == 480.0)
    return 1;
  v8 = v5 == 480.0;
  if (v4 != 960.0)
    v8 = 0;
  v9 = v5 == 960.0 && v4 == 640.0;
  result = 1;
  if (!v9 && !v8 && (v4 != 768.0 || v5 != 1024.0) && (v5 != 768.0 || v4 != 1024.0) && (v4 != 1536.0 || v5 != 2048.0))
  {
    v11 = v5 == 768.0;
    v12 = v4 == 640.0;
    if (v5 != 1136.0)
      v12 = 0;
    if (v4 != 1136.0)
      v11 = 0;
    v13 = v4 == 2048.0 && v5 == 640.0;
    if (!v13
      && !v12
      && !v11
      && (v4 != 750.0 || v5 != 1334.0)
      && (v5 != 750.0 || v4 != 1334.0)
      && (v4 != 1080.0 || v5 != 1920.0)
      && (v5 != 1080.0 || v4 != 1920.0)
      && (v4 != 1242.0 || v5 != 2208.0)
      && (v5 != 1242.0 || v4 != 2208.0)
      && (v4 != 1125.0 || v5 != 2001.0)
      && (v5 != 1125.0 || v4 != 2001.0)
      && (v4 != 312.0 || v5 != 390.0)
      && (v5 != 312.0 || v4 != 390.0)
      && (v4 != 272.0 || v5 != 340.0))
    {
      v14 = v5 == 2732.0 && v4 == 2048.0;
      v15 = v4 == 2732.0 && v5 == 2048.0;
      v16 = v4 == 340.0 && v5 == 272.0;
      if (!v16 && !v14 && !v15 && (v4 != 1668.0 || v5 != 2224.0))
      {
        v17 = v5 == 1125.0;
        v18 = v4 == 1125.0;
        if (v5 != 2436.0)
          v18 = 0;
        if (v4 != 2436.0)
          v17 = 0;
        v19 = v4 == 2224.0 && v5 == 1668.0;
        if (!v19
          && !v18
          && !v17
          && (v4 != 324.0 || v5 != 394.0)
          && (v5 != 324.0 || v4 != 394.0)
          && (v4 != 368.0 || v5 != 448.0))
        {
          v20 = v5 == 1242.0;
          v21 = v4 == 1242.0;
          if (v5 != 2688.0)
            v21 = 0;
          if (v4 != 2688.0)
            v20 = 0;
          v22 = v4 == 448.0 && v5 == 368.0;
          if (!v22 && !v21 && !v20 && (v4 != 828.0 || v5 != 1792.0))
          {
            v23 = v4 == 1668.0;
            if (v5 != 2388.0)
              v23 = 0;
            v24 = v4 == 1792.0 && v5 == 828.0;
            if (!v24 && !v23)
              return v4 == 2388.0 && v5 == 1668.0;
          }
        }
      }
    }
  }
  return result;
}

- (id)plistForEncoding
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFMetadataImage;
  -[PFMetadata plistForEncoding](&v6, sel_plistForEncoding);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_cgImageProperties, PFMetadataPlistCgImageProperties);
  return v4;
}

- (id)ptpMediaMetadata
{
  return self->_cgImageProperties;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFMetadataImage;
  v4 = -[PFMetadata copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 25, self->_cgImageProperties);
  objc_msgSend(v4, "setImageSource:", self->_imageSource);
  objc_storeStrong(v4 + 27, self->_imageData);
  objc_msgSend(v4, "setCgImageMetadata:", self->_cgImageMetadata);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSDictionary *cgImageProperties;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PFMetadataImage;
  if (-[PFMetadata isEqual:](&v18, sel_isEqual_, v4))
  {
    v5 = v4;
    cgImageProperties = self->_cgImageProperties;
    v7 = (cgImageProperties != 0) ^ (v5[25] == 0);
    if (cgImageProperties)
      v8 = !v7;
    else
      v8 = 1;
    if (!v8)
    {
      if (-[NSDictionary isEqualToDictionary:](cgImageProperties, "isEqualToDictionary:"))
      {
        LOBYTE(v7) = 1;
      }
      else
      {
        +[PFMetadata differencesBetweenDictionary:andDictionary:](PFMetadata, "differencesBetweenDictionary:andDictionary:", self->_cgImageProperties, v5[25]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          v11 = metadataLog;
          if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v10;
            _os_log_debug_impl(&dword_1A16EE000, v11, OS_LOG_TYPE_DEBUG, "metadata != otherMetadata: %@", buf, 0xCu);
          }
        }

        LOBYTE(v7) = 0;
      }
    }

  }
  else
  {
    v9 = (void *)metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
    {
      v13 = v9;
      v14 = (void *)objc_opt_class();
      v15 = v14;
      v16 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v20 = v14;
      v21 = 2112;
      v22 = v16;
      v17 = v16;
      _os_log_debug_impl(&dword_1A16EE000, v13, OS_LOG_TYPE_DEBUG, "Root object (%@ : %@) are not equal.", buf, 0x16u);

    }
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)setImageSourceProperties:(id)a3
{
  objc_storeStrong((id *)&self->_cachedImageSourceProperties, a3);
}

- (void)fixupGPSWithDate:(id)a3 time:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PFMetadata gpsDateTime](self, "gpsDateTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = *MEMORY[0x1E0CBCDE8];
    v11[0] = *MEMORY[0x1E0CBCD20];
    v11[1] = v9;
    v12[0] = v6;
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFMetadataImage setKeysAndValues:inDictionary:](self, "setKeysAndValues:inDictionary:", v10, *MEMORY[0x1E0CBCD68]);

    -[PFMetadata computeGPSValues](self, "computeGPSValues");
  }

}

- (void)setKeysAndValues:(id)a3 inDictionary:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  NSDictionary *v9;
  void *v10;
  NSDictionary *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  NSDictionary *cgImageProperties;
  PFMetadataImage *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = self;
  v8 = (NSDictionary *)-[NSDictionary mutableCopy](self->_cgImageProperties, "mutableCopy");
  v9 = v8;
  if (v7)
  {
    -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSDictionary *)objc_msgSend(v10, "mutableCopy");

    -[NSDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, v7);
  }
  else
  {
    v11 = v8;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v18, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  cgImageProperties = v20->_cgImageProperties;
  v20->_cgImageProperties = v9;

}

- (id)exifDictionary
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCB50], self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)exifAuxDictionary
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCA28], self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)makerAppleDictionary
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCF70], self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)makerNikonDictionary
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCF98], self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)makerCanonDictionary
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCF78], self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ciffDictionary
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", *MEMORY[0x1E0CBC898], self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)gifDictionary
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCCE0], self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)gpsDictionary
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCD68], self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tiffDictionary
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", *MEMORY[0x1E0CBD090], self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)iptcDictionary
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCED8], self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)rawDictionary
{
  void *v3;
  void *v4;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:fromProperties:", CFSTR("{raw}"), self->_cgImageProperties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDictionary)cgImageProperties
{
  return self->_cgImageProperties;
}

- (void)setCgImageProperties:(id)a3
{
  objc_storeStrong((id *)&self->_cgImageProperties, a3);
}

- (CGImageSource)imageSource
{
  return self->_imageSource;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (void)setFNumber:(id)a3
{
  objc_storeStrong((id *)&self->_fNumber, a3);
}

- (void)setExposureTime:(id)a3
{
  objc_storeStrong((id *)&self->_exposureTime, a3);
}

- (void)setIso:(id)a3
{
  objc_storeStrong((id *)&self->_iso, a3);
}

- (void)setCameraSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_cameraSerialNumber, a3);
}

- (void)setWhiteBalance:(id)a3
{
  objc_storeStrong((id *)&self->_whiteBalance, a3);
}

- (CGImageMetadata)cgImageMetadata
{
  return self->_cgImageMetadata;
}

void __29__PFMetadataImage_hdrGainMap__block_invoke(uint64_t a1, CGImageSourceRef isrc, size_t index, _BYTE *a4)
{
  uint64_t v6;
  CFDictionaryRef v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = *MEMORY[0x1E0CBC710];
  v7 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(isrc, index, (CFStringRef)*MEMORY[0x1E0CBC710]);
  if (v7)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "verifiedImageValue:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a4 = 1;
  }
}

@end

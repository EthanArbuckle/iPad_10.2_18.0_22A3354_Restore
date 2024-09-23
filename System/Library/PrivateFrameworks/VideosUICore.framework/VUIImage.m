@implementation VUIImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

+ (id)imageWithPath:(id)a3 cacheImmediately:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = a4;
    v6 = (objc_class *)MEMORY[0x1E0C99E98];
    v7 = a3;
    v8 = (void *)objc_msgSend([v6 alloc], "initFileURLWithPath:", v7);

    objc_msgSend(a1, "imageWithURL:cacheImmediately:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)imageWithURL:(id)a3 cacheImmediately:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  if (a3)
  {
    v4 = a4;
    v6 = a3;
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:cacheImmediately:", v6, v4);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (VUIImage)initWithURL:(id)a3 cacheImmediately:(BOOL)a4
{
  _BOOL4 v4;
  const __CFURL *v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  VUIImage *v11;
  CGImageSource *v12;
  CFDictionaryRef v13;
  void *v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  __CFString *Type;
  NSString *v20;
  NSString *imageType;
  objc_super v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v4 = a4;
  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = (const __CFURL *)a3;
  if (v7
    && (v23.receiver = self,
        v23.super_class = (Class)VUIImage,
        (self = -[VUIImage init](&v23, sel_init)) != 0))
  {
    v26 = *MEMORY[0x1E0CBD240];
    v8 = MEMORY[0x1E0C9AAB0];
    v27[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cacheImmediately = v4;
    if (v4)
    {
      v24 = *MEMORY[0x1E0CBD250];
      v25 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v10 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();

      v9 = v10;
    }
    else
    {
      v10 = 0;
    }
    v12 = CGImageSourceCreateWithURL(v7, v10);
    self->_imageSource = v12;
    if (v12)
    {
      v13 = CGImageSourceCopyPropertiesAtIndex(v12, 0, (CFDictionaryRef)v9);
      -[__CFDictionary objectForKey:](v13, "objectForKey:", *MEMORY[0x1E0CBD048]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      self->_imageWidth = v15;

      -[__CFDictionary objectForKey:](v13, "objectForKey:", *MEMORY[0x1E0CBD040]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      self->_imageHeight = v17;

      -[__CFDictionary objectForKey:](v13, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      self->_imageOrientation = objc_msgSend(v18, "intValue");

      Type = (__CFString *)CGImageSourceGetType(self->_imageSource);
      if (Type)
      {
        v20 = (NSString *)-[__CFString copy](Type, "copy");
        imageType = self->_imageType;
        self->_imageType = v20;

      }
      self->_enableCache = 0;
      if (v13)
        CFRelease(v13);
      objc_storeStrong((id *)&self->_imageURL, a3);
      v11 = self;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)uiImage
{
  void *v2;
  VUIImage *v3;
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CEA638];
  v3 = objc_retainAutorelease(self);
  v4 = -[VUIImage image](v3, "image");
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v2, "imageWithCGImage:scale:orientation:", v4, -[VUIImage _uiImageOrientation](v3, "_uiImageOrientation"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setEnableCache:(BOOL)a3
{
  self->_enableCache = a3;
  if (!self->_imageBufferInMemory && a3)
    self->_imageBufferInMemory = 1;
}

- (CGImage)image
{
  VUIImage *v2;
  CGImage *image;

  v2 = self;
  objc_sync_enter(v2);
  image = v2->_image;
  if (!image)
  {
    -[VUIImage _initializeCGImageWithRotation](v2, "_initializeCGImageWithRotation");
    image = v2->_image;
  }
  objc_sync_exit(v2);

  return image;
}

- (int64_t)_uiImageOrientation
{
  return objc_msgSend((id)objc_opt_class(), "imageOrientationForExifOrientation:", -[VUIImage orientation](self, "orientation"));
}

- (int)orientation
{
  return self->_imageOrientation;
}

- (void)_initializeCGImageWithRotation
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  _BOOL4 cacheImmediately;
  unsigned int imageOrientation;
  uint64_t v11;
  const __CFDictionary *v12;
  CGImageSource *imageSource;
  CGImage *ImageAtIndex;
  double Width;
  double Height;
  void *v17;
  void *v18;
  CGImage *v19;
  CGImageSource *v20;
  NSObject *v21;
  NSURL *imageURL;
  NSData *imageData;
  NSURL *v24;
  NSData *v25;
  NSObject *v26;
  NSObject *v27;
  double imageHeight;
  float imageWidth;
  float v30;
  float v31;
  float v32;
  int v34;
  NSObject *v35;
  CFNumberRef v36;
  CFNumberRef v37;
  void *v38;
  uint64_t v39;
  const __CFDictionary *v40;
  CGImage *ThumbnailAtIndex;
  float valuePtr;
  _QWORD v43[5];
  void *values[3];
  uint64_t v45;
  uint64_t v46;
  _BYTE buf[24];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (self->_image || !self->_imageSource)
    return;
  VUICImageLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  VUICImageLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D951F000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Perf.VUIImage.InitCGImage", (const char *)&unk_1D9552C89, buf, 2u);
  }

  VUICImageLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    cacheImmediately = self->_cacheImmediately;
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v8;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = cacheImmediately;
    _os_log_impl(&dword_1D951F000, v7, OS_LOG_TYPE_DEFAULT, "VUIImage::InitCGImage (%p), isMainThread: %d, cacheImmediately: %d", buf, 0x18u);
  }

  if (-[VUIImage rotationEnabled](self, "rotationEnabled"))
  {
    imageOrientation = self->_imageOrientation;
    if (imageOrientation - 9 > 0xFFFFFFF8)
    {
      imageHeight = self->_imageHeight;
      imageWidth = self->_imageWidth;
      v30 = imageHeight;
      if (imageOrientation <= 4)
        v31 = self->_imageWidth;
      else
        v31 = imageHeight;
      if (imageOrientation <= 4)
        imageWidth = v30;
      if (v31 >= imageWidth)
        v32 = v31;
      else
        v32 = imageWidth;
      valuePtr = v32;
      if (v31 <= 1920.0 && imageWidth <= 1080.0)
        goto LABEL_53;
      if ((float)(v31 / imageWidth) <= 1.7778)
      {
        v34 = 1149698048;
        if (v31 > imageWidth)
        {
          valuePtr = (float)((float)(imageWidth + (float)(v31 * 1080.0)) + -1.0) / imageWidth;
          goto LABEL_53;
        }
      }
      else
      {
        v34 = 1156579328;
      }
      valuePtr = *(float *)&v34;
LABEL_53:
      v36 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
      if (v36)
      {
        v37 = v36;
        v38 = (void *)*MEMORY[0x1E0C9AE50];
        v39 = *MEMORY[0x1E0CBD190];
        *(_QWORD *)buf = *MEMORY[0x1E0CBD178];
        *(_QWORD *)&buf[8] = v39;
        values[0] = v38;
        values[1] = v38;
        *(_QWORD *)&buf[16] = *MEMORY[0x1E0CBD2A0];
        values[2] = v36;
        v40 = CFDictionaryCreate(0, (const void **)buf, (const void **)values, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        CFRelease(v37);
      }
      else
      {
        v40 = 0;
      }
      ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(self->_imageSource, 0, v40);
      self->_image = ThumbnailAtIndex;
      self->_imageWidth = (double)CGImageGetWidth(ThumbnailAtIndex);
      self->_imageHeight = (double)CGImageGetHeight(self->_image);
      self->_imageOrientation = 1;
      if (v40)
        CFRelease(v40);
      goto LABEL_22;
    }
  }
  if (self->_cacheImmediately)
  {
    v45 = *MEMORY[0x1E0CBD250];
    v46 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v12 = (const __CFDictionary *)v11;
    goto LABEL_15;
  }
  if (self->_enableCache)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CBD240], 0);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (self->_imageURL)
  {
    CFRelease(self->_imageSource);
    imageSource = CGImageSourceCreateWithURL((CFURLRef)self->_imageURL, 0);
    self->_imageSource = imageSource;
    if (!imageSource)
    {
      VUICImageLogObject();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
LABEL_63:
        _os_log_impl(&dword_1D951F000, v35, OS_LOG_TYPE_INFO, "Null image source after creation", buf, 2u);
        goto LABEL_64;
      }
      goto LABEL_64;
    }
    goto LABEL_60;
  }
  if (self->_imageData)
  {
    CFRelease(self->_imageSource);
    imageSource = CGImageSourceCreateWithData((CFDataRef)self->_imageData, 0);
    self->_imageSource = imageSource;
    if (!imageSource)
    {
      VUICImageLogObject();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        goto LABEL_63;
      }
LABEL_64:

      goto LABEL_65;
    }
LABEL_60:
    v12 = 0;
    goto LABEL_16;
  }
LABEL_65:
  v12 = 0;
LABEL_15:
  imageSource = self->_imageSource;
  if (imageSource)
  {
LABEL_16:
    ImageAtIndex = CGImageSourceCreateImageAtIndex(imageSource, 0, v12);
    self->_image = ImageAtIndex;
    if (self->_cacheImmediately && ImageAtIndex)
    {
      Width = (double)CGImageGetWidth(ImageAtIndex);
      Height = (double)CGImageGetHeight(self->_image);
      +[VUIGraphicsImageRenderer formatWithCGImage:](VUIGraphicsImageRenderer, "formatWithCGImage:", self->_image);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setScale:", 1.0);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __42__VUIImage__initializeCGImageWithRotation__block_invoke;
      v43[3] = &unk_1E9F2C988;
      v43[4] = self;
      +[VUIGraphicsImageRenderer imageWithSize:format:cgContextActions:](VUIGraphicsImageRenderer, "imageWithSize:format:cgContextActions:", v17, v43, Width, Height);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        CGImageRelease(self->_image);
        v19 = (CGImage *)objc_msgSend(objc_retainAutorelease(v18), "CGImage");
        self->_image = v19;
        CGImageRetain(v19);
      }

    }
  }

LABEL_22:
  v20 = self->_imageSource;
  if (v20)
  {
    CFRelease(v20);
    self->_imageSource = 0;
  }
  else
  {
    VUICImageLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      imageURL = self->_imageURL;
      imageData = self->_imageData;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = imageURL;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = imageData;
      _os_log_impl(&dword_1D951F000, v21, OS_LOG_TYPE_INFO, "_imageSource is unexpectedly NULL. %@, %p", buf, 0x16u);
    }

  }
  v24 = self->_imageURL;
  self->_imageURL = 0;

  v25 = self->_imageData;
  self->_imageData = 0;

  VUICImageLogObject();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D951F000, v27, OS_SIGNPOST_INTERVAL_END, v4, "Perf.VUIImage.InitCGImage", (const char *)&unk_1D9552C89, buf, 2u);
  }

}

- (BOOL)rotationEnabled
{
  return self->_rotationEnabled;
}

+ (int64_t)imageOrientationForExifOrientation:(int)a3
{
  if ((a3 - 2) > 6)
    return 0;
  else
    return qword_1D954F9E8[a3 - 2];
}

void __42__VUIImage__initializeCGImageWithRotation__block_invoke(uint64_t a1, CGContextRef c)
{
  CGRect ClipBoundingBox;

  ClipBoundingBox = CGContextGetClipBoundingBox(c);
  CGContextDrawImage(c, ClipBoundingBox, *(CGImageRef *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)dealloc
{
  CGImage *image;
  CGImageSource *imageSource;
  NSURL *imageURL;
  NSData *imageData;
  NSString *imageType;
  objc_super v8;

  image = self->_image;
  if (image)
    CGImageRelease(image);
  imageSource = self->_imageSource;
  if (imageSource)
    CFRelease(imageSource);
  imageURL = self->_imageURL;
  self->_imageURL = 0;

  imageData = self->_imageData;
  self->_imageData = 0;

  imageType = self->_imageType;
  self->_imageType = 0;

  v8.receiver = self;
  v8.super_class = (Class)VUIImage;
  -[VUIImage dealloc](&v8, sel_dealloc);
}

+ (id)imageWithPath:(id)a3
{
  return (id)objc_msgSend(a1, "imageWithPath:cacheImmediately:", a3, 0);
}

+ (id)imageWithURL:(id)a3
{
  return (id)objc_msgSend(a1, "imageWithURL:cacheImmediately:", a3, 0);
}

+ (id)imageWithData:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)imageWithCGImageRef:(CGImage *)a3 preserveAlpha:(BOOL)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCGImageRef:imageOrientation:preserveAlpha:", a3, 0, a4);
}

+ (id)imageWithCGImageRef:(CGImage *)a3 imageOrientation:(int64_t)a4 preserveAlpha:(BOOL)a5
{
  if (a3)
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCGImageRef:imageOrientation:preserveAlpha:", a3, a4, a5);
  else
    return 0;
}

+ (id)imageWithRotationFromURL:(id)a3
{
  const __CFURL *v4;
  const __CFURL *v5;
  CGImageSourceRef v6;
  CGImageSourceRef v7;
  void *v8;

  v4 = (const __CFURL *)a3;
  v5 = v4;
  if (v4 && (v6 = CGImageSourceCreateWithURL(v4, 0)) != 0)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCGImageSourceRotationEnabled:", v6);
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)imageWithRotationFromPath:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "imageWithRotationFromURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (VUIImage)initWithCGImageRef:(CGImage *)a3 preserveAlpha:(BOOL)a4
{
  return -[VUIImage initWithCGImageRef:imageOrientation:preserveAlpha:](self, "initWithCGImageRef:imageOrientation:preserveAlpha:", a3, 0, a4);
}

- (VUIImage)initWithCGImageRef:(CGImage *)a3 imageOrientation:(int64_t)a4 preserveAlpha:(BOOL)a5
{
  _BOOL4 v5;
  VUIImage *v8;
  CGImageAlphaInfo AlphaInfo;
  id *v10;
  uint64_t v11;
  NSString *imageType;
  objc_super v14;

  if (a3)
  {
    v5 = a5;
    v14.receiver = self;
    v14.super_class = (Class)VUIImage;
    self = -[VUIImage init](&v14, sel_init);
    v8 = self;
    if (self)
    {
      self->_image = a3;
      CFRetain(a3);
      v8->_imageWidth = (double)CGImageGetWidth(v8->_image);
      v8->_imageHeight = (double)CGImageGetHeight(v8->_image);
      v8->_imageOrientation = objc_msgSend((id)objc_opt_class(), "exifOrientationForImageOrientation:", a4);
      v8->_enableCache = 0;
      AlphaInfo = CGImageGetAlphaInfo(a3);
      if (v5 && (AlphaInfo > kCGImageAlphaNoneSkipFirst || ((1 << AlphaInfo) & 0x61) == 0))
        v10 = (id *)MEMORY[0x1E0CA5C10];
      else
        v10 = (id *)MEMORY[0x1E0CA5BA8];
      v11 = objc_msgSend(*v10, "copy");
      imageType = v8->_imageType;
      v8->_imageType = (NSString *)v11;

      v8->_imageBufferInMemory = 1;
      self = v8;
      v8 = self;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (VUIImage)initWithCGImageRef:(CGImage *)a3 exifOrientation:(int)a4 preserveAlpha:(BOOL)a5
{
  _BOOL4 v5;
  VUIImage *v8;
  CGImageAlphaInfo AlphaInfo;
  id *v10;
  uint64_t v11;
  NSString *imageType;
  objc_super v14;

  if (a3)
  {
    v5 = a5;
    v14.receiver = self;
    v14.super_class = (Class)VUIImage;
    self = -[VUIImage init](&v14, sel_init);
    v8 = self;
    if (self)
    {
      self->_image = a3;
      CFRetain(a3);
      v8->_imageWidth = (double)CGImageGetWidth(v8->_image);
      v8->_imageHeight = (double)CGImageGetHeight(v8->_image);
      v8->_imageOrientation = a4;
      v8->_enableCache = 0;
      AlphaInfo = CGImageGetAlphaInfo(a3);
      if (v5 && (AlphaInfo > kCGImageAlphaNoneSkipFirst || ((1 << AlphaInfo) & 0x61) == 0))
        v10 = (id *)MEMORY[0x1E0CA5C10];
      else
        v10 = (id *)MEMORY[0x1E0CA5BA8];
      v11 = objc_msgSend(*v10, "copy");
      imageType = v8->_imageType;
      v8->_imageType = (NSString *)v11;

      v8->_imageBufferInMemory = 1;
      self = v8;
      v8 = self;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (VUIImage)initWithURL:(id)a3
{
  return -[VUIImage initWithURL:cacheImmediately:](self, "initWithURL:cacheImmediately:", a3, 0);
}

- (VUIImage)initWithData:(id)a3
{
  const __CFData *v5;
  const __CFDictionary *v6;
  CGImageSource *v7;
  CFDictionaryRef v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  void *v13;
  __CFString *Type;
  NSString *v15;
  NSString *imageType;
  VUIImage *v17;
  objc_super v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = (const __CFData *)a3;
  if (v5
    && (v19.receiver = self,
        v19.super_class = (Class)VUIImage,
        (self = -[VUIImage init](&v19, sel_init)) != 0))
  {
    v20 = *MEMORY[0x1E0CBD250];
    v21[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = CGImageSourceCreateWithData(v5, v6);
    self->_imageSource = v7;
    if (v7)
    {
      v8 = CGImageSourceCopyPropertiesAtIndex(v7, 0, v6);
      -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x1E0CBD048]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      self->_imageWidth = v10;

      -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x1E0CBD040]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      self->_imageHeight = v12;

      -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      self->_imageOrientation = objc_msgSend(v13, "intValue");

      Type = (__CFString *)CGImageSourceGetType(self->_imageSource);
      if (Type)
      {
        v15 = (NSString *)-[__CFString copy](Type, "copy");
        imageType = self->_imageType;
        self->_imageType = v15;

      }
      self->_enableCache = 0;
      self->_imageBufferInMemory = 1;
      self->_cacheImmediately = !+[VUICoreUtilities canHandleDecodingOnRenderThread](VUICoreUtilities, "canHandleDecodingOnRenderThread");
      if (v8)
        CFRelease(v8);
      objc_storeStrong((id *)&self->_imageData, a3);
      v17 = self;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGImage *v9;
  CGRect v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = -[VUIImage image](objc_retainAutorelease(self), "image");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGContextDrawImage(a3, v10, v9);
}

- (id)imageType
{
  return self->_imageType;
}

- (BOOL)hasAlpha
{
  return -[NSString isEqualToString:](self->_imageType, "isEqualToString:", *MEMORY[0x1E0CA5C10]);
}

- (CGSize)pixelBounds
{
  double imageWidth;
  double imageHeight;
  CGSize result;

  imageWidth = self->_imageWidth;
  imageHeight = self->_imageHeight;
  result.height = imageHeight;
  result.width = imageWidth;
  return result;
}

- (float)aspectRatio
{
  double imageHeight;

  imageHeight = self->_imageHeight;
  if (imageHeight == 0.0)
    return 0.0;
  else
    return self->_imageWidth / imageHeight;
}

- (BOOL)isPowerOfTwo
{
  return ((unint64_t)self->_imageWidth & ((unint64_t)self->_imageWidth - 1)) == 0
      && ((unint64_t)self->_imageHeight & ((unint64_t)self->_imageHeight - 1)) == 0;
}

- (BOOL)sourceRequiresRotation
{
  return (self->_imageOrientation - 2) < 7;
}

- (BOOL)enableCache
{
  return self->_enableCache;
}

- (CGRect)largestSquareRect
{
  double v2;
  double v3;
  float v4;
  float v5;
  float v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[VUIImage pixelBounds](self, "pixelBounds");
  v4 = v2;
  if (v3 >= v4)
  {
    v6 = v2;
  }
  else
  {
    v5 = v3;
    v6 = v5;
  }
  v7 = v2 == v6;
  v8 = floorf((float)(v4 * 0.5) - (float)(v6 * 0.5));
  v9 = floor(v3 * 0.5 - (float)(v6 * 0.5));
  if (v7)
    v8 = 0.0;
  else
    v9 = 0.0;
  v10 = floorf(v6);
  v11 = v10;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (id)squareImageFromNearSquareImageWithAspectRatioLimit:(float)a3
{
  VUIImage *v4;
  uint64_t v5;
  double imageHeight;
  double imageWidth;
  BOOL v9;
  double v10;
  double v11;
  float v12;
  VUIImage *v13;
  CGImage *v15;
  CGImage *v16;
  CGRect v17;

  v4 = objc_retainAutorelease(self);
  v5 = -[VUIImage image](v4, "image");
  if (!v5)
    goto LABEL_10;
  imageHeight = v4->_imageHeight;
  if (imageHeight == 0.0)
    goto LABEL_10;
  imageWidth = v4->_imageWidth;
  if (imageWidth == 0.0 || imageWidth == imageHeight)
    goto LABEL_10;
  v9 = imageWidth < imageHeight;
  v10 = imageHeight / imageWidth;
  v11 = imageWidth / imageHeight;
  if (!v9)
    v11 = v10;
  v12 = v11;
  if (v12 < a3)
  {
LABEL_10:
    v13 = v4;
  }
  else
  {
    v15 = (CGImage *)v5;
    -[VUIImage largestSquareRect](v4, "largestSquareRect");
    v16 = CGImageCreateWithImageInRect(v15, v17);
    +[VUIImage imageWithCGImageRef:preserveAlpha:](VUIImage, "imageWithCGImageRef:preserveAlpha:", v16, 0);
    v13 = (VUIImage *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v16);
  }
  return v13;
}

- (BOOL)isImageBufferInMemory
{
  return self->_imageBufferInMemory;
}

+ (int)exifOrientationForImageOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return 1;
  else
    return dword_1D954F9C8[a3 - 1];
}

- (id)_initWithCGImageSourceRotationEnabled:(CGImageSource *)a3
{
  VUIImage *v4;
  __CFString *Type;
  uint64_t v6;
  NSString *imageType;
  CFDictionaryRef v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  void *v13;
  objc_super v15;

  if (a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)VUIImage;
    self = -[VUIImage init](&v15, sel_init);
    v4 = self;
    if (self)
    {
      self->_imageSource = a3;
      CFRetain(a3);
      Type = (__CFString *)CGImageSourceGetType(v4->_imageSource);
      if (Type)
      {
        v6 = -[__CFString copy](Type, "copy");
        imageType = v4->_imageType;
        v4->_imageType = (NSString *)v6;

      }
      v8 = CGImageSourceCopyPropertiesAtIndex(v4->_imageSource, 0, 0);
      -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x1E0CBD048]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      v4->_imageWidth = v10;

      -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x1E0CBD040]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v4->_imageHeight = v12;

      -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_imageOrientation = objc_msgSend(v13, "intValue");

      v4->_rotationEnabled = 1;
      v4->_enableCache = 0;
      if (v8)
        CFRelease(v8);
      -[VUIImage _initializeCGImageWithRotation](v4, "_initializeCGImageWithRotation");
      self = v4;
      v4 = self;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRotationEnabled:(BOOL)a3
{
  self->_rotationEnabled = a3;
}

@end

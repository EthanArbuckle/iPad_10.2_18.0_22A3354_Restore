@implementation TVImage

- (TVImage)initWithCGImageRef:(CGImage *)a3 imageOrientation:(int64_t)a4 preserveAlpha:(BOOL)a5
{
  _BOOL4 v5;
  TVImage *v8;
  CGImageAlphaInfo AlphaInfo;
  id *v10;
  uint64_t v11;
  NSString *imageType;
  objc_super v14;

  if (a3)
  {
    v5 = a5;
    v14.receiver = self;
    v14.super_class = (Class)TVImage;
    self = -[TVImage init](&v14, sel_init);
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
        v10 = (id *)MEMORY[0x24BDC1820];
      else
        v10 = (id *)MEMORY[0x24BDC17C0];
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
  v8.super_class = (Class)TVImage;
  -[TVImage dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

+ (id)imageWithCGImageRef:(CGImage *)a3 preserveAlpha:(BOOL)a4
{
  return (id)objc_msgSend(a1, "imageWithCGImageRef:imageOrientation:preserveAlpha:", a3, 0, a4);
}

+ (id)imageWithCGImageRef:(CGImage *)a3 imageOrientation:(int64_t)a4 preserveAlpha:(BOOL)a5
{
  if (a3)
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCGImageRef:imageOrientation:preserveAlpha:", a3, a4, a5);
  else
    return 0;
}

+ (int)exifOrientationForImageOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return 1;
  else
    return dword_222E77080[a3 - 1];
}

+ (id)imageWithURL:(id)a3
{
  return (id)objc_msgSend(a1, "imageWithURL:cacheImmediately:", a3, 0);
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

+ (id)imageWithPath:(id)a3
{
  return (id)objc_msgSend(a1, "imageWithPath:cacheImmediately:", a3, 0);
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
    v6 = (objc_class *)MEMORY[0x24BDBCF48];
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
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:");
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

- (TVImage)initWithCGImageRef:(CGImage *)a3 preserveAlpha:(BOOL)a4
{
  return -[TVImage initWithCGImageRef:imageOrientation:preserveAlpha:](self, "initWithCGImageRef:imageOrientation:preserveAlpha:", a3, 0, a4);
}

- (TVImage)initWithURL:(id)a3
{
  return -[TVImage initWithURL:cacheImmediately:](self, "initWithURL:cacheImmediately:", a3, 0);
}

- (TVImage)initWithURL:(id)a3 cacheImmediately:(BOOL)a4
{
  _BOOL4 v4;
  const __CFURL *v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  TVImage *v11;
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
  v27[1] = *MEMORY[0x24BDAC8D0];
  v7 = (const __CFURL *)a3;
  if (v7
    && (v23.receiver = self,
        v23.super_class = (Class)TVImage,
        (self = -[TVImage init](&v23, sel_init)) != 0))
  {
    v26 = *MEMORY[0x24BDD97D0];
    v8 = MEMORY[0x24BDBD1C8];
    v27[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cacheImmediately = v4;
    if (v4)
    {
      v24 = *MEMORY[0x24BDD97D8];
      v25 = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
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
      -[__CFDictionary objectForKey:](v13, "objectForKey:", *MEMORY[0x24BDD96C8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      self->_imageWidth = v15;

      -[__CFDictionary objectForKey:](v13, "objectForKey:", *MEMORY[0x24BDD96C0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      self->_imageHeight = v17;

      -[__CFDictionary objectForKey:](v13, "objectForKey:", *MEMORY[0x24BDD9698]);
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

- (TVImage)initWithData:(id)a3
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
  TVImage *v17;
  objc_super v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = (const __CFData *)a3;
  if (v5
    && (v19.receiver = self,
        v19.super_class = (Class)TVImage,
        (self = -[TVImage init](&v19, sel_init)) != 0))
  {
    v20 = *MEMORY[0x24BDD97D8];
    v21[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = CGImageSourceCreateWithData(v5, v6);
    self->_imageSource = v7;
    if (v7)
    {
      v8 = CGImageSourceCopyPropertiesAtIndex(v7, 0, v6);
      -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x24BDD96C8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      self->_imageWidth = v10;

      -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x24BDD96C0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      self->_imageHeight = v12;

      -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x24BDD9698]);
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
      self->_cacheImmediately = !+[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread");
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
  v9 = -[TVImage image](objc_retainAutorelease(self), "image");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGContextDrawImage(a3, v10, v9);
}

- (id)uiImage
{
  void *v2;
  TVImage *v3;
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  v3 = objc_retainAutorelease(self);
  v4 = -[TVImage image](v3, "image");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v2, "imageWithCGImage:scale:orientation:", v4, -[TVImage _uiImageOrientation](v3, "_uiImageOrientation"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGImage)image
{
  TVImage *v2;
  CGImage *image;

  v2 = self;
  objc_sync_enter(v2);
  image = v2->_image;
  if (!image)
  {
    -[TVImage _initializeCGImageWithRotation](v2, "_initializeCGImageWithRotation");
    image = v2->_image;
  }
  objc_sync_exit(v2);

  return image;
}

- (id)imageType
{
  return self->_imageType;
}

- (BOOL)hasAlpha
{
  return -[NSString isEqualToString:](self->_imageType, "isEqualToString:", *MEMORY[0x24BDC1820]);
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

- (void)setEnableCache:(BOOL)a3
{
  self->_enableCache = a3;
  if (!self->_imageBufferInMemory && a3)
    self->_imageBufferInMemory = 1;
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
  double v6;
  BOOL v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[TVImage pixelBounds](self, "pixelBounds");
  v4 = v2;
  if (v3 < v4)
  {
    v5 = v3;
    v4 = v5;
  }
  v6 = (float)(v4 * 0.5);
  v7 = v2 == v4;
  v8 = v2 * 0.5 - v6;
  v9 = floorf(v8);
  v10 = floor(v3 * 0.5 - v6);
  if (v7)
    v9 = 0.0;
  else
    v10 = 0.0;
  v11 = floorf(v4);
  v12 = v11;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)squareImageFromNearSquareImageWithAspectRatioLimit:(float)a3
{
  TVImage *v4;
  uint64_t v5;
  double imageHeight;
  double imageWidth;
  BOOL v9;
  double v10;
  double v11;
  float v12;
  TVImage *v13;
  CGImage *v15;
  CGImage *v16;
  CGRect v17;

  v4 = objc_retainAutorelease(self);
  v5 = -[TVImage image](v4, "image");
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
    -[TVImage largestSquareRect](v4, "largestSquareRect");
    v16 = CGImageCreateWithImageInRect(v15, v17);
    +[TVImage imageWithCGImageRef:preserveAlpha:](TVImage, "imageWithCGImageRef:preserveAlpha:", v16, 0);
    v13 = (TVImage *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v16);
  }
  return v13;
}

- (BOOL)isImageBufferInMemory
{
  return self->_imageBufferInMemory;
}

- (int64_t)_uiImageOrientation
{
  return objc_msgSend((id)objc_opt_class(), "imageOrientationForExifOrientation:", -[TVImage orientation](self, "orientation"));
}

+ (int64_t)imageOrientationForExifOrientation:(int)a3
{
  if ((a3 - 2) > 6)
    return 0;
  else
    return qword_222E770A0[a3 - 2];
}

- (id)_initWithCGImageSourceRotationEnabled:(CGImageSource *)a3
{
  TVImage *v4;
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
    v15.super_class = (Class)TVImage;
    self = -[TVImage init](&v15, sel_init);
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
      -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x24BDD96C8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      v4->_imageWidth = v10;

      -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x24BDD96C0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v4->_imageHeight = v12;

      -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x24BDD9698]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_imageOrientation = objc_msgSend(v13, "intValue");

      v4->_rotationEnabled = 1;
      v4->_enableCache = 0;
      if (v8)
        CFRelease(v8);
      -[TVImage _initializeCGImageWithRotation](v4, "_initializeCGImageWithRotation");
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

- (void)_initializeCGImageWithRotation
{
  OUTLINED_FUNCTION_0(&dword_222D98000, a1, a3, "Null image source after creation", a5, a6, a7, a8, 0);
}

void __41__TVImage__initializeCGImageWithRotation__block_invoke(uint64_t a1, CGContextRef c)
{
  CGRect ClipBoundingBox;

  ClipBoundingBox = CGContextGetClipBoundingBox(c);
  CGContextDrawImage(c, ClipBoundingBox, *(CGImageRef *)(*(_QWORD *)(a1 + 32) + 8));
}

- (int)orientation
{
  return self->_imageOrientation;
}

- (BOOL)rotationEnabled
{
  return self->_rotationEnabled;
}

- (void)setRotationEnabled:(BOOL)a3
{
  self->_rotationEnabled = a3;
}

@end

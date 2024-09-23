@implementation PBUICodableImage

- (PBUICodableImage)initWithIOSurface:(id)a3 scale:(double)a4 error:(id *)a5
{
  id v8;
  PBUICodableImage *v9;
  PBUICodableImage *v10;

  v8 = a3;
  v9 = -[PBUICodableImage init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->_representation = 2;
    objc_storeStrong((id *)&v9->_surface, a3);
    v10->_scale = a4;
  }

  return v10;
}

+ (id)makeWithOther:(id)a3
{
  id v3;
  PBUICodableImage *v4;
  CGImage *v5;
  CGImage *v6;

  v3 = a3;
  v4 = objc_alloc_init(PBUICodableImage);
  v4->_representation = *((_QWORD *)v3 + 1);
  objc_storeStrong((id *)&v4->_surface, *((id *)v3 + 2));
  objc_storeStrong((id *)&v4->_url, *((id *)v3 + 3));
  v5 = (CGImage *)*((_QWORD *)v3 + 4);
  if (v5)
    v5 = CGImageRetain(v5);
  v4->_sourceImage = v5;
  v6 = (CGImage *)*((_QWORD *)v3 + 6);
  if (v6)
    v6 = CGImageRetain(v6);
  v4->_cachedImage = v6;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PBUICodableImage *v4;
  CGImage *sourceImage;
  CGImage *cachedImage;

  v4 = -[PBUICodableImage init](+[PBUICodableImage allocWithZone:](PBUICodableImage, "allocWithZone:", a3), "init");
  v4->_representation = self->_representation;
  objc_storeStrong((id *)&v4->_surface, self->_surface);
  objc_storeStrong((id *)&v4->_url, self->_url);
  sourceImage = self->_sourceImage;
  if (sourceImage)
    sourceImage = CGImageRetain(sourceImage);
  v4->_sourceImage = sourceImage;
  cachedImage = self->_cachedImage;
  if (cachedImage)
    cachedImage = CGImageRetain(cachedImage);
  v4->_cachedImage = cachedImage;
  return v4;
}

- (id)initFromSourceData:(id)a3 scale:(double)a4 error:(id *)a5
{
  id v8;
  CGImage *v9;
  PBUICodableImage *v10;
  PBUICodableImage *v11;
  uint64_t v12;
  NSData *bitmapSourceData;
  objc_super v15;

  v8 = a3;
  v9 = +[PBUICodableImage createCGImageFromData:error:](PBUICodableImage, "createCGImageFromData:error:", v8, a5);
  if (v9)
  {
    if (CGImageGetImageSource())
    {
      v10 = -[PBUICodableImage initWithCGImage:scale:error:](self, "initWithCGImage:scale:error:", v9, a5, a4);
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)PBUICodableImage;
      v11 = -[PBUICodableImage init](&v15, sel_init);
      v10 = v11;
      if (v11)
      {
        v11->_cachedImage = v9;
        v11->_representation = 1;
        v12 = objc_msgSend(v8, "copy");
        bitmapSourceData = v10->_bitmapSourceData;
        v10->_bitmapSourceData = (NSData *)v12;

        v10->_scale = a4;
        goto LABEL_7;
      }
    }
    CGImageRelease(v9);
LABEL_7:
    self = v10;
    v9 = (CGImage *)self;
  }

  return v9;
}

- (id)initFromURL:(id)a3 scale:(double)a4 error:(id *)a5
{
  id v8;
  PBUICodableImage *v9;
  PBUICodableImage *v10;
  uint64_t v11;
  NSURL *url;
  uint64_t v13;
  PBUICodableImage *v14;

  v8 = a3;
  v9 = -[PBUICodableImage init](self, "init");
  v10 = v9;
  if (!v9)
    goto LABEL_3;
  v9->_representation = 3;
  v11 = objc_msgSend(v8, "copy");
  url = v10->_url;
  v10->_url = (NSURL *)v11;

  v10->_scale = a4;
  v13 = objc_msgSend((id)objc_opt_class(), "createCGImageFromURL:error:", v10->_url, a5);
  v10->_cachedImage = (CGImage *)v13;
  if (!v13)
    v14 = 0;
  else
LABEL_3:
    v14 = v10;

  return v14;
}

- (PBUICodableImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 error:(id *)a5
{
  PBUICodableImage *v7;
  PBUICodableImage *v8;

  v7 = -[PBUICodableImage init](self, "init", a3, a5);
  v8 = v7;
  if (v7)
  {
    v7->_representation = 0;
    v7->_sourceImage = CGImageRetain(a3);
    v8->_scale = a4;
  }
  return v8;
}

- (PBUICodableImage)initWithUIImage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  PBUICodableImage *v8;
  id v9;
  uint64_t CGImageRepresentation;
  PBUICodableImage *v11;

  v6 = a3;
  objc_msgSend(v6, "ioSurface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "scale");
    v8 = -[PBUICodableImage initWithIOSurface:scale:error:](self, "initWithIOSurface:scale:error:", v7, a4);
  }
  else
  {
    v9 = objc_retainAutorelease(v6);
    CGImageRepresentation = objc_msgSend(v9, "CGImage");
    if (!CGImageRepresentation)
    {
      CGImageRepresentation = _UIImageGetCGImageRepresentation();
      if (!CGImageRepresentation)
      {
        v11 = 0;
        goto LABEL_7;
      }
    }
    objc_msgSend(v9, "scale");
    v8 = -[PBUICodableImage initWithCGImage:scale:error:](self, "initWithCGImage:scale:error:", CGImageRepresentation, a4);
  }
  self = v8;
  v11 = self;
LABEL_7:

  return v11;
}

- (CGImage)CGImage
{
  CGImage *result;

  result = self->_cachedImage;
  if (!result)
  {
    result = self->_sourceImage;
    if (!result)
    {
      result = -[PBUICodableImage buildCGImageWithError:](self, "buildCGImageWithError:", 0);
      self->_cachedImage = result;
    }
  }
  return result;
}

- (CGImage)buildCGImageWithError:(id *)a3
{
  uint64_t v5;
  CGImage *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSURL *url;
  id v13;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (self->_surface)
  {
    v5 = CGImageCreateFromIOSurface();
    if (v5)
    {
      v6 = (CGImage *)v5;
      v7 = 0;
      goto LABEL_11;
    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2938];
    v16[0] = *MEMORY[0x1E0CB2D60];
    v16[1] = v9;
    v17[0] = CFSTR("IOSurface failed to be made into a CGImage.");
    v17[1] = CFSTR("Check os_log for errors from ImageIO.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.RendererService"), 1, v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (!self->_url
    || (v11 = (void *)objc_opt_class(),
        url = self->_url,
        v15 = 0,
        v6 = (CGImage *)objc_msgSend(v11, "createCGImageFromURL:error:", url, &v15),
        v13 = v15,
        v7,
        v7 = v13,
        !v6))
  {
    if (a3)
    {
      v7 = objc_retainAutorelease(v7);
      v6 = 0;
      *a3 = v7;
    }
    else
    {
      v6 = 0;
    }
  }
LABEL_11:

  return v6;
}

- (void)setImage:(CGImage *)a3
{
  CGImageRelease(self->_cachedImage);
  self->_cachedImage = CGImageRetain(a3);
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_sourceImage);
  self->_sourceImage = 0;
  CGImageRelease(self->_cachedImage);
  self->_cachedImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)PBUICodableImage;
  -[PBUICodableImage dealloc](&v3, sel_dealloc);
}

- (id)surfaceCreatingIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  CGImage *sourceImage;

  v3 = a3;
  -[PBUICodableImage wrappedIOSurface](self, "wrappedIOSurface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !v5)
  {
    sourceImage = self->_sourceImage;
    if (!sourceImage
      || (soft_PUIIOSurfaceFromCGImage((uint64_t)sourceImage, 1),
          (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v5 = 0;
    }
  }
  return v5;
}

- (BOOL)refersToIdenticalImageFrom:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t Hash;

  v4 = a3;
  if (-[PBUICodableImage isEqualRepresentation:](self, "isEqualRepresentation:", v4))
  {
    v5 = 1;
  }
  else
  {
    -[PBUICodableImage CGImage](objc_retainAutorelease(self), "CGImage");
    Hash = CGImageGetHash();
    objc_msgSend(objc_retainAutorelease(v4), "CGImage");
    v5 = Hash == CGImageGetHash();
  }

  return v5;
}

- (BOOL)isEqualRepresentation:(id)a3
{
  _QWORD *v4;
  int v5;
  char v6;
  NSData *bitmapSourceData;
  NSData *v8;
  __IOSurface *v9;
  uint64_t v10;
  __IOSurface *v11;
  int ID;
  int Identifier;
  NSURL *url;

  v4 = a3;
  if (!self->_cachedImage || !v4[6] || (v5 = CGImageGetIdentifier(), v5 != CGImageGetIdentifier()))
  {
    bitmapSourceData = self->_bitmapSourceData;
    if (bitmapSourceData)
    {
      v8 = (NSData *)v4[5];
      if (v8)
      {
        v6 = bitmapSourceData == v8;
        goto LABEL_20;
      }
    }
    -[PBUICodableImage wrappedIOSurface](self, "wrappedIOSurface");
    v9 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wrappedIOSurface");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (__IOSurface *)v10;
    if (v9 && v10)
    {
      ID = IOSurfaceGetID(v9);
      Identifier = IOSurfaceGetID(v11);
    }
    else
    {
      url = self->_url;
      if (url && v4[3])
      {
        v6 = -[NSURL isEqual:](url, "isEqual:");
LABEL_19:

        goto LABEL_20;
      }
      if (!self->_sourceImage || !v4[4])
      {
        v6 = 0;
        goto LABEL_19;
      }
      ID = CGImageGetIdentifier();
      Identifier = CGImageGetIdentifier();
    }
    v6 = ID == Identifier;
    goto LABEL_19;
  }
  v6 = 1;
LABEL_20:

  return v6;
}

- (id)wrappedIOSurface
{
  IOSurface *surface;
  void *sourceImage;

  surface = self->_surface;
  if (surface)
    return surface;
  sourceImage = self->_sourceImage;
  if (sourceImage)
  {
    soft_PUIIOSurfaceFromCGImage((uint64_t)sourceImage, 0);
    sourceImage = (void *)objc_claimAutoreleasedReturnValue();
  }
  return sourceImage;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBUICodableImage)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  PBUICodableImage *v11;
  PBUICodableImage *v12;
  PBUICodableImage *v13;
  id v14;
  PBUICodableImage *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scale"));
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("representation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("fileURL")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v19 = 0;
        v10 = (id *)&v19;
        v11 = -[PBUICodableImage initFromURL:scale:error:](self, "initFromURL:scale:error:", v9, &v19, v6);
LABEL_12:
        v13 = v11;
        v14 = *v10;
        self = v13;
        goto LABEL_14;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("imageData")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v18 = 0;
        v10 = (id *)&v18;
        v11 = -[PBUICodableImage initFromSourceData:scale:error:](self, "initFromSourceData:scale:error:", v9, &v18, v6);
        goto LABEL_12;
      }
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("surface")))
      {
        v14 = 0;
LABEL_16:
        self = self;

        v12 = self;
        goto LABEL_17;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v17 = 0;
        v10 = (id *)&v17;
        v11 = -[PBUICodableImage initWithIOSurface:scale:error:](self, "initWithIOSurface:scale:error:", v9, &v17, v6);
        goto LABEL_12;
      }
    }
    v13 = 0;
    v14 = 0;
LABEL_14:
    v15 = self;
    self = v13;

    if (v14)
      objc_msgSend(v4, "failWithError:", v14);
    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *surface;
  CGImage *sourceImage;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("scale"), self->_scale);
  surface = self->_surface;
  if (surface || (surface = self->_url) != 0 || (surface = self->_bitmapSourceData) != 0)
  {
    +[PBUICodableImage encodeRepresentation:value:withCoder:](PBUICodableImage, "encodeRepresentation:value:withCoder:", self->_representation, surface, v4);
  }
  else
  {
    sourceImage = self->_sourceImage;
    if (sourceImage || (sourceImage = self->_cachedImage) != 0)
    {
      soft_PUIIOSurfaceFromCGImage((uint64_t)sourceImage, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        +[PBUICodableImage encodeRepresentation:value:withCoder:](PBUICodableImage, "encodeRepresentation:value:withCoder:", 2, v7, v4);
      }
      else
      {
        +[PBUICodableImage dataRepresentationForImage:error:](PBUICodableImage, "dataRepresentationForImage:error:", sourceImage, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          +[PBUICodableImage encodeRepresentation:value:withCoder:](PBUICodableImage, "encodeRepresentation:value:withCoder:", 1, v8, v4);

      }
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2D68];
      v13[0] = *MEMORY[0x1E0CB2D60];
      v13[1] = v10;
      v14[0] = CFSTR("UNREACHABLE: no image or any source was avaliable to encode.");
      v14[1] = CFSTR("Somehow a PBUICodableImage was made that had no actual source or image.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.RendererService"), 9999, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v12);

    }
  }

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *surface;
  void *v5;
  CGImage *sourceImage;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("scale"), self->_scale);
  surface = self->_surface;
  if (surface || (surface = self->_url) != 0)
  {
    +[PBUICodableImage bs_encodeRepresentation:value:withCoder:](PBUICodableImage, "bs_encodeRepresentation:value:withCoder:", self->_representation, surface, v9);
LABEL_4:
    v5 = v9;
    goto LABEL_5;
  }
  sourceImage = self->_sourceImage;
  v5 = v9;
  if (sourceImage || (sourceImage = self->_cachedImage) != 0)
  {
    soft_PUIIOSurfaceFromCGImage((uint64_t)sourceImage, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[PBUICodableImage bs_encodeRepresentation:value:withCoder:](PBUICodableImage, "bs_encodeRepresentation:value:withCoder:", 2, v7, v9);
    }
    else
    {
      +[PBUICodableImage dataRepresentationForImage:error:](PBUICodableImage, "dataRepresentationForImage:error:", sourceImage, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        +[PBUICodableImage bs_encodeRepresentation:value:withCoder:](PBUICodableImage, "bs_encodeRepresentation:value:withCoder:", 1, v8, v9);

    }
    goto LABEL_4;
  }
LABEL_5:

}

- (PBUICodableImage)initWithBSXPCCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PBUICodableImage *v11;
  id v12;
  PBUICodableImage *v13;
  PBUICodableImage *v14;
  void *v16;
  IOSurfaceRef v17;
  PBUICodableImage *v18;
  PBUICodableImage *v19;
  id v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scale"));
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("representation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("fileURL")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v22 = 0;
        self = -[PBUICodableImage initFromURL:scale:error:](self, "initFromURL:scale:error:", v9, &v22, v6);
        v10 = v22;
LABEL_9:
        v12 = v10;
        v13 = self;
LABEL_11:
        v14 = v13;

        self = v14;
        goto LABEL_12;
      }
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("imageData")))
      {
        if (!objc_msgSend(v8, "isEqualToString:", CFSTR("surface")))
        {
          v12 = 0;
LABEL_15:
          self = self;

          v11 = self;
          goto LABEL_16;
        }
        objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81338], v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v16;
        if (v16)
        {
          v17 = IOSurfaceLookupFromXPCObject(v16);
          if (v17)
          {
            v20 = 0;
            self = -[PBUICodableImage initWithIOSurface:scale:error:](self, "initWithIOSurface:scale:error:", v17, &v20, v6);
            v12 = v20;
            v18 = self;
          }
          else
          {
            v12 = 0;
            v18 = 0;
          }
          v19 = v18;

          self = v19;
        }
        else
        {

          v12 = 0;
          self = 0;
        }
LABEL_12:

        if (v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[PBUICodableImage initWithBSXPCCoder:].cold.1(v12);
        goto LABEL_15;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v21 = 0;
        self = -[PBUICodableImage initFromSourceData:scale:error:](self, "initFromSourceData:scale:error:", v9, &v21, v6);
        v10 = v21;
        goto LABEL_9;
      }
    }
    v12 = 0;
    v13 = 0;
    goto LABEL_11;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

+ (void)encodeRepresentation:(int64_t)a3 value:(id)a4 withCoder:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int64_t v10;
  unint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = v8;
  v10 = a3 & ~(a3 >> 63);
  if (v10 >= 4)
    v10 = 4;
  v11 = v10 - 1;
  if (v11 >= 3)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D60];
    v17[0] = CFSTR("Image did not have a valid representation.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.RendererService"), 2, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "failWithError:", v15);

  }
  else
  {
    v12 = off_1E6B95B30[v11];
    objc_msgSend(v8, "encodeObject:forKey:", v12, CFSTR("representation"));
    objc_msgSend(v9, "encodeObject:forKey:", v7, v12);
  }

}

+ (BOOL)bs_encodeRepresentation:(int64_t)a3 value:(id)a4 withCoder:(id)a5
{
  __IOSurface *v7;
  id v8;
  void *v9;
  int64_t v10;
  unint64_t v11;
  __CFString *v12;
  xpc_object_t XPCObject;

  v7 = (__IOSurface *)a4;
  v8 = a5;
  v9 = v8;
  v10 = a3 & ~(a3 >> 63);
  if (v10 >= 4)
    v10 = 4;
  v11 = v10 - 1;
  if ((unint64_t)(v10 - 1) <= 2)
  {
    v12 = off_1E6B95B30[v11];
    objc_msgSend(v8, "encodeObject:forKey:", v12, CFSTR("representation"));
    if (-[__IOSurface isMemberOfClass:](v7, "isMemberOfClass:", objc_opt_class()))
    {
      XPCObject = IOSurfaceCreateXPCObject(v7);
      objc_msgSend(v9, "encodeXPCObject:forKey:", XPCObject, v12);

    }
    else
    {
      objc_msgSend(v9, "encodeObject:forKey:", v7, v12);
    }
  }

  return v11 < 3;
}

+ (CGImage)createCGImageFromURL:(id)a3 error:(id *)a4
{
  const __CFURL *v7;
  const __CFURL *v8;
  void *v9;
  id v10;
  CGImage *ImageAtIndex;
  id v12;
  CGImageSource *v13;
  CGImageSource *v14;
  size_t PrimaryImageIndex;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v7 = (const __CFURL *)a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("url"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBUICodableImage createCGImageFromURL:error:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B71FA668);
  }
  v8 = v7;
  v28 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v7, 1, &v28);
  v10 = v28;
  if (!v9
    || (v27 = 0,
        ImageAtIndex = (CGImage *)objc_msgSend(a1, "createCGImageFromCPBitmapData:error:", v9, &v27),
        v12 = v27,
        v10,
        v10 = v12,
        !ImageAtIndex))
  {
    if (v10 && objc_msgSend(v10, "code") != 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      +[PBUICodableImage createCGImageFromURL:error:].cold.2(v10);
    v13 = CGImageSourceCreateWithURL(v8, 0);
    if (!v13)
    {
      if (a4)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2D60];
        v31[0] = *MEMORY[0x1E0CB3308];
        v31[1] = v22;
        v32[0] = v8;
        v32[1] = CFSTR("Image creation failed.");
        v23 = *MEMORY[0x1E0CB2938];
        v31[2] = *MEMORY[0x1E0CB2D68];
        v31[3] = v23;
        v32[2] = CFSTR("URL is either not readable or is not a valid image file.");
        v32[3] = CFSTR("Check os_log for errors from ImageIO.");
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = v32;
        v21 = v31;
        goto LABEL_14;
      }
LABEL_15:
      ImageAtIndex = 0;
      goto LABEL_16;
    }
    v14 = v13;
    PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v13);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v14, PrimaryImageIndex, 0);
    CFRelease(v14);
    if (!ImageAtIndex)
    {
      if (a4)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v17 = *MEMORY[0x1E0CB2D60];
        v29[0] = *MEMORY[0x1E0CB3308];
        v29[1] = v17;
        v30[0] = v8;
        v30[1] = CFSTR("Image creation failed.");
        v18 = *MEMORY[0x1E0CB2938];
        v29[2] = *MEMORY[0x1E0CB2D68];
        v29[3] = v18;
        v30[2] = CFSTR("CGImageSource could not create an image.");
        v30[3] = CFSTR("Check os_log for errors from ImageIO.");
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = v30;
        v21 = v29;
LABEL_14:
        objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 4);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.RendererService"), 1, v24);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
LABEL_16:

  return ImageAtIndex;
}

+ (CGImage)createCGImageFromData:(id)a3 error:(id *)a4
{
  const __CFData *v7;
  const __CFData *v8;
  CGImage *ImageAtIndex;
  id v10;
  void *v11;
  CGImageSource *v12;
  CGImageSource *v13;
  size_t PrimaryImageIndex;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v7 = (const __CFData *)a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("data != ((void *)0)"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBUICodableImage createCGImageFromData:error:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B71FA8F0);
  }
  v8 = v7;
  v24 = 0;
  ImageAtIndex = (CGImage *)objc_msgSend(a1, "createCGImageFromCPBitmapData:error:", v7, &v24);
  v10 = v24;
  v11 = v10;
  if (!ImageAtIndex)
  {
    if (v10 && objc_msgSend(v10, "code") != 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      +[PBUICodableImage createCGImageFromData:error:].cold.2(v11);
    v12 = CGImageSourceCreateWithData(v8, 0);
    if (!v12)
    {
      if (a4)
      {
        v20 = *MEMORY[0x1E0CB2D68];
        v27[0] = *MEMORY[0x1E0CB2D60];
        v27[1] = v20;
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v28[0] = CFSTR("Image creation failed.");
        v28[1] = CFSTR("Data is not a valid image format.");
        v27[2] = *MEMORY[0x1E0CB2D80];
        v28[2] = CFSTR("Check os_log for errors from ImageIO.");
        v17 = (void *)MEMORY[0x1E0C99D80];
        v18 = v28;
        v19 = v27;
        goto LABEL_13;
      }
LABEL_14:
      ImageAtIndex = 0;
      goto LABEL_15;
    }
    v13 = v12;
    PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v12);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v13, PrimaryImageIndex, 0);
    CFRelease(v13);
    if (!ImageAtIndex)
    {
      if (a4)
      {
        v15 = *MEMORY[0x1E0CB2D68];
        v25[0] = *MEMORY[0x1E0CB2D60];
        v25[1] = v15;
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v26[0] = CFSTR("Image creation failed.");
        v26[1] = CFSTR("CGImageSource could not create an image.");
        v25[2] = *MEMORY[0x1E0CB2938];
        v26[2] = CFSTR("Check os_log for errors from ImageIO.");
        v17 = (void *)MEMORY[0x1E0C99D80];
        v18 = v26;
        v19 = v25;
LABEL_13:
        objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.RendererService"), 1, v21);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
LABEL_15:

  return ImageAtIndex;
}

+ (id)dataRepresentationForImage:(CGImage *)a3 error:(id *)a4
{
  __CFData *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  __CFData *v11;
  const __CFDictionary *v12;
  CGImageDestination *v13;
  const __CFDictionary *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = (__CFData *)CGImageCopySourceData();
  if (!v6)
  {
    v6 = (__CFData *)CGImageCopyJPEGData();
    if (!v6)
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x2050000000;
      v7 = (void *)getPUIImageOnDiskFormatClass_softClass;
      v26 = getPUIImageOnDiskFormatClass_softClass;
      if (!getPUIImageOnDiskFormatClass_softClass)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __getPUIImageOnDiskFormatClass_block_invoke;
        v22[3] = &unk_1E6B94840;
        v22[4] = &v23;
        __getPUIImageOnDiskFormatClass_block_invoke((uint64_t)v22);
        v7 = (void *)v24[3];
      }
      v8 = objc_retainAutorelease(v7);
      _Block_object_dispose(&v23, 8);
      v9 = [v8 alloc];
      v10 = (void *)objc_msgSend(v9, "initWithTypeRecord:destinationOptions:addImageOptions:", *MEMORY[0x1E0CEC508], 0, 0);
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v11 = (__CFData *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resolveDestinationOptionsForImage:", a3);
      v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v13 = CGImageDestinationCreateWithData(v11, (CFStringRef)objc_msgSend(v10, "typeIdentifier"), 1uLL, v12);
      if (v13)
      {
        objc_msgSend(v10, "resolveAddImageOptionsForImage:", a3);
        v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CGImageDestinationAddImage(v13, a3, v14);
        v15 = CGImageDestinationFinalize(v13);
        CFRelease(v13);
        if (v15)
        {
          v6 = v11;
LABEL_13:

LABEL_14:
          return v6;
        }
        if (a4)
        {
          v18 = (void *)MEMORY[0x1E0CB35C8];
          getPUIImageEncoderErrorDomain();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = *MEMORY[0x1E0CB2D50];
          v28 = CFSTR("Image final encoding failed for unknown reasons in CoreGraphics.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 2, v20);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        if (!a4)
        {
          v6 = 0;
          goto LABEL_14;
        }
        v16 = (void *)MEMORY[0x1E0CB35C8];
        getPUIImageEncoderErrorDomain();
        v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v29 = *MEMORY[0x1E0CB2D50];
        v30[0] = CFSTR("Image destination failed to be created to Data.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", v14, 1, v17);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v6 = 0;
      goto LABEL_13;
    }
  }
  return v6;
}

+ (CGImage)createCGImageFromCPBitmapData:(id)a3 error:(id *)a4
{
  const __CFArray *ImagesFromData;
  CGImage *ValueAtIndex;
  CGImage *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
  if (!ImagesFromData)
    return 0;
  ValueAtIndex = (CGImage *)CFArrayGetValueAtIndex(ImagesFromData, 0);
  v7 = ValueAtIndex;
  if (ValueAtIndex)
  {
    CFRetain(ValueAtIndex);
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D68];
    v12[0] = *MEMORY[0x1E0CB2D60];
    v12[1] = v9;
    v13[0] = CFSTR("CPBitmap file contained no images.");
    v13[1] = CFSTR("The bitmap file was valid, it just had no images.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.RendererService"), 2, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  CFRelease(ImagesFromData);
  return v7;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitmapSourceData, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_surface, 0);
}

- (void)initWithBSXPCCoder:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_1B71C0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PBUICodableImage BSXPCDecoding failed: %@", (uint8_t *)&v2, 0xCu);

  OUTLINED_FUNCTION_15();
}

+ (void)createCGImageFromURL:(const char *)a1 error:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

+ (void)createCGImageFromURL:(void *)a1 error:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1(&dword_1B71C0000, MEMORY[0x1E0C81028], v2, "[Possibly Expected Error] CPBitmap read failed will fallback to ImageIO. The source data is unlikely a cpbitmap so you can normally ignore this: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_15();
}

+ (void)createCGImageFromData:(const char *)a1 error:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

+ (void)createCGImageFromData:(void *)a1 error:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1(&dword_1B71C0000, MEMORY[0x1E0C81028], v2, "[Possibly Expected Error] CPBitmap read failed. The source data is unlikely a cpbitmap so you can normally ignore this: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_15();
}

@end

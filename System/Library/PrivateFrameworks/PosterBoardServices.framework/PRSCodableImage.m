@implementation PRSCodableImage

- (PRSCodableImage)initWithIOSurface:(id)a3 scale:(double)a4 error:(id *)a5
{
  id v8;
  PRSCodableImage *v9;
  PRSCodableImage *v10;

  v8 = a3;
  v9 = -[PRSCodableImage init](self, "init");
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
  PRSCodableImage *v4;
  CGImage *v5;
  CGImage *v6;

  v3 = a3;
  v4 = objc_alloc_init(PRSCodableImage);
  v4->_representation = *((_QWORD *)v3 + 1);
  objc_storeStrong((id *)&v4->_surface, *((id *)v3 + 2));
  objc_storeStrong((id *)&v4->_url, *((id *)v3 + 3));
  v5 = (CGImage *)*((_QWORD *)v3 + 4);
  if (v5)
    v5 = CGImageRetain(v5);
  v4->_sourceImage = v5;
  v6 = (CGImage *)*((_QWORD *)v3 + 5);
  if (v6)
    v6 = CGImageRetain(v6);
  v4->_cachedImage = v6;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PRSCodableImage *v4;
  CGImage *sourceImage;
  CGImage *cachedImage;

  v4 = -[PRSCodableImage init](+[PRSCodableImage allocWithZone:](PRSCodableImage, "allocWithZone:", a3), "init");
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
  CGImage *v8;
  CGImage *v9;
  PRSCodableImage *v10;
  PRSCodableImage *v11;

  v8 = +[PRSCodableImage createCGImageFromData:error:](PRSCodableImage, "createCGImageFromData:error:", a3);
  if (v8)
  {
    v9 = v8;
    v10 = -[PRSCodableImage initWithCGImage:scale:error:](self, "initWithCGImage:scale:error:", v8, a5, a4);
    CGImageRelease(v9);
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)initFromURL:(id)a3 scale:(double)a4 error:(id *)a5
{
  id v8;
  PRSCodableImage *v9;
  PRSCodableImage *v10;
  uint64_t v11;
  NSURL *url;
  uint64_t v13;
  PRSCodableImage *v14;

  v8 = a3;
  v9 = -[PRSCodableImage init](self, "init");
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

- (PRSCodableImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 error:(id *)a5
{
  PRSCodableImage *v7;
  PRSCodableImage *v8;

  v7 = -[PRSCodableImage init](self, "init", a3, a5);
  v8 = v7;
  if (v7)
  {
    v7->_representation = 0;
    v7->_sourceImage = CGImageRetain(a3);
    v8->_scale = a4;
  }
  return v8;
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
      result = -[PRSCodableImage buildCGImageWithError:](self, "buildCGImageWithError:", 0);
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
  v3.super_class = (Class)PRSCodableImage;
  -[PRSCodableImage dealloc](&v3, sel_dealloc);
}

- (id)surfaceCreatingIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  CGImage *sourceImage;

  v3 = a3;
  -[PRSCodableImage wrappedIOSurface](self, "wrappedIOSurface");
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
  if (-[PRSCodableImage isEqualRepresentation:](self, "isEqualRepresentation:", v4))
  {
    v5 = 1;
  }
  else
  {
    -[PRSCodableImage CGImage](objc_retainAutorelease(self), "CGImage");
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
  __IOSurface *v7;
  uint64_t v8;
  __IOSurface *v9;
  int ID;
  int Identifier;
  NSURL *url;

  v4 = a3;
  if (!self->_cachedImage || !v4[5] || (v5 = CGImageGetIdentifier(), v5 != CGImageGetIdentifier()))
  {
    -[PRSCodableImage wrappedIOSurface](self, "wrappedIOSurface");
    v7 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wrappedIOSurface");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (__IOSurface *)v8;
    if (v7 && v8)
    {
      ID = IOSurfaceGetID(v7);
      Identifier = IOSurfaceGetID(v9);
    }
    else
    {
      url = self->_url;
      if (url && v4[3])
      {
        v6 = -[NSURL isEqual:](url, "isEqual:");
        goto LABEL_16;
      }
      if (!self->_sourceImage || !v4[4])
      {
        v6 = 0;
        goto LABEL_16;
      }
      ID = CGImageGetIdentifier();
      Identifier = CGImageGetIdentifier();
    }
    v6 = ID == Identifier;
LABEL_16:

    goto LABEL_17;
  }
  v6 = 1;
LABEL_17:

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

- (PRSCodableImage)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  PRSCodableImage *v11;
  PRSCodableImage *v12;
  PRSCodableImage *v13;
  id v14;
  PRSCodableImage *v15;
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
        v11 = -[PRSCodableImage initFromURL:scale:error:](self, "initFromURL:scale:error:", v9, &v19, v6);
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
        v11 = -[PRSCodableImage initFromSourceData:scale:error:](self, "initFromSourceData:scale:error:", v9, &v18, v6);
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
        v11 = -[PRSCodableImage initWithIOSurface:scale:error:](self, "initWithIOSurface:scale:error:", v9, &v17, v6);
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
  if (surface || (surface = self->_url) != 0)
  {
    +[PRSCodableImage encodeRepresentation:value:withCoder:](PRSCodableImage, "encodeRepresentation:value:withCoder:", self->_representation, surface, v4);
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
        +[PRSCodableImage encodeRepresentation:value:withCoder:](PRSCodableImage, "encodeRepresentation:value:withCoder:", 2, v7, v4);
      }
      else
      {
        +[PRSCodableImage dataRepresentationForImage:error:](PRSCodableImage, "dataRepresentationForImage:error:", sourceImage, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          +[PRSCodableImage encodeRepresentation:value:withCoder:](PRSCodableImage, "encodeRepresentation:value:withCoder:", 1, v8, v4);

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
    +[PRSCodableImage bs_encodeRepresentation:value:withCoder:](PRSCodableImage, "bs_encodeRepresentation:value:withCoder:", self->_representation, surface, v9);
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
      +[PRSCodableImage bs_encodeRepresentation:value:withCoder:](PRSCodableImage, "bs_encodeRepresentation:value:withCoder:", 2, v7, v9);
    }
    else
    {
      +[PRSCodableImage dataRepresentationForImage:error:](PRSCodableImage, "dataRepresentationForImage:error:", sourceImage, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        +[PRSCodableImage bs_encodeRepresentation:value:withCoder:](PRSCodableImage, "bs_encodeRepresentation:value:withCoder:", 1, v8, v9);

    }
    goto LABEL_4;
  }
LABEL_5:

}

- (PRSCodableImage)initWithBSXPCCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PRSCodableImage *v11;
  id v12;
  PRSCodableImage *v13;
  PRSCodableImage *v14;
  void *v16;
  IOSurfaceRef v17;
  PRSCodableImage *v18;
  PRSCodableImage *v19;
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
        self = -[PRSCodableImage initFromURL:scale:error:](self, "initFromURL:scale:error:", v9, &v22, v6);
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
            self = -[PRSCodableImage initWithIOSurface:scale:error:](self, "initWithIOSurface:scale:error:", v17, &v20, v6);
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
          -[PRSCodableImage initWithBSXPCCoder:].cold.1(v12);
        goto LABEL_15;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v21 = 0;
        self = -[PRSCodableImage initFromSourceData:scale:error:](self, "initFromSourceData:scale:error:", v9, &v21, v6);
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
    v12 = off_1E4D42828[v11];
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
    v12 = off_1E4D42828[v11];
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
  const __CFURL *v6;
  const __CFURL *v7;
  CGImageSource *v8;
  CGImageSource *v9;
  size_t PrimaryImageIndex;
  CGImage *ImageAtIndex;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v6 = (const __CFURL *)a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("url"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSCodableImage createCGImageFromURL:error:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49A2408);
  }
  v7 = v6;
  v8 = CGImageSourceCreateWithURL(v6, 0);
  if (!v8)
  {
    if (a4)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D60];
      v25[0] = *MEMORY[0x1E0CB3308];
      v25[1] = v18;
      v26[0] = v7;
      v26[1] = CFSTR("Image creation failed.");
      v19 = *MEMORY[0x1E0CB2938];
      v25[2] = *MEMORY[0x1E0CB2D68];
      v25[3] = v19;
      v26[2] = CFSTR("URL is either not readable or is not a valid image file.");
      v26[3] = CFSTR("Check os_log for errors from ImageIO.");
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v26;
      v17 = v25;
      goto LABEL_8;
    }
LABEL_9:
    ImageAtIndex = 0;
    goto LABEL_10;
  }
  v9 = v8;
  PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v8);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, PrimaryImageIndex, 0);
  CFRelease(v9);
  if (!ImageAtIndex)
  {
    if (a4)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D60];
      v23[0] = *MEMORY[0x1E0CB3308];
      v23[1] = v13;
      v24[0] = v7;
      v24[1] = CFSTR("Image creation failed.");
      v14 = *MEMORY[0x1E0CB2938];
      v23[2] = *MEMORY[0x1E0CB2D68];
      v23[3] = v14;
      v24[2] = CFSTR("CGImageSource could not create an image.");
      v24[3] = CFSTR("Check os_log for errors from ImageIO.");
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v24;
      v17 = v23;
LABEL_8:
      objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.RendererService"), 1, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    goto LABEL_9;
  }
LABEL_10:

  return ImageAtIndex;
}

+ (CGImage)createCGImageFromData:(id)a3 error:(id *)a4
{
  const __CFData *v6;
  const __CFData *v7;
  CGImageSource *v8;
  CGImageSource *v9;
  size_t PrimaryImageIndex;
  CGImage *ImageAtIndex;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v6 = (const __CFData *)a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("data != ((void *)0)"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSCodableImage createCGImageFromData:error:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49A2624);
  }
  v7 = v6;
  v8 = CGImageSourceCreateWithData(v6, 0);
  if (!v8)
  {
    if (a4)
    {
      v17 = *MEMORY[0x1E0CB2D68];
      v23[0] = *MEMORY[0x1E0CB2D60];
      v23[1] = v17;
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v24[0] = CFSTR("Image creation failed.");
      v24[1] = CFSTR("Data is not a valid image format.");
      v23[2] = *MEMORY[0x1E0CB2D80];
      v24[2] = CFSTR("Check os_log for errors from ImageIO.");
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v24;
      v16 = v23;
      goto LABEL_8;
    }
LABEL_9:
    ImageAtIndex = 0;
    goto LABEL_10;
  }
  v9 = v8;
  PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v8);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, PrimaryImageIndex, 0);
  CFRelease(v9);
  if (!ImageAtIndex)
  {
    if (a4)
    {
      v12 = *MEMORY[0x1E0CB2D68];
      v21[0] = *MEMORY[0x1E0CB2D60];
      v21[1] = v12;
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v22[0] = CFSTR("Image creation failed.");
      v22[1] = CFSTR("CGImageSource could not create an image.");
      v21[2] = *MEMORY[0x1E0CB2938];
      v22[2] = CFSTR("Check os_log for errors from ImageIO.");
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v22;
      v16 = v21;
LABEL_8:
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.RendererService"), 1, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    goto LABEL_9;
  }
LABEL_10:

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
        v22[3] = &unk_1E4D42598;
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

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
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
  _os_log_error_impl(&dword_1A4996000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PBUICodableImage BSXPCDecoding failed: %@", (uint8_t *)&v2, 0xCu);

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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end

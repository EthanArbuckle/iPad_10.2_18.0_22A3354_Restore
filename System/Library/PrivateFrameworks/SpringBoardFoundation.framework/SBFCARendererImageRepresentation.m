@implementation SBFCARendererImageRepresentation

+ (id)representationWithImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "ioSurface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "representationWithIOSurface:imageOrientation:", v6, objc_msgSend(v5, "imageOrientation"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = objc_retainAutorelease(v5);
      -[UIImage CGImage](v8, "CGImage");
      v9 = (void *)CGImageCopySourceData();
      v10 = v9;
      if (v9 && objc_msgSend(v9, "length"))
      {
        objc_msgSend(a1, "representationWithImageData:imageOrientation:", v10, -[UIImage imageOrientation](v8, "imageOrientation"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        UIImageJPEGRepresentation(v8, 100.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(a1, "representationWithImageData:imageOrientation:", v11, -[UIImage imageOrientation](v8, "imageOrientation"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)representationWithFileURL:(id)a3 imageOrientation:(int64_t)a4
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  v8 = v7;
  if (v7)
  {
    v7[1] = 3;
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)v8[2];
    v8[2] = v9;

    v8[4] = a4;
  }

  return v8;
}

+ (id)representationWithImageData:(id)a3 imageOrientation:(int64_t)a4
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  v8 = v7;
  if (v7)
  {
    v7[1] = 1;
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)v8[3];
    v8[3] = v9;

    v8[4] = a4;
  }

  return v8;
}

+ (id)representationWithIOSurface:(id)a3 imageOrientation:(int64_t)a4
{
  id v7;
  id v8;
  _QWORD *v9;

  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (v8)
  {
    *((_QWORD *)v8 + 1) = 2;
    objc_storeStrong((id *)v8 + 5, a3);
    v9[4] = a4;
  }

  return v9;
}

- (SBFCARendererImageRepresentation)initWithCoder:(id)a3
{
  id v4;
  SBFCARendererImageRepresentation *v5;
  uint64_t v6;
  uint64_t v7;
  NSData *imageData;
  uint64_t v9;
  NSURL *fileURL;
  uint64_t v11;
  IOSurface *surface;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBFCARendererImageRepresentation;
  v5 = -[SBFCARendererImageRepresentation init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("representationType"));
    v5->_representationType = v6;
    switch(v6)
    {
      case 3:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
        v9 = objc_claimAutoreleasedReturnValue();
        fileURL = v5->_fileURL;
        v5->_fileURL = (NSURL *)v9;

        if (!v5->_fileURL)
          goto LABEL_10;
        break;
      case 2:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("surface"));
        v11 = objc_claimAutoreleasedReturnValue();
        surface = v5->_surface;
        v5->_surface = (IOSurface *)v11;

        if (!v5->_surface)
        {
LABEL_10:
          v5->_representationType = 0;
          goto LABEL_11;
        }
        break;
      case 1:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
        v7 = objc_claimAutoreleasedReturnValue();
        imageData = v5->_imageData;
        v5->_imageData = (NSData *)v7;

        if (!v5->_imageData)
          goto LABEL_10;
        break;
      default:
        goto LABEL_10;
    }
    v5->_imageOrientation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("orientation"));
  }
LABEL_11:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->_representationType, CFSTR("representationType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_imageOrientation, CFSTR("orientation"));
  v4 = self->_representationType - 1;
  if (v4 <= 2)
    objc_msgSend(v5, "encodeObject:forKey:", *(Class *)((char *)&self->super.isa + qword_18AC17960[v4]), off_1E200F9B0[v4]);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGImage)createCGImageReturningScale:(double *)a3
{
  int64_t representationType;
  NSData *imageData;
  CGImage *v6;
  NSURL *fileURL;
  uint64_t *p_fileURL;
  void *MappedDataFromPath;
  id v10;
  IOSurface *surface;
  void *v12;
  id v14;
  void *v15;
  NSObject *v16;

  representationType = self->_representationType;
  switch(representationType)
  {
    case 3:
      p_fileURL = (uint64_t *)&self->_fileURL;
      fileURL = self->_fileURL;
      if (fileURL)
      {
        -[NSURL path](fileURL, "path");
        MappedDataFromPath = (void *)CPBitmapCreateMappedDataFromPath();
        if (!MappedDataFromPath)
          v10 = objc_retainAutorelease(0);
        v14 = 0;
        v15 = v14;
        if (MappedDataFromPath && !v14)
          goto LABEL_21;
        SBLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[SBFCARendererImageRepresentation createCGImageReturningScale:].cold.1(p_fileURL, (uint64_t)v15, v16);

        if (MappedDataFromPath)
LABEL_21:
          v6 = _SBFCARendererCGImageForImageData(MappedDataFromPath);
        else
          v6 = 0;

        if (a3)
          goto LABEL_14;
        return v6;
      }
      break;
    case 2:
      surface = self->_surface;
      if (surface)
      {
        -[IOSurface CGImageBuilder](surface, "CGImageBuilder");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (CGImage *)objc_msgSend(v12, "buildCGImage");

        if (!a3)
          return v6;
        goto LABEL_14;
      }
      break;
    case 1:
      imageData = self->_imageData;
      if (imageData)
      {
        v6 = _SBFCARendererCGImageForImageData(imageData);
        if (!a3)
          return v6;
        goto LABEL_14;
      }
      break;
  }
  v6 = 0;
  if (a3)
LABEL_14:
    *a3 = 1.0;
  return v6;
}

- (int64_t)representationType
{
  return self->_representationType;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (IOSurface)surface
{
  return self->_surface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surface, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)createCGImageReturningScale:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_18AB69000, log, OS_LOG_TYPE_ERROR, "Failed to read file URL at path %{public}@ with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end

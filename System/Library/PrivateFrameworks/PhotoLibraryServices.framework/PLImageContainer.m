@implementation PLImageContainer

- (PLImageContainer)initWithCGImage:(CGImage *)a3 ioSurface:(void *)a4 CIImage:(id)a5 backingData:(id)a6 uniformTypeIdentifier:(id)a7 size:(CGSize)a8 auxiliaryImageRecords:(id)a9
{
  CGFloat height;
  CGFloat width;
  id v18;
  id v19;
  id v20;
  id v21;
  PLImageContainer *v22;
  uint64_t v23;
  NSString *uniformTypeIdentifier;
  objc_super v26;

  height = a8.height;
  width = a8.width;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v26.receiver = self;
  v26.super_class = (Class)PLImageContainer;
  v22 = -[PLImageContainer init](&v26, sel_init);
  if (v22)
  {
    v22->_CGImage = CGImageRetain(a3);
    objc_storeStrong((id *)&v22->_CIImage, a5);
    if (a4)
      v22->_ioSurface = (void *)CFRetain(a4);
    objc_storeStrong((id *)&v22->_data, a6);
    v23 = objc_msgSend(v20, "copy");
    uniformTypeIdentifier = v22->_uniformTypeIdentifier;
    v22->_uniformTypeIdentifier = (NSString *)v23;

    v22->_pixelSize.width = width;
    v22->_pixelSize.height = height;
    objc_storeStrong((id *)&v22->_auxiliaryImageRecords, a9);
  }

  return v22;
}

- (PLImageContainer)initWithPLImage:(id)a3 backingData:(id)a4 uniformTypeIdentifier:(id)a5 auxiliaryImageRecords:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  PLImageContainer *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = MEMORY[0x19AEBFD84]();
  v15 = DCIM_CGImageRefFromPLImage();
  MEMORY[0x19AEBFCB8](v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[PLImageContainer initWithCGImage:ioSurface:CIImage:backingData:uniformTypeIdentifier:size:auxiliaryImageRecords:](self, "initWithCGImage:ioSurface:CIImage:backingData:uniformTypeIdentifier:size:auxiliaryImageRecords:", v15, v14, v16, v12, v11, v10, -1.0, -1.0);
  return v17;
}

- (PLImageContainer)initWithPLImage:(id)a3
{
  return -[PLImageContainer initWithPLImage:backingData:uniformTypeIdentifier:auxiliaryImageRecords:](self, "initWithPLImage:backingData:uniformTypeIdentifier:auxiliaryImageRecords:", a3, 0, 0, 0);
}

- (PLImageContainer)initWithIOSurface:(__IOSurface *)a3
{
  return -[PLImageContainer initWithCGImage:ioSurface:CIImage:backingData:uniformTypeIdentifier:size:auxiliaryImageRecords:](self, "initWithCGImage:ioSurface:CIImage:backingData:uniformTypeIdentifier:size:auxiliaryImageRecords:", 0, a3, 0, 0, 0, 0, -1.0, -1.0);
}

- (PLImageContainer)initWithCGImage:(CGImage *)a3
{
  return -[PLImageContainer initWithCGImage:ioSurface:CIImage:backingData:uniformTypeIdentifier:size:auxiliaryImageRecords:](self, "initWithCGImage:ioSurface:CIImage:backingData:uniformTypeIdentifier:size:auxiliaryImageRecords:", a3, 0, 0, 0, 0, 0, -1.0, -1.0);
}

- (void)dealloc
{
  CIImage *CIImage;
  void *ioSurface;
  objc_super v5;

  CGImageRelease(self->_CGImage);
  self->_CGImage = 0;
  CIImage = self->_CIImage;
  self->_CIImage = 0;

  ioSurface = self->_ioSurface;
  if (ioSurface)
  {
    CFRelease(ioSurface);
    self->_ioSurface = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PLImageContainer;
  -[PLImageContainer dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *ioSurface;
  CIImage *CIImage;
  CGImage *CGImage;
  NSData *data;
  NSString *uniformTypeIdentifier;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)PLImageContainer;
  -[PLImageContainer description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ioSurface = self->_ioSurface;
  CIImage = self->_CIImage;
  CGImage = self->_CGImage;
  data = self->_data;
  uniformTypeIdentifier = self->_uniformTypeIdentifier;
  NSStringFromSize(self->_pixelSize);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (IOS:%@ CGI:%@ CII:%@ D:%@ UTI:%@ sz:%@)"), v4, ioSurface, CGImage, CIImage, data, uniformTypeIdentifier, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)ioSurface
{
  void *result;

  result = self->_ioSurface;
  if (!result)
  {
    result = self->_CGImage;
    if (result)
      return (void *)CGImageGetProperty();
  }
  return result;
}

- (CGSize)pixelSize
{
  double height;
  double Width;
  CGImage *CGImage;
  size_t v6;
  CIImage *CIImage;
  CGFloat v8;
  CGFloat v9;
  double v10;
  __IOSurface *ioSurface;
  CGSize result;

  height = self->_pixelSize.height;
  if (height < 0.0 || (Width = self->_pixelSize.width, Width < 0.0))
  {
    CGImage = self->_CGImage;
    if (CGImage)
    {
      Width = (double)CGImageGetWidth(CGImage);
      v6 = CGImageGetHeight(self->_CGImage);
    }
    else
    {
      CIImage = self->_CIImage;
      if (CIImage)
      {
        -[CIImage extent](CIImage, "extent");
        Width = v8;
        height = v9;
        self->_pixelSize.width = v8;
        self->_pixelSize.height = v9;
        goto LABEL_8;
      }
      ioSurface = (__IOSurface *)self->_ioSurface;
      if (!ioSurface)
      {
        Width = self->_pixelSize.width;
        goto LABEL_8;
      }
      Width = (double)IOSurfaceGetWidth(ioSurface);
      v6 = IOSurfaceGetHeight((IOSurfaceRef)self->_ioSurface);
    }
    height = (double)v6;
    self->_pixelSize.width = Width;
    self->_pixelSize.height = (double)v6;
  }
LABEL_8:
  v10 = Width;
  result.height = height;
  result.width = v10;
  return result;
}

- (BOOL)hasAuxiliaryImages
{
  return -[NSArray count](self->_auxiliaryImageRecords, "count") != 0;
}

- (CGImage)CGImage
{
  return self->_CGImage;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (NSArray)auxiliaryImageRecords
{
  return self->_auxiliaryImageRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageRecords, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_CIImage, 0);
}

@end

@implementation _BKDisplayRenderOverlayPersistenceData

- (id)_initWithDescriptor:(id)a3 overlayType:(int64_t)a4 imageData:(id)a5 level:(float)a6 frozen:(BOOL)a7
{
  id v13;
  const __CFData *v14;
  _BKDisplayRenderOverlayPersistenceData *v15;
  _BKDisplayRenderOverlayPersistenceData *v16;
  CGDataProvider *v17;
  CGImageRef v18;
  objc_super v20;

  v13 = a3;
  v14 = (const __CFData *)a5;
  v20.receiver = self;
  v20.super_class = (Class)_BKDisplayRenderOverlayPersistenceData;
  v15 = -[_BKDisplayRenderOverlayPersistenceData init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    v15->_level = a6;
    v15->_overlayType = a4;
    objc_storeStrong((id *)&v15->_descriptor, a3);
    v17 = CGDataProviderCreateWithCFData(v14);
    v18 = CGImageCreateWithPNGDataProvider(v17, 0, 0, kCGRenderingIntentDefault);
    CGDataProviderRelease(v17);
    CFAutorelease(v18);
    v16->_image = v18;
    CFRetain(v18);
    objc_storeStrong((id *)&v16->_imageData, a5);
    v16->_frozen = a7;
  }

  return v16;
}

- (void)dealloc
{
  CGImage *image;
  objc_super v4;

  self->_overlayType = 0;
  image = self->_image;
  if (image)
    CGImageRelease(image);
  v4.receiver = self;
  v4.super_class = (Class)_BKDisplayRenderOverlayPersistenceData;
  -[_BKDisplayRenderOverlayPersistenceData dealloc](&v4, "dealloc");
}

- (void)setImage:(CGImage *)a3
{
  CGImage *image;
  NSData *imageData;

  image = self->_image;
  if (image != a3)
  {
    if (image)
    {
      CGImageRelease(image);
      imageData = self->_imageData;
      self->_imageData = 0;

    }
    self->_image = CGImageRetain(a3);
  }
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  void *v5;
  NSData *imageData;
  CGImage *image;
  __CFData *v8;
  CGImageDestination *v9;
  NSData *v10;
  id v11;

  v11 = a3;
  *(float *)&v4 = self->_level;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("level"), v4);
  objc_msgSend(v11, "encodeInteger:forKey:", self->_overlayType, CFSTR("overlayType"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_frozen, CFSTR("frozen"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_descriptor, CFSTR("descriptor"));
  v5 = v11;
  imageData = self->_imageData;
  if (imageData)
    goto LABEL_2;
  image = self->_image;
  if (image)
  {
    v8 = (__CFData *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    v9 = CGImageDestinationCreateWithData(v8, CFSTR("public.png"), 1uLL, 0);
    CGImageDestinationAddImage(v9, image, 0);
    if (!CGImageDestinationFinalize(v9))
    {

      v8 = 0;
    }
    CFRelease(v9);
    v10 = self->_imageData;
    self->_imageData = (NSData *)v8;

    imageData = self->_imageData;
    v5 = v11;
    if (imageData)
    {
LABEL_2:
      objc_msgSend(v11, "encodeObject:forKey:", imageData, CFSTR("imageData2"));
      v5 = v11;
    }
  }

}

- (_BKDisplayRenderOverlayPersistenceData)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  double v15;
  BOOL v16;
  _BKDisplayRenderOverlayPersistenceData *v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("overlayType"));
  v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(BKSDisplayRenderOverlayDescriptor, v6), CFSTR("descriptor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("level"));
  v10 = v9;
  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("frozen"));
  v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v12), CFSTR("imageData2"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v8)
    v16 = v14 == 0;
  else
    v16 = 1;
  if (v16)
  {
    v17 = 0;
  }
  else
  {
    LODWORD(v15) = v10;
    self = (_BKDisplayRenderOverlayPersistenceData *)-[_BKDisplayRenderOverlayPersistenceData _initWithDescriptor:overlayType:imageData:level:frozen:](self, "_initWithDescriptor:overlayType:imageData:level:frozen:", v8, v5, v14, v11, v15);
    v17 = self;
  }

  return v17;
}

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (void)setOverlayType:(int64_t)a3
{
  self->_overlayType = a3;
}

- (BKSDisplayRenderOverlayDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (CGImage)image
{
  return self->_image;
}

- (float)level
{
  return self->_level;
}

- (void)setLevel:(float)a3
{
  self->_level = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

+ (id)classesRequiredToDecode
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDisplayRenderOverlayDescriptor _classesRequiredToDecode](BKSDisplayRenderOverlayDescriptor, "_classesRequiredToDecode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v2));

  objc_msgSend(v3, "addObject:", objc_opt_class(NSMutableData, v4));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

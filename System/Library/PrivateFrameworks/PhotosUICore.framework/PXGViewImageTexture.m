@implementation PXGViewImageTexture

- (PXGViewImageTexture)initWithImage:(CGImage *)a3 orientation:(unsigned int)a4 alpha:(float)a5
{
  PXGViewImageTexture *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXGViewImageTexture;
  v8 = -[PXGImageTexture init](&v10, sel_init);
  if (v8)
  {
    v8->_imageRef = CGImageRetain(a3);
    v8->_orientation = a4;
    v8->_alpha = a5;
    v8->_isContentOpaque = PXGCGImageGetOpaque();
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_imageRef);
  v3.receiver = self;
  v3.super_class = (Class)PXGViewImageTexture;
  -[PXGImageTexture dealloc](&v3, sel_dealloc);
}

- (unsigned)presentationType
{
  return 1;
}

- (int64_t)estimatedByteSize
{
  double v3;
  double v4;

  -[PXGViewImageTexture pixelSize](self, "pixelSize");
  return (uint64_t)(v3 * v4 * (double)(CGImageGetBitsPerPixel(self->_imageRef) >> 3));
}

- (CGSize)pixelSize
{
  double Width;
  double Height;
  double v5;
  CGSize result;

  Width = (double)CGImageGetWidth(self->_imageRef);
  Height = (double)CGImageGetHeight(self->_imageRef);
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (BOOL)isOpaque
{
  return self->_isContentOpaque && self->_alpha >= 1.0;
}

- (id)copyWithOrientationTransform:(float)a3 alpha:
{
  float v3;
  float v4;
  uint64_t v5;
  id v7;
  double v8;
  void *v9;

  v4 = v3;
  v5 = PXGSpriteTextureInfoOrientationToCGOrientation();
  if ((_DWORD)v5 == self->_orientation && self->_alpha == v4)
    return self;
  v7 = objc_alloc((Class)objc_opt_class());
  *(float *)&v8 = v4;
  v9 = (void *)objc_msgSend(v7, "initWithImage:orientation:alpha:", self->_imageRef, v5, v8);
  objc_msgSend(v9, "setSourceCGImage:", -[PXGImageTexture sourceCGImage](self, "sourceCGImage"));
  objc_msgSend(v9, "setSourceCVPixelBuffer:", -[PXGImageTexture sourceCVPixelBuffer](self, "sourceCVPixelBuffer"));
  return v9;
}

- (CGImage)imageRef
{
  return self->_imageRef;
}

- (unsigned)orientation
{
  return self->_orientation;
}

@end

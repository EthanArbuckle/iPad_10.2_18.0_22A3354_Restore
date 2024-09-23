@implementation VIImage

- (VIImage)initWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4
{
  VIImage *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VIImage;
  v6 = -[VIImage init](&v8, sel_init);
  if (v6)
  {
    v6->_pixelBuffer = CVPixelBufferRetain(a3);
    v6->_orientation = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)VIImage;
  -[VIImage dealloc](&v3, sel_dealloc);
}

+ (VIImage)imageWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4
{
  return (VIImage *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPixelBuffer:orientation:", a3, *(_QWORD *)&a4);
}

- (CGSize)imageSize
{
  double Width;
  double Height;
  double v5;
  CGSize result;

  Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer);
  Height = (double)CVPixelBufferGetHeight(self->_pixelBuffer);
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (BOOL)isLoaded
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  VIImage *v4;
  VIImage *v5;
  VIImage *v6;
  BOOL v7;

  v4 = (VIImage *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = -[VIImage pixelBuffer](v6, "pixelBuffer") == self->_pixelBuffer
      && -[VIImage orientation](v6, "orientation") == self->_orientation;

  }
  return v7;
}

- (unint64_t)hash
{
  return (2654435761 * self->_orientation) ^ CFHash(self->_pixelBuffer);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (unsigned)orientation
{
  return self->_orientation;
}

@end

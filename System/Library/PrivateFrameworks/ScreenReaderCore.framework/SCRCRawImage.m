@implementation SCRCRawImage

- (void)dealloc
{
  char *data;
  CGImage *imageRef;
  objc_super v5;

  data = self->_data;
  if (data)
    free(data);
  imageRef = self->_imageRef;
  if (imageRef)
  {
    CFRelease(imageRef);
    self->_imageRef = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SCRCRawImage;
  -[SCRCRawImage dealloc](&v5, sel_dealloc);
}

+ (id)rawImageForImage:(CGImage *)a3
{
  unint64_t Width;
  size_t Height;
  CGContext *v6;
  size_t v7;
  void *v8;
  CGColorSpace *DeviceRGB;
  CGContext *v10;
  CGRect v12;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v6 = 0;
  if (Width)
  {
    v7 = Height;
    if (Height)
    {
      v8 = malloc_type_malloc(4 * Width * Height, 0x8887EE33uLL);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v10 = CGBitmapContextCreate(v8, Width, v7, 8uLL, 4 * Width, DeviceRGB, 0x4001u);
      v6 = v10;
      if (v10)
      {
        v12.size.width = (double)Width;
        v12.size.height = (double)v7;
        v12.origin.x = 0.0;
        v12.origin.y = 0.0;
        CGContextDrawImage(v10, v12, a3);
        CGContextRelease(v6);
        v6 = objc_alloc_init(SCRCRawImage);
        -[CGContext setData:](v6, "setData:", v8);
        -[CGContext setWidth:](v6, "setWidth:", (int)Width);
        -[CGContext setHeight:](v6, "setHeight:", (int)v7);
        -[CGContext setBytesPerPixel:](v6, "setBytesPerPixel:", 4);
        -[CGContext setImageRef:](v6, "setImageRef:", a3);
      }
      CGColorSpaceRelease(DeviceRGB);
    }
  }
  return v6;
}

- (CGImage)imageRef
{
  return self->_imageRef;
}

- (void)setImageRef:(CGImage *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (char)data
{
  return self->_data;
}

- (void)setData:(char *)a3
{
  self->_data = a3;
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (int64_t)height
{
  return self->_height;
}

- (void)setHeight:(int64_t)a3
{
  self->_height = a3;
}

- (int64_t)bytesPerPixel
{
  return self->_bytesPerPixel;
}

- (void)setBytesPerPixel:(int64_t)a3
{
  self->_bytesPerPixel = a3;
}

@end

@implementation PKTextureLoadDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (id)initForDevice:(id)a3
{
  id v5;
  PKTextureLoadDescriptor *v6;
  PKTextureLoadDescriptor *v7;
  PKTextureLoadDescriptor *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKTextureLoadDescriptor;
    v6 = -[PKTextureLoadDescriptor init](&v10, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_device, a3);
      v7->_premultiplyAlpha = 1;
      v7->_storageMode = 0;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PKTextureLoadDescriptor;
  -[PKTextureLoadDescriptor dealloc](&v3, sel_dealloc);
}

- (id)createLoaderForCGImage:(CGImage *)a3
{
  PKTextureLoader *v5;
  void *storageMode;
  _BOOL4 premultiplyAlpha;
  CGColorSpace *colorSpace;
  MTLDevice *device;
  CGColorRenderingIntent renderingIntent;

  if (!a3)
    return 0;
  v5 = [PKTextureLoader alloc];
  storageMode = (void *)self->_storageMode;
  premultiplyAlpha = self->_premultiplyAlpha;
  device = self->_device;
  colorSpace = self->_colorSpace;
  if (colorSpace)
    renderingIntent = self->_renderingIntent;
  else
    renderingIntent = CGImageGetRenderingIntent(a3);
  return -[PKTextureLoader initForDevice:image:withStorageMode:premultiplyAlpha:colorSpace:renderingIntent:]((id *)&v5->super.isa, device, a3, storageMode, premultiplyAlpha, colorSpace, renderingIntent);
}

- (PKTextureLoadDescriptor)init
{

  return 0;
}

- (void)setColorSpace:(CGColorSpace *)a3 renderingIntent:(int)a4
{
  CGColorSpace *colorSpace;

  colorSpace = self->_colorSpace;
  if (colorSpace)
    CFRelease(colorSpace);
  self->_colorSpace = CGColorSpaceRetain(a3);
  self->_renderingIntent = a4;
}

- (MTLDevice)device
{
  return self->_device;
}

- (BOOL)premultiplyAlpha
{
  return self->_premultiplyAlpha;
}

- (void)setPremultiplyAlpha:(BOOL)a3
{
  self->_premultiplyAlpha = a3;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (int)renderingIntent
{
  return self->_renderingIntent;
}

@end

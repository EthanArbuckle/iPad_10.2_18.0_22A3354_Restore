@implementation PKMetalRenderLoop

- (void)_willDraw
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKMetalRenderLoop;
  -[PKRenderLoop _willDraw](&v3, sel__willDraw);
  if (self->_drawableSizeDirty)
  {
    self->_drawableSizeDirty = 0;
    -[CAMetalLayer setDrawableSize:](self->_layer, "setDrawableSize:", self->_drawableSize.width, self->_drawableSize.height);
  }
}

- (void)_didDraw
{
  CAMetalDrawable *currentDrawable;
  objc_super v4;

  currentDrawable = self->_currentDrawable;
  self->_currentDrawable = 0;

  v4.receiver = self;
  v4.super_class = (Class)PKMetalRenderLoop;
  -[PKRenderLoop _didDraw](&v4, sel__didDraw);
}

- (BOOL)isDrawableAvailable
{
  if (self->super._invalidated)
    return 0;
  if (self->_currentDrawable)
    return 1;
  if (!self->super._drawing)
    return 0;
  return -[CAMetalLayer isDrawableAvailable](self->_layer, "isDrawableAvailable");
}

- (id)currentDrawable
{
  CAMetalDrawable *v2;
  CAMetalDrawable *v4;
  CAMetalDrawable *currentDrawable;

  if (self->super._invalidated)
  {
    v2 = 0;
  }
  else
  {
    if (self->super._drawing && !self->_currentDrawable)
    {
      -[CAMetalLayer nextDrawable](self->_layer, "nextDrawable");
      v4 = (CAMetalDrawable *)objc_claimAutoreleasedReturnValue();
      currentDrawable = self->_currentDrawable;
      self->_currentDrawable = v4;

    }
    v2 = self->_currentDrawable;
  }
  return v2;
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  CGColorSpace *v4;
  unint64_t pixelFormat;
  CFStringRef *v6;

  if (!a3)
  {
    pixelFormat = self->_pixelFormat;
    v6 = (CFStringRef *)MEMORY[0x24BDBF308];
    if (pixelFormat != 80 && pixelFormat != 115)
    {
      if (pixelFormat != 81)
        goto LABEL_9;
      v6 = (CFStringRef *)MEMORY[0x24BDBF318];
    }
    if (*v6)
    {
      v4 = CGColorSpaceCreateWithName(*v6);
      goto LABEL_10;
    }
LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
  v4 = a3;
  CGColorSpaceRetain(a3);
LABEL_10:
  CGColorSpaceRelease(self->_colorSpace);
  self->_colorSpace = v4;
  -[CAMetalLayer setColorspace:](self->_layer, "setColorspace:", v4);
}

- (PKMetalRenderLoop)initWithPixelFormat:(unint64_t)a3 forDevice:(id)a4
{
  id v7;
  CFStringRef *v8;
  CGColorSpaceRef v9;
  CGColorSpaceRef v10;
  PKMetalRenderLoop *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  PKMetalRenderLoop *v17;
  objc_super v19;

  v7 = a4;
  if (!v7)
    goto LABEL_10;
  v8 = (CFStringRef *)MEMORY[0x24BDBF308];
  if (a3 != 80 && a3 != 115)
  {
    if (a3 != 81)
    {
LABEL_10:
      v17 = 0;
      goto LABEL_11;
    }
    v8 = (CFStringRef *)MEMORY[0x24BDBF318];
  }
  if (!*v8)
    goto LABEL_10;
  v9 = CGColorSpaceCreateWithName(*v8);
  if (!v9)
    goto LABEL_10;
  v10 = v9;
  v19.receiver = self;
  v19.super_class = (Class)PKMetalRenderLoop;
  v11 = -[PKRenderLoop init](&v19, sel_init);
  v12 = (uint64_t)v11;
  if (v11)
  {
    v11->_pixelFormat = a3;
    objc_storeStrong((id *)&v11->_device, a4);
    *(_QWORD *)(v12 + 120) = v10;
    v13 = objc_alloc_init(MEMORY[0x24BDE5708]);
    v14 = *(void **)(v12 + 80);
    *(_QWORD *)(v12 + 80) = v13;

    objc_msgSend(*(id *)(v12 + 80), "setDevice:", *(_QWORD *)(v12 + 112));
    objc_msgSend(*(id *)(v12 + 80), "setPixelFormat:", *(_QWORD *)(v12 + 104));
    objc_msgSend(*(id *)(v12 + 80), "setColorspace:", *(_QWORD *)(v12 + 120));
    objc_msgSend(*(id *)(v12 + 80), "setLowLatency:", 0);
    objc_msgSend(*(id *)(v12 + 80), "drawableSize");
    *(_QWORD *)(v12 + 128) = v15;
    *(_QWORD *)(v12 + 136) = v16;
    -[PKRenderLoop _setNeedsForcingPauseUpdate](v12);
  }
  else
  {
    CFRelease(v10);
  }
  self = (PKMetalRenderLoop *)(id)v12;
  v17 = self;
LABEL_11:

  return v17;
}

- (BOOL)_isForcingPause
{
  objc_super v4;

  if (self->_drawableSize.width == *MEMORY[0x24BDBF148]
    && self->_drawableSize.height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKMetalRenderLoop;
  return -[PKRenderLoop _isForcingPause](&v4, sel__isForcingPause);
}

- (CALayer)layer
{
  return (CALayer *)self->_layer;
}

- (void)setDrawableSize:(CGSize)a3
{
  CGSize *p_drawableSize;
  id WeakRetained;

  p_drawableSize = &self->_drawableSize;
  if (self->_drawableSize.width != a3.width || self->_drawableSize.height != a3.height)
  {
    p_drawableSize->width = a3.width;
    self->_drawableSize.height = a3.height;
    if (a3.width == *MEMORY[0x24BDBF148] && a3.height == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      self->_drawableSizeDirty = 0;
      -[CAMetalLayer setDrawableSize:](self->_layer, "setDrawableSize:", self->_drawableSize.width, self->_drawableSize.height);
    }
    else
    {
      self->_drawableSizeDirty = 1;
    }
    -[PKRenderLoop _setNeedsForcingPauseUpdate]((uint64_t)self);
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "renderLoop:drawableSizeDidChange:", self, p_drawableSize->width, p_drawableSize->height);

  }
}

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (CGSize)drawableSize
{
  double width;
  double height;
  CGSize result;

  width = self->_drawableSize.width;
  height = self->_drawableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFramebufferOnly:(BOOL)a3
{
  -[CAMetalLayer setFramebufferOnly:](self->_layer, "setFramebufferOnly:", a3);
}

- (PKMetalRenderLoop)init
{

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PKMetalRenderLoop;
  -[PKRenderLoop dealloc](&v3, sel_dealloc);
}

- (BOOL)framebufferOnly
{
  return -[CAMetalLayer framebufferOnly](self->_layer, "framebufferOnly");
}

- (void)_didInvalidate
{
  MTLDevice *device;
  CAMetalLayer *layer;
  CAMetalDrawable *currentDrawable;
  objc_super v6;

  device = self->_device;
  self->_device = 0;

  layer = self->_layer;
  self->_layer = 0;

  currentDrawable = self->_currentDrawable;
  self->_currentDrawable = 0;

  v6.receiver = self;
  v6.super_class = (Class)PKMetalRenderLoop;
  -[PKRenderLoop _didInvalidate](&v6, sel__didInvalidate);
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_currentDrawable, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end

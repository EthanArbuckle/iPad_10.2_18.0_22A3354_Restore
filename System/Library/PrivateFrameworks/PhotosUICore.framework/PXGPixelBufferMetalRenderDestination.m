@implementation PXGPixelBufferMetalRenderDestination

- (PXGPixelBufferMetalRenderDestination)initWithLayoutQueue:(id)a3 pixelBufferPool:(id)a4 scale:(double)a5 enablePoolRelease:(BOOL)a6
{
  id v11;
  id v12;
  PXGPixelBufferMetalRenderDestination *v13;
  PXGPixelBufferMetalRenderDestination *v14;
  uint64_t v15;
  PXGPixelBufferPool *pixelBufferPool;
  uint64_t v17;
  UIColor *backgroundColor;
  MTLDevice *v19;
  MTLDevice *device;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXGPixelBufferMetalRenderDestination;
  v13 = -[PXGPixelBufferMetalRenderDestination init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_layoutQueue, a3);
    v15 = objc_msgSend(v12, "copy");
    pixelBufferPool = v14->_pixelBufferPool;
    v14->_pixelBufferPool = (PXGPixelBufferPool *)v15;

    v14->_scale = a5;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v17 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v14->_backgroundColor;
    v14->_backgroundColor = (UIColor *)v17;

    v14->_clearColor.red = 0.0;
    v14->_clearColor.green = 0.0;
    v14->_clearColor.blue = 0.0;
    v14->_clearColor.alpha = 1.0;
    v19 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v14->_device;
    v14->_device = v19;

    v14->_enablePoolRelease = a6;
    CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v14->_device, 0, &v14->_textureCache);
    -[PXGPixelBufferMetalRenderDestination _updatePixelBufferProperties](v14, "_updatePixelBufferProperties");
  }

  return v14;
}

- (void)dealloc
{
  MTLTexture *renderTexture;
  MTLTexture *depthStencilTexture;
  MTLRenderPassDescriptor *currentRenderPassDescriptor;
  __CVMetalTextureCache *textureCache;
  objc_super v7;

  CGColorSpaceRelease(self->_destinationColorSpace);
  CVBufferRelease(self->_cvMetalTexture);
  renderTexture = self->_renderTexture;
  self->_renderTexture = 0;

  depthStencilTexture = self->_depthStencilTexture;
  self->_depthStencilTexture = 0;

  currentRenderPassDescriptor = self->_currentRenderPassDescriptor;
  self->_currentRenderPassDescriptor = 0;

  textureCache = self->_textureCache;
  if (textureCache)
    CFRelease(textureCache);
  CVPixelBufferRelease(self->_pixelBuffer);
  v7.receiver = self;
  v7.super_class = (Class)PXGPixelBufferMetalRenderDestination;
  -[PXGPixelBufferMetalRenderDestination dealloc](&v7, sel_dealloc);
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[PXGPixelBufferMetalRenderDestination _updatePixelBufferProperties](self, "_updatePixelBufferProperties");
  }
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v4;
  void *v5;
  UIColor *v6;
  char v7;
  UIColor *v8;
  UIColor *backgroundColor;
  double v10;
  double v11;
  double v12;
  double v13;
  UIColor *v14;

  v14 = (UIColor *)a3;
  v4 = self->_backgroundColor;
  v5 = v14;
  if (v4 == v14)
    goto LABEL_4;
  v6 = v4;
  v7 = -[UIColor isEqual:](v4, "isEqual:", v14);

  if ((v7 & 1) == 0)
  {
    v8 = (UIColor *)-[UIColor copy](v14, "copy");
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v8;

    -[PXGPixelBufferMetalRenderDestination colorspace](self, "colorspace");
    PXGClearColorFromColor();
    self->_clearColor.red = v10;
    self->_clearColor.green = v11;
    self->_clearColor.blue = v12;
    self->_clearColor.alpha = v13;
    -[PXGPixelBufferMetalRenderDestination delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "renderDestinationRequestRender:", self);
LABEL_4:

  }
}

- (void)setPixelBufferPool:(id)a3
{
  PXGPixelBufferPool *v5;
  PXGPixelBufferPool *v6;

  v5 = (PXGPixelBufferPool *)a3;
  if (self->_pixelBufferPool != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pixelBufferPool, a3);
    -[PXGPixelBufferMetalRenderDestination _updatePixelBufferProperties](self, "_updatePixelBufferProperties");
    v5 = v6;
  }

}

- (void)setRenderSize:(CGSize)a3
{
  double height;
  double width;
  void *v7;

  height = a3.height;
  width = a3.width;
  if (self->_renderSize.width != a3.width || self->_renderSize.height != a3.height)
  {
    -[PXGPixelBufferMetalRenderDestination delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renderDestination:renderSizeWillChange:", self, width, height);

    self->_renderSize.width = width;
    self->_renderSize.height = height;
    -[PXGPixelBufferMetalRenderDestination _invalidateDepthStencilTexture](self, "_invalidateDepthStencilTexture");
  }
}

- (void)_invalidatePixelBufferPool
{
  PXGPixelBufferPool *pixelBufferPool;

  pixelBufferPool = self->_pixelBufferPool;
  self->_pixelBufferPool = 0;

}

- (PXGPixelBufferPool)pixelBufferPool
{
  PXGPixelBufferPool *pixelBufferPool;
  PXGPixelBufferPool *v4;
  PXGPixelBufferPool *v5;
  void *v8;

  pixelBufferPool = self->_pixelBufferPool;
  if (!pixelBufferPool)
  {
    if (!self->_poolPixelFormatType)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPixelBufferMetalRenderDestination.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_poolPixelFormatType != 0"));

    }
    +[PXGPixelBufferPool pixelBufferPoolWithSize:format:](PXGPixelBufferPool, "pixelBufferPoolWithSize:format:", self->_poolPixelSize.width, self->_poolPixelSize.height);
    v4 = (PXGPixelBufferPool *)objc_claimAutoreleasedReturnValue();
    v5 = self->_pixelBufferPool;
    self->_pixelBufferPool = v4;

    -[PXGPixelBufferMetalRenderDestination _updatePixelBufferProperties](self, "_updatePixelBufferProperties");
    pixelBufferPool = self->_pixelBufferPool;
  }
  return pixelBufferPool;
}

- (void)_invalidateDepthStencilTexture
{
  MTLTexture *depthStencilTexture;

  depthStencilTexture = self->_depthStencilTexture;
  self->_depthStencilTexture = 0;

}

- (MTLTexture)depthStencilTexture
{
  MTLTexture *depthStencilTexture;
  void *v4;
  uint64_t v5;
  MTLTexture *v6;
  MTLTexture *v7;

  depthStencilTexture = self->_depthStencilTexture;
  if (!depthStencilTexture)
  {
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 260, (unint64_t)self->_renderSize.width, (unint64_t)self->_renderSize.height, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSampleCount:", 1);
    if ((unint64_t)objc_msgSend(v4, "sampleCount") >= 2)
      v5 = 4;
    else
      v5 = 2;
    objc_msgSend(v4, "setTextureType:", v5);
    objc_msgSend(v4, "setUsage:", 4);
    objc_msgSend(v4, "setStorageMode:", 2);
    v6 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v4);
    v7 = self->_depthStencilTexture;
    self->_depthStencilTexture = v6;

    depthStencilTexture = self->_depthStencilTexture;
  }
  return depthStencilTexture;
}

- (void)setDestinationColorSpace:(CGColorSpace *)a3
{
  CGColorSpace *destinationColorSpace;

  destinationColorSpace = self->_destinationColorSpace;
  if (destinationColorSpace != a3)
  {
    CGColorSpaceRelease(destinationColorSpace);
    self->_destinationColorSpace = a3;
    CGColorSpaceRetain(a3);
  }
}

- (CGColorSpace)destinationColorSpace
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;

  v2 = CGColorSpaceRetain(self->_destinationColorSpace);
  v3 = v2;
  if (v2)
    CFAutorelease(v2);
  return v3;
}

- (void)_updatePixelBufferProperties
{
  PXGPixelBufferPool *pixelBufferPool;
  CGFloat v4;
  CGFloat v5;
  CGColorSpace *v6;
  CGFloat v7;
  CGFloat v8;
  unsigned int v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
  {
    -[PXGPixelBufferPool pixelSize](pixelBufferPool, "pixelSize");
    self->_poolPixelSize.width = v4;
    self->_poolPixelSize.height = v5;
    self->_poolPixelFormatType = -[PXGPixelBufferPool pixelFormatType](self->_pixelBufferPool, "pixelFormatType");
    v6 = -[PXGPixelBufferPool colorSpace](self->_pixelBufferPool, "colorSpace");
    if (!v6)
      v6 = (CGColorSpace *)MEMORY[0x1A85CCEEC](12);
    -[PXGPixelBufferMetalRenderDestination setDestinationColorSpace:](self, "setDestinationColorSpace:", v6);
    -[PXGPixelBufferPool pixelSize](self->_pixelBufferPool, "pixelSize");
    -[PXGPixelBufferMetalRenderDestination setRenderSize:](self, "setRenderSize:");
    PXSizeScale();
    self->_renderBoundsInPoints.origin.x = 0.0;
    self->_renderBoundsInPoints.origin.y = 0.0;
    self->_renderBoundsInPoints.size.width = v7;
    self->_renderBoundsInPoints.size.height = v8;
    v9 = -[PXGPixelBufferPool pixelFormatType](self->_pixelBufferPool, "pixelFormatType");
    self->_pixelBufferFormatType = v9;
    if (v9 == 1380411457)
    {
      v10 = 115;
      goto LABEL_8;
    }
    if (v9 == 1111970369)
    {
      v10 = 80;
LABEL_8:
      self->_colorPixelFormat = v10;
      return;
    }
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Unsupported pixel format", v12, 2u);
    }

  }
}

- (void)_createResourceForRenderingFrame
{
  const __CFAllocator *v3;
  void *v4;
  __CVBuffer **p_pixelBuffer;
  CVReturn PixelBuffer;
  NSObject *v7;
  __CVMetalTextureCache *textureCache;
  __CVBuffer *v9;
  MTLPixelFormat v10;
  double v11;
  size_t v12;
  double v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[16];
  uint8_t v17[16];

  -[PXGPixelBufferMetalRenderDestination _releaseResourcesForRenderingFrame](self, "_releaseResourcesForRenderingFrame");
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  -[PXGPixelBufferMetalRenderDestination pixelBufferPool](self, "pixelBufferPool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_pixelBuffer = &self->_pixelBuffer;
  PixelBuffer = CVPixelBufferPoolCreatePixelBuffer(v3, (CVPixelBufferPoolRef)objc_msgSend(v4, "pixelBufferPool"), &self->_pixelBuffer);

  if (PixelBuffer)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Couldn't create pixel buffer", buf, 2u);
    }

    CVPixelBufferRelease(*p_pixelBuffer);
  }
  else
  {
    textureCache = self->_textureCache;
    v9 = self->_pixelBuffer;
    v10 = -[PXGPixelBufferMetalRenderDestination colorPixelFormat](self, "colorPixelFormat");
    -[PXGPixelBufferMetalRenderDestination renderSize](self, "renderSize");
    v12 = (unint64_t)v11;
    -[PXGPixelBufferMetalRenderDestination renderSize](self, "renderSize");
    if (CVMetalTextureCacheCreateTextureFromImage(v3, textureCache, v9, 0, v10, v12, (unint64_t)v13, 0, &self->_cvMetalTexture))
    {
      PXAssertGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Couldn't create metal texture", v17, 2u);
      }

    }
    else
    {
      CVMetalTextureGetTexture(self->_cvMetalTexture);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGPixelBufferMetalRenderDestination setRenderTexture:](self, "setRenderTexture:", v15);

      -[PXGPixelBufferMetalRenderDestination _createRenderPassDescriptor](self, "_createRenderPassDescriptor");
    }
  }
}

- (void)_createRenderPassDescriptor
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "colorAttachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLoadAction:", 2);

  -[PXGPixelBufferMetalRenderDestination clearColor](self, "clearColor");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v23, "colorAttachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClearColor:", v6, v8, v10, v12);

  -[PXGPixelBufferMetalRenderDestination renderTexture](self, "renderTexture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "colorAttachments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTexture:", v15);

  -[PXGPixelBufferMetalRenderDestination setCurrentRenderPassDescriptor:](self, "setCurrentRenderPassDescriptor:", v23);
  -[PXGPixelBufferMetalRenderDestination depthStencilTexture](self, "depthStencilTexture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v23, "depthAttachment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGPixelBufferMetalRenderDestination depthStencilTexture](self, "depthStencilTexture");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTexture:", v20);

    objc_msgSend(v19, "setLoadAction:", 2);
    objc_msgSend(v19, "setStoreAction:", 0);
    objc_msgSend(v19, "setClearDepth:", 1.0);
    objc_msgSend(v23, "stencilAttachment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGPixelBufferMetalRenderDestination depthStencilTexture](self, "depthStencilTexture");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTexture:", v22);

    objc_msgSend(v21, "setLoadAction:", 2);
    objc_msgSend(v21, "setStoreAction:", 0);
    objc_msgSend(v21, "setClearStencil:", 0);

  }
}

- (void)_releaseResourcesForRenderingFrame
{
  if (self->_pixelBuffer)
  {
    -[PXGPixelBufferMetalRenderDestination setRenderTexture:](self, "setRenderTexture:", 0);
    -[PXGPixelBufferMetalRenderDestination setCurrentRenderPassDescriptor:](self, "setCurrentRenderPassDescriptor:", 0);
    CVBufferRelease(self->_cvMetalTexture);
    CVPixelBufferRelease(self->_pixelBuffer);
    self->_cvMetalTexture = 0;
    self->_pixelBuffer = 0;
  }
}

- (int64_t)sampleCount
{
  return 1;
}

- (unint64_t)depthStencilPixelFormat
{
  return 260;
}

- (BOOL)canSetColorSpace
{
  return 0;
}

- (unint64_t)destinationColorSpaceName
{
  -[PXGPixelBufferMetalRenderDestination destinationColorSpace](self, "destinationColorSpace");
  JUMPOUT(0x1A85CCEF8);
}

- (void)setNeedsRender
{
  NSObject *v3;

  -[PXGPixelBufferMetalRenderDestination layoutQueue](self, "layoutQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PXGPixelBufferMetalRenderDestination renderImmediately](self, "renderImmediately");
}

- (void)renderImmediately
{
  NSObject *v3;
  id v4;

  -[PXGPixelBufferMetalRenderDestination layoutQueue](self, "layoutQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PXGPixelBufferMetalRenderDestination _createResourceForRenderingFrame](self, "_createResourceForRenderingFrame");
  -[PXGPixelBufferMetalRenderDestination delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderDestinationRequestRender:", self);

}

- (void)notifyDidCompleteRenderForFrameID:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  __CVBuffer *pixelBuffer;
  void (**v8)(_QWORD, _QWORD, _QWORD);

  -[PXGPixelBufferMetalRenderDestination layoutQueue](self, "layoutQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[PXGPixelBufferMetalRenderDestination renderCompletionBlock](self, "renderCompletionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    pixelBuffer = self->_pixelBuffer;

    if (pixelBuffer)
    {
      -[PXGPixelBufferMetalRenderDestination renderCompletionBlock](self, "renderCompletionBlock");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, __CVBuffer *, int64_t))v8)[2](v8, self->_pixelBuffer, a3);

    }
  }
  -[PXGPixelBufferMetalRenderDestination _releaseResourcesForRenderingFrame](self, "_releaseResourcesForRenderingFrame");
}

- (void)releaseCachedResources
{
  NSObject *v3;
  PXGPixelBufferPool *pixelBufferPool;

  -[PXGPixelBufferMetalRenderDestination layoutQueue](self, "layoutQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  CVMetalTextureCacheFlush(self->_textureCache, 0);
  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
    CVPixelBufferPoolFlush(-[PXGPixelBufferPool pixelBufferPool](pixelBufferPool, "pixelBufferPool"), 1uLL);
  if (-[PXGPixelBufferMetalRenderDestination enablePoolRelease](self, "enablePoolRelease"))
  {
    -[PXGPixelBufferMetalRenderDestination _invalidatePixelBufferPool](self, "_invalidatePixelBufferPool");
    -[PXGPixelBufferMetalRenderDestination _invalidateDepthStencilTexture](self, "_invalidateDepthStencilTexture");
  }
}

- (double)currentDynamicRangeHeadroom
{
  return 1.0;
}

- (double)maximumDynamicRangeHeadroom
{
  return 1.0;
}

- (PXGMetalRenderDestinationDelegate)delegate
{
  return (PXGMetalRenderDestinationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)renderSize
{
  double width;
  double height;
  CGSize result;

  width = self->_renderSize.width;
  height = self->_renderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)colorPixelFormat
{
  return self->_colorPixelFormat;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)setLayoutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_layoutQueue, a3);
}

- (double)scale
{
  return self->_scale;
}

- (CGRect)renderBoundsInPoints
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_renderBoundsInPoints.origin.x;
  y = self->_renderBoundsInPoints.origin.y;
  width = self->_renderBoundsInPoints.size.width;
  height = self->_renderBoundsInPoints.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor
{
  double red;
  double green;
  double blue;
  double alpha;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  red = self->_clearColor.red;
  green = self->_clearColor.green;
  blue = self->_clearColor.blue;
  alpha = self->_clearColor.alpha;
  result.var3 = alpha;
  result.var2 = blue;
  result.var1 = green;
  result.var0 = red;
  return result;
}

- (BOOL)enablePoolRelease
{
  return self->_enablePoolRelease;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (id)renderCompletionBlock
{
  return self->_renderCompletionBlock;
}

- (void)setRenderCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (MTLTexture)renderTexture
{
  return self->_renderTexture;
}

- (void)setRenderTexture:(id)a3
{
  objc_storeStrong((id *)&self->_renderTexture, a3);
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  return self->_currentRenderPassDescriptor;
}

- (void)setCurrentRenderPassDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_currentRenderPassDescriptor, a3);
}

- (unsigned)pixelBufferFormatType
{
  return self->_pixelBufferFormatType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_renderTexture, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong(&self->_renderCompletionBlock, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_depthStencilTexture, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pixelBufferPool, 0);
}

@end

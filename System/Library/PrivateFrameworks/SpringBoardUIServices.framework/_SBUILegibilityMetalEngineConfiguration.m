@implementation _SBUILegibilityMetalEngineConfiguration

- (_SBUILegibilityMetalEngineConfiguration)initWithScreen:(id)a3 settings:(id)a4 algo:(int64_t)a5
{
  return -[_SBUILegibilityMetalEngineConfiguration initWithScreen:settings:algo:pixelFormat:](self, "initWithScreen:settings:algo:pixelFormat:", a3, a4, a5, 81);
}

- (_SBUILegibilityMetalEngineConfiguration)initWithScreen:(id)a3 settings:(id)a4 algo:(int64_t)a5 pixelFormat:(unint64_t)a6
{
  id v12;
  id v13;
  void *v14;
  _SBUILegibilityMetalEngineConfiguration *v15;
  _SBUILegibilityMetalEngineConfiguration *v16;
  double v17;
  MTLDevice *v18;
  MTLDevice *device;
  MTLDevice *v20;
  uint64_t v21;
  MTLCommandQueue *commandQueue;
  uint64_t v23;
  MTKTextureLoader *textureLoader;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = v13;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUILegibilityMetalEngine.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("screen"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUILegibilityMetalEngine.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)_SBUILegibilityMetalEngineConfiguration;
  v15 = -[_SBUILegibilityMetalEngineConfiguration init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_screen, a3);
    objc_msgSend(v12, "scale");
    v16->_scale = v17;
    v16->_algo = a5;
    v16->_shadowRadius = 12.0;
    objc_storeWeak((id *)&v16->_settings, v14);
    v18 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v16->_device;
    v16->_device = v18;

    v20 = v16->_device;
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("SBUILegibilityMetalEngine.m"), 82, CFSTR("Unable to find a device for this Screen."));

      v20 = v16->_device;
    }
    v21 = -[MTLDevice newCommandQueue](v20, "newCommandQueue");
    commandQueue = v16->_commandQueue;
    v16->_commandQueue = (MTLCommandQueue *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6C40]), "initWithDevice:", v16->_device);
    textureLoader = v16->_textureLoader;
    v16->_textureLoader = (MTKTextureLoader *)v23;

    v16->_pixelFormat = a6;
    v16->_outputColorSpace = SBUIColorSpaceFromPixelFormat(a6);
    -[_SBUILegibilityMetalEngineConfiguration _configureConvolutionKernel](v16, "_configureConvolutionKernel");
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_outputColorSpace);
  v3.receiver = self;
  v3.super_class = (Class)_SBUILegibilityMetalEngineConfiguration;
  -[_SBUILegibilityMetalEngineConfiguration dealloc](&v3, sel_dealloc);
}

- (void)_configureConvolutionKernel
{
  double shadowRadius;
  double scale;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  unint64_t v10;
  int64_t algo;
  MPSUnaryImageKernel *v12;
  id v13;
  double v14;
  void *blurKernel;

  if (!self->_blurKernel)
  {
    shadowRadius = self->_shadowRadius;
    scale = self->_scale;
    v5 = 0.125;
    if (shadowRadius * scale <= 10.0)
      v5 = 0.25;
    self->_shadowScale = v5;
    v6 = scale * (shadowRadius * v5);
    v7 = v6 * 3.0 * 2.50662827 * 0.25 + 0.5;
    v8 = v6 < 2.0;
    v9 = 4.25994241;
    if (!v8)
      v9 = v7;
    v10 = vcvtmd_u64_f64(v9);
    self->_radius = v10;
    algo = self->_algo;
    if (algo == 1)
    {
      self->_radius = (unint64_t)(double)(v10 >> 2);
      v13 = objc_alloc(MEMORY[0x1E0CC6E48]);
      *(float *)&v14 = (float)self->_radius;
      v12 = (MPSUnaryImageKernel *)objc_msgSend(v13, "initWithDevice:sigma:", self->_device, v14);
    }
    else
    {
      if (algo)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        blurKernel = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(blurKernel, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUILegibilityMetalEngine.m"), 123, CFSTR("unknown algorithm defined for legibility?"));
        goto LABEL_14;
      }
      if ((v10 & 1) == 0)
        self->_radius = v10 + 1;
      v12 = (MPSUnaryImageKernel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6EB0]), "initWithDevice:kernelWidth:kernelHeight:", self->_device, self->_radius, self->_radius);
    }
    blurKernel = self->_blurKernel;
    self->_blurKernel = v12;
LABEL_14:

    -[MPSUnaryImageKernel setEdgeMode:](self->_blurKernel, "setEdgeMode:", 1);
  }
}

+ (id)buildDestinationTextureForDevice:(id)a3 size:(CGSize)a4 pixelFormat:(unint64_t)a5 outOutputBytes:(void *)a6 outLength:(unint64_t *)a7 outBytesPerRow:(unint64_t *)a8
{
  double height;
  double width;
  id v14;
  unint64_t v15;
  size_t v16;
  malloc_zone_t *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  height = a4.height;
  width = a4.width;
  v14 = a3;
  SBUIBytesPerPixelForMetalPixelFormat(a5);
  v15 = (CGBitmapGetAlignedBytesPerRow() & 0xFFFFFFFFFFFFFFC0) + 64;
  v16 = ((v15 * (unint64_t)height) & 0xFFFFFFFFFFFFF000) + 4096;
  v17 = malloc_default_zone();
  v18 = malloc_type_zone_memalign(v17, 0x1000uLL, v16, 0x83733279uLL);
  bzero(v18, v16);
  if (a6)
    *a6 = v18;
  if (a7)
    *a7 = v16;
  if (a8)
    *a8 = v15;
  v19 = (void *)objc_msgSend(v14, "newBufferWithBytesNoCopy:length:options:deallocator:", v18, v16, 0, 0);

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a5, (unint64_t)width, (unint64_t)height, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUsage:", 2);
  v21 = (void *)objc_msgSend(v19, "newTextureWithDescriptor:offset:bytesPerRow:", v20, 0, v15);

  return v21;
}

- (id)_sourceTextureForImage:(id)a3 settings:(id)a4 outMetalOutputTextureSize:(CGSize *)a5
{
  CGImage *v8;
  id v9;
  CGImage *v10;
  CGImage *v11;
  double Width;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  id v17;
  MTKTextureLoader *textureLoader;
  id v19;
  void *v20;
  void *v21;
  id v23;

  v8 = (CGImage *)a3;
  -[_SBUILegibilityMetalEngineConfiguration _prepareImageForConvolution:settings:](self, "_prepareImageForConvolution:settings:", v8, a4);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (CGImage *)objc_msgSend(v9, "CGImage");
  if (v10)
  {
    v11 = v10;
    Width = (double)CGImageGetWidth(v10);
    -[_SBUILegibilityMetalEngineConfiguration _metalTextureOutputSizeForInputSize:](self, "_metalTextureOutputSizeForInputSize:", Width, (double)CGImageGetHeight(v11));
    if (a5)
    {
      a5->width = v13;
      a5->height = v14;
    }
    CGImageGetProperty();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", SBUIMetalPixelFormatForCGImage(v8, 0), objc_msgSend(v15, "width"), objc_msgSend(v15, "height"), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setUsage:", 2);
      v17 = (id)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v16, v15, 0);

      if (v17)
        goto LABEL_8;
    }
    textureLoader = self->_textureLoader;
    v23 = 0;
    v17 = -[MTKTextureLoader newTextureWithCGImage:options:error:](textureLoader, "newTextureWithCGImage:options:error:", v11, 0, &v23);
    v19 = v23;
    if (!v19)
    {
LABEL_8:
      v17 = v17;
      v20 = 0;
      v21 = v17;
    }
    else
    {
      v20 = v19;
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (CGSize)_metalTextureOutputSizeForInputSize:(CGSize)a3
{
  double width;
  double v4;
  double v5;
  float v7;
  float height;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] != width || v5 != a3.height)
  {
    v7 = width;
    v4 = (double)(uint64_t)llroundf(v7);
    height = a3.height;
    v5 = (double)(uint64_t)llroundf(height);
  }
  v9 = v5;
  result.height = v9;
  result.width = v4;
  return result;
}

- (id)_prepareImageForConvolution:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double scale;
  double v11;
  double v12;
  double v13;
  double shadowScale;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD v23[4];
  id v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_shadowScale != 1.0)
  {
    if (v7)
    {
      objc_msgSend(v7, "shadowSettings");
      v9 = *(double *)&v32;
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v9 = 0.0;
    }
    scale = self->_scale;
    objc_msgSend(v6, "size");
    v13 = v9 + v12;
    shadowScale = self->_shadowScale;
    *(float *)&v11 = shadowScale * (v9 + v11);
    v15 = ceilf(*(float *)&v11);
    *(float *)&v11 = shadowScale * v13;
    v16 = ceilf(*(float *)&v11);
    objc_msgSend(v6, "size");
    objc_msgSend(v6, "size");
    UIRectCenteredIntegralRectScale();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __80___SBUILegibilityMetalEngineConfiguration__prepareImageForConvolution_settings___block_invoke;
    v23[3] = &unk_1E4C3F5C8;
    v25 = v15;
    v26 = v16;
    v27 = v17;
    v28 = v18;
    v29 = v19;
    v30 = v20;
    v24 = v6;
    v21 = v6;
    -[_SBUILegibilityMetalEngineConfiguration drawImageForSize:scale:drawBlock:](self, "drawImageForSize:scale:drawBlock:", v23, v15, v16, scale, *(_QWORD *)&scale);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)drawImageForSize:(CGSize)a3 drawBlock:(id)a4
{
  return -[_SBUILegibilityMetalEngineConfiguration drawImageForSize:scale:drawBlock:](self, "drawImageForSize:scale:drawBlock:", a4, a3.width, a3.height, self->_scale);
}

- (id)drawImageForSize:(CGSize)a3 scale:(double)a4 drawBlock:(id)a5
{
  unint64_t pixelFormat;
  char v6;

  pixelFormat = self->_pixelFormat;
  if (pixelFormat == 10)
    v6 = 7;
  else
    v6 = 2;
  return (id)UIImageCreateFromMTLPixelFormat(pixelFormat, v6, 0, a5, 0, a3.width, a3.height, a4);
}

- (id)executeBlurForImage:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  CGDataProvider *v14;
  CGImage *v15;
  void *v16;
  size_t bytesPerRow;
  size_t v19;
  const void *v20;
  __int128 v21;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v7, "scale");
    v9 = v8;
    v10 = objc_msgSend(v7, "imageOrientation");
    v21 = *MEMORY[0x1E0C9D820];
    -[_SBUILegibilityMetalEngineConfiguration _sourceTextureForImage:settings:outMetalOutputTextureSize:](self, "_sourceTextureForImage:settings:outMetalOutputTextureSize:", v7, v6, &v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    v20 = 0;
    bytesPerRow = 0;
    objc_msgSend((id)objc_opt_class(), "buildDestinationTextureForDevice:size:pixelFormat:outOutputBytes:outLength:outBytesPerRow:", self->_device, self->_pixelFormat, &v20, &v19, &bytesPerRow, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSUnaryImageKernel encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_blurKernel, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v13, v11, v12);
    objc_msgSend(v13, "commit");
    objc_msgSend(v13, "waitUntilCompleted");
    v14 = CGDataProviderCreateWithData(0, v20, v19, (CGDataProviderReleaseDataCallback)_SBUILegibilityMetalEngineCGDataProviderFreeDataCallback);
    v15 = CGImageCreate((unint64_t)*(double *)&v21, (unint64_t)*((double *)&v21 + 1), 8uLL, 0x20uLL, bytesPerRow, self->_outputColorSpace, 1u, v14, 0, 0, kCGRenderingIntentDefault);
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v15, v10, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      CGImageRelease(v15);
    if (v14)
      CGDataProviderRelease(v14);

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (MPSUnaryImageKernel)blurKernel
{
  return self->_blurKernel;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (SBUILegibilitySettings)settings
{
  return (SBUILegibilitySettings *)objc_loadWeakRetained((id *)&self->_settings);
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (MTKTextureLoader)textureLoader
{
  return self->_textureLoader;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (double)shadowScale
{
  return self->_shadowScale;
}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)radius
{
  return self->_radius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureLoader, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_settings);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_blurKernel, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_blurTemplateImage, 0);
}

@end

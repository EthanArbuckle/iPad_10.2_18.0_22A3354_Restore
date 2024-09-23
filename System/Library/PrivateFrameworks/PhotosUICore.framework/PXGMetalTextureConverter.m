@implementation PXGMetalTextureConverter

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (PXGMetalRenderContext)metalRenderContext
{
  return self->_metalRenderContext;
}

- (CGColorSpace)destinationColorSpace
{
  return self->_destinationColorSpace;
}

- (PXGMetalTextureConverterDelegate)delegate
{
  return (PXGMetalTextureConverterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)createTextureAtlasManagerForImageDataSpec:(id *)a3 mipmapped:(BOOL)a4
{
  _BOOL8 v4;
  int64_t screenPixelCount;
  unsigned int var2;
  unsigned int var3;
  double v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  PXGMetalTextureAtlasManager *v19;
  unint64_t var0;
  void *v21;
  void *v22;
  void *v23;
  PXGMetalTextureAtlasManager *v24;

  v4 = a4;
  screenPixelCount = self->_screenPixelCount;
  var2 = a3->var2;
  var3 = a3->var3;
  v10 = (double)var2;
  v11 = -[PXGMetalTextureConverter lowMemoryMode](self, "lowMemoryMode");
  LODWORD(v12) = +[PXGMetalTextureAtlas maxCapacityForThumbnailSize:pixelFormat:](PXGMetalTextureAtlas, "maxCapacityForThumbnailSize:pixelFormat:", a3->var0, (double)var2, (double)var3);
  v13 = PXGColorSpaceNameFromCFStringRef();
  v14 = MEMORY[0x1A85CCEEC](v13);
  -[PXGMetalTextureConverter destinationColorSpace](self, "destinationColorSpace");
  if (PXGRequiresColorMatching())
  {
    -[PXGMetalTextureConverter colorProgramLibrary](self, "colorProgramLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorProgramForSourceColorSpace:flags:", v14, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  v17 = 0.1;
  if (v11)
    v17 = 0.025;
  v18 = v17 * (double)(uint64_t)((double)screenPixelCount / (double)(int)(var3 * var2));
  if (v18 < 8.0)
    v18 = 8.0;
  if (v12 >= v18)
    v12 = v18;
  else
    v12 = v12;
  v19 = [PXGMetalTextureAtlasManager alloc];
  var0 = a3->var0;
  -[PXGMetalTextureConverter requestQueue](self, "requestQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalTextureConverter layoutQueue](self, "layoutQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PXGMetalTextureAtlasManager initWithThumbnailSize:pixelFormat:capacityPerAtlas:mipmapped:requestQueue:layoutQueue:colorProgram:context:](v19, "initWithThumbnailSize:pixelFormat:capacityPerAtlas:mipmapped:requestQueue:layoutQueue:colorProgram:context:", var0, v12, v4, v21, v22, v16, v10, (double)var3, v23);

  -[PXGMetalTextureAtlasManager setTextureConverter:](v24, "setTextureConverter:", self);
  return v24;
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (id)createAtlasForTextureAtlasManager:(id)a3
{
  id v5;
  PXGMetalTextureAtlas *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  PXGMetalTextureAtlas *v17;
  void *v18;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureConverter.m"), 581, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("textureAtlasManager"), v22);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureConverter.m"), 581, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("textureAtlasManager"), v22, v24);

    goto LABEL_6;
  }
LABEL_3:
  v6 = [PXGMetalTextureAtlas alloc];
  objc_msgSend(v5, "thumbnailSize");
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(v5, "pixelFormat");
  v12 = objc_msgSend(v5, "capacityPerAtlas");
  v13 = objc_msgSend(v5, "mipmapped");
  objc_msgSend(v5, "colorProgram");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalTextureConverter layoutQueue](self, "layoutQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PXGMetalTextureAtlas initWithThumbnailSize:pixelFormat:capacity:mipmapped:colorProgram:context:layoutQueue:](v6, "initWithThumbnailSize:pixelFormat:capacity:mipmapped:colorProgram:context:layoutQueue:", v11, v12, v13, v14, v15, v16, v8, v10);

  -[PXGMetalTextureConverter delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "metalTextureConverter:didCreateTexture:options:", self, v17, 0);

  return v17;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (PXGImageTexture)transparentTexture
{
  return self->_transparentTexture;
}

- (unint64_t)supportedContentTypes
{
  return 15;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

uint64_t __53__PXGMetalTextureConverter__createTransparentTexture__block_invoke()
{
  return CGContextClear();
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)_createTransparentTexture
{
  CGImage *v3;
  double v4;
  void *v5;

  v3 = (CGImage *)MEMORY[0x1A85CCE98](0, 0, &__block_literal_global_202610, 1.0, 1.0);
  LODWORD(v4) = 0;
  -[PXGMetalTextureConverter createTextureFromCGImage:transform:alpha:options:error:](self, "createTextureFromCGImage:transform:alpha:options:error:", v3, 0, 0, *(double *)off_1E50B83E0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v3);
  return v5;
}

- (PXGMetalTextureConverter)initWithContext:(id)a3 presentationType:(unsigned __int8)a4 destinationColorspaceName:(unint64_t)a5 layoutQueue:(id)a6
{
  id v12;
  id v13;
  PXGMetalTextureConverter *v14;
  void *v15;
  PXGColorProgramLibrary *v16;
  PXGColorProgramLibrary *colorProgramLibrary;
  uint64_t v18;
  PXGImageTexture *transparentTexture;
  NSMutableSet *v20;
  NSMutableSet *failedPixelFormats;
  void *v23;
  objc_super v24;

  v12 = a3;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXGMetalTextureConverter;
  v14 = -[PXGMetalTextureConverter init](&v24, sel_init);
  if (v14)
  {
    objc_msgSend(v12, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("PXGMetalTextureConverter.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context.device != nil"));

    }
    objc_storeStrong((id *)&v14->_metalRenderContext, a3);
    v14->_presentationType = a4;
    objc_storeStrong((id *)&v14->_layoutQueue, a6);
    v14->_screenPixelCount = +[PXGView screenPixelCount](PXGView, "screenPixelCount");
    v14->_destinationColorSpaceName = a5;
    v14->_destinationColorSpace = (CGColorSpace *)MEMORY[0x1A85CCEEC](a5);
    v14->_hasExtendedColorTarget = MEMORY[0x1A85CCE50](a5);
    v16 = -[PXGColorProgramLibrary initWithContext:destinationColorSpace:]([PXGColorProgramLibrary alloc], "initWithContext:destinationColorSpace:", v12, -[PXGMetalTextureConverter destinationColorSpace](v14, "destinationColorSpace"));
    colorProgramLibrary = v14->_colorProgramLibrary;
    v14->_colorProgramLibrary = v16;

    -[PXGMetalTextureConverter _createTransparentTexture](v14, "_createTransparentTexture");
    v18 = objc_claimAutoreleasedReturnValue();
    transparentTexture = v14->_transparentTexture;
    v14->_transparentTexture = (PXGImageTexture *)v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    failedPixelFormats = v14->_failedPixelFormats;
    v14->_failedPixelFormats = v20;

  }
  return v14;
}

- (PXGMetalTextureConverter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureConverter.m"), 89, CFSTR("%s is not available as initializer"), "-[PXGMetalTextureConverter init]");

  abort();
}

- (void)dealloc
{
  __CVMetalTextureCache *videoTextureCache;
  objc_super v4;

  videoTextureCache = self->_videoTextureCache;
  if (videoTextureCache)
    CFRelease(videoTextureCache);
  v4.receiver = self;
  v4.super_class = (Class)PXGMetalTextureConverter;
  -[PXGMetalTextureConverter dealloc](&v4, sel_dealloc);
}

- (__CVMetalTextureCache)videoTextureCache
{
  __CVMetalTextureCache *result;
  __CVMetalTextureCache **p_videoTextureCache;
  const __CFAllocator *v5;
  void *v6;
  void *v7;

  p_videoTextureCache = &self->_videoTextureCache;
  result = self->_videoTextureCache;
  if (!result)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CVMetalTextureCacheCreate(v5, 0, v7, 0, p_videoTextureCache);

    return self->_videoTextureCache;
  }
  return result;
}

- (CIContext)renderContext
{
  CIContext *renderContext;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CIContext *v8;
  CIContext *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  renderContext = self->_renderContext;
  if (!renderContext)
  {
    v4 = (void *)MEMORY[0x1E0C9DD90];
    -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C9DF58];
    v12[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextWithMTLDevice:options:", v6, v7);
    v8 = (CIContext *)objc_claimAutoreleasedReturnValue();
    v9 = self->_renderContext;
    self->_renderContext = v8;

    renderContext = self->_renderContext;
  }
  return renderContext;
}

- (PXGMetalTextureCache)renderTextureCache
{
  PXGMetalTextureCache *renderTextureCache;
  void *v4;
  id v5;
  void *v6;
  PXGMetalTextureCache *v7;
  PXGMetalTextureCache *v8;

  renderTextureCache = self->_renderTextureCache;
  if (!renderTextureCache)
  {
    objc_msgSend(off_1E50B5CD0, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "enableRenderTextureCache"))
    {
      v5 = objc_alloc((Class)off_1E50B2B88);
      -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (PXGMetalTextureCache *)objc_msgSend(v5, "initWithContext:", v6);
      v8 = self->_renderTextureCache;
      self->_renderTextureCache = v7;

      -[PXGMetalTextureCache setCapacity:](self->_renderTextureCache, "setCapacity:", objc_msgSend(v4, "renderTextureCacheCapacity"));
      objc_msgSend(v4, "renderTextureCacheAgeLimit");
      -[PXGMetalTextureCache setAgeLimit:](self->_renderTextureCache, "setAgeLimit:");
      -[PXGMetalTextureCache setSizeLimit:](self->_renderTextureCache, "setSizeLimit:", objc_msgSend(v4, "renderTextureCacheSizeLimitMB") << 20);
    }

    renderTextureCache = self->_renderTextureCache;
  }
  return renderTextureCache;
}

- (id)createTextureFromCGImage:(CGImage *)a3 transform:(float)a4 alpha:(id)a5 options:(id *)a6 error:
{
  float v6;
  float v9;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  const void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  CGImage *v22;
  void *v23;
  unsigned int Opaque;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  CGColorSpaceRef ColorSpace;
  void *v30;
  void *v31;
  CGImage *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  PXGMetalImageTexture *v36;
  uint64_t v37;
  double v38;
  PXGMetalImageTexture *v39;
  void *v40;
  void *v41;
  PXGMetalImageTexture *v42;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  CGColorSpaceRef v47;
  CGColorSpace *v48;
  double v49;
  uint8_t buf[4];
  CGImage *v51;
  __int16 v52;
  CGImage *v53;
  __int16 v54;
  CGImage *v55;
  uint64_t v56;

  v9 = v6;
  v49 = *(double *)&a4;
  v56 = *MEMORY[0x1E0C80C00];
  -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PXGMaxTextureSize();

  if (CGImageGetProperty())
  {
    -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PXGCreateMetalTexturesFromIOSurface();
    v15 = 0;
    v16 = 0;

    if (v15)
      goto LABEL_14;
  }
  else if (CGImageGetImageProvider() && (v17 = CGImageProviderCopyIOSurface()) != 0)
  {
    v18 = (const void *)v17;
    -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PXGCreateMetalTexturesFromIOSurface();
    v15 = 0;
    v16 = 0;

    CFRelease(v18);
    if (v15)
      goto LABEL_14;
  }
  else
  {
    v16 = 0;
  }
  -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PXGCreateMetalTextureFromBytesInCGImage();
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    PXGTungstenGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v51 = a3;
      _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEFAULT, "Having to redraw image %{public}@", buf, 0xCu);
    }

    kdebug_trace();
    -[PXGMetalTextureConverter destinationColorSpaceName](self, "destinationColorSpaceName");
    -[PXGMetalTextureConverter hasExtendedColorTarget](self, "hasExtendedColorTarget");
    v22 = (CGImage *)PXGMetalCompatibleImageByRedrawingCGImage();
    kdebug_trace();
    -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PXGCreateMetalTextureFromBytesInCGImage();
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      PXAssertGetLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v51 = v22;
        v52 = 2112;
        v53 = a3;
        _os_log_fault_impl(&dword_1A6789000, v44, OS_LOG_TYPE_FAULT, "Failed to create metal texture from redrawn image:%@ sourceImage:%@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Unable to create texture for image:%@"), a3);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v39 = 0;
      if (a6)
        goto LABEL_27;
      goto LABEL_28;
    }
    a3 = v22;
  }
LABEL_14:
  Opaque = PXGCGImageGetOpaque();
  if (v9 >= 1.0)
    v25 = Opaque;
  else
    v25 = 0;
  CGImageGetColorSpace(a3);
  -[PXGMetalTextureConverter destinationColorSpace](self, "destinationColorSpace");
  if (!PXGRequiresColorMatching())
  {
    v27 = 0;
    goto LABEL_25;
  }
  -[PXGMetalTextureConverter colorProgramLibrary](self, "colorProgramLibrary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "colorProgramForSourceColorSpace:flags:", CGImageGetColorSpace(a3), v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
LABEL_25:
    v35 = v25;
    v34 = v15;
    goto LABEL_26;
  }
  PXGTungstenGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    ColorSpace = CGImageGetColorSpace(a3);
    *(_DWORD *)buf = 138543618;
    v51 = ColorSpace;
    v52 = 2114;
    v53 = a3;
    _os_log_impl(&dword_1A6789000, v28, OS_LOG_TYPE_ERROR, "Unable to convert color space:%{public}@ to color program for image:%{public}@", buf, 0x16u);
  }

  kdebug_trace();
  -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "device");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  PXGMaxTextureSize();
  -[PXGMetalTextureConverter destinationColorSpaceName](self, "destinationColorSpaceName");
  -[PXGMetalTextureConverter hasExtendedColorTarget](self, "hasExtendedColorTarget");
  v32 = (CGImage *)PXGMetalCompatibleImageByRedrawingCGImage();

  -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  PXGCreateMetalTextureFromBytesInCGImage();
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  kdebug_trace();
  CGImageGetColorSpace(v32);
  -[PXGMetalTextureConverter destinationColorSpace](self, "destinationColorSpace");
  if (PXGRequiresColorMatching())
  {
    if ((_DWORD)v25)
      v35 = PXGCGImageGetOpaque();
    else
      v35 = 0;
    -[PXGMetalTextureConverter colorProgramLibrary](self, "colorProgramLibrary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "colorProgramForSourceColorSpace:flags:", CGImageGetColorSpace(v32), v25 | v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      PXAssertGetLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = CGImageGetColorSpace(v32);
        v48 = -[PXGMetalTextureConverter destinationColorSpace](self, "destinationColorSpace");
        *(_DWORD *)buf = 138412802;
        v51 = v47;
        v52 = 2112;
        v53 = v48;
        v54 = 2112;
        v55 = v32;
        _os_log_error_impl(&dword_1A6789000, v46, OS_LOG_TYPE_ERROR, "Unable to color match re-drawn image with colorSpace:%@ destinationColorSpace:%@ image:%@", buf, 0x20u);
      }

      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
    v35 = v25;
  }
  v16 = 0;
LABEL_26:
  v36 = [PXGMetalImageTexture alloc];
  v37 = -[PXGMetalTextureConverter presentationType](self, "presentationType");
  *(float *)&v38 = v9;
  v39 = -[PXGMetalImageTexture initWithTexture:chromaTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:](v36, "initWithTexture:chromaTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:", v34, v16, v27, v35, 0, v37, v49, v38);
  -[PXGMetalTextureConverter delegate](self, "delegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "metalTextureConverter:didCreateTexture:options:", self, v39, a5);

  v41 = 0;
  if (a6)
LABEL_27:
    *a6 = objc_retainAutorelease(v41);
LABEL_28:
  v42 = v39;

  return v42;
}

- (id)createTextureFromCVPixelBuffer:(__CVBuffer *)a3 transform:(float)a4 alpha:(id)a5 options:(id *)a6 error:
{
  float v6;
  float v9;
  void *v12;
  int v13;
  id v14;
  id v15;
  char v16;
  CGColorSpaceRef ColorSpace;
  const __CFDictionary *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  PXGMetalImageTexture *v22;
  double v23;
  uint64_t v24;
  double v25;
  PXGMetalImageTexture *v26;
  NSObject *v27;
  void *v28;
  uint64_t PixelFormatType;
  void *v30;
  void *v31;
  NSMutableSet *failedPixelFormats;
  void *v33;
  NSMutableSet *v34;
  void *v35;
  NSObject *v36;
  __CVBuffer *v37;
  double v39;
  uint8_t buf[4];
  __CVBuffer *v41;
  __int16 v42;
  __CVBuffer *v43;
  uint64_t v44;

  v9 = v6;
  v39 = *(double *)&a4;
  v44 = *MEMORY[0x1E0C80C00];
  -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalTextureConverter videoTextureCache](self, "videoTextureCache");
  v13 = PXGCreateMetalTexturesFromPixelBuffer();
  v14 = 0;
  v15 = 0;

  v16 = 0;
  if (!v13)
    goto LABEL_18;
  ColorSpace = CVImageBufferGetColorSpace(a3);
  if (!ColorSpace)
  {
    v18 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
    ColorSpace = CVImageBufferCreateColorSpaceFromAttachments(v18);
    if (v18)
      CFRelease(v18);
    if (!ColorSpace)
      goto LABEL_14;
    CFAutorelease(ColorSpace);
  }
  -[PXGMetalTextureConverter destinationColorSpace](self, "destinationColorSpace");
  if (!PXGRequiresColorMatching())
  {
LABEL_14:
    v20 = 0;
    goto LABEL_15;
  }
  -[PXGMetalTextureConverter colorProgramLibrary](self, "colorProgramLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "colorProgramForSourceColorSpace:flags:", ColorSpace, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    if (CGColorSpaceUsesITUR_2100TF(ColorSpace))
    {
      v16 = 1;
      goto LABEL_18;
    }
    PXAssertGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v41 = ColorSpace;
      v42 = 2112;
      v43 = a3;
      _os_log_error_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "Unable to create program for space %@ in %@. Video frames might not be correctly color matched.", buf, 0x16u);
    }

    goto LABEL_14;
  }
LABEL_15:
  v22 = [PXGMetalImageTexture alloc];
  LODWORD(v23) = 1.0;
  v24 = -[PXGMetalTextureConverter presentationType](self, "presentationType", v23);
  *(float *)&v25 = v9;
  v26 = -[PXGMetalImageTexture initWithTexture:chromaTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:](v22, "initWithTexture:chromaTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:", v14, v15, v20, v9 >= 1.0, 0, v24, v39, v25);
  -[PXGImageTexture setSourceCVPixelBuffer:](v26, "setSourceCVPixelBuffer:", a3);

  if (v26)
  {
    -[PXGMetalTextureConverter delegate](self, "delegate");
    v27 = objc_claimAutoreleasedReturnValue();
    -[NSObject metalTextureConverter:didCreateTexture:options:](v27, "metalTextureConverter:didCreateTexture:options:", self, v26, a5);
    v28 = 0;
    goto LABEL_28;
  }
  v16 = 0;
LABEL_18:
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v30 = (void *)MEMORY[0x1E0CB35C8];
  PXGStringForOSType();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "px_genericErrorWithDebugDescription:", CFSTR("Unable to create texture for format:%@ pixelBuffer:%@"), v31, a3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  failedPixelFormats = self->_failedPixelFormats;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(failedPixelFormats) = -[NSMutableSet containsObject:](failedPixelFormats, "containsObject:", v33);

  if ((failedPixelFormats & 1) == 0)
  {
    v34 = self->_failedPixelFormats;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v34, "addObject:", v35);

    PXGTungstenGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      PXGStringForOSType();
      v37 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v37;
      v42 = 2114;
      v43 = a3;
      _os_log_impl(&dword_1A6789000, v36, OS_LOG_TYPE_FAULT, "Failed to create metal texture for pixel buffer format:%{public}@ pixelBuffer:%{public}@", buf, 0x16u);

    }
  }
  if ((v16 & 1) != 0)
  {
    v26 = 0;
    if (!a6)
      goto LABEL_30;
    goto LABEL_29;
  }
  PXAssertGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v41 = a3;
    _os_log_error_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, "Unable to create texture for video pixelBuffer %@", buf, 0xCu);
  }
  v26 = 0;
LABEL_28:

  if (a6)
LABEL_29:
    *a6 = objc_retainAutorelease(v28);
LABEL_30:

  return v26;
}

- (id)applyAdjustment:(id)a3 toTexture:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v8)
    {
      objc_opt_class();
      objc_msgSend(v9, "pixelSize");
      objc_msgSend(v9, "pixelSize");
      kdebug_trace();
      -[PXGMetalTextureConverter _applyAdjustment:toMetalTexture:options:](self, "_applyAdjustment:toMetalTexture:options:", v8, v9, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_msgSend(v10, "pixelSize");
      objc_msgSend(v10, "pixelSize");
      kdebug_trace();
      if ((*(_QWORD *)&a5 & 0x100000000) == 0)
        goto LABEL_13;
    }
    else
    {
      v10 = 0;
      if ((*(_QWORD *)&a5 & 0x100000000) == 0)
        goto LABEL_13;
    }
    if (v10)
      v11 = v10;
    else
      v11 = v9;
    v12 = v11;
    objc_msgSend(v12, "pixelSize");
    objc_msgSend(v12, "pixelSize");
    kdebug_trace();
    -[PXGMetalTextureConverter _generateMipmapsForMetalTexture:](self, "_generateMipmapsForMetalTexture:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pixelSize");
    objc_msgSend(v13, "pixelSize");
    kdebug_trace();
    if (v13)
    {
      v14 = v13;

      v10 = v14;
    }

  }
  else
  {
    v10 = 0;
  }
LABEL_13:

  return v10;
}

- (id)_generateMipmapsForMetalTexture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXGMetalImageTexture *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  int v13;
  int v14;
  uint64_t v15;
  double v16;
  PXGMetalImageTexture *v17;
  NSObject *v18;
  double v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "texture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "pixelFormat") > 0x1F3)
  {
    PXGTungstenGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v22 = objc_msgSend(v5, "pixelFormat");
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEBUG, "Cannot generate mipmaps for incompatible pixel format %d", buf, 8u);
    }

    v17 = 0;
  }
  else
  {
    -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "newMipmappedTextureFromTexture:", v5);

    v8 = [PXGMetalImageTexture alloc];
    objc_msgSend(v4, "colorProgram");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isOpaque");
    v11 = objc_msgSend(v4, "shaderFlags");
    objc_msgSend(v4, "orientationTransform");
    v20 = v12;
    objc_msgSend(v4, "alpha");
    v14 = v13;
    v15 = -[PXGMetalTextureConverter presentationType](self, "presentationType");
    LODWORD(v16) = v14;
    v17 = -[PXGMetalImageTexture initWithTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:](v8, "initWithTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:", v7, v9, v10, v11, v15, v20, v16);

  }
  return v17;
}

- (id)_applyAdjustment:(id)a3 toMetalTexture:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  CGColorSpace *v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  double v56;
  int v57;
  double v58;
  uint64_t v59;
  double v60;
  double v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  CGFloat v66;
  CGFloat v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t *v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  id v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id v85;
  void *v86;
  PXGMetalTextureConverter *v88;
  id v90;
  uint8_t buf[4];
  uint64_t Name;
  __int16 v93;
  NSObject *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;
  CGColorSpace *v100;
  uint64_t v101;
  CGColorSpace *v102;
  uint64_t v103;
  CGColorSpace *v104;
  _QWORD v105[4];
  _QWORD v106[4];
  _QWORD v107[4];
  _QWORD v108[4];
  _QWORD v109[4];
  _QWORD v110[4];
  _QWORD v111[3];
  _QWORD v112[3];
  _QWORD v113[2];
  _QWORD v114[2];
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  _QWORD v118[3];
  CGSize v119;

  v118[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "colorProgram");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (CGColorSpace *)objc_msgSend(v9, "sourceColorSpace");
  if (!v10)
    v10 = -[PXGMetalTextureConverter destinationColorSpace](self, "destinationColorSpace");
  v88 = self;

  objc_msgSend(v8, "chromaTexture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (uint64_t *)MEMORY[0x1E0C9E120];
  v13 = MEMORY[0x1E0C9AAB0];
  v14 = 0x1E0C99000uLL;
  v15 = 0x1E0C9D000uLL;
  if (v11)
  {
    v90 = v7;
    v16 = (void *)MEMORY[0x1E0C9DDC8];
    objc_msgSend(v8, "texture");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *v12;
    v117 = v18;
    v118[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, &v117, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageWithMTLTexture:options:", v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0C9DDC8];
    objc_msgSend(v8, "chromaTexture");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v18;
    v116 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageWithMTLTexture:options:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = 0;
    switch((objc_msgSend(v8, "shaderFlags") >> 8) & 0xF)
    {
      case 1u:
        goto LABEL_6;
      case 2u:
        v25 = 1;
LABEL_6:
        v26 = 601;
        break;
      case 3u:
        goto LABEL_24;
      case 4u:
        v25 = 1;
LABEL_24:
        v26 = 709;
        break;
      case 5u:
        goto LABEL_26;
      case 6u:
        v25 = 1;
LABEL_26:
        v26 = 2020;
        break;
      case 7u:
        goto LABEL_28;
      case 8u:
        v25 = 1;
LABEL_28:
        v26 = 240;
        break;
      default:
        v26 = 0;
        break;
    }
    v14 = 0x1E0C99000uLL;
    objc_msgSend(v20, "extent");
    v57 = (int)v56;
    -[NSObject extent](v24, "extent");
    v59 = v26;
    v15 = 0x1E0C9D000uLL;
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithYImage:CrCbImage:CrCbScale:matrix:fullRange:colorSpace:", v20, v24, (v57 / (int)v58), v59, v25, v10);
    v32 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0C99E08];
    v28 = *MEMORY[0x1E0C9E120];
    v113[0] = *MEMORY[0x1E0C9E110];
    v113[1] = v28;
    v114[0] = v10;
    v114[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryWithDictionary:", v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "shaderFlags") & 3) != 0)
      objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0C9E130]);
    v30 = (void *)MEMORY[0x1E0C9DDC8];
    objc_msgSend(v8, "texture");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "imageWithMTLTexture:options:", v31, v20);
    v32 = objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      PXGTungstenGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "texture");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "pixelFormat");
        *(_DWORD *)buf = 136315138;
        Name = MTLPixelFormatGetName();
        _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEBUG, "Failed to create CIImage from Metal pixel format: %s", buf, 0xCu);

      }
      v32 = 0;
      goto LABEL_31;
    }
    v90 = v7;
    if ((objc_msgSend(v8, "shaderFlags") & 4) != 0)
    {
      v111[0] = CFSTR("inputRVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v112[0] = v33;
      v111[1] = CFSTR("inputGVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v112[1] = v34;
      v111[2] = CFSTR("inputBVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v112[2] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject imageByApplyingFilter:withInputParameters:](v32, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v36);
      v37 = objc_claimAutoreleasedReturnValue();

      v32 = v37;
    }
    if ((objc_msgSend(v8, "shaderFlags") & 8) != 0)
    {
      v109[0] = CFSTR("inputRVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v110[0] = v38;
      v109[1] = CFSTR("inputGVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v110[1] = v39;
      v109[2] = CFSTR("inputBVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v110[2] = v40;
      v109[3] = CFSTR("inputAVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v110[3] = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 4);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject imageByApplyingFilter:withInputParameters:](v32, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v42);
      v43 = objc_claimAutoreleasedReturnValue();

      v32 = v43;
    }
    if ((objc_msgSend(v8, "shaderFlags") & 1) != 0)
    {
      v107[0] = CFSTR("inputRVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = v44;
      v107[1] = CFSTR("inputGVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 1.0, 0.0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v108[1] = v45;
      v107[2] = CFSTR("inputBVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v108[2] = v46;
      v107[3] = CFSTR("inputAVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v108[3] = v47;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 4);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject imageByApplyingFilter:withInputParameters:](v32, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v48);
      v49 = objc_claimAutoreleasedReturnValue();

      v32 = v49;
    }
    v15 = 0x1E0C9D000;
    if ((objc_msgSend(v8, "shaderFlags") & 2) == 0)
    {
      v7 = v90;
      v14 = 0x1E0C99000;
      goto LABEL_32;
    }
    v105[0] = CFSTR("inputRVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
    v24 = objc_claimAutoreleasedReturnValue();
    v106[0] = v24;
    v105[1] = CFSTR("inputGVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v106[1] = v51;
    v105[2] = CFSTR("inputBVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v106[2] = v52;
    v105[3] = CFSTR("inputAVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 1.0, 0.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v106[3] = v53;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 4);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject imageByApplyingFilter:withInputParameters:](v32, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v54);
    v55 = objc_claimAutoreleasedReturnValue();

    v15 = 0x1E0C9D000;
    v32 = v55;
    v14 = 0x1E0C99000;
  }
  v7 = v90;
LABEL_31:

LABEL_32:
  if (v32)
    goto LABEL_33;
  objc_msgSend(v8, "texture");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "iosurface");

  v72 = (uint64_t *)MEMORY[0x1E0C9E110];
  if (v71)
  {
    v73 = *(void **)(v15 + 3528);
    objc_msgSend(v8, "texture");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v7;
    v76 = objc_msgSend(v74, "iosurface");
    v103 = *v72;
    v104 = v10;
    objc_msgSend(*(id *)(v14 + 3456), "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v76;
    v7 = v75;
    objc_msgSend(v73, "imageWithIOSurface:options:", v78, v77);
    v32 = objc_claimAutoreleasedReturnValue();

    if (v32)
      goto LABEL_33;
  }
  if (objc_msgSend(v8, "sourceCVPixelBuffer"))
  {
    v79 = *(void **)(v15 + 3528);
    v80 = objc_msgSend(v8, "sourceCVPixelBuffer");
    v101 = *v72;
    v102 = v10;
    objc_msgSend(*(id *)(v14 + 3456), "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v81 = v7;
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "imageWithCVPixelBuffer:options:", v80, v82);
    v32 = objc_claimAutoreleasedReturnValue();

    v7 = v81;
    if (v32)
      goto LABEL_33;
  }
  if (!objc_msgSend(v8, "sourceCGImage"))
    goto LABEL_52;
  v83 = *(void **)(v15 + 3528);
  v84 = objc_msgSend(v8, "sourceCGImage");
  v99 = *v72;
  v100 = v10;
  objc_msgSend(*(id *)(v14 + 3456), "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
  v85 = v7;
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "imageWithCGImage:options:", v84, v86);
  v32 = objc_claimAutoreleasedReturnValue();

  v7 = v85;
  if (v32)
  {
LABEL_33:
    -[NSObject extent](v32, "extent");
    objc_msgSend(v7, "applyToImage:targetSize:", v32, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v62)
    {
      PXAssertGetLog();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        Name = (uint64_t)v7;
        v93 = 2112;
        v94 = v32;
        _os_log_error_impl(&dword_1A6789000, v63, OS_LOG_TYPE_ERROR, "Unable to apply adjustment:%@ to image:%@", buf, 0x16u);
      }

    }
    objc_msgSend(v62, "extent");
    if (PXSizeIsEmpty())
    {
      PXAssertGetLog();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        Name = (uint64_t)v7;
        v93 = 2112;
        v94 = v32;
        v95 = 2112;
        v96 = v62;
        _os_log_error_impl(&dword_1A6789000, v64, OS_LOG_TYPE_ERROR, "Empty size from adjustment:%@ to image:%@ adjustedImage:%@", buf, 0x20u);
      }

    }
    if (v62 && (objc_msgSend(v62, "extent"), !PXSizeIsEmpty()))
    {
      -[PXGMetalTextureConverter _createTextureFromCIImage:source:options:](v88, "_createTextureFromCIImage:source:options:", v62, v8, a5);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PXGTungstenGetLog();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v62, "extent");
        v119.width = v66;
        v119.height = v67;
        NSStringFromCGSize(v119);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        Name = (uint64_t)v7;
        v93 = 2114;
        v94 = v32;
        v95 = 2114;
        v96 = v62;
        v97 = 2114;
        v98 = v68;
        _os_log_impl(&dword_1A6789000, v65, OS_LOG_TYPE_ERROR, "Error applying adjustment:%{public}@ to inputImage:%{public}@ adjustedImage:%{public}@ size:%{public}@", buf, 0x2Au);

      }
      v69 = 0;
    }

  }
  else
  {
LABEL_52:
    PXAssertGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      Name = (uint64_t)v8;
      _os_log_error_impl(&dword_1A6789000, v32, OS_LOG_TYPE_ERROR, "Unable to create CIImage from texture %@", buf, 0xCu);
    }
    v69 = 0;
  }

  return v69;
}

- (id)_createTextureFromCIImage:(id)a3 source:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  float v20;
  float v21;
  PXGMetalImageTexture *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  PXGMetalImageTexture *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  double v35;
  $8814E4F230000EB768D7E307C62B5F7C v36;
  id v37;
  id v38;
  unsigned int v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v39 = 0;
  -[PXGMetalTextureConverter renderTextureCache](self, "renderTextureCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extent");
  objc_msgSend(v10, "textureWithSize:pixelFormat:", PXGMetalPixelFormatForCIImage(), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[PXGMetalTextureConverter metalRenderContext](self, "metalRenderContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PXGCreateMetalTextureToRenderCIImage();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v27 = 0;
      goto LABEL_17;
    }
  }
  v36 = a5;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithMTLTexture:commandBuffer:", v13, 0);
  objc_msgSend(v15, "setFlipped:", 1);
  objc_msgSend(v15, "setColorSpace:", -[PXGMetalTextureConverter destinationColorSpace](self, "destinationColorSpace"));
  -[PXGMetalTextureConverter renderContext](self, "renderContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v16, "startTaskToRender:toDestination:error:", v8, v15, &v38);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v38;

  if (v17)
  {
    objc_msgSend(v9, "orientationTransform");
    v35 = v19;
    objc_msgSend(v9, "alpha");
    v21 = v20;
    v22 = [PXGMetalImageTexture alloc];
    LODWORD(v23) = 1.0;
    v24 = v39;
    v25 = -[PXGMetalTextureConverter presentationType](self, "presentationType", v23);
    *(float *)&v26 = v21;
    v27 = -[PXGMetalImageTexture initWithTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:](v22, "initWithTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:", v13, 0, v21 >= 1.0, v24, v25, v35, v26);
    -[PXGMetalTextureConverter renderTextureCache](self, "renderTextureCache");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGMetalImageTexture setTextureCache:](v27, "setTextureCache:", v28);

    v37 = v18;
    objc_msgSend(v17, "waitUntilCompletedAndReturnError:", &v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v37;

    if (!v29)
    {
      PXAssertGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v8;
        v42 = 2112;
        v43 = v30;
        _os_log_error_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "Unable to render texture for CIImage %@, error: %@", buf, 0x16u);
      }

    }
    if (v27)
      goto LABEL_14;
  }
  else
  {
    v30 = v18;
  }
  PXAssertGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v41 = v8;
    v42 = 2112;
    v43 = v30;
    _os_log_error_impl(&dword_1A6789000, v32, OS_LOG_TYPE_ERROR, "Unable to create texture for CIImage %@, error: %@", buf, 0x16u);
  }

  v27 = 0;
LABEL_14:

  if (v27)
  {
    -[PXGMetalTextureConverter delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "metalTextureConverter:didCreateTexture:options:", self, v27, v36);

  }
LABEL_17:

  return v27;
}

- (id)createPayloadTextureFromPayload:(id)a3
{
  id v4;
  PXGMetalCaptureSpriteTexture *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[PXGMetalCaptureSpriteTexture initWithPayload:presentationType:]([PXGMetalCaptureSpriteTexture alloc], "initWithPayload:presentationType:", v4, -[PXGMetalTextureConverter presentationType](self, "presentationType"));
  else
    v5 = 0;

  return v5;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (unint64_t)destinationColorSpaceName
{
  return self->_destinationColorSpaceName;
}

- (BOOL)hasExtendedColorTarget
{
  return self->_hasExtendedColorTarget;
}

- (PXGColorProgramLibrary)colorProgramLibrary
{
  return self->_colorProgramLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorProgramLibrary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_renderTextureCache, 0);
  objc_storeStrong((id *)&self->_transparentTexture, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_failedPixelFormats, 0);
}

@end

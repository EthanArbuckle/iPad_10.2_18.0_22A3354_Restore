@implementation PXGMetalViewRenderDestination

- (unint64_t)colorPixelFormat
{
  void *v2;
  unint64_t v3;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "colorPixelFormat");

  return v3;
}

- (MTKView)metalView
{
  return self->_metalView;
}

- (unint64_t)depthStencilPixelFormat
{
  void *v2;
  unint64_t v3;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "depthStencilPixelFormat");

  return v3;
}

- (int64_t)sampleCount
{
  void *v2;
  int64_t v3;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sampleCount");

  return v3;
}

- (CGSize)renderSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawableSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)present
{
  _BOOL4 v3;
  BOOL v4;
  _BOOL8 v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXGMetalViewRenderDestination disableDisplayCompositing](self, "disableDisplayCompositing");
  v4 = v3;
  v5 = !v3;
  if (-[PXGMetalViewRenderDestination lowMemoryMode](self, "lowMemoryMode") && !v4)
  {
    v6 = (double)(uint64_t)(mach_absolute_time() - self->_lastSizeChangeTime);
    PXTimebaseConversionFactor();
    v5 = v7 * v6 > 1.0;
  }
  objc_msgSend(v10, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != objc_msgSend(v8, "allowsDisplayCompositing"))
    objc_msgSend(v8, "setAllowsDisplayCompositing:", v5);
  objc_msgSend(v10, "currentDrawable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "present");

}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (BOOL)disableDisplayCompositing
{
  return self->_disableDisplayCompositing;
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  void *v2;
  void *v3;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRenderPassDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTLRenderPassDescriptor *)v3;
}

- (void)setNeedsRender
{
  id v2;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsDisplay");

}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  double height;
  double width;
  id v7;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "drawableSize");
  if ((PXSizeIsEmpty() & 1) == 0)
    self->_lastSizeChangeTime = mach_absolute_time();
  -[PXGMetalViewRenderDestination delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renderDestination:renderSizeWillChange:", self, width, height);

}

- (void)drawInMTKView:(id)a3
{
  id v4;

  kdebug_trace();
  -[PXGMetalViewRenderDestination delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderDestinationRequestRender:", self);

}

- (PXGMetalRenderDestinationDelegate)delegate
{
  return (PXGMetalRenderDestinationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGRect)renderBoundsInPoints
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)scale
{
  double v3;
  double v4;
  float v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  -[MTKView px_screenScale](self->_metalView, "px_screenScale");
  if (v3 == 0.0)
  {
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __38__PXGMetalViewRenderDestination_scale__block_invoke;
    v10 = &unk_1E5148D30;
    objc_copyWeak(&v11, &location);
    if (scale_onceToken != -1)
      dispatch_once(&scale_onceToken, &v7);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    v4 = 1.0;
  }
  else
  {
    v4 = v3;
  }
  -[PXGMetalViewRenderDestination displayScaleMultiplier](self, "displayScaleMultiplier", v7, v8, v9, v10);
  return v4 * v5;
}

- (BOOL)canSetColorSpace
{
  return 0;
}

- (unint64_t)destinationColorSpaceName
{
  unint64_t result;
  double v4;
  unint64_t v5;
  char v6;
  unint64_t v7;

  -[PXGMetalViewRenderDestination displayConfiguration](self, "displayConfiguration");
  result = v7;
  if (!v7)
  {
    -[PXGMetalViewRenderDestination displayConfiguration](self, "displayConfiguration");
    if (v6
      && (-[PXGMetalViewRenderDestination maximumDynamicRangeHeadroom](self, "maximumDynamicRangeHeadroom"), v4 > 1.0))
    {
      v5 = 14;
    }
    else
    {
      v5 = 11;
    }
    if (PXGDeviceIsKnownToHaveExtendedColorDisplay())
      return v5;
    else
      return 12;
  }
  return result;
}

- (PXGMetalViewRenderDestination)init
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)off_1E50B8410;
  v4 = *((_QWORD *)off_1E50B8410 + 2);
  return -[PXGMetalViewRenderDestination initWithDisplayConfiguration:](self, "initWithDisplayConfiguration:", &v3);
}

- (void)_setupMetalIfNeeded
{
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "simulateMissingMetalDevice");

  if ((v4 & 1) != 0 || (v5 = MTLCreateSystemDefaultDevice()) == 0)
  {
    PXGTungstenGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Metal Device is nil, this is unexpected and will result in a degraded experience.", buf, 2u);
    }

    v5 = 0;
  }
  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Metal View is nil, this is unexpected and may result in configuration errors.", v13, 2u);
    }

  }
  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v5)
  {
    -[PXGMetalViewRenderDestination metalView](self, "metalView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDevice:", v5);

    -[PXGMetalViewRenderDestination delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "renderDestinationDeviceDidChange:", self);

  }
}

- (void)setLayoutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_layoutQueue, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTLDevice)device
{
  void *v2;
  void *v3;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTLDevice *)v3;
}

- (PXGMetalViewRenderDestination)initWithDisplayConfiguration:(id *)a3
{
  char *v5;
  char *v6;
  __int128 v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PXGMetalViewRenderDestination;
  v5 = -[PXGMetalViewRenderDestination init](&v24, sel_init);
  v6 = v5;
  if (!v5)
    return (PXGMetalViewRenderDestination *)v6;
  v7 = *(_OWORD *)&a3->var0;
  *((_QWORD *)v5 + 9) = a3->var2;
  *(_OWORD *)(v5 + 56) = v7;
  objc_storeStrong((id *)v5 + 4, MEMORY[0x1E0C80D38]);
  *((_DWORD *)v6 + 5) = 1065353216;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CC6C50]);
  v10 = (void *)objc_msgSend(v9, "initWithFrame:device:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v10, "setDelegate:", v6);
  objc_msgSend(v10, "setPresentsWithTransaction:", 1);
  objc_msgSend(v10, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PXGMetalViewRenderDestination.m"), 59, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("metalView.layer"), v21, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PXGMetalViewRenderDestination.m"), 59, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("metalView.layer"), v21);
  }

LABEL_4:
  objc_msgSend(v11, "setAllowsNextDrawableTimeout:", 0);
  objc_msgSend(v11, "setFenceEnabled:", 1);
  objc_msgSend(v11, "setLowLatency:", objc_msgSend(v8, "lowLatency"));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v12);

  objc_msgSend(v10, "setEnableSetNeedsDisplay:", 1);
  objc_msgSend(v10, "setPaused:", 1);
  objc_storeStrong((id *)v6 + 5, v10);
  objc_msgSend(v6, "_setupMetalIfNeeded");
  objc_msgSend(v10, "setDepthStencilPixelFormat:", 260);
  objc_msgSend(v11, "setWantsExtendedDynamicRangeContent:", a3->var0);
  if (a3->var0 || a3->var1)
    objc_msgSend(v11, "setColorspace:", MEMORY[0x1A85CCEEC](objc_msgSend(v6, "destinationColorSpaceName")));
  objc_msgSend(v10, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportsTextureSampleCount:", objc_msgSend(v8, "sampleCount"));

  if (v14)
  {
    objc_msgSend(v10, "setSampleCount:", objc_msgSend(v8, "sampleCount"));
  }
  else
  {
    objc_msgSend(v10, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      PXGTungstenGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_msgSend(v8, "sampleCount");
        *(_DWORD *)buf = 134217984;
        v26 = v17;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Unsupported sample count:%ld", buf, 0xCu);
      }

    }
  }

  return (PXGMetalViewRenderDestination *)v6;
}

- (CGColorSpace)colorspace
{
  return 0;
}

- (double)maximumDynamicRangeHeadroom
{
  void *v2;
  double v3;
  double v4;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumDynamicRangeHeadroom");
  v4 = v3;

  return v4;
}

- (double)currentDynamicRangeHeadroom
{
  void *v2;
  double v3;
  double v4;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDynamicRangeHeadroom");
  v4 = v3;

  return v4;
}

- (MTLTexture)renderTexture
{
  void *v2;
  void *v3;
  void *v4;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDrawable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "texture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTLTexture *)v4;
}

- (MTLTexture)depthStencilTexture
{
  void *v2;
  void *v3;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "depthStencilTexture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTLTexture *)v3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearColor");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (void)renderImmediately
{
  id v2;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "draw");

}

- (void)releaseCachedResources
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;

  -[PXGMetalViewRenderDestination metalView](self, "metalView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "releaseDrawables");
  objc_msgSend(v10, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalViewRenderDestination.m"), 285, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("metalView.layer"), v7);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalViewRenderDestination.m"), 285, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("metalView.layer"), v7, v9);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v4, "discardContents");
  objc_msgSend(v4, "removeBackBuffers");

}

- (void)test_configureForRenderSnapshot
{
  MTKView *v2;

  v2 = self->_metalView;
  -[MTKView setFramebufferOnly:](v2, "setFramebufferOnly:", 0);
  -[MTKView setColorPixelFormat:](v2, "setColorPixelFormat:", 115);
  -[MTKView setClearColor:](v2, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (id)test_renderSnapshotHandler
{
  return self->_test_renderSnapshotHandler;
}

- (void)setTest_renderSnapshotHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setDisableDisplayCompositing:(BOOL)a3
{
  self->_disableDisplayCompositing = a3;
}

- ($F86F3654D89882C10874F1715C6C992F)displayConfiguration
{
  *($C51E2077B87F80227BBF36E385921798 *)retstr = *($C51E2077B87F80227BBF36E385921798 *)((char *)self + 56);
  return self;
}

- (float)displayScaleMultiplier
{
  return self->_displayScaleMultiplier;
}

- (void)setDisplayScaleMultiplier:(float)a3
{
  self->_displayScaleMultiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_test_renderSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_metalView, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __38__PXGMetalViewRenderDestination_scale__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PXGTungstenGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "%@ unknown screenScale, falling back to 1.", (uint8_t *)&v4, 0xCu);

  }
}

@end

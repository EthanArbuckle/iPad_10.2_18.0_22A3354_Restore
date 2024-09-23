@implementation PBUICALocalRenderer

- (PBUICALocalRenderer)init
{
  return -[PBUICALocalRenderer initWithColorSpace:](self, "initWithColorSpace:", 0);
}

- (PBUICALocalRenderer)initWithColorSpace:(CGColorSpace *)a3
{
  id v5;
  PBUICALocalRenderer *v6;

  v5 = MTLCreateSystemDefaultDevice();
  if (v5)
  {
    self = -[PBUICALocalRenderer initWithDevice:colorSpace:](self, "initWithDevice:colorSpace:", v5, a3);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PBUICALocalRenderer)initWithDevice:(id)a3 colorSpace:(CGColorSpace *)a4
{
  id v6;
  void *v7;
  PBUICALocalRenderer *v8;

  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "newCommandQueue");
  if (v7)
  {
    self = -[PBUICALocalRenderer initWithDevice:commmandQueue:colorSpace:](self, "initWithDevice:commmandQueue:colorSpace:", v6, v7, a4);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PBUICALocalRenderer)initWithDevice:(id)a3 commmandQueue:(id)a4 colorSpace:(CGColorSpace *)a5
{
  id v9;
  id v10;
  PBUICALocalRenderer *v11;
  PBUICALocalRenderer *v12;
  uint64_t v13;
  OS_os_log *logger;
  PBUIViewportLayer *v15;
  PBUIViewportLayer *viewportLayer;
  NSString *identifier;
  MTLCommandQueue *commandQueue;
  void *v19;
  CGColorSpaceRef v20;
  int v21;
  CFStringRef *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PBUICALocalRenderer;
  v11 = -[PBUICALocalRenderer init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a3);
    objc_storeStrong((id *)&v12->_commandQueue, a4);
    PBUIRenderingLogLocalRenderer();
    v13 = objc_claimAutoreleasedReturnValue();
    logger = v12->_logger;
    v12->_logger = (OS_os_log *)v13;

    v15 = -[PBUIViewportLayer initWithScale:]([PBUIViewportLayer alloc], "initWithScale:", 1.0);
    viewportLayer = v12->_viewportLayer;
    v12->_viewportLayer = v15;

    v12->_encodingLock._os_unfair_lock_opaque = 0;
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)CFSTR("PBUICALocalRenderer");

    commandQueue = v12->_commandQueue;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.command-queue"), v12->_identifier);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLCommandQueue setLabel:](commandQueue, "setLabel:", v19);

    if (a5)
    {
      v20 = CGColorSpaceRetain(a5);
    }
    else
    {
      v21 = MGGetBoolAnswer();
      v22 = (CFStringRef *)MEMORY[0x1E0C9D960];
      if (!v21)
        v22 = (CFStringRef *)MEMORY[0x1E0C9DA10];
      v20 = CGColorSpaceCreateWithName(*v22);
    }
    v12->_colorSpace = v20;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_colorSpace);
  self->_colorSpace = 0;
  v3.receiver = self;
  v3.super_class = (Class)PBUICALocalRenderer;
  -[PBUICALocalRenderer dealloc](&v3, sel_dealloc);
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setLogger:(id)a3
{
  id v4;
  OS_os_log *v5;
  OS_os_log *logger;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (OS_os_log *)v4;
  }
  else
  {
    PBUIRenderingLogLocalRenderer();
    v5 = (OS_os_log *)objc_claimAutoreleasedReturnValue();
  }
  logger = self->_logger;
  self->_logger = v5;

}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;
  MTLCommandQueue *commandQueue;
  id v7;

  if (a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    identifier = self->_identifier;
    self->_identifier = v4;
  }
  else
  {
    identifier = self->_identifier;
    self->_identifier = (NSString *)CFSTR("PBUICALocalRenderer");
  }

  commandQueue = self->_commandQueue;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.command-queue"), self->_identifier);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue setLabel:](commandQueue, "setLabel:", v7);

}

- (id)renderState:(PBUIRenderState *)a3 error:(id *)a4
{
  CALayer *layer;
  CALayer *v7;
  CIImage *v8;
  id v9;
  void *v10;
  CIImage *v11;
  id v12;
  CALayer *v13;
  void *v14;
  _QWORD v16[5];
  CGSize v17;
  double v18;
  CALayer *v19;
  CIImage *v20;
  uint64_t v21;
  CGSize outputPixelSize;
  double scale;
  CALayer *v24;
  CIImage *v25;

  outputPixelSize = a3->outputPixelSize;
  layer = a3->layer;
  scale = a3->scale;
  v7 = layer;
  v24 = v7;
  v8 = a3->image;
  v25 = v8;
  if (!self)
  {
    v11 = v8;

    goto LABEL_5;
  }
  if (!-[PBUICALocalRenderer usesCoreImageForState:](self, "usesCoreImageForState:", &outputPixelSize))
  {
LABEL_5:
    v12 = -[PBUICALocalRenderer newTextureWithSize:colorSpace:](self, "newTextureWithSize:colorSpace:", self->_colorSpace, a3->outputPixelSize.width, a3->outputPixelSize.height);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[2] = __41__PBUICALocalRenderer_renderState_error___block_invoke;
    v16[3] = &unk_1E6B93F90;
    v13 = a3->layer;
    v18 = a3->scale;
    v16[1] = 3254779904;
    v16[4] = self;
    v17 = a3->outputPixelSize;
    v19 = v13;
    v20 = a3->image;
    -[PBUICALocalRenderer renderFrameToTexture:configureWithTransaction:completionHandler:](self, "renderFrameToTexture:configureWithTransaction:completionHandler:", v12, v16, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "waitUntilCompleted");
    -[PBUICALocalRenderer resetState](self, "resetState");
    v9 = (id)objc_msgSend(v12, "iosurface");
    objc_msgSend(v12, "setPurgeableState:", 4);

    goto LABEL_6;
  }
  v21 = 0;
  v9 = -[PBUICALocalRenderer newSurfaceWithSize:colorSpace:outOptions:](self, "newSurfaceWithSize:colorSpace:outOptions:", self->_colorSpace, &v21, a3->outputPixelSize.width, a3->outputPixelSize.height);
  -[PBUICALocalRenderer renderCIImage:toSurface:completionHandler:](self, "renderCIImage:toSurface:completionHandler:", a3->image, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "waitUntilCompleted");

LABEL_6:
  return v9;
}

void __41__PBUICALocalRenderer_renderState_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 40);
  v3 = *(void **)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 56);
  v4 = v3;
  v9 = v4;
  v5 = *(id *)(a1 + 72);
  v10 = v5;
  if (v2)
  {
    objc_msgSend(v2, "setRenderState:", &v7);
  }
  else
  {
    v6 = v5;

  }
}

- (void)renderState:(PBUIRenderState *)a3 completionHandler:(id)a4
{
  id v6;
  CALayer *layer;
  CALayer *v8;
  CIImage *v9;
  id v10;
  CIImage *image;
  id v12;
  id v13;
  CIImage *v14;
  CIImage *v15;
  id v16;
  uint64_t v17;
  CALayer *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  PBUICALocalRenderer *v22;
  id v23;
  _QWORD v24[5];
  CGSize v25;
  double v26;
  CALayer *v27;
  CIImage *v28;
  _QWORD v29[4];
  id v30;
  CIImage *v31;
  uint64_t v32;
  CGSize outputPixelSize;
  double scale;
  CALayer *v35;
  CIImage *v36;

  v6 = a4;
  outputPixelSize = a3->outputPixelSize;
  layer = a3->layer;
  scale = a3->scale;
  v8 = layer;
  v35 = v8;
  v9 = a3->image;
  v36 = v9;
  if (!self)
  {
    v15 = v9;

    goto LABEL_5;
  }
  if (!-[PBUICALocalRenderer usesCoreImageForState:](self, "usesCoreImageForState:", &outputPixelSize))
  {
LABEL_5:
    v16 = -[PBUICALocalRenderer newTextureWithSize:colorSpace:](self, "newTextureWithSize:colorSpace:", self->_colorSpace, a3->outputPixelSize.width, a3->outputPixelSize.height);
    v17 = MEMORY[0x1E0C809B0];
    v24[2] = __53__PBUICALocalRenderer_renderState_completionHandler___block_invoke_2;
    v24[3] = &unk_1E6B93F90;
    v18 = a3->layer;
    v26 = a3->scale;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3254779904;
    v24[4] = self;
    v25 = a3->outputPixelSize;
    v27 = v18;
    v28 = a3->image;
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __53__PBUICALocalRenderer_renderState_completionHandler___block_invoke_3;
    v20[3] = &unk_1E6B96440;
    v12 = v16;
    v21 = v12;
    v22 = self;
    v23 = v6;
    v19 = -[PBUICALocalRenderer renderFrameToTexture:configureWithTransaction:completionHandler:](self, "renderFrameToTexture:configureWithTransaction:completionHandler:", v12, v24, v20);

    v14 = v28;
    goto LABEL_6;
  }
  v32 = 0;
  v10 = -[PBUICALocalRenderer newSurfaceWithSize:colorSpace:outOptions:](self, "newSurfaceWithSize:colorSpace:outOptions:", self->_colorSpace, &v32, a3->outputPixelSize.width, a3->outputPixelSize.height);
  image = a3->image;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __53__PBUICALocalRenderer_renderState_completionHandler___block_invoke;
  v29[3] = &unk_1E6B94968;
  v31 = (CIImage *)v6;
  v12 = v10;
  v30 = v12;
  v13 = -[PBUICALocalRenderer renderCIImage:toSurface:completionHandler:](self, "renderCIImage:toSurface:completionHandler:", image, v12, v29);

  v14 = v31;
LABEL_6:

}

uint64_t __53__PBUICALocalRenderer_renderState_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __53__PBUICALocalRenderer_renderState_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 40);
  v3 = *(void **)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 56);
  v4 = v3;
  v9 = v4;
  v5 = *(id *)(a1 + 72);
  v10 = v5;
  if (v2)
  {
    objc_msgSend(v2, "setRenderState:", &v7);
  }
  else
  {
    v6 = v5;

  }
}

void __53__PBUICALocalRenderer_renderState_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "iosurface");
  objc_msgSend(*(id *)(a1 + 32), "setPurgeableState:", 4);
  objc_msgSend(*(id *)(a1 + 40), "resetState");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)renderRequest:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  __int128 v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  id v21;
  id v22;

  v6 = a3;
  v19 = *MEMORY[0x1E0C9D820];
  v21 = 0;
  v22 = 0;
  v20 = 0x3FF0000000000000;
  v18 = 0;
  v7 = objc_msgSend(v6, "configureState:error:", &v19, &v18);
  v8 = v18;
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    v14 = v19;
    v15 = v20;
    v10 = v21;
    v16 = v10;
    v11 = v22;
    v17 = v11;
    if (self)
    {
      -[PBUICALocalRenderer renderState:error:](self, "renderState:error:", &v14, a4);
      self = (PBUICALocalRenderer *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v11;

    }
  }
  else
  {
    self = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return self;
}

- (void)renderRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  char v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  uint64_t v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v18 = *MEMORY[0x1E0C9D820];
  v20 = 0;
  v21 = 0;
  v19 = 0x3FF0000000000000;
  v17 = 0;
  v8 = objc_msgSend(v6, "configureState:error:", &v18, &v17);
  v9 = v17;
  if ((v8 & 1) != 0)
  {
    v13 = v18;
    v14 = v19;
    v10 = v20;
    v15 = v10;
    v11 = v21;
    v16 = v11;
    if (self)
    {
      -[PBUICALocalRenderer renderState:completionHandler:](self, "renderState:completionHandler:", &v13, v7);
    }
    else
    {
      v12 = v11;

    }
  }
  else
  {
    v7[2](v7, 0, v9);
  }

}

- (BOOL)archiveRenderingOfRequest:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  __int128 v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v33[3];
  _QWORD v34[3];
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v29 = *MEMORY[0x1E0C9D820];
    v31 = 0;
    v32 = 0;
    v30 = 0x3FF0000000000000;
    v28 = 0;
    v11 = objc_msgSend(v8, "configureState:error:", &v29, &v28);
    v12 = v28;
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[2] = __61__PBUICALocalRenderer_archiveRenderingOfRequest_toURL_error___block_invoke;
      v23[3] = &unk_1E6B93F90;
      v25 = v30;
      v23[1] = 3254779904;
      v23[4] = self;
      v24 = v29;
      v26 = v31;
      v27 = v32;
      -[PBUICALocalRenderer configureWithTransaction:](self, "configureWithTransaction:", v23);
      v35 = *MEMORY[0x1E0CD29C0];
      objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = CAMLEncodeLayerTreeToPathWithOptions();
      -[PBUICALocalRenderer resetState](self, "resetState");
      if (a5)
        v17 = v16;
      else
        v17 = 1;
      if ((v17 & 1) == 0)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v19 = *MEMORY[0x1E0CB2D80];
        v33[0] = *MEMORY[0x1E0CB2D60];
        v33[1] = v19;
        v34[0] = CFSTR("CoreAnimation failed to write .ca file to URL.");
        v34[1] = CFSTR("Check CoreAnimation logs.");
        v33[2] = *MEMORY[0x1E0CB3308];
        v34[2] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, v20);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v16 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v12);
    }

    goto LABEL_15;
  }
  if (a5)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB3308];
    v38[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, v13);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  v16 = 0;
LABEL_16:

  return v16;
}

void __61__PBUICALocalRenderer_archiveRenderingOfRequest_toURL_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 40);
  v3 = *(void **)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 56);
  v4 = v3;
  v9 = v4;
  v5 = *(id *)(a1 + 72);
  v10 = v5;
  if (v2)
  {
    objc_msgSend(v2, "setRenderState:", &v7);
  }
  else
  {
    v6 = v5;

  }
}

- (void)updateStateWithTransaction:(PBUIRenderState *)a3
{
  CALayer *layer;
  CALayer *v6;
  CIImage *v7;
  CIImage *v8;
  CGSize outputPixelSize;
  double scale;
  CALayer *v11;
  CIImage *v12;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  outputPixelSize = a3->outputPixelSize;
  layer = a3->layer;
  scale = a3->scale;
  v6 = layer;
  v11 = v6;
  v7 = a3->image;
  v12 = v7;
  if (self)
  {
    -[PBUICALocalRenderer setRenderState:](self, "setRenderState:", &outputPixelSize);
  }
  else
  {
    v8 = v7;

  }
  -[PBUIViewportLayer setNeedsLayout](self->_viewportLayer, "setNeedsLayout", outputPixelSize, *(_QWORD *)&scale, v11, v12);
  -[PBUIViewportLayer layoutIfNeeded](self->_viewportLayer, "layoutIfNeeded");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");

}

- (void)setRenderState:(PBUIRenderState *)a3
{
  CALayer *v5;
  CALayer *v6;
  void *v7;
  PBUIViewportLayer *viewportLayer;

  v5 = a3->layer;
  v6 = self->_currentRenderState.layer;
  if (v6)
  {
    -[PBUIViewportLayer contentLayer](self->_viewportLayer, "contentLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "replaceSublayer:with:", v6, v5);
LABEL_5:

    goto LABEL_6;
  }
  if (v5)
  {
    -[PBUIViewportLayer contentLayer](self->_viewportLayer, "contentLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v5);
    goto LABEL_5;
  }
LABEL_6:
  -[CALayer setNeedsLayout](v5, "setNeedsLayout");
  viewportLayer = self->_viewportLayer;
  BSRectWithSize();
  -[PBUIViewportLayer setFrame:](viewportLayer, "setFrame:");
  -[PBUIViewportLayer setScale:](self->_viewportLayer, "setScale:", a3->scale);
  -[PBUIViewportLayer setNeedsLayout](self->_viewportLayer, "setNeedsLayout");
  -[CALayer setNeedsLayout](v5, "setNeedsLayout");
  __copy_assignment_8_8_t0w24_s24_s32((uint64_t)&self->_currentRenderState, (__int128 *)a3);

}

- (void)resetState
{
  CALayer *layer;
  CALayer *v4;
  CALayer *v5;

  v5 = self->_currentRenderState.layer;
  layer = self->_currentRenderState.layer;
  self->_currentRenderState.layer = 0;

  v4 = v5;
  if (v5)
  {
    -[CALayer removeFromSuperlayer](v5, "removeFromSuperlayer");
    v4 = v5;
  }

}

- (id)CIContext
{
  CIContext *ciContext;
  void *v4;
  MTLCommandQueue *commandQueue;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CIContext *v12;
  CIContext *v13;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  ciContext = self->_ciContext;
  if (!ciContext)
  {
    v4 = (void *)MEMORY[0x1E0C9DD90];
    commandQueue = self->_commandQueue;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.CoreImage-Context"), self->_identifier, *MEMORY[0x1E0C9DF88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0C9DFB0];
    v16[0] = v6;
    v16[1] = MEMORY[0x1E0C9AAB0];
    v8 = *MEMORY[0x1E0C9DF60];
    v15[1] = v7;
    v15[2] = v8;
    v9 = *MEMORY[0x1E0C9DF58];
    v16[2] = MEMORY[0x1E0C9AAB0];
    v16[3] = MEMORY[0x1E0C9AAA0];
    v10 = *MEMORY[0x1E0C9DF78];
    v15[3] = v9;
    v15[4] = v10;
    v16[4] = &unk_1E6BC3508;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextWithMTLCommandQueue:options:", commandQueue, v11);
    v12 = (CIContext *)objc_claimAutoreleasedReturnValue();
    v13 = self->_ciContext;
    self->_ciContext = v12;

    ciContext = self->_ciContext;
  }
  return ciContext;
}

- (id)renderCIImage:(id)a3 toSurface:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PBUICALocalRenderer CIContext](self, "CIContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithIOSurface:", v9);

  objc_msgSend(v11, "startTaskToRender:toDestination:error:", v10, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBUICALocalRenderer nextFrameHandlerWithCompletion:](self, "nextFrameHandlerWithCompletion:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)configureWithTransaction:(id)a3
{
  void *v3;
  void (**v4)(_QWORD);

  v3 = (void *)MEMORY[0x1E0CD28B0];
  v4 = (void (**)(_QWORD))a3;
  objc_msgSend(v3, "begin");
  v4[2](v4);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
}

- (id)renderFrameToTexture:(id)a3 configureWithTransaction:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  -[PBUICALocalRenderer rendererForDestination:](self, "rendererForDestination:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUICALocalRenderer configureWithTransaction:](self, "configureWithTransaction:", v9);

  -[PBUIViewportLayer bounds](self->_viewportLayer, "bounds");
  objc_msgSend(v10, "setBounds:");
  objc_msgSend(v10, "nextFrameTime");
  objc_msgSend(v10, "beginFrameAtTime:timeStamp:", 0);
  objc_msgSend(v10, "render");
  objc_msgSend(v10, "endFrame");
  -[PBUICALocalRenderer nextFrameHandlerWithCompletion:](self, "nextFrameHandlerWithCompletion:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)nextFrameHandlerWithCompletion:(id)a3
{
  id v4;
  void *v5;

  v4 = -[PBUICALocalRenderer newCommandBufferWithCompletion:](self, "newCommandBufferWithCompletion:", a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.next-frame-waiter"), self->_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v5);

  objc_msgSend(v4, "enqueue");
  objc_msgSend(v4, "commit");
  return v4;
}

- (id)newCommandBufferWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__PBUICALocalRenderer_newCommandBufferWithCompletion___block_invoke;
    v7[3] = &unk_1E6B96468;
    v8 = v4;
    objc_msgSend(v5, "addCompletedHandler:", v7);

  }
  return v5;
}

uint64_t __54__PBUICALocalRenderer_newCommandBufferWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)rendererForDestination:(id)a3
{
  id v4;
  CARenderer *renderer;
  uint64_t v6;
  CGColorSpace *colorSpace;
  void *v8;
  CARenderer *v9;
  CARenderer *v10;
  CARenderer *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  renderer = self->_renderer;
  if (!renderer)
  {
    v6 = *MEMORY[0x1E0CD3088];
    v13[0] = CFSTR("kCARendererFlags");
    v13[1] = v6;
    colorSpace = self->_colorSpace;
    v14[0] = &unk_1E6BC3520;
    v14[1] = colorSpace;
    v13[2] = *MEMORY[0x1E0CD3090];
    v14[2] = self->_commandQueue;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2820], "rendererWithMTLTexture:options:", v4, v8);
    v9 = (CARenderer *)objc_claimAutoreleasedReturnValue();
    v10 = self->_renderer;
    self->_renderer = v9;

    renderer = self->_renderer;
  }
  -[CARenderer setLayer:](renderer, "setLayer:", self->_viewportLayer);
  -[CARenderer setDestination:](self->_renderer, "setDestination:", v4);
  v11 = self->_renderer;

  return v11;
}

- (id)newSurfaceWithSize:(CGSize)a3 colorSpace:(CGColorSpace *)a4 outOptions:(unint64_t *)a5
{
  double height;
  double width;
  CFStringRef Name;
  uint64_t v10;
  __IOSurface *v11;
  CFPropertyListRef v12;
  const void *v13;
  unint64_t v15;

  height = a3.height;
  width = a3.width;
  if (CGColorSpaceIsWideGamutRGB(a4))
  {
    Name = CGColorSpaceGetName(a4);
    v10 = 5;
    if (Name == (CFStringRef)*MEMORY[0x1E0C9D960])
      v10 = 1;
  }
  else
  {
    v10 = 1;
  }
  v15 = v10;
  v11 = (__IOSurface *)objc_msgSend(MEMORY[0x1E0CBBEA0], "bs_IOSurfaceWithWidth:height:options:", (unint64_t)width, (unint64_t)height, &v15);
  v12 = CGColorSpaceCopyPropertyList(a4);
  if (v12)
  {
    v13 = v12;
    IOSurfaceSetValue(v11, (CFStringRef)*MEMORY[0x1E0CBBF90], v12);
    CFRelease(v13);
  }
  if (a5)
    *a5 = v15;
  return v11;
}

- (id)newTextureWithSize:(CGSize)a3 colorSpace:(CGColorSpace *)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v10 = 0;
  v5 = -[PBUICALocalRenderer newSurfaceWithSize:colorSpace:outOptions:](self, "newSurfaceWithSize:colorSpace:outOptions:", a4, &v10, a3.width, a3.height);
  v6 = -[PBUICALocalRenderer pixelFormatForBSIOSurfaceOptions:](self, "pixelFormatForBSIOSurfaceOptions:", v10);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v6, objc_msgSend(v5, "width"), objc_msgSend(v5, "height"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowGPUOptimizedContents:", 0);
  objc_msgSend(v7, "setUsage:", 4);
  v8 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v7, v5, 0);

  return v8;
}

- (unint64_t)pixelFormatForBSIOSurfaceOptions:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = 80;
  v4 = 554;
  if ((a3 & 1) == 0)
    v4 = 550;
  if ((a3 & 2) != 0)
    v3 = v4;
  if ((a3 & 4) != 0)
    return 115;
  else
    return v3;
}

- (BOOL)usesCoreImageForState:(PBUIRenderState *)a3
{
  BOOL v4;

  v4 = a3->image != 0;

  return v4;
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_ciContext, 0);
  objc_storeStrong((id *)&self->_viewportLayer, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end

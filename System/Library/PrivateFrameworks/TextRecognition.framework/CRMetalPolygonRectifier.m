@implementation CRMetalPolygonRectifier

- (CRMetalPolygonRectifier)initWithDevice:(id)a3 sourceImage:(id)a4
{
  id v6;
  id v7;
  CRMetalPolygonRectifier *v8;

  v6 = a3;
  v7 = a4;
  v8 = -[CRMetalPolygonRectifier initWithDevice:sourceImage:regionOfInterest:](self, "initWithDevice:sourceImage:regionOfInterest:", v6, v7, 0.0, 0.0, (double)(unint64_t)objc_msgSend(v7, "width"), (double)(unint64_t)objc_msgSend(v7, "height"));

  return v8;
}

- (CRMetalPolygonRectifier)initWithDevice:(id)a3 sourceImage:(id)a4 regionOfInterest:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  CRMetalPolygonRectifier *v13;
  MTLDevice *v14;
  MTLDevice *device;
  dispatch_group_t v16;
  OS_dispatch_group *textureCreationGroup;
  qos_class_t v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *textureCreationQueue;
  MTLDevice *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  unint64_t pixelFormat;
  void *v28;
  void *v29;
  MTLDevice *v30;
  uint64_t v31;
  id v32;
  MTLRenderPipelineState *pipelineState;
  MTLRenderPassDescriptor *v34;
  MTLRenderPassDescriptor *renderPassDescriptor;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  MTLCommandQueue *commandQueue;
  dispatch_semaphore_t v44;
  OS_dispatch_semaphore *renderDestinationSem;
  MTLTexture *renderDestination;
  MTLTexture *managedBlitTexture;
  MTLBuffer *vertices;
  CRMetalPolygonRectifier *v49;
  void *v51;
  void *v52;
  id v53;
  id v54;
  uint8_t buf[16];
  objc_super v56;
  NSRect v57;
  NSRect v58;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  v56.receiver = self;
  v56.super_class = (Class)CRMetalPolygonRectifier;
  v13 = -[CRMetalPolygonRectifier init](&v56, sel_init);
  if (!v13)
    goto LABEL_10;
  if (v11)
    v14 = (MTLDevice *)v11;
  else
    v14 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v13->_device;
  v13->_device = v14;

  if (!v12)
  {
LABEL_15:
    v49 = 0;
    goto LABEL_16;
  }
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  v58 = NSIntegralRect(v57);
  v13->_regionOfInterest = v58;
  if (v58.size.width == 0.0 || v58.size.height == 0.0)
  {
    CROSLogForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v19, OS_LOG_TYPE_ERROR, "Cannot create rectifier with zero-sized region of interest!", buf, 2u);
    }
    goto LABEL_14;
  }
  v16 = dispatch_group_create();
  textureCreationGroup = v13->_textureCreationGroup;
  v13->_textureCreationGroup = (OS_dispatch_group *)v16;

  v18 = qos_class_self();
  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], v18, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = dispatch_queue_create("com.apple.CoreRecognition.metalRectifierTextureQueue", v19);
  textureCreationQueue = v13->_textureCreationQueue;
  v13->_textureCreationQueue = (OS_dispatch_queue *)v20;

  -[CRMetalPolygonRectifier _setSourceImage:](v13, "_setSourceImage:", v12);
  v22 = v13->_device;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  v24 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](v22, "newDefaultLibraryWithBundle:error:", v23, &v54);
  v25 = v54;

  if (!v24)
  {

LABEL_14:
    goto LABEL_15;
  }
  v52 = (void *)objc_msgSend(v24, "newFunctionWithName:", CFSTR("vertexShader"));
  v51 = (void *)objc_msgSend(v24, "newFunctionWithName:", CFSTR("samplingShader"));
  v26 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
  objc_msgSend(v26, "setLabel:", CFSTR("Texturing Pipeline"));
  objc_msgSend(v26, "setVertexFunction:", v52);
  objc_msgSend(v26, "setFragmentFunction:", v51);
  pixelFormat = v13->_pixelFormat;
  objc_msgSend(v26, "colorAttachments");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPixelFormat:", pixelFormat);

  v30 = v13->_device;
  v53 = v25;
  v31 = -[MTLDevice newRenderPipelineStateWithDescriptor:error:](v30, "newRenderPipelineStateWithDescriptor:error:", v26, &v53);
  v32 = v53;

  pipelineState = v13->_pipelineState;
  v13->_pipelineState = (MTLRenderPipelineState *)v31;

  v34 = (MTLRenderPassDescriptor *)objc_alloc_init(MEMORY[0x1E0CC6B50]);
  renderPassDescriptor = v13->_renderPassDescriptor;
  v13->_renderPassDescriptor = v34;

  -[MTLRenderPassDescriptor colorAttachments](v13->_renderPassDescriptor, "colorAttachments");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setLoadAction:", 0);

  -[MTLRenderPassDescriptor colorAttachments](v13->_renderPassDescriptor, "colorAttachments");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setClearColor:", 0.5, 0.5, 0.5, 1.0);

  -[MTLRenderPassDescriptor colorAttachments](v13->_renderPassDescriptor, "colorAttachments");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setStoreAction:", 1);

  v42 = -[MTLDevice newCommandQueue](v13->_device, "newCommandQueue");
  commandQueue = v13->_commandQueue;
  v13->_commandQueue = (MTLCommandQueue *)v42;

  v44 = dispatch_semaphore_create(1);
  renderDestinationSem = v13->_renderDestinationSem;
  v13->_renderDestinationSem = (OS_dispatch_semaphore *)v44;

  renderDestination = v13->_renderDestination;
  v13->_renderDestination = 0;

  managedBlitTexture = v13->_managedBlitTexture;
  *(_QWORD *)v13->_viewportSize = 0;
  v13->_managedBlitTexture = 0;

  vertices = v13->_vertices;
  v13->_vertices = 0;

  v13->_numVertices = 0;
LABEL_10:
  v49 = v13;
LABEL_16:

  return v49;
}

- (void)_setSourceImage:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  unint64_t v7;
  NSObject *textureCreationQueue;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend(v4, "size");
  self->_imageSize.width = v5;
  self->_imageSize.height = v6;
  self->_ioColorSpace = objc_msgSend(v4, "colorSpace");
  if (!objc_msgSend(v4, "colorSpace"))
  {
    v7 = 10;
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "colorSpace") == 1)
  {
    v7 = 70;
LABEL_5:
    self->_pixelFormat = v7;
  }
  dispatch_group_enter((dispatch_group_t)self->_textureCreationGroup);
  textureCreationQueue = self->_textureCreationQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__CRMetalPolygonRectifier__setSourceImage___block_invoke;
  v10[3] = &unk_1E98DAD40;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(textureCreationQueue, v10);

}

void __43__CRMetalPolygonRectifier__setSourceImage___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_createTextureForInputCRImage:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 112));
}

- (void)_createTextureForInputCRImage:(id)a3
{
  id v4;
  id v5;
  MTLTexture *v6;
  MTLTexture *texture;
  uint64_t v8;
  uint64_t v9;
  void *BaseAddress;
  size_t BytesPerRow;
  MTLTexture *v12;
  MTLTexture *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[6];
  _QWORD v21[6];

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
  objc_msgSend(v5, "setPixelFormat:", self->_pixelFormat);
  objc_msgSend(v5, "setWidth:", (unint64_t)self->_regionOfInterest.size.width);
  objc_msgSend(v5, "setHeight:", (unint64_t)self->_regionOfInterest.size.height);
  objc_msgSend(v5, "setAllowGPUOptimizedContents:", 0);
  v6 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v5);
  texture = self->_texture;
  self->_texture = v6;

  v8 = objc_msgSend(v5, "width");
  v9 = objc_msgSend(v5, "height");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v4, "pixelBuffer"), 1uLL);
    BaseAddress = CVPixelBufferGetBaseAddress((CVPixelBufferRef)objc_msgSend(v4, "pixelBuffer"));
    BytesPerRow = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)objc_msgSend(v4, "pixelBuffer"));
    CVPixelBufferGetPlaneCount((CVPixelBufferRef)objc_msgSend(v4, "pixelBuffer"));
    v12 = self->_texture;
    memset(v21, 0, 24);
    v21[3] = v8;
    v21[4] = v9;
    v21[5] = 1;
    -[MTLTexture replaceRegion:mipmapLevel:withBytes:bytesPerRow:](v12, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v21, 0, BaseAddress, BytesPerRow);
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v4, "pixelBuffer"), 1uLL);
  }
  else
  {
    v13 = self->_texture;
    memset(v20, 0, 24);
    v20[3] = v8;
    v20[4] = v9;
    v20[5] = 1;
    if (v4)
    {
      objc_msgSend(v4, "vImage");
      v14 = v18;
      objc_msgSend(v4, "vImage");
      v15 = *((_QWORD *)&v17 + 1);
    }
    else
    {
      v15 = 0;
      v14 = 0;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
    }
    -[MTLTexture replaceRegion:mipmapLevel:withBytes:bytesPerRow:](v13, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v20, 0, v14, v15, v16, v17, v18, v19);
  }

}

- (void)_createRenderTargetWithSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  MTLTexture *v7;
  MTLTexture *renderDestination;
  MTLTexture *v9;
  void *v10;
  void *v11;
  id v12;

  height = a3.height;
  width = a3.width;
  LODWORD(v6) = a3.width;
  HIDWORD(v6) = a3.height;
  *(_QWORD *)self->_viewportSize = v6;
  v12 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
  objc_msgSend(v12, "setTextureType:", 2);
  objc_msgSend(v12, "setPixelFormat:", self->_pixelFormat);
  objc_msgSend(v12, "setWidth:", (unint64_t)width);
  objc_msgSend(v12, "setHeight:", (unint64_t)height);
  objc_msgSend(v12, "setUsage:", 0);
  objc_msgSend(v12, "setAllowGPUOptimizedContents:", 0);
  v7 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v12);
  renderDestination = self->_renderDestination;
  self->_renderDestination = v7;

  v9 = self->_renderDestination;
  -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTexture:", v9);

}

- (id)imageByRectifyingPolygon:(id)a3 imageHeight:(unint64_t)a4
{
  id v6;
  dispatch_block_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  v19 = 0;
  v6 = a3;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_17);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__CRMetalPolygonRectifier_imageByRectifyingPolygon_imageHeight___block_invoke_2;
  v11[3] = &unk_1E98DAD68;
  v12 = v7;
  v13 = &v14;
  v8 = v7;
  -[CRMetalPolygonRectifier rectifyPolygonAsync:imageHeight:completionHandler:](self, "rectifyPolygonAsync:imageHeight:completionHandler:", v6, a4, v11);

  dispatch_block_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __64__CRMetalPolygonRectifier_imageByRectifyingPolygon_imageHeight___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)rectifyPolygonAsync:(id)a3 imageHeight:(unint64_t)a4 completionHandler:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  float32x2_t *v23;
  float v24;
  float v25;
  float32x2_t *v26;
  double v27;
  unint64_t v28;
  double *v29;
  double v30;
  unint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  unint64_t v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _BOOL4 v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float64x2_t v56;
  double v57;
  double v58;
  float64x2_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  float32x2_t v70;
  float32x2_t v71;
  double v72;
  CGSize imageSize;
  float32x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  double v77;
  double v78;
  unint64_t v79;
  float *v80;
  float v81;
  uint64_t v82;
  uint64_t v83;
  MTLBuffer *v84;
  MTLBuffer *vertices;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64x2_t v89;
  id v90;
  double v91;
  id v92;
  id v93;
  float v94;
  float v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v104;
  _QWORD v105[5];
  id v106;
  _QWORD v107[2];
  float64x2_t v108;
  __int128 v109;

  v93 = a3;
  v92 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "denormalizedPolyline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pointValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  if (v11 >= 0)
    v12 = v11;
  else
    v12 = v11 + 1;
  v13 = v12 >> 1;
  v14 = (v12 >> 1) - 1;
  if (v11 >= 4)
  {
    v15 = 0;
    if (v14 <= 1)
      v16 = 1;
    else
      v16 = v14;
    v17 = -1;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v18);

      objc_msgSend(v10, "objectAtIndexedSubscript:", v17 + objc_msgSend(v10, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v19);

      ++v15;
      --v17;
    }
    while (v16 != v15);
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v20);

  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v21);

  v22 = objc_msgSend(v7, "count") - 1;
  self->_numVertices = 6 * v22;
  v23 = (float32x2_t *)malloc_type_malloc(96 * v22, 0x1000040451B5BE8uLL);
  v24 = (double)a4 * -0.5;
  v95 = v24;
  v91 = (double)a4;
  v25 = (double)a4 * 0.5;
  v94 = v25;
  v26 = v23 + 6;
  v27 = 0.0;
  v28 = 1;
  v29 = (double *)MEMORY[0x1E0C9D820];
  v30 = 0.0;
  while (v28 < objc_msgSend(v7, "count"))
  {
    v31 = v28 - 1;
    objc_msgSend(v7, "objectAtIndexedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "pointValue");
    v102 = v34;
    v104 = v33;

    objc_msgSend(v7, "objectAtIndexedSubscript:", ++v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "pointValue");
    v100 = v37;
    v101 = v36;

    objc_msgSend(v8, "objectAtIndexedSubscript:", --v31);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "pointValue");
    v98 = v40;
    v99 = v39;

    v41 = v31 + 1;
    objc_msgSend(v8, "objectAtIndexedSubscript:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "pointValue");
    v96 = v44;
    v97 = v43;
    v45 = v104;
    v46 = v102;
    v47 = v101;
    v48 = v100;

    v49 = *v29;
    v50 = v29[1];
    v51 = *v29 > 0.0;
    if (v50 <= 0.0)
      v51 = 0;
    v52 = v101;
    v53 = v100;
    v54 = v104;
    v55 = v102;
    if (v51)
    {
      v54 = v104 * v49;
      v55 = v102 * v50;
      v52 = v101 * v49;
      v53 = v100 * v50;
    }
    v56.f64[0] = v99;
    v57 = v99;
    v58 = v98;
    v59.f64[0] = v97;
    if (v51)
    {
      v45 = v104 * v49;
      v46 = v102 * v50;
      v57 = v99 * v49;
      v58 = v98 * v50;
    }
    v60 = v97;
    v61 = v96;
    if (v51)
    {
      v47 = v101 * v49;
      v48 = v100 * v50;
      v60 = v97 * v49;
      v61 = v96 * v50;
    }
    v62 = v97;
    v63 = v96;
    v64 = v99;
    v65 = v98;
    if (v51)
    {
      v64 = v99 * v49;
      v65 = v98 * v50;
      v62 = v97 * v49;
      v63 = v96 * v50;
    }
    v66 = sqrt((v55 - v53) * (v55 - v53) + (v54 - v52) * (v54 - v52));
    v67 = sqrt((v46 - v58) * (v46 - v58) + (v45 - v57) * (v45 - v57));
    v68 = sqrt((v48 - v61) * (v48 - v61) + (v47 - v60) * (v47 - v60));
    v69 = sqrt((v65 - v63) * (v65 - v63) + (v64 - v62) * (v64 - v62));
    if (fmax(fmax(v66, v67), fmax(v68, v69)) >= 1.0 && fmin(fmin(v66, v67), fmin(v68, v69)) != 0.0)
    {
      *(double *)&v70 = (v66 + v69) * 0.5;
      v30 = v30 + *(double *)&v70;
      v71.f32[0] = v30;
      v70.f32[0] = v30 - *(double *)&v70;
      v59.f64[1] = v96;
      v71.f32[1] = v94;
      v70.f32[1] = v94;
      v72 = v67 + v68;
      imageSize = self->_imageSize;
      v74 = vcvt_f32_f64(vdivq_f64(v59, (float64x2_t)imageSize));
      v56.f64[1] = v98;
      v75.f64[0] = v101;
      v75.f64[1] = v100;
      v76.f64[0] = v104;
      v76.f64[1] = v102;
      v26[-6] = (float32x2_t)__PAIR64__(LODWORD(v95), v71.u32[0]);
      v26[-5] = v74;
      v27 = v27 + v72 * 0.5;
      *(float32x2_t *)&v76.f64[0] = vcvt_f32_f64(vdivq_f64(v76, (float64x2_t)imageSize));
      v26[-4] = (float32x2_t)__PAIR64__(LODWORD(v95), v70.u32[0]);
      v26[-3] = vcvt_f32_f64(vdivq_f64(v56, (float64x2_t)imageSize));
      v26[-2] = v70;
      v26[-1] = *(float32x2_t *)&v76.f64[0];
      *v26 = (float32x2_t)__PAIR64__(LODWORD(v95), v71.u32[0]);
      v26[1] = v74;
      v26[2] = v70;
      v26[3] = *(float32x2_t *)&v76.f64[0];
      v26[4] = v71;
      v26[5] = vcvt_f32_f64(vdivq_f64(v75, (float64x2_t)imageSize));
    }
    v26 += 12;
    v28 = v41 + 1;
  }
  v77 = v91 / (v27 / (double)v22);
  v78 = v30 * v77;
  if (self->_numVertices)
  {
    v79 = 0;
    v80 = (float *)&v23[1];
    do
    {
      v81 = v78 * -0.5 + COERCE_FLOAT(*((_QWORD *)v80 - 1)) * v77;
      *(v80 - 2) = v81;
      v82 = *(_QWORD *)v80;
      *(float *)&v83 = (COERCE_FLOAT(*(_QWORD *)v80) - self->_regionOfInterest.origin.x)
                     / (self->_regionOfInterest.size.width
                      / self->_imageSize.width);
      *(_DWORD *)v80 = v83;
      *(float *)&v82 = (*((float *)&v82 + 1) - self->_regionOfInterest.origin.y)
                     / (self->_regionOfInterest.size.height
                      / self->_imageSize.height);
      HIDWORD(v83) = v82;
      *(_QWORD *)v80 = v83;
      v80 += 4;
      ++v79;
    }
    while (v79 < self->_numVertices);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_renderDestinationSem, 0xFFFFFFFFFFFFFFFFLL);
  -[CRMetalPolygonRectifier _createRenderTargetWithSize:](self, "_createRenderTargetWithSize:", v78, v91);
  v84 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v23, 16 * self->_numVertices, 0);
  vertices = self->_vertices;
  self->_vertices = v84;

  free(v23);
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setLabel:", CFSTR("CRMetalPolygonRectifier"));
  objc_msgSend(v86, "renderCommandEncoderWithDescriptor:", self->_renderPassDescriptor);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setLabel:", CFSTR("CRMetalPolygonRectifierOffscreenRenderEncoder"));
  dispatch_group_wait((dispatch_group_t)self->_textureCreationGroup, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v87, "pushDebugGroup:", CFSTR("OffscreenRenderPass"));
  objc_msgSend(v87, "setCullMode:", 0);
  v88 = *(_QWORD *)self->_viewportSize;
  v107[0] = 0;
  v107[1] = 0;
  v89.i64[0] = v88;
  v89.i64[1] = HIDWORD(v88);
  v108 = vcvtq_f64_u64(v89);
  v109 = xmmword_1D513AD40;
  objc_msgSend(v87, "setViewport:", v107);
  objc_msgSend(v87, "setRenderPipelineState:", self->_pipelineState);
  objc_msgSend(v87, "setVertexBuffer:offset:atIndex:", self->_vertices, 0, 0);
  objc_msgSend(v87, "setVertexBytes:length:atIndex:", self->_viewportSize, 8, 1);
  objc_msgSend(v87, "setFragmentTexture:atIndex:", self->_texture, 0);
  objc_msgSend(v87, "drawPrimitives:vertexStart:vertexCount:", 3, 0, self->_numVertices);
  objc_msgSend(v87, "popDebugGroup");
  objc_msgSend(v87, "endEncoding");
  v105[0] = MEMORY[0x1E0C809B0];
  v105[1] = 3221225472;
  v105[2] = __77__CRMetalPolygonRectifier_rectifyPolygonAsync_imageHeight_completionHandler___block_invoke;
  v105[3] = &unk_1E98DAD90;
  v105[4] = self;
  v90 = v92;
  v106 = v90;
  objc_msgSend(v86, "addCompletedHandler:", v105);
  objc_msgSend(v86, "commit");

}

void __77__CRMetalPolygonRectifier_rectifyPolygonAsync_imageHeight_completionHandler___block_invoke(uint64_t a1)
{
  CRImage *v2;
  uint64_t v3;
  uint64_t v4;
  CRLogger *v5;
  _BYTE *CRLogger;
  void *v7;
  CRImage *v8;

  v2 = [CRImage alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 144);
  if (!v4)
    v4 = *(_QWORD *)(v3 + 128);
  v8 = -[CRImage initWithMTLTexture:toColorSpace:](v2, "initWithMTLTexture:toColorSpace:", v4, *(unsigned int *)(v3 + 16));
  v5 = (CRLogger *)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 152));
  CRLogger = CRLogger::getCRLogger(v5);
  if (*CRLogger && (CRLogger[8] & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/rectified_%d.png"), rand());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRImage writeToFile:](v8, "writeToFile:", v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_renderDestinationSem, 0);
  objc_storeStrong((id *)&self->_managedBlitTexture, 0);
  objc_storeStrong((id *)&self->_renderDestination, 0);
  objc_storeStrong((id *)&self->_textureCreationQueue, 0);
  objc_storeStrong((id *)&self->_textureCreationGroup, 0);
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end

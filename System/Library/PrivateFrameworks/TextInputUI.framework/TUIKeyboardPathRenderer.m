@implementation TUIKeyboardPathRenderer

- (TUIKeyboardPathRenderer)initWithMTKView:(id)a3 generatePipelineDescriptors:(BOOL)a4
{
  id v7;
  TUIKeyboardPathRenderer *v8;
  uint64_t v9;
  MTLDevice *device;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUIKeyboardPathRenderer;
  v8 = -[TUIKeyboardPathRenderer init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "device");
    v9 = objc_claimAutoreleasedReturnValue();
    device = v8->_device;
    v8->_device = (MTLDevice *)v9;

    objc_storeStrong((id *)&v8->_view, a3);
    -[MTKView setDelegate:](v8->_view, "setDelegate:", v8);
    -[MTKView setAutoResizeDrawable:](v8->_view, "setAutoResizeDrawable:", 0);
    v8->_generatePipelineDescriptors = a4;
    -[TUIKeyboardPathRenderer setupMetal](v8, "setupMetal");
  }

  return v8;
}

- (void)setupMetal
{
  NSObject *v3;
  _QWORD block[5];

  -[MTKView setSampleCount:](self->_view, "setSampleCount:", 1);
  -[MTKView setClearColor:](self->_view, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  -[MTKView setDepthStencilPixelFormat:](self->_view, "setDepthStencilPixelFormat:", 0);
  self->_colorPixelFormat = -[MTKView colorPixelFormat](self->_view, "colorPixelFormat");
  if (self->_generatePipelineDescriptors)
  {
    -[TUIKeyboardPathRenderer setupPipeline](self, "setupPipeline");
  }
  else
  {
    dispatch_get_global_queue(33, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__TUIKeyboardPathRenderer_setupMetal__block_invoke;
    block[3] = &unk_1E24FC068;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (void)setupPipeline
{
  MTLDevice *device;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  MTLDevice *v9;
  MTLPipelineLibrarySPI *v10;
  id v11;
  MTLPipelineLibrarySPI *pipelineLibrary;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  unint64_t colorPixelFormat;
  void *v31;
  void *v32;
  MTLDevice *v33;
  MTLRenderPipelineState *v34;
  MTLRenderPipelineState *pipelineState;
  MTLCommandQueue *v36;
  MTLCommandQueue *commandQueue;
  MTLBuffer *v38;
  MTLBuffer *vertexBuffer;
  void *v40;
  _QWORD block[5];
  id v42;
  id v43;
  id v44;

  device = self->_device;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v5 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](device, "newDefaultLibraryWithBundle:error:", v4, &v44);
  v6 = v44;

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathForResource:ofType:", CFSTR("TextInputUI_iOS"), CFSTR("pipelinelib"));
    v8 = objc_claimAutoreleasedReturnValue();

    v40 = (void *)v8;
    if (v8 && !self->_generatePipelineDescriptors)
    {
      v9 = self->_device;
      v43 = v6;
      v10 = (MTLPipelineLibrarySPI *)-[MTLDevice newPipelineLibraryWithFilePath:error:](v9, "newPipelineLibraryWithFilePath:error:", v8, &v43);
      v11 = v43;

      pipelineLibrary = self->_pipelineLibrary;
      self->_pipelineLibrary = v10;

      v6 = v11;
    }
    v13 = v6;
    v14 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("pathVertexShader"));
    v15 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("pathFragmentShader"));
    v16 = objc_alloc_init(MEMORY[0x1E0CC6BD8]);
    objc_msgSend(v16, "attributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFormat:", 29);

    objc_msgSend(v16, "attributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setOffset:", 0);

    objc_msgSend(v16, "attributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBufferIndex:", 0);

    objc_msgSend(v16, "layouts");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setStride:", 8);

    objc_msgSend(v16, "layouts");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setStepRate:", 1);

    objc_msgSend(v16, "layouts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setStepFunction:", 1);

    v29 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
    objc_msgSend(v29, "setLabel:", CFSTR("PathPipeline"));
    objc_msgSend(v29, "setVertexDescriptor:", v16);
    objc_msgSend(v29, "setVertexFunction:", v14);
    objc_msgSend(v29, "setFragmentFunction:", v15);
    colorPixelFormat = self->_colorPixelFormat;
    objc_msgSend(v29, "colorAttachments");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPixelFormat:", colorPixelFormat);

    objc_msgSend(v29, "setDepthAttachmentPixelFormat:", 0);
    objc_msgSend(v29, "setSampleCount:", 1);
    objc_msgSend(v29, "setPipelineLibrary:", self->_pipelineLibrary);
    v33 = self->_device;
    v42 = v13;
    v34 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](v33, "newRenderPipelineStateWithDescriptor:error:", v29, &v42);
    v6 = v42;

    pipelineState = self->_pipelineState;
    self->_pipelineState = v34;

    if (!self->_pipelineState)
      NSLog(CFSTR("Failed to create pipeline state: %@"), v6, v40);
    v36 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_device, "newCommandQueue");
    commandQueue = self->_commandQueue;
    self->_commandQueue = v36;

    v38 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 98304, 0);
    vertexBuffer = self->_vertexBuffer;
    self->_vertexBuffer = v38;

    -[MTLBuffer setLabel:](self->_vertexBuffer, "setLabel:", CFSTR("PathVertices"));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__TUIKeyboardPathRenderer_setupPipeline__block_invoke;
    block[3] = &unk_1E24FC068;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    NSLog(CFSTR("Failed to load default library: %@"), v6);
  }

}

- (void)updateVertexBufferForPaths:(id)a3
{
  id v4;
  uint64_t v5;
  float scale;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  float64_t v16;
  float64x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  unint64_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  void *v25;
  void *v26;
  double v27;
  float64_t v28;
  float64x2_t v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x2_t v32;
  uint32x2_t v33;
  unint64_t vertexCount;
  float32x2_t v36;
  unint64_t v37;
  uint64_t v38;
  float32x2_t v39;
  float32x2_t v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  uint64_t v44;
  float v45;
  float v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_vertexCount = 0;
  v5 = -[MTLBuffer contents](self->_vertexBuffer, "contents");
  scale = self->_scale;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v48;
    v45 = 0.5 / scale;
    v41 = *(_QWORD *)v48;
    do
    {
      v10 = 0;
      v42 = v8;
      do
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(obj);
        v44 = v10;
        v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v10);
        objc_msgSend(v11, "nonSentinelPoints", v41);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13 >= 2)
        {
          objc_msgSend(v11, "nonSentinelPoints");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndex:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "point");
          v17.f64[1] = v16;
          v18 = vcvt_f32_f64(v17);
          v19 = v18;
          v20 = v18;
          v21 = 1;
          do
          {
            v22 = v20;
            v23 = v19;
            v24 = v18;
            objc_msgSend(v11, "nonSentinelPoints");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectAtIndex:", v21);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "decay");
            *(float *)&v27 = (float)v13 * v27 + 0.0;
            v46 = (float)((float)((float)(1.0 - (float)((float)((float)v21 - *(float *)&v27) / (float)v13)) * -19.7)
                        + 19.7)
                * 0.5;
            objc_msgSend(v26, "point");
            v29.f64[1] = v28;
            v18 = vcvt_f32_f64(v29);
            *(float32x2_t *)&v29.f64[0] = vsub_f32(v18, v24);
            v30 = vmul_f32(*(float32x2_t *)&v29.f64[0], *(float32x2_t *)&v29.f64[0]);
            v30.i32[0] = vadd_f32(v30, (float32x2_t)vdup_lane_s32((int32x2_t)v30, 1)).u32[0];
            v31 = vrsqrte_f32((float32x2_t)v30.u32[0]);
            v32 = vmul_f32(v31, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v31, v31)));
            *(float32x2_t *)&v29.f64[0] = vmul_n_f32(*(float32x2_t *)&v29.f64[0], vmul_f32(v32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v32, v32))).f32[0]);
            v30.f32[0] = -*(float *)v29.f64;
            LODWORD(v29.f64[0]) = vdup_lane_s32(*(int32x2_t *)&v29.f64[0], 1).u32[0];
            HIDWORD(v29.f64[0]) = v30.i32[0];
            *(float32x2_t *)&v29.f64[0] = vmul_n_f32(*(float32x2_t *)&v29.f64[0], v46);
            v19 = vsub_f32(v18, *(float32x2_t *)&v29.f64[0]);
            v20 = vadd_f32(*(float32x2_t *)&v29.f64[0], v18);
            if (v46 >= v45)
            {
              v33 = (uint32x2_t)vceq_f32(v24, v18);
              if ((vpmin_u32(v33, v33).u32[0] & 0x80000000) == 0)
              {
                vertexCount = self->_vertexCount;
                if (vertexCount >> 12 <= 2)
                {
                  *(float32x2_t *)(v5 + 8 * vertexCount) = v23;
                  self->_vertexCount = vertexCount + 1;
                  if (vertexCount != 12287)
                  {
                    *(float32x2_t *)(v5 + 8 * (vertexCount + 1)) = v22;
                    self->_vertexCount = vertexCount + 2;
                    if (vertexCount <= 0x2FFD)
                    {
                      *(float32x2_t *)(v5 + 8 * (vertexCount + 2)) = v19;
                      self->_vertexCount = vertexCount + 3;
                      if (vertexCount != 12285)
                      {
                        *(float32x2_t *)(v5 + 8 * (vertexCount + 3)) = v19;
                        self->_vertexCount = vertexCount + 4;
                        if (vertexCount >> 2 <= 0xBFE)
                        {
                          *(float32x2_t *)(v5 + 8 * (vertexCount + 4)) = v22;
                          self->_vertexCount = vertexCount + 5;
                          if (vertexCount != 12283)
                          {
                            *(float32x2_t *)(v5 + 8 * (vertexCount + 5)) = v20;
                            self->_vertexCount = vertexCount + 6;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            if (v21 + 2 < v13 || v21 == v13 - 1)
              v21 += 2;
            else
              v21 = v13 - 1;
            if (v21 >= v13 && v46 >= v45)
            {
              v36 = vsub_f32(v20, v18);
              v37 = self->_vertexCount;
              v38 = 12;
              v39 = v20;
              do
              {
                v40 = v39;
                v36 = vmla_lane_f32(vmul_n_f32((float32x2_t)0x3E8483EE3F7746EALL, v36.f32[0]), (float32x2_t)0x3F7746EABE8483EELL, v36, 1);
                v39 = vadd_f32(v36, v18);
                if (v37 >> 12 <= 2)
                {
                  *(float32x2_t *)(v5 + 8 * v37) = v40;
                  self->_vertexCount = v37 + 1;
                  if (v37 == 12287
                    || (*(float32x2_t *)(v5 + 8 * (v37 + 1)) = v18, self->_vertexCount = v37 + 2, v37 > 0x2FFD))
                  {
                    v37 = 12288;
                  }
                  else
                  {
                    *(float32x2_t *)(v5 + 8 * (v37 + 2)) = v39;
                    v37 += 3;
                    self->_vertexCount = v37;
                  }
                }
                --v38;
              }
              while (v38);
            }

          }
          while (v21 < v13);

          v9 = v41;
          v8 = v42;
        }
        v10 = v44 + 1;
      }
      while (v44 + 1 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v8);
  }

}

- (void)drawInMTKView:(id)a3
{
  id v4;
  uint32x2_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64x2_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location[2];
  float64x2_t v19;
  __int128 v20;

  v4 = a3;
  if (self->_setupCompleted && !self->_drawing)
  {
    if (self->_pipelineState)
    {
      v5 = (uint32x2_t)vceqz_s32(*(int32x2_t *)self->_viewportPointSize);
      if ((vpmax_u32(v5, v5).u32[0] & 0x80000000) == 0)
      {
        -[TUIKeyboardPathRenderer datasource](self, "datasource");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_opt_respondsToSelector();

        if ((v7 & 1) != 0)
        {
          -[TUIKeyboardPathRenderer datasource](self, "datasource");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "pathsToRender");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          -[TUIKeyboardPathRenderer updateVertexBufferForPaths:](self, "updateVertexBufferForPaths:", v9);
        }
        -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setLabel:", CFSTR("PathCommand"));
        objc_msgSend(v4, "currentRenderPassDescriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v10, "renderCommandEncoderWithDescriptor:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setLabel:", CFSTR("PathRenderEncoder"));
          objc_msgSend(v12, "setFrontFacingWinding:", 0);
          v13 = *(_QWORD *)self->_viewportPixelSize;
          location[0] = 0;
          location[1] = 0;
          v14.i64[0] = v13;
          v14.i64[1] = HIDWORD(v13);
          v19 = vcvtq_f64_u64(v14);
          v20 = xmmword_18C80CDD0;
          objc_msgSend(v12, "setViewport:", location);
          objc_msgSend(v12, "setRenderPipelineState:", self->_pipelineState);
          objc_msgSend(v12, "setVertexBuffer:offset:atIndex:", self->_vertexBuffer, 0, 0);
          objc_msgSend(v12, "setVertexBytes:length:atIndex:", self->_viewportPointSize, 8, 1);
          objc_msgSend(v12, "setFragmentBytes:length:atIndex:", self->_pathColor, 16, 2);
          if (self->_vertexCount)
            objc_msgSend(v12, "drawPrimitives:vertexStart:vertexCount:", 3, 0);
          objc_msgSend(v12, "endEncoding");
          objc_initWeak(location, self);
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __41__TUIKeyboardPathRenderer_drawInMTKView___block_invoke;
          v16[3] = &unk_1E24FB4E0;
          objc_copyWeak(&v17, location);
          objc_msgSend(v10, "addCompletedHandler:", v16);
          objc_msgSend(v4, "currentDrawable");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "presentDrawable:", v15);

          objc_destroyWeak(&v17);
          objc_destroyWeak(location);

        }
        objc_msgSend(v10, "commit");

      }
    }
  }

}

- (void)completeRendering
{
  self->_drawing = 0;
  if (!self->_vertexCount)
    -[TUIKeyboardPathRenderer setPaused:](self, "setPaused:", 1);
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  unsigned int v11;
  float v12;

  LODWORD(v5) = a4.width;
  HIDWORD(v5) = a4.height;
  *(_QWORD *)self->_viewportPixelSize = v5;
  v6 = a3;
  objc_msgSend(v6, "bounds");
  *(_DWORD *)self->_viewportPointSize = v7;
  objc_msgSend(v6, "bounds");
  v9 = v8;

  v10 = *(_QWORD *)self->_viewportPointSize;
  *(_DWORD *)&self->_viewportPointSize[4] = v9;
  if ((_DWORD)v10)
  {
    v11 = *(_QWORD *)self->_viewportPixelSize / v10;
    if (v11 <= 1)
      v11 = 1;
    v12 = (float)v11;
  }
  else
  {
    v12 = 1.0;
  }
  self->_scale = v12;
}

- (BOOL)paused
{
  return -[MTKView isPaused](self->_view, "isPaused");
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[MTKView isPaused](self->_view, "isPaused") != a3)
    -[MTKView setPaused:](self->_view, "setPaused:", v3);
}

- (void)keyboardDidHide
{
  void *v3;
  char isKindOfClass;
  id v5;

  -[MTKView releaseDrawables](self->_view, "releaseDrawables");
  -[MTKView layer](self->_view, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MTKView layer](self->_view, "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "discardContents");
    objc_msgSend(v5, "removeBackBuffers");

  }
}

- (TUIKeyboardPathRendererDataSource)datasource
{
  return (TUIKeyboardPathRendererDataSource *)objc_loadWeakRetained((id *)&self->_datasource);
}

- (void)setDatasource:(id)a3
{
  objc_storeWeak((id *)&self->_datasource, a3);
}

- (__n128)pathColor
{
  return a1[8];
}

- (void)setPathColor:(TUIKeyboardPathRenderer *)self
{
  __int128 v2;

  *(_OWORD *)self->_pathColor = v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_datasource);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __41__TUIKeyboardPathRenderer_drawInMTKView___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__TUIKeyboardPathRenderer_drawInMTKView___block_invoke_2;
  block[3] = &unk_1E24FBCA0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __41__TUIKeyboardPathRenderer_drawInMTKView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "completeRendering");
    WeakRetained = v2;
  }

}

uint64_t __40__TUIKeyboardPathRenderer_setupPipeline__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[3];
  objc_msgSend(v3, "drawableSize");
  result = objc_msgSend(v2, "mtkView:drawableSizeWillChange:", v3);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
  return result;
}

void __37__TUIKeyboardPathRenderer_setupMetal__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setupPipeline");
  if (!objc_msgSend(MEMORY[0x1E0DC3938], "isKeyboardProcess"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_keyboardDidHide, *MEMORY[0x1E0DC4FA0], 0);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_keyboardDidHide, *MEMORY[0x1E0DC4868], 0);

}

+ (id)generatePipelineDescriptorsForMTKView:(id)a3
{
  id v3;
  void *v4;
  TUIKeyboardPathRenderer *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startCollectingPipelineDescriptors");

  v5 = -[TUIKeyboardPathRenderer initWithMTKView:generatePipelineDescriptors:]([TUIKeyboardPathRenderer alloc], "initWithMTKView:generatePipelineDescriptors:", v3, 1);
  objc_msgSend(v3, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endCollectingPipelineDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

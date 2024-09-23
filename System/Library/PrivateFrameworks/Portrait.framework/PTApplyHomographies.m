@implementation PTApplyHomographies

- (PTApplyHomographies)initWithMetalContext:(id)a3 colorSize:(CGSize)a4 disparitySize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  id v11;
  PTApplyHomographies *v12;
  PTApplyHomographies *v13;
  dispatch_semaphore_t v14;
  OS_dispatch_semaphore *semaphore;
  uint64_t v16;
  PTColorConversion *v17;
  PTColorConversion *colorConversion;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  MTLTexture *rgbaLinear;
  void *v23;
  uint64_t v24;
  MTLTexture *rgbaLinearVIS;
  void *v26;
  uint64_t v27;
  MTLTexture *disparityVIS;
  uint64_t v29;
  MTLRenderPassDescriptor *homographyRenderPassDescriptor;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  MTLRenderPipelineState *renderPipelineState;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  MTLRenderPipelineState *renderPipelineStateDisparity;
  PTApplyHomographies *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSObject *v116;
  id v117;
  objc_super v118;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v11 = a3;
  v118.receiver = self;
  v118.super_class = (Class)PTApplyHomographies;
  v12 = -[PTApplyHomographies init](&v118, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_metalContext, a3);
    v14 = dispatch_semaphore_create(2);
    semaphore = v13->_semaphore;
    v13->_semaphore = (OS_dispatch_semaphore *)v14;

    LODWORD(v16) = v8;
    HIDWORD(v16) = v7;
    *(_QWORD *)v13->_inputColorSize = v16;
    *(_WORD *)&v13->_showGrid = 256;
    v17 = -[PTColorConversion initWithMetalContext:]([PTColorConversion alloc], "initWithMetalContext:", v13->_metalContext);
    colorConversion = v13->_colorConversion;
    v13->_colorConversion = v17;

    if (!v13->_colorConversion)
    {
      _PTLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.1(v19, v57, v58, v59, v60, v61, v62, v63);
      v56 = 0;
      goto LABEL_36;
    }
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, (unint64_t)v8, (unint64_t)v7, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    -[NSObject setUsage:](v19, "setUsage:", 7);
    -[PTMetalContext device](v13->_metalContext, "device");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "newTextureWithDescriptor:", v19);
    rgbaLinear = v13->_rgbaLinear;
    v13->_rgbaLinear = (MTLTexture *)v21;

    if (v13->_rgbaLinear)
    {
      -[NSObject setUsage:](v19, "setUsage:", 7);
      -[PTMetalContext device](v13->_metalContext, "device");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "newTextureWithDescriptor:", v19);
      rgbaLinearVIS = v13->_rgbaLinearVIS;
      v13->_rgbaLinearVIS = (MTLTexture *)v24;

      if (v13->_rgbaLinearVIS)
      {
        -[NSObject setWidth:](v19, "setWidth:", (unint64_t)width);
        -[NSObject setHeight:](v19, "setHeight:", (unint64_t)height);
        -[NSObject setPixelFormat:](v19, "setPixelFormat:", 25);
        -[PTMetalContext device](v13->_metalContext, "device");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "newTextureWithDescriptor:", v19);
        disparityVIS = v13->_disparityVIS;
        v13->_disparityVIS = (MTLTexture *)v27;

        if (v13->_disparityVIS)
        {
          v29 = objc_opt_new();
          homographyRenderPassDescriptor = v13->_homographyRenderPassDescriptor;
          v13->_homographyRenderPassDescriptor = (MTLRenderPassDescriptor *)v29;

          -[MTLRenderPassDescriptor colorAttachments](v13->_homographyRenderPassDescriptor, "colorAttachments");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setLoadAction:", 0);

          -[MTLRenderPassDescriptor colorAttachments](v13->_homographyRenderPassDescriptor, "colorAttachments");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setStoreAction:", 1);

          -[MTLRenderPassDescriptor colorAttachments](v13->_homographyRenderPassDescriptor, "colorAttachments");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setClearColor:", 0.0, 1.0, 0.0, 1.0);

          v37 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
          -[PTMetalContext functionWithName:withConstants:](v13->_metalContext, "functionWithName:withConstants:", CFSTR("vertexShaderHomography"), 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setVertexFunction:](v37, "setVertexFunction:", v38);

          -[NSObject vertexFunction](v37, "vertexFunction");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            -[PTMetalContext functionWithName:withConstants:](v13->_metalContext, "functionWithName:withConstants:", CFSTR("fragmentShaderSample"), 0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setFragmentFunction:](v37, "setFragmentFunction:", v40);

            -[NSObject fragmentFunction](v37, "fragmentFunction");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
            {
              v42 = -[MTLTexture pixelFormat](v13->_rgbaLinearVIS, "pixelFormat");
              -[NSObject colorAttachments](v37, "colorAttachments");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setPixelFormat:", v42);

              -[PTMetalContext device](v13->_metalContext, "device");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v117 = 0;
              v46 = objc_msgSend(v45, "newRenderPipelineStateWithDescriptor:error:", v37, &v117);
              v47 = v117;
              renderPipelineState = v13->_renderPipelineState;
              v13->_renderPipelineState = (MTLRenderPipelineState *)v46;

              if (v13->_renderPipelineState)
              {
                v49 = -[MTLTexture pixelFormat](v13->_disparityVIS, "pixelFormat");
                -[NSObject colorAttachments](v37, "colorAttachments");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setPixelFormat:", v49);

                -[PTMetalContext device](v13->_metalContext, "device");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v116 = v47;
                v53 = objc_msgSend(v52, "newRenderPipelineStateWithDescriptor:error:", v37, &v116);
                v54 = v116;

                renderPipelineStateDisparity = v13->_renderPipelineStateDisparity;
                v13->_renderPipelineStateDisparity = (MTLRenderPipelineState *)v53;

                if (v13->_renderPipelineStateDisparity)
                {
                  v56 = v13;
                }
                else
                {
                  _PTLogSystem();
                  v107 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
                    -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.8(v107, v108, v109, v110, v111, v112, v113, v114);

                  v56 = 0;
                }
                v47 = v54;
                goto LABEL_34;
              }
              _PTLogSystem();
              v99 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.7(v99, v100, v101, v102, v103, v104, v105, v106);

            }
            else
            {
              _PTLogSystem();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.6(v47, v92, v93, v94, v95, v96, v97, v98);
            }
          }
          else
          {
            _PTLogSystem();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.5(v47, v85, v86, v87, v88, v89, v90, v91);
          }
          v56 = 0;
LABEL_34:

          goto LABEL_35;
        }
        _PTLogSystem();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.4(v37, v78, v79, v80, v81, v82, v83, v84);
      }
      else
      {
        _PTLogSystem();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.3(v37, v71, v72, v73, v74, v75, v76, v77);
      }
    }
    else
    {
      _PTLogSystem();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.2(v37, v64, v65, v66, v67, v68, v69, v70);
    }
    v56 = 0;
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
  v56 = 0;
LABEL_37:

  return v56;
}

- (void)_ensureSufficientBufferSizesNumberOfRows:(int)a3 numberOfCols:(int)a4
{
  int v7;
  unint64_t v8;
  void *v9;
  MTLBuffer *v10;
  MTLBuffer *v11;
  void *v12;
  MTLBuffer *v13;
  MTLBuffer *v14;
  MTLBuffer *v15;
  MTLBuffer *indexBufferHomography;
  id v17;

  v7 = a4 + 2 * a3 * (a4 - 1);
  self->_vertexCountHomography = a4 * a3;
  self->_indexCountHomography = v7;
  v8 = (uint64_t)(a4 * a3) << 6;
  if (v8 > -[MTLBuffer length](self->_vertexBufferHomography[0], "length"))
  {
    -[PTMetalContext device](self->_metalContext, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (MTLBuffer *)objc_msgSend(v9, "newBufferWithLength:options:", v8, 0);
    v11 = self->_vertexBufferHomography[0];
    self->_vertexBufferHomography[0] = v10;

    -[PTMetalContext device](self->_metalContext, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (MTLBuffer *)objc_msgSend(v12, "newBufferWithLength:options:", v8, 0);
    v14 = self->_vertexBufferHomography[1];
    self->_vertexBufferHomography[1] = v13;

  }
  if (self->_numberOfRowsOverscan != a3 || self->_numberOfColsOverscan != a4)
  {
    -[PTMetalContext device](self->_metalContext, "device");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v15 = (MTLBuffer *)objc_msgSend(v17, "newBufferWithLength:options:", 2 * v7, 0);
    indexBufferHomography = self->_indexBufferHomography;
    self->_indexBufferHomography = v15;

  }
}

- (id)updatePTTexture:(id)a3 inPTTexture:(id)a4
{
  PTColorConversion *colorConversion;
  MTLTexture *rgbaLinear;
  id v8;
  MTLTexture *rgbaLinearVIS;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  colorConversion = self->_colorConversion;
  rgbaLinear = self->_rgbaLinear;
  v8 = a3;
  -[PTColorConversion convertRGBLinearFromPTTexture:inPTTexture:outRGBA:](colorConversion, "convertRGBLinearFromPTTexture:inPTTexture:outRGBA:", v8, a4, rgbaLinear);
  rgbaLinearVIS = self->_rgbaLinearVIS;
  -[MTLRenderPassDescriptor colorAttachments](self->_homographyRenderPassDescriptor, "colorAttachments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTexture:", rgbaLinearVIS);

  objc_msgSend(v8, "renderCommandEncoderWithDescriptor:", self->_homographyRenderPassDescriptor);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setRenderPipelineState:", self->_renderPipelineState);
  objc_msgSend(v12, "setVertexBuffer:offset:atIndex:", self->_vertexBufferHomography[self->_frameCounter & 1], 0, 0);
  objc_msgSend(v12, "setVertexBytes:length:atIndex:", self->_inputColorSize, 8, 1);
  objc_msgSend(v12, "setFragmentTexture:atIndex:", self->_rgbaLinear, 0);
  objc_msgSend(v12, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 4, self->_indexCountHomography, 0, self->_indexBufferHomography, 0);
  if (self->_showGrid)
  {
    objc_msgSend(v12, "setFragmentTexture:atIndex:", self->_textureMarker, 0);
    objc_msgSend(v12, "setTriangleFillMode:", 1);
    objc_msgSend(v12, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 4, self->_indexCountHomography, 0, self->_indexBufferHomography, 0);
  }
  objc_msgSend(v12, "endEncoding");
  +[PTTexture createRGBA:](PTTexture, "createRGBA:", self->_rgbaLinearVIS);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTransferFunction:", *MEMORY[0x1E0CA8EB8]);

  return v13;
}

- (id)updateDisparity:(id)a3 inDisparity:(id)a4
{
  MTLTexture *disparityVIS;
  MTLRenderPassDescriptor *homographyRenderPassDescriptor;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  MTLTexture *v13;

  disparityVIS = self->_disparityVIS;
  homographyRenderPassDescriptor = self->_homographyRenderPassDescriptor;
  v8 = a4;
  v9 = a3;
  -[MTLRenderPassDescriptor colorAttachments](homographyRenderPassDescriptor, "colorAttachments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTexture:", disparityVIS);

  objc_msgSend(v9, "renderCommandEncoderWithDescriptor:", self->_homographyRenderPassDescriptor);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setRenderPipelineState:", self->_renderPipelineStateDisparity);
  objc_msgSend(v12, "setVertexBuffer:offset:atIndex:", self->_vertexBufferHomography[self->_frameCounter & 1], 0, 0);
  objc_msgSend(v12, "setVertexBytes:length:atIndex:", self->_inputColorSize, 8, 1);
  objc_msgSend(v12, "setFragmentTexture:atIndex:", v8, 0);

  objc_msgSend(v12, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 4, self->_indexCountHomography, 0, self->_indexBufferHomography, 0);
  objc_msgSend(v12, "endEncoding");
  v13 = self->_disparityVIS;

  return v13;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_homographyRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_renderPipelineStateDisparity, 0);
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_indexBufferHomography, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_vertexBufferHomography[i + 1], 0);
  objc_storeStrong((id *)&self->_textureMarker, 0);
  objc_storeStrong((id *)&self->_disparityVIS, 0);
  objc_storeStrong((id *)&self->_rgbaLinearVIS, 0);
  objc_storeStrong((id *)&self->_rgbaLinear, 0);
  objc_storeStrong((id *)&self->_colorConversion, 0);
  objc_storeStrong((id *)&self->_sharedEventListener, 0);
  objc_storeStrong((id *)&self->_sharedEvent, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

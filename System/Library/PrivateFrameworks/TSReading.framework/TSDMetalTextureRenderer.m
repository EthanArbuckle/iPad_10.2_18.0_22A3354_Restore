@implementation TSDMetalTextureRenderer

- (TSDMetalTextureRenderer)initWithTextures:(id)a3 size:(CGSize)a4 context:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  TSDMetalTextureRenderer *v11;
  TSDMetalTextureRenderer *v12;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TSDMetalTextureRenderer;
  v11 = -[TSDMetalTextureRenderer init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_metalContext, a5);
    v12->_size.width = width;
    v12->_size.height = height;
    v12->_opacity = 1.0;
    -[TSDMetalTextureRenderer setTextures:](v12, "setTextures:", v9);
    -[TSDMetalTextureRenderer p_setupShader](v12, "p_setupShader");
  }

  return v12;
}

- (void)setTextures:(id)a3
{
  objc_storeStrong((id *)&self->_textures, a3);
  -[TSDMetalTextureRenderer p_generateValuesAndBuffers](self, "p_generateValuesAndBuffers");
}

- (void)setShouldDrawOffscreenPass:(BOOL)a3
{
  self->_shouldDrawOffscreenPass = a3;
  if (a3)
    -[TSDMetalTextureRenderer p_setupOffscreenPass](self, "p_setupOffscreenPass");
  -[TSDMetalTextureRenderer p_generateValuesAndBuffers](self, "p_generateValuesAndBuffers");
}

- (void)p_generateValuesAndBuffers
{
  NSMutableArray *v3;
  NSMutableArray *drawValues;
  NSArray *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  CGFloat v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  NSArray *dataBuffers;
  __int128 v41;
  CATransform3D v42;
  CATransform3D v43;
  CATransform3D v44;
  __int128 v45;
  __int128 v46;
  id v47;
  CATransform3D v48;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_textures, "count"));
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  drawValues = self->_drawValues;
  self->_drawValues = v3;

  memset(&v48, 0, sizeof(v48));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_textures, "count", TSDTransform3DMakeOrtho((uint64_t)&v48, 0.0, self->_size.width, 0.0, self->_size.height, -1.0, 1.0)));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_textures, "count"))
  {
    v6 = 0;
    v7 = *MEMORY[0x24BEB3F48];
    v8 = *(double *)(MEMORY[0x24BEB3F48] + 8);
    v9 = *(double *)(MEMORY[0x24BEB3F48] + 16);
    v10 = *(double *)(MEMORY[0x24BEB3F48] + 24);
    __asm { FMOV            V0.2D, #1.0 }
    v41 = _Q0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_textures, "objectAtIndexedSubscript:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "conformsToProtocol:", &unk_254FD9778);

      if ((v17 & 1) != 0)
      {
        v46 = 0uLL;
        v44 = v48;
        v45 = v41;
        v47 = 0;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v44, "{?={CATransform3D=dddddddddddddddd}ddB@@}");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray setObject:atIndexedSubscript:](self->_drawValues, "setObject:atIndexedSubscript:", v18, v6);

        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray setObject:atIndexedSubscript:](v5, "setObject:atIndexedSubscript:", v19, v6);
      }
      else
      {
        -[NSArray objectAtIndexedSubscript:](self->_textures, "objectAtIndexedSubscript:", v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "frameOnCanvas");
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;

        v47 = 0;
        v45 = 0u;
        v46 = 0u;
        v44 = v48;
        -[NSArray objectAtIndexedSubscript:](self->_textures, "objectAtIndexedSubscript:", v6);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "textureOpacity");
        *(_QWORD *)&v45 = v30;
        *((_QWORD *)&v45 + 1) = 0x3FF0000000000000;
        LOBYTE(v46) = 0;
        *((_QWORD *)&v46 + 1) = 0;
        v47 = 0;

        if (self->_shouldDrawOffscreenPass)
        {
          v31 = self->_size.height - v24 - v28;
          v42 = v48;
          CATransform3DTranslate(&v43, &v42, v22, v31, 0.0);
          v44 = v43;
          -[NSArray objectAtIndexedSubscript:](self->_textures, "objectAtIndexedSubscript:", v6);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "frame");
          TSURectWithSize();
          v22 = v33;
          v35 = v34;
          v26 = v36;
          v28 = v37;

        }
        else
        {
          v35 = self->_size.height - v24 - v28;
        }
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v44, "{?={CATransform3D=dddddddddddddddd}ddB@@}");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray setObject:atIndexedSubscript:](self->_drawValues, "setObject:atIndexedSubscript:", v38, v6);

        -[TSDMetalContext device](self->_metalContext, "device");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:device:", v19, v22, v35, v26, v28, v7, v8, v9, v10, 0x4014000000000000, 0x4014000000000000);
        -[NSArray setObject:atIndexedSubscript:](v5, "setObject:atIndexedSubscript:", v39, v6);

      }
      ++v6;
    }
    while (v6 < -[NSArray count](self->_textures, "count"));
  }
  dataBuffers = self->_dataBuffers;
  self->_dataBuffers = v5;

}

- (void)p_setupShader
{
  TSDMetalShader *v3;
  void *v4;
  TSDMetalShader *v5;
  TSDMetalShader *shader;
  id v7;

  if (!self->_shader)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDDD6A8]);
    objc_msgSend(v7, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
    objc_msgSend(v7, "setBlendingEnabled:", 1);
    objc_msgSend(v7, "setRgbBlendOperation:", 0);
    objc_msgSend(v7, "setAlphaBlendOperation:", 0);
    objc_msgSend(v7, "setSourceRGBBlendFactor:", 1);
    objc_msgSend(v7, "setSourceAlphaBlendFactor:", 1);
    objc_msgSend(v7, "setDestinationRGBBlendFactor:", 5);
    objc_msgSend(v7, "setDestinationAlphaBlendFactor:", 5);
    v3 = [TSDMetalShader alloc];
    -[TSDMetalContext device](self->_metalContext, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TSDMetalShader initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:](v3, "initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:", v4, v7);
    shader = self->_shader;
    self->_shader = v5;

  }
}

- (void)p_setupBlendingShader
{
  TSDMetalShader *v3;
  void *v4;
  TSDMetalShader *v5;
  TSDMetalShader *blendingShader;
  id v7;

  if (!self->_blendingShader)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDDD6A8]);
    objc_msgSend(v7, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
    objc_msgSend(v7, "setBlendingEnabled:", 1);
    objc_msgSend(v7, "setRgbBlendOperation:", 0);
    objc_msgSend(v7, "setAlphaBlendOperation:", 0);
    objc_msgSend(v7, "setSourceRGBBlendFactor:", 1);
    objc_msgSend(v7, "setSourceAlphaBlendFactor:", 1);
    objc_msgSend(v7, "setDestinationRGBBlendFactor:", 5);
    objc_msgSend(v7, "setDestinationAlphaBlendFactor:", 5);
    v3 = [TSDMetalShader alloc];
    -[TSDMetalContext device](self->_metalContext, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TSDMetalShader initDefaultBlendShaderWithDevice:colorAttachment:velocityAttachment:motionBlur:](v3, "initDefaultBlendShaderWithDevice:colorAttachment:velocityAttachment:motionBlur:", v4, v7, 0, 0);
    blendingShader = self->_blendingShader;
    self->_blendingShader = v5;

  }
}

- (void)p_setupOffscreenPass
{
  TSDMetalRenderTarget *v3;
  TSDMetalRenderTarget *renderTarget;
  double width;
  double height;
  TSDMTLDataBuffer *v7;
  TSDMTLDataBuffer *encodingDataBuffer;
  id v9;

  if (!self->_renderTarget)
  {
    v3 = -[TSDMetalRenderTarget initWithSize:metalContext:]([TSDMetalRenderTarget alloc], "initWithSize:metalContext:", self->_metalContext, self->_size.width, self->_size.height);
    renderTarget = self->_renderTarget;
    self->_renderTarget = v3;

    width = self->_size.width;
    height = self->_size.height;
    -[TSDMetalContext device](self->_metalContext, "device");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:device:", v9, 0.0, 0.0, width, height, *MEMORY[0x24BEB3F48], *(double *)(MEMORY[0x24BEB3F48] + 8), *(double *)(MEMORY[0x24BEB3F48] + 16), *(double *)(MEMORY[0x24BEB3F48] + 24), 0x4014000000000000, 0x4014000000000000);
    encodingDataBuffer = self->_encodingDataBuffer;
    self->_encodingDataBuffer = v7;

  }
}

- (void)drawWithEncoder:(id)a3 andContext:(id)a4 atPercent:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  double v16;
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
  void *v29;
  void *v30;
  unint64_t i;
  void *v32;
  void *v33;
  char v34;
  double opacity;
  double v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  float v46;
  float v47;
  void *v48;
  void *v49;
  double v50;
  float v51;
  void *v52;
  void *v53;
  TSDMetalRenderTarget *renderTarget;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  _DWORD v72[2];
  _OWORD v73[4];
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  double v82;
  double v83;
  unsigned __int8 v84;
  id v85;
  id v86;

  v8 = a3;
  v9 = a4;
  if (!self->_shader)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalTextureRenderer drawWithEncoder:andContext:atPercent:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalTextureRenderer.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 155, CFSTR("invalid nil value for '%s'"), "_shader");

  }
  v13 = v8;
  if (-[NSArray count](self->_textures, "count"))
  {
    v14 = 0;
    while (1)
    {
      v85 = 0;
      v86 = 0;
      -[NSMutableArray objectAtIndexedSubscript:](self->_drawValues, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "getValue:", &v74);

      v16 = v82;
      if (v16 > 0.0)
        break;
      if (++v14 >= -[NSArray count](self->_textures, "count"))
        goto LABEL_7;
    }
    v63 = v13;
    if (self->_shouldDrawOffscreenPass)
    {
      objc_msgSend(v9, "commandQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "commandBuffer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[TSDMetalRenderTarget passDescriptor](self->_renderTarget, "passDescriptor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "renderCommandEncoderWithDescriptor:", v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalTextureRenderer drawWithEncoder:andContext:atPercent:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalTextureRenderer.m");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, v24, 175, CFSTR("invalid nil value for '%s'"), "renderEncoder");

      }
      if (!self->_renderTarget)
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalTextureRenderer drawWithEncoder:andContext:atPercent:]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalTextureRenderer.m");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 176, CFSTR("invalid nil value for '%s'"), "_renderTarget");

      }
      v62 = v20;
      if (!self->_encodingDataBuffer)
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalTextureRenderer drawWithEncoder:andContext:atPercent:]");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalTextureRenderer.m");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, v30, 177, CFSTR("invalid nil value for '%s'"), "_encodingDataBuffer");

      }
    }
    else
    {
      v62 = 0;
      v18 = v13;
    }
    if (-[NSArray count](self->_textures, "count"))
    {
      for (i = 0; i < -[NSArray count](self->_textures, "count"); ++i)
      {
        v85 = 0;
        v86 = 0;
        -[NSMutableArray objectAtIndexedSubscript:](self->_drawValues, "objectAtIndexedSubscript:", i);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "getValue:", &v74);

        objc_msgSend(v18, "setCullMode:", 2 * v84);
        -[NSArray objectAtIndexedSubscript:](self->_textures, "objectAtIndexedSubscript:", i);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "conformsToProtocol:", &unk_254FD9778);

        if ((v34 & 1) != 0)
        {
          opacity = 1.0;
          if (!self->_shouldDrawOffscreenPass)
            opacity = self->_opacity;
          v36 = v82;
          -[NSArray objectAtIndexedSubscript:](self->_textures, "objectAtIndexedSubscript:", i);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setOpacity:", v36 * opacity);

          -[NSArray objectAtIndexedSubscript:](self->_textures, "objectAtIndexedSubscript:", i);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_opt_respondsToSelector();

          if ((v39 & 1) == 0)
            goto LABEL_35;
          -[NSArray objectAtIndexedSubscript:](self->_textures, "objectAtIndexedSubscript:", i);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "renderEffectAtPercent:atBufferIndex:withEncoder:", objc_msgSend(v9, "currentBuffer"), v18, a5);
        }
        else
        {
          v73[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v74), v75);
          v73[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v76), v77);
          v73[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v78), v79);
          v73[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v80), v81);
          if (v86)
          {
            if (!self->_blendingShader)
            {
              v41 = v9;
              objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalTextureRenderer drawWithEncoder:andContext:atPercent:]");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalTextureRenderer.m");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, v44, 202, CFSTR("invalid nil value for '%s'"), "_blendingShader");

              v9 = v41;
            }
            v45 = 1.0;
            if (!self->_shouldDrawOffscreenPass)
              v45 = self->_opacity;
            v46 = v82 * v45;
            v47 = v83;
            *(float *)v72 = v46;
            *(float *)&v72[1] = v47;
            if (v46 <= 0.0)
              goto LABEL_35;
            objc_msgSend(v85, "metalTexture");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setFragmentTexture:atIndex:", v48, 0);

            objc_msgSend(v86, "metalTexture");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setFragmentTexture:atIndex:", v49, 1);

            -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_blendingShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v18, v73, v72);
            -[NSArray objectAtIndexedSubscript:](self->_dataBuffers, "objectAtIndexedSubscript:", i);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "drawWithEncoder:atIndex:", v18, -[TSDMetalShader bufferIndex](self->_blendingShader, "bufferIndex"));
          }
          else
          {
            v50 = 1.0;
            if (!self->_shouldDrawOffscreenPass)
              v50 = self->_opacity;
            v51 = v82 * v50;
            *(float *)v72 = v51;
            if (v51 <= 0.0)
              goto LABEL_35;
            -[NSArray objectAtIndexedSubscript:](self->_textures, "objectAtIndexedSubscript:", i);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "metalTexture");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setFragmentTexture:atIndex:", v53, 0);

            -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_shader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v18, v73, v72);
            -[NSArray objectAtIndexedSubscript:](self->_dataBuffers, "objectAtIndexedSubscript:", i);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "drawWithEncoder:atIndex:", v18, -[TSDMetalShader bufferIndex](self->_shader, "bufferIndex"));
          }
        }

LABEL_35:
      }
    }
    if (self->_shouldDrawOffscreenPass)
    {
      objc_msgSend(v18, "endEncoding");
      v17 = v62;
      objc_msgSend(v62, "commit");
      renderTarget = self->_renderTarget;
      if (renderTarget)
      {
        -[TSDMetalRenderTarget orthoProjectionWithVerticalFlip:](renderTarget, "orthoProjectionWithVerticalFlip:", 0);
        renderTarget = self->_renderTarget;
        v55 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v70), v71);
        v56 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v68), v69);
        v57 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v66), v67);
        v58 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v64), v65);
      }
      else
      {
        v58 = 0uLL;
        v57 = 0uLL;
        v56 = 0uLL;
        v55 = 0uLL;
      }
      v74 = (float64x2_t)v58;
      v75 = (float64x2_t)v57;
      v76 = (float64x2_t)v56;
      v77 = (float64x2_t)v55;
      v59 = self->_opacity;
      *(float *)v73 = v59;
      -[TSDMetalRenderTarget textures](renderTarget, "textures");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "firstObject");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v63;
      objc_msgSend(v63, "setFragmentTexture:atIndex:", v61, 0);

      -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_shader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v63, &v74, v73);
      -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_encodingDataBuffer, "drawWithEncoder:atIndex:", v63, -[TSDMetalShader bufferIndex](self->_shader, "bufferIndex"));
    }
    else
    {
      v17 = v62;
      v13 = v63;
    }
  }
  else
  {
LABEL_7:
    v17 = 0;
    v18 = v13;
  }

}

- (void)updateWithTexture:(id)a3 opacity:(double)a4
{
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  void *v10;
  _BYTE v11[128];
  double v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = -[NSArray indexOfObject:](self->_textures, "indexOfObject:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    v13 = 0;
    v14 = 0;
    -[NSMutableArray objectAtIndexedSubscript:](self->_drawValues, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getValue:", v11);

    v12 = a4;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v11, "{?={CATransform3D=dddddddddddddddd}ddB@@}");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](self->_drawValues, "setObject:atIndexedSubscript:", v10, v8);

  }
}

- (void)updateWithTexture:(id)a3 transform:(CATransform3D *)a4 opacity:(double)a5 cullBackFace:(BOOL)a6
{
  id v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  _OWORD v19[8];
  double v20;
  BOOL v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = -[NSArray indexOfObject:](self->_textures, "indexOfObject:", v10);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v11;
    v22 = 0;
    v23 = 0;
    -[NSMutableArray objectAtIndexedSubscript:](self->_drawValues, "objectAtIndexedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getValue:", v19);

    v14 = *(_OWORD *)&a4->m33;
    v19[4] = *(_OWORD *)&a4->m31;
    v19[5] = v14;
    v15 = *(_OWORD *)&a4->m43;
    v19[6] = *(_OWORD *)&a4->m41;
    v19[7] = v15;
    v16 = *(_OWORD *)&a4->m13;
    v19[0] = *(_OWORD *)&a4->m11;
    v19[1] = v16;
    v17 = *(_OWORD *)&a4->m23;
    v19[2] = *(_OWORD *)&a4->m21;
    v19[3] = v17;
    v20 = a5;
    v21 = a6;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v19, "{?={CATransform3D=dddddddddddddddd}ddB@@}");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](self->_drawValues, "setObject:atIndexedSubscript:", v18, v12);

  }
}

- (void)updateWithTexture:(id)a3 blendPercent:(double)a4 outgoingTexture:(id)a5 incomingTexture:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  void *v16;
  _QWORD v17[19];
  id v18;
  id v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = -[NSArray indexOfObject:](self->_textures, "indexOfObject:", v10);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v13;
    v18 = 0;
    v19 = 0;
    -[NSMutableArray objectAtIndexedSubscript:](self->_drawValues, "objectAtIndexedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getValue:", v17);

    *(double *)&v17[17] = a4;
    objc_storeStrong(&v18, a5);
    objc_storeStrong(&v19, a6);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v17, "{?={CATransform3D=dddddddddddddddd}ddB@@}");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](self->_drawValues, "setObject:atIndexedSubscript:", v16, v14);

    -[TSDMetalTextureRenderer p_setupBlendingShader](self, "p_setupBlendingShader");
  }

}

- (NSArray)textures
{
  return self->_textures;
}

- (NSArray)dataBuffers
{
  return self->_dataBuffers;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (BOOL)shouldDrawOffscreenPass
{
  return self->_shouldDrawOffscreenPass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataBuffers, 0);
  objc_storeStrong((id *)&self->_textures, 0);
  objc_storeStrong((id *)&self->_renderTarget, 0);
  objc_storeStrong((id *)&self->_encodingDataBuffer, 0);
  objc_storeStrong((id *)&self->_blendingShader, 0);
  objc_storeStrong((id *)&self->_shader, 0);
  objc_storeStrong((id *)&self->_drawValues, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end

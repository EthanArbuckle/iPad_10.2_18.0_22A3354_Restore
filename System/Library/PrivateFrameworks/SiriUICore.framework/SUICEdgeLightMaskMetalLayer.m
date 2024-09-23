@implementation SUICEdgeLightMaskMetalLayer

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**offCompletion)(void);
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  offCompletion = (void (**)(void))self->_offCompletion;
  if (offCompletion)
  {
    offCompletion[2]();
    v6 = self->_offCompletion;
    self->_offCompletion = 0;

  }
  -[SUICEdgeLightMaskMetalLayer _invalidate](self, "_invalidate");
  -[SUICEdgeLightMaskMetalLayer superlayer](self, "superlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[SUICEdgeLightMaskMetalLayer removeFromSuperlayer](self, "removeFromSuperlayer");

}

- (void)setBurstStartPosition:(unint64_t)a3
{
  self->_shouldBurst = 1;
  _D0 = 0x3FC0000000000000;
  switch(a3)
  {
    case 0uLL:
      self->_shouldBurst = 0;
      _D0 = 0;
      goto LABEL_8;
    case 1uLL:
      _D0 = *(_QWORD *)self->_buttonCenter;
      goto LABEL_8;
    case 2uLL:
      goto LABEL_8;
    case 3uLL:
      _D0 = 3217031168;
      goto LABEL_8;
    case 4uLL:
      _D0 = 1069547520;
      goto LABEL_8;
    case 5uLL:
      _D0 = 0x3F400000BF400000;
      goto LABEL_8;
    case 6uLL:
      __asm { FMOV            V0.2S, #0.75; jumptable 00000001A375DE2C case 6 }
LABEL_8:
      *(_QWORD *)self->_anon_a0 = _D0;
      goto LABEL_9;
    case 7uLL:
      return;
    default:
LABEL_9:
      self->_burstModeHasBeenSet = 1;
      self->_burstAnimationType = a3;
      if (!self->_paused)
        -[SUICEdgeLightMaskMetalLayer animateOn](self, "animateOn", *(double *)&_D0);
      return;
  }
}

- (void)setBurstStartPositionCustom:(CGPoint)a3
{
  CGFloat y;

  self->_shouldBurst = 1;
  y = a3.y;
  *(float32x2_t *)self->_anon_a0 = vcvt_f32_f64((float64x2_t)a3);
  self->_burstModeHasBeenSet = 1;
  self->_burstAnimationType = 7;
  if (!self->_paused)
    -[SUICEdgeLightMaskMetalLayer animateOn](self, "animateOn");
}

- (void)_commonInitWithCommandQueue:(id)a3 fullBorder:(BOOL)a4
{
  id v6;
  id *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  MTLDevice *v11;
  MTLDevice *device;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  SUICEdgeLightMaskMetalLayer *baseLayer;
  MTLTexture *v24;
  MTLTexture *noiseTexture;
  uint8_t v26[16];

  v6 = a3;
  AFLogInitIfNeeded();
  v7 = (id *)MEMORY[0x1E0CFE6B8];
  v8 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0CFE6B8]);
  v9 = *v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A3752000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "EdgeLightMaskLayerFirstFrame", (const char *)&unk_1A380577F, v26, 2u);
  }

  self->_firstFrameSignpost = v8;
  self->_firstFrame = 1;
  v11 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v11;

  if (!self->_device)
  {
    v13 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SUICEdgeLightMaskMetalLayer _commonInitWithCommandQueue:fullBorder:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  v21 = v6;
  if (!v6)
    v21 = (void *)-[MTLDevice newCommandQueue](self->_device, "newCommandQueue");
  objc_storeStrong((id *)&self->_commandQueue, v21);
  if (!v6)

  self->_fullBorder = a4;
  self->_animating = 0;
  self->_burstModeHasBeenSet = 0;
  self->_paused = 1;
  self->_customFlameScale = 1.0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  self->_idiom = objc_msgSend(v22, "userInterfaceIdiom");

  *(_WORD *)&self->_anon_b0[22] = 0;
  self->_volumeLinearPowerLevel = 0.0;
  self->_minPowerLevel = 0.0;
  -[CAMetalLayer setName:](self, "setName:", CFSTR("EdgeLightMaskLayer"));
  -[SUICEdgeLightMaskMetalLayer setOpaque:](self, "setOpaque:", 0);
  -[CAMetalLayer setDevice:](self, "setDevice:", self->_device);
  -[SUICEdgeLightMaskMetalLayer setScreen:](self, "setScreen:", 0);
  -[SUICEdgeLightMaskMetalLayer _loadMetalPipelines](self, "_loadMetalPipelines");
  -[SUICEdgeLightMaskMetalLayer _loadMetalState](self, "_loadMetalState");
  baseLayer = self->_baseLayer;
  if (baseLayer)
    -[SUICEdgeLightMaskMetalLayer _getNoiseTexture](baseLayer, "_getNoiseTexture");
  else
    +[SUICIntelligentLightLayer createNoiseTextureWithDevice:commandQueue:](SUICIntelligentLightLayer, "createNoiseTextureWithDevice:commandQueue:", self->_device, self->_commandQueue);
  v24 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  noiseTexture = self->_noiseTexture;
  self->_noiseTexture = v24;

  -[SUICEdgeLightMaskMetalLayer _updateForUIIdiom](self, "_updateForUIIdiom");
}

- (SUICEdgeLightMaskMetalLayer)initWithBaseEdgeLightLayer:(id)a3
{
  id v5;
  SUICEdgeLightMaskMetalLayer *v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUICEdgeLightMaskMetalLayer;
  v6 = -[CAMetalLayer init](&v9, sel_init);
  if (v6 == self)
  {
    objc_storeStrong((id *)&self->_baseLayer, a3);
    objc_msgSend(v5, "_getCommandQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUICEdgeLightMaskMetalLayer _commonInitWithCommandQueue:fullBorder:](self, "_commonInitWithCommandQueue:fullBorder:", v7, 1);

  }
  return v6;
}

- (SUICEdgeLightMaskMetalLayer)initWithCommandQueue:(id)a3
{
  id v4;
  SUICEdgeLightMaskMetalLayer *v5;
  SUICEdgeLightMaskMetalLayer *baseLayer;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUICEdgeLightMaskMetalLayer;
  v5 = -[CAMetalLayer init](&v8, sel_init);
  if (v5 == self)
  {
    baseLayer = self->_baseLayer;
    self->_baseLayer = 0;

    -[SUICEdgeLightMaskMetalLayer _commonInitWithCommandQueue:fullBorder:](self, "_commonInitWithCommandQueue:fullBorder:", v4, 1);
  }

  return v5;
}

- (SUICEdgeLightMaskMetalLayer)initWithFullBorder:(BOOL)a3
{
  _BOOL8 v3;
  SUICEdgeLightMaskMetalLayer *v5;
  SUICEdgeLightMaskMetalLayer *baseLayer;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUICEdgeLightMaskMetalLayer;
  v5 = -[CAMetalLayer init](&v8, sel_init);
  if (v5 == self)
  {
    baseLayer = self->_baseLayer;
    self->_baseLayer = 0;

    -[SUICEdgeLightMaskMetalLayer _commonInitWithCommandQueue:fullBorder:](self, "_commonInitWithCommandQueue:fullBorder:", 0, v3);
  }
  return v5;
}

- (SUICEdgeLightMaskMetalLayer)init
{
  SUICEdgeLightMaskMetalLayer *v3;
  SUICEdgeLightMaskMetalLayer *baseLayer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUICEdgeLightMaskMetalLayer;
  v3 = -[CAMetalLayer init](&v6, sel_init);
  if (v3 == self)
  {
    baseLayer = self->_baseLayer;
    self->_baseLayer = 0;

    -[SUICEdgeLightMaskMetalLayer _commonInitWithCommandQueue:fullBorder:](self, "_commonInitWithCommandQueue:fullBorder:", 0, 1);
  }
  return v3;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  objc_super v6;

  height = a3.size.height;
  width = a3.size.width;
  v6.receiver = self;
  v6.super_class = (Class)SUICEdgeLightMaskMetalLayer;
  -[SUICEdgeLightMaskMetalLayer setBounds:](&v6, sel_setBounds_, a3.origin.x, a3.origin.y);
  if (width != 0.0 && height != 0.0)
    -[SUICEdgeLightMaskMetalLayer _updateMetalRatios:](self, "_updateMetalRatios:", width, height);
}

- (id)_getCommandQueue
{
  return self->_commandQueue;
}

- (id)_getNoiseTexture
{
  return self->_noiseTexture;
}

- (void)_loadMetalPipelines
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s #edgeLight Unable to locate archive.metallib", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_loadMetalState
{
  MTLRenderPassDescriptor *v3;
  MTLRenderPassDescriptor *renderPassDesc;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v3 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
  renderPassDesc = self->_renderPassDesc;
  self->_renderPassDesc = v3;

  -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDesc, "colorAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLoadAction:", 0);
  objc_msgSend(v6, "setStoreAction:", 1);

}

- (void)_updateMetalRatios:(CGSize)a3
{
  float height;
  float v4;
  double v5;
  double v6;
  double v7;

  *(float *)&a3.width = a3.width;
  height = a3.height;
  v4 = 1.0;
  if (*(float *)&a3.width != 0.0)
    v4 = height / *(float *)&a3.width;
  *((float *)&a3.width + 1) = height;
  *(CGFloat *)self->_anon_b0 = a3.width;
  *(float *)&self->_anon_b0[8] = v4;
  *(_QWORD *)&self->_anon_80[8] = 0;
  LODWORD(v5) = 1056964608;
  HIDWORD(v6) = 1056964608;
  if (*(float *)&a3.width >= height)
  {
    *((float *)&v5 + 1) = (float)(height / *(float *)&a3.width) * 0.5;
    v7 = v5;
  }
  else
  {
    *(float *)&v6 = (float)(*(float *)&a3.width / height) * 0.5;
    v7 = v6;
  }
  *(double *)self->_anon_80 = v7;
  -[SUICEdgeLightMaskMetalLayer _updateForUIIdiom](self, "_updateForUIIdiom");
}

- (void)_drawFrame:(id)a3
{
  id v4;
  double v5;
  float v6;
  void *v8;
  double v9;
  double v10;
  __int128 v11;
  float volumeLinearPowerLevel;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float value;
  long double v20;
  float32_t v21;
  float32x4_t v22;
  float32x4_t v23;
  uint64_t v24;
  float32x4_t v25;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  _QWORD v47[5];

  v4 = a3;
  -[NSDate timeIntervalSinceNow](self->_burstStartDate, "timeIntervalSinceNow");
  v6 = v5;
  if (v6 <= 0.0)
  {
    if (v6 >= -10.0)
      _S9 = -v6;
    else
      _S9 = 10.0;
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "targetTimestamp");
      v10 = v9;
      objc_msgSend(v4, "timestamp");
      *(double *)&v11 = v10 - *(double *)&v11;
      *(float *)&v11 = *(double *)&v11;
      volumeLinearPowerLevel = self->_volumeLinearPowerLevel;
      if (self->_minPowerLevel >= volumeLinearPowerLevel)
        volumeLinearPowerLevel = self->_minPowerLevel;
      self->_physics.common.micPowerLevel = volumeLinearPowerLevel;
      v46 = v11;
      SUICLightPhysics_UpdatePhysics((uint64_t)&self->_physics, *(float *)&v11);
      -[CAMetalLayer nextDrawable](self, "nextDrawable");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "texture");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDesc, "colorAttachments");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTexture:", v15);

        objc_msgSend(v8, "renderCommandEncoderWithDescriptor:", self->_renderPassDesc);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        value = self->_physics.volumeSpring.value;
        v20 = value;
        v21 = value * 0.25 + 0.06;
        v22.i64[0] = 0xBC3439583BE56042;
        v22.f32[2] = v21;
        v23 = vmlaq_n_f32(*(float32x4_t *)&self->_anon_80[16], v22, *(float *)&v46);
        *(float32x4_t *)&self->_anon_80[16] = v23;
        if (v23.f32[0] > 1.0)
        {
          v22.f32[0] = v23.f32[0] + -1.0;
          HIDWORD(v24) = v23.i32[1];
          *(float *)&v24 = v23.f32[0] + -1.0;
          v22.i32[1] = v23.i32[1];
          v22.i32[2] = v23.i32[2];
          *(_DWORD *)&self->_anon_80[24] = v23.i32[2];
          *(_QWORD *)&self->_anon_80[16] = v24;
          v23 = v22;
        }
        if (v23.f32[1] < 0.0)
        {
          v25 = v23;
          v25.f32[1] = v23.f32[1] + 1.0;
          *(_QWORD *)&self->_anon_80[16] = v25.i64[0];
          v25.i32[2] = v23.i32[2];
          *(_DWORD *)&self->_anon_80[24] = v23.i32[2];
          v23 = v25;
        }
        if (v23.f32[2] > 1.0)
        {
          *(float *)&self->_anon_80[24] = v23.f32[2] + -1.0;
          *(_QWORD *)&self->_anon_80[16] = v23.i64[0];
        }
        _H2 = *(_WORD *)&self->_anon_a0[12];
        __asm { FCVT            D2, H2 }
        _D1 = _D2 + (float)((float)(value * value) * *(float *)&v46) * -0.1;
        __asm
        {
          FCVT            H1, D1
          FCVT            D2, H1
        }
        _D2 = _D2 + 6.28318531;
        __asm
        {
          FCVT            H2, D2
          FCVT            S3, H1
        }
        if (_S3 < 0.0)
          *(float *)&_D1 = *(float *)&_D2;
        *(_WORD *)&self->_anon_a0[12] = LOWORD(_D1);
        __asm { FCVT            H1, S9 }
        *(_WORD *)&self->_anon_a0[10] = _H1;
        _D0 = pow(v20, 0.3);
        __asm { FCVT            H0, D0 }
        *(_WORD *)&self->_anon_a0[8] = LOWORD(_D0);
        objc_msgSend(v18, "setLabel:", CFSTR("EdgeLight"));
        objc_msgSend(v18, "setRenderPipelineState:", self->_renderPipeline);
        objc_msgSend(v18, "setVertexBytes:length:atIndex:", self->_anon_80, 32, 0);
        objc_msgSend(v18, "setFragmentTexture:atIndex:", self->_noiseTexture, 0);
        objc_msgSend(v18, "setFragmentBytes:length:atIndex:", self->_anon_a0, 16, 0);
        objc_msgSend(v18, "setFragmentBytes:length:atIndex:", self->_anon_b0, 24, 1);
        objc_msgSend(v18, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 3);
        objc_msgSend(v18, "endEncoding");
        objc_msgSend(v8, "presentDrawable:", v14);

      }
      if (self->_firstFrame)
      {
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __42__SUICEdgeLightMaskMetalLayer__drawFrame___block_invoke;
        v47[3] = &unk_1E4A54F98;
        v47[4] = self;
        objc_msgSend(v8, "addCompletedHandler:", v47);
        self->_firstFrame = 0;
      }
      objc_msgSend(v8, "commit", v46);

    }
    else
    {
      v38 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
        -[SUICEdgeLightMaskMetalLayer _drawFrame:].cold.1(v38, v39, v40, v41, v42, v43, v44, v45);
    }

  }
}

void __42__SUICEdgeLightMaskMetalLayer__drawFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "GPUStartTime");
  v5 = v4;
  objc_msgSend(v3, "GPUEndTime");
  v7 = v6;

  v8 = (id)*MEMORY[0x1E0CFE6B8];
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 608);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v14 = 134217984;
    v15 = v7 - v5;
    _os_signpost_emit_with_name_impl(&dword_1A3752000, v9, OS_SIGNPOST_INTERVAL_END, v10, "EdgeLightMaskLayerFirstFrame", "GPU time:%f", (uint8_t *)&v14, 0xCu);
  }

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  if (v11)
  {
    (*(void (**)(void))(v11 + 16))();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 120);
    *(_QWORD *)(v12 + 120) = 0;

  }
}

- (void)_updateForUIIdiom
{
  unsigned __int8 *anon_b0;
  float32x2_t v4;
  int64_t idiom;
  void *v6;
  float32x2_t v7;
  int8x8_t v14;
  uint64_t v15;
  float32x2_t v16;
  uint64_t v17;
  int32x2_t v18;
  unint64_t v19;
  int8x8_t v20;
  int8x8_t v21;
  int8x8_t v22;
  float32x2_t v23;
  float32x2_t v24;

  anon_b0 = self->_anon_b0;
  v4 = *(float32x2_t *)self->_anon_b0;
  *(_QWORD *)self->_buttonCenter = 0;
  idiom = self->_idiom;
  if (idiom == -1)
  {
    v23 = v4;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    idiom = objc_msgSend(v6, "userInterfaceIdiom");

    v4 = v23;
  }
  v7 = (float32x2_t)vdup_lane_s32((int32x2_t)v4, 1);
  if (idiom == 1)
  {
    *(_QWORD *)self->_buttonCenter = 0xBF8666663F000000;
    *(int8x8_t *)(anon_b0 + 12) = vbsl_s8((int8x8_t)vdup_lane_s32(vcge_f32(v7, v4), 0), (int8x8_t)0xC14000003D4CCCCDLL, (int8x8_t)0xC1C000003CF5C28FLL);
    _D0 = 2.72 / self->_customFlameScale;
    __asm { FCVT            H0, D0 }
    *((_WORD *)anon_b0 + 10) = LOWORD(_D0);
    return;
  }
  _D0 = 1.0 / self->_customFlameScale;
  __asm { FCVT            H0, D0 }
  *((_WORD *)anon_b0 + 10) = LOWORD(_D0);
  if (idiom != 3)
  {
    v24 = v4;
    v15 = MGGetProductType();
    if (v15 > 2940697644)
    {
      v16 = v24;
      if (v15 <= 3819635029)
      {
        if (v15 != 2940697645)
        {
          v17 = 2941181571;
LABEL_14:
          if (v15 != v17)
            goto LABEL_25;
          goto LABEL_19;
        }
LABEL_18:
        v18 = vcge_f32(v7, v16);
        v19 = 0xBE851EB83F400000;
LABEL_20:
        *(_QWORD *)self->_buttonCenter = v19;
        v20 = (int8x8_t)vdup_lane_s32(v18, 0);
        v21 = (int8x8_t)0xC19000003DFAACDALL;
        v22 = (int8x8_t)0xC11000003E8D013BLL;
LABEL_27:
        v14 = vbsl_s8(v20, v22, v21);
        goto LABEL_28;
      }
      if (v15 == 4242862982)
      {
        *(_QWORD *)self->_buttonCenter = 0xBF6666663F733333;
        v20 = (int8x8_t)vdup_lane_s32(vcge_f32(v7, v24), 0);
        v21 = (int8x8_t)0xC18000003DF5C28FLL;
LABEL_26:
        v22 = (int8x8_t)0xC14000003E8A3D71;
        goto LABEL_27;
      }
      if (v15 == 3819635030)
      {
        *(_QWORD *)self->_buttonCenter = 0xBEB333333F400000;
        v14 = (int8x8_t)0xC0A000003F000000;
        goto LABEL_28;
      }
    }
    else
    {
      v16 = v24;
      if (v15 <= 2688879998)
      {
        if (v15 != 133314240)
        {
          v17 = 330877086;
          goto LABEL_14;
        }
        goto LABEL_18;
      }
      if (v15 == 2688879999)
      {
LABEL_19:
        v18 = vcge_f32(v7, v16);
        v19 = 0xBEA8F5C33F400000;
        goto LABEL_20;
      }
      if (v15 == 2795618603)
        goto LABEL_18;
    }
LABEL_25:
    *(_QWORD *)self->_buttonCenter = 0xBEB333333F400000;
    v20 = (int8x8_t)vdup_lane_s32(vcge_f32(v7, v16), 0);
    v21 = (int8x8_t)0xC1C000003DF5C28FLL;
    goto LABEL_26;
  }
  v14 = (int8x8_t)0xC1C000003D8F5C29;
LABEL_28:
  *(int8x8_t *)(anon_b0 + 12) = v14;
}

- (void)_invalidate
{
  SUICEdgeLightMaskMetalLayer *baseLayer;
  CADisplayLink *displayLink;
  MTLTexture *noiseTexture;

  baseLayer = self->_baseLayer;
  self->_baseLayer = 0;

  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  noiseTexture = self->_noiseTexture;
  self->_noiseTexture = 0;

}

- (void)_startScaleOutAnimation
{
  void *v3;
  double v4;
  id v5;
  id location;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDamping:", -0.22);
  LODWORD(v4) = 1045220557;
  objc_msgSend(v3, "setSpeed:", v4);
  objc_msgSend(v3, "setFromValue:", &unk_1E4A63118);
  objc_msgSend(v3, "setToValue:", &unk_1E4A63290);
  objc_msgSend(v3, "setRemovedOnCompletion:", 1);
  v5 = objc_initWeak(&location, self);
  objc_msgSend(v3, "setDelegate:", self);

  -[SUICEdgeLightMaskMetalLayer addAnimation:forKey:](self, "addAnimation:forKey:", v3, CFSTR("scale"));
  objc_destroyWeak(&location);

}

+ (BOOL)currentIdiomDefaultsToFullBorder
{
  return 1;
}

+ (void)prewarm
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s #edgeLight Failed to create command buffer skipping prewarm", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  self->_idiom = a3;
  -[SUICEdgeLightMaskMetalLayer _updateForUIIdiom](self, "_updateForUIIdiom");
}

- (void)setScreen:(id)a3
{
  id v4;
  CADisplayLink *displayLink;
  uint64_t v6;
  CADisplayLink *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CADisplayLink *v20;
  CADisplayLink *v21;
  CADisplayLink *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  CADisplayLink *v27;
  CADisplayLink *v28;
  CADisplayLink *v29;
  void *v30;

  v4 = a3;
  displayLink = self->_displayLink;
  if (displayLink)
  {
    v6 = -[CADisplayLink isPaused](displayLink, "isPaused");
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    v7 = self->_displayLink;
    self->_displayLink = 0;

    if (v4)
      goto LABEL_3;
  }
  else
  {
    v6 = 1;
    if (v4)
    {
LABEL_3:
      v8 = objc_msgSend(v4, "maximumFramesPerSecond");
      v9 = 1;
      v10 = 60;
      if (v8 <= 119)
      {
        if (v8 == 30)
        {
          v10 = 30;
          v11 = 30;
          goto LABEL_31;
        }
        v11 = 60;
        if (v8 != 60)
        {
LABEL_14:
          v24 = 240;
          if ((unint64_t)v8 >= 0x5A)
            v25 = 90;
          else
            v25 = v8;
          if ((unint64_t)v8 < 0x5A)
          {
            v26 = 10;
          }
          else
          {
            v24 = 90;
            v26 = 1;
          }
          if (v8 >= 24)
            v10 = v25;
          else
            v10 = 24;
          if (v8 >= 24)
            v11 = v24;
          else
            v11 = 240;
          if (v8 >= 24)
            v9 = v26;
          else
            v9 = 10;
        }
      }
      else
      {
        if (v8 == 120 || v8 == 240)
        {
          v11 = 60;
          goto LABEL_31;
        }
        v11 = 60;
        if (v8 != 300)
          goto LABEL_14;
      }
LABEL_31:
      if (v11 != self->_physics.common.physicsRate)
        SUICLightPhysics_Init((uint64_t)&self->_physics, v11, v9);
      self->_physics.common.maxPhysicsIterationsPerFrame = v9;
      objc_msgSend(v4, "displayLinkWithTarget:selector:", self, sel__drawFrame_);
      v27 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      v28 = self->_displayLink;
      self->_displayLink = v27;

      v22 = self->_displayLink;
      v23 = v10;
      goto LABEL_34;
    }
  }
  v12 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    -[SUICEdgeLightMaskMetalLayer setScreen:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  SUICLightPhysics_Init((uint64_t)&self->_physics, 60, 4);
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__drawFrame_);
  v20 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  v21 = self->_displayLink;
  self->_displayLink = v20;

  v22 = self->_displayLink;
  v23 = 60;
LABEL_34:
  -[CADisplayLink setPreferredFramesPerSecond:](v22, "setPreferredFramesPerSecond:", v23);
  v29 = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v29, "addToRunLoop:forMode:", v30, *MEMORY[0x1E0C99860]);

  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v6);
}

- (void)setMinimumPowerLevel:(float)a3
{
  self->_minPowerLevel = a3;
}

- (void)animateOn
{
  -[SUICEdgeLightMaskMetalLayer animateOnWithCompletion:](self, "animateOnWithCompletion:", 0);
}

- (void)animateOnWithCompletion:(id)a3
{
  void *v4;
  id onCompletion;
  double v6;
  NSDate *v7;
  NSDate *burstStartDate;

  v4 = (void *)MEMORY[0x1A8593D14](a3, a2);
  onCompletion = self->_onCompletion;
  self->_onCompletion = v4;

  if (self->_burstModeHasBeenSet)
  {
    if (!self->_animating)
    {
      self->_animating = 1;
      self->_firstFrame = 1;
      if (self->_shouldBurst)
      {
        v6 = 0.133328006;
        if (self->_burstAnimationType != 1)
          v6 = 0.0;
      }
      else
      {
        v6 = -10.0;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v6);
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
      burstStartDate = self->_burstStartDate;
      self->_burstStartDate = v7;

    }
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
  }
}

- (void)animateOffWithCompletion:(id)a3
{
  void *v4;
  id offCompletion;

  v4 = (void *)MEMORY[0x1A8593D14](a3, a2);
  offCompletion = self->_offCompletion;
  self->_offCompletion = v4;

  -[SUICEdgeLightMaskMetalLayer _startScaleOutAnimation](self, "_startScaleOutAnimation");
}

- (void)setPaused:(BOOL)a3
{
  _BOOL4 paused;

  paused = self->_paused;
  if (paused == a3)
  {
LABEL_4:
    if (paused)
      return;
    goto LABEL_5;
  }
  self->_paused = a3;
  if (a3)
  {
    -[SUICEdgeLightMaskMetalLayer _startScaleOutAnimation](self, "_startScaleOutAnimation");
    paused = self->_paused;
    goto LABEL_4;
  }
LABEL_5:
  -[SUICEdgeLightMaskMetalLayer animateOn](self, "animateOn");
}

- (void)setBurstOpacity:(float)_S0
{
  __asm { FCVT            H0, S0 }
  *(_WORD *)&self->_anon_b0[22] = _H0;
}

- (void)setFlameScale:(float)a3
{
  self->_customFlameScale = a3;
  -[SUICEdgeLightMaskMetalLayer _updateForUIIdiom](self, "_updateForUIIdiom");
}

- (void)setInputAveragePowerLevel:(float)a3 withPeakPowerLevel:(float)a4
{
  float v5;

  +[SUICAudioPowerLevelLinearConverter linearValueForInputPowerLevel:](SUICAudioPowerLevelLinearConverter, "linearValueForInputPowerLevel:");
  self->_volumeLinearPowerLevel = v5;
}

- (void)updateVolumeInputdB:(float)a3
{
  float v4;

  +[SUICAudioPowerLevelLinearConverter linearValueForInputPowerLevel:](SUICAudioPowerLevelLinearConverter, "linearValueForInputPowerLevel:");
  self->_volumeLinearPowerLevel = v4;
}

- (void)stopVolumeInput
{
  self->_volumeLinearPowerLevel = 0.0;
}

- (void)startReducedFramerateForPerformance
{
  __assert_rtn("-[SUICEdgeLightMaskMetalLayer startReducedFramerateForPerformance]", "SUICEdgeLightMaskMetalLayer.m", 718, "!\"Unknown physics rate\");
}

- (void)endReducedFramerateForPerformance
{
  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", self->_framesPerSecondBeforePerformanceOptimization);
  self->_physics.common.maxPhysicsIterationsPerFrame = self->_maxPhysicsIterationsBeforePerformanceOptimization;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onCompletion, 0);
  objc_storeStrong(&self->_offCompletion, 0);
  objc_storeStrong((id *)&self->_baseLayer, 0);
  objc_storeStrong((id *)&self->_renderPassDesc, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_noiseTexture, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_burstStartDate, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)_commonInitWithCommandQueue:(uint64_t)a3 fullBorder:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s Failed to get Metal device for GPU rendering", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_drawFrame:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s Failed to create command buffer, dropping frame", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setScreen:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s Siri Intelligent Light was set to a nil screen. Defaulting to backup values.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

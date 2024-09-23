@implementation SUICIntelligentLightLayer

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_commonInitWithScreen:(id)a3 commandQueue:(id)a4
{
  id v6;
  id v7;
  id *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v23[16];

  v6 = a3;
  v7 = a4;
  AFLogInitIfNeeded();
  v8 = (id *)MEMORY[0x1E0CFE6B8];
  v9 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0CFE6B8]);
  v10 = *v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A3752000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "IntelligentLightLayerFirstFrame", (const char *)&unk_1A380577F, v23, 2u);
  }

  self->_firstFrameSignpost = v9;
  v12 = MTLCreateSystemDefaultDevice();
  if (v12)
  {
    -[CAMetalLayer setDevice:](self, "setDevice:", v12);
    v13 = v7;
    if (!v7)
      v13 = (void *)objc_msgSend(v12, "newCommandQueue");
    objc_storeStrong((id *)&self->_commandQueue, v13);
    if (!v7)

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_idiom = objc_msgSend(v14, "userInterfaceIdiom");

    self->_volumeLinearPowerLevel = 0.0;
    self->_minPowerLevel = 0.0;
    *(float *)self->_anon_210 = (float)rand() * 4.6566e-10;
    *(float *)&self->_anon_210[4] = (float)rand() * 4.6566e-10;
    *(float *)&self->_anon_210[8] = (float)rand() * 4.6566e-10;
    -[SUICIntelligentLightLayer setOpaque:](self, "setOpaque:", 0);
    -[SUICIntelligentLightLayer setContentsDither:](self, "setContentsDither:", 0);
    self->_colorPalette = 101;
    -[SUICIntelligentLightLayer _loadMetalPipelines](self, "_loadMetalPipelines");
    -[SUICIntelligentLightLayer _loadMetalState](self, "_loadMetalState");
    self->_physics.common.physicsRate = 0;
    self->_physics.zoning = 0;
    self->_physics.zoning = self->_idiom == 1;
    -[SUICIntelligentLightLayer _updateScreen:](self, "_updateScreen:", v6);
    self->_firstFrame = 1;
  }
  else
  {
    v15 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SUICIntelligentLightLayer _commonInitWithScreen:commandQueue:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  }

}

- (SUICIntelligentLightLayer)initWithLayer:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    -[SUICIntelligentLightLayer initWithLayer:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  return 0;
}

- (SUICIntelligentLightLayer)initWithScreen:(id)a3 commandQueue:(id)a4
{
  id v6;
  id v7;
  SUICIntelligentLightLayer *v8;
  SUICIntelligentLightLayer *v9;
  SUICIntelligentLightLayer *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUICIntelligentLightLayer;
  v8 = -[CAMetalLayer init](&v12, sel_init);
  v9 = v8;
  if (!v8
    || (-[SUICIntelligentLightLayer _commonInitWithScreen:commandQueue:](v8, "_commonInitWithScreen:commandQueue:", v6, v7), -[CAMetalLayer device](v9, "device"), v10 = (SUICIntelligentLightLayer *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    v10 = v9;
  }

  return v10;
}

- (SUICIntelligentLightLayer)init
{
  SUICIntelligentLightLayer *v2;
  SUICIntelligentLightLayer *v3;
  SUICIntelligentLightLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUICIntelligentLightLayer;
  v2 = -[CAMetalLayer init](&v6, sel_init);
  v3 = v2;
  if (!v2
    || (-[SUICIntelligentLightLayer _commonInitWithScreen:commandQueue:](v2, "_commonInitWithScreen:commandQueue:", 0, 0), -[CAMetalLayer device](v3, "device"), v4 = (SUICIntelligentLightLayer *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    v4 = v3;
  }

  return v4;
}

+ (void)prewarm
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s #edgeLight Failed to create command buffer skipping prewarm", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setColorPalette:(unint64_t)a3
{
  if (self->_colorPalette != a3)
  {
    self->_colorPalette = a3;
    -[SUICIntelligentLightLayer _loadMetalPipelines](self, "_loadMetalPipelines");
  }
}

- (void)setScreen:(id)a3
{
  if (self->_screen != a3)
    -[SUICIntelligentLightLayer _updateScreen:](self, "_updateScreen:");
}

- (void)_updateScreen:(id)a3
{
  UIScreen *v4;
  CADisplayLink *displayLink;
  uint64_t v6;
  CADisplayLink *v7;
  os_log_t *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  CADisplayLink *v17;
  CADisplayLink *v18;
  CADisplayLink *v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CADisplayLink *v31;
  CADisplayLink *v32;
  CADisplayLink *v33;
  void *v34;
  int v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (UIScreen *)a3;
  displayLink = self->_displayLink;
  if (displayLink)
  {
    v6 = -[CADisplayLink isPaused](displayLink, "isPaused");
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    v7 = self->_displayLink;
    self->_displayLink = 0;

    if (v4)
      goto LABEL_9;
  }
  else
  {
    v6 = 1;
    if (v4)
      goto LABEL_9;
  }
  v8 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v9 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v35 = 136315138;
    v36 = "-[SUICIntelligentLightLayer _updateScreen:]";
    _os_log_impl(&dword_1A3752000, v9, OS_LOG_TYPE_DEFAULT, "%s Siri Intelligent Light was set to a nil screen. Defaulting to backup values.", (uint8_t *)&v35, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "_carScreen");
  v4 = (UIScreen *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen"), (v4 = (UIScreen *)objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_9:
    v10 = -[UIScreen maximumFramesPerSecond](v4, "maximumFramesPerSecond");
    v11 = 2;
    v12 = 90;
    v13 = 45;
    if (v10 > 134)
    {
      if (v10 > 224)
      {
        if (v10 == 225 || v10 == 270)
          goto LABEL_39;
      }
      else if (v10 == 135 || v10 == 180)
      {
        goto LABEL_39;
      }
LABEL_23:
      v14 = 240;
      if ((unint64_t)v10 >= 0x3D)
        v15 = 60;
      else
        v15 = v10;
      if ((unint64_t)v10 < 0x3D)
      {
        v16 = 10;
      }
      else
      {
        v14 = 60;
        v16 = 1;
      }
      if (v10 >= 24)
        v13 = v15;
      else
        v13 = 24;
      if (v10 >= 24)
        v12 = v14;
      else
        v12 = 240;
      if (v10 >= 24)
        v11 = v16;
      else
        v11 = 10;
      goto LABEL_39;
    }
    if (v10 > 59)
    {
      if (v10 != 60)
      {
        if (v10 != 90)
          goto LABEL_23;
        goto LABEL_39;
      }
    }
    else if (v10 != 30)
    {
      if (v10 != 45)
        goto LABEL_23;
LABEL_39:
      if (v12 != self->_physics.common.physicsRate)
        SUICLightPhysics_Init((uint64_t)&self->_physics, v12, v11);
      self->_physics.common.maxPhysicsIterationsPerFrame = v11;
      -[UIScreen displayLinkWithTarget:selector:](v4, "displayLinkWithTarget:selector:", self, sel__drawFrame_);
      v17 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      v18 = self->_displayLink;
      self->_displayLink = v17;

      -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", v13);
      v19 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v19, "addToRunLoop:forMode:", v20, *MEMORY[0x1E0C99860]);

      -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v6);
      if (self->_screen != v4)
      {
        objc_storeStrong((id *)&self->_screen, v4);
        -[SUICIntelligentLightLayer bounds](self, "bounds");
        -[SUICIntelligentLightLayer _updateMetalRatios:](self, "_updateMetalRatios:", v21, v22);
      }
      goto LABEL_43;
    }
    v11 = 1;
    v13 = v10;
    v12 = v10;
    goto LABEL_39;
  }
  v23 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    -[SUICIntelligentLightLayer _updateScreen:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
  SUICLightPhysics_Init((uint64_t)&self->_physics, 60, 1);
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__drawFrame_);
  v31 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  v32 = self->_displayLink;
  self->_displayLink = v31;

  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 60);
  v33 = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v33, "addToRunLoop:forMode:", v34, *MEMORY[0x1E0C99860]);

  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v6);
  v4 = 0;
LABEL_43:

}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSString *archivePath;

  v3 = a3;
  -[SUICIntelligentLightLayer displayLink](self, "displayLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaused:", v3);

  archivePath = self->_archivePath;
  self->_archivePath = 0;

}

- (void)invalidate
{
  void *v3;
  void *v4;

  -[SUICIntelligentLightLayer displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaused:", 1);

  -[SUICIntelligentLightLayer displayLink](self, "displayLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SUICIntelligentLightLayer setDisplayLink:](self, "setDisplayLink:", 0);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SUICIntelligentLightLayer;
  -[SUICIntelligentLightLayer setBounds:](&v8, sel_setBounds_, a3.origin.x, a3.origin.y);
  if (width != 0.0 && height != 0.0)
  {
    -[SUICIntelligentLightLayer _updateMetalRatios:](self, "_updateMetalRatios:", width, height);
    v6 = (double)((int)width >> 3);
    v7 = (double)((int)height >> 3);
    if ((int)width < 32)
      v6 = 4.0;
    if ((int)height < 32)
      v7 = 4.0;
    -[CAMetalLayer setDrawableSize:](self, "setDrawableSize:", v6, v7);
  }
}

- (void)setIsQuicktationPill:(BOOL)a3
{
  double v4;
  double v5;

  self->_quicktationMode = a3;
  -[SUICIntelligentLightLayer bounds](self, "bounds");
  -[SUICIntelligentLightLayer _updateMetalRatios:](self, "_updateMetalRatios:", v4, v5);
}

- (void)setMinimumPowerLevel:(float)a3
{
  self->_minPowerLevel = a3;
}

- (void)updateVolumeInputdB:(float)a3
{
  float v4;

  if (self->_colorPalette != 104)
  {
    +[SUICAudioPowerLevelLinearConverter linearValueForInputPowerLevel:](SUICAudioPowerLevelLinearConverter, "linearValueForInputPowerLevel:");
    self->_volumeLinearPowerLevel = v4;
  }
}

- (void)stopVolumeInput
{
  self->_volumeLinearPowerLevel = 0.0;
}

- (void)transitionToNextBuddyStep
{
  if (!self->_physics.common.reduceMotion)
  {
    self->_physics.isBuddy = 1;
    self->_physics.energySpring.value = 4.0;
  }
}

- (void)_updateMetalRatios:(CGSize)a3
{
  double v4;
  float v5;
  float v6;
  double v7;
  float64x2_t v8;
  float32x2_t v9;
  unsigned __int8 *anon_30;
  float v11;
  uint64_t v17;
  float v18;
  float v20;
  CGFloat width;
  CGFloat height;

  width = a3.width;
  height = a3.height;
  -[UIScreen scale](self->_screen, "scale");
  v5 = v4;
  if (v5 == 0.0)
    v6 = 1.0;
  else
    v6 = 1.0 / v5;
  v7 = v6;
  v8.f64[0] = width;
  v8.f64[1] = height;
  v9 = vcvt_f32_f64(v8);
  *(float32x2_t *)&self->_anon_210[16] = vcvt_f32_f64(vmulq_n_f64(vmulq_f64(vcvtq_f64_f32(v9), (float64x2_t)vdupq_n_s64(0x3F56F0068DB8BAC7uLL)), v7));
  anon_30 = self->_anon_30;
  if (v9.f32[0] >= v9.f32[1])
  {
    v18 = v9.f32[1] / v9.f32[0];
    __asm { FMOV            V2.2S, #1.5 }
    *((float *)&_D2 + 1) = v18 * 1.5;
    *(_QWORD *)anon_30 = _D2;
    if (!self->_quicktationMode)
      return;
    v20 = (float)(1.0 - v18) * 0.4;
    LODWORD(v17) = 0;
    *((float *)&v17 + 1) = v20;
  }
  else
  {
    v11 = v9.f32[0] / v9.f32[1];
    __asm { FMOV            V2.2S, #1.5 }
    *(float *)&_D2 = v11 * 1.5;
    *(_QWORD *)anon_30 = _D2;
    if (!self->_quicktationMode)
      return;
    HIDWORD(v17) = 0;
    *(float *)&v17 = (float)(1.0 - v11) * 0.4;
  }
  *(_QWORD *)&self->_anon_30[8] = v17;
}

- (void)_loadMetalPipelines
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s Unable to locate archive.metallib", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (id)createNoiseTextureWithDevice:(id)a3 commandQueue:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  int64x2_t v16;
  uint64_t v17;

  v5 = (objc_class *)MEMORY[0x1E0CC6BB0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setTextureType:", 7);
  objc_msgSend(v8, "setWidth:", 80);
  objc_msgSend(v8, "setHeight:", 80);
  objc_msgSend(v8, "setDepth:", 40);
  objc_msgSend(v8, "setMipmapLevelCount:", 1);
  objc_msgSend(v8, "setPixelFormat:", 10);
  objc_msgSend(v8, "setUsage:", 1);
  v9 = (void *)objc_msgSend(v7, "newTextureWithDescriptor:", v8);
  objc_msgSend(v8, "setStorageMode:", 2);
  v10 = (void *)objc_msgSend(v7, "newTextureWithDescriptor:", v8);

  objc_msgSend(v10, "setLabel:", CFSTR("ilNoise"));
  memset(v15, 0, sizeof(v15));
  v16 = vdupq_n_s64(0x50uLL);
  v17 = 40;
  objc_msgSend(v9, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v15, 0, 0, &precalcSUICILNoise3DTexture, 80, 6400);
  objc_msgSend(v6, "commandBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "blitCommandEncoder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "copyFromTexture:toTexture:", v9, v10);
      objc_msgSend(v13, "endEncoding");
    }
    objc_msgSend(v11, "commit");
    objc_msgSend(v11, "waitUntilCompleted");

  }
  return v10;
}

- (void)_loadMetalState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICIntelligentLightLayer setRenderPassDesc:](self, "setRenderPassDesc:", v3);

  -[SUICIntelligentLightLayer renderPassDesc](self, "renderPassDesc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLoadAction:", 0);
  objc_msgSend(v6, "setStoreAction:", 1);

}

- (void)_drawFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float minPowerLevel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 *anon_210;
  float32x4_t v22;
  float32x4_t v23;
  uint64_t v24;
  float32x4_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v36;
  __int128 v37;
  double v42;
  float v43;
  _QWORD v44[5];

  v4 = a3;
  -[SUICIntelligentLightLayer commandQueue](self, "commandQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commandBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "targetTimestamp");
    v8 = v7;
    objc_msgSend(v4, "timestamp");
    v10 = v8 - v9;
    *(float *)&v10 = v10;
    v42 = v10;
    if (self->_colorPalette <= 0x1F3)
    {
      minPowerLevel = self->_minPowerLevel;
      if (minPowerLevel < self->_volumeLinearPowerLevel)
        minPowerLevel = self->_volumeLinearPowerLevel;
      self->_physics.common.micPowerLevel = minPowerLevel;
      SUICLightPhysics_UpdatePhysics((uint64_t)&self->_physics, *(float *)&v42);
    }
    -[CAMetalLayer nextDrawable](self, "nextDrawable", *(_QWORD *)&v42);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "texture");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUICIntelligentLightLayer renderPassDesc](self, "renderPassDesc");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "colorAttachments");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTexture:", v14);

      -[SUICIntelligentLightLayer renderPassDesc](self, "renderPassDesc");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "renderCommandEncoderWithDescriptor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setCullMode:", 0);
      -[SUICIntelligentLightLayer renderPipeline](self, "renderPipeline");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setRenderPipelineState:", v20);

      if (self->_colorPalette < 0x1F4)
      {
        objc_msgSend(v19, "setVertexBytes:length:atIndex:", self->_anon_30, 16, 0);
        v34 = *(_OWORD *)&self->_anon_1b8[16];
        *(_OWORD *)self->_anon_40 = *(_OWORD *)self->_anon_1b8;
        *(_OWORD *)&self->_anon_40[16] = v34;
        _Q0 = *(_OWORD *)&self->_anon_1b8[32];
        v36 = *(_OWORD *)&self->_anon_1b8[48];
        v37 = *(_OWORD *)&self->_anon_1b8[64];
        *(_QWORD *)&self->_anon_40[80] = *(_QWORD *)&self->_anon_1b8[80];
        *(_OWORD *)&self->_anon_40[48] = v36;
        *(_OWORD *)&self->_anon_40[64] = v37;
        *(_OWORD *)&self->_anon_40[32] = _Q0;
        *(float *)&_Q0 = self->_physics.volumeSpring.value;
        __asm { FCVT            H0, S0 }
        *(_WORD *)&self->_anon_40[88] = _Q0;
        *(float *)&_Q0 = self->_physics.lightnessSpring.value;
        __asm { FCVT            H0, S0 }
        *(_WORD *)&self->_anon_40[90] = _Q0;
        objc_msgSend(v19, "setFragmentBytes:length:atIndex:");
      }
      else
      {
        anon_210 = self->_anon_210;
        v22.i32[3] = 0;
        v23 = vmlaq_n_f32(*(float32x4_t *)self->_anon_210, (float32x4_t)xmmword_1A37FD000, v43);
        *(float32x4_t *)self->_anon_210 = v23;
        if (v23.f32[0] > 1.0)
        {
          v22.f32[0] = v23.f32[0] + -1.0;
          HIDWORD(v24) = v23.i32[1];
          *(float *)&v24 = v23.f32[0] + -1.0;
          v22.i32[1] = v23.i32[1];
          v22.i32[2] = v23.i32[2];
          *(_DWORD *)&self->_anon_210[8] = v23.i32[2];
          *(_QWORD *)anon_210 = v24;
          v23 = v22;
        }
        if (v23.f32[1] < 0.0)
        {
          v25 = v23;
          v25.f32[1] = v23.f32[1] + 1.0;
          *(_QWORD *)anon_210 = v25.i64[0];
          v25.i32[2] = v23.i32[2];
          *(_DWORD *)&self->_anon_210[8] = v23.i32[2];
          v23 = v25;
        }
        if (v23.f32[2] > 1.0)
        {
          *(float *)&self->_anon_210[8] = v23.f32[2] + -1.0;
          *(_QWORD *)anon_210 = v23.i64[0];
        }
        objc_msgSend(v19, "setVertexBytes:length:atIndex:");
        objc_msgSend(v19, "setFragmentTexture:atIndex:", self->_noiseTexture, 0);
      }
      objc_msgSend(v19, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 3);
      objc_msgSend(v19, "endEncoding");
      objc_msgSend(v6, "presentDrawable:", v13);

    }
    if (self->_firstFrame)
    {
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __40__SUICIntelligentLightLayer__drawFrame___block_invoke;
      v44[3] = &unk_1E4A54F98;
      v44[4] = self;
      objc_msgSend(v6, "addCompletedHandler:", v44);
      self->_firstFrame = 0;
    }
    objc_msgSend(v6, "commit");

  }
  else
  {
    v26 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SUICIntelligentLightLayer _drawFrame:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
  }

}

void __40__SUICIntelligentLightLayer__drawFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  int v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "GPUStartTime");
  v5 = v4;
  objc_msgSend(v3, "GPUEndTime");
  v7 = v6;

  v8 = (id)*MEMORY[0x1E0CFE6B8];
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = 134217984;
    v12 = v7 - v5;
    _os_signpost_emit_with_name_impl(&dword_1A3752000, v9, OS_SIGNPOST_INTERVAL_END, v10, "IntelligentLightLayerFirstFrame", "GPU time:%f", (uint8_t *)&v11, 0xCu);
  }

}

- (void)startReducedFramerateForPerformance
{
  __assert_rtn("-[SUICIntelligentLightLayer startReducedFramerateForPerformance]", "SUICIntelligentLightLayer.m", 673, "!\"Unknown physics rate\");
}

- (void)endReducedFramerateForPerformance
{
  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", self->_framesPerSecondBeforePerformanceOptimization);
  self->_physics.common.maxPhysicsIterationsPerFrame = self->_maxPhysicsIterationsBeforePerformanceOptimization;
}

- (unint64_t)colorPalette
{
  return self->_colorPalette;
}

- (BOOL)quicktationMode
{
  return self->_quicktationMode;
}

- (void)setQuicktationMode:(BOOL)a3
{
  self->_quicktationMode = a3;
}

- (float)minPowerLevel
{
  return self->_minPowerLevel;
}

- (void)setMinPowerLevel:(float)a3
{
  self->_minPowerLevel = a3;
}

- (float)volumeLinearPowerLevel
{
  return self->_volumeLinearPowerLevel;
}

- (void)setVolumeLinearPowerLevel:(float)a3
{
  self->_volumeLinearPowerLevel = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (MTLRenderPipelineState)renderPipeline
{
  return self->_renderPipeline;
}

- (void)setRenderPipeline:(id)a3
{
  objc_storeStrong((id *)&self->_renderPipeline, a3);
}

- (MTLRenderPassDescriptor)renderPassDesc
{
  return self->_renderPassDesc;
}

- (void)setRenderPassDesc:(id)a3
{
  objc_storeStrong((id *)&self->_renderPassDesc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderPassDesc, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_noiseTexture, 0);
}

- (void)_commonInitWithScreen:(uint64_t)a3 commandQueue:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s Failed to get Metal device for GPU rendering", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithLayer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s initWithLayer not implemented", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_updateScreen:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s Siri Intelligent Light found no screen. Defaulting to backup values.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_drawFrame:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s Failed to create command buffer, dropping frame", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

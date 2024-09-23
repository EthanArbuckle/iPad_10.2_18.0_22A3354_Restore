@implementation SUICOrbView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_setupSpring:(id *)a3 withType:(unint64_t)a4 initialValue:(float)a5
{
  float v7;
  float v8;
  float v9;
  unint64_t framerateType;
  float v11;
  float v12;

  v7 = 0.0;
  v8 = 0.0;
  if (a4 <= 3)
  {
    v7 = flt_1A377E770[a4];
    v8 = flt_1A377E780[a4];
  }
  if (a4 != 0 && self->_reduceMotion)
  {
    v7 = v7 * 0.5;
    v9 = v8 * 0.25;
  }
  else
  {
    v9 = v8;
  }
  framerateType = self->_framerateType;
  switch(framerateType)
  {
    case 2uLL:
      v9 = v9 * 0.222222222;
      v11 = 1.0 - v7;
      v12 = 1.0 - fabsf(sqrtf(v11));
      if (v11 == -INFINITY)
        v7 = -INFINITY;
      else
        v7 = v12;
      break;
    case 1uLL:
      v9 = v9 * 3.0;
      v7 = 1.0 - (float)((float)(1.0 - v7) * (float)(1.0 - v7));
      break;
    case 0uLL:
      v9 = v9 * 9.0;
      v7 = 1.0 - powf(1.0 - v7, 4.0);
      break;
  }
  a3->var0 = a5;
  a3->var1 = 0.0;
  a3->var2 = v9;
  a3->var3 = v7;
}

- (void)_initSprings
{
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
  uint64_t i;

  self->_reduceMotion = UIAccessibilityIsReduceMotionEnabled();
  LODWORD(v3) = 1068121457;
  -[SUICOrbView _setupSpring:withType:initialValue:](self, "_setupSpring:withType:initialValue:", &self->_bubbleSpring, 1, v3);
  LODWORD(v4) = 0;
  -[SUICOrbView _setupSpring:withType:initialValue:](self, "_setupSpring:withType:initialValue:", &self->_energySpring, 2, v4);
  LODWORD(v5) = 0;
  -[SUICOrbView _setupSpring:withType:initialValue:](self, "_setupSpring:withType:initialValue:", &self->_volumeSpring, 1, v5);
  LODWORD(v6) = 1.0;
  -[SUICOrbView _setupSpring:withType:initialValue:](self, "_setupSpring:withType:initialValue:", &self->_chipsSpring, 2, v6);
  LODWORD(v7) = 1.0;
  -[SUICOrbView _setupSpring:withType:initialValue:](self, "_setupSpring:withType:initialValue:", &self->_specularSpring, 1, v7);
  LODWORD(v8) = 0;
  -[SUICOrbView _setupSpring:withType:initialValue:](self, "_setupSpring:withType:initialValue:", &self->_thinkingSpring, 3, v8);
  LODWORD(v9) = 0;
  -[SUICOrbView _setupSpring:withType:initialValue:](self, "_setupSpring:withType:initialValue:", &self->_speakingSpring, 2, v9);
  LODWORD(v10) = 0;
  -[SUICOrbView _setupSpring:withType:initialValue:](self, "_setupSpring:withType:initialValue:", &self->_glowSpring, 0, v10);
  LODWORD(v11) = 0;
  -[SUICOrbView _setupSpring:withType:initialValue:](self, "_setupSpring:withType:initialValue:", &self->_onSpring, !self->_reduceMotion, v11);
  for (i = 0; i != 6; ++i)
  {
    LODWORD(v12) = 0;
    -[SUICOrbView _setupSpring:withType:initialValue:](self, "_setupSpring:withType:initialValue:", &self->_chipSpring[i], 0, v12);
  }
}

- (void)_initNoiseOffsets
{
  uint64_t i;

  for (i = 0; i != 18; ++i)
    self->_chipRandomOffset[i] = (float)((float)((float)rand() * 4.6566e-10) * 600.0) + -300.0;
}

- (void)_initCommandQueue
{
  MTLCommandQueue *v3;
  MTLCommandQueue *commandQueue;

  if (!self->_commandQueue)
  {
    v3 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_device, "newCommandQueue");
    commandQueue = self->_commandQueue;
    self->_commandQueue = v3;

    -[MTLCommandQueue setGPUPriority:](self->_commandQueue, "setGPUPriority:", 4);
  }
}

- (SUICOrbView)initWithCoder:(id)a3
{
  SUICOrbView *v3;
  SUICOrbView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUICOrbView;
  v3 = -[SUICOrbView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[SUICOrbView frame](v3, "frame");
    -[SUICOrbView _commonInitWithFrame:](v4, "_commonInitWithFrame:");
  }
  return v4;
}

- (SUICOrbView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SUICOrbView *v7;
  SUICOrbView *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)SUICOrbView;
  v7 = -[SUICOrbView initWithFrame:](&v10, sel_initWithFrame_);
  v8 = v7;
  if (v7)
    -[SUICOrbView _commonInitWithFrame:](v7, "_commonInitWithFrame:", x, y, width, height);
  return v8;
}

- (void)_commonInitWithFrame:(CGRect)a3
{
  double height;
  double width;
  CAMetalLayer *v6;
  CAMetalLayer *metalLayer;
  MTLDevice *v8;
  MTLDevice *device;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  float v25;
  float v26;
  double v27;
  CADisplayLink *v28;
  CADisplayLink *displayLink;
  CADisplayLink *v30;
  void *v31;
  id v32;

  height = a3.size.height;
  width = a3.size.width;
  self->_framesPerSecond = 60;
  self->_oneOverFPS = 0.016667;
  self->_physicsRate = 0.016667;
  self->_maxPhysicsIterationsPerFrame = 1;
  self->_dynamicFramerate = 0;
  -[SUICOrbView layer](self, "layer", a3.origin.x, a3.origin.y);
  v6 = (CAMetalLayer *)objc_claimAutoreleasedReturnValue();
  metalLayer = self->_metalLayer;
  self->_metalLayer = v6;

  v8 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v8;

  if (self->_device)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "_carScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v32 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "screen");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v32 = v23;

    }
    objc_msgSend(v32, "scale");
    v25 = v24;
    self->_framesPerSecond = objc_msgSend(v32, "maximumFramesPerSecond");
    v26 = 1.0;
    if (v25 != 0.0)
      v26 = v25;
    v27 = v26;
    -[CAMetalLayer setContentsScale:](self->_metalLayer, "setContentsScale:", v26);
    -[SUICOrbView _choosePhysicsRate:](self, "_choosePhysicsRate:", self->_framesPerSecond);
    -[CAMetalLayer setDevice:](self->_metalLayer, "setDevice:", self->_device);
    -[CAMetalLayer setPixelFormat:](self->_metalLayer, "setPixelFormat:", 80);
    -[CAMetalLayer setFramebufferOnly:](self->_metalLayer, "setFramebufferOnly:", 1);
    -[CAMetalLayer setPresentsWithTransaction:](self->_metalLayer, "setPresentsWithTransaction:", 0);
    -[CAMetalLayer setDrawsAsynchronously:](self->_metalLayer, "setDrawsAsynchronously:", 1);
    -[CAMetalLayer setOpaque:](self->_metalLayer, "setOpaque:", 0);
    -[SUICOrbView _initCommandQueue](self, "_initCommandQueue");
    -[SUICOrbView _loadMetalPipelines](self, "_loadMetalPipelines");
    -[SUICOrbView _loadMetalState](self, "_loadMetalState");
    -[SUICOrbView _loadAssets](self, "_loadAssets");
    -[SUICOrbView _updateMetalTextureRasterSize:](self, "_updateMetalTextureRasterSize:", width * v27, height * v27);
    objc_msgSend(v32, "displayLinkWithTarget:selector:", self, sel__drawSiriFrame_);
    v28 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v28;

    -[SUICOrbView _resetDisplayLinkFramerate](self, "_resetDisplayLinkFramerate");
    v30 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v30, "addToRunLoop:forMode:", v31, *MEMORY[0x1E0C99860]);

    -[SUICOrbView _setPaused:](self, "_setPaused:", 1);
    self->_currentlyShownChannel = 0;
    self->_numberOfChips = 6;
    self->_bias = 0.0;
    self->_scale = 0.0;
    self->_power = 0.0;
    -[SUICOrbView _initSprings](self, "_initSprings");
    -[SUICOrbView _initNoiseOffsets](self, "_initNoiseOffsets");
    -[SUICOrbView setSuppressTTSAnimations:](self, "setSuppressTTSAnimations:", 1);

  }
  else
  {
    v12 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SUICOrbView _commonInitWithFrame:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  }
}

- (void)_setMode:(int64_t)a3
{
  int64_t mode;

  mode = self->_mode;
  if (mode != a3)
  {
    self->_mode = a3;
    if (a3 == 2 && mode == 1)
    {
      if (self->_delayUntilThinking > 0.0)
        return;
      self->_delayUntilThinking = 0.1;
      self->_renderMode = 3;
      mode = 1;
      a3 = 3;
    }
    else
    {
      self->_renderMode = a3;
      self->_delayUntilThinking = 0.0;
    }
    -[SUICOrbView _didSetRenderModeFrom:to:](self, "_didSetRenderModeFrom:to:", mode, a3);
  }
}

- (void)_updateRenderModeWithDelta:(float)a3
{
  float v3;
  int64_t mode;

  if (self->_renderMode == 3 && self->_mode == 2)
  {
    v3 = self->_delayUntilThinking - a3;
    self->_delayUntilThinking = v3;
    if (v3 <= 0.0)
    {
      self->_delayUntilThinking = 0.0;
      mode = self->_mode;
      self->_renderMode = mode;
      -[SUICOrbView _didSetRenderModeFrom:to:](self, "_didSetRenderModeFrom:to:", mode, mode);
    }
  }
  else
  {
    self->_delayUntilThinking = 0.0;
  }
}

- (void)_didSetRenderModeFrom:(int64_t)a3 to:(int64_t)a4
{
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id offCompletion;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a4 == 2)
  {
    self->_startingThinkingModeNow = 1;
    self->_powerLevel = 0.0;
    self->_fullyThinkingModeNow = 0;
  }
  else if (!a4)
  {
    self->_powerLevel = 0.0;
  }
  if (a4 != 2 && a3 == 2 && self->_reduceThinkingModeFramerate)
    -[SUICOrbView _endReducedFramerateForPerf](self, "_endReducedFramerateForPerf");
  if (a4 && self->_offCompletion)
  {
    v7 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      v9 = v7;
      objc_msgSend(v8, "numberWithInteger:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[SUICOrbView _didSetRenderModeFrom:to:]";
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1A3752000, v9, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion nil-ing out because toMode == %@ completion", (uint8_t *)&v12, 0x16u);

    }
    offCompletion = self->_offCompletion;
    self->_offCompletion = 0;

  }
  if (!a3 && self->_device)
  {
    -[SUICOrbView _setPaused:](self, "_setPaused:", 0);
    -[CAMetalLayer discardContents](self->_metalLayer, "discardContents");
    -[SUICOrbView _initCommandQueue](self, "_initCommandQueue");
    if (a4 == 1)
      objc_msgSend((id)*MEMORY[0x1E0DC4730], "finishedIPTest:", CFSTR("SiriBringupToFlamesListening"));
  }
}

- (void)pauseAnimationAndReset
{
  MTLTexture *siriChipsTexture;
  MTLTexture *blurChipsTexture;
  MTLTexture *sphereMaskTexture;
  MTLTexture *blurMaskTexture;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MTLCommandQueue *commandQueue;
  NSObject *v12;
  id offCompletion;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SUICOrbView _setPaused:](self, "_setPaused:", 1);
  -[SUICOrbView _initSprings](self, "_initSprings");
  -[SUICOrbView _initNoiseOffsets](self, "_initNoiseOffsets");
  self->_startingThinkingModeNow = 0;
  self->_fullyThinkingModeNow = 0;
  self->_drawingVeryLastFrame = 0;
  self->_resetOnNextFrame = 1;
  self->_renderMode = 0;
  siriChipsTexture = self->_siriChipsTexture;
  self->_siriChipsTexture = 0;

  blurChipsTexture = self->_blurChipsTexture;
  self->_blurChipsTexture = 0;

  sphereMaskTexture = self->_sphereMaskTexture;
  self->_sphereMaskTexture = 0;

  blurMaskTexture = self->_blurMaskTexture;
  self->_blurMaskTexture = 0;

  -[MTLRenderPassDescriptor colorAttachments](self->_siriChipRenderPassDesc, "colorAttachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResolveTexture:", 0);

  -[MTLRenderPassDescriptor colorAttachments](self->_sphereMaskRenderPassDesc, "colorAttachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTexture:", 0);

  self->_reallocTextures = 1;
  commandQueue = self->_commandQueue;
  self->_commandQueue = 0;

  -[CAMetalLayer removeBackBuffers](self->_metalLayer, "removeBackBuffers");
  if (self->_offCompletion)
  {
    v12 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "-[SUICOrbView pauseAnimationAndReset]";
      _os_log_impl(&dword_1A3752000, v12, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion nil-ing out completion", (uint8_t *)&v14, 0xCu);
    }
    offCompletion = self->_offCompletion;
    self->_offCompletion = 0;

  }
}

- (void)animateToOffWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id offCompletion;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[SUICOrbView animateToOffWithCompletion:]";
    _os_log_impl(&dword_1A3752000, v5, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion setting completion", (uint8_t *)&v8, 0xCu);
  }
  v6 = (void *)MEMORY[0x1A8593D14](v4);
  offCompletion = self->_offCompletion;
  self->_offCompletion = v6;

  -[SUICOrbView _setMode:](self, "_setMode:", 0);
}

- (void)setPowerLevel:(float)a3
{
  int64_t renderMode;
  double v6;
  BOOL v7;

  renderMode = self->_renderMode;
  if (renderMode == 3)
  {
    v7 = -[SUICOrbView suppressTTSAnimations](self, "suppressTTSAnimations");
    LODWORD(v6) = 0;
    if (!v7)
    {
      *(float *)&v6 = a3;
      +[SUICAudioPowerLevelLinearConverter linearValueForOutputPowerLevel:](SUICAudioPowerLevelLinearConverter, "linearValueForOutputPowerLevel:", v6);
    }
  }
  else
  {
    if (renderMode != 1)
      return;
    +[SUICAudioPowerLevelLinearConverter linearValueForInputPowerLevel:](SUICAudioPowerLevelLinearConverter, "linearValueForInputPowerLevel:", *(double *)&a3);
  }
  self->_powerLevel = *(float *)&v6;
}

- (void)_configurePreferredFramesPerSecond:(int)a3
{
  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", a3);
}

- (void)_setPaused:(BOOL)a3
{
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", a3);
}

- (void)prewarmOrb
{
  void *v3;
  void *v4;
  id v5;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderCommandEncoderWithDescriptor:", self->_siriChipRenderPassDesc);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEncoding");
  objc_msgSend(v5, "renderCommandEncoderWithDescriptor:", self->_sphereMaskRenderPassDesc);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "endEncoding");
  objc_msgSend(v5, "commit");

}

- (id)_from:(id)a3 getRenderPipeline:(id)a4 err:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v11;

  v11 = 0;
  v6 = (void *)objc_msgSend(a3, "newRenderPipelineStateWithName:options:reflection:error:", a4, 0, 0, &v11);
  v7 = v11;
  v8 = v7;
  if (v7)
    v9 = 1;
  else
    v9 = v6 == 0;
  if (v9)
    *a5 = objc_retainAutorelease(v7);

  return v6;
}

- (id)_from:(id)a3 getComputePipeline:(id)a4 err:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v11;

  v11 = 0;
  v6 = (void *)objc_msgSend(a3, "newComputePipelineStateWithName:options:reflection:error:", a4, 0, 0, &v11);
  v7 = v11;
  v8 = v7;
  if (v7)
    v9 = 1;
  else
    v9 = v6 == 0;
  if (v9)
    *a5 = objc_retainAutorelease(v7);

  return v6;
}

- (void)_loadMetalPipelines
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SUICOrbView _loadMetalPipelines]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1A3752000, a2, OS_LOG_TYPE_ERROR, "%s Unable to load pipelines: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_loadMetalState
{
  MTLRenderPassDescriptor *v3;
  MTLRenderPassDescriptor *siriChipRenderPassDesc;
  void *v5;
  void *v6;
  MTLRenderPassDescriptor *v7;
  MTLRenderPassDescriptor *sphereMaskRenderPassDesc;
  void *v9;
  void *v10;
  MTLRenderPassDescriptor *v11;
  MTLRenderPassDescriptor *finalRenderPassDesc;
  void *v13;
  MTLBuffer *v14;
  MTLBuffer *dynamicUniformBuffer;
  id v16;

  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v3 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
  siriChipRenderPassDesc = self->_siriChipRenderPassDesc;
  self->_siriChipRenderPassDesc = v3;

  -[MTLRenderPassDescriptor colorAttachments](self->_siriChipRenderPassDesc, "colorAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLoadAction:", 2);
  objc_msgSend(v6, "setStoreAction:", 2);
  objc_msgSend(v6, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v7 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
  sphereMaskRenderPassDesc = self->_sphereMaskRenderPassDesc;
  self->_sphereMaskRenderPassDesc = v7;

  -[MTLRenderPassDescriptor colorAttachments](self->_sphereMaskRenderPassDesc, "colorAttachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setLoadAction:", 2);
  objc_msgSend(v10, "setStoreAction:", 1);
  objc_msgSend(v10, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v11 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
  finalRenderPassDesc = self->_finalRenderPassDesc;
  self->_finalRenderPassDesc = v11;

  -[MTLRenderPassDescriptor colorAttachments](self->_finalRenderPassDesc, "colorAttachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setLoadAction:", 2);
  objc_msgSend(v16, "setStoreAction:", 2);
  objc_msgSend(v16, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  v14 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 512, 0);
  dynamicUniformBuffer = self->_dynamicUniformBuffer;
  self->_dynamicUniformBuffer = v14;

  -[MTLBuffer setLabel:](self->_dynamicUniformBuffer, "setLabel:", CFSTR("Uniforms"));
}

- (void)_createSphereBuffer
{
  __assert_rtn("-[SUICOrbView _createSphereBuffer]", "SUICOrbView.m", 1096, "index == _sphereNumIndexes");
}

- (void)_createSiriChipBuffer
{
  MTLBuffer *v3;
  MTLBuffer *siriChipGeom;
  uint64_t v5;
  uint64_t v6;
  __float2 *v7;
  float v8;
  __float2 v9;
  float32x4_t v10;
  float32x4_t v11;
  uint64_t v12;
  float32x4_t v13;
  uint64_t v14;
  float32x4_t v15;
  __int128 v16;
  uint64_t v17;
  int chipNumIndexes;
  uint64_t v19;
  uint64_t v20;
  int v21;

  self->_chipNumIndexes = 300;
  self->_chipIndexBufferOffset = 4848;
  v3 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 2 * self->_chipNumIndexes + 4848, 0);
  siriChipGeom = self->_siriChipGeom;
  self->_siriChipGeom = v3;

  v5 = -[MTLBuffer contents](self->_siriChipGeom, "contents");
  v6 = 0;
  *(_OWORD *)v5 = xmmword_1A377E700;
  *(_QWORD *)(v5 + 32) = 0;
  *(_WORD *)(v5 + 40) = 0;
  v7 = (__float2 *)(v5 + 88);
  do
  {
    v8 = (double)(int)v6 / 100.0 * 3.14159265 + (double)(int)v6 / 100.0 * 3.14159265;
    v9 = __sincosf_stret(v8);
    v7[-1] = v9;
    v10.i32[1] = 0;
    v10.f32[0] = v9.__sinval * -0.5;
    v10.i64[1] = COERCE_UNSIGNED_INT(v9.__sinval * v9.__cosval);
    v11.i64[0] = 0x3F0000003F000000;
    v11.i64[1] = 0x3F0000003F000000;
    *(float32x4_t *)&v7[-5].__sinval = vmulq_f32(v10, v11);
    LOWORD(v7->__sinval) = 15360;
    ++v6;
    v7 += 6;
  }
  while (v6 != 100);
  v12 = 0;
  v13 = (float32x4_t)xmmword_1A377E090;
  *(_OWORD *)(v5 + 16) = xmmword_1A377E090;
  v14 = 64;
  do
  {
    *(double *)v13.i64 = _calculateChipNormal(v5, (int)v12 + 2, v12, v13);
    *(float32x4_t *)(v5 + v14) = v13;
    ++v12;
    v14 += 48;
  }
  while (v12 != 99);
  *(double *)v15.i64 = _calculateChipNormal(v5, 1, 99, v13);
  *(float32x4_t *)(v5 + 4816) = v15;
  *(double *)&v16 = _calculateChipNormal(v5, 2, 100, v15);
  *(_OWORD *)(v5 + 64) = v16;
  v17 = v5 + self->_chipIndexBufferOffset;
  chipNumIndexes = self->_chipNumIndexes;
  v19 = (chipNumIndexes - 1);
  if (chipNumIndexes >= 2)
  {
    v20 = 0;
    do
    {
      v21 = v20 - 2 * (v20 / 3);
      if ((_DWORD)v20 == 3 * (v20 / 3))
        LOWORD(v21) = 0;
      *(_WORD *)(v17 + 2 * v20++) = v21;
    }
    while (v19 != v20);
  }
  *(_WORD *)(v17 + 2 * (int)v19) = 1;
}

- (void)_createSmoothStepTexture
{
  id v3;
  _OWORD *v4;
  void *v5;
  MTLTexture *smoothStepTexture;
  _QWORD v7[3];
  __int128 v8;
  uint64_t v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
  objc_msgSend(v3, "setTextureType:", 0);
  objc_msgSend(v3, "setPixelFormat:", 10);
  objc_msgSend(v3, "setWidth:", 16);
  objc_msgSend(v3, "setMipmapLevelCount:", 1);
  objc_msgSend(v3, "setUsage:", 1);
  objc_msgSend(v3, "setStorageMode:", 0);
  v4 = malloc_type_malloc(0x10uLL, 0x100004077774924uLL);
  *v4 = xmmword_1A377E710;
  v5 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v3);
  objc_msgSend(v5, "setLabel:", CFSTR("smooth step gradient"));
  memset(v7, 0, sizeof(v7));
  v8 = xmmword_1A377E720;
  v9 = 1;
  objc_msgSend(v5, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v7, 0, 0, v4, 16, 16);
  free(v4);
  smoothStepTexture = self->_smoothStepTexture;
  self->_smoothStepTexture = (MTLTexture *)v5;

}

- (void)_createNoiseTexture
{
  id v3;
  MTLTexture *v4;
  MTLTexture *noiseTexture;
  MTLTexture *v6;
  _QWORD v7[3];
  int64x2_t v8;
  uint64_t v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
  objc_msgSend(v3, "setTextureType:", 7);
  objc_msgSend(v3, "setWidth:", 64);
  objc_msgSend(v3, "setHeight:", 64);
  objc_msgSend(v3, "setDepth:", 64);
  objc_msgSend(v3, "setMipmapLevelCount:", 1);
  objc_msgSend(v3, "setStorageMode:", 0);
  objc_msgSend(v3, "setPixelFormat:", 10);
  objc_msgSend(v3, "setUsage:", 1);
  v4 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v3);
  noiseTexture = self->_noiseTexture;
  self->_noiseTexture = v4;

  -[MTLTexture setLabel:](self->_noiseTexture, "setLabel:", CFSTR("noise"));
  v6 = self->_noiseTexture;
  memset(v7, 0, sizeof(v7));
  v8 = vdupq_n_s64(0x40uLL);
  v9 = 64;
  -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](v6, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v7, 0, 0, &precalcSUICOrbNoise3DTexture, 64, 4096);

}

- (void)_loadAssets
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s Error creating Siri meshes", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_updateDynamicBufferState
{
  self->_uniformBufferAddress = (void *)-[MTLBuffer contents](self->_dynamicUniformBuffer, "contents");
}

- (void)_updateChipsSizesForOnOff
{
  $DB819904906F9C60E9F5CE4A4AC513D5 *p_onSpring;
  int64_t renderMode;
  float v4;
  float springAmount;
  double v6;
  float value;
  float v8;
  float v9;
  float curVelocity;
  float maxAcceleration;
  float v12;
  float v13;
  double v14;
  uint64_t i;
  double v16;
  uint64_t v17;
  float *p_maxAcceleration;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  p_onSpring = &self->_onSpring;
  renderMode = self->_renderMode;
  v4 = 1.0;
  if (!renderMode)
    v4 = 0.0;
  springAmount = self->_onSpring.springAmount;
  v6 = (float)(springAmount * v4);
  value = p_onSpring->value;
  v8 = v6 + p_onSpring->value * (1.0 - springAmount);
  v9 = v8 - p_onSpring->value;
  if (v9 != 0.0)
  {
    curVelocity = self->_onSpring.curVelocity;
    maxAcceleration = self->_onSpring.maxAcceleration;
    v12 = v9 - curVelocity;
    if ((float)(v9 - curVelocity) <= maxAcceleration)
    {
      if (v12 >= (float)-maxAcceleration)
        v13 = curVelocity + v12;
      else
        v13 = curVelocity - maxAcceleration;
    }
    else
    {
      v13 = curVelocity + maxAcceleration;
    }
    self->_onSpring.curVelocity = v13;
    if (v9 >= 0.0)
    {
      if (v13 <= v9)
      {
LABEL_14:
        value = value + v13;
        p_onSpring->value = value;
        renderMode = self->_renderMode;
        goto LABEL_15;
      }
    }
    else if (v13 >= v9)
    {
      goto LABEL_14;
    }
    self->_onSpring.curVelocity = v9;
    v13 = v9;
    goto LABEL_14;
  }
LABEL_15:
  if (!renderMode)
  {
    v14 = 0.166666672;
LABEL_21:
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v16 = value;
    if (v14 < v16)
    {
      LODWORD(v28) = 1065353216;
      if (v14 + 0.166666667 < v16)
      {
        HIDWORD(v28) = 1065353216;
        if (v14 + 0.333333333 < v16)
        {
          LODWORD(v29) = 1065353216;
          if (v14 + 0.5 < v16)
          {
            HIDWORD(v29) = 1065353216;
            if (v14 + 0.666666667 < v16)
            {
              LODWORD(v30) = 1065353216;
              if (v14 + 0.833333333 < v16)
                HIDWORD(v30) = 1065353216;
            }
          }
        }
      }
    }
    v17 = 0;
    p_maxAcceleration = &self->_chipSpring[0].maxAcceleration;
    v19 = 0.0;
    while (1)
    {
      v20 = *(p_maxAcceleration - 2);
      v21 = (float)(*(float *)((char *)&v28 + v17) * p_maxAcceleration[1]) + v20 * (1.0 - p_maxAcceleration[1]);
      v22 = v21 - v20;
      if (v22 != 0.0)
        break;
LABEL_41:
      v19 = v19 + v20;
      v17 += 4;
      p_maxAcceleration += 4;
      if (v17 == 24)
      {
        self->_maxChipSize = self->_chipSpring[0].value;
        v27 = v19 * 0.166666667;
        self->_averageChipSize = v27;
        return;
      }
    }
    v23 = *(p_maxAcceleration - 1);
    v24 = *p_maxAcceleration;
    v25 = v22 - v23;
    if ((float)(v22 - v23) <= *p_maxAcceleration)
    {
      if (v25 >= (float)-v24)
        v26 = v23 + v25;
      else
        v26 = v23 - v24;
    }
    else
    {
      v26 = v23 + v24;
    }
    *(p_maxAcceleration - 1) = v26;
    if (v22 >= 0.0)
    {
      if (v26 <= v22)
      {
LABEL_40:
        v20 = v20 + v26;
        *(p_maxAcceleration - 2) = v20;
        goto LABEL_41;
      }
    }
    else if (v26 >= v22)
    {
      goto LABEL_40;
    }
    *(p_maxAcceleration - 1) = v22;
    v26 = v22;
    goto LABEL_40;
  }
  v14 = 0.0;
  if (self->_chipSpring[5].value <= 0.999)
    goto LABEL_21;
  for (i = 0; i != 6; ++i)
    self->_chipSpring[i].value = 1.0;
  self->_maxChipSize = 1.0;
  self->_averageChipSize = 1.0;
}

- (void)_updateSiriPhysics:(float)a3
{
  float time;
  _BOOL4 reduceMotion;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float value;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float curVelocity;
  float maxAcceleration;
  float v22;
  float v23;
  $DB819904906F9C60E9F5CE4A4AC513D5 *p_energySpring;
  float v25;
  float springAmount;
  double v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  $DB819904906F9C60E9F5CE4A4AC513D5 *p_specularSpring;
  int64_t renderMode;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  $DB819904906F9C60E9F5CE4A4AC513D5 *p_speakingSpring;
  float v61;
  double v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  $DB819904906F9C60E9F5CE4A4AC513D5 *p_thinkingSpring;
  float v71;
  float v72;
  double v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  _BOOL4 v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  double v88;
  double v89;
  double v90;
  float v91;
  float v92;
  float v93;
  double averageChipSize;
  float v95;
  float v96;
  float v97;
  float v98;
  double v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;

  self->_time = self->_time + a3;
  if (self->_renderMode != self->_mode)
    -[SUICOrbView _updateRenderModeWithDelta:](self, "_updateRenderModeWithDelta:", *(double *)&a3);
  -[SUICOrbView _updateChipsSizesForOnOff](self, "_updateChipsSizesForOnOff");
  time = self->_time;
  reduceMotion = self->_reduceMotion;
  v7 = (float)(time - self->_thinkingTimeStart) * 4.2 + 2.35619449;
  v8 = cosf(v7) * 0.5 + 0.5;
  if (reduceMotion)
    v9 = 0.0;
  else
    v9 = v8;
  v10 = self->_powerLevel * self->_powerLevel;
  if (reduceMotion)
  {
    v12 = 1.33;
  }
  else
  {
    v11 = v10 * 0.42 + 1.33000004;
    v12 = v11;
  }
  v13 = 1.0;
  value = v12;
  switch(self->_renderMode)
  {
    case 0:
      if (reduceMotion)
        value = self->_bubbleSpring.value;
      else
        value = 0.0;
      if (self->_maxChipSize < 0.25)
      {
        self->_drawingVeryLastFrame = 1;
        -[SUICOrbView _initSprings](self, "_initSprings");
        v13 = 1.0;
        self->_bubbleSpring.value = 0.0;
        self->_resetOnNextFrame = 1;
      }
      break;
    case 2:
      if (self->_startingThinkingModeNow)
      {
        if (self->_thinkingSpring.value < 0.025)
        {
          self->_thinkingTimeStart = time;
          v15 = (float)(self->_time - time) * 4.2 + 2.35619449;
          v16 = cosf(v15) * 0.5 + 0.5;
          if (reduceMotion)
            v9 = 0.0;
          else
            v9 = v16;
        }
        self->_startingThinkingModeNow = 0;
      }
      else if (self->_reduceThinkingModeFramerate && !self->_fullyThinkingModeNow && self->_thinkingSpring.value > 0.85)
      {
        -[SUICOrbView _startReducedFramerateForPerf](self, "_startReducedFramerateForPerf");
        self->_fullyThinkingModeNow = 1;
      }
      value = v9 * 0.33 + 1.0;
      v13 = 0.2;
      break;
    case 3:
      value = 1.0;
      v13 = 0.9;
      break;
    default:
      break;
  }
  self->_sinTime = v9;
  if (self->_drawingVeryLastFrame)
    goto LABEL_122;
  v17 = self->_bubbleSpring.value;
  v18 = (float)(value * self->_bubbleSpring.springAmount) + v17 * (1.0 - self->_bubbleSpring.springAmount);
  v19 = v18 - v17;
  if (v19 != 0.0)
  {
    curVelocity = self->_bubbleSpring.curVelocity;
    maxAcceleration = self->_bubbleSpring.maxAcceleration;
    v22 = v19 - curVelocity;
    if ((float)(v19 - curVelocity) <= maxAcceleration)
    {
      if (v22 >= (float)-maxAcceleration)
        v23 = curVelocity + v22;
      else
        v23 = curVelocity - maxAcceleration;
    }
    else
    {
      v23 = curVelocity + maxAcceleration;
    }
    self->_bubbleSpring.curVelocity = v23;
    if (v19 >= 0.0)
    {
      if (v23 <= v19)
      {
LABEL_39:
        self->_bubbleSpring.value = v17 + v23;
        goto LABEL_40;
      }
    }
    else if (v23 >= v19)
    {
      goto LABEL_39;
    }
    self->_bubbleSpring.curVelocity = v19;
    v23 = v19;
    goto LABEL_39;
  }
LABEL_40:
  p_energySpring = &self->_energySpring;
  if (self->_renderMode == 3)
    v25 = v12;
  else
    v25 = value;
  springAmount = self->_energySpring.springAmount;
  v27 = (float)(springAmount * v25);
  v28 = p_energySpring->value;
  v29 = v27 + p_energySpring->value * (1.0 - springAmount);
  v30 = v29 - p_energySpring->value;
  if (v30 != 0.0)
  {
    v31 = self->_energySpring.curVelocity;
    v32 = self->_energySpring.maxAcceleration;
    v33 = v30 - v31;
    if ((float)(v30 - v31) <= v32)
    {
      if (v33 >= (float)-v32)
        v34 = v31 + v33;
      else
        v34 = v31 - v32;
    }
    else
    {
      v34 = v31 + v32;
    }
    self->_energySpring.curVelocity = v34;
    if (v30 >= 0.0)
    {
      if (v34 <= v30)
      {
LABEL_54:
        p_energySpring->value = v28 + v34;
        goto LABEL_55;
      }
    }
    else if (v34 >= v30)
    {
      goto LABEL_54;
    }
    self->_energySpring.curVelocity = v30;
    v34 = v30;
    goto LABEL_54;
  }
LABEL_55:
  v35 = self->_volumeSpring.value;
  v36 = (float)(v10 * self->_volumeSpring.springAmount) + v35 * (1.0 - self->_volumeSpring.springAmount);
  v37 = v36 - v35;
  if (v37 == 0.0)
    goto LABEL_67;
  v38 = self->_volumeSpring.curVelocity;
  v39 = self->_volumeSpring.maxAcceleration;
  v40 = v37 - v38;
  if ((float)(v37 - v38) <= v39)
  {
    if (v40 >= (float)-v39)
      v41 = v38 + v40;
    else
      v41 = v38 - v39;
  }
  else
  {
    v41 = v38 + v39;
  }
  self->_volumeSpring.curVelocity = v41;
  if (v37 < 0.0)
  {
    if (v41 >= v37)
      goto LABEL_66;
    goto LABEL_65;
  }
  if (v41 > v37)
  {
LABEL_65:
    self->_volumeSpring.curVelocity = v37;
    v41 = v37;
  }
LABEL_66:
  self->_volumeSpring.value = v35 + v41;
LABEL_67:
  v42 = self->_chipsSpring.value;
  v43 = (float)(v13 * self->_chipsSpring.springAmount) + v42 * (1.0 - self->_chipsSpring.springAmount);
  v44 = v43 - v42;
  if (v44 == 0.0)
    goto LABEL_79;
  v45 = self->_chipsSpring.curVelocity;
  v46 = self->_chipsSpring.maxAcceleration;
  v47 = v44 - v45;
  if ((float)(v44 - v45) <= v46)
  {
    if (v47 >= (float)-v46)
      v48 = v45 + v47;
    else
      v48 = v45 - v46;
  }
  else
  {
    v48 = v45 + v46;
  }
  self->_chipsSpring.curVelocity = v48;
  if (v44 < 0.0)
  {
    if (v48 >= v44)
      goto LABEL_78;
    goto LABEL_77;
  }
  if (v48 > v44)
  {
LABEL_77:
    self->_chipsSpring.curVelocity = v44;
    v48 = v44;
  }
LABEL_78:
  self->_chipsSpring.value = v42 + v48;
LABEL_79:
  p_specularSpring = &self->_specularSpring;
  renderMode = self->_renderMode;
  v51 = 1.0;
  if (renderMode == 2)
    v52 = 0.0;
  else
    v52 = 1.0;
  v53 = p_specularSpring->value;
  v54 = (float)(self->_specularSpring.springAmount * v52)
      + p_specularSpring->value * (1.0 - self->_specularSpring.springAmount);
  v55 = v54 - p_specularSpring->value;
  if (v55 != 0.0)
  {
    v56 = self->_specularSpring.curVelocity;
    v57 = self->_specularSpring.maxAcceleration;
    v58 = v55 - v56;
    if ((float)(v55 - v56) <= v57)
    {
      if (v58 >= (float)-v57)
        v59 = v56 + v58;
      else
        v59 = v56 - v57;
    }
    else
    {
      v59 = v56 + v57;
    }
    self->_specularSpring.curVelocity = v59;
    if (v55 >= 0.0)
    {
      if (v59 <= v55)
      {
LABEL_93:
        p_specularSpring->value = v53 + v59;
        renderMode = self->_renderMode;
        goto LABEL_94;
      }
    }
    else if (v59 >= v55)
    {
      goto LABEL_93;
    }
    self->_specularSpring.curVelocity = v55;
    v59 = v55;
    goto LABEL_93;
  }
LABEL_94:
  p_speakingSpring = &self->_speakingSpring;
  if (renderMode != 3)
    v51 = 0.0;
  v61 = self->_speakingSpring.springAmount;
  v62 = (float)(v61 * v51);
  v63 = p_speakingSpring->value;
  v64 = v62 + p_speakingSpring->value * (1.0 - v61);
  v65 = v64 - p_speakingSpring->value;
  if (v65 != 0.0)
  {
    v66 = self->_speakingSpring.curVelocity;
    v67 = self->_speakingSpring.maxAcceleration;
    v68 = v65 - v66;
    if ((float)(v65 - v66) <= v67)
    {
      if (v68 >= (float)-v67)
        v69 = v66 + v68;
      else
        v69 = v66 - v67;
    }
    else
    {
      v69 = v66 + v67;
    }
    self->_speakingSpring.curVelocity = v69;
    if (v65 >= 0.0)
    {
      if (v69 <= v65)
      {
LABEL_107:
        p_speakingSpring->value = v63 + v69;
        renderMode = self->_renderMode;
        goto LABEL_108;
      }
    }
    else if (v69 >= v65)
    {
      goto LABEL_107;
    }
    self->_speakingSpring.curVelocity = v65;
    v69 = v65;
    goto LABEL_107;
  }
LABEL_108:
  p_thinkingSpring = &self->_thinkingSpring;
  v71 = 0.0;
  if (renderMode == 2)
    v71 = 1.0;
  v72 = self->_thinkingSpring.springAmount;
  v73 = (float)(v72 * v71);
  v74 = p_thinkingSpring->value;
  v75 = v73 + p_thinkingSpring->value * (1.0 - v72);
  v76 = v75 - p_thinkingSpring->value;
  if (v76 != 0.0)
  {
    v77 = self->_thinkingSpring.curVelocity;
    v78 = self->_thinkingSpring.maxAcceleration;
    v79 = v76 - v77;
    if ((float)(v76 - v77) <= v78)
    {
      if (v79 >= (float)-v78)
        v80 = v77 + v79;
      else
        v80 = v77 - v78;
    }
    else
    {
      v80 = v77 + v78;
    }
    self->_thinkingSpring.curVelocity = v80;
    if (v76 >= 0.0)
    {
      if (v80 <= v76)
      {
LABEL_121:
        p_thinkingSpring->value = v74 + v80;
        goto LABEL_122;
      }
    }
    else if (v80 >= v76)
    {
      goto LABEL_121;
    }
    self->_thinkingSpring.curVelocity = v76;
    v80 = v76;
    goto LABEL_121;
  }
LABEL_122:
  v81 = self->_bubbleSpring.value * 1.15;
  self->_bubbleDrawnSize = v81;
  v82 = self->_reduceMotion;
  if (!self->_reduceMotion)
    self->_bubbleDrawnSize = self->_averageChipSize * v81;
  v83 = fabsf(self->_energySpring.curVelocity);
  v84 = fabsf(self->_bubbleSpring.curVelocity);
  v85 = fabsf(self->_speakingSpring.curVelocity);
  v86 = fabsf(self->_thinkingSpring.curVelocity);
  v87 = v83 * 3.0;
  v88 = self->_energySpring.value;
  if (v88 <= 1.33)
  {
    v90 = a3;
  }
  else
  {
    v89 = (v88 + -1.33) * 10.0;
    v90 = a3;
    v87 = v87 + v89 * a3;
  }
  v91 = 1.0;
  if (!v82)
    v91 = 10.0;
  v92 = v87 + (float)((float)(v91 * self->_volumeSpring.value) * a3);
  v93 = fmaxf(self->_onSpring.curVelocity, 0.0);
  averageChipSize = self->_averageChipSize;
  v95 = v92 + v93 * 20.0 * averageChipSize;
  v96 = v95 + v84 * 4.0 * averageChipSize;
  v97 = v96 + v85 * 4.0;
  v98 = v97 + v86 * 4.0;
  v99 = v90 * 25.0;
  if (v99 < v98)
  {
    v100 = v99;
    v98 = v100;
  }
  self->_rotationEnergy = v98;
  v101 = self->_volumeSpring.value
       + (float)((float)((float)((float)((float)(v85 * 5.0) + (float)(v83 * 10.0)) + (float)(v84 * 5.0))
                       + (float)(v93 * 20.0))
               * self->_framerateEnergyModifier);
  if (v101 > 1.3)
    v101 = 1.3;
  v102 = self->_maxChipSize * v101;
  v103 = self->_glowSpring.value;
  v104 = (float)(self->_glowSpring.springAmount * v102) + v103 * (1.0 - self->_glowSpring.springAmount);
  v105 = v104 - v103;
  if (v105 != 0.0)
  {
    v106 = self->_glowSpring.curVelocity;
    v107 = self->_glowSpring.maxAcceleration;
    v108 = v105 - v106;
    if ((float)(v105 - v106) <= v107)
    {
      if (v108 >= (float)-v107)
        v109 = v106 + v108;
      else
        v109 = v106 - v107;
    }
    else
    {
      v109 = v106 + v107;
    }
    self->_glowSpring.curVelocity = v109;
    if (v105 >= 0.0)
    {
      if (v109 <= v105)
      {
LABEL_144:
        self->_glowSpring.value = v103 + v109;
        goto LABEL_145;
      }
    }
    else if (v109 >= v105)
    {
      goto LABEL_144;
    }
    self->_glowSpring.curVelocity = v105;
    v109 = v105;
    goto LABEL_144;
  }
LABEL_145:
  self->_frameEnergy = v102;
}

- (void)_updateSiriGraphicsState:(double)a3
{
  _OWORD *uniformBufferAddress;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  float v12;
  float32x4_t v13;
  float32x4_t v14;
  uint64_t v15;
  float32x4_t v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v27;
  float v28;
  float v29;
  float v30;
  double value;
  uint64_t v32;
  __int32 v33;
  __int32 v34;
  float v35;
  float32x4_t v36;
  __float2 v37;
  __float2 v38;
  float32x4_t v39;
  __float2 v40;
  uint64_t v41;
  __int128 v42;
  unint64_t v43;
  __int128 v44;
  uint64_t v45;
  float32x4_t cosval_low;
  float32x4_t v47;
  float32x4_t v48;
  float v49;
  float v50;
  __float2 v51;
  uint64_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float v56;
  float32x4_t v57;
  float32x4_t v58;
  uint64_t v59;
  uint64_t v60;
  float32x4_t v61;
  uint64_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD *v69;
  unsigned __int8 *anon_2f0;
  float32x4_t v71;
  _OWORD *v72;
  float32x4_t v73;
  float32x4_t v74;
  __int128 v75;
  __int128 v76;
  __int32 v77;
  __int128 v78;
  float32x4_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;

  uniformBufferAddress = self->_uniformBufferAddress;
  v5 = *(_OWORD *)&self->_anon_2b0[48];
  v7 = *(_OWORD *)self->_anon_2b0;
  v6 = *(_OWORD *)&self->_anon_2b0[16];
  uniformBufferAddress[2] = *(_OWORD *)&self->_anon_2b0[32];
  uniformBufferAddress[3] = v5;
  *uniformBufferAddress = v7;
  uniformBufferAddress[1] = v6;
  v72 = uniformBufferAddress;
  v8 = *(_OWORD *)&self->_anon_2b0[32];
  v9 = *(_OWORD *)&self->_anon_2b0[48];
  v11 = *(_OWORD *)self->_anon_2b0;
  v10 = *(_OWORD *)&self->_anon_2b0[16];
  *(_OWORD *)&self->_anon_2f0[32] = v8;
  *(_OWORD *)&self->_anon_2f0[48] = v9;
  *(_OWORD *)self->_anon_2f0 = v11;
  *(_OWORD *)&self->_anon_2f0[16] = v10;
  *(float *)&self->_anon_2f0[80] = self->_bubbleDrawnSize;
  if (self->_reduceMotion)
  {
    LODWORD(v8) = 961656599;
  }
  else
  {
    *(double *)&v8 = self->_frameEnergy * 0.002;
    *(float *)&v8 = *(double *)&v8;
  }
  v12 = a3;
  v13.i32[3] = 0;
  v14 = vaddq_f32(*(float32x4_t *)&self->_anon_2f0[64], vmlaq_n_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v8, 0), (float32x4_t)xmmword_1A377E730, v12));
  *(float32x4_t *)&self->_anon_2f0[64] = v14;
  if (v14.f32[0] > 2.0)
  {
    v13.f32[0] = v14.f32[0] + -2.0;
    HIDWORD(v15) = v14.i32[1];
    *(float *)&v15 = v14.f32[0] + -2.0;
    v13.i32[1] = v14.i32[1];
    v13.i32[2] = v14.i32[2];
    *(_DWORD *)&self->_anon_2f0[72] = v14.i32[2];
    *(_QWORD *)&self->_anon_2f0[64] = v15;
    v14 = v13;
  }
  if (v14.f32[1] > 2.0)
  {
    v16 = v14;
    v16.f32[1] = v14.f32[1] + -2.0;
    *(_QWORD *)&self->_anon_2f0[64] = v16.i64[0];
    v16.i32[2] = v14.i32[2];
    *(_DWORD *)&self->_anon_2f0[72] = v14.i32[2];
    v14 = v16;
  }
  if (v14.f32[2] > 2.0)
  {
    *(float *)&self->_anon_2f0[72] = v14.f32[2] + -2.0;
    *(_QWORD *)&self->_anon_2f0[64] = v14.i64[0];
  }
  anon_2f0 = self->_anon_2f0;
  v17 = 0;
  v18 = a3 * 1.25663706;
  v19 = v18 + (float)(self->_sinTime * (float)((float)(v18 * 4.0) - v18));
  if (self->_reduceMotion)
    v19 = v19 * 0.5;
  v20 = self->_thinkRotation + v19;
  if (v20 > 6.28318531)
  {
    v21 = v20 + -6.28318531;
    v20 = v21;
  }
  _S3 = self->_thinkingSpring.value;
  __asm { FCVT            H3, S3 }
  *((_WORD *)uniformBufferAddress + 232) = LOWORD(_S3);
  self->_thinkRotation = v20;
  v27 = a3 * 0.7;
  v28 = v27 + self->_rotationEnergy * 0.5;
  v29 = (float)((float)((float)(v27 * 8.0) * self->_thinkingSpring.value)
              + (float)((float)(1.0 - self->_thinkingSpring.value) * v28))
      * (float)((float)(1.0 - self->_speakingSpring.value) + (float)(self->_speakingSpring.value * 0.5));
  if (!_ZF)
  {
    v30 = v29 * 0.4;
    v29 = v30;
  }
  self->_chipRotation = self->_chipRotation + v29;
  value = self->_thinkingSpring.value;
  v71 = (float32x4_t)vdupq_n_s32(0x41490FDBu);
  do
  {
    noise2();
    v79.i64[0] = v32;
    noise2();
    v77 = v33;
    noise2();
    v35 = 1.0;
    if (!self->_reduceMotion)
      v35 = self->_chipSpring[v17].value;
    v36 = v79;
    v36.i32[1] = v77;
    v36.i32[2] = v34;
    v79 = vmulq_f32(v36, v71);
    v37 = __sincosf_stret(v79.f32[2]);
    v38 = __sincosf_stret(v79.f32[0]);
    v39.i32[0] = 0;
    v39.i32[1] = LODWORD(v38.__cosval);
    v39.i64[1] = LODWORD(v38.__sinval);
    v74 = v39;
    v39.i32[0] = 0;
    v39.f32[1] = -v38.__sinval;
    v39.i64[1] = LODWORD(v38.__cosval);
    v73 = v39;
    v40 = __sincosf_stret(v79.f32[1]);
    v41 = 0;
    HIDWORD(v42) = 0;
    *(_QWORD *)&v42 = LODWORD(v40.__cosval);
    *((float *)&v42 + 2) = -v40.__sinval;
    LODWORD(v43) = 0;
    *((float *)&v43 + 1) = v40.__cosval + (float)(1.0 - v40.__cosval);
    *(_QWORD *)&v44 = LODWORD(v40.__sinval);
    *((_QWORD *)&v44 + 1) = LODWORD(v40.__cosval);
    v80 = v42;
    v81 = v43;
    v82 = v44;
    v83 = xmmword_1A377E0D0;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    do
    {
      *(__int128 *)((char *)&v84 + v41) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(v38.__cosval + (float)(1.0 - v38.__cosval)), COERCE_FLOAT(*(__int128 *)((char *)&v80 + v41))), v74, *(float32x2_t *)((char *)&v80 + v41), 1), v73, *(float32x4_t *)((char *)&v80 + v41), 2), (float32x4_t)xmmword_1A377E0D0, *(float32x4_t *)((char *)&v80 + v41), 3);
      v41 += 16;
    }
    while (v41 != 64);
    v45 = 0;
    v47 = (float32x4_t)COERCE_UNSIGNED_INT(-v37.__sinval);
    cosval_low = (float32x4_t)LODWORD(v37.__cosval);
    cosval_low.i32[1] = LODWORD(v37.__sinval);
    v47.i32[1] = LODWORD(v37.__cosval);
    v48.i64[0] = 0;
    v80 = v84;
    v81 = v85;
    v82 = v86;
    v83 = v87;
    v84 = 0uLL;
    v85 = 0uLL;
    v86 = 0uLL;
    v87 = 0uLL;
    do
    {
      v48.i64[1] = COERCE_UNSIGNED_INT(v37.__cosval + (float)(1.0 - v37.__cosval));
      *(__int128 *)((char *)&v84 + v45) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(cosval_low, COERCE_FLOAT(*(__int128 *)((char *)&v80 + v45))), v47, *(float32x2_t *)((char *)&v80 + v45), 1), v48, *(float32x4_t *)((char *)&v80 + v45), 2), (float32x4_t)xmmword_1A377E0D0, *(float32x4_t *)((char *)&v80 + v45), 3);
      v45 += 16;
    }
    while (v45 != 64);
    if (value <= 0.0001)
    {
      v62 = 0;
      v63.i32[1] = 0;
      v63.i64[1] = 0;
      v63.f32[0] = (float)(v35 * self->_chipsSpring.value) * self->_bubbleSpring.value;
      v64.i32[0] = 0;
      v64.i64[1] = 0;
      v64.f32[1] = v63.f32[0];
      v65.i64[0] = 0;
      v65.i32[3] = 0;
      v65.f32[2] = v63.f32[0];
      v80 = v84;
      v81 = v85;
      v82 = v86;
      v83 = v87;
      v84 = 0uLL;
      v85 = 0uLL;
      v86 = 0uLL;
      v87 = 0uLL;
      do
      {
        *(__int128 *)((char *)&v84 + v62) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v63, COERCE_FLOAT(*(__int128 *)((char *)&v80 + v62))), v64, *(float32x2_t *)((char *)&v80 + v62), 1), v65, *(float32x4_t *)((char *)&v80 + v62), 2), (float32x4_t)xmmword_1A377E0D0, *(float32x4_t *)((char *)&v80 + v62), 3);
        v62 += 16;
      }
      while (v62 != 64);
    }
    else
    {
      v49 = ((double)(int)v17 + (double)(int)v17) * 3.14159265 / 6.0 - self->_thinkRotation;
      v50 = self->_thinkingSpring.value;
      v78 = v86;
      v79 = (float32x4_t)v87;
      v75 = v84;
      v76 = v85;
      v51 = __sincosf_stret(v49);
      v52 = 0;
      v53.i32[1] = 0;
      v53.i64[1] = 0;
      v53.f32[0] = v35 * self->_chipsSpring.value;
      v54.i32[0] = 0;
      v54.i64[1] = 0;
      v54.f32[1] = v53.f32[0];
      v55.i64[0] = 0;
      v55.i32[3] = 0;
      v55.f32[2] = v53.f32[0];
      v56 = self->_bubbleSpring.value;
      v57.i32[2] = 0;
      v57.i32[3] = 1.0;
      v58.i32[0] = 0;
      v58.i64[1] = 0;
      v58.f32[1] = v56;
      v80 = v75;
      v81 = v76;
      v82 = v78;
      v83 = (__int128)v79;
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      do
      {
        *(__int128 *)((char *)&v84 + v52) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, COERCE_FLOAT(*(__int128 *)((char *)&v80 + v52))), v54, *(float32x2_t *)((char *)&v80 + v52), 1), v55, *(float32x4_t *)((char *)&v80 + v52), 2), (float32x4_t)xmmword_1A377E0D0, *(float32x4_t *)((char *)&v80 + v52), 3);
        v52 += 16;
      }
      while (v52 != 64);
      v59 = 0;
      v80 = v84;
      v81 = v85;
      v82 = v86;
      v83 = v87;
      v84 = 0uLL;
      v85 = 0uLL;
      v86 = 0uLL;
      v87 = 0uLL;
      do
      {
        v57.f32[1] = (float)(v50 * v51.__sinval) * 0.75;
        v57.f32[0] = (float)(v50 * v51.__cosval) * 0.75;
        *(__int128 *)((char *)&v84 + v59) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1A377E0B0, COERCE_FLOAT(*(__int128 *)((char *)&v80 + v59))), (float32x4_t)xmmword_1A377E0A0, *(float32x2_t *)((char *)&v80 + v59), 1), (float32x4_t)xmmword_1A377E090, *(float32x4_t *)((char *)&v80 + v59), 2), v57, *(float32x4_t *)((char *)&v80 + v59), 3);
        v59 += 16;
      }
      while (v59 != 64);
      v60 = 0;
      v61.i64[0] = 0;
      v61.i64[1] = LODWORD(v56);
      v80 = v84;
      v81 = v85;
      v82 = v86;
      v83 = v87;
      v84 = 0uLL;
      v85 = 0uLL;
      v86 = 0uLL;
      v87 = 0uLL;
      do
      {
        *(__int128 *)((char *)&v84 + v60) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v56), COERCE_FLOAT(*(__int128 *)((char *)&v80 + v60))), v58, *(float32x2_t *)((char *)&v80 + v60), 1), v61, *(float32x4_t *)((char *)&v80 + v60), 2), (float32x4_t)xmmword_1A377E0D0, *(float32x4_t *)((char *)&v80 + v60), 3);
        v60 += 16;
      }
      while (v60 != 64);
    }
    v66 = v85;
    v67 = v86;
    v68 = v87;
    v69 = &v72[4 * v17];
    v69[4] = v84;
    v69[5] = v66;
    v69[6] = v67;
    v69[7] = v68;
    ++v17;
  }
  while (v17 != 6);
  v72[28] = *((_OWORD *)anon_2f0 + 4);
}

- (void)_drawingVeryLastFrameLogic:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUICOrbView _setPaused:](self, "_setPaused:", 1);
  -[CAMetalLayer removeBackBuffers](self->_metalLayer, "removeBackBuffers");
  objc_initWeak(&location, self);
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[SUICOrbView _drawingVeryLastFrameLogic:]";
    _os_log_impl(&dword_1A3752000, v6, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion drawing  last frame", buf, 0xCu);
  }
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__SUICOrbView__drawingVeryLastFrameLogic___block_invoke;
    v9[3] = &unk_1E4A553B0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "addCompletedHandler:", v9);
    objc_destroyWeak(&v10);
  }
  else
  {
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[SUICOrbView _drawingVeryLastFrameLogic:]";
      _os_log_impl(&dword_1A3752000, v7, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion calling completion async", buf, 0xCu);
    }
    v8 = objc_loadWeakRetained(&location);
    objc_msgSend(v8, "_drawingVeryLastFrameOffCompletion");

  }
  self->_drawingVeryLastFrame = 0;
  objc_destroyWeak(&location);

}

void __42__SUICOrbView__drawingVeryLastFrameLogic___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SUICOrbView _drawingVeryLastFrameLogic:]_block_invoke";
    _os_log_impl(&dword_1A3752000, v2, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion calling completion in command buffer completion", (uint8_t *)&v4, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_drawingVeryLastFrameOffCompletion");

}

- (void)_drawingVeryLastFrameOffCompletion
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SUICOrbView__drawingVeryLastFrameOffCompletion__block_invoke;
  block[3] = &unk_1E4A54D08;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __49__SUICOrbView__drawingVeryLastFrameOffCompletion__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440))
  {
    v2 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[SUICOrbView _drawingVeryLastFrameOffCompletion]_block_invoke";
      _os_log_impl(&dword_1A3752000, v2, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion completion exists", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440) + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 440);
    *(_QWORD *)(v3 + 440) = 0;

  }
}

- (void)_drawSiriFrame:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int maxPhysicsIterationsPerFrame;
  double v13;
  float v14;
  float v15;
  float v16;
  float oneOverFPS;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MPSImageGaussianBlur *mpsBlur;
  void *v24;
  void *v25;
  MPSImageGaussianBlur *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  float averageChipSize;
  float v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  float v46;
  int v47;
  float v48;
  float v49;
  float v50;
  __int128 v51;
  int64_t z;

  v4 = a3;
  if (self->_resetOnNextFrame)
  {
    self->_resetOnNextFrame = 0;
    -[SUICOrbView _initSprings](self, "_initSprings");
  }
  if (self->_reallocTextures)
  {
    v5 = (double)(int)*(_QWORD *)self->_setupRasterSize;
    v6 = (double)(int)HIDWORD(*(_QWORD *)self->_setupRasterSize);
    *(_QWORD *)self->_setupRasterSize = 0;
    -[SUICOrbView _updateMetalTextureRasterSize:](self, "_updateMetalTextureRasterSize:", v5, v6);
    self->_reallocTextures = 0;
  }
  if (!self->_drawingVeryLastFrame)
  {
    -[SUICOrbView _updateDynamicBufferState](self, "_updateDynamicBufferState");
    if (self->_dynamicFramerate)
    {
      objc_msgSend(v4, "targetTimestamp");
      v9 = v8;
      objc_msgSend(v4, "timestamp");
      v11 = v9 - v10;
      maxPhysicsIterationsPerFrame = (int)(v11 / self->_physicsRate + 0.5);
      if (self->_maxPhysicsIterationsPerFrame < maxPhysicsIterationsPerFrame)
        maxPhysicsIterationsPerFrame = self->_maxPhysicsIterationsPerFrame;
      if (maxPhysicsIterationsPerFrame <= 1)
        maxPhysicsIterationsPerFrame = 1;
      v13 = v11 / (double)maxPhysicsIterationsPerFrame;
      v14 = v13;
      v15 = (float)maxPhysicsIterationsPerFrame;
      v16 = 0.0;
      do
      {
        *(float *)&v13 = v14;
        -[SUICOrbView _updateSiriPhysics:](self, "_updateSiriPhysics:", v13);
        v16 = v16 + 1.0;
      }
      while (!self->_drawingVeryLastFrame && v16 < v15);
    }
    else
    {
      oneOverFPS = self->_oneOverFPS;
      *(float *)&v7 = oneOverFPS;
      -[SUICOrbView _updateSiriPhysics:](self, "_updateSiriPhysics:", v7);
      v11 = oneOverFPS;
    }
    -[SUICOrbView _updateSiriGraphicsState:](self, "_updateSiriGraphicsState:", v11);
  }
  if (-[CAMetalLayer isDrawableAvailable](self->_metalLayer, "isDrawableAvailable"))
  {
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = v19;
      v45 = v4;
      objc_msgSend(v19, "setLabel:", CFSTR("Siri Chips"));
      objc_msgSend(v20, "renderCommandEncoderWithDescriptor:", self->_siriChipRenderPassDesc);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setLabel:", CFSTR("Chips"));
      objc_msgSend(v21, "setCullMode:", 1);
      objc_msgSend(v21, "setRenderPipelineState:", self->_siriChipBackfacePipeline);
      objc_msgSend(v21, "setVertexBuffer:offset:atIndex:", self->_siriChipGeom, 0, 0);
      objc_msgSend(v21, "setVertexBuffer:offset:atIndex:", self->_dynamicUniformBuffer, 0, 1);
      objc_msgSend(v21, "setVertexTexture:atIndex:", self->_noiseTexture, 0);
      objc_msgSend(v21, "setFragmentBytes:length:atIndex:", &_drawSiriFrame__chipConstants, 24, 0);
      objc_msgSend(v21, "setFragmentBytes:length:atIndex:", &self->_glowSpring, 4, 1);
      objc_msgSend(v21, "setFragmentTexture:atIndex:", self->_smoothStepTexture, 0);
      objc_msgSend(v21, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", 3, self->_chipNumIndexes, 0, self->_siriChipGeom, self->_chipIndexBufferOffset, self->_numberOfChips);
      objc_msgSend(v21, "setCullMode:", 2);
      objc_msgSend(v21, "setRenderPipelineState:", self->_siriChipFrontfacePipeline);
      objc_msgSend(v21, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", 3, self->_chipNumIndexes, 0, self->_siriChipGeom, self->_chipIndexBufferOffset, self->_numberOfChips);
      objc_msgSend(v21, "endEncoding");
      objc_msgSend(v20, "commit");
      objc_msgSend(v20, "waitUntilScheduled");
      -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setLabel:", CFSTR("Siri Blur"));
      mpsBlur = self->_mpsBlur;
      v51 = *(_OWORD *)&self->_mpsChipBlurOffset.x;
      z = self->_mpsChipBlurOffset.z;
      -[MPSImageGaussianBlur setOffset:](mpsBlur, "setOffset:", &v51);
      -[MPSImageGaussianBlur encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_mpsBlur, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v22, self->_siriChipsTexture, self->_blurChipsTexture);
      objc_msgSend(v22, "commit");
      objc_msgSend(v22, "waitUntilScheduled");
      -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setLabel:", CFSTR("Siri Mask"));
      objc_msgSend(v24, "renderCommandEncoderWithDescriptor:", self->_sphereMaskRenderPassDesc);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setLabel:", CFSTR("Mask"));
      objc_msgSend(v25, "setRenderPipelineState:", self->_sphereMaskPipeline);
      objc_msgSend(v25, "setVertexBuffer:offset:atIndex:", self->_sphereGeom, 0, 0);
      objc_msgSend(v25, "setVertexTexture:atIndex:", self->_noiseTexture, 0);
      objc_msgSend(v25, "setVertexBytes:length:atIndex:");
      objc_msgSend(v25, "setFrontFacingWinding:", 0);
      objc_msgSend(v25, "setFrontFacingWinding:", 1);
      objc_msgSend(v25, "setCullMode:", 2);
      objc_msgSend(v25, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, self->_sphereNumIndexes, 0, self->_sphereGeom, self->_sphereIndexBufferOffet);
      objc_msgSend(v25, "endEncoding");
      v26 = self->_mpsBlur;
      v51 = 0uLL;
      z = 0;
      -[MPSImageGaussianBlur setOffset:](v26, "setOffset:", &v51);
      -[MPSImageGaussianBlur encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_mpsBlur, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v24, self->_sphereMaskTexture, self->_blurMaskTexture);
      objc_msgSend(v24, "commit");
      -[CAMetalLayer nextDrawable](self->_metalLayer, "nextDrawable");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        v44 = v27;
        objc_msgSend(v27, "texture");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTLRenderPassDescriptor colorAttachments](self->_finalRenderPassDesc, "colorAttachments");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setResolveTexture:", v29);

        -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "setLabel:", CFSTR("Siri Composite"));
        objc_msgSend(v32, "renderCommandEncoderWithDescriptor:", self->_finalRenderPassDesc);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setLabel:", CFSTR("Composite"));
        objc_msgSend(v33, "setVertexBytes:length:atIndex:", &self->_bubbleDrawnSize, 4, 0);
        *(float *)&v51 = (float)(1.0 - self->_thinkingSpring.value)
                       + (float)(self->_thinkingSpring.value + self->_thinkingSpring.value);
        objc_msgSend(v33, "setVertexBytes:length:atIndex:", &v51, 4, 1);
        averageChipSize = 1.0;
        if (self->_reduceMotion)
          averageChipSize = self->_averageChipSize;
        v50 = averageChipSize;
        objc_msgSend(v33, "setFragmentTexture:atIndex:", self->_blurChipsTexture, 0);
        objc_msgSend(v33, "setRenderPipelineState:", self->_siriShadowPipeline);
        objc_msgSend(v33, "setFragmentTexture:atIndex:", self->_blurMaskTexture, 1);
        v49 = (float)((float)((float)(self->_thinkingSpring.value * 0.3)
                            + (float)((float)(1.0 - self->_thinkingSpring.value) * 0.6))
                    * self->_maxChipSize)
            * averageChipSize;
        objc_msgSend(v33, "setFragmentBytes:length:atIndex:", &v49, 4, 0);
        objc_msgSend(v33, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 48);
        objc_msgSend(v33, "setFrontFacingWinding:", 1);
        objc_msgSend(v33, "setCullMode:", 2);
        objc_msgSend(v33, "setRenderPipelineState:", self->_siriCompositePipeline);
        objc_msgSend(v33, "setVertexBuffer:offset:atIndex:", self->_sphereGeom, 0, 0);
        objc_msgSend(v33, "setVertexTexture:atIndex:", self->_noiseTexture, 0);
        v48 = (float)(1.0 - self->_thinkingSpring.value) + (float)(self->_thinkingSpring.value * 0.5);
        objc_msgSend(v33, "setFragmentBytes:length:atIndex:", &v48, 4, 0);
        v47 = 1114636288;
        objc_msgSend(v33, "setFragmentBytes:length:atIndex:", &v47, 4, 1);
        v35 = 1.0 - pow(1.0 - self->_averageChipSize, 4.0);
        if (self->_reduceMotion)
          v35 = 1.0;
        v46 = self->_specularSpring.value * v35;
        objc_msgSend(v33, "setFragmentBytes:length:atIndex:", &v46, 4, 2);
        objc_msgSend(v33, "setFragmentBytes:length:atIndex:", &v50, 4, 3);
        objc_msgSend(v33, "setVertexBytes:length:atIndex:", self->_anon_2f0, 96, 2);
        objc_msgSend(v33, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, self->_sphereNumIndexes, 0, self->_sphereGeom, self->_sphereIndexBufferOffet);
        objc_msgSend(v33, "setCullMode:", 0);
        objc_msgSend(v33, "setRenderPipelineState:", self->_siriAddBlitPipeline);
        objc_msgSend(v33, "setFragmentTexture:atIndex:", self->_siriChipsTexture, 0);
        objc_msgSend(v33, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 3);
        objc_msgSend(v33, "endEncoding");
        v28 = v44;
        objc_msgSend(v32, "presentDrawable:", v44);
        if (self->_drawingVeryLastFrame)
          -[SUICOrbView _drawingVeryLastFrameLogic:](self, "_drawingVeryLastFrameLogic:", v32);
        objc_msgSend(v32, "commit");

      }
      else
      {
        v32 = v24;
      }

      v4 = v45;
    }
    else
    {
      v36 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
        -[SUICOrbView _drawSiriFrame:].cold.1(v36, v37, v38, v39, v40, v41, v42, v43);
    }
  }
  else if (self->_drawingVeryLastFrame)
  {
    -[SUICOrbView _drawingVeryLastFrameLogic:](self, "_drawingVeryLastFrameLogic:", 0);
  }

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  float v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)SUICOrbView;
  -[SUICOrbView setFrame:](&v9, sel_setFrame_, a3.origin.x, a3.origin.y);
  if (self->_device)
  {
    -[SUICOrbView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentsScale");
    v8 = v7;

    -[SUICOrbView _updateMetalTextureRasterSize:](self, "_updateMetalTextureRasterSize:", width * v8, height * v8);
  }
}

- (void)_updateMetalTextureRasterSize:(CGSize)a3
{
  int32x2_t v3;
  int32x2_t v4;
  int width;
  int height;
  uint32x2_t v8;
  double v9;
  double v10;
  double v11;
  float v13;
  id v14;
  double v15;
  MPSImageGaussianBlur *v16;
  MPSImageGaussianBlur *mpsBlur;
  int v18;
  int v19;
  int v20;
  float v21;
  float v22;
  MTLTexture *siriChipsTexture;
  int v24;
  MTLTexture *blurChipsTexture;
  MTLTexture *sphereMaskTexture;
  MTLTexture *blurMaskTexture;
  id v28;
  MTLTexture *siriChipsTextureMSAA;
  MTLTexture *v30;
  MTLTexture *v31;
  MTLTexture *compositeTextureMSAA;
  MTLTexture *v33;
  MTLTexture *v34;
  MTLTexture *v35;
  MTLTexture *v36;
  MTLTexture *v37;
  MTLTexture *v38;
  MTLTexture *v39;
  MTLTexture *v40;
  MTLTexture *v41;
  MTLTexture *v42;
  MTLTexture *v43;
  void *v44;
  void *v45;
  MTLTexture *v46;
  void *v47;
  void *v48;
  MTLTexture *v49;
  void *v50;
  void *v51;
  MTLTexture *v52;
  void *v53;
  int v54;
  uint32x2_t v55;
  int v56;
  double v57;
  void *v58;

  v3.i32[0] = 0;
  width = (int)a3.width;
  height = (int)a3.height;
  v8.i32[0] = (int)a3.width;
  v8.i32[1] = (int)a3.height;
  v4.i32[0] = (int)a3.height;
  v9 = COERCE_DOUBLE(vshl_u32(v8, (uint32x2_t)vdup_lane_s32((int32x2_t)vand_s8((int8x8_t)vcgt_s32(v3, v4), (int8x8_t)0x100000001), 0)));
  if ((int)a3.height > 254)
    v9 = *(double *)&v8;
  v55 = v8;
  v57 = v9;
  if (height <= 254)
    v10 = a3.width + a3.width;
  else
    v10 = a3.width;
  if (height <= 254)
    v11 = a3.height + a3.height;
  else
    v11 = a3.height;
  -[CAMetalLayer setDrawableSize:](self->_metalLayer, "setDrawableSize:", v10, v11);
  if (*(_QWORD *)self->_setupRasterSize != width || HIDWORD(*(_QWORD *)self->_setupRasterSize) != height)
  {
    *(uint32x2_t *)self->_setupRasterSize = v55;
    v13 = (double)SHIDWORD(v57) * 0.04;
    v14 = objc_alloc(MEMORY[0x1E0CC6E48]);
    *(float *)&v15 = v13;
    v16 = (MPSImageGaussianBlur *)objc_msgSend(v14, "initWithDevice:sigma:", self->_device, v15);
    mpsBlur = self->_mpsBlur;
    self->_mpsBlur = v16;

    v18 = LODWORD(v57) + 3;
    v19 = HIDWORD(v57) + 3;
    if (v57 < 0.0)
    {
      v20 = HIDWORD(v57) + 1;
    }
    else
    {
      v19 = HIDWORD(v57);
      v20 = HIDWORD(v57);
    }
    v56 = v20;
    if (SLODWORD(v57) >= 0)
      v18 = LODWORD(v57);
    self->_mpsChipBlurOffset.x = (uint64_t)v18 >> 2;
    self->_mpsChipBlurOffset.y = (uint64_t)v19 >> 2;
    self->_mpsChipBlurOffset.z = 0;
    v21 = v11;
    v22 = v10 / v21;
    *(_OWORD *)self->_anon_2b0 = COERCE_UNSIGNED_INT(1.3764 / v22);
    *(_OWORD *)&self->_anon_2b0[16] = xmmword_1A377E740;
    *(_OWORD *)&self->_anon_2b0[32] = xmmword_1A377E750;
    *(_OWORD *)&self->_anon_2b0[48] = xmmword_1A377E760;
    siriChipsTexture = self->_siriChipsTexture;
    self->_siriChipsTexture = 0;
    if (SLODWORD(v57) >= 0)
      v24 = LODWORD(v57);
    else
      v24 = LODWORD(v57) + 1;
    v54 = v24;

    blurChipsTexture = self->_blurChipsTexture;
    self->_blurChipsTexture = 0;

    sphereMaskTexture = self->_sphereMaskTexture;
    self->_sphereMaskTexture = 0;

    blurMaskTexture = self->_blurMaskTexture;
    self->_blurMaskTexture = 0;

    v28 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
    objc_msgSend(v28, "setWidth:", SLODWORD(v57));
    objc_msgSend(v28, "setHeight:", SHIDWORD(v57));
    objc_msgSend(v28, "setMipmapLevelCount:", 1);
    objc_msgSend(v28, "setStorageMode:", 3);
    siriChipsTextureMSAA = self->_siriChipsTextureMSAA;
    self->_siriChipsTextureMSAA = 0;

    objc_msgSend(v28, "setSampleCount:", 4);
    objc_msgSend(v28, "setPixelFormat:", 80);
    objc_msgSend(v28, "setTextureType:", 4);
    objc_msgSend(v28, "setUsage:", 4);
    v30 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v28);
    v31 = self->_siriChipsTextureMSAA;
    self->_siriChipsTextureMSAA = v30;

    -[MTLTexture setLabel:](self->_siriChipsTextureMSAA, "setLabel:", CFSTR("chips MSAA"));
    compositeTextureMSAA = self->_compositeTextureMSAA;
    self->_compositeTextureMSAA = 0;

    objc_msgSend(v28, "setSampleCount:", 4);
    objc_msgSend(v28, "setWidth:", (unint64_t)v10);
    objc_msgSend(v28, "setHeight:", (unint64_t)v11);
    objc_msgSend(v28, "setPixelFormat:", -[CAMetalLayer pixelFormat](self->_metalLayer, "pixelFormat"));
    objc_msgSend(v28, "setTextureType:", 4);
    objc_msgSend(v28, "setUsage:", 4);
    v33 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v28);
    v34 = self->_compositeTextureMSAA;
    self->_compositeTextureMSAA = v33;

    -[MTLTexture setLabel:](self->_compositeTextureMSAA, "setLabel:", CFSTR("composite MSAA"));
    objc_msgSend(v28, "setWidth:", SLODWORD(v57));
    objc_msgSend(v28, "setHeight:", SHIDWORD(v57));
    objc_msgSend(v28, "setSampleCount:", 1);
    objc_msgSend(v28, "setTextureType:", 2);
    objc_msgSend(v28, "setStorageMode:", 2);
    objc_msgSend(v28, "setPixelFormat:", 10);
    objc_msgSend(v28, "setUsage:", 5);
    v35 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v28);
    v36 = self->_sphereMaskTexture;
    self->_sphereMaskTexture = v35;

    -[MTLTexture setLabel:](self->_sphereMaskTexture, "setLabel:", CFSTR("platter"));
    objc_msgSend(v28, "setPixelFormat:", 80);
    v37 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v28);
    v38 = self->_siriChipsTexture;
    self->_siriChipsTexture = v37;

    -[MTLTexture setLabel:](self->_siriChipsTexture, "setLabel:", CFSTR("chips"));
    objc_msgSend(v28, "setUsage:", 7);
    objc_msgSend(v28, "setPixelFormat:", 10);
    v39 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v28);
    v40 = self->_blurMaskTexture;
    self->_blurMaskTexture = v39;

    -[MTLTexture setLabel:](self->_blurMaskTexture, "setLabel:", CFSTR("blurred platter"));
    objc_msgSend(v28, "setPixelFormat:", 80);
    objc_msgSend(v28, "setWidth:", (uint64_t)v54 >> 1);
    objc_msgSend(v28, "setHeight:", (uint64_t)v56 >> 1);
    v41 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v28);
    v42 = self->_blurChipsTexture;
    self->_blurChipsTexture = v41;

    -[MTLTexture setLabel:](self->_blurChipsTexture, "setLabel:", CFSTR("blurred chips"));
    v43 = self->_siriChipsTextureMSAA;
    -[MTLRenderPassDescriptor colorAttachments](self->_siriChipRenderPassDesc, "colorAttachments");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setTexture:", v43);

    v46 = self->_siriChipsTexture;
    -[MTLRenderPassDescriptor colorAttachments](self->_siriChipRenderPassDesc, "colorAttachments");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setResolveTexture:", v46);

    v49 = self->_sphereMaskTexture;
    -[MTLRenderPassDescriptor colorAttachments](self->_sphereMaskRenderPassDesc, "colorAttachments");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setTexture:", v49);

    v52 = self->_compositeTextureMSAA;
    -[MTLRenderPassDescriptor colorAttachments](self->_finalRenderPassDesc, "colorAttachments");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setTexture:", v52);

  }
}

- (void)_startReducedFramerateForPerf
{
  self->_dynamicFramerate = 1;
  -[SUICOrbView _configurePreferredFramesPerSecond:](self, "_configurePreferredFramesPerSecond:", 30);
}

- (void)_endReducedFramerateForPerf
{
  self->_dynamicFramerate = 0;
  -[SUICOrbView _resetDisplayLinkFramerate](self, "_resetDisplayLinkFramerate");
}

- (void)_choosePhysicsRate:(int)a3
{
  NSObject *v4;
  float v5;
  float v6;
  NSObject *v7;
  float v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  self->_framesPerSecond = a3;
  if (a3 == 30)
  {
    v7 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[SUICOrbView _choosePhysicsRate:]";
      _os_log_impl(&dword_1A3752000, v7, OS_LOG_TYPE_DEFAULT, "%s #OrbView running 30 Hz physics", (uint8_t *)&v10, 0xCu);
    }
    self->_framerateType = 0;
    v5 = 0.033333;
    v6 = 0.2;
    goto LABEL_9;
  }
  if (a3 == 60)
  {
    v4 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[SUICOrbView _choosePhysicsRate:]";
      _os_log_impl(&dword_1A3752000, v4, OS_LOG_TYPE_DEFAULT, "%s #OrbView running 60 Hz physics", (uint8_t *)&v10, 0xCu);
    }
    self->_framerateType = 1;
    self->_maxPhysicsIterationsPerFrame = 2;
    v5 = 0.016667;
    v6 = 0.3;
LABEL_9:
    v8 = v5;
    goto LABEL_13;
  }
  v9 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SUICOrbView _choosePhysicsRate:]";
    _os_log_impl(&dword_1A3752000, v9, OS_LOG_TYPE_DEFAULT, "%s #OrbView running dynamic (240 Hz) physics", (uint8_t *)&v10, 0xCu);
  }
  self->_framerateType = 2;
  self->_dynamicFramerate = 1;
  self->_maxPhysicsIterationsPerFrame = 10;
  v6 = 1.5;
  v8 = 0.0041667;
  v5 = 0.0083333;
LABEL_13:
  self->_framerateEnergyModifier = v6;
  self->_oneOverFPS = v5;
  self->_physicsRate = v8;
}

- (void)_resetDisplayLinkFramerate
{
  CADisplayLink *displayLink;
  CAFrameRateRange v3;

  displayLink = self->_displayLink;
  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CADisplayLink setPreferredFrameRateRange:](displayLink, "setPreferredFrameRateRange:", *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

- (void)invalidate
{
  os_log_t *v3;
  NSObject *v4;
  NSTimer *invalidateTimer;
  NSObject *v6;
  NSTimer *v7;
  NSTimer *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[SUICOrbView invalidate]";
    _os_log_impl(&dword_1A3752000, v4, OS_LOG_TYPE_DEFAULT, "%s #OrbView", (uint8_t *)&v9, 0xCu);
  }
  -[NSTimer invalidate](self->_invalidateTimer, "invalidate");
  invalidateTimer = self->_invalidateTimer;
  self->_invalidateTimer = 0;

  if (self->_offCompletion)
  {
    v6 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[SUICOrbView invalidate]";
      _os_log_impl(&dword_1A3752000, v6, OS_LOG_TYPE_DEFAULT, "%s #OrbView Delay displayLink invalidation since _offCompletion is not yet set to nil", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__invalidateDisplayLink, 0, 0, 2.0);
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v8 = self->_invalidateTimer;
    self->_invalidateTimer = v7;

  }
  else
  {
    -[SUICOrbView _invalidateDisplayLink](self, "_invalidateDisplayLink");
  }
}

- (void)_invalidateDisplayLink
{
  NSObject *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  id offCompletion;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SUICOrbView _invalidateDisplayLink]";
    _os_log_impl(&dword_1A3752000, v3, OS_LOG_TYPE_DEFAULT, "%s #OrbView", (uint8_t *)&v7, 0xCu);
  }
  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v5 = self->_displayLink;
    self->_displayLink = 0;

  }
  offCompletion = self->_offCompletion;
  self->_offCompletion = 0;

}

- (void)setNumberOfChips:(int)a3
{
  int v3;

  if (a3 >= 6)
    v3 = 6;
  else
    v3 = a3;
  if (v3 <= 1)
    v3 = 1;
  if (v3 != self->_numberOfChips)
    self->_numberOfChips = v3;
}

- (void)setCurrentlyShownChannel:(int)a3
{
  if ((a3 & 0x80000000) == 0 && self->_currentlyShownChannel != a3)
    self->_currentlyShownChannel = a3;
}

- (void)setBias:(float)a3
{
  float v3;

  if (a3 > 3.0)
    a3 = 3.0;
  v3 = fmaxf(a3, -1.0);
  if (v3 != self->_bias)
    self->_bias = v3;
}

- (void)setScale:(float)a3
{
  float v3;

  if (a3 > 3.0)
    a3 = 3.0;
  v3 = fmaxf(a3, -1.0);
  if (v3 != self->_scale)
    self->_scale = v3;
}

- (void)setPower:(float)a3
{
  float v3;

  if (a3 > 3.0)
    a3 = 3.0;
  v3 = fmaxf(a3, -1.0);
  if (v3 != self->_power)
    self->_power = v3;
}

- (float)linearPowerLevel
{
  return self->_powerLevel;
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)suppressTTSAnimations
{
  return self->_suppressTTSAnimations;
}

- (void)setSuppressTTSAnimations:(BOOL)a3
{
  self->_suppressTTSAnimations = a3;
}

- (BOOL)reduceThinkingModeFramerate
{
  return self->_reduceThinkingModeFramerate;
}

- (void)setReduceThinkingModeFramerate:(BOOL)a3
{
  self->_reduceThinkingModeFramerate = a3;
}

- (int)currentlyShownChannel
{
  return self->_currentlyShownChannel;
}

- (int)numberOfChips
{
  return self->_numberOfChips;
}

- (float)bias
{
  return self->_bias;
}

- (float)scale
{
  return self->_scale;
}

- (float)power
{
  return self->_power;
}

- (NSTimer)invalidateTimer
{
  return self->_invalidateTimer;
}

- (void)setInvalidateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_invalidateTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidateTimer, 0);
  objc_storeStrong((id *)&self->_sphereGeom, 0);
  objc_storeStrong((id *)&self->_siriChipGeom, 0);
  objc_storeStrong((id *)&self->_mpsBlur, 0);
  objc_storeStrong((id *)&self->_finalRenderPassDesc, 0);
  objc_storeStrong((id *)&self->_sphereMaskRenderPassDesc, 0);
  objc_storeStrong((id *)&self->_siriChipRenderPassDesc, 0);
  objc_storeStrong((id *)&self->_blurMaskTexture, 0);
  objc_storeStrong((id *)&self->_siriShadowPipeline, 0);
  objc_storeStrong((id *)&self->_noiseTexture, 0);
  objc_storeStrong((id *)&self->_smoothStepTexture, 0);
  objc_storeStrong((id *)&self->_blurChipsTexture, 0);
  objc_storeStrong((id *)&self->_compositeTextureMSAA, 0);
  objc_storeStrong((id *)&self->_sphereMaskTextureMSAA, 0);
  objc_storeStrong((id *)&self->_siriChipsTextureMSAA, 0);
  objc_storeStrong((id *)&self->_sphereMaskTexture, 0);
  objc_storeStrong((id *)&self->_siriChipsTexture, 0);
  objc_storeStrong((id *)&self->_siriAddBlitPipeline, 0);
  objc_storeStrong((id *)&self->_sphereMaskPipeline, 0);
  objc_storeStrong((id *)&self->_siriCompositePipeline, 0);
  objc_storeStrong((id *)&self->_siriChipFrontfacePipeline, 0);
  objc_storeStrong((id *)&self->_siriChipBackfacePipeline, 0);
  objc_storeStrong((id *)&self->_dynamicUniformBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong(&self->_offCompletion, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);
}

- (void)_commonInitWithFrame:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s Failed to get Metal device for GPU rendering", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_drawSiriFrame:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s Failed to create command buffer, dropping frame", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

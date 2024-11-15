@implementation VFXHolographicRenderer

- (VFXHolographicRenderer)init
{
  return (VFXHolographicRenderer *)MEMORY[0x1E0DE7D20](self, sel_initWithDevice_options_, 0, 0);
}

- (VFXHolographicRenderer)initWithDevice:(id)a3 options:(id)a4
{
  const char *v6;
  uint64_t v7;
  VFXHolographicRenderer *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  VFXRenderer *v14;
  const char *v15;
  VFXRenderer *isPrivateRenderer_privateRendererOwner_clearsOnDraw;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)VFXHolographicRenderer;
  v8 = -[VFXHolographicRenderer init](&v22, sel_init);
  if (v8)
  {
    if (a3 || (a3 = (id)objc_msgSend_deviceForOptions_(VFXView, v6, (uint64_t)a4, v7)) != 0)
    {
      if (!objc_msgSend_objectForKeyedSubscript_(a4, v6, (uint64_t)CFSTR("maxInFlightFrameCount"), v7))
      {
        if (a4)
          v12 = (void *)objc_msgSend_mutableCopy(a4, v9, v10, v11);
        else
          v12 = (void *)objc_msgSend_mutableCopy(MEMORY[0x1E0C9AA70], v9, v10, v11);
        a4 = v12;
        objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)&unk_1E64783A0, (uint64_t)CFSTR("maxInFlightFrameCount"));
      }
      v14 = [VFXRenderer alloc];
      isPrivateRenderer_privateRendererOwner_clearsOnDraw = (VFXRenderer *)objc_msgSend__initWithDevice_options_isPrivateRenderer_privateRendererOwner_clearsOnDraw_(v14, v15, (uint64_t)a3, (uint64_t)a4, 1, v8, 0);
      v8->_renderer = isPrivateRenderer_privateRendererOwner_clearsOnDraw;
      objc_msgSend_setRendererKind_(isPrivateRenderer_privateRendererOwner_clearsOnDraw, v17, 2, v18);
      objc_msgSend_setShouldLoadFinalTexture_(v8->_renderer, v19, 1, v20);
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXHolographicRenderer;
  -[VFXHolographicRenderer dealloc](&v3, sel_dealloc);
}

- (void)updateAtTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_updateAtTime_(self->_renderer, a2, v3, v4, a3);
}

- (VFXWorld)world
{
  uint64_t v2;
  uint64_t v3;

  return (VFXWorld *)objc_msgSend_world(self->_renderer, a2, v2, v3);
}

- (void)setWorld:(id)a3
{
  objc_msgSend_setWorld_completionHandler_(self->_renderer, a2, (uint64_t)a3, 0);
}

- (void)setDelegate:(id)a3
{
  uint64_t v3;

  objc_msgSend_setDelegate_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (VFXWorldRendererDelegate)delegate
{
  uint64_t v2;
  uint64_t v3;

  return (VFXWorldRendererDelegate *)objc_msgSend_delegate(self->_renderer, a2, v2, v3);
}

- (BOOL)_wantsWorldRendererDelegationMessages
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel__shouldForwardWorldRendererDelegationMessagesToPrivateRendererOwner);
}

- (void)set_wantsWorldRendererDelegationMessages:(BOOL)a3
{
  ((void (*)(VFXRenderer *, char *, BOOL))MEMORY[0x1E0DE7D20])(self->_renderer, sel_set_shouldForwardWorldRendererDelegationMessagesToPrivateRendererOwner_, a3);
}

- (id)_resourceManagerMonitor
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend__resourceManagerMonitor(self->_renderer, a2, v2, v3);
}

- (void)set_resourceManagerMonitor:(id)a3
{
  uint64_t v3;

  objc_msgSend_set_resourceManagerMonitor_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (id)_commandBufferStatusMonitor
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend__commandBufferStatusMonitor(self->_renderer, a2, v2, v3);
}

- (void)set_commandBufferStatusMonitor:(id)a3
{
  uint64_t v3;

  objc_msgSend_set_commandBufferStatusMonitor_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  uint64_t v4;
  uint64_t v7;

  objc_msgSend__backingSize(self->_renderer, a2, (uint64_t)a4, v4);
  return (id)MEMORY[0x1E0DE7D20](self->_renderer, sel__hitTest_viewport_options_, a4, v7);
}

- (CGRect)currentViewport
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  ((void (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel_currentViewport);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  VFXRenderer *renderer;

  renderer = self->_renderer;
  objc_msgSend__viewport(renderer, a2, (uint64_t)a3, (uint64_t)a4);
  return MEMORY[0x1E0DE7D20](renderer, sel__isNodeInsideFrustum_withPointOfView_viewport_, a3, a4);
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  uint64_t v3;
  VFXRenderer *renderer;
  uint64_t v6;

  renderer = self->_renderer;
  objc_msgSend__viewport(renderer, a2, (uint64_t)a3, v3);
  return (id)MEMORY[0x1E0DE7D20](renderer, sel__nodesInsideFrustumWithPointOfView_viewport_, a3, v6);
}

- (double)projectPoint:(uint64_t)a3
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  int v11;
  double v12;
  float v13;
  float v15;

  objc_msgSend__viewport(*(void **)(a1 + 24), a2, a3, a4);
  objc_msgSend__projectPoint_viewport_(*(void **)(a1 + 24), v6, v7, v8, a5, v9, *(_QWORD *)&v9, v10);
  LODWORD(v12) = v11;
  *((float *)&v12 + 1) = v15 - v13;
  return v12;
}

- (uint64_t)unprojectPoint:(uint64_t)a3
{
  uint64_t v5;
  uint64_t v6;

  objc_msgSend__viewport(*(void **)(a1 + 24), a2, a3, a4);
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 24), sel__unprojectPoint_viewport_, v5, v6);
}

- (VFXNode)pointOfView
{
  return self->_pointOfView;
}

- (void)setPointOfView:(id)a3
{
  id v5;

  v5 = a3;

  self->_pointOfView = (VFXNode *)a3;
}

- (BOOL)autoenablesDefaultLighting
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_autoenablesDefaultLighting(self->_renderer, a2, v2, v3);
}

- (void)setAutoenablesDefaultLighting:(BOOL)a3
{
  uint64_t v3;

  objc_msgSend_setAutoenablesDefaultLighting_(self->_renderer, a2, a3, v3);
}

- (BOOL)isJitteringEnabled
{
  return 0;
}

- (void)setJitteringEnabled:(BOOL)a3
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: %@ does not support jittering"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  }
}

- (BOOL)additiveWritesToAlpha
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_additiveWritesToAlpha(self->_renderer, a2, v2, v3);
}

- (void)setAdditiveWritesToAlpha:(BOOL)a3
{
  ((void (*)(VFXRenderer *, char *, BOOL))MEMORY[0x1E0DE7D20])(self->_renderer, sel_setAdditiveWritesToAlpha_, a3);
}

- (BOOL)isTemporalAntialiasingEnabled
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_isTemporalAntialiasingEnabled(self->_renderer, a2, v2, v3);
}

- (void)setTemporalAntialiasingEnabled:(BOOL)a3
{
  uint64_t v3;

  objc_msgSend_setTemporalAntialiasingEnabled_(self->_renderer, a2, a3, v3);
}

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  return objc_msgSend_prepareObject_shouldAbortBlock_(self->_renderer, a2, (uint64_t)a3, (uint64_t)a4);
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
  MEMORY[0x1E0DE7D20](self->_renderer, sel_prepareObjects_withCompletionHandler_, a3, a4);
}

- (BOOL)showsStatistics
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_showsStatistics(self->_renderer, a2, v2, v3);
}

- (void)setShowsStatistics:(BOOL)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = sub_1B17C46BC(0) | a3;
  objc_msgSend_setShowsStatistics_(self->_renderer, v5, v4, v6);
}

- (unint64_t)debugOptions
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_debugOptions(self->_renderer, a2, v2, v3);
}

- (void)setDebugOptions:(unint64_t)a3
{
  uint64_t v3;

  objc_msgSend_setDebugOptions_(self->_renderer, a2, a3, v3);
}

- (CGColorSpace)workingColorSpace
{
  return (CGColorSpace *)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel_workingColorSpace);
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  uint64_t v2;
  uint64_t v3;

  return (MTLRenderPassDescriptor *)objc_msgSend_currentRenderPassDescriptor(self->_renderer, a2, v2, v3);
}

- (MTLRenderCommandEncoder)currentRenderCommandEncoder
{
  uint64_t v2;
  uint64_t v3;

  return (MTLRenderCommandEncoder *)objc_msgSend_currentRenderCommandEncoder(self->_renderer, a2, v2, v3);
}

- (MTLDevice)device
{
  uint64_t v2;
  uint64_t v3;

  return (MTLDevice *)objc_msgSend_device(self->_renderer, a2, v2, v3);
}

- (unint64_t)colorPixelFormat
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_colorPixelFormat(self->_renderer, a2, v2, v3);
}

- (unint64_t)depthPixelFormat
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel_depthPixelFormat);
}

- (unint64_t)stencilPixelFormat
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel_stencilPixelFormat);
}

- (MTLCommandQueue)commandQueue
{
  uint64_t v2;
  uint64_t v3;

  return (MTLCommandQueue *)objc_msgSend_commandQueue(self->_renderer, a2, v2, v3);
}

- (AVAudioEngine)audioEngine
{
  return (AVAudioEngine *)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel_audioEngine);
}

- (AVAudioEnvironmentNode)audioEnvironmentNode
{
  return (AVAudioEnvironmentNode *)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel_audioEnvironmentNode);
}

- (VFXNode)audioListener
{
  return (VFXNode *)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel_audioListener);
}

- (void)setAudioListener:(id)a3
{
  ((void (*)(VFXRenderer *, char *, id))MEMORY[0x1E0DE7D20])(self->_renderer, sel_setAudioListener_, a3);
}

- (unint64_t)antialiasingMode
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_antialiasingMode(self->_renderer, a2, v2, v3);
}

- (void)setAntialiasingMode:(unint64_t)a3
{
  uint64_t v3;

  objc_msgSend_setAntialiasingMode_(self->_renderer, a2, a3, v3);
}

- (VFXRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (id)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)rawQuilt
{
  return self->_rawQuilt;
}

- (void)setRawQuilt:(BOOL)a3
{
  self->_rawQuilt = a3;
}

@end

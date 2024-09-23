@implementation VFXMetalLayer

- (void)commonInit
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  VFXRenderer *v10;
  const char *v11;
  void *isPrivateRenderer_privateRendererOwner_clearsOnDraw;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;

  self->_preferredFramePerSeconds = 60;
  v5 = objc_msgSend_rendererOptions(self, a2, v2, v3);
  v6 = (void *)objc_opt_class();
  v9 = objc_msgSend_deviceForOptions_(v6, v7, v5, v8);
  v10 = [VFXRenderer alloc];
  isPrivateRenderer_privateRendererOwner_clearsOnDraw = (void *)objc_msgSend__initWithDevice_options_isPrivateRenderer_privateRendererOwner_clearsOnDraw_(v10, v11, v9, v5, 1, self, 1);
  objc_msgSend_setRenderer_(self, v13, (uint64_t)isPrivateRenderer_privateRendererOwner_clearsOnDraw, v14);
  self->_lastRenderedTime = -1.0;

  objc_msgSend_setDevice_(self, v15, v9, v16);
  v17 = sub_1B189D230(0);
  objc_msgSend_setPixelFormat_(self, v18, v17, v19);
  objc_msgSend_setFramebufferOnly_(self, v20, 1, v21);
  v25 = objc_msgSend_world(VFXWorld, v22, v23, v24);
  objc_msgSend_setWorld_(self, v26, v25, v27);
  v31 = (void *)objc_msgSend_whiteColor(MEMORY[0x1E0DC3658], v28, v29, v30);
  v35 = objc_msgSend_CGColor(v31, v32, v33, v34);
  objc_msgSend_setBackgroundColor_(self, v36, v35, v37);
  MEMORY[0x1E0DE7D20](self, sel_setNeedsDisplayOnBoundsChange_, 1, v38);
}

- (VFXMetalLayer)initWithLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VFXMetalLayer;
  return -[VFXMetalLayer initWithLayer:](&v4, sel_initWithLayer_, a3);
}

- (VFXMetalLayer)init
{
  VFXMetalLayer *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  VFXMetalLayer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VFXMetalLayer;
  v2 = -[CAMetalLayer init](&v8, sel_init);
  v6 = v2;
  if (v2)
    objc_msgSend_commonInit(v2, v3, v4, v5);
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int isMainThread;
  VFXDisplayLink *displayLink;
  objc_super v16;
  _QWORD block[5];

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);
  objc_msgSend_invalidate(self->_displayLink, v8, v9, v10);
  isMainThread = objc_msgSend_isMainThread(MEMORY[0x1E0CB3978], v11, v12, v13);
  displayLink = self->_displayLink;
  if (isMainThread)
  {

    self->_displayLink = 0;
  }
  else
  {
    self->_displayLink = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B1914128;
    block[3] = &unk_1E63D6D80;
    block[4] = displayLink;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

  v16.receiver = self;
  v16.super_class = (Class)VFXMetalLayer;
  -[CAMetalLayer dealloc](&v16, sel_dealloc);
}

- (BOOL)canDrawConcurrently
{
  return 1;
}

- (id)rendererOptions
{
  return 0;
}

- (void)setShowsStatistics:(BOOL)a3
{
  uint64_t v3;

  objc_msgSend_setShowsStatistics_(self->_renderer, a2, a3, v3);
}

- (BOOL)showsStatistics
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_showsStatistics(self->_renderer, a2, v2, v3);
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

- (id)displayLink
{
  uint64_t v2;
  uint64_t v3;
  id result;
  uint64_t v6;
  const char *v7;
  VFXDisplayLink *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  result = self->_displayLink;
  if (!result)
  {
    v6 = objc_msgSend__renderingQueue(self->_renderer, a2, v2, v3);
    v8 = (VFXDisplayLink *)(id)objc_msgSend_VFX_setupDisplayLinkWithQueue_screen_policy_(self, v7, v6, 0, 0);
    self->_displayLink = v8;
    objc_msgSend_setPaused_(v8, v9, 0, v10);
    *(float *)&v11 = (float)self->_preferredFramePerSeconds;
    objc_msgSend_setPreferredFrameRate_(self->_displayLink, v12, v13, v14, v11);
    return self->_displayLink;
  }
  return result;
}

- (BOOL)_checkAndUpdateDisplayLinkStateIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t isPaused;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = (void *)objc_msgSend_world(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_clock(v5, v6, v7, v8);
  isPaused = objc_msgSend_isPaused(v9, v10, v11, v12);
  v17 = objc_msgSend_displayLink(self, v14, v15, v16);
  objc_msgSend_nextFrameTime(self->_renderer, v18, v19, v20);
  return MEMORY[0x1E0DE7D20](v17, sel_setPaused_nextFrameTimeHint_lastUpdate_, isPaused, v21);
}

- (int64_t)preferredFramesPerSecond
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;

  v5 = (void *)objc_msgSend_displayLink(self, a2, v2, v3);
  if (v5)
    objc_msgSend_preferredFrameRate(v5, v6, v7, v8);
  else
    return (uint64_t)(float)self->_preferredFramePerSeconds;
  return (uint64_t)v9;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  v6 = (void *)objc_msgSend_displayLink(self, a2, a3, v3);
  if (v6)
  {
    *(float *)&v10 = (float)a3;
    objc_msgSend_setPreferredFrameRate_(v6, v7, v8, v9, v10);
  }
  self->_preferredFramePerSeconds = a3;
}

- (void)pauseDisplayLink
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  objc_msgSend_stopIfNeeded(self->_jitterer, a2, v2, v3);
  v8 = (void *)objc_msgSend_displayLink(self, v5, v6, v7);
  objc_msgSend_setPaused_(v8, v9, 1, v10);
}

- (void)resumeDisplayLink
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t isPaused;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = objc_msgSend_displayLink(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_world(self, v6, v7, v8);
  v13 = (void *)objc_msgSend_clock(v9, v10, v11, v12);
  isPaused = objc_msgSend_isPaused(v13, v14, v15, v16);
  objc_msgSend_nextFrameTime(self->_renderer, v18, v19, v20);
  MEMORY[0x1E0DE7D20](v5, sel_setPaused_nextFrameTimeHint_lastUpdate_, isPaused, v21);
}

- (void)setPointOfView:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = (void *)objc_msgSend_renderer(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setPointOfView_(v6, v7, (uint64_t)a3, v8);
  objc_msgSend_setNeedsDisplay(self, v9, v10, v11);
}

- (VFXNode)pointOfView
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_renderer(self, a2, v2, v3);
  return (VFXNode *)objc_msgSend_pointOfView(v4, v5, v6, v7);
}

- (void)setRenderGraph:(id)a3
{
  uint64_t v3;

  objc_msgSend_setRenderGraph_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (VFXRenderGraph)renderGraph
{
  uint64_t v2;
  uint64_t v3;

  return (VFXRenderGraph *)objc_msgSend_renderGraph(self->_renderer, a2, v2, v3);
}

- (void)setPointOfCulling:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  if ((id)objc_msgSend_pointOfCulling(self, a2, (uint64_t)a3, v3) != a3)
  {
    if (!objc_msgSend_world(a3, v6, v7, v8))
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v10, v11, v12, v13, v14, v15, (uint64_t)"pointOfCulling.world");
    v16 = (void *)objc_msgSend_renderer(self, v9, v10, v11);
    objc_msgSend_setPointOfCulling_(v16, v17, (uint64_t)a3, v18);
    objc_msgSend_setNeedsDisplay(self, v19, v20, v21);
  }
}

- (id)pointOfCulling
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_renderer(self, a2, v2, v3);
  return (id)objc_msgSend_pointOfCulling(v4, v5, v6, v7);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v9 = objc_msgSend_world(self, v6, v7, v8);
  v13 = objc_msgSend_pointOfView(self, v10, v11, v12);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v14, (uint64_t)CFSTR("<%@: %p | world=%@ pointOfView=%@>"), v15, v5, self, v9, v13);
}

- (BOOL)autoenablesDefaultLighting
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_renderer(self, a2, v2, v3);
  return objc_msgSend_autoenablesDefaultLighting(v4, v5, v6, v7);
}

- (void)setAutoenablesDefaultLighting:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v6 = (void *)objc_msgSend_renderer(self, a2, a3, v3);
  objc_msgSend_setAutoenablesDefaultLighting_(v6, v7, v4, v8);
  objc_msgSend_setNeedsDisplay(self, v9, v10, v11);
}

- (BOOL)rendersIntoMaterial
{
  return self->_rendersIntoMaterial;
}

- (void)setRendersIntoMaterial:(BOOL)a3
{
  self->_rendersIntoMaterial = a3;
}

- (double)_viewport
{
  float64_t v4;
  float64x2_t v5;
  double result;

  objc_msgSend_bounds(a1, a2, a3, a4);
  v5.f64[1] = v4;
  *(_QWORD *)&result = vcvt_hight_f32_f64(0, v5).u64[0];
  return result;
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = objc_msgSend_renderer(self, a2, (uint64_t)a4, v4);
  objc_msgSend_bounds(self, v8, v9, v10);
  return (id)MEMORY[0x1E0DE7D20](v7, sel__hitTest_viewport_options_, a4, v11);
}

- (id)hitTestWithSegmentFromPoint:(VFXMetalLayer *)self toPoint:(SEL)a2 options:(id)a3
{
  uint64_t v3;
  double v4;
  double v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v11;
  double v12;

  v11 = v4;
  v12 = v5;
  v7 = (void *)objc_msgSend_renderer(self, a2, (uint64_t)a3, v3);
  return (id)objc_msgSend_hitTestWithSegmentFromPoint_toPoint_options_(v7, v8, (uint64_t)a3, v9, v11, v12);
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = objc_msgSend_renderer(self, a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend__viewport(self, v8, v9, v10);
  return MEMORY[0x1E0DE7D20](v7, sel__isNodeInsideFrustum_withPointOfView_viewport_, a3, a4);
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend_renderer(self, a2, (uint64_t)a3, v3);
  objc_msgSend__viewport(self, v7, v8, v9);
  return (id)MEMORY[0x1E0DE7D20](v6, sel__nodesInsideFrustumWithPointOfView_viewport_, a3, v10);
}

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  void *v6;
  const char *v7;

  v6 = (void *)objc_msgSend_renderer(self, a2, (uint64_t)a3, (uint64_t)a4);
  return objc_msgSend_prepareObject_shouldAbortBlock_(v6, v7, (uint64_t)a3, (uint64_t)a4);
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend_renderer(self, a2, (uint64_t)a3, (uint64_t)a4);
  MEMORY[0x1E0DE7D20](v6, sel_prepareObjects_withCompletionHandler_, a3, a4);
}

- (void)projectPoints:(VFXMetalLayer *)self count:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = v3;
  v5 = v2;
  v7 = objc_msgSend_renderer(self, a2, v2, v3);
  objc_msgSend__viewport(self, v8, v9, v10);
  MEMORY[0x1E0DE7D20](v7, sel__projectPoints_count_viewport_, v5, v4);
}

- (uint64_t)projectPoint:(uint64_t)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;

  v6 = (void *)objc_msgSend_renderer(a1, a2, a3, a4);
  objc_msgSend__viewport(a1, v7, v8, v9);
  return objc_msgSend__projectPoint_viewport_(v6, v10, v11, v12, a5, v13);
}

- (uint64_t)unprojectPoint:(uint64_t)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend_renderer(a1, a2, a3, a4);
  objc_msgSend__viewport(a1, v6, v7, v8);
  return MEMORY[0x1E0DE7D20](v5, sel__unprojectPoint_viewport_, v9, v10);
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

- (void)setRenderer:(id)a3
{
  VFXRenderer *renderer;

  renderer = self->_renderer;
  if (renderer != a3)
  {

    self->_renderer = (VFXRenderer *)a3;
  }
}

- (id)renderer
{
  return self->_renderer;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)VFXMetalLayer;
  -[VFXMetalLayer setBackgroundColor:](&v20, sel_setBackgroundColor_);
  v7 = (void *)objc_msgSend_colorWithCGColor_(MEMORY[0x1E0DC3658], v5, (uint64_t)a3, v6);
  v18 = 0;
  v19 = 0;
  v16 = 0.0;
  v17 = 0;
  objc_msgSend_getRed_green_blue_alpha_(v7, v8, (uint64_t)&v19, (uint64_t)&v18, &v17, &v16);
  objc_msgSend_setOpaque_(self, v9, v16 >= 1.0, v10, v16);
  objc_msgSend_setBackgroundColor_(self->_renderer, v11, (uint64_t)v7, v12);
  objc_msgSend_setNeedsDisplay(self, v13, v14, v15);
}

- (CGColorSpace)workingColorSpace
{
  return (CGColorSpace *)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel_workingColorSpace);
}

- (void)setWorld:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  VFXRenderer *renderer;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  _QWORD v22[5];

  if ((id)objc_msgSend_world(self, a2, (uint64_t)a3, v3) != a3)
  {

    self->_world = (VFXWorld *)a3;
    v9 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v6, v7, v8);
    objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, (uint64_t)CFSTR("kCFXWorldDidUpdateNotification"), 0);
    renderer = self->_renderer;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1B1914A08;
    v22[3] = &unk_1E63D6D80;
    v22[4] = self;
    objc_msgSend_setWorld_completionHandler_(renderer, v12, (uint64_t)a3, (uint64_t)v22);
    if (a3)
    {
      v16 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v13, v14, v15);
      v20 = objc_msgSend_worldRef(a3, v17, v18, v19);
      objc_msgSend_addObserver_selector_name_object_(v16, v21, (uint64_t)self, (uint64_t)sel__worldDidUpdate_, CFSTR("kCFXWorldDidUpdateNotification"), v20);
    }
    objc_msgSend_setNeedsDisplay(self, v13, v14, v15);
  }
}

- (VFXWorld)world
{
  return self->_world;
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

- (MTLCommandQueue)commandQueue
{
  uint64_t v2;
  uint64_t v3;

  return (MTLCommandQueue *)objc_msgSend_commandQueue(self->_renderer, a2, v2, v3);
}

- (unint64_t)depthPixelFormat
{
  return ((uint64_t (*)(VFXMetalLayer *, char *))MEMORY[0x1E0DE7D20])(self, sel_depthPixelFormat);
}

- (unint64_t)stencilPixelFormat
{
  return ((uint64_t (*)(VFXMetalLayer *, char *))MEMORY[0x1E0DE7D20])(self, sel_stencilPixelFormat);
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

- (void)setNeedsDisplay
{
  objc_super v2;

  self->_lastRenderedTime = -1.0;
  v2.receiver = self;
  v2.super_class = (Class)VFXMetalLayer;
  -[VFXMetalLayer setNeedsDisplay](&v2, sel_setNeedsDisplay);
}

- (void)display
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__drawAtTime_(self, a2, v2, v3, 0.0);
}

- (void)VFX_displayLinkCallback:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  const char *v13;
  _QWORD v14[6];

  v7 = (void *)objc_msgSend_world(self, a2, v3, v4);
  v11 = (void *)objc_msgSend_scene(v7, v8, v9, v10);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1B1914B8C;
  v14[3] = &unk_1E63D83E0;
  v14[4] = self;
  *(double *)&v14[5] = a3;
  v12 = 0x9DDFEA08EB382D69
      * ((0x9DDFEA08EB382D69 * (_QWORD)self) ^ ((0x9DDFEA08EB382D69 * (unint64_t)self) >> 47));
  objc_msgSend_triggerRenderWith_renderer_(v11, v13, (uint64_t)v14, 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47)));
}

- (void)_drawAtTime:(double)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_signpost_id_t v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  double v62;
  double v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  uint8_t v75[16];
  uint8_t buf[16];

  objc_msgSend_convertTime_fromLayer_(self, a2, 0, v3);
  *(float *)&v9 = v9;
  v10 = *(float *)&v9;
  self->_lastRenderedTime = v10;
  if (self->_syncTimeWithCoreAnimation)
    a3 = v10;
  objc_msgSend_stopIfNeeded(self->_jitterer, v6, v7, v8);
  objc_msgSend__displayLinkStatsTick(self->_renderer, v11, v12, v13);
  objc_msgSend_bounds(self, v14, v15, v16);
  v18 = v17;
  v20 = v19;
  objc_msgSend_contentsScale(self, v21, v22, v23);
  if (v27 == 1.0 || v27 == 0.0)
    v27 = 1.0;
  v29 = v20 * v27;
  v30 = v18 * v27;
  objc_msgSend__setBackingSize_(self->_renderer, v24, v25, v26, v30, v29);
  objc_msgSend_set_viewport_(self->_renderer, v31, v32, v33, 0.0);
  if (v30 != 0.0 && v29 != 0.0)
  {
    objc_msgSend_lock(self->_renderer, v34, v35, v36);
    v40 = objc_msgSend__engineContext(self->_renderer, v37, v38, v39);
    v41 = sub_1B18137DC(v40);
    v42 = sub_1B17C439C();
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v43 = v42;
      if (os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B178D000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "RenderFrame (Layer)", ", buf, 2u);
      }
    }
    v44 = (void *)MEMORY[0x1B5E23520]();
    objc_msgSend__beginFrame(self->_renderer, v45, v46, v47);
    objc_msgSend_updateAtTime_(self->_renderer, v48, v49, v50, a3);
    objc_msgSend__render(self->_renderer, v51, v52, v53);
    objc_msgSend__presentFramebuffer(self->_renderer, v54, v55, v56);
    objc_autoreleasePoolPop(v44);
    v57 = sub_1B17C439C();
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v61 = v57;
      if (os_signpost_enabled(v57))
      {
        *(_WORD *)v75 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B178D000, v61, OS_SIGNPOST_INTERVAL_END, v41, "RenderFrame (Layer)", ", v75, 2u);
      }
    }
    objc_msgSend_nextFrameTime(self->_renderer, v58, v59, v60);
    v63 = v62;
    v64 = CACurrentMediaTime();
    objc_msgSend_unlock(self->_renderer, v65, v66, v67);
    if (objc_msgSend__checkAndUpdateDisplayLinkStateIfNeeded(self, v68, v69, v70)
      && !self->_drawForJittering)
    {
      v74 = v63 - v64;
      if (v63 - v64 > 2.0)
        objc_msgSend_restart(self->_jitterer, v71, v72, v73, v74);
    }
    objc_msgSend__displayLinkStatsTack(self->_renderer, v71, v72, v73, v74);
  }
}

- (void)_systemTimeAnimationStarted:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend_displayLink(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setPaused_(v4, v5, 0, v6);
}

- (void)_worldDidUpdate:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  self->_lastUpdate = CACurrentMediaTime();
  objc_msgSend_setNeedsDisplay(self, v4, v5, v6);
}

+ (id)_kvoKeysForwardedToRenderer
{
  uint64_t v2;

  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("pointOfView"), v2, CFSTR("playing"), CFSTR("loops"), CFSTR("autoenablesDefaultLighting"), CFSTR("jitteringEnabled"), CFSTR("renderGraph"), 0);
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  objc_super v22;

  v22.receiver = a1;
  v22.super_class = (Class)&OBJC_METACLASS___VFXMetalLayer;
  v5 = objc_msgSendSuper2(&v22, sel_keyPathsForValuesAffectingValueForKey_);
  v9 = (void *)objc_msgSend__kvoKeysForwardedToRenderer(a1, v6, v7, v8);
  if (objc_msgSend_containsObject_(v9, v10, (uint64_t)a3, v11))
  {
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("renderer.%@"), v13, a3);
    v18 = (void *)objc_msgSend_setWithObject_(v14, v16, v15, v17);
    return (id)objc_msgSend_setByAddingObjectsFromSet_(v18, v19, (uint64_t)v5, v20);
  }
  return v5;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  objc_super v10;

  v6 = (void *)objc_msgSend__kvoKeysForwardedToRenderer(a1, a2, (uint64_t)a3, v3);
  if ((objc_msgSend_containsObject_(v6, v7, (uint64_t)a3, v8) & 1) != 0)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VFXMetalLayer;
  return objc_msgSendSuper2(&v10, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (id)contentLayer
{
  return 0;
}

- (BOOL)vfx_inLiveResize
{
  return 0;
}

- (void)_jitterRedisplay
{
  uint64_t v2;
  uint64_t v3;

  self->_drawForJittering = 1;
  objc_msgSend_display(self, a2, v2, v3);
  self->_drawForJittering = 0;
}

- (BOOL)_canJitter
{
  return 0;
}

- (BOOL)_supportsJitteringSyncRedraw
{
  return 0;
}

- (BOOL)isJitteringEnabled
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_isEnabled(self->_jitterer, a2, v2, v3);
}

- (void)setJitteringEnabled:(BOOL)a3
{
  NSLog(CFSTR("Jittering is not supported on VFXMetalLayer"), a2, a3);
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
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_setAntialiasingMode_(self->_renderer, a2, a3, v3);
  objc_msgSend_setNeedsDisplay(self, v5, v6, v7);
}

- (void)setDebugOptions:(unint64_t)a3
{
  uint64_t v3;

  objc_msgSend_setDebugOptions_(self->_renderer, a2, a3, v3);
}

- (unint64_t)debugOptions
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_debugOptions(self->_renderer, a2, v2, v3);
}

- (BOOL)_showsAuthoringEnvironment
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend__showsAuthoringEnvironment(self->_renderer, a2, v2, v3);
}

- (id)_authoringEnvironment
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend__authoringEnvironment(self->_renderer, a2, v2, v3);
}

- (void)setContentsGravity:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMetalLayer;
  -[VFXMetalLayer setContentsGravity:](&v3, sel_setContentsGravity_, a3);
}

- (BOOL)syncTimeWithCoreAnimation
{
  return self->_syncTimeWithCoreAnimation;
}

- (void)setSyncTimeWithCoreAnimation:(BOOL)a3
{
  self->_syncTimeWithCoreAnimation = a3;
}

@end

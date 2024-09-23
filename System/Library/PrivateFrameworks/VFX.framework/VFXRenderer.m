@implementation VFXRenderer

- (uint64_t)workingColorSpace
{
  uint64_t *v0;

  if (sub_1B179FFA4())
  {
    if (qword_1EEF654F8 != -1)
      dispatch_once(&qword_1EEF654F8, &unk_1E63D4CA8);
    v0 = &qword_1EEF654F0;
  }
  else
  {
    if (qword_1ED4CEBA8 != -1)
      dispatch_once(&qword_1ED4CEBA8, &unk_1E63D4BE8);
    v0 = &qword_1ED4CEBA0;
  }
  return *v0;
}

- (VFXRenderer)init
{
  uint64_t v2;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return self;
}

- (void)_setupOffscreenRendererWithSize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  CGFloat height;
  CGFloat width;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  height = a3.height;
  width = a3.width;
  v8 = objc_msgSend_clearColor(MEMORY[0x1E0DC3658], a2, v3, v4);
  objc_msgSend_setBackgroundColor_(self, v9, v8, v10);
  *((_BYTE *)self + 121) |= 0x20u;
  self->_framebufferInfo.drawableSize.width = width;
  self->_framebufferInfo.drawableSize.height = height;
}

- (id)_initWithDevice:(id)a3 options:(id)a4 isPrivateRenderer:(BOOL)a5 privateRendererOwner:(id)a6 clearsOnDraw:(BOOL)a7
{
  _BOOL4 v9;
  VFXRenderer *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char isKindOfClass;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  objc_class *v71;
  NSString *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  NSObject *v79;
  VFXMTLRenderContext *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v103;
  objc_super v104;

  v9 = a5;
  v104.receiver = self;
  v104.super_class = (Class)VFXRenderer;
  v12 = -[VFXRenderer init](&v104, sel_init);
  v13 = (uint64_t)v12;
  if (v12)
  {
    v12->_world = 0;
    v12->_viewpoints = 0;
    v12->_contentScaleFactor = 1.0;
    v12->_lastWorldTime = -1.0;
    v12->_engineContext = (__CFXEngineContext *)sub_1B1813C38((const __CFDictionary *)a4, a3);
    *(_QWORD *)(v13 + 32) = objc_alloc_init(VFXRecursiveLock);
    objc_msgSend__updateEngineCallbacks((void *)v13, v14, v15, v16);
    sub_1B181542C(*(_QWORD *)(v13 + 184), CFSTR("frustumCulling"), (void *)*MEMORY[0x1E0C9AE50], v17, v18, v19, v20, v21);
    sub_1B18154C4(*(_QWORD *)(v13 + 184), a7, v22, v23, v24, v25, v26, v27);
    v34 = *(_QWORD *)(v13 + 184);
    if (v34)
      sub_1B1814A2C(v34, v13, v28, v29, v30, v31, v32, v33);
    else
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: VFXRenderer::init - no engine context"), v28, v29, v30, v31, v32, v33, v103);
    if (v9)
      v35 = 8;
    else
      v35 = 0;
    *(_BYTE *)(v13 + 121) = *(_BYTE *)(v13 + 121) & 0xF7 | v35;
    *(_QWORD *)(v13 + 296) = a6;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v40 = 16;
    else
      v40 = 0;
    v41 = *(_BYTE *)(v13 + 121) & 0xEF | v40;
    *(_BYTE *)(v13 + 121) = v41;
    if ((isKindOfClass & 1) != 0)
    {
      v42 = (void *)objc_msgSend_metalLayer((void *)v13, v37, v38, v39);
      *(_QWORD *)(v13 + 56) = objc_msgSend_pixelFormat(v42, v43, v44, v45);
      v41 = *(_BYTE *)(v13 + 121);
    }
    if ((v41 & 8) != 0)
    {
      v46 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v37, v38, v39);
      objc_msgSend_addObserver_selector_name_object_(v46, v47, v13, (uint64_t)sel__UIOrientationDidChangeNotification_, *MEMORY[0x1E0DC4760], 0);
      if ((*(_BYTE *)(v13 + 121) & 0x10) != 0)
      {
        v56 = (void *)objc_msgSend_window(*(void **)(v13 + 296), v48, v49, v50);
        v60 = (void *)objc_msgSend_windowScene(v56, v57, v58, v59);
        v55 = objc_msgSend_interfaceOrientation(v60, v61, v62, v63);
      }
      else
      {
        v51 = (void *)objc_msgSend_sharedApplication(MEMORY[0x1E0DC3470], v48, v49, v50);
        v55 = objc_msgSend_statusBarOrientation(v51, v52, v53, v54);
      }
      sub_1B1815AC0(*(_QWORD *)(v13 + 184), v55);
    }
    *(_QWORD *)(v13 + 48) = 2;
    if (v9)
    {
      if ((byte_1ED4CF740 & 1) == 0)
      {
        byte_1ED4CF740 = 1;
        getpid();
        proc_disable_wakemon();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Private renderer only supports VFXView"), v64, v65, v66, v67, v68, v69, (uint64_t)"[privateRendererOwner isKindOfClass:[VFXView class]] || [privateRendererOwner isKindOfClass:[VFXCompositorRenderer class]]");
      }
      v70 = (void *)MEMORY[0x1E0CB3940];
      v71 = (objc_class *)objc_opt_class();
      v72 = NSStringFromClass(v71);
      v75 = (void *)objc_msgSend_stringWithFormat_(v70, v73, (uint64_t)CFSTR("com.apple.vfx.renderingQueue.%@%p"), v74, v72, *(_QWORD *)(v13 + 296));
      v78 = (const char *)objc_msgSend_cStringUsingEncoding_(v75, v76, 1, v77);
      v79 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      *(_QWORD *)(v13 + 40) = dispatch_queue_create(v78, v79);
    }
    v80 = [VFXMTLRenderContext alloc];
    *(_QWORD *)(v13 + 240) = objc_msgSend_initWithDevice_engineContext_(v80, v81, (uint64_t)a3, *(_QWORD *)(v13 + 184));
    v85 = objc_msgSend_antialiasingMode((void *)v13, v82, v83, v84);
    v93 = sub_1B189E9FC(v85, v86, v87, v88, v89, v90, v91, v92);
    objc_msgSend_setSampleCount_(*(void **)(v13 + 240), v94, v93, v95);
    sub_1B1813E54(*(_QWORD *)(v13 + 184), *(void **)(v13 + 240), v96, v97, v98, v99, v100, v101);

  }
  return (id)v13;
}

+ (VFXRenderer)rendererWithDevice:(id)a3 options:(id)a4
{
  void *v5;
  VFXRenderer *result;
  id v8;
  const char *v9;

  v5 = a3;
  if (a3
    || (result = (VFXRenderer *)objc_msgSend_deviceForOptions_(VFXView, a2, (uint64_t)a4, (uint64_t)a4),
        (v5 = result) != 0))
  {
    v8 = objc_alloc((Class)a1);
    return (VFXRenderer *)(id)objc_msgSend__initWithDevice_options_isPrivateRenderer_privateRendererOwner_clearsOnDraw_(v8, v9, (uint64_t)v5, (uint64_t)a4, 0, 0, 0);
  }
  return result;
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
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v14, (uint64_t)CFSTR("<%@ %p: world = %@, pointOfView = %@>"), v15, v5, self, v9, v13);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFXEngineContext *engineContext;
  NSObject *renderingQueue;
  objc_super v17;

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);
  objc_storeWeak(&self->_delegate, 0);

  self->_preloadRenderer = 0;
  self->_offScreenFramebuffer = 0;

  engineContext = self->_engineContext;
  if (engineContext)
  {
    sub_1B18157A0((uint64_t)engineContext, v8, v9, v10, v11, v12, v13, v14);
    CFRelease(self->_engineContext);
  }
  renderingQueue = self->__renderingQueue;
  if (renderingQueue)
    dispatch_release(renderingQueue);

  v17.receiver = self;
  v17.super_class = (Class)VFXRenderer;
  -[VFXRenderer dealloc](&v17, sel_dealloc);
}

- (id)currentCommandBuffer
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_currentCommandBuffer(self->_renderContext, a2, v2, v3);
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  uint64_t v2;
  uint64_t v3;

  return (MTLRenderPassDescriptor *)objc_msgSend_currentRenderPassDescriptor(self->_renderContext, a2, v2, v3);
}

- (MTLRenderCommandEncoder)currentRenderCommandEncoder
{
  uint64_t v2;
  uint64_t v3;

  return (MTLRenderCommandEncoder *)objc_msgSend_currentRenderCommandEncoder(self->_renderContext, a2, v2, v3);
}

- (MTLDevice)device
{
  uint64_t v2;
  uint64_t v3;

  return (MTLDevice *)objc_msgSend_device(self->_renderContext, a2, v2, v3);
}

- (MTLCommandQueue)commandQueue
{
  uint64_t v2;
  uint64_t v3;

  return (MTLCommandQueue *)objc_msgSend_commandQueue(self->_renderContext, a2, v2, v3);
}

- (unint64_t)colorPixelFormat
{
  uint64_t v2;
  uint64_t v3;
  void *offScreenFramebuffer;

  if ((*((_BYTE *)self + 121) & 0x20) != 0)
    offScreenFramebuffer = self->_offScreenFramebuffer;
  else
    offScreenFramebuffer = (void *)objc_msgSend_metalLayer(self, a2, v2, v3);
  return objc_msgSend_pixelFormat(offScreenFramebuffer, a2, v2, v3);
}

- (unint64_t)depthPixelFormat
{
  return 252;
}

- (unint64_t)stencilPixelFormat
{
  return 0;
}

- (void)lock
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  prof_beginFlame((uint64_t)"-[VFXRenderer lock]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 625);
  objc_msgSend_lock(self->_lock, v3, v4, v5);
  prof_endFlame();
}

- (void)unlock
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_unlock(self->_lock, a2, v2, v3);
}

- (id)_renderingQueue
{
  return self->__renderingQueue;
}

- (void)_installViewport
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGSize drawableSize;
  CGSize v10;
  __n128 v11;

  drawableSize = self->_framebufferInfo.drawableSize;
  if ((*((_BYTE *)self + 121) & 8) == 0)
  {
    v10 = self->_framebufferInfo.drawableSize;
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. invalid renderer"), v2, v3, v4, v5, v6, v7, (uint64_t)"_isPrivateRenderer");
    drawableSize = v10;
  }
  v11 = (__n128)vcvt_hight_f32_f64(0, (float64x2_t)drawableSize);
  sub_1B1815AB0((uint64_t)self->_engineContext, COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)drawableSize)));
  sub_1B1815AA0((__n128 *)self->_engineContext, v11);
}

- (void)_clearBackBuffer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (self->_renderContext)
  {
    v2 = sub_1B1813E3C((uint64_t)self->_engineContext);
    sub_1B19AAE74(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)_setContentsScaleFactor:(float)a3
{
  self->_contentScaleFactor = a3;
}

- (float)_contentsScaleFactor
{
  return self->_contentScaleFactor;
}

- (CGSize)_backingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_framebufferInfo.drawableSize.width;
  height = self->_framebufferInfo.drawableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setBackingSize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3.width != self->_framebufferInfo.drawableSize.width || a3.height != self->_framebufferInfo.drawableSize.height)
  {
    self->_framebufferInfo.drawableSize = a3;
    objc_msgSend__invalidateFramebuffer(self, a2, v3, v4);
  }
}

- (void)_invalidateFramebuffer
{
  *((_BYTE *)self + 121) |= 3u;
}

- (void)_beginFrame
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __CFXEngineContext *engineContext;
  float v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  VFXMTLRenderContext *renderContext;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  char v50;

  objc_msgSend__prepareRenderTarget(self, a2, v2, v3);
  if (self->_renderContext)
  {
    engineContext = self->_engineContext;
    objc_msgSend__contentsScaleFactor(self, v5, v6, v7);
    sub_1B1815C88((uint64_t)engineContext, v9);
    v13 = *((_BYTE *)self + 121);
    if ((v13 & 2) != 0)
    {
      *((_BYTE *)self + 121) = v13 & 0xFD;
      sub_1B1813E4C((uint64_t)self->_engineContext);
      sub_1B1813E44((uint64_t)self->_engineContext);
      v13 = *((_BYTE *)self + 121);
    }
    renderContext = self->_renderContext;
    if ((v13 & 0x20) != 0)
    {
      objc_msgSend_beginFrame_(renderContext, v10, (uint64_t)self->_offScreenFramebuffer, v12);
    }
    else
    {
      v15 = objc_msgSend_metalLayer(self, v10, v11, v12);
      objc_msgSend_beginFrame_(renderContext, v16, v15, v17);
    }
    v21 = (void *)objc_msgSend_world(self, v18, v19, v20);
    v25 = objc_msgSend_worldRef(v21, v22, v23, v24);
    v26 = sub_1B1816084((uint64_t)self->_engineContext);
    if (v25)
    {
      if (v26)
      {
        v34 = (void *)sub_1B187A9C4(v25, v27, v28, v29, v30, v31, v32, v33);
        if (objc_msgSend_showsDebugUI(self, v35, v36, v37))
        {
          v40 = sub_1B1815AA8((uint64_t)self->_engineContext);
          v41 = *(float *)&v40;
          v42 = *((float *)&v40 + 1);
          objc_msgSend__contentsScaleFactor(self, v43, v44, v45);
          if (!objc_msgSend_beginImgUIFrameWithViewportSize_backingScaleFactor_(v34, v47, v48, v49, v41 / v46, v42 / v46))return;
          v50 = *((_BYTE *)self + 248) | 0x10;
        }
        else
        {
          objc_msgSend_setImGUIEnabled_(v34, v38, 0, v39);
          v50 = *((_BYTE *)self + 248) & 0xEF;
        }
        *((_BYTE *)self + 248) = v50;
      }
    }
  }
}

- (void)_endImGuiFrameAndRender
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;

  v5 = (void *)objc_msgSend_world(self, a2, v2, v3);
  v9 = objc_msgSend_worldRef(v5, v6, v7, v8);
  if ((*((_BYTE *)self + 248) & 0x10) != 0 && v9)
  {
    v17 = (void *)sub_1B187A9C4(v9, v10, v11, v12, v13, v14, v15, v16);
    v21 = objc_msgSend_currentCommandBuffer(self, v18, v19, v20);
    v25 = objc_msgSend_currentRenderCommandEncoder(self, v22, v23, v24);
    v29 = objc_msgSend_currentRenderPassDescriptor(self, v26, v27, v28);
    if (objc_msgSend_endImgUIFrameWithCommandBuffer_encoder_renderPassDescriptor_(v17, v30, v21, v25, v29))*((_BYTE *)self + 248) &= ~0x10u;
  }
}

- (void)_endFrame
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *privateRendererOwner;
  id delegate;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  double v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;

  if (self->_renderContext)
  {
    v5 = (void *)objc_msgSend_world(self, a2, v2, v3);
    v9 = objc_msgSend_worldRef(v5, v6, v7, v8);
    if (v9)
    {
      if ((*((_BYTE *)self + 248) & 0x10) != 0)
      {
        v17 = (void *)sub_1B187A9C4(v9, (uint64_t)v10, v11, v12, v13, v14, v15, v16);
        if (objc_msgSend_endImgUIFrame(v17, v18, v19, v20))
          *((_BYTE *)self + 248) &= ~0x10u;
      }
    }
    if ((*(_WORD *)&self->_selfDelegationConformance & 0x40) != 0)
    {
      v27 = sub_1B1815800((uint64_t)self->_engineContext);
      objc_msgSend__renderer_inputTimeForCurrentFrameWithTime_(self, v28, (uint64_t)self, v29, v27);
    }
    else
    {
      if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x40) != 0)
      {
        privateRendererOwner = self->_privateRendererOwner;
        v25 = sub_1B1815800((uint64_t)self->_engineContext);
        v26 = privateRendererOwner;
      }
      else
      {
        if ((*(_WORD *)&self->_delegationConformance & 0x40) == 0)
        {
LABEL_17:
          objc_msgSend_endFrameWaitingUntilCompleted_status_error_(self->_renderContext, v10, (*((unsigned __int8 *)self + 121) >> 5) & 1, 0, 0);
          return;
        }
        privateRendererOwner = self;
        if ((*((_BYTE *)self + 121) & 8) != 0)
          privateRendererOwner = self->_privateRendererOwner;
        delegate = self->_delegate;
        v25 = sub_1B1815800((uint64_t)self->_engineContext);
        v26 = delegate;
      }
      objc_msgSend__renderer_inputTimeForCurrentFrameWithTime_(v26, v23, (uint64_t)privateRendererOwner, v24, v25);
    }
    v34 = v33;
    v35 = (void *)objc_msgSend_metalLayer(self, v30, v31, v32);
    objc_msgSend_setInputTime_(v35, v36, v37, v38, v34);
    goto LABEL_17;
  }
}

- (void)_prepareRenderTarget
{
  uint64_t v2;
  uint64_t v3;
  char v5;

  v5 = *((_BYTE *)self + 121);
  if ((v5 & 1) != 0)
  {

    self->_offScreenFramebuffer = 0;
    v5 = *((_BYTE *)self + 121) & 0xFE;
    *((_BYTE *)self + 121) = v5;
  }
  if ((v5 & 0x20) != 0)
    MEMORY[0x1E0DE7D20](self, sel__createOffscreenFramebufferIfNeeded, v2, v3);
}

- (void)_createOffscreenFramebufferIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLTexture *offScreenFramebuffer;
  uint64_t width;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t height;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  char v36;
  char v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;

  offScreenFramebuffer = self->_offScreenFramebuffer;
  if ((*((_BYTE *)self + 121) & 1) != 0)
  {

    self->_offScreenFramebuffer = 0;
    *((_BYTE *)self + 121) &= ~1u;
  }
  else if (offScreenFramebuffer)
  {
    return;
  }
  width = self->_framebufferInfo.drawableSize.width;
  if (!(_DWORD)width)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: framebuffer width must be > 0"), v2, v3, v4, v5, v6, v7, v51);
    width = 8;
  }
  v11 = (void *)objc_msgSend_metalDevice(self, a2, v2, v3);
  v22 = objc_msgSend_maxTextureWidth2D(v11, v12, v13, v14);
  if (width <= v22)
    v22 = width;
  else
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: framebuffer width (%d) exceeds device's limit (%d), clamping"), v16, v17, v18, v19, v20, v21, width);
  height = self->_framebufferInfo.drawableSize.height;
  if (!(_DWORD)height)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: framebuffer height must be > 0"), v16, v17, v18, v19, v20, v21, v51);
    height = 8;
  }
  v24 = (void *)objc_msgSend_metalDevice(self, v15, v16, v17);
  v35 = objc_msgSend_maxTextureHeight2D(v24, v25, v26, v27);
  if (height <= v35)
    v35 = height;
  else
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: framebuffer height (%d) exceeds device's limit (%d), clamping"), v29, v30, v31, v32, v33, v34, height);
  v36 = objc_msgSend_wantsWideGamut(self->_renderContext, v28, v29, v30);
  if (self->__antialiasingMode)
    v37 = v36 | 8;
  else
    v37 = v36;
  v38 = sub_1B189D230(v37 | 0x10u);
  v40 = (void *)objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E0CC6BB0], v39, v38, v22, v35, 0);
  objc_msgSend_setUsage_(v40, v41, 5, v42);
  objc_msgSend_setStorageMode_(v40, v43, 0, v44);
  v48 = (void *)objc_msgSend_metalDevice(self, v45, v46, v47);
  self->_offScreenFramebuffer = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v48, v49, (uint64_t)v40, v50);
}

- (unint64_t)antialiasingMode
{
  if (sub_1B17C46BC(3))
    return 0;
  else
    return self->__antialiasingMode;
}

- (void)setAntialiasingMode:(unint64_t)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  VFXMTLRenderContext *renderContext;

  if (self->__antialiasingMode != a3)
  {
    self->__antialiasingMode = a3;
    objc_msgSend__invalidateFramebuffer(self, a2, a3, v3);
    v8 = objc_msgSend_antialiasingMode(self, v5, v6, v7);
    v17 = sub_1B189E9FC(v8, v9, v10, v11, v12, v13, v14, v15);
    renderContext = self->_renderContext;
    if (renderContext)
      objc_msgSend_setSampleCount_(renderContext, v16, v17, v18);
    sub_1B1813E44((uint64_t)self->_engineContext);
  }
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (void)set_superSamplingFactor:(float)a3
{
  sub_1B1815CA4((uint64_t)self->_engineContext, a3);
}

- (float)_superSamplingFactor
{
  return sub_1B1815CC0((uint64_t)self->_engineContext);
}

- (void)set_aspectRatio:(float)a3
{
  self->__aspectRatio = a3;
}

- (float)_aspectRatio
{
  return self->__aspectRatio;
}

- (uint64_t)set_screenTransform:(uint64_t)a3
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 240), sel_setScreenTransform_, a3, a4);
}

- (uint64_t)_screenTransform
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 240), sel_screenTransform, a3, a4);
}

- (__CFXEngineContext)_engineContext
{
  return self->_engineContext;
}

- (id)_renderContextMetal
{
  return self->_renderContext;
}

- (void)__CFObject
{
  return self->_engineContext;
}

- (BOOL)autoenablesDefaultLighting
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v20;

  objc_msgSend_lock(self, a2, v2, v3);
  v8 = objc_msgSend__engineContext(self, v5, v6, v7);
  if (v8)
  {
    v18 = sub_1B18146BC(v8, CFSTR("defaultLight"), v9, v10, v11, v12, v13, v14) == (const __CFDictionary *)*MEMORY[0x1E0C9AE50];
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: autoenablesDefaultLighting: renderer has no context"), v9, v10, v11, v12, v13, v14, v20);
    v18 = 0;
  }
  objc_msgSend_unlock(self, v15, v16, v17);
  return v18;
}

- (void)setAutoenablesDefaultLighting:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void **v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void **v43;
  uint64_t v44;

  v4 = a3;
  objc_msgSend_lock(self, a2, a3, v3);
  v9 = objc_msgSend__engineContext(self, v6, v7, v8);
  if (v9)
  {
    v17 = v9;
    v18 = sub_1B1813884(v9, v10, v11, v12, v13, v14, v15, v16);
    if (v18)
    {
      v26 = v18;
      sub_1B187973C(v18, v19, v20, v21, v22, v23, v24, v25);
      v32 = (void **)MEMORY[0x1E0C9AE40];
      if (v4)
        v32 = (void **)MEMORY[0x1E0C9AE50];
      sub_1B181542C(v17, CFSTR("defaultLight"), *v32, v27, v28, v29, v30, v31);
      sub_1B18797B4(v26, v33, v34, v35, v36, v37, v38, v39);
    }
    else
    {
      v43 = (void **)MEMORY[0x1E0C9AE40];
      if (v4)
        v43 = (void **)MEMORY[0x1E0C9AE50];
      sub_1B181542C(v17, CFSTR("defaultLight"), *v43, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: setAutoenablesDefaultLighting: renderer has no context"), v11, v12, v13, v14, v15, v16, v44);
  }
  objc_msgSend_unlock(self, v40, v41, v42);
}

- (VFXNode)pointOfView
{
  return self->_pointOfView;
}

- (void)setPointOfView:(id)a3
{
  uint64_t v3;
  id v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  VFXNode *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  int isPaused;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double height;
  double v123;
  float v124;
  float v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  int v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  float v140;
  float v141;
  int v142;
  float v143;
  float v144;
  float v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  const char *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  float v170;
  float v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  float v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  float v186;
  float v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  float v191;
  double v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  const char *v207;
  float32x2_t v208;
  float32x2_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  float32x2_t v216;
  uint32x2_t v217;
  float32x2_t v218;
  float32x2_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  float32x2_t v223;
  float32x2_t v224;
  const char *v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  const char *v247;
  __int128 v248;
  uint64_t v249;
  float32x2_t v250;
  float32x2_t v251;
  uint32x2_t v252;
  float32x2_t v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  const char *v274;
  float64x2_t v275;
  float64x2_t v276;
  float32x2_t v277;
  float32x2_t v278;
  uint32x2_t v279;
  float32x2_t v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  const char *v285;
  uint64_t v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  const char *v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t i;
  uint64_t v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  BOOL v311;
  void *v312;
  void *v313;
  void *v314;
  uint64_t v315;
  const char *v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  const char *v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  void *v327;
  double v328;
  double v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  double v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  const char *v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  const char *v346;
  uint64_t v347;
  const char *v348;
  const char *v349;
  uint64_t v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  __int128 v354;
  double a;
  __int128 v356;
  double c;
  __int128 v358;
  double tx;
  __int128 v360;
  double v361;
  uint64_t v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  CGAffineTransform t2;
  CGAffineTransform t1;
  _QWORD v369[7];
  CGAffineTransform v370;
  __int128 v371;
  CGAffineTransform v372;
  __int128 v373;
  _BYTE v374[128];
  uint64_t v375;
  simd_float4x4 v376;
  simd_float4x4 v377;

  v375 = *MEMORY[0x1E0C80C00];
  if (self->_pointOfView != a3)
  {
    v4 = a3;
    self->_pointOfViewWasSet = 1;
    if (objc_msgSend_isPresentationObject(a3, a2, (uint64_t)a3, v3))
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. can't set a presentation instance as a point of view"), v7, v8, v9, v10, v11, v12, (uint64_t)"[pov isPresentationObject] == 0");
    v13 = (void *)objc_msgSend_pointOfView(self, v6, v7, v8);
    v17 = (void *)objc_msgSend_presentationNode(v13, v14, v15, v16);
    v18 = self->_pointOfView;
    self->_pointOfView = (VFXNode *)v4;
    objc_msgSend_animationDuration(VFXTransaction, v19, v20, v21);
    v23 = v22;
    v31 = sub_1B1813884((uint64_t)self->_engineContext, v24, v25, v26, v27, v28, v29, v30);
    v35 = (void *)objc_msgSend_world(self, v32, v33, v34);
    v39 = (void *)objc_msgSend_clock(v35, v36, v37, v38);
    isPaused = objc_msgSend_isPaused(v39, v40, v41, v42);
    if ((objc_msgSend_immediateMode(VFXTransaction, v44, v45, v46) & 1) != 0)
    {
      v50 = 0;
    }
    else
    {
      v50 = (v23 > 0.0) & ~isPaused;
      objc_msgSend_begin(VFXTransaction, v47, v48, v49);
      if (!v17)
        v50 = 0;
    }
    v369[0] = MEMORY[0x1E0C809B0];
    v369[1] = 3221225472;
    v369[2] = sub_1B18B1CC4;
    v369[3] = &unk_1E63D7EA8;
    v369[5] = self;
    v369[6] = v31;
    v369[4] = v4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v47, v31, (uint64_t)self, v369);
    if (!v50)
      goto LABEL_74;
    v362 = objc_msgSend_animationTimingFunction(VFXTransaction, v51, v52, v53);
    if (!v362)
      v362 = sub_1B18C2048(0, v54, v55, v56);
    if (objc_msgSend_parentNode(v4, v54, v55, v56))
    {
      v60 = (void *)objc_msgSend_parentNode(v4, v57, v58, v59);
      v64 = (void *)objc_msgSend_presentationNode(v60, v61, v62, v63);
      objc_msgSend_convertTransform_fromNode_(v64, v65, (uint64_t)v17, v66, *(double *)&VFXMatrix4Identity, unk_1B2247DB0, 0.0, unk_1B2247DD0);
    }
    else
    {
      objc_msgSend_worldTransform(v17, v57, v58, v59);
    }
    v354 = v71;
    v356 = v70;
    v358 = v73;
    v360 = v72;
    v74 = (void *)objc_msgSend_presentationNode(v4, v67, v68, v69);
    objc_msgSend_transform(v74, v75, v76, v77);
    v377 = __invert_f4(v376);
    v80 = 0;
    *(_OWORD *)&v370.a = v356;
    *(_OWORD *)&v370.c = v354;
    *(_OWORD *)&v370.tx = v360;
    v371 = v358;
    do
    {
      *(float32x4_t *)((char *)&v372.a + v80) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v377.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v370.a + v80))), (float32x4_t)v377.columns[1], *(float32x2_t *)((char *)&v370.a + v80), 1), (float32x4_t)v377.columns[2], *(float32x4_t *)((char *)&v370.a + v80), 2), (float32x4_t)v377.columns[3], *(float32x4_t *)((char *)&v370.a + v80), 3);
      v80 += 16;
    }
    while (v80 != 64);
    tx = v372.tx;
    v361 = *(double *)&v373;
    a = v372.a;
    c = v372.c;
    v81 = (void *)objc_msgSend_animationWithKeyPath_(MEMORY[0x1E0CD2710], v78, (uint64_t)CFSTR("transform"), v79);
    objc_msgSend_setDuration_(v81, v82, v83, v84, v23);
    objc_msgSend_setTimingFunction_(v81, v85, v362, v86);
    objc_msgSend_setAdditive_(v81, v87, 1, v88);
    v92 = objc_msgSend_valueWithVFXMatrix4_(MEMORY[0x1E0CB3B18], v89, v90, v91, a, c, tx, v361);
    objc_msgSend_setFromValue_(v81, v93, v92, v94);
    v98 = objc_msgSend_valueWithVFXMatrix4_(MEMORY[0x1E0CB3B18], v95, v96, v97, *(double *)&VFXMatrix4Identity, unk_1B2247DB0, 0.0, unk_1B2247DD0);
    objc_msgSend_setToValue_(v81, v99, v98, v100);
    objc_msgSend_addAnimation_forKey_(v4, v101, (uint64_t)v81, 0);
    v105 = (void *)objc_msgSend_camera(v17, v102, v103, v104);
    v109 = (void *)objc_msgSend_presentationNode(v4, v106, v107, v108);
    v113 = (void *)objc_msgSend_camera(v109, v110, v111, v112);
    if ((objc_msgSend_hasCustomProjectionTransform(v105, v114, v115, v116) & 1) != 0
      || (objc_msgSend_hasCustomProjectionTransform(v113, v117, v118, v119) & 1) != 0)
    {
LABEL_58:
      v365 = 0u;
      v366 = 0u;
      v363 = 0u;
      v364 = 0u;
      v302 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E6478B80, v117, (uint64_t)&v363, (uint64_t)v374, 16);
      if (v302)
      {
        v303 = v302;
        v304 = *(_QWORD *)v364;
        do
        {
          for (i = 0; i != v303; ++i)
          {
            if (*(_QWORD *)v364 != v304)
              objc_enumerationMutation(&unk_1E6478B80);
            v306 = *(_QWORD *)(*((_QWORD *)&v363 + 1) + 8 * i);
            v307 = (void *)objc_msgSend_valueForKeyPath_(v105, v51, v306, v53);
            v310 = objc_msgSend_valueForKeyPath_(v105, v308, v306, v309);
            if (v310)
              v311 = v307 == 0;
            else
              v311 = 1;
            if (!v311)
            {
              v312 = (void *)v310;
              if ((objc_msgSend_isEqual_(v307, v51, v310, v53) & 1) == 0)
              {
                v313 = v4;
                v314 = (void *)MEMORY[0x1E0CD2710];
                v315 = objc_msgSend_stringByAppendingString_(CFSTR("camera."), v51, v306, v53);
                v318 = (void *)objc_msgSend_animationWithKeyPath_(v314, v316, v315, v317);
                objc_msgSend_setDuration_(v318, v319, v320, v321, v23);
                objc_msgSend_setTimingFunction_(v318, v322, v362, v323);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v327 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend_doubleValue(v307, v324, v325, v326);
                  v329 = v328;
                  objc_msgSend_doubleValue(v312, v330, v331, v332);
                  v337 = objc_msgSend_numberWithDouble_(v327, v334, v335, v336, v329 - v333);
                  objc_msgSend_setFromValue_(v318, v338, v337, v339);
                  v343 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v340, v341, v342, 0.0);
                  objc_msgSend_setToValue_(v318, v344, v343, v345);
                  objc_msgSend_setAdditive_(v318, v346, 1, v347);
                }
                else
                {
                  objc_msgSend_setFromValue_(v318, v324, (uint64_t)v307, v326);
                  objc_msgSend_setToValue_(v318, v349, (uint64_t)v312, v350);
                }
                v4 = v313;
                objc_msgSend_addAnimation_forKey_(v313, v348, (uint64_t)v318, 0);
              }
            }
          }
          v303 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E6478B80, v51, (uint64_t)&v363, (uint64_t)v374, 16);
        }
        while (v303);
      }
LABEL_74:
      if ((objc_msgSend_immediateMode(VFXTransaction, v51, v52, v53) & 1) == 0)
        objc_msgSend_commit(VFXTransaction, v351, v352, v353);
      return;
    }
    height = self->_framebufferInfo.drawableSize.height;
    if (height == 0.0)
      v123 = 1.0;
    else
      v123 = self->_framebufferInfo.drawableSize.width / height;
    objc_msgSend_fieldOfView(v113, v117, v120, v121);
    v125 = v124;
    v132 = 0;
    switch(objc_msgSend_fillMode(v113, v126, v127, v128))
    {
      case 0:
        v132 = v123 < 1.0;
        break;
      case 1:
        v132 = v123 > 1.0;
        break;
      case 2:
        break;
      default:
        v132 = 1;
        break;
    }
    v133 = objc_msgSend_fillMode(v105, v129, v130, v131);
    if (v133)
    {
      if (v133 != 1)
      {
        if (v133 == 2)
        {
          objc_msgSend_fieldOfView(v105, v134, v135, v136);
          v141 = v140;
          if ((v132 & 1) == 0)
            goto LABEL_41;
        }
        else
        {
          objc_msgSend_fieldOfView(v105, v134, v135, v136);
          v141 = v144;
          if ((v132 & 1) != 0)
          {
LABEL_41:
            if (v141 != v125)
            {
              v146 = (void *)objc_msgSend_animationWithKeyPath_(MEMORY[0x1E0CD2710], v137, (uint64_t)CFSTR("camera.fieldOfView"), v139);
              objc_msgSend_setDuration_(v146, v147, v148, v149, v23);
              objc_msgSend_setTimingFunction_(v146, v150, v362, v151);
              v155 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v152, v153, v154, (float)(v141 - v125));
              objc_msgSend_setFromValue_(v146, v156, v155, v157);
              v161 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v158, v159, v160, 0.0);
              objc_msgSend_setToValue_(v146, v162, v161, v163);
              objc_msgSend_setAdditive_(v146, v164, 1, v165);
              objc_msgSend_addAnimation_forKey_(v4, v166, (uint64_t)v146, 0);
            }
            if (objc_msgSend_usesOrthographicProjection(v105, v137, v138, v139))
            {
              if (objc_msgSend_usesOrthographicProjection(v113, v167, v168, v169))
              {
                objc_msgSend_orthographicScale(v105, v167, v168, v169);
                v171 = v170;
                objc_msgSend_orthographicScale(v113, v172, v173, v174);
                if (v171 != v175)
                {
                  v176 = (void *)objc_msgSend_animationWithKeyPath_(MEMORY[0x1E0CD2710], v167, (uint64_t)CFSTR("camera.orthographicScale"), v169);
                  objc_msgSend_setDuration_(v176, v177, v178, v179, v23);
                  objc_msgSend_setTimingFunction_(v176, v180, v362, v181);
                  v182 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend_orthographicScale(v105, v183, v184, v185);
                  v187 = v186;
                  objc_msgSend_orthographicScale(v113, v188, v189, v190);
                  *(float *)&v192 = v187 - v191;
                  v196 = objc_msgSend_numberWithFloat_(v182, v193, v194, v195, v192);
                  objc_msgSend_setFromValue_(v176, v197, v196, v198);
                  v202 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v199, v200, v201, 0.0);
                  objc_msgSend_setToValue_(v176, v203, v202, v204);
                  objc_msgSend_setAdditive_(v176, v205, 1, v206);
                  objc_msgSend_addAnimation_forKey_(v4, v207, (uint64_t)v176, 0);
                }
              }
            }
            objc_msgSend_filmOffset(v105, v167, v168, v169);
            v209 = v208;
            objc_msgSend_filmOffset(v113, v210, v211, v212);
            v217 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v209, v216));
            if ((vpmax_u32(v217, v217).u32[0] & 0x80000000) != 0)
            {
              objc_msgSend_filmOffset(v105, v213, v214, v215);
              v219 = v218;
              objc_msgSend_filmOffset(v113, v220, v221, v222);
              v224 = vsub_f32(v219, v223);
              v227 = (void *)objc_msgSend_animationWithKeyPath_(MEMORY[0x1E0CD2710], v225, (uint64_t)CFSTR("camera.filmOffset"), v226);
              objc_msgSend_setDuration_(v227, v228, v229, v230, v23);
              objc_msgSend_setTimingFunction_(v227, v231, v362, v232);
              v236 = objc_msgSend_VFX_valueWithCGPoint_(MEMORY[0x1E0CB3B18], v233, v234, v235, vcvtq_f64_f32(v224));
              objc_msgSend_setFromValue_(v227, v237, v236, v238);
              v242 = objc_msgSend_VFX_valueWithCGPoint_(MEMORY[0x1E0CB37E8], v239, v240, v241, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
              objc_msgSend_setToValue_(v227, v243, v242, v244);
              objc_msgSend_setAdditive_(v227, v245, 1, v246);
              objc_msgSend_addAnimation_forKey_(v4, v247, (uint64_t)v227, 0);
            }
            v248 = 0uLL;
            memset(&v372, 0, sizeof(v372));
            if (v105)
            {
              objc_msgSend_postProjectionTransform(v105, v213, v214, v215);
              v248 = 0uLL;
            }
            *(_OWORD *)&v370.c = v248;
            *(_OWORD *)&v370.tx = v248;
            *(_OWORD *)&v370.a = v248;
            if (v113)
              objc_msgSend_postProjectionTransform(v113, v213, v214, v215);
            t1 = v372;
            t2 = v370;
            if (!CGAffineTransformEqualToTransform(&t1, &t2))
            {
              v250 = vcvt_f32_f64(*(float64x2_t *)&v372.tx);
              v251 = vcvt_f32_f64(*(float64x2_t *)&v370.tx);
              v252 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v250, v251));
              if ((vpmax_u32(v252, v252).u32[0] & 0x80000000) != 0)
              {
                v253 = vsub_f32(v250, v251);
                v254 = (void *)objc_msgSend_animationWithKeyPath_(MEMORY[0x1E0CD2710], v117, (uint64_t)CFSTR("camera.postProjectionTransformTranslation"), v249);
                objc_msgSend_setDuration_(v254, v255, v256, v257, v23);
                objc_msgSend_setTimingFunction_(v254, v258, v362, v259);
                v263 = objc_msgSend_VFX_valueWithCGPoint_(MEMORY[0x1E0CB3B18], v260, v261, v262, vcvtq_f64_f32(v253));
                objc_msgSend_setFromValue_(v254, v264, v263, v265);
                v269 = objc_msgSend_VFX_valueWithCGPoint_(MEMORY[0x1E0CB37E8], v266, v267, v268, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
                objc_msgSend_setToValue_(v254, v270, v269, v271);
                objc_msgSend_setAdditive_(v254, v272, 1, v273);
                objc_msgSend_addAnimation_forKey_(v4, v274, (uint64_t)v254, 0);
              }
              v275.f64[0] = v372.a;
              v275.f64[1] = v372.d;
              v276.f64[0] = v370.a;
              v276.f64[1] = v370.d;
              v277 = vcvt_f32_f64(v275);
              v278 = vcvt_f32_f64(v276);
              v279 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v277, v278));
              if ((vpmax_u32(v279, v279).u32[0] & 0x80000000) != 0)
              {
                v280 = vsub_f32(v277, v278);
                v281 = (void *)objc_msgSend_animationWithKeyPath_(MEMORY[0x1E0CD2710], v117, (uint64_t)CFSTR("camera.postProjectionTransformScale"), v249);
                objc_msgSend_setDuration_(v281, v282, v283, v284, v23);
                objc_msgSend_setTimingFunction_(v281, v285, v362, v286);
                v290 = objc_msgSend_VFX_valueWithCGPoint_(MEMORY[0x1E0CB3B18], v287, v288, v289, vcvtq_f64_f32(v280));
                objc_msgSend_setFromValue_(v281, v291, v290, v292);
                v296 = objc_msgSend_VFX_valueWithCGPoint_(MEMORY[0x1E0CB37E8], v293, v294, v295, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
                objc_msgSend_setToValue_(v281, v297, v296, v298);
                objc_msgSend_setAdditive_(v281, v299, 1, v300);
                objc_msgSend_addAnimation_forKey_(v4, v301, (uint64_t)v281, 0);
              }
            }
            goto LABEL_58;
          }
        }
LABEL_35:
        if (objc_msgSend_fillMode(v113, v137, v138, v139) != 4 && objc_msgSend_fillMode(v105, v137, v138, v139) != 4)
        {
          if (v132)
            v145 = sub_1B18B1E54(v141, v123);
          else
            v145 = sub_1B18B1EC0(v141, v123);
          v141 = v145;
        }
        goto LABEL_41;
      }
      v142 = v123 > 1.0;
    }
    else
    {
      v142 = v123 < 1.0;
    }
    objc_msgSend_fieldOfView(v105, v134, v135, v136);
    v141 = v143;
    if (v132 == v142)
      goto LABEL_41;
    goto LABEL_35;
  }
}

- (void)setPointOfCulling:(id)a3
{
  VFXNode *pointOfCulling;
  VFXNode *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  _QWORD v16[6];

  pointOfCulling = self->_pointOfCulling;
  if (pointOfCulling != a3)
  {
    v6 = pointOfCulling;
    self->_pointOfCulling = (VFXNode *)a3;
    v14 = sub_1B1813884((uint64_t)self->_engineContext, v7, v8, v9, v10, v11, v12, v13);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1B18B1FBC;
    v16[3] = &unk_1E63D53C8;
    v16[4] = a3;
    v16[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, v16);
  }
}

- (id)pointOfCulling
{
  return self->_pointOfCulling;
}

- (BOOL)_viewportDidChange
{
  return self->_framebufferInfo.drawableSize.width != COERCE_FLOAT(*(_QWORD *)&self->__viewport[8])
      || self->_framebufferInfo.drawableSize.height != COERCE_FLOAT(HIDWORD(*(_OWORD *)self->__viewport));
}

- (void)_projectPoints:(VFXRenderer *)self count:(SEL)a2 viewport:
{
  uint64_t v2;
  uint64_t v3;
  __n128 v4;
  uint64_t v5;
  float32x4_t *v6;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __n128 v29;
  float32x4_t v30;

  v29 = v4;
  v5 = v3;
  v6 = (float32x4_t *)v2;
  v8 = (uint64_t *)objc_msgSend__engineContext(self, a2, v2, v3);
  if (v8)
  {
    v16 = sub_1B1814768(v8, v9, v10, v11, v12, v13, v14, v15);
    if (v16)
    {
      if (v5)
      {
        v20 = (uint64_t)v16;
        do
        {
          v30 = *v6;
          v21 = (void *)objc_msgSend_world(self, v17, v18, v19);
          v25 = objc_msgSend_worldRef(v21, v22, v23, v24);
          if (sub_1B17A829C(&v30, 1, v20, v25, (uint64_t)&v30, v26, v27, v28, v29))
            *v6 = v30;
          ++v6;
          --v5;
        }
        while (v5);
      }
    }
  }
}

- (__n128)_projectPoint:(uint64_t)a3 viewport:(uint64_t)a4
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __n128 v45;

  v7 = (uint64_t *)objc_msgSend__engineContext(a1, a2, a3, a4);
  if (v7)
  {
    v15 = sub_1B1814768(v7, v8, v9, v10, v11, v12, v13, v14);
    if (v15)
    {
      v19 = (uint64_t)v15;
      v45 = (__n128)a5;
      v20 = (void *)objc_msgSend_world(a1, v16, v17, v18);
      v24 = objc_msgSend_worldRef(v20, v21, v22, v23);
      sub_1B187973C(v24, v25, v26, v27, v28, v29, v30, v31);
      LOBYTE(v19) = sub_1B17A829C((float32x4_t *)&v45, 1, v19, v24, (uint64_t)&v45, v32, v33, v34, a6);
      sub_1B18797B4(v24, v35, v36, v37, v38, v39, v40, v41);
      if ((v19 & 1) != 0)
        return v45;
    }
  }
  return (__n128)a5;
}

- (__n128)_unprojectPoint:(uint64_t)a3 viewport:(uint64_t)a4
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __n128 v45;

  v7 = (uint64_t *)objc_msgSend__engineContext(a1, a2, a3, a4);
  if (v7)
  {
    v15 = sub_1B1814768(v7, v8, v9, v10, v11, v12, v13, v14);
    if (v15)
    {
      v19 = (uint64_t)v15;
      v45 = a5;
      v20 = (void *)objc_msgSend_world(a1, v16, v17, v18);
      v24 = objc_msgSend_worldRef(v20, v21, v22, v23);
      sub_1B187973C(v24, v25, v26, v27, v28, v29, v30, v31);
      LOBYTE(v19) = sub_1B17A8484((uint64_t)&v45, 1, v19, v24, (uint64_t)&v45, v32, v33, v34, a6);
      sub_1B18797B4(v24, v35, v36, v37, v38, v39, v40, v41);
      if ((v19 & 1) != 0)
        return v45;
    }
  }
  return a5;
}

- (void)projectPoint:(uint64_t)a3
{
  float64x2_t v5;

  v5.f64[0] = *((float64_t *)a1 + 10);
  if (v5.f64[0] != 0.0)
  {
    v5.f64[1] = *((float64_t *)a1 + 11);
    return (void *)objc_msgSend__projectPoint_viewport_(a1, a2, a3, a4, a5, *(double *)vcvt_hight_f32_f64(0, v5).i64);
  }
  return a1;
}

- (uint64_t)unprojectPoint:(uint64_t)a3
{
  if (*(double *)(result + 80) != 0.0)
    return MEMORY[0x1E0DE7D20](result, sel__unprojectPoint_viewport_, a3, a4);
  return result;
}

- (void)_didRenderWorld:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  os_signpost_id_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *privateRendererOwner;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint8_t v41[16];
  uint8_t buf[16];

  if ((*(_WORD *)&self->_delegationConformance & 0x20) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 0x20) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x20) != 0)
  {
    objc_msgSend_setImmediateMode_(VFXTransaction, a2, 1, v3);
    v9 = objc_msgSend_worldRef(a3, v6, v7, v8);
    objc_msgSend_setImmediateModeRestrictedContext_(VFXTransaction, v10, v9, v11);
    v19 = sub_1B1813794((uint64_t)self->_engineContext, v12, v13, v14, v15, v16, v17, v18);
    v20 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"Did render delegate", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 1453);
    v21 = sub_1B18137DC((uint64_t)self->_engineContext);
    v22 = sub_1B17C439C();
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v26 = v22;
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B178D000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Delegate (didRender)", ", buf, 2u);
      }
    }
    if (!objc_msgSend_clientCommandBuffer(self->_renderContext, v23, v24, v25))
    {
      v30 = (void *)objc_msgSend_currentCommandBuffer(self->_renderContext, v27, v28, v29);
      objc_msgSend_enqueue(v30, v31, v32, v33);
    }
    if ((*(_WORD *)&self->_delegationConformance & 0x20) != 0)
    {
      privateRendererOwner = self;
      if ((*((_BYTE *)self + 121) & 8) != 0)
        privateRendererOwner = self->_privateRendererOwner;
      objc_msgSend_renderer_didRenderWorld_atTime_(self->_delegate, v27, (uint64_t)privateRendererOwner, (uint64_t)a3, self->_time);
    }
    if ((*(_WORD *)&self->_selfDelegationConformance & 0x20) != 0)
      objc_msgSend__renderer_didRenderWorld_atTime_(self, v27, (uint64_t)self, (uint64_t)a3, self->_time);
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x20) != 0)
      objc_msgSend__renderer_didRenderWorld_atTime_(self->_privateRendererOwner, v27, (uint64_t)self->_privateRendererOwner, (uint64_t)a3, self->_time);
    v35 = sub_1B17C439C();
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v36 = v35;
      if (os_signpost_enabled(v35))
      {
        *(_WORD *)v41 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B178D000, v36, OS_SIGNPOST_INTERVAL_END, v21, "Delegate (didRender)", ", v41, 2u);
      }
    }
    *(double *)(v19 + 168) = *(double *)(v19 + 168) + CACurrentMediaTime() - v20;
    prof_endFlame();
    objc_msgSend_setImmediateModeRestrictedContext_(VFXTransaction, v37, 0, v38);
    objc_msgSend_setImmediateMode_(VFXTransaction, v39, 0, v40);
  }
}

- (void)_willRenderWorld:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  os_signpost_id_t v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  double time;
  void *privateRendererOwner;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint8_t v33[16];
  uint8_t buf[16];

  if ((*(_WORD *)&self->_delegationConformance & 0x10) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 0x10) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x10) != 0)
  {
    objc_msgSend_setImmediateMode_(VFXTransaction, a2, 1, v3);
    v9 = objc_msgSend_worldRef(a3, v6, v7, v8);
    objc_msgSend_setImmediateModeRestrictedContext_(VFXTransaction, v10, v9, v11);
    v19 = sub_1B1813794((uint64_t)self->_engineContext, v12, v13, v14, v15, v16, v17, v18);
    v20 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"will render delegate", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 1490);
    v21 = sub_1B18137DC((uint64_t)self->_engineContext);
    v22 = sub_1B17C439C();
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v24 = v22;
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B178D000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Delegate (willRender)", ", buf, 2u);
      }
    }
    time = self->_time;
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x10) != 0)
      objc_msgSend__renderer_willRenderWorld_atTime_(self->_privateRendererOwner, v23, (uint64_t)self->_privateRendererOwner, (uint64_t)a3, self->_time);
    if ((*(_WORD *)&self->_selfDelegationConformance & 0x10) != 0)
      objc_msgSend__renderer_willRenderWorld_atTime_(self, v23, (uint64_t)self, (uint64_t)a3, time);
    if ((*(_WORD *)&self->_delegationConformance & 0x10) != 0)
    {
      privateRendererOwner = self;
      if ((*((_BYTE *)self + 121) & 8) != 0)
        privateRendererOwner = self->_privateRendererOwner;
      objc_msgSend_renderer_willRenderWorld_atTime_(self->_delegate, v23, (uint64_t)privateRendererOwner, (uint64_t)a3, time);
    }
    v27 = sub_1B17C439C();
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v28 = v27;
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)v33 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B178D000, v28, OS_SIGNPOST_INTERVAL_END, v21, "Delegate (willRender)", ", v33, 2u);
      }
    }
    *(double *)(v19 + 168) = *(double *)(v19 + 168) + CACurrentMediaTime() - v20;
    prof_endFlame();
    objc_msgSend_setImmediateModeRestrictedContext_(VFXTransaction, v29, 0, v30);
    objc_msgSend_setImmediateMode_(VFXTransaction, v31, 0, v32);
  }
}

- (id)_readSubdivCacheForHash:(id)a3
{
  id result;
  void *privateRendererOwner;

  if (((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x80) == 0
     || (result = (id)objc_msgSend__renderer_subdivDataForHash_(self->_privateRendererOwner, a2, (uint64_t)self->_privateRendererOwner, (uint64_t)a3)) == 0)&& ((*(_WORD *)&self->_selfDelegationConformance & 0x80) == 0|| (result = (id)objc_msgSend__renderer_subdivDataForHash_(self, a2, (uint64_t)self, (uint64_t)a3)) == 0))
  {
    if ((*(_WORD *)&self->_delegationConformance & 0x80) == 0)
      return 0;
    privateRendererOwner = self;
    if ((*((_BYTE *)self + 121) & 8) != 0)
      privateRendererOwner = self->_privateRendererOwner;
    result = (id)objc_msgSend__renderer_subdivDataForHash_(self->_delegate, a2, (uint64_t)privateRendererOwner, (uint64_t)a3);
    if (!result)
      return 0;
  }
  return result;
}

- (void)_writeSubdivCacheForHash:(id)a3 dataProvider:(id)a4
{
  void *privateRendererOwner;

  if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x100) != 0)
    objc_msgSend__renderer_didBuildSubdivDataForHash_dataProvider_(self->_privateRendererOwner, a2, (uint64_t)self->_privateRendererOwner, (uint64_t)a3, a4);
  if ((*(_WORD *)&self->_selfDelegationConformance & 0x100) != 0)
    objc_msgSend__renderer_didBuildSubdivDataForHash_dataProvider_(self, a2, (uint64_t)self, (uint64_t)a3, a4);
  if ((*(_WORD *)&self->_delegationConformance & 0x100) != 0)
  {
    privateRendererOwner = self;
    if ((*((_BYTE *)self + 121) & 8) != 0)
      privateRendererOwner = self->_privateRendererOwner;
    objc_msgSend__renderer_didBuildSubdivDataForHash_dataProvider_(self->_delegate, a2, (uint64_t)privateRendererOwner, (uint64_t)a3, a4);
  }
}

- (void)setAutoAdjustCamera:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = objc_msgSend__engineContext(self, a2, a3, v3);
  if (v5)
    sub_1B1815510(v5, v4, v6, v7, v8, v9, v10, v11);
}

- (BOOL)autoAdjustCamera
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend__engineContext(self, a2, v2, v3);
  if (v4)
    LOBYTE(v4) = sub_1B1815564(v4, v5, v6, v7, v8, v9, v10, v11) != 0;
  return v4;
}

- (id)_defaultPOVForWorld:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  const char *v12;
  uint64_t v13;

  v4 = (void *)objc_msgSend_rootNode(a3, a2, (uint64_t)a3, v3);
  v7 = (void *)objc_msgSend_childNodesPassingTest_(v4, v5, (uint64_t)&unk_1E63D0F30, v6);
  result = (id)objc_msgSend_count(v7, v8, v9, v10);
  if (result)
    return (id)objc_msgSend_objectAtIndex_(v7, v12, 0, v13);
  return result;
}

- (VFXWorld)world
{
  return self->_world;
}

- (void)_worldDidChange
{
  uint64_t v2;
  VFXWorld *world;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  world = self->_world;
  if (world)
  {
    if (!self->_pointOfViewWasSet
      || (v5 = objc_msgSend_world(self->_pointOfView, a2, (uint64_t)world, v2),
          world = self->_world,
          (VFXWorld *)v5 != world))
    {
      v7 = objc_msgSend__defaultPOVForWorld_(self, a2, (uint64_t)world, v2);
      if ((*((_BYTE *)self + 121) & 8) != 0)
        objc_msgSend_setPointOfView_(self->_privateRendererOwner, v6, v7, v8);
      else
        objc_msgSend_setPointOfView_(self, v6, v7, v8);
      self->_pointOfViewWasSet = 0;
    }
  }
}

- (void)setWorld:(id)a3 completionHandler:(id)a4
{
  VFXWorld *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __CFXEngineContext *engineContext;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  _QWORD v37[5];

  objc_msgSend_lock(self, a2, (uint64_t)a3, (uint64_t)a4);

  v7 = (VFXWorld *)a3;
  self->_world = v7;
  v11 = objc_msgSend_worldRef(v7, v8, v9, v10);
  v12 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1B18B2AAC;
  v37[3] = &unk_1E63D5378;
  v37[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v11, 0, v37);
  v17 = objc_msgSend_defaultRenderGraph(a3, v14, v15, v16);
  objc_msgSend_setRenderGraph_(self, v18, v17, v19);
  objc_msgSend__worldDidChange(self, v20, v21, v22);
  if (a4)
  {
    v36[0] = v12;
    v36[1] = 3221225472;
    v36[2] = sub_1B18B2AEC;
    v36[3] = &unk_1E63D84B0;
    v36[4] = a4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v23, 0, (uint64_t)self, v36);
  }
  engineContext = self->_engineContext;
  if (engineContext)
  {
    v31 = sub_1B1814484((uint64_t)engineContext, 0, v24, v25, v26, v27, v28, v29);
    if (v31)
      sub_1B17F9364(v31, (uint64_t)a3, v24, v25, v32, v33, v34, v35);
  }
  objc_msgSend_unlock(self, v23, v24, v25);
}

- (void)setWorld:(id)a3
{
  uint64_t v3;
  VFXWorld *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];

  if (self->_world != a3)
  {
    objc_msgSend_lock(self, a2, (uint64_t)a3, v3);

    v6 = (VFXWorld *)a3;
    self->_world = v6;
    v10 = objc_msgSend_worldRef(v6, v7, v8, v9);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1B18B2BBC;
    v24[3] = &unk_1E63D5378;
    v24[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, 0, v24);
    v15 = objc_msgSend_defaultRenderGraph(a3, v12, v13, v14);
    objc_msgSend_setRenderGraph_(self, v16, v15, v17);
    objc_msgSend__worldDidChange(self, v18, v19, v20);
    objc_msgSend_unlock(self, v21, v22, v23);
  }
}

- (UIColor)backgroundColor
{
  uint64_t v2;
  uint64_t v3;
  _TtC3VFX17VFXRendererLegacy *legacyRenderer;

  legacyRenderer = self->_legacyRenderer;
  if (legacyRenderer)
    return (UIColor *)objc_msgSend_backgroundColor(legacyRenderer, a2, v2, v3);
  else
    return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v3;
  _TtC3VFX17VFXRendererLegacy *legacyRenderer;
  UIColor *backgroundColor;
  UIColor *v8;
  const char *v9;
  float32x4_t v10;
  uint64_t v11;
  CFXColor4 v12;
  uint64_t v13;
  uint64_t v14;

  legacyRenderer = self->_legacyRenderer;
  if (legacyRenderer)
  {
    objc_msgSend_setBackgroundColor_(legacyRenderer, a2, (uint64_t)a3, v3);
  }
  else
  {
    backgroundColor = self->_backgroundColor;
    if (backgroundColor != a3)
    {

      v8 = (UIColor *)a3;
      self->_backgroundColor = v8;
      v10.i64[0] = objc_msgSend_vfx_CFXColorIgnoringColorSpace_success_(v8, v9, 0, 0);
      v10.i64[1] = v11;
      v12 = (CFXColor4)vmulq_f32(v10, (float32x4_t)vdupq_n_s32(HIDWORD(v11)));
      v12.var0.var0[3] = *((float *)&v11 + 1);
      self->_cfxBackgroundColor = v12;
      MEMORY[0x1E0DE7D20](self, sel__cfxBackgroundColorDidChange, v13, v14);
    }
  }
}

- (void)_cfxBackgroundColorDidChange
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = objc_msgSend__engineContext(self, a2, v2, v3);
  if (!v11)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v5, v6, v7, v8, v9, v10, (uint64_t)"engineContext");
  sub_1B18158E4(v11, *(_QWORD *)self->_cfxBackgroundColor.var0.var0, *(_QWORD *)&self->_cfxBackgroundColor.var0.var1.var2);
}

- (void)resolvedBackgroundColorDidChange
{
  float32x4_t v3;
  uint64_t v4;
  CFXColor4 v5;
  uint64_t v6;
  uint64_t v7;

  v3.i64[0] = objc_msgSend_vfx_CFXColorIgnoringColorSpace_success_(self->_backgroundColor, a2, 0, 0);
  v3.i64[1] = v4;
  v5 = (CFXColor4)vmulq_f32(v3, (float32x4_t)vdupq_n_s32(HIDWORD(v4)));
  v5.var0.var0[3] = *((float *)&v4 + 1);
  self->_cfxBackgroundColor = v5;
  MEMORY[0x1E0DE7D20](self, sel__cfxBackgroundColorDidChange, v6, v7);
}

- (id)metalLayer
{
  if ((*((_BYTE *)self + 121) & 0x10) != 0)
    return (id)((uint64_t (*)(VFXWorldRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_privateRendererOwner, sel_vfx_backingLayer);
  else
    return 0;
}

- (id)metalDevice
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_device(self->_renderContext, a2, v2, v3);
}

- (id)_computedLightingEnvironmentMapsPath
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = sub_1B1813BC4((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_generatedTexturePath, v9, v10);
}

- (void)set_computedLightingEnvironmentMapsPath:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  const char *v10;
  uint64_t v11;

  v9 = (void *)sub_1B1813BC4((uint64_t)self->_engineContext, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  objc_msgSend_setGeneratedTexturePath_(v9, v10, (uint64_t)a3, v11);
}

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  VFXWorldRenderer *privateRendererOwner;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: prepareObject is deprecated, use VFXWorld.prepare instead"), v8, v9, v10, v11, v12, v13, v114);
    return 0;
  }
  v14 = (uint64_t *)objc_msgSend_snapshotRendererWithSize_(self, v7, v8, v9, 16.0, 16.0);
  objc_msgSend_setWorld_(v14, v15, (uint64_t)a3, v16);
  objc_msgSend_set_viewport_(v14, v17, v18, v19, 0.0);
  objc_msgSend_flush(VFXTransaction, v20, v21, v22);
  v26 = objc_msgSend_worldRef(a3, v23, v24, v25);
  sub_1B187973C(v26, v27, v28, v29, v30, v31, v32, v33);
  v37 = objc_msgSend__engineContext(v14, v34, v35, v36);
  sub_1B18159F8(v37, (uint64_t)a4, v38, v39, v40, v41, v42, v43);
  v47 = objc_msgSend__engineContext(v14, v44, v45, v46);
  v48 = sub_1B1814F00((uint64_t)self->_engineContext);
  sub_1B1814F7C(v47, v48);
  if ((*((_BYTE *)self + 121) & 8) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!v48)
      goto LABEL_11;
LABEL_9:
    v56 = 1;
    goto LABEL_10;
  }
  privateRendererOwner = self->_privateRendererOwner;
  if ((objc_msgSend__usesLayeredRendering(privateRendererOwner, v49, v50, v51) & 1) != 0)
    goto LABEL_9;
  if ((objc_msgSend__usesMultipleViewportRendering(privateRendererOwner, v53, v54, v55) & 1) != 0)
  {
    v56 = 2;
LABEL_10:
    sub_1B1814F90(v47, 2);
    sub_1B1814F74(v47, v56);
  }
LABEL_11:
  objc_msgSend__beginFrame(v14, v49, v50, v51);
  objc_msgSend_updateAtTime_(v14, v58, v59, v60, self->_time);
  objc_msgSend__render(v14, v61, v62, v63);
  sub_1B18797B4(v26, v64, v65, v66, v67, v68, v69, v70);
  v114 = 0;
  v115 = 0;
  v74 = (void *)objc_msgSend__renderContextMetal(v14, v71, v72, v73);
  objc_msgSend_endFrameWaitingUntilCompleted_status_error_(v74, v75, 1, (uint64_t)&v114, &v115);
  v79 = (void *)objc_msgSend__renderContextMetal(v14, v76, v77, v78);
  v83 = objc_msgSend_resourceManager(v79, v80, v81, v82);
  v84 = (void *)sub_1B18FD768(v83);
  objc_msgSend_waitForShadersCompilation(v84, v85, v86, v87);
  v95 = (void *)sub_1B1813BC4(v14[23], v88, v89, v90, v91, v92, v93, v94);
  v103 = (void *)sub_1B1813BC4((uint64_t)self->_engineContext, v96, v97, v98, v99, v100, v101, v102);
  if (v95)
  {
    if (v103)
    {
      v107 = (void *)objc_msgSend_compilationErrors(v103, v104, v105, v106);
      v111 = objc_msgSend_compilationErrors(v95, v108, v109, v110);
      objc_msgSend_addEntriesFromDictionary_(v107, v112, v111, v113);
    }
  }
  return v114 == 4;
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  sub_1B17C4408(16, (uint64_t)CFSTR("Error: prepareObjects is deprecated"), (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v17);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v11, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(a3);
        objc_msgSend_prepareObject_shouldAbortBlock_(self, v13, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), 0);
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v13, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v14);
  }
  if (a4)
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
}

- (id)programWithNode:(id)a3 withMaterial:(id)a4
{
  return 0;
}

- (void)_updateEngineCallbacks
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXEngineContext *engineContext;
  _QWORD *v10;
  __int16 delegationConformance;
  __int16 selfDelegationConformance;

  engineContext = self->_engineContext;
  if (engineContext)
  {
    v10 = (_QWORD *)sub_1B18149E4((uint64_t)engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
    delegationConformance = (__int16)self->_delegationConformance;
    if ((delegationConformance & 0x10) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 0x10) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x10) != 0)
    {
      *v10 = sub_1B18B31B4;
      delegationConformance = (__int16)self->_delegationConformance;
    }
    if ((delegationConformance & 0x20) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 0x20) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x20) != 0)
    {
      v10[1] = sub_1B18B31FC;
      delegationConformance = (__int16)self->_delegationConformance;
    }
    if ((delegationConformance & 0x80) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 0x80) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x80) != 0)
    {
      v10[2] = sub_1B18B3244;
      delegationConformance = (__int16)self->_delegationConformance;
    }
    if ((delegationConformance & 0x100) != 0
      || (selfDelegationConformance = (__int16)self->_selfDelegationConformance, (selfDelegationConformance & 0x100) != 0)
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x100) != 0)
    {
      v10[3] = sub_1B18B3278;
      selfDelegationConformance = (__int16)self->_selfDelegationConformance;
    }
    if ((selfDelegationConformance & 0x200) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x200) != 0)
    {
      v10[4] = sub_1B18B273C;
      v10[5] = sub_1B18B2778;
      v10[6] = sub_1B18B27E8;
      v10[7] = sub_1B18B32B4;
    }
  }
}

- (void)setDelegate:(id)a3
{
  __int16 v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;

  objc_storeWeak(&self->_delegate, a3);
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 2;
  else
    v4 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFFD | v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 4;
  else
    v5 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFFB | v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 8;
  else
    v6 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFF7 | v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 16;
  else
    v7 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFEF | v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 32;
  else
    v8 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFDF | v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 64;
  else
    v9 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFBF | v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 128;
  else
    v10 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFF7F | v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = 256;
  else
    v14 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFCFF | v14;
  objc_msgSend__updateEngineCallbacks(self, v11, v12, v13);
}

- (VFXWorldRendererDelegate)delegate
{
  return (VFXWorldRendererDelegate *)objc_loadWeak(&self->_delegate);
}

- (BOOL)_wantsWorldRendererDelegationMessages
{
  return (*((unsigned __int8 *)self + 248) >> 5) & 1;
}

- (void)set_wantsWorldRendererDelegationMessages:(BOOL)a3
{
  uint64_t v3;
  char v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 selfDelegationConformance;

  if (a3)
    v5 = 32;
  else
    v5 = 0;
  *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xDF | v5;
  if (!a3 || (*((_BYTE *)self + 121) & 8) != 0)
  {
    v14 = 0;
    selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFE00;
  }
  else
  {
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFF7 | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFEF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 32;
    else
      v10 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFDF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 128;
    else
      v11 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFF7F | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 256;
    else
      v12 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFEFF | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 64;
    else
      v13 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFBF | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 512;
    else
      v14 = 0;
    selfDelegationConformance = (__int16)self->_selfDelegationConformance;
  }
  *(_WORD *)&self->_selfDelegationConformance = selfDelegationConformance & 0xFDFF | v14;
  objc_msgSend__updateEngineCallbacks(self, a2, a3, v3);
}

- (BOOL)_shouldForwardWorldRendererDelegationMessagesToPrivateRendererOwner
{
  return (*((unsigned __int8 *)self + 248) >> 6) & 1;
}

- (void)set_shouldForwardWorldRendererDelegationMessagesToPrivateRendererOwner:(BOOL)a3
{
  uint64_t v3;
  char v5;
  __int16 v6;
  __int16 privateRendererOwnerDelegationConformance;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;

  if (a3)
    v5 = 64;
  else
    v5 = 0;
  *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xBF | v5;
  if (a3 && (*((_BYTE *)self + 121) & 8) != 0)
  {
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 2;
    else
      v8 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFFD | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 4;
    else
      v9 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFFB | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 8;
    else
      v10 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFF7 | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 16;
    else
      v11 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFEF | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 32;
    else
      v12 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFDF | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 128;
    else
      v13 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFF7F | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 256;
    else
      v14 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFEFF | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 64;
    else
      v15 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFBF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 512;
    else
      v6 = 0;
    privateRendererOwnerDelegationConformance = (__int16)self->_privateRendererOwnerDelegationConformance;
  }
  else
  {
    v6 = 0;
    privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFE00;
  }
  *(_WORD *)&self->_privateRendererOwnerDelegationConformance = privateRendererOwnerDelegationConformance & 0xFDFF | v6;
  objc_msgSend__updateEngineCallbacks(self, a2, a3, v3);
}

- (id)_resourceManagerMonitor
{
  return objc_loadWeak((id *)&self->_resourceManagerMonitor);
}

- (void)set_resourceManagerMonitor:(id)a3
{
  _VFXWorldRendererResourceManagerMonitor **p_resourceManagerMonitor;
  id v6;
  VFXRenderer *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;

  p_resourceManagerMonitor = &self->_resourceManagerMonitor;
  if (objc_loadWeak((id *)&self->_resourceManagerMonitor) != a3)
  {
    if (a3)
      v6 = a3;
    else
      v6 = 0;
    if (a3)
      v7 = self;
    else
      v7 = 0;
    objc_storeWeak((id *)p_resourceManagerMonitor, v6);
    objc_msgSend_setResourceManagerMonitor_(self->_renderContext, v8, (uint64_t)v7, v9);
    v13 = (void *)objc_msgSend__renderContextMetal(self->_preloadRenderer, v10, v11, v12);
    objc_msgSend_setResourceManagerMonitor_(v13, v14, (uint64_t)v7, v15);
  }
}

- (void)renderContext:(id)a3 didFallbackToDefaultTextureForSource:(id)a4 message:(id)a5
{
  void *privateRendererOwner;
  id Weak;

  privateRendererOwner = self;
  if ((*((_BYTE *)self + 121) & 8) != 0)
    privateRendererOwner = self->_privateRendererOwner;
  Weak = objc_loadWeak((id *)&self->_resourceManagerMonitor);
  MEMORY[0x1E0DE7D20](Weak, sel_renderer_didFallbackToDefaultTextureForSource_message_, privateRendererOwner, a4);
}

- (id)_commandBufferStatusMonitor
{
  return objc_loadWeak((id *)&self->_commandBufferStatusMonitor);
}

- (void)set_commandBufferStatusMonitor:(id)a3
{
  _VFXWorldCommandBufferStatusMonitor **p_commandBufferStatusMonitor;
  id v6;
  VFXRenderer *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;

  p_commandBufferStatusMonitor = &self->_commandBufferStatusMonitor;
  if (objc_loadWeak((id *)&self->_commandBufferStatusMonitor) != a3)
  {
    if (a3)
      v6 = a3;
    else
      v6 = 0;
    if (a3)
      v7 = self;
    else
      v7 = 0;
    objc_storeWeak((id *)p_commandBufferStatusMonitor, v6);
    objc_msgSend_setCommandBufferStatusMonitor_(self->_renderContext, v8, (uint64_t)v7, v9);
    v13 = (void *)objc_msgSend__renderContextMetal(self->_preloadRenderer, v10, v11, v12);
    objc_msgSend_setCommandBufferStatusMonitor_(v13, v14, (uint64_t)v7, v15);
  }
}

- (void)renderContext:(id)a3 commandBufferDidCompleteWithError:(id)a4
{
  void *privateRendererOwner;
  id Weak;

  privateRendererOwner = self;
  if ((*((_BYTE *)self + 121) & 8) != 0)
    privateRendererOwner = self->_privateRendererOwner;
  Weak = objc_loadWeak((id *)&self->_commandBufferStatusMonitor);
  MEMORY[0x1E0DE7D20](Weak, sel_renderer_commandBufferDidCompleteWithError_, privateRendererOwner, a4);
}

- (double)nextFrameTime
{
  return self->_nextFrameTime;
}

- (BOOL)_needsRepetitiveRedraw
{
  _BOOL4 v2;

  if (self->_isAnimating)
    LOBYTE(v2) = 1;
  else
    return (*((unsigned __int8 *)self + 121) >> 2) & 1;
  return v2;
}

- (void)updateAtTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  double time;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double lastWorldTime;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  double deltaTime;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t isPaused;
  double v76;
  double v78;
  const char *v79;
  uint64_t v80;
  os_signpost_id_t v81;
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
  CFTimeInterval *v96;
  double v97;
  NSObject *v98;
  const char *v99;
  uint64_t v100;
  NSObject *v101;
  void *privateRendererOwner;
  NSObject *v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  NSObject *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  NSObject *v130;
  NSObject *v131;
  NSObject *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  double v139;
  NSObject *v140;
  const char *v141;
  uint64_t v142;
  NSObject *v143;
  void *v144;
  NSObject *v145;
  NSObject *v146;
  double v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  double v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  double v169;
  id *v170;
  const char *v171;
  uint64_t v172;
  void *IfNeeded;
  NSObject *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  NSObject *v178;
  NSObject *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  NSObject *v183;
  double v184;
  NSObject *v185;
  const char *v186;
  uint64_t v187;
  NSObject *v188;
  void *v189;
  NSObject *v190;
  NSObject *v191;
  double v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  NSObject *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  NSObject *v212;
  NSObject *v213;
  NSObject *v214;
  double v215;
  NSObject *v216;
  const char *v217;
  uint64_t v218;
  NSObject *v219;
  void *v220;
  NSObject *v221;
  NSObject *v222;
  double v223;
  NSObject *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  unint64_t v228;
  NSObject *v229;
  uint64_t *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  const void *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  NSObject *v250;
  NSObject *v251;
  NSObject *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  NSObject *v260;
  NSObject *v261;
  NSObject *v262;
  const char *v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  void *context;
  void *contexta;
  uint8_t buf[16];

  objc_msgSend_lock(self, a2, v3, v4);
  prof_beginFlame((uint64_t)"-[VFXRenderer updateAtTime:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2144);
  v10 = (void *)objc_msgSend_world(self, v7, v8, v9);
  v17 = (id *)objc_msgSend_worldRef(v10, v11, v12, v13);
  if (v17)
  {
    time = self->_time;
    v19 = (void *)objc_msgSend_world(self, v14, v15, v16);
    v23 = (void *)objc_msgSend_clock(v19, v20, v21, v22);
    objc_msgSend_updateWithAbsoluteTime_(v23, v24, v25, v26, a3);
    v30 = (void *)objc_msgSend_world(self, v27, v28, v29);
    v34 = (void *)objc_msgSend_clock(v30, v31, v32, v33);
    objc_msgSend_time(v34, v35, v36, v37);
    v46 = v45;
    lastWorldTime = self->_lastWorldTime;
    if (lastWorldTime == -1.0)
      v48 = 0.0166666667;
    else
      v48 = v46 - lastWorldTime;
    self->_deltaTime = v48;
    sub_1B187973C((uint64_t)v17, v38, v39, v40, v41, v42, v43, v44);
    v56 = sub_1B187AA20((uint64_t)v17, v49, v50, v51, v52, v53, v54, v55);
    v57 = v56;
    if (v56)
    {
      v58 = (void *)sub_1B181FEE0(v56);
      objc_msgSend_beginTransaction_(v58, v59, (uint64_t)self->_engineContext, v60);
    }
    else
    {
      v58 = 0;
    }
    if (self->_deltaTime < 0.0)
      self->_deltaTime = 0.0166666667;
    self->_time = a3;
    self->_lastWorldTime = v46;
    sub_1B18157F8((uint64_t)self->_engineContext, time);
    sub_1B1815808((uint64_t)self->_engineContext, v46);
    sub_1B18157F0((uint64_t)self->_engineContext, self->_deltaTime);
    deltaTime = self->_deltaTime;
    v65 = (void *)objc_msgSend_world(self, v62, v63, v64);
    v69 = (void *)objc_msgSend_clock(v65, v66, v67, v68);
    isPaused = objc_msgSend_isPaused(v69, v70, v71, v72);
    v76 = 0.0;
    if (deltaTime >= 0.0)
      v76 = deltaTime;
    if (v76 <= 1.0 || self->_privateRendererOwner == 0)
      v78 = v76;
    else
      v78 = 0.0166666667;
    self->_isAnimating = 0;
    objc_msgSend_setImmediateMode_(VFXTransaction, v73, 1, v74);
    objc_msgSend_setImmediateModeRestrictedContext_(VFXTransaction, v79, (uint64_t)v17, v80);
    v81 = sub_1B18137DC((uint64_t)self->_engineContext);
    context = (void *)MEMORY[0x1B5E23520]();
    v96 = (CFTimeInterval *)sub_1B1813794((uint64_t)self->_engineContext, v82, v83, v84, v85, v86, v87, v88);
    if ((*(_WORD *)&self->_delegationConformance & 1) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 1) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 1) != 0)
    {
      v97 = CACurrentMediaTime();
      prof_beginFlame((uint64_t)"updateAtTime delegate", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2229);
      v98 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v101 = v98;
        if (os_signpost_enabled(v98))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v101, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Delegate (update)", ", buf, 2u);
        }
      }
      if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 1) != 0)
        objc_msgSend__renderer_updateAtTime_(self->_privateRendererOwner, v99, (uint64_t)self->_privateRendererOwner, v100, time, context);
      if ((*(_WORD *)&self->_selfDelegationConformance & 1) != 0)
        objc_msgSend__renderer_updateAtTime_(self, v99, (uint64_t)self, v100, time);
      if ((*(_WORD *)&self->_delegationConformance & 1) != 0)
      {
        privateRendererOwner = self;
        if ((*((_BYTE *)self + 121) & 8) != 0)
          privateRendererOwner = self->_privateRendererOwner;
        objc_msgSend_renderer_updateAtTime_(self->_delegate, v99, (uint64_t)privateRendererOwner, v100, time, context);
      }
      v103 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v104 = v103;
        if (os_signpost_enabled(v103))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v104, OS_SIGNPOST_INTERVAL_END, v81, "Delegate (update)", ", buf, 2u);
        }
      }
      v96[21] = CACurrentMediaTime() - v97 + v96[21];
      prof_endFlame();
    }
    v105 = sub_1B187B058((uint64_t)v17, v89, v90, v91, v92, v93, v94, v95);
    sub_1B19C5490(v105, v106, v107, v108, v109, v110, v111, v112);
    v113 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"Animations", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2252);
    v121 = sub_1B187A97C((uint64_t)v17, v114, v115, v116, v117, v118, v119, v120);
    if (v121 && !self->_cameraIsManipulated)
    {
      v122 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v130 = v122;
        if (os_signpost_enabled(v122))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v130, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Animations", ", buf, 2u);
        }
      }
      sub_1B17F2658(v121, v46, time, v123, v124, v125, v126, v127, v128, v129);
      v131 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v132 = v131;
        if (os_signpost_enabled(v131))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v132, OS_SIGNPOST_INTERVAL_END, v81, "Animations", ", buf, 2u);
        }
      }
      sub_1B17F43D0(v121);
      self->_isAnimating = sub_1B17F3028(v121, isPaused, v133, v134, v135, v136, v137, v138);
    }
    v96[16] = CACurrentMediaTime() - v113 + v96[16];
    prof_endFlame();
    if ((*(_WORD *)&self->_delegationConformance & 2) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 2) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 2) != 0)
    {
      v139 = CACurrentMediaTime();
      prof_beginFlame((uint64_t)"didApply Animations", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2266);
      v140 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v143 = v140;
        if (os_signpost_enabled(v140))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v143, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Delegate (didApplyAnimation)", ", buf, 2u);
        }
      }
      if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 2) != 0)
        objc_msgSend__renderer_didApplyAnimationsAtTime_(self->_privateRendererOwner, v141, (uint64_t)self->_privateRendererOwner, v142, time);
      if ((*(_WORD *)&self->_selfDelegationConformance & 2) != 0)
        objc_msgSend__renderer_didApplyAnimationsAtTime_(self, v141, (uint64_t)self, v142, time);
      if ((*(_WORD *)&self->_delegationConformance & 2) != 0)
      {
        v144 = self;
        if ((*((_BYTE *)self + 121) & 8) != 0)
          v144 = self->_privateRendererOwner;
        objc_msgSend_renderer_didApplyAnimationsAtTime_(self->_delegate, v141, (uint64_t)v144, v142, time, context);
      }
      v145 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v146 = v145;
        if (os_signpost_enabled(v145))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v146, OS_SIGNPOST_INTERVAL_END, v81, "Delegate (didApplyAnimation)", ", buf, 2u);
        }
      }
      v96[21] = CACurrentMediaTime() - v139 + v96[21];
      prof_endFlame();
    }
    v147 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"Authoring", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2284);
    v150 = sub_1B187BE28((uint64_t)v17, 0, v148, v149);
    if (v150)
      sub_1B17DD620(v150, (uint64_t)self, v151, v152);
    v96[20] = CACurrentMediaTime() - v147 + v96[20];
    prof_endFlame();
    v153 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"VFXCore sync", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2293);
    v161 = sub_1B187B140((uint64_t)v17, v154, v155, v156, v157, v158, v159, v160);
    sub_1B1821904(v161, v162, v163, v164, v165, v166, v167, v168);
    v96[12] = CACurrentMediaTime() - v153 + v96[12];
    prof_endFlame();
    v169 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"Physics", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2299);
    v170 = sub_1B193E758(v17);
    IfNeeded = (void *)objc_msgSend__physicsWorldCreateIfNeeded_(v170, v171, 0, v172);
    if (IfNeeded)
    {
      v174 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v178 = v174;
        if (os_signpost_enabled(v174))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v178, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Physics", ", buf, 2u);
        }
      }
      objc_msgSend__step_(IfNeeded, v175, v176, v177, v78, context);
      v179 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v183 = v179;
        if (os_signpost_enabled(v179))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v183, OS_SIGNPOST_INTERVAL_END, v81, "Physics", ", buf, 2u);
        }
      }
      if ((isPaused & 1) == 0 && !self->_isAnimating)
        self->_isAnimating = objc_msgSend__needsRedraw(IfNeeded, v180, v181, v182);
    }
    v96[14] = CACurrentMediaTime() - v169 + v96[14];
    prof_endFlame();
    if ((*(_WORD *)&self->_delegationConformance & 4) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 4) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 4) != 0)
    {
      v184 = CACurrentMediaTime();
      prof_beginFlame((uint64_t)"didSimulate Physics", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2313);
      v185 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v188 = v185;
        if (os_signpost_enabled(v185))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v188, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Delegate (didUpdatePhysics)", ", buf, 2u);
        }
      }
      if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 4) != 0)
        objc_msgSend__renderer_didSimulatePhysicsAtTime_(self->_privateRendererOwner, v186, (uint64_t)self->_privateRendererOwner, v187, time);
      if ((*(_WORD *)&self->_selfDelegationConformance & 4) != 0)
        objc_msgSend__renderer_didSimulatePhysicsAtTime_(self, v186, (uint64_t)self, v187, time);
      if ((*(_WORD *)&self->_delegationConformance & 4) != 0)
      {
        v189 = self;
        if ((*((_BYTE *)self + 121) & 8) != 0)
          v189 = self->_privateRendererOwner;
        objc_msgSend_renderer_didSimulatePhysicsAtTime_(self->_delegate, v186, (uint64_t)v189, v187, time, context);
      }
      v190 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v191 = v190;
        if (os_signpost_enabled(v190))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v191, OS_SIGNPOST_INTERVAL_END, v81, "Delegate (didUpdatePhysics)", ", buf, 2u);
        }
      }
      v96[21] = CACurrentMediaTime() - v184 + v96[21];
      prof_endFlame();
    }
    v192 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"Constraints", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2332);
    v203 = sub_1B18799E8((uint64_t)v17, v193, v194, v195, v196, v197, v198, v199);
    if (v203)
    {
      *(_QWORD *)(v203 + 32) = objc_msgSend__engineContext(self, v200, v201, v202);
      v204 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v212 = v204;
        if (os_signpost_enabled(v204))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v212, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Constraints", ", buf, 2u);
        }
      }
      sub_1B19C10AC(v203, v205, v206, v207, v208, v209, v210, v211);
      v213 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v214 = v213;
        if (os_signpost_enabled(v213))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v214, OS_SIGNPOST_INTERVAL_END, v81, "Constraints", ", buf, 2u);
        }
      }
    }
    v96[13] = CACurrentMediaTime() - v192 + v96[13];
    prof_endFlame();
    if ((*(_WORD *)&self->_delegationConformance & 8) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 8) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 8) != 0)
    {
      v215 = CACurrentMediaTime();
      prof_beginFlame((uint64_t)"didApply constraints", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2344);
      v216 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v219 = v216;
        if (os_signpost_enabled(v216))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v219, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Delegate (didApplyConstraints)", ", buf, 2u);
        }
      }
      if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 8) != 0)
        objc_msgSend__renderer_didApplyConstraintsAtTime_(self->_privateRendererOwner, v217, (uint64_t)self->_privateRendererOwner, v218, time);
      if ((*(_WORD *)&self->_selfDelegationConformance & 8) != 0)
        objc_msgSend__renderer_didApplyConstraintsAtTime_(self, v217, (uint64_t)self, v218, time);
      if ((*(_WORD *)&self->_delegationConformance & 8) != 0)
      {
        v220 = self;
        if ((*((_BYTE *)self + 121) & 8) != 0)
          v220 = self->_privateRendererOwner;
        objc_msgSend_renderer_didApplyConstraintsAtTime_(self->_delegate, v217, (uint64_t)v220, v218, time, context);
      }
      v221 = sub_1B17C439C();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v222 = v221;
        if (os_signpost_enabled(v221))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v222, OS_SIGNPOST_INTERVAL_END, v81, "Delegate (didApplyConstraints)", ", buf, 2u);
        }
      }
      v96[21] = CACurrentMediaTime() - v215 + v96[21];
      prof_endFlame();
    }
    v223 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"VFXCore", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2364);
    v224 = sub_1B17C439C();
    v228 = v81 - 1;
    if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v229 = v224;
      if (os_signpost_enabled(v224))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B178D000, v229, OS_SIGNPOST_INTERVAL_BEGIN, v81, "VFXCore", ", buf, 2u);
      }
    }
    if (v57)
    {
      v230 = (uint64_t *)objc_msgSend__engineContext(self, v225, v226, v227);
      v234 = (const void *)sub_1B1816084((uint64_t)v230);
      if (!v234)
      {
        v234 = (const void *)sub_1B18D2804(v57);
        sub_1B181410C((uint64_t)v230, v234);
        CFRelease(v234);
      }
      v235 = objc_msgSend_additiveWritesToAlpha(self, v231, v232, v233, context);
      sub_1B18D3380((uint64_t)v234, v235, v236, v237);
      v241 = objc_msgSend_debugUIOptions(self, v238, v239, v240);
      sub_1B18D2CB8((uint64_t)v234, v241, v242, v243);
      sub_1B18D2CC4((uint64_t)v234, v230, v244, v245, v246, v247, v248, v249, v46, v78, (uint64_t)contexta);
    }
    v250 = sub_1B17C439C();
    if (v228 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v251 = v250;
      if (os_signpost_enabled(v250))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B178D000, v251, OS_SIGNPOST_INTERVAL_END, v81, "VFXCore", ", buf, 2u);
      }
    }
    v96[12] = CACurrentMediaTime() - v223 + v96[12];
    prof_endFlame();
    v252 = sub_1B17C439C();
    if (v228 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v260 = v252;
      if (os_signpost_enabled(v252))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B178D000, v260, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Audio", ", buf, 2u);
      }
    }
    sub_1B1949764((unint64_t)self->_engineContext, v253, v254, v255, v256, v257, v258, v259);
    v261 = sub_1B17C439C();
    if (v228 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v262 = v261;
      if (os_signpost_enabled(v261))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B178D000, v262, OS_SIGNPOST_INTERVAL_END, v81, "Audio", ", buf, 2u);
      }
    }
    objc_autoreleasePoolPop(context);
    objc_msgSend_setImmediateModeRestrictedContext_(VFXTransaction, v263, 0, v264);
    objc_msgSend_setImmediateMode_(VFXTransaction, v265, 0, v266);
    objc_msgSend_endTransaction(v58, v267, v268, v269);
    sub_1B18797B4((uint64_t)v17, v270, v271, v272, v273, v274, v275, v276);
    objc_msgSend_unlock(self, v277, v278, v279);
  }
  else
  {
    objc_msgSend_unlock(self, v14, v15, v16);
  }
  prof_endFlame();
}

- (void)drawStatisticsIfNeeded
{
  int v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  int *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double Current;
  double statisticsTimeStamp;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double __src[107];

  v3 = sub_1B18B7680();
  if (self->_showStatistics || v3 != 0)
  {
    v8 = v3;
    v9 = (int *)objc_msgSend_stats(self->_renderContext, v4, v5, v6);
    v13 = objc_msgSend_resourceManager(self->_renderContext, v10, v11, v12);
    v14 = sub_1B18FD634(v13);
    sub_1B190CAC4((uint64_t)v9, v15, v16, v17, v18, v19, v20, v21);
    Current = CFAbsoluteTimeGetCurrent();
    statisticsTimeStamp = self->_statisticsTimeStamp;
    v27 = objc_msgSend__authoringEnvironment(self, v24, v25, v26);
    if (statisticsTimeStamp <= Current)
    {
      v28 = v27;
      sub_1B190C7B4(v9, v14, (uint64_t)__src);
      sub_1B190CA58((uint64_t)v9, v29, v30, v31, v32, v33, v34, v35);
      if (self->_showStatistics)
        sub_1B17FEB18(v28, __src, v14);
      if (v8)
        sub_1B18B77D8((uint64_t)__src);
      self->_statisticsTimeStamp = Current + 1.0;
    }
  }
}

- (void)startManipulatingPointOfView
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;

  objc_msgSend_lock(self, a2, v2, v3);
  v8 = (void *)objc_msgSend_pointOfView(self, v5, v6, v7);
  v12 = (void *)objc_msgSend_presentationNode(v8, v9, v10, v11);
  objc_msgSend_transform(v12, v13, v14, v15);
  objc_msgSend_setTransform_(v8, v16, v17, v18);
  v22 = (void *)objc_msgSend_camera(v8, v19, v20, v21);
  v26 = (void *)objc_msgSend_presentationCamera(v22, v23, v24, v25);
  objc_msgSend_focalLength(v26, v27, v28, v29);
  v31 = v30;
  v35 = (void *)objc_msgSend_camera(v8, v32, v33, v34);
  LODWORD(v36) = v31;
  objc_msgSend_setFocalLength_(v35, v37, v38, v39, v36);
  self->_cameraIsManipulated = 1;
  objc_msgSend_unlock(self, v40, v41, v42);
}

- (void)stopManipulatingPointOfView
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_lock(self, a2, v2, v3);
  self->_cameraIsManipulated = 0;
  objc_msgSend_unlock(self, v5, v6, v7);
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  if (self->_framebufferInfo.drawableSize.width == 0.0)
    return (id)MEMORY[0x1E0C9AA60];
  else
    return (id)((uint64_t (*)(VFXRenderer *, char *, id))MEMORY[0x1E0DE7D20])(self, sel__hitTest_viewport_options_, a4);
}

- (id)hitTestWithSegmentFromPoint:(VFXRenderer *)self toPoint:(SEL)a2 options:(id)a3
{
  uint64_t v3;
  double v4;
  double v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v15;
  double v16;

  v15 = v4;
  v16 = v5;
  v7 = (void *)objc_msgSend_world(self, a2, (uint64_t)a3, v3);
  v11 = (void *)objc_msgSend_rootNode(v7, v8, v9, v10);
  return (id)objc_msgSend_hitTestWithSegmentFromPoint_toPoint_options_(v11, v12, (uint64_t)a3, v13, v15, v16);
}

- (id)_hitTest:(CGPoint)a3 viewport:(CGSize)a4 options:(id)a5
{
  uint64_t v5;
  id v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  __n128 *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __n128 *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const void *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  float64x2_t v56;
  float64x2_t v57;
  uint64_t v58;
  const void *v59;
  void *v60;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat width;

  v6 = a5;
  height = a4.height;
  width = a4.width;
  x = a3.x;
  y = a3.y;
  v8 = (void *)objc_msgSend_world(self, a2, (uint64_t)a5, v5);
  v12 = (const void *)objc_msgSend_worldRef(v8, v9, v10, v11);
  if (v12 && (v13 = (__n128 *)CFRetain(v12)) != 0)
  {
    v21 = v13;
    sub_1B187973C((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
    v25 = (uint64_t *)objc_msgSend__engineContext(self, v22, v23, v24);
    if (!v25)
      goto LABEL_13;
    v33 = (uint64_t)v25;
    v34 = sub_1B1814768(v25, (uint64_t)v26, v27, v28, v29, v30, v31, v32);
    if (!v34)
      goto LABEL_13;
    v35 = (uint64_t)v34;
    if (v6)
    {
      if (!objc_msgSend_objectForKey_(v6, v26, (uint64_t)CFSTR("kHitTestRootNode"), v28)
        || (v37 = (void *)objc_msgSend_objectForKey_(v6, v36, (uint64_t)CFSTR("kHitTestRootNode"), v28),
            v41 = objc_msgSend_nodeRef(v37, v38, v39, v40),
            v6 = (id)objc_msgSend_mutableCopy(v6, v42, v43, v44),
            objc_msgSend_setObject_forKey_(v6, v45, v41, (uint64_t)CFSTR("kHitTestRootNode")),
            v6))
      {
        if (objc_msgSend_objectForKey_(v6, v36, (uint64_t)CFSTR("kHitTestShowDebugInfo"), v28))
        {
          v6 = (id)objc_msgSend_mutableCopy(v6, v46, v47, v28);
          v54 = sub_1B1814484(v33, 0, v48, v49, v50, v51, v52, v53);
          objc_msgSend_setObject_forKey_(v6, v55, v54, (uint64_t)CFSTR("auth"));
        }
      }
    }
    v56.f64[0] = width;
    v57.f64[0] = x;
    v57.f64[1] = y;
    v56.f64[1] = height;
    v58 = sub_1B17AD8C0(v21, v35, (const __CFDictionary *)v6, v28, v29, v30, v31, v32, COERCE_DOUBLE(vcvt_f32_f64(v57)), (__n128)vcvt_hight_f32_f64(0, v56));
    if (v58)
    {
      v59 = (const void *)v58;
      v60 = (void *)objc_msgSend_hitTestResultsFromHitTestResultRef_(VFXHitTestResult, v26, v58, v28);
      CFRelease(v59);
    }
    else
    {
LABEL_13:
      v60 = 0;
    }
    sub_1B18797B4((uint64_t)v21, (uint64_t)v26, v27, v28, v29, v30, v31, v32);
    CFRelease(v21);
  }
  else
  {
    v60 = 0;
  }
  if (v60)
    return v60;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)_isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4 viewport:
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float32x4_t *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  float32x4_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  const char *v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  uint64_t i;
  unint64_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  int8x16_t v44;
  float32x4_t v45;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  _OWORD v51[6];
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  int32x4_t v55;
  _OWORD v56[6];

  if ((a4 || (a4 = (id)objc_msgSend_pointOfView(self, a2, (uint64_t)a3, 0)) != 0)
    && objc_msgSend_getFrustum_withViewport_(a4, a2, (uint64_t)v56, (uint64_t)a4))
  {
    if (objc_msgSend_isPresentationObject(a3, v5, v6, v7))
    {
      v11 = objc_msgSend_nodeRef(a3, v8, v9, v10);
      v19 = (float32x4_t *)sub_1B1869AC8(v11, v12, v13, v14, v15, v16, v17, v18);
      v47 = v19[1];
      v48 = *v19;
      v49 = v19[2];
      v50 = v19[3];
      v23 = (float32x4_t *)objc_msgSend_nodeRef(a3, v20, v21, v22);
      sub_1B18699E8(v23, 1, &v54, v24, v25, v26, v27, v28);
    }
    else
    {
      objc_msgSend_worldTransform(a3, v8, v9, v10);
      v47 = v31;
      v48 = v30;
      v49 = v32;
      v50 = v33;
      v53.i32[2] = 0;
      v53.i64[0] = 0;
      v52.i32[2] = 0;
      v52.i64[0] = 0;
      objc_msgSend_getBoundingBoxMin_max_(a3, v34, (uint64_t)&v53, (uint64_t)&v52);
      v35 = v53;
      v36 = v52;
      v35.i32[3] = 1.0;
      v36.i32[3] = 1.0;
      v37.i64[0] = 0x3F0000003F000000;
      v37.i64[1] = 0x3F0000003F000000;
      v54 = vmulq_f32(vaddq_f32(v35, v36), v37);
      v55 = (int32x4_t)vmulq_f32(vsubq_f32(v36, v35), v37);
    }
    for (i = 0; i != 6; ++i)
      v56[i] = vnegq_f32((float32x4_t)v56[i]);
    v39 = 0;
    v29 = 0;
    v51[2] = v56[2];
    v51[3] = v56[3];
    v51[4] = v56[4];
    v51[5] = v56[5];
    v40 = vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32(v50, v49, v54, 2), v47, *(float32x2_t *)v54.f32, 1), v48, v54.f32[0]);
    v40.i32[3] = v54.i32[3];
    v51[0] = v56[0];
    v51[1] = v56[1];
    v41 = (float32x4_t)v55;
    v41.i32[1] = v55.i32[0];
    v41.i32[2] = v55.i32[0];
    v42 = vmlaq_f32(vmlaq_f32(vmulq_f32((float32x4_t)vuzp2q_s32(vdupq_lane_s32(*(int32x2_t *)v55.i8, 1), v55), vabsq_f32(v47)), v41, vabsq_f32(v48)), (float32x4_t)vzip2q_s32(vtrn1q_s32(v55, v55), v55), vabsq_f32(v49));
    do
    {
      v43 = (float32x4_t)v51[v39];
      v44 = (int8x16_t)vmulq_f32(v40, v43);
      v45 = vmulq_f32(v42, vabsq_f32(v43));
      if (vaddv_f32(vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL))) > vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v45, 2), vaddq_f32(v45, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v45.f32, 1))).f32[0])
        break;
      v29 = v39++ > 4;
    }
    while (v39 != 6);
  }
  else
  {
    return 0;
  }
  return v29;
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  if (self->_framebufferInfo.drawableSize.width == 0.0)
    return 0;
  else
    return MEMORY[0x1E0DE7D20](self, sel__isNodeInsideFrustum_withPointOfView_viewport_, a3, a4);
}

- (id)_nodesInsideFrustumWithPointOfView:(id)a3 viewport:
{
  uint64_t v3;
  void *v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  _BYTE v51[96];

  v4 = a3;
  v9 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, (uint64_t)a3, v3);
  if ((v4 || (v4 = (void *)objc_msgSend_pointOfView(self, v6, v7, v8)) != 0)
    && objc_msgSend_world(self, v6, v7, v8)
    && objc_msgSend_getFrustum_withViewport_(v4, v10, (uint64_t)v51, v11, 0.0))
  {
    v15 = objc_msgSend_worldRef(self->_world, v12, v13, v14);
    sub_1B187973C(v15, v16, v17, v18, v19, v20, v21, v22);
    v30 = sub_1B187B260(v15, v23, v24, v25, v26, v27, v28, v29);
    v50 = 0;
    v48 = 0u;
    v49 = 0u;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = sub_1B18B4EA8;
    v47[3] = &unk_1E63D84D8;
    v47[4] = v9;
    v31 = sub_1B197CAD0((uint64_t)v47, (uint64_t)&v48);
    v35 = (void *)objc_msgSend_camera(v4, v32, v33, v34, v31);
    v48 = (unint64_t)objc_msgSend_categoryBitMask(v35, v36, v37, v38);
    DWORD1(v49) = 2;
    sub_1B197D404(v30, (uint64_t)v51);
    sub_1B18797B4(v15, v39, v40, v41, v42, v43, v44, v45);
  }
  return v9;
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  if (self->_framebufferInfo.drawableSize.width == 0.0)
    return (id)MEMORY[0x1E0C9AA60];
  else
    return (id)((uint64_t (*)(VFXRenderer *, char *, id))MEMORY[0x1E0DE7D20])(self, sel__nodesInsideFrustumWithPointOfView_viewport_, a3);
}

- (void)setRendersContinuously:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 121) = *((_BYTE *)self + 121) & 0xFB | v3;
}

- (BOOL)isJitteringEnabled
{
  return (*((unsigned __int8 *)self + 248) >> 1) & 1;
}

- (void)setJitteringEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xFD | v3;
}

- (BOOL)hasImGuiFrameStarted
{
  return (*((unsigned __int8 *)self + 248) >> 4) & 1;
}

- (BOOL)jitteringEnabled
{
  return (*((unsigned __int8 *)self + 248) >> 1) & 1;
}

- (BOOL)vertexAmplificationEnabled
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self, sel_isVertexAmplificationEnabled);
}

- (BOOL)isVertexAmplificationEnabled
{
  return sub_1B1814F00((uint64_t)self->_engineContext);
}

- (BOOL)forceAsyncShaderCompilation
{
  return ((uint64_t (*)(VFXMTLRenderContext *, char *))MEMORY[0x1E0DE7D20])(self->_renderContext, sel_forceAsyncShaderCompilation);
}

- (void)setForceAsyncShaderCompilation:(BOOL)a3
{
  ((void (*)(VFXMTLRenderContext *, char *, BOOL))MEMORY[0x1E0DE7D20])(self->_renderContext, sel_setForceAsyncShaderCompilation_, a3);
}

- (void)setVertexAmplificationEnabled:(BOOL)a3
{
  sub_1B1814F7C((uint64_t)self->_engineContext, a3);
}

- (BOOL)isTemporalAntialiasingEnabled
{
  return (*((unsigned __int8 *)self + 248) >> 2) & 1;
}

- (void)setTemporalAntialiasingEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xFB | v3;
}

- (BOOL)temporalAntialiasingEnabled
{
  return (*((unsigned __int8 *)self + 248) >> 2) & 1;
}

- (BOOL)additiveWritesToAlpha
{
  uint64_t v2;
  uint64_t v3;
  BOOL v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  if (self->_legacyRenderer)
    return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self, sel__legacyAdditiveWritesToAlpha);
  objc_msgSend_lock(self, a2, v2, v3);
  v5 = *((_BYTE *)self + 248) & 1;
  objc_msgSend_unlock(self, v6, v7, v8);
  return v5;
}

- (void)setAdditiveWritesToAlpha:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  if (self->_legacyRenderer)
  {
    ((void (*)(VFXRenderer *, char *, BOOL))MEMORY[0x1E0DE7D20])(self, sel__setLegacyAdditiveWritesToAlpha_, a3);
  }
  else
  {
    objc_msgSend_lock(self, a2, a3, v3);
    *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xFE | a3;
    objc_msgSend_unlock(self, v6, v7, v8);
  }
}

- (BOOL)frozen
{
  return (*((unsigned __int8 *)self + 248) >> 3) & 1;
}

- (void)setFrozen:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  objc_msgSend_lock(self, a2, a3, v3);
  if (v4)
    v9 = 8;
  else
    v9 = 0;
  *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xF7 | v9;
  objc_msgSend_unlock(self, v6, v7, v8);
}

- (id)_copyPerformanceStatistics
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 v21[108];

  objc_msgSend_lock(self, a2, v2, v3);
  v8 = objc_msgSend__engineContext(self, v5, v6, v7);
  if (v8 && (v16 = sub_1B1813794(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15)) != 0)
  {
    sub_1B18B7724(v16, v21, 0);
    v19 = sub_1B18B7924(v21, 0, v17, v18);
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend_unlock(self, v9, v10, v11);
  return v19;
}

- (void)_displayLinkStatsTick
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = objc_msgSend__engineContext(self, a2, v2, v3);
  if (v4)
  {
    v12 = sub_1B1813794(v4, v5, v6, v7, v8, v9, v10, v11);
    if (v12)
      *(double *)(v12 + 184) = *(double *)(v12 + 184) + CACurrentMediaTime() - *(double *)(v12 + 208);
  }
}

- (void)_displayLinkStatsTack
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = objc_msgSend__engineContext(self, a2, v2, v3);
  if (v4)
  {
    v12 = sub_1B1813794(v4, v5, v6, v7, v8, v9, v10, v11);
    if (v12)
      *(CFTimeInterval *)(v12 + 208) = CACurrentMediaTime();
  }
}

- (void)setShowsStatistics:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    objc_msgSend_setupAuthoringEnvironment(self, a2, a3, v3);
  self->_showStatistics = a3;
}

- (BOOL)showsStatistics
{
  return self->_showStatistics;
}

- (BOOL)showsDebugUI
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t debugUIOptions;

  v5 = objc_msgSend__engineContext(self, a2, v2, v3);
  v13 = sub_1B1814C44(v5, v6, v7, v8, v9, v10, v11, v12);
  debugUIOptions = self->_debugUIOptions;
  if (v13 != 2)
    debugUIOptions &= ~0x20uLL;
  return debugUIOptions != 0;
}

- (void)_runningInExtension
{
  self->_isRunningInExtension = 1;
}

- (void)_presentFramebuffer
{
  uint64_t v2;
  uint64_t v3;

  if (self->_renderContext)
    objc_msgSend__endFrame(self, a2, v2, v3);
}

- (void)setRenderMode:(unint64_t)a3
{
  uint64_t v3;
  __CFXEngineContext *engineContext;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[6];

  engineContext = self->_engineContext;
  self->_renderMode = a3;
  v6 = (void *)objc_msgSend_world(self, a2, a3, v3);
  v10 = objc_msgSend_worldRef(v6, v7, v8, v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1B18B52F0;
  v12[3] = &unk_1E63D84F8;
  v12[4] = engineContext;
  v12[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, 0, v12);
}

- (unint64_t)renderMode
{
  return self->_renderMode;
}

- (void)setRendererKind:(unint64_t)a3
{
  uint64_t v3;
  __CFXEngineContext *engineContext;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[6];

  engineContext = self->_engineContext;
  self->_rendererKind = a3;
  v6 = (void *)objc_msgSend_world(self, a2, a3, v3);
  v10 = objc_msgSend_worldRef(v6, v7, v8, v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1B18B5390;
  v12[3] = &unk_1E63D84F8;
  v12[4] = engineContext;
  v12[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, 0, v12);
}

- (unint64_t)rendererKind
{
  return self->_rendererKind;
}

- (BOOL)isEmulatingStereo
{
  return self->_emulateStereo;
}

- (void)setEmulateStereo:(BOOL)a3
{
  uint64_t v3;
  __CFXEngineContext *engineContext;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[5];
  BOOL v13;

  engineContext = self->_engineContext;
  self->_emulateStereo = a3;
  v6 = (void *)objc_msgSend_world(self, a2, a3, v3);
  v10 = objc_msgSend_worldRef(v6, v7, v8, v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1B18B543C;
  v12[3] = &unk_1E63D8518;
  v12[4] = engineContext;
  v13 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, 0, v12);
}

- (void)setDebugOptions:(unint64_t)a3
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
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  if (self->_debugOptions != a3)
  {
    objc_msgSend_setupAuthoringEnvironment(self, a2, a3, v3);
    self->_debugOptions = a3;
    objc_msgSend_lock(self, v6, v7, v8);
    objc_msgSend_debugOptionsDidChange_(self->_authoringEnvironment, v9, a3, v10);
    sub_1B1814460((uint64_t)self->_engineContext, a3);
    v18 = (void *)sub_1B1813BC4((uint64_t)self->_engineContext, v11, v12, v13, v14, v15, v16, v17);
    objc_msgSend_setDebugOptions_(v18, v19, (a3 >> 3) & 4 | (a3 >> 5) & 2, v20);
    v24 = objc_msgSend__showsAuthoringEnvironment(self, v21, v22, v23);
    objc_msgSend_setShowsAuthoringEnvironment_(v18, v25, v24, v26);
    objc_msgSend_unlock(self, v27, v28, v29);
  }
}

- (unint64_t)debugOptions
{
  return self->_debugOptions;
}

- (unint64_t)debugUIOptions
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_lock(self, a2, v2, v3);
  v5 = sub_1B1807C54((uint64_t)self->_engineContext);
  objc_msgSend_unlock(self, v6, v7, v8);
  return v5;
}

- (void)setDebugUIOptions:(unint64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_lock(self, a2, a3, v3);
  self->_debugUIOptions = a3;
  sub_1B1814468((uint64_t)self->_engineContext, a3);
  objc_msgSend_unlock(self, v6, v7, v8);
}

- (BOOL)_enableARMode
{
  uint64_t v2;
  uint64_t v3;
  VFXMTLRenderContext *renderContext;

  renderContext = self->_renderContext;
  if (renderContext)
    LOBYTE(renderContext) = objc_msgSend_enableARMode(renderContext, a2, v2, v3);
  return (char)renderContext;
}

- (void)set_enableARMode:(BOOL)a3
{
  VFXMTLRenderContext *renderContext;

  renderContext = self->_renderContext;
  if (renderContext)
    ((void (*)(VFXMTLRenderContext *, char *, BOOL))MEMORY[0x1E0DE7D20])(renderContext, sel_setEnableARMode_, a3);
}

- (BOOL)_shouldDelegateARCompositing
{
  VFXMTLRenderContext *renderContext;

  renderContext = self->_renderContext;
  if (renderContext)
    LOBYTE(renderContext) = ((uint64_t (*)(VFXMTLRenderContext *, char *))MEMORY[0x1E0DE7D20])(renderContext, sel_shouldDelegateARCompositing);
  return (char)renderContext;
}

- (void)set_shouldDelegateARCompositing:(BOOL)a3
{
  VFXMTLRenderContext *renderContext;

  renderContext = self->_renderContext;
  if (renderContext)
    ((void (*)(VFXMTLRenderContext *, char *, BOOL))MEMORY[0x1E0DE7D20])(renderContext, sel_setShouldDelegateARCompositing_, a3);
}

- (BOOL)_collectCompilationErrors
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = sub_1B1813BC4((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (self->_renderContext)
    return MEMORY[0x1E0DE7D20](v9, sel_collectsCompilationErrors, v10, v11);
  else
    return 0;
}

- (void)set_collectCompilationErrors:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;

  v8 = a3;
  v10 = sub_1B1813BC4((uint64_t)self->_engineContext, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
  if (self->_renderContext)
    MEMORY[0x1E0DE7D20](v10, sel_setCollectsCompilationErrors_, v8, v11);
}

- (id)_compilationErrors
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXRenderer *snapshotRenderer;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  snapshotRenderer = self->_snapshotRenderer;
  if (snapshotRenderer)
    return (id)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(snapshotRenderer, sel__compilationErrors);
  v10 = (void *)sub_1B1813BC4((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (self->_renderContext)
    return (id)objc_msgSend_compilationErrors(v10, v11, v12, v13);
  else
    return 0;
}

- (BOOL)_showsAuthoringEnvironment
{
  return self->_debugOptions != 0;
}

- (void)setupAuthoringEnvironment
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  void *IfNeeded;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  if (!self->_authoringEnvironment)
  {
    objc_msgSend_lock(self, a2, v2, v3);
    if (self->_privateRendererOwner)
      IfNeeded = (void *)objc_msgSend_authoringEnvironmentForWorldRenderer_createIfNeeded_(VFXAuthoringEnvironment, v5, (uint64_t)self->_privateRendererOwner, 1);
    else
      IfNeeded = (void *)objc_msgSend_authoringEnvironmentForWorldRenderer_createIfNeeded_(VFXAuthoringEnvironment, v5, (uint64_t)self, 1);
    self->_authoringEnvironment = (VFXAuthoringEnvironment *)IfNeeded;
    objc_msgSend_unlock(self, v7, v8, v9);
  }
}

- (id)_authoringEnvironment
{
  return self->_authoringEnvironment;
}

- (__n128)_viewport
{
  return a1[12];
}

- (CGRect)currentViewport
{
  uint64_t v2;
  uint64_t v3;
  __n128 *v4;
  float64x2_t v5;
  float64x2_t v6;
  __n128 v7;
  double v8;
  double v9;
  float64x2_t v10;
  float64x2_t v11;
  CGRect result;

  v10 = *(float64x2_t *)MEMORY[0x1E0C9D648];
  v11 = *(float64x2_t *)(MEMORY[0x1E0C9D648] + 16);
  v4 = (__n128 *)objc_msgSend__engineContext(self, a2, v2, v3);
  v5 = v10;
  v6 = v11;
  if (v4)
  {
    v7 = sub_1B1815A98(v4);
    v6 = vcvt_hight_f64_f32((float32x4_t)v7);
    v5 = vcvtq_f64_f32((float32x2_t)v7.n128_u64[0]);
  }
  v8 = v5.f64[1];
  v9 = v6.f64[1];
  result.size.width = v6.f64[0];
  result.origin.x = v5.f64[0];
  result.size.height = v9;
  result.origin.y = v8;
  return result;
}

- (CGRect)viewport
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  ((void (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self, sel_currentViewport);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)set_viewport:(VFXRenderer *)self
{
  uint64_t v2;
  uint64_t v3;
  __n128 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __n128 *v13;
  __n128 v14;

  v14 = v4;
  objc_msgSend_lock(self, a2, v2, v3);
  *(__n128 *)self->__viewport = v14;
  v9 = objc_msgSend__engineContext(self, v6, v7, v8);
  if (v9)
  {
    v13 = (__n128 *)v9;
    sub_1B1815AB0(v9, *(double *)vextq_s8((int8x16_t)v14, (int8x16_t)v14, 8uLL).i64);
    sub_1B1815AA0(v13, v14);
  }
  objc_msgSend_unlock(self, v10, v11, v12);
}

- (__n128)_drawableSafeAreaInsets
{
  return a1[14];
}

- (void)set_drawableSafeAreaInsets:(VFXRenderer *)self
{
  uint64_t v2;
  uint64_t v3;
  __n128 v4;
  __n128 *v5;
  __n128 v6;

  v6 = v4;
  *(__n128 *)self->__drawableSafeAreaInsets = v4;
  v5 = (__n128 *)objc_msgSend__engineContext(self, a2, v2, v3);
  if (v5)
    sub_1B1815AD0(v5, v6);
}

- (AVAudioEngine)audioEngine
{
  uint64_t v2;
  uint64_t v3;

  return (AVAudioEngine *)sub_1B19497C8(1, a2, v2, v3);
}

- (AVAudioEnvironmentNode)audioEnvironmentNode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return (AVAudioEnvironmentNode *)sub_1B1949864((unint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (VFXNode)audioListener
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id *v25;
  VFXNode *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id *v35;

  v9 = sub_1B1813884((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (v9)
  {
    v17 = v9;
    sub_1B187973C(v9, v10, v11, v12, v13, v14, v15, v16);
    v25 = (id *)sub_1B1949708((unint64_t)self->_engineContext, v18, v19, v20, v21, v22, v23, v24);
    v26 = (VFXNode *)sub_1B193E758(v25);
    sub_1B18797B4(v17, v27, v28, v29, v30, v31, v32, v33);
    return v26;
  }
  else
  {
    v35 = (id *)sub_1B1949708((unint64_t)self->_engineContext, v10, v11, v12, v13, v14, v15, v16);
    return (VFXNode *)sub_1B193E758(v35);
  }
}

- (void)setAudioListener:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  _QWORD v12[6];

  v10 = sub_1B1813884((uint64_t)self->_engineContext, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1B18B58D0;
  v12[3] = &unk_1E63D53C8;
  v12[4] = self;
  v12[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
}

- (id)MTLTexture
{
  return self->_offScreenFramebuffer;
}

- (void)_renderWorldWithEngineContext:(__CFXEngineContext *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  VFXMTLRenderContext *renderContext;
  uint64_t v65;
  char viewpointCoordinateSpace;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __n128 v74;
  const char *v75;
  uint64_t v76;
  double v77;
  NSArray *viewpoints;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _BOOL4 v105;
  unsigned int v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  unsigned int v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unsigned int v118;
  _BOOL4 v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const void *v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  _BOOL4 v140;
  char v141;
  char v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  char v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  unsigned int i;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  float64x2_t v159;
  float64x2_t v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  double v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  float64x2_t v194;
  float64x2_t v195;
  __int128 v196;
  uint64_t v197[3];
  __int128 v198;
  __int128 v199;

  if (!a3)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), 0, v3, v4, v5, v6, v7, (uint64_t)"engineContext");
  sub_1B18142BC((uint64_t)a3);
  v17 = sub_1B1813884((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);
  if (v17)
  {
    v24 = v17;
    v25 = (_DWORD *)sub_1B1814484((uint64_t)a3, 0, v18, v19, v20, v21, v22, v23);
    if (v25)
      sub_1B17F93E0(v25);
    v33 = sub_1B1813794((uint64_t)a3, v26, v27, v28, v29, v30, v31, v32);
    v34 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"Apply notification queue", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 3170);
    v49 = sub_1B187B140(v24, v35, v36, v37, v38, v39, v40, v41);
    if (!v49)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v43, v44, v45, v46, v47, v48, (uint64_t)"enginePipeline");
    v199 = 0u;
    v198 = 0u;
    v197[0] = v49;
    v197[1] = (uint64_t)a3;
    v197[2] = 0;
    sub_1B182091C(v197, v42, v43, v44, v45, v46, v47, v48);
    *(double *)(v33 + 152) = *(double *)(v33 + 152) + CACurrentMediaTime() - v34;
    prof_endFlame();
    sub_1B181381C((uint64_t)a3, v50, v51, v52, v53, v54, v55, v56);
    renderContext = self->_renderContext;
    if (renderContext)
    {
      v65 = objc_msgSend_resourceManager(renderContext, v57, v58, v59);
      nullsub_16(v65);
    }
    sub_1B1813628((uint64_t)a3, v49, v58, v59, v60, v61, v62, v63);
    if (self->_viewpoints)
      viewpointCoordinateSpace = self->_viewpointCoordinateSpace;
    else
      viewpointCoordinateSpace = 2;
    sub_1B1815C78((uint64_t)a3, viewpointCoordinateSpace);
    *(_QWORD *)&v77 = sub_1B1815014((uint64_t)self->_engineContext, v67, v68, v69, v70, v71, v72, v73, v74).n128_u64[0];
    viewpoints = self->_viewpoints;
    if (viewpoints)
    {
      v79 = (void *)objc_msgSend_objectAtIndexedSubscript_(viewpoints, v75, 0, v76, v77);
      v83 = (void *)objc_msgSend_passDescriptor(v79, v80, v81, v82);
      v87 = (void *)objc_msgSend_colorAttachments(v83, v84, v85, v86);
      v90 = (void *)objc_msgSend_objectAtIndexedSubscript_(v87, v88, 0, v89);
      v94 = (void *)objc_msgSend_texture(v90, v91, v92, v93);
      v98 = objc_msgSend_textureType(v94, v95, v96, v97);
      v102 = v98;
      v105 = v98 == 5 || v98 == 3 || v98 == 8;
      v106 = v105 & (objc_msgSend_features(self->_renderContext, v99, v100, v101) >> 5);
      v110 = (v102 == 2) & (objc_msgSend_features(self->_renderContext, v107, v108, v109) >> 7);
      v116 = objc_msgSend_count(self->_viewpoints, v111, v112, v113);
      if (v116)
      {
        v117 = 0;
        v118 = 0;
        LOBYTE(v119) = 1;
        do
        {
          v120 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_viewpoints, v114, v117, v115);
          v124 = (const void *)objc_msgSend_passDescriptor(v120, v121, v122, v123);
          sub_1B1815C24((uint64_t)a3, v124, v118);
          if (v119)
          {
            v125 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_viewpoints, v114, v117, v115);
            v129 = (void *)objc_msgSend_passDescriptor(v125, v126, v127, v128);
            v133 = (void *)objc_msgSend_colorAttachments(v129, v130, v131, v132);
            v136 = (void *)objc_msgSend_objectAtIndexedSubscript_(v133, v134, 0, v135);
            v119 = v94 == (void *)objc_msgSend_texture(v136, v137, v138, v139);
          }
          else
          {
            v119 = 0;
          }
          v117 = ++v118;
        }
        while (v116 > v118);
      }
      else
      {
        v119 = 1;
      }
      v140 = v116 > 1 && v119;
      if (v110)
        v141 = 2;
      else
        v141 = v106;
      if ((v140 & (v110 | v106)) != 0)
        v142 = v141;
      else
        v142 = 0;
      sub_1B1814F74((uint64_t)a3, v142);
      v146 = objc_msgSend_count(self->_viewpoints, v143, v144, v145);
      sub_1B1814F90((uint64_t)a3, v146);
      if (v116)
      {
        v149 = 0;
        for (i = 0; i < v116; v149 = i)
        {
          v151 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_viewpoints, v147, v149, v148);
          if (v151)
          {
            objc_msgSend_viewport(v151, v152, v153, v154);
            v159 = v194;
            v160 = v195;
          }
          else
          {
            v195 = 0u;
            v196 = 0u;
            v159 = 0uLL;
            v160 = 0uLL;
            v194 = 0u;
          }
          sub_1B18153D0((uint64_t)a3, i, v153, v154, v155, v156, v157, v158, (__n128)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v159), v160));
          v192 = 0u;
          v193 = 0u;
          v190 = 0u;
          v191 = 0u;
          v163 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_viewpoints, v161, v149, v162);
          objc_msgSend_viewMatrix(v163, v164, v165, v166);
          v190 = v167;
          v191 = v168;
          v192 = v169;
          v193 = v170;
          *(_QWORD *)&v175 = sub_1B1814F98((uint64_t)a3, 1, (uint64_t)&v190, i, v171, v172, v173, v174).n128_u64[0];
          v178 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_viewpoints, v176, v149, v177, v175);
          objc_msgSend_projectionMatrix(v178, v179, v180, v181);
          v190 = v182;
          v191 = v183;
          v192 = v184;
          v193 = v185;
          sub_1B1814F98((uint64_t)a3, 0, (uint64_t)&v190, i++, v186, v187, v188, v189);
        }
      }
    }
    else
    {
      sub_1B1815AA0((__n128 *)a3, *(__n128 *)self->__viewport);
    }
    if (self->_renderContext)
      sub_1B1815D68((uint64_t)a3);
  }
}

- (BOOL)_needsRedrawAsap
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFDictionary *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  float v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  float v68;
  double v69;
  float v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  unsigned int adaptativeState0;
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

  if ((objc_msgSend__needsRepetitiveRedraw(self, a2, v2, v3) & 1) == 0)
  {
    if (sub_1B1814380((uint64_t)self->_engineContext, v5, v6, v7, v8, v9, v10, v11) == INFINITY)
    {
      v12 = sub_1B1813884((uint64_t)self->_engineContext, v13, v14, v15, v16, v17, v18, v19);
      if (!v12)
        return v12;
      v27 = v12;
      v28 = sub_1B1814768((uint64_t *)self->_engineContext, v20, v21, v22, v23, v24, v25, v26);
      if (v28)
      {
        v36 = sub_1B186CFA8((uint64_t)v28, v29, v30, v31, v32, v33, v34, v35);
        if (v36)
        {
          v44 = (uint64_t)v36;
          if (sub_1B1865A88((uint64_t)v36, v37, v38, v39, v40, v41, v42, v43)
            && (sub_1B1865A0C(v44, v45, v46, v47, v48, v49, v50, v51) & 1) != 0)
          {
            v52 = sub_1B186463C(v44, v45, v46, v47, v48, v49, v50, v51);
            v60 = sub_1B18E971C(v52, v53, v54, v55, v56, v57, v58, v59);
            v68 = sub_1B18E9680(v52, v61, v62, v63, v64, v65, v66, v67);
            if (v60 < v68)
              v68 = v60;
            v69 = v68;
            v70 = v68 + 1.0;
            if (v69 <= 0.01)
              v70 = 1.01;
            v78 = (int)(5.0 / logf(v70) * 60.0);
            if (!v78)
              goto LABEL_20;
          }
          else
          {
            if ((sub_1B18650B8(v44, v45, v46, v47, v48, v49, v50, v51) & 1) == 0)
              goto LABEL_20;
            v78 = 2;
          }
          adaptativeState0 = self->_adaptativeState0;
          if (adaptativeState0 != sub_1B187AFBC(v27, v71, v72, v73, v74, v75, v76, v77))
          {
            self->_adaptativeState0 = sub_1B187AFBC(v27, v80, v81, v82, v83, v84, v85, v86);
            self->_adaptativeEndFrame = sub_1B187AF24(v27, v87, v88, v89, v90, v91, v92, v93) + v78;
          }
          if (sub_1B187AF24(v27, v80, v81, v82, v83, v84, v85, v86) < self->_adaptativeEndFrame)
            goto LABEL_2;
        }
      }
    }
LABEL_20:
    LOBYTE(v12) = 0;
    return v12;
  }
LABEL_2:
  LOBYTE(v12) = 1;
  return v12;
}

- (double)_computeNextFrameTime
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;

  v9 = sub_1B1814380((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (objc_msgSend__needsRedrawAsap(self, v10, v11, v12))
  {
    v13 = CACurrentMediaTime();
    if (v9 >= v13)
      return v13;
  }
  return v9;
}

- (void)_render
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFXEngineContext *engineContext;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int isJitteringEnabled;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  int i;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;

  if ((*((_BYTE *)self + 121) & 8) != 0)
    objc_msgSend__installViewport(self, a2, v2, v3);
  objc_msgSend_lock(self, a2, v2, v3);
  engineContext = self->_engineContext;
  if (engineContext
    && (v13 = sub_1B1813884((uint64_t)engineContext, (uint64_t)v5, v6, v7, v8, v9, v10, v11)) != 0
    && self->_engineContext
    && self->_renderContext)
  {
    v18 = v13;
    if ((*((_BYTE *)self + 121) & 0x30) == 0x10)
      isJitteringEnabled = 0;
    else
      isJitteringEnabled = objc_msgSend_isJitteringEnabled(self, v5, v6, v7);
    sub_1B187973C(v18, (uint64_t)v5, v6, v7, v14, v15, v16, v17);
    v30 = sub_1B187AA20(v18, v23, v24, v25, v26, v27, v28, v29);
    if (v30)
    {
      v34 = (void *)sub_1B181FEE0(v30);
      objc_msgSend_beginTransaction_(v34, v35, (uint64_t)self->_engineContext, v36);
    }
    else
    {
      v34 = 0;
    }
    v37 = objc_msgSend_stats(self->_renderContext, v31, v32, v33);
    if ((*((_BYTE *)self + 248) & 8) != 0)
      sub_1B190CA58(v37, v38, v39, v40, v41, v42, v43, v44);
    else
      *(_DWORD *)(v37 + 12) = 0;
    sub_1B187ADC0(v18, v38, v39, v40, v41, v42, v43, v44);
    if (isJitteringEnabled)
    {
      sub_1B1815D90((uint64_t)self->_engineContext, 1);
      objc_msgSend__renderWorldWithEngineContext_(self, v47, (uint64_t)self->_engineContext, v48);
      sub_1B1815D90((uint64_t)self->_engineContext, 1);
      objc_msgSend__endFrame(self, v49, v50, v51);
      for (i = 0; ; ++i)
      {
        objc_msgSend__beginFrame(self, v52, v53, v54);
        sub_1B1815DC8((uint64_t)self->_engineContext, i == 80);
        sub_1B1815DB8((uint64_t)self->_engineContext, i);
        objc_msgSend__renderWorldWithEngineContext_(self, v56, (uint64_t)self->_engineContext, v57);
        if (i == 80)
          break;
        objc_msgSend__endFrame(self, v58, v59, v60);
      }
      sub_1B1815D90((uint64_t)self->_engineContext, 0);
    }
    else
    {
      objc_msgSend__renderWorldWithEngineContext_(self, v45, (uint64_t)self->_engineContext, v46);
    }
    sub_1B187AE1C(v18, v61, v62, v63, v64, v65, v66, v67);
    objc_msgSend__computeNextFrameTime(self, v68, v69, v70);
    self->_nextFrameTime = v71;
    objc_msgSend_endFrameWorldSpecifics(self->_renderContext, v72, v73, v74);
    objc_msgSend_endTransaction(v34, v75, v76, v77);
    sub_1B18797B4(v18, v78, v79, v80, v81, v82, v83, v84);
    objc_msgSend_drawStatisticsIfNeeded(self, v85, v86, v87);
  }
  else
  {
    self->_nextFrameTime = INFINITY;
    objc_msgSend__clearBackBuffer(self, v5, v6, v7);
  }
  objc_msgSend_unlock(self, v20, v21, v22);
}

- (void)render
{
  uint64_t v2;
  uint64_t v3;
  os_signpost_id_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  objc_msgSend__beginFrame(self, a2, v2, v3);
  v5 = sub_1B18137DC((uint64_t)self->_engineContext);
  v6 = sub_1B17C439C();
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v6;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B178D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v5, "RenderFrame", ", buf, 2u);
    }
  }
  objc_msgSend__render(self, v7, v8, v9);
  v11 = sub_1B17C439C();
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v11;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v16 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B178D000, v15, OS_SIGNPOST_INTERVAL_END, v5, "RenderFrame", ", v16, 2u);
    }
  }
  objc_msgSend__endFrame(self, v12, v13, v14);
}

- (void)renderWithTextureAttachmentProvider:(id)a3 options:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  VFXMTLRenderContext *renderContext;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;

  objc_msgSend_setAttachmentProvider_(self->_renderContext, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = objc_msgSend_commandBuffer(a4, v6, v7, v8);
  objc_msgSend_setClientCommandBuffer_(self->_renderContext, v10, v9, v11);
  objc_msgSend_beginFrame_(self->_renderContext, v12, 0, v13);
  objc_msgSend__render(self, v14, v15, v16);
  renderContext = self->_renderContext;
  v21 = objc_msgSend_waitUntilCompleted(a4, v18, v19, v20);
  objc_msgSend_endFrameWaitingUntilCompleted_status_error_(renderContext, v22, v21, 0, 0);
  objc_msgSend_setAttachmentProvider_(self->_renderContext, v23, 0, v24);
}

- (void)renderToTexture:(id)a3 options:(id)a4
{
  CGFloat v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  __n128 v14;
  VFXRenderToTextureFinalAttachmentProvider *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;

  v7 = (double)(unint64_t)objc_msgSend_width(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v11 = objc_msgSend_height(a3, v8, v9, v10);
  self->_framebufferInfo.drawableSize.width = v7;
  self->_framebufferInfo.drawableSize.height = (double)(unint64_t)v11;
  *(float *)&v12 = v7;
  *(float *)&v13 = (float)(unint64_t)v11;
  v19 = v13;
  v20 = v12;
  v14.n128_u64[0] = 0;
  v14.n128_u64[1] = __PAIR64__(v13, v12);
  *(__n128 *)self->__viewport = v14;
  sub_1B1815AA0((__n128 *)self->_engineContext, v14);
  sub_1B1815AB0((uint64_t)self->_engineContext, COERCE_DOUBLE(__PAIR64__(v19, v20)));
  v15 = [VFXRenderToTextureFinalAttachmentProvider alloc];
  v21 = (void *)objc_msgSend_initWithTexture_(v15, v16, (uint64_t)a3, v17);
  objc_msgSend_renderWithTextureAttachmentProvider_options_(self, v18, (uint64_t)v21, (uint64_t)a4);

}

- (void)renderToTexture:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_renderToTexture_options_, a3, 0);
}

- (void)renderWithViewport:(CGRect)a3 commandBuffer:(id)a4 passDescriptor:(id)a5
{
  objc_msgSend_commandQueue(a4, a2, (uint64_t)a4, (uint64_t)a5);
  MEMORY[0x1E0DE7D20](self, sel__renderWithViewport_encoder_passDescriptor_commandQueue_commandBuffer_, 0, a5);
}

- (void)_renderWithViewport:(CGRect)a3 encoder:(id)a4 passDescriptor:(id)a5 commandQueue:(id)a6 commandBuffer:(id)a7
{
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  float64x2_t v60;
  float64x2_t v61;
  __n128 v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  __CFXEngineContext *engineContext;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  double v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  float64_t height;
  CGFloat x;
  CGFloat y;
  float64_t width;
  int8x16_t v107;
  float v108;
  uint64_t v109;

  height = a3.size.height;
  x = a3.origin.x;
  y = a3.origin.y;
  width = a3.size.width;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. can't call renderAtTime:withEncoder:pass:commandQueue: with a GL context"), v13, v14, v15, v16, v17, v18, (uint64_t)"[_renderContext isKindOfClass:[VFXMTLRenderContext class]]");
  v19 = (void *)objc_msgSend_colorAttachments(a5, v12, v13, v14);
  v22 = (void *)objc_msgSend_objectAtIndexedSubscript_(v19, v20, 0, v21);
  v26 = (void *)objc_msgSend_texture(v22, v23, v24, v25);
  v30 = objc_msgSend_sampleCount(v26, v27, v28, v29);
  if (v30 == 2)
    objc_msgSend_setAntialiasingMode_(self, v31, 1, v32);
  else
    objc_msgSend_setAntialiasingMode_(self, v31, 2 * (v30 == 4), v32);
  objc_msgSend_setClientRenderPassDescriptor_(self->_renderContext, v33, (uint64_t)a5, v34);
  v38 = (void *)objc_msgSend_depthAttachment(a5, v35, v36, v37);
  v42 = objc_msgSend_texture(v38, v39, v40, v41);
  if (a4)
  {
    if (v42)
    {
      v46 = (void *)objc_msgSend_depthAttachment(a5, v43, v44, v45);
      objc_msgSend_clearDepth(v46, v47, v48, v49);
      if (v55 == 1.0 && (byte_1EEF66070 & 1) == 0)
      {
        byte_1EEF66070 = 1;
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: VFX uses reverseZ depth buffer to achieve better precision. You must clear your depth to 0.0 or everything will be discarded."), v50, v45, v51, v52, v53, v54, v102);
      }
    }
  }
  objc_msgSend_setClientCommandQueue_(self->_renderContext, v43, (uint64_t)a6, v45);
  objc_msgSend_setClientRenderCommandEncoder_(self->_renderContext, v56, (uint64_t)a4, v57);
  objc_msgSend_setClientCommandBuffer_(self->_renderContext, v58, (uint64_t)a7, v59);
  v60.f64[0] = width;
  v61.f64[0] = x;
  self->_framebufferInfo.drawableSize.width = width;
  self->_framebufferInfo.drawableSize.height = height;
  v60.f64[1] = height;
  v61.f64[1] = y;
  v62 = (__n128)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v61), v60);
  *(__n128 *)self->__viewport = v62;
  v107 = (int8x16_t)v62;
  sub_1B1815AA0((__n128 *)self->_engineContext, v62);
  v66 = (void *)objc_msgSend_colorAttachments(a5, v63, v64, v65);
  v69 = (void *)objc_msgSend_objectAtIndexedSubscript_(v66, v67, 0, v68);
  v76 = (void *)objc_msgSend_resolveTexture(v69, v70, v71, v72);
  if (!v76)
  {
    v77 = (void *)objc_msgSend_colorAttachments(a5, v73, v74, v75);
    v80 = (void *)objc_msgSend_objectAtIndexedSubscript_(v77, v78, 0, v79);
    v76 = (void *)objc_msgSend_texture(v80, v81, v82, v83);
  }
  engineContext = self->_engineContext;
  if (a5)
  {
    v108 = (float)(unint64_t)objc_msgSend_width(v76, v73, v74, v75);
    v88 = objc_msgSend_height(v76, v85, v86, v87);
    *(float *)&v89 = v108;
    *((float *)&v89 + 1) = (float)(unint64_t)v88;
    v90 = v89;
  }
  else
  {
    *(_QWORD *)&v90 = vextq_s8(v107, v107, 8uLL).u64[0];
  }
  sub_1B1815AB0((uint64_t)engineContext, v90);
  if (v76)
  {
    objc_msgSend_beginFrame_(self->_renderContext, v91, (uint64_t)v76, v93);
    objc_msgSend__render(self, v98, v99, v100);
    objc_msgSend_endFrameWaitingUntilCompleted_status_error_(self->_renderContext, v101, 0, 0, 0);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Render pass descriptor misconfigured - missing drawable texture"), v92, v93, v94, v95, v96, v97, v109);
  }
}

- (void)renderWithCommandBuffer:(id)a3 viewPoints:(id)a4 mode:(unint64_t)a5
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  self->_viewpoints = (NSArray *)a4;
  self->_viewpointCoordinateSpace = a5;
  if (a4)
  {
    v18 = 0u;
    v19 = 0u;
    v17 = 0u;
    v7 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, a2, 0, (uint64_t)a4);
    if (v7)
    {
      objc_msgSend_viewport(v7, v8, v9, v10);
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v17 = 0u;
    }
    v11 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_viewpoints, v8, 0, v10, v17, v18, v19);
    v15 = objc_msgSend_passDescriptor(v11, v12, v13, v14);
    objc_msgSend_renderWithViewport_commandBuffer_passDescriptor_(self, v16, (uint64_t)a3, v15, 0.0, 0.0, 0.0, 0.0);
    self->_viewpoints = 0;
  }
}

- (CGImage)createSnapshot:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGImage *result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGImage *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;

  result = (CGImage *)self->_engineContext;
  if (result)
  {
    result = (CGImage *)sub_1B1813884((uint64_t)result, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
    if (result)
    {
      v18 = result;
      sub_1B187973C((uint64_t)result, v11, v12, v13, v14, v15, v16, v17);
      objc_msgSend__beginFrame(self, v19, v20, v21);
      objc_msgSend_updateAtTime_(self, v22, v23, v24, self->_time);
      objc_msgSend__render(self, v25, v26, v27);
      sub_1B18797B4((uint64_t)v18, v28, v29, v30, v31, v32, v33, v34);
      v50 = 0;
      v51 = 0;
      objc_msgSend_endFrameWaitingUntilCompleted_status_error_(self->_renderContext, v35, 1, (uint64_t)&v50, &v51);
      if (v50 == 4)
      {
        v39 = (void *)objc_msgSend_MTLTexture(self, v36, v37, v38);
        return sub_1B189E4CC(v39, v40, v41, v42);
      }
      else
      {
        v43 = objc_msgSend_description(v51, v36, v37, v38);
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: Failed to create snapshot with error %@"), v44, v45, v46, v47, v48, v49, v43);
        result = 0;
        if (a3)
          *a3 = v51;
      }
    }
  }
  return result;
}

- (id)snapshot
{
  uint64_t v2;
  CGImage *Snapshot;
  const char *v4;
  uint64_t v5;
  void *v6;

  Snapshot = (CGImage *)objc_msgSend_createSnapshot_(self, a2, 0, v2);
  v6 = (void *)objc_msgSend_imageWithCGImage_(MEMORY[0x1E0DC3870], v4, (uint64_t)Snapshot, v5);
  CGImageRelease(Snapshot);
  return v6;
}

- (CGImage)_createBackgroundColorImageWithSize:(CGSize)a3
{
  double height;
  double width;
  size_t v6;
  size_t v7;
  size_t v8;
  void *v9;
  CGColorSpace *v10;
  CGContext *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CGColor *v19;
  CGImage *Image;
  CGRect v22;

  height = a3.height;
  width = a3.width;
  v6 = (unint64_t)a3.width;
  v7 = (unint64_t)a3.height;
  v8 = 4 * (unint64_t)a3.width;
  v9 = malloc_type_malloc(v8 * (unint64_t)a3.height, 0x1F478679uLL);
  v10 = (CGColorSpace *)sub_1B179D1A8();
  v11 = CGBitmapContextCreate(v9, v6, v7, 8uLL, v8, v10, 0x4001u);
  v15 = (void *)objc_msgSend_backgroundColor(self, v12, v13, v14);
  v19 = (CGColor *)objc_msgSend_CGColor(v15, v16, v17, v18);
  CGContextSetFillColorWithColor(v11, v19);
  v22.size.width = (double)(unint64_t)width;
  v22.size.height = (double)(unint64_t)height;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  CGContextFillRect(v11, v22);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  free(v9);
  return Image;
}

- (id)snapshotWithSize:(CGSize)a3
{
  uint64_t v3;
  double height;
  double width;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CGImage *SnapshotWithSize_error;
  void *v11;

  height = a3.height;
  width = a3.width;
  SnapshotWithSize_error = (CGImage *)objc_msgSend__createSnapshotWithSize_error_(self, a2, 0, v3);
  if (!SnapshotWithSize_error)
    SnapshotWithSize_error = (CGImage *)objc_msgSend__createBackgroundColorImageWithSize_(self, v7, v8, v9, width, height);
  v11 = (void *)objc_msgSend_imageWithCGImage_(MEMORY[0x1E0DC3870], v7, (uint64_t)SnapshotWithSize_error, v9);
  CGImageRelease(SnapshotWithSize_error);
  return v11;
}

- (CGImage)_createSnapshotWithSize:(CGSize)a3 error:(id *)a4
{
  uint64_t v4;
  CGFloat height;
  float64x2_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  CGImage *Snapshot;
  uint64_t v31;
  const char *v32;
  uint64_t v33;

  height = a3.height;
  v8 = vcvtq_f64_f32(vrndx_f32(vcvt_f32_f64((float64x2_t)a3)));
  if ((*((_BYTE *)self + 121) & 8) == 0)
    objc_msgSend__setBackingSize_(self, a2, (uint64_t)a4, v4, *(_OWORD *)&v8);
  v9 = (void *)objc_msgSend_snapshotRendererWithSize_(self, a2, (uint64_t)a4, v4);
  v13 = objc_msgSend__computedLightingEnvironmentMapsPath(self, v10, v11, v12);
  objc_msgSend_set_computedLightingEnvironmentMapsPath_(v9, v14, v13, v15);
  v19 = objc_msgSend_antialiasingMode(self, v16, v17, v18);
  objc_msgSend_setAntialiasingMode_(v9, v20, v19, v21);
  objc_msgSend_set_viewport_(v9, v22, v23, v24, 0.0);
  Snapshot = (CGImage *)objc_msgSend_createSnapshot_(v9, v25, (uint64_t)a4, v26);
  if (!self->_pointOfView)
  {
    v31 = objc_msgSend_pointOfView(v9, v27, v28, v29);
    objc_msgSend_setPointOfView_(self, v32, v31, v33);
    self->_pointOfViewWasSet = 0;
  }
  if ((*((_BYTE *)self + 121) & 8) != 0)
  {

    self->_snapshotRenderer = 0;
  }
  return Snapshot;
}

- (id)snapshotRendererWithSize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  double height;
  double width;
  VFXRenderer *snapshotRenderer;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  VFXRenderer *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t isJitteringEnabled;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;

  height = a3.height;
  width = a3.width;
  snapshotRenderer = self->_snapshotRenderer;
  if (snapshotRenderer)
  {
    objc_msgSend__setBackingSize_(snapshotRenderer, a2, v3, v4, a3.width, a3.height);
  }
  else
  {
    v12 = (void *)objc_opt_class();
    v16 = objc_msgSend_device(self, v13, v14, v15);
    v18 = (VFXRenderer *)(id)objc_msgSend_rendererWithDevice_options_(v12, v17, v16, 0);
    self->_snapshotRenderer = v18;
    objc_msgSend__setupOffscreenRendererWithSize_(v18, v19, v20, v21, width, height);
  }
  objc_msgSend_lock(self, v9, v10, v11);
  objc_msgSend_begin(VFXTransaction, v22, v23, v24);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v25, v26, v27, 0.0);
  objc_msgSend_setImmediateMode_(VFXTransaction, v28, 1, v29);
  v33 = (void *)objc_msgSend_world(self, v30, v31, v32);
  objc_msgSend_lock(v33, v34, v35, v36);
  objc_msgSend__contentsScaleFactor(self, v37, v38, v39);
  self->_snapshotRenderer->_contentScaleFactor = v40;
  v44 = objc_msgSend_world(self, v41, v42, v43);
  objc_msgSend_setWorld_(self->_snapshotRenderer, v45, v44, v46);
  isJitteringEnabled = objc_msgSend_isJitteringEnabled(self, v47, v48, v49);
  objc_msgSend_setJitteringEnabled_(self->_snapshotRenderer, v51, isJitteringEnabled, v52);
  v56 = objc_msgSend_renderGraph(self, v53, v54, v55);
  objc_msgSend_setRenderGraph_(self->_snapshotRenderer, v57, v56, v58);
  v62 = objc_msgSend_vertexAmplificationEnabled(self, v59, v60, v61);
  objc_msgSend_setVertexAmplificationEnabled_(self->_snapshotRenderer, v63, v62, v64);
  v68 = objc_msgSend_pointOfView(self, v65, v66, v67);
  objc_msgSend_setPointOfView_(self->_snapshotRenderer, v69, v68, v70);
  v74 = objc_msgSend_autoenablesDefaultLighting(self, v71, v72, v73);
  objc_msgSend_setAutoenablesDefaultLighting_(self->_snapshotRenderer, v75, v74, v76);
  v80 = objc_msgSend_autoAdjustCamera(self, v77, v78, v79);
  objc_msgSend_setAutoAdjustCamera_(self->_snapshotRenderer, v81, v80, v82);
  v86 = objc_msgSend_delegate(self, v83, v84, v85);
  objc_msgSend_setDelegate_(self->_snapshotRenderer, v87, v86, v88);
  v92 = objc_msgSend__wantsWorldRendererDelegationMessages(self, v89, v90, v91);
  objc_msgSend_set_wantsWorldRendererDelegationMessages_(self->_snapshotRenderer, v93, v92, v94);
  v98 = objc_msgSend_backgroundColor(self, v95, v96, v97);
  objc_msgSend_setBackgroundColor_(self->_snapshotRenderer, v99, v98, v100);
  v104 = objc_msgSend_debugOptions(self, v101, v102, v103);
  objc_msgSend_setDebugOptions_(self->_snapshotRenderer, v105, v104, v106);
  objc_msgSend__superSamplingFactor(self, v107, v108, v109);
  objc_msgSend_set_superSamplingFactor_(self->_snapshotRenderer, v110, v111, v112);
  objc_msgSend__screenTransform(self, v113, v114, v115);
  objc_msgSend_set_screenTransform_(self->_snapshotRenderer, v116, v117, v118);
  v122 = objc_msgSend__collectCompilationErrors(self, v119, v120, v121);
  objc_msgSend_set_collectCompilationErrors_(self->_snapshotRenderer, v123, v122, v124);
  v128 = objc_msgSend__resourceManagerMonitor(self, v125, v126, v127);
  objc_msgSend_set_resourceManagerMonitor_(self->_snapshotRenderer, v129, v128, v130);
  v134 = objc_msgSend__commandBufferStatusMonitor(self, v131, v132, v133);
  objc_msgSend_set_commandBufferStatusMonitor_(self->_snapshotRenderer, v135, v134, v136);
  v140 = objc_msgSend_antialiasingMode(self, v137, v138, v139);
  objc_msgSend_setAntialiasingMode_(self->_snapshotRenderer, v141, v140, v142);
  v146 = objc_msgSend__engineContext(self->_snapshotRenderer, v143, v144, v145);
  sub_1B18154C4(v146, 1, v147, v148, v149, v150, v151, v152);
  v156 = objc_msgSend__engineContext(self->_snapshotRenderer, v153, v154, v155);
  v157 = sub_1B1815AB8((uint64_t)self->_engineContext);
  sub_1B1815AC0(v156, v157);
  v161 = (void *)objc_msgSend_world(self, v158, v159, v160);
  objc_msgSend_unlock(v161, v162, v163, v164);
  objc_msgSend_commit(VFXTransaction, v165, v166, v167);
  objc_msgSend_unlock(self, v168, v169, v170);
  return self->_snapshotRenderer;
}

- (void)_updateProbes:(id)a3 progress:(id)a4 completionHandler:(id)a5
{
  CFTimeInterval v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend_becomeCurrentWithPendingUnitCount_(a4, a2, 1, (uint64_t)a4);
  v9 = CACurrentMediaTime();
  objc_msgSend_updateProbes_atTime_completionHandler_(self, v10, (uint64_t)a3, (uint64_t)a5, v9);
  MEMORY[0x1E0DE7D20](a4, sel_resignCurrent, v11, v12);
}

- (void)updateProbes:(id)a3 atTime:(double)a4 completionHandler:(id)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  _QWORD v21[7];

  if (!objc_msgSend_world(self, a2, (uint64_t)a3, (uint64_t)a5, a4))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v9, v10, v11, v12, v13, v14, (uint64_t)"self.world");
  v15 = (void *)objc_msgSend_world(self, v8, v9, v10);
  v19 = objc_msgSend_worldRef(v15, v16, v17, v18);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1B18B6C54;
  v21[3] = &unk_1E63D85A8;
  v21[4] = self;
  v21[5] = a3;
  v21[6] = a5;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v20, v19, 0, v21);
}

- (void)_jitterAtStep:(unint64_t)a3 updateMainFramebuffer:(BOOL)a4 redisplay:(BOOL)a5 jitterer:(id)a6
{
  NSObject *renderingQueue;
  _QWORD v7[7];
  BOOL v8;
  BOOL v9;

  renderingQueue = self->__renderingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1B18B7024;
  v7[3] = &unk_1E63D85D0;
  v7[4] = self;
  v7[5] = a6;
  v7[6] = a3;
  v8 = a4;
  v9 = a5;
  dispatch_sync(renderingQueue, v7);
}

- (id)privateRendererOwner
{
  return self->_privateRendererOwner;
}

- (void)_addGPUFrameScheduledHandler:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1B18B717C;
  v3[3] = &unk_1E63D85F8;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v3);
}

- (void)_addGPUFrameCompletedHandler:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1B18B71E8;
  v3[3] = &unk_1E63D85F8;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v3);
}

- (void)_addGPUFramePresentedHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  _QWORD v11[6];

  if ((*((_BYTE *)self + 121) & 8) != 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18B72A0;
    v11[3] = &unk_1E63D85F8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v11);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: %s should only be called on a private renderer, using -[VFXRenderer _addGPUFrameCompletedHandler:] instead"), (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"-[VFXRenderer _addGPUFramePresentedHandler:]");
    MEMORY[0x1E0DE7D20](self, sel__addGPUFrameCompletedHandler_, a3, v10);
  }
}

- (void)_allowGPUBackgroundExecution
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1B18B730C;
  v2[3] = &unk_1E63D5378;
  v2[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v2);
}

- (void)_interfaceOrientationDidChange
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  if ((*((_BYTE *)self + 121) & 0x10) != 0)
  {
    v11 = (void *)objc_msgSend_window(self->_privateRendererOwner, a2, v2, v3);
    v15 = (void *)objc_msgSend_windowScene(v11, v12, v13, v14);
    v9 = objc_msgSend_interfaceOrientation(v15, v16, v17, v18);
  }
  else
  {
    v5 = (void *)objc_msgSend_sharedApplication(MEMORY[0x1E0DC3470], a2, v2, v3);
    v9 = objc_msgSend_statusBarOrientation(v5, v6, v7, v8);
  }
  MEMORY[0x1E0DE7D20](self, sel__setInterfaceOrientation_, v9, v10);
}

- (void)_setInterfaceOrientation:(int64_t)a3
{
  uint64_t v3;
  int v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend_lock(self, a2, a3, v3);
  sub_1B1815AC0((uint64_t)self->_engineContext, v4);
  objc_msgSend_unlock(self, v6, v7, v8);
}

- (BOOL)canRecycleParticleBuffers
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_canRecycleParticleBuffers(self->_renderContext, a2, v2, v3);
}

- (void)setCanRecycleParticleBuffers:(BOOL)a3
{
  ((void (*)(VFXMTLRenderContext *, char *, BOOL))MEMORY[0x1E0DE7D20])(self->_renderContext, sel_setCanRecycleParticleBuffers_, a3);
}

- (BOOL)shouldLoadFinalTexture
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_requireLoadFinalTexture(self->_renderContext, a2, v2, v3);
}

- (void)setShouldLoadFinalTexture:(BOOL)a3
{
  ((void (*)(VFXMTLRenderContext *, char *, BOOL))MEMORY[0x1E0DE7D20])(self->_renderContext, sel_setRequireLoadFinalTexture_, a3);
}

- (VFXRenderGraph)renderGraph
{
  return self->_renderGraph;
}

- (void)setRenderGraph:(id)a3
{
  VFXRenderGraph *renderGraph;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFXEngineContext *engineContext;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  _QWORD v27[7];

  renderGraph = self->_renderGraph;
  if (renderGraph != a3)
  {

    self->_renderGraph = (VFXRenderGraph *)a3;
    objc_msgSend_invalidateCompiledGraph(a3, v6, v7, v8);
    v12 = objc_msgSend_graph(self->_renderGraph, v9, v10, v11);
    v16 = objc_msgSend_diagnostics(self->_renderGraph, v13, v14, v15);
    engineContext = self->_engineContext;
    v21 = (void *)objc_msgSend_world(self, v18, v19, v20);
    v25 = objc_msgSend_worldRef(v21, v22, v23, v24);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B18B7498;
    v27[3] = &unk_1E63D7EA8;
    v27[5] = v16;
    v27[6] = engineContext;
    v27[4] = v12;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v26, v25, 0, v27);
  }
}

- (id)_legacyRenderer
{
  return self->_legacyRenderer;
}

- (void)set_legacyRenderer:(id)a3
{

  self->_legacyRenderer = (_TtC3VFX17VFXRendererLegacy *)a3;
}

- (BOOL)_triggersEnabled
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_lock(self, a2, v2, v3);
  v5 = sub_1B1816098((uint64_t)self->_engineContext);
  objc_msgSend_unlock(self, v6, v7, v8);
  return v5;
}

- (void)set_triggersEnabled:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_lock(self, a2, a3, v3);
  sub_1B181608C((uint64_t)self->_engineContext, a3);
  objc_msgSend_unlock(self, v6, v7, v8);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandBufferStatusMonitor);
  objc_destroyWeak((id *)&self->_resourceManagerMonitor);
}

- (BOOL)renderMovieToURL:(id)a3 size:(CGSize)a4 antialiasingMode:(unint64_t)a5 attributes:(id)a6 error:(id *)a7
{
  double height;
  double width;
  VFXMovieExportOperation *v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  height = a4.height;
  width = a4.width;
  v14 = [VFXMovieExportOperation alloc];
  v16 = (id)objc_msgSend_initWithRenderer_size_attributes_outputURL_(v14, v15, (uint64_t)self, (uint64_t)a6, a3, width, height);
  objc_msgSend_setAntialiasingMode_(v16, v17, a5, v18);
  objc_msgSend_main(v16, v19, v20, v21);
  v25 = objc_msgSend_error(v16, v22, v23, v24);
  v29 = v25;
  if (a7 && v25)
    *a7 = (id)objc_msgSend_error(v16, v26, v27, v28);
  return v29 == 0;
}

- (VFXRenderer)initWithCommandQueue:(id)a3
{
  VFXRenderer *v4;
  const char *v5;
  uint64_t v6;
  VFXRenderer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VFXRenderer;
  v4 = -[VFXRenderer init](&v9, sel_init);
  v7 = v4;
  if (v4)
    objc_msgSend_setupLegacyRendererWithCommandQueue_(v4, v5, (uint64_t)a3, v6);
  return v7;
}

- (id)setupLegacyRendererWithCommandQueue:(id)a3
{
  _TtC3VFX17VFXRendererLegacy *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = [_TtC3VFX17VFXRendererLegacy alloc];
  v8 = (void *)objc_msgSend_initWithCommandQueue_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_backgroundColor(self, v9, v10, v11);
  objc_msgSend_setBackgroundColor_(v8, v13, v12, v14);
  v18 = (void *)objc_msgSend_world(self, v15, v16, v17);
  v22 = objc_msgSend_scene(v18, v19, v20, v21);
  objc_msgSend_setScene_(v8, v23, v22, v24);
  objc_msgSend_set_legacyRenderer_(self, v25, (uint64_t)v8, v26);

  return (id)objc_msgSend__legacyRenderer(self, v27, v28, v29);
}

- (id)legacyRenderer
{
  uint64_t v2;
  uint64_t v3;
  id result;
  const char *v6;
  uint64_t v7;

  result = (id)objc_msgSend__legacyRenderer(self, a2, v2, v3);
  if (!result)
    return (id)objc_msgSend_setupLegacyRendererWithCommandQueue_(self, v6, 0, v7);
  return result;
}

- (_TtC3VFX8VFXScene)scene
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_legacyRenderer(self, a2, v2, v3);
  return (_TtC3VFX8VFXScene *)objc_msgSend_scene(v4, v5, v6, v7);
}

- (void)setScene:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_legacyRenderer(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setScene_(v5, v6, (uint64_t)a3, v7);
}

- (_TtC3VFX9VFXEffect)effect
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);
  return (_TtC3VFX9VFXEffect *)MEMORY[0x1E0DE7D20](v4, sel_effect, v5, v6);
}

- (void)setEffect:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_legacyRenderer(self, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_setEffect_, a3, v6);
}

- (MTLTexture)texture
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_legacyRenderer(self, a2, v2, v3);
  return (MTLTexture *)objc_msgSend_texture(v4, v5, v6, v7);
}

- (void)setTexture:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_legacyRenderer(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setTexture_(v5, v6, (uint64_t)a3, v7);
}

- (MTLTexture)depthTexture
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);
  return (MTLTexture *)MEMORY[0x1E0DE7D20](v4, sel_depthTexture, v5, v6);
}

- (void)setDepthTexture:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_legacyRenderer(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setDepthTexture_(v5, v6, (uint64_t)a3, v7);
}

- (BOOL)hasRenderableObjects
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);
  return MEMORY[0x1E0DE7D20](v4, sel_hasRenderableObjects, v5, v6);
}

- (void)encodeWithCommandBuffer:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_legacyRenderer(self, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_encodeWithCommandBuffer_, a3, v6);
}

- (void)finalizeEncoding
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);
  MEMORY[0x1E0DE7D20](v4, sel_finalizeEncoding, v5, v6);
}

- (BOOL)enableDeferredRendering
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);
  return MEMORY[0x1E0DE7D20](v4, sel_enableDeferredRendering, v5, v6);
}

- (void)setEnableDeferredRendering:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend_legacyRenderer(self, a2, a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_setEnableDeferredRendering_, v4, v6);
}

- (BOOL)_legacyAdditiveWritesToAlpha
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_legacyRenderer(self, a2, v2, v3);
  return objc_msgSend_additiveWritesToAlpha(v4, v5, v6, v7);
}

- (void)_setLegacyAdditiveWritesToAlpha:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend_legacyRenderer(self, a2, a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_setAdditiveWritesToAlpha_, v4, v6);
}

- (id)snapshotWithSize:(CGSize)a3 deltaTime:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_msgSend_legacyRenderer(self, a2, v4, v5);
  return (id)MEMORY[0x1E0DE7D20](v6, sel_snapshotWithSize_deltaTime_, v7, v8);
}

- (id)snapshotImageWithSize:(CGSize)a3
{
  return (id)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self, sel_snapshotImageWithSize_deltaTime_);
}

- (id)snapshotImageWithSize:(CGSize)a3 deltaTime:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_msgSend_legacyRenderer(self, a2, v4, v5);
  return (id)MEMORY[0x1E0DE7D20](v6, sel_snapshotImageWithSize_deltaTime_, v7, v8);
}

- (id)postRenderCallback
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);
  return (id)MEMORY[0x1E0DE7D20](v4, sel_postRenderCallback, v5, v6);
}

- (void)setPostRenderCallback:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_legacyRenderer(self, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_setPostRenderCallback_, a3, v6);
}

@end

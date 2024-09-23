@implementation VFXView

+ (uint64_t)_isMetalSupported
{
  if (qword_1EEF65568 != -1)
    dispatch_once(&qword_1EEF65568, &unk_1E63D0970);
  return byte_1EEF65564;
}

- (void)_initializeDisplayLinkWithScreen:(id)a3 policy:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  int v19;
  void *v20;
  dispatch_time_t v21;
  sched_param v22;
  _QWORD aBlock[4];
  id v24;
  id v25;
  id v26[2];
  id location;
  _QWORD block[4];
  pthread_attr_t v29;
  void *v30;
  pthread_attr_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1B184D92C;
  aBlock[3] = &unk_1E63D71F8;
  objc_copyWeak(v26, &location);
  v11 = v8;
  v24 = v11;
  v26[1] = (id)a4;
  v12 = v9;
  v25 = v12;
  v13 = _Block_copy(aBlock);
  objc_msgSend__renderThreadPriority(self, v14, v15, v16);
  v18 = v17;
  memset(&v31, 0, sizeof(v31));
  pthread_attr_init(&v31);
  pthread_attr_setschedpolicy(&v31, 2);
  v19 = (int)v18;
  if (v18 == 0.0)
    v19 = 45;
  v22.sched_priority = v19;
  *(_DWORD *)v22.__opaque = 0;
  pthread_attr_setschedparam(&v31, &v22);
  v20 = _Block_copy(v13);
  v21 = dispatch_time(0, 0);
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = sub_1B184DB20;
  block[3] = &unk_1E63D7218;
  v29 = v31;
  v30 = v20;
  dispatch_after(v21, MEMORY[0x1E0C80D38], block);
  pthread_attr_destroy(&v31);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

}

+ (id)deviceForOptions:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  v9 = MTLCreateSystemDefaultDevice();
  if (!v9 && (byte_1EEF66048 & 1) == 0)
  {
    byte_1EEF66048 = 1;
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Failed to create default Metal device."), v3, v4, v5, v6, v7, v8, v11);
  }
  return v9;
}

- (void)_adjustBackingLayerPixelFormat
{
  uint64_t v2;
  uint64_t v3;
  char isOpaque;
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
  BOOL v17;
  NSObject *v18;
  _QWORD v19[5];
  char v20;
  BOOL v21;

  if (!self->_legacyView && self->_renderer)
  {
    isOpaque = objc_msgSend_isOpaque(self, a2, v2, v3);
    if (sub_1B179FFA4())
    {
      v9 = (void *)objc_msgSend_window(self, v6, v7, v8);
      v13 = (void *)objc_msgSend_screen(v9, v10, v11, v12);
      v17 = objc_msgSend_gamut(v13, v14, v15, v16) == 1;
    }
    else
    {
      v17 = 0;
    }
    v18 = objc_msgSend__renderingQueue(self->_renderer, v6, v7, v8);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1B18A9DB0;
    v19[3] = &unk_1E63D83B8;
    v19[4] = self;
    v20 = isOpaque;
    v21 = v17;
    dispatch_async(v18, v19);
  }
}

- (unint64_t)pixelFormat
{
  uint64_t v2;
  uint64_t v3;
  void *legacyView;

  if (self->_legacyView)
    legacyView = self->_legacyView;
  else
    legacyView = (void *)objc_msgSend_layer(self, a2, v2, v3);
  return objc_msgSend_pixelFormat(legacyView, a2, v2, v3);
}

- (void)setPixelFormat:(unint64_t)a3
{
  uint64_t v3;
  _TtC3VFX13VFXViewLegacy *legacyView;
  NSObject *v7;
  _QWORD v8[6];

  legacyView = self->_legacyView;
  if (legacyView)
  {
    objc_msgSend_setPixelFormat_(legacyView, a2, a3, v3);
  }
  else if (self->_renderer)
  {
    *((_BYTE *)self + 433) |= 0x10u;
    v7 = objc_msgSend__renderingQueue(self->_renderer, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18A9FA8;
    v8[3] = &unk_1E63D83E0;
    v8[4] = self;
    v8[5] = a3;
    dispatch_async(v7, v8);
  }
}

- (CGColorSpace)colorSpace
{
  return (CGColorSpace *)((uint64_t (*)(CALayer *, char *))MEMORY[0x1E0DE7D20])(self->_backingLayer, sel_colorspace);
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  uint64_t v3;
  NSObject *v6;
  _QWORD v7[6];

  if (self->_renderer)
  {
    *((_BYTE *)self + 433) |= 0x20u;
    v6 = objc_msgSend__renderingQueue(self->_renderer, a2, (uint64_t)a3, v3);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1B18AA0C8;
    v7[3] = &unk_1E63D83E0;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(v6, v7);
  }
}

+ (BOOL)shouldObserveApplicationStateToPreventBackgroundGPUAccess
{
  return 1;
}

- (void)_commonInit:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  _QWORD *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int isHostedInAnotherProcess;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  VFXRenderer *v61;
  const char *v62;
  VFXJitterer *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  VFXCameraNavigationController *v92;
  const char *v93;
  uint64_t v94;
  id v95;
  const char *v96;
  uint64_t v97;

  sub_1B18B7680();
  *((_BYTE *)self + 432) |= 1u;
  *((_BYTE *)self + 432) |= 0x20u;
  self->_currentSystemTime = CACurrentMediaTime();
  self->_lock = objc_alloc_init(VFXRecursiveLock);
  v8 = (void *)objc_msgSend_layer(self, v5, v6, v7);
  sub_1B18A9C88(v8);
  objc_msgSend_vfx_setBackingLayer_(self, v9, (uint64_t)v8, v10);
  self->_device = (MTLDevice *)objc_msgSend_device(v8, v11, v12, v13);
  v14 = (void *)objc_opt_class();
  if (objc_msgSend_shouldObserveApplicationStateToPreventBackgroundGPUAccess(v14, v15, v16, v17))
  {
    if (_UIApplicationIsExtension())
    {
      v24 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v21, v22, v23);
      objc_msgSend_addObserver_selector_name_object_(v24, v25, (uint64_t)self, (uint64_t)sel__enterForeground_, *MEMORY[0x1E0CB29E8], 0);
      v29 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v26, v27, v28);
      v31 = (_QWORD *)MEMORY[0x1E0CB2A00];
    }
    else
    {
      v32 = (void *)objc_msgSend__applicationKeyWindow(MEMORY[0x1E0DC3F98], v21, v22, v23);
      isHostedInAnotherProcess = objc_msgSend__isHostedInAnotherProcess(v32, v33, v34, v35);
      v40 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v37, v38, v39);
      if (isHostedInAnotherProcess)
      {
        objc_msgSend_addObserver_selector_name_object_(v40, v41, (uint64_t)self, (uint64_t)sel__enterForeground_, CFSTR("_UIViewServiceHostDidBecomeActiveNotification"), 0);
        v45 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v42, v43, v44);
        objc_msgSend_addObserver_selector_name_object_(v45, v46, (uint64_t)self, (uint64_t)sel__enterBackground_, CFSTR("_UIViewServiceHostWillResignActiveNotification"), 0);
        goto LABEL_8;
      }
      objc_msgSend_addObserver_selector_name_object_(v40, v41, (uint64_t)self, (uint64_t)sel__enterForeground_, *MEMORY[0x1E0DC4750], 0);
      v29 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v47, v48, v49);
      v31 = (_QWORD *)MEMORY[0x1E0DC4868];
    }
    objc_msgSend_addObserver_selector_name_object_(v29, v30, (uint64_t)self, (uint64_t)sel__enterBackground_, *v31, 0);
  }
LABEL_8:
  v50 = (void *)objc_msgSend_mainScreen(MEMORY[0x1E0DC3BF8], v18, v19, v20);
  objc_msgSend_nativeScale(v50, v51, v52, v53);
  objc_msgSend_setContentScaleFactor_(self, v54, v55, v56);
  objc_msgSend_setContentMode_(self, v57, 4, v58);
  objc_msgSend_setMultipleTouchEnabled_(self, v59, 1, v60);
  v61 = [VFXRenderer alloc];
  self->_renderer = (VFXRenderer *)objc_msgSend__initWithDevice_options_isPrivateRenderer_privateRendererOwner_clearsOnDraw_(v61, v62, (uint64_t)self->_device, (uint64_t)a3, 1, self, 1);
  v63 = [VFXJitterer alloc];
  self->_jitterer = (VFXJitterer *)objc_msgSend_initWithDelegate_(v63, v64, (uint64_t)self, v65);
  v69 = objc_msgSend__defaultBackgroundColor(self, v66, v67, v68);
  objc_msgSend_setBackgroundColor_(self, v70, v69, v71);
  if (sub_1B17C46BC(1))
    objc_msgSend_setAllowsCameraControl_(self, v72, 1, v73);
  if (sub_1B17C46BC(0))
    objc_msgSend_setShowsStatistics_(self, v74, 1, v75);
  if ((MGGetBoolAnswer() & 1) != 0 || !NSClassFromString(CFSTR("ARVFXView")))
    v79 = 1;
  else
    v79 = objc_opt_isKindOfClass() ^ 1;
  v80 = (void *)objc_msgSend__renderContextMetal(self->_renderer, v76, v77, v78);
  objc_msgSend_setShouldPresentAfterMinimumDuration_(v80, v81, v79 & 1, v82);
  v86 = (void *)objc_msgSend__renderContextMetal(self->_renderer, v83, v84, v85);
  objc_msgSend_setPreferredFramesPerSecond_(v86, v87, 0, v88);
  if (_UIApplicationIsExtension())
    objc_msgSend__runningInExtension(self->_renderer, v89, v90, v91);
  v92 = [VFXCameraNavigationController alloc];
  v95 = (id)objc_msgSend_initWithView_(v92, v93, (uint64_t)self, v94);
  objc_msgSend_setNavigationCameraController_(self, v96, (uint64_t)v95, v97);
}

- (VFXView)initWithFrame:(CGRect)a3
{
  return (VFXView *)((uint64_t (*)(VFXView *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_initWithFrame_options_, 0);
}

- (VFXView)initWithFrame:(CGRect)a3 options:(id)a4
{
  CGFloat height;
  CGFloat width;
  VFXView *v7;
  const char *v8;
  uint64_t v9;
  VFXView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  v12.receiver = self;
  v12.super_class = (Class)VFXView;
  v7 = -[VFXView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v10 = v7;
  if (v7)
  {
    v7->_boundsSize.width = width;
    v7->_boundsSize.height = height;
    objc_msgSend__commonInit_(v7, v8, (uint64_t)a4, v9);
  }
  return v10;
}

- (VFXView)init
{
  return (VFXView *)((uint64_t (*)(VFXView *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_initWithFrame_options_, 0);
}

- (VFXView)initWithCoder:(id)a3
{
  VFXView *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXView *v8;
  CGSize *p_boundsSize;
  objc_class *v10;
  CGFloat v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)VFXView;
  v4 = -[VFXView initWithCoder:](&v42, sel_initWithCoder_);
  v8 = v4;
  if (v4)
  {
    p_boundsSize = &v4->_boundsSize;
    objc_msgSend_bounds(v4, v5, v6, v7);
    *(_QWORD *)&p_boundsSize->width = v10;
    v8->_boundsSize.height = v11;
    objc_msgSend__commonInit_(v8, v12, 0, v13);
    if (objc_msgSend_containsValueForKey_(a3, v14, (uint64_t)CFSTR("autoenablesDefaultLighting"), v15))
    {
      v18 = objc_msgSend_decodeBoolForKey_(a3, v16, (uint64_t)CFSTR("autoenablesDefaultLighting"), v17);
      objc_msgSend_setAutoenablesDefaultLighting_(v8, v19, v18, v20);
    }
    if (objc_msgSend_containsValueForKey_(a3, v16, (uint64_t)CFSTR("jitteringEnabled"), v17))
    {
      v23 = objc_msgSend_decodeBoolForKey_(a3, v21, (uint64_t)CFSTR("jitteringEnabled"), v22);
      objc_msgSend_setJitteringEnabled_(v8, v24, v23, v25);
    }
    if (objc_msgSend_containsValueForKey_(a3, v21, (uint64_t)CFSTR("temporalAntialiasingEnabled"), v22))
    {
      v28 = objc_msgSend_decodeBoolForKey_(a3, v26, (uint64_t)CFSTR("temporalAntialiasingEnabled"), v27);
      objc_msgSend_setTemporalAntialiasingEnabled_(v8, v29, v28, v30);
    }
    if (objc_msgSend_containsValueForKey_(a3, v26, (uint64_t)CFSTR("allowsCameraControl"), v27))
    {
      v33 = objc_msgSend_decodeBoolForKey_(a3, v31, (uint64_t)CFSTR("allowsCameraControl"), v32);
      objc_msgSend_setAllowsCameraControl_(v8, v34, v33, v35);
    }
    if (objc_msgSend_containsValueForKey_(a3, v31, (uint64_t)CFSTR("backgroundColor"), v32))
    {
      v36 = objc_opt_class();
      v38 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v37, v36, (uint64_t)CFSTR("backgroundColor"));
      objc_msgSend_setBackgroundColor_(v8, v39, v38, v40);
    }
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t isJitteringEnabled;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t isTemporalAntialiasingEnabled;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)VFXView;
  -[VFXView encodeWithCoder:](&v30, sel_encodeWithCoder_);
  v8 = objc_msgSend_autoenablesDefaultLighting(self, v5, v6, v7);
  objc_msgSend_encodeBool_forKey_(a3, v9, v8, (uint64_t)CFSTR("autoenablesDefaultLighting"));
  isJitteringEnabled = objc_msgSend_isJitteringEnabled(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(a3, v14, isJitteringEnabled, (uint64_t)CFSTR("jitteringEnabled"));
  isTemporalAntialiasingEnabled = objc_msgSend_isTemporalAntialiasingEnabled(self, v15, v16, v17);
  objc_msgSend_encodeBool_forKey_(a3, v19, isTemporalAntialiasingEnabled, (uint64_t)CFSTR("temporalAntialiasingEnabled"));
  v23 = objc_msgSend_allowsCameraControl(self, v20, v21, v22);
  objc_msgSend_encodeBool_forKey_(a3, v24, v23, (uint64_t)CFSTR("allowsCameraControl"));
  v28 = objc_msgSend_backgroundColor(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(a3, v29, v28, (uint64_t)CFSTR("backgroundColor"));
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  objc_super v25;

  *((_BYTE *)self + 432) |= 0x20u;
  *((_BYTE *)self + 432) |= 0x80u;
  objc_msgSend__flushDisplayLink(self, a2, v2, v3);
  objc_msgSend_vfx_setGestureRecognizers_(self, v5, 0, v6);
  if ((VFXView *)qword_1ED4BFF38 == self)
    qword_1ED4BFF38 = 0;
  objc_msgSend_invalidateDisplayLink(self, v7, v8, v9);
  objc_msgSend_delegateWillDie(self->_jitterer, v10, v11, v12);

  v16 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v13, v14, v15);
  objc_msgSend_removeObserver_(v16, v17, (uint64_t)self, v18);

  objc_msgSend_worldWillChange(self->_navigationCameraController, v19, v20, v21);
  objc_msgSend_setDelegate_(self->_navigationCameraController, v22, 0, v23);

  objc_msgSend_removeObserver_forKeyPath_(self->_world, v24, (uint64_t)self, (uint64_t)CFSTR("background.contents"));
  v25.receiver = self;
  v25.super_class = (Class)VFXView;
  -[VFXView dealloc](&v25, sel_dealloc);
}

- (id)_legacyView
{
  return self->_legacyView;
}

- (void)set_legacyView:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  self->_legacyView = (_TtC3VFX13VFXViewLegacy *)a3;
  objc_msgSend_delegateWillDie(self->_jitterer, v5, v6, v7);

  self->_jitterer = 0;
  v11 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v8, v9, v10);
  objc_msgSend_removeObserver_(v11, v12, (uint64_t)self, v13);

  self->_backgroundColor = 0;
  self->_backingLayer = 0;

  self->_navigationCameraController = 0;
  objc_msgSend_invalidateDisplayLink(self, v14, v15, v16);
}

- (void)setHidden:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setHidden_(self->_legacyView, a2, a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXView;
  -[VFXView setHidden:](&v6, sel_setHidden_, v4);
  self->_isHidden = v4;
}

- (void)setWorld:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  VFXWorld *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  VFXRenderer *renderer;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[5];

  if (self->_world != a3)
  {
    objc_msgSend_lock(self, a2, (uint64_t)a3, v3);
    v9 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v6, v7, v8);
    objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, (uint64_t)CFSTR("kCFXWorldDidUpdateNotification"), 0);
    objc_msgSend_removeObserver_forKeyPath_(self->_world, v11, (uint64_t)self, (uint64_t)CFSTR("background.contents"));
    objc_msgSend_worldWillChange(self->_navigationCameraController, v12, v13, v14);

    v15 = (VFXWorld *)a3;
    self->_world = v15;
    if (v15)
    {
      v19 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v16, v17, v18);
      v23 = objc_msgSend_worldRef(self->_world, v20, v21, v22);
      objc_msgSend_addObserver_selector_name_object_(v19, v24, (uint64_t)self, (uint64_t)sel__worldDidUpdate_, CFSTR("kCFXWorldDidUpdateNotification"), v23);
      objc_msgSend_addObserver_forKeyPath_options_context_(self->_world, v25, (uint64_t)self, (uint64_t)CFSTR("background.contents"), 0, CFSTR("kVFXViewObservingContext"));
    }
    renderer = self->_renderer;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = sub_1B18AAAF4;
    v39[3] = &unk_1E63D6D80;
    v39[4] = self;
    objc_msgSend_setWorld_completionHandler_(renderer, v16, (uint64_t)a3, (uint64_t)v39);
    objc_msgSend_worldDidChange(self->_navigationCameraController, v27, v28, v29);
    objc_msgSend_startRuntimeThread(self->_world, v30, v31, v32);
    objc_msgSend_unlock(self, v33, v34, v35);
    objc_msgSend__updateOpacity(self, v36, v37, v38);
  }
}

- (VFXWorld)world
{
  return self->_world;
}

- (BOOL)skipFramesIfNoDrawableAvailable
{
  return self->_skipFramesIfNoDrawableAvailable;
}

- (void)setSkipFramesIfNoDrawableAvailable:(BOOL)a3
{
  self->_skipFramesIfNoDrawableAvailable = a3;
}

- (void)set_superSamplingFactor:(float)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_set_superSamplingFactor_(self->_renderer, a2, v3, v4);
}

- (float)_superSamplingFactor
{
  uint64_t v2;
  uint64_t v3;
  float result;

  objc_msgSend__superSamplingFactor(self->_renderer, a2, v2, v3);
  return result;
}

- (uint64_t)set_screenTransform:(uint64_t)a3
{
  return objc_msgSend_set_screenTransform_(*(void **)(a1 + 448), a2, a3, a4);
}

- (uint64_t)_screenTransform
{
  return objc_msgSend__screenTransform(*(void **)(a1 + 448), a2, a3, a4);
}

- (void)setRenderMode:(unint64_t)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_setRenderMode_(self->_renderer, a2, a3, v3);
  objc_msgSend__setNeedsDisplay(self, v5, v6, v7);
}

- (unint64_t)renderMode
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel_renderMode);
}

- (void)setRendererKind:(unint64_t)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_setRendererKind_(self->_renderer, a2, a3, v3);
  objc_msgSend__setNeedsDisplay(self, v5, v6, v7);
}

- (unint64_t)rendererKind
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel_rendererKind);
}

- (BOOL)isEmulatingStereo
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel_isEmulatingStereo);
}

- (void)setEmulateStereo:(BOOL)a3
{
  ((void (*)(VFXRenderer *, char *, BOOL))MEMORY[0x1E0DE7D20])(self->_renderer, sel_setEmulateStereo_, a3);
}

- (id)renderer
{
  return self->_renderer;
}

- (id)vfx_backingLayer
{
  return self->_backingLayer;
}

- (void)vfx_setBackingLayer:(id)a3
{
  CALayer *backingLayer;

  backingLayer = self->_backingLayer;
  if (backingLayer != a3)
  {

    self->_backingLayer = (CALayer *)a3;
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

- (BOOL)isJitteringEnabled
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_isEnabled(self->_jitterer, a2, v2, v3);
}

- (void)setJitteringEnabled:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend_setEnabled_(self->_jitterer, a2, a3, v3);
  objc_msgSend_setJitteringEnabled_(self->_renderer, v6, v4, v7);
  objc_msgSend__setNeedsDisplay(self, v8, v9, v10);
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

- (void)_jitterRedisplay
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__presentFramebuffer(self->_renderer, a2, v2, v3);
}

- (BOOL)_supportsJitteringSyncRedraw
{
  return self->_backingLayer == 0;
}

- (BOOL)_canJitter
{
  uint64_t v2;
  uint64_t v3;
  __n128 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;

  v4 = (__n128 *)objc_msgSend__engineContext(self->_renderer, a2, v2, v3);
  if (v4)
  {
    v5 = (uint64_t)v4;
    v13 = sub_1B1815A98(v4);
    v13.n128_u64[0] = (unint64_t)vmvn_s8((int8x8_t)vclez_f32((float32x2_t)vrev64_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v13, (int8x16_t)v13, 8uLL))));
    if ((v13.n128_u32[1] & v13.n128_u32[0] & 1) != 0)
    {
      sub_1B1813BC4(v5, v6, v7, v8, v9, v10, v11, v12);
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (BOOL)vfx_inLiveResize
{
  return 0;
}

- (void)updateLayerLatency
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CALayer *backingLayer;
  const char *v9;
  uint64_t v10;

  v7 = objc_msgSend_lowLatency(self, a2, v2, v3);
  backingLayer = self->_backingLayer;
  if ((_DWORD)v7)
    objc_msgSend_setMaximumDrawableCount_(backingLayer, v5, 2, v6);
  else
    objc_msgSend_setMaximumDrawableCount_(backingLayer, v5, 3, v6);
  objc_msgSend_setLowLatency_(backingLayer, v9, v7, v10);
}

- (BOOL)lowLatency
{
  return self->_lowLatency;
}

- (void)setLowLatency:(BOOL)a3
{
  uint64_t v3;

  if (self->_legacyView)
  {
    self->_lowLatency = a3;
    objc_msgSend_setLowLatency_(self->_legacyView, a2, a3, v3);
  }
  else if (self->_lowLatency != a3)
  {
    self->_lowLatency = a3;
    ((void (*)(VFXView *, char *, BOOL))MEMORY[0x1E0DE7D20])(self, sel_updateLayerLatency, a3);
  }
}

+ (BOOL)usesSeparateWorkGroup
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], a2, v2, v3);
  return objc_msgSend_BOOLForKey_(v4, v5, (uint64_t)CFSTR("com.apple.vfx.forceSeparateWorkGroup"), v6);
}

- (id)_renderingQueue
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend__renderingQueue(self->_renderer, a2, v2, v3);
}

- (void)VFX_displayLinkCallback:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v31;
  CALayer *backingLayer;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  _QWORD v39[6];

  v7 = (void *)objc_msgSend_world(self, a2, v3, v4);
  v11 = objc_msgSend_worldRef(v7, v8, v9, v10);
  if (v11)
  {
    v19 = (void *)sub_1B187A9C4(v11, (uint64_t)v12, v13, v14, v15, v16, v17, v18);
    if (v19)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[2] = sub_1B18AAFB4;
      v39[3] = &unk_1E63D83E0;
      v23 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69 * (_QWORD)self) ^ ((0x9DDFEA08EB382D69 * (unint64_t)self) >> 47));
      v39[1] = 3221225472;
      v39[4] = self;
      *(double *)&v39[5] = a3;
      objc_msgSend_triggerRenderWith_renderer_(v19, v20, (uint64_t)v39, 0x9DDFEA08EB382D69 * (v23 ^ (v23 >> 47)));
    }
    else
    {
      objc_msgSend__drawAtTime_(self, v20, v21, v22, a3);
    }
  }
  else
  {
    objc_msgSend__backingSize(self->_renderer, v12, v13, v14);
    v29 = v28;
    if (v28 >= 1.0 && v27 >= 1.0)
    {
      v31 = v27;
      backingLayer = self->_backingLayer;
      objc_msgSend_drawableSize(backingLayer, v24, v25, v26);
      if (v29 != v36 || v31 != v37)
        objc_msgSend_setDrawableSize_(backingLayer, v33, v34, v35, v29, v31);
      objc_msgSend__clearBackBuffer(self->_renderer, v33, v34, v35);
    }
  }
}

- (void)updateAtTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_updateAtTime_(self->_renderer, a2, v3, v4, a3);
}

- (void)_updateContentsScaleFactor
{
  uint64_t v2;
  uint64_t v3;
  double v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_contentScaleFactor(self, a2, v2, v3);
  *(float *)&v5 = v5;
  objc_msgSend__setContentsScaleFactor_(self->_renderer, v6, v7, v8, v5);
}

- (CGSize)backingSizeForBoundSize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  double height;
  double width;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend_contentScaleFactor(self, a2, v3, v4);
  v9 = width * v8;
  objc_msgSend_contentScaleFactor(self, v10, v11, v12);
  v14 = height * v13;
  v15 = v9;
  result.height = v14;
  result.width = v15;
  return result;
}

- (CGSize)_updateBackingSize
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  float64x2_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  float64_t v30;
  float64_t v31;
  CGSize result;

  objc_msgSend_lock(self, a2, v2, v3);
  objc_msgSend__updateContentsScaleFactor(self, v5, v6, v7);
  objc_msgSend_bounds(self, v8, v9, v10);
  self->_boundsSize.width = v11;
  self->_boundsSize.height = v12;
  objc_msgSend_backingSizeForBoundSize_(self, v13, v14, v15, v11, v12);
  v30 = v16;
  v31 = v17;
  objc_msgSend__setBackingSize_(self->_renderer, v18, v19, v20);
  v21.f64[0] = v30;
  v21.f64[1] = v31;
  objc_msgSend_set_viewport_(self->_renderer, v22, v23, v24, *(double *)vcvt_hight_f32_f64(0, v21).i64);
  objc_msgSend_unlock(self, v25, v26, v27);
  v28 = v30;
  v29 = v31;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)_drawAtTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  VFXEventHandler *navigationCameraController;
  CFTimeInterval v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  CALayer *backingLayer;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  os_signpost_id_t v77;
  NSObject *v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  CFTimeInterval v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  NSObject *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  double v102;
  double v103;
  const char *v104;
  uint64_t v105;
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
  double v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint8_t v120[16];
  uint8_t buf[16];

  if (!self->_legacyView)
  {
    if (*((char *)self + 432) < 0 || (*((_BYTE *)self + 432) & 0x20) != 0)
    {
      if ((*((_BYTE *)self + 432) & 0x40) == 0)
        return;
      *((_BYTE *)self + 432) &= ~0x40u;
    }
    if (!self->_skipFramesIfNoDrawableAvailable && !objc_msgSend_lowLatency(self, a2, v3, v4)
      || objc_msgSend_isDrawableAvailable(self->_backingLayer, a2, v3, v4))
    {
      self->_didTriggerRedrawWhileRendering = 0;
      objc_msgSend_stopIfNeeded(self->_jitterer, a2, v3, v4);
      objc_msgSend__displayLinkStatsTick(self->_renderer, v7, v8, v9);
      objc_msgSend_lock(self, v10, v11, v12);
      objc_msgSend__backingSize(self->_renderer, v13, v14, v15);
      if (v19 == 0.0 || (v21 = v20, v20 == 0.0))
      {
        objc_msgSend_unlock(self, v16, v17, v18);
      }
      else
      {
        v22 = v19;
        navigationCameraController = self->_navigationCameraController;
        v24 = CACurrentMediaTime();
        objc_msgSend_viewWillDrawAtTime_(navigationCameraController, v25, v26, v27, v24);
        v31 = objc_msgSend_lock(self->_renderer, v28, v29, v30);
        v32 = (void *)MEMORY[0x1B5E23520](v31);
        backingLayer = self->_backingLayer;
        objc_msgSend_drawableSize(backingLayer, v34, v35, v36);
        if (v22 != v41 || v21 != v40)
        {
          v43 = objc_msgSend__engineContext(self->_renderer, v37, v38, v39);
          v47 = sub_1B1815BE8(v43, v44, v45, v46);
          prof_beginFlameSmallData((uint64_t)"Set drawableSize", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/Views/VFXView.m", 1175, v47 | 0x300000000);
          objc_msgSend_setDrawableSize_(backingLayer, v48, v49, v50, v22, v21);
          prof_endFlame();
        }
        objc_msgSend_lock(self->_world, v37, v38, v39);
        v54 = objc_msgSend_worldRef(self->_world, v51, v52, v53);
        v62 = sub_1B187AA20(v54, v55, v56, v57, v58, v59, v60, v61);
        if (v62)
        {
          v66 = (void *)sub_1B181FEE0(v62);
          v70 = objc_msgSend__engineContext(self->_renderer, v67, v68, v69);
          objc_msgSend_beginTransaction_(v66, v71, v70, v72);
        }
        else
        {
          v66 = 0;
        }
        objc_msgSend__beginFrame(self->_renderer, v63, v64, v65);
        v76 = objc_msgSend__engineContext(self->_renderer, v73, v74, v75);
        v77 = sub_1B18137DC(v76);
        v78 = sub_1B17C439C();
        if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v79 = v78;
          if (os_signpost_enabled(v78))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B178D000, v79, OS_SIGNPOST_INTERVAL_BEGIN, v77, "RenderFrame (View)", ", buf, 2u);
          }
        }
        v83 = CACurrentMediaTime();
        if (a3 != 0.0)
          v83 = a3;
        self->_currentSystemTime = v83;
        objc_msgSend_updateAtTime_(self->_renderer, v80, v81, v82);
        objc_msgSend__render(self->_renderer, v84, v85, v86);
        objc_msgSend__presentFramebuffer(self->_renderer, v87, v88, v89);
        objc_msgSend_endTransaction(v66, v90, v91, v92);
        objc_msgSend_unlock(self->_world, v93, v94, v95);
        v96 = sub_1B17C439C();
        if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v97 = v96;
          if (os_signpost_enabled(v96))
          {
            *(_WORD *)v120 = 0;
            _os_signpost_emit_with_name_impl(&dword_1B178D000, v97, OS_SIGNPOST_INTERVAL_END, v77, "RenderFrame (View)", ", v120, 2u);
          }
        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend_nextFrameTime(self->_renderer, v98, v99, v100);
        v102 = v101;
        v103 = CACurrentMediaTime();
        objc_msgSend_unlock(self->_renderer, v104, v105, v106);
        objc_msgSend_viewDidDrawAtTime_(self->_navigationCameraController, v107, v108, v109, self->_currentSystemTime);
        if (objc_msgSend__checkAndUpdateDisplayLinkStateIfNeeded(self, v110, v111, v112))
        {
          v116 = v102 - v103;
          if (v102 - v103 > 2.0)
            objc_msgSend_restart(self->_jitterer, v113, v114, v115, v116);
        }
        objc_msgSend_unlock(self, v113, v114, v115, v116);
        objc_msgSend__displayLinkStatsTack(self->_renderer, v117, v118, v119);
      }
    }
  }
}

- (void)layoutSubviews
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VFXView;
  -[VFXView layoutSubviews](&v9, sel_layoutSubviews);
  objc_msgSend__updateBackingSize(self, v3, v4, v5);
  objc_msgSend__setNeedsDisplay(self, v6, v7, v8);
}

- (void)setPointOfView:(id)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a4;
  objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, a4);
  if (v4)
    objc_msgSend_setAnimationDuration_(VFXTransaction, v7, v8, v9, 0.75);
  else
    objc_msgSend_setAnimationDuration_(VFXTransaction, v7, v8, v9, 0.0);
  objc_msgSend_setPointOfView_(self, v10, (uint64_t)a3, v11);
  objc_msgSend_commit(VFXTransaction, v12, v13, v14);
}

- (void)setPointOfView:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  if ((id)objc_msgSend_pointOfView(self, a2, (uint64_t)a3, v3) != a3)
  {
    objc_msgSend_cameraWillChange(self->_navigationCameraController, v6, v7, v8);
    objc_msgSend_setPointOfView_(self->_renderer, v9, (uint64_t)a3, v10);
    objc_msgSend_cameraDidChange(self->_navigationCameraController, v11, v12, v13);
  }
}

- (VFXNode)pointOfView
{
  uint64_t v2;
  uint64_t v3;

  return (VFXNode *)objc_msgSend_pointOfView(self->_renderer, a2, v2, v3);
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

- (void)setPointOfCulling:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  if ((id)objc_msgSend_pointOfCulling(self, a2, (uint64_t)a3, v3) != a3)
    objc_msgSend_setPointOfCulling_(self->_renderer, v6, (uint64_t)a3, v7);
}

- (id)pointOfCulling
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_pointOfCulling(self->_renderer, a2, v2, v3);
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

- (void)setAllowsCameraControl:(BOOL)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = sub_1B17C46BC(1) | a3;
  if ((_DWORD)v4 != objc_msgSend_enabled(self->_navigationCameraController, v5, v6, v7))
    objc_msgSend_setEnabled_(self->_navigationCameraController, v8, v4, v9);
}

- (BOOL)allowsCameraControl
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_enabled(self->_navigationCameraController, a2, v2, v3);
}

- (VFXCameraController)defaultCameraController
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_navigationCameraController(self, a2, v2, v3);
  return (VFXCameraController *)objc_msgSend_cameraController(v4, v5, v6, v7);
}

- (BOOL)wantsExtendedDynamicRange
{
  return (*((unsigned __int8 *)self + 432) >> 2) & 1;
}

- (void)setWantsExtendedDynamicRange:(BOOL)a3
{
  uint64_t v3;
  char v4;
  char v5;

  v4 = *((_BYTE *)self + 432);
  if (((((v4 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 4;
    else
      v5 = 0;
    *((_BYTE *)self + 432) = v4 & 0xFB | v5;
    *((_BYTE *)self + 433) &= ~0x20u;
    *((_BYTE *)self + 433) &= ~0x10u;
    objc_msgSend__adjustBackingLayerPixelFormat(self, a2, a3, v3);
  }
}

- (BOOL)wantsHDR
{
  return (*((unsigned __int8 *)self + 432) >> 2) & 1;
}

- (void)setWantsHDR:(BOOL)a3
{
  ((void (*)(VFXView *, char *, BOOL))MEMORY[0x1E0DE7D20])(self, sel_setWantsExtendedDynamicRange_, a3);
}

- (BOOL)rendersContinuously
{
  return (*((unsigned __int8 *)self + 432) >> 1) & 1;
}

- (void)setRendersContinuously:(BOOL)a3
{
  uint64_t v3;
  char v4;
  char v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;

  v4 = *((_BYTE *)self + 432);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v6 = 2;
    else
      v6 = 0;
    *((_BYTE *)self + 432) = v4 & 0xFD | v6;
    objc_msgSend_setRendersContinuously_(self->_renderer, a2, a3, v3);
    if ((*((_BYTE *)self + 432) & 2) != 0)
    {
      v14 = (void *)objc_msgSend_displayLink(self, v7, v8, v9);
      objc_msgSend_setPaused_(v14, v15, 0, v16);
    }
    else
    {
      objc_msgSend_nextFrameTime(self->_renderer, v7, v8, v9);
      if (v13 - CACurrentMediaTime() > 2.0)
        objc_msgSend_restart(self->_jitterer, v10, v11, v12);
    }
  }
}

- (float)_flipY:(float)a3
{
  return self->_boundsSize.height - a3;
}

- (double)_viewport
{
  double result;

  *(_QWORD *)&result = vcvt_hight_f32_f64(0, *(float64x2_t *)(a1 + 536)).u64[0];
  return result;
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  uint64_t v4;
  float y;
  uint64_t v8;

  y = a3.y;
  objc_msgSend__flipY_(self, a2, (uint64_t)a4, v4, a3.x);
  return (id)MEMORY[0x1E0DE7D20](self->_renderer, sel__hitTest_viewport_options_, a4, v8);
}

- (id)hitTestWithSegmentFromPoint:(VFXView *)self toPoint:(SEL)a2 options:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_hitTestWithSegmentFromPoint_toPoint_options_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  VFXRenderer *renderer;

  renderer = self->_renderer;
  objc_msgSend__viewport(self, a2, (uint64_t)a3, (uint64_t)a4);
  return MEMORY[0x1E0DE7D20](renderer, sel__isNodeInsideFrustum_withPointOfView_viewport_, a3, a4);
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  uint64_t v3;
  VFXRenderer *renderer;
  uint64_t v6;

  renderer = self->_renderer;
  objc_msgSend__viewport(self, a2, (uint64_t)a3, v3);
  return (id)MEMORY[0x1E0DE7D20](renderer, sel__nodesInsideFrustumWithPointOfView_viewport_, a3, v6);
}

- (double)projectPoint:(uint64_t)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  int v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;

  v6 = (void *)a1[56];
  objc_msgSend__viewport(a1, a2, a3, a4);
  objc_msgSend__projectPoint_viewport_(v6, v7, v8, v9, a5, v10);
  LODWORD(a5) = v11;
  LODWORD(v12) = HIDWORD(v12);
  objc_msgSend__flipY_(a1, v13, v14, v15, v12);
  return COERCE_DOUBLE(__PAIR64__(v16, LODWORD(a5)));
}

- (uint64_t)unprojectPoint:(uint64_t)a3
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  LODWORD(a5) = HIDWORD(a5);
  objc_msgSend__flipY_(a1, a2, a3, a4, a5);
  v6 = a1[56];
  objc_msgSend__viewport(a1, v7, v8, v9);
  return MEMORY[0x1E0DE7D20](v6, sel__unprojectPoint_viewport_, v10, v11);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  if (a6 == CFSTR("kVFXViewObservingContext"))
  {
    if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("background.contents"), (uint64_t)a4, a5))
      objc_msgSend__updateOpacity(self, v7, v8, v9);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VFXView;
    -[VFXView observeValueForKeyPath:ofObject:change:context:](&v10, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

+ (id)_kvoKeysForwardedToRenderer
{
  uint64_t v2;

  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("pointOfView"), v2, CFSTR("loops"), CFSTR("autoenablesDefaultLighting"), CFSTR("jitteringEnabled"), CFSTR("temporalAntialiasingEnabled"), CFSTR("renderGraph"), 0);
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
  v22.super_class = (Class)&OBJC_METACLASS___VFXView;
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
  v10.super_class = (Class)&OBJC_METACLASS___VFXView;
  return objc_msgSendSuper2(&v10, sel_automaticallyNotifiesObserversForKey_, a3);
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

- (void)setEventHandler:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_setNavigationCameraController_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setView_(a3, v6, (uint64_t)self, v7);
  objc_msgSend_setAllowsCameraControl_(self, v8, 1, v9);
}

- (id)eventHandler
{
  return self->_navigationCameraController;
}

- (id)navigationCameraController
{
  return self->_navigationCameraController;
}

- (void)setNavigationCameraController:(id)a3
{
  uint64_t v3;
  VFXEventHandler *navigationCameraController;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  navigationCameraController = self->_navigationCameraController;
  if (navigationCameraController != a3)
  {
    objc_msgSend_setDelegate_(navigationCameraController, a2, 0, v3);

    self->_navigationCameraController = (VFXEventHandler *)a3;
    v10 = (void *)objc_msgSend_navigationCameraController(self, v7, v8, v9);
    objc_msgSend_setDelegate_(v10, v11, (uint64_t)self, v12);
    MEMORY[0x1E0DE7D20](self, sel_vfx_updateGestureRecognizers, v13, v14);
  }
}

- (void)eventHandlerWantsRedraw
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend_displayLink(self, a2, v2, v3);
  objc_msgSend_setPaused_(v4, v5, 0, v6);
}

- (id)_defaultBackgroundColor
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_blackColor(MEMORY[0x1E0DC3658], a2, v2, v3);
}

- (void)_backgroundDidChange
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend__updateOpacity(self, a2, v2, v3);
  objc_msgSend__adjustBackingLayerPixelFormat(self, v5, v6, v7);
}

- (void)_updateOpacity
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  char v20;
  _BOOL8 v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  char v28;

  v5 = (void *)objc_msgSend_background(self->_world, a2, v2, v3);
  v9 = (const void *)objc_msgSend_contents(v5, v6, v7, v8);
  v10 = (void *)sub_1B18831BC(v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !v10)
  {
    v10 = (void *)objc_msgSend_backgroundColor(self, v11, v12, v13);
    if (!v10)
      v10 = (void *)objc_msgSend__defaultBackgroundColor(self, v11, v14, v15);
  }
  v28 = 0;
  objc_msgSend_vfx_CFXColorIgnoringColorSpace_success_(v10, v11, 0, (uint64_t)&v28);
  LODWORD(v19) = HIDWORD(v16);
  v20 = *((_BYTE *)self + 432);
  v22 = *((float *)&v16 + 1) == 1.0 || v28 == 0;
  *((_BYTE *)self + 432) = v20 & 0xFE | v22;
  if (((v20 & 1) == 0) == v22)
  {
    v23 = (void *)objc_msgSend_layer(self, v16, v17, v18, v19);
    objc_msgSend_setOpaque_(v23, v24, v22, v25);
    objc_msgSend_setOpaque_(self, v26, *((_BYTE *)self + 432) & 1, v27);
  }
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v3;
  void *v4;
  _TtC3VFX13VFXViewLegacy *legacyView;
  UIColor *backgroundColor;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  objc_super v25;

  v4 = a3;
  legacyView = self->_legacyView;
  if (legacyView)
  {
    objc_msgSend_setBackgroundColor_(legacyView, a2, (uint64_t)a3, v3);
  }
  else
  {
    backgroundColor = self->_backgroundColor;
    if (backgroundColor != a3)
    {

      self->_backgroundColor = (UIColor *)v4;
    }
    if (!v4)
      v4 = (void *)objc_msgSend__defaultBackgroundColor(self, a2, (uint64_t)a3, v3);
    v25.receiver = self;
    v25.super_class = (Class)VFXView;
    -[VFXView setBackgroundColor:](&v25, sel_setBackgroundColor_, v4);
    v11 = objc_msgSend_traitCollection(self, v8, v9, v10);
    v15 = (void *)objc_msgSend_world(self, v12, v13, v14);
    v19 = objc_msgSend_worldRef(v15, v16, v17, v18);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1B18ABF3C;
    v24[3] = &unk_1E63D5350;
    v24[4] = v11;
    v24[5] = self;
    v24[6] = v4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v20, v19, 0, v24);
    objc_msgSend__backgroundDidChange(self, v21, v22, v23);
  }
}

- (id)backgroundColor
{
  return self->_backgroundColor;
}

- (void)traitCollectionDidChange:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  _QWORD v20[6];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VFXView;
  -[VFXView traitCollectionDidChange:](&v21, sel_traitCollectionDidChange_);
  v8 = (void *)objc_msgSend_traitCollection(self, v5, v6, v7);
  if (objc_msgSend_hasDifferentColorAppearanceComparedToTraitCollection_(v8, v9, (uint64_t)a3, v10))
  {
    v14 = (void *)objc_msgSend_world(self, v11, v12, v13);
    v18 = objc_msgSend_worldRef(v14, v15, v16, v17);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B18AC080;
    v20[3] = &unk_1E63D53C8;
    v20[4] = v8;
    v20[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v19, v18, 0, v20);
  }
}

- (BOOL)isOpaque
{
  return *((_BYTE *)self + 432) & 1;
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
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_setAutoenablesDefaultLighting_(self->_renderer, a2, a3, v3);
  objc_msgSend__setNeedsDisplay(self, v5, v6, v7);
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

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  return objc_msgSend_prepareObject_shouldAbortBlock_(self->_renderer, a2, (uint64_t)a3, (uint64_t)a4);
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
  MEMORY[0x1E0DE7D20](self->_renderer, sel_prepareObjects_withCompletionHandler_, a3, a4);
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

- (id)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  VFXDisplayLink *displayLink;

  displayLink = self->_displayLink;
  if (displayLink != a3)
  {

    self->_displayLink = (VFXDisplayLink *)a3;
  }
}

- (void)invalidateDisplayLink
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_invalidate(self->_displayLink, a2, v2, v3);

  self->_displayLink = 0;
}

- (double)_renderThreadPriority
{
  return 0.0;
}

+ (BOOL)displayLinkCallbackShouldReturnImmediately
{
  return 1;
}

+ (BOOL)displayLinkPolicy
{
  return ((uint64_t (*)(id, char *))MEMORY[0x1E0DE7D20])(a1, sel_displayLinkCallbackShouldReturnImmediately);
}

- (void)_createDisplayLinkIfNeeded
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  id location;

  if (!self->_legacyView && !self->_displayLink && !self->_displayLinkCreationRequested)
  {
    if (self->_renderer)
    {
      self->_displayLinkCreationRequested = 1;
      objc_initWeak(&location, self);
      v6 = (void *)objc_msgSend_window(self, v3, v4, v5);
      v10 = objc_msgSend_screen(v6, v7, v8, v9);
      v11 = (void *)objc_opt_class();
      v15 = objc_msgSend_displayLinkPolicy(v11, v12, v13, v14);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = sub_1B18AC424;
      v17[3] = &unk_1E63D8430;
      objc_copyWeak(&v18, &location);
      objc_msgSend__initializeDisplayLinkWithScreen_policy_completionHandler_(self, v16, v10, v15, v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)_checkAndUpdateDisplayLinkStateIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  VFXDisplayLink *displayLink;
  uint64_t v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  displayLink = self->_displayLink;
  if (!displayLink)
    return 0;
  if ((*((_BYTE *)self + 432) & 2) != 0 || self->_didTriggerRedrawWhileRendering)
  {
    v6 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend_eventHandler(self, a2, v2, v3);
    v6 = objc_msgSend_wantsRedraw(v8, v9, v10, v11) ^ 1;
    displayLink = self->_displayLink;
  }
  objc_msgSend_nextFrameTime(self->_renderer, a2, v2, v3);
  return MEMORY[0x1E0DE7D20](displayLink, sel_setPaused_nextFrameTimeHint_lastUpdate_, v6, v12);
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
  void *legacyView;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  legacyView = self->_legacyView;
  if (!legacyView)
  {
    v7 = (void *)objc_msgSend_displayLink(self, a2, a3, v3);
    if (v7)
    {
      *(float *)&v11 = (float)a3;
      objc_msgSend_setPreferredFrameRate_(v7, v8, v9, v10, v11);
    }
    self->_preferredFramePerSeconds = a3;
    v12 = (void *)objc_msgSend_renderer(self, v8, v9, v10);
    legacyView = (void *)objc_msgSend__renderContextMetal(v12, v13, v14, v15);
  }
  objc_msgSend_setPreferredFramesPerSecond_(legacyView, a2, a3, v3);
}

- (void)_setNeedsDisplay
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  VFXDisplayLink *displayLink;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD block[5];

  v5 = (void *)objc_msgSend_currentThread(MEMORY[0x1E0CB3978], a2, v2, v3);
  if ((objc_msgSend_isMainThread(v5, v6, v7, v8) & 1) != 0)
  {
    if ((*((_BYTE *)self + 432) & 0x20) == 0)
    {
      objc_msgSend_stopIfNeeded(self->_jitterer, v9, v10, v11);
      self->_didTriggerRedrawWhileRendering = 1;
      displayLink = self->_displayLink;
      if (displayLink)
      {
        if (objc_msgSend_isPaused(displayLink, v12, v13, v14))
          objc_msgSend_setNeedsDisplay(self->_displayLink, v16, v17, v18);
      }
      else
      {
        objc_msgSend__createDisplayLinkIfNeeded(self, v12, v13, v14);
      }
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B18AC734;
    block[3] = &unk_1E63D6D80;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
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
  objc_msgSend__setNeedsDisplay(self, v4, v5, v6);
}

- (void)setShowsStatistics:(BOOL)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_1B17C46BC(0) | a3;
  objc_msgSend_lock(self->_renderer, v5, v6, v7);
  objc_msgSend_setShowsStatistics_(self->_renderer, v8, v4, v9);
  objc_msgSend_unlock(self->_renderer, v10, v11, v12);
  objc_msgSend__setNeedsDisplay(self, v13, v14, v15);
}

- (BOOL)showsStatistics
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_showsStatistics(self->_renderer, a2, v2, v3);
}

- (BOOL)showsDebugUI
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_showsDebugUI(self->_renderer, a2, v2, v3);
}

- (unint64_t)debugUIOptions
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_debugUIOptions(self->_renderer, a2, v2, v3);
}

- (void)setDebugUIOptions:(unint64_t)a3
{
  ((void (*)(VFXRenderer *, char *, unint64_t))MEMORY[0x1E0DE7D20])(self->_renderer, sel_setDebugUIOptions_, a3);
}

- (id)snapshot
{
  uint64_t v2;
  uint64_t v3;
  double width;
  double height;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  width = self->_boundsSize.width;
  height = self->_boundsSize.height;
  objc_msgSend_contentScaleFactor(self, a2, v2, v3);
  v8 = width * v7;
  objc_msgSend_contentScaleFactor(self, v9, v10, v11);
  return (id)objc_msgSend_snapshotWithSize_(self->_renderer, v13, v14, v15, v8, height * v12);
}

- (void)lock
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_lock(self->_lock, a2, v2, v3);
}

- (void)unlock
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_unlock(self->_lock, a2, v2, v3);
}

- (CGColorSpace)workingColorSpace
{
  return (CGColorSpace *)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel_workingColorSpace);
}

- (void)__CFObject
{
  return 0;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  NSString *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  CGRect v20;

  objc_msgSend_frame(self, a2, v2, v3);
  v5 = NSStringFromCGRect(v20);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v12 = objc_msgSend_world(self, v9, v10, v11);
  v16 = objc_msgSend_pointOfView(self, v13, v14, v15);
  return (NSString *)objc_msgSend_stringWithFormat_(v6, v17, (uint64_t)CFSTR("<%@: %p | world=%@ frame=%@ pointOfView=%@>"), v18, v8, self, v12, v5, v16);
}

- (BOOL)_isEditor
{
  return 0;
}

- (void)switchToCameraNamed:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = (void *)objc_msgSend_world(self, a2, (uint64_t)a3, v3);
  v10 = (void *)objc_msgSend_rootNode(v6, v7, v8, v9);
  v12 = objc_msgSend_childNodeWithName_recursively_(v10, v11, (uint64_t)a3, 1);
  if (v12)
    MEMORY[0x1E0DE7D20](self, sel_setPointOfView_animate_, v12, 1);
  else
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: switchToCameraNamed: no camera named %@"), v13, v14, v15, v16, v17, v18, (uint64_t)a3);
}

- (void)switchToNextCamera
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
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t Object;
  unint64_t v27;
  unint64_t v28;
  const char *v29;
  uint64_t v30;

  v5 = (void *)objc_msgSend_world(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_rootNode(v5, v6, v7, v8);
  v12 = (void *)objc_msgSend_childNodesPassingTest_(v9, v10, (uint64_t)&unk_1E63D0F10, v11);
  if (objc_msgSend_count(v12, v13, v14, v15))
  {
    v19 = objc_msgSend_pointOfView(self->_renderer, v16, v17, v18);
    v22 = objc_msgSend_indexOfObject_(v12, v20, v19, v21);
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      Object = objc_msgSend_firstObject(v12, v23, v24, v25);
    }
    else
    {
      v27 = v22 + 1;
      v28 = objc_msgSend_count(v12, v23, v24, v25);
      Object = objc_msgSend_objectAtIndex_(v12, v29, v27 % v28, v30);
    }
    MEMORY[0x1E0DE7D20](self, sel_setPointOfView_animate_, Object, 1);
  }
}

- (BOOL)_enableARMode
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel__enableARMode);
}

- (void)set_enableARMode:(BOOL)a3
{
  ((void (*)(VFXRenderer *, char *, BOOL))MEMORY[0x1E0DE7D20])(self->_renderer, sel_set_enableARMode_, a3);
}

- (BOOL)_shouldDelegateARCompositing
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel__enableARMode);
}

- (void)set_shouldDelegateARCompositing:(BOOL)a3
{
  ((void (*)(VFXRenderer *, char *, BOOL))MEMORY[0x1E0DE7D20])(self->_renderer, sel_set_shouldDelegateARCompositing_, a3);
}

- (void)_updateProbes:(id)a3 progress:(id)a4
{
  MEMORY[0x1E0DE7D20](self->_renderer, sel__updateProbes_progress_completionHandler_, a3, a4);
}

- (void)setDebugOptions:(unint64_t)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_setDebugOptions_(self->_renderer, a2, a3, v3);
  objc_msgSend__setNeedsDisplay(self, v5, v6, v7);
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
  objc_msgSend__setNeedsDisplay(self, v5, v6, v7);
}

- (float)_runFPSTestWithDuration:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7 = objc_msgSend__renderingQueue(self->_renderer, a2, v3, v4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B18ACC38;
  block[3] = &unk_1E63D8478;
  *(double *)&block[6] = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v7, block);
  LODWORD(a3) = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return *(float *)&a3;
}

- (void)_addGPUFrameScheduledHandler:(id)a3
{
  ((void (*)(VFXRenderer *, char *, id))MEMORY[0x1E0DE7D20])(self->_renderer, sel__addGPUFrameScheduledHandler_, a3);
}

- (void)_addGPUFrameCompletedHandler:(id)a3
{
  ((void (*)(VFXRenderer *, char *, id))MEMORY[0x1E0DE7D20])(self->_renderer, sel__addGPUFrameCompletedHandler_, a3);
}

- (void)_addGPUFramePresentedHandler:(id)a3
{
  ((void (*)(VFXRenderer *, char *, id))MEMORY[0x1E0DE7D20])(self->_renderer, sel__addGPUFramePresentedHandler_, a3);
}

- (double)contentScaleFactor
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXView;
  -[VFXView contentScaleFactor](&v3, sel_contentScaleFactor);
  return result;
}

- (void)setContentScaleFactor:(double)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXView;
  -[VFXView setContentScaleFactor:](&v10, sel_setContentScaleFactor_, a3);
  if (self->_renderer)
  {
    objc_msgSend__updateBackingSize(self, v4, v5, v6);
    objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
  }
}

- (void)_allowGPUBackgroundExecution
{
  ((void (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel__allowGPUBackgroundExecution);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setNeedsDisplay
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VFXView;
  -[VFXView setNeedsDisplay](&v6, sel_setNeedsDisplay);
  objc_msgSend__setNeedsDisplay(self, v3, v4, v5);
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  if ((*((_BYTE *)self + 432) & 8) == 0)
  {
    v6 = objc_msgSend__renderingQueue(self->_renderer, a2, v3, v4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B18ACE74;
    block[3] = &unk_1E63D6D80;
    block[4] = self;
    dispatch_sync(v6, block);
  }
}

- (BOOL)_controlsOwnScaleFactor
{
  return 1;
}

- (void)vfx_updateGestureRecognizers
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  VFXEventHandler *navigationCameraController;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v8 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
  navigationCameraController = self->_navigationCameraController;
  if (navigationCameraController)
  {
    v10 = objc_msgSend_gestureRecognizers(navigationCameraController, v5, v6, v7);
    objc_msgSend_addObjectsFromArray_(v8, v11, v10, v12);
  }
  objc_msgSend_vfx_setGestureRecognizers_(self, v5, (uint64_t)v8, v7);
}

- (void)vfx_setGestureRecognizers:(id)a3
{
  NSArray *controllerGestureRecognizers;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSArray *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  controllerGestureRecognizers = self->_controllerGestureRecognizers;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(controllerGestureRecognizers, a2, (uint64_t)&v24, (uint64_t)v29, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(controllerGestureRecognizers);
        objc_msgSend_removeGestureRecognizer_(self, v7, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), v8);
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(controllerGestureRecognizers, v7, (uint64_t)&v24, (uint64_t)v29, 16);
    }
    while (v9);
  }

  v12 = (NSArray *)a3;
  self->_controllerGestureRecognizers = v12;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v20, (uint64_t)v28, 16);
  if (v14)
  {
    v17 = v14;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v12);
        objc_msgSend_addGestureRecognizer_(self, v15, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), v16);
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v20, (uint64_t)v28, 16);
    }
    while (v17);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  objc_super v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  y = a3.y;
  x = a3.x;
  v72 = *MEMORY[0x1E0C80C00];
  if (sub_1B18A401C())
  {
    v10 = (void *)objc_msgSend_hitTest_options_(self, v8, 0, v9, x, y);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v67, (uint64_t)v71, 16);
    if (v12)
    {
      v16 = v12;
      v17 = *(_QWORD *)v68;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v68 != v17)
            objc_enumerationMutation(v10);
          v19 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          v20 = (void *)objc_msgSend_node(v19, v13, v14, v15);
          v24 = (void *)objc_msgSend_model(v20, v21, v22, v23);
          v28 = (void *)objc_msgSend_materials(v24, v25, v26, v27);
          if (objc_msgSend_count(v28, v29, v30, v31))
          {
            v35 = (void *)objc_msgSend_materials(v24, v32, v33, v34);
            v39 = objc_msgSend_geometryIndex(v19, v36, v37, v38);
            v43 = (void *)objc_msgSend_materials(v24, v40, v41, v42);
            v47 = objc_msgSend_count(v43, v44, v45, v46);
            v50 = (void *)objc_msgSend_objectAtIndexedSubscript_(v35, v48, v39 % v47, v49);
            v54 = (void *)objc_msgSend_diffuse(v50, v51, v52, v53);
          }
          else
          {
            v50 = 0;
            v54 = (void *)objc_msgSend_diffuse(0, v32, v33, v34);
          }
          objc_msgSend_contents(v54, v55, v56, v57);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            sub_1B184D554(self);
            v62 = (void *)objc_msgSend_diffuse(v50, v59, v60, v61);
            return (id)objc_msgSend_contents(v62, v63, v64, v65);
          }
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v67, (uint64_t)v71, 16);
        if (v16)
          continue;
        break;
      }
    }
  }
  v66.receiver = self;
  v66.super_class = (Class)VFXView;
  return -[VFXView hitTest:withEvent:](&v66, sel_hitTest_withEvent_, a4, x, y);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_showsStatistics(self, a2, (uint64_t)a3, (uint64_t)a4)
    || (v10 = (void *)objc_msgSend_anyObject(a3, v7, v8, v9),
        objc_msgSend_locationInView_(v10, v11, (uint64_t)self, v12),
        v14 = v13,
        v16 = v15,
        objc_msgSend_bounds(self, v17, v18, v19),
        v21 = v20 - v16,
        v25 = (void *)objc_msgSend__authoringEnvironment(self, v22, v23, v24),
        (objc_msgSend_didTapAtPoint_(v25, v26, v27, v28, v14, v21) & 1) == 0))
  {
    if (objc_msgSend_triggersEnabled(self, v7, v8, v9))
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v31 = (void *)objc_msgSend_touchesForView_(a4, v29, (uint64_t)self, v30);
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v44, (uint64_t)v48, 16);
      if (v33)
      {
        v37 = v33;
        v38 = *(_QWORD *)v45;
        do
        {
          v39 = 0;
          do
          {
            if (*(_QWORD *)v45 != v38)
              objc_enumerationMutation(v31);
            v40 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v39);
            v41 = (void *)objc_msgSend_triggerManager(self->_world, v34, v35, v36);
            objc_msgSend_triggerTouch_event_fromView_(v41, v42, (uint64_t)CFSTR("VFXTriggerTypeMouseDown"), v40, self);
            ++v39;
          }
          while (v37 != v39);
          v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v44, (uint64_t)v48, 16);
        }
        while (v37);
      }
    }
    v43.receiver = self;
    v43.super_class = (Class)VFXView;
    -[VFXView touchesBegan:withEvent:](&v43, sel_touchesBegan_withEvent_, a3, a4);
  }
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
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend__createDisplayLinkIfNeeded(self, a2, v2, v3);
  v8 = objc_msgSend_displayLink(self, v5, v6, v7);
  v9 = (*((_BYTE *)self + 432) & 2) == 0;
  objc_msgSend_nextFrameTime(self->_renderer, v10, v11, v12);
  MEMORY[0x1E0DE7D20](v8, sel_setPaused_nextFrameTimeHint_lastUpdate_, v9, v13);
}

- (void)didMoveToWindow
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  if (objc_msgSend_window(self, a2, v2, v3))
  {
    qword_1ED4BFF38 = (uint64_t)self;
    *((_BYTE *)self + 432) &= ~0x20u;
    objc_msgSend_resumeDisplayLink(self, v5, v6, v7);
    objc_msgSend__setNeedsDisplay(self, v8, v9, v10);
  }
  v20.receiver = self;
  v20.super_class = (Class)VFXView;
  -[VFXView didMoveToWindow](&v20, sel_didMoveToWindow);
  objc_msgSend__adjustBackingLayerPixelFormat(self, v11, v12, v13);
  objc_msgSend__updateBackingSize(self, v14, v15, v16);
  objc_msgSend__interfaceOrientationDidChange(self->_renderer, v17, v18, v19);
}

- (void)willMoveToWindow:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  if (!a3)
  {
    sub_1B184D580(self);
    objc_msgSend_pauseDisplayLink(self, v5, v6, v7);
    *((_BYTE *)self + 432) |= 0x20u;
  }
  v8.receiver = self;
  v8.super_class = (Class)VFXView;
  -[VFXView willMoveToWindow:](&v8, sel_willMoveToWindow_, a3);
}

- (void)_enterForeground:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
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

  *((_BYTE *)self + 432) &= ~0x80u;
  if ((*((_BYTE *)self + 433) & 1) != 0)
  {
    *((_BYTE *)self + 433) &= ~1u;
    v5 = (void *)objc_msgSend_world(self, a2, (uint64_t)a3, v3);
    v9 = (void *)objc_msgSend_clock(v5, v6, v7, v8);
    objc_msgSend_setPaused_(v9, v10, 0, v11);
  }
  v12 = sub_1B19497C8(0, a2, (uint64_t)a3, v3);
  if (v12)
    objc_msgSend_startAndReturnError_(v12, v13, 0, v15);
  if ((*((_BYTE *)self + 432) & 0x20) == 0)
    objc_msgSend_resumeDisplayLink(self, v13, v14, v15);
  v16 = (void *)objc_msgSend_world(self, v13, v14, v15);
  v20 = objc_msgSend_worldRef(v16, v17, v18, v19);
  if (v20)
    v20 = sub_1B187A9C4(v20, v21, v22, v23, v24, v25, v26, v27);
  MEMORY[0x1E0DE7D20](v20, sel_enterForeground, v22, v23);
}

- (void)_flushDisplayLink
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v5 = (void *)objc_msgSend_displayLink(self, a2, v2, v3);
  if ((int)objc_msgSend_queuedFrameCount(v5, v6, v7, v8) >= 1)
  {
    v9 = 0;
    do
    {
      usleep(0x2710u);
      v10 = v9 + 1;
      v14 = (void *)objc_msgSend_displayLink(self, v11, v12, v13);
      if ((int)objc_msgSend_queuedFrameCount(v14, v15, v16, v17) < 1)
        break;
    }
    while (v9++ < 0x12B);
    if (v10 == 300)
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: display link thread seems stuck"), v18, v19, v20, v21, v22, v23, v25);
  }
}

- (void)_enterBackground:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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

  *((_BYTE *)self + 432) |= 0x80u;
  v5 = (void *)objc_msgSend_world(self, a2, (uint64_t)a3, v3);
  v9 = (void *)objc_msgSend_clock(v5, v6, v7, v8);
  if ((objc_msgSend_isPaused(v9, v10, v11, v12) & 1) == 0)
  {
    *((_BYTE *)self + 433) |= 1u;
    v16 = (void *)objc_msgSend_world(self, v13, v14, v15);
    v20 = (void *)objc_msgSend_clock(v16, v17, v18, v19);
    objc_msgSend_setPaused_(v20, v21, 1, v22);
  }
  objc_msgSend_pauseDisplayLink(self, v13, v14, v15);
  v26 = sub_1B19497C8(0, v23, v24, v25);
  if (v26)
    objc_msgSend_pause(v26, v27, v28, v29);
  v30 = (void *)objc_msgSend_world(self, v27, v28, v29);
  v34 = objc_msgSend_worldRef(v30, v31, v32, v33);
  if (v34)
    v42 = sub_1B187A9C4(v34, (uint64_t)v35, v36, v37, v38, v39, v40, v41);
  else
    v42 = 0;
  objc_msgSend__flushDisplayLink(self, v35, v36, v37);
  MEMORY[0x1E0DE7D20](v42, sel_enterBackground, v43, v44);
}

- (void)safeAreaInsetsDidChange
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  float64_t v6;
  float64x2_t v7;
  float64_t v8;
  float64x2_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VFXView;
  -[VFXView safeAreaInsetsDidChange](&v16, sel_safeAreaInsetsDidChange);
  objc_msgSend_safeAreaInsets(self, v3, v4, v5);
  v7.f64[1] = v6;
  v9.f64[1] = v8;
  objc_msgSend_set_drawableSafeAreaInsets_(self->_renderer, v10, v11, v12, *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v7).i64);
  objc_msgSend__interfaceOrientationDidChange(self->_renderer, v13, v14, v15);
}

+ (id)_currentVFXViewFocusEnvironment
{
  return (id)qword_1ED4BFF38;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  objc_super v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)VFXView;
  v8 = -[VFXView focusItemsInRect:](&v27, sel_focusItemsInRect_);
  if (objc_msgSend_count(v8, v9, v10, v11))
    v15 = (id)objc_msgSend_mutableCopy(v8, v12, v13, v14);
  else
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = v15;
  v20 = (void *)objc_msgSend_world(self, v16, v17, v18);
  v24 = (void *)objc_msgSend_rootNode(v20, v21, v22, v23);
  objc_msgSend__appendFocusableNodesInRect_ofView_toFocusItems_(v24, v25, (uint64_t)self, (uint64_t)v19, x, y, width, height);
  return v19;
}

- (int64_t)_preferredFocusMovementStyle
{
  return 2;
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

- (BOOL)triggersEnabled
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1E0DE7D20])(self->_renderer, sel__triggersEnabled);
}

- (void)setTriggersEnabled:(BOOL)a3
{
  ((void (*)(VFXRenderer *, char *, BOOL))MEMORY[0x1E0DE7D20])(self->_renderer, sel_set_triggersEnabled_, a3);
}

- (id)setupLegacyView
{
  _TtC3VFX13VFXViewLegacy *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  v3 = [_TtC3VFX13VFXViewLegacy alloc];
  objc_msgSend_bounds(self, v4, v5, v6);
  v10 = (void *)objc_msgSend_initWithFrame_(v3, v7, v8, v9);
  objc_msgSend_addSubview_(self, v11, (uint64_t)v10, v12);
  objc_msgSend_setAutoresizingMask_(v10, v13, 18, v14);
  v18 = objc_msgSend_backgroundColor(self, v15, v16, v17);
  objc_msgSend_setBackgroundColor_(v10, v19, v18, v20);
  v32.receiver = self;
  v32.super_class = (Class)VFXView;
  -[VFXView setBackgroundColor:](&v32, sel_setBackgroundColor_, 0);
  objc_msgSend_set_legacyView_(self, v21, (uint64_t)v10, v22);
  if (objc_msgSend_lowLatency(self, v23, v24, v25))
    objc_msgSend_setLowLatency_(v10, v26, 1, v27);

  return (id)objc_msgSend__legacyView(self, v28, v29, v30);
}

- (id)legacyView
{
  uint64_t v2;
  uint64_t v3;
  id result;
  uint64_t v6;
  uint64_t v7;

  result = (id)objc_msgSend__legacyView(self, a2, v2, v3);
  if (!result)
    return (id)MEMORY[0x1E0DE7D20](self, sel_setupLegacyView, v6, v7);
  return result;
}

- (id)scene
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_legacyView(self, a2, v2, v3);
  return (id)objc_msgSend_scene(v4, v5, v6, v7);
}

- (void)setScene:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_legacyView(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setScene_(v5, v6, (uint64_t)a3, v7);
}

- (MTLCommandQueue)commandQueue
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_legacyView(self, a2, v2, v3);
  return (MTLCommandQueue *)objc_msgSend_commandQueue(v4, v5, v6, v7);
}

- (id)postRenderCallback
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_legacyView(self, a2, v2, v3);
  return (id)MEMORY[0x1E0DE7D20](v4, sel_postRenderCallback, v5, v6);
}

- (void)setPostRenderCallback:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_legacyView(self, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_setPostRenderCallback_, a3, v6);
}

- (void)renderWithCompletion:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_legacyView(self, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_renderWithCompletion_, a3, v6);
}

- (void)renderWithPresentWithTransaction:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v5;
  uint64_t v6;

  v5 = a3;
  v6 = objc_msgSend_legacyView(self, a2, a3, (uint64_t)a4);
  MEMORY[0x1E0DE7D20](v6, sel_renderWithPresentWithTransaction_completion_, v5, a4);
}

- (id)effect
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_legacyView(self, a2, v2, v3);
  return (id)MEMORY[0x1E0DE7D20](v4, sel_effect, v5, v6);
}

- (void)setEffect:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_legacyView(self, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_setEffect_, a3, v6);
}

- (unsigned)resizingMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_legacyView(self, a2, v2, v3);
  return MEMORY[0x1E0DE7D20](v4, sel_resizingMode, v5, v6);
}

- (void)setResizingMode:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend_legacyView(self, a2, a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_setResizingMode_, v4, v6);
}

- (double)scaleFactor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;

  v4 = objc_msgSend_legacyView(self, a2, v2, v3);
  MEMORY[0x1E0DE7D20](v4, sel_scaleFactor, v5, v6);
  return result;
}

- (void)setScaleFactor:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_msgSend_legacyView(self, a2, v3, v4);
  MEMORY[0x1E0DE7D20](v5, sel_setScaleFactor_, v6, v7);
}

- (BOOL)framebufferOnly
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_legacyView(self, a2, v2, v3);
  return objc_msgSend_framebufferOnly(v4, v5, v6, v7);
}

- (void)setFramebufferOnly:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  v4 = a3;
  v5 = (void *)objc_msgSend_legacyView(self, a2, a3, v3);
  objc_msgSend_setFramebufferOnly_(v5, v6, v4, v7);
}

@end

@implementation VFXUIKitSource

- (VFXUIKitSource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXUIKitSource;
  return -[VFXUIKitSource init](&v3, sel_init);
}

- (BOOL)supportsMetal
{
  return 1;
}

- (id)prepareWindowIfNeeded
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD block[5];

  if (!self->_uiWindow && !self->_windowPreparing)
  {
    self->_windowPreparing = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B18A4488;
    block[3] = &unk_1E63D6D80;
    block[4] = self;
    if (pthread_main_np() == 1)
      sub_1B18A4488((uint64_t)block, v3, v4, v5);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  return self->_uiWindow;
}

- (id)textureSource
{
  uint64_t v2;
  uint64_t v3;
  VFXTextureUIKitSource *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;

  if (!objc_msgSend_prepareWindowIfNeeded(self, a2, v2, v3))
    return 0;
  v5 = objc_alloc_init(VFXTextureUIKitSource);
  v9 = objc_msgSend_uiView(self, v6, v7, v8);
  objc_msgSend_setUiView_(v5, v10, v9, v11);
  v15 = objc_msgSend_uiWindow(self, v12, v13, v14);
  objc_msgSend_setUiWindow_(v5, v16, v15, v17);
  objc_msgSend_setUiWindowLayer_(v5, v18, (uint64_t)self->_uiWindowLayer, v19);
  objc_msgSend_setIsOpaque_(v5, v20, self->_isOpaque, v21);
  objc_msgSend_setSource_(v5, v22, (uint64_t)self, v23);
  objc_msgSend_setup(v5, v24, v25, v26);
  objc_msgSend_registerUIKitSource_(_VFXUIKitSourceRegistry, v27, (uint64_t)v5, v28);
  return v5;
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)dealloc
{
  id uiWindow;
  id uiView;
  objc_super v5;
  _QWORD block[6];

  uiWindow = self->_uiWindow;
  uiView = self->_uiView;
  self->_uiWindow = 0;
  self->_uiView = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B18A4738;
  block[3] = &unk_1E63D8108;
  block[4] = uiWindow;
  block[5] = uiView;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v5.receiver = self;
  v5.super_class = (Class)VFXUIKitSource;
  -[VFXUIKitSource dealloc](&v5, sel_dealloc);
}

- (UIView)uiView
{
  return (UIView *)self->_uiView;
}

- (void)setUiView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UIWindow)uiWindow
{
  return (UIWindow *)self->_uiWindow;
}

- (void)setUiWindow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end

@implementation VFXTextureUIKitSource

- (BOOL)supportsMetal
{
  return 1;
}

- (BOOL)shouldFlip
{
  return 0;
}

- (BOOL)requiresMainThreadUpdates
{
  return 1;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  UIWindow *uiWindow;
  UIView *uiView;
  objc_super v10;
  _QWORD block[6];

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  uiWindow = self->_uiWindow;
  uiView = self->_uiView;
  self->_uiWindow = 0;
  self->_uiView = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B18A4884;
  block[3] = &unk_1E63D8108;
  block[4] = uiWindow;
  block[5] = uiView;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  v10.receiver = self;
  v10.super_class = (Class)VFXTextureUIKitSource;
  -[VFXTextureCoreAnimationSource dealloc](&v10, sel_dealloc);
}

- (void)setup
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  v5 = objc_msgSend_superlayer(self->_uiWindowLayer, a2, v2, v3);
  v9 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v6, v7, v8);
  objc_msgSend_addObserver_selector_name_object_(v9, v10, (uint64_t)self, (uint64_t)sel__layerTreeDidUpdate, CFSTR("VFXLayerTreeDidChange"), v5);
}

- (id)layerToFocusForRenderedLayer:(id)a3
{
  return self->_uiWindowLayer;
}

- (float)clearValue
{
  unsigned int v2;

  LOBYTE(v2) = self->_isOpaque;
  return (float)v2;
}

- (id)layer
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_superlayer(self->_uiWindowLayer, a2, v2, v3);
}

- (double)layerContentsScaleFactor
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double result;

  v4 = (void *)objc_msgSend_mainScreen(MEMORY[0x1E0DC3BF8], a2, v2, v3);
  objc_msgSend_scale(v4, v5, v6, v7);
  return result;
}

- (CGSize)layerSizeInPixels
{
  uint64_t v2;
  uint64_t v3;
  double v5;
  double v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  objc_msgSend_bounds(self->_uiWindowLayer, a2, v2, v3);
  v6 = v5;
  v8 = v7;
  objc_msgSend_layerContentsScaleFactor(self, v9, v10, v11);
  if (v12 == 0.0)
    v12 = 1.0;
  v13 = v8 * v12;
  v14 = v6 * v12;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)_layerTreeDidUpdate
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  objc_msgSend_postNotificationName_object_(v5, v6, (uint64_t)CFSTR("VFXUITreeDidChange"), (uint64_t)self->_source);
}

- (UIWindow)uiWindow
{
  return self->_uiWindow;
}

- (void)setUiWindow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CALayer)uiWindowLayer
{
  return self->_uiWindowLayer;
}

- (void)setUiWindowLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (UIView)uiView
{
  return self->_uiView;
}

- (void)setUiView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (id)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)setIsOpaque:(BOOL)a3
{
  self->_isOpaque = a3;
}

@end

@implementation VFXCoreAnimationSource

- (id)textureSource
{
  VFXTextureCoreAnimationSource *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v3 = objc_alloc_init(VFXTextureCoreAnimationSource);
  v7 = objc_msgSend_layer(self, v4, v5, v6);
  objc_msgSend_setLayer_(v3, v8, v7, v9);
  return v3;
}

- (BOOL)isOpaque
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_layer(self, a2, v2, v3);
  return objc_msgSend_isOpaque(v4, v5, v6, v7);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXCoreAnimationSource;
  -[VFXCoreAnimationSource dealloc](&v3, sel_dealloc);
}

- (void)setLayer:(id)a3
{
  CALayer *layer;

  layer = self->_layer;
  if (layer != a3)
  {

    self->_layer = (CALayer *)a3;
  }
}

- (CALayer)layer
{
  return self->_layer;
}

@end

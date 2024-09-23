@implementation CRLPKImageRendererContainer

- (CRLPKImageRendererContainer)initWithSize:(CGSize)a3 sixChannelBlending:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  CRLPKImageRendererContainer *v7;
  CRLPKImageRendererContainer *v8;
  PKImageRenderer *v9;
  PKImageRenderer *imageRenderer;
  objc_super v12;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)CRLPKImageRendererContainer;
  v7 = -[CRLPKImageRendererContainer init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_size.width = width;
    v7->_size.height = height;
    v7->_sixChannelBlending = v4;
    v9 = (PKImageRenderer *)objc_msgSend(objc_alloc((Class)PKImageRenderer), "initWithSize:scale:renderQueue:sixChannelBlending:", 0, v4, width, height, 1.0);
    imageRenderer = v8->_imageRenderer;
    v8->_imageRenderer = v9;

    -[PKImageRenderer setInvertColors:](v8->_imageRenderer, "setInvertColors:", 0);
    v8->_rendererLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
  }
  return v8;
}

- (PKImageRenderer)imageRenderer
{
  os_unfair_lock_assert_owner(&self->_rendererLock);
  return self->_imageRenderer;
}

- (BOOL)tryLockingRenderer
{
  return os_unfair_lock_trylock(&self->_rendererLock);
}

- (void)lockRenderer
{
  os_unfair_lock_lock(&self->_rendererLock);
}

- (void)unlockRenderer
{
  os_unfair_lock_unlock(&self->_rendererLock);
}

- (BOOL)isCandidateForSize:(CGSize)a3 sixChannelBlending:(BOOL)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  BOOL result;

  height = a3.height;
  width = a3.width;
  -[CRLPKImageRendererContainer size](self, "size");
  v9 = v8;
  v11 = v10;
  v12 = sub_100061860(v8, v10);
  result = 0;
  if (v12)
  {
    if (v9 >= width && v11 >= height)
      return -[CRLPKImageRendererContainer sixChannelBlending](self, "sixChannelBlending") ^ a4 ^ 1;
  }
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)sixChannelBlending
{
  return self->_sixChannelBlending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRenderer, 0);
}

@end

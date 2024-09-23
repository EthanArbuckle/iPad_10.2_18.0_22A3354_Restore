@implementation CRLBackgroundUpdatableLayer

- (CRLBackgroundUpdatableLayer)init
{
  CRLBackgroundUpdatableLayer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLBackgroundUpdatableLayer;
  result = -[CRLBackgroundUpdatableLayer init](&v3, "init");
  if (result)
  {
    result->_backgroundUpdatableLayerLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
    result->_contentsToSetOnNextDisplay = 0;
    result->_wantsContentsUpdatedOnNextDisplay = 0;
  }
  return result;
}

- (void)dealloc
{
  void *contentsToSetOnNextDisplay;
  objc_super v4;

  contentsToSetOnNextDisplay = self->_contentsToSetOnNextDisplay;
  if (contentsToSetOnNextDisplay)
  {
    CFRelease(contentsToSetOnNextDisplay);
    self->_contentsToSetOnNextDisplay = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLBackgroundUpdatableLayer;
  -[CRLBackgroundUpdatableLayer dealloc](&v4, "dealloc");
}

- (void)setContentsFromBackground:(void *)a3
{
  os_unfair_lock_s *p_backgroundUpdatableLayerLock;
  void *contentsToSetOnNextDisplay;

  p_backgroundUpdatableLayerLock = &self->_backgroundUpdatableLayerLock;
  os_unfair_lock_lock(&self->_backgroundUpdatableLayerLock);
  contentsToSetOnNextDisplay = self->_contentsToSetOnNextDisplay;
  if (contentsToSetOnNextDisplay != a3)
  {
    if (contentsToSetOnNextDisplay)
    {
      CFRelease(contentsToSetOnNextDisplay);
      self->_contentsToSetOnNextDisplay = 0;
    }
    self->_contentsToSetOnNextDisplay = (void *)CFRetain(a3);
    self->_wantsContentsUpdatedOnNextDisplay = 1;
  }
  os_unfair_lock_unlock(p_backgroundUpdatableLayerLock);
}

- (void)display
{
  os_unfair_lock_s *p_backgroundUpdatableLayerLock;
  void *contentsToSetOnNextDisplay;
  objc_super v5;

  p_backgroundUpdatableLayerLock = &self->_backgroundUpdatableLayerLock;
  os_unfair_lock_lock(&self->_backgroundUpdatableLayerLock);
  if (self->_wantsContentsUpdatedOnNextDisplay)
  {
    -[CRLBackgroundUpdatableLayer setContents:](self, "setContents:", self->_contentsToSetOnNextDisplay);
    contentsToSetOnNextDisplay = self->_contentsToSetOnNextDisplay;
    if (contentsToSetOnNextDisplay)
    {
      CFRelease(contentsToSetOnNextDisplay);
      self->_contentsToSetOnNextDisplay = 0;
    }
    self->_wantsContentsUpdatedOnNextDisplay = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLBackgroundUpdatableLayer;
    -[CRLBackgroundUpdatableLayer display](&v5, "display");
  }
  os_unfair_lock_unlock(p_backgroundUpdatableLayerLock);
}

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class(CRLBackgroundUpdatableRenderable, a2);
}

@end

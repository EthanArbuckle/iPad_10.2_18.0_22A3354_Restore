@implementation SBPresentContinuousExposeStripEdgeProtectGrabberEventResponse

- (id)initForInitialPresentation:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPresentContinuousExposeStripEdgeProtectGrabberEventResponse;
  result = -[SBChainableModifierEventResponse init](&v5, sel_init);
  if (result)
    *((_BYTE *)result + 40) = a3;
  return result;
}

- (int64_t)type
{
  return 40;
}

- (BOOL)isInitialPresentation
{
  return self->_initialPresentation;
}

- (void)setInitialPresentation:(BOOL)a3
{
  self->_initialPresentation = a3;
}

@end

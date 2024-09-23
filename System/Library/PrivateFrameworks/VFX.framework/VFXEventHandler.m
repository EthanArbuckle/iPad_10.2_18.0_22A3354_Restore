@implementation VFXEventHandler

- (VFXEventHandler)init
{
  VFXEventHandler *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXEventHandler;
  result = -[VFXEventHandler init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_enableFreeCamera = 257;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VFXEventHandler;
  -[VFXEventHandler dealloc](&v2, sel_dealloc);
}

- (VFXView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  self->_view = (VFXView *)a3;
}

- (id)gestureRecognizers
{
  return 0;
}

- (BOOL)wantsRedraw
{
  return 0;
}

- (VFXNode)freeCamera
{
  return 0;
}

- (BOOL)enableFreeCamera
{
  return self->_enableFreeCamera;
}

- (void)setEnableFreeCamera:(BOOL)a3
{
  self->_enableFreeCamera = a3;
}

- (BOOL)autoSwitchToFreeCamera
{
  return self->_autoSwitchToFreeCamera;
}

- (void)setAutoSwitchToFreeCamera:(BOOL)a3
{
  self->_autoSwitchToFreeCamera = a3;
}

- (void)activateFreeCamera
{
  ((void (*)(VFXEventHandler *, char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_setEnableFreeCamera_, 1);
}

@end

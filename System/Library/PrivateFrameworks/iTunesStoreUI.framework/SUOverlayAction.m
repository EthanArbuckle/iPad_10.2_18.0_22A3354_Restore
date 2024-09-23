@implementation SUOverlayAction

- (void)dealloc
{
  objc_super v3;

  self->_otherViewController = 0;
  self->_transition = 0;

  self->_viewController = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUOverlayAction;
  -[SUOverlayAction dealloc](&v3, sel_dealloc);
}

- (int)actionType
{
  return self->_type;
}

- (void)setActionType:(int)a3
{
  self->_type = a3;
}

- (int64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(int64_t)a3
{
  self->_animationCount = a3;
}

- (UIViewController)otherViewController
{
  return self->_otherViewController;
}

- (void)setOtherViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (SUOverlayTransition)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end

@implementation UIWindowSceneDestructionRequestOptions

- (UIWindowSceneDismissalAnimation)windowDismissalAnimation
{
  return self->_windowDismissalAnimation;
}

- (void)setWindowDismissalAnimation:(UIWindowSceneDismissalAnimation)windowDismissalAnimation
{
  self->_windowDismissalAnimation = windowDismissalAnimation;
}

@end

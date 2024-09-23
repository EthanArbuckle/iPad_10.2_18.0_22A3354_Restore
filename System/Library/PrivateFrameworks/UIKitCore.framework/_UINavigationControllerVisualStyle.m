@implementation _UINavigationControllerVisualStyle

- (_UINavigationControllerVisualStyle)initWithNavigationController:(id)a3
{
  _UINavigationControllerVisualStyle *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UINavigationControllerVisualStyle;
  result = -[_UINavigationControllerVisualStyle init](&v5, sel_init);
  if (result)
    result->_navigationController = (UINavigationController *)a3;
  return result;
}

- (BOOL)shouldUseInteractionControllerForInteractiveTransition
{
  return 0;
}

- (UIViewControllerAnimatedTransitioning)transitionController
{
  return 0;
}

- (UIViewControllerInteractiveTransitioning)interactionController
{
  return 0;
}

- (BOOL)isUsingParallaxTransition
{
  return 0;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  self->_navigationController = (UINavigationController *)a3;
}

@end

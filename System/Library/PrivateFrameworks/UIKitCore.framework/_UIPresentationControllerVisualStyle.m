@implementation _UIPresentationControllerVisualStyle

- (_UIPresentationControllerVisualStyle)initWithPresentationController:(id)a3
{
  _UIPresentationControllerVisualStyle *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPresentationControllerVisualStyle;
  result = -[_UIPresentationControllerVisualStyle init](&v5, sel_init);
  if (result)
    result->_presentationController = (UIPresentationController *)a3;
  return result;
}

- (id)preferredAnimationControllerForPresentation:(BOOL)a3
{
  return 0;
}

- (UIPresentationController)presentationController
{
  return self->_presentationController;
}

@end

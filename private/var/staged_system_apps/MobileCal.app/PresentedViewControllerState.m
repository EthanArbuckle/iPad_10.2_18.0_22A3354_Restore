@implementation PresentedViewControllerState

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (unint64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (void)setArrowDirection:(unint64_t)a3
{
  self->_arrowDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end

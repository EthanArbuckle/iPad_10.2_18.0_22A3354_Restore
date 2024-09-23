@implementation _TUIHostedFactoryViewState

- (_TUIHostedFactoryViewState)initWithIdentifier:(id)a3 view:(id)a4 flags:(unint64_t)a5
{
  id v9;
  id v10;
  _TUIHostedFactoryViewState *v11;
  _TUIHostedFactoryViewState *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_TUIHostedFactoryViewState;
  v11 = -[_TUIHostedFactoryViewState init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_view, a4);
    v12->_previouslyAppeared = 1;
    v12->_flags = a5;
  }

  return v12;
}

- (BOOL)needsLayout
{
  return !-[_TUIHostedFactoryViewState previouslyAppeared](self, "previouslyAppeared");
}

- (BOOL)isAvailable
{
  return 1;
}

- (TUIVisibilityOptions)visibilityOptions
{
  return 0;
}

- (UIViewController)viewController
{
  return 0;
}

- (void)recycleViewWithController:(id)a3
{
  id v4;

  v4 = a3;
  -[UIView removeFromSuperview](self->_view, "removeFromSuperview");
  if ((self->_flags & 8) != 0)
    objc_msgSend(v4, "makeAvailableForReuse:", self);

}

- (TUIHostingIdentifier)identifier
{
  return self->_identifier;
}

- (UIView)view
{
  return self->_view;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)previouslyAppeared
{
  return self->_previouslyAppeared;
}

- (void)setPreviouslyAppeared:(BOOL)a3
{
  self->_previouslyAppeared = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

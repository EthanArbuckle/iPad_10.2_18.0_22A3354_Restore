@implementation UIWindowSceneDragInteraction

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (UIWindowSceneDragInteraction)init
{
  UIWindowSceneDragInteraction *v2;
  _UIWindowSceneDragInteractionImpl_iOS *v3;
  _UIWindowSceneDragInteractionImpl *impl;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWindowSceneDragInteraction;
  v2 = -[UIWindowSceneDragInteraction init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_UIWindowSceneDragInteractionImpl_iOS);
    impl = v2->_impl;
    v2->_impl = (_UIWindowSceneDragInteractionImpl *)v3;

  }
  return v2;
}

- (void)willMoveToView:(id)a3
{
  -[_UIWindowSceneDragInteractionImpl willMoveToView:](self->_impl, "willMoveToView:", a3);
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id v5;

  p_view = &self->_view;
  v5 = a3;
  objc_storeWeak((id *)p_view, v5);
  -[_UIWindowSceneDragInteractionImpl didMoveToView:](self->_impl, "didMoveToView:", v5);

}

- (UIGestureRecognizer)gestureForFailureRelationships
{
  return (UIGestureRecognizer *)-[_UIWindowSceneDragInteractionImpl gestureForFailureRelationships](self->_impl, "gestureForFailureRelationships");
}

- (_UIWindowSceneDragInteractionImpl)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
  objc_storeStrong((id *)&self->_impl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end

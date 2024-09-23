@implementation UITextSelectionGrabberSuppressionAssertion

- (UITextSelectionGrabberSuppressionAssertion)initWithSelectionView:(id)a3
{
  id v4;
  UITextSelectionGrabberSuppressionAssertion *v5;
  UITextSelectionGrabberSuppressionAssertion *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITextSelectionGrabberSuppressionAssertion;
  v5 = -[UITextSelectionGrabberSuppressionAssertion init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[UITextSelectionGrabberSuppressionAssertion setSelectionView:](v5, "setSelectionView:", v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (!-[UITextSelectionGrabberSuppressionAssertion invalidated](self, "invalidated"))
  {
    -[UITextSelectionGrabberSuppressionAssertion selectionView](self, "selectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "releaseGrabberHandleSuppressionAssertion:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)UITextSelectionGrabberSuppressionAssertion;
  -[UITextSelectionGrabberSuppressionAssertion dealloc](&v4, sel_dealloc);
}

- (void)_invalidate
{
  id v3;

  -[UITextSelectionGrabberSuppressionAssertion setInvalidated:](self, "setInvalidated:", 1);
  -[UITextSelectionGrabberSuppressionAssertion selectionView](self, "selectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseGrabberHandleSuppressionAssertion:", self);

}

- (UITextSelectionView)selectionView
{
  return (UITextSelectionView *)objc_loadWeakRetained((id *)&self->_selectionView);
}

- (void)setSelectionView:(id)a3
{
  objc_storeWeak((id *)&self->_selectionView, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectionView);
}

@end

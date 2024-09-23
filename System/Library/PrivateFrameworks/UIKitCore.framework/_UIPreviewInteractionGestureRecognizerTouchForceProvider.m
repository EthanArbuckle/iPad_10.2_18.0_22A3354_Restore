@implementation _UIPreviewInteractionGestureRecognizerTouchForceProvider

- (_UIPreviewInteractionGestureRecognizerTouchForceProvider)initWithGestureRecognizer:(id)a3
{
  id v6;
  _UIPreviewInteractionGestureRecognizerTouchForceProvider *v7;
  _UIPreviewInteractionGestureRecognizerTouchForceProvider *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionGestureRecognizerTouchForceProvider.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gestureRecognizer"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_UIPreviewInteractionGestureRecognizerTouchForceProvider;
  v7 = -[_UIPreviewInteractionGestureRecognizerTouchForceProvider init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "addTarget:action:", v7, sel__handleGestureRecognizer_);
    objc_msgSend(v6, "setDelegate:", v7);
    objc_storeStrong((id *)&v7->_gestureRecognizer, a3);
    if (-[UIGestureRecognizer state](v7->_gestureRecognizer, "state") == UIGestureRecognizerStateBegan
      || -[UIGestureRecognizer state](v7->_gestureRecognizer, "state") == UIGestureRecognizerStateChanged)
    {
      -[_UIPreviewInteractionGestureRecognizerTouchForceProvider setActive:](v7, "setActive:", 1);
    }
    v8 = v7;
  }

  return v7;
}

- (_UIPreviewInteractionGestureRecognizerTouchForceProvider)initWithView:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  UITouchForceGestureRecognizer *v9;
  _UIPreviewInteractionGestureRecognizerTouchForceProvider *v10;
  _UIPreviewInteractionGestureRecognizerTouchForceProvider *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionGestureRecognizerTouchForceProvider.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

  }
  v9 = objc_alloc_init(UITouchForceGestureRecognizer);
  v10 = -[_UIPreviewInteractionGestureRecognizerTouchForceProvider initWithGestureRecognizer:](self, "initWithGestureRecognizer:", v9);
  if (v10)
  {
    objc_msgSend(v7, "addGestureRecognizer:", v9);
    -[UITouchForceGestureRecognizer setConfigurationBlock:](v9, "setConfigurationBlock:", v8);
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIGestureRecognizer view](self->_gestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_gestureRecognizer);

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewInteractionGestureRecognizerTouchForceProvider;
  -[_UIPreviewInteractionGestureRecognizerTouchForceProvider dealloc](&v4, sel_dealloc);
}

- (double)touchForce
{
  double result;

  -[UITouchForceGestureRecognizer touchForce](self->_gestureRecognizer, "touchForce");
  return result;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = a3;
  -[UIGestureRecognizer view](self->_gestureRecognizer, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer locationInView:](self->_gestureRecognizer, "locationInView:", v5);
  v8 = v6;
  v9 = v7;
  if (v4 && v5 != v4)
  {
    objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v4, v6, v7);
    v8 = v10;
    v9 = v11;
  }

  v12 = v8;
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)cancelInteraction
{
  -[UIGestureRecognizer setEnabled:](self->_gestureRecognizer, "setEnabled:", 0);
  -[UIGestureRecognizer setEnabled:](self->_gestureRecognizer, "setEnabled:", 1);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a3, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UIPreviewInteractionAllowedToBeginForView(v3))
  {
    objc_msgSend(v3, "_viewControllerForAncestor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _UIViewControllerIsChildOfTwoColumnSplitViewController(v4) ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_handleGestureRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
    -[_UIPreviewInteractionGestureRecognizerTouchForceProvider setActive:](self, "setActive:", 1);
  if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
    -[_UIPreviewInteractionGestureRecognizerTouchForceProvider setActive:](self, "setActive:", 0);

}

- (UITouchForceGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

@end

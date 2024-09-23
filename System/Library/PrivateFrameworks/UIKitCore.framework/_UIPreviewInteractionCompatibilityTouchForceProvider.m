@implementation _UIPreviewInteractionCompatibilityTouchForceProvider

- (_UIPreviewInteractionCompatibilityTouchForceProvider)initWithView:(id)a3
{
  id v5;
  _UIPreviewInteractionCompatibilityTouchForceProvider *v6;
  _UIPreviewInteractionCompatibilityTouchForceProvider *v7;
  void *v8;
  int v9;
  _UITouchesObservingGestureRecognizer *v10;
  _UITouchesObservingGestureRecognizer *gestureRecognizer;
  _UIPreviewInteractionCompatibilityTouchForceProvider *v12;
  void *v14;
  objc_super v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionCompatibilityTouchForceProvider.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

  }
  v15.receiver = self;
  v15.super_class = (Class)_UIPreviewInteractionCompatibilityTouchForceProvider;
  v6 = -[_UIPreviewInteractionCompatibilityTouchForceProvider init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_view, v5);
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_supportsForceTouch");

    if (v9)
    {
      v10 = objc_alloc_init(_UITouchesObservingGestureRecognizer);
      -[UIGestureRecognizer setAllowedTouchTypes:](v10, "setAllowedTouchTypes:", &unk_1E1A94610);
      -[UIGestureRecognizer setCancelsTouchesInView:](v10, "setCancelsTouchesInView:", 0);
      -[UIGestureRecognizer setDelegate:](v10, "setDelegate:", v7);
      -[UIGestureRecognizer addTarget:action:](v10, "addTarget:action:", v7, sel__handleTouchObservingGestureRecognizer_);
      objc_msgSend(v5, "addGestureRecognizer:", v10);
      gestureRecognizer = v7->_gestureRecognizer;
      v7->_gestureRecognizer = v10;

    }
    v12 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIGestureRecognizer view](self->_gestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_gestureRecognizer);

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewInteractionCompatibilityTouchForceProvider;
  -[_UIPreviewInteractionCompatibilityTouchForceProvider dealloc](&v4, sel_dealloc);
}

- (double)touchForce
{
  return -[UITouch _unclampedForce](&self->_currentTouch->super.isa);
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4;
  UITouch *currentTouch;
  UIView **p_view;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  v4 = a3;
  currentTouch = self->_currentTouch;
  if (currentTouch)
  {
    p_view = &self->_view;
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    -[UITouch locationInView:](currentTouch, "locationInView:", WeakRetained);
    v9 = v8;
    v11 = v10;

    if (v4)
    {
      v12 = objc_loadWeakRetained((id *)p_view);

      if (v12 != v4)
      {
        v13 = objc_loadWeakRetained((id *)p_view);
        objc_msgSend(v13, "convertPoint:toCoordinateSpace:", v4, v9, v11);
        v9 = v14;
        v11 = v15;

      }
    }
  }
  else
  {
    v11 = 1.79769313e308;
    v9 = 1.79769313e308;
  }

  v16 = v9;
  v17 = v11;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)cancelInteraction
{
  -[UIGestureRecognizer setEnabled:](self->_gestureRecognizer, "setEnabled:", 0);
  -[UIGestureRecognizer setEnabled:](self->_gestureRecognizer, "setEnabled:", 1);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITouch *v5;
  BOOL v6;
  UITouch *currentTouch;
  BOOL v8;

  v5 = (UITouch *)a4;
  if ((-[UITouch _mightBeConsideredForForceSystemGesture](v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    currentTouch = self->_currentTouch;
    if (currentTouch)
      v8 = currentTouch == v5;
    else
      v8 = 1;
    v6 = v8;
  }

  return v6;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _UIPreviewInteractionAllowedToBeginForView(v3);

  return v4;
}

- (void)_handleTouchObservingGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  UITouch *v11;
  UITouch *currentTouch;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 1 || objc_msgSend(v4, "state") == 2)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "touches", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          if (-[UITouch _mightBeConsideredForForceSystemGesture](*(void **)(*((_QWORD *)&v13 + 1) + 8 * v9)))
          {
            -[_UIPreviewInteractionCompatibilityTouchForceProvider cancelInteraction](self, "cancelInteraction");
            goto LABEL_19;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  if (objc_msgSend(v4, "state") == 1)
  {
    objc_msgSend(v4, "touches");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v11 = (UITouch *)objc_claimAutoreleasedReturnValue();
    currentTouch = self->_currentTouch;
    self->_currentTouch = v11;

    -[_UIPreviewInteractionCompatibilityTouchForceProvider setActive:](self, "setActive:", 1);
  }
  if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
  {
    -[_UIPreviewInteractionCompatibilityTouchForceProvider setActive:](self, "setActive:", 0);
    v5 = self->_currentTouch;
    self->_currentTouch = 0;
LABEL_19:

  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
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
  objc_storeStrong((id *)&self->_currentTouch, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end

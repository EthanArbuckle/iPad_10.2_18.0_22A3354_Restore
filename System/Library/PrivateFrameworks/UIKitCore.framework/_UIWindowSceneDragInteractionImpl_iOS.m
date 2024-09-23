@implementation _UIWindowSceneDragInteractionImpl_iOS

- (_UIWindowSceneDragInteractionImpl_iOS)init
{
  _UIWindowSceneDragInteractionImpl_iOS *v2;
  _UIClientToHostRelationshipGestureInteraction *v3;
  _UIClientToHostRelationshipGestureInteraction *clientRelationshipInteraction;
  uint64_t v5;
  UIPanGestureRecognizer *directTouchPanGestureRecognizer;
  uint64_t v7;
  UIPanGestureRecognizer *pointerTouchPanGestureRecognizer;
  _UIRelationshipGestureRecognizer *v9;
  _UIRelationshipGestureRecognizer *failureRelationshipGestureRecognizer;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIWindowSceneDragInteractionImpl_iOS;
  v2 = -[_UIWindowSceneDragInteractionImpl_iOS init](&v12, sel_init);
  if (v2)
  {
    v3 = -[_UIClientToHostRelationshipGestureInteraction initWithHostIdentifier:]([_UIClientToHostRelationshipGestureInteraction alloc], "initWithHostIdentifier:", CFSTR("com.apple.UIKit.UIWindowDragging"));
    clientRelationshipInteraction = v2->_clientRelationshipInteraction;
    v2->_clientRelationshipInteraction = v3;

    -[_UIWindowSceneDragInteractionImpl_iOS _makeDraggingPanGestureRecognizer](v2, "_makeDraggingPanGestureRecognizer");
    v5 = objc_claimAutoreleasedReturnValue();
    directTouchPanGestureRecognizer = v2->_directTouchPanGestureRecognizer;
    v2->_directTouchPanGestureRecognizer = (UIPanGestureRecognizer *)v5;

    -[_UIClientToHostRelationshipGestureInteraction addGestureRecognizer:](v2->_clientRelationshipInteraction, "addGestureRecognizer:", v2->_directTouchPanGestureRecognizer);
    -[_UIWindowSceneDragInteractionImpl_iOS _makeDraggingPanGestureRecognizer](v2, "_makeDraggingPanGestureRecognizer");
    v7 = objc_claimAutoreleasedReturnValue();
    pointerTouchPanGestureRecognizer = v2->_pointerTouchPanGestureRecognizer;
    v2->_pointerTouchPanGestureRecognizer = (UIPanGestureRecognizer *)v7;

    -[UIGestureRecognizer setAllowedTouchTypes:](v2->_pointerTouchPanGestureRecognizer, "setAllowedTouchTypes:", &unk_1E1A93338);
    -[UIPanGestureRecognizer _setHysteresis:](v2->_pointerTouchPanGestureRecognizer, "_setHysteresis:", 3.0);
    -[_UIClientToHostRelationshipGestureInteraction addGestureRecognizer:](v2->_clientRelationshipInteraction, "addGestureRecognizer:", v2->_pointerTouchPanGestureRecognizer);
    v9 = objc_alloc_init(_UIRelationshipGestureRecognizer);
    failureRelationshipGestureRecognizer = v2->_failureRelationshipGestureRecognizer;
    v2->_failureRelationshipGestureRecognizer = v9;

    -[UIGestureRecognizer setName:](v2->_failureRelationshipGestureRecognizer, "setName:", CFSTR("UIWindowSceneDragRelationshipRecognizer"));
  }
  return v2;
}

- (id)_makeDraggingPanGestureRecognizer
{
  UIPanGestureRecognizer *v2;

  v2 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__didRecognizePanGesture_);
  -[UIGestureRecognizer _setRequiresSystemGesturesToFail:](v2, "_setRequiresSystemGesturesToFail:", 0);
  -[UIGestureRecognizer setName:](v2, "setName:", CFSTR("com.apple.UIKit.UIWindowDraggingPan"));
  return v2;
}

- (void)willMoveToView:(id)a3
{
  UIView **p_view;
  id WeakRetained;
  id v6;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "removeInteraction:", self->_clientRelationshipInteraction);

  v6 = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v6, "removeGestureRecognizer:", self->_failureRelationshipGestureRecognizer);

  objc_storeWeak((id *)p_view, 0);
}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id v5;
  id WeakRetained;
  id v7;

  p_view = &self->_view;
  v7 = a3;
  v5 = objc_storeWeak((id *)p_view, v7);
  objc_msgSend(v7, "addInteraction:", self->_clientRelationshipInteraction);

  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(WeakRetained, "addGestureRecognizer:", self->_failureRelationshipGestureRecognizer);

}

- (void)_didRecognizePanGesture:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    v5 = _MergedGlobals_1017;
    if (!_MergedGlobals_1017)
    {
      v5 = __UILogCategoryGetNode("UIWindowSceneDrag", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_MergedGlobals_1017);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v7 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = v7;
        objc_msgSend(v4, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v9;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Recognized window drag pan gesture in app: %@", (uint8_t *)&v13, 0xCu);

      }
    }
    -[_UIRelationshipGestureRecognizer _succeed](self->_failureRelationshipGestureRecognizer, "_succeed");
  }
  else if (objc_msgSend(v4, "state") == 5 || objc_msgSend(v4, "state") == 4)
  {
    v6 = qword_1ECD7D790;
    if (!qword_1ECD7D790)
    {
      v6 = __UILogCategoryGetNode("UIWindowSceneDrag", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&qword_1ECD7D790);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v10 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        objc_msgSend(v4, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Window drag pan gesture failed in app: %@", (uint8_t *)&v13, 0xCu);

      }
    }
    -[_UIRelationshipGestureRecognizer _fail](self->_failureRelationshipGestureRecognizer, "_fail");
  }

}

- (id)gestureForFailureRelationships
{
  return self->_failureRelationshipGestureRecognizer;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (_UIClientToHostRelationshipGestureInteraction)clientRelationshipInteraction
{
  return self->_clientRelationshipInteraction;
}

- (void)setClientRelationshipInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_clientRelationshipInteraction, a3);
}

- (UIPanGestureRecognizer)directTouchPanGestureRecognizer
{
  return self->_directTouchPanGestureRecognizer;
}

- (void)setDirectTouchPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_directTouchPanGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)pointerTouchPanGestureRecognizer
{
  return self->_pointerTouchPanGestureRecognizer;
}

- (void)setPointerTouchPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pointerTouchPanGestureRecognizer, a3);
}

- (_UIRelationshipGestureRecognizer)failureRelationshipGestureRecognizer
{
  return self->_failureRelationshipGestureRecognizer;
}

- (void)setFailureRelationshipGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_failureRelationshipGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureRelationshipGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pointerTouchPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_directTouchPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_clientRelationshipInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end

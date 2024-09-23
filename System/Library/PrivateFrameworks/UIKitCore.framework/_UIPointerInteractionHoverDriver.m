@implementation _UIPointerInteractionHoverDriver

- (void)setView:(id)a3
{
  UIView **p_view;
  id WeakRetained;
  id v6;
  id v7;
  id v8;
  id obj;

  p_view = &self->_view;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  -[_UIPointerInteractionHoverDriver _uninstallFromView:](self, "_uninstallFromView:", WeakRetained);

  v6 = objc_storeWeak((id *)p_view, obj);
  v7 = v6;
  if (obj)
  {
    v8 = objc_loadWeakRetained((id *)p_view);
    -[_UIPointerInteractionHoverDriver _installToView:](self, "_installToView:", v8);

  }
}

- (void)_uninstallFromView:(id)a3
{
  _UIPointerInteractionHoverGestureRecognizer *hoverGestureRecognizer;
  id v5;
  void *v6;
  void *v7;

  hoverGestureRecognizer = self->_hoverGestureRecognizer;
  v5 = a3;
  objc_msgSend(v5, "removeGestureRecognizer:", hoverGestureRecognizer);
  objc_msgSend(v5, "removeGestureRecognizer:", self->_pressGestureRecognizer);

  if (self->_flags.observing)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIPointerArbiter sharedArbiter](_UIPointerArbiter, "sharedArbiter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, 0x1E1751EA0, v7);

    self->_flags.observing = 0;
  }
}

- (_UIPointerInteractionHoverDriver)initWithSink:(id)a3
{
  id v4;
  _UIPointerInteractionHoverDriver *v5;
  _UIPointerInteractionHoverDriver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPointerInteractionHoverDriver;
  v5 = -[_UIPointerInteractionHoverDriver init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_sink, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_sink);
}

- (CAPoint3D)locationInView:(id)a3
{
  double v3;
  double v4;
  double v5;
  CAPoint3D result;

  -[UIHoverGestureRecognizer _location3DInView:](self->_hoverGestureRecognizer, "_location3DInView:", a3);
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)isActive
{
  UIGestureRecognizerState v3;

  v3 = -[UIGestureRecognizer state](self->_hoverGestureRecognizer, "state");
  if (v3 != UIGestureRecognizerStateBegan)
    LOBYTE(v3) = -[UIGestureRecognizer state](self->_hoverGestureRecognizer, "state") == UIGestureRecognizerStateChanged;
  return v3;
}

- (void)invalidate
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  self->_flags.invalid = 1;
  objc_initWeak(&location, self);
  v2 = (void *)UIApp;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46___UIPointerInteractionHoverDriver_invalidate__block_invoke;
  v3[3] = &unk_1E16B3F40;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "_performBlockAfterCATransactionCommits:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (int64_t)type
{
  return 0;
}

- (void)_handleHoverGesture:(id)a3
{
  _UIPointerInteractionHoverGestureRecognizer *v5;
  void *v6;
  _UIPointerInteractionHoverGestureRecognizer *v7;

  v5 = (_UIPointerInteractionHoverGestureRecognizer *)a3;
  v7 = v5;
  if (self->_hoverGestureRecognizer != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPointerInteractionHoverDriver.m"), 165, CFSTR("Received updates from an unknown hover gesture recognizer."));

  }
  self->_flags.invalid = 0;
  -[_UIPointerInteractionHoverDriver _updateHover:forced:](self, "_updateHover:forced:");

}

- (void)_updateHover:(id)a3 forced:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[7];
  char v25;
  _BYTE v26[7];
  uint64_t v27;

  v4 = a4;
  v6 = a3;
  self->_flags.receivedUpdateWhilePointerDisabled = 0;
  if (objc_msgSend(v6, "state") == 3 || objc_msgSend(v6, "state") == 4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sink);
    objc_msgSend(WeakRetained, "driverDidExit:", self);

    goto LABEL_4;
  }
  +[_UIPointerArbiter sharedArbiter](_UIPointerArbiter, "sharedArbiter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pointerState");

  switch(v9)
  {
    case 0:
LABEL_10:
      self->_flags.receivedUpdateWhilePointerDisabled = 1;
      break;
    case 3:
      v23 = objc_loadWeakRetained((id *)&self->_sink);
      objc_msgSend(v23, "driverDidExit:", self);

      goto LABEL_10;
    case 1:
      objc_msgSend(v6, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_location3DInView:", v10);
      v12 = v11;
      v14 = v13;
      v16 = v15;

      v17 = v4;
      memset(v26, 0, sizeof(v26));
      v18 = objc_msgSend(v6, "modifierFlags");
      v19 = -[_UIPointerInteractionHoverDriver _currentButtonMask](self, "_currentButtonMask");
      -[_UIPointerInteractionHoverDriver _currentTouchForce](self, "_currentTouchForce");
      v21 = v20;
      v22 = objc_loadWeakRetained((id *)&self->_sink);
      v24[0] = v12;
      v24[1] = v14;
      v24[2] = v16;
      v24[3] = 0;
      v24[4] = v18;
      v24[5] = v19;
      v24[6] = v17;
      v25 = 1;
      v27 = v21;
      objc_msgSend(v22, "driver:didIssueUpdate:", self, v24);

      break;
  }
LABEL_4:

}

- (void)_handlePressGesture:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  _QWORD v15[7];
  char v16;
  _BYTE v17[7];
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  memset(v17, 0, sizeof(v17));
  v10 = objc_msgSend(v4, "modifierFlags");

  v11 = -[_UIPointerInteractionHoverDriver _currentButtonMask](self, "_currentButtonMask");
  -[_UIPointerInteractionHoverDriver _currentTouchForce](self, "_currentTouchForce");
  v13 = v12;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sink);
  v15[0] = v7;
  v15[1] = v9;
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v10;
  v15[5] = v11;
  v15[6] = 0;
  v16 = 1;
  v18 = v13;
  objc_msgSend(WeakRetained, "driver:didIssueUpdate:", self, v15);

}

- (int64_t)_currentButtonMask
{
  int64_t v3;

  v3 = -[UIGestureRecognizer buttonMask](self->_pressGestureRecognizer, "buttonMask");
  if (-[UIGestureRecognizer state](self->_pressGestureRecognizer, "state") <= UIGestureRecognizerStateChanged)
    return v3;
  else
    return 0;
}

- (double)_currentTouchForce
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIGestureRecognizer _allActiveTouches](self->_hoverGestureRecognizer, "_allActiveTouches");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "force");
  v5 = v4;

  return v5;
}

- (BOOL)allowsUpdatesWhilePrimaryButtonIsPressed
{
  return 0;
}

- (void)_pointerStateDidChange:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_flags.receivedUpdateWhilePointerDisabled && objc_msgSend(v7, "pointerState") == 1)
      -[_UIPointerInteractionHoverDriver _updateHover:forced:](self, "_updateHover:forced:", self->_hoverGestureRecognizer, 0);

    v6 = v9;
  }

}

- (void)_installToView:(id)a3
{
  _UIPointerInteractionHoverGestureRecognizer *v4;
  _UIPointerInteractionHoverGestureRecognizer *hoverGestureRecognizer;
  _UIPointerInteractionPressGestureRecognizer *v6;
  _UIPointerInteractionPressGestureRecognizer *pressGestureRecognizer;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!self->_hoverGestureRecognizer)
  {
    v4 = -[UIHoverGestureRecognizer initWithTarget:action:]([_UIPointerInteractionHoverGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleHoverGesture_);
    hoverGestureRecognizer = self->_hoverGestureRecognizer;
    self->_hoverGestureRecognizer = v4;

    -[UIGestureRecognizer setDelegate:](self->_hoverGestureRecognizer, "setDelegate:", self);
    -[UIHoverGestureRecognizer _setAllowedTouchTypes:](self->_hoverGestureRecognizer, (uint64_t)&unk_1E1A934B8);
  }
  if (!self->_pressGestureRecognizer)
  {
    v6 = -[UILongPressGestureRecognizer initWithTarget:action:]([_UIPointerInteractionPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePressGesture_);
    pressGestureRecognizer = self->_pressGestureRecognizer;
    self->_pressGestureRecognizer = v6;

    -[UIGestureRecognizer setDelegate:](self->_pressGestureRecognizer, "setDelegate:", self);
    -[UILongPressGestureRecognizer setButtonMaskRequired:](self->_pressGestureRecognizer, "setButtonMaskRequired:", 3);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_pressGestureRecognizer, "setMinimumPressDuration:", 0.0);
    -[UIGestureRecognizer setAllowedTouchTypes:](self->_pressGestureRecognizer, "setAllowedTouchTypes:", &unk_1E1A934D0);
    -[UIGestureRecognizer setCancelsTouchesInView:](self->_pressGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](self->_pressGestureRecognizer, "setDelaysTouchesEnded:", 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_sink);
  objc_msgSend(WeakRetained, "driver:willAttachHoverGestureRecognizer:toView:", self, self->_hoverGestureRecognizer, v11);

  objc_msgSend(v11, "addGestureRecognizer:", self->_hoverGestureRecognizer);
  objc_msgSend(v11, "addGestureRecognizer:", self->_pressGestureRecognizer);
  if (!self->_flags.observing)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIPointerArbiter sharedArbiter](_UIPointerArbiter, "sharedArbiter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__pointerStateDidChange_, 0x1E1751EA0, v10);

    self->_flags.observing = 1;
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

@end

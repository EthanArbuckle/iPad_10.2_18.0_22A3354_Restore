@implementation _UIPointerInteractionPencilHoverDriver

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
  -[_UIPointerInteractionPencilHoverDriver _uninstallFromView:](self, "_uninstallFromView:", WeakRetained);

  v6 = objc_storeWeak((id *)p_view, obj);
  v7 = v6;
  if (obj)
  {
    v8 = objc_loadWeakRetained((id *)p_view);
    -[_UIPointerInteractionPencilHoverDriver _installToView:](self, "_installToView:", v8);

  }
}

- (void)_uninstallFromView:(id)a3
{
  objc_msgSend(a3, "removeGestureRecognizer:", self->_hoverGestureRecognizer);
}

- (_UIPointerInteractionPencilHoverDriver)initWithSink:(id)a3
{
  id v4;
  _UIPointerInteractionPencilHoverDriver *v5;
  _UIPointerInteractionPencilHoverDriver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPointerInteractionPencilHoverDriver;
  v5 = -[_UIPointerInteractionPencilHoverDriver init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_sink, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
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
  v3[2] = __52___UIPointerInteractionPencilHoverDriver_invalidate__block_invoke;
  v3[3] = &unk_1E16B3F40;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "_performBlockAfterCATransactionCommits:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (int64_t)type
{
  return 1;
}

- (BOOL)allowsUpdatesWhilePrimaryButtonIsPressed
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPointerInteractionPencilHoverDriver.m"), 93, CFSTR("Received updates from an unknown hover gesture recognizer."));

  }
  self->_flags.invalid = 0;
  -[_UIPointerInteractionPencilHoverDriver _updateHover:forced:](self, "_updateHover:forced:");

}

- (void)_updateHover:(id)a3 forced:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[7];
  char v21;
  _BYTE v22[7];
  uint64_t v23;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "state") == 3 || objc_msgSend(v6, "state") == 4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sink);
    objc_msgSend(WeakRetained, "driverDidExit:", self);

  }
  else if (objc_msgSend(v6, "state") >= 1)
  {
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_location3DInView:", v8);
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v15 = v4;
    memset(v22, 0, sizeof(v22));
    objc_msgSend(v6, "_maximumHoverHeight");
    v17 = v16;
    v18 = objc_msgSend(v6, "modifierFlags");
    v19 = objc_loadWeakRetained((id *)&self->_sink);
    v20[0] = v10;
    v20[1] = v12;
    v20[2] = v14;
    v20[3] = v17;
    v20[4] = v18;
    v20[5] = 0;
    v20[6] = v15;
    v21 = 0;
    v23 = 0;
    objc_msgSend(v19, "driver:didIssueUpdate:", self, v20);

  }
}

- (void)_installToView:(id)a3
{
  _UIPointerInteractionHoverGestureRecognizer *v4;
  _UIPointerInteractionHoverGestureRecognizer *hoverGestureRecognizer;
  id WeakRetained;
  id v7;

  v7 = a3;
  if (!self->_hoverGestureRecognizer)
  {
    v4 = -[UIHoverGestureRecognizer initWithTarget:action:]([_UIPointerInteractionHoverGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleHoverGesture_);
    hoverGestureRecognizer = self->_hoverGestureRecognizer;
    self->_hoverGestureRecognizer = v4;

    -[UIHoverGestureRecognizer _setAllowedTouchTypes:](self->_hoverGestureRecognizer, (uint64_t)&unk_1E1A94838);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_sink);
  objc_msgSend(WeakRetained, "driver:willAttachHoverGestureRecognizer:toView:", self, self->_hoverGestureRecognizer, v7);

  objc_msgSend(v7, "addGestureRecognizer:", self->_hoverGestureRecognizer);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

@end

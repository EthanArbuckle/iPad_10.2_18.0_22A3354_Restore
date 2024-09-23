@implementation _UITouchDownClickInteractionDriver

- (_UITouchDownClickInteractionDriver)init
{
  _UITouchDownClickInteractionDriver *v2;
  _UITouchDownGestureRecognizer *v3;
  _UITouchDownGestureRecognizer *gesture;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITouchDownClickInteractionDriver;
  v2 = -[_UITouchDownClickInteractionDriver init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_UITouchDownGestureRecognizer initWithTarget:action:]([_UITouchDownGestureRecognizer alloc], "initWithTarget:action:", v2, sel__handleGestureRecognizer_);
    gesture = v2->_gesture;
    v2->_gesture = v3;

    -[UIGestureRecognizer setDelegate:](v2->_gesture, "setDelegate:", v2);
  }
  return v2;
}

- (void)setView:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained != obj)
  {
    -[UIGestureRecognizer view](self->_gesture, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", self->_gesture);

    v6 = objc_storeWeak((id *)&self->_view, obj);
    objc_msgSend(obj, "addGestureRecognizer:", self->_gesture);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gesture, 0);
}

+ (BOOL)requiresForceCapability
{
  return 0;
}

+ (BOOL)prefersCancelsTouchesInView
{
  return 1;
}

- (double)maximumEffectProgress
{
  return 1.0;
}

- (double)touchDuration
{
  return 0.0;
}

- (BOOL)hasExceededAllowableMovement
{
  return 0;
}

- (UIGestureRecognizer)primaryGestureRecognizer
{
  return (UIGestureRecognizer *)self->_gesture;
}

- (BOOL)isCurrentlyAcceleratedByForce
{
  return 0;
}

- (void)cancelInteraction
{
  -[UIGestureRecognizer setEnabled:](self->_gesture, "setEnabled:", 0);
  -[UIGestureRecognizer setEnabled:](self->_gesture, "setEnabled:", 1);
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[_UITouchDownClickInteractionDriver view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UITouchDownGestureRecognizer locationInView:](self->_gesture, "locationInView:", v5);
    objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v4);
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)allowsFeedback
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  _UITouchDownGestureRecognizer *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = (_UITouchDownGestureRecognizer *)a3;
  v7 = a4;
  if (self->_gesture == v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[UIGestureRecognizer view](v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
      v10 = 1;
    else
      v10 = objc_msgSend(v8, "isDescendantOfView:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  if (self->_gesture == a3)
    return objc_msgSend(a4, "_isGestureType:", 3);
  else
    return 0;
}

- (void)_handleGestureRecognizer:(id)a3
{
  UIGestureRecognizerState v4;
  void *v5;
  _QWORD v6[5];

  v4 = -[UIGestureRecognizer state](self->_gesture, "state", a3);
  if ((unint64_t)(v4 - 4) >= 2)
  {
    if (v4 == UIGestureRecognizerStateEnded)
    {
      -[_UITouchDownClickInteractionDriver delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __63___UITouchDownClickInteractionDriver__handleGestureRecognizer___block_invoke;
      v6[3] = &unk_1E16C3F48;
      v6[4] = self;
      objc_msgSend(v5, "clickDriver:shouldBegin:", self, v6);

    }
  }
  else
  {
    -[_UITouchDownClickInteractionDriver cancelInteraction](self, "cancelInteraction");
  }
}

- (_UIClickInteractionDriverDelegate)delegate
{
  return (_UIClickInteractionDriverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (BOOL)cancelsTouchesInView
{
  return self->_cancelsTouchesInView;
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  self->_cancelsTouchesInView = a3;
}

- (BOOL)clicksUpAutomaticallyAfterTimeout
{
  return self->_clicksUpAutomaticallyAfterTimeout;
}

- (unint64_t)inputPrecision
{
  return self->_inputPrecision;
}

@end

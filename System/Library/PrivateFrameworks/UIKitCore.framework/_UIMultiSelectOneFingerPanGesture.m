@implementation _UIMultiSelectOneFingerPanGesture

- (void)setOneFingerPanDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_oneFingerPanDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_oneFingerPanDelegate);
  objc_storeStrong((id *)&self->_activeEvent, 0);
  objc_storeStrong((id *)&self->_activeTouch, 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  UITouch *v8;
  UITouch *activeTouch;
  double v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIMultiSelectOneFingerPanGesture;
  -[UIPanGestureRecognizer touchesBegan:withEvent:](&v11, sel_touchesBegan_withEvent_, v6, v7);
  if (!self->_activeTouch)
  {
    objc_msgSend(v6, "anyObject");
    v8 = (UITouch *)objc_claimAutoreleasedReturnValue();
    activeTouch = self->_activeTouch;
    self->_activeTouch = v8;

    objc_storeStrong((id *)&self->_activeEvent, a4);
  }
  -[UIPanGestureRecognizer _hysteresis](self, "_hysteresis");
  if (v10 < 0.00000011920929
    || -[_UIMultiSelectOneFingerPanGesture _preventsDragInteractionGestures](self, "_preventsDragInteractionGestures"))
  {
    -[UIGestureRecognizer setState:](self, "setState:", 1);
  }

}

- (void)reset
{
  UITouch *activeTouch;
  UIEvent *activeEvent;

  activeTouch = self->_activeTouch;
  self->_activeTouch = 0;

  activeEvent = self->_activeEvent;
  self->_activeEvent = 0;

}

- (BOOL)_preventsDragInteractionGestures
{
  _UIMultiSelectOneFingerPanGesture *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_oneFingerPanDelegate);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "multiSelectOneFingerPanGestureShouldPreventDragInteractionGesture:", v2);

  return (char)v2;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  UITouch *activeTouch;
  id v7;
  void *v8;

  v4 = a3;
  if (-[UIGestureRecognizer state](self, "state") <= UIGestureRecognizerStateBegan
    && objc_msgSend(v4, "_isGestureType:", 8))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    activeTouch = self->_activeTouch;
    v7 = v4;
    objc_msgSend(v5, "setWithObject:", activeTouch);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer _ignoreTouches:forEvent:](v7, v8, (uint64_t)self->_activeEvent);

  }
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = !-[_UIMultiSelectOneFingerPanGesture _preventsDragInteractionGestures](self, "_preventsDragInteractionGestures")
    && (_isDragInteractionGestureRecognizer(v4) & 1) != 0;

  return v5;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[_UIMultiSelectOneFingerPanGesture _preventsDragInteractionGestures](self, "_preventsDragInteractionGestures")
    && (_isDragInteractionGestureRecognizer(v4) & 1) != 0;

  return v5;
}

- (BOOL)_affectedByGesture:(id)a3
{
  return _isDragInteractionGestureRecognizer(a3);
}

- (UITouch)activeTouch
{
  return self->_activeTouch;
}

- (UIEvent)activeEvent
{
  return self->_activeEvent;
}

- (_UIMultiSelectOneFingerPanGestureDelegate)oneFingerPanDelegate
{
  return (_UIMultiSelectOneFingerPanGestureDelegate *)objc_loadWeakRetained((id *)&self->_oneFingerPanDelegate);
}

@end

@implementation UIDragGestureRecognizer

- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5
{
  return 0;
}

- (UIDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIDragGestureRecognizer *v4;
  UIDragGestureRecognizer *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIDragGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIGestureRecognizer setDelaysTouchesBegan:](v4, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 0);
    v6 = MEMORY[0x1E0C9AA60];
    -[UIGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    -[UIGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", v6);
    -[UIGestureRecognizer _setRequiresSystemGesturesToFail:](v5, "_setRequiresSystemGesturesToFail:", 0);
    *(_QWORD *)&v5->super._gestureFlags |= 0x100000000000uLL;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dragEvent);
}

- (_UIInternalDraggingSessionDestination)sessionDestination
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dragEvent);
  objc_msgSend(WeakRetained, "_sessionDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIInternalDraggingSessionDestination *)v3;
}

- (_UIDropSessionImpl)dropSession
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dragEvent);
  objc_msgSend(WeakRetained, "_dropSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIDropSessionImpl *)v3;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  int v11;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 9)
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dragEvent);
    v7 = WeakRetained;
    if (self && WeakRetained != v5 && (*(_QWORD *)&self->super._gestureFlags & 0x400000000000) != 0)
    {
      objc_msgSend(v5, "_dynamicGestureRecognizers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", self);

      if (!v11)
      {
        v9 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {

    }
    -[UIGestureRecognizer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && !objc_msgSend(v8, "_gestureRecognizer:shouldReceiveDragEvent:", self, v5))
    {
      v9 = 0;
    }
    else
    {
      objc_storeWeak((id *)&self->_dragEvent, v5);
      v9 = 1;
    }

    goto LABEL_14;
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "_dragEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDragGestureRecognizer _dragEvent](self, "_dragEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "_dragEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDragGestureRecognizer _dragEvent](self, "_dragEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CGPoint)locationInView:(id)a3
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
  -[UIDragGestureRecognizer _dragEvent](self, "_dragEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (UIDragEvent)_dragEvent
{
  return (UIDragEvent *)objc_loadWeakRetained((id *)&self->_dragEvent);
}

@end

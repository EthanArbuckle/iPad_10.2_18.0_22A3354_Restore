@implementation _UIControlEventsGestureRecognizer

- (void)setControlEventsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_controlEventsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controlEventsDelegate);
  objc_storeStrong((id *)&self->_activeTouch, 0);
}

- (void)sendControlEvent:(unint64_t)a3 withEvent:(id)a4
{
  id v7;

  -[_UIControlEventsGestureRecognizer controlEventsDelegate](self, "controlEventsDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controlEventsGestureRecognizer:recognizedControlEvent:withEvent:", self, a3, a4);

}

- (void)gestureRecognizerFailed
{
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateFailed
    && (*(_BYTE *)&self->_flags & 4) == 0)
  {
    -[_UIControlEventsGestureRecognizer sendControlEvent:withEvent:](self, "sendControlEvent:withEvent:", 256, 0);
    *(_BYTE *)&self->_flags |= 4u;
  }
}

- (void)reset
{
  UITouch *activeTouch;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIControlEventsGestureRecognizer;
  -[UIGestureRecognizer reset](&v4, sel_reset);
  if ((*(_BYTE *)&self->_flags & 4) == 0
    && -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateFailed)
  {
    -[_UIControlEventsGestureRecognizer sendControlEvent:withEvent:](self, "sendControlEvent:withEvent:", 256, 0);
  }
  *(_BYTE *)&self->_flags &= ~4u;
  activeTouch = self->_activeTouch;
  self->_activeTouch = 0;

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v6;
  BOOL v7;
  id v8;

  objc_msgSend(a3, "anyObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_activeTouch, v8);
  v6 = v8;
  if (v8)
  {
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | 1;
    -[_UIControlEventsGestureRecognizer sendControlEvent:withEvent:](self, "sendControlEvent:withEvent:", 1, a4);
    v7 = (unint64_t)objc_msgSend(v8, "tapCount") >= 2;
    v6 = v8;
    if (v7)
    {
      -[_UIControlEventsGestureRecognizer sendControlEvent:withEvent:](self, "sendControlEvent:withEvent:", 2, a4);
      v6 = v8;
    }
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char flags;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  objc_msgSend(a3, "anyObject");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_activeTouch, v21);
  v6 = v21;
  if (v21)
  {
    -[UIGestureRecognizer view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    flags = (char)self->_flags;
    -[UIGestureRecognizer view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[UIGestureRecognizer view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((isKindOfClass & 1) != 0)
      v17 = objc_msgSend(v15, "pointMostlyInside:withEvent:", a4, v9, v11);
    else
      v17 = objc_msgSend(v15, "pointInside:withEvent:", a4, v9, v11);
    v18 = v17;

    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | v18 | 2;
    if (((((flags & 1) == 0) ^ v18) & 1) == 0)
    {
      if (v18)
        v19 = 16;
      else
        v19 = 32;
      -[_UIControlEventsGestureRecognizer sendControlEvent:withEvent:](self, "sendControlEvent:withEvent:", v19, a4);
    }
    if (v18)
      v20 = 4;
    else
      v20 = 8;
    -[_UIControlEventsGestureRecognizer sendControlEvent:withEvent:](self, "sendControlEvent:withEvent:", v20, a4);
    v6 = v21;
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char flags;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;

  objc_msgSend(a3, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v23 = v6;
    -[UIGestureRecognizer view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    flags = (char)self->_flags;
    -[UIGestureRecognizer view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[UIGestureRecognizer view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((isKindOfClass & 1) != 0)
      v17 = objc_msgSend(v15, "pointMostlyInside:withEvent:", a4, v9, v11);
    else
      v17 = objc_msgSend(v15, "pointInside:withEvent:", a4, v9, v11);
    v18 = v17;

    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | v18;
    if (((((flags & 1) == 0) ^ v18) & 1) == 0)
    {
      if (v18)
        v19 = 16;
      else
        v19 = 32;
      -[_UIControlEventsGestureRecognizer sendControlEvent:withEvent:](self, "sendControlEvent:withEvent:", v19, a4);
    }
    if (v18)
      v20 = 64;
    else
      v20 = 128;
    -[_UIControlEventsGestureRecognizer sendControlEvent:withEvent:](self, "sendControlEvent:withEvent:", v20, a4);
    -[UIGestureRecognizer _allActiveTouches](self, "_allActiveTouches");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    v6 = v23;
    if (!v22)
    {
      -[UIGestureRecognizer setState:](self, "setState:", 3);
      v6 = v23;
    }
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[_UIControlEventsGestureRecognizer sendControlEvent:withEvent:](self, "sendControlEvent:withEvent:", 256, a4);
  *(_BYTE *)&self->_flags |= 4u;
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (UITouch)activeTouch
{
  return self->_activeTouch;
}

- (_UIControlEventsGestureRecognizerDelegate)controlEventsDelegate
{
  return (_UIControlEventsGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_controlEventsDelegate);
}

@end

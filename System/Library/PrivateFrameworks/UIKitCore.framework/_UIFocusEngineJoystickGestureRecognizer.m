@implementation _UIFocusEngineJoystickGestureRecognizer

- (_UIFocusEngineJoystickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIFocusEngineJoystickGestureRecognizer *result;
  CGPoint v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFocusEngineJoystickGestureRecognizer;
  result = -[UIGestureRecognizer initWithTarget:action:](&v6, sel_initWithTarget_action_, a3, a4);
  if (result)
  {
    v5 = (CGPoint)*MEMORY[0x1E0C9D538];
    result->_stickPosition = (CGPoint)*MEMORY[0x1E0C9D538];
    result->_previousStickPosition = v5;
  }
  return result;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "_source") == 2)
    v4 = objc_msgSend(v3, "_isAnalogStickPress");
  else
    v4 = 0;

  return v4;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "allPresses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEngineJoystickGestureRecognizer _calculateStickPositionFromPresses:withEvent:](self, "_calculateStickPositionFromPresses:withEvent:", v6, v5);

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "allPresses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEngineJoystickGestureRecognizer _calculateStickPositionFromPresses:withEvent:](self, "_calculateStickPositionFromPresses:withEvent:", v6, v5);

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "allPresses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEngineJoystickGestureRecognizer _calculateStickPositionFromPresses:withEvent:](self, "_calculateStickPositionFromPresses:withEvent:", v6, v5);

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "allPresses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEngineJoystickGestureRecognizer _calculateStickPositionFromPresses:withEvent:](self, "_calculateStickPositionFromPresses:withEvent:", v6, v5);

}

- (void)_calculateStickPositionFromPresses:(id)a3 withEvent:(id)a4
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint *p_stickPosition;
  _BOOL4 v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  v9 = v7;
  v10 = v6;
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v25;
    v9 = v7;
    v10 = v6;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (-[_UIFocusEngineJoystickGestureRecognizer _shouldReceivePress:](self, "_shouldReceivePress:", v14))
        {
          if (!objc_msgSend(v14, "type"))
          {
            objc_msgSend(v14, "force");
            v9 = v15;
          }
          if (objc_msgSend(v14, "type") == 1)
          {
            objc_msgSend(v14, "force");
            v9 = -v16;
          }
          if (objc_msgSend(v14, "type") == 3)
          {
            objc_msgSend(v14, "force");
            v10 = v17;
          }
          if (objc_msgSend(v14, "type") == 2)
          {
            objc_msgSend(v14, "force");
            v10 = -v18;
          }
        }
      }
      v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }
  p_stickPosition = &self->_stickPosition;
  if (v10 != self->_stickPosition.x || v9 != self->_stickPosition.y)
  {
    self->_previousStickPosition = *p_stickPosition;
    p_stickPosition->x = v10;
    self->_stickPosition.y = v9;
    v21 = v9 == v7 && v10 == v6;
    if (self->_previousStickPosition.x != v6 || self->_previousStickPosition.y != v7)
    {
      if (v21)
        v23 = 3;
      else
        v23 = 2;
      goto LABEL_33;
    }
    if (!v21)
    {
      v23 = 1;
LABEL_33:
      -[UIGestureRecognizer setState:](self, "setState:", v23);
    }
  }

}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 17;
}

- (CGPoint)stickPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_stickPosition.x;
  y = self->_stickPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)previousStickPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousStickPosition.x;
  y = self->_previousStickPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

@end

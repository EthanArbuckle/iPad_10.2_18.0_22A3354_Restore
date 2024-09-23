@implementation UIHBClickGestureRecognizer

- (UIHBClickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIHBClickGestureRecognizer *v4;
  UIHBClickGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIHBClickGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_clickCount = 1;
    v4->_lastSeenClickCount = 0;
    v4->_recognizesOnPressPhaseBegan = 0;
    -[UIGestureRecognizer setAllowedTouchTypes:](v4, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    -[UIGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", &unk_1E1A93518);
  }
  return v5;
}

- (void)_resetGestureRecognizer
{
  UIPressesEvent *registeredEventForTerminalEvents;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIHBClickGestureRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v4, sel__resetGestureRecognizer);
  -[UIPressesEvent _unregisterForTerminalEvent:](self->_registeredEventForTerminalEvents, "_unregisterForTerminalEvent:", self);
  registeredEventForTerminalEvents = self->_registeredEventForTerminalEvents;
  self->_registeredEventForTerminalEvents = 0;

  self->_lastSeenClickCount = 0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  UIPressesEvent **p_registeredEventForTerminalEvents;

  p_registeredEventForTerminalEvents = &self->_registeredEventForTerminalEvents;
  if (!*p_registeredEventForTerminalEvents)
  {
    objc_storeStrong((id *)p_registeredEventForTerminalEvents, a4);
    objc_msgSend(a4, "_registerForTerminalEvent:", self);
  }
  -[UIHBClickGestureRecognizer _processPresses:](self, "_processPresses:", a3, a4);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if (-[UIGestureRecognizer state](self, "state", a3, a4) > UIGestureRecognizerStatePossible)
    v5 = 4;
  else
    v5 = 5;
  -[UIGestureRecognizer setState:](self, "setState:", v5);
}

- (void)_succeed
{
  -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)_fail
{
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
    -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)_processPresses:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        self->_lastSeenClickCount = objc_msgSend(v9, "clickCount", (_QWORD)v11);
        if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
        {
          if (objc_msgSend(v9, "clickCount") == self->_clickCount)
          {
            if (self->_recognizesOnPressPhaseBegan || objc_msgSend(v9, "phase") == 3)
              -[UIHBClickGestureRecognizer _succeed](self, "_succeed");
          }
          else if (objc_msgSend(v9, "clickCount") > self->_clickCount)
          {
            -[UIHBClickGestureRecognizer _fail](self, "_fail");
          }
        }
        ++v8;
      }
      while (v6 != v8);
      v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = v10;
    }
    while (v10);
  }

}

- (void)pressesEventDidReceiveTerminal:(id)a3
{
  if (self
    && (*(_QWORD *)&self->super._gestureFlags & 0x200000000) != 0
    && -[UIGestureRecognizer state](self, "state", a3) == UIGestureRecognizerStatePossible
    && self->_lastSeenClickCount != self->_clickCount)
  {
    -[UIHBClickGestureRecognizer _fail](self, "_fail");
  }
}

- (unint64_t)clickCount
{
  return self->_clickCount;
}

- (void)setClickCount:(unint64_t)a3
{
  self->_clickCount = a3;
}

- (BOOL)recognizesOnPressPhaseBegan
{
  return self->_recognizesOnPressPhaseBegan;
}

- (void)setRecognizesOnPressPhaseBegan:(BOOL)a3
{
  self->_recognizesOnPressPhaseBegan = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredEventForTerminalEvents, 0);
}

@end

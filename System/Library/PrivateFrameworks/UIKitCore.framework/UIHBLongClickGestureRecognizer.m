@implementation UIHBLongClickGestureRecognizer

- (UIHBLongClickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIHBLongClickGestureRecognizer *v4;
  UIHBLongClickGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIHBLongClickGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_lastSeenClickCount = 0;
    -[UIGestureRecognizer setAllowedTouchTypes:](v4, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    -[UIGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", &unk_1E1A93548);
  }
  return v5;
}

- (void)_resetGestureRecognizer
{
  UIPressesEvent *registeredEventForTerminalEvents;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIHBLongClickGestureRecognizer;
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
  -[UIHBLongClickGestureRecognizer _processPresses:](self, "_processPresses:", a3, a4);
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
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (unint64_t)_effectiveNumberOfClicksRequired
{
  return self->_numberOfClicksRequired + 1;
}

- (BOOL)_requiredClickCountMetForPress:(id)a3
{
  unint64_t v4;

  v4 = -[UIHBLongClickGestureRecognizer _effectiveNumberOfClicksRequired](self, "_effectiveNumberOfClicksRequired");
  return v4 == objc_msgSend(a3, "clickCount");
}

- (void)_processPresses:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        self->_lastSeenClickCount = objc_msgSend(v9, "clickCount", (_QWORD)v13);
        if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
        {
          v10 = -[UIHBLongClickGestureRecognizer _requiredClickCountMetForPress:](self, "_requiredClickCountMetForPress:", v9);
          v11 = objc_msgSend(v9, "isLongClick");
          if (!v10)
          {
            if (!v11)
              goto LABEL_7;
LABEL_15:
            -[UIHBLongClickGestureRecognizer _fail](self, "_fail");
            goto LABEL_7;
          }
          if (v11)
          {
            -[UIHBLongClickGestureRecognizer _succeed](self, "_succeed");
            goto LABEL_7;
          }
          if (objc_msgSend(v9, "phase") == 3)
            goto LABEL_15;
        }
LABEL_7:
        ++v8;
      }
      while (v6 != v8);
      v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 = v12;
    }
    while (v12);
  }

}

- (void)pressesEventDidReceiveTerminal:(id)a3
{
  unint64_t lastSeenClickCount;

  if (self
    && (*(_QWORD *)&self->super._gestureFlags & 0x200000000) != 0
    && -[UIGestureRecognizer state](self, "state", a3) == UIGestureRecognizerStatePossible)
  {
    lastSeenClickCount = self->_lastSeenClickCount;
    if (lastSeenClickCount != -[UIHBLongClickGestureRecognizer _effectiveNumberOfClicksRequired](self, "_effectiveNumberOfClicksRequired"))-[UIHBLongClickGestureRecognizer _fail](self, "_fail");
  }
}

- (unint64_t)numberOfClicksRequired
{
  return self->_numberOfClicksRequired;
}

- (void)setNumberOfClicksRequired:(unint64_t)a3
{
  self->_numberOfClicksRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredEventForTerminalEvents, 0);
}

@end

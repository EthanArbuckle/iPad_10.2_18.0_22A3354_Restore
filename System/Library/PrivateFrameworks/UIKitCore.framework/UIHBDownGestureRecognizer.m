@implementation UIHBDownGestureRecognizer

- (UIHBDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIHBDownGestureRecognizer *v4;
  UIHBDownGestureRecognizer *v5;
  uint64_t v6;
  NSSet *requiredPressTypes;
  uint64_t v8;
  NSMutableSet *currentlyPressedTypes;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIHBDownGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v11, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_maximumIntervalBetweenPresses = 0.25;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    requiredPressTypes = v5->_requiredPressTypes;
    v5->_requiredPressTypes = (NSSet *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    currentlyPressedTypes = v5->_currentlyPressedTypes;
    v5->_currentlyPressedTypes = (NSMutableSet *)v8;

    -[UIGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    -[UIHBDownGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", &unk_1E1A93530);
  }
  return v5;
}

- (void)setAllowedPressTypes:(id)a3
{
  NSSet *v5;
  NSSet *requiredPressTypes;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIHBDownGestureRecognizer;
  -[UIGestureRecognizer setAllowedPressTypes:](&v7, sel_setAllowedPressTypes_);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  requiredPressTypes = self->_requiredPressTypes;
  self->_requiredPressTypes = v5;

}

- (void)_resetGestureRecognizer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIHBDownGestureRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v3, sel__resetGestureRecognizer);
  -[NSMutableSet removeAllObjects](self->_currentlyPressedTypes, "removeAllObjects");
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  UIDelayedAction *v6;
  UIDelayedAction *v7;
  UIDelayedAction *delayedAction;

  if (-[NSSet count](self->_requiredPressTypes, "count", a3, a4) && !self->_delayedAction)
  {
    v6 = [UIDelayedAction alloc];
    v7 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v6, "initWithTarget:action:userInfo:delay:mode:", self, sel__fail, 0, *MEMORY[0x1E0C99860], self->_maximumIntervalBetweenPresses);
    delayedAction = self->_delayedAction;
    self->_delayedAction = v7;

  }
  -[UIHBDownGestureRecognizer _processPresses:](self, "_processPresses:", a3);
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
  UIDelayedAction *delayedAction;

  -[UIDelayedAction cancel](self->_delayedAction, "cancel");
  delayedAction = self->_delayedAction;
  self->_delayedAction = 0;

  -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)_fail
{
  UIDelayedAction *delayedAction;

  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    -[UIDelayedAction cancel](self->_delayedAction, "cancel");
    delayedAction = self->_delayedAction;
    self->_delayedAction = 0;

    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
}

- (void)_processPresses:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableSet *currentlyPressedTypes;
  void *v11;
  NSMutableSet *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "phase", (_QWORD)v14))
        {
          if (objc_msgSend(v9, "phase") == 3)
          {
            currentlyPressedTypes = self->_currentlyPressedTypes;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "type"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet removeObject:](currentlyPressedTypes, "removeObject:", v11);

            -[UIHBDownGestureRecognizer _fail](self, "_fail");
          }
        }
        else
        {
          v12 = self->_currentlyPressedTypes;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "type"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](v12, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    if (-[UIHBDownGestureRecognizer _allRequiredButtonsDown](self, "_allRequiredButtonsDown"))
      -[UIHBDownGestureRecognizer _succeed](self, "_succeed");
  }
}

- (BOOL)_allRequiredButtonsDown
{
  return -[NSSet isEqual:](self->_requiredPressTypes, "isEqual:", self->_currentlyPressedTypes);
}

- (double)maximumIntervalBetweenPresses
{
  return self->_maximumIntervalBetweenPresses;
}

- (void)setMaximumIntervalBetweenPresses:(double)a3
{
  self->_maximumIntervalBetweenPresses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredPressTypes, 0);
  objc_storeStrong((id *)&self->_currentlyPressedTypes, 0);
  objc_storeStrong((id *)&self->_delayedAction, 0);
}

@end

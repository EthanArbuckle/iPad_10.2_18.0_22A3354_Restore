@implementation _UISimplePressGestureRecognizer

- (void)setTriggers:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_triggers, a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v16 = 0u;
        v17 = 0u;
        if (v12)
        {
          objc_msgSend(v12, "_UIPressTriggerValue");
          v13 = v16;
        }
        else
        {
          v13 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v15.receiver = self;
  v15.super_class = (Class)_UISimplePressGestureRecognizer;
  -[UIGestureRecognizer setAllowedPressTypes:](&v15, sel_setAllowedPressTypes_, v6);

}

- (_UISimplePressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UISimplePressGestureRecognizer *v4;
  _UISimplePressGestureRecognizer *v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UISimplePressGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)_UISimplePressGestureRecognizer;
    -[UIGestureRecognizer setAllowedTouchTypes:](&v7, sel_setAllowedTouchTypes_, MEMORY[0x1E0C9AA60]);
  }
  return v5;
}

- (void)dealloc
{
  UIDelayedAction *delayedAction;
  objc_super v4;

  -[UIDelayedAction cancel](self->_delayedAction, "cancel");
  delayedAction = self->_delayedAction;
  self->_delayedAction = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UISimplePressGestureRecognizer;
  -[UIGestureRecognizer dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_activeTrigger, 0);
  objc_storeStrong((id *)&self->_delayedAction, 0);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UIDelayedAction *v20;
  UIDelayedAction *delayedAction;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_activeTrigger)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v6);
          -[UIGestureRecognizer ignorePress:forEvent:](self, "ignorePress:forEvent:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), v7);
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v9);
    }
  }
  else if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    objc_msgSend(v6, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[_UISimplePressGestureRecognizer triggers](self, "triggers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      while (2)
      {
        v16 = 0;
        v22 = v14;
        do
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v16);
          if (v17)
            objc_msgSend(v17, "_UIPressTriggerValue");
          if (!objc_msgSend(v12, "type"))
          {
            objc_msgSend(v12, "key");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "modifierFlags");

            v14 = v22;
            if (!v19)
            {
              objc_storeStrong((id *)&self->_activeTrigger, v17);
              if (fabs(0.0) >= 2.22044605e-16)
              {
                v20 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel__begin, 0, 0.0);
                delayedAction = self->_delayedAction;
                self->_delayedAction = v20;

              }
              else
              {
                -[_UISimplePressGestureRecognizer _begin](self, "_begin");
              }

              goto LABEL_28;
            }
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v14)
          continue;
        break;
      }
    }

    -[_UISimplePressGestureRecognizer _endOrFail](self, "_endOrFail");
LABEL_28:

  }
  else
  {
    -[_UISimplePressGestureRecognizer _endOrFail](self, "_endOrFail");
  }

}

- (void)reset
{
  UIDelayedAction *delayedAction;
  NSValue *activeTrigger;

  -[UIDelayedAction cancel](self->_delayedAction, "cancel");
  delayedAction = self->_delayedAction;
  self->_delayedAction = 0;

  activeTrigger = self->_activeTrigger;
  self->_activeTrigger = 0;

}

- (void)_begin
{
  -[UIGestureRecognizer setState:](self, "setState:", 1);
}

- (void)_endOrFail
{
  uint64_t v3;
  NSValue *activeTrigger;

  if (-[UIGestureRecognizer state](self, "state") <= UIGestureRecognizerStateChanged)
  {
    if (-[UIGestureRecognizer state](self, "state"))
      v3 = 3;
    else
      v3 = 5;
    -[UIGestureRecognizer setState:](self, "setState:", v3);
  }
  activeTrigger = self->_activeTrigger;
  self->_activeTrigger = 0;

}

- (void)_cancelOrFail
{
  uint64_t v3;
  NSValue *activeTrigger;

  if (-[UIGestureRecognizer state](self, "state") <= UIGestureRecognizerStateChanged)
  {
    if (-[UIGestureRecognizer state](self, "state"))
      v3 = 4;
    else
      v3 = 5;
    -[UIGestureRecognizer setState:](self, "setState:", v3);
  }
  activeTrigger = self->_activeTrigger;
  self->_activeTrigger = 0;

}

- (UIDelayedAction)delayedAction
{
  return self->_delayedAction;
}

- (void)setDelayedAction:(id)a3
{
  objc_storeStrong((id *)&self->_delayedAction, a3);
}

- (NSValue)activeTrigger
{
  return self->_activeTrigger;
}

- (NSArray)triggers
{
  return self->_triggers;
}

@end

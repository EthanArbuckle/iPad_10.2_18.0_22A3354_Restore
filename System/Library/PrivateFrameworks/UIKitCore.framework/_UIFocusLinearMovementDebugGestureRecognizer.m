@implementation _UIFocusLinearMovementDebugGestureRecognizer

- (_UIFocusLinearMovementDebugGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  return -[_UIFocusLinearMovementDebugGestureRecognizer initWithTarget:action:allowsGroupMode:](self, "initWithTarget:action:allowsGroupMode:", a3, a4, 0);
}

- (_UIFocusLinearMovementDebugGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 allowsGroupMode:(BOOL)a5
{
  _BOOL4 v5;
  _UIFocusLinearMovementDebugGestureRecognizer *v6;
  uint64_t v7;
  NSMutableSet *presses;
  void *v9;
  objc_super v11;

  v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)_UIFocusLinearMovementDebugGestureRecognizer;
  v6 = -[UIGestureRecognizer initWithTarget:action:](&v11, sel_initWithTarget_action_, a3, a4);
  if (v6)
  {
    v7 = objc_opt_new();
    presses = v6->_presses;
    v6->_presses = (NSMutableSet *)v7;

    if (v5)
    {
      objc_msgSend(&unk_1E1A94C58, "arrayByAddingObjectsFromArray:", &unk_1E1A94C70);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = &unk_1E1A94C58;
    }
    -[UIGestureRecognizer setAllowedPressTypes:](v6, "setAllowedPressTypes:", v9);
    -[UIGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    -[UIGestureRecognizer setCancelsTouchesInView:](v6, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v6, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v6, "setDelaysTouchesEnded:", 0);
    -[UIGestureRecognizer _setAcceptsFailureRequiments:](v6, "_setAcceptsFailureRequiments:", 0);
    v6->_allowsGroupMode = v5;

  }
  return v6;
}

- (void)_update
{
  _UIFocusLinearMovementDebugGestureRecognizer *v2;
  uint64_t v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _UIFocusLinearMovementDebugGestureRecognizer *v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v2 = self;
  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = 288;
  v4 = self->_presses;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v22 = v2;
    obj = v4;
    v21 = 288;
    LOBYTE(v7) = 0;
    v8 = 0;
    LOBYTE(v4) = 0;
    v24 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "key", v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "modifierFlags");

        objc_msgSend(v10, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "modifierFlags");

        objc_msgSend(v10, "key");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "charactersIgnoringModifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
        {
          v8 = 1;
        }
        else
        {
          objc_msgSend(v10, "key");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v8 |= (objc_msgSend(v17, "modifierFlags") & 0xFFFFFFFFFFF3FFFFLL) != 0;

        }
        LODWORD(v4) = v4 & 1 | ((v12 & 0x80000) != 0);
        v7 = v7 & 1u | ((v14 & 0x40000) != 0);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);

    v3 = v21;
    v2 = v22;
    if ((_DWORD)v4)
    {
      if ((_DWORD)v7)
      {
        if (!(!v22->_allowsGroupMode | v8 & 1))
          goto LABEL_20;
      }
      else if ((v8 & 1) == 0)
      {
LABEL_20:
        -[_UIFocusLinearMovementDebugGestureRecognizer setGroupMode:](v22, "setGroupMode:", v7);
        v18 = -[UIGestureRecognizer state](v22, "state") == UIGestureRecognizerStatePossible;
        v19 = 1;
        goto LABEL_21;
      }
    }
  }
  else
  {

  }
  if (-[UIGestureRecognizer state](v2, "state") == UIGestureRecognizerStatePossible)
  {
    v20 = 5;
    goto LABEL_24;
  }
  v18 = objc_msgSend(*(id *)((char *)&v2->super.super.isa + v3), "count") == 0;
  v19 = 3;
LABEL_21:
  if (v18)
    v20 = v19;
  else
    v20 = v19 + 1;
LABEL_24:
  -[UIGestureRecognizer setState:](v2, "setState:", v20);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableSet addObject:](self->_presses, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[_UIFocusLinearMovementDebugGestureRecognizer _update](self, "_update");

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableSet removeObject:](self->_presses, "removeObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[_UIFocusLinearMovementDebugGestureRecognizer _update](self, "_update");

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableSet removeObject:](self->_presses, "removeObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[_UIFocusLinearMovementDebugGestureRecognizer _update](self, "_update");

}

- (void)reset
{
  -[NSMutableSet removeAllObjects](self->_presses, "removeAllObjects");
}

- (BOOL)isGroupMode
{
  return self->_groupMode;
}

- (void)setGroupMode:(BOOL)a3
{
  self->_groupMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presses, 0);
  objc_storeStrong((id *)&self->_press, 0);
}

@end

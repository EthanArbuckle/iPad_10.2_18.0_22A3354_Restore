@implementation UIPressesEvent

- (id)_allPresses
{
  return (id)-[NSMutableSet copy](self->_allPresses, "copy");
}

- (id)_init
{
  _QWORD *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPressesEvent;
  v2 = -[UIEvent _init](&v6, sel__init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = (void *)v2[15];
    v2[15] = v3;

  }
  return v2;
}

- (int64_t)type
{
  return 3;
}

- (int64_t)subtype
{
  return 0;
}

- (id)_cloneEvent
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPressesEvent;
  v3 = -[UIEvent _cloneEvent](&v7, sel__cloneEvent);
  v4 = -[NSMutableSet mutableCopy](self->_allPresses, "mutableCopy");
  v5 = (void *)v3[15];
  v3[15] = v4;

  return v3;
}

- (NSSet)pressesForGestureRecognizer:(UIGestureRecognizer *)gesture
{
  UIGestureRecognizer *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = gesture;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UIPressesEvent _allPresses](self, "_allPresses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "gestureRecognizers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return (NSSet *)v14;
}

- (id)_allWindows
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_allPresses;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "window", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (int64_t)_modifierFlags
{
  int64_t v2;
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->super._hasValidModifiers)
  {
    v13.receiver = self;
    v13.super_class = (Class)UIPressesEvent;
    return -[UIEvent _modifierFlags](&v13, sel__modifierFlags);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_allPresses;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    if (v4)
    {
      v5 = v4;
      v2 = 0;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v2 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "modifierFlags", (_QWORD)v9);
        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
      }
      while (v5);
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (id)_pressesForWindow:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_allPresses;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "window", (_QWORD)v14);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_respondersForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIPressesEvent _pressesForWindow:](self, "_pressesForWindow:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "responder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_pressesForPhase:(int64_t)a3
{
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_allPresses;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "phase", (_QWORD)v12) == a3 && (objc_msgSend(v10, "isDelayed") & 1) == 0)
        {
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "addObject:", v10);
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_pressesForResponder:(id)a3 withPhase:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UIPressesEvent _pressesForPhase:](self, "_pressesForPhase:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "responder");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 == v6)
        {
          if (!v10)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v10, "addObject:", v13);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_pressesForGestureRecognizer:(id)a3 withPhase:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIPressesEvent pressesForGestureRecognizer:](self, "pressesForGestureRecognizer:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v13, "phase") == a4)
        {
          if (!v10)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v10, "addObject:", v13);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIPressesEvent _pressesForWindow:](self, "_pressesForWindow:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "gestureRecognizers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (!v8)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v8, "addObjectsFromArray:", v11);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v13, "_eventComponentType") != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPressesEvent.m"), 211, CFSTR("Wrong component type for event: %@; component: %@"),
            self,
            v13);

        }
        objc_msgSend(v13, "_removeGestureRecognizer:", v7);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)_addPress:(id)a3 forDelayedDelivery:(BOOL)a4
{
  id v6;

  v6 = a3;
  -[NSMutableSet addObject:](self->_allPresses, "addObject:", v6);
  if (!objc_msgSend(v6, "phase") && !a4)
    -[UIPressesEvent _addGesturesForPress:](self, "_addGesturesForPress:", v6);

}

- (void)_addGesturesForPress:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "responder");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 0;
    do
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v6, "gestureRecognizers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v18;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
              if (objc_msgSend(v13, "isEnabled")
                && objc_msgSend(v13, "state") <= 2
                && -[UIGestureRecognizer _shouldReceivePress:forPressesEvent:]((uint64_t)v13, (uint64_t)v4, (uint64_t)self))
              {
                if (!v7)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v7 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v7, "addObject:", v13);
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v10);
        }

        if (_IsKindOfUIView((uint64_t)v6))
        {
          v14 = v6;
          objc_msgSend(v4, "type");
          v15 = objc_msgSend(v14, "deliversPressesForGesturesToSuperview");

          if (!v15)
            break;
        }
      }
      objc_msgSend(v6, "nextResponder");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v6 = v14;
    }
    while (v14);
  }
  else
  {
    v14 = 0;
    v7 = 0;
  }
  v16 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setGestureRecognizers:", v16);

}

- (void)_removePress:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setResponder:", 0);
  objc_msgSend(v4, "setWindow:", 0);
  -[NSMutableSet removeObject:](self->_allPresses, "removeObject:", v4);

}

- (id)_directionalPressWithStrongestForce
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[UIPressesEvent allPresses](self, "allPresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "_isDirectionalPress"))
        {
          objc_msgSend(v8, "force");
          v10 = v9;
          objc_msgSend(v5, "force");
          if (v10 > v11)
          {
            v12 = v8;

            v5 = v12;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UIPressesEvent allPresses](self, "allPresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p presses: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)_registerForTerminalEvent:(id)a3
{
  id v5;
  NSHashTable *terminalEventRegistrants;
  NSHashTable *v7;
  NSHashTable *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPressesEvent.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registrant"));

    v5 = 0;
  }
  terminalEventRegistrants = self->_terminalEventRegistrants;
  if (!terminalEventRegistrants)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_terminalEventRegistrants;
    self->_terminalEventRegistrants = v7;

    v5 = v10;
    terminalEventRegistrants = self->_terminalEventRegistrants;
  }
  -[NSHashTable addObject:](terminalEventRegistrants, "addObject:", v5);

}

- (void)_unregisterForTerminalEvent:(id)a3
{
  -[NSHashTable removeObject:](self->_terminalEventRegistrants, "removeObject:", a3);
}

- (id)_terminalRegistrantsForPressType:(int64_t)a3
{
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_terminalEventRegistrants;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "allowedPressTypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "containsObject:", v12);

        if (v13)
          objc_msgSend(v15, "addObject:", v10);
      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v15;
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "state") > 2)
  {
    v7 = 0;
  }
  else
  {
    -[UIPressesEvent _pressesForGestureRecognizer:withPhase:](self, "_pressesForGestureRecognizer:withPhase:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    v7 = v6 != 0;
    if (v6)
      objc_msgSend(v4, "_componentsBegan:withEvent:", v5, self);
    -[UIPressesEvent _pressesForGestureRecognizer:withPhase:](self, "_pressesForGestureRecognizer:withPhase:", v4, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v4, "_componentsChanged:withEvent:", v8, self);
      v7 = 1;
    }
    -[UIPressesEvent _pressesForGestureRecognizer:withPhase:](self, "_pressesForGestureRecognizer:withPhase:", v4, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v4, "_componentsEnded:withEvent:", v9, self);
      v7 = 1;
    }
    -[UIPressesEvent _pressesForGestureRecognizer:withPhase:](self, "_pressesForGestureRecognizer:withPhase:", v4, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v4, "_componentsCancelled:withEvent:", v10, self);
      v7 = 1;
    }

  }
  return v7;
}

- (void)_removeComponents:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "_eventComponentType") != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPressesEvent.m"), 345, CFSTR("Unexpected event component type: %ld"), objc_msgSend(v10, "_eventComponentType"));

        }
        -[UIPressesEvent _removePress:](self, "_removePress:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_cancelComponents:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD aBlock[6];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[6];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __36__UIPressesEvent__cancelComponents___block_invoke;
  v51[3] = &unk_1E16DF0A0;
  v51[4] = self;
  v51[5] = a2;
  objc_msgSend(v5, "objectsPassingTest:", v51);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v48 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "phase");
        aBlock[0] = v6;
        aBlock[1] = 3221225472;
        aBlock[2] = __36__UIPressesEvent__cancelComponents___block_invoke_2;
        aBlock[3] = &unk_1E16B1888;
        aBlock[4] = v13;
        aBlock[5] = v14;
        v15 = _Block_copy(aBlock);
        objc_msgSend(v7, "addObject:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v10);
  }

  objc_msgSend((id)UIApp, "_cancelViewProcessingOfTouchesOrPresses:withEvent:sendingCancelToViewsOfTouchesOrPresses:", v8, self, v33);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(v16);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j) + 16))();
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v18);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v21 = v8;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v26, "gestureRecognizers");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v35;
          do
          {
            for (m = 0; m != v29; ++m)
            {
              if (*(_QWORD *)v35 != v30)
                objc_enumerationMutation(v27);
              -[UIGestureRecognizer _pressWasCancelled:](*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * m), v26);
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
          }
          while (v29);
        }

        objc_msgSend((id)UIApp, "_gestureDelayedEventComponentDispatcher");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIGestureDelayedEventComponentDispatcher removePress:]((uint64_t)v32, v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    }
    while (v23);
  }

}

BOOL __36__UIPressesEvent__cancelComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v7;

  v3 = a2;
  if (objc_msgSend(v3, "_eventComponentType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("UIPressesEvent.m"), 353, CFSTR("Unexpected event component type: %ld"), objc_msgSend(v3, "_eventComponentType"));

  }
  objc_msgSend((id)UIApp, "_gestureDelayedEventComponentDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = !-[UIGestureDelayedEventComponentDispatcher pressesBeganWasDelayedForPress:]((uint64_t)v4, v3)
    && objc_msgSend(v3, "phase") != 0;

  return v5;
}

uint64_t __36__UIPressesEvent__cancelComponents___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPhase:", *(_QWORD *)(a1 + 40));
}

- (UIPress)_lastPreparedPress
{
  return self->_lastPreparedPress;
}

- (void)set_lastPreparedPress:(id)a3
{
  objc_storeStrong((id *)&self->_lastPreparedPress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPreparedPress, 0);
  objc_storeStrong((id *)&self->_terminalEventRegistrants, 0);
  objc_storeStrong((id *)&self->_allPresses, 0);
}

@end

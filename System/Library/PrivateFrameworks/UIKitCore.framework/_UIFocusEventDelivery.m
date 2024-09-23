@implementation _UIFocusEventDelivery

- (_UIFocusEventDelivery)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Unable to initialize %@ by calling %@."), v7, v8);

  return 0;
}

- (_UIFocusEventDelivery)initWithFocusSystem:(id)a3
{
  id v4;
  _UIFocusEventDelivery *v5;
  _UIFocusEventDelivery *v6;
  uint64_t v7;
  NSMutableSet *keyboardPressEventForwardingMap;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFocusEventDelivery;
  v5 = -[_UIFocusEventDelivery init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_focusSystem, v4);
    v7 = objc_opt_new();
    keyboardPressEventForwardingMap = v6->_keyboardPressEventForwardingMap;
    v6->_keyboardPressEventForwardingMap = (NSMutableSet *)v7;

  }
  return v6;
}

- (UIFocusSystem)focusSystem
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEventDelivery.m"), 54, CFSTR("Unable to access focus system. This probably means that the focus system has been deallocated but its event delivery object is still around. This should never happen and is a UIKit bug."));

  }
  return (UIFocusSystem *)WeakRetained;
}

- (BOOL)_movementParticipatesInCooldown:(int64_t)a3
{
  return ((unint64_t)a3 > 5) | (0xEu >> a3) & 1;
}

- (BOOL)shouldDeliverFocusKeyboardEvent:(id)a3 toResponder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v16;

  v6 = a4;
  v16 = 0;
  v7 = a3;
  v8 = _UIFocusResponderMovementForPhysicalKeyboardEvent(v7, &v16);
  -[_UIFocusEventDelivery keyboardPressEventForwardingMap](self, "keyboardPressEventForwardingMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if ((v10 & 1) == 0)
  {
    -[_UIFocusEventDelivery focusSystem](self, "focusSystem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "behavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "deliverKeyEventsToFocusEngine");
    if (v14 == 2)
    {
      if (self->_lastDeliveredMovement != v8
        || !-[_UIFocusEventDelivery _movementParticipatesInCooldown:](self, "_movementParticipatesInCooldown:", v8)
        || CFAbsoluteTimeGetCurrent() - self->_lastDeliveredTimestamp >= 0.5)
      {
        if (!v8)
        {
LABEL_12:
          v11 = 0;
          goto LABEL_13;
        }
        if (!v16)
        {
          v11 = objc_msgSend(v6, "_shouldForwardMovementToFocusEngine:", v8);
          goto LABEL_13;
        }
      }
    }
    else if (v14 != 1)
    {
      goto LABEL_12;
    }
    v11 = 1;
LABEL_13:

    goto LABEL_14;
  }
  v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)shouldSkipKeyCommand:(id)a3 whenDeliveringFocusKeyboardEvent:(id)a4 toResponder:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v8 = a3;
  v9 = a5;
  v10 = _UIFocusResponderMovementForPhysicalKeyboardEvent(a4, 0);
  -[_UIFocusEventDelivery focusSystem](self, "focusSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "behavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "skipKeyCommandsForKeyEvents");
  if (v13 == 1)
  {
    LOBYTE(v10) = 1;
  }
  else if (v13 == 2)
  {
    if (v10)
      LOBYTE(v10) = objc_msgSend(v9, "_shouldSkipKeyCommand:forMovement:", v8, v10);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)willDeliverFocusKeyboardEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_lastDeliveredTimestamp = CFAbsoluteTimeGetCurrent();
  self->_lastDeliveredMovement = _UIFocusResponderMovementForPhysicalKeyboardEvent(v4, 0);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "allPresses", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!objc_msgSend(v10, "phase") || objc_msgSend(v10, "phase") == 1 || objc_msgSend(v10, "phase") == 2)
        {

          -[NSMutableSet addObject:](self->_keyboardPressEventForwardingMap, "addObject:", v4);
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[NSMutableSet removeObject:](self->_keyboardPressEventForwardingMap, "removeObject:", v4);
LABEL_13:

}

- (NSMutableSet)keyboardPressEventForwardingMap
{
  return self->_keyboardPressEventForwardingMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardPressEventForwardingMap, 0);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end

@implementation UIEventEnvironment

- (void)_clearTouchesOfView:(uint64_t)a3 onWindow:
{
  _UIEventEnvironmentClearTouchesContext *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFDictionary *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = [_UIEventEnvironmentClearTouchesContext alloc];
    if (v6)
    {
      v19.receiver = v6;
      v19.super_class = (Class)_UIEventEnvironmentClearTouchesContext;
      v7 = objc_msgSendSuper2(&v19, sel_init);
      v8 = v7;
      if (v7)
      {
        *((_QWORD *)v7 + 1) = a2;
        *((_QWORD *)v7 + 2) = a3;
      }
    }
    else
    {
      v8 = 0;
    }
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = *(id *)(a1 + 88);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = (const __CFDictionary *)-[UIEventEnvironment _touchMapForWindow:](a1, *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13));
          if (v14)
            CFDictionaryApplyFunction(v14, (CFDictionaryApplierFunction)_ClearReferencesToView, v8);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v11);
    }

  }
}

- (id)_touchesEventForWindow:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = (id)a1;
  if (a1)
  {
    -[UIEventEnvironment _findTouchesEventWindowSceneForKeyboardWindowIfNeeded:](a1, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 0, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_pressesEventForWindow:(id)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 3, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_currentTouchForWindow:(uint64_t)a1
{
  void *v2;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v2 = 0;
  if (a1 && a2)
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((objc_msgSend(v5, "_hasInvalidated") & 1) == 0)
      {

LABEL_10:
        v8 = *(void **)(a1 + 168);
        objc_msgSend(a2, "windowScene");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v6);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      if (objc_msgSend(v6, "_hasInvalidated"))
      {
        v7 = objc_msgSend(*(id *)(a1 + 136), "containsObject:", v6);

        if ((v7 & 1) != 0)
        {
          v2 = 0;
          return v2;
        }
        goto LABEL_10;
      }
    }
    v2 = 0;
LABEL_11:

  }
  return v2;
}

- (id)_findTouchesEventWindowSceneForKeyboardWindowIfNeeded:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  int v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  id v15;
  void *v16;
  id v17;

  if (a1)
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
    {
      v4 = v3;
      if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
      {
        v4 = v3;
        if (objc_msgSend(a2, "_isRemoteKeyboardWindow"))
        {
          objc_msgSend(v3, "_sceneForKeyboardDisplay");
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = (void *)v5;
          if (v5)
            v7 = v3 == (id)v5;
          else
            v7 = 0;
          v8 = v7;
          v9 = +[_UIRemoteKeyboards wantsUnassociatedWindowSceneForKeyboardWindow](_UIRemoteKeyboards, "wantsUnassociatedWindowSceneForKeyboardWindow");
          v10 = objc_msgSend((id)UIApp, "isFrontBoard");
          objc_msgSend(v3, "_screen");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "_userInterfaceIdiom");

          if (v12 == 3)
            v13 = 0;
          else
            v13 = v10;
          if (v9)
            v14 = v13;
          else
            v14 = 1;
          v4 = v3;
          if ((v8 & v14) == 1)
          {
            +[UIWindowScene _keyWindowScene]();
            v4 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "_settingsScene");
            v15 = (id)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15 && v15 != v3 && objc_msgSend(v15, "_allowsEventUIWindowRouting"))
            {
              v17 = v16;

              v4 = v17;
            }

          }
        }
      }
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (const)_touchMapForWindow:(uint64_t)a1
{
  const void *Value;
  const __CFDictionary *Mutable;

  Value = 0;
  if (a1 && key)
  {
    Mutable = *(const __CFDictionary **)(a1 + 176);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
      *(_QWORD *)(a1 + 176) = Mutable;
    }
    Value = CFDictionaryGetValue(Mutable, key);
    if (!Value)
    {
      Value = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 176), key, Value);
      CFRelease(Value);
    }
  }
  return Value;
}

- (id)UIKitEventForHIDEvent:(id *)a1
{
  int Type;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const __CFArray *Children;
  const __CFArray *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t IntegerValue;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v29;

  if (!a1)
    return 0;
  Type = IOHIDEventGetType();
  if (Type > 29)
  {
    if (Type > 38)
    {
      if (Type != 39)
      {
        if (Type != 42)
          goto LABEL_28;
LABEL_18:
        if (!_UIDynamicButtonFeatureIsEnabled() || !_UIEventHIDIsDynamicButtonEvent(a2))
          return 0;
        -[UIEventEnvironment _dynamicButtonEventForHIDEvent:]((uint64_t)a1);
        v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_63:
        v19 = v9;
        return v19;
      }
      if (!_UIEventHIDIsPencilBarrelEvent())
        return 0;
      _UIEventHIDUIWindowForHIDEvent();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_eventRoutingScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (uint64_t)a1;
      v8 = 13;
    }
    else
    {
      if (Type == 30)
      {
LABEL_54:
        -[UIEventEnvironment _physicalKeyboardEventForHIDEvent:](a1, a2);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      }
      if (Type != 35)
        goto LABEL_28;
      _UIEventHIDUIWindowForHIDEvent();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_eventRoutingScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (uint64_t)a1;
      v8 = 8;
    }
  }
  else
  {
    if (Type <= 10)
    {
      if (Type != 1)
      {
        if (Type == 6)
        {
          if (_UIEventHIDIsScrollEvent(a2))
          {
            _UIEventHIDUIWindowForHIDEvent();
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "_eventRoutingScene");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = (uint64_t)a1;
            v8 = 10;
          }
          else
          {
            BKSHIDEventGetBaseAttributes();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "contextID");

            _UIEventHIDUIWindowForHIDEvent();
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "_eventRoutingScene");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = (uint64_t)a1;
            v8 = 7;
          }
          goto LABEL_37;
        }
LABEL_28:
        v15 = IOHIDEventGetType();
        switch(v15)
        {
          case 3:
            if (_UIEventHIDPressTypeForKeyboardHIDEvent() != -1)
              goto LABEL_55;
            break;
          case 29:
            IntegerValue = IOHIDEventGetIntegerValue();
            if (IntegerValue && IntegerValue != 3)
            {
LABEL_55:
              if (objc_msgSend((id)UIApp, "isFrontBoard"))
              {
                BKSHIDEventGetBaseAttributes();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "contextID");

                if (!v27)
                {
                  v9 = a1[13];
                  goto LABEL_63;
                }
              }
              goto LABEL_62;
            }
            break;
          case 17:
            _UIEventHIDUIScreenForHIDEvent(a2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "_userInterfaceIdiom");

            if (v17 == 3)
              goto LABEL_55;
            break;
        }
        if (IOHIDEventGetType() == 3)
        {
          v24 = IOHIDEventGetIntegerValue();
          switch(v24)
          {
            case 7:
              goto LABEL_54;
            case 255:
              goto LABEL_54;
            case 12:
              v25 = IOHIDEventGetIntegerValue();
              if (v25 == 184 || v25 == 669 || v25 == 430)
                goto LABEL_54;
              break;
          }
        }
        return 0;
      }
      goto LABEL_18;
    }
    if (Type == 11)
    {
      if ((_UIEventHIDIgnoresDragEvents() & 1) == 0)
      {
        Children = (const __CFArray *)IOHIDEventGetChildren();
        if (Children)
        {
          v11 = Children;
          if (CFArrayGetCount(Children) >= 1)
          {
            CFArrayGetValueAtIndex(v11, 0);
            BKSHIDEventGetDigitizerAttributes();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            _UIEventHIDPathAttributesForChild(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "locus");

            if (v14)
            {
              -[UIEventEnvironment _dragEventForHIDEvent:]((uint64_t)a1);
              v9 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_63;
            }
          }
        }
      }
      if (_UIEventHIDShouldIgnoreEventsExpectedToBecomeDragEvent()
        && _UIEventHIDExpectedToBecomeDragEvent())
      {
        return 0;
      }
      _UIEventHIDUIWindowForHIDEvent();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIEventEnvironment _findTouchesEventWindowSceneForKeyboardWindowIfNeeded:]((uint64_t)a1, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (uint64_t)a1;
      v8 = 0;
    }
    else
    {
      if (Type != 17)
        goto LABEL_28;
      if (!_UIEventHIDIsTransformEvent(a2))
      {
        v20 = IOHIDEventGetType();
        switch(v20)
        {
          case 3:
            if (_UIEventHIDPressTypeForKeyboardHIDEvent() != -1)
              goto LABEL_62;
            break;
          case 29:
            v29 = IOHIDEventGetIntegerValue();
            v19 = 0;
            if (!v29 || v29 == 3)
              return v19;
            goto LABEL_62;
          case 17:
            _UIEventHIDUIScreenForHIDEvent(a2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "_userInterfaceIdiom");

            if (v22 == 3)
            {
LABEL_62:
              -[UIEventEnvironment _pressesEventForHIDEvent:]((uint64_t)a1);
              v9 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_63;
            }
            break;
        }
        return 0;
      }
      _UIEventHIDUIWindowForHIDEvent();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_eventRoutingScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (uint64_t)a1;
      v8 = 14;
    }
  }
LABEL_37:
  _UIEventEnvironmentEventOfTypeForEventRoutingUIScene(v7, v8, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)_setTouchMap:(const void *)a3 forWindow:
{
  CFIndex Count;
  void *v7;
  __CFDictionary *Mutable;

  if (a1)
  {
    Count = CFDictionaryGetCount(theDict);
    v7 = *(void **)(a1 + 88);
    if (Count)
      objc_msgSend(v7, "addObject:", a3);
    else
      objc_msgSend(v7, "removeObject:", a3);
    Mutable = *(__CFDictionary **)(a1 + 176);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
      *(_QWORD *)(a1 + 176) = Mutable;
    }
    CFDictionarySetValue(Mutable, a3, theDict);
  }
}

- (id)_pencilEventForWindow:(id)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 13, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)sceneDidActivate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(a3, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_opt_class(), "_supportsEventUIWindowRouting"))
  {
    v4 = v3;
    if (objc_msgSend(v4, "_allowsEventUIWindowRouting"))
    {
      objc_msgSend(v4, "_allWindows");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "keyWindow");
        else
          objc_msgSend(v4, "_topVisibleWindowPassingTest:", &__block_literal_global_463);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __39__UIEventEnvironment_sceneDidActivate___block_invoke_2;
        v9[3] = &unk_1E16B1B50;
        v10 = v7;
        v11 = v4;
        v8 = v7;
        objc_msgSend(v11, "_enqueuePostSettingsUpdateResponseBlock:inPhase:", v9, 0x1E16F0C60);

      }
    }

  }
}

- (void)_setCurrentTouch:(void *)a3 forWindow:
{
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  if (!a1)
    return;
  if (!a2)
  {
    if (!a3)
      return;
    objc_msgSend(a3, "_eventRoutingScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v11 = v6;
      if ((objc_msgSend(v6, "_hasInvalidated") & 1) != 0)
      {
        if (!objc_msgSend(v11, "_hasInvalidated"))
          goto LABEL_19;
        v8 = objc_msgSend(*(id *)(a1 + 136), "containsObject:", v11);

        if ((v8 & 1) != 0)
          return;
      }
      else
      {

      }
      v10 = *(void **)(a1 + 168);
      objc_msgSend(a3, "windowScene");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectForKey:", v11);
      goto LABEL_19;
    }
LABEL_20:

    return;
  }
  if (!a3)
    return;
  objc_msgSend(a3, "_eventRoutingScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_20;
  v11 = v6;
  if ((objc_msgSend(v6, "_hasInvalidated") & 1) == 0)
  {

LABEL_16:
    v9 = *(void **)(a1 + 168);
    objc_msgSend(a3, "windowScene");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", a2, v11);
    goto LABEL_19;
  }
  if (!objc_msgSend(v11, "_hasInvalidated"))
  {
LABEL_19:
    v6 = v11;
    goto LABEL_20;
  }
  v7 = objc_msgSend(*(id *)(a1 + 136), "containsObject:", v11);

  if ((v7 & 1) == 0)
    goto LABEL_16;
}

- (UIEventEnvironment)initWithApplication:(id)a3
{
  UIEventEnvironment *v4;
  UIEventEnvironment *v5;
  uint64_t v6;
  NSMutableArray *eventQueue;
  UIPressesEvent *v8;
  UIPressesEvent *fallbackPressesEvent;
  UIPhysicalKeyboardEvent *v10;
  UIPhysicalKeyboardEvent *fallbackPhysicalKeyboardEvent;
  UIWheelEvent *v12;
  UIWheelEvent *fallbackWheelEvent;
  UIEvent *v14;
  UIEvent *event;
  UIRemoteControlEvent *v16;
  UIRemoteControlEvent *remoteControlEvent;
  UIMotionEvent *v18;
  UIMotionEvent *motionEvent;
  uint64_t v20;
  NSMapTable *eventRegistryByScene;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *dragEventsByContextAndSessionIDPair;
  uint64_t v25;
  NSMapTable *currentNudgePressTypeByScene;
  NSMutableDictionary *v27;
  NSMutableDictionary *fallbackPressMap;
  uint64_t v29;
  NSMapTable *pressesMapByScene;
  NSMutableDictionary *v31;
  NSMutableDictionary *estimatedTouchRecordsByContextIDAndEstimationIndex;
  NSMutableArray *v33;
  NSMutableArray *estimatedTouchRecordsInIncomingOrder;
  uint64_t v35;
  NSMapTable *currentTouchByScene;
  uint64_t v37;
  NSMutableSet *windowsWithActiveTouchMaps;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)UIEventEnvironment;
  v4 = -[UIEventEnvironment init](&v40, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_application = (UIApplication *)a3;
    v6 = objc_opt_new();
    eventQueue = v5->_eventQueue;
    v5->_eventQueue = (NSMutableArray *)v6;

    v8 = -[UIEvent _initWithEnvironment:]([UIPressesEvent alloc], "_initWithEnvironment:", v5);
    fallbackPressesEvent = v5->_fallbackPressesEvent;
    v5->_fallbackPressesEvent = v8;

    v10 = -[UIEvent _initWithEnvironment:]([UIPhysicalKeyboardEvent alloc], "_initWithEnvironment:", v5);
    fallbackPhysicalKeyboardEvent = v5->_fallbackPhysicalKeyboardEvent;
    v5->_fallbackPhysicalKeyboardEvent = v10;

    v12 = -[UIEvent _initWithEnvironment:]([UIWheelEvent alloc], "_initWithEnvironment:", v5);
    fallbackWheelEvent = v5->_fallbackWheelEvent;
    v5->_fallbackWheelEvent = v12;

    v14 = -[UIEvent _initWithEnvironment:]([UIEvent alloc], "_initWithEnvironment:", v5);
    event = v5->_event;
    v5->_event = v14;

    v16 = -[UIEvent _initWithEnvironment:]([UIRemoteControlEvent alloc], "_initWithEnvironment:", v5);
    remoteControlEvent = v5->_remoteControlEvent;
    v5->_remoteControlEvent = v16;

    v18 = -[UIEvent _initWithEnvironment:]([UIMotionEvent alloc], "_initWithEnvironment:", v5);
    motionEvent = v5->_motionEvent;
    v5->_motionEvent = v18;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    eventRegistryByScene = v5->_eventRegistryByScene;
    v5->_eventRegistryByScene = (NSMapTable *)v20;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v5, sel_sceneDidDisconnect_, CFSTR("UISceneDidDisconnectNotification"), 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v5, sel_sceneDidActivate_, CFSTR("UISceneDidActivateNotification"), 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v5, sel_pointerLockStateDidChange_, CFSTR("UIPointerLockStateDidChangeNotification"), 0);
    v23 = objc_opt_new();
    dragEventsByContextAndSessionIDPair = v5->_dragEventsByContextAndSessionIDPair;
    v5->_dragEventsByContextAndSessionIDPair = (NSMutableDictionary *)v23;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v25 = objc_claimAutoreleasedReturnValue();
    currentNudgePressTypeByScene = v5->_currentNudgePressTypeByScene;
    v5->_currentNudgePressTypeByScene = (NSMapTable *)v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fallbackPressMap = v5->_fallbackPressMap;
    v5->_fallbackPressMap = v27;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v29 = objc_claimAutoreleasedReturnValue();
    pressesMapByScene = v5->_pressesMapByScene;
    v5->_pressesMapByScene = (NSMapTable *)v29;

    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    estimatedTouchRecordsByContextIDAndEstimationIndex = v5->_estimatedTouchRecordsByContextIDAndEstimationIndex;
    v5->_estimatedTouchRecordsByContextIDAndEstimationIndex = v31;

    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    estimatedTouchRecordsInIncomingOrder = v5->_estimatedTouchRecordsInIncomingOrder;
    v5->_estimatedTouchRecordsInIncomingOrder = v33;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v35 = objc_claimAutoreleasedReturnValue();
    currentTouchByScene = v5->_currentTouchByScene;
    v5->_currentTouchByScene = (NSMapTable *)v35;

    v37 = objc_opt_new();
    windowsWithActiveTouchMaps = v5->_windowsWithActiveTouchMaps;
    v5->_windowsWithActiveTouchMaps = (NSMutableSet *)v37;

    v5->_touchMapsByWindow = 0;
  }
  return v5;
}

- (void)_registerEstimatedTouches:(void *)a3 event:(uint64_t)a4 forTouchable:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  _UIEstimatedTouchRecord *v24;
  id obj;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
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
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (a1 && *(_BYTE *)(a1 + 96))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v6 = a2;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v41 != v9)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "type") == 2)
          {

            v11 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(a3, "_hidEvent");
            BKSHIDEventGetBaseAttributes();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "numberWithUnsignedInt:", objc_msgSend(v12, "contextID"));
            v13 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 192), "objectForKey:", v13);
            v14 = (id)objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(*(id *)(a1 + 192), "setObject:forKey:", v14, v13);
            }
            v30 = a1;
            v31 = (void *)v13;
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            obj = v6;
            v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
            if (v28)
            {
              v26 = *(_QWORD *)v37;
              do
              {
                v15 = 0;
                do
                {
                  if (*(_QWORD *)v37 != v26)
                    objc_enumerationMutation(obj);
                  v29 = v15;
                  v16 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v15);
                  objc_msgSend(a3, "coalescedTouchesForTouch:", v16);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = 0u;
                  v33 = 0u;
                  v34 = 0u;
                  v35 = 0u;
                  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                  if (v18)
                  {
                    v19 = v18;
                    v20 = *(_QWORD *)v33;
                    do
                    {
                      for (j = 0; j != v19; ++j)
                      {
                        if (*(_QWORD *)v33 != v20)
                          objc_enumerationMutation(v17);
                        v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
                        if (v22 && (*(_BYTE *)(v22 + 265) || *(_BYTE *)(v22 + 268)))
                        {
                          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "estimationUpdateIndex");
                          v23 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v23)
                          {
                            objc_msgSend(v14, "objectForKey:", v23);
                            v24 = (_UIEstimatedTouchRecord *)objc_claimAutoreleasedReturnValue();
                            if (!v24)
                            {
                              v24 = -[_UIEstimatedTouchRecord initWithLiveTouch:freezeTouch:contextID:]([_UIEstimatedTouchRecord alloc], "initWithLiveTouch:freezeTouch:contextID:", v16, v22, v31);
                              objc_msgSend(v14, "setObject:forKey:", v24, v23);
                              objc_msgSend(*(id *)(v30 + 200), "addObject:", v24);
                            }
                            -[_UIEstimatedTouchRecord addTouchable:](v24, "addTouchable:", a4);

                          }
                        }
                      }
                      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                    }
                    while (v19);
                  }

                  v15 = v29 + 1;
                }
                while (v29 + 1 != v28);
                v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
              }
              while (v28);
            }

            v6 = v31;
            goto LABEL_37;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_37:

  }
}

- (id)_hoverEventForWindow:(id)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 11, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)_enqueueClearEventsOfWindow:(void *)a1
{
  void *v4;
  int v5;
  objc_class *v6;
  const char *Name;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD);
  void *v16;
  _QWORD aBlock[10];
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _QWORD *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1 && (!a2 || (a2[13] & 0x1000) == 0))
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_hasInvalidated");

    v6 = (objc_class *)objc_opt_class();
    Name = class_getName(v6);
    v8 = _enqueueClearEventsOfWindow____s_category;
    if (!_enqueueClearEventsOfWindow____s_category)
    {
      v8 = __UILogCategoryGetNode("EventEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_enqueueClearEventsOfWindow____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      *(_DWORD *)buf = 136446722;
      v20 = Name;
      v21 = 2050;
      v22 = a2;
      v23 = 1026;
      v24 = objc_msgSend(a2, "_contextId");
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Enqueuing clear events of window: <%{public}s: %{public}p>; contextId: 0x%{public}X",
        buf,
        0x1Cu);

    }
    v11 = objc_msgSend(a2, "_contextId");
    -[UIEventEnvironment _touchesEventForWindow:]((uint64_t)a1, a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEventEnvironment _hoverEventForWindow:](a1, a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEventEnvironment _dynamicButtonEventForWindow:](a1, a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__UIEventEnvironment__enqueueClearEventsOfWindow___block_invoke;
    aBlock[3] = &unk_1E16DF868;
    aBlock[4] = a2;
    aBlock[5] = v12;
    aBlock[6] = a1;
    aBlock[7] = v13;
    v18 = v11;
    aBlock[8] = v14;
    aBlock[9] = Name;
    v15 = (void (**)(_QWORD))_Block_copy(aBlock);
    v16 = v15;
    if (v5)
      v15[2](v15);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v15);

  }
}

- (void)dealloc
{
  __CFDictionary *touchMapsByWindow;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  touchMapsByWindow = self->_touchMapsByWindow;
  if (touchMapsByWindow)
    CFRelease(touchMapsByWindow);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("UISceneDidDisconnectNotification");
  v7[1] = CFSTR("UISceneDidActivateNotification");
  v7[2] = CFSTR("UIPointerLockStateDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  v6.receiver = self;
  v6.super_class = (Class)UIEventEnvironment;
  -[UIEventEnvironment dealloc](&v6, sel_dealloc);
}

- (UIDragEvent)_dragEventForHIDEvent:(uint64_t)a1
{
  const __CFArray *Children;
  const __CFArray *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIDragEvent *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;

  Children = (const __CFArray *)IOHIDEventGetChildren();
  v3 = Children;
  if (Children)
  {
    if (CFArrayGetCount(Children) < 1)
    {
      v3 = 0;
    }
    else
    {
      CFArrayGetValueAtIndex(v3, 0);
      BKSHIDEventGetDigitizerAttributes();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _UIEventHIDPathAttributesForChild(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "locus"))
        v3 = (const __CFArray *)objc_msgSend(v5, "userIdentifier");
      else
        v3 = 0;

    }
  }
  BKSHIDEventGetBaseAttributes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "contextID");

  v8 = 0;
  if ((_DWORD)v3 && (_DWORD)v7)
  {
    v9 = (const __CFArray *)IOHIDEventGetChildren();
    if (v9 && (v10 = v9, CFArrayGetCount(v9) >= 1))
    {
      CFArrayGetValueAtIndex(v10, 0);
      BKSHIDEventGetDigitizerAttributes();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _UIEventHIDPathAttributesForChild(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "locus");

      v14 = v7 << 32;
      if (v13 != 4)
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14 | v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v15);
    v8 = (UIDragEvent *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = -[UIDragEvent initWithDragSessionID:environment:]([UIDragEvent alloc], "initWithDragSessionID:environment:", v3, a1);
      if (v8)
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, v15);
    }

  }
  return v8;
}

- (id)_physicalKeyboardEventForHIDEvent:(id *)a1
{
  id *v2;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v2 = a1;
  if (a1)
  {
    BKSHIDEventGetBaseAttributes();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "contextID");
    _UIEventHIDUIWindowForHIDEvent();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (objc_msgSend((id)UIApp, "isFrontBoard"))
      {
        objc_msgSend(v4, "environment");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D00CA8], "systemEnvironment");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (v9)
        {
          _UIEventHIDUIScreenForHIDEvent(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)UIApp, "_windowForSystemAppButtonEventsForScreen:", v10);
          v11 = objc_claimAutoreleasedReturnValue();

          if (!v11)
          {
            objc_msgSend((id)UIApp, "_keyWindowForScreen:", v10);
            v11 = objc_claimAutoreleasedReturnValue();
          }

          v6 = (void *)v11;
        }
      }
    }
    if (v6 || !objc_msgSend((id)UIApp, "isFrontBoard"))
    {
      objc_msgSend(v6, "_eventRoutingScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 4, v12);
      v2 = (id *)objc_claimAutoreleasedReturnValue();

      if (!v2)
        objc_msgSend((id)UIApp, "_resetGSKeyboardModifierStateIfNecessary:", a2);
    }
    else
    {
      v2 = (id *)v2[14];
    }
    objc_msgSend(v2, "setSource:", 4);

  }
  return v2;
}

- (id)_dynamicButtonEventForHIDEvent:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  _UIEventHIDUIWindowForHIDEvent();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_eventRoutingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEventEnvironmentEventOfTypeForEventRoutingUIScene(a1, 16, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_pressesEventForHIDEvent:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  id v7;
  void *v8;

  _UIEventHIDUIWindowForHIDEvent();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UIEventHIDPressTypeForKeyboardHIDEvent();
  v4 = objc_msgSend((id)UIApp, "isFrontBoard");
  if (v3 != 601)
  {
    v5 = v4 ^ 1;
    if ((v3 & 0xFFFFFFFFFFFFFFFELL) != 0x66)
      v5 = 0;
    if ((v5 & 1) == 0)
    {
      v6 = objc_msgSend((id)UIApp, "isFrontBoard");
      if (!v2 && (v6 & 1) != 0)
        goto LABEL_7;
LABEL_9:
      objc_msgSend(v2, "_eventRoutingScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _UIEventEnvironmentEventOfTypeForEventRoutingUIScene(a1, 3, v8);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  if (v2)
    goto LABEL_9;
LABEL_7:
  v7 = *(id *)(a1 + 104);
LABEL_10:

  return v7;
}

- (id)_dynamicButtonEventForWindow:(id)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 16, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void __50__UIEventEnvironment__enqueueClearEventsOfWindow___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  __CFDictionary *Mutable;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_10;
  if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_10)
  {
    v2 = __UILogCategoryGetNode("EventEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_10);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 72);
    v5 = *(void **)(a1 + 32);
    v6 = v3;
    *(_DWORD *)buf = 136446722;
    v28 = v4;
    v29 = 2050;
    v30 = v5;
    v31 = 1026;
    v32 = objc_msgSend(v5, "_contextId");
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Performing clear events of window: <%{public}s: %{public}p>; contextId: 0x%{public}X",
      buf,
      0x1Cu);

  }
  -[UITouchesEvent _cancelResponderDeliveryAndClearTouchesOfWindow:](*(void **)(a1 + 40), *(void **)(a1 + 32));
  -[UIEventEnvironment _touchMapForWindow:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v7, "objectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12);
        if (v13)
          v14 = *(void **)(v13 + 360);
        else
          v14 = 0;
        v15 = v14;
        v16 = *(id *)(a1 + 32);

        if (v15 == v16)
          -[UITouch _clearForWindowIfNeeded:](v13, *(void **)(a1 + 32));
        ++v12;
      }
      while (v10 != v12);
      v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v10 = v17;
    }
    while (v17);
  }

  -[UIEventEnvironment _resetTouchMapForWindow:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32));
  v18 = *(_QWORD *)(a1 + 48);
  if (v18)
  {
    Mutable = *(__CFDictionary **)(v18 + 176);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
      *(_QWORD *)(v18 + 176) = Mutable;
    }
  }
  else
  {
    Mutable = 0;
  }
  CFDictionaryRemoveValue(Mutable, *(const void **)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 56), "_removeAllHoverTouchesForContextId:", *(unsigned int *)(a1 + 80));
  v20 = *(void **)(a1 + 64);
  objc_msgSend(v20, "_componentsForWindow:", *(_QWORD *)(a1 + 32));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_removeComponents:", v21);

}

- (uint64_t)_resetTouchMapForWindow:(uint64_t)result
{
  uint64_t v3;
  const __CFDictionary *Mutable;
  __CFDictionary *Value;

  if (result)
  {
    v3 = result;
    Mutable = *(const __CFDictionary **)(result + 176);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
      *(_QWORD *)(v3 + 176) = Mutable;
    }
    Value = (__CFDictionary *)CFDictionaryGetValue(Mutable, key);
    if (Value)
      CFDictionaryRemoveAllValues(Value);
    return objc_msgSend(*(id *)(v3 + 88), "removeObject:", key);
  }
  return result;
}

- (void)_removeEstimatedTouchRecord:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 200), "removeObject:", a2);
    objc_msgSend(a2, "contextID");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 192), "objectForKey:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "frozenTouch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "estimationUpdateIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", v6);

    if (!objc_msgSend(v4, "count"))
      objc_msgSend(*(id *)(a1 + 192), "removeObjectForKey:", v7);

  }
}

- (id)_estimatedTouchRecordForContextID:(uint64_t)a3 estimationIndex:
{
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 192), "objectForKey:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_dispatchAndRemoveStaleEstimationUpdateRecordsWithEventTime:(double)a3 upToRecord:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = *(id *)(a1 + 200);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v25;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        if (v12 == a2)
          break;
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "frozenTouch");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timestamp");
        if (a3 - v14 > 0.4)
        {
          if (!v9)
            v9 = (void *)objc_opt_new();
          objc_msgSend(v9, "addObject:", v12);
          objc_msgSend(v13, "_pressure");
          objc_msgSend(v12, "dispatchUpdateWithPressure:stillEstimated:", 1);
          objc_msgSend(v13, "_rollAngle");
          objc_msgSend(v12, "dispatchUpdateWithRollAngle:stillEstimated:", 1);
        }

        if (v8 == ++v11)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }
    else
    {
      v9 = 0;
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          -[UIEventEnvironment _removeEstimatedTouchRecord:](a1, *(void **)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v17);
    }

  }
}

- (void)_removeDragEvent:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "allKeysForObject:", a2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (id)_dragEvents
{
  if (a1)
  {
    objc_msgSend(a1[6], "allValues");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_enqueueHIDEvent:(__IOHIDEvent *)a3
{
  -[NSMutableArray insertObject:atIndex:](self->_eventQueue, "insertObject:atIndex:", a3, 0);
}

- (id)_pressForType:(void *)a3 window:
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (!a1)
    goto LABEL_7;
  if (!a3)
  {
    v10 = *(void **)(a1 + 160);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    return v9;
  }
  objc_msgSend(a3, "_eventRoutingScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  if ((objc_msgSend(v6, "_hasInvalidated") & 1) == 0)
  {

    goto LABEL_11;
  }
  if (!objc_msgSend(v7, "_hasInvalidated"))
  {
LABEL_9:
    v9 = 0;
    goto LABEL_12;
  }
  v8 = objc_msgSend(*(id *)(a1 + 136), "containsObject:", v7);

  if ((v8 & 1) == 0)
  {
LABEL_11:
    v11 = *(void **)(a1 + 144);
    objc_msgSend(a3, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
LABEL_7:
  v9 = 0;
  return v9;
}

- (void)_setPress:(uint64_t)a3 forType:(void *)a4 window:
{
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  if (a1)
  {
    if (a4)
    {
      objc_msgSend(a4, "_eventRoutingScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
LABEL_14:

        return;
      }
      v17 = v8;
      if ((objc_msgSend(v8, "_hasInvalidated") & 1) == 0)
      {

LABEL_10:
        v11 = *(void **)(a1 + 144);
        objc_msgSend(a4, "windowScene");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v12);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        v13 = v18;
        if (!v18)
          v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v17 = v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", a2, v14);

        v15 = *(void **)(a1 + 144);
        objc_msgSend(a4, "windowScene");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v17, v16);

        goto LABEL_13;
      }
      if (objc_msgSend(v17, "_hasInvalidated"))
      {
        v9 = objc_msgSend(*(id *)(a1 + 136), "containsObject:", v17);

        if ((v9 & 1) != 0)
          return;
        goto LABEL_10;
      }
    }
    else
    {
      v10 = *(void **)(a1 + 160);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", a2, v17);
    }
LABEL_13:
    v8 = v17;
    goto LABEL_14;
  }
}

- (uint64_t)_currentNudgePressTypeForWindow:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (!a1)
    return 0;
  if (!a2)
    return -1;
  objc_msgSend(a2, "_eventRoutingScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  if ((objc_msgSend(v4, "_hasInvalidated") & 1) == 0)
  {

    goto LABEL_9;
  }
  if (!objc_msgSend(v5, "_hasInvalidated"))
    goto LABEL_11;
  v6 = objc_msgSend(*(id *)(a1 + 136), "containsObject:", v5);

  if ((v6 & 1) == 0)
  {
LABEL_9:
    v8 = *(void **)(a1 + 152);
    objc_msgSend(a2, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v7 = objc_msgSend(v5, "integerValue");
LABEL_12:

      return v7;
    }
LABEL_11:
    v7 = -1;
    goto LABEL_12;
  }
  return -1;
}

- (void)_setCurrentNudgePressType:(void *)a3 forWindow:
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  if (a1 && a3)
  {
    objc_msgSend(a3, "_eventRoutingScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_11:

      return;
    }
    v10 = v6;
    if ((objc_msgSend(v6, "_hasInvalidated") & 1) != 0)
    {
      if (!objc_msgSend(v10, "_hasInvalidated"))
      {
LABEL_10:
        v6 = v10;
        goto LABEL_11;
      }
      v7 = objc_msgSend(*(id *)(a1 + 136), "containsObject:", v10);

      if ((v7 & 1) != 0)
        return;
    }
    else
    {

    }
    v8 = *(void **)(a1 + 152);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, v9);

    goto LABEL_10;
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  NSHashTable *invalidatedAndDisconnectedScenes;
  NSHashTable *v9;
  NSHashTable *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend((id)objc_opt_class(), "_supportsEventUIWindowRouting");

    if (v6)
    {
      objc_msgSend(a3, "object");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        invalidatedAndDisconnectedScenes = self->_invalidatedAndDisconnectedScenes;
        if (!invalidatedAndDisconnectedScenes)
        {
          objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
          v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
          v10 = self->_invalidatedAndDisconnectedScenes;
          self->_invalidatedAndDisconnectedScenes = v9;

          invalidatedAndDisconnectedScenes = self->_invalidatedAndDisconnectedScenes;
        }
        -[NSHashTable addObject:](invalidatedAndDisconnectedScenes, "addObject:", v7);
        -[NSMapTable objectForKey:](self->_eventRegistryByScene, "objectForKey:", v7);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (_QWORD *)v11;
        if (v11)
        {
          objc_msgSend(*(id *)(v11 + 8), "removeAllObjects");
          v13 = (void *)v12[1];
          v12[1] = 0;

        }
        -[NSMapTable removeObjectForKey:](self->_currentNudgePressTypeByScene, "removeObjectForKey:", v7);
        -[NSMapTable removeObjectForKey:](self->_pressesMapByScene, "removeObjectForKey:", v7);
        -[NSMapTable removeObjectForKey:](self->_currentTouchByScene, "removeObjectForKey:", v7);
        -[NSMapTable removeObjectForKey:](self->_eventRegistryByScene, "removeObjectForKey:", v7);
        v14 = (void *)-[NSMutableSet copy](self->_windowsWithActiveTouchMaps, "copy");
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v24 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(v20, "_eventRoutingScene");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21 == v7)
                -[UIEventEnvironment _resetTouchMapForWindow:]((uint64_t)self, v20);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v17);
        }

      }
    }
  }
  else
  {

  }
}

uint64_t __39__UIEventEnvironment_sceneDidActivate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "canBecomeKeyWindow");
  if ((_DWORD)result)
  {
    if ((objc_msgSend(a2, "_isTextEffectsWindow") & 1) != 0)
      return 0;
    else
      return objc_msgSend(a2, "isInternalWindow") ^ 1;
  }
  return result;
}

void __39__UIEventEnvironment_sceneDidActivate___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
    _UIPencilEventRequestBarrelFocusIfAbleForWindow(v2, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("_UIPencilEventDidEvaluateBarrelFocusForSceneTransition"), *(_QWORD *)(a1 + 40), 0);

}

- (void)pointerLockStateDidChange:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)objc_opt_class(), "_supportsEventUIWindowRouting"))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9;
  if (v5 && v9 && _UIPointerLockStateIsAvailableForScene(v9))
  {
    v11 = pointerLockStateDidChange____s_category;
    if (!pointerLockStateDidChange____s_category)
    {
      v11 = __UILogCategoryGetNode("PointerLockState", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&pointerLockStateDidChange____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend(v10, "succinctDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v5, "isLocked");
      v16 = CFSTR("NO");
      if (v15)
        v16 = CFSTR("YES");
      v18 = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "pointerLockState notification received: windowScene %@; isLocked: %@",
        (uint8_t *)&v18,
        0x16u);

    }
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)self, 11, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v17, "_setPointerLocked:", objc_msgSend(v5, "isLocked"));

  }
}

- (id)_moveEventForWindow:(id)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 5, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_wheelEventForWindow:(id)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 7, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_gameControllerEventForWindow:(id)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 8, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_physicalKeyboardEventForWindow:(id)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 4, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_scrollEventForWindow:(id)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 10, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_transformEventForWindow:(id)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "_eventRoutingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEventEnvironmentEventOfTypeForEventRoutingUIScene((uint64_t)v2, 14, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)_sendMotionBegan:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    v4 = *(id *)(a1 + 32);
    if (objc_msgSend(v4, "_isDetectingMotionEvents"))
    {
      objc_msgSend(v4, "_setSubtype:", a2);
      objc_msgSend(v4, "setShakeState:", 0);
      objc_msgSend(*(id *)(a1 + 8), "sendEvent:", v4);
    }

  }
}

- (void)_sendMotionEnded:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    v4 = *(id *)(a1 + 32);
    if (objc_msgSend(v4, "_isDetectingMotionEvents"))
    {
      objc_msgSend(v4, "_setSubtype:", a2);
      objc_msgSend(v4, "setShakeState:", 1);
      objc_msgSend(*(id *)(a1 + 8), "sendEvent:", v4);
    }

  }
}

- (void)_sendMotionCancelled:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    v4 = *(id *)(a1 + 32);
    if (objc_msgSend(v4, "_isDetectingMotionEvents"))
    {
      objc_msgSend(v4, "_setSubtype:", a2);
      objc_msgSend(v4, "setShakeState:", 2);
      objc_msgSend(*(id *)(a1 + 8), "sendEvent:", v4);
    }

  }
}

- (void)_sendRemoteControlEvent:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 8), "_hasRemoteControlEventObservers"))
    {
      v4 = *(id *)(a1 + 40);
      objc_msgSend(v4, "_setSubtype:", a2);
      objc_msgSend(*(id *)(a1 + 8), "sendEvent:", v4);

    }
  }
}

- (UIApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
  self->_application = (UIApplication *)a3;
}

- (NSMutableArray)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedTouchRecordsInIncomingOrder, 0);
  objc_storeStrong((id *)&self->_estimatedTouchRecordsByContextIDAndEstimationIndex, 0);
  objc_storeStrong((id *)&self->_currentTouchByScene, 0);
  objc_storeStrong((id *)&self->_fallbackPressMap, 0);
  objc_storeStrong((id *)&self->_currentNudgePressTypeByScene, 0);
  objc_storeStrong((id *)&self->_pressesMapByScene, 0);
  objc_storeStrong((id *)&self->_invalidatedAndDisconnectedScenes, 0);
  objc_storeStrong((id *)&self->_eventRegistryByScene, 0);
  objc_storeStrong((id *)&self->_fallbackWheelEvent, 0);
  objc_storeStrong((id *)&self->_fallbackPhysicalKeyboardEvent, 0);
  objc_storeStrong((id *)&self->_fallbackPressesEvent, 0);
  objc_storeStrong((id *)&self->_windowsWithActiveTouchMaps, 0);
  objc_storeStrong((id *)&self->_dragEventsByContextAndSessionIDPair, 0);
  objc_storeStrong((id *)&self->_remoteControlEvent, 0);
  objc_storeStrong((id *)&self->_motionEvent, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

@end

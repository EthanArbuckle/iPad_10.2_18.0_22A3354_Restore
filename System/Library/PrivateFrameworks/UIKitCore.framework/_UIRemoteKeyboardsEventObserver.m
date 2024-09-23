@implementation _UIRemoteKeyboardsEventObserver

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIRemoteKeyboardsEventObserver)init
{
  _UIRemoteKeyboardsEventObserver *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIRemoteKeyboardsEventObserver;
  v2 = -[_UIRemoteKeyboardsEventObserver init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_textInputResponderDidChange_, CFSTR("UITextInputResponderDidChangeNotification"), 0);

  }
  return v2;
}

- (void)_gestureRecognizer:(id)a3 didTransitionToState:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4 == 1)
  {
    if (objc_msgSend(v6, "_isGestureType:", 8))
    {
      v24 = 0uLL;
      v25 = 0uLL;
      v22 = 0uLL;
      v23 = 0uLL;
      objc_msgSend(v7, "_allActiveTouches");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            if (!objc_msgSend(v13, "type"))
              -[_UIRemoteKeyboardsEventObserver _invalidateTrackingForTouch:](self, "_invalidateTrackingForTouch:", v13);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v10);
      }
    }
    else
    {
      v20 = 0uLL;
      v21 = 0uLL;
      *((_QWORD *)&v18 + 1) = 0;
      v19 = 0uLL;
      objc_msgSend(v7, "_allActiveTouches", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v8);
            -[_UIRemoteKeyboardsEventObserver _markTrackingForTouch:withGesture:](self, "_markTrackingForTouch:withGesture:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), v7);
          }
          v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v15);
      }
    }

  }
}

- (void)peekApplicationEvent:(id)a3
{
  id *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  if (!objc_msgSend(v4, "type"))
  {
    -[UITabBarControllerSidebar _actualFooterContentConfiguration](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", self);

    if ((v6 & 1) == 0)
      -[UIEvent _addEventObserver:]((uint64_t)v4, self);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "allTouches", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[_UIRemoteKeyboardsEventObserver _trackTouch:](self, "_trackTouch:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)_trackTouch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  switch(objc_msgSend(v11, "phase"))
  {
    case 0:
      if (-[_UIRemoteKeyboardsEventObserver _shouldTrackTouch:](self, "_shouldTrackTouch:", v11))
        -[_UIRemoteKeyboardsEventObserver _startTrackingForTouch:](self, "_startTrackingForTouch:", v11);
      break;
    case 1:
      -[_UIRemoteKeyboardsEventObserver _updateTrackingForTouch:](self, "_updateTrackingForTouch:", v11);
      break;
    case 3:
      -[_UIRemoteKeyboardsEventObserver _endTrackingForTouch:](self, "_endTrackingForTouch:", v11);
      break;
    case 4:
      -[_UIRemoteKeyboardsEventObserver _cancelTrackingForTouch:](self, "_cancelTrackingForTouch:", v11);
      break;
    default:
      break;
  }
  if (objc_msgSend(v11, "type") == 2 && (!objc_msgSend(v11, "phase") || objc_msgSend(v11, "phase") == 1))
  {
    objc_msgSend(v11, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "_isTextEffectsWindow") & 1) != 0)
    {
      objc_msgSend(v11, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inputViews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "inputAccessoryView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v5, "isDescendantOfView:", v8);

      if (!v9)
        goto LABEL_15;
    }
    else
    {

    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateIdleDetection:", 3);

  }
LABEL_15:

}

- (BOOL)_shouldTrackTouch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_responderWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "_appearsInLoupe"))
  {
    if (objc_msgSend(v6, "_isHostedInAnotherProcess"))
      v7 = objc_msgSend(v6, "_isTextEffectsWindow") ^ 1;
    else
      LOBYTE(v7) = objc_msgSend(v6, "_canAffectStatusBarAppearance");
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  if (objc_msgSend(v4, "type") == 2)
    LOBYTE(v8) = 1;
  else
    v8 = !-[_UIRemoteKeyboardsEventObserver _isTrackingPencilTouch](self, "_isTrackingPencilTouch");
  v9 = v7 & v8;

  return v9;
}

- (BOOL)_isTrackingPencilTouch
{
  NSMutableDictionary *touchTracker;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  touchTracker = self->_touchTracker;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57___UIRemoteKeyboardsEventObserver__isTrackingPencilTouch__block_invoke;
  v5[3] = &unk_1E16C3CC8;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](touchTracker, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_endTrackingForTouch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "_touchIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_touchTracker, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "valid"))
  {
    v19 = 0;
    v8 = -[_UIRemoteKeyboardsEventObserver _preferredEventSourceForTouch:tracking:shouldUpdateOut:](self, "_preferredEventSourceForTouch:tracking:shouldUpdateOut:", v4, v7, &v19);
    if (v8 == 3 && v19 != 0)
    {
      -[_UIRemoteKeyboardsEventObserver delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 3;
LABEL_16:
      objc_msgSend(v12, "updateEventSource:options:", v14, 7);

      goto LABEL_17;
    }
    if (v8)
      v10 = 1;
    else
      v10 = v19 == 0;
    if (!v10)
    {
      if (objc_msgSend(v7, "beganGestureClass"))
        goto LABEL_26;
      objc_msgSend(v4, "view");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (_QWORD *)v15;
        do
        {
          v17 = v16;
          v18 = v16[13];
          objc_msgSend(v16, "superview");
          v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();

        }
        while ((v18 & 0x10) == 0 && v16);

        if ((v18 & 0x10) != 0)
        {
LABEL_26:
          objc_msgSend(v7, "largestObservedRadius");
          if (v11 <= 75.0
            && !-[_UIRemoteKeyboardsEventObserver _hasTextAlternativesForTouch:](self, "_hasTextAlternativesForTouch:", v4))
          {
            -[_UIRemoteKeyboardsEventObserver delegate](self, "delegate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            v14 = 0;
            goto LABEL_16;
          }
        }
      }
    }
  }
LABEL_17:
  -[NSMutableDictionary removeObjectForKey:](self->_touchTracker, "removeObjectForKey:", v5);

}

- (void)setKeyboardIsVisible:(BOOL)a3
{
  self->_keyboardIsVisible = a3;
}

- (void)_startTrackingForTouch:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *touchTracker;
  void *v7;
  _UIRKEOTouchTracking *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  char v12;

  v4 = a3;
  if (!self->_touchTracker)
  {
    v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    touchTracker = self->_touchTracker;
    self->_touchTracker = v5;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "_touchIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_touchTracker, "objectForKey:", v7);
  v8 = (_UIRKEOTouchTracking *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(_UIRKEOTouchTracking);
    -[_UIRKEOTouchTracking setType:](v8, "setType:", objc_msgSend(v4, "type"));
    -[NSMutableDictionary setObject:forKey:](self->_touchTracker, "setObject:forKey:", v8, v7);
  }
  -[_UIRKEOTouchTracking setValid:](v8, "setValid:", 1);
  objc_msgSend(v4, "majorRadius");
  -[_UIRKEOTouchTracking setLargestObservedRadius:](v8, "setLargestObservedRadius:");
  if (!-[_UIRemoteKeyboardsEventObserver keyboardIsVisible](self, "keyboardIsVisible")
    && !-[_UIRemoteKeyboardsEventObserver hasTextInputResponder](self, "hasTextInputResponder"))
  {
    v12 = 0;
    v9 = -[_UIRemoteKeyboardsEventObserver _preferredEventSourceForTouch:tracking:shouldUpdateOut:](self, "_preferredEventSourceForTouch:tracking:shouldUpdateOut:", v4, v8, &v12);
    if (v12)
    {
      v10 = v9;
      -[_UIRemoteKeyboardsEventObserver delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateEventSource:options:", v10, 7);

    }
  }

}

- (int64_t)_preferredEventSourceForTouch:(id)a3 tracking:(id)a4 shouldUpdateOut:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  char v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char isKindOfClass;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(v10, "_interactionTextInputSource");
    v12 = 1;
    goto LABEL_9;
  }
  if ((objc_msgSend((id)objc_msgSend(v9, "beganGestureClass"), "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || -[_UIRemoteKeyboardsEventObserver hasTextInputResponder](self, "hasTextInputResponder")
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v12 = 0;
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v12 = v10 != 0;
  if (objc_msgSend(v8, "type") == 2 && v10)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v10, "gestureRecognizers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v21 = v9;
      v17 = *(_QWORD *)v23;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v12 = 0;
            goto LABEL_28;
          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v16)
          continue;
        break;
      }
      v12 = 1;
LABEL_28:
      v9 = v21;
    }
    else
    {
      v12 = 1;
    }

    v11 = 3;
  }
  else
  {
    if (objc_msgSend(v8, "phase"))
      goto LABEL_8;
    v12 = objc_msgSend((id)UIApp, "_isSpringBoard");
    if (objc_msgSend(v8, "type") == 2)
      v11 = 3;
    else
      v11 = 0;
  }
LABEL_9:
  if (a5)
    *a5 = v12;

  return v11;
}

- (BOOL)hasTextInputResponder
{
  return self->_hasTextInputResponder;
}

- (BOOL)keyboardIsVisible
{
  return self->_keyboardIsVisible;
}

- (_UIRemoteKeyboardsEventObserverDelegate)delegate
{
  return (_UIRemoteKeyboardsEventObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_markTrackingForTouch:(id)a3 withGesture:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(a3, "_touchIdentifier"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_touchTracker, "objectForKey:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();

  objc_msgSend(v8, "setBeganGestureClass:", v9);
}

- (void)textInputResponderDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("UITextInputResponderCapabilitiesChangedInputResponderKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteKeyboardsEventObserver setHasTextInputResponder:](self, "setHasTextInputResponder:", v4 != 0);

}

- (void)setHasTextInputResponder:(BOOL)a3
{
  self->_hasTextInputResponder = a3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UITextInputResponderDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIRemoteKeyboardsEventObserver;
  -[_UIRemoteKeyboardsEventObserver dealloc](&v4, sel_dealloc);
}

- (BOOL)_hasTextAlternativesForTouch:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "view", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interactions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v14, "_hasTextAlternativesAtLocation:", v6, v8) & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_12;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_12:

  return v11;
}

- (void)_updateTrackingForTouch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "_touchIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_touchTracker, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "valid"))
    {
      objc_msgSend(v10, "majorRadius");
      v8 = v7;
      objc_msgSend(v6, "largestObservedRadius");
      if (v8 > v9)
      {
        objc_msgSend(v10, "majorRadius");
        objc_msgSend(v6, "setLargestObservedRadius:");
      }
    }
  }

}

- (void)_cancelTrackingForTouch:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "_touchIdentifier"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_touchTracker, "removeObjectForKey:", v4);

}

- (void)_invalidateTrackingForTouch:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "_touchIdentifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_touchTracker, "objectForKey:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValid:", 0);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touchTracker, 0);
}

@end

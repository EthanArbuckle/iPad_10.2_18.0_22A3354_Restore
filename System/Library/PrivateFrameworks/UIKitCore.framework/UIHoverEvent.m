@implementation UIHoverEvent

- (void)setNeedsHitTestResetForWindow:(id)a3
{
  -[UIHoverEvent _setNeedsUpdateForWindow:forcingHitTest:](self, "_setNeedsUpdateForWindow:forcingHitTest:", a3, 1);
}

- (void)_windowDidDetachContext:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("contextId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIHoverEvent _completelyRemoveHoverTouchesForWindow:contextIdNumber:withCancellation:](self, "_completelyRemoveHoverTouchesForWindow:contextIdNumber:withCancellation:", v6, v8, 1);
  }

}

- (void)_windowDidBecomeHidden:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v6, "_contextId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIHoverEvent _completelyRemoveHoverTouchesForWindow:contextIdNumber:withCancellation:](self, "_completelyRemoveHoverTouchesForWindow:contextIdNumber:withCancellation:", v6, v7, 1);

  }
}

- (void)_completelyRemoveHoverTouchesForWindow:(id)a3 contextIdNumber:(id)a4 withCancellation:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v20 = v9;
    -[NSMapTable objectForKey:](self->_touchesByContextId, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (!v12)
      goto LABEL_17;
    v13 = v12;
    v14 = *(_QWORD *)v22;
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v5)
        {
          -[NSMapTable objectForKey:](self->_deliveryTableByTouch, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_cancelAllGestureRecognizers");

        }
        if (v16 && (unint64_t)(*(_QWORD *)(v16 + 16) - 5) <= 2)
        {
          v18 = v8;
          if (v8)
          {
            v19 = v18;
          }
          else
          {
            +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", objc_msgSend(v20, "unsignedIntValue"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19)
              goto LABEL_15;
          }
          -[UITouch _clearForWindowIfNeeded:](v16, v19);

        }
LABEL_15:
        -[NSMapTable removeObjectForKey:](self->_deliveryTableByTouch, "removeObjectForKey:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v13)
      {
LABEL_17:
        v10 = v20;
        -[NSMapTable removeObjectForKey:](self->_touchesByContextId, "removeObjectForKey:", v20);

        break;
      }
    }
  }

}

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIHoverEvent;
  v2 = -[UIEvent _init](&v13, sel__init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[15];
    v2[15] = v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v2[16];
    v2[16] = v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v2[17];
    v2[17] = v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__windowDidDetachContext_, _UIWindowDidDetachContextNotification, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__windowDidBecomeHidden_, CFSTR("UIWindowDidBecomeHiddenNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__pointerStateDidChange_, 0x1E1751EA0, 0);

  }
  return v2;
}

- (void)_setNeedsUpdateForWindow:(id)a3 forcingHitTest:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  -[UIHoverEvent touchesForWindow:](self, "touchesForWindow:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[UIHoverEvent _deliveryTableByTouchCreateIfNeeded:](self, "_deliveryTableByTouchCreateIfNeeded:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateForEvent:forcingHitTest:", self, v4);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (id)touchesForWindow:(id)a3
{
  NSMapTable *touchesByContextId;
  void *v4;
  void *v5;

  touchesByContextId = self->_touchesByContextId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "_contextId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](touchesByContextId, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = _UIWindowDidDetachContextNotification;
  v6[1] = CFSTR("UIWindowDidBecomeHiddenNotification");
  v6[2] = 0x1E1751EA0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIHoverEvent;
  -[UIEvent dealloc](&v5, sel_dealloc);
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIHoverEvent;
  -[UIEvent _setHIDEvent:](&v14, sel__setHIDEvent_);
  if (a3)
  {
    v5 = 0.0;
    if (_os_feature_enabled_impl())
    {
      _UIEventHIDPencilMaximumPositionZForEvent((uint64_t)a3);
      v7 = v6;
      if (_UIEventHIDGetChildStylusEvent((uint64_t)a3))
      {
        IOHIDEventGetFloatValue();
        v5 = v8;
        IOHIDEventGetFloatValue();
        v10 = v9;
        IOHIDEventGetFloatValue();
        v12 = v11;
        IOHIDEventGetFloatValue();
LABEL_7:
        self->_maximumPositionZ = v7;
        self->_positionZ = v12;
        self->_hoverAzimuthAngle = v10;
        self->_hoverAltitudeAngle = v5;
        self->_hoverRollAngle = v13;
        return;
      }
    }
    else
    {
      v7 = 0.0;
    }
    v10 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    goto LABEL_7;
  }
}

- (int64_t)type
{
  return 11;
}

- (int64_t)subtype
{
  return 0;
}

- (id)allTouches
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  NSAllMapTableValues(self->_touchesByContextId);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "unionSet:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)touchesForView:(id)a3
{
  return 0;
}

- (id)touchesForGestureRecognizer:(id)a3
{
  return (id)objc_msgSend(a3, "_allActiveTouches");
}

- (id)_allWindows
{
  void *v3;
  NSMapTable *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_touchesByContextId;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v6 = 136315394;
    v17 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", objc_msgSend(v10, "unsignedIntValue", v17, (_QWORD)v18));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v3, "addObject:", v11);
        }
        else if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = "-[UIHoverEvent _allWindows]";
            v24 = 2112;
            v25 = v10;
            _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "%s: No window for tracked contextId: %@", buf, 0x16u);
          }

        }
        else
        {
          v12 = _allWindows___s_category;
          if (!_allWindows___s_category)
          {
            v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v12, (unint64_t *)&_allWindows___s_category);
          }
          v13 = *(NSObject **)(v12 + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v23 = "-[UIHoverEvent _allWindows]";
            v24 = 2112;
            v25 = v10;
            _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "%s: No window for tracked contextId: %@", buf, 0x16u);
          }
        }

        ++v9;
      }
      while (v7 != v9);
      v15 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      v7 = v15;
    }
    while (v15);
  }

  return v3;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *touchesByContextId;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  touchesByContextId = self->_touchesByContextId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "_contextId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](touchesByContextId, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[UIHoverEvent _deliveryTableByTouchCreateIfNeeded:](self, "_deliveryTableByTouchCreateIfNeeded:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "gestureRecognizers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v5;
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSMutableSet *v17;
  void *v18;
  UIHoverEvent *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  NSAllMapTableValues(self->_deliveryTableByTouch);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v6)
  {
    v10 = 0;
    v9 = 0;
    goto LABEL_31;
  }
  v7 = v6;
  v20 = self;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v22 != v11)
        objc_enumerationMutation(v5);
      v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      v14 = objc_msgSend(v13, "updateGestureRecognizerForDelivery:", v4);
      switch(v14)
      {
        case 7:
          if (!v8)
            v8 = objc_opt_new();
          objc_msgSend(v13, "touch");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)v8;
          break;
        case 6:
          if (!v9)
            v9 = (void *)objc_opt_new();
          objc_msgSend(v13, "touch");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v9;
          break;
        case 5:
          if (!v10)
            v10 = (void *)objc_opt_new();
          objc_msgSend(v13, "touch");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v10;
          break;
        default:
          continue;
      }
      objc_msgSend(v16, "addObject:", v15);

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v7);

  if (v10)
    objc_msgSend(v4, "_componentsBegan:withEvent:", v10, v20);
  if (v9)
  {
    v17 = v20->_touchesWithOutstandingUpdates;
    objc_msgSend(v4, "_allActiveTouches");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet intersectsSet:](v17, "intersectsSet:", v18) & 1) != 0
      || !objc_msgSend(v18, "count") && -[NSMutableSet count](v17, "count"))
    {
      objc_msgSend(v4, "_componentsChanged:withEvent:", v9, v20);
    }

  }
  if (v8)
  {
    objc_msgSend(v4, "_componentsEnded:withEvent:", v8, v20);
    v5 = (void *)v8;
LABEL_31:

  }
  return 1;
}

- (void)_gestureRecognizerNoLongerNeedsSendEvent:(id)a3
{
  id v4;
  void *v5;
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
  v4 = a3;
  -[UIHoverEvent touchesForGestureRecognizer:](self, "touchesForGestureRecognizer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[UIHoverEvent removeTouch:fromGestureRecognizer:](self, "removeTouch:fromGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

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
        if (objc_msgSend(v13, "_eventComponentType"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIHoverEvent.m"), 499, CFSTR("Wrong component type for event: %@; component: %@"),
            self,
            v13);

        }
        -[UIHoverEvent removeTouch:fromGestureRecognizer:](self, "removeTouch:fromGestureRecognizer:", v13, v7);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)_removeGestureRecognizersSendingCancelledEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[UIHoverEvent _componentsForGestureRecognizer:](self, "_componentsForGestureRecognizer:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_componentsCancelled:withEvent:", v10, self);
        -[UIHoverEvent _removeGestureRecognizer:fromComponents:](self, "_removeGestureRecognizer:fromComponents:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (unint64_t)_inputPrecision
{
  return 2;
}

- (void)setNeedsUpdateForWindow:(id)a3
{
  -[UIHoverEvent _setNeedsUpdateForWindow:forcingHitTest:](self, "_setNeedsUpdateForWindow:forcingHitTest:", a3, 0);
}

- (void)removeTouch:(id)a3 fromGestureRecognizer:(id)a4
{
  NSMapTable *deliveryTableByTouch;
  id v6;
  id v7;

  deliveryTableByTouch = self->_deliveryTableByTouch;
  v6 = a4;
  -[NSMapTable objectForKey:](deliveryTableByTouch, "objectForKey:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", v6);

}

- (id)hoverTouchForContextId:(unsigned int)a3 pathIndex:(int64_t)a4
{
  NSMapTable *touchesByContextId;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
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
  touchesByContextId = self->_touchesByContextId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](touchesByContextId, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "_pathIndex", (_QWORD)v16) == a4)
        {
          v14 = v13;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)setHoverTouch:(id)a3 forContextId:(unsigned int)a4 pathIndex:(int64_t)a5
{
  uint64_t v5;
  id v7;
  id v8;

  if (a3)
  {
    v5 = *(_QWORD *)&a4;
    v7 = a3;
    -[UIHoverEvent _touchesByContextId:createIfNeeded:](self, "_touchesByContextId:createIfNeeded:", v5, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

  }
}

- (void)removeHoverTouchForContextId:(unsigned int)a3 pathIndex:(int64_t)a4
{
  uint64_t v5;
  NSMapTable *touchesByContextId;
  void *v8;
  void *v9;
  void *v10;
  NSMapTable *v11;
  void *v12;
  id v13;

  v5 = *(_QWORD *)&a3;
  touchesByContextId = self->_touchesByContextId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](touchesByContextId, "objectForKey:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UIHoverEvent hoverTouchForContextId:pathIndex:](self, "hoverTouchForContextId:pathIndex:", v5, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setWindow:", 0);
      objc_msgSend(v13, "removeObject:", v10);
      if (!objc_msgSend(v13, "count"))
      {
        v11 = self->_touchesByContextId;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable removeObjectForKey:](v11, "removeObjectForKey:", v12);

      }
      -[NSMapTable removeObjectForKey:](self->_deliveryTableByTouch, "removeObjectForKey:", v10);
    }

  }
}

- (void)_removeAllHoverTouchesForContextId:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIHoverEvent _completelyRemoveHoverTouchesForWindow:contextIdNumber:withCancellation:](self, "_completelyRemoveHoverTouchesForWindow:contextIdNumber:withCancellation:", 0, v4, 0);

}

- (void)_cancelAllGestureRecognizersAndRemoveAllHoverTouches
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  NSAllMapTableKeys(self->_touchesByContextId);
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
        -[UIHoverEvent _completelyRemoveHoverTouchesForWindow:contextIdNumber:withCancellation:](self, "_completelyRemoveHoverTouchesForWindow:contextIdNumber:withCancellation:", 0, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 1, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_cancelAllGestureRecognizers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  NSAllMapTableValues(self->_deliveryTableByTouch);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_cancelAllGestureRecognizers", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_touchesByContextId:(unsigned int)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  NSMapTable *touchesByContextId;
  void *v8;
  void *v9;
  BOOL v10;
  NSMapTable *v11;
  void *v12;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  touchesByContextId = self->_touchesByContextId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](touchesByContextId, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = 1;
  else
    v10 = !v4;
  if (!v10)
  {
    v9 = (void *)objc_opt_new();
    v11 = self->_touchesByContextId;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v11, "setObject:forKey:", v9, v12);

  }
  return v9;
}

- (id)_deliveryTableByTouchCreateIfNeeded:(id)a3
{
  id v4;
  _UIHoverTouchDeliveryTable *v5;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_deliveryTableByTouch, "objectForKey:", v4);
  v5 = (_UIHoverTouchDeliveryTable *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[_UIHoverTouchDeliveryTable initWithTouch:]([_UIHoverTouchDeliveryTable alloc], "initWithTouch:", v4);
    -[NSMapTable setObject:forKey:](self->_deliveryTableByTouch, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)_pointerStateDidChange:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "pointerState"))
    {
      if (objc_msgSend((id)UIApp, "_isSpringBoard"))
      {
        if (_UIInternalPreferencesRevisionOnce != -1)
          dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
        v8 = _UIInternalPreferencesRevisionVar;
        if (_UIInternalPreferencesRevisionVar < 1)
          goto LABEL_7;
        v14 = _UIInternalPreference_DisableSystemGestureWindowWorkaround_89259823;
        if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_DisableSystemGestureWindowWorkaround_89259823)
          goto LABEL_7;
        while (v8 >= v14)
        {
          _UIInternalPreferenceSync(v8, &_UIInternalPreference_DisableSystemGestureWindowWorkaround_89259823, (uint64_t)CFSTR("DisableSystemGestureWindowWorkaround_89259823"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v14 = _UIInternalPreference_DisableSystemGestureWindowWorkaround_89259823;
          if (v8 == _UIInternalPreference_DisableSystemGestureWindowWorkaround_89259823)
            goto LABEL_7;
        }
        if (!byte_1EDDA825C)
        {
LABEL_7:
          v17 = 0u;
          v18 = 0u;
          v16 = 0u;
          -[UIHoverEvent _allWindows](self, "_allWindows", 0, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v16;
            while (2)
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v16 != v12)
                  objc_enumerationMutation(v9);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {

                  -[UIHoverEvent _cancelAllGestureRecognizers](self, "_cancelAllGestureRecognizers");
                  goto LABEL_18;
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
              if (v11)
                continue;
              break;
            }
          }

        }
      }
      -[UIHoverEvent _cancelAllGestureRecognizersAndRemoveAllHoverTouches](self, "_cancelAllGestureRecognizersAndRemoveAllHoverTouches");
    }
LABEL_18:

  }
}

- (void)_setPointerLocked:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  UIHoverEvent *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_pointerLocked != a3)
  {
    v3 = a3;
    v5 = _setPointerLocked____s_category;
    if (!_setPointerLocked____s_category)
    {
      v5 = __UILogCategoryGetNode("PointerLockState", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_setPointerLocked____s_category);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = CFSTR("NO");
        if (v3)
          v7 = CFSTR("YES");
        v8 = 138412546;
        v9 = self;
        v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Updating UIHoverEvent pointerLocked: hoverEvent: %@; pointerLocked: %@",
          (uint8_t *)&v8,
          0x16u);
      }
    }
    self->_pointerLocked = v3;
    -[UIHoverEvent _cancelAllGestureRecognizers](self, "_cancelAllGestureRecognizers");
  }
}

- (void)_addHasOutstandingUpdateTouch:(id)a3
{
  -[NSMutableSet addObject:](self->_touchesWithOutstandingUpdates, "addObject:", a3);
}

- (BOOL)hasOutstandingUpdates
{
  return -[NSMutableSet count](self->_touchesWithOutstandingUpdates, "count") != 0;
}

- (void)_resetHasOutstandingUpdateTouches
{
  -[NSMutableSet removeAllObjects](self->_touchesWithOutstandingUpdates, "removeAllObjects");
}

- (BOOL)_isPointerLocked
{
  return self->_pointerLocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchesWithOutstandingUpdates, 0);
  objc_storeStrong((id *)&self->_deliveryTableByTouch, 0);
  objc_storeStrong((id *)&self->_touchesByContextId, 0);
}

@end

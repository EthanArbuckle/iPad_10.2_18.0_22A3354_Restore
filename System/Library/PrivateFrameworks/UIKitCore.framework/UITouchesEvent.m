@implementation UITouchesEvent

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  objc_class *v47;
  void *v48;
  int v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") > 2)
  {
    v7 = 0;
  }
  else
  {
    if (!qword_1EDDC87C0)
    {
      v5 = objc_opt_new();
      v6 = (void *)qword_1EDDC87C0;
      qword_1EDDC87C0 = v5;

    }
    if (_UIApplicationSupportsGlobalEdgeSwipeTouches()
      && -[UITouchesEvent _sendSynthesizedBeganToGesture:](self, "_sendSynthesizedBeganToGesture:", v4))
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend((id)qword_1EDDC87C0, "removeAllObjects");
      -[UITouchesEvent _touchesForGesture:withPhase:intoSet:](self, "_touchesForGesture:withPhase:intoSet:", v4, 0, qword_1EDDC87C0);
      v8 = qword_1EDDC87C8;
      if (!qword_1EDDC87C8)
      {
        v8 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&qword_1EDDC87C8);
      }
      if ((*(_BYTE *)v8 & 1) != 0)
      {
        v18 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)qword_1EDDC87C0;
          v20 = v18;
          v49 = 67109120;
          LODWORD(v50) = objc_msgSend(v19, "count");
          _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "\t\tBegan touch count: %d", (uint8_t *)&v49, 8u);

        }
      }
      v9 = objc_msgSend((id)qword_1EDDC87C0, "count");
      v7 = v9 != 0;
      if (v9)
      {
        v10 = qword_1EDDC87D0;
        if (!qword_1EDDC87D0)
        {
          v10 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v10, (unint64_t *)&qword_1EDDC87D0);
        }
        if ((*(_BYTE *)v10 & 1) != 0)
        {
          v33 = *(NSObject **)(v10 + 8);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v34 = v33;
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = 134218498;
            v50 = v4;
            v51 = 2112;
            v52 = v36;
            v53 = 2112;
            v54 = qword_1EDDC87C0;
            _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "\t\tCalling touchesBegan:withEvent: on gesture: %p (%@) with touches: %@", (uint8_t *)&v49, 0x20u);

          }
        }
        objc_msgSend(v4, "_componentsBegan:withEvent:", qword_1EDDC87C0, self);
      }
      objc_msgSend((id)qword_1EDDC87C0, "removeAllObjects");
      -[UITouchesEvent _touchesForGesture:withPhase:intoSet:](self, "_touchesForGesture:withPhase:intoSet:", v4, 1, qword_1EDDC87C0);
      v11 = qword_1EDDC87D8;
      if (!qword_1EDDC87D8)
      {
        v11 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&qword_1EDDC87D8);
      }
      if ((*(_BYTE *)v11 & 1) != 0)
      {
        v21 = *(NSObject **)(v11 + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (void *)qword_1EDDC87C0;
          v23 = v21;
          v24 = objc_msgSend(v22, "count");
          v49 = 67109120;
          LODWORD(v50) = v24;
          _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "\t\tMoved touch count: %d", (uint8_t *)&v49, 8u);

        }
      }
      if (objc_msgSend((id)qword_1EDDC87C0, "count"))
      {
        v12 = qword_1EDDC87E0;
        if (!qword_1EDDC87E0)
        {
          v12 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&qword_1EDDC87E0);
        }
        if ((*(_BYTE *)v12 & 1) != 0)
        {
          v37 = *(NSObject **)(v12 + 8);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = v37;
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = 134218498;
            v50 = v4;
            v51 = 2112;
            v52 = v40;
            v53 = 2112;
            v54 = qword_1EDDC87C0;
            _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_ERROR, "\t\tCalling touchesMoved:withEvent: on gesture: %p (%@) with touches: %@", (uint8_t *)&v49, 0x20u);

          }
        }
        objc_msgSend(v4, "_componentsChanged:withEvent:", qword_1EDDC87C0, self);
        v7 = 1;
      }
      objc_msgSend((id)qword_1EDDC87C0, "removeAllObjects");
      -[UITouchesEvent _touchesForGesture:withPhase:intoSet:](self, "_touchesForGesture:withPhase:intoSet:", v4, 3, qword_1EDDC87C0);
      v13 = qword_1EDDC87E8;
      if (!qword_1EDDC87E8)
      {
        v13 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&qword_1EDDC87E8);
      }
      if ((*(_BYTE *)v13 & 1) != 0)
      {
        v25 = *(NSObject **)(v13 + 8);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = (void *)qword_1EDDC87C0;
          v27 = v25;
          v28 = objc_msgSend(v26, "count");
          v49 = 67109120;
          LODWORD(v50) = v28;
          _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "\t\tEnded touch count: %d", (uint8_t *)&v49, 8u);

        }
      }
      if (objc_msgSend((id)qword_1EDDC87C0, "count"))
      {
        v14 = qword_1EDDC87F0;
        if (!qword_1EDDC87F0)
        {
          v14 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v14, (unint64_t *)&qword_1EDDC87F0);
        }
        if ((*(_BYTE *)v14 & 1) != 0)
        {
          v41 = *(NSObject **)(v14 + 8);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v42 = v41;
            v43 = (objc_class *)objc_opt_class();
            NSStringFromClass(v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = 134218498;
            v50 = v4;
            v51 = 2112;
            v52 = v44;
            v53 = 2112;
            v54 = qword_1EDDC87C0;
            _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_ERROR, "\t\tCalling touchesEnded:withEvent: on gesture: %p (%@) with touches: %@", (uint8_t *)&v49, 0x20u);

          }
        }
        objc_msgSend(v4, "_componentsEnded:withEvent:", qword_1EDDC87C0, self);
        v7 = 1;
      }
      objc_msgSend((id)qword_1EDDC87C0, "removeAllObjects");
      -[UITouchesEvent _touchesForGesture:withPhase:intoSet:](self, "_touchesForGesture:withPhase:intoSet:", v4, 4, qword_1EDDC87C0);
      v15 = qword_1EDDC87F8;
      if (!qword_1EDDC87F8)
      {
        v15 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&qword_1EDDC87F8);
      }
      if ((*(_BYTE *)v15 & 1) != 0)
      {
        v29 = *(NSObject **)(v15 + 8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = (void *)qword_1EDDC87C0;
          v31 = v29;
          v32 = objc_msgSend(v30, "count");
          v49 = 67109120;
          LODWORD(v50) = v32;
          _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "\t\tCanceled touch count: %d", (uint8_t *)&v49, 8u);

        }
      }
      if (objc_msgSend((id)qword_1EDDC87C0, "count"))
      {
        v16 = qword_1EDDC8800;
        if (!qword_1EDDC8800)
        {
          v16 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v16, (unint64_t *)&qword_1EDDC8800);
        }
        if ((*(_BYTE *)v16 & 1) != 0)
        {
          v45 = *(NSObject **)(v16 + 8);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v46 = v45;
            v47 = (objc_class *)objc_opt_class();
            NSStringFromClass(v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = 134218498;
            v50 = v4;
            v51 = 2112;
            v52 = v48;
            v53 = 2112;
            v54 = qword_1EDDC87C0;
            _os_log_impl(&dword_185066000, v46, OS_LOG_TYPE_ERROR, "\t\tCalling touchesCancelled on gesture: %p (%@) with touches: %@", (uint8_t *)&v49, 0x20u);

          }
        }
        objc_msgSend(v4, "_componentsCancelled:withEvent:", qword_1EDDC87C0, self);
        v7 = 1;
      }
      objc_msgSend((id)qword_1EDDC87C0, "removeAllObjects");
    }
  }

  return v7;
}

- (void)_touchesForGesture:(id)a3 withPhase:(int64_t)a4 intoSet:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UITouchesEvent touchesForGestureRecognizer:](self, "touchesForGestureRecognizer:", a3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v14, "phase") == a4
          && (a4 != 1 || -[UITouch _shouldDeliverTouchForTouchesMoved]((uint64_t)v14)))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (id)touchesForGestureRecognizer:(id)a3
{
  return (id)CFDictionaryGetValue(self->_keyedTouches, a3);
}

- (int64_t)type
{
  return 0;
}

- (void)_removeTouch:(id)a3 fromGestureRecognizer:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[UITouchesEvent _touchesForKey:](self, "_touchesForKey:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v6);

  if (!objc_msgSend(v7, "count"))
    -[UITouchesEvent _removeTouchesForKey:](self, "_removeTouchesForKey:", v8);

}

- (id)_touchesForKey:(id)a3
{
  return touchesFromDictionaryWithKey(self->_keyedTouches, a3);
}

- (void)_removeTouchesForKey:(id)a3
{
  void *v4;
  void *v5;
  __CFDictionary *gestureRecognizersByWindow;
  id v7;
  void *v8;
  id key;

  key = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(key, "state") >= 3)
  {
    objc_msgSend(key, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
      v7 = v5;
      CFDictionaryGetValue(gestureRecognizersByWindow, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryRemoveValue(gestureRecognizersByWindow, v7);

    }
  }
  CFDictionaryRemoveValue(self->_keyedTouches, key);

}

- (void)_invalidateGestureRecognizerForWindowCache
{
  __CFDictionary *gestureRecognizersByWindow;

  gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
  if (gestureRecognizersByWindow)
    CFDictionaryRemoveAllValues(gestureRecognizersByWindow);
}

- (id)allTouches
{
  NSSet *allTouchesImmutableCached;
  NSSet *v4;
  NSSet *v5;

  allTouchesImmutableCached = self->_allTouchesImmutableCached;
  if (!allTouchesImmutableCached)
  {
    v4 = (NSSet *)-[NSMutableSet copy](self->_allTouchesMutable, "copy");
    v5 = self->_allTouchesImmutableCached;
    self->_allTouchesImmutableCached = v4;

    allTouchesImmutableCached = self->_allTouchesImmutableCached;
  }
  return allTouchesImmutableCached;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v5;
  unint64_t v6;
  objc_super v7;

  if (-[UIEvent _hidEvent](self, "_hidEvent"))
    CFDictionaryRemoveValue(self->_coalescedTouches, -[UIEvent _hidEvent](self, "_hidEvent"));
  v7.receiver = self;
  v7.super_class = (Class)UITouchesEvent;
  -[UIEvent _setHIDEvent:](&v7, sel__setHIDEvent_, a3);
  CFDictionaryRemoveAllValues(self->_finalTouches);
  if (a3)
  {
    v5 = _UIEventHIDGetDescendantPointerEvent((uint64_t)a3);
    self->_containsHIDPointerEvent = v5 != 0;
    v6 = _UIEventHIDGetPointerEventSource(v5);
  }
  else
  {
    v6 = 0;
    self->_containsHIDPointerEvent = 0;
  }
  self->_currentPointerEventSource = v6;
}

- (CGPoint)_digitizerLocation
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (-[UIEvent _hidEvent](self, "_hidEvent") && IOHIDEventConformsTo())
  {
    IOHIDEventGetFloatValue();
    v2 = v4;
    IOHIDEventGetFloatValue();
    v3 = v5;
  }
  v6 = v2;
  v7 = v3;
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)_shouldSkipEventDeliveryWithIgnoreInteractionEvents:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UITouchesEvent _allWindows](self, "_allWindows", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_canIgnoreInteractionEvents"))
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (void)_clearTouches
{
  NSSet *allTouchesImmutableCached;

  -[NSMutableSet removeAllObjects](self->_allTouchesMutable, "removeAllObjects");
  allTouchesImmutableCached = self->_allTouchesImmutableCached;
  self->_allTouchesImmutableCached = 0;

  CFDictionaryRemoveAllValues(self->_keyedTouches);
  CFDictionaryRemoveAllValues(self->_keyedTouchesByWindow);
}

- (id)coalescedTouchesForTouch:(id)a3
{
  id v4;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_allTouchesMutable, "containsObject:", v4))
  {
    -[UITouchesEvent _rawCoalescedTouchesForTouch:](self, "_rawCoalescedTouchesForTouch:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (const void *)objc_msgSend(v4, "_pathIndex");
    if (!CFDictionaryGetValue(self->_finalTouches, v6))
    {
      objc_msgSend(v4, "_clone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "lastObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_setPreviousTouch:", v8);

      }
      objc_msgSend(v5, "addObject:", v7);
      CFDictionarySetValue(self->_finalTouches, v6, CFSTR("DidAppend"));

    }
    v9 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_rawCoalescedTouchesForTouch:(id)a3
{
  id v4;
  const void *v5;
  __CFDictionary *v6;
  void *v7;

  v4 = a3;
  v5 = (const void *)objc_msgSend(v4, "_pathIndex");
  v6 = -[UITouchesEvent _coalescedTouchesForHidEvent:](self, "_coalescedTouchesForHidEvent:", -[UIEvent _hidEvent](self, "_hidEvent"));
  CFDictionaryGetValue(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(v6, v5, v7);
  }

  return v7;
}

- (__CFDictionary)_coalescedTouchesForHidEvent:(__IOHIDEvent *)a3
{
  const void *Value;

  Value = CFDictionaryGetValue(self->_coalescedTouches, a3);
  if (!Value)
  {
    Value = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(self->_coalescedTouches, a3, Value);
    CFRelease(Value);
  }
  return (__CFDictionary *)Value;
}

- (id)_exclusiveTouchWindows
{
  return self->_exclusiveTouchWindows;
}

- (void)_removeTouch:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFDictionary *gestureRecognizersByWindow;
  id v15;
  void *v16;
  NSSet *allTouchesImmutableCached;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UITouchesEvent _clearViewForTouch:](self, "_clearViewForTouch:", v4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "gestureRecognizers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[UITouchesEvent _touchesForKey:](self, "_touchesForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITouch _removeGestureRecognizer:]((uint64_t)v4, v10);
        objc_msgSend(v11, "removeObject:", v4);
        if (!objc_msgSend(v11, "count"))
          -[UITouchesEvent _removeTouchesForKey:](self, "_removeTouchesForKey:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWindow:", 0);
  if (objc_msgSend(v4, "_isPointerTouch"))
    objc_msgSend(v4, "_clearForReenteringHoverInWindow:", v12);
  if (v12)
  {
    -[UITouchesEvent _touchesForWindow:](self, "_touchesForWindow:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v4);
    gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
    v15 = v12;
    CFDictionaryGetValue(gestureRecognizersByWindow, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRemoveValue(gestureRecognizersByWindow, v15);

    if (!objc_msgSend(v13, "count"))
      -[UITouchesEvent _removeTouchesForWindow:](self, "_removeTouchesForWindow:", v15);

  }
  -[NSMutableSet removeObject:](self->_allTouchesMutable, "removeObject:", v4);
  allTouchesImmutableCached = self->_allTouchesImmutableCached;
  self->_allTouchesImmutableCached = 0;

}

- (void)_addTouch:(id)a3 forDelayedDelivery:(BOOL)a4
{
  id v6;
  NSSet *allTouchesImmutableCached;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __CFDictionary *gestureRecognizersByWindow;
  id v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  _QWORD *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  __CFDictionary *v30;
  id v31;
  void *v32;
  void *v33;
  __CFString *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  __CFString *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMutableSet addObject:](self->_allTouchesMutable, "addObject:", v6);
  allTouchesImmutableCached = self->_allTouchesImmutableCached;
  self->_allTouchesImmutableCached = 0;

  objc_msgSend(v6, "_responder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UITouchesEvent _touchesForKey:](self, "_touchesForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);

  }
  objc_msgSend(v6, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 || objc_msgSend(v6, "phase"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v6, "_gestureRecognizers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v11);
          -[UITouchesEvent _touchesForKey:](self, "_touchesForKey:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v6);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v13);
    }

    -[UITouchesEvent _addGestureRecognizersFromContainer:ifTouchIsTransitioningGES:](self, "_addGestureRecognizersFromContainer:ifTouchIsTransitioningGES:", v8, v6);
    gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
    v18 = v10;
    CFDictionaryGetValue(gestureRecognizersByWindow, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRemoveValue(gestureRecognizersByWindow, v18);

    if (v18)
      goto LABEL_13;
  }
  else
  {
    if (v8)
    {
      -[UITouchesEvent _addGestureRecognizersFromContainer:toTouch:](self, "_addGestureRecognizersFromContainer:toTouch:", v8, v6);
      v21 = v6;
      if (_UITouchShouldCancelDelayingGesturesFromPreviousSequence(v21))
      {
        objc_msgSend((id)UIApp, "_gestureEnvironment");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIGestureEnvironment _gesturesWithDelayedTouchForTouch:event:]((uint64_t)v22, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count"))
        {
          v24 = _cancelGesturesDelayingTouchFromPreviousSequenceIfNeeded____s_category;
          if (!_cancelGesturesDelayingTouchFromPreviousSequenceIfNeeded____s_category)
          {
            v24 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v24, (unint64_t *)&_cancelGesturesDelayingTouchFromPreviousSequenceIfNeeded____s_category);
          }
          v25 = *(id *)(v24 + 8);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = v21;
            if (v26)
            {
              v33 = (void *)MEMORY[0x1E0CB3940];
              v27 = (objc_class *)objc_opt_class();
              NSStringFromClass(v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "stringWithFormat:", CFSTR("<%@: %p>"), v28, v26);
              v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v34 = CFSTR("(nil)");
            }

            *(_DWORD *)buf = 138543618;
            v41 = v34;
            v42 = 2114;
            v43 = v23;
            _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "The following gestures delayed responder-based delivery of %{public}@ during a previous sequence. However, they are no longer associated with this touch and did not eventually transition to a terminal state, which is invalid. These gestures will be cancelled to unblock responder event delivery of the new sequence for this touch:\n %{public}@", buf, 0x16u);

          }
          objc_msgSend(v23, "allObjects");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)v22, v29);

        }
      }

    }
    if (v10)
    {
      v30 = self->_gestureRecognizersByWindow;
      v31 = v10;
      CFDictionaryGetValue(v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryRemoveValue(v30, v31);

LABEL_13:
      -[UITouchesEvent _touchesForWindow:](self, "_touchesForWindow:", v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v6);

    }
  }

}

- (id)_touchesForWindow:(id)a3
{
  return touchesFromDictionaryWithKey(self->_keyedTouchesByWindow, a3);
}

- (void)_removeTouchesForWindow:(id)a3
{
  CFDictionaryRemoveValue(self->_keyedTouchesByWindow, a3);
}

- (void)_clearViewForTouch:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "_responder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setResponder:", 0);
  if (v4)
  {
    -[UITouchesEvent _touchesForKey:](self, "_touchesForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v6);
    if (!objc_msgSend(v5, "count"))
      -[UITouchesEvent _removeTouchesForKey:](self, "_removeTouchesForKey:", v4);

  }
}

- (void)_windowNoLongerAwaitingSystemGestureNotification:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
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
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_latentSystemGestureWindows;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_latentSystemGestureWindows, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObject:", v4);
        if (!objc_msgSend(v12, "count"))
        {
          if (!v8)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v8, "addObject:", v11);
        }

      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[NSMapTable removeObjectForKey:](self->_latentSystemGestureWindows, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void)_addWindowAwaitingLatentSystemGestureNotification:(id)a3 deliveredToEventWindow:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_latentSystemGestureWindows, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_latentSystemGestureWindows, "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

- (id)_init
{
  _QWORD *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITouchesEvent;
  v2 = -[UIEvent _init](&v6, sel__init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = (void *)v2[15];
    v2[15] = v3;

    _UITouchesEventCommonInit(v2);
  }
  return v2;
}

- (BOOL)_containsHIDPointerEvent
{
  return self->_containsHIDPointerEvent;
}

- (id)touchesForView:(id)a3
{
  return (id)CFDictionaryGetValue(self->_keyedTouches, a3);
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CFDictionaryGetValue(self->_gestureRecognizersByWindow, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[UITouchesEvent touchesForWindow:](self, "touchesForWindow:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v7 = 0;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "_gestureRecognizers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            if (!v7)
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v7 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v7, "addObjectsFromArray:", v14);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);

      if (v7)
        CFDictionarySetValue(self->_gestureRecognizersByWindow, v4, v7);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)_viewsForWindow:(id)a3
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
  -[UITouchesEvent touchesForWindow:](self, "touchesForWindow:", v4, 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "view");
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

- (id)touchesForWindow:(id)a3
{
  return (id)CFDictionaryGetValue(self->_keyedTouchesByWindow, a3);
}

- (void)dealloc
{
  __CFDictionary *keyedTouches;
  __CFDictionary *keyedTouchesByWindow;
  __CFDictionary *gestureRecognizersByWindow;
  __CFDictionary *coalescedTouches;
  __CFDictionary *finalTouches;
  objc_super v8;

  keyedTouches = self->_keyedTouches;
  if (keyedTouches)
    CFRelease(keyedTouches);
  keyedTouchesByWindow = self->_keyedTouchesByWindow;
  if (keyedTouchesByWindow)
    CFRelease(keyedTouchesByWindow);
  gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
  if (gestureRecognizersByWindow)
    CFRelease(gestureRecognizersByWindow);
  coalescedTouches = self->_coalescedTouches;
  if (coalescedTouches)
    CFRelease(coalescedTouches);
  finalTouches = self->_finalTouches;
  if (finalTouches)
    CFRelease(finalTouches);
  v8.receiver = self;
  v8.super_class = (Class)UITouchesEvent;
  -[UIEvent dealloc](&v8, sel_dealloc);
}

- (id)_touchesForGesture:(id)a3 withPhase:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITouchesEvent _touchesForGesture:withPhase:intoSet:](self, "_touchesForGesture:withPhase:intoSet:", v7, a4, v8);

  return v8;
}

- (id)_cloneEvent
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITouchesEvent;
  v3 = -[UIEvent _cloneEvent](&v7, sel__cloneEvent);
  v4 = -[NSMutableSet mutableCopy](self->_allTouchesMutable, "mutableCopy");
  v5 = (void *)*((_QWORD *)v3 + 15);
  *((_QWORD *)v3 + 15) = v4;

  _UITouchesEventCommonInit(v3);
  __29__UITouchesEvent__cloneEvent__block_invoke(self->_keyedTouches, *((__CFDictionary **)v3 + 17));
  __29__UITouchesEvent__cloneEvent__block_invoke(self->_keyedTouchesByWindow, *((__CFDictionary **)v3 + 18));
  return v3;
}

void __29__UITouchesEvent__cloneEvent__block_invoke(const __CFDictionary *a1, __CFDictionary *a2)
{
  CFIndex Count;
  CFIndex v5;
  const void **v6;
  size_t v7;
  const void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  Count = CFDictionaryGetCount(a1);
  if (Count >= 1)
  {
    v5 = Count;
    v6 = (const void **)((char *)v10 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    if ((unint64_t)(8 * Count) >= 0x200)
      v7 = 512;
    else
      v7 = 8 * Count;
    bzero((char *)v10 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    CFDictionaryGetKeysAndValues(a1, v6, 0);
    do
    {
      v8 = *v6++;
      v9 = (void *)objc_msgSend((id)CFDictionaryGetValue(a1, v8), "mutableCopy");
      CFDictionarySetValue(a2, v8, v9);

      --v5;
    }
    while (v5);
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)UITouchesEvent;
  -[UITouchesEvent description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEvent timestamp](self, "timestamp");
  v6 = v5;
  -[UITouchesEvent allTouches](self, "allTouches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ timestamp: %g touches: %@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)_windowsAwaitingLatentSystemGestureNotificationDeliveredToEventWindow:(id)a3
{
  void *v3;
  void *v4;

  -[NSMapTable objectForKey:](self->_latentSystemGestureWindows, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusiveTouchWindows, 0);
  objc_storeStrong((id *)&self->_latentSystemGestureWindows, 0);
  objc_storeStrong((id *)&self->_allTouchesImmutableCached, 0);
  objc_storeStrong((id *)&self->_allTouchesMutable, 0);
}

- (id)_initWithEvent:(__GSEvent *)a3 touches:(id)a4
{
  id v7;
  id *v8;
  id *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)UITouchesEvent;
  v8 = -[UIEvent _init](&v25, sel__init);
  v9 = v8;
  if (v8)
  {
    _UITouchesEventCommonInit(v8);
    objc_msgSend(v9, "_setGSEvent:", a3);
    objc_storeStrong(v9 + 15, a4);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v15, "view", (_QWORD)v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v9, "_touchesForKey:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v15);

          }
          objc_msgSend(v15, "window");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v9, "_touchesForWindow:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v15);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

  }
  return v9;
}

- (id)_allTouches
{
  NSSet *allTouchesImmutableCached;

  allTouchesImmutableCached = self->_allTouchesImmutableCached;
  self->_allTouchesImmutableCached = 0;

  return self->_allTouchesMutable;
}

- (id)touchesForResponder:(id)a3
{
  return (id)CFDictionaryGetValue(self->_keyedTouches, a3);
}

- (id)_touchesForGestureRecognizer:(id)a3
{
  return (id)CFDictionaryGetValue(self->_keyedTouches, a3);
}

- (void)_collectGestureRecognizersFromContainer:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v28;
  void *v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[2];
  uint64_t (*v40)(_QWORD *, void *, void *);
  void *v41;
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v29 = v5;
  objc_msgSend(v5, "_eventReceivingWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_exclusiveTouchView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__168;
  v49 = __Block_byref_object_dispose__168;
  v50 = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v40 = __68__UITouchesEvent__collectGestureRecognizersFromContainer_withBlock___block_invoke;
  v41 = &unk_1E16DF0F8;
  v28 = v8;
  v42 = v28;
  v9 = v6;
  v43 = v9;
  v44 = &v45;
  v10 = __68__UITouchesEvent__collectGestureRecognizersFromContainer_withBlock___block_invoke(v39, v5, 0);
  v11 = v9;
  if ((v10 & 1) == 0)
  {
    if (objc_msgSend((id)v46[5], "count"))
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      if (v5)
      {
        v13 = v5;
        do
        {
          objc_msgSend(v12, "addObject:", v13);
          v13 = (id)objc_msgSend(v13, "_parentGestureRecognizerContainer");
        }
        while (v13);
      }
      while (objc_msgSend((id)v46[5], "count"))
      {
        objc_msgSend((id)v46[5], "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v46[5], "removeLastObject");
        v15 = v40(v39, v14, v12);

        if ((v15 & 1) != 0)
          goto LABEL_31;
      }

    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[UITabBarControllerSidebar _actualFooterContentConfiguration]((id *)&self->super.super.isa);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    if (v16)
    {
      v24 = v16;
      v25 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            objc_msgSend(v17, "_gestureRecognizersForEvent:", self);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
            if (v19)
            {
              v20 = *(_QWORD *)v32;
              while (2)
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v32 != v20)
                    objc_enumerationMutation(v18);
                  v22 = *(_QWORD **)(*((_QWORD *)&v31 + 1) + 8 * j);
                  if (v22)
                    v22[1] |= 0x1000000000000uLL;
                  v30 = 0;
                  objc_msgSend(v22, "view", v24);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  (*((void (**)(id, _QWORD *, void *, char *))v9 + 2))(v9, v22, v23, &v30);

                  if (v30)
                  {

                    goto LABEL_31;
                  }
                }
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
                if (v19)
                  continue;
                break;
              }
            }

          }
        }
        v24 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
      }
      while (v24);
    }
LABEL_31:

    v11 = v43;
  }

  _Block_object_dispose(&v45, 8);
}

uint64_t __68__UITouchesEvent__collectGestureRecognizersFromContainer_withBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = v5;
    while (1)
    {
      if (v6)
      {
        if ((objc_msgSend(v6, "containsObject:", v7) & 1) != 0)
          goto LABEL_24;
        objc_msgSend(v6, "addObject:", v7);
      }
      objc_msgSend(v7, "gestureRecognizers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)a1[4];
        if (!v9 || isDescendantOfContainer(v9, v7, 0))
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          v10 = v8;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v23;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v23 != v13)
                  objc_enumerationMutation(v10);
                (*(void (**)(void))(a1[5] + 16))();
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            }
            while (v12);
          }

        }
      }
      if (_IsKindOfUIView((uint64_t)v7)
        && !objc_msgSend(v7, "deliversTouchesForGesturesToSuperview"))
      {
        break;
      }
      v15 = (id)objc_msgSend(v7, "_actingParentGestureRecognizerContainer");
      if (v15)
      {
        v16 = v15;
        v17 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        if (!v17)
        {
          v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v19 = *(_QWORD *)(a1[6] + 8);
          v20 = *(void **)(v19 + 40);
          *(_QWORD *)(v19 + 40) = v18;

          v17 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        }
        objc_msgSend(v17, "addObject:", v16);
      }

      v7 = (id)objc_msgSend(v7, "_parentGestureRecognizerContainer");
      if (!v7)
        goto LABEL_24;
    }

  }
LABEL_24:

  return 0;
}

- (void)_addGestureRecognizersFromContainer:(id)a3 ifTouchIsTransitioningGES:(id)a4
{
  id v6;
  _WORD *v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  _WORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "phase");
  v9 = _UIApplicationSupportsGlobalEdgeSwipeTouches();
  if (v7 && v9 && (v7[118] & 0x4000) != 0 && v8 <= 2)
  {
    if (v6)
    {
      v10 = qword_1EDDC87B0;
      if (!qword_1EDDC87B0)
      {
        v10 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1EDDC87B0);
      }
      if ((*(_BYTE *)v10 & 1) != 0)
      {
        v14 = *(NSObject **)(v10 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v16 = 134217984;
          v17 = v7;
          _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Setting phase of transitioning GES touch %p to Began for gesture collection", (uint8_t *)&v16, 0xCu);
        }
      }
      objc_msgSend(v7, "setPhase:", 0);
      -[UITouchesEvent _addGestureRecognizersFromContainer:toTouch:forContinuation:](self, "_addGestureRecognizersFromContainer:toTouch:forContinuation:", v6, v7, 0);
      v11 = qword_1EDDC87B8;
      if (!qword_1EDDC87B8)
      {
        v11 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&qword_1EDDC87B8);
      }
      if ((*(_BYTE *)v11 & 1) != 0)
      {
        v15 = *(NSObject **)(v11 + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = 134217984;
          v17 = v7;
          _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Resetting phase of transitioning GES touch %p after gesture collection", (uint8_t *)&v16, 0xCu);
        }
      }
      objc_msgSend(v7, "setPhase:", v8);
    }
    else
    {
      v12 = _MergedGlobals_36;
      if (!_MergedGlobals_36)
      {
        v12 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&_MergedGlobals_36);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v16 = 138543362;
        v17 = v7;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "ERROR: Early returning from gesture collection of GES transitioning touch due to unexpected nil responder: %{public}@", (uint8_t *)&v16, 0xCu);
      }
    }
  }

}

- (BOOL)_anyInterestedGestureRecognizersForTouchInView:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__UITouchesEvent__anyInterestedGestureRecognizersForTouchInView___block_invoke;
  v7[3] = &unk_1E16DF120;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[UITouchesEvent _collectGestureRecognizersFromContainer:withBlock:](self, "_collectGestureRecognizersFromContainer:withBlock:", v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __65__UITouchesEvent__anyInterestedGestureRecognizersForTouchInView___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const __CFDictionary *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "isEnabled") && objc_msgSend(v9, "state") <= 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    v6 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 32) + 152);
    objc_msgSend(*(id *)(a1 + 40), "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryGetValue(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRemoveValue(v6, v7);

  }
}

- (void)_addGestureRecognizersFromContainer:(id)a3 toTouch:(id)a4
{
  -[UITouchesEvent _addGestureRecognizersFromContainer:toTouch:forContinuation:](self, "_addGestureRecognizersFromContainer:toTouch:forContinuation:", a3, a4, 0);
}

- (void)_addGestureRecognizersForTouchContinuationFromContainer:(id)a3 toTouch:(id)a4
{
  -[UITouchesEvent _addGestureRecognizersFromContainer:toTouch:forContinuation:](self, "_addGestureRecognizersFromContainer:toTouch:forContinuation:", a3, a4, 1);
}

- (void)_addGestureRecognizersFromContainer:(id)a3 toTouch:(id)a4 forContinuation:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  UITouchesEvent *v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__UITouchesEvent__addGestureRecognizersFromContainer_toTouch_forContinuation___block_invoke;
  v12[3] = &unk_1E16DF148;
  v16 = a5;
  v13 = v9;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v9;
  -[UITouchesEvent _collectGestureRecognizersFromContainer:withBlock:](self, "_collectGestureRecognizersFromContainer:withBlock:", v10, v12);

}

void __78__UITouchesEvent__addGestureRecognizersFromContainer_toTouch_forContinuation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  void *v11;
  const __CFDictionary *v12;
  void *v13;
  void *v14;
  id *v15;
  id WeakRetained;
  id *v17;

  v17 = a2;
  v5 = a3;
  v6 = objc_msgSend(v17, "isEnabled");
  if (v6)
  {
    if (objc_msgSend(v17, "state") > 2)
    {
      v6 = 0;
    }
    else if (*(_BYTE *)(a1 + 56))
    {
      v6 = objc_msgSend((id)objc_opt_class(), "_supportsTouchContinuation");
    }
    else
    {
      v6 = 1;
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v8 = *(unsigned __int16 *)(v7 + 236);
    LODWORD(v7) = (v8 >> 13) & 1;
    v9 = (v8 >> 14) & 1;
    if (!v6)
      goto LABEL_17;
  }
  else
  {
    v9 = 0;
    if (!v6)
      goto LABEL_17;
  }
  if ((v7 | v9) != 1)
    goto LABEL_18;
  if (!(_DWORD)v7)
  {
    if (!v9)
      goto LABEL_17;
    goto LABEL_16;
  }
  v10 = objc_msgSend(v17, "_isAllowedToReceiveGESEvents");
  if ((v10 & 1) == 0 && ((v9 ^ 1) & 1) == 0)
  {
LABEL_16:
    if ((objc_msgSend(v17, "_isAllowedToReceiveGESEvents") & 1) == 0)
      goto LABEL_18;
LABEL_17:
    v11 = *(void **)(a1 + 48);
    v12 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 40) + 152);
    objc_msgSend(v11, "_eventReceivingWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryGetValue(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRemoveValue(v12, v13);
LABEL_25:

    goto LABEL_26;
  }
  if (!v10)
    goto LABEL_17;
LABEL_18:
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    WeakRetained = v5;
    goto LABEL_22;
  }
  v15 = v17;
  if (v17)
  {
    WeakRetained = objc_loadWeakRetained(v17 + 6);
LABEL_22:
    v13 = WeakRetained;
    v15 = v17;
    goto LABEL_23;
  }
  v13 = 0;
LABEL_23:
  if (objc_msgSend(v15, "_shouldReceiveTouch:forEvent:recognizerView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v13))
  {
    -[UITouch _addGestureRecognizer:](*(_QWORD *)(a1 + 32), v17);
    objc_msgSend(*(id *)(a1 + 40), "_touchesForKey:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", *(_QWORD *)(a1 + 32));
    goto LABEL_25;
  }
LABEL_26:

}

- (void)_cancelResponderDeliveryAndClearTouchesOfWindow:(void *)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "_touchesForWindow:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(a1, "_cancelComponents:", v5);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          -[UITouch _clearForWindowIfNeeded:](v11, a2);
          objc_msgSend(a1, "_removeTouch:", v11, (_QWORD)v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    objc_msgSend(a1, "_removeTouchesForWindow:", a2);
  }
}

- (id)_touchesForResponder:(id)a3 withPhase:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  _WORD *v13;
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
  -[UITouchesEvent touchesForResponder:](self, "touchesForResponder:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_WORD **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v13, "phase") == a4 && (objc_msgSend(v13, "isDelayed") & 1) == 0)
        {
          if (a4 >= 3)
          {
            if (v13 && (v13[118] & 8) != 0)
              continue;
          }
          else if (a4 == 1 && !-[UITouch _shouldDeliverTouchForTouchesMoved]((uint64_t)v13))
          {
            continue;
          }
          if (!v10)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v10, "addObject:", v13);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v9)
        goto LABEL_21;
    }
  }
  v10 = 0;
LABEL_21:

  return v10;
}

- (void)_gestureRecognizerNoLongerNeedsSendEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UITouchesEvent touchesForGestureRecognizer:](self, "touchesForGestureRecognizer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v12, "phase", (_QWORD)v13))
        {
          -[UITouchesEvent _removeTouch:fromGestureRecognizer:](self, "_removeTouch:fromGestureRecognizer:", v12, v4);
          -[UITouch _removeGestureRecognizer:]((uint64_t)v12, v4);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)_sendSynthesizedBeganToGesture:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  BOOL v35;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  __int128 v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD aBlock[6];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  id v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  uint64_t v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_UIApplicationSupportsGlobalEdgeSwipeTouches()
    || (objc_msgSend(v4, "_isAllowedToReceiveGESEvents") & 1) != 0
    || objc_msgSend(v4, "state") > 2)
  {
    goto LABEL_45;
  }
  v5 = (void *)qword_1EDDC8808;
  if (!qword_1EDDC8808)
  {
    v6 = objc_opt_new();
    v7 = (void *)qword_1EDDC8808;
    qword_1EDDC8808 = v6;

    v5 = (void *)qword_1EDDC8808;
  }
  objc_msgSend(v5, "removeAllObjects");
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[UITouchesEvent touchesForGestureRecognizer:](self, "touchesForGestureRecognizer:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v57 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        if (v13
          && (*(_WORD *)(v13 + 236) & 0x4000) != 0
          && objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "phase") <= 2)
        {
          objc_msgSend((id)qword_1EDDC8808, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    }
    while (v10);
  }

  if (objc_msgSend((id)qword_1EDDC8808, "count"))
  {
    v14 = qword_1EDDC8810;
    if (!qword_1EDDC8810)
    {
      v14 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&qword_1EDDC8810);
    }
    if ((*(_BYTE *)v14 & 1) != 0)
    {
      v37 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = (void *)qword_1EDDC8808;
        v39 = v37;
        v40 = objc_msgSend(v38, "count");
        *(_DWORD *)buf = 67109120;
        LODWORD(v62) = v40;
        _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_ERROR, "\t\tTransitioning GES touch needing synthesized began count: %d", buf, 8u);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)qword_1EDDC8808, "count"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)qword_1EDDC8818;
    qword_1EDDC8818 = v15;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = (id)qword_1EDDC8808;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
    if (v17)
    {
      v19 = v17;
      v20 = *(_QWORD *)v53;
      *(_QWORD *)&v18 = 134217984;
      v45 = v18;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v53 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v21);
          v23 = objc_msgSend(v22, "phase", v45);
          v24 = (void *)qword_1EDDC8818;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __49__UITouchesEvent__sendSynthesizedBeganToGesture___block_invoke;
          aBlock[3] = &unk_1E16B1888;
          aBlock[4] = v22;
          aBlock[5] = v23;
          v25 = _Block_copy(aBlock);
          objc_msgSend(v24, "addObject:", v25);

          v26 = qword_1EDDC8820;
          if (!qword_1EDDC8820)
          {
            v26 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v26, (unint64_t *)&qword_1EDDC8820);
          }
          if ((*(_BYTE *)v26 & 1) != 0)
          {
            v27 = *(NSObject **)(v26 + 8);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v45;
              v62 = v22;
              _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "Setting phase of transitioning GES touch %p for synthesized began gesture dispatch", buf, 0xCu);
            }
          }
          objc_msgSend(v22, "setPhase:", 0);
          ++v21;
        }
        while (v19 != v21);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
        v19 = v28;
      }
      while (v28);
    }

    v29 = qword_1EDDC8828;
    if (!qword_1EDDC8828)
    {
      v29 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v29, (unint64_t *)&qword_1EDDC8828);
    }
    if ((*(_BYTE *)v29 & 1) != 0)
    {
      v41 = *(NSObject **)(v29 + 8);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = v41;
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v62 = v4;
        v63 = 2112;
        v64 = v44;
        v65 = 2112;
        v66 = qword_1EDDC8808;
        _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_ERROR, "\t\tCalling synthesized touchesBegan:withEvent: on gesture: %p (%@) with transitioning GES touches: %@", buf, 0x20u);

      }
    }
    objc_msgSend(v4, "_componentsBegan:withEvent:", qword_1EDDC8808, self);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v30 = (id)qword_1EDDC8818;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v48 != v33)
            objc_enumerationMutation(v30);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j) + 16))();
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      }
      while (v32);
    }

    objc_msgSend((id)qword_1EDDC8818, "removeAllObjects");
    v35 = 1;
  }
  else
  {
LABEL_45:
    v35 = 0;
  }

  return v35;
}

uint64_t __49__UITouchesEvent__sendSynthesizedBeganToGesture___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_9;
  if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_9)
  {
    v2 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_9);
  }
  if ((*(_BYTE *)v2 & 1) != 0)
  {
    v4 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 134217984;
      v7 = v5;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Resetting phase of transitioning GES touch %p after synthesized began gesture dispatch", (uint8_t *)&v6, 0xCu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "setPhase:", *(_QWORD *)(a1 + 40));
}

- (id)_allWindows
{
  void *v3;
  void *v4;
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
  -[UITouchesEvent allTouches](self, "allTouches", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "window");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_componentsForGestureRecognizer:(id)a3
{
  void *v3;
  void *v4;

  -[UITouchesEvent _touchesForGestureRecognizer:](self, "_touchesForGestureRecognizer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
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
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITouchesEvent.m"), 838, CFSTR("Wrong component type for event: %@; component: %@"),
            self,
            v13);

        }
        -[UITouch _removeGestureRecognizer:]((uint64_t)v13, v7);
        -[UITouchesEvent _removeTouch:fromGestureRecognizer:](self, "_removeTouch:fromGestureRecognizer:", v13, v7);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

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
  -[UITouchesEvent touchesForWindow:](self, "touchesForWindow:", v4, 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "_responder");
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

- (id)_firstTouchForView:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UITouchesEvent touchesForView:](self, "touchesForView:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "_isFirstTouchForView") & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_moveTouchesFromView:(id)a3 toView:(id)a4
{
  id v6;
  void *v7;
  id key;

  key = a3;
  v6 = a4;
  CFDictionaryGetValue(self->_keyedTouches, key);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CFDictionarySetValue(self->_keyedTouches, v6, v7);
    CFDictionaryRemoveValue(self->_keyedTouches, key);
    objc_msgSend(v7, "makeObjectsPerformSelector:withObject:", sel_setView_, v6);
  }

}

- (double)_initialTouchTimestamp
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
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
  -[UITouchesEvent allTouches](self, "allTouches", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
      objc_msgSend(v7, "initialTouchTimestamp");
      v9 = v8;
      if (objc_msgSend(v7, "type") != 2)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (double)_initialTouchTimestampForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)UIApp, "_mainEventEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEventEnvironment _touchMapForWindow:]((uint64_t)v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "objectEnumerator", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v8)
  {

LABEL_12:
    -[UITouchesEvent _initialTouchTimestamp](self, "_initialTouchTimestamp");
    v14 = v15;
    goto LABEL_13;
  }
  v9 = v8;
  v10 = *(_QWORD *)v18;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v10)
      objc_enumerationMutation(v7);
    v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
    objc_msgSend(v12, "initialTouchTimestamp");
    v14 = v13;
    if (objc_msgSend(v12, "type") != 2)
      break;
    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        goto LABEL_3;
      break;
    }
  }

  if (v14 == 0.0)
    goto LABEL_12;
LABEL_13:

  return v14;
}

- (void)_addCoalescedTouch:(id)a3 forIndex:(int64_t)a4 hidEvent:(__IOHIDEvent *)a5
{
  __CFDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = -[UITouchesEvent _coalescedTouchesForHidEvent:](self, "_coalescedTouchesForHidEvent:", a5);
  CFDictionaryGetValue(v8, (const void *)a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(v8, (const void *)a4, v9);
  }
  objc_msgSend(v9, "addObject:", v10);

}

- (void)_moveCoalescedTouchesFromHidEvent:(__IOHIDEvent *)a3 toHidEvent:(__IOHIDEvent *)a4
{
  CFDictionarySetValue(self->_coalescedTouches, a4, -[UITouchesEvent _coalescedTouchesForHidEvent:](self, "_coalescedTouchesForHidEvent:"));
  CFDictionaryRemoveValue(self->_coalescedTouches, a3);
}

- (id)_lastPendingCoalescedTouchForIndex:(int64_t)a3 hidEvent:(__IOHIDEvent *)a4
{
  void *v4;
  void *v5;

  CFDictionaryGetValue(-[UITouchesEvent _coalescedTouchesForHidEvent:](self, "_coalescedTouchesForHidEvent:", a4), (const void *)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)predictedTouchesForTouch:(id)a3
{
  _QWORD *v4;
  void *v5;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_allTouchesMutable, "containsObject:", v4))
  {
    -[UITouch _predictedTouchesWithEvent:](v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)_inputPrecision
{
  void *v3;
  void *v4;
  unint64_t v5;
  __IOHIDEvent *v7;
  __IOHIDEvent *v8;
  uint64_t v9;

  -[UITouchesEvent allTouches](self, "allTouches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

LABEL_3:
    -[UITouchesEvent allTouches](self, "allTouches");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[UIEvent _inputPrecisionForTouches:](UIEvent, "_inputPrecisionForTouches:", v4);

    return v5;
  }
  v7 = -[UIEvent _hidEvent](self, "_hidEvent");

  if (!v7)
    goto LABEL_3;
  v8 = -[UIEvent _hidEvent](self, "_hidEvent");
  v9 = _UIEventHIDGetDescendantPointerEvent((uint64_t)v8);
  if ((unint64_t)_UIEventHIDGetChildStylusEvent((uint64_t)v8) | v9)
    return 2;
  else
    return 1;
}

- (unint64_t)_currentPointerEventSource
{
  return self->_currentPointerEventSource;
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
        if (objc_msgSend(v10, "_eventComponentType"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITouchesEvent.m"), 1101, CFSTR("Unexpected event component type: %ld"), objc_msgSend(v10, "_eventComponentType"));

        }
        -[UITouchesEvent _removeTouch:](self, "_removeTouch:", v10);
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
  void **v32;
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
  v51[2] = __36__UITouchesEvent__cancelComponents___block_invoke;
  v51[3] = &unk_1E16DF170;
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
        aBlock[2] = __36__UITouchesEvent__cancelComponents___block_invoke_2;
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
              -[UIGestureRecognizer _touchWasCancelled:](*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * m), v26);
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
          }
          while (v29);
        }

        objc_msgSend((id)UIApp, "_gestureDelayedEventComponentDispatcher");
        v32 = (void **)objc_claimAutoreleasedReturnValue();
        -[UIGestureDelayedEventComponentDispatcher removeTouch:](v32, v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    }
    while (v23);
  }

}

BOOL __36__UITouchesEvent__cancelComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v7;

  v3 = a2;
  if (objc_msgSend(v3, "_eventComponentType"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("UITouchesEvent.m"), 1109, CFSTR("Unexpected event component type: %ld"), objc_msgSend(v3, "_eventComponentType"));

  }
  objc_msgSend((id)UIApp, "_gestureDelayedEventComponentDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = !-[UIGestureDelayedEventComponentDispatcher touchesBeganWasDelayedForTouch:]((uint64_t)v4, v3)
    && objc_msgSend(v3, "phase") != 0;

  return v5;
}

uint64_t __36__UITouchesEvent__cancelComponents___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPhase:", *(_QWORD *)(a1 + 40));
}

- (int64_t)singleAllowableExternalTouchPathIndex
{
  return self->_singleAllowableExternalTouchPathIndex;
}

- (void)setSingleAllowableExternalTouchPathIndex:(int64_t)a3
{
  self->_singleAllowableExternalTouchPathIndex = a3;
}

@end

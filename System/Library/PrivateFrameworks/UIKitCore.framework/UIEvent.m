@implementation UIEvent

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (int64_t)_buttonMask
{
  return self->_buttonMask;
}

- (int64_t)_modifierFlags
{
  unsigned int LiveModifierState;
  unint64_t v4;

  if (self->_hasValidModifiers)
    return self->_mzModifierFlags;
  objc_msgSend((id)UIApp, "_hardwareKeyboard:", 0);
  LiveModifierState = GSKeyboardGetLiveModifierState();
  if ((LiveModifierState & 0x480000) != 0)
    v4 = ((unint64_t)((LiveModifierState & 0x1010000) != 0) << 20) | 0x80000;
  else
    v4 = (unint64_t)((LiveModifierState & 0x1010000) != 0) << 20;
  if ((LiveModifierState & 0x900000) != 0)
    v4 |= 0x40000uLL;
  if ((LiveModifierState & 0x220000) != 0)
    v4 |= 0x20000uLL;
  return v4 | (LiveModifierState >> 3) & 0x800000 | (LiveModifierState >> 2) & 0x10000;
}

- (UIEventSubtype)subtype
{
  return 0;
}

- (__IOHIDEvent)_hidEvent
{
  return self->_hidEvent;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  UIScreen *cachedScreen;
  __IOHIDEvent *hidEvent;
  _BOOL4 hasValidModifiers;
  unint64_t TimeStamp;
  uint64_t v9;
  void *v10;
  void *v11;

  if (self->_hidEvent == a3)
    return;
  cachedScreen = self->_cachedScreen;
  self->_cachedScreen = 0;

  hidEvent = self->_hidEvent;
  if (hidEvent)
    CFRelease(hidEvent);
  hasValidModifiers = self->_hasValidModifiers;
  self->_hasValidModifiers = 0;
  self->_isInteractionBehaviorInactive = 0;
  if (!a3)
  {
    self->_hidEvent = 0;
    goto LABEL_14;
  }
  -[UIEvent _setGSEvent:](self, "_setGSEvent:", 0);
  self->_hidEvent = (__IOHIDEvent *)CFRetain(a3);
  TimeStamp = IOHIDEventGetTimeStamp();
  -[UIEvent _setTimestamp:](self, "_setTimestamp:", _UIMediaTimeForMachTime(TimeStamp));
  v9 = _UIEventHIDGetDescendantPointerEvent((uint64_t)a3);
  if (v9)
  {
    self->_mzClickCount = 0;
    self->_buttonMask = _UIEventHIDButtonMaskFromPointerEventAndChildren(v9);
    BKSHIDEventGetPointerAttributes();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v10 = (void *)objc_msgSend(v10, "fingerDownCount");
    self->_trackpadFingerDownCount = (int64_t)v10;
    self->_lastPointerSenderID = IOHIDEventGetSenderID();
    if (!v11)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (IOHIDEventGetType() == 11)
  {
    BKSHIDEventGetDigitizerAttributes();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
LABEL_13:
      self->_hasValidModifiers = 1;
      self->_mzModifierFlags = _UIEventGetHIDModifierFlags((uint64_t)a3, v11);
      self->_isInteractionBehaviorInactive = objc_msgSend(v11, "sceneTouchBehavior") == 1;

    }
  }
LABEL_14:
  if (hasValidModifiers && !self->_hasValidModifiers)
  {
    self->_trackpadFingerDownCount = 0;
    self->_mzClickCount = 0;
    self->_buttonMask = 0;
    self->_mzModifierFlags = 0;
  }
}

- (void)_setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)_setGSEvent:(__GSEvent *)a3
{
  __GSEvent *gsEvent;

  gsEvent = self->_gsEvent;
  if (gsEvent)
    CFRelease(gsEvent);
  if (a3)
  {
    -[UIEvent _setHIDEvent:](self, "_setHIDEvent:", 0);
    self->_gsEvent = (__GSEvent *)CFRetain(a3);
    GSEventGetTimestamp();
    -[UIEvent _setTimestamp:](self, "_setTimestamp:");
  }
  else
  {
    self->_gsEvent = 0;
  }
}

- (void)_cleanupAfterDispatch
{
  -[UIEvent _setHIDEvent:](self, "_setHIDEvent:", 0);
}

- (BOOL)_isTouchRoutingPolicyBased
{
  return 0;
}

- (BOOL)_isPhysicalKeyEvent
{
  return 0;
}

+ (unint64_t)_inputPrecisionForTouches:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    v8 = 1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((v8 & 1) != 0)
        {
          if (v10)
            v6 = *(_QWORD *)(v10 + 48);
          else
            v6 = 0;
        }
        else
        {
          if (!v6)
            goto LABEL_19;
          if (v10)
            v10 = *(_QWORD *)(v10 + 48);
          if (v6 != v10)
            goto LABEL_18;
        }
        v8 = 0;
        ++v9;
      }
      while (v5 != v9);
      v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v5 = v11;
      v8 = 0;
    }
    while (v11);
  }
  else
  {
LABEL_18:
    v6 = 0;
  }
LABEL_19:

  return v6;
}

- (id)_initWithEnvironment:(id)a3
{
  id v4;
  id *v5;
  id *v6;

  v4 = a3;
  v5 = -[UIEvent _init](self, "_init");
  v6 = v5;
  if (v5)
    objc_storeWeak(v5 + 12, v4);

  return v6;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIEvent;
  return -[UIEvent init](&v3, sel_init);
}

- (BOOL)_consumeBeforeDeliveryToGestureRecognizers:(id)a3 inWindow:(id)a4
{
  return 0;
}

- (__GSEvent)_gsEvent
{
  return self->_gsEvent;
}

- (void)dealloc
{
  __GSEvent *gsEvent;
  __IOHIDEvent *hidEvent;
  objc_super v5;

  gsEvent = self->_gsEvent;
  if (gsEvent)
    CFRelease(gsEvent);
  hidEvent = self->_hidEvent;
  if (hidEvent)
    CFRelease(hidEvent);
  v5.receiver = self;
  v5.super_class = (Class)UIEvent;
  -[UIEvent dealloc](&v5, sel_dealloc);
}

- (id)_cloneEvent
{
  id v3;
  const void *gsEvent;
  const void *hidEvent;

  v3 = objc_alloc_init((Class)objc_opt_class());
  gsEvent = self->_gsEvent;
  if (gsEvent)
    gsEvent = CFRetain(gsEvent);
  *((_QWORD *)v3 + 1) = gsEvent;
  hidEvent = self->_hidEvent;
  if (hidEvent)
    hidEvent = CFRetain(hidEvent);
  *((_QWORD *)v3 + 2) = hidEvent;
  -[UIEvent timestamp](self, "timestamp");
  objc_msgSend(v3, "_setTimestamp:");
  objc_storeStrong((id *)v3 + 7, self->_cachedScreen);
  *((_BYTE *)v3 + 24) = self->_hasValidModifiers;
  *((_QWORD *)v3 + 4) = self->_mzModifierFlags;
  *((_QWORD *)v3 + 5) = self->_mzClickCount;
  *((_QWORD *)v3 + 6) = self->_buttonMask;
  *((_QWORD *)v3 + 10) = self->_lastPointerSenderID;
  *((_QWORD *)v3 + 13) = self->_trackpadFingerDownCount;
  return v3;
}

- (void)_addEventObserver:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventEnvironment);
  objc_storeStrong((id *)&self->_eventObservers, 0);
  objc_storeStrong((id *)&self->_cachedScreen, 0);
}

- (UIEventType)type
{
  return -1;
}

- (NSSet)allTouches
{
  return 0;
}

- (NSSet)touchesForWindow:(UIWindow *)window
{
  return 0;
}

- (NSSet)touchesForView:(UIView *)view
{
  return 0;
}

- (NSSet)touchesForGestureRecognizer:(UIGestureRecognizer *)gesture
{
  return 0;
}

- (NSArray)coalescedTouchesForTouch:(UITouch *)touch
{
  return 0;
}

- (NSArray)predictedTouchesForTouch:(UITouch *)touch
{
  return 0;
}

- (id)_initWithEvent:(__GSEvent *)a3 touches:(id)a4
{

  return 0;
}

- (id)_touchesForGestureRecognizer:(id)a3
{
  return 0;
}

- (int)_shakeState
{
  return -1;
}

- (int64_t)_moveDirection
{
  return 0;
}

- (unint64_t)_focusHeading
{
  return 0;
}

- (id)_triggeringPhysicalButton
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: Using deprecated _triggeringPhysicalButton: instead of inspecting presses and their phases directly. This will become an assert in future builds.", buf, 2u);
    }

  }
  else
  {
    v2 = _triggeringPhysicalButton___s_category;
    if (!_triggeringPhysicalButton___s_category)
    {
      v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&_triggeringPhysicalButton___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Using deprecated _triggeringPhysicalButton: instead of inspecting presses and their phases directly. This will become an assert in future builds.", v6, 2u);
    }
  }
  return 0;
}

- (id)_modifiedInput
{
  return 0;
}

- (id)_unmodifiedInput
{
  return 0;
}

- (unint64_t)_clickCount
{
  return self->_mzClickCount;
}

- (unint64_t)_currentPointerEventSource
{
  return 0;
}

- (BOOL)_isKeyDown
{
  return 0;
}

- (CGPoint)_digitizerLocation
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)_isInteractionBehaviorInactive
{
  return self->_isInteractionBehaviorInactive;
}

- (id)_screen
{
  UIScreen **p_cachedScreen;
  UIScreen *v4;

  p_cachedScreen = &self->_cachedScreen;
  v4 = self->_cachedScreen;
  if (!v4)
  {
    _UIEventHIDUIScreenForHIDEvent((uint64_t)-[UIEvent _hidEvent](self, "_hidEvent"));
    v4 = (UIScreen *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v4 = (UIScreen *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)p_cachedScreen, v4);
  }
  return v4;
}

- (NSSet)_allWindows
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)UIApp;
  -[UIEvent _screen](self, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_keyWindowForScreen:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSSet *)v5;
}

- (BOOL)_shouldSkipEventDeliveryWithIgnoreInteractionEvents:(BOOL)a3
{
  return a3;
}

- (double)_wheelVelocity
{
  return 0.0;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  return 0;
}

- (id)_allGestureRecognizers
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "_allWindows", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(a1, "_gestureRecognizersForWindow:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v2)
          objc_msgSend(v2, "unionSet:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)_componentsForGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  return 0;
}

- (void)_removeGestureRecognizersSendingCancelledEvent:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  UIEvent *v33;
  uint64_t v34;
  void *v35;
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
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = a3;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v45;
    v33 = self;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(obj);
        v34 = v4;
        v35 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v4);
        -[UIEvent _componentsForGestureRecognizer:](self, "_componentsForGestureRecognizer:");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
        if (v6)
        {
          v7 = v6;
          v8 = 0;
          v9 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v49 != v9)
                objc_enumerationMutation(v5);
              v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v11, "_eventComponentPhase");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "value");

              if (v13 <= 2)
              {
                if (!v8)
                  v8 = (void *)objc_opt_new();
                objc_msgSend(v8, "addObject:", v11);
              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
          }
          while (v7);
        }
        else
        {
          v8 = 0;
        }
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v15 = v8;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v41 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                objc_msgSend(v20, "_eventComponentPhase");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setObject:forKey:", v21, v20);

                objc_msgSend(v20, "_eventComponentPhaseForValue:", 4);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "_setEventComponentPhase:", v22);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
            }
            while (v17);
          }

          objc_msgSend(v35, "_componentsCancelled:withEvent:", v15, v33);
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v23 = v15;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v37;
            do
            {
              for (k = 0; k != v25; ++k)
              {
                if (*(_QWORD *)v37 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * k);
                objc_msgSend(v14, "objectForKey:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "_setEventComponentPhase:", v29);

              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
            }
            while (v25);
          }

          self = v33;
        }
        -[UIEvent _removeGestureRecognizer:fromComponents:](self, "_removeGestureRecognizer:fromComponents:", v35, v5);

        v4 = v34 + 1;
      }
      while (v34 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v32);
  }

}

- (void)_removeGestureRecognizer:(void *)a1
{
  id v3;
  id v4;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "_componentsForGestureRecognizer:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_removeGestureRecognizer:fromComponents:", v3, v4);

  }
}

- (unint64_t)_inputPrecision
{
  return 0;
}

- (BKSHIDEventAuthenticationMessage)_authenticationMessage
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[UIEvent _hidEvent](self, "_hidEvent"))
    return (BKSHIDEventAuthenticationMessage *)0;
  if (IOHIDEventGetType() == 11 && !IOHIDEventGetEvent())
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[UIEvent allTouches](self, "allTouches", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
LABEL_6:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        if (v8)
        {
          v9 = *(id *)(v8 + 384);
          if (v9)
            goto LABEL_18;
        }
        if (v5 == ++v7)
        {
          v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          v5 = v10;
          if (v10)
            goto LABEL_6;
          break;
        }
      }
    }

    return (BKSHIDEventAuthenticationMessage *)0;
  }
  BKSHIDEventGetBaseAttributes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authenticationMessage");
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v12 = v9;

  return (BKSHIDEventAuthenticationMessage *)v12;
}

- (int64_t)_trackpadFingerDownCount
{
  return self->_trackpadFingerDownCount;
}

- (double)_initialTouchTimestamp
{
  return self->__initialTouchTimestamp;
}

@end

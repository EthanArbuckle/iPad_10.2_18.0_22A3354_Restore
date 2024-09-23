@implementation SBSystemGestureManager

- (BOOL)isSystemGestureRecognizer:(id)a3
{
  NSMutableDictionary *typeToGesture;
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  typeToGesture = self->_typeToGesture;
  v4 = a3;
  -[NSMutableDictionary allValues](typeToGesture, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)_systemGestureChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_touchGestures, "containsObject:", v4))
  {
    v5 = objc_msgSend(v4, "state");
    objc_getAssociatedObject(v4, "_SBSystemGestureType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0DABF50];
    v21[0] = *MEMORY[0x1E0DABF58];
    v21[1] = v7;
    v22[0] = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DA9D78];
    v11 = v9;
    objc_msgSend(v10, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "emitEvent:withPayload:", 12, v11);

    if ((unint64_t)(v5 - 3) >= 3)
    {
      if (v5 != 1)
      {
LABEL_14:

        goto LABEL_15;
      }
      SBLogSystemGestureDetail();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[SBSystemGestureManager _systemGestureChanged:].cold.1();

      SBSystemGestureTypeDebugName(objc_msgSend(v6, "unsignedIntegerValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E8EC7EC0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "stringByAppendingString:", CFSTR("-Dragging"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "beginActivityWithOptions:reason:", 0x200000000000, v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMapTable setObject:forKey:](self->_recognizingTouchGestures, "setObject:forKey:", v20, v4);
    }
    else
    {
      SBLogSystemGestureDetail();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[SBSystemGestureManager _systemGestureChanged:].cold.1();

      -[NSMapTable objectForKey:](self->_recognizingTouchGestures, "objectForKey:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 && v5 == 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "endActivity:", v14);

      }
      -[NSMapTable removeObjectForKey:](self->_recognizingTouchGestures, "removeObjectForKey:", v4);
    }

    goto LABEL_14;
  }
LABEL_15:

}

+ (id)mainDisplayManager
{
  return +[SBMainDisplaySystemGestureManager sharedInstance](SBMainDisplaySystemGestureManager, "sharedInstance");
}

- (SBSystemGestureManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemGestureManager.m"), 122, CFSTR("use initWithDisplay:"));

  return 0;
}

- (id)_initWithDisplayIdentity:(id)a3
{
  id v6;
  SBSystemGestureManager *v7;
  SBSystemGestureManager *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *typeToGesture;
  NSMutableDictionary *v11;
  NSMutableDictionary *typeToState;
  uint64_t v13;
  NSMapTable *recognizingTouchGestures;
  NSMutableSet *v15;
  NSMutableSet *touchGestures;
  void *v17;
  uint64_t v18;
  BSInvalidatable *systemGesturesAllowedToken;
  void *v20;
  uint64_t v21;
  SBIndirectTouchLifecycleMonitor *v22;
  SBIndirectTouchLifecycleMonitor *indirectTouchLifecycleMonitor;
  void *v25;
  objc_super v26;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemGestureManager.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

  }
  v26.receiver = self;
  v26.super_class = (Class)SBSystemGestureManager;
  v7 = -[SBSystemGestureManager init](&v26, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_displayIdentity, a3);
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    typeToGesture = v8->_typeToGesture;
    v8->_typeToGesture = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    typeToState = v8->_typeToState;
    v8->_typeToState = v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    recognizingTouchGestures = v8->_recognizingTouchGestures;
    v8->_recognizingTouchGestures = (NSMapTable *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    touchGestures = v8->_touchGestures;
    v8->_touchGestures = v15;

    if ((objc_msgSend(MEMORY[0x1E0DA9F10], "isRunningXCTest") & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEAF10], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeWeak((id *)&v8->_systemGestureManager, v17);
    objc_msgSend(v17, "allowGestureRecognizersOnDisplayWithIdentity:", v6);
    v18 = objc_claimAutoreleasedReturnValue();
    systemGesturesAllowedToken = v8->_systemGesturesAllowedToken;
    v8->_systemGesturesAllowedToken = (BSInvalidatable *)v18;

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceIdiom");

    if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v22 = -[SBIndirectTouchLifecycleMonitor initWithSystemGestureManager:]([SBIndirectTouchLifecycleMonitor alloc], "initWithSystemGestureManager:", v8);
      indirectTouchLifecycleMonitor = v8->_indirectTouchLifecycleMonitor;
      v8->_indirectTouchLifecycleMonitor = v22;

    }
    -[SBSystemGestureManager _evaluateEnablement](v8, "_evaluateEnablement");

  }
  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return self->_stylusPriorityRecognizer == a3
      && -[NSSet containsObject:](self->_gesturesPreventedByStylus, "containsObject:", a4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_stylusPriorityRecognizer == a3)
    return !-[NSSet containsObject:](self->_gesturesPreventedByStylus, "containsObject:", a4);
  else
    return 0;
}

- (void)setGesturesPreventedByStylus:(id)a3
{
  NSSet *v5;
  NSUInteger v6;
  UIGestureRecognizer *stylusPriorityRecognizer;
  SBStylusPriorityGestureRecognizer *v8;
  UIGestureRecognizer *v9;
  void *v10;
  UIGestureRecognizer *v11;
  NSSet *v12;

  v5 = (NSSet *)a3;
  if (self->_gesturesPreventedByStylus != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_gesturesPreventedByStylus, a3);
    v6 = -[NSSet count](self->_gesturesPreventedByStylus, "count");
    stylusPriorityRecognizer = self->_stylusPriorityRecognizer;
    if (v6)
    {
      v5 = v12;
      if (!stylusPriorityRecognizer)
      {
        v8 = objc_alloc_init(SBStylusPriorityGestureRecognizer);
        v9 = self->_stylusPriorityRecognizer;
        self->_stylusPriorityRecognizer = &v8->super;

        -[UIGestureRecognizer setDelegate:](self->_stylusPriorityRecognizer, "setDelegate:", self);
        -[UIGestureRecognizer setDelaysTouchesBegan:](self->_stylusPriorityRecognizer, "setDelaysTouchesBegan:", 0);
        -[UIGestureRecognizer setDelaysTouchesEnded:](self->_stylusPriorityRecognizer, "setDelaysTouchesEnded:", 0);
        -[UIGestureRecognizer setCancelsTouchesInView:](self->_stylusPriorityRecognizer, "setCancelsTouchesInView:", 0);
        -[UIGestureRecognizer _setRequiresSystemGesturesToFail:](self->_stylusPriorityRecognizer, "_setRequiresSystemGesturesToFail:", 0);
        -[UIGestureRecognizer setAllowedTouchTypes:](self->_stylusPriorityRecognizer, "setAllowedTouchTypes:", &unk_1E91CEC08);
        -[SBSystemGestureManager systemGestureManager](self, "systemGestureManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addGestureRecognizer:toDisplayWithIdentity:", self->_stylusPriorityRecognizer, self->_displayIdentity);
LABEL_7:

        v5 = v12;
      }
    }
    else
    {
      v5 = v12;
      if (stylusPriorityRecognizer)
      {
        -[SBSystemGestureManager systemGestureManager](self, "systemGestureManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeGestureRecognizer:fromDisplayWithIdentity:", self->_stylusPriorityRecognizer, self->_displayIdentity);
        v11 = self->_stylusPriorityRecognizer;
        self->_stylusPriorityRecognizer = 0;

        goto LABEL_7;
      }
    }
  }

}

- (void)addGestureRecognizer:(id)a3 withType:(unint64_t)a4
{
  NSMutableDictionary *typeToGesture;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id object;

  object = a3;
  typeToGesture = self->_typeToGesture;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](typeToGesture, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_typeToGesture;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v15, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemGestureManager.m"), 224, CFSTR("Trying to add a system gesture with type %@, but we already have one: %@"), v14, v17);

  }
  if (self->_isInvalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemGestureManager.m"), 225, CFSTR("Trying to add gesture recognizer type %@ to an invalidated SBSystemGestureManager"), v19);

  }
  if (object)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(object, "_SBSystemGestureType", v10, (void *)1);

    v11 = self->_typeToGesture;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", object, v12);

    if (-[SBSystemGestureManager _isTouchGestureWithType:](self, "_isTouchGestureWithType:", a4))
      -[NSMutableSet addObject:](self->_touchGestures, "addObject:", object);
    if (-[SBSystemGestureManager shouldEnableSystemGestureWithType:](self, "shouldEnableSystemGestureWithType:", a4))
      -[SBSystemGestureManager _enableSystemGesture:withType:](self, "_enableSystemGesture:withType:", object, a4);
  }
  -[SBSystemGestureManager _configureForNewSystemGestureWindowIfNecessary](self, "_configureForNewSystemGestureWindowIfNecessary");
  -[SBSystemGestureManager _updateIgnoreHIDEdgeFlagsAssertions](self, "_updateIgnoreHIDEdgeFlagsAssertions");

}

- (void)removeGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  objc_getAssociatedObject(v4, "_SBSystemGestureType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_setAssociatedObject(v4, "_SBSystemGestureType", 0, (void *)1);
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    if (-[SBSystemGestureManager _isTouchGestureWithType:](self, "_isTouchGestureWithType:", v6))
      -[NSMutableSet removeObject:](self->_touchGestures, "removeObject:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_typeToGesture, "removeObjectForKey:", v5);
    -[SBSystemGestureManager _disableSystemGesture:withType:](self, "_disableSystemGesture:withType:", v4, v6);
  }
  else
  {
    SBLogSystemGesture();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBSystemGestureManager removeGestureRecognizer:].cold.1((uint64_t)v4, v7);

  }
  -[SBSystemGestureManager _invalidateIgnoreHidEdgeFlagsAssertionForRemovedRecognizer:](self, "_invalidateIgnoreHidEdgeFlagsAssertionForRemovedRecognizer:", v4);

}

- (void)gestureRecognizerOfType:(unint64_t)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  NSMutableDictionary *typeToGesture;
  void *v6;
  id v7;
  void *v8;
  id v9;

  typeToGesture = self->_typeToGesture;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](typeToGesture, "objectForKey:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "requireGestureRecognizerToFail:", v7);
}

- (void)gestureRecognizerOfType:(unint64_t)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  NSMutableDictionary *typeToGesture;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  typeToGesture = self->_typeToGesture;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](typeToGesture, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v9, "requireGestureRecognizerToFail:", v8);

}

- (void)cancelGestureRecognizerOfType:(unint64_t)a3 reason:(id)a4
{
  id v6;
  NSMutableDictionary *typeToGesture;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  typeToGesture = self->_typeToGesture;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](typeToGesture, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "isEnabled"))
  {
    SBLogSystemGesture();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "sb_briefDescription");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "state");
      if (v12 >= 6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown: 0x%X>"), v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E8EB6F00[v12];
      }
      SBSystemGestureTypeDebugName(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v16 = v6;
      v17 = 2114;
      v18 = v11;
      v19 = 2114;
      v20 = v13;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "canceling (reason: %{public}@) <%{public}@ state:%{public}@ sgtype:'%{public}@' >", buf, 0x2Au);

    }
    objc_msgSend(v9, "setEnabled:", 0);
    objc_msgSend(v9, "setEnabled:", 1);
  }

}

- (NSString)debugDescription
{
  return (NSString *)-[SBSystemGestureManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isAnyTouchGestureRunning
{
  return -[NSMapTable count](self->_recognizingTouchGestures, "count") != 0;
}

- (unint64_t)typeOfSystemGesture:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_getAssociatedObject(a3, "_SBSystemGestureType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)windowForSystemGestures
{
  void *v3;
  void *v4;

  if (self->_displayIdentity)
  {
    -[SBSystemGestureManager systemGestureManager](self, "systemGestureManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "windowForSystemGesturesForDisplayWithIdentity:", self->_displayIdentity);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)shouldSystemGestureReceiveTouchWithLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;
  NSPoint v28;

  y = a3.y;
  x = a3.x;
  v27 = *MEMORY[0x1E0C80C00];
  -[SBSystemGestureManager windowForSystemGestures](self, "windowForSystemGestures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "windowSceneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowSceneForDisplayIdentity:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "pictureInPictureManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fixedCoordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coordinateSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertPoint:toCoordinateSpace:", v14, x, y);
  v16 = v15;
  v18 = v17;

  v19 = objc_msgSend(v11, "isPointWithinAnyPictureInPictureContent:", v16, v18) ^ 1;
  SBLogSystemGestureAppSwitcher();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v28.x = x;
    v28.y = y;
    NSStringFromPoint(v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138478083;
    v24 = v21;
    v25 = 1024;
    v26 = v19;
    _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Should system gesture receive touch with location:%{private}@ <%{BOOL}u>", (uint8_t *)&v23, 0x12u);

  }
  return v19;
}

- (BOOL)isValid
{
  return !self->_isInvalidated;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSystemGestureManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_displayIdentity, CFSTR("_display"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSystemGestureManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  -[SBSystemGestureManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_recognizingTouchGestures, CFSTR("_recognizingTouchGestures"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_typeToGesture, CFSTR("_typeToGesture"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_typeToState, CFSTR("_typeToState"));
  return v4;
}

- (void)invalidate
{
  NSMutableDictionary *typeToGesture;
  void *v4;
  BSInvalidatable *systemGestureSymbolicRule;
  BSInvalidatable *systemGestureEventDeferringRule;
  BSInvalidatable *pointerEventRoutingAssertion;
  BSInvalidatable *systemGesturesAllowedToken;
  UIPointerInteraction *systemPointerInteraction;
  BSInvalidatable *systemPointerContextIDAssertion;
  UIPencilInteraction *systemPencilInteraction;
  _QWORD v12[5];

  typeToGesture = self->_typeToGesture;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__SBSystemGestureManager_invalidate__block_invoke;
  v12[3] = &unk_1E8EB6E80;
  v12[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](typeToGesture, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (self->_displayIdentity && self->_stylusPriorityRecognizer)
  {
    -[SBSystemGestureManager systemGestureManager](self, "systemGestureManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:fromDisplayWithIdentity:", self->_stylusPriorityRecognizer, self->_displayIdentity);

  }
  -[BSInvalidatable invalidate](self->_systemGestureSymbolicRule, "invalidate");
  systemGestureSymbolicRule = self->_systemGestureSymbolicRule;
  self->_systemGestureSymbolicRule = 0;

  -[BSInvalidatable invalidate](self->_systemGestureEventDeferringRule, "invalidate");
  systemGestureEventDeferringRule = self->_systemGestureEventDeferringRule;
  self->_systemGestureEventDeferringRule = 0;

  -[BSInvalidatable invalidate](self->_pointerEventRoutingAssertion, "invalidate");
  pointerEventRoutingAssertion = self->_pointerEventRoutingAssertion;
  self->_pointerEventRoutingAssertion = 0;

  -[BSInvalidatable invalidate](self->_systemGesturesAllowedToken, "invalidate");
  systemGesturesAllowedToken = self->_systemGesturesAllowedToken;
  self->_systemGesturesAllowedToken = 0;

  -[UIPointerInteraction invalidate](self->_systemPointerInteraction, "invalidate");
  systemPointerInteraction = self->_systemPointerInteraction;
  self->_systemPointerInteraction = 0;

  -[BSInvalidatable invalidate](self->_systemPointerContextIDAssertion, "invalidate");
  systemPointerContextIDAssertion = self->_systemPointerContextIDAssertion;
  self->_systemPointerContextIDAssertion = 0;

  systemPencilInteraction = self->_systemPencilInteraction;
  self->_systemPencilInteraction = 0;

  self->_isInvalidated = 1;
}

void __36__SBSystemGestureManager_invalidate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "_disableSystemGesture:withType:", v5, objc_msgSend(a2, "unsignedIntegerValue"));

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_opt_class();
  objc_msgSend(v10, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionDelegate);
  objc_msgSend(WeakRetained, "pointerInteraction:window:regionForRequest:defaultRegion:", v10, v13, v9, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionDelegate);
  objc_msgSend(WeakRetained, "pointerInteraction:window:styleForRegion:", v7, v10, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_opt_class();
  objc_msgSend(v10, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionDelegate);
  objc_msgSend(WeakRetained, "pointerInteraction:window:willEnterRegion:animator:", v10, v14, v9, v8);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_opt_class();
  objc_msgSend(v10, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionDelegate);
  objc_msgSend(WeakRetained, "pointerInteraction:window:willExitRegion:animator:", v10, v14, v9, v8);

}

- (void)_pencilInteraction:(id)a3 didReceiveSqueeze:(id)a4
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v4 = a4;
  if (objc_msgSend(MEMORY[0x1E0CEA818], "_preferredSqueezeAction") == 6 && objc_msgSend(v4, "_phase") == 2)
  {
    SBLogSystemGesturePencilSqueeze();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBSystemGestureManager did receive pencil squeeze", v14, 2u);
    }

    objc_msgSend(v4, "_timestamp");
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0C99D68];
    v9 = CACurrentMediaTime();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:", v7 - (v9 - v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)SBApp, "pencilSqueezeActionControl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPencilSqueezeActionControl performSqueezeActionWithTimestamp:]((uint64_t)v13, v12);

  }
}

- (void)_evaluateEnablement
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  FBSDisplayIdentity *v11;
  NSObject *v12;
  FBSDisplayIdentity *displayIdentity;
  void *v14;
  NSMutableDictionary *typeToGesture;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  FBSDisplayIdentity *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_gesturesDisabledAssertions, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = self->_gesturesDisabledAssertions;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "exceptions");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v6)
            -[NSObject intersectSet:](v6, "intersectSet:", v9);
          else
            v6 = objc_msgSend(v9, "mutableCopy");

        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    objc_storeStrong((id *)&self->_gestureTypesAllowedWhileDisableAssertionsExist, v6);
    SBLogSystemGestureDetail();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      displayIdentity = self->_displayIdentity;
      -[NSSet bs_map:](self->_gestureTypesAllowedWhileDisableAssertionsExist, "bs_map:", &__block_literal_global_258);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = displayIdentity;
      v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "(Display - %{public}@) System gestures globally disabled (exceptions:%{public}@)", buf, 0x16u);

    }
  }
  else
  {
    SBLogSystemGestureDetail();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_displayIdentity;
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "(Display - %{public}@) System gestures globally enabled (may be individually disabled)", buf, 0xCu);
    }
  }

  typeToGesture = self->_typeToGesture;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__SBSystemGestureManager__evaluateEnablement__block_invoke_52;
  v16[3] = &unk_1E8EB6E80;
  v16[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](typeToGesture, "enumerateKeysAndObjectsUsingBlock:", v16);
}

__CFString *__45__SBSystemGestureManager__evaluateEnablement__block_invoke(uint64_t a1, void *a2)
{
  return SBSystemGestureTypeDebugName(objc_msgSend(a2, "integerValue"));
}

void __45__SBSystemGestureManager__evaluateEnablement__block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v9 = a3;
  v6 = a2;
  LODWORD(v5) = objc_msgSend(v5, "shouldEnableSystemGestureWithType:", objc_msgSend(v6, "unsignedIntegerValue"));
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v6, "unsignedIntegerValue");

  if ((_DWORD)v5)
    objc_msgSend(v7, "_enableSystemGesture:withType:", v9, v8);
  else
    objc_msgSend(v7, "_disableSystemGesture:withType:", v9, v8);

}

- (BOOL)_isGestureWithTypeAllowed:(unint64_t)a3
{
  NSObject *v5;
  FBSDisplayIdentity *displayIdentity;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSSet *gestureTypesAllowedWhileDisableAssertionsExist;
  void *v11;
  FBSDisplayIdentity *v13;
  NSMutableSet *gesturesDisabledAssertions;
  int v15;
  FBSDisplayIdentity *v16;
  __int16 v17;
  NSMutableSet *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[SBSystemGestureManager areSystemGesturesDisabledForAccessibility](self, "areSystemGesturesDisabledForAccessibility"))
  {
    SBLogSystemGestureDetail();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      displayIdentity = self->_displayIdentity;
      v15 = 138543362;
      v16 = displayIdentity;
      v7 = "(Display - %{public}@) Not allowing system gestures because accessibility has disabled them";
      v8 = v5;
      v9 = 12;
LABEL_9:
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v15, v9);
    }
  }
  else
  {
    if (!-[NSMutableSet count](self->_gesturesDisabledAssertions, "count"))
      return 1;
    gestureTypesAllowedWhileDisableAssertionsExist = self->_gestureTypesAllowedWhileDisableAssertionsExist;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(gestureTypesAllowedWhileDisableAssertionsExist) = -[NSSet containsObject:](gestureTypesAllowedWhileDisableAssertionsExist, "containsObject:", v11);

    if ((gestureTypesAllowedWhileDisableAssertionsExist & 1) != 0)
      return 1;
    SBLogSystemGestureDetail();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_displayIdentity;
      gesturesDisabledAssertions = self->_gesturesDisabledAssertions;
      v15 = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = gesturesDisabledAssertions;
      v7 = "(Display - %{public}@) Not allowing system gestures due to assertions:%{public}@";
      v8 = v5;
      v9 = 22;
      goto LABEL_9;
    }
  }

  return 0;
}

- (int64_t)_recognitionEventForTouchGestureType:(unint64_t)a3
{
  int64_t v3;
  void *v4;
  char v5;
  void *v6;

  v3 = 2;
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 6uLL:
      objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "homeButtonType") == 2)
        goto LABEL_5;
      if (__sb__runningInSpringBoard())
      {
        if (SBFEffectiveDeviceClass() == 2)
LABEL_5:
          v3 = 3;
        else
          v3 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "userInterfaceIdiom") == 1)
          v3 = 3;
        else
          v3 = 1;

      }
      break;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
    case 0xCuLL:
    case 0xEuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x2FuLL:
    case 0x32uLL:
    case 0x34uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3CuLL:
    case 0x3DuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
    case 0x41uLL:
    case 0x42uLL:
    case 0x43uLL:
      goto LABEL_10;
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xDuLL:
    case 0xFuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x31uLL:
    case 0x33uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x44uLL:
      return v3;
    case 0x19uLL:
    case 0x1AuLL:
    case 0x20uLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x30uLL:
    case 0x39uLL:
      goto LABEL_9;
    default:
      v5 = a3 - 94;
      if (a3 - 94 > 0x1A)
        goto LABEL_10;
      if (((1 << v5) & 0x4A0FD) == 0)
      {
        if (((1 << v5) & 0x6210000) != 0)
LABEL_9:
          v3 = 3;
        else
LABEL_10:
          v3 = 1;
      }
      break;
  }
  return v3;
}

- (BOOL)_shouldEnableSystemGestureWithType:(unint64_t)a3
{
  return 0;
}

- (BOOL)_isTouchGestureWithType:(unint64_t)a3
{
  BOOL result;

  result = 1;
  switch(a3)
  {
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x15uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x45uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x49uLL:
    case 0x4AuLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
    case 0x50uLL:
    case 0x51uLL:
    case 0x52uLL:
    case 0x53uLL:
    case 0x54uLL:
    case 0x55uLL:
    case 0x56uLL:
    case 0x57uLL:
    case 0x58uLL:
    case 0x59uLL:
    case 0x5AuLL:
    case 0x5BuLL:
    case 0x5EuLL:
    case 0x5FuLL:
    case 0x6BuLL:
    case 0x6CuLL:
    case 0x6DuLL:
    case 0x70uLL:
    case 0x71uLL:
    case 0x86uLL:
    case 0x88uLL:
      result = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)shouldEnableSystemGestureWithType:(unint64_t)a3
{
  _BOOL4 v5;
  NSSet *gestureTypesAllowedWhileDisableAssertionsExist;
  void *v7;

  v5 = -[SBSystemGestureManager _shouldEnableSystemGestureWithType:](self, "_shouldEnableSystemGestureWithType:");
  if (v5)
  {
    if (-[NSMutableSet count](self->_gesturesDisabledAssertions, "count"))
    {
      gestureTypesAllowedWhileDisableAssertionsExist = self->_gestureTypesAllowedWhileDisableAssertionsExist;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(gestureTypesAllowedWhileDisableAssertionsExist) = -[NSSet containsObject:](gestureTypesAllowedWhileDisableAssertionsExist, "containsObject:", v7);

      LOBYTE(v5) = (_BYTE)gestureTypesAllowedWhileDisableAssertionsExist;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)_enableSystemGesture:(id)a3 withType:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *typeToState;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  FBSDisplayIdentity *displayIdentity;
  void *v19;
  int v20;
  FBSDisplayIdentity *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  typeToState = self->_typeToState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](typeToState, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v10 & 1) == 0)
  {
    SBLogSystemGestureDetail();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      displayIdentity = self->_displayIdentity;
      SBSystemGestureTypeDebugName(a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = displayIdentity;
      v22 = 2114;
      v23 = v19;
      v24 = 2112;
      v25 = v6;
      _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "(Display - %@) Enabling System Gesture Type: %{public}@ - %@", (uint8_t *)&v20, 0x20u);

    }
    v12 = self->_typeToState;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v13);

    objc_msgSend(v6, "addTarget:action:", self, sel__systemGestureChanged_);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SBIndirectTouchLifecycleMonitor addObserver:](self->_indirectTouchLifecycleMonitor, "addObserver:", v6);
    objc_msgSend(v6, "allowedTouchTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
      v16 = -[SBSystemGestureManager _recognitionEventForTouchGestureType:](self, "_recognitionEventForTouchGestureType:", a4);
    else
      v16 = 2;
    -[SBSystemGestureManager systemGestureManager](self, "systemGestureManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addGestureRecognizer:recognitionEvent:toDisplayWithIdentity:", v6, v16, self->_displayIdentity);

  }
}

- (void)_disableSystemGesture:(id)a3 withType:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *typeToState;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  FBSDisplayIdentity *displayIdentity;
  void *v16;
  int v17;
  FBSDisplayIdentity *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  typeToState = self->_typeToState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](typeToState, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    SBLogSystemGestureDetail();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      displayIdentity = self->_displayIdentity;
      SBSystemGestureTypeDebugName(a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = displayIdentity;
      v19 = 2114;
      v20 = v16;
      v21 = 2112;
      v22 = v6;
      _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "(Display - %@) Disabling System Gesture Type: %{public}@ - %@", (uint8_t *)&v17, 0x20u);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SBIndirectTouchLifecycleMonitor removeObserver:](self->_indirectTouchLifecycleMonitor, "removeObserver:", v6);
    v12 = self->_typeToState;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

    objc_msgSend(v6, "removeTarget:action:", self, 0);
    -[SBSystemGestureManager systemGestureManager](self, "systemGestureManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeGestureRecognizer:fromDisplayWithIdentity:", v6, self->_displayIdentity);
    -[NSMapTable removeObjectForKey:](self->_recognizingTouchGestures, "removeObjectForKey:", v6);

  }
}

- (void)ignoreScreenEdgeTouchWithIdentifier:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[NSMutableDictionary objectForKey:](self->_typeToGesture, "objectForKey:", &unk_1E91D1508);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "_ignoreTouchForTouchIdentifier:", v3);

}

- (id)acquireSystemGestureDisableAssertionForReason:(id)a3 exceptSystemGestureTypes:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *gesturesDisabledAssertions;
  SBDisableSystemGestureAssertion *v10;
  SBDisableSystemGestureAssertion *v11;
  SBDisableSystemGestureAssertion *v12;
  _QWORD v14[5];

  v6 = a3;
  v7 = a4;
  if (!self->_gesturesDisabledAssertions)
  {
    v8 = (NSMutableSet *)objc_opt_new();
    gesturesDisabledAssertions = self->_gesturesDisabledAssertions;
    self->_gesturesDisabledAssertions = v8;

  }
  v10 = [SBDisableSystemGestureAssertion alloc];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__SBSystemGestureManager_acquireSystemGestureDisableAssertionForReason_exceptSystemGestureTypes___block_invoke;
  v14[3] = &unk_1E8E9DCD8;
  v14[4] = self;
  v11 = -[BSSimpleAssertion initWithIdentifier:forReason:queue:invalidationBlock:](v10, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("SystemGesturesDisabled"), v6, MEMORY[0x1E0C80D38], v14);
  v12 = v11;
  if (v7)
    -[SBDisableSystemGestureAssertion setExceptions:](v11, "setExceptions:", v7);
  -[NSMutableSet addObject:](self->_gesturesDisabledAssertions, "addObject:", v12);
  -[SBSystemGestureManager _evaluateEnablement](self, "_evaluateEnablement");

  return v12;
}

uint64_t __97__SBSystemGestureManager_acquireSystemGestureDisableAssertionForReason_exceptSystemGestureTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateEnablement");
}

- (id)acquireSystemGestureDisableAssertionForReason:(id)a3 forSystemGestureTypes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 139);
  for (i = 1; i != 139; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v10) & 1) == 0)
      objc_msgSend(v8, "addObject:", v10);

  }
  -[SBSystemGestureManager acquireSystemGestureDisableAssertionForReason:exceptSystemGestureTypes:](self, "acquireSystemGestureDisableAssertionForReason:exceptSystemGestureTypes:", v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_configureForNewSystemGestureWindowIfNecessary
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  BSInvalidatable *v24;
  BSInvalidatable *systemGestureEventDeferringRule;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  BSInvalidatable *v34;
  BSInvalidatable *systemGestureSymbolicRule;
  void *v36;
  void *v37;
  void *v38;
  BSInvalidatable *v39;
  BSInvalidatable *pointerEventRoutingAssertion;
  UIPointerInteraction *v41;
  UIPointerInteraction *systemPointerInteraction;
  void *v43;
  void *v44;
  BSInvalidatable *v45;
  BSInvalidatable *systemPointerContextIDAssertion;
  UIPencilInteraction *v47;
  UIPencilInteraction *systemPencilInteraction;
  void *v49;
  id v50;

  -[SBSystemGestureManager windowForSystemGestures](self, "windowForSystemGestures");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v50, "_contextId");
  v5 = v50;
  if (v50 && (_DWORD)v4 != self->_lastSystemGestureWindowContextId)
  {
    -[BSInvalidatable invalidate](self->_systemGestureEventDeferringRule, "invalidate");
    -[BSInvalidatable invalidate](self->_systemGestureSymbolicRule, "invalidate");
    -[BSInvalidatable invalidate](self->_pointerEventRoutingAssertion, "invalidate");
    -[UIPointerInteraction invalidate](self->_systemPointerInteraction, "invalidate");
    -[BSInvalidatable invalidate](self->_systemPointerContextIDAssertion, "invalidate");
    objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationForIdentity:", self->_displayIdentity);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBSDisplayIdentity rootIdentity](self->_displayIdentity, "rootIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "configurationForIdentity:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemGestureManager.m"), 877, CFSTR("We can't find a display configuration for identity: %@"), self->_displayIdentity);

        v7 = 0;
      }
    }
    v10 = (void *)objc_msgSend(MEMORY[0x1E0D00D80], "new");
    objc_msgSend(MEMORY[0x1E0D00CA8], "systemEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnvironment:", v11);

    objc_msgSend(v7, "hardwareIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0D00CF8];
    if (v12)
    {
      objc_msgSend(v7, "hardwareIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayWithHardwareIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDisplay:", v15);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDisplay:", v14);
    }

    v16 = (void *)objc_msgSend(MEMORY[0x1E0D00D90], "new");
    objc_msgSend(MEMORY[0x1E0D00CB8], "tokenForIdentifierOfCAContext:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setToken:", v17);

    objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "hardwareIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = CFSTR("Main");
    if (v20)
      v22 = (const __CFString *)v20;
    objc_msgSend(v19, "stringWithFormat:", CFSTR("systemGestures-%@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deferEventsMatchingPredicate:toTarget:withReason:", v10, v16, v23);
    v24 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    systemGestureEventDeferringRule = self->_systemGestureEventDeferringRule;
    self->_systemGestureEventDeferringRule = v24;

    v26 = (void *)objc_msgSend(v10, "mutableCopy");
    +[SBHIDEventDispatchController symbolicDeferringTokenForSystemGesturesInDisplayConfiguration:](SBHIDEventDispatchController, "symbolicDeferringTokenForSystemGesturesInDisplayConfiguration:", v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setToken:", v27);

    objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "hardwareIdentifier");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    v32 = CFSTR("Main");
    if (v30)
      v32 = (const __CFString *)v30;
    objc_msgSend(v29, "stringWithFormat:", CFSTR("systemGestureSymbol-%@"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "deferEventsMatchingPredicate:toTarget:withReason:", v26, v16, v33);
    v34 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    systemGestureSymbolicRule = self->_systemGestureSymbolicRule;
    self->_systemGestureSymbolicRule = v34;

    objc_msgSend(MEMORY[0x1E0D00D78], "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hardwareIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D00D70], "build:", &__block_literal_global_93_0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "requestGlobalMouseEventsForDisplay:targetContextID:options:", v37, v4, v38);
    v39 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    pointerEventRoutingAssertion = self->_pointerEventRoutingAssertion;
    self->_pointerEventRoutingAssertion = v39;

    self->_lastSystemGestureWindowContextId = v4;
    v41 = (UIPointerInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", self);
    systemPointerInteraction = self->_systemPointerInteraction;
    self->_systemPointerInteraction = v41;

    objc_msgSend(v50, "addInteraction:", self->_systemPointerInteraction);
    objc_msgSend((id)SBApp, "mousePointerManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hardwareIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setSystemPointerInteractionContextID:displayWithHardwareIdentifier:", v4, v44);
    v45 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    systemPointerContextIDAssertion = self->_systemPointerContextIDAssertion;
    self->_systemPointerContextIDAssertion = v45;

    v47 = (UIPencilInteraction *)objc_alloc_init(MEMORY[0x1E0CEA818]);
    systemPencilInteraction = self->_systemPencilInteraction;
    self->_systemPencilInteraction = v47;

    -[UIPencilInteraction setDelegate:](self->_systemPencilInteraction, "setDelegate:", self);
    objc_msgSend(v50, "addInteraction:", self->_systemPencilInteraction);

    v5 = v50;
  }

}

void __72__SBSystemGestureManager__configureForNewSystemGestureWindowIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPinOnButtonDown:", SBFIsChamoisExternalDisplayControllerAvailable());

}

+ (id)deviceHardwareButtonGestureTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SBSystemGestureManager_deviceHardwareButtonGestureTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceHardwareButtonGestureTypes_onceToken != -1)
    dispatch_once(&deviceHardwareButtonGestureTypes_onceToken, block);
  return (id)deviceHardwareButtonGestureTypes_deviceHardwareButtonGestureTypes;
}

void __58__SBSystemGestureManager_deviceHardwareButtonGestureTypes__block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 1; i != 139; ++i)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_isDeviceHardwareButtonGestureType:", i))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v3);

    }
  }
  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)deviceHardwareButtonGestureTypes_deviceHardwareButtonGestureTypes;
  deviceHardwareButtonGestureTypes_deviceHardwareButtonGestureTypes = v4;

}

+ (BOOL)_isDeviceHardwareButtonGestureType:(unint64_t)a3
{
  BOOL result;

  if (a3 - 69 < 0x11)
    return 1;
  result = 0;
  if (a3 - 88 <= 0x30 && ((1 << (a3 - 88)) & 0x1000000000007) != 0)
    return 1;
  return result;
}

- (id)acquireSystemEdgeGesturesIgnoreHIDEdgeFlagsForReason:(id)a3
{
  id v4;
  BSCompoundAssertion *ignoreHIDEdgeFlagsAssertion;
  void *v6;
  void *v7;
  BSCompoundAssertion *v8;
  BSCompoundAssertion *v9;
  BSCompoundAssertion *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  ignoreHIDEdgeFlagsAssertion = self->_ignoreHIDEdgeFlagsAssertion;
  if (!ignoreHIDEdgeFlagsAssertion)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0D01718];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ignoreHIDEdgeFlags(%@)"), self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__SBSystemGestureManager_acquireSystemEdgeGesturesIgnoreHIDEdgeFlagsForReason___block_invoke;
    v14[3] = &unk_1E8EA3688;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v6, "assertionWithIdentifier:stateDidChangeHandler:", v7, v14);
    v8 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v9 = self->_ignoreHIDEdgeFlagsAssertion;
    self->_ignoreHIDEdgeFlagsAssertion = v8;

    v10 = self->_ignoreHIDEdgeFlagsAssertion;
    SBLogSystemGesture();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v10, "setLog:", v11);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    ignoreHIDEdgeFlagsAssertion = self->_ignoreHIDEdgeFlagsAssertion;
  }
  -[BSCompoundAssertion acquireForReason:](ignoreHIDEdgeFlagsAssertion, "acquireForReason:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __79__SBSystemGestureManager_acquireSystemEdgeGesturesIgnoreHIDEdgeFlagsForReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateIgnoreHIDEdgeFlagsAssertions");

}

- (void)_updateIgnoreHIDEdgeFlagsAssertions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSMapTable *ignoreHIDEdgeFlagsAssertions;
  NSMapTable *v16;
  NSMapTable *v17;
  NSMapTable *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
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
  if (-[BSCompoundAssertion isActive](self->_ignoreHIDEdgeFlagsAssertion, "isActive"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[NSMutableDictionary allValues](self->_typeToGesture, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v29 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v9 = objc_opt_class();
          v10 = v8;
          if (v9)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v11 = v10;
            else
              v11 = 0;
          }
          else
          {
            v11 = 0;
          }
          v12 = v11;

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[NSMapTable objectForKey:](self->_ignoreHIDEdgeFlagsAssertions, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
            {
              objc_msgSend(v12, "_beginRequiringIgnoresHIDEdgeFlagsForReason:", CFSTR("SBSystemGestureManager"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              ignoreHIDEdgeFlagsAssertions = self->_ignoreHIDEdgeFlagsAssertions;
              if (!ignoreHIDEdgeFlagsAssertions)
              {
                objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
                v16 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
                v17 = self->_ignoreHIDEdgeFlagsAssertions;
                self->_ignoreHIDEdgeFlagsAssertions = v16;

                ignoreHIDEdgeFlagsAssertions = self->_ignoreHIDEdgeFlagsAssertions;
              }
              -[NSMapTable setObject:forKey:](ignoreHIDEdgeFlagsAssertions, "setObject:forKey:", v14, v12);

            }
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v5);
    }
  }
  else
  {
    v3 = (void *)-[NSMapTable copy](self->_ignoreHIDEdgeFlagsAssertions, "copy");
    v18 = self->_ignoreHIDEdgeFlagsAssertions;
    self->_ignoreHIDEdgeFlagsAssertions = 0;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v3, "objectEnumerator", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "_invalidate");
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v21);
    }

  }
}

- (void)_invalidateIgnoreHidEdgeFlagsAssertionForRemovedRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_opt_class();
  v9 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v9;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[NSMapTable objectForKey:](self->_ignoreHIDEdgeFlagsAssertions, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSMapTable removeObjectForKey:](self->_ignoreHIDEdgeFlagsAssertions, "removeObjectForKey:", v7);
      objc_msgSend(v8, "_invalidate");
    }

  }
}

- (BOOL)areSystemGesturesDisabledForAccessibility
{
  return self->_systemGesturesDisabledForAccessibility;
}

- (void)setSystemGesturesDisabledForAccessibility:(BOOL)a3
{
  self->_systemGesturesDisabledForAccessibility = a3;
}

- (NSSet)gesturesPreventedByStylus
{
  return self->_gesturesPreventedByStylus;
}

- (SBIndirectTouchLifecycleMonitor)indirectTouchLifecycleMonitor
{
  return self->_indirectTouchLifecycleMonitor;
}

- (void)setIndirectTouchLifecycleMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_indirectTouchLifecycleMonitor, a3);
}

- (_UISystemGestureManager)systemGestureManager
{
  return (_UISystemGestureManager *)objc_loadWeakRetained((id *)&self->_systemGestureManager);
}

- (void)setSystemGestureManager:(id)a3
{
  objc_storeWeak((id *)&self->_systemGestureManager, a3);
}

- (SBSystemUIPointerInteractionDelegate)systemPointerInteractionDelegate
{
  return (SBSystemUIPointerInteractionDelegate *)objc_loadWeakRetained((id *)&self->_systemPointerInteractionDelegate);
}

- (void)setSystemPointerInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_systemPointerInteractionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemPointerInteractionDelegate);
  objc_destroyWeak((id *)&self->_systemGestureManager);
  objc_storeStrong((id *)&self->_indirectTouchLifecycleMonitor, 0);
  objc_storeStrong((id *)&self->_systemPencilInteraction, 0);
  objc_storeStrong((id *)&self->_ignoreHIDEdgeFlagsAssertion, 0);
  objc_storeStrong((id *)&self->_ignoreHIDEdgeFlagsAssertions, 0);
  objc_storeStrong((id *)&self->_systemPointerContextIDAssertion, 0);
  objc_storeStrong((id *)&self->_systemPointerInteraction, 0);
  objc_storeStrong((id *)&self->_systemGesturesAllowedToken, 0);
  objc_storeStrong((id *)&self->_pointerEventRoutingAssertion, 0);
  objc_storeStrong((id *)&self->_systemGestureEventDeferringRule, 0);
  objc_storeStrong((id *)&self->_systemGestureSymbolicRule, 0);
  objc_storeStrong((id *)&self->_stylusPriorityRecognizer, 0);
  objc_storeStrong((id *)&self->_gesturesPreventedByStylus, 0);
  objc_storeStrong((id *)&self->_gestureTypesAllowedWhileDisableAssertionsExist, 0);
  objc_storeStrong((id *)&self->_gesturesDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_touchGestures, 0);
  objc_storeStrong((id *)&self->_recognizingTouchGestures, 0);
  objc_storeStrong((id *)&self->_typeToState, 0);
  objc_storeStrong((id *)&self->_gestureToType, 0);
  objc_storeStrong((id *)&self->_typeToGesture, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

- (void)removeGestureRecognizer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "we don't currently think this is a system gesture: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_systemGestureChanged:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_15(&dword_1D0540000, v0, v1, "%s: (Display - %@) - %@", v2);
}

@end
